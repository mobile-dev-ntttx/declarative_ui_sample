//
//  QRCode.swift
//  QRCodeGenerate
//
//  Created by 神長貴博 on 2022/08/19.
//

import UIKit

class QRCode {
    func generate(str: String) -> UIImage {
        let data = str.data(using: String.Encoding.utf8)!

        let qr = CIFilter(name: "CIQRCodeGenerator", parameters:  ["inputMessage": data, "inputCorrectionLevel": "M"])!
        let sizeTransform = CGAffineTransform(scaleX: 10, y: 10)
        let qrImage = qr.outputImage!.transformed(by: sizeTransform)
        let context = CIContext()
        let cgImage = context.createCGImage(qrImage, from: qrImage.extent)
        let uiImage = UIImage(cgImage: cgImage!)

        return uiImage
    }
}
