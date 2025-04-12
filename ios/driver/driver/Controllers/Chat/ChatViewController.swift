//
//  ChatViewController.swift
//  rider
//
//  Created by Manly Man on 7/21/19.
//  Copyright © 2021 minimal. All rights reserved.
//

import UIKit
import MessageKit
import Kingfisher
import InputBarAccessoryView
import Apollo

class ChatViewController: MessagesViewController {
    private var messages: [MessageFragment] = []
    private var sender: GetMessagesQuery.Data.Driver!
    private var orderId: String!
    private var subscriptionNewMessage: Cancellable?
    private var observer: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Chat", comment: "Title of chat screen")
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        self.messageInputBar.delegate = self
        if #available(iOS 13.0, *) {
            self.messagesCollectionView.backgroundColor = .systemBackground
        }
        if #available(iOS 13.0, *) {
            messageInputBar.inputTextView.textColor = .label
            messageInputBar.inputTextView.placeholderLabel.textColor = .secondaryLabel
            messageInputBar.backgroundView.backgroundColor = .systemBackground
        } else {
            messageInputBar.inputTextView.textColor = .black
            messageInputBar.inputTextView.backgroundColor = .white
        }
        observer = NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main) { [unowned self] notification in
            self.refreshMessages()
        }
        subscriptionNewMessage = Network.shared.apollo.subscribe(subscription: NewMessageReceivedSubscription()) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let graphQLResult):
                if let message = graphQLResult.data?.newMessageReceived.fragments.messageFragment {
                    self.messages.append(message)
                    self.messagesCollectionView.reloadData()
                    self.messagesCollectionView.scrollToLastItem()
                }
                
            case .failure(_):
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    deinit {
        subscriptionNewMessage?.cancel()
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        refreshMessages()
    }
    
    func refreshMessages() {
        Network.shared.apollo.fetch(query: GetMessagesQuery()) { result in
            switch result {
            case .success(let response):
                guard let user = response.data?.driver, let order = user.orders.nodes.first else {
                    self.dismiss(animated: true, completion: nil)
                    return
                }
                self.orderId = order.id
                self.sender = user
                self.messages = order.conversations.map { message in message.fragments.messageFragment }
                self.messagesCollectionView.reloadData()
                
                break;
                
            case .failure(let error):
                error.showAlert()
            }
        }
    }
    
    func insertMessage(_ message: MessageFragment) {
        messages.append(message)
        self.messagesCollectionView.reloadData()
        self.messagesCollectionView.scrollToLastItem()
    }
    
    func isNextMessageSameSender(at indexPath: IndexPath) -> Bool {
        guard indexPath.section + 1 < messages.count else { return false }
        return messages[indexPath.section].sentByDriver == messages[indexPath.section + 1].sentByDriver
    }
}

extension ChatViewController: MessagesDataSource {
    
    func currentSender() -> SenderType {
        return sender
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        let msg = message as! MessageFragment
        if msg.sentByDriver {
            if let media = sender.media {
                let url = URL(string: Config.Backend + (media.address.replacingOccurrences(of: " ", with: "%20")))
                avatarView.kf.setImage(with: url, placeholder: UIImage(named: "Nobody"))
            } else {
                avatarView.image = UIImage(named: "Nobody")
            }
        } else {
            if let media = msg.request.rider.media {
                let url = URL(string: Config.Backend + media.address.replacingOccurrences(of: " ", with: "%20"))
                avatarView.kf.setImage(with: url, placeholder: UIImage(named: "Nobody"))
            } else {
                avatarView.image = UIImage(named: "Nobody")
            }
        }
        avatarView.isHidden = isNextMessageSameSender(at: indexPath)
        
    }
    
    
}

extension ChatViewController: InputBarAccessoryViewDelegate {
    
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        
        // Here we can parse for which substrings were autocompleted
        let attributedText = messageInputBar.inputTextView.attributedText!
        let range = NSRange(location: 0, length: attributedText.length)
        attributedText.enumerateAttribute(.autocompleted, in: range, options: []) { (_, range, _) in
            let substring = attributedText.attributedSubstring(from: range)
            let context = substring.attribute(.autocompletedContext, at: 0, effectiveRange: nil)
            print("Autocompleted: `", substring, "` with context: ", context ?? [])
        }
        messageInputBar.inputTextView.text = String()
        messageInputBar.invalidatePlugins()
        
        // Send button activity animation
        messageInputBar.sendButton.startAnimating()
        messageInputBar.inputTextView.placeholder = "Sending..."
        Network.shared.apollo.perform(mutation: SendMessageMutation(orderId: self.orderId, content: text)) { result in
            switch result {
            case .success(let response):
                self.messageInputBar.sendButton.stopAnimating()
                self.messageInputBar.inputTextView.placeholder = "Aa"
                self.insertMessage(response.data!.createOneOrderMessage.fragments.messageFragment)
                self.messagesCollectionView.scrollToLastItem()
                
            case .failure(let error):
                self.messageInputBar.sendButton.stopAnimating()
                error.showAlert()
            }
        }
    }
    
    private func insertMessages(_ messages: [MessageFragment]) {
        for message in messages {
            insertMessage(message)
        }
    }
    
    
}


extension ChatViewController: MessagesDisplayDelegate, MessagesLayoutDelegate {}

extension MessageFragment.Request.Rider: SenderType {
    public var senderId: String {
        return id
    }
    
    public var displayName: String {
        return "\(firstName ?? "") \(lastName ?? "")"
    }
}

extension MessageFragment: MessageType {
    public var sender: SenderType { get {
        if sentByDriver {
            return self.sender
        } else {
            return request.rider
        }
    } }
    
    public var messageId: String { get {
        return id
    } }
    
    /// The date the message was sent.
    public var sentDate: Date { get {
        return Date.init()
    } }
    
    /// The kind of message and its underlying kind.
    public var kind: MessageKind { get {
        return .text(content)
    } }
}

extension GetMessagesQuery.Data.Driver: SenderType {
    public var senderId: String {
        return id
    }
    
    public var displayName: String {
        return "\(firstName ?? "") \(lastName ?? "")"
    }
}
