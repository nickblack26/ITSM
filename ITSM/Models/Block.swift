import Foundation
import RealmSwift

class Block: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId = .init()
    @Persisted var type: String = BlockType.paragraph.rawValue
    @Persisted var content: String?
    @Persisted var styledContent: List<InlineContent>
    @Persisted var children: List<Block>
    
    private enum BlockType: String, CaseIterable {
        case paragraph, heading, bulletedList, numberedList, image, table
    }
}

class DefaultProperties: EmbeddedObject {
    @Persisted var type: String = "default"
    @Persisted var textColor: String = "default";
    @Persisted var textAlignment: String = TextAlignment.left.rawValue;
    
    private enum TextAlignment: String, CaseIterable {
        case left, center, right
    }
}

class InlineContent: EmbeddedObject {
    @Persisted var styledText: StyledText?
    @Persisted var link: LinkText?
}

class StyledText: EmbeddedObject {
    @Persisted var type: String = "text"
    @Persisted var text: String = "default"
    @Persisted var styles: List<Style>
}

class LinkText: EmbeddedObject {
    @Persisted var styledText: String = "default"
    @Persisted var link: String = "default"
}

class Style: EmbeddedObject {
    @Persisted var bold: Bool;
    @Persisted var italic: Bool;
    @Persisted var underline: Bool;
    @Persisted var strikethrough: Bool;
    @Persisted var textColor: String;
    @Persisted var backgroundColor: String?;
};
