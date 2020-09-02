//
//  SecondViewController.swift
//  testeAuroraBoreal
//
//  Created by Lívia Silva Oliveira on 02/09/20.
//  Copyright © 2020 Alanis Lima Santa Clara. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return humor.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HumorCollectionViewCell", for: indexPath) as! HumorCollectionViewCell
        
        cell.ButtonHumor.setBackgroundImage(UIImage (named: humor[indexPath.row]), for: .normal)
        
        cell.ButtonHumor.addTarget(self, action: #selector(passScreen), for: .touchUpInside)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "ShowThirdViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowThirdViewController"{
            print("deveria aparecer thirdviewcontroller")
        }
    }
    
    @objc func passScreen(){
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 414, height: 171)
    }
    
    
    public var humor = [ "Asset 3", "Asset 6", "Asset 7", "Asset 8", "Asset 9"]
    
    
    @IBOutlet weak var humorColletionView: UICollectionView!
    
    
    var CollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        humorColletionView.delegate = self
        humorColletionView.dataSource = self
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 32, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: 60, height: 65)
        
    }
    
    
}
