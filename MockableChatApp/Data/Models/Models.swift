//
//  Models.swift
//  MockableChatApp
//
//  Created by Islam Md. Zahirul on 1/2/22.
//

import Foundation

struct Contact: Hashable {
    let name: String
}
extension Contact {
    static let zahir = Contact(name: "Zahir")
    static let kabir = Contact(name: "Kabir")
    static let james = Contact(name: "James")
    static let kelly = Contact(name: "Kelly")
    static let warren = Contact(name: "Warren")
    static let reymond = Contact(name: "Raymond")
    static let thomas = Contact(name: "Thomas")
    static let woddifin = Contact(name: "Woddifin")
}



struct TextMessage {
    let message: String
}

enum Message {
    case text(TextMessage)
    case loading
    
    func toString() -> String {
        switch self {
        case .text(let textMessage):
            return textMessage.message
        case .loading: return "Loading..."
        }
    }
    
    var id: String {
        return UUID().uuidString
    }
}

struct MessageChannel {
    let name: String
}


struct ChatMessage {
    let contact: Contact
    let messages: [Message]?
    var id: String {
        return UUID().uuidString
    }
}

extension ChatMessage {
    static let mock = ChatMessage(contact: .zahir, messages: nil)
}
