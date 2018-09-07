<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Product;
use Hash;
use DB;
use Validator;
use Auth;

class ProductController extends Controller
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
        $productRequest = $request->input();

        $perPage = !empty($productRequest['perPage']) ? $request['perPage'] : false;
        $orderBy = !empty($productRequest['orderBy']) ? $productRequest['orderBy'] : 'products.name';
        $order = !empty($productRequest['order']) ? $productRequest['order'] : 'ASC';
        $page =  !empty($productRequest['page']) ? $productRequest['page'] : false;

        $products = Product::select('products.*', 'categories.id as category_id', 'categories.categorypath')
                           ->leftjoin('categories', 'categories.id', '=', 'products.category_id');

        if(isset($productRequest['q'])) {

            $binding = '%'.$productRequest['q'].'%';

            $products = $products->where('products.name', 'LIKE', '%'.$binding.'%')
                           ->orWhere('email', 'LIKE', '%'.$productRequest['q'].'%');
        }

        $count = $products->count();

        if($perPage)
            $products = $products->take($perPage);

        if($page)
            $products = $products->skip(($page - 1) * $perPage);

        if($orderBy)
            $products = $products->orderBy($orderBy, $order);

        $products = $products->get();

        $response = array('success' => true, 'products' => $products, 'count' => $count);

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
        $productData = $request->input();

        $validator = Validator::make($productData, [
            'name' => 'required',
            'description' => 'required',
            'price' => 'required',
            'available' => 'required'
        ]);

        if ($validator->fails())
            return response()->json(['errors' => $validator->errors()->all()], 422);

        $product = Product::create($productData);

        if($product) {
            $response = array('success' => true, 'product' => $product);
        } else {
            $response = array('success' => false, 'errors' => array('error in creating product'));
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
        $product = Product::find($id);

        if($product) {
            $response = array('success' => true, 'product' => $product);
        } else {
            $response = array('success' => false, 'errors' => array('Product not found'));
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
        $productData = $request->input();

        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'description' => 'required',
            'price' => 'required',
            'available' => 'required'
        ]);

        if ($validator->fails())
            return response()->json(['errors' => $validator->errors()->all()], 422);

        $product = Product::find($id);

        if($product) {

            if($product->update($productData)) {
                $response = array('success' => true, 'product' => $product);
            } else {
                $response = array('success' => false, 'errors' => array('unable to update product'));
            }
        } else {
            $response = array('success' => false, 'errors' => array('Product not found'));
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
        $product = Product::find($id);

        if($product->delete()) {
            $response = array('success' => true);
        } else {
            $response = array('success' => false, 'errors' => array('Error in deleting product'));
        }

        return response()->json($response);

    }

    public function hash() {

        $products = Product::get();

        foreach($products as $product) {
            $product->password = Hash::make($product->password);
            $product->save();
        }
    }

}
