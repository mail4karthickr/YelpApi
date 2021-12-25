//
//  SwiftUIView.swift
//  
//
//  Created by Karthick Ramasamy on 12/6/21.
//

import SwiftUI

public struct EventsView: View {
    @ObservedObject var viewModel: EventsViewModel
        
    public init(viewModel: EventsViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Text("Events")
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView(viewModel: EventsViewModel())
    }
}
