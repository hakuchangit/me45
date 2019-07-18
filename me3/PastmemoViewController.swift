//
//  PastmemoViewController.swift
//  me3
//
//  Created by 木内泉美 on 2019/02/03.
//  Copyright © 2019 木内泉美. All rights reserved.
//

import UIKit
import AVFoundation

class PastmemoViewController: UIViewController {

    var speak:AVSpeechSynthesizer = AVSpeechSynthesizer()
    var ppmemo: String!
    var fsize:Int! = 80
    @IBOutlet weak var textView: UITextView!
    var todos : [Todo] = []
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = ppmemo
        print(ppmemo)
        // Do any additional setup after loading the view.
        textView.font = UIFont.systemFont(ofSize: CGFloat(self.fsize))
       
    }
    
    
    let save = UIImage(named: "save")
    let hakushi = UIImage(named: "hakushi")
    @IBOutlet weak var newoutlet: UIButton!
   
   
    
   
  
    
    
    @IBAction func ttaudio(_ sender: Any) {
        
        let content = AVSpeechUtterance(string: self.textView.text!)
        content.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        self.speak.speak(content)
        //textViewShouldReturn(textView)
        
        
    }
    
    
    
    
    @IBAction func newtext(_ sender: Any) {
        textView.text = " "
       
    }
    
    @IBAction func pastsaveBtn(_ sender: Any) {
        if textView.text.count != 0{
            let newtext = textView.text
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

    @IBAction func fontzoom(_ sender: Any) {
        if self.fsize >= 150 {
            self.fsize = 150
        } else {
            self.fsize = self.fsize + 5
            textView.font = UIFont.systemFont(ofSize: CGFloat(self.fsize))
        }
        
    }
    
    @IBAction func fontout(_ sender: Any) {
        if self.fsize <= 20 {
            self.fsize = 20
        } else {
            self.fsize = self.fsize - 5
            textView.font = UIFont.systemFont(ofSize: CGFloat(self.fsize))
        }
        
    }
    
    
    
}
