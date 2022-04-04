//
//  MiniListRow.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 3/24/22.
//



import SwiftUI
import Firebase

struct MiniListRow: View {
    
    var backgroundOpacity: Double
    
    var session: RecordModel
    
    var formatter = CustomDateFormatter.shared
    
    var emotionLabel: String
    
    init(session: RecordModel, backgroundOpacity: Double) {
        self.session = session
        self.backgroundOpacity = backgroundOpacity
        let emotion = EmotionPrediction(happyConf: session.happyConf, sadConf: session.sadConf)
        emotionLabel = emotion.emotionIndex > 0.5 ? "Happy" : "Sad"
    }
    
    var body: some View {
        ZStack {
            Color.mint.opacity(backgroundOpacity)
            HStack(alignment: .top, spacing: 0.0) {
                
                VStack(alignment: .leading) {
                    Text(formatter.format(date: session.timestamp.dateValue()))
                        .fontWeight(.thin)
                        .frame(width: 110, alignment: .leading)
                    
                    Text(emotionLabel)
                        .fontWeight(.bold)
                        .frame(width: 70, alignment: .leading)
                }
                .padding(.leading)

                Rectangle()
                    .frame(width: 0.5)
                    .foregroundColor(.primary.opacity(0.5))
                
                Text(session.comment)
                    .padding(.horizontal)
                
                Spacer()
                
            }
            .padding(.vertical)
        }
    }
}

struct MiniListRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            
            MiniListRow(session: RecordModel(id: "id", userID: "uid", timestamp: Timestamp(date: Date()), happyConf: 8.0, sadConf: 0.0, comment: "This is a really long com ment without intentional line breaks"), backgroundOpacity: 0.2)
            MiniListRow(session: RecordModel(id: "id", userID: "uid", timestamp: Timestamp(date: Date()), happyConf: 0.0, sadConf: 0.0, comment: "This is a shorter comment"), backgroundOpacity: 0.1)
            MiniListRow(session: RecordModel(id: "id", userID: "uid", timestamp: Timestamp(date: Date()), happyConf: 6.0, sadConf: 0.0, comment: "This is a really long comment without intentional line breaks"), backgroundOpacity: 0.2)
        }
    }
}

struct CustomDateFormatter {
    let dateFormatter = DateFormatter()
    
    static let shared = CustomDateFormatter()
    
    private init() {
        dateFormatter.dateFormat = "MMM d, yyyy"
    }
    
    func getShared() {
        //        return self.sh
    }
    
    func format(date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}
