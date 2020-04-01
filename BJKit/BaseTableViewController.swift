//
//  BaseTableViewController.swift
//  BJKit
//
//  Created by Joseph Peter, Gabriel Benny Francis on 3/30/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    var savedSelectionIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    //MARK: Utility functions
    
    func configureCell(cell: UITableViewCell, indexPath: IndexPath) {
        // For subclasses to override.
    }
    
    func splitViewWantsToShowDetail() -> Bool {
        return splitViewController?.traitCollection.horizontalSizeClass == .regular
    }
    
    func isTwoLevelCell(indexPath: IndexPath) -> Bool {
        return false
    }
    
    func pushOrPresentStoryboard(storyboardName: String, cellIndexPath: IndexPath) {
        let exampleStoryboard = UIStoryboard(name: storyboardName, bundle: nil)
        if let exampleViewController = exampleStoryboard.instantiateInitialViewController() {
            pushOrPresentViewController(viewController: exampleViewController, cellIndexPath: cellIndexPath)
        }
    }

    func pushOrPresentViewController(viewController: UIViewController, cellIndexPath: IndexPath) {
        if splitViewWantsToShowDetail() {
            if isTwoLevelCell(indexPath: cellIndexPath) {
                navigationController?.pushViewController(viewController, animated: true)
                tableView.deselectRow(at: cellIndexPath, animated: true)
            }
            else {
                let navVC = UINavigationController(rootViewController: viewController)
                splitViewController?.showDetailViewController(navVC, sender: navVC)
            }
        }
        else {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension BaseTableViewController {
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if splitViewWantsToShowDetail() {
            cell.accessoryType = .none
            if self.savedSelectionIndexPath != nil {
                self.tableView.selectRow(at: savedSelectionIndexPath, animated: true, scrollPosition: .none)
            }
        }
        else {
            cell.accessoryType = .disclosureIndicator
            tableView.deselectRow(at: indexPath, animated: true)
        }
        configureCell(cell: cell, indexPath: indexPath as IndexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension BaseTableViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if viewController == self {
            savedSelectionIndexPath = nil
        }
    }
}
