<?php

namespace App\Http\Controllers;

use App\Models\Tura;
use Illuminate\Http\Request;

class TuraController extends Controller
{
    public function index()
    {
        $turak = response()->json(Tura::all());
        return $turak;
    }

    public function show($id)
    {
        $tura = response()->json(Tura::find($id));
        return $tura;
    }

    public function store(Request $request)
    {
        $tura = new Tura();
        $tura->author = $request->author;
        $tura->title = $request->title;
        $tura->save();
    }

    public function update(Request $request, $id)
    {
        $tura = Tura::find($id);
        $tura->author = $request->author;
        $tura->title = $request->title;
        $tura->save();
    }
    public function destroy($id)
    {
        //find helyett a paraméter
        Tura::find($id)->delete();
    }
}
