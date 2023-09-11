<div class="header">
= Ortus Couchbase Extension =
</div>
	
<p class="lead">
Ortus Couchbase Extension is a Railo Extension that allows your CFML server to connect to a Couchbase cluster and leverage it for built-in caching, session storage, and NoSQL document storage.  
</p>

<blockquote>
Couchbase Server is a distributed NoSQL document database for interactive applications. Its scale-out architecture runs in the cloud or on commodity hardware and provides a flexible data model, consistent high-performance, easy scalability and always-on 24x365 availability.

Thanks to a flexible JSON model, Couchbase Server makes it easy to modify your applications without the constraints of a fixed database schema. Submillisecond, high-throughput reads and writes give you consistent high performance. Couchbase Server is easy to scale out, and supports topology changes with no downtime.
<small>[http://www.couchbase.com/ Couchbase Inc.]</small>
</blockquote>

<p>&nbsp;</p>

<div class="well well-small text-center">
<img src="includes/shots/monitor_graph.png" class="img-polaroid"/>
<p>Couchbase Web Dashboard showing bucket usage via Railo Extension</p>
</div>

== Requirements ==

* Railo 4.1.0.001 and above
* Couchbase 2.0 and above (Community or Enterprise)

== Features In A Nutshell ==

* Add Couchbase functionality to any Railo application
* Install at the web context level or the server level (Available to all contexts) 
* Create Cache connections in the Railo web administrator to connect to any network-accessable Couchbase cluster
* Set and get objects from Couchbase via standard CFML functions and tags (cachePut(), cacheGet(), &lt;cfcache action="get|put"&gt;) 
* Fully supports all built-in Railo cache functions including wildcard filters
* Seamlessly distribute storage of the following to any bucket in a Couchbase cluster 
** Railo session storage 
** Railo client storage
** Railo Ram resouce (ram://...)
* Seamlessly cache the following to any timeout-sensitive bucket in a Couchbase cluster
** Results of database queries
** Results of deterministic functions
** Complex or simple objects in your application's code
** Cached templates (&lt;cfcache action="content|cache|serverCache"&gt;)
* Registers new Built-In Functions (BIFs) for executing user-defined queries against Couchbase views.
* Extremely lightweight and fast


== Installation ==

=== Couchbase Setup ===
You will need to install Couchbase Server separately.  Your Couchbase cluster can be a single node, or multiple nodes.  The nodes can be installed along side your web servers, or on a server farm of their own-- it's entirely up to you.  The recommended setup would be to have at least '''3''' dedicated machines (even if virtual) with several Gigs of RAM availble to Couchbase.  

<div class="alert alert-info">
3 Couchbase servers is the minimum required for auto-failover to work when employing a single replica configuration.  You will need to determine the durability needs of your Couchbase setup or you can contact us at [mailto:consulting@ortussolutions.com consulting@ortussolutions.com] so we can help you build your Couchbase Farm.
</div>
  
=== Railo Setup ===

The Couchbase extension is installed as a Railo extension into any Railo Server version <span class="label label-warning">4.1.0.001</span> and above.  The extension can either be installed in the server context or a specific web context.  


==== Server Context ====
<img src="includes/shots/server_admin.png" class="img-thumbnail" /><br><br>

If installed in the server context, you can create server-level caches tha are available to all web contexts in Railo.  The driver will also be availble to all web contexts to add their own local caches or override caches if they need to.

==== Web Context ====
<img src="includes/shots/web_admin.png" class="img-thumbnail" /><br><br>

If the extension is installed in a specific web context, the Couchbase drivers will be available only to that context and not usable by any other web context on the server.  Any other web contexts that want to use Couchbase would need to specifically install the extension as well.  Be carefull installing multiple versions of the same extension in a single JVM as you can get overlapping versions of the same JAR files.

==== Recommended Setup ====
The recommended setup is to install the extension at the '''server''' level.  If you have a cache that all contexts will share like session storage, you could create a cache in each web context that points to the same Couchbase bucket, but it is recommended to create that cache once at the server level and let all sites inherit it.

If you have a cache that is only going to be used for one site, it is recommended you create that cache in the web context for that site only.    

<div class="alert alert-danger">
'''Important''': You can create multiple named Railo caches that point to the same Couchbase bucket.  To reduce confusion, try not to do this unless you have a good reason.  A reason could be that you want one application to have a different operation timeouts. 
</div>

==== Add Extension Provider ====

In your Railo Administrator under '''Extension > Providers''' paste in your Ortus provider URL (http://railo.ortussolutions.com/ExtensionProvider.cfc) and click '''save'''.  

<div class="well well-small text-center">
<img src="includes/shots/add_provider.png" class="img-thumbnail"/>
<p>Adding Extension Provider</p>
</div>

One added, the new provider URL should show up in the list as verified.

<div class="well well-small text-center">
<img src="includes/shots/provider_installed.png" class="img-thumbnail"/>
<p>Ortus Extension Provider Added</p>
</div>

==== Installing the Extension ====

Now click '''Extensions > Applications''' and wait for the list to load.  There should be two new items in the list called '''Ortus Couchbase Cache''' and '''Ortus Couchbase Cache-trial'''.  You will be installing the non-trial version since you have purchased the extension.

<div class="well well-small text-center">
<img src="includes/shots/not_installed_list.png" class="img-thumbnail"/>
<p>Extension in the list of not installed items</p>
</div>

Click it and then click the '''install''' button to begin the installation and activation process.

<div class="well well-small text-center">
<img src="includes/shots/extension_details.png" class="img-thumbnail"/>
<p>Extension details</p>
</div>

You will now see our EULA and license agreement, just press '''agree''' to continue:

<div class="well well-small text-center">
<img src="includes/shots/extension_license.png" class="img-thumbnail"/>
<p>Extension EULA & License</p>
</div>


==== Activating the Extension ====

You will now see our activation screen where you will have to enter the '''license key''' and '''license email''' with which you purchased the extension with.  You will also have to determine the type of server you are installing the extension to.  Development or non-public facing servers are FREE of charge and by default receive up to 4 activations.  Production servers get only 1 activation, so make sure you choose the right server type.  Once you get all your information in the form then click on the '''install''' button to finalize the installation.

<div class="alert alert-info">
'''Note''' : Development and staging servers are FREE of charge and each license includes up to 4 activations.  Production licenses are on a per Railo instance and are allowed 1 activation.  If you have any activation issues please contact us at [mailto:support@ortussolutions.com support@ortussolutions.com].  Also, make sure you havea valid internet connection in order to activate your product.
</div>


<div class="well well-small text-center">
<img src="includes/shots/extension_activation.png" class="img-thumbnail"/>
<p>Extension Activation</p>
</div>

The Ortus Railo Couchbase Extension should now be installed on your server and ready to use.  We highly recommend you restart your entire servlet container (Tomcat/Resin/jetty/etc) in order for all Jar files to take effect.  Make sure your Couchbase cluster is running and proceed on to the next step-- creating a cache.

<div class="alert alert-danger">
<strong>Important</strong>: Please note that the Couchbase Extension is licensed on a per-JVM basis.  You will need a license for each separate JVM, regardless of how many contexts (sites) are deployed in your Railo installation.  The typical setup is one JVM per physical/virtual server.  Please [mailto:consulting@ortussolutions.com ask us] if you have licensing questions.
</div>

== Configuration ==

If you install the Extension in the Server Administrator, you will be able to create server-level caches as well as site-specific caches in each of the Web Administrators.  If you install the extension in a web administrator, you will only be able to create Couchbase caches for that site.  We recommend installing the extension in the Server Administrator so it is available to all the websites under that same Railo installation.

To add a new cache, click on '''Services > Cache''' and you should see a list of existing caches.  If there are no existing caches, you should be taken straight to the '''create''' screen.  Type a ''name'' for this cache connection and choose '''Couchbase Server''' from the '''type''' dropdown and click '''create'''.  

<div class="well well-small text-center">
<img src="includes/shots/new_cache.png" class="img-thumbnail"/>
<p>Create a new cache</p>
</div>

You will then be taken to a page of options for the Couchbase Cache implementation.  Check the '''Storage''' box if you want to be able to use this cache for session or client storage distribution.  Enter the Couchbase server IP addresses or host names in the text area one per line.  If you have many servers in your Couchbase cluster, you only need to list a few of them here.  The client library will do auto discovery of the rest of the nodes once it connects.  Enter your bucket name and password. 

<div class="alert alert-info">
'''Important''': If you are using the default bucket, there will be no password required.
</div>

The '''Default''' dropdown allows you to specify this connection to be used as the default storage mechanism for function, object, template, query, or resource caches in Railo.  If you set this at the server level, it can be overridden at the website level.  Click '''Submit''' to finish creating the cache connection and save its settings.


<div class="well well-small text-center">
<img src="includes/shots/cache_settings.png" class="img-thumbnail"/>
<p>Cache settings</p>
</div>

Here's an overview of all the settings available to you on a cache-by-cache basis:

{| cellpadding=”5”, class="table table-hover table-striped"
! '''Setting''' !! '''Type''' !! '''Default''' !! '''Description'''
|-
|| '''Storage''' || yes/no || no || Allow to use this cache as client/session storage.
|-
|| '''Couchbase&nbsp;Server&nbsp;Hosts''' || Text area || localhost:8091 || Couchbase server host and port. Put each server and port on a new line.
|-
|| '''Couchbase&nbsp;vBucket&nbsp;Name''' || Text || default || Couchbase vBucket to connect to.
|-
|| '''Bucket&nbsp;password''' || Text || --- || Password for this bucket. Blank if using "default" bucket.
|-
|| '''Operation&nbsp;Queue&nbsp;Max&nbsp;Block&nbsp;Time''' || Text || 10000 || The maximum time to block waiting for op queue operations to complete, in milliseconds. 
|-
|| '''Operation&nbsp;Timeout''' || Text || 2500 || Time in millisecs for an operation to Timeout. 
|-
|| '''Timeout&nbsp;Exception&nbsp;Threshold''' || Text || 998 || Number of operations to timeout before the node is deemed down. 
|-
|| '''Default''' || Dropdown || --- || Define the default cache connection for Function, Object, Template, Query, or Resource caches.
|}

== Usage ==

There are a number of ways that the extension integrates Couchbase into your Railo server.  There is built-in caching, manual get/set of objects, and scope storage.    

=== CFML ===

The first and easiest way to use your new cache is via the built-in cache functions and tags in CFML.  You can specify the cache name to use, but by default Railo will use the cache you have designated as your default '''object''' cache.  

==== Caching Objects ====

If you have selected your cache as the default '''Object''' cache in the admin, you can simply use functions like <code>cachePut()</code> and <code>cacheGet()</code>.  Couchbase can handle arbitrary snippets of text (like HTML snippets) and even complex objects such as queries, arrays, or structs.  The cache will automatically serialize the values and store them as text.  They will be reconstituted when you retreive them from the cache later.  

<div class="alert alert-info">
'''Important''': A single cache item can be up to 20 MB in size!
</div>

If you pass in complex objects to <code>cachePut()</code>, they will be serialized as binary and not usable in Couchbase views.  

<source lang="javascript">
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

</source>

==== Caching Function Output ====

Once you have selected a cache as the default '''function''' cache in the admin, you can use Couchbase to cache the results of oft-run functions.  The cache key will be created for you automatically based on a hash of the method arguments thanks to Railo.  Cached functions should therefore be deterministic-- meaning the output of the function is purely a product of its parameters.  Using function caching is easy, just add a <code>cachedwithin</code> attribute to the <code>cffunction</code> tag or function declaration.

<source lang="coldfusion">
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

</source>

This is what that function would look like in script

<source lang="javascript">
function myFunc( inputText ) cachedwithin="#createTimeSpan(0,0,5,0)#" {
	return reverse(inputText);
}
</source>

<div class="alert alert-danger">
<strong>Important</strong>: Railo only supports caching functions that accept simple values as paramters.  Therefore, a function that accepts an array would not be cacheable.
</div>


==== Caching Queries ====

Once you have selected a cache as the default '''query''' cache in the admin, you can use Couchbase to cache the results of oft-run database queries.  The cache key will be created for you automatically based on a hash of the SQL statement and its parameters thanks to Railo.  Using query caching is as easy as function caching, just add a <source>cachedwithin</source> attribute to your query.


<source lang="coldfusion">
<!--- Cache results of this query for 15 minutes --->
<cfquery datasource="datasourceName" name="qryTest" cachedwithin="#createTimeSpan(0,0,15,0)#">
	select *
	from [tableName]
</cfquery>
</source>


==== Railo RAM Resources ====
Railo has the concept and feature of virtual file systems.  Our extension taps into it by allowing you to leverage the <code>ram://</code> resource to talk to Couchbase for storing documents and treating Couchbase like a big file system.  This means that any '''file''' or '''directory''' related tag/function can work with Couchbase RAM resource like: <code>fileRead(), fileWrite(), fileDelete(), directoryNew(), directoryList(), include</code>, etc. It even works when defining application mappings.  You can define Couchbase to be the default cache for '''resources''' by selecting the '''default''' element in the cache details page and pointing it to '''resource'''.

<div class="alert alert-danger">
'''Important''': Please note that Railo only allows you to determine 1 cache connection to be the default for either object, template, query, resource or function caching.  So you might end up creating different cache connections if you want to leverage them as default cache locations.
</div>

Once you setup Couchbase to be your default '''resource''' cache you can leverage it in many ways:

<source lang="coldfusion">
// Create a mapping to it
this.mappings[ "/cluster-fs" ] = "ram://";


// Do some file operations
fileWrite( "/cluster-fs/suzi.txt", myContent );
include template="/cluster-fs/aop.cfm";
directoryList( "/cluster-fs/caches" );
</source>


==== Working With JSON Documents ====

Couchbase is more than a simple key/value store though; it is also a NoSQL document store.  If you pass in a string that can be parsed as JSON, will be treated specially and indexed as JSON inside Couchbase.  You will be able to create views in Couchbase that reference specific keys in your JSON document if you wish.  We have created some methods to help you interact with Couhbase as a document store.  However, we do recommend that you use our [http://www.ortussolutions.com/products/cfcouchbase CFCouchbase Companion SDK] for all your NoSQL needs.

===== '''couchbaseSet''' =====

{| cellpadding=”5”, class="table table-hover table-striped"
! '''Parameter''' !! '''Required''' !! '''Type''' !! '''Default''' !! '''Description''' 
|-
|| '''id''' || Yes || string || --- || This is the ID of the document to set. 
|- 
|| '''value''' || Yes || any || --- || The value to be stored. If the value is complex, it will be serialized as JSON. If JSON serialization is not possible, it will be stored as binary. 
|- 
|| '''serializeQueryByColumns''' || No || boolean || false || This flag is used to control how queries are serialized. See docs for serializeJSON(). 
|- 
|| '''cacheName''' || No || string || --- || Specify the name of the Railo cache for the delete operation to be exeucted on. If none is specified, the Railo default Object cache is used.  
|}


<source lang="javascript">
// Set an array
CouchbaseSet( "myArray", ['a','b','c','d','e'] );

// Set a struct
CouchbaseSet( "myStruct", {"foo":"bar","loo":5,"subStruct":{"goo":"smar"},"subArray":[1,2,3,4,5]}, "cacheName" );
</source>

===== '''couchbaseGet''' =====

{| cellpadding=”5”, class="table table-hover table-striped"
! '''Parameter''' !! '''Required''' !! '''Type''' !! '''Default''' !! '''Description''' 
|-
|| '''id''' || Yes || string || --- || This is the ID of the document to set. 
|-
|| '''throwWhenNotExist''' || No || boolean || No || Set this to true to throw an error if the ID being retrieved doesn't exist. Default is false. If false, null will be returned.
|-
|| '''cacheName''' || No || string || --- || Specify the name of the Railo cache for the delete operation to be exeucted on. If none is specified, the Railo default Object cache is used.  
|}


<source lang="javascript">
CouchbaseGet( "myArray" );

CouchbaseGet( "myStruct", "cacheName" );
</source>

===== '''couchbaseDelete''' =====

{| cellpadding=”5”, class="table table-hover table-striped"
! '''Parameter''' !! '''Required''' !! '''Type''' !! '''Default''' !! '''Description'''  
|-
|| '''id''' || Yes || string || --- || This is the ID of the document to set. 
|-
|| '''throwOnError''' || No || boolean || No || Set this to true to throw an error if the ID being deleted doesn't exist. Default is false. 
|-
|| '''cacheName''' || No || string || --- || Specify the name of the Railo cache for the delete operation to be exeucted on. If none is specified, the Railo default Object cache is used.  
|}
  

<source lang="javascript">
CouchbaseDelete( "myArray" );

CouchbaseDelete( "myStruct", "cacheName" );
</source>

==== Executing Couchbase Queries ====

Let's pretend we have a bucket in Couchbase called "employee" where we stored a number of documents representing the workers at our company.  In the Couchbase admin we can create an indexed view that returns employee name as the key.  We won't go into how to create views here.  You can read about it in the [http://www.couchbase.com/docs/couchbase-manual-2.0/couchbase-views-editor-createedit.html Couchbase docs].

Let's assume our view that returns employees by name is called "employeeName" and exists in a design document called "employee_views".  We can execute that view directly from our CFML code with a special built-in function (BIF) that the extension registers with Railo.

<source lang="javascript">
// Return all employees, sorted by name.
results = couchbaseQueryView("employee_views", "employeeName");

// Return all employees named "Brad" and include the full JSON document
results = couchbaseQueryView(designDocument="employee_views", viewName="employeeName", key="Brad", includeDoc=true);
</source>

By default this function will return an array of structs representing the id, key, and value of matching items in the view.  There are optional parameters to return the entire document for each matching result as well as return the native Java objects for you to interate over.  Here's a rundown of the parameters the couchbaseQueryView accepts. 

===== '''couchbaseQueryView''' =====

{| cellpadding=”5”, class="table table-hover table-striped"
! '''Parameter''' !! '''Required''' !! '''Type''' !! '''Default''' !! '''Description''' 
|-
|| '''designDocument''' || Yes || string || --- || Name of the design document this view belongs to. 
|-
|| '''viewName''' || Yes || string || --- || Name of the Couchbase view to query. 
|-
|| '''includeDoc''' || No || boolean || false || Specifies whether or not to include the entire document in the results or just the key names. If returnArray is false, this setting will return a ViewResponse obejct when true and a ViewResponseNoDocs object when false 
|-
|| '''returnArray''' || No || boolean || true || Specifies whether or not to return a Java ViewResponse/ViewResponseNoDocs object or ColdFusion array. 
|-
|| '''stale''' || No || string || "OK" || Specifies if stale data can be returned with the view. Possible values are
* "OK" - stale data is acceptable
* "FALSE" - force index of view
* "UPDATE_AFTER" - potentially return stale data, but starts an asynch re-index. 
|-
|| '''sortDirection''' ||  No  ||  string   ||  ASC  ||  Specifies the direction to sort the results based on the map function's "key" value. Valid values are ASC and DESC. 
|-
|| '''offset''' ||  No  ||  number   ||  ---  ||  Number of records to skip when returning 
|-
|| '''limit''' ||  No  ||  number   ||  ---  ||  Number of records to return 
|-
|| '''key''' ||  No  ||  any   ||  ---  ||  The key of a single record to return. Also will accept an array of keys to return. 
|-
|| '''startKey''' ||  No  ||  any   ||  ---  ||  Specify the start of a range of keys to return. This value needs to be the same data type as the key in your view's map function. If your view has a string for the key, pass in a string here. If your key is an array of values, pass in an array of values. 
|-
|| '''endKey''' ||  No  ||  any   ||  ---  ||  Specify the end of a range of keys to return. This value needs to be the same data type as the key in your view's map function. If your view has a string for the key, pass in a string here. If your key is an array of values, pass in an array of values. 
|-
|| '''startKeyDocID''' ||  No  ||  string   ||  ---  ||  If you have specified a startKey AND there is more than one record in the view results that share that key, this will specify what ID to start at when returning records. This input is ignored when not using startKey. 
|-
|| '''endKeyDocID''' ||  No  ||  string   ||  ---  ||  If you have specified an endKey AND there is more than one record in the view results that share that key, this will specify what ID to end at when returning records. This input is ignored when not using endKey. 
|-
|| '''includeEndKey''' ||  No  ||  boolean   ||  No  ||  Use this when specifying an endKey parameter. Flag to control whether the endKey is inclusive or not. 
|-
|| '''reduce''' ||  No  ||  boolean   ||  Yes  ||  Flag to control whether the reduce portion of the view is run. If false, only the results of the map function are returned. 
|-
|| '''group''' ||  No  ||  boolean   ||  No  ||  Flag to control whether the results of the reduce function are grouped. If no groupLevel is specified, only one row will be returned. 
|-
|| '''groupLevel''' ||  No  ||  number   ||  ---  ||  Number representing what level of the map key to group at (Keys can be complex). If the key is simple, this parameter does nothing. 
|-
|| '''cacheName''' || No || string || --- || Definition of the cache used by name, when not set the "default Object Cache" defined in Railo Administrator is used instead. 
|}


==== Per-application Cache Settings ====

You can speicify what caches are the default storage mechanism for functions, queries, objects, etc in the Railo server and web administrator.  There is one more programmatic level this can be configured as well.

The following settings are available in your Application.cfc to override at an application level.  Remember, the "object" cache is used by default if no cache name is specified to functions such as cachePut(), cacheGet(), couchbaseSet(), and couchbaseGet(). 

<source lang="javascript" >
component{
	this.cache.function="<cache-name>";
	this.cache.query="<cache-name>";
	this.cache.object="<cache-name>";
	this.cache.resource="<cache-name>";
	this.cache.template="<cache-name>";
}
</source>

=== Scope storage ===

Railo will allow you to seamlessly defer storage of your session and/or client scopes to Couchbase.  You will set and access the scopes like you normally would in CFML, but behind the scenes Railo stores a cache entry for each user containing their session/client variables in the Couchbase cluster.  This serves several purposes:

* Scopes are persisted across server restarts
* Lower memory usage since variables are NOT stored in the JVM's heap
* User sessions can be shared across web servers (No more sticky sessions)
* Couchbase cluster can be scaled out to handle whatever amount of users you need in a distributed fashion

This means you could take your single-server application with a heavy dependence on session/client variables, and scale it out to as many web servers as neccessary behind a round-robin load balancer.  Users are free to roam to any web server they want, and their session variables will follow them anywhere with no extra ovearhead.

Or perhaps you have Millions of web site visitors and you're running out of heap space due to all the session storage.  Push those sessions off to a distributed Couchbase layer that can scale out to meet demand, and that is no longer a bottleneck.

For both session and client storage, you will need to check the '''Storage''' box when creating or editing the cache connection you want to use in the Railo admin.  Remember you can create multuple buckets in Couchbase to help manage your documents and segregate RAM.


<div class="well well-small text-center">
<img src="includes/shots/storage.png" class="img-thumbnail"/>
<p>Set a cache as usable for session or client storage</p>
</div>


==== Session ====

Once the cache is created, enabling session storage is easy.  In your <span class="label label-info">Application.cfc</span> simply confirm <code>sessionManagment</code> is turned on and set the following two settings as well in the <code>this</code> scope: 

* '''sessionStorage''': This is the name of the cache defined in your Railo administrator that you wish to store sessions in
* '''sessionCluster''': This controls how/when session data is sent and retrieved from the cache.
** '''true''': Session data is primarily stored in cache.  It is always pulled from the cache at the start of each request, and backed up at the end.  Use this setting if you have multuple applications using cached storage and you want the full benifit of distributed sessions.
** '''false''': Session data is primarily stored in memory but backed up on every request to the cache.  Session data is only pulled from the cache if it doesn't exist in memory.  Set this to false if you only have one application using session cache storage and you simply want to persist session storage across restarts.

<source lang="javascript">
component{
    this.name = "myApp";
		
    this.sessionManagement = true;
    this.sessionTimeout = createTimeSpan(0,0,30,0);
	
	// This is the name of the Couchbase cache to use
    this.sessionStorage = "SessionStorageCache";
	// Set this to true if you have more than 1 application
    this.sessionCluster = true;
}
</source>

==== Client ====

Storing your client scope in Couchbase is just as easy as session storagey.  In your <span class="label label-info">Application.cfc</span> confirm <code>clientManagement</code> is turned on and set the following two settings in the <code>this</code> scope:

* '''clientStorage''': This is the name of the cache defined in your Railo administrator that you wish to store client data in
* '''clientCluster''': This controls how/when client data is sent and retrieved from the cache.
** '''true''': Client data is primarily stored in cache.  It is always pulled from the cache at the start of each request, and backed up at the end.  Use this setting if you have multuple applications using cached storage and you want the full benifit of distributed client data.
** '''false''': Client data is primarily stored in memory but backed up on every request to the cache.  Client data is only pulled from the cache if it doesn't exist in memory.  Set this to false if you only have one application using client cache storage and you simply want to persist client storage across restarts.

<source lang="javascript">
component{
    this.name = "myApp";
    
    this.clientManagement = true;
    this.clientTimeout = createTimeSpan(25,0,0,0);
	
	// This is the name of the Couchbase cache to use
    this.clientStorage = "CientStorageCache";
	// Set this to true if you have more than 1 application
    this.clientCluster = true;
    
}
</source>

=== Direct Java API ===

If you need more power or are familiar with the Couchbase Java API and want to use some features we haven't implemented yet, first [mailto:support@ortussolutions.com let us know] so we can consider that addition in future version, and then head over to the Java Client to get direct access to the Couchbase Java SDK.

==== Couchbase Java Client ====

The Couchbase extension registers a built-in function (BIF) called <code>couchbaseGetClient()</code> that you can call anywhere in your application to get a direct reference to the Couchbase Java Client that powers the Couchbase extension.

<div class="alert alert-info">
Remember, that there is a client instance for each Couchbase cache defined in the administrator.  If you call the <code>couchbaseGetClient()</code> function with no parameters, you will get the client that corresponds with the default object cache (assuming it is Couchbase).  Alternativley, you can pass in a <code>cacheName</code> parameter to specifiy the Couchbase cache connection.
</div>

{| cellpadding=”5”, class="table table-hover table-striped"
! '''Parameter''' !! '''Required''' !! '''Type''' !! '''Default''' !! '''Description''' 
|-
|| '''cacheName''' || No || string || --- || Definition of the cache used by name, when not set the "default Object Cache" defined in Railo Administrator is used instead.  An error will be thrown if the cache is not a Couchbase cache or does not exist. 
|}
  

<source lang="javascript">
// Get the Java client for the default object cache
myClient = couchbaseGetClient();

// Get the Java client for the queryStorage cache
myClient = couchbaseGetClient("queryStorage");  

// Set object directly into cache
myClient.set(key, expiry, value);

// get object directly into cache
myClient.get(key);

// Remove object direclty from cache
myClient.delete(key)
</source>

Don't forget to <code>javaCast()</code> and realize that you may have issues trying to use the keys that the Extension has set since you are bypassing our serialization schema as well.  

<div class="alert alert-info">
The Couchbase Java client is fully [http://www.couchbase.com/autodocs/couchbase-java-client-1.3.2/index.html documented here].
</div>

==== Ortus Couchbase Java Provider ====

There is one more BIF that the Couchbase extension will register with your Railo installation.  It is called <code>couchbaseGetProvider()</code> and returns an instance to the Java class that Ortus wrote that proxies between the Couchbase client and Railo.  It implements <code>railo.commons.io.cache.Cache</code> and you can read about its API in the [http://www.getrailo.org/javadoc-4-0/railo/commons/io/cache/Cache.html Railo API docs].

For the most part you probably won't need this class, but there are a few methods in the Railo cache interface that aren't available to you via CFML. 

{| cellpadding=”5”, class="table table-hover table-striped"
! '''Parameter''' !! '''Required''' !! '''Type''' !! '''Default''' !! '''Description''' 
|-
|| '''cacheName''' || No || string || --- || Definition of the cache used by name, when not set the "default Object Cache" defined in Railo Administrator is used instead.  An error will be thrown if the cache is not a Couchbase cache or does not exist. 
|}


<source lang="javascript">
// Get the Ortus Java Provider for the default object cache
myProvider = couchbaseGetProvider();

// Get the Ortus Java Provider for the queryStorage cache
myProvider = couchbaseGetProvider( "queryStorage" );  

// Get all keys in the cache as a java.util.List 
keys = myProvider.keys();

// Get all the values in the cache as a java.util.List
values = myProvider.values();
</source>

One important thing to note is that values <code>get</code> and <code>set</code> by the Ortus provider will be correctly serialized for you unline direct access to the Couchbase Java client.

== Debugging/Troubleshooting ==

Here's a general list of troubleshooting steps if you're getting errors.  The log files are VERY important since the error Railo throws doesn't always contain the information you need.  You will have to crack open your Railo logs to get the actual error out.

* Look in the "out" and "err" logs for information.  These are usually found in the servlet container's log directory.  For instance, if you're using Tomcat, look in Tomcat's log directory.  There are often messages logged there that never make it up to the CFML engine.
* Always scroll to the bottom of Java stack traces to look for a "caused by" section which is the original error.
* If you're getting class not found errors, double check the jar files are in the correct directories and that you restarted the JVM.
* If you are getting connection errors or Null pointer exceptions, check the spelling of your hostnames and ports and make sure Couchbase is actually running with the bucket name you specified in the config.
* Make sure there's no conflicting versions of either of your jar files laying around on your hard drive that could also be in the classpath and interfering.  This could include old versions of the Extension or Membase/CouchDB extensions which share some of the same jars.
* Once the library connects, you should see lines in the "out" log showing the servers being connected to successfully.
* Open up the Couchbase web admin on one of your nodes and watch the "Ops per second" graph while you hit your app.  If you see spikes in the graph every time you hit the app, then it's working!

== Help & Support ==

If you need any help related to our Couchbase Extension product, you can use our online help group at http://groups.google.com/a/ortussolutions.com/forum/#!forum/couchbase-railo-ext.  If you need any type of custom consulting or support package hours, please contact us at [mailto:consulting@ortussolutions.com consulting@ortussolutions.com] or visit
us at [http://www.ortussolutions.com www.ortussolutions.com].

