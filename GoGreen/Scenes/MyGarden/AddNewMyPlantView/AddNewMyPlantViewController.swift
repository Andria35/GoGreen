//
//  AddNewMyPlantViewController.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 24.01.24.
//

import UIKit

protocol AddNewMyPlantViewControllerDelegate: AnyObject {
    func saveTapped(myPlantName: String?, myPlantImage: UIImage?, myPlantDescription: String?, notificationRepeatDays: Double)
}

final class AddNewMyPlantViewController: UIViewController {
    
    // MARK: - Class Properties
    private let pickerViewValues = Array(0...100)
    private var notificationRepeatDays: Double = 0
    private let imagePickerManager: ImagePicking
    weak var delegate: AddNewMyPlantViewControllerDelegate?
    
    // MARK: - UI Components
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
    private let myPlantImageView = CustomUIImageView(customImage: UIImage(systemName: "photo"), customTintColor: .systemGray, opacity: 0.1, height: 300, width: nil)
    
    private let addPhotoHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    lazy private var takePhotoButton = CustomUIButton(title: nil, image: UIImage(systemName: "camera.fill"), customBackgroundColor: nil, fontSize: nil, isRounded: false, height: nil, width: nil, customAction: takePhotoButtonTapped)
    
    lazy private var choosePhotoFromLibraryButton = CustomUIButton(title: nil, image: UIImage(systemName: "photo.on.rectangle"), customBackgroundColor: nil, fontSize: nil, isRounded: false, height: nil, width: nil, customAction: choosePhotoFromLibraryButtonTapped)
    
    private let myPlantNameTextField = CustomUITextField(placeholder: "Plant Name")
    
    private let notificationTextField = CustomUITextField(placeholder: "Notification")
    
    private var notificationPickerView = UIPickerView()
    
    private let myPlantDescriptionTextView = CustomUITextView(placeholder: "Enter Plant Description(Optional)")
    
    lazy private var saveButton = CustomUIButton(title: "Save", image: nil, customBackgroundColor: .systemGray, fontSize: .big, isRounded: true, isEnabled: false, height: 65, width: nil, customAction: saveButtonTapped)
    
    private let setupWateringReminderLabel = CustomUILabel(customText: "Set Up Watering Reminder(Optional):", fontSize: .small, customNumberOfLines: 0, alpha: 0.8)
    
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupDelegates()
        setupToHideKeyboardOnTapOnView()
        registerKeyboardNotifications()
    }
    
    // MARK: - Initialization
    init(notificationManager: Notifying, imagePickerManager: ImagePicking) {
        self.imagePickerManager = imagePickerManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupBackground()
        setupSubViews()
        setupNotificationTextField()
    }
    
    private func setupBackground() {
        view.backgroundColor = UIColor.mainBackgroundColor
    }
    
    private func setupSubViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(myPlantImageView)
        verticalStackView.addArrangedSubview(addPhotoHorizontalStackView)
        verticalStackView.addArrangedSubview(CustomUIDividerLine())
        verticalStackView.addArrangedSubview(myPlantNameTextField)
        verticalStackView.addArrangedSubview(CustomUIDividerLine())
        verticalStackView.addArrangedSubview(setupWateringReminderLabel)
        verticalStackView.addArrangedSubview(notificationTextField)
        
        verticalStackView.addArrangedSubview(CustomUIDividerLine())
        verticalStackView.addArrangedSubview(myPlantDescriptionTextView)
        
        verticalStackView.addArrangedSubview(saveButton)
        setupAddPhotoHorizontalStackViewSubviews()
    }
    
    private func setupAddPhotoHorizontalStackViewSubviews() {
        addPhotoHorizontalStackView.addArrangedSubview(UIView())
        addPhotoHorizontalStackView.addArrangedSubview(takePhotoButton)
        addPhotoHorizontalStackView.addArrangedSubview(choosePhotoFromLibraryButton)
        addPhotoHorizontalStackView.addArrangedSubview(UIView())
    }
    
    private func takePhotoButtonTapped() {
        imagePickerManager.showCamera(viewController: self)
    }
    
    private func choosePhotoFromLibraryButtonTapped() {
        imagePickerManager.showPhotoLibrary(viewController: self)
    }
    
    private func saveButtonTapped() {
        delegate?.saveTapped(
            myPlantName: myPlantNameTextField.text,
            myPlantImage: myPlantImageView.image,
            myPlantDescription: myPlantDescriptionTextView.text,
            notificationRepeatDays: notificationRepeatDays)
        
        navigationController?.popViewController(animated: true)
    }
    
    private func setupNotificationTextField() {
        notificationTextField.inputView = notificationPickerView
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setupScrollViewConstraints()
        setupVerticalStackViewConstraints()
    }
    
    private func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupVerticalStackViewConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            verticalStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            verticalStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            verticalStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            verticalStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10)
        ])
    }
    
    // MARK: - Setup Delegates
    private func setupDelegates() {
        myPlantDescriptionTextView.delegate = self
        notificationPickerView.delegate = self
        myPlantNameTextField.delegate = self
        notificationTextField.delegate = self
    }
}

// MARK: - ImagePicker Delegate
extension AddNewMyPlantViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.editedImage] as? UIImage {
            myPlantImageView.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

// MARK: - TextView Delegate
extension AddNewMyPlantViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        myPlantDescriptionTextView.hidePlaceholderLabel()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            myPlantDescriptionTextView.unhidePlaceholderLabel()
        }
    }
}

// MARK: - PickerView DataSource
extension AddNewMyPlantViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerViewValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(pickerViewValues[row])"
    }
}

// MARK: - PickerView Delegate
extension AddNewMyPlantViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        notificationRepeatDays = Double(pickerViewValues[row])
        let day = notificationRepeatDays == 1 ? "Day" : "Days"
        notificationTextField.text = "Repeat Every \(pickerViewValues[row]) " + day
        notificationTextField.resignFirstResponder()
    }
}

// MARK: UITextField Delegate
extension AddNewMyPlantViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == myPlantNameTextField {
            
            if let text = myPlantNameTextField.text, !text.isEmpty {
                saveButton.backgroundColor = .systemBlue
                saveButton.isEnabled = true
            } else {
                saveButton.backgroundColor = .systemGray
                saveButton.isEnabled = false
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - KeyboardNotifications
extension AddNewMyPlantViewController {
    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIControl.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIControl.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrameValue = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }
        let keyboardFrame = view.convert(keyboardFrameValue.cgRectValue, from: nil)
        scrollView.contentOffset = CGPoint(x: 0, y: keyboardFrame.size.height)
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        scrollView.contentOffset = .zero
    }
}
