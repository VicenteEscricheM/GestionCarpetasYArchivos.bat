@ECHO OFF
ECHO.
ECHO.
ECHO.
COLOR 0C
ECHO                     Advertencia: Ejecute este programa como administrador para correcto funcionamiento.
PAUSE>NUL
CLS
GOTO :menu
::Código por Vicente Escriche Martín
::Recomendable abrir este código con el programa Notepad++

:menu
CLS
COLOR 0F
ECHO.
echo. *-*-*-*-*-*-*-*-*-*-*-*-*  
ECHO         MENU DE GESTION DE CARPETAS Y ARCHIVOS   
ECHO                             *-*-*-*-*-*-*-*-*-*-*-*-*
ECHO.
ECHO     1 Crear carpeta            2 Crear archivo
ECHO     3 Eliminar carpeta         4 Eliminar archivo
ECHO     5 Renombrar carpeta        6 Renombrar archivo    -"-
ECHO     7 Mover carpeta            8 Mover archivo      / 6 6 \
ECHO     9 Crear copia de seguridad 0 Ver directorios   {/(_0_)\}
ECHO     11 Menu de ayuda           12 Salir             _/   \_
echo                                                    (/_/ \_\)
ECHO.                                                    
echo.
echo  Usuario: %USERPROFILE%
echo  Hora del sistema: %time%
echo.
SET /P opcion= Seleccione que opcion desea realizar: 
if %opcion%==1 goto crear_carpeta  ::~Línea 52
if %opcion%==2 goto crear_archivo  ::~Línea 76
if %opcion%==3 goto eliminar_carpeta  ::~Línea 255
if %opcion%==4 goto eliminar_archivo  ::~Línea 492
if %opcion%==5 goto renombrar_car  ::~Línea 588
if %opcion%==6 goto renombrar_arch  ::~Línea 1495
if %opcion%==7 goto mover_car  ::~Línea 885
if %opcion%==8 goto mover_arch  ::~Línea 1135
if %opcion%==9 goto crear_copy_seguridad  ::~Línea 1307
if %opcion%==0 goto ver_directorios  ::~Línea 646
if %opcion%==69 echo. && echo Tu que haces poniendo 69 (e.e)...
if %opcion%==11 goto menu_ayuda
if %opcion%==12 exit
echo.
echo  Opcion no valida, por favor, seleccione una opcion del menu.
PAUSE>NUL
goto menu

:crear_carpeta       ::raiz ---> menu ~Línea 13
CLS
ECHO.
ECHO   1 Disco Duro C:\
ECHO   2 Escritorio
ECHO   3 Otra Unidad/particion de disco
ECHO   4 Elegir carpeta manualmente desde el Disco Local C
ECHO   5 Elegir carpeta manualmente desde el escritorio
echo   6 Crear lista de carpetas
ECHO   7 Volver al menu
ECHO.
SET /P ubicacion=Elija una ubicacion en la que crear la carpeta: 
if %ubicacion%==1 goto crear_car_hd  ::~Línea 101
if %ubicacion%==2 goto crear_car_d  ::~Línea 118
if %ubicacion%==3 goto crear_car_otra_unidad  ::~Línea 192
if %ubicacion%==4 goto directorio_manual_discoc  ::~Línea 141
if %ubicacion%==5 goto directorio_manual_desktop  ::~ Línea 163
if %ubicacion%==6 goto crear_lista_carpetas  :: ~Línea 210
if %ubicacion%==7 goto menu  ::~Línea 13
echo.
echo  Opcion no valida, por favor, seleccione una opcion del menu.
pause>nul
goto crear_carpeta

:crear_archivo          ::raiz ---> menu ~Línea 13
CLS
ECHO.
ECHO  Bienvenido a la herramienta de creacion de archivos!
ECHO  (El archivo creado sera un documento de texto)
ECHO.
ECHO   1 Disco duro c:\
ECHO   2 Escritorio
echo   3 Otra unidad/particion
ECHO   4 Crear archivo dentro de una carpeta existente en el disco duro c
ECHO   5 Crear archivo dentro de una carpeta existente en el escritorio
ECHO   6 Volver al menu principal
echo.
SET /P opcion2= Seleccione donde desea crear el archivo: 
if %opcion2%==1 GOTO arch_harddrive  ::~Línea 387
if %opcion2%==2 GOTO arch_desktop  ::~Línea 404
if %opcion2%==3 goto arch_u  ::~Línea 431
if %opcion2%==5 GOTO crear_archharddrive  ::~Línea 452
if %opcion2%==5 goto crear_archdesktop  ::~Línea 468
if %opcion2%==6 goto menu
echo.
echo  Opcion no valida, por favor, seleccione una opcion del menu.
pause>nul
goto crear_archivo

:crear_car_hd        ::raiz ---> crear_carpeta ~Línea 52
CLS
cd..
cd..
ECHO.
ECHO  Ha seleccionado el disco duro C para la creacion de la carpeta.
echo.
SET /P nombrec= Escriba un nombre para la carpeta: 
MD "%nombrec%"
ECHO.
ECHO  La carpeta "%nombrec%" ha sido creada satisfactoriamente en el disco duro.
ECHO.
ECHO  Pulse cualquier boton para volver al menu principal...
pause>nul
CLS
GOTO menu

:crear_car_d         ::raiz ---> crear_carpeta ~Línea 52
CLS
ECHO.
ECHO  Ha seleccionado el escritorio para la creacion de la carpeta.
echo.
SET /P nom_user= Escriba el nombre de usuario al que le quiere crear la carpeta: 
ECHO.
cd..
cd..
cd Users
cd %nom_user%
cd desktop
echo  Escriba el nombre de la carpeta o carpetas que desea crear entre comillas (" ").
SET /P nombreca123= Ejemplo: "Carpeta 1" "Carpeta 2": 
MD "%nombreca123%"
echo.
ECHO  La/s carpeta/s "%nombreca123%" ha/n sido creada/s correctamente!
ECHO.
ECHO  Pulse cualquier boton para volver al menu principal...
pause>nul
CLS
GOTO menu

:directorio_manual_discoc   ::raiz ---> crear_carpeta ~Línea 52
CLS
ECHO.
ECHO  Ha seleccionado crear una carpeta dentro de una carpeta ya existente del disco C
ECHO.
ECHO  Estos son los directorios que se encuentran dentro del disco local:
cd..
cd..
DIR
ECHO.
SET /P directoriomanual= Escriba el nombre del directorio en el que desea crear la carpeta: 
cd %directoriomanual%
SET /P carpetamanual= Escriba el nombre de la carpeta que desea crear en %directoriomanual%: 
MD "%carpetamanual%"
ECHO.
ECHO  La carpeta "%carpetamanual%" ha sido creada dentro de la carpeta "%directoriomanual%".
ECHO.
ECHO  Pulse cualquier boton para volver al menu principal...
pause>nul
CLS
GOTO menu

:directorio_manual_desktop    ::raiz ---> crear_carpeta ~Línea 52
CLS
ECHO.
ECHO  Ha seleccionado crear una carpeta dentro de una carpeta ya existente del Escritorio
ECHO.
SET /P user_crear_car_manual_desk= Escriba el nombre del usuario al que le quiere crear la carpeta: 
cd..
cd..
cd Users
cd %user_crear_car_manual_desk%
cd desktop
ECHO.
ECHO  Estas son las carpetas que se encuentran dentro del escritorio del usuario %user_crear_car_manual_desk%:
DIR
ECHO.
ECHO  Asegurese de escribir el nombre del directorio tal cual esta escrito en el escritorio.
SET /P nombrecardesktop= Escriba el nombre del directorio en el escritorio al que desea entrar: 
ECHO.
cd %nombrecardesktop%
SET /P nombrenuevacardesktop= Escriba el nombre de la carpeta que desea crear: 
MD "%nombrenuevacardesktop%" 
ECHO.
ECHO  La carpeta "%nombrenuevacardesktop%" ha sido creada correctamente dentro de "%nombrecardesktop%".
ECHO.
ECHO  Pulse cualquier boton para volver al menu principal...
pause>nul
CLS
GOTO menu

:crear_car_otra_unidad     ::raiz ---> crear_carpeta ~Línea 52
CLS
ECHO.
ECHO  Ha elegido crear una carpeta nueva en otra unidad.
ECHO.
SET /P letra_crear_car= Escriba la letra de la unidad/particion en la que desea trabajar: 
echo.
SET /P nom_car_nueva_otraunidad= Escriba el nombre para la nueva carpeta: 
%letra_crear_car%:
md %nom_car_nueva_otraunidad%
echo.
echo  La carpeta "%nom_car_nueva_otraunidad%" ha sido creada.
echo.
echo  Pulse cualquier boton para volver al menu principal... 
PAUSE>nul
CLS
goto menu

:crear_lista_carpetas         ::raiz ---> crear_carpeta ~Línea 52
cls
echo.
echo  Esta funcionalidad le permitira crear un conjunto de carpetas que 
echo  mantengan un mismo nombre base pero que contengan elementos diferenciadores.
echo  Por ejemplo: "Factura 1" "Factura 2" "Factura 3"
echo  o "Facturas 05-2025" "Facturas 06-2025" "Facturas 07-2025".
echo.
set /p eleccion_lista_carpetas= Desea continuar (S/N): 
if %eleccion_lista_carpetas%==S goto confirmar_lista_carpetas
if %eleccion_lista_carpetas%==s goto confirmar_lista_carpetas
if %eleccion_lista_carpetas%==N goto menu
if %eleccion_lista_carpetas%==n goto menu
echo.
echo Opcion no valida, por favor, seleccione una opcion del menu.
pause>nul
goto menu
:confirmar_lista_carpetas
echo.
set /p user_car_lista= Escriba el nombre del usuario al que le desea crear las carpetas: 
echo.
set /p ubi_car_lista= Escriba la carpeta del escritorio en la que desea crear esta lista de carpetas: 
echo.
set /p nombre_troncal= A continuacion escriba el nombre base de las carpetas: 
echo.
echo Escriba la numeracion que le desea dar a las carpetas siguiendo
set /p elementos= el siguiente formato de los ejemplos, con espacios entre cada elemento y sin comas: 1 2 3 4 5 / enero febrero marzo / 04-05-2024 07-12-2025): 
cd..
cd..
cd users
cd %user_car_lista%
cd desktop
cd %ubi_car_lista%
setlocal enabledelayedexpansion
for %%q in (%elementos%) do (
    set "folderName=!nombre_troncal!_%%q"
    md "!folderName!"
)
echo.
echo  Es posible que salga un mensaje de error, no se preocupe, las carpetas han sido exitosamente
echo  creadas en la carpeta "%ubi_car_lista%" del escritorio. En el caso de que no se hayan creado,
echo  compruebe que ha insertado los datos correctamente y que ha seguido el formato indicado.
pause>nul
goto menu

:eliminar_carpeta      ::raiz ---> menu ~Línea 13
CLS
ECHO.
ECHO  Bienvenido a la herramienta de eliminacion de carpetas!
ECHO.
ECHO   1 Disco duro C:\
ECHO   2 Escritorio
ECHO   3 Otra unidad/particion de disco
ECHO   4 Elegir directorio del Disco Local al que eliminar una carpeta.
ECHO   5 Elegir directorio del Escritorio al que eliminar una carpeta.
ECHO   6 Volver al menu
echo.
SET /P directorioeli= Seleccione la ubicacion en la que se encuentra la carpeta que desea eliminar: 
if %directorioeli%==1 goto discoduro_eli  ::~Línea 199
if %directorioeli%==2 goto escritorio_eli  ::~Línea 298
if %directorioeli%==3 goto unidad_eli_car  ::~Línea 320
if %directorioeli%==4 goto car_eli_manual_harddrive  ::~Línea 336
if %directorioeli%==5 goto car_eli_manual_desktop  ::~Línea 359
if %directorioeli%==6 goto menu
echo.
echo  Opcion no valida, por favor, seleccione una opcion del menu.
pause>nul
goto eliminar_carpeta

:discoduro_eli     ::raiz ---> eliminar_carpeta ~Línea 255
CLS
cd..
cd..
ECHO.
ECHO  Estos son los directorios detro del disco duro:
ECHO.
DIR
ECHO.
SET /P nombrecarpeta= Escriba el nombre de la carpeta que desea eliminar: 
ECHO.
RD "%nombrecarpeta%" /s
ECHO  La carpeta "%nombrecarpeta%" ha sido eliminada!
ECHO.
ECHO  Pulse cualquier boton para volver al menu principal...
pause>nul
CLS
GOTO menu

:escritorio_eli     ::raiz ---> eliminar_carpeta ~Línea 255
CLS
ECHO.
ECHO  Ha seleccionado eliminar una carpeta del escritorio.
SET /P nom_eli_arch_user= Escriba el nombre del usuario al que le desea eliminar la carpeta: 
echo.
set /P nombrecarpetaes= Escriba el nombre de la carpeta que desea eliminar:  
cd..
cd..
cd Users
cd %nom_eli_arch_user%
cd desktop
RD "%nombrecarpetaes%" /s 
:: El /s fuerza el borrado de la carpeta a pesar de que tenga contenido dentro, y pide confirmacion para ello.
echo.
ECHO  La carpeta %nombrecarpetaes% ha sido eliminada!
ECHO.
ECHO  Pulse cualquier boton para volver al menu...
pause>nul
CLS
GOTO menu

