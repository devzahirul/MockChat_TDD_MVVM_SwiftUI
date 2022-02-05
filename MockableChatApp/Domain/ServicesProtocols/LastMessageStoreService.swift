//
//  LastMessageStoreService.swift
//  MockableChatApp
//
//  Created by Islam Md. Zahirul on 4/2/22.
//

import Foundation

protocol LastMessageStoreService {
    func fetchLastMessage(for contact: Contact, completion: @escaping([Message])->Void)
    func addLast(message: Message, for contact: Contact, completion: @escaping()->Void)
}
