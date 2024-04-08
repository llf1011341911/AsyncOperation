//
//  ViewController.swift
//  AsyncOperation
//
//  Created by oauth2 on 04/08/2024.
//  Copyright (c) 2024 oauth2. All rights reserved.
//

import UIKit
import AsyncOperation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        test()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 串行
    func test() {
        print("\(#function)")
        let que = AsyncBlockOperationQue(concurrentCount: 1)
        for i in 0..<20 {
            let op = AsyncBlockOperation(handleResult: true) { op in
                DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval.random(in: 0.0...0.5)) {
                    print("[多线程]---\(i)")
                    op.finished("\(i)")
                }
            }
            que.add(op)
        }
        que.excutedCallBack { results in
            print("[多线程]---全部执行完成:\(results)")
            self.test1()
        }
    }
    
    // 并行
    func test1() {
        print("\n")
        print("\(#function)")
        let que = AsyncBlockOperationQue(concurrentCount: 5)
        for i in 0..<20 {
            let op = AsyncBlockOperation { op in
                DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval.random(in: 0.0...0.5)) {
                    print("[多线程]---\(i)")
                    op.finished()
                }
            }
            que.add(op)
        }
        que.excutedCallBack { _ in
            print("[多线程]---全部执行完成")
            self.test2()
        }
    }
    
    // 并行执行，返回有序结果
    func test2() {
        print("\n")
        print("\(#function)")
        let que = AsyncBlockOperationQue(concurrentCount: 5)
        for i in 0..<20 {
            let op = AsyncBlockOperation(handleResult: true) { op in
                DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval.random(in: 0.0...0.5)) {
                    print("[多线程]---\(i)")
                    op.finished("\(i)")
                }
            }
            que.add(op)
        }
        que.excutedCallBack { results in
            print("[多线程]---全部执行完成:\(results)")
        }
    }

}

