//
//  ChatView.swift
//  MockableChatApp
//
//  Created by Islam Md. Zahirul on 1/2/22.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatContactItemViewModel: ChatContactItemViewModel
    
    @State var sendMessage: String = ""
    
    //MARK: - UI
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                ForEach(chatContactItemViewModel.oldMessages, id:\.id) {model in
                    Text(model.toString())
                }
            }
           
            Spacer()
            HStack {
                TextField("Enter new message", text: $sendMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button {
                    chatContactItemViewModel.send(message: Message.text(TextMessage(message: sendMessage)))
                    sendMessage = ""
                } label: {
                    Text("Send")
                }

            }//: HStack
            .padding()
                .navigationBarTitle(Text(chatContactItemViewModel.contact.name))
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chatContactItemViewModel: ChatContactItemViewModel(ChatMessage.mock, fetchMessageUsecase: FetchMessagesUsecase(lastMessageService: MockLastMessageStoreService())))
    }
}
