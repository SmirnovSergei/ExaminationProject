//
//  UIView+print.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 21.10.2024.
//

import UIKit

extension UIView {
    func printButtonViewsQuantity(_ views: UIView...) -> Int {
        var buttonViewQuantity = 0
        
        for view in views {
            if view is CustomButton {
                buttonViewQuantity += 1
            }
        }
        
        print("Количество переданных вьюшек UIButton (с жёлтым незаюзанным ворнингом) = \(buttonViewQuantity)\n")
        
        return buttonViewQuantity
    }
    
    func printAllSubviews(_ views: UIView...) {
        for view in views {
            if let button = view as? CustomButton {
                print("Кастомная кнопка с названием экземпляра: \(button.buttonNameInstance ?? "Unknown name")")
                
            } else {
                if let image = view as? ImageView {
                    print("Кастомнная картинка (хоть и могла бы быть обычной) под названием \(image.imageNameInstance ?? "Unknown name")")
                }
            }
        }
    }
}
