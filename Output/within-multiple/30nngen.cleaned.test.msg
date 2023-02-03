[bs-138] Add categories (secure,open) to EndpointsProperties
Propagate retryWrites flag from connection URI to ReactiveMongoClient    Closes gh-14032
Add the ability to disable the trace filter    See gh-8650
Rename internal OutputCapture classes    Rename the internal versions of OutputCapture to prevent accidental  import.    See gh-5492
Align simple sample with configuration properties validation change    See gh-8024
Simplify some code    See gh-17860
Change package name in sample
Remove autowired injection of HealthIndicators into HealthEndpoint    Moved into EndpointAutoConfiguration
Support binding to collection with EnumSet values    Fixes gh-15539
[bs-138] Add categories (secure,open) to EndpointsProperties
Deprecate/move CGLIB methods AopUtils=>ClassUtils  isCglibProxy* methods in AopUtils are useful in lower-level modules, i.e. those that cannot depend on .aop.  Therefore copied these methods to ClassUtils; deprecated the existing ones in AopUtils and now delegating to the new location; switched all usage of AopUtils#isCglibProxy* within the framework to use ClassUtils#isCglibProxy* instead.
Use String indexOf(char) and lastIndexOf(char) where possible    Closes gh-11416
Investigate issue with @ComponentScan as meta-annotation  This commit introduces unit and integration tests that attempt to reproduce the issue claimed by the reporter in SPR-11557. However, the tests pass without any problems.  Issue: SPR-11557
Clean grapes before tests
Polish 'Add separate property for Redis read and connection timeout'    See gh-23137
Improve DefaultCookieSerializer auto-configuration    Spring Session's own configuration support (i.e.  SpringHttpSessionConfiguration) will configure the default  DefaultCookieSerializer with rememberMeRequestAttribute if  SpringSessionRememberMeServices bean has been detected in the  application context.    In contrast, Spring Boot's auto-configured DefaultCookieSerializer does  not do this which results in a different out-of-the-box experience for  users that rely on Spring Session's remember-me integration.    This commit improves Spring Session DefaultCookieSerializer  auto-configuration to match Spring Session's behavior and make the  auto-configured DefaultCookieSerializer aware of  SpringSessionRememberMeServices bean.    See gh-16513
Rename VanillaHealthIndicator to Application...    Rename `VanillaHealthIndicator` to `ApplicationHealthIndicator` and  changed the exposed bean name from `statusHealthIndicator` to  `applicationHealthIndicator`.    This provides less confusing JSON output:      {'status':'UP','application':{'status':'UP'}}    vs:      {'status':'UP','status':{'status':'UP'}}    Fixes gh-1291
Ignore unresolvable nested placeholders  The NamePatternEnvironmentFilter used to throw an exception if  placeholders in property values could not be resolved.    Fixes gh-8510
Make sure Caching is initialized before JPA support    The second level cache of Hibernate can be configured with dedicated  factories that look up for the presence of a cache infrastructure. As  Hibernate shouldn't have to know about Spring, that lookup is done  against the respective proprietary APIs.    We now make sure that caching (and the general purpose Hazelcast  auto-configuration) is fully processed before JPA kicks in. In particular  an explicit `dependsOn` attribute on those beans is added when they are  processed.    Closes gh-4158
Fix @ConfigurationProperties on @Bean methods without metadata caching    Due to a current limitation of Spring Framework, when bean metadata  caching is disabled, a merged bean definition may have a null  resolved factory method that would have been non-null if bean metadata  caching was enabled. Configuration property binding for @Bean methods  annotated with @ConfigurationProperties relied upon the resolved  factory method being enabled to find the @ConfigurationProperties  annotation and trigger property binding. As a result, when bean  metadata caching is disabled on the bean factory, such  @ConfigurationProperties beans would not be bound.    This commit works around the limitation by adding a fallback that  performs a reflection-based search for the factory method when the  resolved factory method on the bean definition is null. This allows  the bean's factory method and any @ConfigurationProperties annotation  on it to be found, ensuring that propoerty binding is then performed.    Fixes gh-18440
Polish 'Reduce redis health indicator info command result size'    See gh-24208
Guard IntegrationJmxConfiguration if no mBeanServer is available    Closes gh-12966
Properly discover endpoints that are proxied    Previously to this commit, if a `@ControllerEndpoint`,  `@RestControllerEndpoint` or `@ServletEndpoint` annotated bean was  proxied, the endpoint wasn't properly detected.    This commit makes sure that annotation retrieval works on the user class  while preserving the get (vs. find) retrieval semantic    Closes gh-12441
Properly handle InvalidEndpointRequestException    This commit makes sure that `InvalidEndpointRequestException` is wrapped  in a `ReflectionException` when invoked via JMX.    Closes gh-12857
Use String indexOf(char) and lastIndexOf(char) where possible    Closes gh-11416
Use sorted properties to make build info output repeatable    Closes gh-14494
Use entrySet() rather than using keySet() and then calling get(key)    Closes gh-4813
Make devtools set spring.messages.reloadable=true    Update `DevToolsPropertyDefaultsPostProcessor` to automatically set  the recently introduced `spring.messages.reloadable` property to  `true`.    Closes gh-14699
Fail if management.server.address is set but actuator is on the same port    Closes gh-22187
Support binding to collection with EnumSet values    Fixes gh-15539
Add profiles directly to the application environment for tests    Prior to this commit, active profiles were being added to the Spring Boot  application environment by setting the `spring.profiles.active` property.  This could result in profiles getting parsed differently than other uses of `@ActiveProfiles`.  Setting the profiles directly in the `Environment` prevents this parsing.    See gh-19556
Fix relaxed binding of SI JMX config    Instead of using an expression for JMX-related properties, this commit  properly honors relaxed binding.    Closes gh-6184
Apply gridFsDatabase to auto-configured ReactiveGridFsTemplate    Closes gh-18284
Fix startup failure when WebFlux auto-config is skipped    Prior to this commit, the `HttpHandlerAutoConfiguration` would rely on  the `WebFluxProperties` bean being present - this is most of the time  true when the appplication is using the WebFlux auto-configuration.    If the application is overriding the WebFlux auto-configuration and  providing its own setup, the properties bean is not present and we  should skip its usage.    Fixes gh-20891
Prevent serialization exception from Env actuator    When `EnvironmentEndpoint` is building a response to return to the  web infrastructure, it creates a data structure containing all  property values from all property sources. Prior to this commit, it  was possible for the response data structure to contain property  values that were not serializable to JSON by Jackson, which would  cause an exception to be thrown by the web infrastructure. This  commit ensures the data structure is serializable to JSON by  ensuring property values are primitives or Strings, and returning  a placeholder value if a property value is of any other type.    Fixes gh-23805
Fix Flyway and Liquibase JPA 'depends-on' setup    Ensure that FlywayAutoConfiguration and LiquibaseAutoConfiguration occur  after HibernateJpaAutoConfiguration so that the DependsOnPostProcessor  condition can correctly check for a LocalContainerEntityManagerFactory  bean.    Fixes gh-3437
Add Jetty SSL keystore in classpath test    Update JettyEmbeddedServletContainerFactoryTests to test loading an  SSL keystore from the classpath. Currently this is a Jetty only feature,  although if https://issues.apache.org/bugzilla/show_bug.cgi?id=56777 is  fixed we could do the same thing with Tomcat.    Closes gh-1943
Add ApplicationContext to the EmbeddedServletContainerInitializedEvent
Add extra @Conditional to be defensive in Social autoconfig    Older versions of Spring Social will not have the SocialConfigurerAdapter  so making social autoconfig conditional on that class makes sense (since it  all extends from it).    Fixes gh-986
Consistent use of @AliasFor    Closes gh-10836
Add the ability to disable the trace filter    See gh-8650
Add contextPath LocalHostUriTemplateHandler URIs    Update `LocalHostUriTemplateHandler` so that the `server.context-path`  property is also considered when building the URL.    Fixes gh-6904  Closes gh-6919
Add Jetty SSL keystore in classpath test    Update JettyEmbeddedServletContainerFactoryTests to test loading an  SSL keystore from the classpath. Currently this is a Jetty only feature,  although if https://issues.apache.org/bugzilla/show_bug.cgi?id=56777 is  fixed we could do the same thing with Tomcat.    Closes gh-1943
Add 'client-name' property to specify a Redis client name    See gh-17330
Make all @Bean methods public    Fixes gh-1571
Be slightly more defensive in DataSource initialization    Adding an Order to the BeanPostProcessor and catching an exception  are enough to get a simple web app with @EnableGlobalMethodSecurity  and JDBC user details running. It actually doesn't solve an underlying  problem in Spring Security, but I'll deal with that separately.    See gh-1115
Fail fast when attempting to repackage a reproducible war    Maven's war plugin does not support reproducible builds, resulting in  the entries in the war file not being written in a consistent order  from build to build.    Closes gh-20176
Fix injection point with proxied DataSource    Prior to this commit, the `ApplicationContext` couldn't start with a  JDK-proxied `HikariDataSource` as the JMX auto-configuration was  attempting to inject a (too narrowed) `HikariDataSource`.    This commit rather injects a regular `DataSource` and attempt to unwrap  it as a `HikariDataSource`.    Closes gh-12271
Add local-datacenter property for Cassandra    The Cassandra v4 driver does not longer have automatic local DC inference  from contact points. As a result, the 'local-datacenter' property must be  set with the default load balancing policy and the contact points must  be of that data center.    This commit adds a new property for the local datacenter so that it can  be specified without the use of a customizer.    Closes gh-19779
Apply gridFsDatabase to auto-configured ReactiveGridFsTemplate    Closes gh-18284
Add Redis Sentinel database support    See gh-12556
Disable resource cache when DevTools is enabled    Closes gh-3794  Closes gh-3739
Add separate property for Redis read and connection timeout    See gh-23137
Consistent use of @AliasFor    Closes gh-10836
Take care registering DataSourceInitializer    The DataSourceInitializer is instantiated early by the  DataSourceInitializerPostProcessor, so it has to live in  isolation (in its own @Configuration) to prevent early  instantiation of the DataSourceAutoConfiguration.    Fixes gh-1166
Add dependencies to inputs in bootRepackge    See gh-1113
Add configuration key for GzipResourceResolver    This commit adds a new key that configures a GzipResourceResolver  in the resource handling chain.    Configuring an application with the following will add that resolver,  which checks for gzipped resources in the configured locations:    ```  spring.resources.chain.gzipped=true  ```    This means that if a resource 'style.css' is requested, the  GzipResourceResolver will look for resources named 'style.css.gz', which  should be a gzipped variant of the 'style.css' file. Note that this  resolver only checks for variants if the client supports the 'gzip'  encoding, as defined in the 'Accept-Encoding' HTTP request headers.    Fixes #4683
Support binding to collection with EnumSet values    Fixes gh-15539
Apply gridFsDatabase to auto-configured ReactiveGridFsTemplate    Closes gh-18284
Support binding to collection with EnumSet values    Fixes gh-15539
Support binding with multiple constructors    Update `DefaultBindConstructorProvider` so that binding to objects with  multiple constructors is allowed, as long as there is only one  non-public candidate.    Closes gh-23117
Adapt to deprecation of StringUtils.isEmpty(Object)    See gh-23774
Replace lambdas with method reference or call    Closes gh-14937
Ensure that, where appropriate, actuator endpoints always produce JSON    Previously, the Actuator\xe2\x80\x99s endpoints did not specify a produces  attribute on their request mappings. With Jackson\xe2\x80\x99s XML binding on the  classpath, this would lead to requests made by a browser receiving  application/xml responses (due to the Accept header indicating that  application/xml is preferred). This was problematic as some of the  response payloads were not legal xml. Problems included XML tags  beginning with \xe2\x80\x98\xe2\x80\x99 or containing \xe2\x80\x98#\xe2\x80\x99.    This commit updates the endpoints to specify that they produce  application/json. The environment and metrics endpoints have also been  updated so that always return a JSON object, even when they are  returning a single entry. This consistency avoids problems where  clients may not consider a single scalar value to be legal JSON.    Closes gh-2449
Support binding to collection with EnumSet values    Fixes gh-15539
Fix Invalid target for Validator error    Update `PropertiesConfigurationFactory` so that the validator is only  set when it supports the target object.    Fixes gh-8149
Add support for lists in SPRING_APPLICATION_JSON
Add mediaTypes (extension to media type mapping) in MVC resources    Allows users to configure 'allowed' file extensions for controller  mappings, so that browsers will not switch to downloading 'f.txt'  (part of the recent RFD attack fixes in Spring MVC).    See gh-4220
Make all @Bean methods public    Fixes gh-1571
Support binding to collection with EnumSet values    Fixes gh-15539
Fix detection of WebApplicationType with context class    Closes gh-14589
Improve DefaultCookieSerializer auto-configuration    Spring Session's own configuration support (i.e.  SpringHttpSessionConfiguration) will configure the default  DefaultCookieSerializer with rememberMeRequestAttribute if  SpringSessionRememberMeServices bean has been detected in the  application context.    In contrast, Spring Boot's auto-configured DefaultCookieSerializer does  not do this which results in a different out-of-the-box experience for  users that rely on Spring Session's remember-me integration.    This commit improves Spring Session DefaultCookieSerializer  auto-configuration to match Spring Session's behavior and make the  auto-configured DefaultCookieSerializer aware of  SpringSessionRememberMeServices bean.    See gh-16513
Add the ability to disable the trace filter    See gh-8650
Create Kafka sample topic
Update tests so that they also work on Windows    See gh-3274
Adapt to deprecation of StringUtils.isEmpty(Object)    See gh-23774
Delay property source initialization till LoggingSystem is initialized    Previously, the initialization of StandardServletEnvironment's  property sources in SpringBootServletInitializer led to debug logging  calls being made before the LoggingSystem had been initialized. As a  result, the system's default configuration was used and, in the case  of Logback at least, the debug logging was output to System.out  in a war deployment.    This commit updates SpringBootServletInitializer to delay the  initialization of StandardServletEnvironment's property sources until  after the LoggingSystem has been initialized, but still in time for  active profiles to be configured via servlet context parameters  (see gh-9972).    Closes gh-13736
Suppress debug log output during Logback initialization    Closes gh-12071
Update Johannes Edmeier author attribution    Congratulations to Johannes Edmeier on getting married!
Resolve placeholders in @ConfigurationProperties prefix
Add 'client-name' property to specify a Redis client name    See gh-17330
Adapt to deprecation of StringUtils.isEmpty(Object)    See gh-23774
Ignore unbound collection properties if collection bound    As of Spring Boot 2.0, if Collection properties are specified in  multiple property sources, only the elements from the property source  with the highest precedence are used for binding. This caused an  `UnboundConfigurationPropertiesException` if the size of the collection  from the higher order property source was smaller and `ignoreUnknownFields`  was set to true.    This commit ignores unbound collection properties if the  collection was properly bound.    Fixes gh-16290
Drop RepackageTask.getDependencies()    Drop `RepackageTask.getDependencies` from the gradle plugin in favor of  exposing `getLibraries()` and using the callback.  Drop getDependencies
Update copyright year for changed files
Disable DevTools property defaults in production    Update `DevToolsPropertyDefaultsPostProcessor` so that property defaults  are only added at development time. Properties are now added only when  `Restarter` is initialize or remote devtools is enabled.    Fixes gh-7014
Rename internal OutputCapture classes    Rename the internal versions of OutputCapture to prevent accidental  import.    See gh-5492
Fix detection of WebApplicationType with context class    Closes gh-14589
Add redirection to actuator endpoint    If a request to the actuator endpoint ends with a slash with Spring  HATEOAS on the classpath, an empty array of links is returned whereas  a request without the slash returns a response with all the expected  links to the actuator's other endpoints.    This commit adds an automatic redirection so that both URIs return the  expected result.    Closes gh-4575
Support case insensitive value for Cassandra's SchemaAction    Closes gh-8903
Polish 'Avoid string concatenation inside StringBuilder append()'    Closes gh-15589
Drop RepackageTask.getDependencies()    Drop `RepackageTask.getDependencies` from the gradle plugin in favor of  exposing `getLibraries()` and using the callback.  Drop getDependencies
Rename WebTestClientConnectorTests to match class name
Rename VanillaHealthIndicator to Application...    Rename `VanillaHealthIndicator` to `ApplicationHealthIndicator` and  changed the exposed bean name from `statusHealthIndicator` to  `applicationHealthIndicator`.    This provides less confusing JSON output:      {'status':'UP','application':{'status':'UP'}}    vs:      {'status':'UP','status':{'status':'UP'}}    Fixes gh-1291
Update admin MBean to only be ready when its own context is ready    Previously, if there was a hierarchy of SpringApplications, the admin  MBean would report that the application was ready as soon as any  application in the hierarchy was ready. This could lead to a client  trying to query a property in the environment before it's available.    This commit updates the MBean registrar to that the MBean only reports  that the application is ready when the context that contains the  registrar has refreshed and fired its ApplicationReadyEvent.    Closes gh-6362
Remove explicit constructor super() calls    Closes gh-11068
Polish 'Make equality checks defensive to null reference'    See gh-19540
Add methods to BootJar for adding content to BOOT-INF    Closes gh-13000
Fix welcome page support in WebFlux    Prior to this commit, the welcome page support implemented in gh-9785  would override existing index views in both annotation and functional  variants.    This comes from the fact that the feature was implemented as a  `RouterFunction` configured in the main `RouterFunctionMapping` bean.  Due to ordering issues between mappings, this would override existing  application mappings in some cases.    This commit ensures that the welcome page `RouterFunction` is  contributed to the context in its own handler mapping, ordered after the  application ones.    Fixes gh-21909
Add methods to BootJar for adding content to BOOT-INF    Closes gh-13000
Improve error message when BootJar or BootWar has no known main class    Closes gh-12712
Refine back-off strategy of Neo4j SessionFactory    This commit separates the auto-configuration of the `SessionFactory` in  an isolated class so that the rest of the auto-configuration is still  applied if the user provides a custom `SessionFactory` bean.    See gh-17662
Improve error message when BootJar or BootWar has no known main class    Closes gh-12712
Check for null before trying to use ApplicationContext    Fixes gh-145
Check for null before trying to use ApplicationContext    Fixes gh-145
Use getTomcatWebServer to create TomcatWebServer instance    TomcatReactiveWebServerFactory's getTomcatWebServer is described as  being a hook point the can be overrideden to return a different  TomcatWebServer or to apply additional processing to the Tomcat  server. Previously, this did not work as the method was not called  to create the TomcatWebServer instance. Instead, TomcatWebServer was  instantiated and returned directly.    This commit updates TomcatReactiveWebServerFactory to call  getTomcatWebServer to create the TomcatWebServer instance. A test  has also been added to verify that the method is now used.    Fixes gh-20386
Rework type generation algorithm    The initial solution to gh-11512 was still using a plain `toString` that  could potentially break with a JDK upgrade. Turns out that JDK9 actually  uses the same type for AnnotatedType and ClassType so the trick of using  a visitor doesn't work anymore.    Retrospectively, it is quite easy to generate the full type once we have  the DeclaredType as we already have some logic to get the qualified,  that is raw, type and we have access to the type parameters.    This commit still uses a `toString` to generate the representation of  the type parameters but this looks much safer than trying to redo what  such a simple `toString` should do. Also, the additional metadata that  we could get on an ExecutableElement does not apply to them.    Closes gh-11512
Use MongoClient consistently    Closes gh-11431
Auto-configuration of reactive Spring Session
Auto-configuration of reactive Spring Session
Refine AliasFor usage    This commit makes sure to use `getAliasedStringArray` rather than  `getStringArray` as the latter does not work with ASM. While this will  probably be fixed in the core framework, this commit also adds dedicated  tests with ASM to ensure that the code works as expected.    Closes gh-6337
Update tests to shut down in-memory databases proactively
Add enabled flag to RegistrationBean    Default to true but allow user to switch off a @Bean of type  Filter (for example) by wrapping it in a disabled registration.    Fixes gh-655
Organize imports in Spring MVC Test classes
Apply gridFsDatabase to auto-configured ReactiveGridFsTemplate    Closes gh-18284
Refine AliasFor usage    This commit makes sure to use `getAliasedStringArray` rather than  `getStringArray` as the latter does not work with ASM. While this will  probably be fixed in the core framework, this commit also adds dedicated  tests with ASM to ensure that the code works as expected.    Closes gh-6337
Move `Assume` to spring-boot-test-support    Fixes gh-10866
Use Collections.addAll(...) instead of for loops    Replace various for loops which add items to collections with calls  to Collections.addAll(...).    Fixes gh-2277
Polish 'Remove value in @ConditionalOnMissingBean if possible'    Closes gh-12604
Refine AliasFor usage    This commit makes sure to use `getAliasedStringArray` rather than  `getStringArray` as the latter does not work with ASM. While this will  probably be fixed in the core framework, this commit also adds dedicated  tests with ASM to ensure that the code works as expected.    Closes gh-6337
Use newConcurrentHashSet and newIdentityHashSet
Fix break bug in for/foreach loops.
corrects some typos and moves the check for the catch statement type into ClassCompletionVerifier, to let the ResolveVisitor first resolve all types and then do type based checks
Clean up allowPartialSearchResults serialization (#37911)  When serializing allowPartialSearchResults to the shards through ShardSearchTransportRequest, we use an optional boolean field, though the corresponding instance member is declared `boolean` which can never be null. We also have an assert to verify that the incoming search request provides a non-null value for the flag, and a comment explaining that null should be considered a bug.  This commit makes the allowPartialSearchResults method in ShardSearchRequest return a `boolean` rather than a `Boolean` and changes the serialization from optional to non optional, in a bw comp manner.
Fix DESCRIBE OUTPUT for CREATE VIEW  The output should be empty since the statement doesn't return anything.
added license to some java files
Stops the algo as soon as possible in findSinglePath
S2S VPN: Use coma instead of semicolon for separating cidr list
Fixed some grammatical mistakes in the comments in junit.framework (#1184)    Fixed JavaDoc in junit.framework to use periods
Test case clean up
Remove unused argument
Inline SubscriptionHelper.isCancelled() (#6263)
fix shrunken index source name metadata usage
Fix more inspector warnings introduced by recent mergences
Polish Javadoc for caching annotations
OM-DSL: remove DynamicObject guard if it isn't used.
Replace Guice Inject with javax.inject
Made checkcast and instanceof floating.
MultiBucketsAggregation.Bucket should not extend Writeable (#24216)  The MultiBucketsAggregation.Bucket interface extends Writeable, forcing all implementation classes to implement writeTo(). This commit removes the Writeable from the interface and move it down to the InternalBucket implementation.
FBUtilities.hexToBytes doesn't handle odd-length strings. patch by Gary Dusbabek, reviewed by Jon Hermes. CASSANDRA-1411
Explicit box/unboxing (compiler warning found some bugs)
include isValid in Assumption.toString(); minor javadoc fix.
Anchor InstanceOf to branches  This allows the anchor to be optimized
Supported message on skip (transformer returns NULL)
SPR-8429 Add test cases for missing header, cookie, and pathvar values
Add missing mappers to MapperBuilders.   - completion  - geo_point  - geo_shape  - parent  - size  - ttl  Close #4423
Allow non-enumerable schemas for JDBC connectors
Use correct primary term for replicating NOOPs (#25128)  NOOPs should be, same as for indexing operations, written on the replica using the original operation term instead of the current term of the replica.
added NativeLibraryHandle.getName()
Fixed bug reported in ML by Andreas on the caching of indexed values. This fix should reduce also the memory occupied by the index nodes as well
MINOR: Improve handling of channel close exception  Propagate IOException in SslTransportLayer channel.close to be consistent with PlaintextTransportLayer,  close authenticator on channel close even if transport layer close fails.  Author: Rajini Sivaram <rajinisivaram@googlemail.com>  Reviewers: Ismael Juma <ismael@juma.me.uk>  Closes #1370 from rajinisivaram/minor-channelclose2
PrebuiltOcamlLibrary: Remove unused SourcePathResolver  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: b4b6001
Add default implementation to reduce duplication
Now need to close both streams
Introduce ProjectFilesystemDelegate.getDetailsForLogging()  Summary: This supersedes what was done in D5620740 to add more details in the Chrome trace about the `ProjectFilesystemDelegate` that was used. In particular, I worry about misspelling `eden.disable_sha1_fast_path` and it not having the desired effect, so this is a simple way to verify it.  Test Plan: Do a Buck build in Eden with and without `--config eden.disable_sha1_fast_path=true` and run the following after each run and verify it has the expected output:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  Reviewed By: ttsugriy  fbshipit-source-id: 6b54cca
Add the encoder/decoder getter methods to HttpClientCodec  Motivation:  There's no way for a user to get the encoder and the decoder of an HttpClientCodec.  The lack of such getter methods makes it impossible to remove the codec handlers from the pipeline correctly.  For example, a user could add more than one HttpClientCodec to the pipeline, and then the user cannot easily decide which encoder and decoder to remove.  Modifications:  - Add encoder() and decoder() method to HttpClientCodec which returns   HttpRequestEncoder and HttpResponseDecoder respectively - Also made the same changes to HttpServerCodec  Result:  A user can distinguish the handlers added by multiple HttpClientCodecs easily.
Fix node method parsing with cached fields. (GR-16366)
Rename BASIC_SQL test group to HIVE_PARTITIONING
Added method to allow creation of new methods on-the-fly.
Disabled tests that hangs occationally. Need to revisit later.
Update exception message according to review feedback.
JsBundleGenrule: Allow to disable resource forwarding  Summary: Adds the ability to skip resource forwarding to `JsBundleGenrule`.  This is useful when the output of the rule is added to an apk or ipa in addition to the underlying js_bundle.  Test Plan: new unit tests  Reviewed By: dinhviethoa  fbshipit-source-id: 1e58bfb
[CAMEL-8428] Move getEndpoint() methods to EndpointAware interface
Use FakeBuildContext.NOOP_CONTEXT where applicable  Summary: Instead of manually constructing a fake instance...  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: abd2b01
Renamed Shape to Shape2D
Method for instantiating a RelationshipTypeCreator so that it can be overridden
TIKA-770 Set all document statistics with Properties rather than Strings, now they are all typed
Move JVM vendor detection to a global constant. Fix detection of Sun/Oracle JVM that only worked for older Sun branded JVMs.
bug 12364:  fixed export template with swift  status 12364: resolved fixed
Renamed lwjgl backend package from desktop to lwjgl.
compute lock depth for MonitorIdNodes correctly when inlining during parsing
Name added methods in NodeFactory appropriately
Revert servlet change caused by KBP mess
better exception when a field is missing
Clean up warnings in spring-test   - Deleted unused imports.   - Switched from junit.framework.Assert to org.junit.Assert, since the    former is deprecated as of JUnit 4.11.   - Suppressed warnings for continued deprecated usage of    junit.framework.Assert.
Decrease visibility of inner classes. #1555  Possibility to instantiate private checks was added.  Fixes `PublicInnerClass` inspection violation.  Description: >Reports public inner classes.
Make Channel*Invoker package private
Use the Option annotation to specify CLI options for the sampler.
DRILL-1140: Add cast function from Timestamp to Time
clean delegated authn to wsfed
Add support for ValueProvider in JdbcIO.DataSourceConfiguration methods  Allows JdbcIO transforms to be fully templatized by providing ValueProvider support for the following methods: - create - withConnectionProperties - withPassword - withUsername
Exists API can send response body, closes #2072.
Remove shouldRetry from Cursor since it's never called
Watcher: Ensure correct method is used to read secure settings (#31753)  As SecureSetting is extended from Setting, you can easily accidentally use `SecureSetting.simpleString()` to read a secure setting instead of `SecureSetting.secureString()`. This commit changes this behaviour in some watcher notification services.
bug 7970: some more improvements to the storage maintenance with 2 pools status 7970: resolved fixed
Pass canonicalizer into IterativeConditionalEliminationPhase.
Add getDescription() to BuildTargetPattern and VisibilityPattern.  Summary: For the upcoming `buck autodeps --suggest-partition` feature, we need a way to produce the serialized version of a `VisibilityPattern`. This new API makes that straightforward to do.  Test Plan: Unit tests  Reviewed By: Coneko  fbshipit-source-id: e720502
SimonStewart: Cleaning up some imports  r16101
tidy up some @since version numbers
Add additional assertions to IngestClientIT
GatewayAllocator: reset rerouting flag after error  After asynchronously fetching shard information the gateway allocator issues a reroute via  a cluster state update task. #11421 introduced an optimization trying to avoid submitting unneeded reroutes when results for many shards come in together. This is done by having a rerouting flag, indicating a pending reroute is coming and thus any new incoming shard info doesn't need to issue a reroute. This flag wasn't reset upon an error in the reroute update task. Most notably - if a master node had to step during to a min_master_node violation, it could reject an ongoing reroute. Lacking to reset the flag causing it to skip any future reroute, when the node became master again.  Closes #11519
Marked Jackson 1.x support classes as deprecated
Propagate all errors to createIsolate
Only reserve ids in reltype store, no other token store  since they just weren't built for it.
Provide 'with implementationType' overloads  Provided overloaded versions of `forField` and `forMethodParameter` that accept a `ResolvableType` implementation type (as opposed to a Class).  Primarily added to allow resolution against implementation types that have been created programmatically using `forTypeWithGenerics`.  Issue: SPR-11218
REST & Internationalization: Add localized msg in resp. on auth failure. (#3660)  * REST: Add localized msg in resp. on auth failure.  * ApplicationContext injection
Propagate cxx.ldflags to Xcode project  Summary: This adds values in `cxx.ldflags` to `OTHER_LDFLAGS` field for generated xcconfigs. This brings `ldflags` on par with `cxx.cflags`(set to `OTHER_CFLAGS`) and `cxx.cxxflags` (set to `OTHER_CPLUSPLUSFLAGS`). Closes https://github.com/facebook/buck/pull/1756  Reviewed By: milend  Pulled By: milend  fbshipit-source-id: 0d9b81a
SQL: Improve handling of invalid args for PERCENTILE/PERCENTILE_RANK (#37803)  Improve the Exception and the error message returned when 2nd argument of PERCENTILE and PERCENTILE_RANK is not a constant.
cxx: thread in platform conflicting header whitelist for PCH rules  Summary: The PCH code was overlooked in the original change that added this.  Reviewed By: philipjameson  fbshipit-source-id: 0122783a15
add progress to indices status API
Revert "Moves DoFnAdapters to runners-core"  This reverts commit 33ed3238e2b3899cff061be3056c5cc29fc60a04.
Show location identity in graph dumps.
Files referring to the new CauseMatcher including the CauseMatcher itself
Random javadoc spruces for Maps.asMap/toMap and Ordering. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=49401524
cxx: allow configuration shared library extension used for C/C++ platforms  Reviewed By: adamjernst, ttsugriy  fbshipit-source-id: c7900cd
Introduce execute(DataSource) in ResrcDbPopulator  To simplify common use cases, this commit introduces a new execute(DataSource) method in ResourceDatabasePopulator that complements the existing populate(Connection) method.  Issue: SPR-11629
adding missing finals
Include off-heap metadata size in MemoryWalker.RuntimeCompiledMethodAccess.
Moves tests to proper package and adds one more test case
[#2573] UnpooledUnsafeDirectByteBuf.setBytes(int,ByteBuf,int,int) fails to use fast-path when src has array  Motivation:  UnpooledUnsafeDirectByteBuf.setBytes(int,ByteBuf,int,int) fails to use fast-path when src uses an array as backing storage. This is because the if else uses the wrong ByteBuf for its check.  Modifications:  - Use correct ByteBuf when check for array as backing storage - Also eliminate unecessary check in UnpooledDirectByteBuf which always fails anyway  Result:  Faster setBytes(...) when src ByteBuf is backed by an array.  No more IndexOutOfBoundsException or data-corruption.
Use Constants.SESSION_PARAMETER_NAME instead "jsessionid".
Make otest tool optional in Apple platforms  Summary: Xcode 7 no longer ships `SenTestingKit` or its test runner `otest`, so this commit makes the `otest` tool optional and throws an exception if a test tries to use it when it's not present.  Test Plan: Updated unit tests. `ant java-test -Dtest.class=AppleCxxPlatformsTest`
Remove `sort_order` and `sort_mode` in favor of `order` and `mode`  Closes #2781
updated the javadoc of the connection & factory classes to match the documentation on the wiki http://incubator.apache.org/activemq/connection-configuration-uri.html
Add some javadocs and clarifications.
Remove the deprecated HttpClient.execute(HttpRequest, boolean) method
Restored log lines to TRACE for notification post alias creation and open/close index Introduced specific log level for those in OpenCloseIndexTests#testCloseOpenAliasMultipleIndices
Fix FakeProjectFilesystem.getFilesUnderPath()  Summary: `FakeProjectFilesystem.getFilesUnderPath()` is broken in a bunch of ways currently. It had no tests, so it sadly regressed.  1) `ProjectFilesystem.walkRelativeFileTree()` is polymorphic, but the most general version of the API which takes an `EnumSet<FileVisitOption>` was private, so `FakeProjectFilesystem` could not override it.  2) `ProjectFilesystem.getFilesUnderPath()` incorrectly converted the project-relative path to an absolute path before passing it to `ProjectFilesystem.walkRelativeFileTree()`. That method requires a project-relative path.  3) `FakeProjectFilesystem.getFilesUnderPath()` was implemented to always return the empty set.  Test Plan: New test added. Confirmed it failed until I fixed all above issues.
Refactor AIO Transport to allow to use Bootstrap without the ugly hack
Minor improvements in the local and the queue scheduler
Migrate NOT_EQUAL operator for arrays to new framework
add some missing @Nullable  Summary: @public Add some missing Nullable annotations following Eradicate warnings  Test Plan: Buck CI  Reviewed By: Coneko, dreiss  fbshipit-source-id: b4318a8
Remove deprecated method in ConnectorSplitSource
Set instance variables to null so that we don't OOM exceptions when using m2
Adds a start() method to custom source Reader.  This is a backwards incompatible change. Current Readers can be fixed by adding a start() method and calling advance() once in that method, i.e.,  @Override public boolean start() throws IOException {   return advance(); }  Code that uses readers should be updated to following form:  for (boolean available = reader.start(); available; available = reader.advance()) {  T value = reader.getCurrent();  ... }  [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=87570381
Fix (some) mocking issues due to upstream changes.  Two suites marked as awaitsFix while being worked on.  Original commit: elastic/x-pack-elasticsearch@06eb352b1e651bc5dc0f56703ce55e75969c1ae9
[java] Moving marionette specific test to the corresponding class
Make Hive view error message a constant
reverted adding IOException to NetworkService, return null if cannot resolve name and log
Fix ticket registry cleaner to process durations correctly. Stop the scheduler if itâs disabled.
HIVE-7314 : Wrong results of UDF when hive.cache.expr.evaluation is set (Navis reviewed by Ashutosh Chauhan)
refactor to move commit logic control inside the database implementation
Access java options through toolchain in AndroidPrebuiltAarDescription  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: e3074c1
Rename transaction type to write state, update setter name.
Rename "basic" configuration to "native"
Make PrecompiledHeaderData implement AddsToRuleKey  Summary: This allows us to remove the custom appendToRuleKey in CxxPreprocessAndCompile and will allow us to correctly derive its deps automatically.  Reviewed By: ttsugriy  fbshipit-source-id: c0bacf2
Renames class to match pattern used in Tiles
MAHOUT-1258: Another shot at findbugs and checkstyle - removed unused imports
break down of strategy to composable parts
clean up the codes of camel-core
percolator: Use correct version for bwc checking now that the change has been backported to 6.0 branch
Move InMemoryStateInternals to runners/core-java
[hotfix] [checkpoints] Remove never used method 'close()' on CheckpointStreamFactory  The fact that the method was never called (and never implemented) strongly suggests that it should be removed, otherwise someone might eventually end up implementing it for a new state backend and wonder why it is never called.
Resync fails to notify on unavaiable exceptions (#33615)  We fail to notify the resync listener if the resync replication hits a shard unavailable exception. Moreover, we no longer need to swallow these unavailable exceptions.  Relates #28571 Closes #33613
[FLINK-5617] Mark some methods as PublicEvolving or Internal  This closes #3195
Introduce BlockUtil.checkValidPosition(positionCount, position)
Fix some build warnings  Summary: A few warnings have crept in; fixing them.  Test Plan: CI  Reviewed By: styurin  fbshipit-source-id: 93e1df2
resolve https://issues.apache.org/activemq/browse/AMQ-2889 - fix setter type
Move extractSymbols to SymbolsExtractor
test: install a new signed license when running index BWC tests  This change now installs a signed license that has been generated at runtime so the BWC tests can run without hitting licensing issues. The x-pack BWC tests pull in the full cluster state, which contains the trial license from when the indices and state was generated. After the trial license period and grace period issues arise with the tests.  Closes elastic/elasticsearch#3858  Original commit: elastic/x-pack-elasticsearch@1c79e874e5033aedac14e7913fa9d194b62f56c9
Added projectinviterequired capability to the listCapabilities API response
Updated license headers for 2018
Fixes due to changes in master branch.
minor: Added 'final' to getPath in AbstractPathTestSupport and '/' to getNonCompilablePath in AbstractTreeTestSupport
Implementing ability to pass FirefoxBinary or version in capabilities for legacy driver.
fix remote cache counters  Summary: change the signature of a method  Test Plan: CI  Reviewed By: marcinkosiba  fbshipit-source-id: 83f1ca8
Put nonoss under Spring framework
Implement java.io.Closeable where appropriate  Issue: SPR-9962
Added Bigtable Read DisplayData
Add and correct javadocs
Pass BuildContext to getPostBuildSteps  Summary: And use it in AppleDsym, rather than a SourcePathResolver from the constructor  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 69e9ea1
Remove BuildRuleResolver reference from NativeLinkableCache  Summary: A step toward removing `BuildRuleResolver` field references from `BuildRule`s and related objects.  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: 2eca55f
Delete unused imports
Avoid migrating "Nothing" during database upgrade.  Previously in case if NOT_PARTICIPATING participant in anyway was added into a list of database upgrade participants it took part in database migration and was reporting its progress as "Migrate Nothing" thingy. This PR changes that and simply ignores NOT_PARTICIPATING participants that added into StoreUpgrader during its constructions.
Fixed bug on using remote indexes reported in ML
Use supplier to pass rules to exclude around AndroidBinary  Summary: This will allow to pass `rulesToExclude` to `AndroidBinaryGraphEnhancer` from `AndroidInstrumentationApkDescription` as a supplier which will be used in the following changes to avoid the instantiation the whole set.  Reviewed By: jtorkkola  shipit-source-id: 6a39074075
rename: lookupRegisterConfig -> getRegisterConfig
CAMEL-5790 aws-s3 supports retrieving a single object request with thanks to Jason
api: remove some "experimental" javadoc  https://codereview.appspot.com/8107043/
[Fix] - Return 401 on any authentication error  Fixes a bug where the wrong exception and wrong error status code (500) were returned when the user sent the wrong username/password. This fixes this beahviour to return an `AuhthenticationException` with a 401 status code.  Fixes elastic/elasticsearch#271  Original commit: elastic/x-pack-elasticsearch@0a120caeaee93036050c0b99a9b6ada35a3fb082
SpEL support for static finals on interfaces  Update ReflectivePropertyAccessor to search for fields on super classes and implemented interfaces.  Although the javadoc Class.getFields() implies that all public fields of class should be returned SpelReproTests demonstrates that this is not always the case.  Issue: SPR-10125
Internal testing change  ----Release Notes---- ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=97257395
[fixed] Actor.visable -> Actor.visible [fixed] Removed iterating over children with fancy for loop syntax.
Updated the graph-algo component to match the changes to Uniqueness in the traversal framework.
Support username and metadata in TransactionData events
more test cases for attribute filters
Allow recursive directory traversal to be configured  Right now there is no way to configure this value, even if Hive is configured to support recursive directory traversal/subdirectories. This commit exposes the variable through a HiveClientConfig value.
CAMEL-217: Persistent aggregator load tests.
Add better validation error message and a dedicated test
Throw exception for delete from unpartitioned Hive table
Fixes a bug in Sample.Any  (I introduced the bug while merging a different PR...) Also adds a test for the combine fn and exposes the fn. Documents the difference between any() and fixedSize().
Remove unnecessary imports
minor refactor: slightly earlier return for some AST transform validation checks
MatchableHandlerMapping extends HandlerMapping and lives in web.servlet.handler now  Issue: SPR-14321
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=48230 Remove unused imports. Patch provided by sebb.
[BEAM-316] Add file scheme support in TextIO
Polished and fixed test reported by CI.
CAMEL-861.  Minor change to replace deprecated api.
Move extractSymbols to SymbolsExtractor
Fix infinite cycle and add testcase for preventing cycles creation
Use Splitter instead of String.split, in InternetDomainName.  RELNOTES=n/a  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=193087177
Removing extra empty lines
[FLINK-12842][network] Fix invalid check in ReleaseOnConsumptionResultPartition#createSubpartitionView  Currently in ReleaseOnConsumptionResultPartition#createSubpartitionView it would check whether this partition is released before creating view. But this check is based on refCnt != -1 which seems invalid, because the reference counter would not always reflect the released state. In the case of release/fail, the reference counter is not set to -1. Even if in the case of onConsumedSubpartition, the reference counter seems also no chance to be -1. So we could check the real isReleased state during creating view instead of reference counter.
Make some minor simplifications in common.base. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=58996623
Move ParseBuckProfilerReportEvent to an appropriate package.  Summary: Otherwise an attempt to add a dependency on it leads to cyclic deps.  Reviewed By: jtorkkola  fbshipit-source-id: a4c9665
Fix a bug where store migration forgets about legacy indexes.  IndexManager now also respects the availability guard (by virtue of transaction begin) when creating an index.
Ensure we only call ReferenceCountUtil.safeRelease(...) in finalize() if the refCnt() > 0  Motivation:  We need to ensure we only call ReferenceCountUtil.safeRelease(...) in finalize() if the refCnt() > 0 as otherwise we will log a message about IllegalReferenceCountException.  Modification:  Check for a refCnt() > 0 before try to release  Result:  No more IllegalReferenceCountException produced when run finalize() on OpenSsl* objects that where explicit released before.
Reduced debug output
assign names to threads that do not have one.  patch by jbellis
Remove some default methods and annotations  Summary: Not needed  Reviewed By: ttsugriy  fbshipit-source-id: b3ea341993
Make parameters of Parser.buildTargetGraphForTargetNodeSpecs explicit  Summary: This will refactored later and explicit parameters make future refactoring easier.  Reviewed By: bobyangyf  fbshipit-source-id: f60b844d0a
[TESTS] Fix Inline template tests  This change adds a method to WatcherTestUtils to compare two json structures since order is not guaranteed in template parameters. The Inline template tests in SearchInputTests and SearchTransformTests now use this instead of string comparision.  Original commit: elastic/x-pack-elasticsearch@c4335451281fcd7b661f37b33d30e3a1df7224ac
Fix more inspector warnings introduced by recent mergences
Suppress resource/deprecation warnings in integration tests
[added] minor additions to rect and vec2.
Replace ResolvedJavaType.isFinal with more meaningful and correct isLeaf
Added comments for the search builder classes on how to use them
Contribution by Luca Molino to fix the issue 251 about the usage of Proxied headers
Java API: ActionFuture#actionGet to automatically unwrap failures, closes #1292.
make Token serializable again for JMX
Improve shutdown responsiveness of SubProtocolWSH  Proactively notify all active WebSocket sessions when a shutdown is progress. Sessions then can ignore further attempts to send messages and also stop stop trying to flush messages right away.
MAHOUT-1258: Another shot at findbugs and checkstyle - removed unused imports
Add java-doc for implemented methods of io.netty.util.concurrent.Future#cancel(boolean mayInterruptIfRunning)  Motivation:  The methods implement io.netty.util.concurrent.Future#cancel(boolean mayInterruptIfRunning) which actually ignored the param mayInterruptIfRunning.We need to add comments for the `mayInterruptIfRunning` param.  Modifications:  Add comments for the `mayInterruptIfRunning` param.  Result:  People who call the `cancel` method will be more clear about the effect of `mayInterruptIfRunning` param.
debug serializer to determine whether serializer serialze class name by default
Bulk API: Rename `index` to `_index`, `type` to `_type` and `id` to `_id`, closes #421.
Move CodeSignIdentityStore.DEFAULT_IDENTITIES_COMMAND to AppleConfig  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: b7b9958
Delete IndexAPI: Allow to delete more than one index or _all indices, closes #791.
fixed deadlock on shutdown
CLOUDSTACK-1862 Added vm ip address info in the list PF rules response  Signed-off-by: Abhinandan Prateek <aprateek@apache.org>
https://issues.apache.org/jira/browse/AMQ-5794 - duplex network case calls start twice and would start a connect check timer in error. Fix is to only start connectiontimeout if we have not already started the rest of the monitoring
[added] FileHandle#list(String suffix). [fixed] Button spacing to be consistent above and button text.
TIKA-1412 - Add UnitTest
Move ParseBuckProfilerReportEvent to an appropriate package.  Summary: Otherwise an attempt to add a dependency on it leads to cyclic deps.  Reviewed By: jtorkkola  fbshipit-source-id: a4c9665
Pass Elemets to Types constructor now that circularity is eliminated  Summary: Now that all `TreeBackedElement` creation happens in a separate class, there's no longer a circular dependency between `TreeBackedElements` and `TreeBackedTypes`. Taking advantage of that for a slight simplification.  Test Plan: CI  Reviewed By: asp2insp  fbshipit-source-id: 98915d9
PR comment: Index provider factories need to use their own Dependencies interface
Renamed FrameMapBuilderImpl to ForwardingFrameMapBuilder.
refresh configCenter before start
[added] OpenAL native to LWJGL. [removed] newTexture method that takes a ByteBuffer. It's all going away anyway.
Remove Statement from ResourceGroupSelector.match()
Reset of election version is 1 and not 0 apparently Remove use of non-versioned voting
CAMEL-656: Polished dataset and timer component. Added @deprecation to not used method. Removed unused imports.
Increase default http timeout threads  With a default of one thread, it's impossible to tell if there's a backlog of http requests that need to be timed out.
Added ChannelBuffer.readSlice() methods in case a user doesn't want to copy at the risk of modified content
Revert "Consistent naming style for enum"  This reverts commit 4feafc4a5226c6307f5a9b36665d8fe8d8a05072.
Revert "Use ImageStage Enum instead of specific methods to represent run-context."  This reverts commit a75fd00fc074a1e3107e86ce5eb031595c7bbb36.
Introduce alias for 'value' attribute in @Payload  This commit introduces 'expression' as an alias for 'value' in @Payload.  Issue: SPR-11393
bug 10848: Change function signatures to accept capacity type as an object..
Add missing license headers
added bean name assertions
Modified services to include authz strategy field
add missing license headers  Patch by eevans
api.object: add some missing javadoc
Adding missing license header
bug 10848: Change function signatures to accept capacity type as an object..
Pass BuildContext to getPostBuildSteps  Summary: And use it in AppleDsym, rather than a SourcePathResolver from the constructor  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 69e9ea1
[streaming] generateSequence source added
Remove NAME field from json field decoders
Expose GlobalConstant in the NodeFactoryFacade
Move loop phi recursive usage optimization from loop begin simplification to loop phi canonicalization.
Extra method instead of base implementation of next
Issue #4313: Split and Organize Checkstyle inputs by Test for checks in annotation package: MissingOverride
wildcard query on _index (#27334)
Add missing visit methods to AstVisitor and DefaultTraversalVisitor
Use UTF-8 as the default encoding
Updated the graph-algo component to match the changes to Uniqueness in the traversal framework.
Add default implementation to reduce duplication
SimonStewart: Cleaning up some imports  r16101
turned requestedSessionId into a settable property
Issue #1604. Remote bag. Fix embedded serialization
Fix the issue that map may swallow fatal exceptions
Minor docfix in Iterators.java. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=61749084
Fix @RequestBody argument processing for null Content-Type  Since the changes introduced in SPR-12778, some `@RequestBody` args would not be properly processed in some cases:  * requests with an empty body * no Content-Type header defined  This typically happens when GET requests are mapped on a handler dealing with POST requests and HTTP bodies.  This change makes sure that the `RequestResponseBodyMethodProcessor` is only involved for requests that:  * have a Content-Type defined * OR are HTTP requests eligible for an HTTP body (PUT, POST, PATCH)  Issue: SPR-13176 Fixes spring-projects/spring-boot#3313
Add a standard method for returning input to the SocketWrapper. Use this to make the code consistent between upgrade processor implementations.
We should let a client change the client id on a connection even if it was set on the connection factory.
Decrease visibility of inner classes. #1555  Possibility to instantiate private checks was added.  Fixes `PublicInnerClass` inspection violation.  Description: >Reports public inner classes.
Contribution by Luca Molino to fix the issue 251 about the usage of Proxied headers
KAFKA-4364: Remove secrets from DEBUG logging  leverage fix from KAFKA-2690 to remove secrets from task logging  Author: rnpridgeon <ryan.n.pridgeon@gmail.com>  Reviewers: Ewen Cheslack-Postava <ewen@confluent.io>  Closes #2115 from rnpridgeon/KAFKA-4364
Ensure we never read from a closed MockSecureSettings object (#25322)  If secure settings are closed after the node has been constructed no key-store access is permitted. We should also try to be as close as possible to the real behavior if we mock secure settings. This change also adds the same behavior as bootstrap has to InternalTestCluster to ensure we fail if we try to read from secure settings after the node has been constructed.
spring: Fix component annotation for VolumeDaoImpl and CfgServerImpl  Signed-off-by: Rohit Yadav <bhaisaab@apache.org>
There was no need to introduce a thread local to avoid event recursion
fixed parent propagation of configuration in OrientDBConfig, issue #7728
Fixing HtmlUnitDriver to handle timeout exception on refresh
Fixed CS for Camel-JMS
Actually run some tests that claim to be @GwtCompatible under GWT, stripping out the @GwtIncompatible parts. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=43617179
Renamed @WebTests to @WebTest  @WebTests has been renamed to @WebTest so that the Gradle build does not attempt to run it as a JUnit test.
Adding licence header to files to make the build pass
working on ctor args
[FLINK-10784][tests] Update FlinkKafkaConsumerBaseMigrationTest for 1.7
Remove the concept of scheduling metadata.
SimonStewart: Implementing WrapsDriver on the remaining WebElement implemntations that lack it. This should make writing new locators easier  r9626
Use ErrorLogger for BuckIsDyingException  Summary: And still more consolidation of user-facing exception message extraction  Reviewed By: philipjameson  fbshipit-source-id: a08ce1f
Use Optional instead of boxed primitive in node facade
Added additional log statements for attribute processing
Renamed LeftCurlyCheck to AbstractLeftCurlyCheck. Completely happy with the name. :-)
fix issue with oauth user authentication where attributes and uid werent mapped
2.x: Add C.delaySubscription marble, fix some javadoc (#6257)
Fix LetQueryStep and add test cases for LET execution
Remove unused PhasePosition.HIGH_LEVEL.
Enable Docker in the PortableDirectRunner  Add an EnvironmentType which allows the PortableDirectRunner to construct either in-process environments or docker environments.
Replace the many asNode methods with one on ValueNode and one on FixedNode
Fix a bug in the regex that matches native library file names.  Summary: iknowregex  Test Plan: Added a unit test.
Optimized scalar observeOn/subscribeOn
Added ability to discover new tag libraries and template engines automatically WW-1590
Unconditionally set the auth store location in server  This is an internal setting which should never be set externally. In server it will always be at data/dbms/auth.
Enables implementations of the BlobContainer interface to (#19749)  conform with the requirements of the writeBlob method by throwing a FileAlreadyExistsException if attempting to write to a blob that already exists. This change means implementations of BlobContainer should never overwrite blobs - to overwrite a blob, it must first be deleted and then can be written again.  Closes #15579
Access java options through toolchain in AndroidPrebuiltAarDescription  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: e3074c1
Added convenience methods for creating numeric range queries as well as sorting them
Move ProjectionPushDown to optimizations package
fix possible race in IndexServiceTests#testBaseAsyncTask and add mock plugin SearchWithRandomIOExceptionsIT
Join if statements  Part of #356 on Github. Contributed by Graham Russell (graham at ham1.co.uk)
Normalize template index settings before validating
CLOUDSTACK-8833: Fixed  Generating url and migrate volume to another storage , resulting two entry in UI and listvolume is not working for that volume Update the volume id in volume_store_ref table to newly created volume for migration  (cherry picked from commit 42b89278e9386b8bc90e36fb600d7730e676ae72) Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>
Make LongAdder and SimpleStatsCounter final. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=30534531
[AMQ-6691] allow dlq flag to be set via jmx to allow retry op after a restart - use destinations element for long term persistence
Update special-cases of GroupAlsoByWindow to use getOutputTimestamp  ----Release Notes---- [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=99225882
Expose graph builder configuration and some other details of Truffle compiler
Pass topScorer=false to sub-scorers if a scorer is wrapped. Wrapped BooleanQuery can return collect-only scorers. See #2505
Address why users should prefer our immutable collections to things like Collections.emptyList().  RELNOTES=n/a  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=221486706
[added] license info
Bacporting moving of tx brindge to global scope from more recent PR since multiple bridges creating mess during context creation in various places when bridge is resolved from dependency resolver.
added ResolvedJavaType.getClassInititalizer()
Fix issue with ldap attribute defaults. Added logging
Recognize that the reason for an early completion might be cancellation rather than exception. This fixes the bug "com.google.common.util.concurrent.AbstractFuture$Cancellation cannot be cast to com.google.common.util.concurrent.AbstractFuture$Failure"  TODO(cpovirk): Write basher tests at some point. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=96784416
Simplify getting topic connection
SimonStewart: Marking failing chrome tests as ignored to green the build.  r16358
Remove some default methods and annotations  Summary: Not needed  Reviewed By: ttsugriy  fbshipit-source-id: b3ea341993
Expose method to lookup key name from token
CAMEL-656: Polished dataset and timer component. Added @deprecation to not used method. Removed unused imports.
Texture, fixed filter on reload.
Update version.
bug 9774: display non-ready templates. Added "state" field to all snapshot* api responses.
Remove the deprecated HttpClient.execute(HttpRequest, boolean) method
Add support for splitting a compressed source for uncompressed files  This adds support for splitting the file if the file name does not end with one of the supported compression formats (currently gz and bz2) and the delegate source also supports splitting.  This is for Apache Beam.  ----Release Notes----  [] ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=114894950
Use supplier to pass rules to exclude around AndroidBinary  Summary: This will allow to pass `rulesToExclude` to `AndroidBinaryGraphEnhancer` from `AndroidInstrumentationApkDescription` as a supplier which will be used in the following changes to avoid the instantiation the whole set.  Reviewed By: jtorkkola  shipit-source-id: 6a39074075
MatchableHandlerMapping extends HandlerMapping and lives in web.servlet.handler now  Issue: SPR-14321
Remove the annotation output of the abi targets from the source folders  Summary: This avoids adding duplicate classes to IntelliJ.  Reviewed By: asp2insp  fbshipit-source-id: b4b19109ee
[TEST] added missing @Override annotations to query builder tests
Account for inner classes in test filtering  Summary: Test filtering does not work if you ask the test runner to run something like com.facebook.buck.rules.CachingBuildEngineTest$OtherTests  Test Plan: manual  Reviewed By: aiked  fbshipit-source-id: 9051ecf
Useful iterator util fromEnd
Fix usage of "parent" as a projection name in SQL  Resolves: #8565
Fix predicates for Raptor system.tables  Remove lowercase and fix handling of multiple values.
- Fix strongValues key/value confusion reported on guava-discuss. - Make HostAndPort's port field final.  Revision created by MOE tool push_codebase. MOE_MIGRATION=2004
2.x: Add empty source clauses to javadocs of combineLatest operators accepting unspecified number of sources. This commit resolves #5412 (#5413)
Add isLinked method to ResolvedJavaType
Replace ResolvedJavaType.isFinal with more meaningful and correct isLeaf
Introduce execute(DataSource) in ResrcDbPopulator  To simplify common use cases, this commit introduces a new execute(DataSource) method in ResourceDatabasePopulator that complements the existing populate(Connection) method.  Issue: SPR-11629
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=55110 Small performance improvements Patch provided by Adrian Nistor
Composite transform lambdas via PTransform::compose
Fix dynamic mapping update generation. (#27467)  When a field is not mapped, Elasticsearch tries to generate a mapping update from the parsed document. Some documents can introduce corner-cases, for instance in the event of a multi-valued field whose values would be mapped to different field types if they were supplied on their own, see for instance:  ``` PUT index/doc/1 {   "foo": ["2017-11-10T02:00:01.247Z","bar"] } ```  In that case, dynamic mappings want to map the first value as a `date` field and the second one as a `text` field. This currently throws an exception, which is expected, but the wrong one since it throws a `class_cast_exception` (which triggers a HTTP 5xx code) when it should throw an `illegal_argument_exception` (HTTP 4xx).
More NPE possible in TokenSessionStoreInterceptor, updated unit tests again WW-3150
return security group status per zone
doh - added the correct headers
Rename SSAUtils->SSAUtils.
add description to retry compilation DebugContext
Remove unused SourcePathResolver from CxxInferCaptureTransitive  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: bbceadb
Tidying up and one of the functional tests work
Issue #2137: Make test for FileTabCharacter locale and OS independent
HIVE-7314 : Wrong results of UDF when hive.cache.expr.evaluation is set (Navis reviewed by Ashutosh Chauhan)
Include current date and time in Chrome trace filename  Summary: Does what it says on the tin.  Test Plan: Unit test included. Ran 'buck project', confirmed trace file had expected format.
STORM-1017: Ignore ignoreZkOffsets for trident.
Removed unused imports
Fix some failing tests. No regression in Tomcat/Jasper, just need to take account of changes in test framework.
Shutdown and release log files, and bad collector report file.
reset redivery counter on retryMessage() - and speed it up a little - for https://issues.apache.org/activemq/browse/AMQ-1909
add some missing @Nullable  Summary: @public Add some missing Nullable annotations following Eradicate warnings  Test Plan: Buck CI  Reviewed By: Coneko, dreiss  fbshipit-source-id: b4318a8
encrypt oidc tokens support
[FLINK-5904] Use proper ConfigOption syntax to retrieve config values
[feature] tear down Truffle compiler threads
add some missing @Nullable  Summary: @public Add some missing Nullable annotations following Eradicate warnings  Test Plan: Buck CI  Reviewed By: Coneko, dreiss  fbshipit-source-id: b4318a8
GROOVY-6435: include instance check for BigInteger to ensure assignment to BigInteger is pssible for subclasses
More detailed description of the expected behavior when evaluating interactive and non-interactive sources
[streaming] JobGraphBuilder refactor
Move TestBuildRuleCreationContextFactory in test to correspond to source structure  Summary: BuildRuleCreationContext is under src.com.facebook.core.model.targetgraph This moves the test file to correspond to that  Reviewed By: styurin  fbshipit-source-id: d393bf28d3
Forces segment merge before reading term frequencies  because otherwise it was possible to observe a state where there were non-unique terms in the index, but instead of Lucene reporting a docFreq > 1 on a single term it would report that term multiple times each with docFreq == 1. This would break a fundamental constraint in the uniqueness checking algorithm.
DRILL-976: Fix extract second to return only second portion of interval; exclude hours, minutes
SyncedFlushResponse to implement ToXContentObject (#31155)  The response currently implements ToXContentFragment although the only time it's used it is supposed to print out a complete object rather than a fragment. Note that this is the client version of the response, used only in the high-level client.
[added] OpenAL native to LWJGL. [removed] newTexture method that takes a ByteBuffer. It's all going away anyway.
Use different method for getting component locator in EncodedStringTypeAdapter
MAHOUT-1214: Improve the accuracy of the Spectral KMeans Method - minor code cleanup
HIVE-8326 Using DbTxnManager with concurrency off results in run time error (Alan Gates, reviewed by Eugene Koifman)
Add AOT option for arguments.
support sending a "skip" result back to the reporting interface  r4711
clean up saml metadata resolvers; add support for mongodb
CAMEL-316. Done. Last piece of cleanup.
Adapt bwc versions after backporting #31045 to 6.3
Prevent possible NPE (from the testbeans branch, but unrelated).
Security: cleanup code in file stores (#30348)  This commit cleans up some code in the FileUserPasswdStore and the FileUserRolesStore classes. The maps used in these classes are volatile so we need to make sure that we don't perform multiple operations with the map unless we are sure we are using a reference to the same map.  The maps are also never null, but there were a few null checks in the code that were not needed. These checks have been removed.
Allow access to applied property sources  Add PropertySourcesPlaceholderConfigurer.getAppliedPropertySources() to allow access to the PropertySources that were actually applied.  Issue: SPR-10545
Remove exception from client suite  Original commit: elastic/x-pack-elasticsearch@51e94561d973deca71dae35cbf986db82fefc2ee
corrects some typos and moves the check for the catch statement type into ClassCompletionVerifier, to let the ResolveVisitor first resolve all types and then do type based checks
Revert "Auto-unwrap SessionFactoryBuilder-created proxies"  This reverts commit 7903d6489f9c98532826324b0ba79cafbc618d78.  Issue: SPR-8492
Move ensureCapacity to grouped state interface
wired up polling for AndroidController
More detailed description of the expected behavior when evaluating interactive and non-interactive sources
Add Writeable.Reader support to TransportResponseHandler (#28010)  Allows TransportResponse objects not to implement Streamable anymore. As an example, I've adapted the response handler for ShardActiveResponse, allowing the fields in that class to become final.
SL: some minor simplifications.
Use compiled pattern instead of dynamic regexp. #1555  Fixes `DynamicRegexReplaceableByCompiledPattern` inspection violations.  Description: >Reports calls to the regular expression methods of java.lang.String using constants arguments. Such calls may be profitably replaced with a private static final Pattern field so that the regular expression does not have to be compiled each time it is used.
Rewrite LLVMFrameReadWriteFactory to new type
Cleanup branch instrumentation.  Use `TTY` to print the "branch instrumentation count exceeded" warning, and print the warning only once. Avoid rechecking the same flag multiple times.
bug 10579: disable pool vm sync and disable hostTrack for XenServer,  status 10579: resolved fixed  reviewed-by: alex  Conflicts:      core/src/com/cloud/hypervisor/xen/resource/CitrixResourceBase.java
More explanation + more links
Fix RangeFieldMapper rangeQuery to properly handle relations  This commit fixes the RangeFieldMapper and RangeQueryBuilder to pass the correct relation to the RangeQuery when performing a range query over range fields.
Access java options through toolchain in AndroidPrebuiltAarDescription  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: e3074c1
Add method to ProjectWorkspace to write file contents.  Test Plan: Unit test.
Moved tint logic from Skin to tint(Color) on each drawable class.  #2705
Make the version of the remote node accessible on a transport channel (#23019)  This commit adds a new method to the TransportChannel that provides access to the version of the remote node that the response is being sent on and that the request came from. This is helpful for serialization of data attached as headers.
Change return type and add nullable check for DepsAwareExecutor  Summary: We should return more specific ImmutableList and check for nonNull in DepsAwareTask.getStatus  Reviewed By: styurin, ttsugriy  fbshipit-source-id: c22dc24784
made Node implement NodeInterface to remove unnecessary bridge methods
How to register MIME types in MockServletContext  Prior to this commit, it was unclear that it was possible to register custom MIME types when using MockServletContext.  This commit updates the Javadoc for MockServletContext.getMimeType() with an example of how to achieve this using the MimetypesFileTypeMap from the Java Activation Framework.  Issue: SPR-12126
fixed JSP ErrorsTag to avoid invalid "*.errors" id, using form object name as id prefix instead (SPR-7258)
Fix SKIP behavior on SELECT expand(out()) queries  Resolves: #5854
SimpleIdProvider zap page before releasing page  This is something that the real freelist already does and we rely on this behavior.
Add constants for the tiered compilation naming conventions.
Configure view controllers with ApplicationContext  Issue: SPR-13762
Fix StompSubframeDecoder.readHeaders produce not any notification when parsed line that contains multiple colon  Motivation:  By STOMP 1.2 specification - header name or value include any octet except CR or LF or ":".  Modification:  Add constructor argument that allows to enable / disable validation.  Result:  Fixes [#7083]
Remove unused SourcePathResolver from CxxInferCaptureTransitive  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: bbceadb
Revert "Make DirectHeaderMap use relative paths"  Summary: Breaks findining header maps in some builds.  Reviewed By: styurin  fbshipit-source-id: a1eabbd300
Fix failing CLI tests  This commit fixes some failing CLI tests. The failure here is that a guard against the system property es.path.conf was added yet these tests were not adapted for this change. This commit implements this adapation which overrides the createEnv method where the problematic guard is invoked. We do this to avoid having to set es.path.conf in tests.  Original commit: elastic/x-pack-elasticsearch@20e1724823589ce45a2067030e37512dbfb88537
Add arrayKlassOffset field to HotSpotVMConfig.
Pass CxxTest its SourcePathResolver from runTests context  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 648fb82
Remove unused SourcePathResolver from AaptPackageResources  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: d930bdc
Add @Beta annotation to new subSet/subMap methods. ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=109435892
UCDetector clean-up  - Remove unused code  - Use final where appropriate
refactor logout api; fix tests
Close Index API should force a flush if a sync is needed (#37961)  This commit changes the TransportVerifyShardBeforeCloseAction so that it issues a  forced flush, forcing the translog and the Lucene commit to contain the same max seq  number and global checkpoint in the case the Translog contains operations that were  not written in the IndexWriter (like a Delete that touches a non existing doc). This way  the assertion added in #37426 won't trip.  Related to #33888
Assert instances (vs classes) in MockMvc/WebTestClient  Issue: SPR-16520
Migrate array cardinality to scalar framework
[fixed] license headers for jogl backend
[scene2d.ui] Changed widgets to use Actor#hasKeyboardFocus.
Simple verification of the format of the language tag used in DateProcessor. (#25513)  Closes #26186
rename getRemoteCpuTime to getRemoteCpuTimeMs  Summary: Use millis for this.  Reviewed By: rajyengi  fbshipit-source-id: b7c801fd93
#119 Add missing license headers
Allow to construct UnpooledByteBufAllocator that explictly always use sun.misc.Cleaner  Motivation:  When the user want to have the direct memory explicitly managed by the GC (just as java.nio does) it is useful to be able to construct an UnpooledByteBufAllocator that allows this without the chances to see any memory leak.  Modifications:  Allow to explicitly disable the usage of reflection to construct direct ByteBufs and so be sure these will be collected by GC.  Result:  More flexible way to use the UnpooledByteBufAllocator.
Make round use native Math.round instead of Math.floor  This solves problem with rounding value of 0x1.fffffffffffffp-2 and makes our rounding strategy consistent with Java's standard library (round towards positive infinity).
Move string to BuildTarget conversion to a more appropriate class to avoid cyclic dependencies.  Summary: String->BuildTarget conversion is the BuildTargetParser's job. This diff also helps avoid cyclic dependencies in future work.  Test Plan: CI  Reviewed By: ruibm  fbshipit-source-id: e1b6d75
ValuePosition: refactor set(LIRInstruction, Value).
Decouple JavaLibrary from AnnotationProcessingParams  Summary: We only need to expose the generated source directory (which may not exist). As AnnotationProcessingParams is java specific (rather than jvmlang agnostic) we'd prefer JavaLibrary (soon to become JvmLibrary) to not know about it.  Context: I'm another LMAX person. We really want to make some progress towards the work described in https://github.com/facebook/buck/pull/439  Tested with ant && ./bin/buck test (advice on whether this is enough gratefully received!) Closes https://github.com/facebook/buck/pull/508  Test Plan: Imported from GitHub, without a `Test Plan:` line.
out of Beta for Guava release 10  Revision created by MOE tool push_codebase. MOE_MIGRATION=2110
JAVADOC: Added missing javadocs.
CAMEL-8023: Model and component javadoc documentation
don't discard original exception (suspiciously/possibly eclipse-generated)
STORM-616 : removing unintended changes.
JAVADOC: Updated source files with comments after merge with master
Bind file rename executor as ListeningExecutorService  - Also use cached thread pool and bounded executor to reduce memory footprint for thread management
Run Optimize Imports on the Repository
CAS-1474: Removed unneeded prop from handler.
Add protected Mesh constructor and move invalidate to VertexData
#NAME?
KAFKA-5412: Using connect-console-sink/source.properties raises an exception related to "file" property not found  Author: ppatierno <ppatierno@live.com>  Reviewers: Randall Hauch <rhauch@gmail.com>, Ewen Cheslack-Postava <ewen@confluent.io>  Closes #3279 from ppatierno/kafka-5412
Add stat for number of queries queued on non-leaf groups  This stat is more accurate than simply counting all queries queued on the root resource group, because it caps the number at each leaf to the maximum runnable at that node. However, this is still imprecise, because it assumes that internal (non-leaf) resource groups are configured perfectly.
Provide 'with implementationType' overloads  Provided overloaded versions of `forField` and `forMethodParameter` that accept a `ResolvableType` implementation type (as opposed to a Class).  Primarily added to allow resolution against implementation types that have been created programmatically using `forTypeWithGenerics`.  Issue: SPR-11218
Transport: Clarifying the role of AbstractBootstrap#bind()  This small changeset clarifies the role of AbstractBootstrap#bind(), especially when not used in a ServerBoostrap context.
[hotfix] Make KeyGroupsStateHandle implement StreamStateHandle
Bug 53039 - HTTP Request : Be able to handle responses which size exceeds 2147483647 bytes Fix bug as per Felix Schumacher review, thx Bugzilla Id: 53039
Correctly deserialize pipeline options on Fn harness
DefaultJavaLibrary: Pass in ZipArchiveDependencySupplier rather than creating it  Summary: I'm working toward changing Java compilation so that we can create the source ABI partway through compilation and allow a module's dependents to start compiling while `javac` finishes creating the full JAR for the module.  With that available, library compilation might be started by either the `CalculateAbiFromSource` rule or the `DefaultJavaLibrary` one, depending on whether source ABIs are enabled. If we left it up to the rule to create the supplier (and, say, forgot to do so), dep file keys would cease to function. Factoring it out prevents us from getting that wrong. (Or, more accurately, is the result of having gotten it wrong and debugged it for longer than I should have.)  Test Plan: CI  Reviewed By: asp2insp  fbshipit-source-id: 7953a3d
javadoc, with override and inheritdoc flags
Use Supplier for StreamInput#readOptionalStreamable  This commit changes the signature of StreamInput#readOptionalStreamable to accept a Supplier to create new streamables rather than requiring callers to construct new instances. This has the advantage of avoiding an allocation in cases when the stream indicates the resulting streamable is null
Deprecate the JSON Wire Protocol Action primitives  We may need to leave these post a 4.x release, but they'll be removed at some point.
Fix handling of missing columns in Parquet Reader
Fix regression introduced by 11f9e9084b2da5e7a0e48c6a5c86be0f41a584de  Motivation:  While cherry-picked 11f9e9084b2da5e7a0e48c6a5c86be0f41a584de I changed the EmbeddedChannel implementation to not allow no ChannelHandlers when constructing it. This was done by mistake.  Modifications:  Revert change and add unit test.  Result:  Restore old behavior.
tokenMetadata should be updated before removing obsolete pending ranges, and unset bootstrapped flag when decommission is complete.  patch by Jaakko Laine and jbellis for CASSANDRA-435
Move string to BuildTarget conversion to a more appropriate class to avoid cyclic dependencies.  Summary: String->BuildTarget conversion is the BuildTargetParser's job. This diff also helps avoid cyclic dependencies in future work.  Test Plan: CI  Reviewed By: ruibm  fbshipit-source-id: e1b6d75
Output TraceInlining format, and separate case when there are multiple decisions about callsites.
Correct handling of default and array settings  In Elasticsearch 5.3.0 a bug was introduced in the merging of default settings when the target setting existed as an array. This arose due to the fact that when a target setting is an array, the setting key is broken into key.0, key.1, ..., key.n, one for each element of the array. When settings are replaced by default.key, we are looking for the target key but not the target key.0. This leads to key, and key.0, ..., key.n being present in the constructed settings object. This commit addresses two issues here. The first is that we fix the merging of the keys so that when we try to merge default.key, we also check for the presence of the flattened keys. The second is that when we try to get a setting value as an array from a settings object, we check whether or not the backing map contains the top-level key as well as the flattened keys. This latter check would have caught the first bug. For kicks, we add some tests.  Relates #24074
Bug 57193: Escape entities like &, < and >, as they are not  allowed in javadocs. Place code tag around code-fragments in javadoc. Bugzilla Id: 57193
Query: Add `index.query.default_field` allowing to control the default field used to search on, closes #1657.
accept null values and adapt hasPropertyValue return value
Enabled a test which was disabled by mistake
Removed need for state after on load indexed, and new bytecodes.
WW-3164  Need to inject ActionMapper in PortletUrlRenderer to avoid NPE when passing through to ServletUrlRenderer.
Add BoolFilterBuilder#hasClauses to be consitent with BoolQueryBuilder  Closes #5472
Rename project graal.api to graal.api.runtime
Update license header for recently modified files  Issue: SPR-7763, SPR-10140, SPR-10132, SPR-10093, SPR-10103
Remove unused methods
Remove unused StepContext name methods
bug 11513: add more log in the cleanup network Reviewed-by:alena@citrix.com
Update license header for recently modified files  Issue: SPR-7763, SPR-10140, SPR-10132, SPR-10093, SPR-10103
removed unused gateway
make empty strings always return the MINIMUM token, and DecoratedKeys containing the MINIMUM token always be considered empty.  This is something we probably should be doing anyway for consistency.  (It was already true for OPP, but not COPP or RP.)  No further special casing should be necessary because we have already abstracted out code that needs to work across multiple partitioners to use IPartitioner.isEmpty, including getRangeSlice.  patch by jbellis; reviewed by Stu Hood for CASSANDRA-745
CHECKSTYLE: Removing redundant interface definitions in the core module.
moved the CamelClient into the core Camel API package
Autowiring rejects self references to a factory method on the same bean as well  Issue: SPR-12018
Expose method to lookup key name from token
moved InvokConstructor Test to UTC2 to avoid OME
Move ParseBuckProfilerReportEvent to an appropriate package.  Summary: Otherwise an attempt to add a dependency on it leads to cyclic deps.  Reviewed By: jtorkkola  fbshipit-source-id: a4c9665
Avoid transforming MACH_O_BUNDLE link type to SHARED when messing with Stripping.  Summary: Seems like `CxxDescriptionEnhancer` has been rewriting the `BuildTarget` flavor of `MACH_O_BUNDLE` to `SHARED`, and code interfacing with it has been written to work around that. This fixes the issue by no longer doing this incorrect flavor renaming.  Test Plan: CI  Reviewed By: beefon  fbshipit-source-id: a6b7d6e
Fix false-positive leak detection report when ReferenceCountedOpenSslEngine constructor throws.  Motivation:  We need to ensure we only create the ResourceLeak when the constructor not throws.  Modifications:  Ensure ResourceLeakDetector.track(...) is only called if the constructor of ReferenceCoundedOpenSslEngine not throws.  Result:  No more false-positves.
working on test cases
[inlining] no need for the suspense about return value
Issue #1604. Remote bag. Fix embedded serialization
[CAMEL-13040] Move modules to core/ folder
Refactor and simplify JUnit test cases for camel-jcr  Signed-off-by: Gregor Zurowski <gregor@zurowski.org>
Disable SockJS heartbeat if STOMP heartbeat is on
TraceRA: rename LinearScanOptimizeSpillPositionPhase -> TraceLinearScanOptimizeSpillPositionPhase.
Make unused Loads simplify in more cases  If they require a check, just replace them with this check.
[#1201] Correctly handle mix of not compressed and compressed requests
Give meaningful names to SprXxxTests in spring-test
Remove calls to simple getters within classes. #1555  Fixes `CallToSimpleGetterInClass` inspection violations.  Description: >Reports any calls to a simple property getter from within the property's class. A simple property getter is defined as one which simply returns the value of a field, and does no other calculation. Such simple getter calls may be safely inlined, at a small performance improvement. Some coding standards also suggest against the use of simple getters for code clarity reasons.
Move BuildRuleWithBinary to apple package  Summary: Moving `BuildRuleWithBinary` to `com.facebook.buck.apple` package where it's only used.  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: 44f9c99
Added license headers
AbstractJackson2Encoder uses private fields  Make the protected fields in AbstractJackson2Encoder private plus minor refactoring to the way streaming separators are applied.  The current (5.0.3) behavior is to always use '\n', but in 5.0.4 the newly supported "application/stream+x-jackson-smile" needs to be excluded from that. For now, separator determination remains private in the abstract base class, but current behavior remains which is to apply '\n' by default.  Issue: SPR-15424
Use SQL types in error messages
test: install a new signed license when running index BWC tests  This change now installs a signed license that has been generated at runtime so the BWC tests can run without hitting licensing issues. The x-pack BWC tests pull in the full cluster state, which contains the trial license from when the indices and state was generated. After the trial license period and grace period issues arise with the tests.  Closes elastic/elasticsearch#3858  Original commit: elastic/x-pack-elasticsearch@1c79e874e5033aedac14e7913fa9d194b62f56c9
Fix UDP Multicast writes. See #237
Remove useless double canonicalization Fix warning
adding missing finals
HHH-6495 Putting FailureExpected on class level until the component processing via annotation is working
cxx: make C/C++ tests runnable via `buck run`  Test Plan: `buck run ..` on `cxx_test` target  Reviewed By: aiked  fbshipit-source-id: c0cfd4b
Minor refactoring: remove duplicated code
Make unused Loads simplify in more cases  If they require a check, just replace them with this check.
Update copyright headers in IdGenerators
Add getDescription() to BuildTargetPattern and VisibilityPattern.  Summary: For the upcoming `buck autodeps --suggest-partition` feature, we need a way to produce the serialized version of a `VisibilityPattern`. This new API makes that straightforward to do.  Test Plan: Unit tests  Reviewed By: Coneko  fbshipit-source-id: e720502
Allow for reuse of key visitor classes in tooling  Based on https://github.com/SpringSource/spring-framework/pull/263
allow plugins to provide actual Module instances, not just classes to create the modules from
Issue #2874,  methods to book file id before creation were added.
Publish failed event in both cases: when transaction was marked as failed and when it was terminated. Restore previous behaviour. Add test for this specific case.
Exists API can send response body, closes #2072.
Ensure order is preserved in Rabbit addresses    Using StringUtils.commaDelimitedListToSet() does not preserve order (why?),  so we have to use commaDelimitedListToStringArray().    Fixes gh-1262
Introduce mayNullCheckSkipConversion method in ConvertNode interface. Move address lowering after fixed read phase.
Put nonoss under Spring framework
GROOVY-4818: JsonSlurper's methods are package private
Make CLI argument parsing more robust  Summary: Fixing this exception:    java.lang.StringIndexOutOfBoundsException: String index out of range: 0     at java.lang.String.charAt(String.java:658)     at com.facebook.buck.cli.StringSetOptionHandler.parseArguments(StringSetOptionHandler.java:75)     at org.kohsuke.args4j.CmdLineParser.parseArgument(CmdLineParser.java:520)     at org.kohsuke.args4j.CmdLineParser.parseArgument(CmdLineParser.java:459)     at org.kohsuke.args4j.spi.SubCommandHandler.subCommand(SubCommandHandler.java:117)     at org.kohsuke.args4j.spi.SubCommandHandler.parseArguments(SubCommandHandler.java:102)     at org.kohsuke.args4j.CmdLineParser.parseArgument(CmdLineParser.java:520)     at com.facebook.buck.cli.Main.runMainWithExitCode(Main.java:642)     at com.facebook.buck.cli.Main.tryRunMainWithExitCode(Main.java:1479)     at com.facebook.buck.cli.Main.runMainThenExit(Main.java:1564)     at com.facebook.buck.cli.Main.main(Main.java:1582)     at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)     at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)     at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)     at java.lang.reflect.Method.invoke(Method.java:497)     at com.facebook.buck.cli.bootstrapper.ClassLoaderBootstrapper.main(ClassLoaderBootstrapper.java:62)  Test Plan: Save some text in a file and add an empty line to this file, then run this command:      buck targets --type java_test robolectric_test cxx_test python_test --referenced_file @/file/location  It should not fail.  Reviewed By: sdwilsh  fb-gh-sync-id: bfa22b8
Make HttpDownloader not throw on error  Summary: The recent change "Introduce a stacked Downloader" made it possible for multiple Maven repositories to be available during the build, but it wasn't possible in practice to use them because the first repository would throw an exception and the others would not be checked.  Change from an exception to a log message and "return false".  Test Plan: Built an app that required "git fetch" to get libraries from both Maven Central and the local Android and Google m2 repositories.
Unused imports.
MAHOUT-1014 Moving newsgroups helper to a common location
@Import detects and accepts existing configuration class of the desired type
TIKA-314: Initial support for JPEG EXIF metadata extraction  Add license headers, generics
Remove private constructors for public leaked classes according to clirr
reduce gc pressure by using singleton Operators for single, distinct, distinctUntilChanged, onBackpressureBuffer, isEmpty
Renamed ChunkStream to ChunkedInput Renamed ChunkStreamWriteHandler to ChunkedWriteHandler Renamed FileChunkStream to ChunkedFile
Remove Immutable annotations.  Summary: We don't use them consistently.  Test Plan: CI  Reviewed By: bolinfest  fbshipit-source-id: 23e5735
Finally working item-based Hadoop recommender
[FLINK-2158] Add support for null to the DateSerializer  This closes #780
[BEAM-734] Add support for Spark Streaming Listeners.
Add some assertions
CAMEL-3676: Removing $ in source files.
CAS-1475: Deprecated and added logs.
Fix outdated Javadoc in the TestContext framework  Fixed outdated Javadoc regarding support for 'annotated classes' in the TestContext Framework.
Update legacy test stuff too.
Add more variants of ByteBufAllocator.ioBuffer() / Update Javadoc
STORM-726: Adding nimbus.host config for backward compatibility.  Conflicts:     storm-core/src/jvm/backtype/storm/utils/NimbusClient.java
Add ClientRequest.attribute(String)  This commit adds the attribute(String) convenience method to the ClientRequest class. It also adapts the Basic Authentication filter to use it.
Put nonoss under Spring framework
Switch to using a varargs syntax in CommandRunner.  Summary: We use the array syntax for the final argument for CommandRunner.runCommand. If we use the varargs syntax, calling the method becomes cleaner.  Test Plan: buck test --all
2.x: Single.subscribe() to report isDisposed() true on success/error (#5163)
HOTFIX: ChangeLoggingKeyValueStore.name() returns null  This class doesn't need to override this method as it is handled appropriately by the super class  Author: Damian Guy <damian.guy@gmail.com>  Reviewers: Guozhang Wang <wangguoz@gmail.com>  Closes #2397 from dguy/hotfix-npe-state-store
Add missing license headers
Update ClassLoaderSafe adapters with new layout spi
nodetool print compaction percent complete patch by Chris Burroughs; reviewed by jbellis for CASSANDRA-2551
Merging capabilities to options should be fluent
assign names to threads that do not have one.  patch by jbellis
fix for: https://issues.apache.org/jira/browse/AMQ-3742 with supplied unit test patch applied.
[BEAM-5945] add reverse
Some more descriptions/docs and moved a method to MapUtil
assign names to threads that do not have one.  patch by jbellis
Use HostTargetConfiguration in stampede  Summary: `HostTargetConfiguration` is used by default when target platform is not specified.  Reviewed By: bobyangyf  fbshipit-source-id: 33f8a568a5
Avoid transforming MACH_O_BUNDLE link type to SHARED when messing with Stripping.  Summary: Seems like `CxxDescriptionEnhancer` has been rewriting the `BuildTarget` flavor of `MACH_O_BUNDLE` to `SHARED`, and code interfacing with it has been written to work around that. This fixes the issue by no longer doing this incorrect flavor renaming.  Test Plan: CI  Reviewed By: beefon  fbshipit-source-id: a6b7d6e
Added more debug info to thrift http request workflow  Summary: Two of the possible failures are: - during connecting - while downloading the artifact  We add more logs in case there's a failure in one of those situations.  Test Plan: CI  fbshipit-source-id: 7956702
WW-4110 Marks AOP support as deprecated
Fix NPE in Derivative Pipeline when current bucket is null  Sequence of events that lead to the NPE:  - avg metric returns NaN for buckets - Movavg skips NaN or null buckets, and simply re-uses the existing bucket (e.g. doesn't add a 'movavg' field) - Derivative references Movavg, the bucket resolution returns null because Movavg wasn't added to the bucket, NPE when trying to subtract null values
Follows changes in AbstractGraphDatabase
Get color diagnostic option directly from passed in tool  Summary: Instead of passing it down via preprocessor/compiler delegate, into ToolCommand, into Step, just get the args from the tool, which is already passed into the step.  Test Plan: CI  Reviewed By: beefon  fbshipit-source-id: 18d6399
Rename AbstractHandlerResultHandler to HRHSupport
Unignoring tests passing in updated HtmlUnit driver
Reduced frame length for the tests and @Ignores a test which accidentally produces a deadlock during client shutdown
Cancel Subscription when onError is invoked internally  AbstractResponseBodyProcessor.onError and AbstractResponseBodyFlushProcessor.onError will be invoked when: - The Publisher wants to signal with onError that there are failures. Once onError is invoked the Subscription should be considered canceled. - The internal implementation wants to signal with onError that there are failures. In this use case the implementation should invoke Subscription.cancel()
avoid unnecessary autoboxing
Clarify Javadoc for Triggers.  ----Release Notes----  [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=92583941
[BEAM-316] Add file scheme support in TextIO
CAMEL-4758: Improved javadoc. Thanks to Glen Mazza for patch.
Add getDescription() to BuildTargetPattern and VisibilityPattern.  Summary: For the upcoming `buck autodeps --suggest-partition` feature, we need a way to produce the serialized version of a `VisibilityPattern`. This new API makes that straightforward to do.  Test Plan: Unit tests  Reviewed By: Coneko  fbshipit-source-id: e720502
Introduce ProjectFilesystemDelegate.getDetailsForLogging()  Summary: This supersedes what was done in D5620740 to add more details in the Chrome trace about the `ProjectFilesystemDelegate` that was used. In particular, I worry about misspelling `eden.disable_sha1_fast_path` and it not having the desired effect, so this is a simple way to verify it.  Test Plan: Do a Buck build in Eden with and without `--config eden.disable_sha1_fast_path=true` and run the following after each run and verify it has the expected output:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  Reviewed By: ttsugriy  fbshipit-source-id: 6b54cca
working on ctor args
don't discard original exception (suspiciously/possibly eclipse-generated)
Ensure durations can be parsed as values
Extend existing nodes to support additional bit widths.
Revert "mute failing filerealm hash caching tests (#42304)"  This reverts commit 8907dc9598667a1fa29be0ba22c7030ebee1101b.
[Test] AwaitsFix for tcp timeout tests. See elastic/elasticsearch#499  Original commit: elastic/x-pack-elasticsearch@31b79d51ac26af8a5042f25d8d5e992993e0c4a7
fixed silent failure in case of missing set with dotted notation in odocument.field api, issue #5308
Enable separate thread pool for rulekey fetches  Summary: This enables the separate thread pool for rulekey fetches. The pool is given min(cache thread pool size, network io resources) thread max.  Test Plan: CI, `buck build --populate-cache fb4a` to ensure no OOM issues  Reviewed By: ruibm  fbshipit-source-id: 7c1be41
Updated compiler options.
Remove unused SourcePathRuleFinder  Summary: Nothing is using this.  Reviewed By: styurin  fbshipit-source-id: 1da0fc0d97
Replace the many asNode methods with one on ValueNode and one on FixedNode
Some very simple improvements regarding ArrayList
Avoid transforming MACH_O_BUNDLE link type to SHARED when messing with Stripping.  Summary: Seems like `CxxDescriptionEnhancer` has been rewriting the `BuildTarget` flavor of `MACH_O_BUNDLE` to `SHARED`, and code interfacing with it has been written to work around that. This fixes the issue by no longer doing this incorrect flavor renaming.  Test Plan: CI  Reviewed By: beefon  fbshipit-source-id: a6b7d6e
Code clean up to use braces and java 7 features
Make the lifetime of BuildInfoStoreManager longer than the CommandThreadManager  Summary: BuildRule futures can outlive the CachingBuildEngine, for various reasons (perhaps they ignore InterruptedException, for example).  This creates a problem when the CachingBuildEngine closes, and in turn closes its BuildInfoStores, since those long-lived futures can later attempt to write to the now-closed Store.  Fix this situation by making the BuildInfoStoreManager a long-lived object; placing it in CommandParams allows it to be easily propagated to the creation sites of CachingBuildEngines, and it naturally outlives the CommandThreadManager, which will reap all of the BuildRule futures when it shuts down.  Test Plan: RocksDBBuildInfoStore no longer segfaults on Ctrl-C  Reviewed By: marcinkosiba  fbshipit-source-id: 46617a9
Minor improvements to MoreFiles and added more test coverage.  Summary: Test coverage for MoreFiles is now up to 87%. (It looks like EMMA only gives partial credit for a try-with-resources block if an IOException is never thrown.)  Test Plan: Sandcastle builds.
Issue #4165: Split and Organize Checkstyle inputs by Test for ExplicitInitializationCheckTest
Remove / clean-up pointless javadoc
Removed unused imports
Add option for double scheduling  Allows nodes to be selected multiple times during selection for a particular stage
MAHOUT-1258: Another shot at findbugs and checkstyle - removed unused imports
Add HashFunction#hashObject() shortcut. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=38044012
Removed unused imports and an unused local variable reported by Eclipse
Rename WebTestClientConnectorTests to match class name
Prepend -Xlinker to linker flags in project generation.  Summary: Buck prepends -Xlinker to linker_flags during building. This makes project generation have the same behaviour.  Test Plan: CI
Fix for https://issues.apache.org/activemq/browse/AMQ-1449
Make the deprecation messaging on legacy index APIs more consistent.
Thread entire QueryEnvironment through QueryExpression.parse  Summary: In order to introduce parse-time resolution of target literals, we will have to pass the environment down to access the context (including the cell)  Test Plan: Functionality unchanged; existing tests pass  Reviewed By: illicitonion  fbshipit-source-id: 8828bce
Prevent possible NPE (from the testbeans branch, but unrelated).
Make Rule tests use Memo and Lookup
Add detectHandlerMethodsInAncestorContexts property to AbstractHandlerMethodMapping.
Add support for setting ip address for web server
Remove $Id keyword from files in catalina/startup/**
Remove unused SourcePathResolver from UnzipAar  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 4d9f1ff
Allow types to customize the name displayed in DESCRIBE
Make NoSuchBufferException message more useful
[euphoria-core] Join operator hint tests - equals, hash code.
Use Throwables.propagate on ExecutionException
Add ImmutableBiMap.Builder.put(Entry) overload, which had previously not been overridden from ImmutableMap.Builder.  Now, it correctly returns ImmutableBiMap.Builder. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=75833810
Throw ESIA if required field 'patterns' is not present in filter config.  If 'pattern_capture' tokenfilter is create / mapped without a 'patterns' settings we now throw an exception since this is a misconfiguration and likely due to the similar settings on related token filters.  Closes #3808
Add expected mapping type to `MapperException` (#31564)  Currently if a document cannot be indexed because it violates the defined  mapping for the index, a MapperException is thrown. In some cases it is  useful to expose the expected field type in the exception itself,  so that the user can react based on the error message. This change adds  the expected data type to the MapperException.  Closes #31502
Move the ES output adapter to upper level
Cleanup: Ensure no logic is executed in the constructor  The SignatureService tried to access the system key file in the constructor, which could lead to endless loops. This PR moves the service into a AbstractLifecycleComponent to keep the constructor dumb.  Relates elastic/elasticsearch#517  Original commit: elastic/x-pack-elasticsearch@b1e5bfe98c519caaeab87163940482562ebd2e4b
Fixed check style issues
Add a standard method for returning input to the SocketWrapper. Use this to make the code consistent between upgrade processor implementations.
Rename method for clarity
Remove unused SourcePathResolver from CxxInferComputeReport  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: c24315d
remove some dead code
Ticket metadata abstracted into methods
Use shard as a name of lucene index part  Update storage layout name to reuse agreed terminology.
Make parameters of Parser.getTargetNodeRawAttributes explicit  Summary: This will refactored later and explicit parameters make future refactoring easier.  Reviewed By: bobyangyf  fbshipit-source-id: b965f22409
Adding licence header to files to make the build pass
Cache lookup path in ResourceUrlEncodingFilter  Commit https://github.com/spring-projects/spring-framework/commit/2b97d6 introduced a change where the path within the DispatcherServlet is determined with each call to ResourceUrlProvider.getForRequestUrl.  To avoid repeating that every time a URL is encoded through the response, we now cache the result of the lookupPath determination in ResourceUrlEncodingFilter.  Issue: SPR-12332
Some very simple improvements regarding ArrayList
Remove "presto" from uris
fixed @MVC processing of parameter-level annotations to work with interface-based proxies again (SPR-7483)
Bug 57193: Remove self-closing elements like <p/> or <br/>. Bugzilla Id: 57193
Cleanup: bulk removal of unused imports
use waitOnFuture more often
Add buck config option for ProcessTracker  Test Plan: Verify that ProcessTracker gets instantiated only when adding the buck config option:      [log]         process_tracker_enabled = True  Reviewed By: marcinkosiba  fbshipit-source-id: 4f2d90e
Replace uses of log4j with slf4j
Move TruffleStackTraceElement#{fillIn,getStackTrace} to TruffleStackTrace  * Where they logically belong.
[CAMEL-8428] Move getEndpoint() methods to EndpointAware interface
Updated OProfiler. Added getContext API
CAMEL-8561: Better component docs summary of components - we use javadoc from the endpoint class instead of component so its in the same source file as @UriEndpoint.
Process monitor refresh interval setting  This commit converts the process monitor refresh interval setting "monitor.process.refresh_interval" to the new settings infrastructure.
added some new javadoc comments
Fixes a bug in Sample.Any  (I introduced the bug while merging a different PR...) Also adds a test for the combine fn and exposes the fn. Documents the difference between any() and fixedSize().
Make ProjectConfig a NoopBuildRule.  Summary: ProjectConfig doesn't produce any output, so it should be a NoopBuildRule  Test Plan: CI
Use the random server selection strategy when pulling.  The random strategy was already in use for store copy, but it also makes sense for the recurring transaction pulling, as a first and simple solution for load balancing, handling topology changes, etc.  Previously we would just select the first server in the stable topology.
CAMEL-581: Clearing endpoing chache when stopping. And fixed a typo in DataSetEndpoint
Introduce ProjectFilesystemDelegate.getDetailsForLogging()  Summary: This supersedes what was done in D5620740 to add more details in the Chrome trace about the `ProjectFilesystemDelegate` that was used. In particular, I worry about misspelling `eden.disable_sha1_fast_path` and it not having the desired effect, so this is a simple way to verify it.  Test Plan: Do a Buck build in Eden with and without `--config eden.disable_sha1_fast_path=true` and run the following after each run and verify it has the expected output:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  Reviewed By: ttsugriy  fbshipit-source-id: 6b54cca
Assume UTF-8 encoding for build files.  Summary: Latin-1 that was previously used does not support some unicode characters.  Reviewed By: styurin  fbshipit-source-id: 7a19998
Increase visibility in PAssert and ZipFiles utilities  This is needed for package reorganization in runners/google-cloud-dataflow. Those classes will have to move away from org.apache.beam.sdk.* packages.
Plugins: Add ScriptService to dependencies available for plugin components
move default value wrapper into support package (rather then interceptor)
Rename authentication test classes to reflect the actual test case. The JUnit classes test the opposite of what their original names suggest.  Signed-off-by: Gregor Zurowski <gregor@zurowski.org>
Made StrutsJunit4 classes abstract
HIVE-3708 : Add mapreduce workflow information to job configuration (Billie Rinaldi via Ashutosh Chauhan)
Remove reference to 5.0 release.  Motivation:  Comments stating that AUTO_CLOSE will be removed in Netty 5.0 are wrong, as there is no Netty 5.0.  Modifications:  Removed comment.  Result:  No more references to Netty 5.0
BEAM-5372 -> Make minPauseBetweenCheckpoints setting available in FlinkPipelineOptions
Add -Dsulong.LLVM option, to specify file version
Use SQL types in error messages
Added license headers
associate a DiscoveryNode instance with RoutingNode, so there is no need to look it up based on node id
resolve https://issues.apache.org/activemq/browse/AMQ-2321
TIKA-346: ZipParser throws "invalid compression method" error for some archives
cxx: allow configuration shared library extension used for C/C++ platforms  Reviewed By: adamjernst, ttsugriy  fbshipit-source-id: c7900cd
Issue 11510: Throw Exception for missing settings file  An Exception will be thrown when the givven YAML-file doesn't exist.
Get rid of a deprecated method in ProjectFilesystem.  Summary: And use `Path`.
clean delegated authn to wsfed
Acquire command through the CAS  Summary: In remote execution, the command itself should be passed via the CAS instead of in the request directly. This allows the command to be reused across changes to inputs the don't affect the command (which is rather common).  This changes RemoteExecution to push the command into the CAS and to acquire it from the CAS.  Reviewed By: ttsugriy  fbshipit-source-id: b2dad07
Fix a misspelling, tiny method change
Add some missing @Nullable annotations.  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=132065891
Consistent exclusion of bridge methods in annotation post-processors (for Java 8 compatibility)  Issue: SPR-12187
allow for settings loader to load data from byte[], not just string
Rename SimpleEdgesConnecting to EdgesConnecting to be consistent with our naming pattern for NetworkConnections (*NetworkConnections and *MultiNetworkConnections).  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=130551638
There was no need to introduce a thread local to avoid event recursion
- don't put another application/ in front of the existing application/x-hdf and application/x-netcdf
[TEST] assume assertions are enabled
Polish Javadoc for caching annotations
Use StringBuilder instead of StringBuffer
Android (fragment): Added isFragment method  This allows us to make check if the app is a fragment without having the developer depend on the support jar
add missing license headers  Patch by eevans
Removed printStackTrace(...) from whole code, issue #660
fix heisenbug in RecoveryManager2Test where a compaction could add back a new sstable to the "cleared" ColumnFamilyStore patch by jbellis; reviewed by junrao for CASSANDRA-463
Added some io utils and removed an unused variable
TIKA-416: Out-of-process text extraction  More javadocs and some cleanup.
https://issues.apache.org/jira/browse/AMQ-4108 - fix unit test regression, QueueMasterSlaveTest,  related to https://issues.apache.org/jira/browse/AMQ-4005 and the dual impl of broker service aware. the auto created locker was not getting its broker service init. flakyness in test related to exponential backoff tool long for reconnect
CLOUDSTACK-1862 Added vm ip address info in the list PF rules response  Signed-off-by: Abhinandan Prateek <aprateek@apache.org>
Prevent cases when exception during locks client close causing transaction to be never released into the pool, and stuck with closing status forever.
WW-4110 Marks AOP support as deprecated
MAHOUT-1258: Another shot at findbugs and checkstyle - removed unused imports
CAMEL-13150: Add command "exchangeProperty" for dateExpression in ExpressionBuilder (#2741)
updating license and adding some generics
encrypt oidc tokens support
More JDK8 api change fixes.
Extra method instead of base implementation of next
Cleanup: Ensure no logic is executed in the constructor  The SignatureService tried to access the system key file in the constructor, which could lead to endless loops. This PR moves the service into a AbstractLifecycleComponent to keep the constructor dumb.  Relates elastic/elasticsearch#517  Original commit: elastic/x-pack-elasticsearch@b1e5bfe98c519caaeab87163940482562ebd2e4b
Avoid potential NPE in toString()  Issue: SPR-1528
tidy up some @since version numbers
fix possible race in IndexServiceTests#testBaseAsyncTask and add mock plugin SearchWithRandomIOExceptionsIT
Migrate Executor-less Futures callback methods to the ones with an Executor, while applying MoreExecutors.directExecutor() for identical behavior.  For more information, see [] []  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=155174706
MINOR: JavaDoc improvements for RangeAssignor (#4079)
Clean up javadoc
WW-1453  Simple cleanup items   - remove duplicate and/or unused imports   - change static access to class, not instance
moved the CamelClient into the core Camel API package
Now need to close both streams
Add flag to restore legacy array_agg behavior  The flag is named experimental.legacy-array-agg, which is default to be false. When it is set to true, array_agg will ignore the null values.
Introduce ProjectFilesystemDelegate.getDetailsForLogging()  Summary: This supersedes what was done in D5620740 to add more details in the Chrome trace about the `ProjectFilesystemDelegate` that was used. In particular, I worry about misspelling `eden.disable_sha1_fast_path` and it not having the desired effect, so this is a simple way to verify it.  Test Plan: Do a Buck build in Eden with and without `--config eden.disable_sha1_fast_path=true` and run the following after each run and verify it has the expected output:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  Reviewed By: ttsugriy  fbshipit-source-id: 6b54cca
updated comments and logging statements
ClusterClient feeds proper logging to NetworkInstance
Fixed tests with durations on throttling and others
Fix analyzed prefix query in query_string (#35756)  This change fixes analyzed prefix queries in `query_string` to be ignored if all terms are removed during the analysis.  Closes #31702
Anchor InstanceOf to branches  This allows the anchor to be optimized
PrebuiltOcamlLibrary: Remove unused SourcePathResolver  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: b4b6001
made sure to use the class name as database name in distributed tests
Move extractSymbols to SymbolsExtractor
Investigate claim on SO regarding ctx cache in TCF  This commit introduces a test that investigates a claim made on Stack Overflow regarding context caching in the TestContext Framework (TCF).
[AMQ-6691] allow dlq flag to be set via jmx to allow retry op after a restart - use destinations element for long term persistence
Minor cleanup.
Added a bit of logging
Rename and make internal the execution guard settings
CAMEL-11379: Optimise - core type converters to be invoked faster
dont throw exceptions. return flags instead
[added] Action.getTarget() for profit!
[FLINK-9275] [streaming] Add taskName to the output flusher thread's name  This closes #5943
Fix build  Original commit: elastic/x-pack-elasticsearch@474e5e7a9a5adfc561f6719f4bca349ff7329b15
Truffle: simpler, more consistent toString for DirectCallNode subclasses.
Be sure to remove framestate of merge when removing empty diamond shape
javadoc corrections patch by dbrosius; reviewed by jbellis for CASSANDRA-3063
Use the logs directory for the internal log.
Copy all transitive frameworks of the particular bundle types into the bundles  Summary: After removing the phase of copying subframeworks into framework bundles, apps became broken if they are launched outside of Xcode session/derived data. This is because app bundle basically didn't contain these frameworks anymore. This diff fixes this issue by adding all transitive frameworks into copy phase for generated Xcode project.  Test Plan: CI, added unit test. Generate project for Mac app with frameworks Build it using Xcode Move the app bundle to Desktop and double-click it there, app should launch normally.  Tested building Color Picker extension. It still had Frameworks included, and launched correctly.  Reviewed By: ryu2, darknoon  fb-gh-sync-id: 3f618b2
Synchronized between 4.1 and master (part 3)  Motivation:  4 and 5 were diverged long time ago and we recently reverted some of the early commits in master.  We must make sure 4.1 and master are not very different now.  Modification:  Fix found differences  Result:  4.1 and master got closer.
Introduce TraceTruffleInliningTree option.
MarshallingView unwraps JAXBElement value for Marshaller.supports(Class) check  Issue: SPR-11827
javadoc improvements: * diagrams for switchLatest, mergeMap, concatMap, switchMap, mapWithIndex, doOnNext * change text to note deprecation of aggregate * standardized formatting * force image size in ReplaySubject javadoc
[#5507] SingleThreadEventExecutor should reject call invoke*() from within the EventLoop.  Motivation:  ExecutorService.invoke*(...) methods may block by API definition. This can lead to deadlocks if called from inside the EventLoop in SingleThreadEventExecutor as it only has one Thread that does all the work.  Modifications:  Throw a RejectedExectionException if someone tries to call SingleThreadEventExecutor.invoke*(...) while in the EventLoop.  Result:  No more deadlock possible.
intial support for pluggable type mappers
removed unused imports and fixed a javadoc mistake
1) Remove customer field applied to virtual machine in VMware. 2) always track VM host change in VMware regardless whether or not native HA is enabled
add evictions stats to field data
Follows changes in AbstractGraphDatabase
SimonStewart: Cleaning up some imports  r16101
[#2573] UnpooledUnsafeDirectByteBuf.setBytes(int,ByteBuf,int,int) fails to use fast-path when src has array  Motivation:  UnpooledUnsafeDirectByteBuf.setBytes(int,ByteBuf,int,int) fails to use fast-path when src uses an array as backing storage. This is because the if else uses the wrong ByteBuf for its check.  Modifications:  - Use correct ByteBuf when check for array as backing storage - Also eliminate unecessary check in UnpooledDirectByteBuf which always fails anyway  Result:  Faster setBytes(...) when src ByteBuf is backed by an array.  No more IndexOutOfBoundsException or data-corruption.
More multi-window fixes... the RC AJAX mode now supports multi-window mode as well.  r3027
[Tests] change BasicBackwardsCompatibilityTest to be compatible with 1.0.3  Also increase the time we wait for an external node to join Sadly tests are not yet stable enough, testing with 1.0.3 is still disabled
Make TargetNode implement HasBuildTarget.  Summary: So that we can use the convenient HasBuildTarget.TO_TARGET function.  Test Plan: buck test --all
Introduce mayNullCheckSkipConversion method in ConvertNode interface. Move address lowering after fixed read phase.
wildcard query on _index (#27334)
Avoid migrating "Nothing" during database upgrade.  Previously in case if NOT_PARTICIPATING participant in anyway was added into a list of database upgrade participants it took part in database migration and was reporting its progress as "Migrate Nothing" thingy. This PR changes that and simply ignores NOT_PARTICIPATING participants that added into StoreUpgrader during its constructions.
Added JavaDoc for handler.codec.frame package.
HIVE-8326 Using DbTxnManager with concurrency off results in run time error (Alan Gates, reviewed by Eugene Koifman)
Watcher: Fix encoding of UTF8 data in HttpClient (elastic/x-pack-elasticsearch#3398)  The HttpClient uses an Apache HTTP client class named StringEntity to encode a HTTP request body. This one however assumes ISO-8859-1 as its charset when encoding the string based body to bytes.  This commit switches to a byte array based body, then sets the content type header and falls back to the old text/plain content type if no content type header is specified.  relates elastic/x-pack-elasticsearch#3397  Original commit: elastic/x-pack-elasticsearch@d5a6e7f0c7f65e507564b9aaab91be97e0beb77c
Add private constructors to builder classes.
Share common parser in some AcknowledgedResponses (#31169)  Several AcknowledgedResponse implementations only parse the boolean acknowledged flag and then create an instance of their class using that flag. This can be simplified by adding this basic parser to the superclass, provide a common helper method and call the appropriate ctor in the fromXContent methods.
Fixes due to changes in master branch.
Add checkNotModified support for view resolution  Issue: SPR-14522
Widgets now use setSize instead of setWidth/Height.  This avoids computing the pref size twice, since setWidth calls sizeChanged which invalidates.
Make sure all public classes/interfaces in common.graph have @Beta and @since.  Also, a little bit of narcissism :) add myself to authors to the main interfaces (Graph/Network/MutableGraph/MutableNetwork). I normally wouldn't list myself first but the convention seems to be alphabetical order. ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=125691964
Fixed CS for Camel-JMS
Corrected naming Operator -> Operation
replaced Service marker interface with non-standard META-INF directory names to differentiate JVMCI providers from standard service providers META-INF/services/ files for Options provider are now generated directly from files in META-INF/jvmci.options/
Move string to BuildTarget conversion to a more appropriate class to avoid cyclic dependencies.  Summary: String->BuildTarget conversion is the BuildTargetParser's job. This diff also helps avoid cyclic dependencies in future work.  Test Plan: CI  Reviewed By: ruibm  fbshipit-source-id: e1b6d75
Remove unused StepContext name methods
Update to latest Reactor 3.1 API changes  Issue: SPR-15318
Updated Truffle-SL to new codegen API.
Refactor to remove o.a.c -> o.a.c.util dependency
ContextTestSupport supports many RouteBuilders to be tested Tests without test methods made abstract so eclipse doesn't complain when executing them
SPR-7354 - Added equivalent of JAX-RS @Consumes to Spring MVC
Replace usages of deprecated Objects.toStringHelper() with MoreObjects.toStringHelper(). ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=69572761
Fix CONTAINS operator on lists of maps  Resolves: #8604
Get rid of a deprecated method in ProjectFilesystem.  Summary: And use `Path`.
Add more logging in the Coordinator-startup codepath.  Summary: Moar log messages.  Test Plan: thereisnoneedtobeupset  Reviewed By: michsien  fbshipit-source-id: a5b4d49
Fixed regression with fallback for non-resolvable property type
Make the BeanToJsonConverter avoid fields from java.lang.Object  I'm suspicious about the need for us to send "class" backwards and forwards, but it's apparently used by to reconstitute exceptions so we should probably leave it.
Introduce ServerRequest.methodName()  This commit introduces a methodName() method to the ServerRequest, returning the String name of the method. This method is useful for non-standard HTTP methods.
fixed cs issues by removing unused certs
build sneaky throws
Show materialized files count only per server  Summary: Removed materialized files count from the main stats line in stampede builds. It shouldn't be there, it's noise for most devs. Also, it was summing (same) files materialized on all minions, it's more useful per minion.  Test Plan: Ran an example build: https://pxl.cl/bsNp  Reviewed By: ruibm  fbshipit-source-id: fb300ed
https://issues.apache.org/bugzilla/show_bug.cgi?id=52002 Improvements to the pool - the default should be that multi thread close should not affect the connection isValid should return false if a connection has been closed
Add Javadoc for main interfaces/classes
CAMEL-12352 - make system property uppercase if given lowercase in simple expression
CAS-1474: Removed unneeded prop from handler.
Pass canonicalizer into IterativeConditionalEliminationPhase.
Describe a necessity to copy frame arguments in nodes tagged with RootTag.
minor patch to add a handy newInstance() method to create an object from a class
Method for instantiating a RelationshipTypeCreator so that it can be overridden
Unignoring tests passing in updated HtmlUnit driver
Unused imports.
Add more specific prints for the cases where a specific log file could not be opened.
Pass topScorer=false to sub-scorers if a scorer is wrapped. Wrapped BooleanQuery can return collect-only scorers. See #2505
disable caching of messages for the Queue Cursor
Polish Javadoc for converters
Remove legacy hive.bucket-writing config property
Add WorkProcessor#transformProcessor method  This methods allows to write more streamlined transformations of the processor itself, e.g:  processor.transformProcessor(WorkProcessorUtils::flatten)
Enforce that ABI rules are not created if there is no library jar  Summary: Previously we would just return a null `Path` for an ABI jar in such a case, but really we should never even create the ABI rule.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: c948fcd
PrebuiltOcamlLibrary: Remove unused SourcePathResolver  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: b4b6001
CLOUDSTACK-6476: Basic Zone with Multiple Pods Setup: DHCP server doesnt get deployed in the pod where the VM gets deployed  Changes: PodId in which the router should get started was not being saved to the DB due to the VO's setter method not following the setXXX format. So when planner loaded the router from DB, it always got podId as null and that would allow planner to deploy the router in any pod. If the router happens to start in a different pod than the user VM, the Vm fails to start since the Dhcp service check fails.  Fixed the VO's setPodId method, that was causing the DB save operation fail.
Code formatting. Operator wrap -> eol No functional change
Have ProjectFileSystemView support reading attributes  Reviewed By: bobyangyf  fbshipit-source-id: 7391713b25
Remove Cell.getAbsolutePathToBuildFileUnsafe(BuildTarget)  Summary: This is a part in a series of changes to remove ParserConfig-related information from Cell.  Reviewed By: bobyangyf  fbshipit-source-id: 3719ffc3fb
Replace withoutCell() with getCellRelativePath()  Summary: withoutCell() is a super-powerful function that makes it really hard to restrict the state of build targets. We only need it to construct paths that don't include the cell name...  Update some comments to make it clear what things include cell names vs not.  Reviewed By: bobyangyf  shipit-source-id: d3ef9a8a8b
Added some links into the example code
Resync fails to notify on unavaiable exceptions (#33615)  We fail to notify the resync listener if the resync replication hits a shard unavailable exception. Moreover, we no longer need to swallow these unavailable exceptions.  Relates #28571 Closes #33613
Optimized scalar observeOn/subscribeOn
rename default compiler config to basic to match configuration name
Absorb ImmutableSettings into Settings
Add MaterializedResult.toPage()
Rename PagesHashStrategy compare to compareSortChannelPositions
Add QueryStateMachine.getFailureInfo to avoid creation of QueryInfo
Switch BigTableIO from Guava futures to Java 8 futures
Use LinkedHashmap to preserve insert order  In several places in the spring-webmvc module, URL patterns / objects relationships are kept in `HashMap`s. When matching with actual URLs, the algorithm uses a pattern comparator to sort the matching patterns and select the most specific. But the underlying collection implementation does not keep the original order which can lead to inconsistencies.  This commit changes the underlying collection implementation to `LinkedHashmap`s, in order to keep the insert order if the comparator does not reorder entries.  Issue: SPR-13798
Support for bean refs in event SpEL condition  Issue: SPR-13814
Fixed minor problems with unit tests
Don't let VMsync touch the VM if VM has been scheduled for HA but HA is not yet running.
Use ExecutorService execute instead of submit so that Errors in EventBus subscribers propagate out  Summary: `ExecutorService.submit` will swallow any exceptions if the FutureTask it returns is not used, or the ExecutorService doesn't override `afterExecute`. From the [docs](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/ThreadPoolExecutor.html#afterExecute-java.lang.Runnable-java.lang.Throwable-): `Note: When actions are enclosed in tasks (such as FutureTask) either explicitly or via methods such as submit, these task objects catch and maintain computational exceptions, and so they do not cause abrupt termination.`  Reviewed By: jkeljo  fbshipit-source-id: fe52b51f50
Ensure we never read from a closed MockSecureSettings object (#25322)  If secure settings are closed after the node has been constructed no key-store access is permitted. We should also try to be as close as possible to the real behavior if we mock secure settings. This change also adds the same behavior as bootstrap has to InternalTestCluster to ensure we fail if we try to read from secure settings after the node has been constructed.
Add a standard method for returning input to the SocketWrapper. Use this to make the code consistent between upgrade processor implementations.
Allow passing the null-function to native  Also remove unsupported reasons more clearly, which is how I found this problem.
[CAMEL-13114] Provide single Cookie header for multiple cookies
Introduce ProjectFilesystemDelegate.getDetailsForLogging()  Summary: This supersedes what was done in D5620740 to add more details in the Chrome trace about the `ProjectFilesystemDelegate` that was used. In particular, I worry about misspelling `eden.disable_sha1_fast_path` and it not having the desired effect, so this is a simple way to verify it.  Test Plan: Do a Buck build in Eden with and without `--config eden.disable_sha1_fast_path=true` and run the following after each run and verify it has the expected output:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  Reviewed By: ttsugriy  fbshipit-source-id: 6b54cca
Add CAST from BOOLEAN to REAL
Make sorting unconditional in followup to CASSANDRA-10162
Procedure for accessing bloom indexed properties.
[CCR] Make index.xpack.ccr.following_index an internal setting (#33768)
Optimize resolveType by reducing the invocations of String.format
DefaultHttp2Headers#contains(CharSequence, CharSequence) does not work with String  Motivation:  If you test a header value providing a String, contains() returns false. This is due to the implementation inherited from DefaultHeaders using the JAVA_HASHER.  JAVA_HASHER.equals returns false because a is a String and b an AsciiString.  Modifications:  DefaultHttp2Headers overrides contains and uses CASE_SENSITIVE_HASHER.  Result:  You can test a header value with any CharSequence implementation.
Move the option output formatting into LLVMOptions
Fixed CS for Camel-main
Log unresolved exceptions at error level
[STORM-3206] validate topoConf only against Config.java during submission
Refactoring, less guava, more standard JDK
CAMEL-7999: More components include documentation
Resolve `ndk-build` properly on Windows  Summary: The method on `ExecutionContext`, which was only called by this code, didn't handle file extensions properly.  This removes that method, and adds a method on `ExecutableFinder` to do the right thing.  Test Plan: Ran `NdkLibraryIntegrationTest` and see that it got further.
MAHOUT-1301:  toString() method of SequentialAccessSparseVector has excess comma at the end
fix issue with oauth user authentication where attributes and uid werent mapped
Update copyright date    See gh-20192
Auto-configuration of reactive Spring Session
Polishing: fix some compiler warnings
Remove explicit constructor super() calls    Closes gh-11068
Investigate issue with @ComponentScan as meta-annotation  This commit introduces unit and integration tests that attempt to reproduce the issue claimed by the reporter in SPR-11557. However, the tests pass without any problems.  Issue: SPR-11557
refactor SimpleQueryParser settings into separate class, add "lenient" option  Fixes #5011
Add some missing nullable annotations.
Add feature to SimpleJsonParser    Now it can parse nested lists as map values.    Fixes gh-169
Quick Javadoc cleanup to restore snapshot building.
Quick Javadoc cleanup to restore snapshot building.
Fix url generated from ConfigCenterConfig missed 'config.' prefix (#4411)    * fix url generated from ConfigCenterConfig missed 'config.' prefix    * remove useKeyAsParameter=false    * fix ut    * remove unused imports
Improve handling of non-standard status codes in WebClient metrics    Fixes gh-17695
Remove HalJsonMvcEndpoint\xe2\x80\x99s redirect and add links to both paths instead    Previously, HalJsonMvcEndpoint used a redirect to go from path/ to path.  When the actuator\xe2\x80\x99s configured to use a custom context path this  redirect was leading to an infinite redirect loop.    This commit removes the redirect in favour of updating the controller  advice to apply the links to requests for path and path/.    Closes gh-4853
Restore that fields shadow fields from super class    This commit restores the shadowing behaviour of JUnit 4.12. Some users  of JUnit 4 have tests that rely on this behaviour. Their tests would  fail with JUnit 4.13.    This commit finally reverts 39b8a92d24e6c81e4fc614cdf13003ce17bbc166.  Some parts have already been reverted by  ed6813d3bbe2da4d67892f73e641fa80ab4d126e.
Add test for executing Calls at most once
Add test for executing Calls at most once
Make all @Bean methods public    Fixes gh-1571
Add boolean flag spring.rabbit.listener.useTransactionManager    If set *and* there is a transaction manager in the context, then the  listener container created by Spring Boot will use the transaction  manager to execute the listeners.    Fixes gh-3432 (by virtue of not requiring a JtaTransactionManager any  more).
Move most http2 tests to Junit 5 (#6378)
Add control connection timeout property for Cassandra    Closes gh-24189
Allow case insensitive logging.level properties    Fixes gh-3356
Improve transaction manager detection    Switch the condition used to trigger the creation of a transaction  manager from the default name to the actual type.    Fixes gh-3012
Polish modifier order    See gh-12019
Add configuration property for Spring Kafka's missingTopicsFatal    See gh-16740
Apply customizers to build when created embedded Mongo client    Closes gh-11132
Remove explicit constructor super() calls    Closes gh-11068
Make JDBC-based batch configurer back off without a DataSource    Closes gh-17449
Use Collections.addAll(...) instead of for loops    Replace various for loops which add items to collections with calls  to Collections.addAll(...).    Fixes gh-2277
Avoid early init of CacheManager    This commit restructures the Cache auto-configuration to avoid an early  init on CacheManager (and potentially all its infrastructure). Rather  than adding a dependency on the validator bean, this commit relies on  the fact CacheAspectSupport checks if a CacheManager is available in the  afterSingletonsInstantiated callback. In this case, a simple bean with  a postconstruct callback is enough.    Closes gh-13038
Harmonize class visibility    Closes gh-19414
Remove unused fields in tests    Closes gh-14707
Make sure Caching is initialized before JPA support    The second level cache of Hibernate can be configured with dedicated  factories that look up for the presence of a cache infrastructure. As  Hibernate shouldn't have to know about Spring, that lookup is done  against the respective proprietary APIs.    We now make sure that caching (and the general purpose Hazelcast  auto-configuration) is fully processed before JPA kicks in. In particular  an explicit `dependsOn` attribute on those beans is added when they are  processed.    Closes gh-4158
Add @Author attribution    See gh-11077
Remove internal configuration properties validator cleanup    This commit removes the cleanup of the javax.validator.Validator that  can be created to validate @ConfigurationProperties binding as the  memory effect can no longer be reproduced.    Closes gh-10573
Remove redundant bean declarations from some of the security samples    Closes gh-6740
readability enhancement and assert check for proxy object (#3048)
refresh configCenter before start
readability enhancement and assert check for proxy object (#3048)
Remove usage of classes in Junit 4
Override the equals() and hashCode() methods of Cookie    Now it is possible to use Cookies in Collections that depend  on the hash function. (Useful when implementing an in-memory CookieJar)
Do not leak body in intermediate buffers to converters    Multiple calls to source() would create a new BufferedSource which, when a single byte was read, would cache data in its buffer which would be lost on a subsequent call to source(). Calls to source() will now always return the same BufferedSource ensuring data cannot be lost.
Use standard exception cause handling in RetrofitError.    Improves RetrofitError.toString() output.
Add @Documented to the new annotations.
Warn about future class and method removal.
Warn about future class and method removal.
readability enhancement and assert check for proxy object (#3048)
Avoid NPE when call AbstractDynamicConfiguration#execute (#6576)    fix #6575
Add support for @GrabResolver to AetherGrapeEngine    @GrabResolver can now be used to add a repository to the list that is  used for dependency resolution. Any repository that is added via the  annotation will then be available for the lifetime of the  AetherGrapeEngine instance. In reality, this equates to the lifetime  of the Boot application. This is in keeping with the documented default  behaviour [1]: 'By default, the grape subsystem is shared globally, so  added resolvers will become available for any subsequent grab calls'.    [1] - http://groovy.codehaus.org/api/groovy/lang/GrabResolver.html    [bs-345]  [60145036]
Failing single-datapoint methods keep their original stack trace
#946 - Updated TemporaryFolder.newFolder() to give a better error message if a path contains a slash
Restore that fields shadow fields from super class    This commit restores the shadowing behaviour of JUnit 4.12. Some users  of JUnit 4 have tests that rely on this behaviour. Their tests would  fail with JUnit 4.13.    This commit finally reverts 39b8a92d24e6c81e4fc614cdf13003ce17bbc166.  Some parts have already been reverted by  ed6813d3bbe2da4d67892f73e641fa80ab4d126e.
Cleanup TemporaryFolderUsageTest and add it to AllTests suite
Autowiring rejects self references to a factory method on the same bean as well  Issue: SPR-12018
Update copyright year of changed files    See gh-20020
Auto-configuration of reactive Spring Session
Fix sample and tidy up MetricWriter/GaugeWriter    The metric export configuration was still using the MetricWriter  interface where it should be using GaugeWriter
Ensure RestTemplate interceptors remain mutable    Fixes gh-4553
Handle wrapper types in Env actuator    This commit modifies the actuator `EnvironmentEndpoint` to allow  primitive wrapper types to be serialized in the response data  structure.    Fixes gh-24307
Allow data unit to be specified on the constructor parameter    See gh-21746
Add SignalFxConfig source property    See gh-12066
Support binding to collection with EnumSet values    Fixes gh-15539
Changed exception message method name    Changed method name from setMissingExceptionMessage to  reportMissingExceptionWithMessage to be more consistent with the  existing API.
TestRestTemplate should not override request factory    Previously `TestRestTemplate` would override the configured  `ClientHttpRequestFactory` if the Apache HTTP client library was on  classpath.    This commit fixes two issues:    1. The existing `ClientHttpRequestFactory` is overridden *only* if it is  using the Apache HTTP client variant, in order to wrap it with the  `TestRestTemplate` custom support    2. Calling `withBasicAuth` will no longer directly use the request  factory returned by the internal `RestTemplate`; if client interceptors  are configured, the request factory is wrapped with an  `InterceptingClientHttpRequestFactory`. If we don't unwrap it,  interceptors are copied/applied twice in the newly created  `TestRestTemplate` instance. For that, we need to use reflection as the  underlying request factory is not accessible directly.    Closes gh-8697
Remove default group in DynamicConfiguration API
Tweak javadocs in SprinApplicationBuilder
Continues Issue 296: TestWatchman.failed should not be invoked for AssumptionViolatedExceptions  see https://github.com/KentBeck/junit/issues/296    The solution introduced breaks with the general concept of the TestWatcher which is to call a  tracing method for any state the test reaches.    This commit introduces a new method skipped() to the TestWatcher. Quirk: The AssumptionViolatedException  is in package 'internal'.
Remove unused imports
Rename onReponse in ClusterInterceptor to onMessage (#5528)
Remove usage of classes in Junit 4
Remove WebSocket API support for optional close code (#3540)    Remove public API support for optional close code (0)
Rename onReponse in ClusterInterceptor to onMessage (#5528)
Add test for executing Calls at most once
Fix url generated from ConfigCenterConfig missed 'config.' prefix (#4411)    * fix url generated from ConfigCenterConfig missed 'config.' prefix    * remove useKeyAsParameter=false    * fix ut    * remove unused imports
Remove usage of classes in Junit 4
Files referring to the new CauseMatcher including the CauseMatcher itself
completely remove 'default.' prefix of URL key (#4222)
completely remove 'default.' prefix of URL key (#4222)
Polish modifier order    See gh-12019
Add test for executing Calls at most once
Fix relaxed binding of SI JMX config    Instead of using an expression for JMX-related properties, this commit  properly honors relaxed binding.    Closes gh-6184
