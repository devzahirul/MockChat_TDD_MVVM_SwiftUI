//
//  NamePlaceHolderView.swift
//  MockableChatApp
//
//  Created by Islam Md. Zahirul on 5/2/22.
//

import SwiftUI

struct NamePlaceholderView: View {
    let contact: Contact
    var body: some View {
        Text(String(contact.name.first!))
            .foregroundColor(.white)
            .frame(width: 30)
            .padding()
            .background(Color.gray)
            .clipShape(Circle())
        
    }
}
