//
//  AlbumSectionView2.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 08/04/2024.
//

import SwiftUI

struct AlbumSectionView2: View {
    
    var meditation: Meditation
    
    var body: some View {
        VStack(spacing:12){
            ZStack(alignment: .leading){
                Image(meditation.image)
                    .resizable()
                    .frame(width:311, height:180)
                LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.6),Color.clear]), startPoint: .top, endPoint: .bottom)
                    .frame(width: 311,height:180)
                VStack(alignment:.leading,spacing:22){
                    Text(meditation.name)
                        .foregroundColor(.white)
                        .frame(width: 150)
                 
                    HStack{
                        Spacer()
                      
                        
                    }.frame(width:260)
                    
                }
                .font(.title)
                .foregroundColor(.white)
                .padding()
            }
            /*
            ForEach(meditation.sounds,id: \.self) { sound in
                
                Button {
                    isPresented = true
                } label: {
                 
                    meditationCell(sound: sound)
                }

          
               
            }
            */
        }
        
    }
}

#Preview {
    AlbumSectionView2(meditation: Meditation(name: "Nature", image: "", sounds: [Sound(sound: "Sound1", time: "10:00", file: "intro.mp3")], isSelected: true))
}

struct meditationCell:View {
    
    var sound:Sound
    var meditation:Meditation
    var body : some View {
        NavigationLink (
            destination:
                PlayerView(sound: sound, meditation: meditation)
        , label: {
            HStack{
            
                    Image(systemName: "play.circle.fill")
                Text(sound.sound)
                    .bold()
                    Spacer()
                
                
            }
            .foregroundColor(.purple)
            .padding()
            .frame(width:.infinity,height:40)
       
            
        })

       
    }
    
    
}

/*
extension AlbumSectionView {
    
    func meditationCell(sound:Sound) -> some View{
        HStack{
           
                Image(systemName: "play.circle.fill")
            Text(sound.sound)
                .bold()
                   
                Spacer()
            

          
            
        }
        .foregroundColor(.purple)
        .padding()
        .frame(width:311,height:40)
            
    }
}
*/

