//
//  HomeView.swift
//  FirebaseAuthTryout
//
//  Created by Sarah Berbuir on 05.10.22.
//

import SwiftUI


struct HomeView: View {
    var body: some View {
        Color(red: 222/255, green: 192/255, blue: 155/255).opacity(0.1).ignoresSafeArea()
            .overlay(
                VStack {
                    Image("Logo_Transparent")
                    VStack{
                            Text("This app aims for providing a personal assistant which gets queries from users and answers with an answer based on an algorithm which uses machine learning.")
                                .padding()
                    }
                    .frame(minWidth: 300, maxHeight: 400, alignment: .topLeading)
                }
            )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
