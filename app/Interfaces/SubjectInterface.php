<?php

namespace App\Interfaces;

interface SubjectInterface
{
    public function all();

    public function create(object $data);
}
