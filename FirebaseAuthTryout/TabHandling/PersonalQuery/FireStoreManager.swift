//
//  FireStoreManager.swift
//  FirebaseAuthTryout
//
//  Created by Sarah Berbuir on 09.10.22.
//
// FirestoreManager.swift

import Foundation
import FirebaseFirestore


class FirestoreManager: ObservableObject {
    // Create your docData variable first
    let docData: [String: Any] = [
        "date": "10/09/22",
        "questionAsked": "1234 Restaurant St",
        "questionAnswer": "Answer",
        "rating":5
    ]

    // Create the document in Firestore
    func createRestaurant() {
            let db = Firestore.firestore()

            let docRef = db.collection("Restaurants").document("PoutineFiesta")

                    docRef.setData(docData) { error in
                        if let error = error {
                            print("Error writing document: \(error)")
                        } else {
                            print("Document successfully written!")
                        }
                    }
    }
    
    func updateRestaurant(date: String, question: String, answer: String, rating: Int) {
            let db = Firestore.firestore()

            let docRef = db.collection("HistoryWrittenDocuments").document(question)


            docRef.setData(docData) { error in
                if let error = error {
                    print("Error writing document: \(error)")
                } else {
                    print("Document successfully written!")
                }
            }
    }
}
