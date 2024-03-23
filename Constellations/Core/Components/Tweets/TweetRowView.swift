//
//  TweetRowView.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 18/03/2024.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Aujourd'hui")
                .font(.custom(FontManager.Time_New_Roman.regular, size: 36))
                .bold()
            
            Text("Je suis ici et maintenant, pleinement présent(e) dans l'instant présent.")
                .lineSpacing(4)
                .font(.custom(FontManager.Time_New_Roman.regular, size: 24))
                .frame(maxWidth: 266) // Utiliser maxWidth: .infinity pour que le texte occupe toute la largeur
            
            HStack {
                Text("@Jesse vient de mediter")
                    .font(.custom(FontManager.Time_New_Roman.regular, size: 14))
                    .italic()
                Spacer()
                
                
                Image(systemName: "sparkles")
                    .resizable()
                    .frame(width: 20, height: 25)
                Text("4")
                    .font(
                        Font.custom(FontManager.Time_New_Roman.regular, size: 32)
                    .weight(.bold)
                    .italic())
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 12, height: 21)
                
            }
        }
        .foregroundColor(.neutral900)
        .padding(16)
        .frame(width: 344, alignment: .leading)
        .background(.secondaryYellow600)
        .cornerRadius(6)
        .shadow(color: .black, radius: 0, x: 0, y: 4)
        .overlay(
        RoundedRectangle(cornerRadius: 6)
        .inset(by: 1)
        .stroke(.black, lineWidth: 2)

        )
    }
}

#Preview {
    TweetRowView()
        
}
