//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Viktor Teslenko on 24.03.2024.
//

import UIKit

protocol WeatherPresenter {
    var backgroundColors: [CGColor] { get  }
}

class WeatherPresenterImpl: WeatherPresenter {
    var backgroundColors: [CGColor] {
        //        if (model .isSunny) {
        //            return sunnyColors
        //        }
        //        return snowyColors
        //    }
        return sunnyColors
    }
    
    private let sunnyColors: [CGColor] = {
        return [UIColor.sunnyTop.cgColor, UIColor.sunnyBottom.cgColor]
    }()
    
    private let snowyColors: [CGColor] = {
        return [UIColor.snowyTop.cgColor, UIColor.snowyBottom.cgColor]
    }()
    
    
}
