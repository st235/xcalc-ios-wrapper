import Foundation

internal extension Int {
    
    func toCalculationError() -> CalculationError {
        switch self {
        case 0:
            return .divideByZero
        case 1:
            return .constNotFound
        case 2:
            return .functionNotFound
        case 3:
            return .arithmeticError
        case 4:
            return .noSuchOperator
        case 5:
            return .syntaxError
        default:
            return .syntaxError
        }
    }
    
}
