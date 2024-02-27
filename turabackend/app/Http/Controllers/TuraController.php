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
        $tura->id = $request->id;
        $tura->tipus_id = $request->tipus_id;
        $tura->idopont = $request->idopont;
        $tura->turavezeto = $request->turavezeto;
        $tura->ar = $request->ar;
        $tura->min_letszam = $request->min_letszam;
        $tura->max_letszam = $request->max_letszam;
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
