//
//  PrincipalInstanceForPersonDetailViewRow.swift
//  DID IT
//
//  Created by Joshua Botts on 10/7/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct PocomInstanceForPersonDetailViewRow: View {
    var instance: PocomInstance
    var instanceStartDateString: String {
        let perInstanceDateFormatter = DateFormatter()
        perInstanceDateFormatter.locale = Locale(identifier: "en_US")
        perInstanceDateFormatter.dateFormat = "MMMM dd, yyyy"
        var instanceStartDateString = "Appointed:"
        if instance.startDate != nil {
        instanceStartDateString += " " + perInstanceDateFormatter.string(from: instance.startDate!)
            } else {
            instanceStartDateString += " no date identified."
            }
        return instanceStartDateString
    }
    
    var instanceChargeDateString: String? {
        if instance.instanceType == .chief {
        let perInstanceDateFormatter = DateFormatter()
        perInstanceDateFormatter.locale = Locale(identifier: "en_US")
        perInstanceDateFormatter.dateFormat = "MMMM dd, yyyy"
        var instanceChargeDateString = "Assumed charge:"
        if instance.chargeDate != nil {
        instanceChargeDateString += " " + perInstanceDateFormatter.string(from: instance.chargeDate!)
            } else {
            instanceChargeDateString += " no date identified."
            }
        return instanceChargeDateString
        } else {
            return nil
        }
    }
    
    var instanceCredentialDateString: String? {
        if instance.instanceType == .chief {
        let perInstanceDateFormatter = DateFormatter()
        perInstanceDateFormatter.locale = Locale(identifier: "en_US")
        perInstanceDateFormatter.dateFormat = "MMMM dd, yyyy"
        var instanceCredentialDateString = "Presented credentials:"
        if instance.credentialDate != nil {
        instanceCredentialDateString += " " + perInstanceDateFormatter.string(from: instance.credentialDate!)
            } else {
            instanceCredentialDateString += " no date identified."
            }
        return instanceCredentialDateString
        } else {
            return nil
        }
    }
    
    var instanceDutyDateString: String? {
        if instance.instanceType == .principal {
        let perInstanceDateFormatter = DateFormatter()
        perInstanceDateFormatter.locale = Locale(identifier: "en_US")
        perInstanceDateFormatter.dateFormat = "MMMM dd, yyyy"
        var instanceDutyDateString = "Started duty:"
        if instance.dutyDate != nil {
        instanceDutyDateString += " " + perInstanceDateFormatter.string(from: instance.dutyDate!)
            } else {
            instanceDutyDateString += " no date identified."
            }
        return instanceDutyDateString
        } else {
            return nil
        }
    }
    
    var instanceEndDateString: String {
        if instance.instanceType == .chief {
        let perInstanceDateFormatter = DateFormatter()
        perInstanceDateFormatter.locale = Locale(identifier: "en_US")
        perInstanceDateFormatter.dateFormat = "MMMM dd, yyyy"
        var instanceEndDateString = "Relinquished charge:"
        if instance.endDate != nil {
    instanceEndDateString += " " + perInstanceDateFormatter.string(from: instance.endDate!)
            } else {
            instanceEndDateString += " no date identified."
            }
        return instanceEndDateString
        } else {
            let perInstanceDateFormatter = DateFormatter()
                perInstanceDateFormatter.locale = Locale(identifier: "en_US")
                perInstanceDateFormatter.dateFormat = "MMMM dd, yyyy"
                var instanceEndDateString = "Termination of appointment:"
                if instance.endDate != nil {
            instanceEndDateString += " " + perInstanceDateFormatter.string(from: instance.endDate!)
                    } else {
                    instanceEndDateString += " no date identified."
                    }
                return instanceEndDateString
        }
    }
    
    var instanceNominationDateString: String {
        let perInstanceDateFormatter = DateFormatter()
        perInstanceDateFormatter.locale = Locale(identifier: "en_US")
        perInstanceDateFormatter.dateFormat = "MMMM dd, yyyy"
        var instanceNominationDateString = "Nominated:"
        if instance.nominationDate != nil {
        instanceNominationDateString += " " + perInstanceDateFormatter.string(from: instance.nominationDate!)
            } else {
            instanceNominationDateString += " no date identified."
            }
        return instanceNominationDateString
    }
    
    var instanceNominationEndDateString: String {
        let perInstanceDateFormatter = DateFormatter()
        perInstanceDateFormatter.locale = Locale(identifier: "en_US")
        perInstanceDateFormatter.dateFormat = "MMMM dd, yyyy"
        var instanceNominationEndDateString = "Nomination ended:"
        if instance.nominationEndDate != nil {
        instanceNominationEndDateString += " " + perInstanceDateFormatter.string(from: instance.nominationEndDate!)
            } else {
            instanceNominationEndDateString += " no date identified."
            }
        return instanceNominationEndDateString
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(String(instance.instanceRole()))
                .font(.headline)
                .lineLimit(nil)
                .layoutPriority(1)
                .fixedSize(horizontal: false, vertical: true)
//            Text(String(instanceNominationDateString))
//            Text(String(instanceNominationEndDateString))
            Text(String(instanceStartDateString))
                .font(.body)
            instanceChargeDateString.map {Text($0)}
                .font(.body)
            instanceDutyDateString.map {Text($0)}
                .font(.body)
            instanceCredentialDateString.map {Text($0)}
                .font(.body)
            Text(String(instanceEndDateString))
                .font(.body)
            instance.note.map {Text($0)}
                .font(.body)
                .lineLimit(nil)
        }
    }
}

//struct PocomInstanceViewRow_Previews: PreviewProvider {
//    static var previews: some View {
//        PocomInstanceViewRow()
//    }
//}
