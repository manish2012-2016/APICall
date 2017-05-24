//
//  NewTableViewController.swift
//  APICall
//
//  Created by Manish Kumar on 05/01/17.
//  Copyright © 2017 appface. All rights reserved.
//
import UIKit
import SDWebImage

class NewTableViewController: UITableViewController {

    var imagesArray: [String] = []
    var timeArray = [String]()
    var arrayReceived: [NSDictionary] = []
    var selectedImage:String?
    var selectedLabel:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.delegate = self
        tableView.dataSource = self
        
        

        DispatchQueue.global(qos: .background).async {
            let url = URL(string: "http://54.65.76.103/ugleApi/index.php/?images=abcd")
            
            let task = URLSession.shared.dataTask(with: url!) { data, response, error in
                guard error == nil else {
                    print(error!)
                    return
                }
                guard let data = data else {
                    print("Data is empty")
                    return
                }
                
                let json = try! JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                
                print("json received = \(json["root"]!)")
                
                self.arrayReceived = json["root"] as! [NSDictionary]
                print("array received = \(self.arrayReceived)")
              
                for index in self.arrayReceived{
                    print("index = \(index)")
                    let imageString = "http://54.65.76.103/ugleApi/".appending(index["Image"] as! String)
                     print("image string \(imageString)")
                    self.imagesArray.append(imageString)
                    self.timeArray.append(index["Time"] as! String)
                }
                DispatchQueue.main.async {
                   self.tableView.reloadData()
                }
                print("imagesArray = \(self.imagesArray)")
                print("timeArray = \(self.timeArray)")
                
            }
            
            task.resume()
            
            
        }
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return imagesArray.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! NewTableViewCell
//        cell.imageVieLAbel.sd_setImage(with: NSURL(String:imagesArray[indexPath.row]), placeholderImage: #imageLiteral(resourceName: "london.jpg"))
        cell.imageVieLAbel.sd_setImage(with: URL(string:imagesArray[indexPath.row]), placeholderImage: #imageLiteral(resourceName: "london.jpg"))
//        let url = NSURL(string:imagesArray[indexPath.row])
//        let data = NSData(contentsOf:url! as URL)
//        print(data!)
//        if data != nil {
//            cell.imageVieLAbel.image = UIImage(data:data! as Data)
//        }
        
               cell.labelView.text = timeArray[indexPath.row]

        return cell
    }
  
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
       selectedImage = imagesArray[indexPath.row]
        selectedLabel = timeArray[indexPath.row]
//        performSegue(withIdentifier: "segueIdentifier", sender: imagesArray[indexPath.row])
        performSegue(withIdentifier: "myIdentifier", sender: self)

    
    
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // if segue.identifier == "myIdentifier"{
        let VC = segue.destination as! New1ViewController
//            VC.imageView.image = selectedImage
//            VC.labelView = selectedLabel
        //  VC.imageView.image = UIImage(named: "selectedImage")!
            //VC.labelView.text = selectedLabel
            _ = VC.view
           VC.img = selectedImage!
        VC.imageView.sd_setImage(with: URL(string:selectedImage!), placeholderImage: #imageLiteral(resourceName: "london.jpg"))

            VC.labelView.text! = selectedLabel!
      //  }
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
