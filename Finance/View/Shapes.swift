//
//  Shapes.swift
//  Finance
//
//  Created by BqNqNNN on 7/29/20.
//

import SwiftUI

struct LineChart: View {
    var body: some View {
        GeometryReader { g in
            let minX = g.frame(in : .local).minX
            let maxX = g.frame(in : .local).maxX
            let maxY = g.frame(in : .local).maxY
            let midX = g.frame(in : .local).midX
            let midY = g.frame(in : .local).midY
            
            
            Path { p in
                p.move(to: CGPoint(x: minX, y: maxY) )
                
                p.addQuadCurve(to : CGPoint(x: midX/2, y: midY),
                               control : CGPoint(x: midX/3, y: midY))
                
                p.addCurve(to : CGPoint(x: midX, y: 3/2*midY),
                           control1 : CGPoint(x: midX*0.8, y: midY),
                           control2 : CGPoint(x: midX, y: midY*1.5))
                
                p.addCurve(to : CGPoint(x: 3/2*midY, y: 1/2*midY),
                           control1 : CGPoint(x: midY*1.3, y: midY*2),
                           control2 : CGPoint(x: midY, y: midY*0.5))
                
                p.addCurve(to :CGPoint(x: maxX, y: maxY),
                           control1 : CGPoint(x: maxX, y: midY*0.6),
                           control2 : CGPoint(x: maxX, y: maxY))
                
                
            }
            .fill(LinearGradient(
                    gradient: .init(colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) ]),
                    startPoint: .top,
                    endPoint: .bottom))
            Path { p in
                p.move(to: CGPoint(x: minX, y: maxY) )
                
                p.addQuadCurve(to : CGPoint(x: midX/2, y: midY),
                               control : CGPoint(x: midX/3, y: midY))
                
                p.addCurve(to : CGPoint(x: midX, y: 3/2*midY),
                           control1 : CGPoint(x: midX*0.8, y: midY),
                           control2 : CGPoint(x: midX, y: midY*1.5))
                
                p.addCurve(to : CGPoint(x: 3/2*midY, y: 1/2*midY),
                           control1 : CGPoint(x: midY*1.3, y: midY*2),
                           control2 : CGPoint(x: midY, y: midY*0.5))
                
                p.addCurve(to :CGPoint(x: maxX, y: maxY),
                           control1 : CGPoint(x: maxX, y: midY*0.6),
                           control2 : CGPoint(x: maxX, y: maxY))
                
                
            }
            .stroke(LinearGradient(
                        gradient: .init(colors: [Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)),Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 0.04069456336)) ]),
                        startPoint: .top,
                        endPoint: .bottom), lineWidth: 2 )
            
            
        }
    }
}
