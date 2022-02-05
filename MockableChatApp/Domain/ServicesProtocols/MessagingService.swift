//
//  MessagingService.swift
//  MockableChatApp
//
//  Created by Islam Md. Zahirul on 1/2/22.
//

import Foundation

protocol MessagingService {
    func fetchContactList(completion: @escaping([Contact])->Void)
    func fetchMessages(for contact: Contact, completion: @escaping([Message])->Void)
    func sendNew(message: Message, for contact: Contact, completion: @escaping (Bool) -> Void)
}
