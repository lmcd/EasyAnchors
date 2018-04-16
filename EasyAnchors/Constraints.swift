//
//  Constraints.swift
//  EasyAnchors
//
//  Created by Lee McDermott on 15/04/2018.
//

import Foundation
import UIKit

struct LayoutEdgeAnchors {
	fileprivate let top: NSLayoutYAxisAnchor
	fileprivate let left: NSLayoutXAxisAnchor
	fileprivate let bottom: NSLayoutYAxisAnchor
	fileprivate let right: NSLayoutXAxisAnchor
	
	@discardableResult
	static func ==(lhs: LayoutEdgeAnchors, rhs: LayoutEdgeAnchors) -> [NSLayoutConstraint] {
		let constraint1 = lhs.top == rhs.top
		let constraint2 = lhs.left == rhs.left
		let constraint3 = lhs.bottom == rhs.bottom
		let constraint4 = lhs.right == rhs.right
		
		return [constraint1, constraint2, constraint3, constraint4]
	}
}

struct LayoutCenterAnchors {
	fileprivate let x: NSLayoutXAxisAnchor
	fileprivate let y: NSLayoutYAxisAnchor
	
	@discardableResult
	static func ==(lhs: LayoutCenterAnchors, rhs: LayoutCenterAnchors) -> [NSLayoutConstraint] {
		let constraint1 = lhs.x == rhs.x
		let constraint2 = lhs.y == rhs.y
		
		return [constraint1, constraint2]
	}
}

// TODO: change name
struct EqualToYConstant {
	fileprivate let anchor: NSLayoutYAxisAnchor
	fileprivate let constant: CGFloat
}

// TODO: change name
struct EqualToXConstant {
	fileprivate let anchor: NSLayoutXAxisAnchor
	fileprivate let constant: CGFloat
}

// TODO: change name
struct DimensionMultiplied {
	fileprivate let anchor: NSLayoutDimension
	fileprivate let multiplier: CGFloat
	fileprivate let constant: CGFloat
}

extension NSLayoutConstraint {
	fileprivate var firstView: UIView? {
		return firstItem as? UIView
	}
	
	fileprivate var secondView: UIView? {
		return secondItem as? UIView
	}
}

extension UIView {
	var centerAnchors: LayoutCenterAnchors {
		return LayoutCenterAnchors(x: centerXAnchor, y: centerYAnchor)
	}
	
	var edgeAnchors: LayoutEdgeAnchors {
		return LayoutEdgeAnchors(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
	}
}

extension NSLayoutDimension {
	@discardableResult
	static func ==(lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
		let constraint = lhs.constraint(equalToConstant: rhs)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false
		
		return constraint
	}
	
	@discardableResult
	static func <=(lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
		let constraint = lhs.constraint(lessThanOrEqualToConstant: rhs)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false
		
		return constraint
	}
	
	@discardableResult
	static func >=(lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
		let constraint = lhs.constraint(greaterThanOrEqualToConstant: rhs)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false
		
		return constraint
	}
	
	@discardableResult
	static func ==(lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
		let constraint = lhs.constraint(equalTo: rhs)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false
		
		return constraint
	}

	@discardableResult
	static func <=(lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
		let constraint = lhs.constraint(lessThanOrEqualTo: rhs)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false
		
		return constraint
	}
	
	@discardableResult
	static func >=(lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
		let constraint = lhs.constraint(greaterThanOrEqualTo: rhs)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false
		
		return constraint
	}
	
	@discardableResult
	static func ==(lhs: NSLayoutDimension, rhs: DimensionMultiplied) -> NSLayoutConstraint {
		let constraint = lhs.constraint(equalTo: rhs.anchor, multiplier: rhs.multiplier, constant: rhs.constant)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false
		
		return constraint
	}
	
	@discardableResult
	static func <=(lhs: NSLayoutDimension, rhs: DimensionMultiplied) -> NSLayoutConstraint {
		let constraint = lhs.constraint(lessThanOrEqualTo: rhs.anchor, multiplier: rhs.multiplier, constant: rhs.constant)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false
		
		return constraint
	}
	
	@discardableResult
	static func >=(lhs: NSLayoutDimension, rhs: DimensionMultiplied) -> NSLayoutConstraint {
		let constraint = lhs.constraint(greaterThanOrEqualTo: rhs.anchor, multiplier: rhs.multiplier, constant: rhs.constant)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false
		
		return constraint
	}

