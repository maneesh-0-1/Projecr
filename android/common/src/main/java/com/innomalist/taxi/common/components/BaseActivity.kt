package com.innomalist.taxi.common.components

import android.content.Context
import android.os.Bundle
import android.util.TypedValue
import androidx.annotation.StringRes
import androidx.appcompat.app.ActionBar
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.Toolbar
import com.innomalist.taxi.common.R
import com.innomalist.taxi.common.utils.LocaleHelper
import com.innomalist.taxi.common.utils.MyPreferenceManager


open class BaseActivity : AppCompatActivity() {
    var toolbar: ActionBar? = null
    private var screenDensity = 0f

    val preferences: MyPreferenceManager
        get() {
            return MyPreferenceManager.getInstance(applicationContext)
        }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        screenDensity = applicationContext.resources.displayMetrics.density
        setActivityTheme(this@BaseActivity)
    }

    override fun attachBaseContext(base: Context) {
        super.attachBaseContext(LocaleHelper.onAttach(base))
    }

    fun initializeToolbar(title: String?) {
        val toolbarView = findViewById<Toolbar>(R.id.toolbar)
        setSupportActionBar(toolbarView)
        toolbar = supportActionBar
        if (toolbar != null) {
            toolbar!!.setDisplayHomeAsUpEnabled(true)
            toolbar!!.title = title
            toolbarView.setNavigationOnClickListener { onBackPressed() }
        }
    }

    fun initializeToolbar(@StringRes title: Int) {
        initializeToolbar(getString(title))
    }

    val primaryColor: Int
        get() {
            val typedValue = TypedValue()
            val a = this.obtainStyledAttributes(typedValue.data, intArrayOf(R.attr.colorPrimary))
            val color = a.getColor(0, 0)
            a.recycle()
            return color
        }

    /*override fun onWindowFocusChanged(hasFocus: Boolean) {
        super.onWindowFocusChanged(hasFocus)
        if (hasFocus and isFullscreen) {
            window.decorView.systemUiVisibility = (View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                    or View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                    or View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                    or View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                    or View.SYSTEM_UI_FLAG_FULLSCREEN
                    or View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY)
        }
    }*/

    val currentTheme: Int
        get() = R.style.Theme_Default

    private fun setActivityTheme(activity: AppCompatActivity) {
        activity.setTheme(currentTheme)
    }
}