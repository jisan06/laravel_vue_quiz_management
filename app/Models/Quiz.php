<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Quiz extends Model
{
    use HasFactory;
    protected $guarded = ['id'];
    protected $appends = ['start_date','start_time','end_date','end_time'];

    public function version(){
        return $this->belongsTo(Version::class);
    }

    public function quiz_class(){
        return $this->belongsTo(QuizClass::class);
    }

    public function subject(){
        return $this->belongsTo(Subject::class);
    }

    public function getStartDateAttribute(){
        return date('M d, Y',strtotime($this->start));
    }

    public function getStartTimeAttribute($value){
        return date('h:i a',strtotime($this->start));
    }

    public function getEndDateAttribute($value){
        return date('h:i a',strtotime($this->end));
    }

    public function getEndTimeAttribute($value){
        return date('M d, Y',strtotime($this->end));
    }
}
