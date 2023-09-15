10 KEY OFF:DEF SEG=0:DEFINT A-Z:POKE 1047,PEEK(1047) OR 64:RANDOMIZE TIMER       
20 SCREEN 1,0:COLOR 1,0:WIDTH 40:CLS                   
30 DIM U(4,5),L(4,5),J(4,5),BX(4,5),BY(4,5),N(1,5),ER(256),RT(30),TR(30),TX(30),TY(30),BR(22),BG(22)       
40 GOSUB 1170                
50 FOR I=1 TO 3:FOR J=1 TO 4:J(I,J)=4:NEXT:J(I,0)=3:J(I,5)=3:NEXT                
60 RESTORE 70:FOR J=1 TO 4:J(0,J)=3:J(4,J)=3:READ A,B:J(A,B)=2:NEXT              
70 DATA 0,0,0,5,4,0,4,5      
80 RESTORE 100:FOR I=1 TO 4:FOR J=1 TO I:READ BX(I,J),BY(I,J):NEXT J,I           
90 BX(4,5)=BX(4,4):BY(4,5)=BY(4,4)                     
100 DATA 13,9,6,9,20,9,13,5,4,15,22,15,13,3,13,17,4,9,22,9                     
110 LOCATE 8,14:PRINT "CHAIN REACTION"                
120 LOCATE 12,9:PRINT "Number of players (1/2)?";     
130 K$=INKEY$:IF K$<>"1" AND K$<>"2" THEN 130         
140 NP=VAL(K$):IF NP=2 THEN 180                       
150 LOCATE 16,10:PRINT "Computer first (Y/N)?";       
160 K$=INKEY$:IF K$<>"Y" AND K$<>"N" THEN 160         
170 TU=ABS(K$="Y")           
180 CLS:LOCATE 1,14:PRINT "CHAIN REACTION";:GOSUB 670 
190 TU=-TU+1:CO=TU+1         
200 IF NP=1 AND TU=0 THEN GOSUB 900:GOTO 230          
210 GOSUB 360                
220 IF L(Y,X)<>TU+1 AND L(Y,X) THEN 210               
230 U(Y,X)=U(Y,X)+1:FS(TU)=FS(TU)+1:IF L(Y,X)=0 THEN L(Y,X)=CO                 
240 GOSUB 820                
250 IF U(Y,X)=J(Y,X) THEN 270
260 GOTO 190                 
270 E=0:FG=0:FOR P=0 TO 4:FOR Q=0 TO 5:Y=P:X=Q        
280 IF U(Y,X)>=J(Y,X) AND E=0 THEN FG=1:GOSUB 450     
290 NEXT Q,P:IF E=1 THEN 320 
300 IF FG=1 THEN 270         
310 GOTO 190                 
320 LOCATE 24,16:PRINT "GAME OVER";:FOR I=1 TO 5000:NEXT                       
330 LOCATE 24,6:PRINT "Press space bar to play again."
340 K$=INKEY$:IF K$<>" " THEN 340                     
350 RUN                      
360 X=HX(CO):Y=HY(CO):GOSUB 780:WHILE INKEY$<>"":WEND 
370 DX=0:DY=0:K$=RIGHT$(INKEY$,1):IF K$="" THEN 370   
380 K=ASC(K$):IF K=32 THEN HX(CO)=X:HY(CO)=Y:CO=0:GOSUB 780:CO=TU+I:RETURN     
390 IF K=72 THEN IF Y>0 THEN DY=-1                    
400 IF K=80 THEN IF Y<4 THEN DY=1                     
410 IF K=75 THEN IF X>0 THEN DX=-1                    
420 IF K=77 THEN IF X<5 THEN DX=1                     
430 IF DX=0 AND DY=0 THEN 370
440 CO=0:GOSUB 780:X=X+DX:Y=Y+DY:CO=TU+1:GOSUB 780:GOTO 370                    
450 R=0:YY=32*Y+15:XX=36*X+50:FOR I=1 TO 4            
460 PUT(XX+2,YY+2),ER,PSET   
470 FOR J=1 TO 4:N(1,J)=INT(RND(1)*3)-1:NEXT:R=-R+1:K=U(Y,X)+1:IF K=6 THEN K=5 
480 IF CO=1 THEN ON K GOSUB 730,740,750,760,770,770   
490 IF CO=2 THEN ON K GOSUB 850,860,870,880,890,890   
500 FOR J=1 TO 25:SOUND 37,1:NEXT:SOUND 37,0:NEXT     
510 TX=X:TY=Y:J1=0:K1=K-1:Yl=32*Y+15+BY(1,1):X1=36*X+50+BX(1,1)                
520 IF TX>0 THEN X=TX-1:DX=-1:DY=0:GOSUB 1270:GOSUB 590                        
530 IF TX<5 THEN X=TX+1:DX=1:DY=0:GOSUB 1270:GOSUB 590
540 X=TX:IF TY>0 THEN Y=TY-1:DY=-1:DX=0:GOSUB 1270:GOSUB 590                   
550 IF TY<4 THEN Y=TY+1: DY=1:DX=0:GOSUB 1270:GOSUB 590
560 IF FS(0)<l OR FS(1)<l THEN E=1                    
570 Y=TY:U(Y,X)=U(Y,X)-J(Y,X):GOSUB 820:IF U(Y,X)=0 THEN L(Y,X)=0              
580 RETURN                   
590 IF L(Y,X)<>TU+1 THEN FS(TU)=FS(TU)+U(Y,X):FS(-TU+1=FS(-TU+1)-U(Y,X)        
600 L(Y,X)=TU+1:U(Y,X)=U(Y,X)+1:GOSUB 820:RETURN      
610 LP=0:IF Y>0 THEN IF L(Y-1,X)=2 THEN AY=Y-1:GOTO 660                        
620 IF X>0 THEN IF L(Y,X-1)=2THEN AX=X-1:GOTO 660     
630 IF X<5 THEN IF L(Y,X+1)=2 THEN AX=X+1:GOTO 660    
640 IF Y<4 THEN IF L(Y+1,X)=2 THEN AY=Y+1:GOTO 660    
650 RETURN                   
660 LP=1:REFURN              
670 FOR Y=0 TO 4:YY=32*Y+16:FOR X=0 TO 5:XX=36*X+51   
680 DRAW "BM=XX;,=YY;R34D30L34U30"                    
690 NEXT X,Y:GET(XX+1,YY+1)-(XX+33,YY+29),ER          
700 RETURN                   
710 PUT(XX+2,YY+2),ER,PSET:K=U(Y,X)+1:IF K=6 THEN K=5 
720 ON K GOTO 730,740,750,760,770,770                 
730 RETURN                   
740 PUT(XX+BX(1,K-1),YY+BY(1,K-1)),BG:RETURN          
750 FOR J=1 TO K-1:PUT(XX+BX(2,J)+N(R,J),YY+BY(2,J)+N(R,J)),BG:NEXT:RETURN     
760 FOR J=1 TO K-1:PUT(XX+BX(3,J)+N(R,J),YY+BY(3,J)+N(R,J)),BG:NEXT:RETURN     
770 FOR J=1 TO K-1:PUT(XX+BX(4,J)+N(R,J),YY+BY(4,J)+N(R,J)),BG:NEXT:RETURN     
780 YY=32*Y+15:XX=36*X+50    
790 DRAW "C=CO;BM=XX;,=YY;R36D32L36U32"               
800 DRAW "C=CO;BM+2,+2R32D2BL32U28"                   
810 RETURN                   
820 YY=32*Y+15:XX=36*X+50:R=0:IF CO=1 THEN 710        
830 PUT(XX+2,YY+2),ER,PSET:K=U(Y,X)+1:IF K=6 THEN K=5 
840 ON K GOTO 850,860,870,880,890,890                 
850 RETURN                   
860 PUT(XX+BX(l,K-1),YY+BY(1,K-1)),BR:RETURN          
870 FOR J=1 TO K-1:PUT(XX+BX(2,J)+N(R,J),YY+BY(2,J)+N(R,J)),BR:NEXT:RETURN     
880 FOR J=1 TO K-1:PUT(XX+BX 3,J)+N(R,J),YY+BY(3,J)+N(R,J)),BR:NEXT:RETURN     
890 FOR J=1 TO H:-1:PUT(XX+BX(4,J)+N(R,J),YY+BY(4,J)+N(R,J)),BR:NEXT:RETURN     
900 XT=0:FOR Y=0 TO 4:FOR X=0 TO 5:IF L(Y,X)=2 THEN 920                        
910 XT=XT+1:TY(XT)=Y:TX(XT)=X
920 NEXT X, Y                
930 LOCATE 23,15:PRINT "Thinking...";                 
940 FOR I=1 TO XT:RT(I)=0:TR(I)=0:Y=TY(I):X=TX(I):GOSUB 610                    
950 IF FG=1 AND LP AND U(Y,X)>0 THEN 1160             
960 IF U(Y,X)+1<>J(Y,X) THEN 1000                     
970 IF LP=1 AND U(AY,AX)+1=J(AY,AX) THEN RT(I)=6:GOTO 1110                     
980 IF LP=1 THEN RT(I)=2:GOTO 1110                    
990 IF LP=0 THEN RT(I)=1:GOTO 1110                    
1000 IF J(Y,X)<>2 THEN 1040  
1010 IF LP=0 AND U(Y,X)=1 THEN RT(I)=1:GOTO 1110     
1020 IF LP=0 AND U(Y,X)=0 THEN RT(I)=4:GOTO 1110     
1030 IF LP=1 AND U(Y,X)=1 THEN RT(I)=4:GOTO 1110     
1040 IF U(AY,AX)+1=J(AY,AX) THEN RT(I)=1:GOTO 1110   
1050 IF U(Y,X)+2<J(Y,X) THEN 1090                    
1060 IF LP=1 AND U(AY,AX)+1<J(AY,AX) THEN RT(I)=5:GOTO 1110                  
1070 IF LP=0 THEN RT(I)=3:GOTO 1110                  
1080 RT(I)=2:GOTO 1110       
1090 IF LP=0 THEN RT(I)=2:GOTO 1110                  
1100 RT(I)=1                 
1110 NEXT:ZT=0:AB=6          
1120 FOR I=1 TO XT:IF RT(I)=AB THEN ZT=ZT+1:TR(ZT)=I 
1130 NEXT:IF ZT>0 THEN 1150  
1140 AB=AB-1:GOTO 1120       
1150 DH=INT(ZT*RND(1))+1:HD=TR(DH):Y=TY(HD):X=TX(HD) 
1160 LOCATE 23,15:PRINT "           ";:FG=FG+1:RETURN
1170 RESTORE 1210            
1180 READ BR(0),BR(1):FOR I=2 TO 22:READ A$:BR(I)=VAL("&H"+A$):NEXT          
1190 READ BG(0),BG(1):FOR I=2 TO 22:READ A$:BG(I)=VAL("&H"+A$):NEXT          
1200 RETURN                  
1210 DATA 22,13,F00,0,30,3000,200,AA                 
1220 DATA AA02,A00,80AA,2028,AAA0,AB22,8AAA,AAA8     
1230 DATA AB22,2028,AA0,80AA,AA02,0,0                
1240 DATA 22,13,F00,0,30,3000,100,55                 
1250 DATA 5501,500,4055,1014,5550,5411,4555,5554     
1260 DATA 5411,1014,550,4055,5501,0,0                
1270 J1=JI+1:XX=X1-BX(1,1):YY=Yl-BY(1,1):S=1087:IF CO=1 THEN 1360            
1280 PUT(XX+BX(K1,Jl)+N(R,J1),YY+BY(K1,J1)+N(R,J1)),BR                       
1290 IF DY<>0 THEN 1330      
1300 X2=X1+35*DX:DX=DX*4:PUT(X1,Y1),BR               
1310 FOR I=X1 TO X2 STEP DX:S=S-40:SOUND S,1:PUT(I,Y1),BR:PUT(I+DX,Y1),BR:NEXT                       
1320 PUT(XX+3,YY+3),ER:RETURN
1330 Y2=Y1+31*DY:DY=DY*4:PUT(X1,Y1),BR               
1340 FOR I=Y1 TO Y2 STEP DY:S=S-40:SOUND S,1:PUT(X1,I),BR:PUT(X1,I+DY),BR:NEXT                       
1350 PUT(XX+3,YY+3),ER:RETURN
1360 PUT(XX+BX(K1,J1)+N(R,J1),YY+BY(K1,J1)+N(R,J1)),BG                       
1370 IF DY<>0 THEN 1410      
1380 X2=X1+35*DX:DX=DX*4:PUT(X1,Y1),BG               
1390 FOR I=X1 TO X2 STEP DX:S=S-40:SOUND S,1:PUT(I,Y1),BG:PUT(I+DX,Y1),BG:NEXT                       
1400 PUT(XX+3,YY+3),ER:RETURN
1410 Y2=Y1+31*DY:DY=DY*4:PUT(X1,Y1),BG               
1420 FOR I=Y1 TO Y2 STEP DY:S=S-40:SOUND S,1:PUT(X1,I),BG:PUT(X1,I+DY),BG:NEXT                       
1430 PUT(XX+3,YY+3),ER:RETURN
