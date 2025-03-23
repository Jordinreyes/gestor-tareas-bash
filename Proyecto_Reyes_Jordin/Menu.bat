chcp 65001 > nul  
@echo off 
cls
::Autor: Jordin Reyes
:menu
cls
echo ╔═════════════════════════════════════════════════════════════╗
echo ║                  GESTION DE TAREAS                          ║
echo ║                                                             ║
echo ║ 1.- GESTION DE CREAR MULTIPLE DIRECTORIOS                   ║
echo ║ 2.- GESTION DE COPIAR MULTIPLE ARCHIVOS A UN DIRECTORIO     ║
echo ║ 3.- GESTION DE ATRIBUTOS DE SEGURIDAD                       ║
echo ║ 4.- GESTION DE USUARIO                                      ║
echo ║ 5.- GESTION DE CALCULADORA                                  ║
echo ║ 6.- JUEGO DE TABLA DE MULTIPLICAR                           ║
echo ║ 7.- GESTOR DE SISTEMA DE APAGADO                            ║
echo ║ 8.- GESTOR DE CREAR MULTIPLE ARCHIVOS CON EXTENSIONES       ║
echo ║ 9.- SALIR                                                   ║
echo ╚═════════════════════════════════════════════════════════════╝
echo.
set /p opciones=Introduzca una opcion del (1..9): 
if %opciones%==1 goto directorio 
if %opciones%==2 goto copiar
if %opciones%==3 goto atributos
if %opciones%==4 goto usuarios
if %opciones%==5 goto calculadora
if %opciones%==6 goto tabla
if %opciones%==7 goto apagado
if %opciones%==8 goto crear
if %opciones%==9 goto fin
echo.
echo Por favor elige una opcion bien
echo.
pause
goto :menu

:directorio
echo.
set /p directorio=Introduzca el nombre del directorio a crear (intro para terminar): 
if "%directorio%"=="" goto :creadoDirectorio
mkdir %directorio%
set listaDirectorios=%listaDirectorios% %directorio%
set directorio=
goto directorio

:creadoDirectorio
echo.
echo Se han creado los directorio %listaDirectorios%
echo.
set listaDirectorios=
pause
goto :menu

:copiar
echo.
set /p destino=Introduzca directorio destino: 
echo.
:copiar2
set /p archivos=Introduzca archivos a copiar en %destino% (intro para terminar): 
if "%archivos%"=="" goto copiados
copy %archivos% %destino%
echo.
set guardarArchivos=%guardarArchivos% %archivos% 
set archivos=
goto :copiar2

:copiados
echo.
echo Se han copiado %guardarArchivos% en el directorio %destino%
echo.
pause
set guardarArchivos=
set destino=
set archivos=
goto :menu

:atributos
cls
echo.
echo ╔═══════════════════════════════╗
echo ║          ATRIBUTOS            ║
echo ║                               ║
echo ║ S.- SISTEMA                   ║
echo ║ H.- OCULTAR                   ║
echo ║ R.- SOLO LECTURA              ║
echo ║ A.- ARCHIVO                   ║
echo ║ E.- ENCRIPTADO                ║
echo ║ C.- COMPRIMIDO                ║
echo ║                               ║
echo ╚═══════════════════════════════╝
echo.
set /p archivos=Introduzca el archivo o directorio (intro para terminar):  
if "%archivos%"=="" goto :menu
echo.
set /p atributo=Introduzca el atributo que quiere ponerle al archivo o directorio %archivos%: 
echo.
if "%atributo%"=="S" goto sistema
if "%atributo%"=="H" goto oculto
if "%atributo%"=="R" goto lectura
if "%atributo%"=="A" goto archivo
if "%atributo%"=="E" goto encriptado
if "%atributo%"=="C" goto comprimir
echo.
echo Por favor elige una opcion bien
echo.
pause
goto atributos

:sistema
attrib +S "%archivos%"
echo Se le ha puesto el atributo S al archivo %archivos%
set atributos=
set archivos=
echo.
pause
goto :atributos

:oculto
attrib -S "%archivos%"   
attrib +H "%archivos%" 
echo Se le ha puesto el atributo H al archivo %archivos%
set atributos=
set archivos=
echo.
pause
goto :atributos

:lectura
attrib +R "%archivos%"
echo Se le ha puesto el atributo R al archivo %archivos%
set atributos=
set archivos=
echo.
pause
goto :atributos

:archivo
attrib +A "%archivos%"
echo Se le ha puesto el atributo A al archivo %archivos%
set atributos=
set archivos=
echo.
pause
goto :atributos

:encriptado
cipher /e "%archivos%"
echo Se ha encriptado el archivo o directorio %archivos%
set atributos=
set archivos=
echo.
pause
goto :atributos

:comprimir
compact /c "%archivos%"
echo Se ha comprimido el archivo o directorio %archivos%
set atributos=
set archivos=
echo.
pause
goto :atributos

