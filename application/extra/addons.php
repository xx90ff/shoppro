<?php

return [
    'autoload' => false,
    'hooks' => [
        'config_init' => [
            'nkeditor',
        ],
        'upgrade' => [
            'shopro',
        ],
        'app_init' => [
            'shopro',
        ],
    ],
    'route' => [],
    'priority' => [],
];
