//
//  AuroraARViewController.swift
//  testeAuroraBoreal
//
//  Created by Alanis Lima Santa Clara on 27/08/20.
//  Copyright © 2020 Alanis Lima Santa Clara. All rights reserved.
//

import UIKit
import ARKit




class AuroraARViewController: UIViewController{
    
    var image: [ImageAurora] = [] // pode ter ou nao ago dentro.. nao necesariamente vai ter um image aurora, de 1a vai ser um nil
    
    let configuration = ARWorldTrackingConfiguration() //para rastrear a posicao e orientacao do dispositivo em relacao ao mundo real.. porem n aparece a opcao ARWorldTrackingSessionConfiguration
    
    
    
    @IBOutlet weak var sceneView: ARSCNView!

    //essa acao de baixo eh um nó..(uma posicao no espaco que nao tem forma nem tamanho)... Aqui estamos fazendo com que esse no venha para a nossa camera
    @IBAction func add(_ sender: Any) {
        let node = SCNNode()

      //  node.geometry = SCNTorus(ringRadius: 0.3, pipeRadius: 0.1) //ringRadius é o tamanho horizontal / pipeR é a grossura do anel.. Ring sempre deve ser maior qe o pipe.. é a rosquinha hihi
     //   node.geometry = SCNCapsule(capRadius: 0.1, height: 0.3) //aqui para ser um cilindro, por exemplo.. existem varias coisas
//        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)//aqui vamos colocar o tamanho do no e dizer que eh uma caixa!
//        let path = UIBezierPath() //para criar formas personalizadas a partir de um caminho q eu escolhjo:
//        path.move(to: CGPoint(x: 0, y:0)) //ele vai estar 0 metros de onde vc se posicionou
//        path.addLine(to: CGPoint(x: 0, y: 0.2))
//        path.addLine(to: CGPoint(x:0.2 , y:0.3))// vai de 0 ao ponto 0.2 para direita e 0.1 acima
//        let shape = SCNShape(path: path, extrusionDepth: 0.2)
//        node.geometry = shape
        
        node.geometry = SCNPlane(width: 0.2, height: 0.2)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
        node.geometry?.firstMaterial?.specular.contents = UIColor.white//luz que vai refletir da caixa
        node.position = SCNVector3(0.2,0.3,-0.2)//ele 0.3 é para deixar ele distante do vetor
        self.sceneView.scene.rootNode.addChildNode(node)
        //aqui em cima eu criei a caixa
        
    }
    
    @IBAction func reset(_ sender: Any) {
        self.restartSession()
    }
    
    func restartSession(){
        self.sceneView.session.pause() //aqui vamos pausar
        self.sceneView.scene.rootNode.enumerateChildNodes{(node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat{
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration) //descobrir minha posicao
        self.sceneView.autoenablesDefaultLighting = true  // adcionamos a iluminacao
        
        
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
                    
                    print(self.image[0])//para mostrar o elemento 0 desse array
                    self.loadImageAPI(url: self.image[0].url) //aqui eu vou ta chamando o item zero para mostrar a imagem!! DEPOIS TIRAR DO COMENTARIO!!!
                    
                    //para depois eu mostrar a imagem uso isso de baixar a imagem e depois colocar o resultado disso imageView!!!!
                    
                    // Vou ter que descobrir como pegar as informacoes de um dicionario e colocar numa self.image... key e valor.. como fazer o valor da chave nessa
                    
                }
            }catch{
                print("Deu erro aqui")
            }
        }
        task.resume()
    }
    
    // tenho que criar um func loadImage para poder realmente baixar a imagem.

    func loadImageAPI(url: String){ //baixar a imagem do elemento
        let urlImage = URL(string: "https://odia.ig.com.br/_midias/jpg/2020/03/18/cao-16275945.jpg") //
        let data = try? Data(contentsOf: urlImage!)
        let image = UIImage(data: data!)
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //agora as coisas do ARKit
    
    
    
    
}

// oi teste

//
