//
//  ChatContactListItemView.swift
//  MockableChatApp
//
//  Created by Islam Md. Zahirul on 5/2/22.
//

import SwiftUI

struct ChatContactListItemView: View {
    @ObservedObject var viewModel: ChatContactItemViewModel
   
    var body: some View {
        HStack {
            NamePlaceholderView(contact: viewModel.chatMessage.contact)
            VStack(alignment: .leading) {
                Text(viewModel.contact.name)
                Text(viewModel.lastMessage?.toString() ?? "")
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        //.background(Color.black.opacity(0.2))
        .padding(.horizontal)
        .padding(.vertical, 0.5)
        
        
    }
}

struct ChatContactListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ChatContactListItemView(viewModel: ChatContactItemViewModel(ChatMessage(contact: .kabir, messages: nil), fetchMessageUsecase: FetchMessagesUsecase(lastMessageService: MockLastMessageStoreService())))
    }
}
