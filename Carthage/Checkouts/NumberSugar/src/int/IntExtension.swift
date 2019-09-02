import Foundation
/**
 * Don't add Int.init code that auto casts. like: let i: Int = 40.5//40 via ExpressibleByFloatLiteral and FloatLiteralType. It will accidentally break I.E Animator.swift
 */
extension Int {
    public var cgFloat: CGFloat { return CGFloat(self) }/*Convenince*/
    public var float: Float { return Float(self) }/*Convenince*/
    public var string: String { return String(self) }/*Convenince*/
    public var double: Double { return Double(self) }/*Convenince*/
    public var uint32: UInt32 { return UInt32(self) }/*Convenince*/
    public func minMax(_ min: Int, _ max: Int) -> Int { return NumberParser.minMax(self, min, max) }/*Convenince*/
    public func clip(_ min: Int, _ max: Int) -> Int { return NumberParser.clip(self, min, max) }/*Convenince*/
    public var negative: Bool { return NumberAsserter.negative(self, 0) }
    public var positive: Bool { return NumberAsserter.positive(self, 0) }
}
