//
//  Detail.swift
//  OwnCure
//
//  Created by Haidar Rais on 11/24/17.
//  Copyright © 2017 Haidar Rais. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Detail: UIViewController {
    @IBOutlet weak var namalabel: UILabel!
    @IBOutlet weak var penyebablabel: UILabel!
    @IBOutlet weak var deskripsilabel: UITextView!
    
    var passnama:String?
    var passpenyebab:String?
    var passdeskripsi:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        namalabel.text = passnama
        penyebablabel.text = passpenyebab
        deskripsilabel.text = passdeskripsi

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
