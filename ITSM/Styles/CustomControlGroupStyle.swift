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
    }
}

#Preview {
    ControlGroup(content: {
        Text("Content")
    })
    .controlGroupStyle(CustomControlGroupStyle())
}
