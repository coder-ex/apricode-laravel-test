<?php

namespace App\Http\Controllers\Component;

use App\Data\GameData;
use App\Http\Controllers\Controller;
use App\Models\Game;
use App\Services\GameService;
use Illuminate\Http\Request;
use Throwable;

class GameController extends Controller
{
    /**
     * Отобразить списком все игры [GET api/games]
     */
    public function index()
    {
        $games = Game::with(['game_genres', 'studio_devs'])
            ->get()
            ->map(function ($item) {
                return [
                    'name'         => $item->name,
                    'slug'         => $item->slug,
                    'genres'       => $item->game_genres->map(function ($el) {
                        return [
                            'id'   => $el->id,
                            'name' => $el->name,
                            'slug' => $el->slug
                        ];
                    }),
                    'developers'   => $item->studio_devs->map(function ($el) {
                        return [
                            'id'   => $el->id,
                            'name' => $el->name,
                            'slug' => $el->slug
                        ];
                    }),
                    'date_created' => $item->created_at,
                ];
            });

        return response([
            'success' => true,
            'result'  => $games,
        ]);
    }

    /**
     * Сохранить созданную игру в БД [POST api/games]
     */
    public function store(Request $request)
    {
        try {
            $request->validate($this->_rules());

            $data   = GameData::from([
                'name'   => $request->input('name'),
                'genres' => $request->input('genres'),
                'dev'    => $request->input('dev'),
            ]);
            $result = (new GameService())->addGame($data);

            return response([
                'success' => true,
                'result'  => $result
            ]);
        } catch (Throwable $e) {
            return response([
                'success'     => false,
                'message'     => $e->getMessage(),
            ]);
        }
    }

    private function _rules(): array
    {
        return [
            'name'   => 'required|max:255',
            'genres' => 'required|array',
            'dev'    => 'required|array',
        ];
    }

    /**
     * Получить данные игры по id [GET api/games/{id}]
     */
    public function show(string $id)
    {
        try {
            $game = Game::with(['game_genres', 'studio_devs'])
                ->where('id', '=', $id)
                ->get()
                ->map(function ($item) {
                    return [
                        'name'         => $item->name,
                        'slug'         => $item->slug,
                        'genres'       => $item->game_genres->map(function ($el) {
                            return [
                                'id'   => $el->id,
                                'name' => $el->name,
                                'slug' => $el->slug
                            ];
                        }),
                        'developers'   => $item->studio_devs->map(function ($el) {
                            return [
                                'id'   => $el->id,
                                'name' => $el->name,
                                'slug' => $el->slug
                            ];
                        }),
                        'date_created' => $item->created_at,
                    ];
                });

            return response([
                'success' => true,
                'result'  => $game,
            ]);
        } catch (Throwable $e) {
            return response([
                'success' => false,
                'result'  => $e->getMessage(),
            ], 400);
        }
    }

    /**
     * Обновить изменные данные игры в БД [PUT api/games/{id}]
     */
    public function update(Request $request, string $id)
    {
        try {
            $request->validate($this->_rules());

            $data   = GameData::from([
                'id'     => $id,
                'name'   => $request->input('name'),
                'genres' => $request->input('genres'),
                'dev'    => $request->input('dev'),
            ]);
            $result = (new GameService())->updateGame($data);

            return response([
                'success' => true,
                'updated'  => $result
            ]);
        } catch (Throwable $e) {
            return response([
                'success'     => false,
                'message'     => $e->getMessage(),
            ]);
        }
    }

    /**
     * Удалить игру из БД [DELETE api/games/{id}]
     */
    public function destroy(string $id)
    {
        return response([
            'success' => true,
            'deleted' => (new GameService())->deleteGame($id),
        ]);
    }
}
