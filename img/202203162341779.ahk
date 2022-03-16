; Typora
; 快捷增加字体颜色
; SendInput {Text} 解决中文输入法问题

#IfWinActive ahk_exe Typora.exe
{
    ; Ctrl+Alt+o 橙色
    ^!o::addFontColor1("orange")

    ; Ctrl+Alt+r 红色
    ^!r::addFontColor1("red")

    ; Ctrl+Alt+g 浅蓝色
    ^!b::addFontColor2("cornflowerblue")


}

; 快捷增加字体颜色
addFontColor1(color){
    clipboard := "" ; 清空剪切板
    Send {ctrl down}c{ctrl up} ; 复制
    SendInput {TEXT}<span style='color:green;background:greenyellow;'>**
    SendInput {ctrl down}v{ctrl up} ; 粘贴
    If(clipboard = ""){
        SendInput {TEXT}**</font> ; Typora 在这不会自动补充
    }else{
        SendInput {TEXT}**</ ; Typora中自动补全标签
    }
}
; 快捷增加字体颜色
addFontColor2(color){
    clipboard := "" ; 清空剪切板
    Send {ctrl down}c{ctrl up} ; 复制
    SendInput {TEXT}<span style='color:green;background:greenyellow;'>**
    SendInput {ctrl down}v{ctrl up} ; 粘贴
    If(clipboard = ""){
        SendInput {TEXT}**</font> ; Typora 在这不会自动补充
    }else{
        SendInput {TEXT}**</ ; Typora中自动补全标签
    }
}