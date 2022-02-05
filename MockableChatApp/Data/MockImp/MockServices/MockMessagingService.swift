//
//  MockMessagingService.swift
//  MockableChatApp
//
//  Created by Islam Md. Zahirul on 1/2/22.
//

import Foundation




class MockMessagingService: MessagingService {
    var messageSaveStore: MessageSaveStore
    var messageFetchStore: MessageFetchStore
    
    var contactFetchStore: ContactFetchStore
    
    init(messageSaveStore: MessageSaveStore = MockMessageStore(), messageFetchStore: MessageFetchStore = MockMessageStore(), contactFetchStore: ContactFetchStore = MockContactStore()) {
        self.contactFetchStore = contactFetchStore
        self.messageSaveStore = messageSaveStore
        self.messageFetchStore = messageFetchStore
    }
    
    func fetchContactList(completion: @escaping ([Contact]) -> Void) {
        contactFetchStore.fetchContacts(completion: completion)
    }
    
    
    func fetchMessages(for contact: Contact, completion: @escaping ([Message]) -> Void) {
        messageFetchStore.fetch(for: contact, completion: completion)
    }
    
    func sendNew(message: Message, for contact: Contact, completion: @escaping (Bool) -> Void) {
        messageSaveStore.save(message: message, for: contact, completion: completion)
    }
}
