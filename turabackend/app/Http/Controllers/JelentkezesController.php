<?php

namespace App\Http\Controllers;

use App\Models\Jelentkezes;
use Illuminate\Http\Request;

class JelentkezesController extends Controller
{
    public function index()
    {
        $jelentkezesek = response()->json(Jelentkezes::all());
        return $jelentkezesek;
    }

    public function show($id)
    {
        $jelentkezes = response()->json(Jelentkezes::find($id));
        return $jelentkezes;
    }

    public function store(Request $request)
    {
        $jelentkezes = new Jelentkezes();
        $jelentkezes->author = $request->author;
        $jelentkezes->title = $request->title;
        $jelentkezes->save();
    }

    public function update(Request $request, $id)
    {
        $jelentkezes = Jelentkezes::find($id);
        $jelentkezes->author = $request->author;
        $jelentkezes->title = $request->title;
        $jelentkezes->save();
    }
    public function destroy($id)
    {
        //find helyett a paraméter
        Jelentkezes::find($id)->delete();
    }
}
