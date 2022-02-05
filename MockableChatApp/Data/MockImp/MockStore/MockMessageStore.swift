//
//  MockMessageStore.swift
//  MockableChatApp
//
//  Created by Islam Md. Zahirul on 5/2/22.
//

import Foundation


class MockMessageStore: MessageStore {
    
    var messageStore: [Contact: [Message]] = [
        .zahir: [Message.text(TextMessage(message: "Hello"))],
        .kabir: [Message.text(TextMessage(message: "Hi Kelly"))],
        .james: [Message.text(TextMessage(message: "Hi Zahir"))],
        .kelly: [Message.text(TextMessage(message: "This is an other message for you"))],
        .reymond: [Message.text(TextMessage(message: "Hi guys!"))],
        .warren: [Message.text(TextMessage(message: "Hi everyone"))],
        .thomas: [Message.text(TextMessage(message: "Hi devs! "))],
        .woddifin: [Message.text(TextMessage(message: "Hi to all, happy weekend!"))]
    ]
    
    func save(message: Message, for contact: Contact, completion: @escaping (Bool) -> Void) {
        if let messages = messageStore[contact] {
           var newMessages = messages
            newMessages.append(message)
            
            messageStore[contact] = newMessages
            
            completion(true)
            return
        } else {
            messageStore[contact] = [message]
        }
        completion(true)
    }
    
    func fetch(for contact: Contact, completion: @escaping ([Message]) -> Void) {
        completion(messageStore[contact] ?? [])
    }
}