	@discardableResult
	static func +(lhs: NSLayoutDimension, rhs: CGFloat) -> DimensionMultiplied {
		return DimensionMultiplied(anchor: lhs, multiplier: 1, constant: rhs)
	}
	
	@discardableResult
	static func -(lhs: NSLayoutDimension, rhs: CGFloat) -> DimensionMultiplied {
		return DimensionMultiplied(anchor: lhs, multiplier: 1, constant: -rhs)
	}
	
	@discardableResult
	static func *(lhs: NSLayoutDimension, rhs: CGFloat) -> DimensionMultiplied {
		return DimensionMultiplied(anchor: lhs, multiplier: rhs, constant: 0)
	}
}

extension DimensionMultiplied {
	@discardableResult
	static func *(lhs: DimensionMultiplied, rhs: CGFloat) -> DimensionMultiplied {
		return DimensionMultiplied(anchor: lhs.anchor, multiplier: rhs, constant: lhs.constant)
	}
}

extension NSLayoutXAxisAnchor {
	@discardableResult
	static func ==(lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
		let constraint = lhs.constraint(equalTo: rhs)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false
		
		return constraint
	}
	
	@discardableResult
	static func <=(lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
		let constraint = lhs.constraint(lessThanOrEqualTo: rhs)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false
		
		return constraint
	}
	
	@discardableResult
	static func >=(lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
		let constraint = lhs.constraint(greaterThanOrEqualTo: rhs)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false
		
		return constraint
	}
	
	@discardableResult
	static func ==(lhs: NSLayoutXAxisAnchor, rhs: EqualToXConstant) -> NSLayoutConstraint {
		let constraint = lhs.constraint(equalTo: rhs.anchor, constant: rhs.constant)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false
		
		return constraint
	}
	
	@discardableResult
	static func <=(lhs: NSLayoutXAxisAnchor, rhs: EqualToXConstant) -> NSLayoutConstraint {
		let constraint = lhs.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false
		
		return constraint
	}
	
	@discardableResult
	static func >=(lhs: NSLayoutXAxisAnchor, rhs: EqualToXConstant) -> NSLayoutConstraint {
		let constraint = lhs.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false
		
		return constraint
	}
	
	@discardableResult
	static func +(lhs: NSLayoutXAxisAnchor, rhs: CGFloat) -> EqualToXConstant {
		return EqualToXConstant(anchor: lhs, constant: rhs)
	}
	
	@discardableResult
	static func -(lhs: NSLayoutXAxisAnchor, rhs: CGFloat) -> EqualToXConstant {
		return EqualToXConstant(anchor: lhs, constant: -rhs)
	}
}

extension NSLayoutYAxisAnchor {
	@discardableResult
	static func ==(lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
		let constraint = lhs.constraint(equalTo: rhs)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false

		return constraint
	}
	
	@discardableResult
	static func <=(lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
		let constraint = lhs.constraint(lessThanOrEqualTo: rhs)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false
		
		return constraint
	}
	
	@discardableResult
	static func >=(lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
		let constraint = lhs.constraint(greaterThanOrEqualTo: rhs)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false
		
		return constraint
	}

	@discardableResult
	static func ==(lhs: NSLayoutYAxisAnchor, rhs: EqualToYConstant) -> NSLayoutConstraint {
		let constraint = lhs.constraint(equalTo: rhs.anchor, constant: rhs.constant)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false

		return constraint
	}
	
	@discardableResult
	static func <=(lhs: NSLayoutYAxisAnchor, rhs: EqualToYConstant) -> NSLayoutConstraint {
		let constraint = lhs.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false
		
		return constraint
	}
	
	@discardableResult
	static func >=(lhs: NSLayoutYAxisAnchor, rhs: EqualToYConstant) -> NSLayoutConstraint {
		let constraint = lhs.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant)
		constraint.isActive = true
		constraint.firstView?.translatesAutoresizingMaskIntoConstraints = false
		
		return constraint
	}

	@discardableResult
	static func +(lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> EqualToYConstant {
		return EqualToYConstant(anchor: lhs, constant: rhs)
	}

	@discardableResult
	static func -(lhs: NSLayoutYAxisAnchor, rhs: CGFloat) -> EqualToYConstant {
		return EqualToYConstant(anchor: lhs, constant: -rhs)
	}
}

