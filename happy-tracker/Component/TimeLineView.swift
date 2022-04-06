//
//  TimeLineView.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 4/5/22.
//

import SwiftUI
import LineChartView
import Firebase

struct TimeLineView: View {
    
    let calendar = Calendar(identifier: .gregorian)
    
    let dateFormatter = CustomDateFormatter.shared
    
    var dates: [Date] = []
    var values: [Double] = []
    var labels: [String] = []
    
    init(sessions: [RecordModel]){
        
        var previousDate = Date.distantPast
        
        sessions.forEach { listedSession in
            
            let date = listedSession.timestamp.dateValue()
            
            let value = EmotionPrediction(
                happyConf: listedSession.happyConf,
                sadConf: listedSession.sadConf).emotionIndex * 100
            
            var label = dateFormatter.format(date: date) + "\n"
            
            if listedSession.comment.count < 30 {
                label += listedSession.comment
            } else {
                label += listedSession.comment.prefix(27) + "..."
            }
            
            // if same day, overwrite prev record in graph
            if calendar.isDate(date, inSameDayAs: previousDate) {
                dates[dates.count - 1] = date
                values[values.count - 1] = value
                labels[labels.count - 1] = label
            } else {
                // add after previous date and update previous date
                dates.append(date)
                values.append(value)
                labels.append(label)
                previousDate = date
            }
        }
    }
    
    var body: some View {
        
        LineChartView(
            lineChartParameters: LineChartParameters(
                data: values,
                dataTimestamps: dates,
                dataLabels: labels,
                labelColor: .indigo,
                secondaryLabelColor: .secondary,
                labelsAlignment: .left,
                dataPrecisionLength: 0,
                indicatorPointColor: .mint,
                indicatorPointSize: 10,
                lineColor: .purple.opacity(0.7),
                lineSecondColor: .mint,
                lineWidth: 4,
                dotsWidth: 3,
                dragGesture: true,
                hapticFeedback: true)
        )
            .background(Color(UIColor.systemBackground))
            .overlay(Rectangle().stroke())
            .aspectRatio(1.5, contentMode: .fit)
            .padding(.horizontal)
        
        
    }
}

struct TimeLineView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        
        let sessions = [
            RecordModel(id: "id", userID: "uid", timestamp: Timestamp(date: Date.now), happyConf: 0.8, sadConf: 0.0, comment: "This is a really long com ment without intentional line breaks"),
            RecordModel(id: "id", userID: "uid", timestamp: Timestamp(date: Date.now + 1), happyConf: 0.0, sadConf: 0.0, comment: "This is a shorter comment"),
            RecordModel(id: "id", userID: "uid", timestamp: Timestamp(date: Date.now + 3600 * 10), happyConf: 0.5, sadConf: 0.0, comment: "This is a really long comment without intentional line breaks")]
        
        TimeLineView(sessions: sessions)
        
    }
}
