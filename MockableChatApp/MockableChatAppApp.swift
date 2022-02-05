//
//  MockableChatAppApp.swift
//  MockableChatApp
//
//  Created by Islam Md. Zahirul on 1/2/22.
//

import SwiftUI

@main
struct MockableChatAppApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Dependency.shared)
                
        }
    }
}


class Dependency: ObservableObject {
    
    static let shared = Dependency()
    var messagingService: MessagingService!
    var currentUserService: CurrentUserService?
    
    var fetchChatContactListUseacse: FetchChatContactListUsecase!
    
    
    init() {
        messagingService = MockMessagingService()
        login(contact: Contact.zahir)
        fetchChatContactListUseacse = FetchChatContactListUsecase(messagingService: messagingService, currentUserService: currentUserService!)
    }
    
    func  fetchMessagesUsecase() -> FetchMessagesUsecase {
        return FetchMessagesUsecase(lastMessageService: MockLastMessageStoreService())
    }
    
    func login(contact: Contact) {
        currentUserService = MockCurrentUserService(contact: contact)
    }
}
