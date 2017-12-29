I=imread ('d2.jpg');
figure(1),subplot(4,3,1),imshow(I);title('The original License'); 

Ig=rgb2gray(I);
figure(1),subplot(4,3,2),imshow(Ig);title('grey image');

[d,c]=size(Ig);% row:d , column:c
Ig=imcrop(Ig,[0.15*c 0.2*d 0.7*c 0.8*d]); % no change 0.15*c 0.2*d 0.7*c 0.8*d
figure(1),subplot(4,3,3),imshow(Ig);title('delete frame');

Ie=edge(Ig,'canny'); % ±ßÔµ¼ì²â
figure(1),subplot(4,3,4);imshow(Ie);title('edege');

SE1=ones(2,1); % (2,1) no change
Ie=imerode(Ie,SE1);
figure(1),subplot(4,3,5),imshow(Ie);title('erosion');

Ie=bwareaopen(Ie,7);
figure(1),subplot(4,3,6),imshow(Ie);title('erase small points');

SE2=ones(30,30); 
Ic=imclose(Ie,SE2);
figure(1),subplot(4,3,7),imshow(Ic);title('close'); 

Ic=bwareaopen(Ic,2000);
figure(1),subplot(4,3,8),imshow(Ic);title('erase small areas');

SE3=ones(15,15);
Ic=imopen(Ic,SE3);
figure(1),subplot(4,3,9),imshow(Ic);title('open');

Ic=imclearborder(Ic,8);
Ic=bwareaopen(Ic,4550); % 4550 not change

SE4=ones(90,90);
Ic=imclose(Ic,SE4);
SE5=ones(30,30);
Ic=imopen(Ic,SE5);
figure(1),subplot(4,3,10),imshow(Ic);title('second close & open');

SE5=ones(18,15);
Ic=imdilate(Ic,SE5);
figure(1),subplot(4,3,11),imshow(Ic);title('second dilation');

[y,x]=size(Ic);
g=y;h=1;e=x;f=1;

for i=1:y
    for j=1:x
        if (Ic(i,j)==1)
            a=i;
            if (a<g)g=a; end;  %min up
            if (a>h)h=a; end;  %min down
            b=j;
            if (b<e)e=b; end;  %min left
            if (b>f)f=b; end;  %min right
        end
    end
end

Ig=Ig(g:h,fix(1.25*e):fix(0.95*f));
figure(1),subplot(4,3,12),imshow(Ig);title('position');
imwrite(Ig,'plate.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 