
https://www.youtube.com/watch?v=JzngncpZLuw
https://seanallen.teachable.com/  
上記動画のメモ　　
GitHubのAPIを使用してフォロワーを表示するアプリ  
英語で字幕がでないかもしれないけどクロームの拡張機能でなんとかできる  
UIKitでストーリーボードを使わない  
サードパーティーのライブラリもつかわない  
カールコマンド  
curl https://api.github.com/users/saiien0400

## ストーリーボードの消し方､設定

## 画像のライト､ダークモード時の設定

## SFシンボルズの使い方

## UITabBarControllerから起動
```swift
    **func** scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

  

        **guard** **let** windowScene = (scene as? UIWindowScene) else { return }

  

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)

        window?.windowScene = windowScene

        window?.rootViewController = UITabBarController()

        window?.makeKeyAndVisible()

  

    }
    ```
タブの一つ一つにナビゲーションコントローラを組み込み、そのナビゲーションコントローラのはそれぞれViewControllerをもっている

tab--->navi--->Viewcon
     |
     v
     navi--->viewcon

ロシア人形

Routerでどうする?
ユーザーデフォルトに入った値でログイン画面はタブを通さないでそのままログイン画面へ
ログインが完了していたら､タブを通してナビゲーションビューにルーティングすればいいかな

### デバックビューヒエラルキー
でわかりやすくタブ､ナビゲーション､ViewControllerの構造を説明

### ボタンなどをコンポーネント化
たとえひとつしかつかってなくても
いつ再利用するかはわからない

UIButtonの作成

フォントの大きさの設定に対応するか?
ユーザーインターフェイスガイド

インデントの揃え方の一例
```swift
        layer.cornerRadius        = 10

        layer.borderWidth         = 2

        layer.borderColor = UIColor.systemGray4.cgColor

  

        textColor                 = .label

        tintColor                 = .label

        textAlignment             = .center

        font                      = UIFont.preferredFont(forTextStyle: .title2)

        adjustsFontSizeToFitWidth = **true**

        minimumFontSize           = 12

  

        backgroundColor           = .tertiarySystemBackground

        autocorrectionType        = .no

        placeholder               = "Enter a username"
```

これはストーリーボードでViewにimageを貼っているのとおなじ
```swift
    func configureLogoImageView() {

        view.addSubview(logoImageView)

        logoImageView.translatesAutoresizingMaskIntoConstraints = false

    }
```

文字列をタイポするとクラッシュの危険があるから定数にする

Xcodeの予測変換の設定

キーボードのカスタマイズ

private extensionでviewControllerの関数をまとめてもよさげ

正規表現

アラートでVC1個作ってる

拡張



フォルダーの分け方

MVCについて
アーキテクチャはテンプレートではなくガイドライン


`navigationController?.isNavigationBarHidden = true`と`navigationController?.setNavigationBarHidden(true, animated: true)`は、ともにナビゲーションバーを隠すために使用されますが、主な違いはアニメーションの有無です。

### `navigationController?.isNavigationBarHidden = true`

このプロパティを使用すると、ナビゲーションバーの表示状態を直接設定できます。`true`に設定するとナビゲーションバーが隠れ、`false`に設定すると表示されます。ただし、この操作はアニメーションなしで即時に行われます。そのため、ユーザーにとってはナビゲーションバーが突然表示されたり隠れたりすることになり、場合によってはスムーズでない画面遷移と感じられることがあります。

### `navigationController?.setNavigationBarHidden(true, animated: true)`

このメソッドを使用すると、ナビゲーションバーの表示状態を設定することもできますが、`animated`パラメータを`true`に設定することで、その変更にアニメーション効果を加えることができます。このアニメーションにより、ユーザーにとってより自然な画面遷移に感じられ、アプリのUX（ユーザーエクスペリエンス）を向上させることができます。

### 結論

`navigationController?.setNavigationBarHidden(true, animated: true)`に変更する理由は、ナビゲーションバーの表示状態を変更する際にアニメーションを追加し、よりスムーズで自然なユーザー体験を提供するためです。アプリケーションのUXを重視する場合、特に画面遷移や状態変更が頻繁に行われるUIでは、この方法が推奨されます。

実行時コンソールにでるエラー

**-[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:]  perform input operation requires a valid sessionID**

https://forums.developer.apple.com/forums/thread/731700
ios17ででるもので原因不明っぽい

シングルトン

API 通信

enumでエラー処理
Result型

コレクションビュー
    再利用IDを持たせる
    コンポーネント
        ラベルやボタンなどのカスタムクラスを作成してフォントなどを指定できるようにしている

as of ios15 we don`t want to pin this to the contentView.

Your constraints should look like this
we fix this in the iOS 15 update section but that`s a few hours away
ios15では、これをcontentViewに固定したくない。

制約は次のようになります。
私たちはiOS 15のアップデートセクションでこれを修正しますが、それは数時間後です。

FlowLayout
Diffable Data Source


viewDidLoadの処理が増えてきたら関心ごとにわけて関数をつくって
よびだす

