
/// `ChainedError` a protocol which supports error chaining.
public protocol ChainedError: Swift.Error, CustomStringConvertible {
    
    /// Code of the error.
    var code: Int { get }
    
    /// Reason of the error.
    var reason: String { get }
    
    /// A related errow which led to the error.
    var thrownByError: ChainedError? { get }
}

public extension ChainedError {
    
    var description: String {
        get {
            func description(by error: ChainedError) -> String {
                
                let mirror = Mirror(reflecting: error)
                let type = String(reflecting: mirror.subjectType)
                let text = "\(type)(\(error.code), \(error.reason))"
                
                if let subErr = error.thrownByError  {
                    return description(by: subErr) + " -> \(text)"
                } else {
                    return text
                }
            }
            
            return description(by: self)
        }
    }
}
