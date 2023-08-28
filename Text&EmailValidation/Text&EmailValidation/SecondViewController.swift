//
//  SecondViewController.swift
//  Text&EmailValidation
//
//  Created by Sainath Bamen on 26/07/23.
//

import UIKit

class SecondViewController: UIViewController {
    var image1 = ["male","male","male","male","male","male","male","male"]
    var imageName = ["","","","",""]
    @IBOutlet weak var myTabelView: UITableView!
    
    
    @IBOutlet weak var myCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()

        // Do any additional setup after loading the view.
    }
    func registerCells(){
        myTabelView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}


extension SecondViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return image1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTabelView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.myImage.image = UIImage(named: image1[indexPath.row])
        return cell
    }
    
    
}

extension SecondViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCV.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        cell.CollectionViewImage.image = UIImage(named: image1[indexPath.row])
        return cell
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (myCV.frame.size.width - 30)/2
        return CGSize(width: size, height: size)
    }
    
    
    
}