:unidad_eli_car     ::raiz ---> eliminar_carpeta ~Línea 255
CLS
echo. 
echo  Ha seleccionado eliminar una carpeta dentro de otra unidad o particion del disco.
echo.
set /p num_unidad_car_eli= Escriba la letra de la unidad/particion con la que desea trabajar:
echo.
set /p car_eli_uni= Escriba la carpeta que desea eliminar dentro de la unidad/particion %num_eli_uni% : 
%num_unidad_car_eli%:
RD %car_eli_uni% /s
echo.
echo  La carpeta "%car_eli_uni%" ha sido eliminada!
echo  Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:car_eli_manual_harddrive        ::raiz ---> eliminar_carpeta ~Línea 255
CLS
ECHO.
ECHO  Desde aquí podrá elegir una carpeta a eliminar dentro de un directorio del Disco Local.
ECHO.
ECHO  Estas son los directorios que se encuentran dentro del Disco Local:
cd..
cd..
DIR
ECHO.
SET /P directorio_selec_manual_hd= Escriba el nombre del directorio al que desea acceder: 
cd %directorio_selec_manual_hd%
ECHO  Estas son las carpetas que se encuentran dentro del directorio %directorio_selec_manual_hd%.
DIR
ECHO.
SET /P car_selec_manual_hd= Escriba el nombre de la carpeta que desea eliminar:
RD %car_selec_manual_hd%
ECHO.
ECHO  La carpeta %car_selec_manual_hd% ha sido eliminada del directorio %directorio_selec_manual_hd%!
ECHO  Pulse cualquier boton para volver al menu principal.
pause>nul
GOTO menu

:car_eli_manual_desktop        ::raiz ---> eliminar_carpeta ~Línea 255
CLS
ECHO  Ha seleccionado eliminar una carpeta dentro de un directorio del Escritorio.
ECHO.
cd..
cd..
cd Users
SET /P user_eli_car_manual_desktop= Al Escritorio de que usuario quiere acceder: 
cd %user_eli_car_manual_desktop%
cd desktop
ECHO.
ECHO  Esta son las carpetas que se encuentran en el escritorio del usuario que ha seleccionado: 
DIR
ECHO.
SET /P directorio_selec_manual_desktop= Escriba el nombre del direcotiro al que desea acceder: 
cd %directorio_selec_manual_desktop%
ECHO Estas son las carpetas dentro de %directorio_selec_manual_desktop%: 
ECHO.
DIR
SET /P car_selec_manual_d= Escriba el nombre de la carpeta que desea eliminar: 
RD %car_selec_manual_d%
ECHO.
ECHO  La carpeta %car_selec_manual_d% ha sido eliminada del directorio %directorio_selec_manual_desktop%!
ECHO.
ECHO  Pulse cualquier boton para volver al menu principal: 
pause>nul
GOTO menu

:arch_harddrive     ::raiz ---> crear_archivo ~Línea 76
cls
ECHO.
SET/P nombrearch=Escriba un nombre para el archivo: 
echo.
echo  -------------------------------------------------------------------------------
echo   A continuación, escriba lo que desee como si fuera un archivo de texto normal.
echo   El archivo se guardara automaticamente al cerrar el programa.
echo   Si desea volver al menu reinicie el programa.
echo  -------------------------------------------------------------------------------
ECHO.
cd..
cd..
COPY CON "%nombrearch%.txt"
pause>nul
GOTO menu

:arch_desktop    ::raiz ---> crear_archivo ~Línea 76
CLS
ECHO.
ECHO Ha seleccionado el escritorio como ubicacion para crear el archivo.
ECHO.
SET /P nom_user1= Escriba el nombre de su usuario: 
ECHO.
SET /P nombrearch1= Escriba el nombre que desea ponerle al archivo: 
echo.
ECHO  El archivo %nombrearch1% ha sido creado correctamente en el escritorio.
echo.
echo  ---------------------------------------------------------------------------------
echo   A continuacion, escriba lo que desee como si fuera un archivo de texto normal.
echo   El archivo se guardara automaticamente al cerrar el programa.
echo   Si desea volver al menu reinicie el programa.
echo  ---------------------------------------------------------------------------------
cd..
cd..
cd Users
cd "%nom_user1%"
cd desktop
copy con %nombrearch1%.txt
ECHO.
ECHO Pulse cualquier boton para volver al menu principal...
PAUSE>nul
GOTO menu

:arch_u     ::raiz ---> crear_archivo ~Línea 76
cls
echo.
echo Ha seleccionado otra unidad/particion para crear el archivo.
echo.
set /p letra_arch_u=Escriba la letra de la unidad en la que desea crear el archivo: 
echo.
set /p nom_arch_u=Escriba un nombre para el nuevo archivo: 
echo.
echo  ---------------------------------------------------------------------------------
echo   A continuacion, escriba lo que desee como si fuera un archivo de texto normal.
echo   El archivo se guardara automaticamente al cerrar el programa.
echo   Si desea volver al menu reinicie el programa.
echo  ---------------------------------------------------------------------------------
%letra_arch_u%:
copy con %nom_arch_u%
echo.
echo Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:crear_archharddrive  ::raiz ---> crear_archivo ~Línea 76
cls
echo
ECHO  Ha seleccionado crear un archivo dentro de una carpeta ya existente de Disco Local C.
echo
SET /P nombrecarharddrive= Escriba el nombre de la carpeta en la que desea crear el archivo: 
cd..
cd..
cd "%nombrecarharddrive%"
SET /P nombrearchharddrive= Escriba el nombre que desea ponerle al archivo dentro de la carpeta %nombrecarharddrive%
COPY CON "%nombrearchhardrive%"
echo
echo  El archivo %nombrearchharddrive% ha sido creado dentro de la carpeta %nombrecarharddrive%.
pause>nul
GOTO menu

:crear_archdesktop     ::raiz ---> crear_archivo ~Línea 76
cls
echo
echo  Ha seleccionado crear un archivo dentro de una carpeta ya existente del Escritorio.
echo  (es posible que al crearse el archivo el programa deje de responder y haya que reiniciarlo
echo  si se desea seguir trabajando con el)
echo.
SET /P nom_user_arch_d= Escriba el nombre de la cuenta de usuario: 
echo.
set /P nombrecarharddrive= Escriba el nombre de la carpeta en la que desea crear el archivo: 
echo
set /P nombrearchharddrive= Escriba el nombre que desea ponerle al archivo (extension incluida) dentro de la carpeta %nombrecarharddrive%: 
cd..
cd..
cd users
cd "%nom_user_arch_d%"
cd desktop
cd "%nombrecarharddrive%"
COPY CON "%nombrearchhardrive%"
echo.
echo El archivo %nombrearchharddrive% ha sido creado dentro de la carpeta %nombrecarharddrive%!
pause>nul
goto menu

:eliminar_archivo    ::raiz ---> menu ~Línea 13 ---------------------------------------------------------------------SEGUIR POR AQUI CON LA CORRECCION DE LINEAS---------------------------------------------------------------------------
cls
ECHO.
ECHO  Bienvenido a la herramienta de eliminacion de archivos!
ECHO.
ECHO   1 Disco duro C:\
ECHO   2 Escritorio
ECHO   3 Eliminar archivo dentro de una carpeta existente en el Disco Duro C:\
ECHO   4 Eliminar archivo dentro de una carpeta existente en el Escritorio
ECHO   5 Seleccionar archivos segun extension partiendo del Disco Duro C:\
ECHO   6 Seleccionar archivos segun extension unicamente del escritorio
echo   7 Volver al menu
echo.
SET /P directorioeli= Seleccione la ubicacion en la que se encuentra el archivo que desea eliminar: 
if %directorioeli%==1 GOTO disco_duro_eliarch  ::~Línea 518
if %directorioeli%==2 GOTO escritorio_eliarch  ::~Línea 534
if %directorioeli%==3 GOTO selec_car_eliarch_discoduro  ::~Línea 554
if %directorioeli%==4 goto selec_car_eliarch_escritorio  ::~Línea 573
if %directorioeli%==5 goto selec_eliarch_manual_harddrive  ::~Línea 828
if %directorioeli%==6 goto selec_eliarch_manual_desktop  ::~Línea 864
if %directorioeli%==7 goto menu
echo.
echo  Opcion no valida, por favor, seleccione una opcion del menu.
pause>nul
GOTO eliminar_archivo

:disco_duro_eliarch     ::raiz ---> eliminar_archivo ~Línea 492
CLS
ECHO.
ECHO  Ha seleccionado eliminar un archivo existente en la raiz del disco duro C.
ECHO.
SET /P nom_eliarch_hd= Escriba el nombre del archivo que desea eliminar (extensión incluida): 
cd..
cd..
DEL "%nom_eliarch_hd%"
ECHO.
ECHO  El archivo %nom_eliarch_hd% ha sido eliminado!
ECHO.
ECHO  Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:escritorio_eliarch        ::raiz ---> eliminar_archivo ~Línea 492
CLS
ECHO.
ECHO  Ha seleccionado eliminar un archivo existente en el escritorio.
ECHO.
SET /P user_desktop= Escriba el nombre del usuario al que le quiere eliminar el archivo: 
cd..
cd..
cd Users
cd %escritorio_eliarch%
cd Desktop
set /p nom_arch_eli_desk= Escriba el nombre del archivo que desea eliminasr (extension incluida): 
DEL "%nom_arch_eli_desk%"
ECHO.
ECHO  El archivo %nom_arch_eli_desk% ha sido eliminado!
ECHO.
ECHO  Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:selec_car_eliarch_discoduro    ::raiz ---> eliminar_archivo ~Línea 440
CLS
ECHO.
ECHO  Ha seleccionado eliminar un archivo dentro de una carpeta ya existente de Disco Local C.
ECHO.
SET /P nombrearch_eliharddrive= Escriba el nombre de la carpeta de la que desea eliminar un archivo: 
cd..
cd..
cd %nombrearch_elihardrive%
SET /P nombrearchharddrive1= Escriba el nombre del archivo que desea eliminar dentro de la carpeta %nombrearch_eliharddrive%
DEL %nombrearchhardrive1%
ECHO.
ECHO  El archivo %nombrearchharddrive1% ha sido eliminado dentro de la carpeta %nombrearch_eliharddrive%!
ECHO.
ECHO  Pulse cualquier boton para volver al menu principal...
pause>nul
CLS
GOTO menu

:selec_car_eliarch_escritorio    ::raiz ---> eliminar_archivo ~Línea 440
CLS
ECHO.
ECHO  Ha seleccionado eliminar un archivo dentro de una carpeta ya existente del Escritorio.
ECHO.
SET /P nombre_carpeta_archeli_escritorio= Escriba el nombre de la carpeta en la que desea crear el archivo: 
cd escritorio
cd %nombre_carpeta_archeli_escritorio%
SET /P nombrearch_escritorio= Escriba el nombre del archivo que desea eliminar dentro de la carpeta %nombre_carpeta_archeli_escritorio%: 
DEL %nombrearch_escritorio%
ECHO.
ECHO  El archivo %nombrearchharddrive% ha sido creado dentro de la carpeta %nombrecarharddrive%!
pause>nul
GOTO menu

:renombrar_car   ::raiz ---> menu ~Línea 13
CLS
ECHO.
ECHO   1 Renombrar carpeta del Disco Duro 
ECHO   2 Renombrar carpeta del Escritorio
echo   3 Renombrar carpeta en otra unidad/particion
ECHO   4 Renombrar directorio dentro de una carpeta del Disco Duro
ECHO   5 Renombrar directorio dentro de una carpeta del Escritorio
ECHO   6 Volver al menu
ECHO.
SET /P opcionren= Seleccione donde se encuentra la carpeta que desea renombrar: 
if %opcionren%==1 GOTO renombrar_car_discoduro  ::~Línea 609
if %opcionren%==2 GOTO renombrar_car_desktop  ::~Línea 630
if %opcionren%==3 GOTO renombrar_car_unidad  ::~Línea 659
if %opcionren%==4 GOTO renombrar_car_dentrodiscoduro  ::~Línea 677
if %opcionren%==5 GOTO renombrar_car_dentrodesktop  ::~Línea 697
if %opcionren%==6 GOTO menu
echo.
echo  Opcion no valida, por favor, seleccione una opcion del menu.
goto renombrar_car

