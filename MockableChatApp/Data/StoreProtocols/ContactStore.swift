//
//  ContactStore.swift
//  MockableChatApp
//
//  Created by Islam Md. Zahirul on 5/2/22.
//

import Foundation


protocol ContactFetchStore {
    func fetchContacts(completion: @escaping([Contact])->Void)
}


