import Foundation

public final class XCalc {
    
    private let angleUnits: AngleUnits
    
    public init(angleUnits: AngleUnits) {
        self.angleUnits = angleUnits
    }

    public func evaluate(withInput input: String) -> String {
        return XCalcInternal.evaluate(withAngleMods: Int32(angleUnits.rawValue), andInput: input)
    }
    
}

