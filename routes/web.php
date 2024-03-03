<?php

use App\Http\Controllers\TestController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\InvoiceGenerate;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return redirect('admin');
});

// Route::get('/test',[TestController::class,'index']);

Route::get('admin/invoice/generate/{record}',[InvoiceGenerate::class,'generate'])->name('admin.invoice.generate');
