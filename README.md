# RESTUploadDownload
 IRIS REST API でファイルのアップロード／ダウンロードを行う

## サンプルコードについて
この Git のサンプルコードは、[InterSystems 開発者コミュニティ](https://jp.community.intersystems.com/)に公開している以下記事のサンプルコードです。  
  
[IRIS REST API でファイルのアップロード／ダウンロードを行う方法](https://jp.community.intersystems.com/node/556841)

  
こちらのサンプルでは、HTML形式のファイルより IRIS REST API を呼び出してファイルの「アップロード／ダウンロード」を行います。  

## 手順
1. ファイルの選択 ボタン押下でアップロードするファイルを選択する。
2. upload ボタン押下で、ファイルをREST通信によりIRISサーバにアップロードする。
3. アップロードされたデータを %request.MimeData で受け取り、サーバの「C:\temp\upload」以下に保存する。
4. Download File リンクを押下し、3 のフォルダに保存したファイルをローカルにダウンロードする。
  
  
## 含まれるファイル
* User.REST.xml　　　<font color="ForestGreen">// スタジオインポート用：クラス定義</font>
* REST.cls　　　　　<font color="ForestGreen">// VSCodeインポート用：クラス定義</font>
* test.html　　 　 　<font color="ForestGreen">// HTMLファイル</font> 
　
  
## セットアップ方法
動作確認バージョンIRIS　V2023.1.2
 
ファイルをインポート・コンパイルします。

  
## 実行方法

#### 1. test.html を Web ブラウザで開きます。
※Webサーバに置く際は、指定の場所においてください。
[http://localhost/test.html](http://localhost/test.html)

#### 2. ファイルを選択 をクリックし、アップロードしたいファイルを選択します。
![image](https://github.com/rkake/RESTUploadDownload/assets/24215130/dfbf193d-00d2-48d1-8dcc-41c6f5e28821)

#### 3．Upload をクリックします。
![image](https://github.com/rkake/RESTUploadDownload/assets/24215130/d6983fff-792c-455d-bc84-2e89eeed6162)

#### 4. upload に成功すると「アップロード成功」のダイアログが表示されます。
![image](https://github.com/rkake/RESTUploadDownload/assets/24215130/808283cd-6fe0-4297-bc17-45b0dc8520ee)

#### 5. Download Files をクリックすると、4 でアップロードしたファイルが既定の場所にダウンロードされます。
![image](https://github.com/rkake/RESTUploadDownload/assets/24215130/b750656e-2782-46e5-9ffe-e1b093224fb1)

~~~

