Ig=imread ('plate.jpg'); 
figure(1),subplot(4,2,1),imshow(Ig);title('The original License'); 

[d,c]=size(Ig);% row:d , column:c
Ig=imcrop(Ig,[c/40 d/7 153*c/160 5.4*d/7]); % no change
figure(1),subplot(4,2,2),imshow(Ig);title('delete frame');

Ig=im2bw(Ig,0.75); 
figure(1),subplot(4,2,3),imshow(Ig);title('binaryzation');

SE1=ones(1,1); % (1,1) no change
Ig=imerode(Ig,SE1);
figure(1),subplot(4,2,4),imshow(Ig);title('erosion');

Ig=bwareaopen(Ig,10);
figure(1),subplot(4,2,5),imshow(Ig);title('erase small points');

Ig=bwmorph(Ig,'clean' ,inf);  % remove isolate bright spots

SE2=ones(2,2); % (2,2) no change
Ig=imdilate(Ig,SE2);
figure(1),subplot(4,2,6),imshow(Ig);title('dilation');

Ig=~Ig;
figure(1),subplot(4,2,7),imshow(Ig);title('reverse'); 

[y,x]=size(Ig);% row:y , column:x
h=sum(Ig); % h means histogram

for q=1:x-1
 if((h(1,q)==y)&&(h(1,q+1)<y))
    A=q+1;
    for q=A+2:x-1 % avoid character devide
     if(h(1,q+1)==y)
     B=q;
     c=B-A+1;% set the length
     break
     end
    end
 end
end

i=1;
for k=1:x-1
 if((h(1,k)==y)&&(h(1,k+1)<y))
    a=k+1;
    for k=a+2:x-1
     if(h(1,k+1)==y)b=k;
      if(sum(Ig(1:y,a:b)/(b-a))<6.5)  % to remove the largest isolate point  6.5 no change
        figure(2),subplot(1,8,i),
        J=Ig(1:y,fix((b+a-c)/2):fix((b+a+c)/2));
        switch i
             case 1
                 imwrite(J,'c1.jpg');
                 %c1=J;
             case 2
                 imwrite(J,'c2.jpg');
                 %c2=J;
             case 3
                 imwrite(J,'c3.jpg');
                 %c3=J;
             case 4
                 imwrite(J,'c4.jpg');
                 %c4=J;
             case 5
                 imwrite(J,'c5.jpg');
                 %c5=J;
             case 6
                 imwrite(J,'c6.jpg');
                 %c6=J;
             case 7
                 imwrite(J,'c7.jpg');
                 %c7=J;
             case 8
                 imwrite(J,'c8.jpg');
                 %c8=J;
         end
        imshow(J),i=i+1;  
      end
     break
     end
    end
 end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 