//
//  Niblable.swift
//  OpenSourceJetBrainsProject
//
//  Created by Trimeche Hassen on 26/11/2022.
//

import UIKit

protocol Nibable {
    static var viewFromNib: Self { get }
    static var nib: UINib { get }
}

extension Nibable where Self: UIView {
    static var viewFromNib: Self {
        return nib.instantiate(withOwner: self, options: nil).first as! Self
    }
    
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
    
    static var reusableIdentifier: String {
        return String(describing: self)
    }
    
    fileprivate static var nibName: String {
        return String(describing: self)
    }
}
