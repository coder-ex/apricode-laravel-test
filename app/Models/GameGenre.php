<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class GameGenre extends Model
{
    use HasFactory;

    protected $table      = 'game_genres';
    public    $timestamps = false;

    protected $fillable = ['name', 'slug'];

    /**
     * Все игры жанра
     */
    public function games(): BelongsToMany
    {
        return $this->belongsToMany(Game::class, 'game_genre_game', 'genre_id', 'game_id');
    }
}
