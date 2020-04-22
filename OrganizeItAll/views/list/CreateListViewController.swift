//
//  CreateItemViewController.swift
//  OrganizeItAll
//
//  Created by MOYA RICHARDS on 3/8/20.
//  Copyright © 2020 MOYA RICHARDS. All rights reserved.
//

import UIKit
import CoreData

class CreateListViewController: ScrollingKBHandlingViewController {
    
    @IBOutlet weak var lblHeader: UILabel!
    
    //MARK: - Segue data
    var managedContext: NSManagedObjectContext!
    
    var task: Task?
    
    //MARK: - Outlets
    @IBOutlet weak var btnSave: UIButton!
    
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tvDescription: UITextView!
    
    //Detail Input Bottom Contraint - matched the keyboard height
    @IBOutlet weak var constraintFromKyHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        
        tfTitle.becomeFirstResponder()
        
        
        if let task = task {
            tfTitle.text = task.title
            tvDescription.text = task.detail
            lblHeader.text = "Edit List"
        }else{
            lblHeader.text = "Create New List"
        }
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CreateListViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    //MARK: - Actions
    
    
    //https://stackoverflow.com/a/54100880
//    @objc func keyboardWillShow(notification: Notification) {
//
//        if let userInfo = notification.userInfo {
//            if let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//                constraintFromKyHeight.constant = keyboardSize.height + 10
//
//                UIView.animate(withDuration: 0.3){
//                    self.view.layoutIfNeeded()
//                }
//            }
//        }
//    }
    
    
    @IBAction func save(_ sender: UIButton) {
        guard let title = tfTitle.text, !title.isEmpty else {
            return
        }
        
        
        if let task = self.task {
            task.modified_date = Date()
            
            task.title = title
            
            task.isComplete = false
            
            if let descp = tvDescription.text{
                task.detail = descp
            }
            
        } else {
            let task = Task(context: managedContext)
            
            let dte = Date()
            task.created_date = dte
            task.modified_date = dte
            
            task.title = title
            task.isComplete = false
            
            if let descp = tvDescription.text{
                task.detail = descp
            }
        }
        do {
            try managedContext.save()
            dismiss(animated: true)
            tfTitle.resignFirstResponder()
        } catch {
            print("Error saving data: \(error)")
        }
    }
    
    @IBAction func cancelItem(_ sender: UIButton) {
        dismiss(animated: true)
        tvDescription.resignFirstResponder()
    }
}
