//
//  MockContactStore.swift
//  MockableChatApp
//
//  Created by Islam Md. Zahirul on 5/2/22.
//

import Foundation


class MockContactStore: ContactFetchStore {
    private var currentContacts = [Contact.zahir, Contact.kabir,Contact.james, Contact.kelly,Contact.thomas, Contact.woddifin, .reymond, .warren]
    
    func fetchContacts(completion: @escaping ([Contact]) -> Void) {
        completion(currentContacts)
    }
}
