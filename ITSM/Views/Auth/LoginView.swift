//
//  LoginView.swift
//  ITSM
//
//  Created by Nick Black on 6/4/24.
//

import SwiftUI
import RealmSwift

struct LoginView: View {
    @ObservedObject var app: RealmSwift.App
    @State private var email: String = "nblack@velomethod.com"
    @State private var password: String = "Bl@ck1998!"
    @State private var error: String = ""
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
            
            SecureField("Password", text: $password)
            
            NavigationLink("Don't have an account? Sign up.") {
                SignupView(app: app)
            }
            
            Text(error)
        }
        .onSubmit {
            Task {
                do {
                    _ = try await app.login(credentials: .emailPassword(
                        email: email,
                        password: password
                    ))
                } catch {
                    self.error = "Failed to login: \(error.localizedDescription)"
                }
            }
        }
    }
}

#Preview {
    LoginView(app: .init(id: ""))
}
