package com.innomalist.taxi.common.utils

import android.content.Context
import android.content.SharedPreferences
import androidx.preference.PreferenceManager

class MyPreferenceManager(mContext: Context?) {
    private val sharedPreferences: SharedPreferences = PreferenceManager.getDefaultSharedPreferences(mContext)
    var token: String?
        get() {
            return getString("tokenv4", null)
        }
        set(value) {
            putString("tokenv4", value)
        }

    private val editor: SharedPreferences.Editor
        get() = sharedPreferences.edit()

    private fun putString(key: String, value: String?): Boolean {
        return editor.putString(key, value).commit()
    }

    private fun getString(key: String, defValue: String?): String? {
        return sharedPreferences.getString(key, defValue)
    }

    fun remove(key: String?) {
        editor.remove(key).commit()
    }

    fun clearPreferences() {
        editor.clear().commit()
    }

    companion object {
        private var instance: MyPreferenceManager? = null
        @JvmStatic
        fun getInstance(context: Context): MyPreferenceManager {
            return if (instance == null) {
                MyPreferenceManager(context)
            } else {
                instance!!
            }
        }
    }

}