<?php

namespace App\Data;

use Spatie\LaravelData\Data;

class GameData extends Data
{
    public function __construct(
      public ?int $id,
      public string $name,
      public array $genres,
      public array $dev
    ) {}
}