:renombrar_car_discoduro     ::raiz ---> renombrar_car ~Línea 588
CLS
ECHO.
ECHO  Estos son los directorios que se encuentran dentro del disco duro.
ECHO.
cd..
cd..
dir
echo.
SET /P antiguo_nom_car= Escriba el nombre de la carpeta que desea renombrar: 
ECHO.
SET /P nuevo_nom_car= Escriba el nuevo nombre de la carpeta seleccionada: 
echo.
REN "%antiguo_nom_car%" "%nuevo_nom_car%"
ECHO.
ECHO  La carpeta %antiguo_nom_car% ha sido renombrada a %nuevo_nom_car%!
ECHO.
ECHO  Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:renombrar_car_desktop     ::raiz ---> renombrar_car ~Línea 588
CLS
ECHO.
ECHO  Ha seleccionado renombrar una carpeta dentro del escritorio.
ECHO  (Es probable que le salga un mensaje de error al completar el cambio de nombre, 
ECHO  ignorelo)
ECHO.
SET /P nom_user_ren_car_desk= Escriba el nombre del usuario: 
echo.
cd..
cd..
cd Users
cd %nom_user_ren_car_desk%
cd desktop
dir
echo.
echo  Estas son las carpetas y archivos que se encuentran en el escritorio del usuario %nom_user_ren_car_desk%.
ECHO.
SET /P antiguo_nom_car_es= Escriba el nombre de la carpeta que desea renombrar: 
ECHO.
SET /P nuevo_nom_car_es= Escriba el nuevo nombre de la carpeta seleccionada: 
REN "%antiguo_nom_car_es%" "%nuevo_nom_car_es%"
ECHO.
ECHO  La carpeta %antiguo_nom_car_es% ha sido renombrada a %nuevo_nom_car_es%!
ECHO.
ECHO  Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:renombrar_car_unidad      ::raiz ---> renombrar_car ~Línea 588
CLS
echo.
echo  Ha seleccionado renombrar una carpeta dentro de otra unidad/particion.
echo.
set /p letra_unidad= Escriba la letra de la unidad/particion con la que desea trabajar: 
echo.
set /p nom_car_ren_o= Escriba el nombre de la carpeta que desea renombrar: 
echo. 
set /p nom_car_ren_n= Escriba el nuevo nombre para la carpeta: 
%letra_unidad%:
REN %nom_car_ren_o% %nom_car_ren_n%
echo.
echo  La carpeta %nom_car_ren_o% ha sido renombrada a %nom_car_ren_n%.
echo  Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu 

:renombrar_car_dentrodiscoduro      ::raiz ---> renombrar_car ~Línea 588
CLS
ECHO.
ECHO  Ha seleccionado renombrar una carpeta dentro de un directorio del Disco Duro.
ECHO.
SET /P car_directorio= Seleccione el directorio del disco duro en el que se encuentra la carpeta que desea renombrar: 
cd..
cd..
cd %car_directorio%
SET /P car_directorio_renom1= Seleccione la carpeta que desea renombrar dentro de %car_directorio%: 
ECHO.
SET /P car_directorio_renom2= Escriba el nuevo nombre para la carpeta %car_directorio_renom1: 
REN "%car_directorio_renom1%" "%car_directorio_renom2%"
ECHO.
ECHO  La carpeta %car_directorio_renom1% ha sido renombrada a %car_directorio_renom2%!
ECHO.
ECHO  Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:renombrar_car_dentrodesktop        ::raiz ---> renombrar_car ~Línea 588
CLS
ECHO.
ECHO  Ha seleccionado renombrar una carpeta dentro de un directorio del Escritorio.
ECHO.
SET /P user_name_renom_car_desktop= Escriba el nombre del usuario al que le desea renombrar la carpeta: 
ECHO.
echo Esta son las carpetas dentro del escritorio del usuario %user_name_renom_car_desktop%
cd..
cd..
cd Users
cd %user_name_renom_car_desktop%
cd desktop
dir
SET /P ubi_car_ren= Escriba el nombre de la carpeta a la que desea entrar: 
cd %ubi_car_ren%
dir
echo.
echo Estas son las carpetas que se encuentran dentro del directorio %ubi_car_ren%
ECHO.
SET /P antiguo_nom_car_es= Escriba el nombre de la carpeta que desea renombrar: 
ECHO.
SET /P nuevo_nom_car_es= Escriba el nuevo nombre de la carpeta seleccionada: 
REN "%antiguo_nom_car_es%" "%nuevo_nom_car_es%"
ECHO.
ECHO  La carpeta %antiguo_nom_car_es% ha sido renombrada a %nuevo_nom_car_es%!
ECHO.
ECHO  Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:ver_directorios      ::raiz ---> menu ~Línea 13 
CLS
ECHO.
ECHO   1 Disco duro
ECHO   2 Escritorio
ECHO   3 Otra unidad
ECHO   4 Ver arbol completo de directorios
echo   5 Ver usuarios
echo   6 Volver al menu principal
ECHO.
SET /P ver_carpetas_de= Seleccione de que directorio desea ver las carpetas existentes: 
if %ver_carpetas_de%==1 goto directorios_ver_discoduro  ::~Línea 674
if %ver_carpetas_de%==2 goto directorios_ver_escritorio  ::~Línea 692
if %ver_carpetas_de%==3 goto directorios_ver_unidad  ::~Línea 715
if %ver_carpetas_de%==4 goto ver_arbol_completo  ::~Línea 734
if %ver_carpetas_de%==5 goto ver_usuarios  ::~Línea 747
if %ver_carpetas_de%==6 goto menu
echo.
echo  Opcion no valida, por favor, seleccione una opcion del menu.
pause>nul
goto ver_directorios

:directorios_ver_discoduro      ::raiz ---> ver_directorios ~Línea 728
CLS
cd..
cd..
DIR
ECHO.
SET /P nombre_busqueda_manual_direc_hd= Escriba el nombre de un archivo o carpeta para ver si se encuentra en esta lista de directorios: 
ECHO. 
if not exist "%nombre_busqueda_manual_direc_hd%" echo El directorio "%nombre_busqueda_manual_direc_hd%" no se encuentra en este directorio.
if exist "%nombre_busqueda_manual_direc_hd%" echo El directorio "%nombre_busqueda_manual_direc_hd%" se encuentra en este directorio.
ECHO.
for /F "tokens=1" %%y in ('dir %nombre_busqueda_manual_direc_hd% ^| find "/"') do (
 echo El directorio %nombre_busqueda_manual_direc_hd% fue creado el %%y
)
pause>nul
GOTO menu

:directorios_ver_escritorio    ::raiz ---> ver_directorios ~Línea 728
CLS
ECHO.
SET /P user_direc_desktop= Escriba el nombre del usuario al que le quiere ver los directorios del escritorio: 
cd..
cd..
cd Users
cd %user_direc_desktop%
cd desktop
DIR
ECHO.
SET /P nombre_busqueda_manual_direc_d= Escriba el nombre de un archivo o carpeta para ver si se encuentra en esta lista de directorios: 
ECHO.
if not exist "%nombre_busqueda_manual_direc_d%" echo La carpeta/archivo "%nombre_busqueda_manual_direc_d%" no se encuentra en este directorio.
if exist "%nombre_busqueda_manual_direc_d%" echo La carpeta/archivo "%nombre_busqueda_manual_direc_d%" se encuentra en este directorio.
ECHO.
for /F "tokens=1" %%z in ('dir %nombre_busqueda_manual_direc_d% ^| find "/"') do (
 echo El archivo %nombre_busqueda_manual_direc_d% fue creado el %%z
)
pause>nul
GOTO menu

:directorios_ver_unidad       ::raiz ---> ver_directorios ~Línea 728
CLS
ECHO.
SET /P nom_unidad_direc= Escriba la letra de la unidad/particion de la que desea ver los directorios: 
ECHO.
%nom_unidad_direc%:
dir
SET /P nombre_busqueda_manual_direc_u= Escriba el nombre de un archivo o carpeta para ver si se encuentra en esta lista de directorios: 
ECHO.
if not exist "%nombre_busqueda_manual_direc_u%" echo La carpeta/archivo "%nombre_busqueda_manual_direc_u%" no se encuentra en este directorio.
if exist "%nombre_busqueda_manual_direc_u%" echo La carpeta/archivo "%nombre_busqueda_manual_direc_u%" se encuentra en este directorio.
ECHO.
for /F "tokens=1" %%t in ('dir %nombre_busqueda_manual_direc_u% ^| find "/"') do (
 echo El archivo %nombre_busqueda_manual_direc_u% fue creado el %%t
)
pause>nul
goto menu

:ver_arbol_completo       ::raiz ---> ver_directorios ~Línea 728
cd..
cd..
tree
echo.
Set /p nom_busc_dir_tree= Escriba el nombre de un archivo o carpeta para si se encuentra en esta lista de directorios: 
echo.
if not exist "%nom_busc_dir_tree%" echo La carpeta "%nom_busc_dir_tree%" no se pudo encontrar, asegurese de que esta bien escrito. Para busqueda mas precisa use el explorador de Windows.
if exist "%nom_busc_dir_tree%" echo La carpeta "%nom_busc_dir_tree%" existe. Para busqueda mas precisa use el explorador de Windows.
pause>nul
GOTO menu

:ver_usuarios       ::raiz ---> ver_directorios ~Línea 728
echo.
echo  Estos son los usuarios que se encuentran en este equipo: 
net user
echo.
echo  Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:selec_eliarch_manual_harddrive    ::raiz ---> eliminar_archivo ~Línea 440
CLS
ECHO.
ECHO  Bienvenido a la herramienta de seleccion manual de archivos a eliminar.
ECHO.
ECHO  Esto eliminara TODOS los archivos de la extension especificada
ECHO  partiendo de la raiz del disco duro y de todos sus directorios.
echo  Continue solo si esta seguro de que desea realizar esta accion.
ECHO.
set /P seguridad_eliarch= Si desea continuar pulse 1; si quiere volver al menu, pulse 2: 
if %seguridad_eliarch%==1 goto confirm_eliarch
if %seguridad_eliarch%==2 goto menu
if %seguridad_eliarch%==8 echo  El 8 no esta cerca ni del 1 ni del 2, dele a una de estas 2 opciones por favor ;)
echo.
echo Opcion no valida, por favor, seleccione una opcion del menu.
pause>nul
goto selec_eliarch_manual_harddrive 
:confirm_eliarch
echo.
set /P extension_eli= Escriba la extension de los archivos a eliminar: 
echo.
echo  eliminando... 
echo  Esta accion puede tardar unos minutos
set "harddrive_eli_m"=%C:\"
setlocal enabledelayedexpansion
for /R C:\ %%f in ("*.%extension_eli%") do (
    echo Moviendo a la papelera de reciclaje...
    move "%%f" "C:\Recycle Bin" > nul
)
ECHO.
ECHO  Todos los archivos .%extension_eli% del Disco Duro han sido eliminados.
ECHO.
ECHO  Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:selec_eliarch_manual_desktop        ::raiz ---> eliminar_archivo ~Línea 411
CLS
ECHO.
ECHO   1 PDF's                                2 JPG's
ECHO   3 PNG's                                4 GIF's
ECHO   5 JPG's y PNG's                        6 DOCX
echo   7 MP3                                  8 MP4
echo   9 Volver al menu principal
echo
ECHO.
ECHO   Advertencia: Esto eliminara todos los archivos de la extension seleccionada de forma permanente
echo   solo del escritorio, no de los directorios que en el se encuentren.
ECHO.
SET /P tipo_archeli_manual_desktop= Seleccione la extensión de los archivos que desea eliminar: 
if %tipo_archeli_manual_desktop%==1 goto eli_pdfs_manual_desktop  ::~Línea 892
if %tipo_archeli_manual_desktop%==2 goto eli_jpgs_manual_desktop  ::~Línea 908
if %tipo_archeli_manual_desktop%==3 goto eli_pngs_manual_desktop  ::~Línea 924
if %tipo_archeli_manual_desktop%==4 goto eli_gifs_manual_desktop  ::~Línea 940
if %tipo_archeli_manual_desktop%==5 goto eli_jpgspngs_manual_desktop ::~Línea 956
if %tipo_archeli_manual_desktop%==6 goto eli_docx_manual_desktop  ::~Línea 972
if %tipo_archeli_manual_desktop%==7 goto eli_mp3_manual_desktop  ::~Línea 988
if %tipo_archeli_manual_desktop%==8 goto eli_mp4_manual_desktop  ::~Línea 1004
if %tipo_archeli_manual_desktop%==9 goto menu  ::~Línea 13
ECHO.
echo  Opcion no valida, por favor, seleccione una opcion del menu.
pause>nul
goto selec_eliarch_manual_desktop

