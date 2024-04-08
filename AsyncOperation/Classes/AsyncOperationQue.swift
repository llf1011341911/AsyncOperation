//
//  AsyncOperationManager.swift
//  TestDemo
//
//  Created by edc on 2024/4/8.
//

import Foundation

public class AsyncBlockOperationQue {
        
    private var queue: OperationQueue
    private var identifiers = [String]()
    private var result: [String: Any] = [:]
    
    public init(concurrentCount: Int) {
        self.queue = OperationQueue()
        self.queue.maxConcurrentOperationCount = concurrentCount
    }
    
    public func add(_ op: AsyncBlockOperation) {
        if op.handleResult {
            self.identifiers.append(op.identifier)
            op.excuted = { id, result in
                self.result[id] = result
            }
        }
        self.queue.addOperation(op)
    }

    public func excutedCallBack(compltion: @escaping (Any) -> ()) {
        self.queue.addBarrierBlock {
            var results = [Any?]()
            for (_, item) in self.identifiers.enumerated() {
                results.append(self.result[item])
            }
            compltion(results.compactMap({ $0 }))
        }
    }
}
