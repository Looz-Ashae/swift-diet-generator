//
//  DietViewController.swift
//  Cleverdiet
//
//  Created by Jose Luis Molina on 9/3/16.
//  Copyright © 2016 Jose Luis Molina. All rights reserved.
//

import UIKit

class DietViewController: UITableViewController {
    var diet : Diet = Diet()
    var sections = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateSections()
    }
    
    override func viewDidAppear(animated: Bool) {
        sections = [String]()
        calculateSections()
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! FoodTableViewCell
        let index = (self.diet.foods.count / self.sections.count) * indexPath.section + indexPath.row
        cell.title.text = "\(diet.foods[index].name) (\(diet.foods[index].servingInGrams)gr, \(diet.foods[index].caloriesPerServing)kcal)"
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.diet.foods.count / self.sections.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    private func calculateSections() {
        let sectionsNumber = (diet.foods.count > 15) ? 6 : 5
        for i in 1 ..< sectionsNumber {
            sections.append("Food \(i)")
        }
    }
}