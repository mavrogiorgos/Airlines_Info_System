<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    <%@ page import ="com.sun.jersey.api.client.Client" %>
<%@ page import ="com.sun.jersey.api.client.ClientResponse" %>
<%@ page import ="com.sun.jersey.api.client.WebResource" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<title>Home | American Airlines</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="home.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
  <link rel="icon" href="Images/logo.jpg" type="image/gif">
  
  <style>
  
 /*--------------------------------------------------------*/ 


html{box-sizing:border-box}*,*:before,*:after{box-sizing:inherit}

html{-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%}body{margin:0}
article,aside,details,figcaption,figure,footer,header,main,menu,nav,section{display:block}summary{display:list-item}
audio,canvas,progress,video{display:inline-block}progress{vertical-align:baseline}
audio:not([controls]){display:none;height:0}[hidden],template{display:none}
a{background-color:transparent}a:active,a:hover{outline-width:0}
abbr[title]{border-bottom:none;text-decoration:underline;text-decoration:underline dotted}
b,strong{font-weight:bolder}dfn{font-style:italic}mark{background:#ff0;color:#000}
small{font-size:80%}sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline}
sub{bottom:-0.25em}sup{top:-0.5em}figure{margin:1em 40px}img{border-style:none}
code,kbd,pre,samp{font-family:monospace,monospace;font-size:1em}hr{box-sizing:content-box;height:0;overflow:visible}
button,input,select,textarea,optgroup{font:inherit;margin:0}optgroup{font-weight:bold}
button,input{overflow:visible}button,select{text-transform:none}
button,[type=button],[type=reset],[type=submit]{-webkit-appearance:button}
button::-moz-focus-inner,[type=button]::-moz-focus-inner,[type=reset]::-moz-focus-inner,[type=submit]::-moz-focus-inner{border-style:none;padding:0}
button:-moz-focusring,[type=button]:-moz-focusring,[type=reset]:-moz-focusring,[type=submit]:-moz-focusring{outline:1px dotted ButtonText}
fieldset{border:1px solid #c0c0c0;margin:0 2px;padding:.35em .625em .75em}
legend{color:inherit;display:table;max-width:100%;padding:0;white-space:normal}textarea{overflow:auto}
[type=checkbox],[type=radio]{padding:0}
[type=number]::-webkit-inner-spin-button,[type=number]::-webkit-outer-spin-button{height:auto}
[type=search]{-webkit-appearance:textfield;outline-offset:-2px}
[type=search]::-webkit-search-decoration{-webkit-appearance:none}
::-webkit-file-upload-button{-webkit-appearance:button;font:inherit}
/* End extract */
html,body{font-family:Verdana,sans-serif;font-size:15px;line-height:1.5}html{overflow-x:hidden}
h1{font-size:36px}h2{font-size:30px}h3{font-size:24px}h4{font-size:20px}h5{font-size:18px}h6{font-size:16px}.w3-serif{font-family:serif}
h1,h2,h3,h4,h5,h6{font-family:"Segoe UI",Arial,sans-serif;font-weight:400;margin:10px 0}.w3-wide{letter-spacing:4px}
hr{border:0;border-top:1px solid #eee;margin:20px 0}
.w3-image{max-width:100%;height:auto}img{vertical-align:middle}a{color:inherit}
.w3-table,.w3-table-all{border-collapse:collapse;border-spacing:0;width:100%;display:table}.w3-table-all{border:1px solid #ccc}
.w3-bordered tr,.w3-table-all tr{border-bottom:1px solid #ddd}.w3-striped tbody tr:nth-child(even){background-color:#f1f1f1}
.w3-table-all tr:nth-child(odd){background-color:#fff}.w3-table-all tr:nth-child(even){background-color:#f1f1f1}
.w3-hoverable tbody tr:hover,.w3-ul.w3-hoverable li:hover{background-color:#ccc}.w3-centered tr th,.w3-centered tr td{text-align:center}
.w3-table td,.w3-table th,.w3-table-all td,.w3-table-all th{padding:8px 8px;display:table-cell;text-align:left;vertical-align:top}
.w3-table th:first-child,.w3-table td:first-child,.w3-table-all th:first-child,.w3-table-all td:first-child{padding-left:16px}
.w3-btn,.w3-button{border:none;display:inline-block;padding:8px 16px;vertical-align:middle;overflow:hidden;text-decoration:none;color:inherit;background-color:inherit;text-align:center;cursor:pointer;white-space:nowrap}
.w3-btn:hover{box-shadow:0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)}
.w3-btn,.w3-button{-webkit-touch-callout:none;-webkit-user-select:none;-khtml-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}   
.w3-disabled,.w3-btn:disabled,.w3-button:disabled{cursor:not-allowed;opacity:0.3}.w3-disabled *,:disabled *{pointer-events:none}
.w3-btn.w3-disabled:hover,.w3-btn:disabled:hover{box-shadow:none}
.w3-badge,.w3-tag{background-color:#000;color:#fff;display:inline-block;padding-left:8px;padding-right:8px;text-align:center}.w3-badge{border-radius:50%}
.w3-ul{list-style-type:none;padding:0;margin:0}.w3-ul li{padding:8px 16px;border-bottom:1px solid #ddd}.w3-ul li:last-child{border-bottom:none}
.w3-tooltip,.w3-display-container{position:relative}.w3-tooltip .w3-text{display:none}.w3-tooltip:hover .w3-text{display:inline-block}
.w3-ripple:active{opacity:0.5}.w3-ripple{transition:opacity 0s}
.w3-input{padding:8px;display:block;border:none;border-bottom:1px solid #ccc;width:100%}
.w3-select{padding:9px 0;width:100%;border:none;border-bottom:1px solid #ccc}
.w3-dropdown-click,.w3-dropdown-hover{position:relative;display:inline-block;cursor:pointer}
.w3-dropdown-hover:hover .w3-dropdown-content{display:block}
.w3-dropdown-hover:first-child,.w3-dropdown-click:hover{background-color:#ccc;color:#000}
.w3-dropdown-hover:hover > .w3-button:first-child,.w3-dropdown-click:hover > .w3-button:first-child{background-color:#ccc;color:#000}
.w3-dropdown-content{cursor:auto;color:#000;background-color:#fff;display:none;position:absolute;min-width:160px;margin:0;padding:0;z-index:1}
.w3-check,.w3-radio{width:24px;height:24px;position:relative;top:6px}
.w3-sidebar{height:100%;width:200px;background-color:#fff;position:fixed!important;z-index:1;overflow:auto}
.w3-bar-block .w3-dropdown-hover,.w3-bar-block .w3-dropdown-click{width:100%}
.w3-bar-block .w3-dropdown-hover .w3-dropdown-content,.w3-bar-block .w3-dropdown-click .w3-dropdown-content{min-width:100%}
.w3-bar-block .w3-dropdown-hover .w3-button,.w3-bar-block .w3-dropdown-click .w3-button{width:100%;text-align:left;padding:8px 16px}
.w3-main,#main{transition:margin-left .4s}
.w3-modal{z-index:3;display:none;padding-top:100px;position:fixed;left:0;top:0;width:100%;height:100%;overflow:auto;background-color:rgb(0,0,0);background-color:rgba(0,0,0,0.4)}
.w3-modal-content{margin:auto;background-color:#fff;position:relative;padding:0;outline:0;width:600px}
.w3-bar{width:100%;overflow:hidden}.w3-center .w3-bar{display:inline-block;width:auto}
.w3-bar .w3-bar-item{padding:8px 16px;float:left;width:auto;border:none;display:block;outline:0}
.w3-bar .w3-dropdown-hover,.w3-bar .w3-dropdown-click{position:static;float:left}
.w3-bar .w3-button{white-space:normal}
.w3-bar-block .w3-bar-item{width:100%;display:block;padding:8px 16px;text-align:left;border:none;white-space:normal;float:none;outline:0}
.w3-bar-block.w3-center .w3-bar-item{text-align:center}.w3-block{display:block;width:100%}
.w3-responsive{display:block;overflow-x:auto}
.w3-container:after,.w3-container:before,.w3-panel:after,.w3-panel:before,.w3-row:after,.w3-row:before,.w3-row-padding:after,.w3-row-padding:before,
.w3-cell-row:before,.w3-cell-row:after,.w3-clear:after,.w3-clear:before,.w3-bar:before,.w3-bar:after{content:"";display:table;clear:both}
.w3-col,.w3-half,.w3-third,.w3-twothird,.w3-threequarter,.w3-quarter{float:left;width:100%}
.w3-col.s1{width:8.33333%}.w3-col.s2{width:16.66666%}.w3-col.s3{width:24.99999%}.w3-col.s4{width:33.33333%}
.w3-col.s5{width:41.66666%}.w3-col.s6{width:49.99999%}.w3-col.s7{width:58.33333%}.w3-col.s8{width:66.66666%}
.w3-col.s9{width:74.99999%}.w3-col.s10{width:83.33333%}.w3-col.s11{width:91.66666%}.w3-col.s12{width:99.99999%}
@media (min-width:601px){.w3-col.m1{width:8.33333%}.w3-col.m2{width:16.66666%}.w3-col.m3,.w3-quarter{width:24.99999%}.w3-col.m4,.w3-third{width:33.33333%}
.w3-col.m5{width:41.66666%}.w3-col.m6,.w3-half{width:49.99999%}.w3-col.m7{width:58.33333%}.w3-col.m8,.w3-twothird{width:66.66666%}
.w3-col.m9,.w3-threequarter{width:74.99999%}.w3-col.m10{width:83.33333%}.w3-col.m11{width:91.66666%}.w3-col.m12{width:99.99999%}}
@media (min-width:993px){.w3-col.l1{width:8.33333%}.w3-col.l2{width:16.66666%}.w3-col.l3{width:24.99999%}.w3-col.l4{width:33.33333%}
.w3-col.l5{width:41.66666%}.w3-col.l6{width:49.99999%}.w3-col.l7{width:58.33333%}.w3-col.l8{width:66.66666%}
.w3-col.l9{width:74.99999%}.w3-col.l10{width:83.33333%}.w3-col.l11{width:91.66666%}.w3-col.l12{width:99.99999%}}
.w3-rest{overflow:hidden}.w3-stretch{margin-left:-16px;margin-right:-16px}
.w3-content,.w3-auto{margin-left:auto;margin-right:auto}.w3-content{max-width:980px}.w3-auto{max-width:1140px}
.w3-cell-row{display:table;width:100%}.w3-cell{display:table-cell}
.w3-cell-top{vertical-align:top}.w3-cell-middle{vertical-align:middle}.w3-cell-bottom{vertical-align:bottom}
.w3-hide{display:none!important}.w3-show-block,.w3-show{display:block!important}.w3-show-inline-block{display:inline-block!important}
@media (max-width:1205px){.w3-auto{max-width:95%}}
@media (max-width:600px){.w3-modal-content{margin:0 10px;width:auto!important}.w3-modal{padding-top:30px}
.w3-dropdown-hover.w3-mobile .w3-dropdown-content,.w3-dropdown-click.w3-mobile .w3-dropdown-content{position:relative}	
.w3-hide-small{display:none!important}.w3-mobile{display:block;width:100%!important}.w3-bar-item.w3-mobile,.w3-dropdown-hover.w3-mobile,.w3-dropdown-click.w3-mobile{text-align:center}
.w3-dropdown-hover.w3-mobile,.w3-dropdown-hover.w3-mobile .w3-btn,.w3-dropdown-hover.w3-mobile .w3-button,.w3-dropdown-click.w3-mobile,.w3-dropdown-click.w3-mobile .w3-btn,.w3-dropdown-click.w3-mobile .w3-button{width:100%}}
@media (max-width:768px){.w3-modal-content{width:500px}.w3-modal{padding-top:50px}}
@media (min-width:993px){.w3-modal-content{width:900px}.w3-hide-large{display:none!important}.w3-sidebar.w3-collapse{display:block!important}}
@media (max-width:992px) and (min-width:601px){.w3-hide-medium{display:none!important}}
@media (max-width:992px){.w3-sidebar.w3-collapse{display:none}.w3-main{margin-left:0!important;margin-right:0!important}.w3-auto{max-width:100%}}
.w3-top,.w3-bottom{position:fixed;width:100%;z-index:1}.w3-top{top:0}.w3-bottom{bottom:0}
.w3-overlay{position:fixed;display:none;width:100%;height:100%;top:0;left:0;right:0;bottom:0;background-color:rgba(0,0,0,0.5);z-index:2}
.w3-display-topleft{position:absolute;left:0;top:0}.w3-display-topright{position:absolute;right:0;top:0}
.w3-display-bottomleft{position:absolute;left:0;bottom:0}.w3-display-bottomright{position:absolute;right:0;bottom:0}
.w3-display-middle{position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);-ms-transform:translate(-50%,-50%)}
.w3-display-left{position:absolute;top:50%;left:0%;transform:translate(0%,-50%);-ms-transform:translate(-0%,-50%)}
.w3-display-right{position:absolute;top:50%;right:0%;transform:translate(0%,-50%);-ms-transform:translate(0%,-50%)}
.w3-display-topmiddle{position:absolute;left:50%;top:0;transform:translate(-50%,0%);-ms-transform:translate(-50%,0%)}
.w3-display-bottommiddle{position:absolute;left:50%;bottom:0;transform:translate(-50%,0%);-ms-transform:translate(-50%,0%)}
.w3-display-container:hover .w3-display-hover{display:block}.w3-display-container:hover span.w3-display-hover{display:inline-block}.w3-display-hover{display:none}
.w3-display-position{position:absolute}
.w3-circle{border-radius:50%}
.w3-round-small{border-radius:2px}.w3-round,.w3-round-medium{border-radius:4px}.w3-round-large{border-radius:8px}.w3-round-xlarge{border-radius:16px}.w3-round-xxlarge{border-radius:32px}
.w3-row-padding,.w3-row-padding>.w3-half,.w3-row-padding>.w3-third,.w3-row-padding>.w3-twothird,.w3-row-padding>.w3-threequarter,.w3-row-padding>.w3-quarter,.w3-row-padding>.w3-col{padding:0 8px}
.w3-container,.w3-panel{padding:0.01em 16px}.w3-panel{margin-top:16px;margin-bottom:16px}
.w3-code,.w3-codespan{font-family:Consolas,"courier new";font-size:16px}
.w3-code{width:auto;background-color:#fff;padding:8px 12px;border-left:4px solid #4CAF50;word-wrap:break-word}
.w3-codespan{color:crimson;background-color:#f1f1f1;padding-left:4px;padding-right:4px;font-size:110%}
.w3-card,.w3-card-2{box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12)}
.w3-card-4,.w3-hover-shadow:hover{box-shadow:0 4px 10px 0 rgba(0,0,0,0.2),0 4px 20px 0 rgba(0,0,0,0.19)}
.w3-spin{animation:w3-spin 2s infinite linear}@keyframes w3-spin{0%{transform:rotate(0deg)}100%{transform:rotate(359deg)}}
.w3-animate-fading{animation:fading 10s infinite}@keyframes fading{0%{opacity:0}50%{opacity:1}100%{opacity:0}}
.w3-animate-opacity{animation:opac 0.8s}@keyframes opac{from{opacity:0} to{opacity:1}}
.w3-animate-top{position:relative;animation:animatetop 0.4s}@keyframes animatetop{from{top:-300px;opacity:0} to{top:0;opacity:1}}
.w3-animate-left{position:relative;animation:animateleft 0.4s}@keyframes animateleft{from{left:-300px;opacity:0} to{left:0;opacity:1}}
.w3-animate-right{position:relative;animation:animateright 0.4s}@keyframes animateright{from{right:-300px;opacity:0} to{right:0;opacity:1}}
.w3-animate-bottom{position:relative;animation:animatebottom 0.4s}@keyframes animatebottom{from{bottom:-300px;opacity:0} to{bottom:0;opacity:1}}
.w3-animate-zoom {animation:animatezoom 0.6s}@keyframes animatezoom{from{transform:scale(0)} to{transform:scale(1)}}
.w3-animate-input{transition:width 0.4s ease-in-out}.w3-animate-input:focus{width:100%!important}
.w3-opacity,.w3-hover-opacity:hover{opacity:0.60}.w3-opacity-off,.w3-hover-opacity-off:hover{opacity:1}
.w3-opacity-max{opacity:0.25}.w3-opacity-min{opacity:0.75}
.w3-greyscale-max,.w3-grayscale-max,.w3-hover-greyscale:hover,.w3-hover-grayscale:hover{filter:grayscale(100%)}
.w3-greyscale,.w3-grayscale{filter:grayscale(75%)}.w3-greyscale-min,.w3-grayscale-min{filter:grayscale(50%)}
.w3-sepia{filter:sepia(75%)}.w3-sepia-max,.w3-hover-sepia:hover{filter:sepia(100%)}.w3-sepia-min{filter:sepia(50%)}
.w3-tiny{font-size:10px!important}.w3-small{font-size:12px!important}.w3-medium{font-size:15px!important}.w3-large{font-size:18px!important}
.w3-xlarge{font-size:24px!important}.w3-xxlarge{font-size:36px!important}.w3-xxxlarge{font-size:48px!important}.w3-jumbo{font-size:64px!important}
.w3-left-align{text-align:left!important}.w3-right-align{text-align:right!important}.w3-justify{text-align:justify!important}.w3-center{text-align:center!important}
.w3-border-0{border:0!important}.w3-border{border:1px solid #ccc!important}
.w3-border-top{border-top:1px solid #ccc!important}.w3-border-bottom{border-bottom:1px solid #ccc!important}
.w3-border-left{border-left:1px solid #ccc!important}.w3-border-right{border-right:1px solid #ccc!important}
.w3-topbar{border-top:6px solid #ccc!important}.w3-bottombar{border-bottom:6px solid #ccc!important}
.w3-leftbar{border-left:6px solid #ccc!important}.w3-rightbar{border-right:6px solid #ccc!important}
.w3-section,.w3-code{margin-top:16px!important;margin-bottom:16px!important}
.w3-margin{margin:16px!important}.w3-margin-top{margin-top:16px!important}.w3-margin-bottom{margin-bottom:16px!important}
.w3-margin-left{margin-left:16px!important}.w3-margin-right{margin-right:16px!important}
.w3-padding-small{padding:4px 8px!important}.w3-padding{padding:8px 16px!important}.w3-padding-large{padding:12px 24px!important}
.w3-padding-16{padding-top:16px!important;padding-bottom:16px!important}.w3-padding-24{padding-top:24px!important;padding-bottom:24px!important}
.w3-padding-32{padding-top:32px!important;padding-bottom:32px!important}.w3-padding-48{padding-top:48px!important;padding-bottom:48px!important}
.w3-padding-64{padding-top:64px!important;padding-bottom:64px!important}
.w3-left{float:left!important}.w3-right{float:right!important}
.w3-button:hover{color:#000!important;background-color:#ccc!important}
.w3-transparent,.w3-hover-none:hover{background-color:transparent!important}
.w3-hover-none:hover{box-shadow:none!important}
/* Colors */
.w3-amber,.w3-hover-amber:hover{color:#000!important;background-color:#ffc107!important}
.w3-aqua,.w3-hover-aqua:hover{color:#000!important;background-color:#00ffff!important}
.w3-blue,.w3-hover-blue:hover{color:#fff!important;background-color:#2196F3!important}
.w3-light-blue,.w3-hover-light-blue:hover{color:#000!important;background-color:#87CEEB!important}
.w3-brown,.w3-hover-brown:hover{color:#fff!important;background-color:#795548!important}
.w3-cyan,.w3-hover-cyan:hover{color:#000!important;background-color:#00bcd4!important}
.w3-blue-grey,.w3-hover-blue-grey:hover,.w3-blue-gray,.w3-hover-blue-gray:hover{color:#fff!important;background-color:#607d8b!important}
.w3-green,.w3-hover-green:hover{color:#fff!important;background-color:#4CAF50!important}
.w3-light-green,.w3-hover-light-green:hover{color:#000!important;background-color:#8bc34a!important}
.w3-indigo,.w3-hover-indigo:hover{color:#fff!important;background-color:#3f51b5!important}
.w3-khaki,.w3-hover-khaki:hover{color:#000!important;background-color:#f0e68c!important}
.w3-lime,.w3-hover-lime:hover{color:#000!important;background-color:#cddc39!important}
.w3-orange,.w3-hover-orange:hover{color:#000!important;background-color:#ff9800!important}
.w3-deep-orange,.w3-hover-deep-orange:hover{color:#fff!important;background-color:#ff5722!important}

.w3-midnight,.w3-hover-midnight:hover{color:#fff!important;background-color:rgb(0,13,26)!important}

.w3-pink,.w3-hover-pink:hover{color:#fff!important;background-color:#e91e63!important}
.w3-purple,.w3-hover-purple:hover{color:#fff!important;background-color:#9c27b0!important}
.w3-deep-purple,.w3-hover-deep-purple:hover{color:#fff!important;background-color:#673ab7!important}
.w3-red,.w3-hover-red:hover{color:#fff!important;background-color:#f44336!important}
.w3-sand,.w3-hover-sand:hover{color:#000!important;background-color:#fdf5e6!important}
.w3-teal,.w3-hover-teal:hover{color:#fff!important;background-color:#009688!important}
.w3-yellow,.w3-hover-yellow:hover{color:#000!important;background-color:#ffeb3b!important}
.w3-white,.w3-hover-white:hover{color:#000!important;background-color:#fff!important}
.w3-black,.w3-hover-black:hover{color:#fff!important;background-color:#000!important}
.w3-grey,.w3-hover-grey:hover,.w3-gray,.w3-hover-gray:hover{color:#000!important;background-color:#9e9e9e!important}
.w3-light-grey,.w3-hover-light-grey:hover,.w3-light-gray,.w3-hover-light-gray:hover{color:#000!important;background-color:#f1f1f1!important}
.w3-dark-grey,.w3-hover-dark-grey:hover,.w3-dark-gray,.w3-hover-dark-gray:hover{color:#fff!important;background-color:#616161!important}
.w3-pale-red,.w3-hover-pale-red:hover{color:#000!important;background-color:#ffdddd!important}
.w3-pale-green,.w3-hover-pale-green:hover{color:#000!important;background-color:#ddffdd!important}
.w3-pale-yellow,.w3-hover-pale-yellow:hover{color:#000!important;background-color:#ffffcc!important}
.w3-pale-blue,.w3-hover-pale-blue:hover{color:#000!important;background-color:#ddffff!important}
.w3-text-amber,.w3-hover-text-amber:hover{color:#ffc107!important}
.w3-text-aqua,.w3-hover-text-aqua:hover{color:#00ffff!important}
.w3-text-blue,.w3-hover-text-blue:hover{color:#2196F3!important}
.w3-text-light-blue,.w3-hover-text-light-blue:hover{color:#87CEEB!important}
.w3-text-brown,.w3-hover-text-brown:hover{color:#795548!important}
.w3-text-cyan,.w3-hover-text-cyan:hover{color:#00bcd4!important}

.w3-text-midnight,.w3-hover-text-midnight:hover{color:#191970!important}

.w3-text-blue-grey,.w3-hover-text-blue-grey:hover,.w3-text-blue-gray,.w3-hover-text-blue-gray:hover{color:#607d8b!important}
.w3-text-green,.w3-hover-text-green:hover{color:#4CAF50!important}
.w3-text-light-green,.w3-hover-text-light-green:hover{color:#8bc34a!important}
.w3-text-indigo,.w3-hover-text-indigo:hover{color:#3f51b5!important}
.w3-text-khaki,.w3-hover-text-khaki:hover{color:#b4aa50!important}
.w3-text-lime,.w3-hover-text-lime:hover{color:#cddc39!important}
.w3-text-orange,.w3-hover-text-orange:hover{color:#ff9800!important}
.w3-text-deep-orange,.w3-hover-text-deep-orange:hover{color:#ff5722!important}
.w3-text-pink,.w3-hover-text-pink:hover{color:#e91e63!important}
.w3-text-purple,.w3-hover-text-purple:hover{color:#9c27b0!important}
.w3-text-deep-purple,.w3-hover-text-deep-purple:hover{color:#673ab7!important}
.w3-text-red,.w3-hover-text-red:hover{color:#f44336!important}
.w3-text-sand,.w3-hover-text-sand:hover{color:#fdf5e6!important}
.w3-text-teal,.w3-hover-text-teal:hover{color:#009688!important}
.w3-text-yellow,.w3-hover-text-yellow:hover{color:#d2be0e!important}
.w3-text-white,.w3-hover-text-white:hover{color:#fff!important}
.w3-text-black,.w3-hover-text-black:hover{color:#000!important}
.w3-text-grey,.w3-hover-text-grey:hover,.w3-text-gray,.w3-hover-text-gray:hover{color:#757575!important}
.w3-text-light-grey,.w3-hover-text-light-grey:hover,.w3-text-light-gray,.w3-hover-text-light-gray:hover{color:#f1f1f1!important}
.w3-text-dark-grey,.w3-hover-text-dark-grey:hover,.w3-text-dark-gray,.w3-hover-text-dark-gray:hover{color:#3a3a3a!important}
.w3-border-amber,.w3-hover-border-amber:hover{border-color:#ffc107!important}
.w3-border-aqua,.w3-hover-border-aqua:hover{border-color:#00ffff!important}
.w3-border-blue,.w3-hover-border-blue:hover{border-color:#2196F3!important}
.w3-border-light-blue,.w3-hover-border-light-blue:hover{border-color:#87CEEB!important}
.w3-border-brown,.w3-hover-border-brown:hover{border-color:#795548!important}
.w3-border-cyan,.w3-hover-border-cyan:hover{border-color:#00bcd4!important}
.w3-border-blue-grey,.w3-hover-border-blue-grey:hover,.w3-border-blue-gray,.w3-hover-border-blue-gray:hover{border-color:#607d8b!important}
.w3-border-green,.w3-hover-border-green:hover{border-color:#4CAF50!important}
.w3-border-light-green,.w3-hover-border-light-green:hover{border-color:#8bc34a!important}
.w3-border-indigo,.w3-hover-border-indigo:hover{border-color:#3f51b5!important}
.w3-border-khaki,.w3-hover-border-khaki:hover{border-color:#f0e68c!important}
.w3-border-lime,.w3-hover-border-lime:hover{border-color:#cddc39!important}
.w3-border-orange,.w3-hover-border-orange:hover{border-color:#ff9800!important}
.w3-border-deep-orange,.w3-hover-border-deep-orange:hover{border-color:#ff5722!important}
.w3-border-pink,.w3-hover-border-pink:hover{border-color:#e91e63!important}
.w3-border-purple,.w3-hover-border-purple:hover{border-color:#9c27b0!important}
.w3-border-deep-purple,.w3-hover-border-deep-purple:hover{border-color:#673ab7!important}
.w3-border-red,.w3-hover-border-red:hover{border-color:#f44336!important}
.w3-border-sand,.w3-hover-border-sand:hover{border-color:#fdf5e6!important}
.w3-border-teal,.w3-hover-border-teal:hover{border-color:#009688!important}
.w3-border-yellow,.w3-hover-border-yellow:hover{border-color:#ffeb3b!important}
.w3-border-white,.w3-hover-border-white:hover{border-color:#fff!important}
.w3-border-black,.w3-hover-border-black:hover{border-color:#000!important}
.w3-border-grey,.w3-hover-border-grey:hover,.w3-border-gray,.w3-hover-border-gray:hover{border-color:#9e9e9e!important}
.w3-border-light-grey,.w3-hover-border-light-grey:hover,.w3-border-light-gray,.w3-hover-border-light-gray:hover{border-color:#f1f1f1!important}
.w3-border-dark-grey,.w3-hover-border-dark-grey:hover,.w3-border-dark-gray,.w3-hover-border-dark-gray:hover{border-color:#616161!important}
.w3-border-pale-red,.w3-hover-border-pale-red:hover{border-color:#ffe7e7!important}.w3-border-pale-green,.w3-hover-border-pale-green:hover{border-color:#e7ffe7!important}
.w3-border-pale-yellow,.w3-hover-border-pale-yellow:hover{border-color:#ffffcc!important}.w3-border-pale-blue,.w3-hover-border-pale-blue:hover{border-color:#e7ffff!important}
 /*--------------------------------------------------------*/ 
  
  
  
  
  
  
  
  
  
  
	.navbar {
	  overflow: hidden;
	  background-color: #333;
	  font-family: Arial, Helvetica, sans-serif;
	}

	.navbar a {
	  float: left;
	  font-size: 16px;
	  color: white;
	  text-align: center;
	  padding: 14px 16px;
	  text-decoration: none;
	}

	.dropdown {
	  float: left;
	  overflow: hidden;
	}

	.dropdown .dropbtn {
	  cursor: pointer;
	  font-size: 16px;  
	  border: none;
	  outline: none;
	  color: white;
	  padding: 14px 16px;
	  background-color: inherit;
	  font-family: inherit;
	  margin: 0;
	}

	.navbar a:hover, .dropdown:hover .dropbtn, .dropbtn:focus {
	  background-color: rgb(0,13,26);
	}

	.dropdown-content {
	  display: none;
	  position: absolute;
	  background-color: #f9f9f9;
	  min-width: 160px;
	  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  z-index: 1;
	}

	.dropdown-content a {
	  float: none;
	  color: black;
	  padding: 12px 16px;
	  text-decoration: none;
	  display: block;
	  text-align: left;
	}

	.dropdown-content a:hover {
	  background-color: #ddd;
	}

	.show {
	  display: block;
	}
	
	
	
	#menu {
	  width: 30px;
	  height: 3px;
	  background-color: white;
	  margin: 3px 0px;
	}
	
	
	#more {display: none;}
	#more1 {display: none;}
	#more2 {display: none;}
	#more3 {display: none;}

	#lala {
		padding:10px;
	    color: rgb(0,26,51);
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    font-size: 1em;
	    height: 10%;
	    width:20%;
	    background-image: linear-gradient(to right top, #99bbcb, #a5c7d7, #b1d4e2, #bde0ee, #c9edfa);
	}
	
	
	#lala.sunny {
	    background-image: linear-gradient(to right top, #ff4e50, #ff713e, #ff932b, #ffb41d, #f9d423);
	}
	#lala.cloudy {
	    background-image: linear-gradient(to right top, #63747c, #71858e, #7f96a0, #8da8b2, #9bbac5);
	}
	#lala.rainy {
	    background-image: linear-gradient(to right top, #637c7b, #718e8c, #7ea09e, #8db2b0, #9bc5c3);
	}
	
	.form-inline {
	  display: flex;
	  flex-flow: row wrap;
	  align-items: center;
	}
	
	/* Style the input fields */
	.form-inline input {
	  vertical-align: middle;
	  margin: 5px 10px 5px 0;
	  padding: 10px;
	  background-color: #A3BFD4;
	  border: 1px solid #ddd;
	}
	
	@media (max-width: 800px) {
	  .form-inline input {
	    margin: 10px 0;
	  }
	
	  .form-inline {
	    flex-direction: column;
	    align-items: stretch;
	  }




	</style>
  
  
  
  
</head>
<script type="text/javascript">var username = 0;</script>
<body onload="signedIn();getLocation();">

<!-- Navbar (sit on top) -->
<div class="w3-top w3-midnight w3-padding w3-card">
  
    <a href="home.jsp" class="w3-bar-item w3-left"><img src="Images/logo.jpg" width="40" height="40" style="border-radius: 50%;"></a>
	<div class="dropdown w3-right">
	  <button class="dropbtn w3-hide-large w3-hide-medium" onclick="myFunction()">
	    <div id="menu"></div>
		<div id="menu"></div>
		<div id="menu"></div>
		<i class="fa fa-caret-down"></i>
	  </button>
	  <div class="dropdown-content w3-hide-large w3-hide-medium" id="myDropdown" style="right:0">
		<a href="mailto:kostismvg@gmail.com" class="w3-bar-item w3-hover-red w3-button">Contact us</a>
		<a href="home.jsp#about" class="w3-bar-item w3-hover-red w3-button">About</a>
		<a href="home.jsp#actions" class="w3-bar-item w3-hover-red w3-button">Actions</a>
	  </div>
	  <div class="w3-right w3-hide-small">
	  <a href="mailto:kostismvg@gmail.com" class="w3-bar-item w3-hover-red w3-button">Contact us</a>
	  <a href="home.jsp#about" class="w3-bar-item w3-hover-red w3-button">About</a>
      <a href="home.jsp#actions" class="w3-bar-item w3-hover-red w3-button">Actions</a>
    </div>
    </div> 
  
</div>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:100%;" id="home">
  <img class="w3-image" src="Images/american.jpg" alt="Health" width="100%" height="auto">
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge "><span class="w3-padding w3-white w3-text-red w3-opacity-min w3-hide-small"><b>A</b>merican<span class="w3-text-midnight"><b>A</b>irlines</span></span> </h1>
  </div>
</header>


	<!-- Announcements Section -->
	<div class="w3-container w3-padding-16 w3-text-white" id="about" style="background-color:#7e2d36">
     <marquee width="100%" direction="right" onmouseover="this.stop();" onmouseout="this.start();">
	<%	
		Client client3 = Client.create();
		WebResource webresource3 = client3.resource("http://localhost:8080/AA/rest/AAService/Announcements");
		ClientResponse myresponse3 = webresource3.accept("text/plain").get(ClientResponse.class);
		String output3 = myresponse3.getEntity(String.class);
		List<String> fleetList = Arrays.asList(output3.split(","));
		for (int i=0; i<fleetList.size(); i++)
		{
			out.print(fleetList.get(i).replace("[","").replace("]",""));
		}
	%>
	</marquee>
	</div>










	<!-- About Section -->
  <div class="w3-container w3-padding-32" id="about" style="background-color:#7395b2">
     
    <h3 class="w3-border-bottom w3-border-black w3-padding-16">About us</h3>
	
    <div style=" text-align: justify; text-justify: inter-word; overflow: hidden;" class="w3-mobile">American Airlines, Inc. (AA) 
		is a major American airline headquartered in Fort Worth, Texas, within the Dallas-Fort Worth metroplex. 
		We are the world's largest airline 
		when measured by fleet size, scheduled passengers carried, and revenue passenger mile. American, 
		together <span id="dots">...</span><span id="more">  with our regional partners, operates an extensive international and domestic network with almost 6,800 flights per day to 
		nearly 350 destinations in more than 50 countries. American Airlines is a founding member of the Oneworld alliance, 
		the third-largest airline alliance in the world. Regional service is operated by independent and subsidiary carriers 
		under the brand name American Eagle.
		<br>
		American Airlines and American Eagle operate out of 10 hubs, with Dallas/Fort Worth (DFW) being its largest. 
		The airline handles more than 200 million passengers annually with an average of more than 500,000 passengers daily. 
		As of 2019, the American Airlines family consists of nearly 130,000 people!
		<br>
		American Airlines operates its primary and the largest Maintenance and Repair Operations (MRO) 
		base in Tulsa in addition to the maintenance locations at its hubs.	</span>
	</div>
	<br>
	<a onclick="showMore(); hide();" id="myBtn" class="w3-red w3-padding w3-hover-midnight w3-right" style="cursor: pointer;">More</a>
	</div>

	<div class="w3-container w3-padding-32" style="background-color:#b3aec0">
		<h3 class="w3-border-bottom w3-border-black w3-padding-16">Sign up</h3>
		<form METHOD="post" class="form-inline">
			Username: <input type="text" name="username" value="" required>
			Password: <input type="text" name="password" value="" required>
			<input type ="submit" name="signUp" value ="Sign Up" class="w3-red w3-padding w3-hover-midnight" style="cursor: pointer; border:none;">
		</form>	
		<%
			if(request.getParameter("signUp") != null)
			{
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				String type = "simple";			
				Client client = Client.create();
				WebResource webresource = client.resource("http://localhost:8080/AA/rest/AAService/SignUp/"+username+"/"+
						password+"/"+type);
				ClientResponse myresponse = webresource.accept("text/plain").post(ClientResponse.class);
				String output = myresponse.getEntity(String.class);
				out.println(output);
			}
		%>
	</div>
	
	
	<div class="w3-container w3-padding-32" style="background-color:#b3aec0">
		<h3 class="w3-border-bottom w3-border-black w3-padding-16">Sign in</h3>
		<form METHOD="post" class="form-inline">
			Username: <input type="text" name="username" value="" required>
			Password: <input type="text" name="password" value="" required>
			<input type ="submit" name="signIn" value ="Sign In" class="w3-red w3-padding w3-hover-midnight" style="cursor: pointer; border:none;">
		</form>	
		<%
			if(request.getParameter("signIn") != null)
			{
				String username = request.getParameter("username");
				String password = request.getParameter("password");		
				Client client = Client.create();
				WebResource webresource = client.resource("http://localhost:8080/AA/rest/AAService/SignIn/"+username+"/"+
						password);
				ClientResponse myresponse = webresource.accept("text/plain").post(ClientResponse.class);
				String output = myresponse.getEntity(String.class);
				%>
				<script type="text/javascript">document.cookie = "username=<%out.print(output);%>;path=/";</script>
				<% 
				
				Client client1 = Client.create();
				WebResource webresource1 = client1.resource("http://localhost:8080/AA/rest/AAService/CheckType/"+username);
				ClientResponse myresponse1 = webresource1.accept("text/plain").post(ClientResponse.class);
				String output1 = myresponse1.getEntity(String.class);
								%>
				<script type="text/javascript">document.cookie = "type=<%out.print(output1);%>;path=/";</script>
				<% 
				
			}
		%>
	</div>

	

<div id="signed_in" style="display:none; background-color:#7395b2" >
  <!-- Actions Section -->
  <div class="w3-container w3-padding-32 " id="actions">
    <h3 class="w3-border-bottom w3-border-black w3-padding-16">What would you like to do?</h3>
  </div>

  <div class="w3-row-padding ">
    <div class="w3-col 12 m2 w3-margin-bottom">
      <div class="w3-display-container" style="border-style: solid; border-color: rgb(0,13,26);">
        <a href="flights.jsp"><div class="w3-display-topleft w3-red w3-padding w3-hover-midnight" >Find flights</div></a>
        <a href="fligths.jsp"><img src="Images/flights.jpg" alt="findflights" style="width:100%"></a>
      </div>
    </div>
    <div class="w3-col 12 m2 w3-margin-bottom">
      <div class="w3-display-container" style="border-style: solid; border-color: rgb(0,13,26);">
        <a href="book.jsp"><div class="w3-display-topleft w3-red w3-padding w3-hover-midnight">Book a flight</div></a>
        <a href="book.jsp"><img src="Images/book.jpg" alt="book" style="width:100%"></a>
      </div>
    </div>
    <div class="w3-col 12 m2 w3-margin-bottom">
      <div class="w3-display-container" style="border-style: solid; border-color: rgb(0,13,26);">
        <a href="checkin.jsp"><div class="w3-display-topleft w3-red w3-padding w3-hover-midnight">Check in</div></a>
        <a href="checkin.jsp"><img src="Images/checkin.jpg" alt="checkin" style="width:100%"></a>
      </div>
    </div>
    <div class="w3-col 12 m2 w3-margin-bottom">
      <div class="w3-display-container" style="border-style: solid; border-color: rgb(0,13,26);">
        <a href="trips.jsp"><div class="w3-display-topleft w3-red w3-padding w3-hover-midnight">My Trips</div><a>
        <a href="trips.jsp"><img src="Images/trips.jpg" alt="bioassist" style="width:100%"></a>
      </div>
    </div>
	<div class="w3-col 12 m2 w3-margin-bottom">
      <div class="w3-display-container" style="border-style: solid; border-color: rgb(0,13,26); display:none;" id="admintab">
        <a href="admin.jsp"><div class="w3-display-topleft w3-red w3-padding w3-hover-midnight">Admin</div></a>
        <a href="admin.jsp"><img src="Images/admin.jpeg" alt="admin" style="width:100%"></a>
      </div>
    </div>
  </div>

</div>  
	
  

  

  
    
    <div style="text-align: center; position:fixed; bottom:10px; left:0; display:none" id="tweets">
    <a class="twitter-timeline" data-width="400" data-height="400" data-theme="dark" href="https://twitter.com/AmericanAir?ref_src=twsrc%5Etfw">Tweets by AmericanAir</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
    </div>
    <div style="position:fixed; bottom:20%; right:0; padding: 2;">
  	<button style="border: none; background-color: Transparent;
    background-repeat:no-repeat; color: rgb(0,13,26); font-size:36px" onclick="tweets()"><i class="fa fa-twitter"></i></button>
  	<br>
	<button style="border: none; background-color: Transparent;
    background-repeat:no-repeat; color: rgb(0,13,26); font-size:36px" onclick="showlala()"><i class="fa fa-cloud"></i></button>
	</div>

<div id="lala" style="text-align: center; position:fixed; bottom:10%; height:100px; width:200px; left:0; display:none;">
  <div class="bg"></div>
	<div>
    <div id="description"></div>
    <div id="temp"></div>
    <div id="location"></div>
  </div>
  </div>
  <script type="text/javascript">
	  const key = '7ff70ce381b8c8194b27b370ae2efdc6';
	  if(key=='') document.getElementById('temp').innerHTML = ('Remember to add your api key!');
	
	  function weatherBallon(lat,lon) {
	  	fetch('https://api.openweathermap.org/data/2.5/weather?lat=' + lat+ '&lon=' + lon+ '&appid=' + key)  
	  	.then(function(resp) { return resp.json() }) // Convert data to json
	  	.then(function(data) {
	  		drawWeather(data);
	  	})
	  	.catch(function() {
	  		// catch any errors
	  	});
	  }
	  function drawWeather( d ) {
	    var celcius = Math.round(parseFloat(d.main.temp)-273.15);
	  	var fahrenheit = Math.round(((parseFloat(d.main.temp)-273.15)*1.8)+32);
	    var description = d.weather[0].description; 
	  	
	  	document.getElementById('description').innerHTML = "<i class='fa fa-binoculars'></i> "+description;
	  	document.getElementById('temp').innerHTML = "<i class='fa fa-thermometer'></i> "+ celcius + '&deg;';
	  	document.getElementById('location').innerHTML = "<i class='fa fa-map-marker'></i> "+ d.name;
	    
	    if( description.indexOf('rain') > 0 ) {
	    	document.body.className = 'rainy';
	    } else if( description.indexOf('cloud') > 0 ) {
	    	document.body.className = 'cloudy';
	    } else if( description.indexOf('sunny') > 0 ) {
	    	document.body.className = 'sunny';
	    } else {
	    	document.body.className = 'clear';
	    }
	  }
	  function getLocation() {
		  if (navigator.geolocation) {
		    navigator.geolocation.getCurrentPosition(showPosition);
		  } else { 
		    x.innerHTML = "Geolocation is not supported by this browser.";
		  }
		}
	  function showPosition(position) {
	  	weatherBallon(position.coords.latitude, position.coords.longitude);
	  }
  </script>



<!-- Footer -->
<footer class="w3-center w3-midnight w3-padding-16">
  <a href = "https://github.com/mavrogiorgos" style="text-decoration:none;">Kostis Mavrogiorgos</a> - All rights reserved &copy;
</footer>





<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(e) {
  if (!e.target.matches('.dropbtn')) {
  var myDropdown = document.getElementById("myDropdown");
    if (myDropdown.classList.contains('show')) {
      myDropdown.classList.remove('show');
    }
  }
}

function showMore() {
  var dots = document.getElementById("dots");
  var moreText = document.getElementById("more");
  var btnText = document.getElementById("myBtn");

  if (dots.style.display === "none") {
    dots.style.display = "inline";
    btnText.innerHTML = "More";
    moreText.style.display = "none";
  } else {
    dots.style.display = "none";
    btnText.innerHTML = "Less";
    moreText.style.display = "inline";
  }
}


function showMore1() {
  var dots = document.getElementById("dots1");
  var moreText = document.getElementById("more1");
  var btnText = document.getElementById("myBtn1");

  if (dots.style.display === "none") {
    dots.style.display = "inline";
    btnText.innerHTML = "Περισσότερα";
    moreText.style.display = "none";
  } else {
    dots.style.display = "none";
    btnText.innerHTML = "Λιγότερα";
    moreText.style.display = "inline";
  }
}

function showMore2() {
  var dots = document.getElementById("dots2");
  var moreText = document.getElementById("more2");
  var btnText = document.getElementById("myBtn2");

  if (dots.style.display === "none") {
    dots.style.display = "inline";
    btnText.innerHTML = "Περισσότερα";
    moreText.style.display = "none";
  } else {
    dots.style.display = "none";
    btnText.innerHTML = "Λιγότερα";
    moreText.style.display = "inline";
  }
}

function showMore3() {
  var dots = document.getElementById("dots3");
  var moreText = document.getElementById("more3");
  var btnText = document.getElementById("myBtn3");

  if (dots.style.display === "none") {
    dots.style.display = "inline";
    btnText.innerHTML = "Περισσότερα";
    moreText.style.display = "none";
  } else {
    dots.style.display = "none";
    btnText.innerHTML = "Λιγότερα";
    moreText.style.display = "inline";
  }
}


function getCookie(name) {
    var dc = document.cookie;
    var prefix = name + "=";
    var begin = dc.indexOf("; " + prefix);
    if (begin == -1) {
        begin = dc.indexOf(prefix);
        if (begin != 0) return null;
    }
    else
    {
        begin += 2;
        var end = document.cookie.indexOf(";", begin);
        if (end == -1) {
        end = dc.length;
        }
    }
    // because unescape has been deprecated, replaced with decodeURI
    //return unescape(dc.substring(begin + prefix.length, end));
    return decodeURI(dc.substring(begin + prefix.length, end));
} 



function signedIn() {
	  var myCookie = getCookie("username");
	  var adminCookie = getCookie("type");
	  var x = document.getElementById("signed_in");
	  var y = document.getElementById("admintab");
	  if(adminCookie==="simple")
	  {
		  x.style.display = "block";
			y.style.display = "block";
	  }
	  if(adminCookie==="admin")
	  {
		x.style.display = "block";
		y.style.display = "block";
	  }
	  else
	  {
		  y.style.display = "none";
	  }
	}
	
	function tweets() {
		  var x = document.getElementById("tweets");
		  if (x.style.display === "none") {
		    x.style.display = "block";
		  } else {
		    x.style.display = "none";
		  }
		}
	
	function showlala() {
		  var x = document.getElementById("lala");
		  if (x.style.display === "none") {
		    x.style.display = "block";
		  } else {
		    x.style.display = "none";
		  }
		}
	
</script>






</body>
</html>
