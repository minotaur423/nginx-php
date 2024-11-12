#!/bin/bash

# Starting php
echo "Starting php..."
/usr/sbin/php-fpm

#Starting nginx
echo "Staring nginx..."
nginx -g 'daemon off;'
