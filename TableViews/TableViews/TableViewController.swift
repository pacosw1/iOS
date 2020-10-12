//
//  TableViewController.swift
//  TableViews
//
//  Created by paco williams on 9/25/20.
//  Copyright © 2020 Francisco Sainz. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, AddPlayerProtocol {

   var items: [Jugador] = []

    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
          super.viewDidLoad()
          
          
          title = "Jugadores"
          // Do any additional setup after loading the view.
          
          items = [
              Jugador(nombre:"Hawaii",puntos: 100, img: UIImage(named: "doggo1")),
              Jugador(nombre:"Natalia",puntos: 250, img: UIImage(named: "doggo2")),
              Jugador(nombre:"Papi Juancho", puntos:500, img: UIImage(named: "doggo3")),
              Jugador(nombre:"Neymar",puntos: 120, img: UIImage(named: "doggo4"))
          ]
          
      }
      
      
      
      
      
      override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return items.count
       }
       
      override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
          let item = tableView.dequeueReusableCell(withIdentifier: "tableItem")!
          
          let player = items[indexPath.row]
          
          item.detailTextLabel?.text = String(player.puntos)
          item.textLabel?.text = player.nombre
          
          if let foto = player.img {
              item.imageView?.image = foto
          } else {
              item.imageView?.image = UIImage(named: "default")
          }

          return item;
       }
      
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          // Get the new view controller using segue.destination.
          // Pass the selected object to the new view controller.
          
          
          switch segue.identifier {
          case "Show":
              let detailPage = segue.destination as! DetailViewController
              let selectedIndex = tableView.indexPathForSelectedRow!.row
              detailPage.player = items[selectedIndex]
          case "Add":
              let addView = segue.destination as! ViewControllerAdd
              addView.delegado = self
          default:
              return
          }
          
          
      }
      
      
      
      
      func addPlayer(p: Jugador) {
          items.append(p)
          table.reloadData()
      }
      
      



}


