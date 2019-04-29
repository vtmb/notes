    ```swift
    /// Prüft, ob es ein Bild mit bestimmten Dateinamen gibt und liefert es ggf zurück
    ///
    /// - Parameter name: Dateiname
    /// - Returns: Bild, falls vorhanden
    private func getUIImage(withName name: String) -> UIImage? {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = URL(fileURLWithPath: path)
        let filePath = url.appendingPathComponent(name).path
        return UIImage.init(contentsOfFile: filePath)
    }
    
    
    /// Speichert ein Bild unter einem beliebigen Namen ab. Die Completion teilt mit, ob das Bild gespeichert werden konnte oder auch nicht.
    ///
    /// - Parameters:
    ///   - image: Bild zum speichern
    ///   - name: Name, unter dem das Bild gespeichert werden soll
    ///   - completion: true, wenn das Bild gespeichert wurde, false bei Fehlschlag
    private func write(image: UIImage, withName name: String, completion: (_ success: Bool) -> ()) {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = URL(fileURLWithPath: path)
        let filePath = url.appendingPathComponent(name).path
        guard let data = UIImagePNGRepresentation(image), let fileURL = URL(string: filePath) else {
            completion(false)
            return
        }
        
        do {
            try data.write(to: fileURL)
            completion(true)
        } catch {
            completion(false)
        }
    }
    ```

```swift
    private func addTapRecognizer(toView view: UIView) {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTapButton(sender:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(recognizer)
    }
    
    @objc private func didTapButton(sender: UIGestureRecognizer) {
        guard let view = sender.view else {
            return
        }
        
        switch view {
        case self.imageView:
        default:
            print(sender.debugDescription)
        }
     }

``
