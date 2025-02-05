//
//  FDButton.swift
//  FoodDeliveryApp
//
//  Created by Rita on 13.09.2024.
//

import UIKit

enum FDButtonColorSchemes {
    case white
    case orange
    case gray
}

class FDButton: UIView {
    
    private let button = UIButton()
    var action: (() -> Void)?
    var scheme: FDButtonColorSchemes = .white {
        didSet {
            setColorScheme(scheme: scheme)
        }
    }
    
    
    init(scheme: FDButtonColorSchemes = .white) {
        super.init(frame: .zero)
        self.scheme = scheme
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = .clear
        setupButton()
    }
    
    private func setupButton() {
        addSubview(button)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .Roboto.bold.size(of: 18)
        button.layer.cornerRadius = 24
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    @objc private func buttonPressed() {
        guard let action = self.action else { return }
        action()
    }
    
    public func setColorScheme(scheme: FDButtonColorSchemes) {
        switch scheme {
        case .white:
            button.backgroundColor = AppColors.white
            button.setTitleColor(AppColors.accentOrange, for: .normal)
        case .orange:
            button.backgroundColor = AppColors.accentOrange
            button.setTitleColor(AppColors.white, for: .normal)
        case .gray:
            button.backgroundColor = AppColors.grey
            button.setTitleColor(AppColors.black, for: .normal)
        }
    }
    
    public func setTitle(_ title: String?) { 
        button.setTitle(title, for: .normal)
    }
}
