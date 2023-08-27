<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class StudioDev extends Model
{
    use HasFactory;

    protected $table      = 'studio_devs';
    public    $timestamps = false;

    protected $fillable = ['name', 'slug'];

    /**
     * Все игры студии разработчика
     */
    public function games(): BelongsToMany
    {
        return $this->belongsToMany(Game::class, 'studio_dev_game', 'dev_id', 'game_id');
    }
}
