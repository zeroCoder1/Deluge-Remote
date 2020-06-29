//
//  CircularProgressView.swift
//  DelugeRemote
//
//  Created by Rudy Bermudez on 6/29/20.
//

import SwiftUI

struct CircularProgressView: View {
    var progress: Double
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                Circle()
                    .stroke(lineWidth: geometry.size.width/5.0)
                    .opacity(0.3)
                    .foregroundColor(Color.red)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: geometry.size.width/5.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.red)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)
                Text(String(format: "%.0f%%", min(self.progress, 1.0)*100.0))
                    //.font(.body)
                    .font(.system(size: geometry.size.width/4.0))
                    .bold()
            }
        }
        
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 0.9)
            .frame(width: 57, height: 57, alignment: .center)
    }
}
