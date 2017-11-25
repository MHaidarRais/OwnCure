//
//  Penyakit.swift
//  OwnCure
//
//  Created by Haidar Rais on 11/24/17.
//  Copyright © 2017 Haidar Rais. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


class Penyakit: UITableViewController {
    
    var penyakitselected:String?
    var latinselected:String?
    var deskripsiselected:String?

    var arrKategori = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //memanggil data json menggunakan alamofire
        Alamofire.request("http://localhost/OwnCure/index.php/api/getpenyakit").responseJSON{ (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["data"].arrayObject {
                    self.arrKategori = resData as! [[String:String]]
                }
                if self.arrKategori.count > 0 {
                    self.tableView.reloadData()
                }
            }
            else{
                
                print("error server")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrKategori.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        var serverid = arrKategori[indexPath.row]
        
        var nama_penyakit = serverid["nama_penyakit"]
        var latin_penyakit = serverid["latin_penyakit"]
        
        cell.labelpenyebab.text = nama_penyakit
        cell.labelpenyakit.text = latin_penyakit
       
        
        
        
        
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Row \(indexPath.row)selected")
        
        let task = arrKategori[indexPath.row]
        penyakitselected = task["nama_penyakit"] as! String
        latinselected = task["latin_penyakit"] as! String
        deskripsiselected = task["deskripsi_penyakit"] as! String
        
        
        performSegue(withIdentifier: "passDetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "passDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! Detail
                let value = arrKategori[indexPath.row]
                
                
                controller.passnama = value["nama_penyakit"] as! String
                controller.passpenyebab = value["latin_penyakit"] as! String
                controller.passdeskripsi = value["deskripsi_penyakit"] as! String
                
            }
        }
        
        
        /*
         // Override to support conditional editing of the table view.
         override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the specified item to be editable.
         return true
         }
         */
        
        /*
         // Override to support editing the table view.
         override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
         // Delete the row from the data source
         tableView.deleteRows(at: [indexPath], with: .fade)
         } else if editingStyle == .insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
         }
         */
        
        /*
         // Override to support rearranging the table view.
         override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
         
         }
         */
        
        /*
         // Override to support conditional rearranging of the table view.
         override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the item to be re-orderable.
         return true
         }
         */
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}


