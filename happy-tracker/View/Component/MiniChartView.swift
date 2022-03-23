//
//  MiniChartView.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 3/22/22.
//

import SwiftUI
import SwiftUICharts

struct MiniChartView: View {
    
    private let rateValue: Bool = false
    var body: some View {
        ZStack(alignment: .leading){
            
            LineChartView(data: [0,10,20,30,100],
                          title: "Emotion tracker",
                          legend: "Happy",
                          // style:
                          //                      ChartStyle(backgroundColor: Color.blue, accentColor: Color.red,
                          //                          gradientColor: GradientColor(start: .blue, end: .purple),
                          //                          textColor: Color.black,
                          //                          legendTextColor: Color.red,
                          //                          dropShadowColor: Color.orange),
                          form: ChartForm.extraLarge,
                          
                          
                          dropShadow: true
                          
            )
            
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 80, height: 75, alignment: .leading)
        }
    }
}

struct MiniChartView_Previews: PreviewProvider {
    static var previews: some View {
        MiniChartView()
    }
}
