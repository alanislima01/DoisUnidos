//
//  ThirdViewController.swift
//  testeAuroraBoreal
//
//  Created by Lívia Silva Oliveira on 02/09/20.
//  Copyright © 2020 Alanis Lima Santa Clara. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return psicologia.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionView", for: indexPath) as! SecondCollectionViewCell
        
        //        cell.PsicoButton.setBackgroundImage(UIImage (named: psicologia[indexPath.row]), for: .normal)
        //
        //        cell.PsicoButton.addTarget(self, action: #selector(passScreen), for: .touchUpInside)
        
        cell.plantasImage.image = UIImage(imageLiteralResourceName: psicologia[indexPath.row])
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("oi")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "ShowFourthViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFourthViewController"{
            print("deveria aparecer fourthviewcontroller")
        }
    }
    
    
    @objc func passScreen(){
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 414, height: 171)
    }
    
    
    public var psicologia = [ "Asset 12-1", "Asset 13", "Asset 14", "Asset 15"]
    
    @IBOutlet weak var SecondCollectionView: UICollectionView!
    
    var CollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SecondCollectionView.delegate = self
        SecondCollectionView.dataSource = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 32, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: 60, height: 65)
        
    }
    
}
