var setAmount={
    min:1,
    max:999,
    reg:function(x){
        return new RegExp("^[1-9]\\d*$").test(x);
    },
    amount:function(obj,mode){
        var x=$(obj).val();
        if (this.reg(x)){
            if (mode){
                x++;
            }else{
                x--;
            }
        }else{
            alert("请输入正确的数量！");
            $(obj).val(1);
            $(obj).focus();
        }
        return x;
    },
    reduce:function(obj){
        var x=this.amount(obj,false);
        if (x>=this.min){
            $(obj).val(x);
        }else{
            alert("商品数量最少为"+this.min);
            $(obj).val(1);
            $(obj).focus();
        }
    },
    add:function(obj){
        var x=this.amount(obj,true);
        if (x<=this.max){
            $(obj).val(x);
        }else{
            alert("商品数量最多为"+this.max);
            $(obj).val(999);
            $(obj).focus();
        }
    },
    modify:function(obj){
        var x=$(obj).val();
        if (x<this.min||x>this.max||!this.reg(x)){
            alert("请输入正确的数量！");
            $(obj).val(1);
            $(obj).focus();
        }
    }
}