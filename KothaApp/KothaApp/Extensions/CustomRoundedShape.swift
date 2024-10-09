//
//  CustomRoundedShape.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 9/23/24.
//

import SwiftUI

struct CustomRoundedShape: Shape {
    var cornerRadii: CGFloat = 20 // Adjust the radius as per your need
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Start from the top left (without rounding)
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        // Top-right corner rounded
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadii, y: rect.minY + cornerRadii),
                    radius: cornerRadii,
                    startAngle: Angle.degrees(-90),
                    endAngle: Angle.degrees(0),
                    clockwise: false)
        
        // Bottom-right corner rounded
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadii, y: rect.maxY - cornerRadii),
                    radius: cornerRadii,
                    startAngle: Angle.degrees(0),
                    endAngle: Angle.degrees(90),
                    clockwise: false)
        
        // Bottom-left corner rounded
        path.addArc(center: CGPoint(x: rect.minX + cornerRadii, y: rect.maxY - cornerRadii),
                    radius: cornerRadii,
                    startAngle: Angle.degrees(90),
                    endAngle: Angle.degrees(180),
                    clockwise: false)
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY)) // Complete the path
        return path
    }
}

