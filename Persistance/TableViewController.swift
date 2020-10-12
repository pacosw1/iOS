//
//  TableViewController.swift
//  Persistance
//
//  Created by paco williams on 10/5/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var table: UITableView!
    @IBOutlet weak var QuantityLabel: UILabel!
    
    
    
    
    var Items: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Items"
        let app = UIApplication.shared
        
        NotificationCenter.default.addObserver(self, selector: #selector(saveItemsToDisk), name: UIApplication.didEnterBackgroundNotification, object: app)
        
        if FileManager.default.fileExists(atPath: urlArchivo().path){
            getItemsFromDisk()
        }
        
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Items.count
    }
    
    
     @IBAction func unwindEditar(segue: UIStoryboardSegue) {
       let detailView = segue.source as! DetailViewController

        
        if (Items.indices.contains(detailView.ID)) {
            
                let item = Items[detailView.ID]
                
                item.Description = detailView.Description
                item.Quantity = detailView.Quantity
                item.ID = detailView.ID
        }
        else {
            print("created new one");
            Items.append(Product(ID: detailView.ID, Description: detailView.Description, Quantity: detailView.Quantity))
                                       
        }
        
        table.reloadData()
            
        
    
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        
        
        let item = Items[indexPath.row]

        cell.textLabel?.text! = String(item.ID)
        cell.detailTextLabel?.text! = item.Description

        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailView = segue.destination as! DetailViewController;

        switch(segue.identifier) {
        case "New":
            detailView.ID = Items.count
            break;
        case "Edit":
            let item = Items[table.indexPathForSelectedRow!.row]
            detailView.Description = item.Description
            detailView.ID = item.ID
            detailView.Quantity = item.Quantity
        default:
            break;
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    func urlArchivo() -> URL {
           let url = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
           let pathArchivo = url.appendingPathComponent("Items.plist")
           return pathArchivo
       }
       
       @IBAction func saveItemsToDisk() {
           do{
               let data = try PropertyListEncoder().encode(Items)
               try data.write(to: urlArchivo())
           }
           catch{
               print("Problemas al escribir data")
           }
       }
       
       @IBAction func getItemsFromDisk(){
           Items.removeAll()
           do{
               let data = try Data.init(contentsOf: urlArchivo())
               Items = try PropertyListDecoder().decode([Product].self, from: data)
           }
           catch{
               print("Error al cargar archivo")
           }
           tableView.reloadData()
       }


}
