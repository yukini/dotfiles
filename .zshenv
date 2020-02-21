# 効かない?
# export http_proxy='http://lv2east-proxy.nwdept:8080'
# export https_proxy='https://lv2east-proxy.nwdept:8080'
# export HTTP_PROXY='http://lv2east-proxy.nwdept:8080'
# export HTTPS_PROXY='https://lv2east-proxy.nwdept:8080'
# export http_proxy='http://lv2east-proxy.nwdept:8080'
# export https_proxy='https://lv2east-proxy.nwdept:8080'
# export HTTP_PROXY='http://lv2east-proxy.nwdept:8080'
# export HTTPS_PROXY='https://lv2east-proxy.nwdept:8080'
#
# 効いてる
# export http_proxy='http://10.242.227.1:8080'
# export https_proxy='http://10.242.227.1:8080'
# export HTTP_PROXY='http://10.242.227.1:8080'
# export HTTPS_PROXY='http://10.242.227.1:8080'
#
export  http_proxy='http://lv2west-proxy.nwdept:8080'
export  HTTP_PROXY='http://lv2west-proxy.nwdept:8080'
export https_proxy='http://lv2west-proxy.nwdept:8080'
export HTTPS_PROXY='http://lv2west-proxy.nwdept:8080'
#
# 
# export NO_PROXY=192.168.99.100
export NO_PROXY="localhost,127.0.0.1,10.96.0.0/12,192.168.99.0/24,192.168.39.0/24,164.70.2.177,160.70.12.47"

setopt HIST_IGNORE_DUPS           # 前と重複する行は記録しない
setopt HIST_IGNORE_ALL_DUPS       # 履歴中の重複行をファイル記録前に無くす
setopt HIST_IGNORE_SPACE          # 行頭がスペースのコマンドは記録しない
setopt HIST_FIND_NO_DUPS          # 履歴検索中、(連続してなくとも)重複を飛ばす
setopt HIST_REDUCE_BLANKS         # 余分な空白は詰めて記録
setopt HIST_NO_STORE              # histroyコマンドは記録しない

