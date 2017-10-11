
### 目錄
1. [總覽](/index.md)
2. [GMT介紹及安裝](/intro_install.md)
3. [網路資源及配套軟體](/net_software.md)
4. [第零章: 基本概念及參考資源](/basic_resource.md)
5. [第一章: 製作底圖(投影法)](/projection.md)

## 4.1 基本概念
GMT是由指令輸入來製圖，那如何開啟指令輸入的環境

* Windows: 點擊開始按鈕，搜尋<mark>cmd.exe</mark>或是命令提示字元，點擊後將出現命令提示字元的畫面。
* Linux: 按`Ctrl+Alt+T`，或是在搜尋打<mark>terminal</mark>，就可叫出指令介面。
* MAC: 可在Applications/Utilities/下找到<mark>Terminal.app</mark>。

為了避免與其他指令混用，自GMT5之後，GMT的指令輸入格式如下:

```shell
      GMT [options]
      GMT <module name> [<module-options>]
```

<mark>options</mark>代表GMT的基本設定，例如`gmt --show-bindir`顯示執行檔的資料夾，
或是`gmt --version`告訴你當前執行環境下GMT的版本。
<mark>module name</mark>表示你用來製圖的模組，像是**psxy**(畫圖形)、**pstext**(寫字)等等，
而<mark>module-options</mark>則對應像是**-R**(設定範圍)、**-J**(投影法)等等。

試一下輸入`gmt --help`，你將可以看到一串關於module purpose的資訊，
或是輸入`gmt psxy --help`，你可以看到關於psxy模組的資訊。
當然別忘記，當有指令不熟的時後，多加查詢[GMT官網](http://gmt.soest.hawaii.edu/doc/5.4.2/index.html)的資訊，
像是剛剛[module purpose](http://gmt.soest.hawaii.edu/doc/5.4.2/quick_ref.html)及
[psxy](http://gmt.soest.hawaii.edu/doc/5.4.2/psxy.html)，都可以在官網中找到。

## 4.2 圖層概念
GMT的作圖是利用一張張PS檔疊加在一起，示意圖如下:



---

[上一章](/net_software.md) -- [下一章](/projection.md)