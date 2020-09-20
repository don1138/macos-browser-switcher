//
//  ContentView.swift
//  BrowserSwitcher
//
//  Created by Don Schnitzius on 9/18/20.
//  Copyright © 2020 Don Schnitzius. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Default Browser:")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
