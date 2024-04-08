//
//  AsyncOperation.swift
//  TestDemo
//
//  Created by edc on 2024/4/8.
//

import Foundation

open class AsyncOperation: Operation {
    
    let identifier = UUID().uuidString
    
    open var state: State = .waiting {
        willSet {
            State.allCases.forEach { s in
                willChangeValue(forKey: s.rawValue)
            }
        }
        didSet {
            switch self.state {
            case .waiting:
                assert(oldValue == .waiting, "Invalid change from \(oldValue) to \(self.state)")
            case .ready:
                assert(oldValue == .waiting, "Invalid change from \(oldValue) to \(self.state)")
            case .executing:
                assert(
                    oldValue == .ready || oldValue == .waiting,
                    "Invalid change from \(oldValue) to \(self.state)"
                )
            case .finished:
                assert(oldValue != .cancelled, "Invalid change from \(oldValue) to \(self.state)")
            case .cancelled:
                break
            }
            
            State.allCases.forEach { s in
                didChangeValue(forKey: s.rawValue)
            }
        }
    }
    
    public enum State: String, CaseIterable {
        case waiting, ready, executing, finished, cancelled
    }
    
    open override var isReady: Bool {
        if self.state == .waiting {
            return super.isReady
        } else {
            return self.state == .ready
        }
    }
    
    open override var isExecuting: Bool {
        if self.state == .waiting {
            return super.isExecuting
        } else {
            return self.state == .executing
        }
    }
    
    open override var isFinished: Bool {
        if self.state == .waiting {
            return super.isFinished
        } else {
            return self.state == .finished
        }
    }
    
    open override var isCancelled: Bool {
        if self.state == .waiting {
            return super.isCancelled
        } else {
            return self.state == .cancelled
        }
    }
    
    open override var isAsynchronous: Bool {
        return true
    }
}
