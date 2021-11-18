<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QuizClass extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function version(){
        return $this->belongsTo(Version::class);
    }
}
