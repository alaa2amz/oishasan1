//
//  EventsViewController.swift
//  idap
//
//  Created by A on 12/3/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {
    
    
   
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var menue : UIView!
    var backView : UIView!
    var tapToHideMenue : UITapGestureRecognizer!
    var rightSwipe : UISwipeGestureRecognizer!
    
    var shown = false
    @objc func hideMenue(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.menue?.frame.origin.x = -200
            
        })
        backView.removeFromSuperview()
        shown = false
        
    }
    @objc func showMenue(_ sender: Any) {
        if !shown {
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.view.insertSubview(self.backView, belowSubview: self.menue)
                self.menue?.frame = CGRect(x: 0, y: 0, width: 200, height: self.view.frame.height)
                
                
            })
            
            
            shown = true
        }
        
    }
    @IBAction func menueButton(_ sender: Any) {
        
        
        if !shown {
    
            UIView.animate(withDuration: 0.5, animations: {
              
                self.view.insertSubview(self.backView, belowSubview: self.menue)
              self.menue?.frame = CGRect(x: 0, y: 0, width: 200, height: self.view.frame.height)
                
            
        })
          
       
            shown = true
        }else{
          
            UIView.animate(withDuration: 0.5, animations: {
                self.backView.removeFromSuperview()
                self.menue?.frame.origin.x = -200
            
              })
            
            shown = false
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //menu
        menue = appDelegate.getMenueView()
        //menue!.frame.height = self.view.frame.height
         self.view.addSubview(menue!)
        //self.menue?.frame = CGRect(x: -200, y: 0, width: 200, height: self.view.frame.height)
        backView = UIView(frame: self.view.frame)
        backView.backgroundColor = UIColor.gray
        backView.isUserInteractionEnabled = true
       
        
        tapToHideMenue = UITapGestureRecognizer(target: self, action: #selector(EventsViewController.hideMenue(_:)))
       
        rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(EventsViewController.showMenue(_:)))
        
        rightSwipe.direction = .right
        backView.addGestureRecognizer(tapToHideMenue)
        self.view.addGestureRecognizer(rightSwipe)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
