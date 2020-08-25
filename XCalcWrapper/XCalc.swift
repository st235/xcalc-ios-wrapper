import Foundation

public final class XCalc {
    
    private var angleUnits: AngleUnits
    
    public init(angleUnits: AngleUnits) {
        self.angleUnits = angleUnits
    }
    
    public func getAngleUnits() -> AngleUnits {
        return self.angleUnits
    }
    
    public func change(angleUnits: AngleUnits) {
        self.angleUnits = angleUnits
    }

    public func evaluate(withInput input: String) -> CalculationResult {
        return XCalcInternal.evaluate(withAngleMods: Int32(angleUnits.rawValue), andInput: input)?.toCalculationResult() ?? CalculationResult.error(.syntaxError)
    }
 
    public func evaluateAsync(withInput input: String, andOnSuccess onSuccess: @escaping (String) -> Void, andOnError onError: @escaping (CalculationError) -> Void) {
        DispatchQueue.global(qos: .background).async {
            let result = self.evaluate(withInput: input)
            
            DispatchQueue.main.async {
                switch (result) {
                case .ok(let output):
                    onSuccess(output)
                case .error(let error):
                    onError(error)
                }
            }
        }
    }
}

