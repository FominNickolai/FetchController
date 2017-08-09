//
//  ViewController.swift
//  FetchController
//
//  Created by Fomin Mykola on 8/9/17.
//  Copyright © 2017 Fomin Mykola. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    //MARK: - Properties
    fileprivate let teamCellIdentifier = "teamCellReuseIdentifier"
    var coreDataStack: CoreDataStack!
    var fetchedResultController: NSFetchedResultsController<Team>!
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest: NSFetchRequest<Team> = Team.fetchRequest()
        let sort = NSSortDescriptor(key: #keyPath(Team.teamName), ascending: true)
        fetchRequest.sortDescriptors = [sort]
        
        fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: coreDataStack.managedContext, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            try fetchedResultController.performFetch()
        } catch let error as NSError {
            print("Fetching error: \(error), \(error.userInfo)")
        }
    }
}

//MARK: - Internal
extension ViewController {
    func configure(cell: UITableViewCell, for indexPath: IndexPath) {
        guard let cell = cell as? TeamCell else { return }
        let team = fetchedResultController.object(at: indexPath)
        cell.flagImageView.image = UIImage(named: team.imageName!)
        cell.teamLabel.text = team.teamName
        cell.scoreLabel.text = "Wins: \(team.wins)"
    }
}

//MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let sections = fetchedResultController.sections else {
            return 0
        }
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionInfo = fetchedResultController.sections?[section] else {
            return 0
        }
        return sectionInfo.numberOfObjects
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: teamCellIdentifier, for: indexPath)
        configure(cell: cell, for: indexPath)
        return cell
    }
}

//MARK: - UItableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
























