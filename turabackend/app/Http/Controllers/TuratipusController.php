<?php

namespace App\Http\Controllers;

use App\Models\Turatipus;
use Illuminate\Http\Request;

class TuratipusController extends Controller
{
    public function index()
    {
        $turaripusok = response()->json(Turatipus::all());
        return $turaripusok;
    }

    public function show($id)
    {
        $turatipus = response()->json(Turatipus::find($id));
        return $turatipus;
    }

    public function store(Request $request)
    {
        $turatipus = new Turatipus();
        $turatipus->author = $request->author;
        $turatipus->title = $request->title;
        $turatipus->save();
    }

    public function update(Request $request, $id)
    {
        $turatipus = Turatipus::find($id);
        $turatipus->author = $request->author;
        $turatipus->title = $request->title;
        $turatipus->save();
    }
    public function destroy($id)
    {
        //find helyett a paraméter
        Turatipus::find($id)->delete();
    }
}
