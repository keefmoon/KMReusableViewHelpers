//
//  UICollectionView+Reusable.swift
//  KMReusableViewHelpers
//
//  Created by Keith Moon on 22/05/2016.
//  Copyright © 2016 Data Ninjitsu. All rights reserved.
//

import UIKit

public enum SupplementaryViewKind {
    case header
    case footer
    case custom(String)
    
    fileprivate var kindString: String {
        switch self {
        case .header: return UICollectionView.elementKindSectionHeader
        case .footer: return UICollectionView.elementKindSectionFooter
        case .custom(let customKind): return customKind
        }
    }
}

public extension UICollectionView {
    
    public func register<T: ReuseRegisterable>(cellType: T.Type) where T: UICollectionViewCell {
        register(cellType.nib(), forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    public func register<T: ReuseRegisterable>(cellType: T.Type, ofKind kind: SupplementaryViewKind) where T: UICollectionReusableView {
        register(cellType.nib(), forSupplementaryViewOfKind: kind.kindString, withReuseIdentifier: cellType.reuseIdentifier)
    }
    
    public func dequeue<T: Reusable>(cellType: T.Type, forIndexPath indexPath: NSIndexPath) -> T where T: UICollectionViewCell {
        return dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath as IndexPath) as! T
    }
    
    public func dequeue<T: Reusable>(cellType: T.Type, ofKind kind: SupplementaryViewKind, forIndexPath indexPath: NSIndexPath) -> T where T: UICollectionReusableView {
        return dequeueReusableSupplementaryView(ofKind: kind.kindString, withReuseIdentifier: cellType.reuseIdentifier, for: indexPath as IndexPath) as! T
    }
}
