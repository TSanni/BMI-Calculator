//
//  CalculateViewController.swift
//  BMI Calculator
//
//  Created by Tomas Sanni on 6/18/24.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var bmiCalc = BMICalculator()
    
    let verticalStack = UIStackView()
    let appTitle = UILabel()
    
    let heightHorizontalStack = UIStackView()
    
    let heightHStackName = UILabel()
    let heightHStackValue = UILabel()
    
    let heightSlider = UISlider()
    
    let weightHorizontalStack = UIStackView()
    
    let weightHStackName = UILabel()
    let weightHStackValue = UILabel()
    
    let weightSlider = UISlider()
    
    let calculateButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: view.bounds)
        backgroundImage.image = .calculateBackground
        view.addSubview(backgroundImage)
        configureVStack()
        handleSliderChange()
    }
    
    func configureVStack() {
        view.addSubview(verticalStack)
        verticalStack.addArrangedSubview(appTitle)
        verticalStack.addArrangedSubview(heightHorizontalStack)
        verticalStack.addArrangedSubview(heightSlider)
        verticalStack.addArrangedSubview(weightHorizontalStack)
        verticalStack.addArrangedSubview(weightSlider)
        verticalStack.addArrangedSubview(calculateButton)

        verticalStack.axis = .vertical
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.distribution = .equalSpacing
        
        appTitle.text = "Calculate your BMI"
        appTitle.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        appTitle.numberOfLines = 0
        appTitle.textColor = .darkGray
        
        
        configureHeightHStack()
        configureWeightHStack()
        handleButton()
        
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verticalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            verticalStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            appTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appTitle.heightAnchor.constraint(equalToConstant: 600)
        ])
        
    }
    
    func configureHeightHStack() {
        heightHorizontalStack.axis = .horizontal
        heightHorizontalStack.translatesAutoresizingMaskIntoConstraints = false
        heightHorizontalStack.distribution = .equalSpacing
        
        heightHorizontalStack.addArrangedSubview(heightHStackName)
        heightHorizontalStack.addArrangedSubview(heightHStackValue)
        
        heightHStackName.text = "Height"
        heightHStackValue.text = "1.50m"
        
        heightSlider.minimumValue = 0
        heightSlider.maximumValue = 3
        heightSlider.value = 1.5

        NSLayoutConstraint.activate([
            heightHorizontalStack.heightAnchor.constraint(equalToConstant: 21),
            
            heightSlider.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configureWeightHStack() {
        weightHorizontalStack.axis = .horizontal
        weightHorizontalStack.translatesAutoresizingMaskIntoConstraints = false
        weightHorizontalStack.distribution = .equalSpacing
        
        weightHorizontalStack.addArrangedSubview(weightHStackName)
        weightHorizontalStack.addArrangedSubview(weightHStackValue)
        
        weightHStackName.text = "Weight"
        weightHStackValue.text = "100Kg"
        
        weightSlider.minimumValue = 0
        weightSlider.maximumValue = 200
        weightSlider.value = 100

        NSLayoutConstraint.activate([
            weightHorizontalStack.heightAnchor.constraint(equalToConstant: 21),
            
            weightSlider.heightAnchor.constraint(equalToConstant: 60)

        ])
    }
    
    func handleButton() {
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.backgroundColor = #colorLiteral(red: 0.3858742714, green: 0.3768186569, blue: 0.6159339547, alpha: 1)
        calculateButton.addTarget(self, action: #selector(pushResultViewController), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            calculateButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func pushResultViewController() {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        bmiCalc.calculateBMI(height: height, weight: weight)
        
        let resultVC = ResultViewController()
        resultVC.bmiValue = bmiCalc.getBMIValue()
        resultVC.advice = bmiCalc.getAdvice()
        resultVC.color = bmiCalc.getColor()
        
        navigationController?.pushViewController(resultVC, animated: true)
    }
    
    func handleSliderChange() {
        heightSlider.addTarget(self, action: #selector(setHeight), for: .valueChanged)
        weightSlider.addTarget(self, action: #selector(setWeight), for: .valueChanged)
    }

    @objc func setHeight(slider: UISlider) {
        let height = String(format: "%.2f", slider.value) + "m"
        heightHStackValue.text = height
    }

    @objc func setWeight(slider: UISlider) {
        let weight = String(format: "%.2f", slider.value) + "m"
        weightHStackValue.text = weight
    }
}

#Preview {
    CalculateViewController()
}
