//
//  AsyncBlockOperation.swift
//  TestDemo
//
//  Created by edc on 2024/4/8.
//

import Foundation

public class AsyncBlockOperation: AsyncOperation {
    
    public typealias Closure = (AsyncBlockOperation) -> ()
    
    public typealias Excuted = (String, Any?) -> ()

    let closure: Closure
    
    public var excuted: Excuted?
    
    public var handleResult: Bool = false
    
    public init(handleResult: Bool = false, closure: @escaping Closure) {
        self.handleResult = handleResult
        self.closure = closure
    }

    public override func main() {
        guard !self.isCancelled else { return }
        self.state = .executing
        self.closure(self)
    }
    
    public func finished(_ result: Any? = nil) {
        if self.handleResult {
            self.excuted?(self.identifier, result)
        }
        self.state = .finished
    }
}
