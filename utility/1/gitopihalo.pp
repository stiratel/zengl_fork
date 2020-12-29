
{УТИЛИТА ДЛЯ РАБОТЫ С ГИТОМ}


{$GOTO ON}
{$MODE FPC}
{$R+}


USES
POLEZNOSTI, SYSUTILS, BASEUNIX, UNIX, KEYBOARD;


VAR

LAZA3: BYTE=0;
CC5: CHAR;
QQ2: LONGINT;
NOMER_VERSII64: INT64;
KOMMEHTARIJ_K_VERSII5: ANSISTRING='';
KOMMEHTARIJ_FAILA5: ANSISTRING='';
IMJA_FAILA_SOHRANKI,QQ5,PUTJ_K_UTILITAM5,KOMMEHTARIJ_K_VERSII5_2: ANSISTRING;
Info: TSearchRec;
//T_T: TKEYEVENT;


LABEL
99, 100, 101;




PROCEDURE ZAGRUZITJ_FAIL;
CONST
KOLP=10;
LIMIT=10000000;
VAR
S5: ARRAY OF SHORTSTRING;
Z5: ARRAY OF ANSISTRING;
Q364:M_3_64;
LABEL
99, 100;
BEGIN
SETLENGTH(S5,KOLP);
SETLENGTH(Z5,KOLP);
Writeln(cp866_to_utf8('Загружается файл '),IMJA_FAILA_SOHRANKI);
S5[1]:='KOMMEHTARIJ_FAILA='+#39;
S5[2]:='NOMER_VERSII='+#39;
S5[3]:='KOMMEHTARIJ_K_VERSII='+#39;

IF CITALNIK(IMJA_FAILA_SOHRANKI,S5,Z5,LIMIT)=FALSE THEN GOTO 99;
IF Z_L_2(Z5[1],1,Q364)>1 THEN KOMMEHTARIJ_FAILA5:=(Z5[Q364[3]]);
IF Z_L_2(Z5[2],2,Q364)>1 THEN NOMER_VERSII64:=F_VAL(Z5[Q364[3]]) ELSE GOTO 100;
IF Z_L_2(Z5[3],3,Q364)>1 THEN KOMMEHTARIJ_K_VERSII5:=(Z5[Q364[3]]);

GOTO 100;
99:
Writeln(cp866_to_utf8('Лажа при чтении файла '),IMJA_FAILA_SOHRANKI);
LAZA3:=1;
100:
END;




PROCEDURE SOXRANITJ_FAIL; //ДОПИСЫВАТЬ НОВЫЕ ГЛОБАЛЬНЫЕ ПЕРЕМЕННЫЕ ДЛЯ ЗАПИСИ ИХ В ФАЙЛ
CONST
KOLSTR=3;
VAR
W2: LONGINT;
S5: ARRAY[0..KOLSTR] OF ANSISTRING;
IMJA_FAILA_SOHRANKI5: ANSISTRING;
Q64: INT64;
LABEL
99, 100;
BEGIN
Writeln(cp866_to_utf8('Сохраняется файл '),IMJA_FAILA_SOHRANKI);
S5[0]:=#13#10;
S5[1]:='$KOMMEHTARIJ_FAILA='+#39+KOMMEHTARIJ_FAILA5+#39#13#10;
S5[2]:='$NOMER_VERSII='+#39+F_STR(NOMER_VERSII64)+#39#13#10;
S5[3]:='$KOMMEHTARIJ_K_VERSII='+#39+KOMMEHTARIJ_K_VERSII5+#39#13#10;

IMJA_FAILA_SOHRANKI5:=PUTI_MAZDAJA(IMJA_FAILA_SOHRANKI);
Q64:=SYSUTILS.FILECREATE(IMJA_FAILA_SOHRANKI5);

IF IN_2(Q64,-1,VINDOFAILOBAG)=FALSE THEN BEGIN
   FOR W2:=0 TO KOLSTR DO SYSUTILS.FILEWRITE(Q64,ANSY_TO_BYTE(S5[W2])[1],LENGTH(S5[W2]));
   W2:=10;
   SYSUTILS.FILEWRITE(Q64,W2,1);
                                         END ELSE GOTO 99;
