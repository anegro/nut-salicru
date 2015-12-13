# nut-salicru

Escenario de pruebas con Vagrant y Ansible para configurar NUT (Network UPS Tools) para un SAI Salicru alimentando a varios servidores Debian/Ubuntu.

Se puede adaptar fácilmente para otras marcas de SAI y para otros entornos.

## Requisitos

Para probar el escenario necesitarás el siguiente software:

* Vagrant
* Ansible
* VirtualBox

## Probar el escenario

1. Modifica el `Vagrantfile` para concretar la cantidad y tipo de servidores a desplegar.
2. Modifica el archivo `hosts` de Vagrant.
3. Configura las variables del playbook de Ansible. Revisa también `site.yml` y `secrets.yml`.
4. Pon en marcha el escenario desde la línea de comandos.

~~~
vagrant up
ansible-playbook site.yml
~~~

## Experimentar con el SAI

Prueba a cambiar las variables del SAI. Por defecto (para entornos de desarrollo) se utiliza el driver dummy que imita al SAI Salicru. Para ello debes modificar el archivo `/etc/nut/dummy.dev`. Un buen experimento puede consistir en establecer `ups.status: OB` para simular que se está trabajando con batería.

## Aspectos a tener en cuenta

Para conseguir un funcionamiento correcto ha sido necesario realizar algunas modificaciones a los scripts de inicio que vienen con NUT.

Echar un vistazo a las líneas marcadas con `ARREGLO` en los scripts del rol `nut-server`:

* `nut-client`
* `nut-server`

Estos scripts reemplazan a los que originalmente se instalan en `/etc/init.d/`. Es importante tenerlo en cuenta ya que pueden cambiar con una nueva versión de NUT.
