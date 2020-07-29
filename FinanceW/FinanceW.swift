//
//  widget.swift
//  widget
//
//  Created by BqNqNNN on 7/28/20.
//

import WidgetKit
import SwiftUI


struct PlaceholderView : View {
    var body: some View {
        Text("This is just a placeholed when the widget is loading")
    }
}

struct SimpleEntry: TimelineEntry {
    public let date = Date()
    public let text : String
}

struct Provider: TimelineProvider {
    public typealias Entry = SimpleEntry
    
    public func snapshot(with context: Context, completion: @escaping (SimpleEntry) -> ()) {
        var entry : SimpleEntry
        
        if context.isPreview  {
            entry = SimpleEntry(text: "We in the preview screen")
        } else {
            entry = SimpleEntry(text: "we in the home screen")
        }
        completion(entry)
    }
    
    public func timeline(with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            _ = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(text: "Finance")
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}


struct widgetEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.6693798304, green: 0.7854295373, blue: 0.9982592463, alpha: 0.1516481164))]), startPoint: .topTrailing, endPoint: .bottom)
            Group {
                ArcShape()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5424916148, green: 0.7029080987, blue: 0.9997727275, alpha: 1)), Color(#colorLiteral(red: 0.6693798304, green: 0.7854295373, blue: 0.9982592463, alpha: 0.4648705051))]), startPoint: .topTrailing, endPoint: .bottom))
                    .offset(x: 70, y: 0)
                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .rotationEffect(.degrees(-15))
                ArcShape()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5424916148, green: 0.7029080987, blue: 0.9997727275, alpha: 1)), Color(#colorLiteral(red: 0.6693798304, green: 0.7854295373, blue: 0.9982592463, alpha: 0.4648705051))]), startPoint: .topTrailing, endPoint: .bottom))
                    .offset(x: 70, y: -10)
                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .rotationEffect(.degrees(-25))
            }
            VStack {
                HStack{
                    Spacer()
                    Image("Image")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .shadow(radius: 1)
                }
                HStack {
                    VStack {
                        Text("Balance")
                            .font(.title)
                            
                        Text("$69,420")
                            .font(.title)
                            .bold()
                            .padding(.leading, 20)
                        Spacer()
                    }
                    Spacer()
                }
                HStack{
                    Text("****4269")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
            }
            .padding(.all, 20)
            
            
            
        }
    }
}


@main
struct widget: Widget {
    private let kind: String = "widget"
    
    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), placeholder: PlaceholderView()) { entry in
            widgetEntryView(entry: entry)
        }
        .configurationDisplayName("Finance")
        .description("Track your balance.")
        .supportedFamilies([.systemSmall,.systemMedium])
        
    }
}

struct widget_Previews: PreviewProvider {
    static var previews: some View {
        widgetEntryView(entry: SimpleEntry(text: "Finance"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

struct Arc : Shape {
    var statAng: Angle
    var endAng: Angle
    var clock : Bool
    
    
    func path(in rect: CGRect) -> Path {
        
        
        var path = Path()
        
        let rotAdj = Angle.degrees(90)
        let startAdg = statAng - rotAdj
        let endAdg = endAng - rotAdj
        
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width/2, startAngle: startAdg, endAngle: endAdg, clockwise: clock)
        
        return path
    }
}


struct ArcShape : Shape {
    func path(in rect: CGRect) -> Path {
        
        let (x, y, width, height) = rect.centeredSquare.flatten()
        let lowerPoint = CGPoint(x: x + width / 2, y: (y + height ))
        
        let path = Path { p in
            p.move(to: lowerPoint)
            p.addCurve(to: CGPoint(x: rect.minX, y: rect.minY),
                       control1: CGPoint(x: rect.minX, y: rect.maxY),
                       control2: CGPoint(x: rect.maxX/2, y: rect.minY))
        
            p.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            p.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        }
        return path
    }
}


extension CGRect {
    var center: CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
    var centeredSquare: CGRect {
        let width = ceil(min(size.width, size.height))
        let height = width
        
        let newOrigin = CGPoint(x: origin.x + (size.width - width) / 2, y: origin.y + (size.height - height) / 2)
        let newSize = CGSize(width: width, height: height)
        return CGRect(origin: newOrigin, size: newSize)
    }
    
    func flatten() -> (CGFloat, CGFloat, CGFloat, CGFloat) {
        return (origin.x, origin.y, size.width, size.height)
    }
}
