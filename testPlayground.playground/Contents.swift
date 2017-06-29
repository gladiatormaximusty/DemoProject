

import UIKit

let date = Date()

let dateForMatter = DateFormatter()
let Test = dateForMatter.date(from: "00:30")
let addTime = Calendar.current.date(byAdding: .init(minute: 30), to: date)