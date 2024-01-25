//
//  AddNewMyPlantViewController.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 24.01.24.
//

import UIKit

class AddNewMyPlantViewController: UIViewController {

    // MARK: - Class Properties
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
    
    private let myPlantImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.image = UIImage(systemName: "photo")
        image.tintColor = .systemGray
        return image
    }()
    
    private let addPhotoHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    private let takePhotoButton: UIButton = {
        let button = UIButton()
        let takePhotoImage = UIImage(systemName: "camera.fill")
        button.setImage(takePhotoImage, for: .normal)
        return button
    }()
    
    private let choosePhotoFromLibraryButton: UIButton = {
        let button = UIButton()
        let choosePhotoImage = UIImage(systemName: "photo.on.rectangle")
        button.setImage(choosePhotoImage, for: .normal)
        return button
    }()
    
    private let myPlantNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Plant Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor.systemGray.cgColor
        
        // Add left padding to the text field
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.size.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    private let myPlantDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.layer.cornerRadius = 16
        textView.layer.borderWidth = 1
        textView.layer.masksToBounds = true
        textView.layer.backgroundColor = UIColor.white.cgColor
        textView.layer.borderColor = UIColor.gray.cgColor
        return textView
    }()
    
    private let textViewPlaceholderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter Plant Description(Optional)"
        label.textColor = .systemGray.withAlphaComponent(0.5)
        return label
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
        setupDelegates()
    }
    // MARK: - Setup UI
    private func setupUI() {
        setupBackground()
        setupSubViews()
        setupTakePhotoButton()
        setupChoosePhotoFromLibraryButton()
        setupSaveButton()
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupSubViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(myPlantImageView)
        verticalStackView.addArrangedSubview(addPhotoHorizontalStackView)
        setupAddPhotoHorizontalStackViewSubviews()
        verticalStackView.addArrangedSubview(makeDividerLine())
        verticalStackView.addArrangedSubview(myPlantNameTextField)
        verticalStackView.addArrangedSubview(makeDividerLine())
        verticalStackView.addArrangedSubview(myPlantDescriptionTextView)
        myPlantDescriptionTextView.addSubview(textViewPlaceholderLabel)
        verticalStackView.addArrangedSubview(saveButton)
    }
    
    private func setupAddPhotoHorizontalStackViewSubviews() {
        addPhotoHorizontalStackView.addArrangedSubview(UIView())
        addPhotoHorizontalStackView.addArrangedSubview(takePhotoButton)
        addPhotoHorizontalStackView.addArrangedSubview(choosePhotoFromLibraryButton)
        addPhotoHorizontalStackView.addArrangedSubview(UIView())
    }
    
    private func setupTakePhotoButton() {
        takePhotoButton.addAction(UIAction(handler: { [weak self] action in
            guard let self else { return }
            self.showCamera()
        }), for: .touchUpInside)
        
    }
    
    private func setupChoosePhotoFromLibraryButton() {
        choosePhotoFromLibraryButton.addAction(UIAction(handler: { [weak self] action in
            guard let self = self else { return }
            self.showPhotoLibrary()
        }), for: .touchUpInside)
    }
    
    private func setupSaveButton() {
        saveButton.addAction(UIAction(handler: { [weak self] action in
            guard let self = self else { return }
            print("Save Button Tapped")
        }), for: .touchUpInside)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setupScrollViewConstraints()
        setupVerticalStackViewConstraints()
        setupMyPlantImageViewConstraints()
        setupMyPlantNameTextFieldConstraints()
        setupMyPlantDescriptionTextViewConstraints()
        setupTextViewPlaceholderLabelConstraints()
        setupSaveButtonConstraints()
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
    
    private func setupMyPlantImageViewConstraints() {
        myPlantImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    private func setupMyPlantNameTextFieldConstraints() {
        myPlantNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupMyPlantDescriptionTextViewConstraints() {
        myPlantDescriptionTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    private func setupTextViewPlaceholderLabelConstraints() {
        textViewPlaceholderLabel.topAnchor.constraint(equalTo: myPlantDescriptionTextView.topAnchor, constant: 10).isActive = true
        textViewPlaceholderLabel.leadingAnchor.constraint(equalTo: myPlantDescriptionTextView.leadingAnchor, constant: 10).isActive = true
    }
    
    private func setupSaveButtonConstraints() {
        saveButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
    }
    
    // MARK: - Setup Delegates
    private func setupDelegates() {
        myPlantDescriptionTextView.delegate = self
    }
    
    // MARK: - Class Methods
    private func showCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    private func showPhotoLibrary() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    private func makeDividerLine() -> UIView {
        let dividerLine = UIView()
        dividerLine.backgroundColor = UIColor.systemGray.withAlphaComponent(0.5)
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        dividerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return dividerLine
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
        textViewPlaceholderLabel.isHidden = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textViewPlaceholderLabel.isHidden = false
        }
    }
}