:eli_pdfs_manual_desktop     ::raiz ---> selec_eliarch_manual_desktop ~Línea 864  
CLS
ECHO.
SET /P %USERPROFILE%= Escriba el nombre del usuario al que le desea borrar los archivos: 
set "escritorio=%USERPROFILE%\Desktop"
for %%f in ("%escritorio%\*.pdf") do (
    echo Moviendo a la papelera de reciclaje...
    move "%%f" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\SendTo\Recycle Bin" > nul
)
ECHO.
ECHO  Los archivos .PDF del escritorio han sido movidos a la papelera de reciclaje.
ECHO.
ECHO  Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:eli_jpgs_manual_desktop       ::raiz ---> selec_eliarch_manual_desktop ~Línea 864
CLS
ECHO.
SET /P %USERPROFILE%=Escriba el nombre del usuario al que le quiere borrar los archivos: 
set "escritorio=%USERPROFILE%\Desktop"
for %%f in ("%escritorio%\*.jpg") do (
    echo Moviendo a la papelera de reciclaje...
    move "%%f" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\SendTo\Recycle Bin" > nul
)
ECHO.
ECHO Los archivos .JPG del escritorio han sido movidos a la papelera de reciclaje.
ECHO.
ECHO Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:eli_pngs_manual_desktop        ::raiz ---> selec_eliarch_manual_desktop ~Línea 864
CLS
ECHO.
SET /P %USERPROFILE%=Escriba el nombre del usuario al que le quiere borrar los archivos: 
set "escritorio=%USERPROFILE%\Desktop"
for %%f in ("%escritorio%\*.png") do (
    echo Moviendo a la papelera de reciclaje...
    move "%%f" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\SendTo\Recycle Bin" > nul
)
ECHO.
ECHO Los archivos .PNG del escritorio han sido movidos a la papelera de reciclaje.
ECHO.
ECHO Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:eli_gifs_manual_desktop      ::raiz ---> selec_eliarch_manual_desktop ~Línea 864
CLS
ECHO.
SET /P %USERPROFILE%=Escriba el nombre del usuario al que le quiere borrar los archivos: 
set "escritorio=%USERPROFILE%\Desktop"
for %%f in ("%escritorio%\*.gif") do (
    echo Moviendo a la papelera de reciclaje...
    move "%%f" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\SendTo\Recycle Bin" > nul
)
ECHO.
ECHO Los archivos .GIF del escritorio han sido movidos a la papelera de reciclaje.
ECHO.
ECHO Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:eli_jpgspngs_manual_desktop        ::raiz ---> selec_eliarch_manual_desktop ~Línea 864
cls
ECHO.
SET /P %USERPROFILE%=Escriba el nombre del usuario al que le quiere borrar los archivos: 
set "escritorio=%USERPROFILE%\Desktop"
for %%f in ("%escritorio%\*.jpg, *.png") do (
    echo Moviendo a la papelera de reciclaje...
    move "%%f" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\SendTo\Recycle Bin" > nul
)
ECHO.
ECHO Los archivos .PDF y .PNG del escritorio han sido movidos a la papelera de reciclaje.
ECHO.
ECHO Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:eli_docx_manual_desktop          ::raiz ---> selec_eliarch_manual_desktop ~Línea 864
cls
ECHO.
SET /P %USERPROFILE%=Escriba el nombre del usuario al que le quiere borrar los archivos: 
set "escritorio=%USERPROFILE%\Desktop"
for %%f in ("%escritorio%\*.docx") do (
    echo Moviendo a la papelera de reciclaje...
    move "%%f" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\SendTo\Recycle Bin" > nul
)
ECHO.
ECHO Los archivos .DOCX del escritorio han sido movidos a la papelera de reciclaje.
ECHO.
ECHO Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:eli_mp3_manual_desktop            ::raiz ---> selec_eliarch_manual_desktop ~Línea 864
cls
ECHO.
SET /P %USERPROFILE%=Escriba el nombre del usuario al que le quiere borrar los archivos: 
set "escritorio=%USERPROFILE%\Desktop"
for %%f in ("%escritorio%\*.mp3") do (
    echo Moviendo a la papelera de reciclaje...
    move "%%f" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\SendTo\Recycle Bin" > nul
)
ECHO.
ECHO Los archivos .mp3 del escritorio han sido movidos a la papelera de reciclaje.
ECHO.
ECHO Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:eli_mp4_manual_desktop        ::raiz ---> selec_eliarch_manual_desktop ~Línea 864
cls
echo.
SET /P %USERPROFILE%=Escriba el nombre del usuario al que le quiere borrar los archivos: 
set "escritorio=%USERPROFILE%\Desktop"
for %%f in ("%escritorio%\*.mp4") do (
    echo Moviendo a la papelera de reciclaje...
    move "%%f" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\SendTo\Recycle Bin" > nul
)
ECHO.
ECHO Los archivos .mp4 del escritorio han sido movidos a la papelera de reciclaje.
ECHO.
ECHO Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:mover_car     ::raiz ---> menu ~Línea 13
CLS
ECHO.
echo Esta funcion le permite mover una carpeta a otra carpeta.
echo Importante: Escriba los nombres de las carpetas origen y destino con tildes incluidas en el caso de que proceda.
echo.
ECHO   1 Disco Duro
ECHO   2 Escritorio
echo   3 Otra unidad/particion
ECHO   4 Volver al menu principal
ECHO.
SET /P mover_car_direc_or=Especifique en cual de los siguientes directorios se encuentra la carpeta que desea mover: 
echo.
echo   1 Disco Duro
echo   2 Escritorio
echo   3 Otra unidad/particion
echo   4 Volver al menu principal
set /p mover_car_direc_des=Especifique donde se encuentra la carpeta destino: 
if %mover_car_direc_or%%mover_car_direc_des%==11 goto mover_car_hd_a_hd  ::~Línea 1054
if %mover_car_direc_or%%mover_car_direc_des%==12 goto mover_car_hd_a_d  ::~Línea 1076
if %mover_car_direc_or%%mover_car_direc_des%==13 goto mover_car_hd_a_u  ::~Línea 1095
if %mover_car_direc_or%%mover_car_direc_des%==21 goto mover_car_d_a_hd  ::~Línea 1115
if %mover_car_direc_or%%mover_car_direc_des%==22 goto mover_car_d_a_d  ::~Línea 1117
if %mover_car_direc_or%%mover_car_direc_des%==23 goto mover_car_d_a_u  ::~Línea 1151
if %mover_car_direc_or%%mover_car_direc_des%==31 goto mover_car_u_a_hd  ::~Línea 1169
if %mover_car_direc_or%%mover_car_direc_des%==32 goto mover_car_u_a_d  ::~Línea 1186
if %mover_car_direc_or%%mover_car_direc_des%==33 goto mover_car_u_a_u  ::~Línea 1205
if %mover_car_direc_or%==4 goto menu
if %mover_car_direc_des%==4 goto menu
echo.
echo Opcion no valida, por favor seleccione una opcion del menu.
pause>nul
goto mover_car

:mover_car_hd_a_hd      ::raiz ---> mover_car ~Línea 1020
CLS
echo.
cd..
cd..
dir
echo.
echo Estas son las carpetas y archivos dentro de la raiz del disco local.
echo.
set /p nom_car_mov_or_hd_a_hd=Escriba el nombre de la carpeta que desea mover: 
echo.
set /p nom_car_mov_des_hd_a_hd=Escriba el nombre de la carpeta destino: 
cd..
cd..
move "%nom_car_mov_or_hd_a_hd%" "%nom_car_mov_des_hd_a_hd%"
echo.
echo La/s carpeta/s %nom_car_mov_or_hd_a_hd% ha sido movida a la carpeta %nom_car_mov_des_hd_a_hd%.
echo.
echo Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:mover_car_hd_a_d        ::raiz ---> mover_car ~Línea 1020
cls
echo.
set /p nom_car_mov_or_hd_a_d=Escriba el nombre de la carpeta que desea mover: 
echo.
set /p nom_user_mov_car=Escriba el nombre del usuario donde se encuentra la carpeta destino: 
echo.
set /p nom_car_mov_des_hd_a_d=Escriba el nombre de la carpeta destino: 
echo.
cd..
cd..
move "%nom_car_mov_or_hd_a_d%" "c:\Users\%nom_user_mov_car%\desktop\%nom_car_mov_des_hd_a_d%"
echo.
echo Se ha movido la carpeta %nom_car_mov_or_hd_a_d% a la carpeta %nom_car_mov_des_hd_a_d%.
echo.
echo Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:mover_car_hd_a_u      ::raiz ---> mover_car ~Línea 1020
cls
echo.
set /p nom_car_mov_or_hd_a_u=Escriba el nombre de la carpeta que desea mover: 
echo.
set /p nom_u_hd_a_u=Escriba la letra de la unidad/particion de la carpeta destino: 
echo.
set /p nom_car_mov_des_hd_a_u=Escriba el nombre de la carpeta destino: 
echo.
cd..
cd..
move "%nom_car_mov_or_hd_a_u%" "%nom_u_hd_a_u%:\%nom_car_mov_des_hd_a_u%"
echo.
echo Salvo que el programa indique error:
echo Se ha movido la carpeta %nom_car_mov_or_hd_a_u% a la carpeta destino en la unidad %nom_u_hd_a_u%.
echo.
echo Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:mover_car_d_a_hd       ::raiz ---> mover_car ~Línea 1020
CLS
echo.
set /p nom_user_mov_d_a_hd=Escriba el nombre del usuario al que le desea mover la carpeta: 
echo.
set /p nom_car_mov_or_d_a_hd=Escriba el nombre de la carpeta del escritorio que desea mover: 
echo.
set /p nom_car_mov_des_d_a_hd=Escriba el nombre de la carpeta destino: 
move "c:\Users\%nom_user_mov_d_a_hd%\desktop\%nom_car_mov_or_d_a_hd%" "c:\%nom_car_mov_des_d_a_hd%"
echo.
echo La carpeta %nom_car_mov_or_d_a_hd% ha sido movida a la carpeta destino.
echo.
echo Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:mover_car_d_a_d         ::raiz ---> mover_car ~Línea 1020
cls
echo.
echo Esta funcion le permite mover una carpeta existente en el escritorio a otra dentro de ella.
echo.
set /p nom_user_mov_d_a_d=Escriba el nombre del usuario que contiene las carpetas: 
echo.
set /p nom_car_mov_or_d_a_d=Escriba el nombre de la carpeta que desea mover: 
echo.
set /p nom_user_des_d_a_d=Escriba el nombre del usuario destino: 
echo.
set /p nom_car_mov_des_d_a_d=Escriba el nombre de la carpeta destino: 
move "c:\users\%nom_user_mov_d_a_d%\desktop\%nom_car_mov_or_d_a_d%" "c:\users\%nom_user_des_d_a_d%\nom_car_mov_des_d_a_d%"
echo.
echo La carpeta %nom_car_mov_or_d_a_d% ha sido movida a la carpeta destino.
echo.
echo Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:mover_car_d_a_u     ::raiz ---> mover_car ~Línea 1020
CLS
echo.
set /p nom_user_mov_d_a_u=Escriba el nombre del usuario que contiene la carpeta: 
echo.
set /p nom_car_mov_or_d_a_u=Escriba el nombre de la carpeta que desea mover: 
echo.
set /p nom_u_mov_d_a_u=Escriba la letra de la unidad/particion destino: 
echo.
set /p nom_car_mov_des_d_a_u=Escriba el nombre de la carpeta destino: 
move "c:\users\%nom_user_mov_d_a_u%\desktop\%nom_car_mov_or_d_a_u%" "%nom_u_mov_d_a_u%:\%nom_car_mov_des_d_a_u%"
echo.
echo La carpeta "%nom_car_mov_or_d_a_u%" ha sido movido a la carpeta destino de %nom_u_mov_d_a_u%.
echo.
echo Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:mover_car_u_a_hd      ::raiz ---> mover_car ~Línea 1020
cls
echo.
set /p nom_u_mov_u_a_hd=Escriba la letra de la unidad/particion con la que desea trabajar: 
echo.
set /p nom_car_mov_u_a_hd=Escriba la letra dentro de %nom_u_mov_u_a_hd% que desea mover:
echo.
echo Escriba la carpeta destino dentro del disco duro a la que desea mover la carpeta "%nom_car_mov_u_a_hd%",
set /p nom_car_des_u_a_hd=si desea moverla a la raiz del disco duro pulse Enter: 
echo.
move "%nom_u_mov_u_a_hd%:\%nom_u_mov_u_a_hd%" "c:\%nom_car_mov_u_a_hd%"
echo Salvo que haya salido un mensaje de error, la carpeta origen ha sido movida a la carpeta destino.
echo.
echo Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:mover_car_u_a_d      ::raiz ---> mover_car ~Línea 1020
cls
echo.
set /p nom_u_mov_u_a_d=Escriba la letra de la unidad/particion con la que desea trabajar: 
echo.
set /p nom_car_mov_u_a_d=Escriba el nombre de la carpeta dentro de la unidad %nom_u_mov_u_a_d% que desea mover: 
echo.
set /p nom_user_mov_u_a_d=Escriba el nombre del usuario destino: 
echo.
echo Escriba el nombre de la carpeta destino dentro del escritorio del usuario "%nom_user_mov_u_a_d%",
set /p nom_car_mov_u_a_d=si desea mover la carpeta a la raiz del escritorio pulse Enter: 
echo.
move "%nom_u_mov_u_a_d%:\%nom_car_mov_u_a_d%" c:\users\%nom_user_mov_u_a_d%\desktop\%nom_car_mov_u_a_d%
echo Salvo que haya salido un mensaje de error, la carpeta especificada ha sido movida a la carpeta destino.
echo.
echo Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:mover_car_u_a_u      ::raiz ---> mover_car ~Línea 1020
cls
echo.
set /p nom_u_mov_u_a_u=Escriba la letra de la unidad/particion con la que desea trabajar: 
echo.
set /p nom_car_mov_u_a_u=Escriba el nombre de la carpeta que desea mover: 
echo.
set /p nom_ud_u_a_u=Escriba el nombre de la unidad/particion destino: 
echo.
echo Escriba el nombre de la carpeta destino, o si desea mover la carpeta %nom_car_mov_u_a_u% a la raiz
set /p nom_car_mov_u_a_u_d=de la unidad %nom_ud_u_a_u%, pulse Enter: 
move "%nom_u_mov_u_a_u%:\%nom_car_mov_u_a_u%" "%nom_ud_u_a_u%:\%nom_car_mov_u_a_u_d%"
echo.
echo Salvo que haya salido un mensaje de error, la carpeta especificada ha sido movida a la carpeta destino.
echo.
echo Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:mover_car_hd      ::raiz ---> mover_car ~Línea 1020
ECHO.
ECHO Ha elegido el disco duro como ubicación.
cd..
cd..
DIR
ECHO.
SET /P mover_car_1=Escriba el nombre de la carpeta que desea mover: 
ECHO.
SET /P mover_car_2=Escriba el nombre de la carpeta a la que la desea mover: 
MOVE "%mover_car_1%" "%mover_car_2%"
ECHO.
ECHO La carpeta "%mover_car_1%" se ha movido a "%mover_car_2%"!
echo.
echo Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:mover_car_desktop   ::raiz ---> mover_car ~Línea 1020
ECHO.
ECHO Ha elegido el escritorio como ubicación.
cd..
cd..
DIR
ECHO.
SET /P nom_user_mov_car=Escriba el nombre del usuario al que le quiere mover la carpeta: 
ECHO.
SET /P nom_car_mov_desktop1=Escriba el nombre de la carpeta que desea mover: 
ECHO.
SET /P nom_car_mov_desktop2=Escriba el nombre de la carpeta al que la desea mover:
cd Users
cd %nom_user_mov_car%
cd desktop 
MOVE "%nom_car_mov_desktop1%" "%nom_car_mov_desktop2%"
ECHO.
ECHO La carpeta %nom_car_mov_desktop1% ha sido movida a %nom_car_mov_desktop2%!
ECHO.
ECHO Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:mover_arch     ::raiz ---> menu ~Línea 13
CLS
ECHO.
ECHO   1 Disco Duro
ECHO   2 Escritorio
echo   3 Otra unidad/particion
echo   4 Mover archivos segun extension unicamente del escritorio
echo   5 Mover archivos segun extension partiendo desde el disco local
ECHO   6 Volver al menu principal
ECHO.
SET /P mover_car_direc=Especifique en cual de los siguientes directorios se encuentra el archivo que desea mover: 
if %mover_car_direc%==1 GOTO mover_arch_hd   ::~Línea 1287
if %mover_car_direc%==2 GOTO mover_arch_desktop  ::~Línea 1303
if %mover_car_direc%==3 goto mover_arch_u  ::~Línea 1324
if %mover_car_direc%==4 goto mover_segun_ext  ::~Línea 1347
if %mover_car_direc%==5 goto mover_segun_ext_hd  ::~Línea 1518
if %mover_car_direc%==6 goto menu
echo.
echo Opcion no valida, por favor, seleccione una opcion del menu.
pause>nul
goto mover_arch

