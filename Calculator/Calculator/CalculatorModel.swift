//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Narayan Balasubramanian on 10/13/16.
//  Copyright © 2016 SJSU. All rights reserved.
//

import Foundation

func add(a : Double, b: Double) -> Double {
    return a+b
}

class CalculatorModel {
    private var accumalator = 0.0
    func setOperand(operand: Double) {
        accumalator = operand
        internalMemory.append(operand)
    }

    
    typealias PropertyList = AnyObject
    var internalMemory = [AnyObject]()

    
    var operations : Dictionary<String, Operation> = [
        "π": Operation.Constant(M_PI),
        "e": Operation.Constant(M_E),
        "√": Operation.UnaryOperator(sqrt),
        "➕": Operation.BinaryOperator(add),
        "➖": Operation.BinaryOperator({$0 - $1}),
        "=": Operation.Equals
    ]
    
    enum Operation {
        case Constant(Double)
        case UnaryOperator((Double) -> Double)
        case BinaryOperator((Double, Double) -> Double)
        case Equals
    }
    
    
    struct PendingOperation {
        var operation:((Double, Double) -> Double)
        var operand: Double
    }
    var pendingOperation : PendingOperation?
    
    func performOperation(operation: String) {
        internalMemory.append(operation)
        if let constant = operations[operation] {
            switch constant {
            case .Constant(let value): accumalator = value
            case .UnaryOperator(let foo): accumalator = foo(accumalator)
            case .BinaryOperator(let function):
                pendingOperation = PendingOperation( operation:function, operand: accumalator)
            case .Equals:
                if (pendingOperation != nil) {
                    accumalator = pendingOperation!.operation(pendingOperation!.operand, accumalator)
                    pendingOperation = nil
                }
                
            }
        }
    }
    
    var memory : AnyObject {
        get {
            return internalMemory
        }
        set {
            if let arrayOps = newValue as? [AnyObject] {
                for op in arrayOps {
                    if let oper = op as? Double {
                        // Dealing with operand
                        setOperand(oper)
                    }
                    if let oper = op as? String {
                        performOperation(oper)
                    }
                }
            }
            
        }
    }
    
    var result : Double {
        get {
            return accumalator
        }
    }
    
    
    
    
}
