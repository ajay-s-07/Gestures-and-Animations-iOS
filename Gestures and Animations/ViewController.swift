//
//  ViewController.swift
//  Gestures and Animations
//
//  Created by Ajay Sarkate on 02/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    var differenceX: CGFloat = .zero
    var differenceY: CGFloat = .zero
    
    let circle = UIView()
    let anotherCircle = UIView()
//    let heart = UIImageView()
//    let heart2 = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        heart.image = UIImage(systemName: "heart.fill")
//        heart.tintColor = .systemPink
//        circle.addSubview(heart)
//
//
//        heart.translatesAutoresizingMaskIntoConstraints = false
//        heart.heightAnchor.constraint(equalToConstant: 150).isActive = true
//        heart.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        heart.centerXAnchor.constraint(equalTo: circle.centerXAnchor).isActive = true
//        heart.centerYAnchor.constraint(equalTo: circle.centerYAnchor).isActive = true
//
//        heart2.image = UIImage(systemName: "heart.fill")
//        heart2.tintColor = .systemPink
//
//        anotherCircle.addSubview(heart2)
//        heart2.translatesAutoresizingMaskIntoConstraints = false
//        heart2.heightAnchor.constraint(equalToConstant: 150).isActive = true
//        heart2.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        heart2.centerXAnchor.constraint(equalTo: anotherCircle.centerXAnchor).isActive = true
//        heart2.centerYAnchor.constraint(equalTo: anotherCircle.centerYAnchor).isActive = true
        
        view.addSubview(anotherCircle)

        anotherCircle.translatesAutoresizingMaskIntoConstraints = false
        anotherCircle.heightAnchor.constraint(equalToConstant: 340).isActive = true
        anotherCircle.widthAnchor.constraint(equalToConstant: 340).isActive = true
        anotherCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        anotherCircle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        anotherCircle.layer.cornerRadius = 170
//        anotherCircle.layer.borderColor = UIColor.black.cgColor
//        anotherCircle.layer.borderWidth = 2
//
//
        anotherCircle.addSubview(circle)
        circle.backgroundColor = .red

        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.heightAnchor.constraint(equalToConstant: 280).isActive = true
        circle.widthAnchor.constraint(equalToConstant: 280).isActive = true
        circle.centerXAnchor.constraint(equalTo: anotherCircle.centerXAnchor).isActive = true
        circle.centerYAnchor.constraint(equalTo: anotherCircle.centerYAnchor).isActive = true
//        circle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true

        circle.layer.cornerRadius = 140
//
        addTapGesture()
//        addLongPressGesture()
//        addPanGesture()
//        addPinchGesture()
//        addSwipeGesture()
        
//        let tempVC = PinchController()
//        let gradient = tempVC.view!
//        view.addSubview(gradient)
//
//        gradient.translatesAutoresizingMaskIntoConstraints = false
//        gradient.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        gradient.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        gradient.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        gradient.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        circle.addGestureRecognizer(tap)
    }
    
    @objc func handleTapGesture(gesture: UITapGestureRecognizer) {
        let scale = CGAffineTransform(scaleX: 1.75, y: 1.75)
        if circle.transform == .identity {
            UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
                self.circle.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            }
            UIView.animate(withDuration: 1, delay: 0, options: [.repeat]) {
                self.anotherCircle.transform = scale
                self.anotherCircle.alpha = 0
            }
        }
    }
    
    func addLongPressGesture() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture))
        longPress.minimumPressDuration = 0.2
        circle.addGestureRecognizer(longPress)
    }
    
    @objc func handleLongPressGesture(gesture: UILongPressGestureRecognizer) {
        
        let location = gesture.location(in: self.view)
        let location1 = gesture.location(in: gesture.view)
        
        let scale = CGAffineTransform(scaleX: 1.25, y: 1.25)
        
        switch gesture.state {
        case .began:
            UIView.animate(withDuration: 0.36, delay: 0, options: .curveEaseOut) {
                self.circle.transform = scale
            }
            differenceX = 75 - location1.x
            differenceY = 75 - location1.y
        case .changed:
            let x = (location.x - circle.center.x) + differenceX
            let y = (location.y - circle.center.y) + differenceY
            let translation = CGAffineTransform(translationX: x, y: y)
            let transform = scale.concatenating(translation)
            
            self.circle.transform = transform
        case .ended:
            UIView.animate(withDuration: 0.36, delay: 0, options: .curveEaseOut) {
                self.circle.transform = .identity
            }
        default:
            print("default")
        }
        
    }
    
    func addPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        circle.addGestureRecognizer(panGesture)
    }

    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {

        let translation = gesture.translation(in: gesture.view!)

        switch gesture.state {
        case .began, .changed:
            let transform = CGAffineTransform(translationX: translation.x, y:  translation.y)
            circle.transform = transform
        case .ended:
//            UIView.animate(withDuration: 0.36, delay: 0, options: .curveEaseOut) {
//                self.circle.transform = .identity
//            }
            print("")
        default:
            print("Pan Gesture")
        }
    }
    
    func addPinchGesture() {
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture))
        anotherCircle.addGestureRecognizer(pinch)
    }
    
    @objc func handlePinchGesture(gesture: UIPinchGestureRecognizer) {
        
        let scale = anotherCircle.transform.scaledBy(x: gesture.scale, y: gesture.scale)
        let minScale: CGFloat = 0.5
        if scale.a < minScale && scale.d < minScale {
            return
        }
        anotherCircle.transform = scale
        gesture.scale = 1.0
    }
    
    func addSwipeGesture() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
        swipeRight.direction = .right
        anotherCircle.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleLeftSwipe))
        swipeLeft.direction = .left
        anotherCircle.addGestureRecognizer(swipeLeft)
    }
    
    @objc func handleSwipeGesture(gesture: UISwipeGestureRecognizer) {
        print("Swipe")
        let transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.36) {
            self.anotherCircle.transform = transform
        }
    }
    
    @objc func handleLeftSwipe(gesture: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 0.36) {
            self.anotherCircle.transform = .identity
        }
    }

}

