<?php

namespace App\Http\Controllers\Component;

use App\Data\StudioDevData;
use App\Http\Controllers\Controller;
use App\Models\StudioDev;
use App\Services\DeveloperService;
use Illuminate\Http\Request;
use Throwable;

class StudioDevController extends Controller
{
    /**
     * Отобразить списком всех разработчиков [GET api/developers]
     */
    public function index()
    {
        $developers = StudioDev::with('games')
            ->get()
            ->map(function ($item) {
                return [
                    'developers' => $item->name,
                    'games'      => $item->games->map(function ($el) {
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
            'result'  => $developers,
        ]);
    }

    /**
     * Сохранить созданного разработчика в БД [POST api/developers]
     */
    public function store(Request $request)
    {
        try {
            $request->validate($this->_rules());

            $data   = StudioDevData::from(['name' => $request->input('name')]);
            $result = (new DeveloperService())->addDeveloper($data->name);

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
     * Получить данные по id разработчика [GET api/developers/{id}]
     */
    public function show(string $id)
    {
        try {
            $developer = StudioDev::with('games')
                ->where('id', '=', $id)
                ->get()
                ->map(function ($item) {
                    return [
                        'developers' => $item->name,
                        'games'      => $item->games->map(function ($el) {
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
                'result'  => $developer,
            ]);
        } catch (Throwable $e) {
            return response([
                'success' => false,
                'result'  => $e->getMessage(),
            ], 400);
        }
    }

    /**
     * Обновить изменные данные разработчика в БД [PUT api/developers/{id}]
     */
    public function update(Request $request, string $id)
    {
        try {
            $request->validate($this->_rules());

            $data   = StudioDevData::from([
                'id'   => $id,
                'name' => $request->input('name')
            ]);

            $result = (new DeveloperService())->updateDeveloper(...$data->toArray());

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
     * Удалить разработчика из БД [DELETE api/developers/{developer}]
     */
    public function destroy(string $id)
    {
        return response([
            'success' => true,
            'deleted' => (new DeveloperService())->deleteDeveloper($id),
        ]);
    }

    private function _rules(): array
    {
        return [
            'name' => 'required|min:3|max:255',
        ];
    }
}
