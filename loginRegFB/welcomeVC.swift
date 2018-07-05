//
//  welcomeVC.swift
//  loginRegFB
//
//  Created by Pawan Badsewal on 25/06/18.
//  Copyright © 2018 Pawan Badsewal. All rights reserved.
//

import UIKit
import FirebaseAuth

class welcomeVC: UIViewController {

    @IBOutlet var welcomelbl: UILabel!
    
    
    @IBAction func logOut(_ sender: Any) {
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "logOutSegue", sender: Any?.self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomelbl.text = Auth.auth().currentUser?.email
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
