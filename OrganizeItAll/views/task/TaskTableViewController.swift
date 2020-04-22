//
//  OrganizeTableViewController.swift
//  OrganizeItAll
//
//  Created by MOYA RICHARDS on 3/8/20.
//  Copyright © 2020 MOYA RICHARDS. All rights reserved.
//



import UIKit
import CoreData

class TaskTableViewController: UITableViewController {

    
 
    var resultsController: NSFetchedResultsController<Task>!
    let coreDataStack = CoreDataStack()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Request
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        let sortDescriptors = NSSortDescriptor(key: "modified_date", ascending: false)
        
        // Setup sorting
        request.sortDescriptors = [sortDescriptors]
        request.fetchBatchSize = 20
        
        resultsController = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: coreDataStack.managedContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        resultsController.delegate = self
        
        // Fetch data
        do {
            try resultsController.performFetch()
        } catch {
            print("Fetch error: \(error)")
        }
    }

    // MARK: - Table view data source
    /**
    https://www.hackingwithswift.com/read/38/10/optimizing-core-data-performance-using-nsfetchedresultscontroller
     */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsController.sections?[section].numberOfObjects ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tasktbcell", for: indexPath) as! TaskTableViewCell

        // Configure the cell...
        return configureTableCell(cell:cell,at: indexPath)
    }
    
    /**
     Displays the task data in the table cell
     */
    func configureTableCell(cell : TaskTableViewCell, at indexPath: IndexPath) -> TaskTableViewCell {
        let task = resultsController.object(at: indexPath)
        
        //2d Quartz graphics (IOS core graphics)
        cell.drawCircle()
        
        cell.lblText?.text = task.title
        
        
        if task.isComplete == true {
            cell.contentView.backgroundColor = UIColor(red: 234.0/255.0, green: 141.0/255.0,blue: 138.0/255.0, alpha: 1)
            cell.tintColor =  UIColor(red: 226.0/255.0, green: 185.0/255.0,blue: 199.0/255.0, alpha: 1.0)
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        cell.layer.backgroundColor =  UIColor(red: 204.0/255.0, green: 204.0/255.0,blue: 204.0/255.0, alpha: 0).cgColor
        return cell
    }
    
    // MARK: - Table view delegate
    
    //swipe direction: left
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            
            
            let task = self.resultsController.object(at: indexPath)
            self.resultsController.managedObjectContext.delete(task)
            do {
                try self.resultsController.managedObjectContext.save()
                completion(true)
            } catch {
                print("trailing swipe failed - delete: \(error)")
                completion(false)
            }
        }
        action.image = #imageLiteral(resourceName: "trash")
        action.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    //swipe direction: right
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Complete") { (action, view, completion) in
            
            
            let task = self.resultsController.object(at: indexPath)
            task.isComplete = true
           
            do {
                try self.resultsController.managedObjectContext.save()
                completion(true)
            } catch {
                print("leading swipe failed - complete: \(error)")
                completion(false)
            }
        }
        action.image = #imageLiteral(resourceName: "check")
        action.backgroundColor = .green
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    
    // MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showAddTask", sender: tableView.cellForRow(at: indexPath))
    }
    

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //new task
        if let _ = sender as? UIBarButtonItem, let vc = segue.destination as? CreateTaskViewController {
            vc.managedContext = resultsController.managedObjectContext
        }
        
        //modify existing task
        if let cell = sender as? UITableViewCell, let vc = segue.destination as? CreateTaskViewController {
            vc.managedContext = resultsController.managedObjectContext
            if let indexPath = tableView.indexPath(for: cell) {
                let task = resultsController.object(at: indexPath)
                vc.task = task
                
                //add view to back button if view is not being presented modally
                    //self.navigationController?.pushViewController(vc, animated: true)
            }
        }
     }
}

extension TaskTableViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
        tableView.reloadData()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
       switch type {
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .automatic)
                
                
                let task = resultsController.object(at: indexPath)
                print("---- inserting \(task.title)")
            }
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        case .update:
            if let indexPath = indexPath, let cell = tableView.cellForRow(at: indexPath)  as! TaskTableViewCell? {
                let task = resultsController.object(at: indexPath)
            
                // Configure the cell...
                configureTableCell(cell:cell,at: indexPath)
                
                print("---- updating \(task.title)")
            }
        default:
            break
        }
    }
}
