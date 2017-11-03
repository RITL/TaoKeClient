function tk_nativeDidClick(info)
{
//    alert(info);
    
    //数据传递wk
    window.webkit.messageHandlers.tk_nativeTransTKGoodInfo.postMessage(info);
}
