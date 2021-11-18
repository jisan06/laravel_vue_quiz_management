<?php

namespace App\Repositories;

use App\Interfaces\VersionInterface;
use App\Models\Version;


class VersionRepository implements VersionInterface
{
    public function __construct(Version $version)
    {
        $this->model = $version;
    }

    public function all(){
       return $this->model::all();
    }

    public function create(object $data){
       return $this->model::create($data->all());
    }
}
