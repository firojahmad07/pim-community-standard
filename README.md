## Installation instructions

To install Akeneo PIM for a PIM project or for evaluation, please follow:

### Build the Docker image for local development

```bash
docker-compose up --build -d
```

## Login in pim-php Container and follow bellow instractions.

```
docker exec -it pim-php bash
```

### Package Installation
```
yarn install
composer install
```
```
php bin/console pim:installer:db --catalog src/Akeneo/Platform/Bundle/InstallerBundle/Resources/fixtures/icecat_demo_dev
```

### Required Commands
```
chown -R www-data:www-data /var/www/html/var/cache
chmod -R 775 /var/www/html/var/cache
```

```
rm -rf var/cache/** && bin/console pim:installer:assets && bin/console ca:cl && yarn run less && yarn run webpack && yarn run update-extensions
```

### Reset Product Index
```
php bin/console akeneo:elasticsearch:reset-indexes --env=prod && php bin/console pim:product:index --all --env=prod && php bin/console pim:product-model:index --all --env=prod
```


