//
//  LoginView.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 31/03/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel:AuthViewModel
    
    var body: some View {
        VStack{
          
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
                CustomInputField(imageName: "lock", placeholderText: "Mot de passe", text: $password,isSecuredField: true)
            }
            
            .padding(.horizontal,32)
            .padding(.top,44)
            HStack{
                Spacer()
                NavigationLink {
                    
                        Text("Other view")
                    
                } label: {
                    Text("Mot de passe oublié ?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing,24)
                }

            }
            
            Button {
             viewModel.login(withEmail: email, password: password)
            } label: {
                Text("Se connecter")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width:340,height:50)
                    .background(.purple)
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius:10, x:0, y:0)

            Spacer()
            NavigationLink{
                
                RegistrationView()
                    .navigationBarHidden(true)
            }label:{
                
                HStack{
                    Text("Vous n'avez pas de compte?")
                        .font(.footnote)
                    Text("S'enregister")
                }
                
            }
            .padding(.bottom,20)
            .foregroundColor(.purple)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}
