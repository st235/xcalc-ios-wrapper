#import <string>

#import "./XCalcInternal.h"

#import "../Headers/xcalc.h"
#import "../Headers/DegreeMode.h"

namespace  {

constexpr int RADS_VALUE = 0;
constexpr int DEG_VALUE = 1;

xcalc::DegreeMode IntToDegreeMode(int mode) {
    switch(mode) {
        case RADS_VALUE:
            return xcalc::DegreeMode::RADS;
        case DEG_VALUE:
            return xcalc::DegreeMode::DEG;
        default:
            return xcalc::DegreeMode::DEG;
    }
}

} // anonymous namespace

@implementation XCalcInternal

+ (NSString*) evaluateWithAngleMods: (int)angleMods andInput:(NSString*)input {
    std::string output = xcalc::evaluate(IntToDegreeMode(angleMods), std::string([input UTF8String]));
    return [NSString stringWithCString:output.c_str() encoding:[NSString defaultCStringEncoding]];
}

@end
