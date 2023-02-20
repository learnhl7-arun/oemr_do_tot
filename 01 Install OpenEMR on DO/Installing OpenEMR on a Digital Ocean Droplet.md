# Create a Droplet on Digital Ocean
Create a droplet with following features. 
- Region: Choose a region closest to your city
- Image: Ubuntu
	- Version: 20.04 (LTS) x64
- Droplet Type: Basic
- CPU Option: Regular
	- 4 GB/ 2 CPUs
- Authentication Method: SSH Key
- Hostname: ubuntu-openemr

Refer to https://docs.digitalocean.com/products/droplets/how-to/create/#create-a-droplet-in-the-control-panel for step by step instructions to create a droplet in Control Panel.    

# Install pre-requisites
```
sudo apt update -y
sudo apt upgrade -y
sudo apt install mysql-server php php-xml php-mbstring php-mysql apache2 -y
```

# Create OpenEMR Database and allow remote access
## Change Root Password
```
sudo mysql -uroot 
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'SystemAdmin@123';
exit;
```

> Note: 
> 	Replace `'SystemAdmin@123'` with a password of your choice


## Secure MySQL Database

MySQL is an open-source relational database management system. The `mysql_secure_installation` script allows you to significantly improve MySQL server security. Refer to https://phoenixnap.com/kb/mysql-secure-installation 

1. Execute the **`mysql_secure_installation`** script using the following syntax:

```
sudo mysql_secure_installation [option]
```

2. Type your password and press **`Y`** to set up the **`VALIDATE PASSWORD`** component which checks whether the new password is strong enough.

3. Next, enter **`0`**, **`1`**, or **`2`** depending on the password strength you want to set :

-   **`0` - Low**. The password consists of at least 8 characters.
-   **`1` - Medium**. The password consists of at least 8 characters (including numeric, mixed case, and special characters).
-   **`2` - Strong**. The password consists of at least 8 characters (including numeric, mixed case, and special characters, and compares the password to a dictionary file).

4. Once you specify the required strength, enter and re-enter the password.
![[secure-mysql-on-ubuntu.png]]

The program evaluates the strength of your password and requires confirmation with **`Y`** to continue.
![[mysql-estimates-password-strength.png]]

6. Next you need to answer the following security features:

-   Remove anonymous users?
-   Disallow root login remotely?
-   Remove test database and access to it?
-   Reload privilege tables now?

To run the script with the default setting, the recommended answer to all these questions is **`Y`**.

## Create OpenEMR Database
```
sudo mysql -uroot -pSystemAdmin@123

CREATE DATABASE openemr;
CREATE USER 'openemruser'@'1.2.3.4' IDENTIFIED with mysql_native_password BY 'Openemr@1234';
CREATE USER 'openemruser' IDENTIFIED with mysql_native_password BY 'Openemr@1234';
GRANT ALL PRIVILEGES ON *.* TO 'openemruser'@'1.2.3.4';
GRANT ALL PRIVILEGES ON *.* TO 'openemruser';

FLUSH PRIVILEGES; 

exit;
```

> Note
> 	Replace `1.2.3.4` with the Public IP address given by Digital Ocean. 
> 	Replace `Openemr@1234` with a password of your choice


## Allow MySQL Database to be accessible in remote clients
MySQL Server is not accessible in remote clients by default. To allow remote access, do the following:
- Change bind-address `127.0.0.1` to bind-address `0.0.0.0 `in `/etc/mysql/mysql.conf.d`
- Allow tcp traffic in 3306 port `sudo ufw allow 3306/tcp` 

Refer to following links for more information
* https://www.digitalocean.com/community/tutorials/how-to-allow-remote-access-to-mysql
* https://phoenixnap.com/kb/mysql-remote-connection  


## Configure `php.ini` file
OpenEMR recommends the following PHP setting, which can be set in the php.ini file 

`sudo nano -l /etc/php/7.4/apache2/php.ini`

| Line | Tag | Value |
| ---- | --- | ----- |
| 198| short_open_tag | Off |
|  409 | max_execution_time | 60 |
|  419 | max_input_time | -1 |
|  426 | max_input_vars | 3000 |
|  430 | memory_limit | 512M |
|  503 | display_errors | Off |
|  522 | log_errors | On |
|  698 | post_max_size | 30M |
|  841 | file_uploads | On |
|  850 | upload_max_filesize | 30M |
|  486 | error_reporting | E_ALL & ~E_NOTICE & ~E_STRICT & ~E_DEPRECATED |
| 1149 | mysqli.allow_local_infile | On |

> Note: 
>	Once you modify `php.ini` file, remember to restart your web server to apply the new settings
>	`sudo service apache2 restart`


## Copy openemr source code
```
wget https://sourceforge.net/projects/openemr/files/OpenEMR%20Current/7.0.0.2/openemr-7.0.0.tar.gz/download


mv download openemr-7.0.0.tar.gz

tar xvzf openemr*.tar.gz

mv openemr-7.0.0 openemr

sudo mv openemr /var/www/html/

sudo chown -R www-data:www-data /var/www/html/openemr

sudo chmod 666 /var/www/html/openemr/sites/default/sqlconf.php
```


## Configure the Install through Web GUI

In Step 1, select second option, "I have already created the database".
![Hostedstep1.png](https://www.open-emr.org/wiki/images/6/6f/Hostedstep1.png)

In Step 2 **carefully** complete the **MySQL Server** section.
-   The Server Host is **not** localhost, but the IP address of the server running MySQL.
-   Enter the Database Name, Login Name (Database Username) and Password from MySQL Creation above.
-   The User Hostname is **not** localhost, but the IP address of the server running Apache/PHP.
-   Incorrect entries will mean an installation failure.
-   Supply a password for Initial User in the **OpenEMR User** section.
![Step2.1.png](https://www.open-emr.org/wiki/images/f/fa/Step2.1.png)
Steps 3 to Step 6 are self explanatory. Follow the instructions mentioned. 

