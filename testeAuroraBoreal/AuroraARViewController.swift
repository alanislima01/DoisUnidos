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
    
    var aurorasImages: [ImageAurora] = [] // pode ter ou nao ago dentro.. nao necesariamente vai ter um image aurora, de 1a vai ser um nil
    
    let configuration = ARWorldTrackingConfiguration() //para rastrear a posicao e orientacao do dispositivo em relacao ao mundo real.. porem n aparece a opcao ARWorldTrackingSessionConfiguration
    
    
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    //essa acao de baixo eh um nó..(uma posicao no espaco que nao tem forma nem tamanho)... Aqui estamos fazendo com que esse no venha para a nossa camera
    
    
    
    @IBAction func add(_ sender: Any) {
        
        
        //  node.geometry = SCNTorus(ringRadius: 0.3, pipeRadius: 0.1) //ringRadius é o tamanho horizontal / pipeR é a grossura do anel.. Ring sempre deve ser maior qe o pipe.. é a rosquinha hihi
        //   node.geometry = SCNCapsule(capRadius: 0.1, height: 0.3) //aqui para ser um cilindro, por exemplo.. existem varias coisas
        //        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)//aqui vamos colocar o tamanho do no e dizer que eh uma caixa!
        //        let path = UIBezierPath() //para criar formas personalizadas a partir de um caminho q eu escolhjo:
        //        path.move(to: CGPoint(x: 0, y:0)) //ele vai estar 0 metros de onde vc se posicionou
        //        path.addLine(to: CGPoint(x: 0, y: 0.2))
        //        path.addLine(to: CGPoint(x:0.2 , y:0.3))// vai de 0 ao ponto 0.2 para direita e 0.1 acima
        //        let shape = SCNShape(path: path, extrusionDepth: 0.2)
        //        node.geometry = shape
        
        //let imageAppear = UIImage(named: "Yuumi")
        
        //let node = SCNNode(geometry: SCNPlane(width: 0.3, height: 0.3))
        
        let node = SCNNode()
        //node.geometry = SCNTorus(ringRadius: 0.3, pipeRadius: 0.1)
        node.geometry = SCNSphere(radius: 0.15)
        
        // node.geometry = SCNPlane(width: 0.3, height: 0.3)
        
        // node.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "Yuumi")
        
        
        //        node.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
        node.geometry?.firstMaterial?.specular.contents = UIColor.purple//luz que vai refletir da caixa
        
        node.position = SCNVector3(0.35,0.4,0)//ele 0.3 é para deixar ele distante do vetor
        
        //        //aqui em cima eu criei a caixa
        
        
        DispatchQueue.global().async {
            
            print(self.aurorasImages.count)
            
            let imagemFinal = self.aurorasImages[0]
            //pega a 0,5
            //  let elementoAleatorio =   self.aurorasImages.randomElement()
            //print(elementoAleatorio)
            do{
                var url = imagemFinal.url.replacingOccurrences(of: "http:", with: "https:")
                
                print("Nova URL É " + url)
                var urlImage = URL(string: url)
                
                if let urlData = try? Data(contentsOf: urlImage!){
                    
                    let image = UIImage(data: urlData)
                    
                    DispatchQueue.main.async {
                        
                        node.geometry?.firstMaterial?.diffuse.contents = image
                        self.sceneView.scene.rootNode.addChildNode(node)
                        
                    }
                }
            }catch{
                print("erro")
            }
            
        }
        
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
    
    //    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat{
    //        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    //    }
    //
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
        
       //self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        
        self.sceneView.debugOptions = []

        self.sceneView.session.run(configuration) //descobrir minha posicao no mundo hihi
        self.sceneView.autoenablesDefaultLighting = true  // adcionamos a iluminacao
        
        
        //inventando de fazer um texto de ultima hora
        let text = SCNText(string: "Veja aqui sua Aurora", extrusionDepth: 2)
        let material = SCNMaterial() //um "envoltorio"
        material.diffuse.contents = UIColor.magenta //colocamos a cor
        text.materials = [material] //nova quebra automatica???
        
        let node2 = SCNNode()
        node2.position = SCNVector3(x:0, y:0, z:0)
        node2.scale = SCNVector3(x:0.008, y:0.008, z:0.008)
        node2.geometry = text
        
        sceneView.scene.rootNode.addChildNode(node2)
        sceneView.autoenablesDefaultLighting = true
        // Do any additional setup after loading the view.
    }
    
    func load(){
        let stringURL = "https://api.auroras.live/v1/?type=images&action=list"
        let url = URL(string: stringURL)
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { data, response , error in
            do{
                let decoder = JSONDecoder()
                
                let jsonData = try decoder.decode(Welcome.self, from: data!) //Tem que ser o que ta vindo da internet o "super json".
                
                self.aurorasImages = Array(jsonData.images.values)
                self.aurorasImages = self.aurorasImages.filter { $0.category == Category.cam}
                
                self.aurorasImages = self.aurorasImages.sorted(by: {$0.url>$1.url}) //vou ordenar minha lista a partir do criterio de url(1o com o segundo, compara por ordem alfabetica)
                
                
            }catch{
                print("Erro: \(error.localizedDescription)")
                
                
            }
        }
        task.resume()
    }
    
    // tenho que criar um func loadImage para poder realmente baixar a imagem.
    
    //    func loadImageAPI(url: String){ //baixar a imagem do elemento
    //        let urlImage = URL(string: "https://odia.ig.com.br/_midias/jpg/2020/03/18/cao-16275945.jpg") //
    //        let data = try? Data(contentsOf: urlImage!)
    //        let image = UIImage(data: data!)
    //    }
      
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //agora as coisas do ARKit
    
    
    
    
}

// oi teste

//
