<?php

namespace App\Http\Controllers;

use App\Interfaces\VersionInterface;
use App\Models\Version;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class VersionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $version;

    public function __construct(VersionInterface $version)
    {
        $this->version = $version;
    }

    public function index()
    {
        return $this->version->all();
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
             $data = $this->version->create($request);
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
     * @param  \App\Models\Version  $version
     * @return \Illuminate\Http\Response
     */
    public function show(Version $version)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Version  $version
     * @return \Illuminate\Http\Response
     */
    public function edit(Version $version)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Version  $version
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Version $version)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Version  $version
     * @return \Illuminate\Http\Response
     */
    public function destroy(Version $version)
    {
        //
    }
}
