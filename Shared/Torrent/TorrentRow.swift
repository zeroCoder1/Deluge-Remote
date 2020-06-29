//
//  TorrentRow.swift
//  DelugeRemote
//
//  Created by Rudy Bermudez on 6/28/20.
//

import SwiftUI

struct TorrentRow: View {
    let torrent: Torrent
    
    var verticalRowPadding: CGFloat {
        #if os(macOS)
        return 10
        #else
        return 0
        #endif
    }
    
    var verticalTextPadding: CGFloat {
        #if os(iOS)
        return 8
        #else
        return 0
        #endif
    }
    
    var body: some View {
        
        VStack(alignment: .center) {
            Text(torrent.name)
                .font(.callout)
                .lineLimit(1)
                
            
            ProgressView(value: torrent.progress / 100.0)
            
            HStack
            {
                Text(torrent.state)
                    .lineLimit(1)
                    .foregroundColor(torrent.state == "Error" ? .red : .primary)
                    .accessibility(label: Text("Torrent State: \(torrent.state)"))
                Spacer()
                HStack {
                    Text("↑ \(torrent.upload_payload_rate.transferRateString())")
                        .foregroundColor(.primary)
                        .lineLimit(1)
                    Text("\(torrent.download_payload_rate.transferRateString()) ↓")
                        .foregroundColor(.primary)
                        .lineLimit(1)
                }
                Spacer()
                if torrent.eta != 0,
                    let eta = torrent.eta.timeRemainingString(unitStyle: .abbreviated)
                {
                    Text(eta)
                        .lineLimit(1)
                        .foregroundColor(.primary)
                }
                else
                {
                    Text(torrent.ratioText)
                        .lineLimit(1)
                        .foregroundColor(.primary)
                }

            }
            .font(.caption)
        }
    }
}

struct TorrentRow_Previews: PreviewProvider {
    static var previews: some View {
        TorrentRow(torrent: torrents[9])
    }
}
