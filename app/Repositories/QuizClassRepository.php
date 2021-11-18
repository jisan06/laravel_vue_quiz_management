<?php

namespace App\Repositories;

use App\Interfaces\QuizClassInterface;
use App\Models\QuizClass;


class QuizClassRepository implements QuizClassInterface
{
    public function __construct(QuizClass $quiz_class)
    {
        $this->model = $quiz_class;
    }

    public function all(){
       return $this->model::with('version')->get();
    }

    public function create(object $data){
       return $this->model::create($data->all());
    }
}
