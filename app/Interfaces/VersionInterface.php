<?php

namespace App\Interfaces;

interface VersionInterface
{
    public function all();

    public function create(object $data);
}
