<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\uploadimage;

use App\Http\Controllers\AuthController;

Route::apiResource('version', \App\Http\Controllers\VersionController::class);

Route::apiResource('quiz_class', \App\Http\Controllers\QuizClassController::class);

Route::apiResource('subject', \App\Http\Controllers\SubjectController::class);

Route::post('/quiz/filter', [\App\Http\Controllers\QuizController::class,'filter']);
Route::apiResource('quiz', \App\Http\Controllers\QuizController::class);
