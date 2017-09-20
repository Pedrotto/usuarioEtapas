#!/bin/bash
#validando usuario root

if ["`id-u`"!=0] ; then
echo -e "\n"
exit;
fi

echo -e "HOLA, HOY VAS A CREAR UN USUARIO, TODOS LOS CAMPOS SE DEBE LLENAR \n"
echo -e "Nombre del usuario \n"
read nombre
echo -e "En que directorio lo quiero poner \n"
read directorio
echo  -e "cual es la shell que tendra el usuario \n"
read shell
echo  -e "cual es nombre completo del usuario \n"
read comentario
echo -e "cuando quieres que deje de funcionar \n"
read fecha
echo -e "cual es grupo donde quieres poner al usuario \n"
read grupo
echo -e "#####################################################################"

echo "el usuario a crear es:"
echo -e  "\n nombre:" $nombre
echo -e  "\n nombre completo:" $comentario
echo -e "\n directorio:" $directorio
echo -e "\n grupo:" $grupo
echo -e "\n shell:" $shell
echo -e "\n fecha/expiracion:" $fecha


echo -e "#################################################################"

/usr/sbin/groupadd $grupo

 useradd -c "$comentario" -d $directorio -g $grupo -e $fecha -s $shell $nombre

echo -e "#################################################################"

echo "se necesita crear una contraseña"
echo -e "\n"
echo "ingresa la contraseña que tenga por lo menos 5 caracteres, una mayuscula, una minuscula y un numero "
passwd $nombre

echo -e "#################################################################"

echo -e "aqui esta tu usuario y el grupo"

more /etc/group | grep $grupo
more /etc/shadow | grep $nombre

echo - e "ADIOS....GRACIAS"

# gittest
# usuarioEtapas
# usuarioEtapas
