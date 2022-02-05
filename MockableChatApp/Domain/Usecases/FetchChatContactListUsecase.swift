//
//  FetchChatContactListUsecase.swift
//  MockableChatApp
//
//  Created by Islam Md. Zahirul on 1/2/22.
//

import Foundation



protocol FetchChatContactListUsecaseOutput: AnyObject {
    func didFetch(contractList: [ChatMessage])
    func didFailed(error: Error)
}


class FetchChatContactListUsecase {
    private(set) var messagingService: MessagingService
    private(set) var currentUserService: CurrentUserService
    weak var delegate: FetchChatContactListUsecaseOutput?
    
    
    init(messagingService: MessagingService, currentUserService: CurrentUserService) {
        self.messagingService = messagingService
        self.currentUserService = currentUserService
    }
    
    func fetchChatContactList() {
        messagingService.fetchContactList {[weak self] contacts in
            guard let self = self else {return}
            let chatMessages = contacts.map { contact in
                return ChatMessage(contact: contact, messages: nil)
            }
            self.delegate?.didFetch(contractList: chatMessages)
        }
    }
}

