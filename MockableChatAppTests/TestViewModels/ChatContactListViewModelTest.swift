//
//  ChatContactListViewModelTest.swift
//  MockableChatAppTests
//
//  Created by Islam Md. Zahirul on 5/2/22.
//

import XCTest
@testable import MockableChatApp
class ChatContactListViewModelTest: XCTestCase {
    func testViewModelCreate() {
        let contacts = [Contact]()
        let messageService = TestMessagingService(contacts: contacts)
        let currentUserService = TestCurrentUserService()
        let sut = makeSTU(messagingService: messageService, currentUserService: currentUserService)
        sut.onAppear()
        sut.onAppear()
        XCTAssertEqual(sut.chatContactList.count, 0)
        
    }
    
    
    func testWhenContactTwo() {
        let contacts: [Contact] = [.zahir, .kabir]
        let messageService = TestMessagingService(contacts: contacts)
        let currentUserService = TestCurrentUserService()
        let sut = makeSTU(messagingService: messageService, currentUserService: currentUserService)
        sut.onAppear()
        
        XCTAssertEqual(sut.chatContactList.count, 2)
    }
    
    func makeSTU(messagingService: MessagingService, currentUserService: CurrentUserService) -> ChatContactViewModel {
        return ChatContactViewModel(fetchContactListUsecase: FetchChatContactListUsecase(messagingService: messagingService, currentUserService: currentUserService))
    }
}
