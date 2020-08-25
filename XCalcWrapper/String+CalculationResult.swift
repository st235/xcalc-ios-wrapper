import Foundation

internal extension String {
    
    private static let errorRegexp = try? NSRegularExpression(pattern: "error\\((\\d*)\\).*", options: [])
    
    func toCalculationResult() -> CalculationResult {
        let range = NSMakeRange(0, self.utf16.count)
        let optionalMatches = String.errorRegexp?.matches(in: self, options: [], range: range)
        
        guard let matches = optionalMatches, !matches.isEmpty else {
            return CalculationResult.ok(self)
        }
        
        let errorCode = (self as NSString).substring(with: matches[0].range(at: 1))
        let optionalError = Int(errorCode)?.toCalculationError()
        
        guard let error = optionalError else {
            return CalculationResult.error(.syntaxError)
        }
        
        
        return CalculationResult.error(error)
    }
    
}
