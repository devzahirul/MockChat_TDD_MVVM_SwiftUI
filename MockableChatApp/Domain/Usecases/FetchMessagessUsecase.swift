//
//  FetchMessagessUsecase.swift
//  MockableChatApp
//
//  Created by Islam Md. Zahirul on 5/2/22.
//

import Foundation


protocol FetchMessagesUsecaseOutput: AnyObject {
    func didFetch(lastMessages: Message, for contact: Contact)
    func didFetch(oldMessages: [Message], for contact: Contact)
    func didFailed(error: Error)
}

class FetchMessagesUsecase {
    var lastMessageService: LastMessageStoreService!
    var messagingService: MessagingService!
    weak var delegate: FetchMessagesUsecaseOutput?
    
    init(lastMessageService: LastMessageStoreService, messagingService: MessagingService = MockMessagingService()) {
        self.lastMessageService = lastMessageService
        self.messagingService = messagingService
    }
    
    func fetchLastMessage(for contact: Contact) {
        lastMessageService.fetchLastMessage(for: contact) {[weak self] messages in
            guard let self = self else {return}
            self.delegate?.didFetch(lastMessages: messages.first ?? .loading, for: contact)
        }
    }
    
    func fetchOldMessage(for contact: Contact) {
        messagingService.fetchMessages(for: contact) { messages in
            self.delegate?.didFetch(oldMessages: messages, for: contact)
        }
    }
    
    func addLastMessage(message: Message, for contact: Contact) {
        self.messagingService.sendNew(message: message, for: contact, completion: { status in
            self.lastMessageService.addLast(message: message, for: contact) {[weak self] in
                //TODO completion
                self?.delegate?.didFetch(lastMessages: message, for: contact)
                self?.delegate?.didFetch(oldMessages: [message], for: contact)
            }
        })
       
    }
}
