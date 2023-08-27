<?php

namespace App\Services;

use App\Data\GameData;
use App\Data\GameGenreData;
use App\Models\Game;
use App\Models\GameGenre;
use App\Models\StudioDev;
use Exception;
use Illuminate\Support\Facades\DB;
use Throwable;

class GameService
{
    /**
     * Добавить игру в БД
     */
    public function addGame(GameData $data): mixed
    {
        //--- проверим есть ли такая игра в БД
        if (Game::where('name', '=', $data->name)->first()) {
            throw new Exception("Игра с именем {$data->name} уже существует в БД !!");
        }

        //--- проверим наличие указанных жанров игры
        $genres = GameGenre::whereIn('name', $data->genres)->get();
        if ($genres->count() != count($data->genres)) {
            throw new Exception('Не корректные имена жанров !!');
        }

        //--- проверим наличие указанных разработчиков
        $developers = StudioDev::whereIn('name', $data->dev)->get();
        if ($developers->count() != count($data->dev)) {
            throw new Exception('Не корректные имена разработчиков !!');
        }

        DB::beginTransaction();
        try {
            $game = new Game([
                'name' => $data->name,
                'slug' => \Str::slug($data->name),
            ]);

            foreach ($genres as $item) {
                $item->games()->save($game);
            }

            foreach ($developers as $item) {
                $item->games()->save($game);
            }

            DB::commit();
        } catch (Throwable $e) {
            DB::rollback();
            throw $e;
        }
        //
        return $game;
    }

    /**
     * Отредактировать данные игры в БД
     */
    public function updateGame(GameData $data): mixed
    {
        //--- проверим есть ли такая игра в БД
        $game = Game::where('id', '=', $data->id)
            ->with(['game_genres', 'studio_devs'])
            ->first();
        if (!$game) {
            throw new Exception("Игра с id {$data->id} не существует в БД !!");
        }

        //--- проверим наличие указанных жанров игры
        $genres = GameGenre::whereIn('name', $data->genres)->get()->keyBy('id');
        if ($genres->count() != count($data->genres)) {
            throw new Exception('Не корректные имена жанров !!');
        }

        //--- проверим наличие указанных разработчиков
        $developers = StudioDev::whereIn('name', $data->dev)->get();
        if ($developers->count() != count($data->dev)) {
            throw new Exception('Не корректные имена разработчиков !!');
        }

        $res = null;
        DB::beginTransaction();
        try {
            //--- проверим для добавления того, чего нет в $item->game_genres и есть $data->genres
            foreach ($genres as $genre) {
                $res = $game->game_genres->first(function ($value) use ($genre) {
                    return $value->name === $genre->name;
                });
                if (!$res) {
                    $game->game_genres()->attach([$genre->id]);
                }
            }

            //--- проверим на удаление того, что есть в $item->game_genres и нет в $data->genres
            $flag = false;
            foreach ($game->game_genres as $item) {
                if ($flag) $flag = false;

                foreach ($data->genres as $genre) {
                    if ($item->name === $genre) {
                        $flag = true;
                        break;
                    }
                }

                //--- $item->name нет в новом массиве, значит пометим на удаление
                if (!$flag) {
                    $game->game_genres()->detach([$item->id]);
                }
            }

            $game->name = $data->name;
            $game->save();

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
    public function deleteGame(int $id)
    {
        return Game::where('id', '=', $id)->delete();
    }
}
