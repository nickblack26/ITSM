//
//  ProfileButtonStyle.swift
//  ITSM
//
//  Created by Nick Black on 6/10/24.
//

import SwiftUI

struct ProfileButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background (.thinMaterial)
//            .hoverEffect(.highlight)
            .clipShape(.capsule)
//            .hoverEffect { effect, isActive, _ in
//                effect.scaleEffect(isActive ? 1.05 : 1.0)
//            }
        }
    }
    
#Preview {
    VStack {
        Button("", systemImage: "person.circle") {
            
        }
        .buttonStyle(ProfileButtonStyle())
    }
    .frame(
        minWidth: 50,
        minHeight: 50
    )
}
