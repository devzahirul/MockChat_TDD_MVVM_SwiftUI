//
//  MockCurrentUserService.swift
//  MockableChatApp
//
//  Created by Islam Md. Zahirul on 4/2/22.
//

import Foundation

class MockCurrentUserService: CurrentUserService {
    var currentContact: Contact
    init(contact: Contact) {
        self.currentContact = contact
    }
    
    func getChannelName(for contact: Contact) -> String {
        return currentContact.name + "_" + contact.name
    }
}
