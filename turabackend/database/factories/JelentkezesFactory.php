<?php

namespace Database\Factories;

use App\Models\Tura;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Jelentkezes>
 */
class JelentkezesFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id' => User::all()->random()->id,
            'tura_id' => Tura::all()->random()->id,
            'jelentkezes_datuma' => fake()->date(),
            'fizetve' => rand(0,1)

        
            

        ];
    }
}
