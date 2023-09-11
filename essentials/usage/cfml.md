---
description: Use Couchbase from CFML natively
---

# CFML

The first and easiest way to use your new cache is via the built-in cache functions and tags in CFML. You can specify the cache name to use, but by default Lucee will use the cache you have designated as your default **object** cache.

## Caching Objects

If you have selected your cache as the default **Object** cache in the admin, you can simply use functions like `cachePut()` and `cacheGet()`. Couchbase can handle arbitrary snippets of text (like HTML snippets) and even complex objects such as queries, arrays, or structs. The cache will automatically serialize the values and store them as text. They will be reconstituted when you retreive them from the cache later.

**Important**: A single cache item can be up to 20 MB in size!

If you pass in complex objects to `cachePut()`, they will be serialized as binary and not usable in Couchbase views.

``` {.javascript}
// Set a simple value into the default "object" cache for 2 days
cachePut( "key", "value", 2 );
// Get that value back
cacheGet( "key" );

// Set a value into a specific cache for 1 day
cachePut( "key", "value", 1, "myCacheName" );
// Get that value back
cacheGet( "key", "myCacheName" );

// Cache this array for 3 hours
cachePut( "myArray", [1,2,3,4,5], createTimeSpan(0,3,0,0) );
```

## Caching Function Output

Once you have selected a cache as the default **function** cache in the admin, you can use Couchbase to cache the results of oft-run functions. The cache key will be created for you automatically based on a hash of the method arguments thanks to Lucee. Cached functions should therefore be deterministic\-- meaning the output of the function is purely a product of its parameters. Using function caching is easy, just add a `cachedwithin` attribute to the `cffunction` tag or function declaration.

``` {.cfml}
<!--- Cache results of this function for 5 minutes --->
<cffunction name="myFunc" cachedwithin="#createTimeSpan(0,0,5,0)#">
    <cfargument name="inputText">
    
    <cfreturn reverse(inputText)>
</cffunction>

<!--- First execution stores result in cache --->
<cfset result = myFunc("Brad Wood")>

<!--- subsequent call skips execution and pulls results from cache --->
<cfset result = myFunc("Brad Wood")>

<!--- Different parameters will create a new cache entry --->
<cfset result = myFunc("Luis Majano")>
```

This is what that function would look like in script

``` {.javascript}
function myFunc( inputText ) cachedwithin="#createTimeSpan(0,0,5,0)#" {
    return reverse(inputText);
}
```

`<strong>`{=html}Important`</strong>`{=html}: Lucee only supports caching functions that accept simple values as paramters. Therefore, a function that accepts an array would not be cacheable.

## Caching Queries {#caching_queries}

Once you have selected a cache as the default **query** cache in the admin, you can use Couchbase to cache the results of oft-run database queries. The cache key will be created for you automatically based on a hash of the SQL statement and its parameters thanks to Lucee. Using query caching is as easy as function caching, just add a `cachedwithin` attribute to your query.

``` {.coldfusion}
<!--- Cache results of this query for 15 minutes --->
<cfquery datasource="datasourceName" name="qryTest" cachedwithin="#createTimeSpan(0,0,15,0)#">
    select *
    from [tableName]
</cfquery>
```

## Lucee RAM Resources {#lucee_ram_resources}

Lucee has the concept and feature of virtual file systems. Our extension taps into it by allowing you to leverage the `ram://` resource to talk to Couchbase for storing documents and treating Couchbase like a big file system. This means that any **file** or **directory** related tag/function can work with Couchbase RAM resource like: `fileRead(), fileWrite(), fileDelete(), directoryNew(), directoryList(), include`, etc. It even works when defining application mappings. You can define Couchbase to be the default cache for **resources** by selecting the **default** element in the cache details page and pointing it to **resource**.

```{=html}
<div class="alert alert-danger">
```
**Important**: Please note that Lucee only allows you to determine 1 cache connection to be the default for either object, template, query, resource or function caching. So you might end up creating different cache connections if you want to leverage them as default cache locations.

```{=html}
</div>
```
Once you setup Couchbase to be your default **resource** cache you can leverage it in many ways:

``` {.coldfusion}
// Create a mapping to it
this.mappings[ "/cluster-fs" ] = "ram://";


// Do some file operations
fileWrite( "/cluster-fs/suzi.txt", myContent );
include template="/cluster-fs/aop.cfm";
directoryList( "/cluster-fs/caches" );
```

## Per-application Cache Settings {#per_application_cache_settings}

You can speicify what caches are the default storage mechanism for functions, queries, objects, etc in the Lucee server and web administrator. There is one more programmatic level this can be configured as well.

The following settings are available in your `Application.cfc` to override at an application level. Remember, the \"object\" cache is used by default if no cache name is specified to functions such as cachePut() and cacheGet().

You can also define an entire cache in your `Application.cfc` which makes your configuration completely portable.

``` {.javascript}
component{
    
    this.cache[ '<cache-name>' ] = {
        class = 'ortus.extension.cache.couchbase.CouchbaseCache',
        storage=false,
        custom={
            bucketName='default',
            password = '',
            connectTimeout = 5000,
            disconnectTimeout = 25000,
            queryTimeout = 75000,
            kvTimeout = 2500
        }
    };
    
    this.cache.function="<cache-name>";
    this.cache.query="<cache-name>";
    this.cache.object="<cache-name>";
    this.cache.resource="<cache-name>";
    this.cache.template="<cache-name>";
}
```
