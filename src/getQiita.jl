using HTTP
using EzXML
using Dates

# QiitaのJuliaタグの文書のタイトルとURLを取得
function get_qiita()
    qiita_feed = "https://qiita.com/tags/julia/feed"
    # ページの取得
    response = HTTP.request("GET", qiita_feed)
    if response.status != 200
        return []
    end

    code = String(response.body)
    doc = parsexml(code)
    # feed>entry にある url と title を抜き出す
    feed = root(doc)
    list = []
    for tag in eachelement(feed)
        if tag.name == "entry"
            url = nothing
            title = nothing
            for item in eachelement(tag)
                if item.name == "url"
                    url = item.content
                elseif item.name == "title"
                    title = item.content
                end
            end
            if !isnothing(url)
                pair = (title, url)
                push!(list, pair)
            end
        end
    end
    list
end

function main()
    # 日付付きのファイル名を作成
    filename = "qiita" * Dates.format(now(), "yyyymmdd") * ".txt"
    open(filename, "w") do f
        list = get_qiita()
        for (title, url) in list
            println(f, title * "\t" * url)
        end
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
