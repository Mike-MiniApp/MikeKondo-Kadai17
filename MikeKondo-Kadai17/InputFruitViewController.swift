//
//  InputFruitViewController.swift
//  MikeKondo-Kadai17
//
//  Created by 近藤米功 on 2022/09/16.
//

import UIKit

protocol InputFruitViewControllerDelegate: AnyObject {
    func didSaveFruit(name: String)
    func didEditFruit(name: String, index: Int)
}

class InputFruitViewController: UIViewController {
    struct EditModeDetail {
        let name: String
        let index: Int
    }

    enum ModeType {
        case input
        case edit(EditModeDetail)
    }

    // MARK: - UI Parts
    @IBOutlet private weak var fruitTextField: UITextField!

    var modeType: ModeType?
    weak var delegate: InputFruitViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        switch modeType {
        case .input:
            break
        case .edit(let detail):
            fruitTextField.text = detail.name
        case nil:
            fatalError("modeType is nil")
        }
    }

    @IBAction private func didSaveButton(_ sender: Any) {
        guard let fruitName = fruitTextField.text else { return }
        switch modeType {
        case .input:
            delegate?.didSaveFruit(name: fruitName)
        case .edit(let detail):
            delegate?.didEditFruit(name: fruitName, index: detail.index)
        default:
            break
        }
        dismiss(animated: true)
    }

    @IBAction private func didCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
}
