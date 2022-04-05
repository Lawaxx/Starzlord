//
//  EnemyNode.swift
//  StarzLord
//
//  Created by Aurelien Waxin on 08/03/2022.
//

import SpriteKit

class EnemyNode: SKSpriteNode {
    
    var type : EnemyType
    var lastFireTime : Double = 0
    var shields : Int
    
    init(type: EnemyType, startPosition: CGPoint, xOffset: CGFloat, moveStraight: Bool) {
        self.type = type
        shields = type.shields
        
        let texture = SKTexture(imageNamed: type.name)
        super.init(texture: texture, color: .white, size: texture.size())
        
        physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
        physicsBody?.categoryBitMask = CollisionType.enemy.rawValue
        physicsBody?.collisionBitMask = CollisionType.player.rawValue | CollisionType.playerWeapon.rawValue
        physicsBody?.contactTestBitMask = CollisionType.player.rawValue | CollisionType.playerWeapon.rawValue
        name = "enemy"
        position = CGPoint(x: startPosition.x + xOffset, y: startPosition.y + 600)
        configureMovements(moveStraight)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("LOL NO")
    }
    
    func configureMovements(_ moveStraight : Bool) {
        let path = UIBezierPath()
        path.move(to: .zero)
        
        if moveStraight {
            path.addLine(to: CGPoint(x: 0, y: -2000))
        } else {
            path.addCurve(to: CGPoint(x: -80, y: 350), controlPoint1: CGPoint(x: 80, y: -700), controlPoint2: CGPoint(x: -80, y: -700))
        }
        let movement = SKAction.follow(path.cgPath, asOffset: true, orientToPath: true, speed: type.speed / 2)
        let sequence = SKAction.sequence([movement, .removeFromParent()])
        run(sequence)
    }
    
    func fire() {
        let weaponType = "\(type.name)Weapon"
        
        let weapon = SKSpriteNode(imageNamed: weaponType)
        weapon.name = "enemyWeapon"
        weapon.position = position
        weapon.zPosition = zRotation
        parent?.addChild(weapon)
        weapon.physicsBody = SKPhysicsBody(rectangleOf: weapon.size)
        weapon.physicsBody?.categoryBitMask = CollisionType.enemyWeapon.rawValue
        weapon.physicsBody?.collisionBitMask = CollisionType.player.rawValue
        weapon.physicsBody?.contactTestBitMask = CollisionType.player.rawValue
        weapon.physicsBody?.mass = 0.001
        
        let speed : CGFloat = 1
        let adjustedRotation = zRotation + (CGFloat.pi / 2)
        
        let dx = speed * cos(adjustedRotation)
        let dy = speed * sin(adjustedRotation)
        
        weapon.physicsBody?.applyImpulse(CGVector(dx: dx, dy: dy))
            
    }
}
