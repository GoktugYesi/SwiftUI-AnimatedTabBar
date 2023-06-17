//
//  Anasayfa.swift
//  AnimatedTabBar
//
//  Created by Göktug Yeşil on 17.06.2023.
//

import SwiftUI

struct Anasayfa: View {
    
    @State private var activeTab: Tab = .anasayfa
    
    @Namespace private var animation
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab) {
                Text("Anasayfa")
                    .tag(Tab.anasayfa)
                    .toolbar(.hidden,for: .tabBar)
                
                Text("Mail")
                    .tag(Tab.mail)
                    .toolbar(.hidden,for: .tabBar)
                
                Text("İzinler")
                    .tag(Tab.izinler)
                    .toolbar(.hidden,for: .tabBar)
                
                Text("Ayarlar")
                    .tag(Tab.ayarlar)
                    .toolbar(.hidden,for: .tabBar)
            }
            
            CustomTabBar()
            
        }
    }
    
    @ViewBuilder
    func CustomTabBar(_ tint: Color = Color("Orange"), _ inactiveTint: Color = .orange) ->
    some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) {
                TabItem(
                    tint: .orange,
                    inactiveTint: inactiveTint,
                    tab: $0,
                    animation: animation,
                    activeTab: $activeTab
                )
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(content: {
            Rectangle()
                .fill(.white)
                .ignoresSafeArea()
                .shadow(color: .orange.opacity(0.2), radius: 5, x: 0 , y: -5)
                .blur(radius: 2)
                .padding(.top, 25)
        })
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }
}

//Tab Bar Item
struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    
    var body: some View{
        VStack(spacing: 5) {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .foregroundColor(activeTab == tab ? .white : inactiveTint)
                .frame(width: activeTab == tab ? 58 : 35, height: activeTab == tab ? 58 : 35)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
            
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(activeTab == tab ? tint : .gray)
            
        }.frame(maxWidth: .infinity)
            .contentShape(Rectangle())
            .onTapGesture {
                activeTab = tab
            }
    }
}

struct Anasayfa_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
