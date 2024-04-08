//
//  RegistrationView.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 31/03/2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
  @EnvironmentObject var viewModel:AuthViewModel
    
    var body: some View {
        VStack{
        //   AuthentificationHeaderView(title1: "Préparez-vous !", title2: "Créer son compte.")
            HStack{
                VStack(alignment:.leading){
                Text("Bonjour.")
                        .font(.title)
                    .fontWeight(.semibold)
                Text("Content de vous revoir")
                        .font(.title)
                    .fontWeight(.semibold)
              
            }
                Spacer()
                Circle()
                    .frame(width: 44,height: 44)
            
            
        }
        .frame(height: 260)
        .padding(.leading)
        .padding(.trailing)
        .background(.purple)
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
            
            VStack(spacing:40){
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                CustomInputField(imageName: "person", placeholderText: "Prénom", text: $username)
                CustomInputField(imageName: "person", placeholderText: "Nom", text: $fullname)
                CustomInputField(imageName: "lock", placeholderText: "Mot de passe", text: $password,isSecuredField: true)
                
            }
            .padding(32)
            
            
            Button(action:{
               viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
                print($email)
                print($username)
            },label: {
                Text("S'enregistrer")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width:340,height:50)
                    .background(.purple)
                    .clipShape(Capsule())
                    .padding()
            })
            Spacer()
            Button {
                
                presentationMode.wrappedValue.dismiss()
                
            } label: {
                HStack{
                    Text("Vous avez déjà un compte?")
                        .font(.footnote)
                    Text("S'inscrire")
                }
            }
            .padding(.bottom,20)
            .foregroundColor(.blue)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    RegistrationView()
}
