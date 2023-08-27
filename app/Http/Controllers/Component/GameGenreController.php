<?php

namespace App\Http\Controllers\Component;

use App\Data\GameGenreData;
use App\Http\Controllers\Controller;
use App\Models\GameGenre;
use App\Services\GenreService;
use Illuminate\Http\Request;

class GameGenreController extends Controller
{
    /**
     * Получить все жанры игр списком [GET api/genres]
     */
    public function index(): mixed
    {
        $genres = GameGenre::with('games')
            ->get()
            ->map(function ($item) {
                return [
                    'genre'  => $item->name,
                    'games' => $item->games->map(function ($el) {
                        return [
                            'game_name'    => $el->name,
                            'game_slug'    => $el->slug,
                            'date_created' => $el->created_at,
                        ];
                    }),
                ];
            });

        return response([
            'success' => true,
            'result'  => $genres,
        ]);
    }

    /**
     * Сохранить созданный жанр игры в БД [POST api/genres]
     */
    public function store(Request $request): mixed
    {
        try {
            $request->validate($this->_rules());

            $data   = GameGenreData::from(['name' => $request->input('name')]);
            $result = (new GenreService())->addGenre($data->name);

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

    /**
     * Получить данные по id жанра [GET api/genres/{id}]
     */
    public function show(string $id): mixed
    {
        try {
            $genre = GameGenre::with('games')
                ->where('id', '=', $id)
                ->get()
                ->map(function ($item) {
                    return [
                        'genre'  => $item->name,
                        'games' => $item->games->map(function ($el) {
                            return [
                                'game_name'    => $el->name,
                                'game_slug'    => $el->slug,
                                'date_created' => $el->created_at,
                            ];
                        }),
                    ];
                });

            return response([
                'success' => true,
                'result'  => $genre,
            ]);
        } catch (Throwable $e) {
            return response([
                'success' => false,
                'result'  => $e->getMessage(),
            ], 400);
        }
    }

    /**
     * Обновить изменные данные жанра игры в БД [PUT api/genres/{id}]
     */
    public function update(Request $request, string $id)
    {
        try {
            $request->validate($this->_rules());

            $data   = GameGenreData::from([
                'id'   => $id,
                'name' => $request->input('name')
            ]);

            $result = (new GenreService())->updateGenre(...$data->toArray());

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
     * Удалить жанр игры из БД [DELETE api/genres/{genre}]
     */
    public function destroy(string $id)
    {
        return response([
            'success' => true,
            'deleted' => (new GenreService())->deleteGenre($id),
        ]);
    }

    private function _rules(): array
    {
        return [
            'name'   => 'required|min:3|max:255',
        ];
    }
}
