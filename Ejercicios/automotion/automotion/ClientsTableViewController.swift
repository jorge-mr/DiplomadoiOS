//
//  ClientsTableViewController.swift
//  automotion
//
//  Created by d182_Jorge_M on 16/03/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

typealias ClientResponse = ([Client]) -> Void

class ClientsTableViewController: UITableViewController {

    var clients = [Client](){
        didSet{
            updateData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadClientService { (clients) in
            self.clients = clients
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func loadClientService(completion: ClientResponse) {
        sleep(5)
        completion(loadClients())
    }
    
    func loadClients() -> [Client] {
        return [
            Client(firstName: "Pepe", lastName: "Guallabas", email: "pepe@guallabas"),
            Client(firstName: nil, lastName: "Trump", email: "wall@trump.com"),
            Client(firstName: "Jorge", lastName: "MR", email: "jorge_mr@gmail.com"),
            Client(firstName: "Pepe", lastName: "Guallabas", email: "pepe@guallabas"),
            Client(firstName: nil, lastName: "Trump", email: "wall@trump.com"),
            Client(firstName: "Jorge", lastName: "MR", email: "jorge_mr@gmail.com"),
            Client(firstName: "Pepe", lastName: "Guallabas", email: "pepe@guallabas"),
            Client(firstName: nil, lastName: nil, email: "aaa@trump.com"),
            Client(firstName: "Jorge", lastName: "MR", email: "jorge_mr@gmail.com")
        ]
    }

    
    func updateData(){
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.clients.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

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