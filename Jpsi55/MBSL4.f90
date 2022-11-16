
	FUNCTION MBSL4(N,X)
	DOUBLE PRECISION MBSL4,X,MBSL3
	DOUBLE PRECISION Y,P,B0,B1,A(7),B(7),C(7),D(7)
	DATA A/-0.57721566,0.4227842,0.23069756,0.0348859,&
              0.00262698,0.0001075,0.0000074/
	DATA B/1.0,0.15443144,-0.67278579,-0.18156897,&
              -0.01919402,-0.00110404,-0.00004686/
	DATA C/1.25331414,-0.07832358,0.02189568,-0.01062446,&
              0.00587872,-0.0025154,0.00053208/
	DATA D/1.25331414,0.23498619,-0.0365562,0.01504268,&
              -0.00780353,0.00325614,-0.00068245/
	IF (N.LT.0) N=-N
	IF (X.LT.0.0) X=-X
	IF (X+1.0.EQ.1.0) THEN
	  MBSL4=1.0D+35
	  RETURN
	END IF
	IF (N.NE.1) THEN
	  IF (X.LE.2.0) THEN
	    Y=X*X/4.0
	    P=A(7)
	    DO 10 I=6,1,-1
10	    P=P*Y+A(I)
	    P=P-MBSL3(0,X)*LOG(X/2.0)
	  ELSE
	    Y=2.0/X
	    P=C(7)
	    DO 20 I=6,1,-1
20	    P=P*Y+C(I)
	    P=P*EXP(-X)/SQRT(X)
	  END IF
	END IF
	IF (N.EQ.0) THEN
	  MBSL4=P
	  RETURN
	END IF
	B0=P
	IF (X.LE.2.0) THEN
	  Y=X*X/4.0
	  P=B(7)
	  DO 30 I=6,1,-1
30	  P=P*Y+B(I)
	  P=P/X+MBSL3(1,X)*LOG(X/2.0)
	ELSE
	  Y=2.0/X
	  P=D(7)
	  DO 40 I=6,1,-1
40	  P=P*Y+D(I)
	  P=P*EXP(-X)/SQRT(X)
	END IF
	IF (N.EQ.1) THEN
	  MBSL4=P
	  RETURN
	END IF
	B1=P
	Y=2.0/X
	DO 50 I=1,N-1
	  P=B0+I*Y*B1
	  B0=B1
	  B1=P
50	CONTINUE
	MBSL4=P
	RETURN
	END