//
//  newmemoViewController.swift
//  me3
//
//  Created by 木内泉美 on 2019/02/03.
//  Copyright © 2019 木内泉美. All rights reserved.
//

import UIKit
import AVFoundation

class newmemoViewController: UIViewController {

    
    var speak:AVSpeechSynthesizer = AVSpeechSynthesizer()
    var fsize:Int! = 80
    var todos : [Todo] = []
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var tableView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 tableView.font = UIFont.systemFont(ofSize: CGFloat(self.fsize))        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func newsaveBtn(_ sender: Any) {
       // let newtext = textTable.text
        
        if tableView.text.count != 0{
         let newtext = tableView.text
        let todo = Todo(context: self.context)
        todo.title = newtext
        self.todos.append(todo)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    let bg = UIImage(named: "save")
    
    @IBOutlet weak var fontzoomb: UIButton!
    
    @IBAction func fontzoom(_ sender: Any) {
        
        
        if self.fsize >= 150 {
            self.fsize = 150
        } else {
            self.fsize = self.fsize + 5
            tableView.font = UIFont.systemFont(ofSize: CGFloat(self.fsize))
        }
        
    }
    
    @IBAction func fontout(_ sender: Any) {
        if self.fsize <= 20 {
            self.fsize = 20
        } else {
            self.fsize = self.fsize - 5
            tableView.font = UIFont.systemFont(ofSize: CGFloat(self.fsize))
        }
    }
    
    @IBAction func newtext(_ sender: Any) {
        tableView.text = " "
    }
    
    
    
    @IBAction func ttaudio(_ sender: Any) {
        
        let content = AVSpeechUtterance(string: self.tableView.text!)
        content.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        self.speak.speak(content)
        
        
    }
    
    
    
    
}
