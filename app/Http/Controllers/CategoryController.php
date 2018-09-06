<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Category;
use Hash;
use DB;
use Validator;
use Auth;

class CategoryController extends Controller
{

    public function __construct() {
        
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $categoryRequest = $request->input();

        $perPage = !empty($categoryRequest['perPage']) ? $request['perPage'] : false;
        $orderBy = !empty($categoryRequest['orderBy']) ? $categoryRequest['orderBy'] : 'name';
        $order = !empty($categoryRequest['order']) ? $categoryRequest['order'] : 'ASC';
        $page =  !empty($categoryRequest['page']) ? $categoryRequest['page'] : false;

        $categories = Category::select('*');

        if(isset($categoryRequest['q'])) {

            $binding = '%'.$categoryRequest['q'].'%';

            $categories = $categories->where('name', 'LIKE', '%'.$binding.'%');
        }

        $count = $categories->count();

        if($perPage)
            $categories = $categories->take($perPage);

        if($page)
            $categories = $categories->skip(($page - 1) * $perPage);

        if($orderBy)
            $categories = $categories->orderBy($orderBy, $order);

        $categories = $categories->get();

        $response = array('success' => true, 'categories' => $categories, 'count' => $count);

        return response()->json($response);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $categoryData = $request->input();

        $validator = Validator::make($categoryData, [
            'name' => 'required'
        ]);

        if ($validator->fails())
            return response()->json(['errors' => $validator->errors()->all()], 422);

        $category = Category::create($categoryData);

        if($category) {
            $response = array('success' => true, 'category' => $category);
        } else {
            $response = array('success' => false, 'errors' => array('error in creating category'));
        }

        return response()->json($response);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $category = Category::find($id);

        if($category) {
            $response = array('success' => true, 'category' => $category);
        } else {
            $response = array('success' => false, 'errors' => array('Category not found'));
        }

        return response()->json($response);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $categoryData = $request->input();

        $validator = Validator::make($request->all(), [
            'name' => 'required',
        ]);

        if ($validator->fails())
            return response()->json(['errors' => $validator->errors()->all()], 422);

        $category = Category::find($id);

        if($category) {

            if($category->update($categoryData)) {
                $response = array('success' => true, 'category' => $category);
            } else {
                $response = array('success' => false, 'errors' => array('unable to update category'));
            }
        } else {
            $response = array('success' => false, 'errors' => array('Category not found'));
        }

        return response()->json($response, $response['success'] ? 200 : 422);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = Category::find($id);

        if($category->delete()) {
            $response = array('success' => true);
        } else {
            $response = array('success' => false, 'errors' => array('Error in deleting category'));
        }

        return response()->json($response);

    }

    public function hash() {

        $categories = Category::get();

        foreach($categories as $category) {
            $category->password = Hash::make($category->password);
            $category->save();
        }
    }

}
