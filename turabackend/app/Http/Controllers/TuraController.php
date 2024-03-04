<?php

namespace App\Http\Controllers;

use App\Models\Jelentkezes;
use App\Models\Tura;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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

    public function induloTura()
    {
        return DB::table('turas as t')
            ->selectRaw('t.idopont, t.turavezeto, t.ar, t.min_letszam, t.max_letszam, count(j.fizetve) as jelentkezett')
            ->join('jelentkezes as j', 'j.tura_id', '=', 't.id')
            //->where('j.fizetve', '=', '1')
            // ->where('t.idopont', '=', date('Y-m-d', strtotime("-3 days")))
            ->havingRaw('jelentkezett = t.min_letszam')
            ->groupBy('t.idopont', 't.turavezeto', 't.ar', 't.min_letszam', 't.max_letszam')
            ->get();
    }

    public function induloTura2()
    {
        return DB::table('turas as t')
            ->selectRaw('t.idopont, t.turavezeto, t.ar, t.min_letszam, t.max_letszam')
            ->join('jelentkezes as j', 'j.user_id', 'j.tura_id', 'j.fizetve')
            ->selectRaw('count(j.fizetve) as jelentkezett')
            ->where('j.fizetve', '<', 't.min_letszam')
            ->count('j.fizetve', '=', '1');
            //->where('t.idopont', '=', date('Y-m-d', strtotime("-3 days")))
            //->count('j.fizetve') > ('t.min_letszam')
            //where('status','=','1')->count();
            //->get();
    }

    /*     {
        return DB::table('lendings as l')
            ->selectRaw('title, author')
            ->join('copies as c', 'l.copy_id', 'c.copy_id')
            ->join('books as b', 'c.book_id', 'b.book_id')
            ->where('end', $myDate)
            ->get();
    }

    {
        return DB::table('jelentkezes as j')
            ->selectRaw('j.*, t.idopont, t.turavezeto, t.ar, t.min_letszam, t.max_letszam')
            ->join('turas as t', 'j.tura_id', 't.id')
            ->where('user_id', $user_id)
            ->get();
    } */
}
