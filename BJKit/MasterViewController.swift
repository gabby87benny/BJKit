//
//  MasterViewController.swift
//  BJKit
//
//  Created by Joseph Peter, Gabriel Benny Francis on 3/30/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import UIKit

class MasterViewController: BaseTableViewController {
    struct MasterItem {
        var title: String
        var subTitle: String
        var twoLevel: Bool
    }
    
    var masterItemsList = [
        MasterItem(title: "Activity Indicators", subTitle: "ActivityIndicatorViewController", twoLevel: false),
        MasterItem(title: "Alert Controller", subTitle: "AlertControllerViewController", twoLevel: false),
        MasterItem(title: "Buttons", subTitle: "ButtonViewController", twoLevel: false),
        MasterItem(title: "Date Picker", subTitle: "DatePickerController", twoLevel: false),
        MasterItem(title: "Image View", subTitle: "ImageViewController", twoLevel: false),
        MasterItem(title: "Page Control", subTitle: "PageControlViewController", twoLevel: false),
        MasterItem(title: "Picker View", subTitle: "PickerViewController", twoLevel: false),
        MasterItem(title: "Progress Views", subTitle: "ProgressViewController", twoLevel: false),
        MasterItem(title: "Search", subTitle: "SearchViewControllers", twoLevel: true),
        MasterItem(title: "Segmented Controls", subTitle: "SegmentedControlViewController", twoLevel: false),
        MasterItem(title: "Sliders", subTitle: "SliderViewController", twoLevel: false),
        MasterItem(title: "Stack Views", subTitle: "StackViewController", twoLevel: false),
        MasterItem(title: "Steppers", subTitle: "StepperViewController", twoLevel: false),
        MasterItem(title: "Switches", subTitle: "SwitchViewController", twoLevel: false),
        MasterItem(title: "Text Fields", subTitle: "TextFieldViewController", twoLevel: false),
        MasterItem(title: "Text View", subTitle: "TextViewController", twoLevel: false),
        MasterItem(title: "Toolbars", subTitle: "ToolbarViewControllers", twoLevel: true),
        MasterItem(title: "Web View", subTitle: "WebViewController", twoLevel: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func isTwoLevelCell(indexPath: IndexPath) -> Bool {
        var twoLevelCell = false
        twoLevelCell = masterItemsList[indexPath.row].twoLevel
        return twoLevelCell
    }
    
    override func configureCell(cell: UITableViewCell, indexPath: IndexPath) {
        let splitViewWantsToShowDetail = splitViewController?.traitCollection.horizontalSizeClass == .regular
        if splitViewWantsToShowDetail {
            if isTwoLevelCell(indexPath: indexPath) {
                cell.accessoryType = .disclosureIndicator
            }
        }
        else {
            if isTwoLevelCell(indexPath: indexPath) {
                cell.accessoryType = .disclosureIndicator
            }
            else {
                cell.accessoryType = .none
            }
        }
    }
}

//MARK: Table view data source
extension MasterViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return masterItemsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MasterCellIdentifier", for: indexPath)
        let masterItem = masterItemsList[indexPath.row]
        cell.textLabel?.text = masterItem.title
        cell.detailTextLabel?.text = masterItem.subTitle
        return cell
    }
}

//MARK: Table view delegate
extension MasterViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let masterItem = masterItemsList[indexPath.row]
        pushOrPresentStoryboard(storyboardName: masterItem.subTitle, cellIndexPath: indexPath)
    }
}
