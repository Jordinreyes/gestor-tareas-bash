@echo off
cls
::Autor Jordin Reyes
echo.
set /p tabla=Introduzca la tabla de multiplicar: 
echo.
set contador=1
set correctas=0
set incorrectas=

:loop
if %contador%==11 goto fin
set /p respuesta=%tabla% * %contador% = 
set /a solucion=%tabla%*%contador%
if "%respuesta%"=="%solucion%" goto correctas
goto incorrectas

:correctas
echo %tabla% * %contador% = %respuesta% >> correctas.txt
set /a contador+=1
set /a correctas+=1
goto loop


:incorrectas
echo %tabla% * %contador% = %respuesta% >> incorrectas.txt 
set /a contador=%contador%+1
set /a incorrectas=%incorrectas%+1
goto loop

:fin
echo ================================
echo            CORRECTAS
echo ================================
if exist correctas.txt type correctas.txt
if exist correctas.txt del correctas.txt
echo ================================
echo ================================
echo            INCORRECTAS 
echo ================================
if exist incorrectas.txt type incorrectas.txt
if exist incorrectas.txt del incorrectas.txt
set contador=
set correctas=
set incorrectas=
set tabla=
set solucion=
set respuesta=