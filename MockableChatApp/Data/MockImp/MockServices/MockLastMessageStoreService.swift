//
//  MockLastMessageStoreService.swift
//  MockableChatApp
//
//  Created by Islam Md. Zahirul on 4/2/22.
//

import Foundation

var sleepTime: UInt32 = 4

class MockLastMessageStoreService: LastMessageStoreService {
   
    private(set) var messageFetchStore: MessageStore!
    init(messageFetchStore: MessageStore = MockMessageStore()) {
        self.messageFetchStore = messageFetchStore
    }
    
    
    func fetchLastMessage(for contact: Contact, completion: @escaping ([Message]) -> Void) {
       
        DispatchQueue.global().async {
            sleepTime += UInt32(Int.random(in: 0..<3))
            sleep(sleepTime)
            self.messageFetchStore.fetch(for: contact) { messages in
                DispatchQueue.main.async { [self] in
                    completion(messages)
                }
            }
           
            
        }
    }
    
    func addLast(message: Message, for contact: Contact, completion: @escaping () -> Void) {
        messageFetchStore.save(message: message, for: contact) { status in
            completion()
        }
    }
}
