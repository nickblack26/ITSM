import SwiftUI

extension Binding where Value == Bool  {
    init<T>(value: Binding<T?>) {
        self.init {
            return value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        }
    }
}

extension Binding where Value == String  {
    init(value: Binding<String?>) {
        self.init {
            return value.wrappedValue ?? ""
        } set: { newValue in
            value.wrappedValue = newValue
        }
    }
}
