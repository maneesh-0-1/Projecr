package com.innomalist.taxi.driver.activities.chat

import android.os.Bundle
import android.widget.ImageView
import androidx.activity.viewModels
import com.bumptech.glide.Glide
import com.innomalist.taxi.common.R
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.common.components.BaseActivity
import com.innomalist.taxi.driver.Config
import com.minimal.taxi.driver.fragment.*
import com.stfalcon.chatkit.commons.ImageLoader
import com.stfalcon.chatkit.commons.models.IMessage
import com.stfalcon.chatkit.commons.models.IUser
import com.stfalcon.chatkit.messages.MessageInput
import com.stfalcon.chatkit.messages.MessagesList
import com.stfalcon.chatkit.messages.MessagesListAdapter
import dagger.hilt.android.AndroidEntryPoint
import java.util.*

@AndroidEntryPoint
class ChatActivity : BaseActivity() {
    private lateinit var messagesList: MessagesList
    private lateinit var messageInput: MessageInput
    private val viewModel: ChatActivityViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_chat)
        initializeToolbar(getString(R.string.chat_activity_title))
        listenLiveData()
        messagesList = findViewById(R.id.messages_list)
        messageInput = findViewById(R.id.message_input)
        messageInput.setInputListener { input: CharSequence ->
            this.viewModel.sendMessage(input.toString())
            true
        }
    }

    override fun onResume() {
        super.onResume()
        this.viewModel.syncMessages()
        this.viewModel.watchForMessages()
    }

    private fun listenLiveData() {
        this.viewModel.messages.observe(this) {
            when(it) {
                is ViewState.Error -> finish()
                is ViewState.Loading -> {}
                is ViewState.Success -> {
                    val imageLoader = ImageLoader { imageView: ImageView?, url: String?, _: Any? -> Glide.with(this@ChatActivity).load(url).into(imageView!!) }
                    val adapter = MessagesListAdapter<IMessage>("driver", imageLoader)
                    val order = this.viewModel.profile.value ?: return@observe
                    adapter.addToEnd(it.value?.map { message -> message.asIMessage(order.driver.driverUser, order.rider.riderUser) }, true)
                    messagesList.setAdapter(adapter)
                }
            }
        }
    }
}

fun Message.asIMessage(driver: DriverUser, rider: RiderUser) = object: IMessage {
    override fun getId(): String {
        return sentAt.time.toString()
    }

    override fun getText(): String {
        return content
    }

    override fun getUser(): IUser {
        return if(sentByDriver) driver.asIUser() else rider.asIUser()
    }

    override fun getCreatedAt(): Date {
        return sentAt
    }
}

fun RiderUser.asIUser() = object: IUser {
    override fun getId(): String {
        return "rider"
    }

    override fun getName(): String {
        return "$firstName $lastName"
    }

    override fun getAvatar(): String {
        if(media?.address == null) return ""
        return Config.Backend + media.address
    }
}

fun DriverUser.asIUser() = object: IUser {
    override fun getId(): String {
        return "driver"
    }

    override fun getName(): String {
        return "$firstName $lastName"
    }

    override fun getAvatar(): String {
        if(media?.address == null) return ""
        return Config.Backend + media.address
    }

}