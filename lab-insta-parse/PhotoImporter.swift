import UIKit
import Photos

struct PhotoImporter {
    enum ImportError: LocalizedError {
        case noImagesFound
        case permissionDenied

        var errorDescription: String? {
            switch self {
            case .noImagesFound:
                return "No sample images were found in the asset catalog."
            case .permissionDenied:
                return "Permission to add photos was denied. You can enable it in Settings."
            }
        }
    }

    static let imageNames = [
        "MorningSunrisePhoto",
        "BuddhaPhoto",
        "CityPhoto",
        "KbbqPhoto",
        "BreadPhoto",
        "BirthdayCakePhoto",
        "ConcertPhoto",
        "CatPhoto",
        "RatPhoto",
        "RainbowCloudPhoto",
        "CitySunsetPhoto"
    ]

    static func savePhotos(completion: @escaping (Result<Int, Error>) -> Void) {
        let images = imageNames.compactMap(UIImage.init(named:))

        guard !images.isEmpty else {
            completion(.failure(ImportError.noImagesFound))
            return
        }

        PHPhotoLibrary.requestAuthorization(for: .addOnly) { status in
            guard status == .authorized || status == .limited else {
                DispatchQueue.main.async {
                    completion(.failure(ImportError.permissionDenied))
                }
                return
            }

            PHPhotoLibrary.shared().performChanges {
                for image in images {
                    PHAssetChangeRequest.creationRequestForAsset(from: image)
                }
            } completionHandler: { success, error in
                DispatchQueue.main.async {
                    if success {
                        completion(.success(images.count))
                    } else {
                        completion(.failure(error ?? ImportError.permissionDenied))
                    }
                }
            }
        }
    }
}