:usuarios
echo.
set /p usuario=Introduzca el nombre del nuevo usuario (intro para terminar): 
if "%usuario%"=="" goto menu
net user %usuario% /add
goto :creado

:creado
echo. Usuario creado: %usuario%
echo.
pause
set usuario=
goto :usuarios

:calculadora
cls
echo.
echo ╔═══════════════════════════════╗
echo ║          CALCULADORA          ║
echo ║                               ║
echo ║ +.- SUMA                      ║
echo ║ -.- RETSA                     ║
echo ║ /.- DIVISION                  ║
echo ║ *.- MULTIPLICACION            ║
echo ║                               ║
echo ╚═══════════════════════════════╝
echo.
set /p calculadora=Cual operacion Quieres hacer (+, - , /, *):  
if "%calculadora%"=="+" goto sumar
if "%calculadora%"=="-" goto restar
if "%calculadora%"=="/" goto dividir
if "%calculadora%"=="*" goto multiplicacion
if "%calculadora%"=="" goto menu
echo.
echo Por favor elige una opcion bien
echo.
pause
goto calculadora

:sumar
set calculadora=
echo.
set /p num1=Introduzca el primer numero: 
echo.
set /p num2=Introduzca el segundo numero:
set /a sumador=%num1%+%num2%
echo.
echo La suma es :%sumador%
echo.
set num1=
set num2=
set sumador=
set /p volver=Quieres volver a sumar (S/N)?: 
if "%volver%"=="S" goto sumar
goto calculadora

:restar
set calculadora=
echo.
set /p num1=Introduzca el primer numero: 
echo.
set /p num2=Introduzca el segundo numero:
set /a restador=%num1%-%num2%
echo.
echo La resta es :%restador%
echo.
set num1=
set num2=
set restador=
set /p volver=Quieres volver a restar (S/N)?: 
if "%volver%"=="S" goto restar
goto calculadora

:dividir
set calculadora=
echo.
set /p num1=Introduzca el primer numero: 
echo.
set /p num2=Introduzca el segundo numero:
set /a dividor=%num1%/%num2%
echo.
echo La division es :%dividor%
echo.
set num1=
set num2=
set dividor=
set /p volver=Quieres volver a dividir (S/N)?: 
if "%volver%"=="S" goto sumar
goto calculadora

:multiplicacion
set calculadora=
echo.
set /p num1=Introduzca el primer numero: 
echo.
set /p num2=Introduzca el segundo numero:
set /a multiplicador=%num1%*%num2%
echo.
echo La multiplicacion es :%multiplicador%
echo.
set num1=
set num2=
set multiplicador=
set /p volver=Quieres volver a multiplicar (S/N)?: 
if "%volver%"=="S" goto sumar
goto calculadora

:tabla
call juego.bat
echo.
set /p again=Quieres jugar otra vez (S/N): 
if "%again%"=="S" goto :tabla
goto :menu

:apagado
cls
echo.
echo ╔═══════════════════════════════╗
echo ║       SISTEMA DE APAGADO      ║
echo ║                               ║
echo ║ A.- APAGAR                    ║
echo ║ R.- REINICIAR                 ║
echo ║ S.- SUSPENDER                 ║
echo ║                               ║
echo ╚═══════════════════════════════╝
echo.
set /p apagado= Cual Opciones Quieres elegir (A, R , S): 
if "%apagado%"=="A" goto apagar
if "%apagado%"=="R" goto reiniciar 
if "%apagado%"=="S" goto suspender
if "%apagado%"=="" goto menu
echo.
echo Por favor elige una opcion bien
echo.
pause
goto :apagado

:apagar
echo.
echo Vamos a apagar el dispositivo
echo.
pause 
echo.
shutdown /s
set apagado=
goto :apagado

:reiniciar
echo.
echo Vamos a reiniciar el dispositivo
echo.
pause
echo.
shutdown /r
set apagado=
goto :apagado

:suspender
echo.
echo Vamos a suspender el dispositivo
echo.
pause
echo.
shutdown /h
set apagado=
goto :apagado

:crear
echo.
set /p extension=Cual extension Quieres crear: 
echo.
:loop
set /p arch=Introduzca el primer nombre del archivo (intro para terminar): 
if "%arch%"=="" goto create
echo.
echo %arch% >> %arch%.%extension%
set lista=%lista% %arch%.%extension%
set arch=
goto :loop

:create
echo.
echo Se han creado los archivos: %lista%
echo.
set lista=
set arch=
set extension=
pause
goto :menu

:fin
set opciones=
set directorio=
set listaDirectorios=
set destino=
set archivos=
set guardarArchivos=
set atributo=
set usuario=
set calculadora=
set num1=
set num2=
set sumador=
set restador=
set dividor=
set multiplicador=
set again=
set apagado=
set extension=
set arch=
set lista=
cls
echo.
echo GRACIAS POR USUR ESTE SCRIPT
