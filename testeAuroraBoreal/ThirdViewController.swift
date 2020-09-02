//
//  ThirdViewController.swift
//  testeAuroraBoreal
//
//  Created by Lívia Silva Oliveira on 02/09/20.
//  Copyright © 2020 Alanis Lima Santa Clara. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PsicologiaCollectionViewCell", for: indexPath) as! PsicologiaCollectionViewCell
        
        cell.buttonPsico.setBackgroundImage(UIImage (named: psicologia[indexPath.row]), for: .normal)

        cell.buttonPsico.addTarget(self, action: #selector(passScreen), for: .touchUpInside)

        return cell

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return psicologia.count
        

    }
    
    public var psicologia = [ "Asset 2", "Asset 4"]
    
    @IBOutlet weak var secondCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 32, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: 60, height: 65)
        
    }
    
    @objc func passScreen(){
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 414, height: 300)
    }
}
