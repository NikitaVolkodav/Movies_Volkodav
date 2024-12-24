import Foundation

@propertyWrapper
class ObservableValue<T> {
    var value: T {
        didSet {
            observer?(value)
        }
    }
    
    var observer: ((T) -> Void)?
    
    init(wrappedValue: T) {
        self.value = wrappedValue
    }
    
    var wrappedValue: T {
        get { value }
        set { value = newValue }
    }
    
    var projectedValue: ObservableValue<T> {
        return self
    }
    
    func bind(observer: @escaping (T) -> Void) {
        self.observer = observer
        observer(value)
    }
}
