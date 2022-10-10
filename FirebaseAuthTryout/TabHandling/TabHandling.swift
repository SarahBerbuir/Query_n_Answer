//
//  HomeView.swift
//  FirebaseAuthTryout
//
//  Created by Sarah Berbuir on 05.10.22.
//

import SwiftUI

struct TabComponent: View {
    let imageName: String?
    let textName: String?
    
    var body: some View {
        Image(systemName: imageName ?? " ")
        Text(textName ?? " ")
    }
}

struct TabHandling: View {
    @State var selection = 1
    
    var body: some View {
        TabView(selection: $selection){
            //Color.purple.ignoresSafeArea()
            
            HomeView()
                .tabItem{TabComponent(imageName: "house.fill", textName: "Home")}
                .background(Color.brown
                    .ignoresSafeArea()
                    .opacity(0.1)
                    .cornerRadius(3.0))
                .tag(1)
            PersonalQueryView()
                .tabItem{TabComponent(imageName: "quote.bubble", textName: "Query")}
                .background(Color.brown
                    .ignoresSafeArea()
                    .opacity(0.1)
                    .cornerRadius(3.0))
                .tag(2)
            PersonalHistoryView()
                .tabItem{TabComponent(imageName: "heart.rectangle.fill", textName: "History")}
              
                .tag(3)
            
        }
        .accentColor(Color(red: 129/255, green: 151/255, blue: 139/255))
        .navigationTitle(selection == 1 ? "Home" : selection == 2 ? "Query" : "History")
            }
}

struct TabHandling_Previews: PreviewProvider {
    static var previews: some View {
        TabHandling()
    }
}
