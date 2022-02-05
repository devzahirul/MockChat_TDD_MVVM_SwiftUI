//
//  CurrentUserService.swift
//  MockableChatApp
//
//  Created by Islam Md. Zahirul on 4/2/22.
//

import Foundation

protocol CurrentUserService {
    func getChannelName(for contact: Contact) -> String 
}
