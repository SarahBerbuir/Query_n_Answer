//
//  ContentView.swift
//  FirebaseAuthTryout
//
//  Created by Sarah Berbuir on 05.10.22.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State var email = ""
    @State var password = ""
    @State var isSignedIn = false
    @State var isLoginMode = true
    @State var statusMessage = ""

    
    var body: some View {
        NavigationView{
            ScrollView{
                
                VStack {
                    Picker(selection: $isLoginMode, label: Text("Picker here")) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    
                    //if !isLoginMode {
                        Button {
                            
                        } label: {
                            Image(systemName: "person.fill")
                                .font(.system(size: 64))
                                .padding()
                                .foregroundColor(.brown)
                        }
                    //}
                    
                    VStack {
                        Group {
                            TextField("Email", text: $email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                
                            SecureField("Password", text: $password)
                                
                       }
                        .padding(12)
                        .background(Color.white)
                        

                        Button(action: {
                            isLoginMode ? signIn(email: email, password: password) : createAccount(email: email, password: password)
                        }, label: {
                            HStack {
                                Spacer()
                                Text(isLoginMode ? "Log In" : "Create Account")
                                    .foregroundColor(.brown)
                                    .padding(.vertical, 10)
                                    .font(.system(size: 14, weight: .semibold))
                                Spacer()
                            }.background(Color.init(red: 0.0, green: 100.0, blue: 255.0, opacity: 0.2))
                            .frame(width: 200, height: 50)
                            .cornerRadius(12)
                        })
                        Text(statusMessage)
                            .foregroundColor(.red)
                            .font(.system(size: 11))
                    }
                    .padding()
                    
                    Spacer()
                    NavigationLink("", destination: TabHandling(), isActive: $isSignedIn)
                }
            
            }.navigationTitle(isLoginMode ? "Log in" : "Create Account")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    
    func signIn(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                statusMessage = "Failed to sign in"
            } else {
                print("success")
                isSignedIn = true
                statusMessage = " "
            }
        }
    }
    
    func createAccount(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                statusMessage = "Failed to create account"
            } else {
                print("success")
                isSignedIn = true
                statusMessage = " "
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



