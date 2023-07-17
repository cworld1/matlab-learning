%%
%多项式
    %创建
        p = [1, 2, 3, 4];  % 系数向量，按x降幂排列，最右边是常数
        f1 = poly2str(p, 'x');  % 生成好看的字符串 f1 = x^3 + 2 x^2 + 3 x + 4，不被认可的运算式
        f2 = poly2sym(p);  % 生成可用的符号函数 f2 = x^3 + 2*x^2 + 3*x + 4
    %求值
        x = 4;
        y1 = polyval(p, x);  % 代入求值；若x1为矩阵，则对每个值单独求值
    %求根
        r = roots(p); % p同上，由系数求根，结果为根植矩阵
        p0 = poly(r);  % 由根求系数，结果为系数矩阵
        
%%
%数据插值
    %一维插值
        %yi = interp1(X, Y, xi, 'method')
        X = [-3, -1, 0, 1, 3];
        Y = [9, 1, 0, 1, 9];  % XY为已知点横纵坐标向量
        y2 = interp1(X, Y, 2);  % 差值预估在x=2的y的值，x不能超过已知范围(此处x<3)
        y2m = interp1(X, Y, 2, 'spline');  % 用spline方法(三次样条)差值预估在x=2的y的值
    %二维插值
        %zi = interp1(X, Y, Z, xi, yi, 'method')
        
%%
X = [2, 3, 9, 15, 6, 7, 4];
A = [1, 7, 2; 9, 5, 3; 8, 4 ,6];
B = [1, 7, 3; 9, 5, 3; 8, 4 ,6];
%数据统计
    %矩阵最大最小值
        y = max(X);  % 求矩阵X的最大值，min最小值
        [y, k] = max(X);  % 求最大值，k为该值的角标
        [y, k] = max(A, [], 2);  % A是矩阵，'2'时返回y每一行最大元素构成的列向量，k元素所在列；'1'时与上述相同
    %均值和中值
        y = mean(X);  % 均值
        y = median(X);  % 中值
        y = mean(A, 2);  % '2'时返回y每一行均值构成的列向量；'1'时与上述相同
        y = median(A, 2);  % '2'时返回y每一行中值构成的列向量；'1'时与上述相同
    %排序
        Y = sort(A, 1, 'ascend');  % sort(矩阵, dim, 'method')dim为1按列排序，2按行排序；ascend升序，descend降序
        [Y, I] = sort(A, 1, 'ascend');  % I保留了元素之前在A的位置
    %求和求积累加累乘
        y = sum(X);  % 求和
        y = prod(X);  % 求积
        y = cumsum(X);  % 累加
        y = cumprod(X);  % 累乘
        
%%
%*数值计算
    %最(极)值
        %多元函数在给定初值附近找最小值点
        x = fminsearch(fun, x0);
    %函数零点
        x = fzero(fun, x0);  % 在给定初值x0附近找零点 作者：glanny https://www.bilibili.com/read/cv7966685 出处：bilibili