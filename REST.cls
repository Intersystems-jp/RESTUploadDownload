Class User.REST Extends %CSP.REST
{

Parameter HandleCorsRequest = 1;

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<Route Url="/upfile" Method="POST" Call="postFile"/>
<Route Url="/getfile" Method="GET" Call="getFile"/>
</Routes>
}

ClassMethod postFile() As %Status
{
    // upload された File を一旦 C:\temp\upload に保存する
    set upload=%request.MimeData("myfile", 1)
    set fname1=##class(%File).GetFilename(upload.FileName)
    set fname="C:\temp\upload\"_fname1
    
    // ダウンロード用にファイル名を一時グローバルに保存
    set ^IRIS.TempFname=fname
    
    set file=##class(%File).%New(fname)
    do file.Open("NWUK\BIN\")    
    do file.CopyFrom(upload)
    set st = file.%Save()
    
    // アップロード失敗時はエラーを戻して処理終了
    if 'st {
        write "アップロード失敗"
        quit st
    } 
    do file.Close()

    write "アップロード成功"
    quit $$$OK
}

ClassMethod getFile() As %Status
{
	
     // ファイルの確認
     set fpath=$G(^IRIS.TempFname)
     if ##class(%File).Exists(fpath)=0 {
	     write "ダウンロード対象ファイルがありません"
	     quit
	 }
	 
	 set fname = ##class(%File).GetFilename(fpath)
     set %response.ContentType=..GetFileContentType($p(fpath,".",*))
     do %response.SetHeader("Content-Disposition","attachment;filename="_fname)
     set strm=##class(%Stream.FileBinary).%New()
     set st=strm.LinkToFile(fpath)
     do strm.OutputToDevice()
     
     // ダウンロード後、一時グローバルは消す。必要に応じてファイルも削除する。
     kill ^IRIS.TempFname
     do ##class(%File).Delete(fpath)
          
     Quit $$$OK
}

ClassMethod GetFileContentType(pFileType) As %String
{
    if pFileType="png" quit "image/png"
    if pFileType="jpg" quit "image/jpeg"
    if pFileType="gif" quit "image/gif"
    if pFileType="pdf" quit "application/pdf"
    if pFileType="docx" quit "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
    if pFileType="xlsx" quit "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    
    quit "application/octet-stream; charset=Shift_JIS"    // その他。日本語を含むtxtやcsvもこちら。Windowsの場合は charset=Shift_JIS
}

}
