import SwiftUI
import RealmSwift

struct BlockEditorView: View {
    @Environment(\.isPreview) var isPreview
    @ObservedResults(Block.self) var blocks
    var previewBlocks = Block.blockArray
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                if isPreview {
                  ForEach(previewBlocks) { block in
                      Text(block.content ?? "")
                  }
               } else {
                  ForEach(blocks) { block in
                      
                      Text(block.content ?? "")
                  }
                  .onDelete(perform: $blocks.remove)
               }
            }
        }
    }
}

#Preview {
    BlockEditorView()
}

extension Block {
    static let block1: Block = .init()
    static let block2: Block = .init()
    static let block3: Block = .init()
    static let block4: Block = .init()
    static let blockArray = [block1, block2, block3, block4]
}

public extension EnvironmentValues {
   var isPreview: Bool {
      #if DEBUG
      return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
      #else
      return false
      #endif
   }
}
