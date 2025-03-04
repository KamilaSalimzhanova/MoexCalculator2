import Foundation

struct CalculatorModel {
    private(set) var currencyRates: [Currency: Double] = [.RUR: 1, .CNY: 12]
    
    mutating func setCurrencyRate(currencyRates:  [Currency: Double]) {
        self.currencyRates = currencyRates
    }
    
    func convert(from currentAmount: CurrencyAmount, to target: Currency) -> Double {
        guard
            let currentAmountCurrencyRate = currencyRates[currentAmount.currency],
            let targetCurrencyRate = currencyRates[target] else { return 0 }
        
        if targetCurrencyRate.isZero { return 0 }
        
        return currentAmount.amount * currentAmountCurrencyRate/targetCurrencyRate
    }
}
