//
//  ViewController.swift
//  IOS_marathon
//
//  Created by Наталья Коновалова on 01.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private let shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let gradientView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let sideSquare = 120
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
    }
    
    private func setupInitialState() {
        addSubviews()
        setupGradient()
        setupShadow()
    }
    
    private func addSubviews() {
        view.addSubview(shadowView)
        shadowView.addSubview(gradientView)
        setupFrameAndConstraints(width: sideSquare, height: sideSquare)
    }
    
    private func setupShadow() {
        shadowView.layer.cornerRadius = 16
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: -4, height: 6)
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowRadius = 10
    }
    
    private func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.red.cgColor,]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = gradientView.bounds
        gradientView.layer.addSublayer(gradientLayer)
    }
    
    private func setupFrameAndConstraints(width: Int, height: Int) {
        setupFrame(width: width, height: height)
        setupConstraints(width: width, height: height)
    }
    
    private func setupFrame(width: Int, height: Int) {
        gradientView.frame = CGRect(x: 0, y: 0, width: width, height: height)
    }
    
    private func setupConstraints(width: Int, height: Int) {
        NSLayoutConstraint.activate([
            shadowView
                .centerYAnchor.constraint(equalTo: view.centerYAnchor),
            shadowView
                .leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            shadowView
                .heightAnchor.constraint(equalToConstant: CGFloat(width)),
            shadowView
                .widthAnchor.constraint(equalToConstant: CGFloat(height))
        ])
    }
}