FILECLOSE(Q64);

GOTO 100;
99:
Writeln(cp866_to_utf8('Лажа при чтении файла '),IMJA_FAILA_SOHRANKI5);
LAZA3:=1;
100:
END;


FUNCTION SRAVNENIE_192(Q2:LONGINT):BOOLEAN;
BEGIN
SRAVNENIE_192:=FALSE;
CASE Q2 OF
192..253: SRAVNENIE_192:=TRUE; 
END;
END;


FUNCTION REZAK_KOMENTA_PO_STROKAM(ZXCS5:ANSISTRING):ANSISTRING;
VAR
Q3: BYTE;
Q2,W2: LONGINT;
LABEL
100;
BEGIN
//ЦИКЛ ВСТАВЛЯЮЩИЙ ПОСЛЕ КАЖДОГО 70 СИМВОЛА 13 10, ЕСЛИ 70 СИМВОЛ В ДИАПАЗОНЕ
//192..253
//ТО ВСТАВЛЯЕТСЯ ПОСЛЕ 64..69-ГО.
//В КОНЦЕ ДОБАВЛЯЕТСЯ 13 10 ЕЩЁ РАЗ
W2:=LENGTH(ZXCS5);
IF W2>20000 THEN BEGIN
                 W2:=20000;
                 SETLENGTH(ZXCS5,W2);
                 END; 
IF W2<=70 THEN BEGIN
               REZAK_KOMENTA_PO_STROKAM:=ZXCS5;
               GOTO 100;
               END;
Q3:=0;
FOR Q2:=1 TO W2 DO BEGIN
    REZAK_KOMENTA_PO_STROKAM:=REZAK_KOMENTA_PO_STROKAM+ZXCS5[Q2];
    INC(Q3); 
    IF Q3>64 THEN IF Q2+1<=W2 THEN
      IF SRAVNENIE_192(ORD(ZXCS5[Q2+1]))=TRUE THEN BEGIN 
                      REZAK_KOMENTA_PO_STROKAM:=REZAK_KOMENTA_PO_STROKAM+#13#10;                
                      Q3:=0;
                                                   END;
IF Q3>69 THEN IF Q2<>W2 THEN BEGIN      
                             REZAK_KOMENTA_PO_STROKAM:=REZAK_KOMENTA_PO_STROKAM+#13#10;
                             Q3:=0;
                             END;
                   END;
100:
REZAK_KOMENTA_PO_STROKAM:=REZAK_KOMENTA_PO_STROKAM+#13#10;
END;



BEGIN //НАЧАЛО
SLEEP(150);
INITKEYBOARD;
FOR QQ2:=1 TO 50 DO IF KEYBOARD.KEYPRESSED=TRUE THEN GETKEYEVENT;
SLEEP(50);
CASE PARAMSTR(2) OF
'--1':cp866_to_utf8(' --1 Коммит всего проекта.');
'--2':cp866_to_utf8(' --2 Заново переиндексированы все файлы. Коммит всего проекта.');
'--3':cp866_to_utf8(' --3 Краткий коммит. Закоммитены файлы без контента и "bin/".');
END;
Writeln(cp866_to_utf8('Нажми Esc для выхода, или любую другую клавишу - для продолжения.'));
     //ORD(KEYBOARD.RAWREADKEY) ВЫДАЁТ 27 (+2 ЧИСЛА) И ПРИ НАЖАТИИ НА ЭФКИ
