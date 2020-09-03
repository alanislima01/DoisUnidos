//
//  FourthViewController.swift
//  testeAuroraBoreal
//
//  Created by Lívia Silva Oliveira on 03/09/20.
//  Copyright © 2020 Alanis Lima Santa Clara. All rights reserved.
//

import UIKit

class FirthViewController: UIViewController {
    
    var resultado: [UIImage] = [
        UIImage(named: "resultadoA1")!,
        UIImage(named:"resultadoA2")!,
        UIImage(named: "resultadoA1")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultadoAurora.image = resultado[Int.random(in: 0..<resultado.count)]
        
    }
    
    @IBOutlet weak var resultadoAurora: UIImageView!
    
}
