<?php

namespace App\Http\Controllers;

use Saritasa\Laravel\Controllers\Web\BaseMarkupController;

/**
 * This class used for markup only.
 */
class MarkupController extends BaseMarkupController
{
    public function example()
    {
        return view('pages.markup.example');
    }
}
