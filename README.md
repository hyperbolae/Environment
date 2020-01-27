# My Ubuntu environment

## Vscode 
### Extensions
- C/C++
- C++ Intellisense
- Python
- Vetur
- Darcula Intellij Theme
- IntelliJ IDEA Keybindings
- Markdown Preview Enhanced
- vscode-pdf

### settings.json
```json
"C_Cpp.clang_format_fallbackStyle": "{ BasedOnStyle: Google, IndentWidth: 4, TabWidth: 4, ColumnLimit: 0, AllowShortIfStatementsOnASingleLine: true }",
"typescript.format.insertSpaceBeforeFunctionParenthesis": true,
"vetur.format.defaultFormatter.ts": "vscode-typescript",
```

## Backgrounds
### Changing login screen backgrounds
[Reference](https://linuxhint.com/ubuntu_login_screen_background/)

Edit `/etc/alternatives/gdm3.css`.
```css
#lockDialogGroup {
    background: url(file:///file/to/image);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center; 
}
```

### Changing desktop and lock screen backgrounds
```sh
sudo apt install gnome-tweak-tool
```

## Workspaces and dconf-editor settings
```sh
sudo apt install dconf-editor
```

### Toggling windows on click
Go to `org > gnome > shell > extensions > dash-to-dock` and check `click-action`.

### Isolated activities workspace
[Ask ubuntu](https://askubuntu.com/questions/305962/setting-to-only-show-applications-of-current-workspace-in-launcher)

Go to `org > gnome > shell > extensions > dash-to-dock` and check `isolate-workspaces`.

## Youtube and Spotify
- [spotdl](https://github.com/ritiek/spotify-downloader)
- [youtube-dl](https://github.com/ytdl-org/youtube-dl)