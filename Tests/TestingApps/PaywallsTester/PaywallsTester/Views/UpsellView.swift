//
//  UpsellView.swift
//  PaywallsTester
//
//  Created by Andrés Boedo on 9/28/23.
//

import SwiftUI

struct UpsellView: View {

    var body: some View {
        VStack {
            Text("""
                This view automatically displays the default paywall if you're not subscribed.
                
                This is achieved by calling
                `.presentPaywallIfNeeded(requiredEntitlementIdentifier: \(Configuration.entitlement))`
                """)

        }
        .padding()
        .presentPaywallIfNeeded(
            requiredEntitlementIdentifier: Configuration.entitlement) { package in
                print("Purchase started")
            } purchaseCompleted: { customerInfo in
                print("Purchase completed")
            } purchaseCancelled: {
                print("Purchase cancelled")
            } restoreStarted: {
                print("Restore started")
            } restoreCompleted: { customerInfo in
                print("Restore completed")
            } purchaseFailure: { error in
                print("Purchase failed")
            } restoreFailure: { error in
                print("Restore failed")
            } onDismiss: {
                print("Paywall dismissed")
            }
    }

}

struct UpsellView_Previews: PreviewProvider {

    static var previews: some View {
        UpsellView()
    }

}
