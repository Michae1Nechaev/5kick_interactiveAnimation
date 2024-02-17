//
//  ViewController.swift
//  5Kick_interactiveAnimation
//
//  Created by Нечаев Михаил on 17.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let squareView = UIView()
    
    private var animator: UIDynamicAnimator?
    private var snap: UISnapBehavior?
    
    private var tapPosition: CGPoint = .zero

    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.addSubview(squareView)
        
        squareView.backgroundColor = .systemBlue
        squareView.layer.cornerRadius = 8
        
        squareView.layer.frame = CGRect(
            x: UIScreen.main.bounds.width / 2 - 50,
            y: UIScreen.main.bounds.height / 2 - 50,
            width: 100,
            height: 100
        )
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(tap)
        
        animator = UIDynamicAnimator(referenceView: view)
    }
    
    @objc
    func tap(_ tap: UITapGestureRecognizer) {
        if let animator = animator {
            animator.removeAllBehaviors()
            let updatedSnap = UISnapBehavior(item: squareView, snapTo: tap.location(in: view))
            snap = updatedSnap
            snap?.damping = 2
            animator.addBehavior(updatedSnap)
        }
    }
}
