//
//  PersonalQueryView.swift
//  FirebaseAuthTryout
//
//  Created by Sarah Berbuir on 05.10.22.
//

import SwiftUI
import FirebaseFirestore

struct PersonalQueryView: View {
    @State private var question: String = ""
    @State var answer: String = ""
    @State var errorMessage: String = ""
    //@State var starOnePressed: Bool = false
    @State var starsArePressed: [Bool] = [false, false, false, false, false]
    @State var starsPressed: Int = 0
    
    func getStarPressed(ind: Int ) -> Bool{
        var isPressed = false
       
        for i in ind..<5 {
            if (starsArePressed[i] == true) {
                isPressed = true
                
            }
            //starsArePressed[i] = false
        }
        
       
        
        return isPressed
    }
    

    func getData(){
        //get a reference to the database
        let database = Firestore.firestore()
        var answerExist = false
        print("getData")
        // Read documents
        database.collection("WrittenQueries").getDocuments { snapshot, error in
            if error == nil{
                //No errors
                if let snapshot = snapshot {
                    //Get all documents
                    snapshot.documents.map{ d in
                        if(question == d["question"] as! String){
                            answer = d["answer"] as? String ?? " "
                            answerExist = true
                        }
                        
                    }
                    if (!answerExist){
                        //answer = " "
                        errorMessage = "Sorry, there is no answer to your question. Try again"
                    }
                }
            } else{
                print("error")
            }
        }
    }
    
    func updateRestaurant(date: String, question: String, answer: String, rating: Int) {
            let db = Firestore.firestore()

            
            let docData: [String: Any] = [
                "date": date,
                "questionAsked": question,
                "questionAnswer": answer,
                "rating":rating
            ]

            db.collection("HistoryWrittenQueries").document().setData(docData) { error in
                if let error = error {
                    print("Error writing document: \(error)")
                } else {
                    print("Document successfully written!")
                }
            }
    }
    
    var body: some View {
        Color(red: 222/255, green: 192/255, blue: 155/255).opacity(0.1).ignoresSafeArea()
            .overlay(
        VStack() {
           
            VStack(alignment: .center){
                
                HStack{
                    Image("Logo_Transparent")
                        .resizable()
                        .frame(width: 64.0, height: 64.0)
                    //    .foregroundColor(Color(red: 129/255, green: 151/255, blue: 139/255))
                    Text("Ask the personal \nassistant a question")
                        .foregroundColor(.brown)
                        //.fixedSize()
                        .frame(width: 200.0, height: 120.0)
                    Image("Logo_Transparent")
                        .resizable()
                        .frame(width: 64.0, height: 64.0)
                }
                .padding()
               
             
                HStack{
                    Image(systemName: "questionmark.square")
                        .foregroundColor(Color(red: 129/255, green: 151/255, blue: 139/255))
                    TextField("Question", text: $question)
                }
                .padding(.bottom, 24.0)
                HStack{
                    Image(systemName: "quote.bubble")
                        .foregroundColor(Color(red: 129/255, green: 151/255, blue: 139/255))
                    TextField("Answer", text: $answer)
                }
                .padding(.bottom, 24.0)
                
                
                HStack{
                    Button("Ask") {
                        getData()
                    }
                    .background(Color(red: 129/255, green: 151/255, blue: 139/255))
                    .foregroundColor(Color.white)
                    .frame(width: 120.0, height: 64.0)
                 
                    
                    Spacer()
                    Button("Reset") {
                        question = ""
                        answer = ""
                        errorMessage = ""
                        for i in 0..<5 {
                            starsArePressed[i] = false
                        }
                    }
                    .foregroundColor(Color.gray)
                }
                
                
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.system(size: 11))
                
            }

            Spacer()
            
            Text("Rate the answer")
            HStack{
                ForEach(0..<5, id: \.self) {index in
                    Button {
                        starsArePressed[index] = true
                        for i in index+1..<5 {
                            starsArePressed[i] = false
                        }
                        
                    } label: {
                        Image(systemName: getStarPressed(ind: index) ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                    }
                }
                
            }
            
            Spacer()
            
            Button {
                for i in 0..<5 {
                    if(starsArePressed[i] == true){
                        starsPressed += 1
                    }
                    
                }
                updateRestaurant(date: "xx", question: question, answer: answer, rating: starsPressed)
            } label: {
                HStack{
                    Image(systemName: "plus.message")
                        .foregroundColor(Color(red: 129/255, green: 151/255, blue: 139/255))
                    Text("Add to history")
                        .foregroundColor(.brown)
                }
        
            }
            .padding()
            
        }
        .padding(.all, 30.0)
        )
       
    }
    
}

struct PersonalQueryView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalQueryView()
    }
}

