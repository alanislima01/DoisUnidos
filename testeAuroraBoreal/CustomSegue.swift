//
//  CustomSegue.swift
//  testeAuroraBoreal
//
//  Created by Lívia Silva Oliveira on 02/09/20.
//  Copyright © 2020 Alanis Lima Santa Clara. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue{
    override func perform() {
        let src = self.source
        let dst = self.destination
        src.present(dst, animated: false, completion: nil)
    }
}
