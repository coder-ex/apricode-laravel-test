<?php

namespace App\Services;

use App\Models\GameGenre;
use Illuminate\Support\Facades\DB;
use Throwable;

class GenreService
{
    /**
     * Добавить жанр игры в БД
     */
    public function addGenre(string $name): mixed
    {
        $res = null;
        DB::beginTransaction();
        try {
            $res = GameGenre::create([
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
     * Отредактировать жанр игры в БД
     */
    public function updateGenre(int $id, string $name): mixed
    {
        $res = null;
        DB::beginTransaction();
        try {
            $res = GameGenre::where('id', '=', $id)
                ->update([
                    'name' => $name,
                    'slug' => \Str::slug($name)
                ]);

            if ($res == 0) {
                return ['message' => "Жанр игры с id == {$id} не найден в БД !!"];
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
    public function deleteGenre(int $id)
    {
        return GameGenre::where('id','=',$id)->delete();
    }
}
