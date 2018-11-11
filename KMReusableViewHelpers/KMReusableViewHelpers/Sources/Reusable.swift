//
//  Reusable.swift
//  KMReusableViewHelpers
//
//  Created by Keith Moon on 22/05/2016.
//  Copyright © 2016 Data Ninjitsu. All rights reserved.
//

/// Protocol to declares that something is reusable with a reuse identifier.
/// The default implementation is that the reuseIdentifier matches the class name,
/// only situations other than this need to be explicitly declared.
public protocol Reusable {
    
    static var reuseIdentifier: String { get }
}

/// Default implementation
/// reuseIdentifier matches the class name, only situations other than this need to be explicitly declared.
public extension Reusable {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

/// Protocol that declares that enough information exists to provide simplified registration and dequeuing
/// via the UITableView or UICollectionView extension.
public protocol ReuseRegisterable: NibLoadable, Reusable {
    
}
