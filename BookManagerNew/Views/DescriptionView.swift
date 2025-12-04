//
//  DescriptionView.swift
//  BookManagerNew
//
//  Created by Ramone Hayes on 12/2/25.
//

import SwiftUI


struct DescriptionView: View {
    var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Description")
                .font(.headline)
                .padding(.bottom, 2)
            
            Text(text)
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
            

        }
    }
}
