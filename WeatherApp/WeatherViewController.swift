//
//  ViewController.swift
//  WeatherApp
//
//  Created by Viktor Teslenko on 24.03.2024.
//

import UIKit

class WeatherViewController: UIViewController {
    var mainView: WeatherView! { return self.view as? WeatherView }
    let presenter: WeatherPresenter!
    
    init(with presenter: WeatherPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBackground()
    }

    func updateBackground() {
        self.mainView.updateGradient(presenter.backgroundColors)
    }
    
    override func loadView() {
        self.view = WeatherView(frame: UIScreen.main.bounds)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransition(to: size, with: coordinator)
        let isLandscape = size.width > size.height
        if isLandscape {
            mainView.centerContentStack.axis = .horizontal
        } else {
            mainView.centerContentStack.axis = .vertical
        }
    }
}

