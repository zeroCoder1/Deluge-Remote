//
//  TorrentFileView.swift
//  DelugeRemote
//
//  Created by Rudy Bermudez on 6/29/20.
//

import SwiftUI

struct TorrentFileView: View {
    
    let torrentFileStructure: TorrentFileStructure
    
    var body: some View {
        
        List(torrentFileStructure.files, children: \.contents) { item in
            VStack (alignment: .leading){
                HStack {
                    Text(item.name)
                    Text(item.size.sizeString())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }.listStyle(InsetGroupedListStyle())
        
    }
}

struct TorrentFileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TorrentFileView(torrentFileStructure: fileStructure)
        }
    }
}
