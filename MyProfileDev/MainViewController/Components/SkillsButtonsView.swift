//
//  SkillsButtonsView.swift
//  MyProfileDev
//
//  Created by Hugo Huichalao on 14-07-24.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    var isSelectedButton: Bool = false {
        didSet {
            updateAppearance()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        self.backgroundColor = .systemBlue
        self.tintColor = .white
        self.layer.cornerRadius = 10
        self.setTitleColor(.lightGray, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setTitle(_ title: String) {
        self.setTitle(title, for: .normal)
    }
    
    private func updateAppearance() {
        if isSelectedButton {
            self.layer.borderWidth = 2
            self.layer.borderColor = UIColor(rgbValue: 0xaa5d25).cgColor
            self.setTitleColor(.systemBlue, for: .normal)
        } else {
            self.layer.borderWidth = 0
            self.setTitleColor(.lightGray, for: .normal)
        }
    }
}
