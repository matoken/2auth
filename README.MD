# TOTPデスクトップ通知

* EncFSを確認してmountしていなかったらmount
* athtoolでTOTPを計算してnotify-sendでデスクトップ通知

# 必要なpkg

`encfs libnotify-bin zenity`


# ISSUE

* アイコンを汎用化  
[Icon Naming Specification](https://specifications.freedesktop.org/icon-naming-spec/icon-naming-spec-latest.html "Icon Naming Specification")
* ~~POSIX互換確認~~  
checkbashismsで確認
* データ格納場所変更  
EncFs -> keyring
