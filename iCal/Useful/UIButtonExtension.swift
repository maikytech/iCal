//
//  UIButtonExtension.swift
//  iCal
//
//  Created by Maiqui Cedeño on 15/12/21.
//

import UIKit

private let orange = UIColor(red: 254/255, green: 148/255, blue: 0/255, alpha: 1)

extension UIButton {

    func roundEdge() {
        self.layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    
    func bounce() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) {(completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = CGAffineTransform.identity
            })
        }
    }
    
    func shine() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }) {(completion) in
            self.alpha = 1
        }
    }
    
    func jump() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(translationX: 10, y: 0)
        }) {(completion) in
            self.transform = CGAffineTransform.identity
        }
    }
    
    func selectOperation(_ select: Bool) {
        backgroundColor = select ? .white : .orange
        setTitleColor(select ? .orange : .white, for: .normal)
    }
}
