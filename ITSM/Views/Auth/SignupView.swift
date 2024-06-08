//
//  SignupView.swift
//  ITSM
//
//  Created by Nick Black on 6/4/24.
//

import SwiftUI
import RealmSwift

struct SignupView: View {
    @ObservedObject var app: RealmSwift.App
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordConfirmation: String = ""
    @State private var error: String = ""
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
            
            SecureField("Password", text: $password)
            
            SecureField("Password Confirmation", text: $passwordConfirmation)
            
            Button("Save") {
                guard password == passwordConfirmation else { return error = "Passwords don't match." }
                
                Task {
                    let client = app.emailPasswordAuth
                    do {
                        try await client.registerUser(email: email, password: password)
                    } catch {
                        self.error = "Failed to register: \(error.localizedDescription)"
                    }
                }
            }
            
            Text(error)
        }
        .onSubmit {
            guard password == passwordConfirmation else { return error = "Passwords don't match." }
            
            Task {
                let client = app.emailPasswordAuth
                do {
                    try await client.registerUser(email: email, password: password)
                } catch {
                    self.error = "Failed to register: \(error.localizedDescription)"
                }
            }
        }
    }
}

#Preview {
    SignupView(app: .init(id: ""))
}
