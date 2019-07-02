//
//  StackScrollable.swift
//  VStack
//
//  Created by Matheus Fróes on 01/07/19.
//  Copyright © 2019 Matheus Fróes. All rights reserved.
//

import Foundation
import UIKit

final class StackScrollable: UIScrollView {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var stack: Stack = {
        let stack = Stack()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        setupContainerView()
        setupStack()
    }
    
    private func setupContainerView() {
        addSubview(containerView)
        
        let heightConstraint = containerView.heightAnchor.constraint(equalTo: heightAnchor)
        heightConstraint.priority = .init(750)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: widthAnchor),
            heightConstraint
        ])
    }
    
    private func setupStack() {
        containerView.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stack.topAnchor.constraint(equalTo: containerView.topAnchor),
            stack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}
