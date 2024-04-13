//
//  MeditationView.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 08/04/2024.
//

import SwiftUI

struct MeditationView: View {
    
    @ObservedObject var viewModel = MeditationViewModel()
    @State var currentMeditation: Meditation?
    @State private var selectedSound: Sound?
    
    @Environment(\.presentationMode) var mod
    
    var body: some View {
        NavigationView {
      
        ZStack {
          
            VStack(spacing:32) {
                HStack{
                    Button {
                        mod.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 20,height: 16)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                    }
                   
                    Spacer()
                       
                }
                

               // MainTitleView(title: "Méditations", color: Color(.purple))
                
               
                              
                ScrollView(.horizontal,showsIndicators: false){
                    VStack{
                        LazyHStack{
                            ForEach(viewModel.meditations) { meditation in
                                
                                AlbumSectionView2( meditation: meditation).onTapGesture {
                                    self.currentMeditation = meditation
                                }
                            }
                            
                        }
                        .padding( )
                    }
                        }
//if currentMeditation != nil {
                    LazyVStack {
                        ForEach(self.currentMeditation?.sounds ?? viewModel.meditations.first!.sounds, id: \.self) { sound in
                            meditationCell(sound: sound,meditation: self.currentMeditation ?? viewModel.meditations.first!)
                        }
                    }
                /*
                    .sheet(isPresented: $isPresented, content: {
                        if let index = currentMeditation?.sounds.firstIndex(of: selectedSound ?? viewModel.meditations.first!.sounds[0]) {
                            
                            PlayerView(sound: currentMeditation!.sounds[index])
                        }
                    })
                 */
       //      }
                   
                Spacer()
                .padding()
                
              
            }
         
            /*
            .sheet(isPresented: $isPresented, content: {
                PlayerView(sound: self.currentMeditation?.sounds[0] ?? viewModel.meditations.first!.sounds[0])
            })
          */
        }
      
    }
        .navigationBarHidden(true)
    }
}

#Preview {
    MeditationView()
}
