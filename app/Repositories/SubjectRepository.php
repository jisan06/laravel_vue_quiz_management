<?php

namespace App\Repositories;

use App\Interfaces\SubjectInterface;
use App\Models\Subject;


class SubjectRepository implements SubjectInterface
{
    public function __construct(Subject $subject)
    {
        $this->model = $subject;
    }

    public function all(){
       return $this->model::with('quiz_class')->get();
    }

    public function create(object $data){
       return $this->model::create($data->all());
    }
}
