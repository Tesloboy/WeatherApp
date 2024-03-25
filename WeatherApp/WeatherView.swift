//
//  WeatherView.swift
//  Weather
//
//  Created by Viktor Teslenko on 24.03.2024.
//

import UIKit

// Класс в котором определим все подвиды текущего экрана
class WeatherView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Метод настройки subview.После вызова все subview будут разом вызваны
    private func setup() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        //Распологаем View в порядке добавления
        self.addSubview(mainStack)
        mainStack.addArrangedSubview(topStack)
        topStack.addArrangedSubview(UIView(frame: .zero))
        topStack.addArrangedSubview(calendarButton)

        mainStack.addArrangedSubview(centerContentStack)
        centerContentStack.addArrangedSubview(temperatureLabel)
        centerContentStack.addArrangedSubview(cityAndConditionsStack)
        
        cityAndConditionsStack.addArrangedSubview(cityLabel)
        cityAndConditionsStack.addArrangedSubview(conditionsLabel)
        cityAndConditionsStack.addArrangedSubview(conditionsImageView)
        
        mainStack.addArrangedSubview(infoStack)
        infoStack.addArrangedSubview(windStack)
        windStack.addArrangedSubview(windInfoView)
        windStack.addArrangedSubview(windInfoLabel)
        
        infoStack.addArrangedSubview(cloudinessStack)
        cloudinessStack.addArrangedSubview(cloudinessInfoView)
        cloudinessStack.addArrangedSubview(cloudinessInfoLabel)
        
        infoStack.addArrangedSubview(humidityStack)
        humidityStack.addArrangedSubview(humidityInfoView)
        humidityStack.addArrangedSubview(humidityInfoLabel)
        
        infoStack.addArrangedSubview(pressureStack)
        pressureStack.addArrangedSubview(pressureInfoView)
        pressureStack.addArrangedSubview(pressureInfoLabel)

        
    }
     
    private func setupConstraints() {
        mainStack.pinEdgesToSafeAria(of: self)
    }
    
    
    // MARK: - STACK
    
    //Главный Стэк
    let mainStack: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical //Распределяем элементы сверху вниз
        stackView.distribution = .equalSpacing //Делим стек на равные интервалы чтобы не растягивались
        stackView.spacing = 10
        //Поля
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(
            top: 10,
            left: 30,
            bottom: 30,
            right: 30)
        
        return stackView
    }()
    
    //Стек верхней части
    let topStack: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    //Стэк изображения погоды
    let conditionsImageStack: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.spacing = 10
        return stackView
    }()
    
    //Стек календаря
    let calendarStack: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .trailing
        stackView.spacing = 10
        return stackView
    }()
    
    //Стэк города и погоды
    let cityAndConditionsStack: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10 //60
        stackView.alignment = .center
        return stackView
    }()
    
    //Стек центральный
    let centerContentStack: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    //Информационный стэк
    let infoStack: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.spacing = 10
        return stackView
    }()
    
    //Стек ветра
    let windStack: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 10
        return stackView
    }()
    
    //Стек облачности
    let cloudinessStack: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 10
        return stackView
    }()
    
    //Стек влажности
    let humidityStack: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 10
        return stackView
    }()
    
    //Стек давления
    let pressureStack: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 10
        return stackView
    }()

}
    
    // MARK: - Views
//Изображение погоды
let conditionsImageView: UIImageView = {
    let image = UIImage(named: "sun")
    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    imageView.widthAnchor.constraint(equalToConstant: image!.size.width).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: image!.size.height).isActive = true
    return imageView
}()

    //Лейбл Темпиратуры
    let temperatureLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 144)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "18°"
        return label
    }()
    
    //Лейбл города
    let cityLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 50)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Moscow"
        return label
    }()
    
    //Лейбл погоды
    let conditionsLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Sunny"
        return label
    }()

    
    //Кнопка календаря
    let calendarButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("7 days", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
//Изображения инфо вью
let windInfoView: UIView = {
    let image = UIImage(named: "sun")
    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    imageView.widthAnchor.constraint(equalToConstant: image!.size.width).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: image!.size.height).isActive = true
    return imageView
}()

let cloudinessInfoView: UIView = {
    let image = UIImage(named: "sun")
    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    imageView.widthAnchor.constraint(equalToConstant: image!.size.width).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: image!.size.height).isActive = true
    return imageView
}()

let humidityInfoView: UIView = {
    let image = UIImage(named: "sun")
    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    imageView.widthAnchor.constraint(equalToConstant: image!.size.width).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: image!.size.height).isActive = true
    return imageView
}()

let pressureInfoView: UIView = {
    let image = UIImage(named: "sun")
    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    imageView.widthAnchor.constraint(equalToConstant: image!.size.width).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: image!.size.height).isActive = true
    return imageView
}()

//Лейблы инфо вью
let windInfoLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = UIFont.systemFont(ofSize: 10)
    label.text = "3 м/с, Ю"
    label.textColor = .white
    label.textAlignment = .center
    return label
}()

let cloudinessInfoLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = UIFont.systemFont(ofSize: 10)
    label.text = "35 %"
    label.textColor = .white
    label.textAlignment = .center
    return label
}()

let humidityInfoLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = UIFont.systemFont(ofSize: 10)
    label.text = "63 %"
    label.textColor = .white
    label.textAlignment = .center
    return label
}()

let pressureInfoLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = UIFont.systemFont(ofSize: 10)
    label.text = "742 мм"
    label.textColor = .white
    label.textAlignment = .center
    return label
}()


extension WeatherView {
    var gardientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
    }
//Используем кастомный набор слоев вместо стандартного
    override class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    //Метод обновления цветов с помощью ViewController
    func updateGradient(_ colors: [CGColor]) {
        gardientLayer.colors = colors
    }
    
}
