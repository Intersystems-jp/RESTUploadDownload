# RESTUploadDownload
REST経由でファイルのアップロード／ダウンロードを行う

## サンプルコードについて
この Git のサンプルコードは、[InterSystems 開発者コミュニティ](https://jp.community.intersystems.com/)に公開している以下記事のサンプルコードです。  
  
[Web経由でイメージファイルを IRIS にアップロード／ダウンロードする方法](https://jp.community.intersystems.com/node/525251)

  
こちらのサンプルでは、以下の手順でファイルの「アップロード／ダウンロード」を行います。  

1. Chose File ボタン押下でアップロードするファイルを選択する
2. upload ボタン押下で、ファイルをREST通信によりIRISサーバにアップロードする
3. アップロードされたデータを %request.MimeData で受け取り、サーバの「C:\temp\upload」以下に保存する
4. Download File リンクを押下し、3 のフォルダに保存したファイルをローカルにダウンロードする。
  
  
## 含まれるファイル

* User.REST.xml　　　<font color="ForestGreen">// スタジオインポート用：クラス定義</font>
* User.REST.cls　　　<font color="ForestGreen">// VSCodeインポート用：クラス定義</font>
* test.html　　  　　<font color="ForestGreen">// HTMLファイル</font> 

  
## セットアップ方法
動作確認バージョンIRIS　V2018.1以降
 
ファイルをインポート・コンパイルします。

  
## 実行方法

#### 1. test.html を Web ブラウザで開きます。
※Webサーバに置く際は、任意の場所においてください。
[http://localhost/test.html]

#### 2. ファイルを選択 をクリックし、ファイルを選択します。
![image](https://user-images.githubusercontent.com/24215130/188342333-dfea209d-ef8b-48d5-93e9-89c94efab401.png)

#### 3．Upload をクリックします。
![image](https://user-images.githubusercontent.com/24215130/188342428-c5dca21b-d109-4f32-b184-5ff851b7f93c.png)

#### 4. upload に成功すると「アップロード成功」のダイアログが表示されます。
![image](https://user-images.githubusercontent.com/24215130/188343003-8a1b0205-43fc-417d-99e3-f76384e70ee5.png)

#### 5. Download Files をクリックすると、4 でアップロードしたファイルが既定の場所にダウンロードされます。
  
![image](https://user-images.githubusercontent.com/24215130/188342926-e1c8dad8-16f8-4004-8f18-2846a7fef339.png)


~~~

