<?php

namespace App\Repositories;

use App\Interfaces\QuizInterface;
use App\Models\Quiz;


class QuizRepository implements QuizInterface
{
    public function __construct(Quiz $quiz)
    {
        $this->model = $quiz;
    }

    public function all(){
       return $this->model::with('version','quiz_class','subject')->get();
    }

    public function create(object $data){
        $data['start'] = date('Y-m-d H:i:s',strtotime($data->start));
        $data['end'] = date('Y-m-d H:i:s',strtotime($data->end));

       return $this->model::create($data->all());
    }

    public function filter(object $data){
        $quizzes = $this->model::with('version','quiz_class','subject');
        if($data->version_id != null){
            $quizzes->where('version_id',$data->version_id);
        }
        if($data->quiz_class_id != null){
            $quizzes->where('quiz_class_id',$data->quiz_class_id);
        }
        if($data->subject_id != null){
            $quizzes->where('subject_id',$data->subject_id);
        }

        return $quizzes->get();
    }
}
