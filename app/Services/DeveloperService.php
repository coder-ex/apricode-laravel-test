<?php

namespace App\Services;

use App\Models\StudioDev;
use Illuminate\Support\Facades\DB;
use Throwable;

class DeveloperService
{
    /**
     * Добавить разработчика в БД
     */
    public function addDeveloper(string $name): mixed
    {
        $res = null;
        DB::beginTransaction();
        try {
            $res = StudioDev::create([
                'name' => $name,
                'slug' => \Str::slug($name),
            ]);

            DB::commit();
        } catch (Throwable $e) {
            DB::rollback();
            throw $e;
        }
        //
        return $res;
    }

    /**
     * Отредактировать разработчика в БД
     */
    public function updateDeveloper(int $id, string $name): mixed
    {
        $res = null;
        DB::beginTransaction();
        try {
            $res = StudioDev::where('id', '=', $id)
                ->update([
                    'name' => $name,
                    'slug' => \Str::slug($name)
                ]);

            if ($res == 0) {
                return ['message' => "Разработчик с id == {$id} не найден в БД !!"];
            }

            DB::commit();
        } catch (Throwable $e) {
            DB::rollback();
            throw $e;
        }

        //
        return $res;
    }

    /**
     * Удалить запись из БД
     */
    public function deleteDeveloper(int $id)
    {
        return StudioDev::where('id','=',$id)->delete();
    }
}
