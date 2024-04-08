//
//  UserRowView.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 31/03/2024.
//

import SwiftUI

struct UserRowView: View {
  let user:User
    var body: some View {
        
        HStack {
            
            Image(systemName: "sparkle")
                .resizable()
                .frame(width: 34,height: 34)
            Text(user.username)
            Spacer()
            
        }
        .frame(width: .infinity,alignment: .leading)
        .foregroundColor(.neutral900)
        .padding(.horizontal)
        
    
        
    }
}



#Preview {
    UserRowView(user: User(username: "Mark", fullname: "Zuck", email: ""))
}
