//获取屏幕的DPI
function js_getDPI() {
    var arrDPI = new Array();
    if (window.screen.deviceXDPI != undefined) {
        arrDPI[0] = window.screen.deviceXDPI;
        arrDPI[1] = window.screen.deviceYDPI;
    }
    else {
        var tmpNode = document.createElement("DIV");
        tmpNode.style.cssText = "width:1in;height:1in;position:absolute;left:0px;top:0px;z-index:99;visibility:hidden";
        document.body.appendChild(tmpNode);
        arrDPI[0] = parseInt(tmpNode.offsetWidth);
        arrDPI[1] = parseInt(tmpNode.offsetHeight);
        tmpNode.parentNode.removeChild(tmpNode);   
    }
    return arrDPI;
}
//判断 年-月-日，大小  
function compareDate(beginDate,endDate)  
{   
    var beginDateArray = beginDate.split("-");
    beginDate = beginDateArray[1]+"/"+beginDateArray[2]+"/"+beginDateArray[0];
    var endDateArray = endDate.split("-");
    endDate = endDateArray[1]+"/"+endDateArray[2]+"/"+endDateArray[0];
    return Date.parse(beginDate)>Date.parse(endDate);
}

//设置透明度
var setOpacity = document.documentElement.style.opacity===undefined?function(o,v){o.style.filter="alpha(opacity="+v+")"}:function(o,v){o.style.opacity=v/100};

//设置Cookie
function setCookie(name,value,day){
    var cookie = name + "="+ escape (value);
    if(day){
        var date  = new Date();
        date.setTime(date.getTime() + day*24*60*60*1000);
        cookie += ";expires=" + date.toUTCString();
    }
    document.cookie = cookie;
}

//获取Cookie
function getCookie(name){
    var arr = document.cookie.match(new RegExp(name+"=([^;]*);?"));
    return arr==null?'':unescape(arr[1]);
}

//删除Cookie
function removeCookie(name){
    var value=getCookie(name);
    if(value!='')document.cookie= name + "="+value+";expires="+(new Date()).toUTCString();
}

//检测Cookie
function check_cookie(){
    var cookieenabled=navigator.cookieenabled?true:false;
    if(typeof navigator.cookieenabled=='undefined' && !cookieenabled){
        setCookie('check_cookie_flag','cookie');
        cookieenabled = getCookie('check_cookie_flag')=='cookie'?true:false;
        removeCookie('check_cookie_flag');
    }
    return cookieenabled;
}

//获取浏览器客户文档对象
function getRoot(d){
    if(d==undefined)d=document;
    return navigator.appVersion.indexOf("Safari")>-1?d.body:d.documentElement;
}

//获取地址栏的参数
function getQueryParam(set,returnString){
    var query=$_GET,f;
    if(returnString===undefined)returnString=true;
    if(typeof(set)=='string'){
        set = {};
        f = set.split(',');
        for(var i=0;i<f.length;i++){
            set[f[i]] = null;
        }
    }
    for(var n in set){
        if(set[n]===null){
            delete query[n];
        }else{
            query[n]=set[n];
        }
    }
    if(!returnString)return query;
    var p = [];
    for(var n in query){
        p.push(n+'='+query[n]);
    }
    return p.join('&');
}

(function(){
    $_GET={};
    var reg=/(\w+)\=([^&]*)/g,m;
    while(m=reg.exec(location.search))$_GET[m[1]]=m[2];
})();

Array.prototype.indexOf = function(value){
    var pos = -1;
    if(value){
        for(var i=0;i<this.length;i++){
            if(this[i]==value){
                pos = i;
                break;
            }
        }
    }
    return pos;
}

Array.prototype.has = function(value){
    return this.indexOf(value)==-1?false:true;
}


