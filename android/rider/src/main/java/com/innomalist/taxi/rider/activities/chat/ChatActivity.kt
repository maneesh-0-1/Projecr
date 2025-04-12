package com.innomalist.taxi.rider.activities.chat

import android.os.Bundle
import android.widget.ImageView
import androidx.activity.viewModels
import com.bumptech.glide.Glide
import com.innomalist.taxi.common.R
import com.innomalist.taxi.common.ViewState
import com.innomalist.taxi.common.components.BaseActivity
import com.innomalist.taxi.common.utils.AlerterHelper
import com.innomalist.taxi.rider.Config
import com.minimal.taxi.rider.fragment.BasicProfile
import com.minimal.taxi.rider.fragment.ChatUser
import com.minimal.taxi.rider.fragment.Message
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
    var application: String? = null
    private lateinit var adapter: MessagesListAdapter<IMessage>

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
                is ViewState.Error -> AlerterHelper.showError(this, it.message)
                is ViewState.Loading -> {}
                is ViewState.Success -> {
                    val imageLoader = ImageLoader { imageView: ImageView?, url: String?, _: Any? -> Glide.with(this@ChatActivity).load(url).into(imageView!!) }
                    adapter = MessagesListAdapter("rider", imageLoader)
                    adapter.addToEnd(it.value?.map { message -> message.asIMessage(this.viewModel.profile.value!!) }, true)
                    messagesList.setAdapter(adapter)
                }
            }
        }
    }
}

fun Message.asIMessage(rider: BasicProfile) = object: IMessage {
    override fun getId(): String {
        return sentAt.time.toString()
    }

    override fun getText(): String {
        return content
    }

    override fun getUser(): IUser {
        return if(!sentByDriver) rider.asIUser() else request.driver!!.chatUser.asIUser()
    }

    override fun getCreatedAt(): Date {
        return sentAt
    }
}

fun ChatUser.asIUser() = object: IUser {
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

fun BasicProfile.asIUser() = object: IUser {
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