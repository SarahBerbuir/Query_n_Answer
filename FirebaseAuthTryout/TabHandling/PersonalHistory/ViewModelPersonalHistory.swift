//
//  ViewModelPersonalHistory.swift
//  FirebaseAuthTryout
//
//  Created by Sarah Berbuir on 06.10.22.
//

import Foundation
import FirebaseFirestore

class ViewModelPersonalHistory: ObservableObject {
    
    @Published var list = [OneHistory]()
    
    func getData(){
        let database = Firestore.firestore()
        
        
        // Read documents
        database.collection("HistoryWrittenQueries").getDocuments { snapshot, error in
            if error == nil{
                //No errors
                if let snapshot = snapshot {
                    //Update list property in main thread
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map{ d in
                            return OneHistory(id: d.documentID,
                                              questionAsked: d["questionAsked"] as? String ?? " ",
                                              questionAnswer: d["questionAnswer"] as? String ?? " ",
                                              date: d["date"] as? String ?? " ",
                                              rating: d["rating"] as? Int ?? 0
                                            )
                            
                        }
                    }
                   
                   
                }
            } else{
                print("error")
            }
        }
    }
    
    
}

