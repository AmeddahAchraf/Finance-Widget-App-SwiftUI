//
//  Main.swift
//  Finance
//
//  Created by BqNqNNN on 7/25/20.
//

import SwiftUI
import SwiftUICharts
import Progress_Bar

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
            })
    }
}


struct Main: View {
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 13, weight: .bold)], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
    }
    
    let mixedColorStyle = ChartStyle(backgroundColor: .white, foregroundColor: [
                                       
            ColorGradient(.purple, .blue)])


    @State var monthSelected = 3
    @State var incomeExpense = 1
    @State var progress :CGFloat = 0.75
   
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.black)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    HStack {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .foregroundColor(.white)
                            .scaledToFit()
                            .frame(width: 10)
                            .opacity(0.8)
                            .padding(.leading, 20)
                        Spacer()
                        Image(systemName: "text.justify")
                            .resizable()
                            .foregroundColor(.white)
                            .scaledToFit()
                            .frame(width: 25)
                            .padding(.trailing, 20)
                    }.padding(.top, -80)
                    
                    VStack{
                        Text("Total Balance")
                            .font(.title)
                            .bold()
                            .foregroundColor(.gray)
                        Text("$ 69,420")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    }
                    
                    Picker(selection: $incomeExpense.onChange(colorChange), label: Text(""), content: {
                        Text("Income").tag(1)
                        Text("Expenses").tag(2)
                    }).pickerStyle(SegmentedPickerStyle())
                    .padding(.trailing, 60)
                    .padding(.leading, 60)
                    .padding(.bottom, 60)

                    
                    CardView(showShadow: false) {
                        ChartLabel("", type: .custom(size: 30, padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0), color: .white))
                            .foregroundColor(.white)
                        BarChart()
                    }
                    .data(getNumbers())
                    .chartStyle(mixedColorStyle)
                    .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                    //Months
                    MonthView()
                    Spacer()
                    
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.5399802801, green: 0.01270869007, blue: 0.9686274529, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                            .frame(width: UIScreen.main.bounds.width*0.8, height: 100, alignment: .center)
                            .cornerRadius(15)
                            
                        HStack {
                            CircularProgress(percentage: progress,
                                             fontSize: 12,
                                             backgroundColor: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1522367295)),
                                             fontColor : .white,
                                             borderColor1: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5648009418)),
                                             borderColor2: LinearGradient(gradient: Gradient(colors: [.white,.white]),startPoint: .top,endPoint: .bottom), borderWidth: 10)
                                
                                .frame(width: 80)
                                .padding(.trailing, 20)
                                .animation(.easeIn)
                            
                            VStack(alignment: .leading){
                                Text("Your credit limit\n")
                                    .font(.system(size: 17))
                                    .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                                Text("$12,750 of $52.000")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                    .bold()
                                
                            }.padding(.trailing, 20)
                            
                            Image(systemName: "arrow.right.circle.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .scaledToFit()
                                .frame(width: 30)
                                .opacity(0.8)
                            
                        }
                    }
                    Spacer()
                }
            }
        }.navigationBarHidden(true)
    }
    func colorChange(_ tag: Int) {
        self.progress = CGFloat(Int.random(in: 0..<100))/100
    }
    
    func getNumbers() -> [Double] {
        var data = Array<Double>()
        data = (0..<16).map { _ in .random(in: 9.0...100.0) }
        return data
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}


struct MonthView: View {
    var body: some View {
        HStack {
            Text("Jun")
            Spacer()
            Text("Jul")
            Spacer()
            Text("Aug").bold()
            Spacer()
            Text("Sep")
            Spacer()
            Text("Oct")
        }
        .foregroundColor(.white)
        .padding(.leading, 30)
        .padding(.trailing, 40)
    }
}
