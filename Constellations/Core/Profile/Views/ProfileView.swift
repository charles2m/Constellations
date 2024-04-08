//
//  ProfileView.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 28/03/2024.
//

import SwiftUI

struct ProfileView: View {
   @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    var user:User
    var body: some View {
        ZStack {
            VStack{
              
                
           
                HStack {
                    
                    Button(action: {
                        mode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width:20,height:16)
                            .foregroundColor(.neutral900)
                        
                    })
                    Spacer()
               
                        Text(user.username)
                            .bold()
                        
                        Menu {
                            Button(action: {
                                viewModel.signOut()
                            }) {
                                Text("Se déconnecter")
                            }
                        } label: {
                            Image(systemName: "ellipsis.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                        }
                    
                }
                   .padding()
                   
                   HStack {
                       VStack(alignment: .leading) {
                           Text("Momentum")
                           Text("30")
                               .font(.largeTitle)
                               .bold()
                       }
                       Spacer()
                   }
                   .padding(.horizontal)
                
                VStack(alignment:.leading,spacing: 28){
                    
                  
                    Text("Mon étoile : ")
                        .font(.headline)
                        .bold()
                   // ScoreChartView(profileVM: profileVM)
               
                    HStack{
                        Spacer()
                        VStack(spacing:20){
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 20,height: 20)
                                .foregroundColor(.neutral900)
                              Text("Concentration")
                            Text( "30"+"pts")
                        }
                        .padding(.horizontal,60)
                        .padding(.vertical,60)
                        .background(Circle().stroke(lineWidth: 10).fill(.green.opacity(0.4)))
                        Spacer()
                        
                    }
                    VStack(alignment: .leading, spacing:4) {
                        NavigationLink {
                            Color.green
                        } label: {
                            Text("Commencer à gagner :")
                            ActivityCell(icon: "", title: "Méditer", isAvailable: true)
                        }

                    
                    }
                    Spacer()
                   
                }.padding()
                    
                
                }
           
           // }
     
        }.navigationBarHidden(true)
    }
}

#Preview {
    ProfileView(user: User(username: "Jeff", fullname: "Besos", email: ""))
                
}


