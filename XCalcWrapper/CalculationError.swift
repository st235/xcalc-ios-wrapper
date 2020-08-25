import Foundation

public enum CalculationError: Int {
    case divideByZero = 0
    case constNotFound = 1
    case functionNotFound = 2
    case arithmeticError = 3
    case noSuchOperator = 4
    case syntaxError = 5
}
