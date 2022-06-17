//
//  DateUtils.swift
//  Birthdays
//
//  Created by Moorthy, Prashanth on 30/03/22.
//

// https://stackoverflow.com/questions/43663622/is-a-date-in-same-week-month-year-of-another-date-in-swift
import Foundation

extension Date {

    func toLongString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long

        return formatter.string(from: self)
    }
    
    func isEqual(to date: Date, toGranularity component: Calendar.Component, in calendar: Calendar = .current) -> Bool {
        calendar.isDate(self, equalTo: date, toGranularity: component)
    }
    
    func isInSameYear(as date: Date) -> Bool { isEqual(to: date, toGranularity: .year) }
    func isInSameMonth(as date: Date) -> Bool { isEqual(to: date, toGranularity: .month) }
    func isInSameWeek(as date: Date) -> Bool { isEqual(to: date, toGranularity: .weekOfYear) }
    
    func isInSameDay(as date: Date) -> Bool { Calendar.current.isDate(self, inSameDayAs: date) }
    
    var isInThisYear:  Bool { isInSameYear(as: Date()) }
    var isInThisMonth: Bool { isInSameMonth(as: Date()) }
    var isInThisWeek:  Bool { isInSameWeek(as: Date()) }
    
    var isInYesterday: Bool { Calendar.current.isDateInYesterday(self) }
    var isInToday:     Bool { Calendar.current.isDateInToday(self) }
    var isInTomorrow:  Bool { Calendar.current.isDateInTomorrow(self) }
    
    var isInNextMonth: Bool { isInSameMonth(as: Calendar.current.date(byAdding: .month, value: 1, to: Date())!) }
    
    var isInTheFuture: Bool { self > Date() }
    var isInThePast:   Bool { self < Date() }
}
