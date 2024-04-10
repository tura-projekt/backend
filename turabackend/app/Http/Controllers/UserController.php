<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
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
        $user->regisztracio_datuma = $request->regisztracio_datuma;
        $user->telefonszam = $request->telefonszam;
        $user->email_verified_at = $request->email_verified_at;
        $user->password = $request->password;
        $user->permission = $request->permission;
        $user->rememberToken = $request->rememberToken;
        $user->save();
    }

    public function update(Request $request, $id)
    {
        $user = User::find($id);
        $user->id = $request->id;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->regisztracio_datuma = $request->regisztracio_datuma;
        $user->telefonszam = $request->telefonszam;
        $user->email_verified_at = $request->email_verified_at;
        $user->password = $request->password;
        $user->permission = $request->permission;
        $user->rememberToken = $request->rememberToken;
        $user->save();
    }
    public function destroy($id)
    {
        //find helyett a paraméter
        User::find($id)->delete();
    }

    public function updatePassword(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            "password" => 'string|min:3|max:50'
        ]);
        if ($validator->fails()) {
            return response()->json(["message" => $validator->errors()->all()], 400);
        }
        $user = User::where("id", $id)->update([
            "password" => Hash::make($request->password),
        ]);
        /* return response()->json(["user" => $user]); */
    }

    public function lendingByUser()
    {
        $user = Auth::user();    //bejelentkezett felhasználó
        $jelenkezesek = User::with('jelentkezesek') //a függvény neve
            ->where('id', '=', $user->id)
            ->get();
        return $jelenkezesek;
    }
}
