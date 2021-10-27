# Laravel Sail 透過 Windows 的 Docker Desktop 中支援的 Windows 子系統 Linux 版 2 後端建立開發環境

Laravel Sail 是結合 Docker 的開發環境，它擁有較高的執行效率、也不會汙染作業系統內的軟體。缺點是設計上使用 Ubuntu 作為其基底映像，這讓它建構出來的 Docker 映像檔較為肥胖。

## 執行步驟
1. 啟用 Windows 子系統 Linux 版
    - 以系統管理員身分開啟命令提示字元並執行
```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```
2. 啟用虛擬機器功能
    - 在安裝 WSL 2 之前，您必須啟用虛擬機器平台選用功能。您的電腦將需要虛擬化功能才能使用此功能。
    - 以系統管理員身分開啟命令提示字元並執行
```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```
3. 重新開機
4. 下載 [Linux 核心更新套件](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
5. 將 WSL 2 設定為預設版本
    - 在安裝新的 Linux 發行版本時，開啟啟命令提示字元，然後執行下列命令，以將 WSL 2 設定為預設版本
```
wsl --set-default-version 2
```
6. 安裝 Ubuntu 的 Linux 發行版本
    - 開啟 Microsoft Store，然後搜尋 Ubuntu 進行安裝並啟動。
7. 安裝 Windows 終端機
    - 開啟 Microsoft Store，然後搜尋 Windows Terminal 進行安裝並啟動。
8. 輸入 `wsl` 進入 Ubuntu
9. 開始利用 Laravel Sail 建置開發環境
```
curl -s https://raw.githubusercontent.com/henryleeworld/laravel-sail-with-the-docker-desktop-windows-subsystem-for-linux-2-backend/master/bin/laravel-sail-starter.sh | bash
```
10. 進入專案目錄並背景啟動服務容器。
```
cd {專案目錄}
./vendor/bin/sail up -d
```
11. 在瀏覽器中輸入已定義的路由 URL 來訪問，例如：http://localhost。
12. 執行 __Artisan__ 指令的 __migrate__ 來執行所有未完成的遷移。
```
./vendor/bin/sail artisan migrate
```

## 使用方式
- 背景啟動服務容器。
```
./vendor/bin/sail up -d
```
- 要停止所有容器，您只需按 `Control + C` 即可停止容器的執行。或者，如果容器在後台運行，您可以使用 `stop` 命令。
```
./vendor/bin/sail stop
```
- 可以使用 `composer` 命令執行 Composer 命令。
```
./vendor/bin/sail composer require laravel/sanctum
```

----

## 畫面截圖
![](https://i.imgur.com/VoGTkIw.png)
> 用瀏覽器開啟歡迎頁面