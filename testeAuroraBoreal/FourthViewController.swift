
//FourthViewController.swift
//testeAuroraBoreal

//Created by Lívia Silva Oliveira on 03/09/20.
//Copyright © 2020 Alanis Lima Santa Clara. All rights reserved.


import UIKit

class FourthViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdCollectionViewCell", for: indexPath) as! ThirdCollectionViewCell
        
//        cell.buttonDigestao.setBackgroundImage(UIImage (named: digestao[indexPath.row]), for: .normal)
//
//        cell.buttonDigestao.addTarget(self, action: #selector(passScreen), for: .touchUpInside)
        
         cell.digestaoImage.image = UIImage(imageLiteralResourceName: digestao[indexPath.row])
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return digestao.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "ShowFirthViewController", sender: self)
    }
    
    public var digestao = [ "1", "2", "3", "4"]
    
    
    
    @IBOutlet weak var thirdCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        thirdCollectionView.delegate = self
        thirdCollectionView.dataSource = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 32, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: 45, height: 65)
        
    }
    
    @objc func passScreen(){
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 414, height: 171)
    }
}
