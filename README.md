# ScrapingQiitaTagByJulia
Julia言語を使って、QiitaのJuliaタグページのフィードをスクレイピングして、見出しとURLを取り出します。  

## Installation
```julia
using Pkg
Pkg.add("HTTP")
Pkg.add("EzXML")
```

## Usage
### コンソールで実行
```julia
> julia getQiita.jl
```

### 結果出力
日付付きのファイルに出力されます。  
例） qiita20220301.txt

TSV形式：行に一組の見出しとURLがTAB区切りで格納されます。

## 備考
　QiitaのJuliaタグページのURLを埋め込んであります。ここを書き換えることでほかのタグページのスクレイピングも可能です。  
　ただし、そのほかのフィードを読み込ませる場合は、フィードの型を確認する必要があります。今回はQiitaのタグページのフィード決め打ちになっています。

## 参照
　次のページに簡単な解説を書きました。  
　　  [スクレイピング(2)：QiitaのJuliaタグページのFeedからリンクを取得](https://leadinge.co.jp/julialang/2022/03/29/scraping_qiita/)
