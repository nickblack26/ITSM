import SwiftUI
import Combine
import Cocoa

struct CustomTextField: NSViewRepresentable {
    class Coordinator: NSObject, NSTextFieldDelegate {
        var parent: CustomTextField
        
        init(parent: CustomTextField) {
            self.parent = parent
        }
        
        func controlTextDidChange(_ obj: Notification) {
            guard let textField = obj.object as? NSTextField else { return }
            parent.text = textField.stringValue
        }
        
        @objc func textFieldDidReceiveKeyEvent(_ sender: NSTextField) {
            if let event = NSApp.currentEvent {
                parent.onKeyPress(event)
            }
        }
    }
    
    @Binding var text: String
    var onKeyPress: (NSEvent) -> Void
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeNSView(context: Context) -> NSTextField {
        let textField = NSTextField(string: text)
        textField.delegate = context.coordinator
        textField.target = context.coordinator
        textField.action = #selector(Coordinator.textFieldDidReceiveKeyEvent(_:))
        return textField
    }
    
    func updateNSView(_ nsView: NSTextField, context: Context) {
        nsView.stringValue = text
    }
}


struct TextNode: View {
    @State private var text: String = "Heyyyyy"
    @State private var showCommandMenu: Bool = false
    
    var body: some View {
        TextField(
            "Text node",
            text: $text,
            prompt: Text("Type / for commands...")
        )
        .onKeyPress(keys: [.escape, "w", "q"]) { press in
            print("Received \(press.characters)")
            return .handled
        }
        .popover(isPresented: $showCommandMenu) {
            List {
                Button("Heading 1") {}
                Button("Heading 2") {}
                Button("Heading 3") {}
                
                Divider()
            }
        }
    }
}

#Preview {
    TextNode()
}