IF ORD(KEYBOARD.RAWREADKEY)=27 THEN IF KEYBOARD.KEYPRESSED=FALSE THEN GOTO 101;
DONEKEYBOARD;
CC5:='/';
{$IFDEF WINDOWS}
CC5:='\';
{$ENDIF WINDOWS}
{$I-}
CHDIR(PARAMSTR(1));
IF IORESULT<>0 THEN BEGIN
                    Writeln(cp866_to_utf8('Попытка переместиться в каталог ')
                     +PARAMSTR(1)+cp866_to_utf8(' закончилась неудачей.'));
                    {$I+}
                    GOTO 99;
                    END;
{$I+}
PUTJ_K_UTILITAM5:=PARAMSTR(3);
QQ2:=LENGTH(PUTJ_K_UTILITAM5);
IF QQ2>1 THEN IF PUTJ_K_UTILITAM5[QQ2]<>CC5 THEN PUTJ_K_UTILITAM5:=PUTJ_K_UTILITAM5+CC5;
IF OSIBKA_FINDFIRST(SYSUTILS.findfirst(PUTJ_K_UTILITAM5+'git_add_vesj_proekt.sh',faAnyFile+fahidden+fareadonly,Info))
  =TRUE THEN BEGIN
             Writeln(cp866_to_utf8('По адресу, указанному в третьем ключе, файл git_add_vesj_proekt.sh не обнаружен - лажа проверки ключа!'));
             GOTO 99;
             END;
IMJA_FAILA_SOHRANKI:='pisuljka_versuljka.txt';
ZAGRUZITJ_FAIL;
IF LAZA3<>0 THEN GOTO 99;
FPSYSTEM('./cistilka.sh');


CASE PARAMSTR(2) OF
'--1': BEGIN
       FPSYSTEM(PUTJ_K_UTILITAM5+'git_add_vesj_proekt.sh');
       IF IORESULT<>0 THEN GOTO 99;
              KOMMEHTARIJ_K_VERSII5_2:=REZAK_KOMENTA_PO_STROKAM(KOMMEHTARIJ_K_VERSII5)
         +cp866_to_utf8(' --1 Коммит всего проекта.');
       QQ5:='git commit -m "'+F_STR(NOMER_VERSII64)+#13#10+' '+KOMMEHTARIJ_K_VERSII5_2+'"';
       FPSYSTEM(QQ5); //КОМАНДА НА ЗАПУСК КОММИТА
       END;
'--2': BEGIN
             //УДАЛЕНИЕ ИЗ ПРОЕКТА ВСЕХ ФАЙЛОВ ПЕРЕД ПОЛНЫМ КОММИТОМ
             //ЧТОБЫ НЕНУЖНЫЕ ФАЙЛЫ НЕ ПЛОДИЛИСЬ
       FPSYSTEM(PUTJ_K_UTILITAM5+'git_rm_cashed.sh');
       FPSYSTEM(PUTJ_K_UTILITAM5+'git_add_vesj_proekt.sh');
       IF IORESULT<>0 THEN GOTO 99;
       KOMMEHTARIJ_K_VERSII5_2:=REZAK_KOMENTA_PO_STROKAM(KOMMEHTARIJ_K_VERSII5)
         +cp866_to_utf8(' --2 Заново переиндексированы все файлы. Коммит всего проекта.');
       QQ5:='git commit -m "'+F_STR(NOMER_VERSII64)+#13#10+' '+KOMMEHTARIJ_K_VERSII5_2+'"';
       FPSYSTEM(QQ5); //КОМАНДА НА ЗАПУСК КОММИТА
       END;
'--3': BEGIN
       FPSYSTEM(PUTJ_K_UTILITAM5+'git_add_proekt_bez_kontenta_i_bin.sh');
       IF IORESULT<>0 THEN GOTO 99;
       KOMMEHTARIJ_K_VERSII5_2:=REZAK_KOMENTA_PO_STROKAM(KOMMEHTARIJ_K_VERSII5)
         +cp866_to_utf8(' --3 Краткий коммит. Закоммитены файлы без контента и "bin/".');
       QQ5:='git commit -m "'+F_STR(NOMER_VERSII64)+#13#10+' '+KOMMEHTARIJ_K_VERSII5_2+'"';
       FPSYSTEM(QQ5); //КОМАНДА НА ЗАПУСК КОММИТА
       END;
ELSE BEGIN
     Writeln(cp866_to_utf8('Второй параметр командной строки - лажовый.'));
     GOTO 99;
     END;
END;

INC(NOMER_VERSII64);
SOXRANITJ_FAIL;
IF LAZA3<>0 THEN GOTO 99;
GOTO 100;
99:
Writeln(cp866_to_utf8('Лажа выполнения программы'));
100:
FPSYSTEM(PUTJ_K_UTILITAM5+'./vyhod_1.sh');
101:
DoneKeyboard;
END.



