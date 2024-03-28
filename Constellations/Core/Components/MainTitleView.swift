//
//  MainTitleView.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 23/03/2024.
//

import SwiftUI

struct MainTitleView: View {
    let title: String
    let displayButton:Bool
    @Binding var isHide:Bool
    
    var body: some View {
        if !isHide{
            GeometryReader { geometry in
                
                HStack{
                    ZStack(alignment:.leading){
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [.primary500, .neutral200]), startPoint: .leading, endPoint: .trailing))
                            .frame(width: geometry.size.width / 2, height: 24) // La moitié de la largeur de l'écran
                        
                            .offset(y: 10) // Décalage vertical
                        
                        
                        Text(title.uppercased())
                            .font(.custom("Verdana", size: 28))
                            .bold()
                            .italic()
                            .foregroundColor(.neutral900)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal,56)
                    }
                    if displayButton {
                        
                        Button(action: {
                            
                        }, label: {
                            HStack(spacing:2){
                                Image(systemName:"sparkle")
                                    .foregroundColor(.primary500)
                                Text("Moi")
                                    .font(.custom("Verdana", size: 14))
                                Image(systemName:"chevron.right")
                                
                                
                            }
                            .padding(.horizontal,8)
                            .padding(.vertical,8)
                            .foregroundColor(.neutral900) // Couleur de premier plan de la capsule
                            .clipShape(Capsule())
                            .background(Color.primary200)
                            .cornerRadius(22)
                            .overlay(
                                Capsule()
                                    .stroke(Color.black, lineWidth: 2)
                            )
                            
                            
                        })
                        .padding(.horizontal)
                        
                        
                    }
                    
                    
                }
            }
            .frame(height:58)
        }
    }
}


#Preview {
    MainTitleView(title: "Acceuil", displayButton: true, isHide: .constant(false))
}
