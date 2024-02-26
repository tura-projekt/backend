<?php

namespace Database\Factories;

use App\Models\Turatipus;
use App\Models\Turavezeto;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Tura>
 */
class TuraFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'tipus_id' => Turatipus::all()->random()->tipus_id,
            'idopont' => fake()->dateTimeBetween('2000-01-01', '2023-10-10'),
            'turavezeto' => Turavezeto::all()->random()->id,
            'id' => rand(1, 1000),
            'tipus' => rand(1, 1000),
            'idopont' => fake()->dateTimeBetween('2000-01-01', '2023-10-10') ->format('Y-m-d'),
            'turavezeto' => rand(1, 1000),
            'ar' => rand(1, 5),
            'min_letszam' => rand(1, 50),
            'max_letszam' => rand(50, 100),
        ];
    }
}
