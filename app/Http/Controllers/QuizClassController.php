<?php

namespace App\Http\Controllers;

use App\Interfaces\QuizClassInterface;
use App\Models\QuizClass;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class QuizClassController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $quiz_class;

    public function __construct(QuizClassInterface $quiz_class)
    {
        $this->quiz_class = $quiz_class;
    }

    public function index()
    {
        return $this->quiz_class->all();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            DB::beginTransaction();
             $data = $this->quiz_class->create($request);
            DB::commit();
            return $data;
        }catch (\Exception $exception) {
            DB::rollBack();
            return $exception->getMessage();
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\QuizClass  $quiz_class
     * @return \Illuminate\Http\Response
     */
    public function show(QuizClass $quiz_class)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\QuizClass  $quiz_class
     * @return \Illuminate\Http\Response
     */
    public function edit(QuizClass $quiz_class)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\QuizClass  $quiz_class
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, QuizClass $quiz_class)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\QuizClass  $quiz_class
     * @return \Illuminate\Http\Response
     */
    public function destroy(QuizClass $quiz_class)
    {
        //
    }
}
