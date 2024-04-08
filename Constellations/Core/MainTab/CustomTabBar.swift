//
//  SwiftUIView.swift
//  Constellations
//
//  Created by Charles Martin Martinière on 20/03/2024.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab:String
    @Namespace var animation
    var body: some View {
        
        
        HStack(spacing:0){
            TabBarButton(animation: animation, image: "sparkles", description: "Explorer", selectedTab: $selectedTab)
            
        MainTabBarButton(image: "plus.square.fill", selectedTab: $selectedTab)
            
            TabBarButton(animation: animation, image: "list.star", description: "Communauté", selectedTab: $selectedTab)
            
            
        }
        .padding(.top)
        .padding(.vertical,-10)
        .padding(.bottom,getSafeArea().bottom == 0 ? 15 : getSafeArea().bottom)
        .background(.neutral200)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant("sparkles"))
    }
}

extension View{
    
    func getSafeArea() -> UIEdgeInsets {
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

struct MainTabBarButton:View {
    
    var image:String
    @ Binding var selectedTab:String
    var body: some View {
        ZStack{
            /*
            RoundedRectangle(cornerRadius: 6)
                .frame(width: 44,height:14)
                .offset(y: +19)
             */
            Button {
                selectedTab = image
            } label: {
                
                ZStack{
                    RoundedRectangle(cornerRadius: 6)
                            .frame(width:44,height:44)
                         //   .shadow(color: .black, radius: 0, x: 0, y: 4)
                            .foregroundColor(.white)
                    Image(systemName: image)
                        .resizable()
                        .frame(width: 44, height: 44, alignment: .center)
                        .foregroundColor(.neutral900)
                    
    
                }
            }
            .overlay(
            RoundedRectangle(cornerRadius: 6)
            .inset(by: 1)
            .stroke(.black, lineWidth: 2)

            )
            
        }
        .offset(y:-16)
    }
}

struct TabBarButton:View {
    var animation:Namespace.ID
    var image:String
    var description:String
    
    @Binding var selectedTab:String
    
    var body: some View{
        Button {
            withAnimation(.spring()){
                selectedTab = image
            }
        } label: {
            VStack(spacing:8){
                Image(systemName: image)
                    .resizable()
                    .foregroundColor(selectedTab == image ? .neutral900 : .gray.opacity(0.8))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28,height: 28)
              
                    Text(description)
                        .font(.system(size: 12))
                        .foregroundColor(selectedTab == image ? .neutral900 : .gray.opacity(0.8))
                
                if selectedTab == image {
                    Circle()
                        .fill(Color.neutral900)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                        .frame(width: 8,height: 8)
                }
            }.frame(maxWidth:.infinity)
        }

    }
}
