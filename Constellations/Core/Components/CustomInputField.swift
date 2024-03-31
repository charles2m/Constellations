//
//  CustomInputField.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 31/03/2024.
//

import SwiftUI

struct CustomInputField: View {
    let imageName:String
    let placeholderText:String
    @Binding var text:String
    var isSecuredField:Bool = false
    
    
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20,height: 20)
                    .foregroundColor(.gray)
                if isSecuredField {
                    SecureField(placeholderText,text: $text)

                }else {
                    
                    TextField(placeholderText, text: $text)
                }
              
            }
            Divider()
                .background(.gray)
        }
    }
}

#Preview {
    CustomInputField(imageName: "enveloper", placeholderText: "Email", text: .constant(""))
}
