import Foundation

enum Currency: String, Identifiable, CaseIterable {
    case RUR
    case CNY
    case EUR
    case USD
    
    var id: Self { self } // for protocol identifiable
    
    var flag: String {
        switch self {
        case .RUR: return "🇷🇺"
        case .CNY: return "🇨🇳"
        case .EUR: return "🇪🇺"
        case .USD: return "🇺🇸"
        }
    }
        
}

typealias CurrencyRates = [Currency: Double]

struct CurrencyAmount {
    let currency: Currency
    let amount: Double
}
