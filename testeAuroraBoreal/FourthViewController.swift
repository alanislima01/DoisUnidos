//
//  FourthViewController.swift
//  testeAuroraBoreal
//
//  Created by Lívia Silva Oliveira on 03/09/20.
//  Copyright © 2020 Alanis Lima Santa Clara. All rights reserved.
//

//import UIKit
//
//class FourthViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdCollectionViewCell", for: indexPath) as! ThirdCollectionViewCell
//
//        cell.buttonDigestao.setBackgroundImage(UIImage (named: digestao[indexPath.row]), for: .normal)
//
//        cell.buttonDigestao.addTarget(self, action: #selector(passScreen), for: .touchUpInside)
//
//        return cell
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        return digestao.count
//
//
//    }
//
//    public var digestao = [ "Asset 10", "Asset 11"]
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        thirdCollectionView.delegate = self
//        thirdCollectionView.dataSource = self
//
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 32, left: 20, bottom: 20, right: 20)
//        layout.itemSize = CGSize(width: 60, height: 65)
//
//    }
//
//    @objc func passScreen(){
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 414, height: 300)
//    }
//}
