c1 =im2bw(imread('c1.jpg'));
c2 =im2bw(imread('c2.jpg'));
c3 =im2bw(imread('c3.jpg'));
c4 =im2bw(imread('c4.jpg'));
c5 =im2bw(imread('c5.jpg'));
c6 =im2bw(imread('c6.jpg'));
c7 =im2bw(imread('c7.jpg'));

licensecode = char(['0':'9' 'A':'H' 'J':'N' 'P':'Z' '½ò»¦Óå¼½½úÁÉ¼ªºÚËÕÕãÍîÃö¸ÓÂ³Ô¥¶õÏæÔÁÇí´¨¹ðÔÆÉÂ¸ÊÇà²Ø¹óÃÉÐÂÄþ¸Û¾©°ÄÁìÊ¹¾¯']);

% sample is 16*32

ADD1=imresize(c1,[64 32],'nearest');
t=0;
for m=35:70
  fname = strcat('sample/',num2str(m),'.jpg');
  ADD2 = im2bw(imread(fname)); 
  ADD2 = imresize(ADD2,[64 32],'nearest'); 
    for i=1:64
       for j=1:32
         ADD(i,j)= xor(ADD1(i,j),ADD2(i,j));
       end
    end
  P(1,m)=sum(sum(ADD));
      if(P(1,m)>t) 
          t=P(1,m);
          k(1,1)=m;
      end
end

ADD1=imresize(c2,[64 32],'nearest');
t=0;
for m=1:34
  fname = strcat('sample/',num2str(m),'.jpg');
  ADD2 = im2bw(imread(fname)); 
  ADD2 = imresize(ADD2,[64 32],'nearest'); 
    for i=1:64
       for j=1:32
         ADD(i,j)= xor(ADD1(i,j),ADD2(i,j));
       end
    end
  P(1,m)=sum(sum(ADD));
      if(P(1,m)>t) 
          t=P(1,m);
          k(1,2)=m;
      end
end

ADD1=imresize(c3,[64 32],'nearest');
t=0;
for m=1:34
  fname = strcat('sample/',num2str(m),'.jpg');
  ADD2 = im2bw(imread(fname)); 
  ADD2 = imresize(ADD2,[64 32],'nearest'); 
    for i=1:64
       for j=1:32
         ADD(i,j)= xor(ADD1(i,j),ADD2(i,j));
       end
    end
  P(1,m)=sum(sum(ADD));
      if(P(1,m)>t) 
          t=P(1,m);
          k(1,3)=m;
      end
end

ADD1=imresize(c4,[64 32],'nearest');
t=0;
for m=1:10
  fname = strcat('sample/',num2str(m),'.jpg');
  ADD2 = im2bw(imread(fname)); 
  ADD2 = imresize(ADD2,[64 32],'nearest'); 
    for i=1:64
       for j=1:32
         ADD(i,j)= xor(ADD1(i,j),ADD2(i,j));
       end
    end
  P(1,m)=sum(sum(ADD));
      if(P(1,m)>t) 
          t=P(1,m);
          k(1,4)=m;
      end
end

ADD1=imresize(c5,[64 32],'nearest');
t=0;
for m=1:10
  fname = strcat('sample/',num2str(m),'.jpg');
  ADD2 = im2bw(imread(fname)); 
  ADD2 = imresize(ADD2,[64 32],'nearest'); 
    for i=1:64
       for j=1:32
         ADD(i,j)= xor(ADD1(i,j),ADD2(i,j));
       end
    end
  P(1,m)=sum(sum(ADD));
      if(P(1,m)>t) 
          t=P(1,m);
          k(1,5)=m;
      end
end

ADD1=imresize(c6,[64 32],'nearest');
t=0;
for m=1:10
  fname = strcat('sample/',num2str(m),'.jpg');
  ADD2 = im2bw(imread(fname)); 
  ADD2 = imresize(ADD2,[64 32],'nearest'); 
    for i=1:64
       for j=1:32
         ADD(i,j)= xor(ADD1(i,j),ADD2(i,j));
       end
    end
  P(1,m)=sum(sum(ADD));
      if(P(1,m)>t) 
          t=P(1,m);
          k(1,6)=m;
      end
end

ADD1=imresize(c7,[64 32],'nearest');
t=0;
 for m=1:70
  fname = strcat('sample/',num2str(m),'.jpg');
  ADD2 = im2bw(imread(fname)); 
  ADD2 = imresize(ADD2,[64 32],'nearest'); 
    for i=1:64
       for j=1:32
         ADD(i,j)= xor(ADD1(i,j),ADD2(i,j));
       end
    end
  P(1,m)=sum(sum(ADD));
      if(P(1,m)>t) 
          t=P(1,m);
          k(1,7)=m;
      end
end

for i=1:7
RESULT(1,i)=licensecode(k(1,i)) ;
end

RESULT