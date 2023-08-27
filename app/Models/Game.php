<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Game extends Model
{
    use HasFactory;

    protected $table = 'games';
    //protected $dateFormat = 'U';

    protected $fillable = ['name', 'slug'];

    /**
     * Игра со списками жанров и разработчиков
     * 
     * @param string $name имя игры
     * @return void
     */
    public function scopeCompleteSetByName(Builder $query, string $name): void
    {
        $query->where('slug', '=', Str::slug($name))->with(['game_genres', 'studio_devs']);
    }

    /**
     * Все жанры
     */
    public function game_genres(): BelongsToMany
    {
        return $this->belongsToMany(GameGenre::class, 'game_genre_game', 'game_id', 'genre_id');
    }

    /**
     * Все разработчики
     */
    public function studio_devs(): BelongsToMany
    {
        return $this->belongsToMany(StudioDev::class, 'studio_dev_game', 'game_id', 'dev_id');
    }
}
