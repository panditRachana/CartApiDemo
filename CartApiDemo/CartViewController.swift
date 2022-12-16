//
//  CartViewController.swift
//  CartApiDemo
//
//  Created by Rachana Pandit on 09/12/22.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var tblCartList:UITableView!
    var arrayCart = [Cart]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableViewDataSourceAndDelagate()
        registerTableViewXib()
        fetchingDataFromApi()
    }
    
    func tableViewDataSourceAndDelagate()
    {
        tblCartList.delegate =  self
        tblCartList.dataSource =  self
    }
    
    func registerTableViewXib()
    {
        let nibName = UINib(nibName: "CartTableViewCell", bundle: nil)
        tblCartList.register(nibName, forCellReuseIdentifier: "CartTableViewCell")
    }
    
    func fetchingDataFromApi()
    {
       let urlString = "https://dummyjson.com/carts"
       let url = URL(string: urlString)
       var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        
        let dataTask =  session.dataTask(with: request) { data, response, error in
            
            let  jsonObject = try! JSONSerialization.jsonObject(with: data!) as! [String:Any]
           print(jsonObject)
            
        let arrayFromJson = jsonObject["carts"] as! [[String:Any]]
        print(arrayFromJson)
            
            for dictionary in arrayFromJson
            {
                let eachDictionary = dictionary
                let id = eachDictionary["id"] as! Int
                
                let product = eachDictionary["products"] as! [[String:Any]]
                
                let total = eachDictionary["total"] as! Int
                let discountedTotal = eachDictionary["discountedTotal"] as! Int
                let userId = eachDictionary["userId"] as! Int
                let totalProducts = eachDictionary["totalProducts"] as! Int
                let totalQuantity = eachDictionary["totalQuantity"] as! Int
                
                self.arrayCart.append(Cart(id: id,
                                           product: product,
                                           total: total,
                                           discountedTotal: discountedTotal,
                                           userId: userId,
                                           totalProducts: totalProducts,
                                           totalQuantity: totalQuantity))
               print(self.arrayCart.count)
            }
            
            DispatchQueue.main.async {
                self.tblCartList.reloadData()
            }
        }
        dataTask.resume()
    }
    
}

extension CartViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 190
    }
}

extension CartViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let tblCell = tblCartList.dequeueReusableCell(withIdentifier: "CartTableViewCell", for:indexPath) as! CartTableViewCell
        tblCell.lblCartId.text = String(arrayCart[indexPath.row].id)
        tblCell.lblTotalProducts.text = String(arrayCart[indexPath.row].totalProducts)
        tblCell.arrayProduct = arrayCart[indexPath.row].product
        return tblCell
        
    }
}
