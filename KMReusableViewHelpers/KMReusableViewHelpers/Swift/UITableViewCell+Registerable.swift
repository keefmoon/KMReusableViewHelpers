//
//  UITableViewCell+Registerable.swift
//  KMReusableViewHelpers
//
//  Created by Keith Moon on 13/03/2016.
//  MIT Licence
//

import UIKit

/// Protocol to declares that a reuse identifier is available.
/// The default implementation is that the reuseIdentifier matches the class name,
/// only situations other than this need to be explicitly declared.
protocol ReuseIdentifiable {
    
    static var reuseIdentifier: String { get }
}

/// Default implementation
/// reuseIdentifier matches the class name, only situations other than this need to be explicitly declared.
extension ReuseIdentifiable {
    
    static var reuseIdentifier: String {
        return String(self)
    }
}


/// Protocol that declares that enough information exists to provide simplified registration and dequeuing
/// via the UITableView extension below.
protocol TableViewRegisterable: NibLoadable, ReuseIdentifiable {
    
}

extension UITableView {
    
    func register<T: TableViewRegisterable where T: UITableViewCell>(cellType: T.Type) {
        registerNib(cellType.nib(), forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    func register<T: TableViewRegisterable where T: UITableViewHeaderFooterView>(headerFooterType: T.Type) {
        registerNib(headerFooterType.nib(), forHeaderFooterViewReuseIdentifier: headerFooterType.reuseIdentifier)
    }
    
    func dequeue<T: ReuseIdentifiable where T: UITableViewCell>(cellType: T.Type, forIndexPath indexPath: NSIndexPath) -> T {
        return dequeueReusableCellWithIdentifier(cellType.reuseIdentifier, forIndexPath: indexPath) as! T
    }
    
    func dequeue<T: ReuseIdentifiable where T: UITableViewHeaderFooterView>(headerFooterType: T.Type) -> T {
        return dequeueReusableHeaderFooterViewWithIdentifier(headerFooterType.reuseIdentifier) as! T
    }
}
