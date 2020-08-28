//
//  AuroraViewController.swift
//  testeAuroraBoreal
//
//  Created by Alanis Lima Santa Clara on 27/08/20.
//  Copyright © 2020 Alanis Lima Santa Clara. All rights reserved.
//

import UIKit

class AuroraViewController: UIViewController{
    
    var image: [ImageAurora] = [] // pode ter ou nao ago dentro.. nao necesariamente vai ter um image aurora, de 1a vai ser um nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
        // Do any additional setup after loading the view.
    }
    
    func load(){
        let stringURL = "https://api.auroras.live/v1/?type=images&action=list"
        let url = URL(string: stringURL)
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { data, response , error in
            do{
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Welcome.self, from: data!) //Tem que ser o que ta vindo da internet o "super json". Tem que forcar o data que vem da linha 25(q se diz opcional)... ta transformando oq da internet no tipo de dados do FileStruct.
                
                DispatchQueue.main.async { //faz funcao assincrona, ou seja, espera algo acontecer para rodar dps
                //vamos criar um laço
                    for aurora in jsonData.images.values {
                        
                        self.image.append(aurora) //ele vai percorrer o diciniocario e vai salvar as coisas do array
                        
                 //       print(aurora)
                    } // o for ta lapidando ainda melhor as info que realmente precisam (so selecionando as imagens)
                    
                    print(self.image[0]) //para mostrar o elemento 0 desse array
                
                    
                    // Vou ter que descobrir como pegar as informacoes de um dicionario e colocar numa self.image... key e valor.. como fazer o valor da chave nessa

                }
            }catch{
                print("Deu erro aqui")
            }
        }
        task.resume()
    }
}
