//
//  ContentView.swift
//  MockableChatApp
//
//  Created by Islam Md. Zahirul on 1/2/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dependency: Dependency
    var body: some View {
        VStack {
            ChatContactListView(chatListViewModel: ChatContactViewModel(fetchContactListUsecase: FetchChatContactListUsecase(messagingService: dependency.messagingService, currentUserService: dependency.currentUserService!)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
