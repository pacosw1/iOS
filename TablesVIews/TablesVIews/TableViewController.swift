//
//  TableViewController.swift
//  TablesVIews
//
//  Created by paco williams on 9/28/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit


class customViewCell: UITableViewCell {
    
    @IBOutlet weak var Foto: UIImageView!
    @IBOutlet weak var Capacidad: UILabel!
    @IBOutlet weak var Tipo: UILabel!
    @IBOutlet weak var Precio: UILabel!
}

class TableViewController: UITableViewController {
    
    
    var iphoneList = [
        iPhone(tipo: "X", capacidad: "64", precio: 999.99, foto: UIImage(named: "iphone1")), iPhone(tipo: "XL", capacidad: "128", precio: 1200.99, foto: UIImage(named: "iphone1"))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return iphoneList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! customViewCell
        
        let iphone = iphoneList[indexPath.row]
//
        cell.Capacidad.text = iphone.capacidad
        cell.Precio.text = String(iphone.precio)
        cell.Tipo.text! = iphone.tipo
        cell.Foto.image = iphone.foto

        return cell
    }
    


    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            iphoneList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }



    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let tmp = iphoneList[to.row]
        iphoneList[to.row] = iphoneList[fromIndexPath.row]
        iphoneList[fromIndexPath.row] = tmp

    }



    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
