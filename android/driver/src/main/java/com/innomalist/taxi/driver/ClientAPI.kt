package com.innomalist.taxi.driver

import android.content.Context
import android.os.Looper
import com.apollographql.apollo3.ApolloClient
import com.apollographql.apollo3.api.*
import com.apollographql.apollo3.api.json.JsonReader
import com.apollographql.apollo3.api.json.JsonWriter
import com.apollographql.apollo3.cache.normalized.*
import com.apollographql.apollo3.cache.normalized.sql.SqlNormalizedCacheFactory
import com.apollographql.apollo3.network.http.DefaultHttpEngine
import com.apollographql.apollo3.network.http.HttpNetworkTransport
import com.apollographql.apollo3.network.ws.AppSyncWsProtocol
import com.apollographql.apollo3.network.ws.GraphQLWsProtocol
import com.apollographql.apollo3.network.ws.SubscriptionWsProtocol
import com.apollographql.apollo3.network.ws.WebSocketNetworkTransport
import com.google.android.gms.maps.model.LatLng
import com.innomalist.taxi.driver.Config.Companion.Backend
import com.innomalist.taxi.common.utils.MyPreferenceManager
import com.minimal.taxi.driver.type.Point
import com.minimal.taxi.driver.type.Timestamp
import okhttp3.Interceptor
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.Response
import java.io.IOException
import java.util.*
import javax.inject.Inject
import kotlin.Throws

class ClientAPI @Inject constructor(
    private val applicationContext: Context
) {
    fun getApolloClient(): ApolloClient {
        check(Looper.myLooper() == Looper.getMainLooper()) {
            "Only the main thread can get the apolloClient instance"
        }
        val sqlCacheFactory = SqlNormalizedCacheFactory(this.applicationContext, "db_name")
        val memoryFirstThenSqlCacheFactory =
            MemoryCacheFactory(maxSizeBytes = 10 * 1024 * 1024).chain(sqlCacheFactory)

        val objectIdGenerator = object : ObjectIdGenerator {
            override fun cacheKeyForObject(
                obj: Map<String, Any?>,
                context: ObjectIdGeneratorContext
            ): CacheKey? {
                return obj["id"]?.toString()?.let { CacheKey(it) }
                    ?: TypePolicyObjectIdGenerator.cacheKeyForObject(obj, context)
            }
        }

        val cacheKeyResolver = object : CacheKeyResolver() {
            override fun cacheKeyForField(
                field: CompiledField,
                variables: Executable.Variables
            ): CacheKey? {
                return CacheKey((field.resolveArgument("id", variables).toString()))
            }
        }


        val okHttpClientBuilder = OkHttpClient.Builder()
        val token = MyPreferenceManager.getInstance(applicationContext).token
        if (token != null) {
            val auth = JwtAuthenticationInterceptor()
            auth.setJwtToken(token)
            okHttpClientBuilder.addInterceptor(auth)
        }
        val pointAdapter = object : Adapter<LatLng> {
            override fun fromJson(
                reader: JsonReader,
                customScalarAdapters: CustomScalarAdapters
            ): LatLng {
                val map = AnyAdapter.fromJson(reader) as Map<*, *>
                return LatLng(map["latitude"] as Double, map["longitude"] as Double)
            }

            override fun toJson(
                writer: JsonWriter,
                customScalarAdapters: CustomScalarAdapters,
                value: LatLng
            ) {
                val map = mapOf(
                    "latitude" to value.latitude,
                    "longitude" to value.longitude
                )
                AnyAdapter.toJson(writer, map)
            }
        }
        val timestampAdapter = object : Adapter<Date> {
            override fun fromJson(
                reader: JsonReader,
                customScalarAdapters: CustomScalarAdapters
            ): Date {
                val map = reader.nextLong()
                return Date(map)
            }

            override fun toJson(
                writer: JsonWriter,
                customScalarAdapters: CustomScalarAdapters,
                value: Date
            ) {
                writer.value(value.toString())
            }
        }
        return ApolloClient.Builder()
            .networkTransport(
                HttpNetworkTransport(
                    serverUrl = "${Backend}graphql",
                    engine = DefaultHttpEngine(okHttpClientBuilder.build())
                )
            ).subscriptionNetworkTransport(
                WebSocketNetworkTransport(
                    serverUrl = "${Backend}graphql",
                    protocolFactory = SubscriptionWsProtocol.Factory { mapOf("authToken" to token) }
                )
            )
            .addCustomScalarAdapter(Timestamp.type, timestampAdapter)
            //.normalizedCache(memoryFirstThenSqlCacheFactory, objectIdGenerator = objectIdGenerator, cacheResolver = cacheKeyResolver)
            .build()
    }

    class JwtAuthenticationInterceptor : Interceptor {
        private var jwtToken: String? = null
        fun setJwtToken(jwtToken: String?) {
            this.jwtToken = jwtToken
        }

        @Throws(IOException::class)
        override fun intercept(chain: Interceptor.Chain): Response {
            val original: Request = chain.request()
            val builder: Request.Builder = original.newBuilder()
                .header("Authorization", "Bearer $jwtToken")
            val request: Request = builder.build()
            return chain.proceed(request)
        }
    }
}