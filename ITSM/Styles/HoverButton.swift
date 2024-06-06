import SwiftUI

struct HoverButton: ButtonStyle {
    @State private var isHovering: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
        }
        .foregroundStyle(.textMuted)
        .padding(4)
        .background(.secondary.opacity(isHovering ? 0.25 : 0.0))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .onHover(perform: { hovering in
            withAnimation(.snappy(duration: 0.2)) {
                isHovering = hovering
            }
        })
    }
}

#Preview {
    Button("Testing") {
        
    }
    .buttonStyle(HoverButton())
}
