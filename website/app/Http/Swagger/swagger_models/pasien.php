<?php

/**
  * @OA\Get(
  *      path="/v1/entities/pasien",
  *      operationId="browsePasien",
  *      tags={"pasien"},
  *      summary="Browse Pasien",
  *      description="Returns list of Pasien",
  *      @OA\Response(response=200, description="Successful operation"),
  *      @OA\Response(response=400, description="Bad request"),
  *      @OA\Response(response=401, description="Unauthorized"),
  *      @OA\Response(response=402, description="Payment Required"),
  *      security={
  *          {"bearerAuth": {}}
  *      }
  * )
  *
  */

/**
  * @OA\Get(
  *      path="/v1/entities/pasien/read?slug=pasien&id={id}",
  *      operationId="readPasien",
  *      tags={"pasien"},
  *      summary="Get Pasien based on id",
  *      description="Returns Pasien based on id",
  *      @OA\Parameter(
  *          name="id",
  *          required=true,
  *          in="path",
  *          @OA\Schema(
  *              type="integer"
  *          )
  *      ),
  *      @OA\Response(response=200, description="Successful operation"),
  *      @OA\Response(response=400, description="Bad request"),
  *      @OA\Response(response=401, description="Unauthorized"),
  *      @OA\Response(response=402, description="Payment Required"),
  *      security={
  *          {"bearerAuth": {}}
  *      }
  * )
  *
  */

/**
  * @OA\Post(
  *      path="/v1/entities/pasien/add",
  *      operationId="addPasien",
  *      tags={"pasien"},
  *      summary="Insert new Pasien",
  *      description="Insert new Pasien into database",
  *      @OA\RequestBody(
  *         @OA\MediaType(
  *             mediaType="application/json",
  *             @OA\Schema(
  *                 @OA\Property(
  *                     property="data",
  *                     type="object",
  *                     example={"id":"123", "ktpId":"", "bpjsId":"", "alergiId":"", "rsId":"", "nama":"Abc", "tmpLahir":"Abc", "tglLahir":"Abc", "alamat":"Abc", "goldar":"Abc", "nik":"123", "jenkel":"Abc", "keterangan":"Abc", "tglCatat":"Abc"},
  *                 ),
  *             )
  *         )
  *      ),
  *      @OA\Response(response=200, description="Successful operation"),
  *      @OA\Response(response=400, description="Bad request"),
  *      @OA\Response(response=401, description="Unauthorized"),
  *      @OA\Response(response=402, description="Payment Required"),
  *      security={
  *          {"bearerAuth": {}}
  *      }
  * )
  *
  */

/**
  * @OA\Put(
  *      path="/v1/entities/pasien/edit",
  *      operationId="editPasien",
  *      tags={"pasien"},
  *      summary="Edit an existing Pasien",
  *      description="Edit an existing Pasien",
  *      @OA\RequestBody(
  *         @OA\MediaType(
  *             mediaType="application/json",
  *             @OA\Schema(
  *                 @OA\Property(
  *                     property="data",
  *                     type="object",
  *                     example={"id":"123", "ktpId":"", "bpjsId":"", "alergiId":"", "rsId":"", "nama":"Abc", "tmpLahir":"Abc", "tglLahir":"Abc", "alamat":"Abc", "goldar":"Abc", "nik":"123", "jenkel":"Abc", "keterangan":"Abc", "tglCatat":"Abc"},
  *                ),
  *             )
  *         )
  *     ),
  *      @OA\Response(response=200, description="Successful operation"),
  *      @OA\Response(response=400, description="Bad request"),
  *      @OA\Response(response=401, description="Unauthorized"),
  *      @OA\Response(response=402, description="Payment Required"),
  *      security={
  *          {"bearerAuth": {}}
  *      }
  * )
  *
  */

/**
  * @OA\Delete(
  *      path="/v1/entities/pasien/delete",
  *      operationId="deletePasien",
  *      tags={"pasien"},
  *      summary="Delete one record of Pasien",
  *      description="Delete one record of Pasien",
  *      @OA\RequestBody(
  *         @OA\MediaType(
  *             mediaType="application/json",
  *             @OA\Schema(
  *                 @OA\Property(
  *                     property="slug",
  *                     example="pasien",
  *                     type="string"
  *                 ),
  *                 @OA\Property(
  *                     property="data",
  *                     type="array",
  *                     @OA\Items(
  *                         type="object",
  *                         @OA\Property(type="string", property="field", default="id"),
  *                         @OA\Property(type="integer", property="value", example="123"),
  *                     ),
  *                ),
  *             )
  *         )
  *     ),
  *      @OA\Response(response=200, description="Successful operation"),
  *      @OA\Response(response=400, description="Bad request"),
  *      @OA\Response(response=401, description="Unauthorized"),
  *      @OA\Response(response=402, description="Payment Required"),
  *      security={
  *          {"bearerAuth": {}}
  *      }
  * )
  *
  */

