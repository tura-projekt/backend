<?php

namespace Database\Factories;

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
            'tipus' => rand(1, 1000),
            'idopont' => fake()->dateTimeBetween('2000-01-01', '2023-10-10'),
            'turavezeto' => rand(1, 1000),
            'ar' => rand(1, 5),
            'min_letszam' => rand(1, 50),
            'max_letszam' => rand(50, 100),
        ];
    }
}
