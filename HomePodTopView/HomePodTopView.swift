//
//  HomePodTopView.swift
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
//  of the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
//  PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
//  AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//  Created by Adam Fordyce on 03/07/2021.
//  Copyright © 2021 Adam Fordyce. All rights reserved.
//
import SwiftUI
import PureSwiftUI

struct HomePodTopView: View {
    var body: some View {
        let mesh = ZStack {
            ForEach(0..<130) { index in
                Circle()
                    .strokeBorder(Color.white(0.15), lineWidth: 1.25)
                    .frame(160)
                    .xOffset(120)
                    .rotate(2.7692.degrees * index)
            }
        }
        ZStack {
            //base
            Circle()
                .scale(0.95)
                .shadowColor(.white(0.15), 10, y: 18)
            Circle()
                .fillColor(.black)
            //mesh
            mesh
            Circle()
                .scale(0.88)
                .fillColor(.white(0.35))
                .blur(15)
                .mask(mesh)
                .blendMode(.screen)
            //user interface
            Group {
                Circle()
                    .scale(1.01)
                    .fillColor(.black)
                    .blur(5)
                Circle()
                    .fill(LinearGradient([.white(0.2), .black, .black], to: .bottom))
                Circle()
                    .strokeBorder(AngularGradient([.white, .black, .white, .black, .white, .black, .white], angle: -10.degrees), lineWidth: 2)
                    .blur(1)
            }
            .scale(0.63)
            //siri circle
            Group {
                Circle()
                    .fill(AngularGradient([.blue, .blue, Color.cgCyan.opacity(0.8), .purple, .purple, .purple, .blue], angle: -10.degrees))
                    .scale(0.17)
                    .blur(10)
                    .saturation(1.4)
                    .brightness(0.3)
                    .drawingGroup()
                Circle()
                    .scale(0.16)
                    .stroke(AngularGradient([.blue, .green, .red, .blue], angle: -10.degrees), lineWidth: 3)
                    .blur(6)
                    .saturation(2)
                Circle()
                    .scale(0.075)
                    .fillColor(.white)
                    .blur(12)
            }
            .blur(4)
            .mask(Circle().scale(0.22).blur(7))
        }
    }
}

struct HomePodTopView_Previews: PreviewProvider {
    static var previews: some View {
        HomePodTopView()
            .frame(400)
            .padding(50)
    }
}
