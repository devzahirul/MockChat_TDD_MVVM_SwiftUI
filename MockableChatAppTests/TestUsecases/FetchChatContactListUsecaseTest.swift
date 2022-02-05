//
//  FetchChatContactListUsecaseTest.swift
//  MockableChatAppTests
//
//  Created by Islam Md. Zahirul on 5/2/22.
//

import XCTest
@testable import MockableChatApp

class FetchChatContactListUsecaseTest: XCTestCase {
    func test_NotNill_whenCreated() {
        
        let messagingService = makeMessingService(contacts: [])
        let currentUserService = makeCurrentUserService()
        let sut = makeSTU(messagingService: messagingService, currentUserService: currentUserService)
        XCTAssertNotNil(sut)
    }
    
    func testFetchContactEmpty() {
        let contacts = [Contact]()
        let messagingService = makeMessingService(contacts: contacts)
        let currentUserService = makeCurrentUserService()
        let sut = makeSTU(messagingService: messagingService, currentUserService: currentUserService)
       
        let ouputHandler = TestFetchUsecaseOutput()
        sut.delegate = ouputHandler
        sut.fetchChatContactList()
        
        XCTAssertEqual(ouputHandler.contacts.count, contacts.count)
    }
    
    
    func testFetchContactsWhenContactsTwo() {
        let contacts: [Contact] = [.kabir, .zahir]
        let messagingService = makeMessingService(contacts: contacts)
        let currentUserService = makeCurrentUserService()
        let sut = makeSTU(messagingService: messagingService, currentUserService: currentUserService)
       
        let ouputHandler = TestFetchUsecaseOutput()
        sut.delegate = ouputHandler
        sut.fetchChatContactList()
        
        XCTAssertEqual(ouputHandler.contacts.count, contacts.count)
    }
    
    
    func makeSTU(messagingService: MessagingService, currentUserService: CurrentUserService) -> FetchChatContactListUsecase {
        return FetchChatContactListUsecase(messagingService: messagingService, currentUserService: currentUserService)
    }
    
    func makeMessingService(contacts: [Contact]) -> MessagingService {
        return TestMessagingService(contacts: contacts)
    }
    
    func makeCurrentUserService() -> CurrentUserService {
        return TestCurrentUserService()
    }
}

class TestFetchUsecaseOutput: FetchChatContactListUsecaseOutput {
    var contacts: [ChatMessage]!
    func didFailed(error: Error) {
        
    }
    
    func didFetch(contractList: [ChatMessage]) {
        contacts = contractList
    }
}

class TestCurrentUserService: CurrentUserService {
    func getChannelName(for contact: Contact) -> String {
        return ""
    }
}

struct TestMessagingService: MessagingService {
    func fetchMessages(for contact: Contact, completion: @escaping ([Message]) -> Void) {
        
    }
    
    func sendNew(message: Message, for contact: Contact, completion: @escaping (Bool) -> Void) {
        
    }
    
    let contacts: [Contact]
    func fetchContactList(completion: @escaping ([Contact]) -> Void) {
        completion(contacts)
    }
    
    func fetchContactStatus(_ contact: Contact, completion: @escaping () -> Void) {
        
    }
    
    func fetchMessages(channel: MessageChannel, limit: Int, completion: @escaping ([Message]) -> Void) {
        
    }
    
    
}
