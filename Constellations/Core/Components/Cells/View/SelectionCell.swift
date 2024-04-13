//
//  SelectionCell.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 08/04/2024.
//

import SwiftUI

struct SelectionCell: View {
    var icon:String
    var text:String
    var isAvailable: Bool
    
    var body: some View {
        
        VStack(alignment:.leading){
            
            HStack{
                
                Image(icon)
                    .resizable()
                    .frame(width:20,height: 20)
                    .foregroundColor(.neutral900)
                Spacer()
                Image(systemName: "chevron.right.circle.fill")
                    .foregroundColor(isAvailable ? .neutral900 : .gray)
                    .frame(width:30,height:30)
            }
            
            Spacer()
            Text(text)
        }
        .padding(.horizontal,8)
        .padding(.vertical,8)
        .frame(width:160, height:100)
        .overlay(RoundedRectangle(cornerRadius: 12)
        .stroke(isAvailable ? Color.neutral900 : Color.gray, lineWidth:3))
        .background(Color.white)
        .accentColor(.neutral900)
    }
}


#Preview {
    SelectionCell(icon: "", text: "Méditation", isAvailable: true)
}
