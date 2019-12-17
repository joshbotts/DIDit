//
//  ChargesConvertCredentialDateToChargeDate.swift
//  DIDit
//
//  Created by Joshua Botts on 12/17/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct ChargesConvertCredentialDateToChargeDate: View {
    @EnvironmentObject var pocom: PocomStore
    var charges: [PocomInstance] {
        let charges = pocom.chiefs.filter { $0.comRole == XmlCOMRole.chargeDaffaires || $0.comRole == XmlCOMRole.chargeDaffairesAdInterim }
        return charges
    }
    
    var body: some View {
        HStack {
            Button("Convert credential dates to charge dates for \(charges.count) chargés") {
                for charge in self.charges {
                    if charge.chargeDate == nil {
                        charge.chargeDate = charge.credentialDate
                        charge.chargePrecision = charge.credentialPrecision
                        charge.chargeNote = charge.credentialNote
                        charge.credentialDate = nil
                        charge.credentialPrecision = nil
                        charge.credentialNote = nil
                        print("credentialing date converted to charge date")
                    }
                }
                }
            }
        }
    }
    
    struct ChargesConvertCredentialDateToChargeDate_Previews: PreviewProvider {
        static var previews: some View {
            ChargesConvertCredentialDateToChargeDate()
        }
}
