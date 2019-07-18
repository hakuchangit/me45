//
//  ViewController.swift
//  me3
//
//  Created by 木内泉美 on 2019/02/02.
//  Copyright © 2019 木内泉美. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var todos:[Todo] = []//型はエンティティ?
    
    @IBOutlet weak var deleteBtn: UIBarButtonItem!
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var tableView: UITableView!
  
    
    
 //   var fetchedArray: [NSManagedObject] = []
    
    //データの取得
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self as? UITableViewDataSource
        
        
       
       
       /* guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        */
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Todo")
        do {
            todos = try context.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as! [Todo]
            refreshTableView()
        } catch {
            print("failed fetch")
        }
    }
    
    func refreshTableView(){
        tableView.reloadData()
    }
    
    
    @IBAction func addBtn(_ sender: Any) {
       /* let alert = UIAlertController(title: "Add", message: "何か投稿してください" , preferredStyle: .alert)
        
        let submitAction = UIAlertAction(title: "Add", style: .default, handler: {(action) -> Void in
            let textField = alert.textFields![0]
            let todo = Todo(context: self.context)
            todo.title = textField.text
            self.todos.append(todo)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            self.refreshTableView()
        })
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addTextField {(textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.autocorrectionType = .default
            textField.placeholder = "Type something here"
            textField.clearButtonMode = .whileEditing
        }
        alert.addAction(submitAction)
        alert.addAction(cancel)
        self.present(alert,animated: true, completion: nil)*/
        
    }
        }
    
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let todo = todos[indexPath.row]
            context.delete(todo)
            todos.remove(at: indexPath.row)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    refreshTableView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ppmemo = todos[indexPath.row].title
       // context.delete(todos[indexPath.row])
        performSegue(withIdentifier: "pastmemo", sender: ppmemo)
    }
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        if segue.identifier == "pastmemo" {
            let PastmemoViewController = segue.destination as! PastmemoViewController
            PastmemoViewController.ppmemo = sender as? String
        }
        
        
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let todo = todos[indexPath.row]
        if let title = todo.title{
            cell.textLabel?.text = title
        }
        cell.textLabel?.font = UIFont.systemFont(ofSize: 35)
        return cell
    }
    
    
}
    //データの書き込み
    /*
    var people: [NSManagedObject] = []
    func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName:"photo",in: managedContext)!
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        person.setValue(name, forKeyPath:"title")
        do{
            try managedContext.save()
            people.append(person)
        }catch let error as NSError {
            print("couldn not save \(error),\(error.userInfo)")
            
        }
    }
 */


