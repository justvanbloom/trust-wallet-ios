// Copyright SIX DAY LLC. All rights reserved.

import Foundation
import BigInt

struct GasViewModel {
    let fee: BigInt
    let symbol: String
    let currencyRate: CurrencyRate?
    let formatter: EtherNumberFormatter

    init(
        fee: BigInt,
        symbol: String,
        currencyRate: CurrencyRate? = nil,
        formatter: EtherNumberFormatter = .full
    ) {
        self.fee = fee
        self.symbol = symbol
        self.currencyRate = currencyRate
        self.formatter = formatter
    }

    var feeText: String {
        let gasFee = formatter.string(from: fee)
        var text = "\(gasFee.description) \(symbol)"

        if let feeInCurrency = currencyRate?.estimate(fee: gasFee, with: symbol),
            let result = currencyRate?.format(fee: feeInCurrency) {
            text += " (\(result))"
        }
        return text
    }
}