:mover_arch_hd      ::raiz ---> mover_arch ~Línea 1251
CLS
ECHO. 
cd..
cd..
SET /P mover_arch_1=Escriba el nombre del archivo que desea mover (respetando acentuacion y extension incluida): 
ECHO.
SET /P mover_arch_2=Escriba el nombre de la carpeta al que desea mover el archivo %mover_arch_1%: 
MOVE "%mover_arch_1%" "%mover_arch_2%"
ECHO.
ECHO El archivo %mover_arch_1% ha sido movido a la carpeta %mover_arch_2%!
ECHO.
echo Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:mover_arch_desktop      ::raiz ---> mover_arch ~Línea 1251
CLS
ECHO.
SET /P user_move_arch= Escriba el nombre del usuario al que le quiere mover el archivo: 
ECHO.
SET /P mover_arch_1= Escriba el nombre del archivo que desea mover (extension incluida): 
ECHO.
cd..
cd..
cd Users
cd %user_move_arch%
cd desktop
SET /P mover_arch_2=Escriba el nombre de la carpeta al que desea mover el archivo %mover_arch_1%: 
MOVE "%mover_arch_1%" "%mover_arch_2%"
ECHO.
ECHO El archivo %mover_arch_1% ha sido movido a la carpeta %mover_arch_2%!
ECHO.
echo Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:mover_arch_u            ::raiz ---> mover_arch ~Línea 1251
cls
echo.
echo ESTA OPCION ACTUALMENTE SE ENCUENTRA FUERA DE FUNCIONAMIENTO.
echo.
set /p nom_u_mov= Escriba la letra de la unidad/particion en la que se encuentra el archivo que desea mover: 
echo.
set /p car_u_mov= En que carpeta se encuentra el archivo? Si se encuentra en la raiz de la unidad, pulse enter: 
echo.
set /p nom_arch_mov= Indique el nombre del archivo (extension incluida): 
echo.
set /p nom_user_mov_u= Escriba el nombre del usuario destinatario del archivo: 
echo.
set /p nom_car_mov_u= Escriba el nombre de la carpeta a donde desea mover el archivo: 
echo.
move "%nom_u_mov%:\%car_u_mov%" "c:\users\%nom_user_mov_u%\desktop\%nom_car_mov_u%"
echo El archivo %nom_arch_mov% ha sido movido al lugar de destino.
echo.
echo Pulse cualquier boton para volver al menu principal...
pause>NUL
goto menu
:: ----------------------------------------------------------------------------------------------------------------------PROBAR, NO VA----------------------------------------------------------------------------------------------------

:mover_segun_ext        ::raiz ---> menu ~Línea 13
cls
echo.
ECHO   1 PDF's                                2 JPG's
ECHO   3 PNG's                                4 GIF's
ECHO   5 JPG's y PNG's                        6 DOC
echo   7 MP3                                  8 MP4
echo   9 Volver al menu principal
echo.
echo.
SET /P ext_mover= Seleccione la extensión de los archivos que desea mover: 
if %ext_mover%==1 goto mover_ext_pdf  ::~Línea 13072
if %ext_mover%==2 goto mover_ext_jpg  ::~Línea 1390
if %ext_mover%==3 goto mover_ext_png  ::~Línea 1408
if %ext_mover%==4 goto mover_ext_gif  ::~Línea 1436
if %ext_mover%==5 goto mover_ext_jpgs_pngs  ::~Línea 1444
if %ext_mover%==6 goto mover_ext_doc  ::~Línea 1462
if %ext_mover%==7 goto mover_ext_mp3  ::~Línea 1480
if %ext_mover%==8 goto mover_ext_mp4  ::~Línea 1498
if %ext_mover%==9 goto menu  ::~Línea 13
echo.
echo  Opcion no valida, porfavor, seleccione una opcion del menu.
pause>nul
goto mover_segun_ext

:mover_ext_pdf       ::raiz ---> mover_segun_ext ~Línea 1347
CLS
echo.
SET /P %username_ext%= Escriba el nombre del usuario al que le mover los archivos: 
echo.
set /p nom_car_mov_ext= Escriba el nombre de la carpeta a donde desea mover los archivos: 
set "escritorio_ext=C:\%username_ext%\Desktop"
for %%y in ("%escritorio_ext%\*.pdf") do (
    echo Moviendo archivos pdf...
    move "%%y" "c:\%username_ext%\desktop\%nom_car_mov_ext%" > nul
)
echo.
echo  Los archivos .pdf han sido movidos a la carpeta %nom_car_mov_ext%!
echo.
echo  Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:mover_ext_jpg           ::raiz ---> mover_segun_ext ~Línea 1347
CLS
echo.
SET /P %username_ext%= Escriba el nombre del usuario al que le mover los archivos: 
echo.
set /p nom_car_mov_ext= Escriba el nombre de la carpeta a donde desea mover los archivos: 
set "escritorio_ext=C:\%username_ext%\Desktop"
for %%y in ("%escritorio_ext%\*.jpg") do (
    echo Moviendo archivos jpg...
    move "%%y" "c:\%username_ext%\desktop\%nom_car_mov_ext%" > nul
)
echo.
echo  Los archivos .jpg han sido movidos a la carpeta %nom_car_mov_ext%!
echo.
echo  Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:mover_ext_png             ::raiz ---> mover_segun_ext ~Línea 1347
CLS
echo.
SET /P %username_ext%= Escriba el nombre del usuario al que le mover los archivos: 
echo.
set /p nom_car_mov_ext= Escriba el nombre de la carpeta a donde desea mover los archivos: 
set "escritorio_ext=C:\%username_ext%\Desktop"
for %%y in ("%escritorio_ext%\*.png") do (
    echo Moviendo archivos png...
    move "%%y" "c:\%username_ext%\desktop\%nom_car_mov_ext%" > nul
)
echo.
echo  Los archivos .png han sido movidos a la carpeta %nom_car_mov_ext%!
echo.
echo  Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:mover_ext_gif           ::raiz ---> mover_segun_ext ~Línea 1347
CLS
echo.
SET /P %username_ext%= Escriba el nombre del usuario al que le mover los archivos: 
echo.
set /p nom_car_mov_ext= Escriba el nombre de la carpeta a donde desea mover los archivos: 
set "escritorio_ext=C:\%username_ext%\Desktop"
for %%y in ("%escritorio_ext%\*.gif") do (
    echo Moviendo archivos gif...
    move "%%y" "c:\%username_ext%\desktop\%nom_car_mov_ext%" > nul
)
echo.
echo Los archivos .pdf han sido movidos a la carpeta %nom_car_mov_ext%!
echo.
echo Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:mover_ext_jpgs_pngs              ::raiz ---> mover_segun_ext ~Línea 1347
CLS
echo.
SET /P %username_ext%= Escriba el nombre del usuario al que le mover los archivos: 
echo.
set /p nom_car_mov_ext= Escriba el nombre de la carpeta a donde desea mover los archivos: 
set "escritorio_ext=C:\%username_ext%\Desktop"
for %%y in ("%escritorio_ext%\*.jpg, *.png") do (
    echo  Moviendo archivos .jpg y .png...
    move "%%y" "c:\%username_ext%\desktop\%nom_car_mov_ext%" > nul
)
echo.
echo Los archivos .jpg y .png han sido movidos a la carpeta %nom_car_mov_ext%!
echo.
echo Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:mover_ext_doc           ::raiz ---> mover_segun_ext ~Línea 1347
CLS
echo.
SET /P %username_ext%= Escriba el nombre del usuario al que le mover los archivos: 
echo.
set /p nom_car_mov_ext= Escriba el nombre de la carpeta a donde desea mover los archivos: 
set "escritorio_ext=C:\%username_ext%\Desktop"
for %%y in ("%escritorio_ext%\*.doc") do (
    echo Moviendo archivos doc...
    move "%%y" "c:\%username_ext%\desktop\%nom_car_mov_ext%" > nul
)
echo.
echo  Los archivos .doc han sido movidos a la carpeta %nom_car_mov_ext%!
echo.
echo  Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:mover_ext_mp3             ::raiz ---> mover_segun_ext ~Línea 1347
cls
echo.
SET /P %username_ext%= Escriba el nombre del usuario al que le mover los archivos: 
echo.
set /p nom_car_mov_ext= Escriba el nombre de la carpeta a donde desea mover los archivos: 
set "escritorio_ext=C:\%username_ext%\Desktop"
for %%y in ("%escritorio_ext%\*.mp3") do (
    echo Moviendo archivos mp3...
    move "%%y" "c:\%username_ext%\desktop\%nom_car_mov_ext%" > nul
)
echo.
echo  Los archivos .mp3 han sido movidos a la carpeta %nom_car_mov_ext%!
echo.
echo  Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:mover_ext_mp4           ::raiz ---> mover_segun_ext ~Línea 1347
CLS
echo.
SET /P %username_ext%= Escriba el nombre del usuario al que le mover los archivos: 
echo.
set /p nom_car_mov_ext= Escriba el nombre de la carpeta a donde desea mover los archivos: 
set "escritorio_ext=C:\%username_ext%\Desktop"
for %%y in ("%escritorio_ext%\*.mp4") do (
    echo Moviendo archivos mp4...
    move "%%y" "c:\%username_ext%\desktop\%nom_car_mov_ext%" > nul
)
echo.
echo  Los archivos .mp4 han sido movidos a la carpeta %nom_car_mov_ext%!
echo.
echo  Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu



