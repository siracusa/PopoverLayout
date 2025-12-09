//
//  ContentView.swift
//  PopoverLayout
//
//  Created by John Siracusa on 12/9/25.
//

import SwiftUI

let longMsg = "This is some very long text that should wrap to multiple lines because it just goes on and on and is very long."

let shortMsg = "This is a short message"

struct ContentView : View {
    @State private var showPopover = true
    @State private var msg = longMsg

    var body: some View {
        VStack {
            Text("I want the popover below to have a maximum width of 500, but its height should expand to be tall enough to contain all the text without any truncation, allowing the text to wrap to multiple lines as needed. And, importantly, I don't want any extra empty space around the (red) content in the popover.\n\nThis same popover should also be able to accommodate short text, shrinking to be just wide enough to fit the short text. A sane minimum width would be fine, but is not necessary because the text will never be shorter than 30 characters.\n\nClick this text to make the popover reappear if it closes.")
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .frame(width: 400)
                .onTapGesture {
                    showPopover = true
                }
        }
        .popover(isPresented: $showPopover, arrowEdge: .bottom) {
            VStack {
                Text(msg)
                    .fixedSize(horizontal: false, vertical: true)

                ProgressView(value: 0.25)
                    .progressViewStyle(.linear)
            }
            .padding()
            .frame(maxWidth: 500)
            .background(.red)
        }
    }
}

#Preview {
    ContentView()
}
