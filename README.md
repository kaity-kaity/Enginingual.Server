# README
こちらは開発環境です(develop)
開発環境構築の手順は以下の通りです
（長いです、明日はもう少しいい感じになるようがんばります→できませんでした（白目）） 

1. hostsファイルに以下を追記 
``` 
<立てたConoHaのVPSのIPアドレス> dev.enginingual.com 
``` 
  - winはこちらを参照: https://www.netassist.ne.jp/blog/?p=1435 
  - macはこちらを参照: https://oku-log.com/blog/mac-hosts/ 

2. VPSにssh接続する 
VSCode上でssh接続（パスワード認証or公開鍵認証） 

3. git cloneする 
```
git clone -b develop https://github.com/yagijin/gtb_final.git
``` 

4. .envファイルをgtb_final直下にコピー

5. httpで立ち上げる(adminerのため) 
```
cd gtb_final
docker-compose -f docker-compose.adminer.yml build
docker-compose -f docker-compose.adminer.yml up
``` 

6. adminerを使うユーザを作成する＋DBのマイグレーション 
```
(新しいbashを作成)
docker-compose -f docker-compose.adminer.yml exec app bash 
mysql -u root -h db 
(===こっからMySQL===)
CREATE user 'user'@'%' IDENTIFIED BY 'pass'; 
GRANT ALL ON *.* TO 'user'@'%'; 
exit 
(===ここまでMySQL===) 
rails db:create 
rails db:migrate
exit
```

7. adminerを立ち上げて仮のwordデータを入れる  
（ConoHaでポート全許可しておく）  
webブラウザで160.251.48.63:9000にアクセス  
ユーザ名はuser, パスワードはpassでログイン  
app_development→words→データ→インポートでword_data.csvを選択 

8. Ctrl-Dでhttpsで立ち上げる 
```
(ctrl-Dでdocker-compose.adminer.ymlを終了)
docker-compose -f docker-compose.ssl.yml up
( https-portal|[services.d] done. みたいなのが出るまで待機, 証明書発行の時間がかかります)
``` 
 
あとはdev.enginingal.comにアクセスすればできるはず... 
