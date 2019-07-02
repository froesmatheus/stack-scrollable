//
//  Stack.swift
//  VStack
//
//  Created by Matheus Fróes on 01/07/19.
//  Copyright © 2019 Matheus Fróes. All rights reserved.
//

import Foundation
import UIKit

final class Stack: UIView {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var spacerView: UIView = {
        let view = UIView()
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func add(view: UIView) {
        removeSpacerView()
        
        view.setContentCompressionResistancePriority(.init(1000), for: .vertical)
        view.setContentHuggingPriority(.init(1000), for: .vertical)
        
        stackView.addArrangedSubview(view)
        
        addSpacerView()
    }
    
    func add(views: [UIView]) {
        views.forEach(add(view:))
    }
    
    func add(views: UIView...) {
        views.forEach(add(view:))
    }
    
    private func setupViews() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func removeSpacerView() {
        spacerView.removeFromSuperview()
    }
    
    private func addSpacerView() {
        stackView.addArrangedSubview(spacerView)
    }
}
