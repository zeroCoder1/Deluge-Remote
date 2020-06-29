//
//  DataCell.swift
//  DelugeRemote
//
//  Created by Rudy Bermudez on 6/28/20.
//

import SwiftUI

struct ContentRow: View {
    let label: String
    let detail: String
    
    var body: some View {
        HStack(alignment: .center)
        {
            Text(label)
                .foregroundColor(.primary)
            Spacer()
            Text(detail)
                .foregroundColor(.secondary)
        }
    }
}

struct ContentRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentRow(label: "Title", detail: "Detail")
            .frame(width: 200.0, height: 30.0)
            
    }
}
