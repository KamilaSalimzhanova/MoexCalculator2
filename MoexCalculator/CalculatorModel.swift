import Foundation

struct CalculatorModel {
    private(set) var currencyRates: CurrencyRates = CurrencyRates()
    
    mutating func setCurrencyRate(currencyRates: CurrencyRates) {
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