:mover_segun_ext_hd      ::raiz ---> mover_arch ~Línea 1204
echo.
echo  Importante: Esto movera TODOS los archivos de la extension seleccionada 
echo  partiendo desde la raiz del disco local, esto podria afectar de forma
echo  indeseada a algunas carpetas.
echo.
set /p confirmar_mov_ext= Esta seguro de querer realizar esta accion? (S/N): 
if %confirmar_mov_ext%==S goto confirmado_movarch
if %confirmar_mov_ext%==s goto confirmado_movarch
if %confirmar_mov_ext%==N goto menu
if %confirmar_mov_ext%==n goto menu
echo.
echo  Opcion no valida, porfavor, escriba S (Si) o N (No) segun lo que desee hacer.
pause>nul
goto mover_segun_ext_hd
:confirmado_movarch
cls
echo.
set /p ext_arch_mover= Escriba la extension de los archivos que desea mover: 
echo.
set /p user_arch_mov_hd= Escriba el nombre del usuario con la carpeta destino: 
echo.
set /p car_mov_ext_hd= Escriba el nombre de la carpeta del escritorio al que desea mover los archivos: 
echo.
echo Moviendo archivos... 
echo Esta accion puede tardar unos minutos...
set "harddrive_eli_m"=%C:\"
setlocal enabledelayedexpansion
for /R C:\ %%k in ("*.%ext_arch_mover%") do (
    echo Moviendo archivos .%ext_arch_mover%...
    move "%%k" "C:\users\%user_arch_mov_hd%\desktop\%car_mov_ext_hd%" > nul
)
echo.
echo Los archivos .%ext_arch_mover% han sido movidos a la carpeta %car_mov_ext_hd%!
echo.
echo Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:renombrar_arch        ::raiz ---> menu ~Línea 13
CLS
ECHO.
ECHO   1 Renombrar archivo en el Disco Duro 
ECHO   2 Renombrar archivo en el Escritorio
ECHO   3 Renombrar archivo dentro de una carpeta del Disco Duro
ECHO   4 Renombrar archivo dentro de una carpeta del Escritorio
ECHO   5 Volver al menu
ECHO.
SET /P opcionren=Seleccione donde se encuentra la carpeta que desea renombrar: 
if %opcionren%==1 GOTO renom_arch_discoduro  ::~Línea 1577
if %opcionren%==2 GOTO renom_arch_desktop  ::~Línea 1595
if %opcionren%==3 GOTO renom_arch_dentrodiscoduro  ::~Línea 1618
if %opcionren%==4 GOTO renom_arch_dentrodesktop  ::~Línea 1638
if %opcionren%==5 GOTO menu
echo.
echo Opcion no valida, por favor, seleccione una opcion del menu.
pause>nul
goto renombrar_arch

:renom_arch_discoduro     ::raiz ---> renombrar_arch ~Línea 1557
CLS
ECHO.
ECHO  Ha seleccionado renombrar un archivo dentro del disco duro.
ECHO.
SET /P antiguo_nom_arch= Escriba el nombre de la carpeta que desea renombrar: 
ECHO.
SET /P nuevo_nom_arch= Escriba el nuevo nombre de la carpeta seleccionada: 
cd..
cd..
REN "%antiguo_nom_arch%" "%nuevo_nom_arch%"
ECHO.
ECHO La carpeta %antiguo_nom_arch% ha sido renombrada a %nuevo_nom_arch%!
ECHO.
ECHO Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:renombrar_arch_desktop          ::raiz ---> renombrar_arch ~Línea 1557
cls
echo.
ECHO  Ha seleccionado renombrar un archivo dentro del escritorio.
ECHO.
SET /P nom_user_ren_arch_es= Escriba el nombre del usuario al que le desea renombrar el archivo: 
ECHO.
SET /P antiguo_nom_car_es= Escriba el nombre de la carpeta que desea renombrar: 
ECHO.
SET /P nuevo_nom_car_es= Escriba el nuevo nombre de la carpeta seleccionada: 
cd..
cd..
cd Users
cd %nom_user_ren_arch_es%
cd desktop
REN "%antiguo_nom_arch_es%" "%nuevo_nom_arch_es%"
ECHO.
ECHO El archivo %antiguo_nom_arch_es% ha sido renombrado a %nuevo_nom_arch_es%!
ECHO.
ECHO Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:renombrar_arch_dentrodiscoduro          ::raiz ---> renombrar_arch ~Línea 1557
CLS
ECHO.
ECHO  Ha seleccionado renombrar un archivo dentro de un directorio del Disco Duro.
ECHO.
SET /P car_directorio= Seleccione el directorio del disco duro en el que se encuentra la carpeta que desea renombrar: 
cd..
cd..
cd %arch_directorio%
SET /P arch_directorio_renom1= Seleccione el archivo que desea renombrar dentro de %arch_directorio%: 
ECHO.
SET /P arch_directorio_renom2= Escriba el nuevo nombre para la carpeta %car_directorio_renom1
REN "%arch_directorio_renom1%" "%arch_directorio_renom2%"
ECHO.
ECHO  El nombre se ha cambiado correctamente.
echo.
echo  Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:renombrar_arch_dentrodesktop         ::raiz ---> renombrar_arch ~Línea 1557
CLS
ECHO.
ECHO  Ha seleccionado renombrar un archivo dentro de un directorio del Escritorio.
ECHO.
SET /P user_name_renom_arch_desktop= Escriba el nombre del usuario al que le desea renombrar el archivo: 
ECHO.
SET /P ubi_arch_ren= Escriba el nombre de la carpeta a la que desea entrar: 
ECHO
SET /P antiguo_nom_arch_es= Escriba el nombre del archivo que desea renombrar (extension incluida): 
ECHO.
SET /P nuevo_nom_arch_es= Escriba el nuevo nombre del archivo seleccionado (extension incluida): 
cd..
cd..
cd Users
cd %user_name_renom_arch_desktop%
cd desktop
cd %ubi_arch_ren%
ECHO.
ECHO  Esta es la lista de carpetas y archivos que se encuentran en %ubi_arch_ren%:
DIR
ECHO.
SET /P antiguo_nom_arch_es= Escriba el nombre del archivo que desea renombrar (extension incluida): 
ECHO.
SET /P nuevo_nom_arch_es= Escriba el nuevo nombre del archivo seleccionado (extension incluida):
REN "%antiguo_nom_arch_es%" "%nuevo_nom_arch_es%"
ECHO.
ECHO  El archivo %antiguo_nom_arch_es% ha sido renombrado a %nuevo_nom_arch_es%!
ECHO.
ECHO  Pulse cualquier boton para volver al menu principal...
pause>nul
GOTO menu

:crear_copy_seguridad      ::raiz ---> menu ~Línea 13
CLS
echo.
echo  1 Hacer copia total
echo  2 Hacer copia de carpeta a seleccionar
echo  3 Volver al menu
echo.
set /p elec_crear_copy=Seleccione una opcion: 
if %elec_crear_copy%==1 goto crear_copy_seguridad_total  ::~línea 1687
if %elec_crear_copy%==2 goto crear_copy_seguridad_car  ::~Línea 1817
if %elec_crear_copy%==3 goto menu  ::~Línea 13
echo.
echo  Opcion no valida, por favor, seleccione una opcion del menu.
pause>NUL
goto crear_copy_seguridad

:crear_copy_seguridad_total         raiz ---> crear_copy_seguridad ~Línea 1655
CLS
echo.
echo  Esta funcion le permitira hacer una copia total de todas las carpetas y archivos del directorio
echo  que seleccione. Util si desea hacer una copia de seguridad en una unidad externa.
echo  Si la carpeta en la que indique que desea hacer la copia no existe, se creara ;) 
echo.
echo   1 Disco duro C:
echo   2 Escritorio
echo   3 Otra unidad/particion
echo   4 Volver al menu 
echo.
set /p elec_op_seg_total1= Seleccione el directorio del que desea hacer una copia de seguridad: 
echo.
echo   1 Disco duro C:
echo   2 Escritorio
echo   3 Otra unidad/particion 
echo   4 Volver al menu
echo.
set /p elec_op_seg_total2=Seleccione ubicacion destino o volver al menu: 
if %elec_op_seg_total1%%elec_op_seg_total2%==13 goto copy_total_hd_u  ::~Línea 1721
if %elec_op_seg_total1%%elec_op_seg_total2%==23 goto copy_total_d_u  ::~Línea 1737
if %elec_op_seg_total1%%elec_op_seg_total2%==33 goto copy_total_u_u  ::~Línea 1753
if %elec_op_seg_total1%==4 goto menu
if %elec_op_seg_total2%==4 goto menu
if %elec_op_seg_total1%%elec_op_seg_total2%==44 goto menu
if %elec_op_seg_total1%%elec_op_seg_total2%==31 goto copy_total_u_hd  ::~Línea 1767
if %elec_op_seg_total1%%elec_op_seg_total2%==32 goto copy_total_u_d  ::~Línea 1781
if %elec_op_seg_total1%%elec_op_seg_total2%==22 goto copy_total_d_d  ::~Línea 1799
echo.
echo Opcion no valida, por favor, seleccione una de las opciones del menu.
pause>nul
goto crear_copy_seguridad_total

:copy_total_hd_u        ::raiz ---> crear_copy_seguridad_total ~Línea 1687
cls
echo.
set /p nom_u_copy_total=Escriba la letra de la unidad/particion de destino: 
echo.
cd..
cd..
robocopy c:\ %nom_u_copy_total%:\ /e /z /b /mt /z
rem Los parámetros /e /z /b /mt /z aplican cada uno una configuración específica para modificar el funcionamiento del comando robocopy,
rem creo que los únicos que sirven para que en esta opcion funcione bien el robocopy son el /mt y /z, pero por si acaso no tocaría ninguno.
echo Se ha hecho una copia total del disco local a la unidad %nom_u_copy%.
echo.
echo Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:copy_total_d_u       ::raiz ---> crear_copy_seguridad_total ~Línea 1687
cls
echo.
set /p nom_user_copy_d_u= Escriba el nombre del usuario al que desea hacerle la copia: 
echo.
set /p nom_u_copy_d_u= Escriba la letra de la unidad/particion de destino: 
echo.
set /p nom_car_des_ct_d_u= Escriba el nombre de la carpeta en la que desea hacer la copia: 
robocopy c:\users\%nom_user_copy_d_u%\desktop %nom_u_copy_d_u%:\%nom_car_des_ct_d_u% /e /z /b /mt /z
echo.
echo  Se ha creado una copia del escritorio del usuario %nom_user_copy_d_u% en la unidad %nom_u_copy_d_u%.
echo.
echo  Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:copy_total_u_u         ::raiz ---> crear_copy_seguridad_total ~Línea 1687
cls
echo.
set /p copy_u_u1= Escriba la letra de la unidad/particion que desea copiar: 
echo.
set /p copy_u_u2= Escriba la letra de la unidad/particion destino: 
echo.
robocopy %copy_u_u1%:\ %copy_u_u2%:\ /e /z /b /mt /z
echo  Se he hecho una copia total de la unidad %copy_u_u1% en %copy_u_u2%.
echo.
echo  Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:copy_total_u_hd         ::raiz ---> crear_copy_seguridad_total ~Línea 1687
cls
echo.
set /p copy_u_hd= Escriba la letra de la unidad/particion que desea copiar: 
echo.
set /p copy_car_u_hd= Escriba la carpeta del disco local en la que desea realizar esta copia: 
echo.
robocopy %copy_u_hd%:\ "c:\%copy_car_u_hd%" /e /z /b /mt /z
echo  Se ha copiado el contenido de "%copy_u_hd%" a la carpeta "%copy_car_u_hd%" del Disco Duro.
echo.
echo  Pulse cualquier boton para volver al menu principal...
pause>nul
goto MENU

:copy_total_u_d          ::raiz ---> crear_copy_seguridad_total ~Línea 1687               ---------------------------------------------------------------------------NO FUNCIONA----------------------------------------------------------------
CLS
echo.
set /p copy_u_d= Escriba la letra de la unidad/particion que desea copiar: 
echo.
set /p copy_user_u_d= Escriba el nombre del usuario destinatario de la copia: 
echo.
set /p nom_car_u_d= Escriba el nombre de la carpeta destino (si no existe se creara): 
xcopy "%copy_u_d%:\" "C:\users\%copy_user_u_d%\desktop\%nom_car_u_d%" /e /k /o /v /t /g
echo.
echo  La unidad %copy_u_d% ha sido copiada a la carpeta "%nom_car_u_d%" en el escritorio del usuario %copy_user_u_d%.
echo.
echo  Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu 

