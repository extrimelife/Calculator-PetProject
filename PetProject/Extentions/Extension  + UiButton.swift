//
//  Extension  + UiButton.swift
//  PetProject
//
//  Created by roman Khilchenko on 09.01.2023.
//

import UIKit

extension UIButton {
    
    func getAnimation() {
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0.5
        }) { _ in
            UIView.animate(withDuration: 0.2, animations: {
                self.alpha = 1
            })
        }
    }
}
   

