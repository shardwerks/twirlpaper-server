
function MM_openBrWindow(theURL,winName,features){window.open(theURL,winName,features);}
function writeCookie(name,data,noDays){var cookieStr=name+"="+data
if(writeCookie.arguments.length>2){cookieStr+="; expires="+getCookieExpireDate(noDays)}
document.cookie=cookieStr}
function readCookie(cookieName){var searchName=cookieName+"="
var cookies=document.cookie
var start=cookies.indexOf(cookieName)
if(start==-1){return""}
start+=searchName.length
var end=cookies.indexOf(";",start)
if(end==-1){end=cookies.length}
return cookies.substring(start,end)}
function blocking(nr,cookie,vis_state)
{if(document.layers)
{current=(document.layers[nr].display=='none')?vis_state:'none';if(cookie!='')
writeCookie(nr,current);document.layers[nr].display=current;}
else if(document.all)
{current=(document.all[nr].style.display=='none')?vis_state:'none';if(cookie!='')
writeCookie(nr,current);document.all[nr].style.display=current;}
else if(document.getElementById)
{display=(document.getElementById(nr).style.display=='none')?vis_state:'none';if(cookie!='')
writeCookie(nr,display);document.getElementById(nr).style.display=display;}}
function adjust_popup()
{var w,h,fixedW,fixedH,diffW,diffH;if(document.documentElement&&document.body.clientHeight==0){fixedW=document.documentElement.clientWidth;fixedH=document.documentElement.clientHeight;window.resizeTo(fixedW,fixedH);diffW=fixedW-document.documentElement.clientWidth;diffH=fixedH-document.documentElement.clientHeight;w=fixedW+diffW+16;h=fixedH+diffH;if(w>=screen.availWidth)h+=16;}else if(document.all){fixedW=document.body.clientWidth;fixedH=document.body.clientHeight;window.resizeTo(fixedW,fixedH);diffW=fixedW-document.body.clientWidth;diffH=fixedH-document.body.clientHeight;w=fixedW+diffW;h=fixedH+diffH;if(h>=screen.availHeight)w+=16;if(w>=screen.availWidth)h+=16;}else{fixedW=window.innerWidth;fixedH=window.innerHeight;window.resizeTo(fixedW,fixedH);diffW=fixedW-window.innerWidth;diffH=fixedH-window.innerHeight;w=fixedW+diffW;h=fixedH+diffH;if(w>=screen.availWidth)h+=16;if(h>=screen.availHeight)w+=16;}
w=Math.min(w,screen.availWidth);h=Math.min(h,screen.availHeight);window.resizeTo(w,h);window.moveTo((screen.availWidth-w)/2,(screen.availHeight-h)/2);}
function show_section(e){if(document.getElementById(e).style.display=='none'){document.getElementById(e).style.display='block';}else{document.getElementById(e).style.display='none';}}
function expand()
{var Nodes=document.getElementsByTagName("table")
var max=Nodes.length
for(var i=0;i<max;i++){var nodeObj=Nodes.item(i)
var str=nodeObj.id
if(str.match("section")){nodeObj.style.display='block';}}}
function hideall()
{var Nodes=document.getElementsByTagName("table")
var max=Nodes.length
for(var i=0;i<max;i++){var nodeObj=Nodes.item(i)
var str=nodeObj.id
if(str.match("section")){nodeObj.style.display='none';}}}