/**
  * @OA\Delete(
  *      path="/v1/entities/pasien/delete-multiple",
  *      operationId="deleteMultiplePasien",
  *      tags={"pasien"},
  *      summary="Delete multiple record of Pasien",
  *      description="Delete multiple record of Pasien",
  *      @OA\RequestBody(
  *         @OA\MediaType(
  *             mediaType="application/json",
  *             @OA\Schema(
  *                 @OA\Property(
  *                     property="slug",
  *                     example="pasien",
  *                     type="string"
  *                 ),
  *                 @OA\Property(
  *                     property="data",
  *                     type="array",
  *                     @OA\Items(
  *                         type="object",
  *                         @OA\Property(type="string", property="field", default="ids"),
  *                         @OA\Property(type="{}", property="value", example="123,123"),
  *                     ),
  *                ),
  *             )
  *         )
  *     ),
  *      @OA\Response(response=200, description="Successful operation"),
  *      @OA\Response(response=400, description="Bad request"),
  *      @OA\Response(response=401, description="Unauthorized"),
  *      @OA\Response(response=402, description="Payment Required"),
  *      security={
  *          {"bearerAuth": {}}
  *      }
  * )
  *
  */

/**
  * @OA\Put(
  *      path="/v1/entities/pasien/sort",
  *      operationId="sortPasien",
  *      tags={"pasien"},
  *      summary="Sort existing Pasien",
  *      description="Sort existing Pasien",
  *      @OA\RequestBody(
  *         @OA\MediaType(
  *             mediaType="application/json",
  *             @OA\Schema(
  *                 @OA\Property(
  *                     property="slug",
  *                     example="pasien",
  *                     type="string"
  *                 ),
  *                 @OA\Property(
  *                     property="data",
  *                     type="array",
  *                     example={{"id":"123", "ktpId":"", "bpjsId":"", "alergiId":"", "rsId":"", "nama":"Abc", "tmpLahir":"Abc", "tglLahir":"Abc", "alamat":"Abc", "goldar":"Abc", "nik":"123", "createdAt":"2021-01-01T00:00:00.000Z", "updatedAt":"2021-01-01T00:00:00.000Z", "jenkel":"Abc", "keterangan":"Abc", "tglCatat":"Abc"}, {"id":"123", "ktpId":"", "bpjsId":"", "alergiId":"", "rsId":"", "nama":"Abc", "tmpLahir":"Abc", "tglLahir":"Abc", "alamat":"Abc", "goldar":"Abc", "nik":"123", "createdAt":"2021-01-01T00:00:00.000Z", "updatedAt":"2021-01-01T00:00:00.000Z", "jenkel":"Abc", "keterangan":"Abc", "tglCatat":"Abc"}},
  *                     @OA\Items(
  *                         type="object",
  *                         @OA\Property(type="integer", property="id"), 
  *                         @OA\Property(type="string", property="ktpId"), 
  *                         @OA\Property(type="string", property="bpjsId"), 
  *                         @OA\Property(type="string", property="alergiId"), 
  *                         @OA\Property(type="string", property="rsId"), 
  *                         @OA\Property(type="string", property="nama"), 
  *                         @OA\Property(type="string", property="tmpLahir"), 
  *                         @OA\Property(type="string", property="tglLahir"), 
  *                         @OA\Property(type="string", property="alamat"), 
  *                         @OA\Property(type="string", property="goldar"), 
  *                         @OA\Property(type="integer", property="nik"), 
  *                         @OA\Property(type="string", property="createdAt"), 
  *                         @OA\Property(type="string", property="updatedAt"), 
  *                         @OA\Property(type="string", property="jenkel"), 
  *                         @OA\Property(type="string", property="keterangan"), 
  *                         @OA\Property(type="string", property="tglCatat"),
  *                     ),
  *                ),
  *             )
  *         )
  *     ),
  *      @OA\Response(response=200, description="Successful operation"),
  *      @OA\Response(response=400, description="Bad request"),
  *      @OA\Response(response=401, description="Unauthorized"),
  *      @OA\Response(response=402, description="Payment Required"),
  *      security={
  *          {"bearerAuth": {}}
  *      }
  * )
  *
  */