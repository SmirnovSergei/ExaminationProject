//
//  LicenseDataManager.swift
//  ExaminationProject
//
//  Created by Сергей Смирнов on 16.11.2024.
//

import UIKit

protocol ILicenseAgreement {
    func getLicenseAgreement() -> LicenseModel
}

class LicenseDataManager: ILicenseAgreement {
    private let licenseAgreement: LicenseModel
    
    init(licenseAgreement: LicenseModel) {
        self.licenseAgreement = licenseAgreement
    }
    func getLicenseAgreement() -> LicenseModel {
        licenseAgreement
    }
    
    
}
