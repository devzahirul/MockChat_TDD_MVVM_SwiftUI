//
//  ChatContactItemViewModel.swift
//  MockableChatApp
//
//  Created by Islam Md. Zahirul on 1/2/22.
//

import Foundation
import Combine

class ChatContactItemViewModel: ObservableObject {
    var chatMessage: ChatMessage
    var fetchMessageUsecse: FetchMessagesUsecase
    
    @Published var contact: Contact!
    @Published var lastMessage: Message?
    @Published var oldMessages: [Message] = []
    
    init(_ chatMessage: ChatMessage, fetchMessageUsecase: FetchMessagesUsecase) {
        self.chatMessage = chatMessage
        self.contact = chatMessage.contact
        self.lastMessage = chatMessage.messages?.first
        self.fetchMessageUsecse = fetchMessageUsecase
        
        if self.lastMessage == nil {
            self.lastMessage = .loading
            oldMessages.append(.loading)
        }
        
        fetchMessageUsecse.delegate = self
        fetchMessages()
    }
    
    func fetchMessages() {
        fetchMessageUsecse.fetchLastMessage(for: chatMessage.contact)
      
    }
    
    
    func send(message: Message) {
        
        fetchMessageUsecse.addLastMessage(message: message, for: chatMessage.contact)
    }
    
    var id: String {
        return UUID().uuidString
    }
    
}

extension ChatContactItemViewModel: FetchMessagesUsecaseOutput {
    func didFailed(error: Error) {
    }
    
    func didFetch(lastMessages: Message, for contact: Contact) {
        if let lastMessage = lastMessage {
            switch lastMessage {
            case .loading: do {
                oldMessages = []
                fetchMessageUsecse.fetchOldMessage(for: contact)}
            default: do{}
            }
        }
        lastMessage = lastMessages
    }
    func didFetch(oldMessages: [Message], for contact: Contact) {
        self.oldMessages.append(contentsOf: oldMessages)
    }
}


class ChatContactViewModel: ObservableObject {
    @Published var chatContactList: [ChatContactItemViewModel] = []
    private var contacts: [Contact]?
    private var fetchContactListUsecase: FetchChatContactListUsecase!
    
    init(fetchContactListUsecase: FetchChatContactListUsecase) {
        self.fetchContactListUsecase = fetchContactListUsecase
        fetchContactListUsecase.delegate = self
    }
    
    func fetchContactList() {
        fetchContactListUsecase.fetchChatContactList()
    }
    
    func onAppear() {
        if chatContactList.count == 0 {
            fetchContactList()
        }
    }
}

extension ChatContactViewModel: FetchChatContactListUsecaseOutput {
    func didFailed(error: Error) {
        
    }
    
    func didFetch(contractList: [ChatMessage]) {
        chatContactList = contractList.map({ chatMessage in
            return ChatContactItemViewModel(chatMessage, fetchMessageUsecase: FetchMessagesUsecase(lastMessageService: MockLastMessageStoreService()))
        })
    }
   
}