:copy_total_d_d          ::raiz ---> crear_copy_seguridad_total ~Línea 1687          ---------------------------------------------------------------------------NO FUNCIONA----------------------------------------------------------------
cls
echo.
echo ESTA HERRAMIENTA AHORA MISMO NO FUNCIONA, ESTAMOS TRABAJANDO INCANSABLEMENTE PARA SOLUCIONARLO
echo.
set /p copy_user1_d_d= Escriba el nombre del usuario origen: 
echo.
set /p copy_user2_d_d= Escriba el nombre del usario destino: 
echo.
set /p copy_car_d_d= Escriba la carpeta destino dentro del escritorio del usuario %copy_user2_d_d%:
robocopy c:\users\%copy_user1_d_d%\desktop "c:\users\%copy_user2_d_d%\desktop\%copy_car_d_d%" /e /z /mt       ::otros parametros: /e /mt /z /mir
echo.
echo  El escritorio del usuario %copy_user1_d_d% ha sido copiado en la carpeta "%copy_car_d_d%" del usuario %copy_car_d_d%.
echo.
echo  Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:crear_copy_seguridad_car       ::raiz ---> crear_copy_seguridad ~Línea 1671
CLS
ECHO.
ECHO  Esta funcion le permitira copiar el contenido de una carpeta (y todos sus directorios)
echo  a otra, para usarla como copia de seguridad o simplemente como forma de transferir carpetas y archivos.
echo  Si la carpeta destino no existe, se creara automaticamente ;)
ECHO.
ECHO   1 Disco Duro C:\
ECHO   2 Escritorio
ECHO   3 Otra unidad
ECHO   4 Volver al menu
echo.
SET /P ubi_copy_seguridad= Seleccione donde se encuentra la carpeta que desea copiar: 
echo.
ECHO   1 Disco Duro C:\
ECHO   2 Escritorio
ECHO   3 Otra unidad
ECHO   4 Volver al menu
echo.
set /p ubi_des_copy_seguridad= Seleccione donde se encuentra la carpeta destino: 
if %ubi_copy_seguridad%%ubi_des_copy_seguridad%==11 goto copy_seguridad_hd_a_hd  ::~Línea 1854
if %ubi_copy_seguridad%%ubi_des_copy_seguridad%==12 goto copy_seguridad_hd_a_d  ::~Línea 1869
if %ubi_copy_seguridad%%ubi_des_copy_seguridad%==13 goto copy_seguridad_hd_a_u  ::~Línea 1902
if %ubi_copy_seguridad%%ubi_des_copy_seguridad%==21 goto copy_seguridad_d_a_hd  ::~Línea 1919
if %ubi_copy_seguridad%%ubi_des_copy_seguridad%==22 goto copy_seguridad_d_a_d  ::~Línea 1886
if %ubi_copy_seguridad%%ubi_des_copy_seguridad%==23 goto copy_seguridad_d_a_u  ::~Línea 1935
if %ubi_copy_seguridad%%ubi_des_copy_seguridad%==31 goto copy_seguridad_u_a_hd  ::~Línea 1953
if %ubi_copy_seguridad%%ubi_des_copy_seguridad%==32 goto copy_seguridad_u_a_d  ::~Línea 1969
if %ubi_copy_seguridad%%ubi_des_copy_seguridad%==33 goto copy_seguridad_u_a_u  ::~Línea 1987
if %ubi_copy_seguridad%%ubi_des_copy_seguridad%==69 echo 69 no era una opcion... Pero ojala lo fuera.
if %ubi_copy_seguridad%==4 goto menu
if %ubi_des_copy_seguridad%==4 goto menu
echo.
echo  Opcion no valida, por favor, seleccione una opcion del menu.
pause>nul
goto crear_copy_seguridad_car

:copy_seguridad_hd_a_hd   ::raiz ---> crear_copy_seguridad_car ~Línea 1817
CLS
ECHO.
set /p nom_car_orhd= Escriba la carpeta que desea copiar: 
ECHO.
set /p nom_car_deshd= Escriba la carpeta/directorio de destino: 
ECHO.
robocopy "c:\%nom_car_orhd%" "C:\%nom_car_deshd%" /Z /E /copyall
ECHO.
echo  Se ha hecho una copia de %nom_car_orhd% en %nom_car_desd%.
echo.
ECHO  Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:copy_seguridad_hd_a_d     ::raiz ---> crear_copy_seguridad ~Línea 1817
cls
echo.
set /p nom_user_copy_hd_a_d= Escriba el nombre del usuario al que le quiere crear la copia: 
echo.
set /p nom_car_or_hd_a_d= Escriba el nombre de la carpeta que desea copiar: 
echo.
set /p nom_car_des_hd_a_d= Escriba el nombre de la carpeta destino: 
robocopy "c:\%nom_car_or_hd_a_d%" "c:\users\%nom_user_copy_hd_a_d%\desktop\%nom_car_des_hd_a_d%" /z /e /copyall
echo.
echo  Se ha hecho una copia de %nom_car_or_hd_a_d% a %nom_car_des_hd_a_d%.
echo.
echo  Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu


:copy_seguridad_d_a_d    ::raiz ---> crear_copy_seguridad ~Línea 1817
CLS
ECHO.
SET /P nom_user_copy= Escriba el nombre de usuario al que le quiere crear la copia: 
ECHO.
set /p nom_car_ord= Escriba la carpeta que desea copiar: 
ECHO.
set /p nom_car_desd= Escriba la carpeta/directorio de destino para realizar la copia: 
ECHO.
robocopy "c:\users\%nom_user_copy%\desktop\%nom_car_ord%" "c:\users\%nom_user_copy%\desktop\%nom_car_desd%" /z /e /COPYALL
ECHO.
echo  Se ha hecho una copia de %nom_car_ord% en %nom_car_desd%.
ECHO  Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:copy_seguridad_hd_a_u    ::raiz ---> crear_copy_seguridad ~Línea 1817
CLS
echo.
set /p nom_or_hd_a_u= Escriba el nombre de la carpeta que desea copiar: 
echo.
set /p nom_u_hd_a_u= Escriba la letra de la unidad/particion de destino: 
echo.
set /p nom_des_hd_a_u= Escriba el nombre de la carpeta de destino: 
echo.
robocopy "c:\%nom_or_hd_a_u%" "%nom_u_hd_a_u%:\%nom_des_hd_a_u%" /z /e /copyall
echo.
echo  Se ha hecho una copia de %nom_or_hd_a_u% a %nom_des_hd_a_u% en la unidad/particion %nom_u_hd_a_u%:.
echo.
echo  Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:copy_seguridad_d_a_hd    ::raiz ---> crear_copy_seguridad ~Línea 1817
CLS
echo.
set /p nom_user_copy_d_a_hd= Escriba el nombre del usuario en el que se encuentra la carpeta a copiar: 
echo.
set /p nom_car_or_d_a_hd= Escriba el nombre de la carpeta que desea copiar: 
echo.
set /p nom_car_des_d_a_hd= Escriba el nombre de la carpeta destino: 
robocopy "c:\users\%nom_user_copy_d_a_hd%\desktop\%nom_car_or_d_a_hd%" "c:\%nom_car_des_d_a_hd%" /z /e /copyall
echo.
echo  Se ha hecho una copia de %nom_car_or_d_a_hd% a %nom_car_des_d_a_hd%.
echo.
echo  Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:copy_seguridad_d_a_u    ::raiz ---> crear_copy_seguridad ~Línea 1817
cls
echo.
set /p user_copy_d_a_u= Escriba el nombre del usuario del que desea crear la copia: 
echo.
set /p nom_or_copy_d_a_u= Escriba el nombre de la carpeta a copiar: 
echo.
set /p nom_u_d_a_u= Escriba la letra de la unidad/particion en la que desea crear la copia: 
echo.
set /p nom_car_des_d_a_u= Escriba el nombre de la carpeta de %nom_u_d_a_u%: en el que crear la copia: 
echo.
robocopy "C:\users\%user_copy_d_a_u%\desktop\%nom_or_copy_d_a_u%" "%nom_u_d_a_u%:\%nom_car_des_d_a_u%" /z /e /copyall
echo  Se ha hecho una copia de la carpeta origen en la carpeta destino.
echo.
echo  Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:copy_seguridad_u_a_hd     ::raiz ---> crear_copy_seguridad ~Línea 1817
CLS
echo.
set /p nom_unit=Escriba la letra de la unidad/particion en la que se encuentra la carpeta a copiar: 
echo.
set /p nom_car_or_u_a_hd=Escriba el nombre de la carpeta que desea copiar: 
echo.
set /p nom_des_u_a_hd=Escriba el nombre de la carpeta destino: 
robocopy "%nom_unit%:\%nom_car_or_u_a_hd%" "c:\%nom_des_u_a_hd%" /z /e /copyall
echo.
echo Se ha hecho una copia de la carpeta origen en la carpeta destino.
echo.
echo Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:copy_seguridad_u_a_d     ::raiz ---> crear_copy_seguridad ~Línea 1817
CLS
echo.
set /p nom_unit_u_a_d=Escriba la letra de la unidad/particion en la que se encuentra la carpeta a copiar: 
echo.
set /p nom_car_or_u_a_d=Escriba el nombre de la carpeta que desea copiar: 
echo.
set /p nom_user_u_a_d=Escriba el nombre del usuario al que le desea crear la copia: 
echo.
set /p nom_car_des_u_a_d=Escriba el nombre de la carpeta destino: 
robocopy "%nom_unit_u_a_d%:\%nom_car_or_u_a_d%" "c:\users\%nom_user_u_a_d%\desktop\%nom_car_des_u_a_d%" /z /e /copyall
echo.
echo Se ha hecho una copia de la carpeta origen en la carpeta destino.
echo.
echo Pulse cualquier boton para volver al menu principal...
pause>nul
goto menu

:copy_seguridad_u_a_u      ::raiz ---> crear_copy_seguridad ~Línea 1817
CLS
ECHO.
SET /p nom_uni_copy_seguridad=Escriba la letra de la unidad/particion con la que desea trabajar: 
ECHO.
SET /P nom_car_or_u=Escriba la carpeta que desea copiar: 
ECHO.
SET /p nom_car_des_u=Escriba la carpeta/directorio de destino para realizar la copia: 
ECHO.
%nom_uni_copy_seguridad%:
robocopy "%nom_uni_copy_seguridad%:\%nom_car_or_u%" "%nom_uni_copy_seguridad%:\%nom_car_des_u%" /Z /E /COPYALL
ECHO.
ECHO Se ha hecho una copia de "%nom_car_or_u%" en "%nom_car_des_u%".
ECHO Pulse cualquier boton para volver al menu principal...
ECHO.
pause>nul
goto menu

:menu_ayuda
CLS
echo.
echo  --------------Recuerde ejecutar este programa como administrador para su correcto funcionamiento--------------
echo.
echo  Aqui podra ver las funcionalidades y caracteristicas de cada herramienta que le proporciona este programa.
echo.
echo   1 Crear carpeta              2 Crear archivo
echo   3 Eliminar carpeta           4 Eliminar archivo
echo   5 Renombrar carpeta          6 Renombrar archivo
echo   7 Mover carpeta              8 Mover archivo
echo   9 Crear copia de seguridad   0 Ver directorios
echo.
echo             11 Volver al menu principal
echo.
set /p eleccion_ayuda= Escoja una opcion del menu para ver sus caracteristicas: 
if %eleccion_ayuda%==1 goto ayuda_crear_carpeta
if %eleccion_ayuda%==2 goto ayuda_crear_archivo
if %eleccion_ayuda%==3 goto ayuda_eliminar_carpeta
if %eleccion_ayuda%==4 goto ayuda_eliminar_archivo
if %eleccion_ayuda%==5 goto ayuda_renom_car
if %eleccion_ayuda%==6 goto ayuda_renom_arch
if %eleccion_ayuda%==7 goto ayuda_mov_car
if %eleccion_ayuda%==8 goto ayuda_mov_arch
if %eleccion_ayuda%==9 goto ayuda_crear_copy
if %eleccion_ayuda%==0 goto ayuda_ver_direc
if %eleccion_ayuda%==11 goto menu
echo.
echo Opcion no valida, por favor, seleccione una opcion del menu.
goto %menu_ayuda%

