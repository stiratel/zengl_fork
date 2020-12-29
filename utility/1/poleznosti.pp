{
����� ��������騩 �������騥 � rtl FPC ��楤��� � �㭪樨.
��� ⠬ �㭪権 ��� ������� �� 0 ��������, �� ������� �� �������.
���� - ��������� ����.
2014 ���.
}


{$GOTO ON}
{$mode fpc}
{$H-}
{$R+}

//����஢�� ��室���� - IBM 866

UNIT poleznosti;

interface

CONST
VINDOFAILOBAG=4294967295;
ZNACIMYE_STROKI: INT64=0;
ISPOLJZOVANNYE_STROKI: INT64=0;
LAZA_CTENIJA: BYTE=0;


TYPE
MASSIV_3 = ARRAY OF BYTE;
M_3_64 = ARRAY[1..3] OF INT64;
STRING3 = {SHORT}STRING[3];


FUNCTION GetTime_sek: INT64; //�������� ����� � ��������
FUNCTION GetTime_msek: INT64;//����� � ������������� �� ������ ��� ����� - � �������
FUNCTION F_STR(Q64: INT64): STRING;//�������������� ����� � ������
FUNCTION F_VAL(Q5: STRING): INT64;//�������������� ������ � �����, ��� ������������� � Z_L_2 ������ ������� ����� ������� � Q364[3]
FUNCTION F_STR_V(Q1: EXTENDED): STRING;//�������������� ������������� ����� � ������
FUNCTION F_VAL_V(Q5: STRING): EXTENDED;//�������������� ������ � ������������ �����
FUNCTION BOLATRUI(Q5: STRING): BOOLEAN;
FUNCTION TRUEBOL(BB: BOOLEAN): STRING;
FUNCTION CISLOBOL(Q2: LONGINT): BOOLEAN; //Q2<1=FALSE, ����� TRUE
FUNCTION F_LENGTH(VAR S5:ANSISTRING;VAR Q64:INT64): INT64;//���������� ����� ������, ��������� �� �� 1 � �������� ����� ����� � ���������� Q64, ��������� ��� ��������� ���������� ����������
FUNCTION Z_LENGTH(VAR S5:ANSISTRING;ZZ64:INT64;VAR Q364:M_3_64): INT64;//���������� ����� ������, ��������� �� �� 1 � �������� ����� ����� � ���������� Q364[1],ZZ64-->Q364[3],��������� ��� ��������� ���������� ����������
FUNCTION F_L_2(VAR S5:ANSISTRING;VAR Q64,W64:INT64): INT64;//���������� ����� ������, ��������� �� �� 1 � �������� ����� ����� � ���������� Q64 � � W64 �������,ZZ64-->Z64,��������� ��� ��������� ���������� ����������
FUNCTION Z_L_2(VAR S5:ANSISTRING;ZZ64:INT64;VAR Q364:M_3_64): INT64;//������� ������� F_L_2 � ���������� ��������������, ��������� ��� ��������� ���������� ����������
PROCEDURE K_STROKI(VAR S5: ANSISTRING);//��������� ��� ��������� ���������� ����������
FUNCTION F_VAL_2(Q5: ANSISTRING; Q64: INT64;VAR W64: INT64): INT64;//�������������� ����� ������ �� ������� ������� � �����, ��� ������������� � Z_L_2 ������ ������� ����� ������ � Q364[3]
FUNCTION Z_VAL_2(Q5: ANSISTRING; VAR Q364:M_3_64): INT64;//�������������� ����� ������ �� ������� ������� � �����, ��� ������������� � Z_L_2 ������ ������� ����� ������ � Q364[3]
FUNCTION F_VAL_2V(Q5: ANSISTRING; Q64: INT64;VAR W64: INT64): EXTENDED;//�������������� ����� �� ������� ������� ������ � ������������ �����, ��� ������������� � Z_L_2 ������ ������� ����� ������ � Q364[3]
FUNCTION Z_VAL_2V(Q5: ANSISTRING; VAR Q364:M_3_64): EXTENDED;//�������������� ����� ������ �� ������� ������� � ������������ �����, ��� ������������� � Z_L_2 ������ ������� ����� ������ � Q364[3]
FUNCTION STROBUTYLJNIK(Q5: ANSISTRING): ANSISTRING;//������� � ����� ������ ������ '
FUNCTION PUTJ_k_kornju(W3: BYTE): ansistring;
FUNCTION OSIBKA_FINDFIRST(Q64: INT64): BOOLEAN; //��������� ���������� � �������� ���� ������ ������� SYSUTILS.FINDFIRST, ���� - ������ ����, ������ - ������ ���
FUNCTION IN_1(PROVERJAEMOE_CISLO64,Q64: INT64): BOOLEAN;//�������� ��������� ��������� � ������ �����
FUNCTION IN_2(PROVERJAEMOE_CISLO64,Q64,W64: INT64): BOOLEAN;//�������� ��������� ��������� � ���� �����
FUNCTION IN_3(PROVERJAEMOE_CISLO64,Q64,W64,E64: INT64): BOOLEAN;//�������� ��������� ��������� � ��� �����
FUNCTION IN_4(PROVERJAEMOE_CISLO64,Q64,W64,E64,R64: INT64): BOOLEAN;//�������� ��������� ��������� � ������ �����
FUNCTION IN_5(PROVERJAEMOE_CISLO64,Q64,W64,E64,R64,T64: INT64): BOOLEAN;//�������� ��������� ��������� � ���� �����
FUNCTION IN_6(PROVERJAEMOE_CISLO64,Q64,W64,E64,R64,T64,Y64: INT64): BOOLEAN;//�������� ��������� ��������� � ����� �����
FUNCTION IN_7(PROVERJAEMOE_CISLO64,Q64,W64,E64,R64,T64,Y64,U64: INT64): BOOLEAN;//�������� ��������� ��������� � ���� �����
FUNCTION IN_8(PROVERJAEMOE_CISLO64,Q64,W64,E64,R64,T64,Y64,U64,I64: INT64): BOOLEAN;//�������� ��������� ��������� � ������ �����
FUNCTION IN_9(PROVERJAEMOE_CISLO64,Q64,W64,E64,R64,T64,Y64,U64,I64,O64: INT64): BOOLEAN;//�������� ��������� ��������� � ������ �����
FUNCTION IN_10(PROVERJAEMOE_CISLO64,Q64,W64,E64,R64,T64,Y64,U64,I64,O64,P64: INT64): BOOLEAN;//�������� ��������� ��������� � ������ �����
FUNCTION IN_11(PROVERJAEMOE_CISLO64,Q64,W64,E64,R64,T64,Y64,U64,I64,O64,P64,A64: INT64): BOOLEAN;//�������� ��������� ��������� � ����������� �����
FUNCTION IN_12(PROVERJAEMOE_CISLO64,Q64,W64,E64,R64,T64,Y64,U64,I64,O64,P64,A64,S64: INT64): BOOLEAN;//�������� ��������� ��������� � ���������� �����
FUNCTION IN_1D(PROVERJAEMOE_CISLO64,A1_64,B1_64: INT64): BOOLEAN;//�������� ��������� ��������� ��������� �����
FUNCTION IN_2D(PROVERJAEMOE_CISLO64,A1_64,B1_64,A2_64,B2_64: INT64): BOOLEAN;//�������� ��������� ��������� � ���� ���������� �����
FUNCTION IN_3D(PROVERJAEMOE_CISLO64,A1_64,B1_64,A2_64,B2_64,A3_64,B3_64: INT64): BOOLEAN;//�������� ��������� ��������� � ��� ���������� �����
FUNCTION IN_4D(PROVERJAEMOE_CISLO64,A1_64,B1_64,A2_64,B2_64,A3_64,B3_64,A4_64,B4_64: INT64): BOOLEAN;//�������� ��������� ��������� � ������ ���������� �����
FUNCTION IN_5D(PROVERJAEMOE_CISLO64,A1_64,B1_64,A2_64,B2_64,A3_64,B3_64,A4_64,B4_64,A5_64,B5_64: INT64): BOOLEAN;//�������� ��������� ��������� � ���� ���������� �����
FUNCTION ANSY_TO_BYTE(S5: ANSISTRING): MASSIV_3;
FUNCTION CITALNIK(IMJA_FAILA_SOHRANKI5: ANSISTRING;VAR S5: ARRAY OF STRING; VAR Z5: ARRAY OF ANSISTRING;LIMIT: LONGINT): BOOLEAN;
FUNCTION CP866_TO_UTF8(S5: ANSISTRING):ANSISTRING;  //��������������
    //������ � CP866 ��������� � ������ UTF8, � ����� �� ������ ���� ��� � �� �����
