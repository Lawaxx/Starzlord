//
//  GameViewController.swift
//  StarzLord
//
//  Created by Aurelien Waxin on 08/03/2022.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var startGameBackFront: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let view = self.view as! SKView? {
//            // Load the SKScene from 'GameScene.sks'
//            if let scene = SKScene(fileNamed: "GameScene") {
//                // Set the scale mode to scale to fit the window
//                scene.scaleMode = .aspectFit
//
//                // Present the scene
//                view.presentScene(scene)
//            }
//
//            view.ignoresSiblingOrder = true
//
//            view.preferredFramesPerSecond = 120
//            view.showsFPS = true
//            view.showsNodeCount = true
//            view.showsPhysics = true
//        }
    }
    @IBAction func startGame(_ sender: Any) {
        startButton.removeFromSuperview()
        startGameBackFront.removeFromSuperview()
        
        let view = view as! SKView
            // Load the SKScene from 'GameScene.sks'
             let scene = SKScene(fileNamed: "GameScene")
                // Set the scale mode to scale to fit the window
        scene!.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            
            
            view.ignoresSiblingOrder = true
            
            view.preferredFramesPerSecond = 120
            view.showsFPS = true
            view.showsNodeCount = true
            view.showsPhysics = true
        }
    
    
    

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
