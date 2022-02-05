//
//  MessageSaveStore.swift
//  MockableChatApp
//
//  Created by Islam Md. Zahirul on 5/2/22.
//

import Foundation

protocol MessageSaveStore {
    func save(message: Message, for contact: Contact, completion: @escaping(Bool)->Void)
}

protocol MessageFetchStore {
    func fetch(for contact: Contact, completion: @escaping([Message])->Void)
}

typealias MessageStore = MessageSaveStore & MessageFetchStore
