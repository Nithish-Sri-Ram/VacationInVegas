//
//  ContentView.swift
//  VacationInVegas
//
//  Created by Nithish on 28/08/24.
//

import SwiftUI

struct Symbols: View {
    @State private var shouldIBounce = false
    @State private var shouldIRotate = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.tint)
                .symbolEffect(.pulse)
            
            Image(systemName: "airplane")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.tint)
                .symbolEffect(.pulse)
            
            Image(systemName: "wifi")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.purple)
                .symbolEffect(.variableColor.reversing)
            
            Image(systemName: "person.crop.circle.badge.plus")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.tint)
                .symbolRenderingMode(.multicolor)
                .symbolEffect(.bounce,value: shouldIBounce)
                .onTapGesture {
                    shouldIBounce.toggle()
                }
            
            Image(systemName: "cloud.sun.rain.fill")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.gray,.yellow,.mint)
                .symbolEffect(.bounce,value: shouldIBounce)
                .onTapGesture {
                    shouldIBounce.toggle()
                }
            
            Image(systemName: "arrow.clockwise.square")
                .font(.largeTitle)
                .imageScale(.large)
                .symbolEffect(.bounce,value: shouldIRotate)
                .onTapGesture {
                    shouldIRotate.toggle()
                }
            
            Image(systemName: "sun.max.fill")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.yellow)
                .symbolEffect(.variableColor.reversing)
                .onTapGesture {
                    shouldIRotate.toggle()
                }
            
            Image(systemName: "dog.fill")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.teal)
                .symbolEffect(.variableColor.reversing)
                .onTapGesture {
                    shouldIRotate.toggle()
                }
 
        }
        .padding()
    }
}

#Preview {
    Symbols()
}
