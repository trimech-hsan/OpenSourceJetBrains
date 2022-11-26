//
//  UITableViewExtension.swift
//  OpenSourceJetBrainsProject
//
//  Created by Trimeche Hassen on 26/11/2022.
//

import UIKit

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reusable {}
extension UITableViewHeaderFooterView: Reusable {}
extension UICollectionViewCell: Reusable {}

extension UITableView {

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    func dequeueReusableHeaderFooter<T: Reusable>() -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T
    }
    
    func registerReusable<T: UITableViewCell>(_: T.Type) where T: Nibable {
        register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerCell<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: T.self))
    }
    
    func registerReusableHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type) where T: Nibable {
        register(T.nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
}
