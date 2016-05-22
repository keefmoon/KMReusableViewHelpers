//
//  UICollectionView+Reusable.swift
//  KMReusableViewHelpers
//
//  Created by Keith Moon on 22/05/2016.
//  Copyright © 2016 Data Ninjitsu. All rights reserved.
//

import UIKit

public enum SupplementaryViewKind {
    case Header
    case Footer
    case Custom(String)
    
    private var kindString: String {
        switch self {
        case .Header: return UICollectionElementKindSectionHeader
        case .Footer: return UICollectionElementKindSectionFooter
        case .Custom(let customKind): return customKind
        }
    }
}

public extension UICollectionView {
    
    public func register<T: ReuseRegisterable where T: UICollectionViewCell>(cellType: T.Type) {
        registerNib(cellType.nib(), forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    public func register<T: ReuseRegisterable where T: UICollectionReusableView>(cellType: T.Type, ofKind kind: SupplementaryViewKind) {
        registerNib(cellType.nib(), forSupplementaryViewOfKind: kind.kindString, withReuseIdentifier: cellType.reuseIdentifier)
    }
    
    public func dequeue<T: Reusable where T: UICollectionViewCell>(cellType: T.Type, forIndexPath indexPath: NSIndexPath) -> T {
        return dequeueReusableCellWithReuseIdentifier(cellType.reuseIdentifier, forIndexPath: indexPath) as! T
    }
    
    public func dequeue<T: Reusable where T: UICollectionReusableView>(cellType: T.Type, ofKind kind: SupplementaryViewKind, forIndexPath indexPath: NSIndexPath) -> T {
        return dequeueReusableSupplementaryViewOfKind(kind.kindString, withReuseIdentifier: cellType.reuseIdentifier, forIndexPath: indexPath) as! T
    }
}
