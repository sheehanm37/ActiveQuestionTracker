//
//  SummaryPageViewController.swift
//  ActiveQuestionTracker
//
//  Created by Nicholas Sheehan on 9/30/15.
//  Copyright (c) 2015 Nicholas Sheehan. All rights reserved.
//

import CoreData
import UIKit

class SummaryPageViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    
    
    //Mark: Outlets and Variables
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var questionList = [NSManagedObject]()
    var names = [String]()
    
    //Mark: LifeCycle Methods
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        questionTextField.hidden = true
        //Get the managed object context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        //Get the specific entity from the managed object
        let fetchRequest = NSFetchRequest(entityName:"Question")
        
        var error: NSError?
        //Fetch core data
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest,
            error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults {
            questionList = results
        } else {
            println("Could not fetch: \(error)")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Add observer for keyboard
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil)
        self.questionTextField.delegate = self
        
        //register the table
        let cellIdentifier = "Cell"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100.0
        
    }
    
    //Mark: UITableViewDataSource
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return names.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell =
            tableView.dequeueReusableCellWithIdentifier("Cell")
                as! UITableViewCell
            let row = indexPath.row
            cell.textLabel?.text = names[indexPath.row]
            cell.textLabel?.textColor = UIColor.whiteColor()
            
            return cell
    }
    
    //Mark: UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        println(names[row])
    }
    
    
    //Mark: Private Class Methods
    
    private func saveQuestion() {
        //remove leading and trailing space from entry and format entry before sending to core data
        var questionText = questionTextField.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        questionText = "Did I do my best to \(questionText)?"
        
        self.names.append(questionText)
        self.tableView.reloadData()
        
        
        
        saveQuestionToCoreData(questionText)
        questionTextField.text = ""
    }
    
    
    private func saveQuestionToCoreData (question: String) {
        //Get the managed object context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        //Get the proper entity from core data
        let entity =  NSEntityDescription.entityForName("Question", inManagedObjectContext: managedContext)
        let newQuestion = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        //3
        newQuestion.setValue(question, forKey: "question")
        
        //4
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        //5
        questionList.append(newQuestion)
    }
    
    
    //Mark: IBActions
    @IBAction func addQuestionTapped(sender: AnyObject) {
        questionTextField.becomeFirstResponder()
        questionTextField.hidden = false
    }
    
    //Mark: Textfield Methods
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 260
    }
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 260
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        saveQuestion()
        questionTextField.hidden = true
        self.view.endEditing(true)
        return false
    }
}
