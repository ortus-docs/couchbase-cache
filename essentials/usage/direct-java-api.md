---
description: Go funky with the Couchbase extension
---

### Direct Java API

If you need more power or are familiar with the Couchbase Java API and want to use some features we haven\'t implemented yet, first [let us know](mailto:support@ortussolutions.com) so we can consider that addition in future version, and then head over to the Java Cluster to get direct access to the Couchbase Java SDK.

#### Couchbase Java Cluster

The Couchbase extension registers a built-in function (BIF) called `couchbaseGetCluster()` that you can call anywhere in your application to get a direct reference to the Couchbase Java Cluster that powers the Couchbase extension.

Returns the instance of the Couchbase Java
`com.couchbase.client.java.Cluster` that corresponds with a cache
defined in the Lucee admin. Pass in the name of a cache, or it will
default to the object cache.

| **Parameter** | **Required** | **Type** | **Default** | **Description** |
| ------------- | ------------ | -------- | ----------- | --------------- |
| **cacheName** | No           | string   | \-\--       | Definition of the cache used by name, when not set the \"default Object Cache\" defined in Lucee Administrator is used instead. An error will be thrown if the cache is not a Couchbase cache or does not exist. |

#### Couchbase Java Bucket

The Couchbase extension registers a built-in function (BIF) called `couchbaseGetBucket()` that you can call anywhere in your application to get a direct reference to the Couchbase Java Bucket that powers the Couchbase extension.

Returns the instance of the Couchbase Java `com.couchbase.client.java.Bucket` that corresponds with a cache defined in the Lucee admin. Pass in the name of a cache, or it will default to the object cache.


Remember, that there is a Bucket instance for each Couchbase cache
defined in the administrator. If you call the `couchbaseGetBucket()`
function with no parameters, you will get the Bucket that corresponds
with the default object cache (assuming it is Couchbase). Alternativley,
you can pass in a `cacheName` parameter to specifiy the Couchbase cache
connection.

| **Parameter** | **Required** | **Type** | **Default** | **Description** |
| ------------- | ------------ | -------- | ----------- | --------------- |
| **cacheName** | No           | string   | \-\--       | Definition of the cache used by name, when not set the \"default Object Cache\" defined in Lucee Administrator is used instead. An error will be thrown if the cache is not a Couchbase cache or does not exist. |

``` {.javascript}
// Get the Java Bucket for the default object cache
myBucket = couchbaseGetBucket();

// Get the Java Bucket for the queryStorage cache
myBucket = couchbaseGetBucket( 'queryStorage' );  
```

Don\'t forget to `javaCast()` and realize that you may have issues trying to use the keys that the Extension has set since you are bypassing our serialization schema as well.

The Couchbase Java SDK is fully [documented here](http://docs.couchbase.com/sdk-api/couchbase-java-client-2.0.3/).

#### Ortus Couchbase Java Provider {#ortus_couchbase_java_provider}
 There is one more BIF that the Couchbase extension will register with your Lucee installation. It is called `couchbaseGetProvider()` and returns an instance to the Java class that Ortus wrote that proxies between the Couchbase client and Lucee. It implements `lucee.commons.io.cache.Cache` and you can read about its API in the [Lucee /commons/io/cache/Cache.html Lucee API docs](http://www.getluceeorg/javadoc-4-0/).

For the most part you probably won\'t need this class, but there are a few methods in the Lucee cache interface that aren\'t available to you via CFML.

| **Parameter** | **Required** | **Type** | **Default** | **Description** |
| ------------- | ------------ | -------- | ----------- | --------------- |
| **cacheName** | No           | string   | \-\--       | Definition of the cache used by name, when not set the \"default Object Cache\" defined in Lucee Administrator is used instead. An error will be thrown if the cache is not a Couchbase cache or does not exist. |

``` {.javascript}
// Get the Ortus Java Provider for the default object cache
myProvider = couchbaseGetProvider();

// Get the Ortus Java Provider for the queryStorage cache
myProvider = couchbaseGetProvider( "queryStorage" );  

// Get all keys in the cache as a java.util.List 
keys = myProvider.keys();

// Get all the values in the cache as a java.util.List
values = myProvider.values();
```

One important thing to note is that values `get` and `set` by the Ortus provider will be correctly serialized for you unline direct access to the Couchbase Java client.
