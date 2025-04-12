//
//  Network.swift
//  rider
//
//  Created by Manly Man on 19.11.21.
//  Copyright © 2021 minimal. All rights reserved.
//

import Foundation
import Apollo
import ApolloWebSocket

class Network {
    static let shared = Network()
    
    private(set) lazy var apollo: ApolloClient = {
        // The cache is necessary to set up the store, which we're going to hand to the provider
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let baseUrl = "\(Config.Backend)graphql"
        let client = URLSessionClient()
        let provider = NetworkInterceptorProvider(store: store, client: client)
        lazy var webSocketTransport: WebSocketTransport = {
            let url = URL(string: baseUrl.replacingOccurrences(of: "http", with: "ws"))!
            let request = URLRequest(url: url)
            let webSocketClient = WebSocket(request: request)
            let authPayload = ["authToken": UserDefaultsConfig.jwtToken]
            return WebSocketTransport(websocket: webSocketClient, connectingPayload: authPayload)
        }()
        
        /// An HTTP transport to use for queries and mutations.
        lazy var normalTransport: RequestChainNetworkTransport = {
            let url = URL(string: baseUrl)!
            return RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
        }()
        
        lazy var splitNetworkTransport = SplitNetworkTransport(
            uploadingNetworkTransport: normalTransport,
            webSocketNetworkTransport: webSocketTransport
          )
        
        
        
        // Remember to give the store you already created to the client so it
        // doesn't create one on its own
        return ApolloClient(networkTransport: splitNetworkTransport,
                            store: store)
    }()
}

struct NetworkInterceptorProvider: InterceptorProvider {
    
    // These properties will remain the same throughout the life of the `InterceptorProvider`, even though they
    // will be handed to different interceptors.
    private let store: ApolloStore
    private let client: URLSessionClient
    
    init(store: ApolloStore,
         client: URLSessionClient) {
        self.store = store
        self.client = client
    }
    
    func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        return [
            MaxRetryInterceptor(),
           // CacheReadInterceptor(store: self.store),
            UserManagementInterceptor(),
            RequestLoggingInterceptor(),
            NetworkFetchInterceptor(client: self.client),
            ResponseLoggingInterceptor(),
            ResponseCodeInterceptor(),
            JSONResponseParsingInterceptor(cacheKeyForObject: self.store.cacheKeyForObject),
            AutomaticPersistedQueryInterceptor(),
           // CacheWriteInterceptor(store: self.store)
        ]
    }
}

class RequestLoggingInterceptor: ApolloInterceptor {
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            
            print("Outgoing request: \(request)")
            chain.proceedAsync(request: request,
                               response: response,
                               completion: completion)
        }
}

class UserManagementInterceptor: ApolloInterceptor {
    
    enum UserError: Error {
        case noUserLoggedIn
    }
    
    /// Helper function to add the token then move on to the next step
    private func addTokenAndProceed<Operation: GraphQLOperation>(
        _ token: String,
        to request: HTTPRequest<Operation>,
        chain: RequestChain,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            
            request.addHeader(name: "Authorization", value: "Bearer \(token)")
            chain.proceedAsync(request: request,
                               response: response,
                               completion: completion)
        }
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            
            guard let token = UserDefaultsConfig.jwtToken else {
                chain.proceedAsync(request: request,
                                   response: response,
                                   completion: completion)
                return
            }
            self.addTokenAndProceed(token,
                                    to: request,
                                    chain: chain,
                                    response: response,
                                    completion: completion)
        }
}


class ResponseLoggingInterceptor: ApolloInterceptor {
    
    enum ResponseLoggingError: Error {
        case notYetReceived
    }
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            
            defer {
                // Even if we can't log, we still want to keep going.
                chain.proceedAsync(request: request,
                                   response: response,
                                   completion: completion)
            }
            
            guard let receivedResponse = response else {
                chain.handleErrorAsync(ResponseLoggingError.notYetReceived,
                                       request: request,
                                       response: response,
                                       completion: completion)
                return
            }
            
            print("HTTP Response: \(receivedResponse.httpResponse)")
            
            if let stringData = String(bytes: receivedResponse.rawData, encoding: .utf8) {
                print("Data: \(stringData)")
            } else {
                print("Could not convert data to string!")
            }
        }
}

public typealias Timestamp = Double

public typealias ConnectionCursor = String
//
//extension ConnectionCursor: JSONDecodable {
//
//    public init(jsonValue value: JSONValue) throws {
//        // Since you know the underlying scalar type of `CustomDate` is a String, you can pull the original string out.
//        guard let string = value as? String else {
//            throw JSONDecodingError.couldNotConvert(value: value, to: String.self)
//        }
//
//        // Now that we've got a `Foundation.Date`, we can assign it here as `self` since `CustomDate` is typealiased to `Foundation.Date`.
//        self = string
//    }
//}
