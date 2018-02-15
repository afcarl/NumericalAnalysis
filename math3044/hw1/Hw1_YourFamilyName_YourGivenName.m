%Age(month)
x=[3 6 5 5 3 4 9 8 9 7 6 5 8 6];
%Height(cm)
y=[55 68 64 66 62 65 74 75 73 69 73 68 73 71];

%1. plot the discrete point
scatter(x,y,'k');
title('discrete point plot');  
xlabel('Age(month)');  
ylabel('Height(cm)');  
hold on

n=length(x);

%2. plot the result of applying linear regression with E2 and f(x)=ax+b
    %i. compute coefficients a and b
     a=(n*sum(x.*y)-sum(x)*sum(y))/(n*sum((x).^2)-(sum(x).^2))
     b=(sum(x)*sum(y.*x)-sum((x).^2)*sum(y))/((sum(x)).^2-n*(sum(x.^2)))
    %ii. compute E2
     E2=sqrt(sum((a*x+b-y).^2)/n)
    %iii. plot
    x_11=[3:1:9];
    plot(x_11,a*x_11+b,'r');
    title('linear regression');  
    xlabel('Age(month)');  
    ylabel('Height(cm)');
    
%3. plot the result of applying nonlinear regression with E2 and f(x)=be^(ax)
    %i. f(x) = b1*exp(a1*x) coefficients
    %change variables 
    %new data set
    x1=x;
    y1=log(y);
    
    a1=(n*sum(x1.*y1)-sum(x1)*sum(y1))/(n*sum((x1).^2)-(sum(x1).^2))
    b1=(sum(x1)*sum(y1.*x1)-sum((x1).^2)*sum(y1))/((sum(x1)).^2-n*(sum(x1.^2)));
    b1=exp(b1)
    
    y1=b1*exp(a1*x);

    %ii. E2
    E2=sqrt(sum((b1*exp(a1*x)-y).^2)/n)
    
    %iii. plot
    plot(x_11,b1*exp(a1*x_11),'b')
    title('nonlinear exponential regression');  
    xlabel('Age(month)');  
    ylabel('Height(cm)');

%4. plot the result of applying nonlinear regression with E2 and f(x)=alnx+b
    %i. f(x)= a2*log(x)+b2 
    x2=log(x);
    y2=y;
    
    a2=(n*sum(x2.*y2)-sum(x2)*sum(y2))/(n*sum((x2).^2)-(sum(x2).^2))
    b2=(sum(x2)*sum(y2.*x2)-sum((x2).^2)*sum(y2))/((sum(x2)).^2-n*(sum(x2.^2)))
    
    y2=a2*log(x)+b2;

    %ii. E2
    E2=sqrt(sum((a2*log(x)+b2-y).^2)/n)
    
    %iii. plot
    plot(x_11,a2*log(x_11)+b2,'g')
    title('nonlinear log regression');  
    xlabel('Age(month)');  
    ylabel('Height(cm)');
    
%5. Correlation coefficients
avg_y=sum(y)/n;

y_a=a*x+b;
CorrelationCoefficients1=sqrt((sum((y-avg_y).^2)-sum((y_a-y).^2))/sum((y-avg_y).^2))

y_a=b1*exp(a1*x);
CorrelationCoefficients2=sqrt((sum((y-avg_y).^2)-sum((y_a-y).^2))/sum((y-avg_y).^2))

y_a=a2*log(x)+b2;
CorrelationCoefficients3=sqrt((sum((y-avg_y).^2)-sum((y_a-y).^2))/sum((y-avg_y).^2))


