//
//  PersonalHistoryView.swift
//  FirebaseAuthTryout
//
//  Created by Sarah Berbuir on 05.10.22.
//

import SwiftUI

struct PersonalHistoryView: View {
    @ObservedObject var model = ViewModelPersonalHistory()
    var body: some View {
        
            VStack{
                Spacer()
                
                List(model.list){ item in
                    
                    HStack{
                        VStack{
                        HStack{
                            VStack{
                                HStack{
                                    VStack(alignment: .leading){
                                        HStack{
                                            Image(systemName: "questionmark.square")
                                                .foregroundColor(Color(red: 129/255, green: 151/255, blue: 139/255))
                                        }
                                        HStack{
                                            Image(systemName: "quote.bubble")
                                                .foregroundColor(Color(red: 129/255, green: 151/255, blue: 139/255))
                                        }
                                    }
                                    
                                    VStack(alignment: .leading){
                                        Text(item.questionAsked)
                                            .fixedSize()
                                        Text(item.questionAnswer)
                                            .fixedSize()
                                    }
                                }
                                .foregroundColor(.brown)
                                
                            }
                            HStack{
                                Spacer()
                                Image(systemName: "trash")
                                    .foregroundColor(.gray)
                                    //.padding(.leading, 35)
                            }
                            
                        }
                        HStack{
                            let restStars = 5 - item.rating
                           
                            ForEach(0..<item.rating, id: \.self) {index in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                            
                            ForEach(0..<restStars, id: \.self) {index in
                                Image(systemName: "star")
                                    .foregroundColor(.yellow)
                            }
                        }
                        .padding()
                        }
                    }
                    .padding()
                    
                    
                }
                
            }
           
        

        
    }
    
    init(){
        model.getData()
        
    }
}

struct PersonalHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalHistoryView()
    }
}
