<?php

namespace App\Interfaces;

interface QuizInterface
{
    public function all();

    public function create(object $data);
}
