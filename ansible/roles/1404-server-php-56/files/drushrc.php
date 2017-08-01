<?php

$conf_dir = '/etc/drush/conf.d';
foreach(scandir($conf_dir) as $path) {
  if (substr($path, -4) === '.php') {
    require_once($conf_dir . '/' . $path);
  }
}
