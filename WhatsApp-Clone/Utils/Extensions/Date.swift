//
//  Date.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 27/05/24.
//

import Foundation

extension Date {
    private var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateFormat = "dd/MM/yy"
        return formatter
    }
    
    private var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateFormat = "HH:mm"
        return formatter
    }
    
    func dateString() -> String {
        dayFormatter.string(from: self)
    }
    
    func timeString() -> String {
        timeFormatter.string(from: self)
    }
    
    func chatTimestampString() -> String {
        if Calendar.current.isDateInToday(self) {
            return "Today"
        } else if Calendar.current.isDateInYesterday(self) {
            return "Yesterday"
        } else {
            return dateString()
        }
    }
}
