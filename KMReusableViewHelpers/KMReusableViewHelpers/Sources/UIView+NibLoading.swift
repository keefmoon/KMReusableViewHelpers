//
//  UIView+NibLoading.swift
//  KMReusableViewHelpers
//
//  Created by Keith Moon on 06/11/2015.
//  MIT Licence
//

import UIKit

/// Protocol to help with loading a view from a Nib.
/// NOTE on implementing: Views that implement this must be declared final.
/// The default implementation is that the nibName matches the class name, 
/// only situations other than this need to be explicitly declared.
public protocol NibLoadable {
    
    /// Bundle that contains the nib
    static var bundle: Bundle { get }
    
    /// Nib name
    static var nibName: String { get }
    
    /// Load the nib
    static func nib() -> UINib
    
    /// Load view from associated nib
    /// - returns: The inflated view
    static func loadFromNib() -> Self
    
}

/// Default implementation
/// nibName matches the class name, only situations other than this need to be explicitly declared.
public extension NibLoadable {
    
    static var nibName: String {
        return String(describing: self)
    }
}

public extension NibLoadable where Self: UIView {
    
    static var bundle: Bundle {
        return Bundle(for: self)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.nibName, bundle: self.bundle)
    }
    
    static func loadFromNib() -> Self {
        return nib().instantiate(withOwner: self, options: nil).first as! Self
    }
}