//给jquery添加一个验证插件
$.extend({
    
    'validate' : {
        
        'configs' : {},
        
        //验证，指定的或全部选择器
        'check' : function(){
            var configs = {};
            var errors = 0;
            //如果有选择器
            if(arguments.length){
                for(var i=0;i<arguments.length;i++){
                    if(!$.validate.configs[arguments[i]])continue;
                    configs[arguments[i]] = $.validate.configs[arguments[i]];
                }
            }else{
                configs = $.validate.configs;
            }
            for(var selector in configs){
                for(var i=0;i<configs[selector].length;i++){
                    if(!$.validate.check_one(selector,i))errors++;
                }
            }
            return errors?false:true;
        },

        //绑定验证事件
        'bind' : function(object,rule,msg,adhere){
            var selector = object.selector;
            if(!$.validate.configs[selector])$.validate.configs[selector]=[];
            if(typeof rule!='function' && !rule.indexOf('checked')){
                $.validate.bind_event(selector,object,rule,msg,adhere);
            }else{
                //循环给每个元素绑定事件
                object.each(function(){
                    $.validate.bind_event(selector,$(this),rule,msg,adhere);
                });
            }
        },

        //删除验证事件
        'unbind' : function(object){
            var selector = object.selector;
            var config = $.validate.configs[selector];
            if(config){
                for(var i=0;i<config.length;i++){
                    config[i]['object'].unbind(config[i]['events']);
                }
                delete $.validate.configs[selector];
            }
        },

        //执行检测，返回是否符合格式
        'check_one' : function(selector,i){

            var object = $.validate.configs[selector][i]['object'];
            var rule = $.validate.configs[selector][i]['rule'];
            var msg = $.validate.configs[selector][i]['msg'];
            var flag = $.validate.configs[selector][i]['flag'];

            //判断rule是否是function
            if(typeof rule == 'function'){
                flag = rule.apply(object)?true:false;
                default_msg = '格式不正确';
            }else{
                var parts = rule.split('|');
                rule = parts[0];
                var param = parts[1];
                var value = object.val();
                var default_msg;
                //判断类型
                switch(rule){
                    
                    //不允许为空
                    case 'is_not_empty':
                        flag = value!='' && value!=null;
                        default_msg = '不能为空';
                    break;

                    //整数
                    case 'is_int':
                        flag = /^\-?\d+$/.test(value);
                        default_msg = '必须为整数';
                    break;

                    case 'is_id':
                        flag = /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/.test(value);
                        default_msg = '请填写正确的身份证号';
                    break;
                    
                    //中文
                    case 'is_cn':
                    case 'is_chinese':
                        flag = /^[\u4e00-\u9fa5]+$/.test(value);
                        default_msg = '必须全部为中文';
                    break;

                    //不允许空白符号
                    case 'is_not_has_space':
                        flag = /\s+/.test(value);
                        default_msg = '不能包含空白符';
                    break;
                    
                    //数字
                    case 'is_float':
                        flag = /^\-?\d+(\.\d+)?$/.test(value);
                        default_msg = '必须为数字';
                    break;

					//数字和中文的组合
					case 'is_chinese_float':
                        flag = /^[0-9\u4e00-\u9fa5]*$/.test(value);
					    default_msg = '必须为中文或者数字';
					break;

                    //邮箱
                    case 'is_email':
                        flag = /^\w+@\w+(\.\w+){1,2}$/.test(value);
                        default_msg = '邮箱格式不正确';
                    break;

                    //手机号
                    case 'is_mobilephone':
                        flag = /^1\d{10}$/.test(value);
                        default_msg = '手机号格式不正确';
                    break;

                    //日期
                    case 'is_date':
                        if(!param)param = 'Y-m-d';
                        var regstr = '^'+param+'$';
                        regstr = regstr.replace('d','\\d{1,2}');
                        regstr = regstr.replace('m','\\d{1,2}');
                        regstr = regstr.replace('Y','\\d{4}');
                        var reg = new RegExp(regstr);
                        flag = reg.test(value);
                        if(!flag){
                            default_msg = '日期格式不正确';
                        }
                    break;

                    //数字的范围
                    case 'range':
                        if (/^\-?\d+(\.\d+)?$/.test(value)) {
                            flag = $.validate.check_range(value,param);
                            if(!flag){
                                default_msg = '数字'+$.validate.get_check_range_msg(param);
                            }
                        }
                    break;

                    //小数位数
                    case 'decimal':
                        if(param && param!='' && ( /^\d+(,(\d+)?)?$/.test(param) || /^((\d+)?,)?\d+$/.test(param) )){
                            var reg = new RegExp('^\\d+(\\.\\d{'+param+'})?$');
                            flag = reg.test(value);
                            if(!flag){
                                default_msg = '小数位数'+$.validate.get_check_range_msg(param);
                            }
                        }
                    break;
                    
                    //字符串的长度
                    case 'length':
                        if(param && param!='' && ( /^\d+(,(\d+)?)?$/.test(param) || /^((\d+)?,)?\d+$/.test(param) )){
                            var reg = new RegExp('^.{'+param+'}$');
                            flag = reg.test(value);
                            if(!flag){
                                default_msg = '字符串'+$.validate.get_check_range_msg(param);
                            }
                        }
                    break;

                    //选中的选择项限制
                    case 'checked':
                        var num = object.filter(':checked').length;
                        var flag = $.validate.check_range(num,param);
                        if(!flag){
                            default_msg = '选中项数量'+$.validate.get_check_range_msg(param);
                        }
                    break;

                    default:
                        flag = false;
                        default_msg = '未知的验证规则';
                    break;
                }
            }

            //如果没有传提示信息，则设置成默认的
            if(!msg || msg=='')$.validate.configs[selector][i]['msg'] = default_msg;
            $.validate.configs[selector][i]['flag']=flag;
            $.validate.set(selector,i);

            return flag;

        },

        //设置样式
        'set' : function(selector,i){
            var object = $.validate.configs[selector][i]['object'];
            var rule = $.validate.configs[selector][i]['rule'];
            var msg = $.validate.configs[selector][i]['msg'];
            var flag = $.validate.configs[selector][i]['flag'];
            var adhere = $.validate.configs[selector][i]['adhere'];
            var adhere_object = object;
            //如果有错误信息依附对象参数，如果没有的默认错误提示依附在对象后面
            if(adhere){
                //如果是对象，则直接附着该对象在后面
                if(typeof adhere=='object'){
                    adhere_object = adhere;
                //如果不是数字，则视为jquery的选择器，并转换成jquery对象
                }else if(/\D/.test(adhere)){
                    adhere_object = $(adhere);
                //如果是数字，则获取当前对象往后推移指定数量的对象
                }else{
                    for(var k=0;k<adhere;k++){
                        if(adhere_object.next().length){
                            adhere_object = adhere_object.next();
                        }
                    }
                }
            }
            //如果验证正确
            if(flag){
                if(adhere_object.next().hasClass('validate_wrong')){
                    if (adhere_object.next().attr('validate_index')==i){
                        object.css('box-shadow','');
                        object.css('border-color','');
                        adhere_object.next().remove();
                    }
                }
            }else{
                //如果存在错误提示，判断优先顺序，如果晚于当前的错误则去掉错误提示
                if(adhere_object.next().hasClass('validate_wrong')){
                    if(adhere_object.next().attr('validate_index')>i){
                        adhere_object.next().remove();
                    }
                }
                //如果不存在错误提示，则显示当前错误
                if(!adhere_object.next().hasClass('validate_wrong')){
                    object.css('box-shadow','0px 0px 6px 0px #f66');
                    object.css('border-color','#f99');
                    var node = document.createElement('span');
                    node.className = 'validate_wrong';
                    node.innerHTML = msg;
                    $(node).attr('validate_index',i);
                    adhere_object.after(node);
                }
            }
        },

        //返回错误数
        'errors' : function(selector){
            var errors = 0;
            var configs;
            if(typeof selector != 'undefined'){
                configs = {};
                configs[selector] = $.validate.configs[selector];
            }else{
                configs = $.validate.configs;
            }
            for(var selector in configs){
                for(var j=0;j<configs[selector].length;j++){
                    if(configs[selector][j]['flag']===false)errors++;
                }
            }
            return errors;
        },

        //是否存在错误
        'error' : function(selector){
            var error = false;
            if(typeof selector != 'undefined'){
                configs = {};
                configs[selector] = $.validate.configs[selector];
            }else{
                configs = $.validate.configs;
            }
            for(var selector in configs){
                for(var j=0;j<configs[selector].length;j++){
                    if(configs[selector][j]['flag']===false)return true;
                }
            }
            return error;
        },

        //获取绑定事件
        'get_bind_event' : function(object){
            var events;
            if(object[0]){
                var tag = object[0].tagName.toLowerCase();
                if(tag=='input' || tag=='textarea'){
                    if(object[0].type=='text'){
                        events = 'blur change';
                    }else{
                        events = 'change';
                    }
                }else if(tag=='select'){
                    events = 'change';
                }
            }
            return events;
        },
        
        //绑定事件
        'bind_event' : function(selector,object,rule,msg,adhere){
            var events = $.validate.get_bind_event(object);
            if(!events)return;
            $.validate.configs[selector].push({
                'object' : object,
                'rule'   : rule,
                'msg'    : msg,
                'adhere' : adhere,
                'events' : events
            });
            (function(i){
                object.bind(events,function(){
                    $.validate.check_one(selector,i);
                });
            })($.validate.configs[selector].length-1);
        },

        //比较数字是否符合区间规则
        'check_range' : function(value,param){
            var flag = false;
            if(param.indexOf(',')>-1){
                var param_parts = param.split(',');
                var left = param_parts[0];
                var right = param_parts[1];
                if(left!='' && right==''){
                    flag = parseFloat(value)>=parseFloat(left);
                }else if(left=='' && right!=''){
                    flag = parseFloat(value)<=parseFloat(right);
                }else{
                    if(left<right){
                        flag = parseFloat(value)>=parseFloat(left) && parseFloat(value)<=parseFloat(right);
                    }else if(left>right){
                        flag = parseFloat(value)<=parseFloat(left) && parseFloat(value)>=parseFloat(right);
                    }else{
                        flag = parseFloat(value)==parseFloat(left);
                    }
                }
            }else{
                flag = parseFloat(value)==parseFloat(param);
            }
            return flag;
        },

        //获取区间类的提示信息
        'get_check_range_msg' : function(param){
            var default_msg;
            if (param.indexOf(',')>-1) {
                var param_parts = param.split(',');
                var left = param_parts[0];
                var right = param_parts[1];
                if(left!='' && right==''){
                    default_msg = '必须大于或等于'+left;
                }else if(left=='' && right!=''){
                    default_msg = '必须小于或等于'+right;
                }else{
                    if(left<right){
                        default_msg = '必须在'+left+'到'+right+'之间';
                    }else if(left>right){
                        default_msg = '必须在'+right+'和'+left+'之间';
                    }else{
                        default_msg = '必须等于'+left;
                    }
                }
            }else{
                default_msg = '必须等于'+param;
            }
            return default_msg;
        }

    }
});

//验证类
$.fn.extend({
    'validate' : function(rule,msg,adhere){
        $.validate.bind($(this),rule,msg,adhere);
        return $(this);
    },
    'invalidate' : function(){
        $.validate.unbind($(this));
        return $(this);
    },
    'check' : function(){
        return $.validate.check($(this).selector);
    }
});
