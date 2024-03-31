//
//  ActivityCell.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 31/03/2024.
//

import SwiftUI

struct ActivityCell: View {
    var icon:String
    var title:String
    var isAvailable:Bool
    var screenWidth = UIScreen.main.bounds.width
    var body: some View {
        
        VStack(alignment:.leading){
            
            HStack{
                Image(icon)
                    .resizable()
                    .frame(width:20, height:20)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "chevron.right.circle.fill")
                    .foregroundColor(.white)
                    .frame(width: 30,height: 30)
            }
            Spacer()
            HStack{
                Text(title)
                Spacer()
                Text("+ 10 pts")
                
            }
            .foregroundColor(.white)
        }
        .padding(.horizontal,8)
        .padding(.vertical,8)
        .frame(width: screenWidth - 34,height: 100)
       
        .background(Color.neutral900)
        .cornerRadius(13)
        .accentColor(Color.purple)
    }
}

#Preview {
    ActivityCell(icon: "person.2", title: "Méditer", isAvailable: true)
}
