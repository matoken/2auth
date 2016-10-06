# TOTPデスクトップ通知

* EncFSを確認してmountしていなかったらmount
* athtoolでTOTPを計算してnotify-sendでデスクトップ通知


# ISSUE

* アイコンを汎用化  
[Icon Naming Specification](https://specifications.freedesktop.org/icon-naming-spec/icon-naming-spec-latest.html "Icon Naming Specification")
* ~~POSIX互換確認~~  
checkbashismsで確認
* データ格納場所変更  
EncFs -> keyring