:ayuda_crear_carpeta
cls
echo.
echo  En el menu de creacion de carpeta se contemplan las siguientes opciones:
echo.
echo.
echo   1. Crear carpeta en Disco Duro C:\  
echo.
echo  Esta opcion le permitira crear una carpeta con el nombre que elija
echo  en la raiz del disco local haciendo uso del comando MD,
echo  equivalente al comando MKDIR.
echo.
echo.
echo   2. Crear carpeta en el escritorio
echo.
echo  Podra crear una carpeta en el escritorio elijiendo el usuario al que crearsela,
echo  independientemente del usuario con el que este ejecutando el programa. Esta opcion 
echo  tambien hace uso del comando MD.
echo.
echo.
echo   3. Crear carpeta en otra unidad/particion
echo.
echo.
echo  Aqui podra crear una carpeta en una unidad externa o particion del disco duro.
echo  Tenga en cuenta que necesita ingresar la letra de la unidad, si no la conoce, puede
echo  verla en el explorador de archivos, junto al nombre de la unidad en cuestion y con el
echo  siguiente formato "UnidadDeEjemplo(X):". Solo con escribir la letra en el apartado que 
echo  se le solicita basta. Comando usado:MD.
echo.
echo.
echo   4. Crear carpeta en un directorio del Disco Duro C:\
echo.
echo  De esta forma podra crear una carpeta en un directorio que se encuentre en 
echo  la raiz del disco local. Tenga en cuenta que al escribir el nombre del directorio
echo  destino debera respetar los simbolos y acentuacion si precediera, para ello se puede
echo  servir de la lista de directorios que le aparecera.
echo  Para mostrar los directorios se utiliza el comando DIR, y para la creacion de la carpeta
echo  el comando MD.
echo.
echo. 
echo   5. Crear carpeta en un directorio del Escritorio
echo.
echo  Con esta funcion podra crear una carpeta dentro de un directorio existente
echo  en el escritorio de un usuario, independientemente del usuario con el que este ejecutando
echo  el programa. Podra servirse de los directorios del usuario seleccionado que se le muestran
echo  como ayuda. Comandos usados:DIR, MD.
echo.
echo.
echo   6. Crear lista de carpetas
echo.
echo  Esta opcion le permitira crear una sucesion de carpetas que mantengan un mismo nombre base pero
echo  con algun elemento que las distinga entre ellas (Ejemplo: "Factura 1" "Factura 2" Factura 3") en
echo  el escritorio de cualquier usuario. El programa le pedira que ingrese un factor distintivo de su
echo  eleccion, creando tantas carpetas como elementos haya escrito.
echo  Es probable que le salga un mensaje de error diciendo "Ruta no encontrada", no se preocupe, las
echo  carpetas se habran creado exitosamente. En el caso de que no se hayan creado, compruebe que ha
echo  rellenado todos los campos correctamente. Comandos usados: SETLOCAL, FOR, MD.
echo.
echo.
echo  Pulse cualquier boton para volver al menu de ayuda...
pause>nul
goto menu_ayuda

:ayuda_crear_archivo
cls
echo.
echo  En el menu de creacion de archivos se contemplan las siguientes opciones:
echo.
echo.
echo   1. Crear archivo en Disco Duro C:\  
echo.
echo  Esta opcion le permitira crear un archivo con el nombre que elija
echo  en la raiz del disco local haciendo uso del comando COPY CON.
echo  Dentro de la propia opcion tiene otras indicaciones de interes.
echo.
echo.
echo   2. Crear archivo en el escritorio
echo.
echo  Podra crear un archivo en el escritorio elijiendo el usuario al que crearselo,
echo  independientemente del usuario con el que este ejecutando el programa. Esta opcion 
echo  tambien hace uso del comando COPY CON. Dentro de la propia opcion tiene otras
echo  indicaciones de interes.
echo.
echo.
echo   3. Crear archivo en otra unidad/particion
echo.
echo  Aqui podra crear un archivo en una unidad externa o particion del disco duro.
echo  Tenga en cuenta que necesita ingresar la letra de la unidad, si no la conoce, puede
echo  verla en el explorador de archivos, junto al nombre de la unidad en cuestion y con el
echo  siguiente formato "UnidadDeEjemplo(X):". Solo con escribir la letra en el apartado que 
echo  se le solicita basta. Comando usado:COPY CON.
echo.
echo.
echo   4. Crear carpeta en un directorio del Disco Duro C:\
echo.
echo  De esta forma podra crear una carpeta en un directorio que se encuentre en 
echo  la raiz del disco local. Tenga en cuenta que al escribir el nombre del directorio
echo  destino debera respetar los simbolos y acentuacion si precediera, para ello se puede
echo  servir de la lista de directorios que le aparecera.
echo  Comando: COPY CON.
echo.
echo. 
echo   5. Crear archivo en un directorio del Escritorio
echo.
echo  Con esta funcion podra crear un archivo dentro de un directorio existente
echo  en el escritorio de un usuario, independientemente del usuario con el que este ejecutando
echo  el programa. Comando: COPY CON.
echo.
echo.
echo  Pulse cualquier boton para volver al menu de ayuda...
pause>nul
goto menu_ayuda

:ayuda_eliminar_carpeta
cls
echo.
echo  En el menu de eliminación de carpetas se contemplan las siguientes opciones:
echo.
echo.
echo   1. Eliminar carpeta en Disco Duro C:\  
echo.
echo  Esta opcion le permitira eliminar una carpeta de su eleccion que se encuentre
echo  en la raiz del disco local. Podra usar la lista de directorios que se muestran
echo  para elegir cual eliminar. Tenga en cuenta los simbolos y acentuaciones a la hora
echo  de rellenar los campos. Esta funcion se apoya en el comando RD y el parametro /s
echo  para FORZAR LA ELIMINACION de la carpeta, por lo que tenga sumo CUIDADO con la
echo  carpeta que desea eliminar. De todas formas se le pedira confirmacion.
echo.
echo.
echo   2. Eliminar carpeta en el escritorio
echo.
echo  Podra eliminar una carpeta de su eleccion que se encuentre en el escritorio
echo  de un usuario cualquiera, independientemente del usuario que se encuentre ejecutando
echo  el programa. Tenga en cuenta los simbolos y acentuaciones a la hora de
echo  rellenar los campos. Esta funcion se apoya en el comando RD y el parametro /s
echo  para FORZAR LA ELIMINACION de la carpeta, por lo que tenga sumo CUIDADO con la
echo  carpeta que desea eliminar. De todas formas se le pedira confirmacion.
echo.
echo.
echo   3. Eliminar carpeta en otra unidad/particion
echo.
echo  Aqui podra eliminar una carpeta en una unidad externa o particion del disco duro.
echo  Tenga en cuenta que necesita ingresar la letra de la unidad, si no la conoce, puede
echo  verla en el explorador de archivos, junto al nombre de la unidad en cuestion y con el
echo  siguiente formato "UnidadDeEjemplo(X):". Solo con escribir la letra en el apartado que 
echo  se le solicita basta. Esta funcion se apoya en el comando RD y el parametro /s
echo  para FORZAR LA ELIMINACION de la carpeta, por lo que tenga sumo CUIDADO con la
echo  carpeta que desea eliminar. De todas formas, se le pedira confirmacion.
echo.
echo.
echo   4. Eliminar carpeta de un directorio del disco duro C:\
echo.
echo  De esta forma podra eliminar una carpeta en un directorio que se encuentre en 
echo  la raiz del disco local. Tenga en cuenta que al escribir el nombre del directorio
echo  destino debera respetar los simbolos y acentuacion si procediera, para ello se puede
echo  servir de la lista de directorios que le aparecera. Esta funcion se apoya en el comando
echo  RD y el parametro /s para FORZAR LA ELIMINACION de la carpeta, por lo que tenga sumo
echo  CUIDADO con la carpeta que desea eliminar. De todas formas, se le pedira confirmacion. 
echo.
echo.
echo   5. Eliminar carpeta en un directorio del Escritorio
echo.
echo  Con esta funcion podra eliminar una carpeta dentro de un directorio existente
echo  en el escritorio de un usuario, independientemente del usuario con el que este ejecutando
echo  el programa. Esta funcion se apoya en el comando RD y el parametro /s para FORZAR LA ELIMINACION
echo  de la carpeta, por lo que tenga sumo CUIDADO con la carpeta que desea eliminar. De todas formas,
echo  se le pedira confirmacion. 
echo.
echo.
echo Pulse cualquier boton para volver al menu de ayuda...
pause>nul
goto menu_ayuda

:ayuda_eliminar_archivo
cls
echo.
echo  En el menu de eliminación de archivos se contemplan las siguientes opciones:
echo.
echo.
echo   1. Eliminar archivo en Disco Duro C:\  
echo.
echo  Esta opcion le permitira eliminar un archivo de su eleccion que se encuentre
echo  en la raiz del disco local. Debera escribir el nombre del archivo a eliminar con 
echo  la extension incluida. Si no esta seguro de la extension del archivo, puede activar 
echo  la opcion "ver extension" en el menu "ver" del explorador de archivos de Windows.
echo  Tenga precaucion al eliminar el archivo. Comando: DEL.
echo.
echo.
echo   2. Eliminar archivo en el escritorio
echo.
echo  Podra eliminar un archivo de su eleccion que se encuentre en el escritorio de
echo  cualquier usuario, independientemente de quien este ejecutando el programa.
echo  Debera escribir el nombre del archivo a eliminar con la extension de archivo
echo  incluida. Si no esta seguro de la extension del archivo, puede activar la opcion 
echo  "ver extension" en el menu "ver" del explorador de archivos de Windows.
echo  Comando: DEL.
echo.
echo.
echo   3. Eliminar archivo de un directorio del disco duro C:\
echo.
echo  De esta forma podra eliminar un archivo en un directorio que se encuentre en
echo  la raiz del disco local. Tenga en cuenta que al escribir el nombre del directorio
echo  destino debera respetar los simbolos y acentuacion si procediera. Tenga precaucion
echo  al eliminar el archivo. Comando: DEL.
echo.
echo.
echo   4. Eliminar archivo en un directorio del Escritorio
echo.
echo  De esta forma podra eliminar un archivo en un directorio que se encuentre en
echo  el escritorio de cualquier usuario, independientemente del usuario que ejecute
echo  el programa. Tenga en cuenta que al escribir el nombre del directorio destino
echo  debera respetar los simbolos y acentuacion si procediera. Tenga precaucion
echo  al eliminar el archivo. Comando: DEL.
echo.
echo.
echo   5. Seleccionar archivos segun extension partiendo del Disco Duro C:\
echo.
echo  Con esta opcion podra seleccionar que archivos desea eliminar del disco local simplemente
echo  escribiendo la extension deseada. CUIDADO: Tenga en cuenta que esto eliminara TODOS los
echo  archivos de la extension especificada de forma permanente. Use esta herramienta solo si
echo  esta seguro de lo que desea hacer. Esta funcion utiliza el comando FOR.
echo  Puede que si consigue acceder a la carpeta "C:\$Recycle.bin" pueda restaurar los
echo  archivos.
echo.
echo.
echo   6. Seleccionar archivos segun extension unicamente del escritorio
echo.
echo  Esta opcion le permitira elegir entre las extensiones predifinidas para eliminar
echo  los archivos de esa extension que se encuentren en la raiz del escritorio y cada
echo  uno de sus directorios. CUIDADO: Tenga en cuenta que esto eliminara TODOS los
echo  archivos de la extension especificada de forma permanente. Use esta herramienta
echo  solo si esta seguro de lo que desea hacer. Esta funcion utiliza el comando FOR.
echo  Puede que si consigue acceder a la carpeta "C:\$Recycle.bin" pueda restaurar
echo  los archivos.
echo.
echo.
echo  Pulse cualquier boton para volver al menu de ayuda...
pause>nul
goto menu_ayuda

:ayuda_renom_car
cls
echo.
echo  En el menu de renombrar carpetas se contemplan las siguientes opciones:
echo.
echo.
echo   1 Renombrar carpeta en el Disco Duro
echo.
echo  Esta opción le permitira renombrar una carpeta que se encuentre en la raiz del
echo  disco local. Recuerde poner el nombre de la carpeta que desee renombrar con
echo  los simbolos y tildes que procedieran, puede ayudarse del listado de directorios
echo  que le aparecera. Comandos usados: DIR, REN.
echo.
echo.
ECHO   2 Renombrar carpeta en el Escritorio
echo.
echo  Con esta opcion podra renombrar una carpeta que se encuentre en el escritorio de
echo  cualquier usuario, independientemente del usuario que ejecute el programa.
echo  Podra ver una lista de los directorios que se encuentran en el escritorio del
echo  usuario seleccionado para renombrar la carpeta. Comandos usados: DIR, REN.
echo.
echo.
echo   3 Renombrar carpeta en otra unidad/particion
echo.
echo  Aqui podra renombrar una carpeta que se encuentre en la raiz de una unidad
echo  externa o particion del disco duro. Para ello, debera poner la letra que distingue
echo  dicha particion. Si no sabe cual es, puede consultarla en el margen izquierdo del
echo  explorador de archivos de Windows. Comandos usados: REN.
echo.
echo.
echo   4 Renombrar carpeta dentro de un directorio del Disco Duro
echo.
echo  Esta funcionalidad le permitira renombrar una carpeta que se encuentre dentro
echo  de un directorio del disco duro. Comandos usados: REN.
echo.
echo.
echo   5 Renombrar carpeta dentro de un directorio del Escritorio
echo.
echo  Esta opcion le permitira renombrar una carpeta que se encuentre dentro de un
echo  directorio del escritorio de cualquier usuario, independientemente del usuario
echo  que este ejecutando el programa. Comando usado:REN.
echo.
echo.
echo  Pulse cualquier boton para volver al menu de ayuda...
pause>nul
goto menu_ayuda

:ayuda_renom_arch
cls
echo.
echo   1 Renombrar archivo en el Disco Duro
echo.
echo  Aqui podra seleccionar un archivo de la raiz del disco local 

rem Código por Vicente Escriche Martín
rem Solucionar pregunta de búsqueda en el apartado de directorios tree.
rem Arreglar la correcta creacion de archivos de texto.
rem Continuar con el código de mover archivos segun extension.
rem Añadir modificación de atributos de los archivos (lectura/escritura)
