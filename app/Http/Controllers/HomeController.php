<?php

namespace App\Http\Controllers;

use Illuminate\View\View;
use Saritasa\Laravel\Controllers\BaseController;

/**
 * Controller for home page.
 */
class HomeController extends BaseController
{
    /**
     * Home page
     *
     * @return View
     */
    public function index(): View
    {
        return view('home.index');
    }
}
