<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index()
    {
        $users = response()->json(User::all());
        return $users;
    }

    public function show($id)
    {
        $user = response()->json(User::find($id));
        return $user;
    }

    public function store(Request $request)
    {
        $user = new User();
        $user->id = $request->id;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->adress = $request->adress;
        $user->regisztracio_datuma = $request->regisztracio_datuma;
        $user->telefonszam = $request->telefonszam;
        $user->email_verified_at = $request->email_verified_at;
        $user->jelszo = $request->jelszo;
        $user->rememberToken = $request->rememberToken;
        $user->save();
    }

    public function update(Request $request, $id)
    {
        $user = User::find($id);
        $user->author = $request->author;
        $user->title = $request->title;
        $user->save();
    }
    public function destroy($id)
    {
        //find helyett a paraméter
        User::find($id)->delete();
    }
}
