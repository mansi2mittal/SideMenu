//
//  LeftSideMenuViewController.swift
//  SideMenu
//
//  Created by Appinventiv on 23/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class LeftSideMenuViewController: UIViewController {
    
    @IBOutlet weak var LeftSideTableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        LeftSideTableView.delegate = self
        LeftSideTableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension LeftSideMenuViewController : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeftMenuCellID") as! LeftMenuCell
        
        return cell
    }
    
}

class LeftMenuCell : UITableViewCell
{
    
    @IBOutlet weak var labelInCell: UILabel!
}
