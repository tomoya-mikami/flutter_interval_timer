# インターバルタイマー開発テスト

一定の周期を繰り返し続けるタイマー

## version

```
Flutter 2.5.0-6.0.pre • channel dev • https://github.com/flutter/flutter.git
```

desktopビルドの検証も行ってみているので, devチャンネルに切り替える必要があります(参考 https://flutter.dev/desktop)

```
flutter channel dev
flutter upgrade
```

## Getting Started

```
flutter doctor // chromeが有効になっていることを確認する
flutter pub get
flutter run -d chrome // おそらく誰でも入っていると思われるchromeでまずは動かしてみてください
```

## アーキテクチャについて

blocパターンを参考にしています

参考

- https://note.com/yamarkz/n/n7f9106e53179
- https://qiita.com/arthur_foreign/items/4b1bf1892439780c4690

Providerライブラリについて

- https://pub.dev/packages/provider
- https://qiita.com/arthur_foreign/items/fde6164b707840b1d4d5

ソースコード構成

```
lib
├── Bloc // ここにロジックを書く
│   └── CounterBloc.dart
├── main.dart
└── widgets
    ├── Components // ここにUIを書く
    │   └── CounterComponent.dart
    └── Screens // Providerを使ってComponentにBlocを渡す
        └── CounterScreen.dart
```
