<?php

namespace App\Http\Controllers;

use App\Models\Jelentkezes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class JelentkezesController extends Controller
{
    public function index()
    {
        $jelentkezesek = response()->json(Jelentkezes::all());
        return $jelentkezesek;
    }

    public function show($user_id, $tura_id)
    {
        return Jelentkezes::where('user_id', $user_id)->where('tura_id', $tura_id)->first();
    }

    public function store(Request $request)
    {
        $jelentkezes = new Jelentkezes();
        $jelentkezes->fill($request->all());
        $jelentkezes->save();
    }

    public function update(Request $request, $user_id, $tura_id)
    {
        $jelentkezes = $this->show($user_id, $tura_id);
        $jelentkezes->fill($request->all());
        $jelentkezes->save();
    }
    public function destroy($id)
    {
        //find helyett a paraméter
        Jelentkezes::find($id)->delete();
    }

    public function userJelentkezesek($user_id)
    {
        return DB::table('jelentkezes as j')
            ->selectRaw('j.*, t.idopont, t.turavezeto, t.ar, t.min_letszam, t.max_letszam')
            ->join('turas as t', 'j.tura_id', 't.id')
            ->where('user_id', $user_id)
            ->get();
    }
}
