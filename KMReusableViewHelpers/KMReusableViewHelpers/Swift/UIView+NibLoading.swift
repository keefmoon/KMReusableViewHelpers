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
protocol NibLoadable {
    
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
extension NibLoadable {
    
    static var nibName: String {
        return String(self)
    }
}

extension NibLoadable where Self: UIView {
    
    static func nib() -> UINib {
        return UINib(nibName: self.nibName, bundle: nil)
    }
    
    static func loadFromNib() -> Self {
        return nib().instantiateWithOwner(self, options: nil).first as! Self
    }
}
