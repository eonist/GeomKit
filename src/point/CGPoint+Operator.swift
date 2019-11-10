import Foundation
/**
 * Convenient operators
 */
public func +(a: CGPoint, b: CGPoint) -> CGPoint { return CGPointParser.add(a: a, b: b) } // Adds the coordinates of point p to the coordinates of this point to create a new point
public func -(a: CGPoint, b: CGPoint) -> CGPoint { return CGPointParser.substract(a: a, b: b) } // Subtracts the coordinates of point p from the coordinates of this point to create a new point.
public func +=( a: inout CGPoint, b: CGPoint) { a.x += b.x; a.y += b.y; } // Modifies a by adding b
public func -=( a: inout CGPoint, b: CGPoint) { a.x -= b.x; a.y -= b.y; } // Modifies a by substracting b
public func * (left: CGPoint, right: CGPoint) -> CGPoint {return CGPointParser.multiply(a: left, b: right)} // Multiplies two CGPoint values and returns the result as a new CGPoint.
public func *= ( left: inout CGPoint, right: CGPoint) { left = left * right} // Multiplies a CGPoint with another.
public func * (point: CGPoint, scalar: CGFloat) -> CGPoint { return CGPoint(x: point.x * scalar, y: point.y * scalar)}/*Multiplies the x and y fields of a CGPoint with the same scalar value and (returns the result as a new CGPoint.)*/
public func *= ( point: inout CGPoint, scalar: CGFloat) { point = point * scalar } // Multiplies the x and y fields of a CGPoint with the same scalar value.
public func / (left: CGPoint, right: CGPoint) -> CGPoint { return CGPointParser.divide(a: left, b: right) } // Divides two CGPoint values and returns the result as a new CGPoint.
public func /= ( left: inout CGPoint, right: CGPoint) { left = left / right } // Divides a CGPoint by another.
public func / (point: CGPoint, scalar: CGFloat) -> CGPoint { return CGPoint(x: point.x / scalar, y: point.y / scalar) } // Divides the x and y fields of a CGPoint by the same scalar value and returns (the result as a new CGPoint.)
public func /= ( point: inout CGPoint, scalar: CGFloat) { point = point / scalar } // Divides the x and y fields of a CGPoint by the same scalar value.
