

import Photos
import UIKit
import AVFoundation

class CustomPhotoAlbum {
    
    static let sharedInstance = CustomPhotoAlbum()
    
    
    func saveImage(path: URL , folder: String , type: String) {
        
        var assetCollectionT = PHAssetCollection()
        let albumName = folder
        
        // 查詢相簿
        let assetCollection = fetchAssetCollectionForAlbum(albumName: albumName)
        
        if assetCollection != nil {
            assetCollectionT = assetCollection!
            action(path: path, assetCollectionT: assetCollectionT, type: type, albumName: albumName)
        }else{
            
            // 新建相簿
            PHPhotoLibrary.shared().performChanges({
                PHAssetCollectionChangeRequest.creationRequestForAssetCollection(withTitle: albumName)
                
            }) { success, _ in
                if success {
                    assetCollectionT = self.fetchAssetCollectionForAlbum(albumName: albumName)
                    self.action(path: path, assetCollectionT: assetCollectionT, type: type, albumName: albumName)
                }
            }
        }
    }
    
    //MARK: - 加入檔案至相簿
    func action(path: URL, assetCollectionT: PHAssetCollection , type: String , albumName: String){
        PHPhotoLibrary.shared().performChanges({
            if type == "image"{
                let assetChangeRequest = PHAssetChangeRequest.creationRequestForAssetFromImage(atFileURL: path)!
                let assetPlaceholder = assetChangeRequest.placeholderForCreatedAsset
                let albumChangeRequest = PHAssetCollectionChangeRequest(for: assetCollectionT)
                albumChangeRequest?.addAssets([assetPlaceholder] as NSFastEnumeration)
                
            }else if type == "video"{
                let assetChangeRequest = PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: path)!
                let assetPlaceholder = assetChangeRequest.placeholderForCreatedAsset
                let albumChangeRequest = PHAssetCollectionChangeRequest(for: assetCollectionT)
                albumChangeRequest?.addAssets([assetPlaceholder] as NSFastEnumeration)
            }
        }, completionHandler: nil)
    }
    
    
    //MARK: - 查詢相簿是否存在
    private func fetchAssetCollectionForAlbum(albumName: String) -> PHAssetCollection! {
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "title = %@", albumName)
        let collection = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: fetchOptions)
        
        if let firstObject: AnyObject = collection.firstObject {
            return collection.firstObject as! PHAssetCollection
        }
        
        return nil
    }
}

