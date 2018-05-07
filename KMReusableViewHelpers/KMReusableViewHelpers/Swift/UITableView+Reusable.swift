//
//  UITableView+Reusable.swift
//  KMReusableViewHelpers
//
//  Created by Keith Moon on 13/03/2016.
//  MIT Licence
//

import UIKit

public extension UITableView {
    
    public func register<T: ReuseRegisterable>(cellType: T.Type) where T: UITableViewCell {
        register(cellType.nib(), forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    public func register<T: ReuseRegisterable>(headerFooterType: T.Type) where T: UITableViewHeaderFooterView {
        register(headerFooterType.nib(), forHeaderFooterViewReuseIdentifier: headerFooterType.reuseIdentifier)
    }
    
    public func dequeue<T: Reusable>(cellType: T.Type, forIndexPath indexPath: IndexPath) -> T where T: UITableViewCell {
        return dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath as IndexPath) as! T
    }
    
    public func dequeue<T: Reusable>(headerFooterType: T.Type) -> T where T: UITableViewHeaderFooterView {
        return dequeueReusableHeaderFooterView(withIdentifier: headerFooterType.reuseIdentifier) as! T
    }
}
