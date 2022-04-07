//
//  MiniChartView.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 3/22/22.
//

import SwiftUI
import SwiftUICharts
import Firebase

struct MiniChartView: View {
    
    var miniChartYValues: [Double]
    
    init(sessions: [RecordModel]){
        
        miniChartYValues = sessions.map({ session in
            return EmotionPrediction(happyConf: session.happyConf, sadConf: session.sadConf).emotionIndex*100
        }).reversed() //.reversed to make oldest -> newest, left to right on the chart
        
        //print("DEBUG: mini chart view init, chart values are => \(miniChartYValues)")
        
    }

    var body: some View {
        ZStack(alignment: .leading){
            
            LineChartView(data: miniChartYValues,
                          title: "Emotion Record",
                          legend: "Happy",
                          form: ChartForm.extraLarge,
                          rateValue: 0,
                          dropShadow: true
                          
            )
            
     
        }
    }
    
    
    
}

struct MiniChartView_Previews: PreviewProvider {
    
    static var previews: some View {
        let sessions = [
            RecordModel(id: "id", userID: "uid", timestamp: Timestamp(date: Date()), happyConf: 8.0, sadConf: 0.0, comment: "This is a really long com ment without intentional line breaks"),
            RecordModel(id: "id", userID: "uid", timestamp: Timestamp(date: Date()), happyConf: 0.0, sadConf: 0.0, comment: "This is a shorter comment"),
            RecordModel(id: "id", userID: "uid", timestamp: Timestamp(date: Date()), happyConf: 6.0, sadConf: 0.0, comment: "This is a really long comment without intentional line breaks")]
        
        MiniChartView(sessions: sessions)
    }
}
