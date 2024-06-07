//
//  CustomControlGroupStyle.swift
//  ITSM
//
//  Created by Nick Black on 6/6/24.
//

import SwiftUI

struct CustomControlGroupStyle: ControlGroupStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        
        HStack {
            configuration.content
                .background()
        }
    }
}

#Preview {
    ControlGroup("Testing") {
        Text("Content")
        Text("Content")
    }
    .controlGroupStyle(CustomControlGroupStyle())
    .frame(width: 500, height: 500)
}
