//
//  ContentView.swift
//  swiftUI_Task_3
//
//  Created by pavel mishanin on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isTap = true
    
    var body: some View {
        Button(action: {
            isTap.toggle()
        }) {
            NextView(isTap: $isTap)
        }
    }
}

struct NextView: View {
    @Binding var isTap: Bool
    
    private var playImage: some View {
        Image(systemName: "play.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
    var body: some View {
        HStack(spacing: 0) {
            playImage
                .opacity(isTap ? 1 : 0)
                .scaleEffect(isTap ? 1 : 0, anchor: .trailing)
                .frame(height: isTap ? Ui.iconHeight : .zero)
            
            playImage
                .frame(height: Ui.iconHeight)
            
            playImage
                .opacity(isTap ? 0 : 1)
                .scaleEffect(isTap ? 0 : 1, anchor: .trailing)
                .frame(height: isTap ? .zero : Ui.iconHeight)
            
        }
        .animation(isTap ? .interpolatingSpring(stiffness: 210, damping: 20) : .none, value: isTap)
        .onChange(of: isTap) { newValue in
            if !newValue {
                isTap = true
            }
        }
    }
}

private enum Ui {
    static let iconHeight: CGFloat = 44
}
