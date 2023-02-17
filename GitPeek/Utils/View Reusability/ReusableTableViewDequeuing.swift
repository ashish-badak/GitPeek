//
//  ReusableTableViewDequeuing.swift
//  GitPeek
//
//  Created by Ashish Badak on 18/02/23.
//

import UIKit

extension UITableView {
    func register<Cell: UITableViewCell>(_ type: Cell.Type) {
        self.register(Cell.self, forCellReuseIdentifier: Cell.reuseId)
    }
    
    func dequeue<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: Cell.reuseId, for: indexPath) as? Cell
            else {
                fatalError("Failed to dequeue cell with reuseIdentifier: \(Cell.reuseId)")
        }
        
        return cell
    }
}
