import SwiftUI
import RealmSwift

struct TextFieldNodeView: View {
    @ObservedRealmObject var text: Block
    @State private var selection: TextSelection?
    
    var body: some View {
        TextField(
            "TextField",
            text: Binding(value: $text.content),
            selection: $selection
        )
        .textInputSuggestions {
            ForEach(["", "123"], id: \.self) {
                Text($0.capitalized)
                    .textInputCompletion($0)
            }
        }
    }
}

#Preview {
    TextFieldNodeView(text: .init())
}
