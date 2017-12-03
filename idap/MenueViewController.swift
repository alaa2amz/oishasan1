//
//  MenueViewController.swift
//  idap
//
//  Created by A on 12/3/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import UIKit

class MenueViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menueItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = menueItemsTable.dequeueReusableCell(withIdentifier: "item")
        cell?.textLabel?.text = menueItems[indexPath.row]
        return cell!
    }
    
    
    @IBOutlet weak var menueItemsTable: UITableView!
    
    var menueItems = ["Home","Events","Drugs & HCPs Tools","Patient Directory","Contact Us","Profile Settings","Log Out"]
    @IBOutlet weak var menueView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        menueItemsTable.delegate = self
        menueItemsTable.dataSource = self
        menueView.addSubview(menueItemsTable)
        

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