FUNCTION CP866_V_UTF8(S5: ANSISTRING):ANSISTRING;  //��������������
   //������ � CP866 ��������� � ������ UTF8 ��������� ������
FUNCTION CP866__UTF8(XZFC: BYTE): STRING;//�������������� ������� CP866 � ������ UTF8
FUNCTION PUTI_MAZDAJA(S5: ANSISTRING): ANSISTRING; //������ / �� \ � ������ ���� �������� ������ � ������
 

implementation

USES
{$IFDEF LINUX}
UNIX, BASEUNIX,
{$ENDIF LINUX}
SYSUTILS;

CONST

LIMON10={1000000}0; //0 = ��� ������ �� ����� �������������� ������
MASSIV_IBM866_TO_UTF8: ARRAY[128..255] OF STRING3 =(
#208#144,#208#145,#208#146,#208#147,#208#148,#208#149,#208#150,#208#151,#208#152,#208#153,
#208#154,#208#155,#208#156,#208#157,#208#158,#208#159,#208#160,#208#161,#208#162,#208#163,
#208#164,#208#165,#208#166,#208#167,#208#168,#208#169,#208#170,#208#171,#208#172,#208#173,
#208#174,#208#175,#208#176,#208#177,#208#178,#208#179,#208#180,#208#181,#208#182,#208#183,
#208#184,#208#185,#208#186,#208#187,#208#188,#208#189,#208#190,#208#191,#226#150#145,
#226#150#146,#226#150#147,#226#148#130,#226#148#164,#226#149#161,#226#149#162,#226#149#150,
#226#149#149,#226#149#163,#226#149#145,#226#149#151,#226#149#157,#226#149#156,#226#149#155,
#226#148#144,#226#148#148,#226#148#180,#226#148#172,#226#148#156,#226#148#128,#226#148#188,
#226#149#158,#226#149#159,#226#149#154,#226#149#148,#226#149#169,#226#149#166,#226#149#160,
#226#149#144,#226#149#172,#226#149#167,#226#149#168,#226#149#164,#226#149#165,#226#149#153,
#226#149#152,#226#149#146,#226#149#147,#226#149#171,#226#149#170,#226#148#152,#226#148#140,
#226#150#136,#226#150#132,#226#150#140,#226#150#144,#226#150#128,#209#128,#209#129,#209#130,
#209#131,#209#132,#209#133,#209#134,#209#135,#209#136,#209#137,#209#138,#209#139,#209#140,
#209#141,#209#142,#209#143,#208#129,#209#145,#208#132,#209#148,#208#135,#209#151,#208#142,
#209#158,#194#176,#226#136#153,#194#183#153,#226#136#154,#226#132#150,#194#164#150,
#226#150#160,#194#160);

FUNCTION GetTime_sek: INT64;
VAR
KUKU_KUKU: TSystemTime;
BEGIN
{
TSystemTime = record
 Day: Word;
 Hour: Word;
 Milliseconds: Word;
 Minute: Word;
 Month: Word;
 Second: Word;
 Year: Word;
 end;
}
SYSUTILS.GetLocalTime(KUKU_KUKU);
GetTime_sek:=KUKU_KUKU.Hour*3600+KUKU_KUKU.Minute*60+KUKU_KUKU.Second;
END;


FUNCTION GetTime_msek: INT64;
VAR
{$IFDEF LINUX} tz: timeval;{$ENDIF LINUX}
{$IFNDEF LINUX}tz: TSystemTime;{$ENDIF}
BEGIN
{$IFDEF LINUX}
fpgettimeofday(@tz, nil);
GetTime_msek:=tz.tv_sec*1000+tz.tv_usec div 1000;
{$ENDIF LINUX}
{$IFNDEF LINUX}
GetLocalTime(tz);
GetTime_msek:=tz.wHour*3600000+tz.wMinute*60000+tz.wSecond*1000+tz.wMilliSeconds;
{$ENDIF}
END;


FUNCTION F_STR(Q64: INT64): STRING;//�������������� ����� � ������
VAR
S5: STRING;
BEGIN
IF Q64>=0 THEN STR(Q64,F_STR) ELSE BEGIN
                                   Q64:=ABS(Q64);
                                   STR(Q64,S5);
                                   F_STR:='-'+S5;
                                   END;
END;


FUNCTION F_STR_V(Q1: EXTENDED): STRING;//�������������� ������������� ����� � ������
VAR
S5: STRING;
Q64: INT64;
Q3: BYTE;
BEGIN
S5:='';
IF Q1<0 THEN BEGIN
             S5:='-';
             Q1:=ABS(Q1);
             END;
Q64:=TRUNC(Q1);
F_STR_V:=S5;
STR(Q64,S5);
F_STR_V:=F_STR_V+S5;
Q1:=FRAC(Q1)+1;
STR(Q1,S5);
FOR Q3:=1 TO 17 DO S5[Q3]:=S5[Q3+3];
SETLENGTH(S5,16);
IF S5='0000000000000000' THEN S5:='0000';
F_STR_V:=F_STR_V+'.'+S5;
IF F_STR_V='0.0000' THEN F_STR_V:='0.00';
END;


FUNCTION F_VAL(Q5: STRING): INT64;//�������������� ������ � �����
BEGIN
VAL(Q5,F_VAL);
END;


FUNCTION F_VAL_V(Q5: STRING): EXTENDED;//�������������� ������ � ������������ �����
BEGIN
VAL(Q5,F_VAL_V);
END;



FUNCTION F_LENGTH(VAR S5:ANSISTRING;VAR Q64:INT64): INT64;//���������� ����� ������, ��������� �� �� � � �������� ����� ����� � ���������� Q64, ��������� ��� ��������� ���������� ����������
BEGIN
F_LENGTH:=LENGTH(S5);
Q64:=F_LENGTH;
IF Q64>0 THEN DEC(Q64);
IF Q64>0 THEN IF S5[F_LENGTH]=#39 THEN SETLENGTH(S5,Q64);
IF F_LENGTH>1 THEN IF ZNACIMYE_STROKI<9000000000000000000 THEN INC(ZNACIMYE_STROKI);
IF ISPOLJZOVANNYE_STROKI<9000000000000000000 THEN INC(ISPOLJZOVANNYE_STROKI);
END;



FUNCTION Z_LENGTH(VAR S5:ANSISTRING;ZZ64:INT64;VAR Q364:M_3_64): INT64;//���������� ����� ������, ��������� �� �� 1 � �������� ����� ����� � ���������� Q64,ZZ64-->Z64, ��������� ��� ��������� ���������� ����������
BEGIN
Q364[3]:=ZZ64;
Z_LENGTH:=LENGTH(S5);
Q364[1]:=Z_LENGTH;
IF Q364[1]>0 THEN DEC(Q364[1]);
IF Q364[1]>0 THEN IF S5[Z_LENGTH]=#39 THEN SETLENGTH(S5,Q364[1]);
IF Z_LENGTH>1 THEN IF ZNACIMYE_STROKI<9000000000000000000 THEN INC(ZNACIMYE_STROKI);
IF ISPOLJZOVANNYE_STROKI<9000000000000000000 THEN INC(ISPOLJZOVANNYE_STROKI);
END;


FUNCTION F_L_2(VAR S5:ANSISTRING;VAR Q64,W64:INT64): INT64;//���������� ����� ������, ��������� �� �� 1 � �������� ����� ����� � ���������� Q64 � � W64 �������, ��������� ��� ��������� ���������� ����������
BEGIN
F_L_2:=LENGTH(S5);
Q64:=F_L_2;
IF Q64>0 THEN DEC(Q64);
IF Q64>0 THEN IF S5[F_L_2]=#39 THEN SETLENGTH(S5,Q64);
W64:=1;
IF F_L_2>1 THEN IF ZNACIMYE_STROKI<9000000000000000000 THEN INC(ZNACIMYE_STROKI);
IF ISPOLJZOVANNYE_STROKI<9000000000000000000 THEN INC(ISPOLJZOVANNYE_STROKI);
END;


FUNCTION Z_L_2(VAR S5:ANSISTRING;ZZ64:INT64;VAR Q364:M_3_64): INT64;//���������� ����� ������, ��������� �� �� 1 � �������� ����� ����� � ���������� Q64 � � W64 �������, ��������� ��� ��������� ���������� ����������
BEGIN
Q364[3]:=ZZ64;
Z_L_2:=LENGTH(S5);
Q364[1]:=Z_L_2;
IF Q364[1]>0 THEN DEC(Q364[1]);
IF Q364[1]>0 THEN IF S5[Z_L_2]=#39 THEN SETLENGTH(S5,Q364[1]);
Q364[2]:=1;
IF Z_L_2>1 THEN IF ZNACIMYE_STROKI<9000000000000000000 THEN INC(ZNACIMYE_STROKI);
IF ISPOLJZOVANNYE_STROKI<9000000000000000000 THEN INC(ISPOLJZOVANNYE_STROKI);
END;


FUNCTION F_VAL_2(Q5: ANSISTRING; Q64: INT64;VAR W64: INT64): INT64;//�������������� ����� ������ � �����
VAR
E64: INT64; //� ����� ������� �����, ����� �� ���� "�������� 3000" ))))))))
Q3: BYTE;
W5: STRING;
LABEL 1,2;
BEGIN
//Q64 - ����� ������, ��� ����� ������ ��� ���������
//W64 - ������� ������� � ������
//FOR �������� �� GOTO ��� ������������� � 32 ������ FPC
W5:='';
Q3:=0;
E64:=W64;
IF E64>Q64 THEN BEGIN
                LAZA_CTENIJA:=1;
                W5:='0';
                Writeln(CP866_TO_UTF8('���� �⥭�� ���ᨢ�: ��室 �� �।��� ���������. ������� 䨪⨢���� ���祭��.'));
                GOTO 1;
                END;
2:
INC(Q3);
IF Q5[E64]=',' THEN GOTO 1;
W5:=W5+Q5[E64];
INC(E64);
IF Q3>100 THEN GOTO 1; 
IF E64<=Q64 THEN GOTO 2;
1:
W64:=W64+Q3;
VAL(W5,F_VAL_2);
END;


FUNCTION Z_VAL_2(Q5: ANSISTRING; VAR Q364:M_3_64): INT64;//�������������� ����� ������ � �����
VAR
E64: INT64; //� ����� ������� �����, ����� �� ���� "�������� 3000" ))))))))
Q3: BYTE;
W5: STRING;
LABEL 1,2;
BEGIN
//Q364[1] - ����� ������, ��� ����� ������ ��� ���������
//Q364[2] - ������� ������� � ������
//FOR �������� �� GOTO ��� ������������� � 32 ������ FPC
W5:='';
Q3:=0;
E64:=Q364[2];
IF E64>Q364[1] THEN BEGIN
                    LAZA_CTENIJA:=1;
                    W5:='0';
                    Writeln(CP866_TO_UTF8('���� �⥭�� ���ᨢ�: ��室 �� �।��� ���������. ������� 䨪⨢���� ���祭��.'));
                    GOTO 1;
                    END;
2:
INC(Q3);
IF Q5[E64]=',' THEN GOTO 1;
W5:=W5+Q5[E64];
INC(E64);
IF Q3>100 THEN GOTO 1;
IF E64<=Q364[1] THEN GOTO 2;
1:
Q364[2]:=Q364[2]+Q3;
VAL(W5,Z_VAL_2);
END;


FUNCTION F_VAL_2V(Q5: ANSISTRING; Q64: INT64;VAR W64: INT64): EXTENDED;//�������������� ����� ������ � �����
VAR
E64: INT64; //� ����� ������� �����, ����� �� ���� "�������� 3000" ))))))))
Q3: BYTE;
W5: STRING;
LABEL 1,2;
BEGIN
//Q64 - ����� ������, ��� ����� ������ ��� ���������
//W64 - ������� ������� � ������
//FOR �������� �� GOTO ��� ������������� � 32 ������ FPC
W5:='';
Q3:=0;
E64:=W64;
IF E64>Q64 THEN BEGIN
                LAZA_CTENIJA:=1;
                W5:='0';
                Writeln(CP866_TO_UTF8('���� �⥭�� ���ᨢ�: ��室 �� �।��� ���������. ������� 䨪⨢���� ���祭��.'));
                GOTO 1;
                END;
2:
INC(Q3);
IF Q5[E64]=',' THEN GOTO 1;
W5:=W5+Q5[E64];
INC(E64);
IF Q3>100 THEN GOTO 1; 
IF E64<=Q64 THEN GOTO 2;
1:
W64:=W64+Q3;
VAL(W5,F_VAL_2V);
END;



FUNCTION Z_VAL_2V(Q5: ANSISTRING; VAR Q364:M_3_64): EXTENDED;//�������������� ����� ������ � ������������ �����
VAR
E64: INT64; //� ����� ������� �����, ����� �� ���� "�������� 3000" ))))))))
Q3: BYTE;
W5: STRING;
LABEL 1,2;
BEGIN
//Q364[1] - ����� ������, ��� ����� ������ ��� ���������
//Q364[2] - ������� ������� � ������
//FOR �������� �� GOTO ��� ������������� � 32 ������ FPC
W5:='';
Q3:=0;
E64:=Q364[2];
IF E64>Q364[1] THEN BEGIN
                    LAZA_CTENIJA:=1;
                    W5:='0';
                    Writeln(CP866_TO_UTF8('���� �⥭�� ���ᨢ�: ��室 �� �।��� ���������. ������� 䨪⨢���� ���祭��.'));
                    GOTO 1;
                    END;
2:
INC(Q3);
IF Q5[E64]=',' THEN GOTO 1;
W5:=W5+Q5[E64];
INC(E64);
IF Q3>100 THEN GOTO 1;
IF E64<=Q364[1] THEN GOTO 2;
1:
Q364[2]:=Q364[2]+Q3;
VAL(W5,Z_VAL_2V);
END;



FUNCTION STROBUTYLJNIK(Q5: ANSISTRING): ANSISTRING;//������� � ����� ������ ������ '
VAR
Q2: LONGINT;
LABEL
100;
BEGIN
Q2:=LENGTH(Q5);
IF Q2<1 THEN GOTO 100;
IF Q5[Q2]=#39 THEN BEGIN
                   DEC(Q2);
                   SETLENGTH(Q5,Q2);
                   END;
100:
STROBUTYLJNIK:=Q5;
END;



PROCEDURE K_STROKI(VAR S5: ANSISTRING);//��������� ��� ��������� ���������� ����������
VAR
Q64: INT64;
BEGIN
Q64:=LENGTH(S5)-1;
SETLENGTH(S5,Q64);
S5:=S5+#39#10;
END;


FUNCTION TRUEBOL(BB: BOOLEAN): STRING;
BEGIN
TRUEBOL:='FALSE';
IF BB=TRUE THEN TRUEBOL:='TRUE';
END;


FUNCTION BOLATRUI(Q5: STRING): BOOLEAN;
BEGIN
BOLATRUI:=FALSE;
IF Q5='TRUE' THEN BOLATRUI:=TRUE;
END;


FUNCTION CISLOBOL(Q2: LONGINT): BOOLEAN; //Q2<1=FALSE, ����� TRUE
BEGIN
CISLOBOL:=FALSE;
IF Q2>0 THEN CISLOBOL:=TRUE;
END;


function PUTJ_k_kornju(W3: BYTE): ANSISTRING; //���������� ������� � ������� ����������� ���������
VAR
Q3: BYTE=0;
Q2,W2: LONGINT;
Q5,W5: ANSISTRING;
ZZ5: CHAR;
LABEL 2,3, 100;
BEGIN
Q5:=ParamStr(0);
ZZ5:='\';
{$ifdef linux}
ZZ5:='/';
{$endif linux}
IF LENGTH(Q5)>0 THEN BEGIN
   FOR Q2:=LENGTH(Q5) DOWNTO 1 DO IF Q5[Q2]=ZZ5 THEN BEGIN
                                                     INC(Q3);
                                                     IF Q3>W3 THEN GOTO 2;
                                                     END;
2:
                     SETLENGTH(Q5,Q2);
                     GOTO 100;
                     END;
W5:='';
IF Q5='' THEN BEGIN //���� �������� ���� upx
              FOR Q3:=1 TO 20 DO BEGIN //����� ���� �� �������
                                 Q5:=ParamStr(1);
                                 Q2:=LENGTH(Q5);
                                 IF Q2>7 THEN IF Q5[1]='-'
                                   THEN IF Q5[2]='-' THEN IF Q5[3]='p'
                                     THEN IF Q5[4]='u' THEN IF Q5[5]='t'
                                       THEN IF Q5[6]='j' THEN IF Q5[7]='_'
                                         THEN GOTO 3;
                                 END;
              GOTO 100;
3:
              FOR W2:=8 TO Q2 DO W5:=W5+Q5[W2];
              Q5:=W5;
              Q2:=LENGTH(Q5);
              IF Q5[Q2]<>ZZ5 THEN Q5:=Q5+ZZ5;
              GOTO 100;
              END;
100:
PUTJ_k_kornju:=Q5;
END;


FUNCTION OSIBKA_FINDFIRST(Q64: INT64): BOOLEAN;
BEGIN
OSIBKA_FINDFIRST:=FALSE;
{$IFNDEF WINDOWS}
IF Q64<0 THEN OSIBKA_FINDFIRST:=TRUE;
{$ENDIF}
{$IFDEF WINDOWS}
IF Q64<>0 THEN OSIBKA_FINDFIRST:=TRUE;
{$ENDIF}
END;



FUNCTION IN_1(PROVERJAEMOE_CISLO64,Q64: INT64): BOOLEAN;//�������� ��������� ��������� � ������ �����
BEGIN
IF PROVERJAEMOE_CISLO64=Q64 THEN IN_1:=TRUE ELSE IN_1:=FALSE;
END;


FUNCTION IN_2(PROVERJAEMOE_CISLO64,Q64,W64: INT64): BOOLEAN;//�������� ��������� ��������� � ���� �����
LABEL
100;
BEGIN
IN_2:=TRUE;
IF PROVERJAEMOE_CISLO64=Q64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=W64 THEN GOTO 100;
IN_2:=FALSE;
100:
END;


FUNCTION IN_3(PROVERJAEMOE_CISLO64,Q64,W64,E64: INT64): BOOLEAN;//�������� ��������� ��������� � ��� �����
LABEL
100;
BEGIN
IN_3:=TRUE;
IF PROVERJAEMOE_CISLO64=Q64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=W64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=E64 THEN GOTO 100;
IN_3:=FALSE;
100:
END;


FUNCTION IN_4(PROVERJAEMOE_CISLO64,Q64,W64,E64,R64: INT64): BOOLEAN;//�������� ��������� ��������� � ������ �����
LABEL
100;
BEGIN
IN_4:=TRUE;
IF PROVERJAEMOE_CISLO64=Q64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=W64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=E64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=R64 THEN GOTO 100;
IN_4:=FALSE;
100:
END;


FUNCTION IN_5(PROVERJAEMOE_CISLO64,Q64,W64,E64,R64,T64: INT64): BOOLEAN;//�������� ��������� ��������� � ���� �����
LABEL
100;
BEGIN
IN_5:=TRUE;
IF PROVERJAEMOE_CISLO64=Q64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=W64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=E64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=R64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=T64 THEN GOTO 100;
IN_5:=FALSE;
100:
END;


FUNCTION IN_6(PROVERJAEMOE_CISLO64,Q64,W64,E64,R64,T64,Y64: INT64): BOOLEAN;//�������� ��������� ��������� � ����� �����
LABEL
100;
BEGIN
IN_6:=TRUE;
IF PROVERJAEMOE_CISLO64=Q64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=W64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=E64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=R64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=T64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=Y64 THEN GOTO 100;
IN_6:=FALSE;
100:
END;


FUNCTION IN_7(PROVERJAEMOE_CISLO64,Q64,W64,E64,R64,T64,Y64,U64: INT64): BOOLEAN;//�������� ��������� ��������� � ���� �����
LABEL
100;
BEGIN
IN_7:=TRUE;
IF PROVERJAEMOE_CISLO64=Q64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=W64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=E64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=R64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=T64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=Y64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=U64 THEN GOTO 100;
IN_7:=FALSE;
100:
END;


FUNCTION IN_8(PROVERJAEMOE_CISLO64,Q64,W64,E64,R64,T64,Y64,U64,I64: INT64): BOOLEAN;//�������� ��������� ��������� � ������ �����
LABEL
100;
BEGIN
IN_8:=TRUE;
IF PROVERJAEMOE_CISLO64=Q64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=W64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=E64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=R64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=T64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=Y64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=U64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=I64 THEN GOTO 100;
IN_8:=FALSE;
100:
END;


FUNCTION IN_9(PROVERJAEMOE_CISLO64,Q64,W64,E64,R64,T64,Y64,U64,I64,O64: INT64): BOOLEAN;//�������� ��������� ��������� � ������ �����
LABEL
100;
BEGIN
IN_9:=TRUE;
IF PROVERJAEMOE_CISLO64=Q64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=W64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=E64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=R64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=T64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=Y64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=U64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=I64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=O64 THEN GOTO 100;
IN_9:=FALSE;
100:
END;


FUNCTION IN_10(PROVERJAEMOE_CISLO64,Q64,W64,E64,R64,T64,Y64,U64,I64,O64,P64: INT64): BOOLEAN;//�������� ��������� ��������� � ������ �����
LABEL
100;
BEGIN
IN_10:=TRUE;
IF PROVERJAEMOE_CISLO64=Q64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=W64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=E64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=R64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=T64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=Y64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=U64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=I64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=O64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=P64 THEN GOTO 100;
IN_10:=FALSE;
100:
END;


FUNCTION IN_11(PROVERJAEMOE_CISLO64,Q64,W64,E64,R64,T64,Y64,U64,I64,O64,P64,A64: INT64): BOOLEAN;//�������� ��������� ��������� � ����������� �����
LABEL
100;
BEGIN
IN_11:=TRUE;
IF PROVERJAEMOE_CISLO64=Q64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=W64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=E64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=R64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=T64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=Y64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=U64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=I64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=O64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=P64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=A64 THEN GOTO 100;
IN_11:=FALSE;
100:
END;


FUNCTION IN_12(PROVERJAEMOE_CISLO64,Q64,W64,E64,R64,T64,Y64,U64,I64,O64,P64,A64,S64: INT64): BOOLEAN;//�������� ��������� ��������� � ���������� �����
LABEL
100;
BEGIN
IN_12:=TRUE;
IF PROVERJAEMOE_CISLO64=Q64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=W64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=E64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=R64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=T64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=Y64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=U64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=I64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=O64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=P64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=A64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64=S64 THEN GOTO 100;
IN_12:=FALSE;
100:
END;


FUNCTION IN_1D(PROVERJAEMOE_CISLO64,A1_64,B1_64: INT64): BOOLEAN;//�������� ��������� ��������� ��������� �����
LABEL
100;
BEGIN
IN_1D:=FALSE;
IF PROVERJAEMOE_CISLO64<A1_64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64>B1_64 THEN GOTO 100;
IN_1D:=TRUE;
100:
END;


FUNCTION IN_2D(PROVERJAEMOE_CISLO64,A1_64,B1_64,A2_64,B2_64: INT64): BOOLEAN;//�������� ��������� ��������� � ���� ���������� �����
LABEL
2, 100;
BEGIN
IN_2D:=FALSE;
IF PROVERJAEMOE_CISLO64<A1_64 THEN GOTO 2;
IF PROVERJAEMOE_CISLO64>B1_64 THEN GOTO 2;
IN_2D:=TRUE;
GOTO 100;
2:
IF PROVERJAEMOE_CISLO64<A2_64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64>B2_64 THEN GOTO 100;
IN_2D:=TRUE;
100:
END;


FUNCTION IN_3D(PROVERJAEMOE_CISLO64,A1_64,B1_64,A2_64,B2_64,A3_64,B3_64: INT64): BOOLEAN;//�������� ��������� ��������� � ��� ���������� �����
LABEL
2,3, 100;
BEGIN
IN_3D:=FALSE;
IF PROVERJAEMOE_CISLO64<A1_64 THEN GOTO 2;
IF PROVERJAEMOE_CISLO64>B1_64 THEN GOTO 2;
IN_3D:=TRUE;
GOTO 100;
2:
IF PROVERJAEMOE_CISLO64<A2_64 THEN GOTO 3;
IF PROVERJAEMOE_CISLO64>B2_64 THEN GOTO 3;
IN_3D:=TRUE;
GOTO 100;
3:
IF PROVERJAEMOE_CISLO64<A3_64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64>B3_64 THEN GOTO 100;
IN_3D:=TRUE;
100:
END;


FUNCTION IN_4D(PROVERJAEMOE_CISLO64,A1_64,B1_64,A2_64,B2_64,A3_64,B3_64,A4_64,B4_64: INT64): BOOLEAN;//�������� ��������� ��������� � ������ ���������� �����
LABEL
2,3,4, 100;
BEGIN
IN_4D:=FALSE;
IF PROVERJAEMOE_CISLO64<A1_64 THEN GOTO 2;
IF PROVERJAEMOE_CISLO64>B1_64 THEN GOTO 2;
IN_4D:=TRUE;
GOTO 100;
2:
IF PROVERJAEMOE_CISLO64<A2_64 THEN GOTO 3;
IF PROVERJAEMOE_CISLO64>B2_64 THEN GOTO 3;
IN_4D:=TRUE;
GOTO 100;
3:
IF PROVERJAEMOE_CISLO64<A3_64 THEN GOTO 4;
IF PROVERJAEMOE_CISLO64>B3_64 THEN GOTO 4;
IN_4D:=TRUE;
4:
IF PROVERJAEMOE_CISLO64<A4_64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64>B4_64 THEN GOTO 100;
IN_4D:=TRUE;
100:
END;


FUNCTION IN_5D(PROVERJAEMOE_CISLO64,A1_64,B1_64,A2_64,B2_64,A3_64,B3_64,A4_64,B4_64,A5_64,B5_64: INT64): BOOLEAN;//�������� ��������� ��������� � ���� ���������� �����
LABEL
2,3,4,5, 100;
BEGIN
IN_5D:=FALSE;
IF PROVERJAEMOE_CISLO64<A1_64 THEN GOTO 2;
IF PROVERJAEMOE_CISLO64>B1_64 THEN GOTO 2;
IN_5D:=TRUE;
GOTO 100;
2:
IF PROVERJAEMOE_CISLO64<A2_64 THEN GOTO 3;
IF PROVERJAEMOE_CISLO64>B2_64 THEN GOTO 3;
IN_5D:=TRUE;
GOTO 100;
3:
IF PROVERJAEMOE_CISLO64<A3_64 THEN GOTO 4;
IF PROVERJAEMOE_CISLO64>B3_64 THEN GOTO 4;
IN_5D:=TRUE;
4:
IF PROVERJAEMOE_CISLO64<A4_64 THEN GOTO 5;
IF PROVERJAEMOE_CISLO64>B4_64 THEN GOTO 5;
IN_5D:=TRUE;
GOTO 100;
5:
IF PROVERJAEMOE_CISLO64<A5_64 THEN GOTO 100;
IF PROVERJAEMOE_CISLO64>B5_64 THEN GOTO 100;
IN_5D:=TRUE;
100:
END;


FUNCTION ANSY_TO_BYTE(S5: ANSISTRING): MASSIV_3;
VAR
Q2,W2: LONGINT;
BEGIN      //���� ����� ������ ������ (LIMON10) 10000000, �������� ������!
          //�������������� ������ ����������
         //��� ����� ����� ������ � ��������� ������
W2:=LENGTH(S5);
IF LIMON10<>0 THEN IF W2>LIMON10 THEN W2:=LIMON10; //��� ����� ������ ������ ������ ���� ��������
SETLENGTH(ANSY_TO_BYTE,W2+2);
FOR Q2:=1 TO W2 DO ANSY_TO_BYTE[Q2]:=ORD(S5[Q2]);
END;


FUNCTION CITALNIK(IMJA_FAILA_SOHRANKI5: ANSISTRING;VAR S5: ARRAY OF STRING; VAR Z5: ARRAY OF ANSISTRING;LIMIT: LONGINT): BOOLEAN;
VAR
DLINA_A2: LONGINT=1000;
QQ3,ADRESA3: ARRAY OF BYTE;
ADRESA2: ARRAY OF LONGINT;
M2,E2,C2,I2,R2,Y2,T2: LONGINT;
KOLP: LONGINT;
Z64,X64: INT64;
LABEL
1,2,5,  99,100;
BEGIN
CITALNIK:=FALSE;
KOLP:=LENGTH(S5);
Z64:=SYSUTILS.FILEOPEN(IMJA_FAILA_SOHRANKI5, fmOpenRead);
IF IN_2(Z64,-1,VINDOFAILOBAG) THEN GOTO 100;
X64:=SYSUTILS.FILESEEK(Z64,0,2);
SYSUTILS.FILESEEK(Z64,0,0);
IF X64>LIMIT THEN X64:=LIMIT;
IF X64<1 THEN GOTO 99;
SETLENGTH(QQ3,X64+200);
FOR M2:=X64 TO X64+200-1 DO QQ3[M2]:=0;
M2:=X64;
E2:=0;
SYSUTILS.FILEREAD(Z64,QQ3[1],X64);
SETLENGTH(ADRESA2,DLINA_A2+2);
SETLENGTH(ADRESA3,DLINA_A2+2);
ADRESA2[0]:=1;
ADRESA2[1]:=X64;
ADRESA3[1]:=0;
C2:=0;
FOR E2:=1 TO X64 DO BEGIN
                    IF QQ3[E2] IN [10,13]=FALSE THEN GOTO 5;
                    IF QQ3[E2+1]<>36 THEN GOTO 5;
                    INC(C2);
                    IF C2>DLINA_A2 THEN BEGIN
                                        DLINA_A2:=DLINA_A2+2000;
                                        SETLENGTH(ADRESA2,DLINA_A2+2);
                                        SETLENGTH(ADRESA3,DLINA_A2+2);
                                        END;
                    ADRESA2[0]:=C2;
                    ADRESA2[C2]:=E2;
                    ADRESA3[C2]:=0;
5:
                    END;

FOR I2:=0 TO KOLP-1 DO BEGIN
                       Z5[I2]:='';
                       FOR C2:=1 TO ADRESA2[0] DO BEGIN
                                          IF ADRESA3[C2]=1 THEN GOTO 2;
                                          E2:=ADRESA2[C2];
                                          FOR R2:=1 TO LENGTH(S5[I2]) DO BEGIN
                                              IF QQ3[E2+R2+1]<>ORD(S5[I2,R2]) THEN GOTO 2;
                                              IF QQ3[E2+R2+1]=39 THEN BEGIN
                                                                      Y2:=1;
                                                                      ADRESA3[C2]:=1;
                                                                      FOR T2:=R2+1 TO X64 DO BEGIN
                                                                                             IF QQ3[E2+T2+1] {=10} IN [10,13] THEN GOTO 1;
                                                                                             Z5[I2]:=Z5[I2]+CHR(QQ3[E2+T2+1]);
                                                                                             IF QQ3[E2+T2+1]=39 THEN GOTO 1;
                                                                                             INC(Y2);
                                                                                             END;
                                                                      GOTO 1;
                                                                      END;
                                                                         END;
2:
                                                END;
1:
                       END;
99:
CITALNIK:=TRUE;
100:
SYSUTILS.FILECLOSE(Z64);
END;



FUNCTION CP866__UTF8(XZFC: BYTE): STRING;//�������������� ������� CP866 � ������ UTF8
BEGIN
CASE XZFC OF
0..127:   CP866__UTF8:=CHR(XZFC);
128..255: CP866__UTF8:=MASSIV_IBM866_TO_UTF8[XZFC]; 
END;
END;


FUNCTION CP866_V_UTF8(S5:ANSISTRING):ANSISTRING;  //��������������
                            //������ � CP866 ��������� � ������ UTF8
VAR
Q2,W2: INT64;
LABEL
1,100;
BEGIN
W2:=LENGTH(S5);
SETLENGTH(CP866_V_UTF8,{0}W2);
CP866_V_UTF8:='';
//IF LENGTH(S)>0 THEN
//   FOR Q2:=1 TO LENGTH(S) DO CP866_TO_UTF8:=CP866_TO_UTF8+CP866__UTF8(ORD(S[Q2]));
IF W2<1 THEN GOTO 100;
Q2:=1;
1:
CP866_V_UTF8:=CP866_V_UTF8+CP866__UTF8(ORD(S5[Q2]));
INC(Q2);
IF Q2<=W2 THEN GOTO 1;
100:
END;


FUNCTION CP866_TO_UTF8(S5:ANSISTRING):ANSISTRING; //��������������
    //������ � CP866 ��������� � ������ UTF8, � ����� �� ������ ���� ��� � �� �����
{$IFNDEF WINDOWS}
VAR
Q2,W2: INT64;
LABEL
1,100;
BEGIN
W2:=LENGTH(S5);
SETLENGTH(CP866_TO_UTF8,{0}W2);
CP866_TO_UTF8:='';
//IF LENGTH(S)>0 THEN
//   FOR Q2:=1 TO LENGTH(S) DO CP866_TO_UTF8:=CP866_TO_UTF8+CP866__UTF8(ORD(S[Q2]));
IF W2<1 THEN GOTO 100;
Q2:=1;
1:
CP866_TO_UTF8:=CP866_TO_UTF8+CP866__UTF8(ORD(S5[Q2]));
INC(Q2);
IF Q2<=W2 THEN GOTO 1;
100:
{$ENDIF}
{$IFDEF WINDOWS}
BEGIN
IF UTF8_CMDKONSOLI=0 THEN CP866_TO_UTF8:=S5
   ELSE CP866_TO_UTF8:=CP866_V_UTF8(S5);
{$ENDIF WINDOWS}
END;


FUNCTION PUTI_MAZDAJA(S5: ANSISTRING): ANSISTRING; //������ / �� \ � ������ ���� �������� ������ � ������
VAR
Q2: LONGINT;
BEGIN
{$IFDEF WINDOWS}
FOR Q2:=1 TO LENGTH(S5) DO IF S5[Q2]='/' THEN S5[Q2]:='\';
{$ENDIF WINDOWS}
PUTI_MAZDAJA:=S5;
END;




BEGIN
END.