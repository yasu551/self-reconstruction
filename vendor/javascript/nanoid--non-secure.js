// nanoid/non-secure@3.3.8 downloaded from https://ga.jspm.io/npm:nanoid@3.3.8/non-secure/index.cjs

var t={};let e="useandom-26T198340PX75pxJACKVERYMINDBUSHWOLF_GQZbfghjklqvwyzrict";let customAlphabet=(t,e=21)=>(a=e)=>{let l="";let n=a|0;while(n--)l+=t[Math.random()*t.length|0];return l};let nanoid=(t=21)=>{let a="";let l=t|0;while(l--)a+=e[Math.random()*64|0];return a};t={nanoid:nanoid,customAlphabet:customAlphabet};var a=t;const l=t.nanoid,n=t.customAlphabet;export{n as customAlphabet,a as default,l as nanoid};

