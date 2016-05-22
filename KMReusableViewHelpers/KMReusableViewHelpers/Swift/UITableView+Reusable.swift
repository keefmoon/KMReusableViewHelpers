//
//  UITableView+Reusable.swift
//  KMReusableViewHelpers
//
//  Created by Keith Moon on 13/03/2016.
//  MIT Licence
//

import UIKit

public extension UITableView {
    
    public func register<T: ReuseRegisterable where T: UITableViewCell>(cellType: T.Type) {
        registerNib(cellType.nib(), forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    public func register<T: ReuseRegisterable where T: UITableViewHeaderFooterView>(headerFooterType: T.Type) {
        registerNib(headerFooterType.nib(), forHeaderFooterViewReuseIdentifier: headerFooterType.reuseIdentifier)
    }
    
    public func dequeue<T: Reusable where T: UITableViewCell>(cellType: T.Type, forIndexPath indexPath: NSIndexPath) -> T {
        return dequeueReusableCellWithIdentifier(cellType.reuseIdentifier, forIndexPath: indexPath) as! T
    }
    
    public func dequeue<T: Reusable where T: UITableViewHeaderFooterView>(headerFooterType: T.Type) -> T {
        return dequeueReusableHeaderFooterViewWithIdentifier(headerFooterType.reuseIdentifier) as! T
    }
}
