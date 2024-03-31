//
//  FeedView.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 18/03/2024.
//

import SwiftUI

struct FeedView: View {
    
    @State var isHide = false
    var body: some View {
        ZStack {
            NavigationStack {
                ZStack {
                    
                    VStack{
                        
                        //MainTitleView(title: "ACCEUIL", displayButton: true, isHide: $isHide)
                        ScrollView{
                            
                            LazyVStack(spacing:20){
                                
                                scrollTracker
                                
                                ForEach(0...5,id:\.self) { _ in
                                    
                                    TweetRowView()
                                }
                                
                            }
                            
                        }
                        .listStyle(.plain)
                        .navigationTitle("ACCEUIL")
                        .toolbar(content: {
                            ToolbarItem(placement: .topBarTrailing) {
                                NavigationLink {
                                    ProfileView()
                                } label: {
                                    HStack(spacing:2){
                                        Image(systemName:"sparkle")
                                            .foregroundColor(.neutral900)
                                        Text("Moi")
                                            .font(.custom("Verdana", size: 14))
                                        Image(systemName:"chevron.right")
                                        
                                        
                                    }
                                    .padding(.horizontal,8)
                                    .padding(.vertical,8)
                                    .foregroundColor(.neutral900) // Couleur de premier plan de la capsule
                                    .clipShape(Capsule())
                                   // .background(Color.neutral200)
                                    .cornerRadius(22)
                                    /*
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.black, lineWidth: 2)
                                    )
                                     */
                                }

                              
                                .padding(.top,22)
                                .padding(.horizontal)
                            }
                        }) .hidenNavBarOnSwipe(true)
                    }
                    VStack{
                        Rectangle()
                            .foregroundColor(Color.neutral200) // Couleur du fond d'écran
                            .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top) // Hauteur de la barre d'état
                            .edgesIgnoringSafeArea(.top) // Ignorer la barre d'état en haut
                        Spacer()
                        
                    }
                }
            }
           

        }
    }
}

#Preview {
    FeedView()
}


extension FeedView {
    
    var scrollTracker: some View {
        
        GeometryReader { reader -> AnyView in
            
            let yAxis = reader.frame(in: .global).minY
            print(yAxis)
            if yAxis < 0 && !isHide {
                DispatchQueue.main.async {
                    withAnimation {isHide = true}
                    
                    
                }
            }
            if yAxis > 0 && isHide {
                DispatchQueue.main.async {
                    withAnimation {
                        isHide = false
                    }
                    
                }
            }
            return  AnyView(Text("")
                .frame(width:0, height:0))
        }
    }
}
