# <div align="center">병원모아(病院モア)</div>
<p align="center"><img src="https://user-images.githubusercontent.com/51852940/212021773-d10c71e1-0508-498c-be82-e41e6ee30a0b.png">UI修正前</p>
<p align="center"><img src="https://user-images.githubusercontent.com/51852940/212024219-55f6be02-dc38-496e-972f-8f32117bf78d.png">UI修正後</p>

## <div align="center">デモ動画</div>
<p align="center"><img src="https://user-images.githubusercontent.com/51852940/212024329-6a861edc-c073-4cc4-80c3-0da5ce86614a.gif"></p>

## 制作の背景
日本人の妻と一緒に病院に行ければ問題ありませんが、もし私が勤務中に妻に何か問題が発生した場合、一人で病院に行く必要があります。医療用語は日常会話では使われない表現が多く、不慣れで恐怖を感じる可能性があると判断し、大邱市内にある病院の情報をまとめて表示できれば良いと思い、各病院の情報を日本語表記で表示するアプリを開発しました。

## 実装機能
- Firebase/Realtime Databaseと連携して病院リストを表示
- MapKitを活用して病院の位置を地図で表示
- 住所をクリックするとiPhoneに標準搭載されているApple Mapアプリに移動
- 電話番号をクリックするとiPhoneに搭載されている標準電話アプリに移動
- ホームページをクリックすると該当病院のウェブページに移動

## 情報出典
[メディシティ大邱](https://www.medicitydaegu.com/main/site/organization/medical/list.do)

## アプリストア
[App Store](https://apps.apple.com/kr/app/%EB%B3%91%EC%9B%90%EB%AA%A8%EC%95%84/id1663649902)

## 制作および登録過程でのエラー事項
1. 制作過程
    1) Type 'OOOO' does not conform to protocol 'OOOO'
        (https://hirodaegu.tistory.com/471)
        
    2) Info.plist がなくなったまたはKeyが表示されない
        (https://hirodaegu.tistory.com/472)
        
    3) Decoding Error(The data couldn't be read because it is missing)
        (https://hirodaegu.tistory.com/479)
        
    4) this class is not key value coding-compliant for the key OOO
        (https://hirodaegu.tistory.com/480)
        
    5) NSInternalInconsistencyException, reason: Invalid parameter not satisfying: constraint isKindOfClass:NSLayoutConstraint class
        (https://hirodaegu.tistory.com/481)
        
    6) Initializer for conditional binding must have Optional type, not 'OOO'
        (https://hirodaegu.tistory.com/492)
        
2. 登録過程(Reject Issue)
    1) Guideline 1.5 - Safety - Developer Information
    
        開発者情報を含むリンクが接続されないことによる拒否理由 → 接続できるリンクに変更後、承認
        
    2) Guideline 4.2 - Design - Minimum Functionality
    
        最初はアプリの機能が少ないため拒否されたと判断し、追加できる機能を実装しましたが、同じ理由で拒否されました。
        困った気持ちで直接問い合わせたところ、担当者が参考にするよう教えてくれたのは、
        HIG(https://developer.apple.com/design/human-interface-guidelines/guidelines/overview)、
        Essential Design Principles(https://developer.apple.com/videos/play/wwdc2017/802/)、
        Design Tips for Great Games(https://developer.apple.com/videos/play/design/811/)
        の3つでした。UI部分がAppleの基準に合わないため拒否されたことを確認し、App Storeのデザインを参考に修正して提出し、承認されました。
