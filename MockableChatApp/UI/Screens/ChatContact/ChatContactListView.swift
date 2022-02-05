//
//  ChatContactListView.swift
//  MockableChatApp
//
//  Created by Islam Md. Zahirul on 1/2/22.
//

import SwiftUI

struct ChatContactListView: View {
    @ObservedObject var chatListViewModel: ChatContactViewModel
    
    //MARK:- UI
    var body: some View {
        NavigationView {
        VStack {
            ScrollView(.vertical) {
            ForEach(chatListViewModel.chatContactList, id: \.id) { model in
                NavigationLink(destination: ChatView(chatContactItemViewModel: model)) {
                    ChatContactListItemView(viewModel: model)
                }
               
            }
            }
            Spacer()
        }
        .onAppear(perform: {
            chatListViewModel.onAppear()
        })
        .navigationTitle(Text("Chat"))
        }
    }
}

struct ChatContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatContactListView(chatListViewModel: ChatContactViewModel(fetchContactListUsecase: FetchChatContactListUsecase(messagingService: MockMessagingService(), currentUserService: MockCurrentUserService(contact: .zahir))))
    }
}