コレクションビューのセルのサイズ設定

ARC

**guard** **let** self = **self** **else** { **return** 

UIヘルパービュー.swiftを作ってスタティックで呼び出す

画像取得のエラーハンドリング
dataから画像のとる

画像のキャッシュ

スクロールビューを使うためにコレクションビューのデリゲートを使う

デリゲートとはこの例で言うとスクロールでのイベントが起こったら、コレクションビューに伝えるという認識


デリゲート（Delegate）パターンとオブザーバー（Observer）パターンは、ともにイベント駆動型プログラミングにおいて重要な役割を果たしますが、それぞれ異なる目的と特徴を持っています。UIKitがデリゲートパターンを採用している理由には以下のような点が挙げられます。

### デリゲートパターン
- **1対1の通信**：デリゲートパターンは、通常、1つのデリゲート（代理）オブジェクトが1つのソースオブジェクトからのイベントや指示を受ける構造です。これにより、特定のコンポーネントやオブジェクト間での直接的で厳密な通信が可能になります。
- **カスタマイズ性**：デリゲートを使用することで、特定のイベントやアクションに対してカスタマイズされた振る舞いを実装することが容易になります。例えば、UIScrollViewがスクロールされた時に特定のアクションを起こすなど、細かな制御が可能です。
- **明確な責任分担**：デリゲートパターンを使用することで、どのオブジェクトが特定のアクションを担当するかが明確になり、コードの可読性と保守性が向上します。

### オブザーバーパターン
- **1対多の通信**：オブザーバーパターンは、1つのオブジェクト（サブジェクト）が複数のオブザーバーにイベントや状態の変化を通知する構造です。これにより、あるオブジェクトの状態変化に対して、複数のオブジェクトが反応することができます。
- **疎結合**：オブザーバーパターンを使用することで、サブジェクトとオブザーバー間の結合が緩やかになり、オブジェクト間の依存関係を減らすことができます。

### UIKitがデリゲートを採用している理由
UIKitのコンポーネントは、ユーザーインターフェースの構築と操作に特化しており、多くの場合、明確な1対1の通信が必要です。たとえば、ユーザーがテキストフィールドを編集したときや、テーブルビューのセルが選択されたときなど、特定のコンポーネントから特定の応答を得たい場合にデリゲートパターンが効果的に機能します。また、デリゲートパターンを通じて、開発者はUIKitのデフォルトの振る舞いをオーバーライドし、カスタマイズされたユーザー体験を提供することができます。

オブザーバーパターンもiOS開発においては、特に状態の変化を多くのオブジェクトに通知する必要がある場合（例えば、モデルの状態変化を複数のビューに反映させる場合など）に使用されますが、UIKitがデリゲートパターンを重視するのは、その直接性、カスタマイズ性、そして明確な責任分担がユーザーインターフェースの制御に適しているからです。 

これらの情報を参考にしました。
[1] テックアカデミー - Swiftにおけるデリゲート (delegate)の使い方とは【初心者向け】 (https://magazine.techacademy.jp/magazine/15055)
[2] DevelopersIO - [iOS] iOSのDelegateをしっかりと理解する - DevelopersIO (https://dev.classmethod.jp/articles/ios-delegate/)
[3] Qiita - SwiftにおけるDelegateとは何か、なぜ使うのか (https://qiita.com/st43/items/9f9990d76cefa1909ef4)
[4] DevelopersIO - [Swift] Delegate Protocol でメソッドを定義するときの書き方 ... (https://dev.classmethod.jp/articles/delegate-protocol-writing-and-concepts/) 



シュミレータ -> デバッグ -> スローアニメーション 
これでアニメーションをスローにできる

xcode->Windows->デバイスアンドシュミレーター
デバイスのコンディションズでネットの接続状態を変更できる


UISearchController

入れ子のViewController

StackView

viewcontrollerのサブクラス

DateFormatter

プロトコルとデリゲートは一対一のコミュニケーションパターン

オブザーバーと通知センターは一体多のコミュケーションパターン

ざっとみて何しているかわかるようリファクタリングしている

リファクタリングで重複を消す代わりに拡張性を失うこともある
https://overreacted.io/how-does-the-development-mode-work/

iPhoneのサイズ表
https://www.paintcodeapp.com/news

`isiPhone8Zoomed` は、iPhone 8がズームモードで動作しているか

clearButtonMode           = .whileEditing
TextFieldのなにか入力したときに消すボタンが追加される

Dynamic Typeで文字サイズを変える
これに適応させるには？

プロトコル、デリゲートの細分化
彼らが知っていることについて知られたくない
知る必要がない、あるいは知るべきでない

cellの再利用ができてなくない？
tebleviewのメインスレッドリロードの拡張

iPhoneSE初代のためスクロールビューをつける

最後はコードのインデント揃えたりする
URLのタイポを防ぐドキュメント？

プロパティの塊も改行をいれてみやすく

ios15で追加されたボタン

Concurrency
async
await
MainActor

15:20:18からios16

コレクションビューのセルだけswiftUIで実装した

