[bs-138] Add categories (secure,open) to EndpointsProperties
Polish modifier declaration ordering    Follow that Java language specification.
Skip scoped targets when determining endpoints    Update `EndpointDiscoverer` to filter out scoped target beans when  finding endpoints.    Closes gh-15182
Stop using imports from shaded dependencies    See gh-15950
Create Kafka sample topic
Make sure health endpoint is available with no contributor    This commit makes sure that the health endpoint returns a default health  status when no contributors are available. Previously, it was returning  `null` which leads to a 404 when exposed via HTTP.    Closes gh-18676
Create Kafka sample topic
Make sure health endpoint is available with no contributor    This commit makes sure that the health endpoint returns a default health  status when no contributors are available. Previously, it was returning  `null` which leads to a 404 when exposed via HTTP.    Closes gh-18676
Support binding with multiple constructors    Update `DefaultBindConstructorProvider` so that binding to objects with  multiple constructors is allowed, as long as there is only one  non-public candidate.    Closes gh-23117
[bs-138] Add categories (secure,open) to EndpointsProperties
Use streams and lambdas in spring-test where feasible  Issue: SPR-13188
Use varargs for DefaultApplicationArguments    Closes gh-15142
Throw an exception if a config file that exists cannot be parsed    Fixes gh-209 in a general way
Fixing ability of standalone server to kill abandoned sessions on timeout
Change order of loggingCodecCustomizer    It is set to 0 so that users' customizers can be positioned before and  after it.    Fixes gh-14723
Improve DefaultCookieSerializer auto-configuration    Spring Session's own configuration support (i.e.  SpringHttpSessionConfiguration) will configure the default  DefaultCookieSerializer with rememberMeRequestAttribute if  SpringSessionRememberMeServices bean has been detected in the  application context.    In contrast, Spring Boot's auto-configured DefaultCookieSerializer does  not do this which results in a different out-of-the-box experience for  users that rely on Spring Session's remember-me integration.    This commit improves Spring Session DefaultCookieSerializer  auto-configuration to match Spring Session's behavior and make the  auto-configured DefaultCookieSerializer aware of  SpringSessionRememberMeServices bean.    See gh-16513
Handle wrapper types in Env actuator    This commit modifies the actuator `EnvironmentEndpoint` to allow  primitive wrapper types to be serialized in the response data  structure.    Fixes gh-24307
Skip scoped targets when determining endpoints    Update `EndpointDiscoverer` to filter out scoped target beans when  finding endpoints.    Closes gh-15182
Auto-configuration of reactive Spring Session
Fix @ConfigurationProperties on @Bean methods without metadata caching    Due to a current limitation of Spring Framework, when bean metadata  caching is disabled, a merged bean definition may have a null  resolved factory method that would have been non-null if bean metadata  caching was enabled. Configuration property binding for @Bean methods  annotated with @ConfigurationProperties relied upon the resolved  factory method being enabled to find the @ConfigurationProperties  annotation and trigger property binding. As a result, when bean  metadata caching is disabled on the bean factory, such  @ConfigurationProperties beans would not be bound.    This commit works around the limitation by adding a fallback that  performs a reflection-based search for the factory method when the  resolved factory method on the bean definition is null. This allows  the bean's factory method and any @ConfigurationProperties annotation  on it to be found, ensuring that propoerty binding is then performed.    Fixes gh-18440
Update Johannes Edmeier author attribution    Congratulations to Johannes Edmeier on getting married!
Auto-configuration of reactive Spring Session
Skip scoped targets when determining endpoints    Update `EndpointDiscoverer` to filter out scoped target beans when  finding endpoints.    Closes gh-15182
Handle ApiVersion in CachingOperationInvoker    Prior to this commit, ApiVersion was treated as a mandatory parameter in  CachingOperationInvokerAdvisor and thus prevented the  CachingOperationInvoker to kick in. By skipping ApiVersion in the same  way we're skipping SecurityContext we can avoid this.    In order to not return the same cached response, this commit also  changes the cache handling in CachingOperationInvoker to account for  different ApiVersions being passed.    See gh-18961
Adapt to deprecation of StringUtils.isEmpty(Object)    See gh-23774
Adapt to deprecation of StringUtils.isEmpty(Object)    See gh-23774
Exclude authorization header from trace by default    Closes gh-7974
Use varargs for DefaultApplicationArguments    Closes gh-15142
Enable proxy target class for `MethodValidationPostProcessor`    Closes gh-8277
Guard against binding non-instantiable types    Update `JavaBeanBinder` so that null instances that are non-instantiable  are not bound.    Fixes gh-10131
Add Jetty SSL keystore in classpath test    Update JettyEmbeddedServletContainerFactoryTests to test loading an  SSL keystore from the classpath. Currently this is a Jetty only feature,  although if https://issues.apache.org/bugzilla/show_bug.cgi?id=56777 is  fixed we could do the same thing with Tomcat.    Closes gh-1943
Change order of loggingCodecCustomizer    It is set to 0 so that users' customizers can be positioned before and  after it.    Fixes gh-14723
Fix Invalid target for Validator error    Update `PropertiesConfigurationFactory` so that the validator is only  set when it supports the target object.    Fixes gh-8149
Fix connection timeout configuration for Netty    Update `NettyWebServerFactoryCustomizer` to deal with the fact that  Netty treats `0` and negative connection timeout values differently to  Tomcat, Undertow and Jetty.    See gh-16535
Prevent serialization exception from Env actuator    When `EnvironmentEndpoint` is building a response to return to the  web infrastructure, it creates a data structure containing all  property values from all property sources. Prior to this commit, it  was possible for the response data structure to contain property  values that were not serializable to JSON by Jackson, which would  cause an exception to be thrown by the web infrastructure. This  commit ensures the data structure is serializable to JSON by  ensuring property values are primitives or Strings, and returning  a placeholder value if a property value is of any other type.    Fixes gh-23805
Fix Flyway and Liquibase JPA 'depends-on' setup    Ensure that FlywayAutoConfiguration and LiquibaseAutoConfiguration occur  after HibernateJpaAutoConfiguration so that the DependsOnPostProcessor  condition can correctly check for a LocalContainerEntityManagerFactory  bean.    Fixes gh-3437
Add Jetty SSL keystore in classpath test    Update JettyEmbeddedServletContainerFactoryTests to test loading an  SSL keystore from the classpath. Currently this is a Jetty only feature,  although if https://issues.apache.org/bugzilla/show_bug.cgi?id=56777 is  fixed we could do the same thing with Tomcat.    Closes gh-1943
Add ApplicationContext to the EmbeddedServletContainerInitializedEvent
Polish modifier declaration ordering    Follow that Java language specification.
Update Johannes Edmeier author attribution    Congratulations to Johannes Edmeier on getting married!
Auto-configuration of reactive Spring Session
Handle wrapper types in Env actuator    This commit modifies the actuator `EnvironmentEndpoint` to allow  primitive wrapper types to be serialized in the response data  structure.    Fixes gh-24307
Add Jetty SSL keystore in classpath test    Update JettyEmbeddedServletContainerFactoryTests to test loading an  SSL keystore from the classpath. Currently this is a Jetty only feature,  although if https://issues.apache.org/bugzilla/show_bug.cgi?id=56777 is  fixed we could do the same thing with Tomcat.    Closes gh-1943
Add Redis Sentinel database support    See gh-12556
Harmonize class visibility    Closes gh-19414
Relocate configuration prefix constant    Relocate DataSourceAutoConfiguration.CONFIGURATION_PREFIX to  DataSourceProperties.PREFIX.
Polish modifier declaration ordering    Follow that Java language specification.
Allow Batch datbase initializer to be disabled
Take care registering DataSourceInitializer    The DataSourceInitializer is instantiated early by the  DataSourceInitializerPostProcessor, so it has to live in  isolation (in its own @Configuration) to prevent early  instantiation of the DataSourceAutoConfiguration.    Fixes gh-1166
Change order of loggingCodecCustomizer    It is set to 0 so that users' customizers can be positioned before and  after it.    Fixes gh-14723
Add Redis Sentinel database support    See gh-12556
Disable DevTools property defaults in production    Update `DevToolsPropertyDefaultsPostProcessor` so that property defaults  are only added at development time. Properties are now added only when  `Restarter` is initialize or remote devtools is enabled.    Fixes gh-7014
Add database property to RedisProperties    Add database property to RedisProperties and use it in  RedisAutoConfiguration.    Fixes gh-1379
Use varargs for DefaultApplicationArguments    Closes gh-15142
Take care registering DataSourceInitializer    The DataSourceInitializer is instantiated early by the  DataSourceInitializerPostProcessor, so it has to live in  isolation (in its own @Configuration) to prevent early  instantiation of the DataSourceAutoConfiguration.    Fixes gh-1166
Drop RepackageTask.getDependencies()    Drop `RepackageTask.getDependencies` from the gradle plugin in favor of  exposing `getLibraries()` and using the callback.  Drop getDependencies
Auto-configure cors on WelcomePageHandlerMapping    Update `WebMvcAutoConfiguration` to automatically apply cors  configuration to the `WelcomePageHandlerMapping`.    Fixes gh-21048
Guard against binding non-instantiable types    Update `JavaBeanBinder` so that null instances that are non-instantiable  are not bound.    Fixes gh-10131
Auto-configuration of reactive Spring Session
Resolve placeholders in @ConfigurationProperties prefix
Support binding with multiple constructors    Update `DefaultBindConstructorProvider` so that binding to objects with  multiple constructors is allowed, as long as there is only one  non-public candidate.    Closes gh-23117
Adapt to deprecation of StringUtils.isEmpty(Object)    See gh-23774
Add Duration support in /configprops endpoint    See gh-16539
Polish modifier declaration ordering    Follow that Java language specification.
Resolve placeholders in @ConfigurationProperties prefix
Fix Invalid target for Validator error    Update `PropertiesConfigurationFactory` so that the validator is only  set when it supports the target object.    Fixes gh-8149
Fix ordering of JSON property source relative to servlet sources    Fixes gh-17652
Add boolean flag spring.rabbit.listener.useTransactionManager    If set *and* there is a transaction manager in the context, then the  listener container created by Spring Boot will use the transaction  manager to execute the listeners.    Fixes gh-3432 (by virtue of not requiring a JtaTransactionManager any  more).
Add mediaTypes (extension to media type mapping) in MVC resources    Allows users to configure 'allowed' file extensions for controller  mappings, so that browsers will not switch to downloading 'f.txt'  (part of the recent RFD attack fixes in Spring MVC).    See gh-4220
Fix Invalid target for Validator error    Update `PropertiesConfigurationFactory` so that the validator is only  set when it supports the target object.    Fixes gh-8149
Guard against binding non-instantiable types    Update `JavaBeanBinder` so that null instances that are non-instantiable  are not bound.    Fixes gh-10131
Improve DefaultCookieSerializer auto-configuration    Spring Session's own configuration support (i.e.  SpringHttpSessionConfiguration) will configure the default  DefaultCookieSerializer with rememberMeRequestAttribute if  SpringSessionRememberMeServices bean has been detected in the  application context.    In contrast, Spring Boot's auto-configured DefaultCookieSerializer does  not do this which results in a different out-of-the-box experience for  users that rely on Spring Session's remember-me integration.    This commit improves Spring Session DefaultCookieSerializer  auto-configuration to match Spring Session's behavior and make the  auto-configured DefaultCookieSerializer aware of  SpringSessionRememberMeServices bean.    See gh-16513
Remove unused static methods in tests    Closes gh-15084
Create Kafka sample topic
Use varargs for DefaultApplicationArguments    Closes gh-15142
Polish 'Simplify code'    See gh-18342
Delay property source initialization till LoggingSystem is initialized    Previously, the initialization of StandardServletEnvironment's  property sources in SpringBootServletInitializer led to debug logging  calls being made before the LoggingSystem had been initialized. As a  result, the system's default configuration was used and, in the case  of Logback at least, the debug logging was output to System.out  in a war deployment.    This commit updates SpringBootServletInitializer to delay the  initialization of StandardServletEnvironment's property sources until  after the LoggingSystem has been initialized, but still in time for  active profiles to be configured via servlet context parameters  (see gh-9972).    Closes gh-13736
Suppress debug log output during Logback initialization    Closes gh-12071
Update Johannes Edmeier author attribution    Congratulations to Johannes Edmeier on getting married!
Resolve placeholders in @ConfigurationProperties prefix
Add Redis Sentinel database support    See gh-12556
Fix relaxed binding of camel-case properties    Extended RelaxedDataBinder to include a case insensitive version of  SEPARATED_TO_CAMELCASE. This allow properties of the form TEST_THE_VALUE  to to bound to a @ConfigurationProperties class with a prefix of 'test'  and a field of `theValue`.    Fixes gh-2304
Resolve placeholders in @ConfigurationProperties prefix
Drop RepackageTask.getDependencies()    Drop `RepackageTask.getDependencies` from the gradle plugin in favor of  exposing `getLibraries()` and using the callback.  Drop getDependencies
Update copyright year for changed files
Delay property source initialization till LoggingSystem is initialized    Previously, the initialization of StandardServletEnvironment's  property sources in SpringBootServletInitializer led to debug logging  calls being made before the LoggingSystem had been initialized. As a  result, the system's default configuration was used and, in the case  of Logback at least, the debug logging was output to System.out  in a war deployment.    This commit updates SpringBootServletInitializer to delay the  initialization of StandardServletEnvironment's property sources until  after the LoggingSystem has been initialized, but still in time for  active profiles to be configured via servlet context parameters  (see gh-9972).    Closes gh-13736
Disable DevTools property defaults in production    Update `DevToolsPropertyDefaultsPostProcessor` so that property defaults  are only added at development time. Properties are now added only when  `Restarter` is initialize or remote devtools is enabled.    Fixes gh-7014
Guard against binding non-instantiable types    Update `JavaBeanBinder` so that null instances that are non-instantiable  are not bound.    Fixes gh-10131
Skip scoped targets when determining endpoints    Update `EndpointDiscoverer` to filter out scoped target beans when  finding endpoints.    Closes gh-15182
Support case insensitive value for Cassandra's SchemaAction    Closes gh-8903
Polish 'Avoid string concatenation inside StringBuilder append()'    Closes gh-15589
Write classpath index file from Gradle plugin    Closes gh-19847
Add Jetty SSL keystore in classpath test    Update JettyEmbeddedServletContainerFactoryTests to test loading an  SSL keystore from the classpath. Currently this is a Jetty only feature,  although if https://issues.apache.org/bugzilla/show_bug.cgi?id=56777 is  fixed we could do the same thing with Tomcat.    Closes gh-1943
Polish modifier declaration ordering    Follow that Java language specification.
Disable DevTools property defaults in production    Update `DevToolsPropertyDefaultsPostProcessor` so that property defaults  are only added at development time. Properties are now added only when  `Restarter` is initialize or remote devtools is enabled.    Fixes gh-7014
Polish modifier declaration ordering    Follow that Java language specification.
Remove META-INF/INDEX.LIST when repackaging a jar file    META-INF/INDEX.LIST files are pointless in an executable jar and  moving application classes from the root of the jar to  BOOT-INF/classes breaks the index, resulting in an  InvalidJarIndexException being thrown.    This commit updates the Repackager to automatically remove a  META-INF/INDEX.LIST file from a jar file that is being repackaged.    Closes gh-6601
Add methods to BootJar for adding content to BOOT-INF    Closes gh-13000
Auto-configuration of reactive Spring Session
Add methods to BootJar for adding content to BOOT-INF    Closes gh-13000
Add methods to BootJar for adding content to BOOT-INF    Closes gh-13000
Add local-datacenter property for Cassandra    The Cassandra v4 driver does not longer have automatic local DC inference  from contact points. As a result, the 'local-datacenter' property must be  set with the default load balancing policy and the contact points must  be of that data center.    This commit adds a new property for the local datacenter so that it can  be specified without the use of a customizer.    Closes gh-19779
Update copyright year for changed files
Check for null before trying to use ApplicationContext    Fixes gh-145
Check for null before trying to use ApplicationContext    Fixes gh-145
Polish 'Always fail fast when SSL is enabled without a key store'    Closes gh-15709
Stop using imports from shaded dependencies    See gh-15950
Use MongoClient consistently    Closes gh-11431
Auto-configuration of reactive Spring Session
Auto-configuration of reactive Spring Session
Polish 'Avoid string concatenation inside StringBuilder append()'    Closes gh-15589
Match ResourceServerCondition if JWK config present    Closes gh-8350
Fix session timeout default value    Update DEFAULT_SESSION_TIMEOUT to use TimeUnit.MINUTES.toSeconds(30)  rather than TimeUnit.SECONDS.toMinutes(30) which would always return  0.    See gh-2084  (cherry picked from commit b33bbd56)
Auto-configure cors on WelcomePageHandlerMapping    Update `WebMvcAutoConfiguration` to automatically apply cors  configuration to the `WelcomePageHandlerMapping`.    Fixes gh-21048
Polish 'Add Spring Session JDBC database initializer'    Closes gh-5879
Polish 'Handle null RSocketServer address when setting port property'    See gh-23084
Fix session timeout default value    Update DEFAULT_SESSION_TIMEOUT to use TimeUnit.MINUTES.toSeconds(30)  rather than TimeUnit.SECONDS.toMinutes(30) which would always return  0.    See gh-2084  (cherry picked from commit b33bbd56)
Adapt to deprecation of StringUtils.isEmpty(Object)    See gh-23774
Update copyright year of changed files
Polish 'Handle null RSocketServer address when setting port property'    See gh-23084
Move createPartitionValues method to a utility class  This method is needed to create partition values for statistics
Fix break bug in for/foreach loops.
minor refactor: allow improved future @Builder extensibility
Internal: made it possible to disable the main transport handler in TransportShardSingleOperationAction  TransportShardSingleOperationAction is currently subclassed by different transport actions. Some of them are internal only, meaning that their execution will take place only in the same node where their parent execution took place. That means that their main transport handler doesn't need to be registered, the only transport handler that's needed is the shard level one.  Added `isSubAction` method (defaults to false) to the parent class that tells whether the action is a main one or a subaction, used to decide whether we need to register the main transport handler.  Closes #7285
Use SQL types in error messages
More license headers.  Also put UniqueConstraintHaIT to its previous state.
o Added IndexHits#currentScore which exposes the most recently fetched   IndexHits item's score from the search, if any. The lucene-index supports this. o Moved the "index" shell app to the shell component where the other kernel apps are,   it was misplaced in lucene-index. o Added QueryContext#topDocs(int) so that you can specify to retrieve only the top N   hits from a search, which may improve performance - even if when retrieving all hits   the iteration all the way down to lucene is done lazily. o Performance improvements regarding the iterator stack which makes up the return IndexHits   instances from query/get methods. Previously there could be 5-7 nested iterators.   Now there are only 3-4. o Added configuration parameter "similarity" which controls the Lucene   IndexWriter#setSimilarity(Similarity) for an index. It points out class names.
return security group status per zone
Fixed some grammatical mistakes in the comments in junit.framework (#1184)    Fixed JavaDoc in junit.framework to use periods
Cleaning up interceptors in oauth and oidc
More code review
Fix a bug where AbstractConstant.compareTo() returns 0 for different constants  Related issue: #2354  Motivation:  AbstractConstant.compareTo() can return 0 even if the specified constant object is not the same instance with 'this'.  Modifications:  - Compare the identityHashCode of constant first. If that fails,   allocate a small direct buffer and use its memory address as a unique   value.  If the platform does not provide a way to get the memory   address of a direct buffer, use a thread-local random value. - Signal cannot extend AbstractConstant. Use delegation.  Result:  It is practically impossible for AbstractConstant.compareTo() to return 0 for different constant objects.
fix shrunken index source name metadata usage
Synchronized between 4.1 and master (part 3)  Motivation:  4 and 5 were diverged long time ago and we recently reverted some of the early commits in master.  We must make sure 4.1 and master are not very different now.  Modification:  Fix found differences  Result:  4.1 and master got closer.
Polishing  Issue: SPR-11422
Fix problems for DSL nodes in the default package.
Move memory pool classes to SPI
Removed need for state after on load indexed, and new bytecodes.
Validation of the reducer factories is now called from within the AggregatorFactories
add checks for obviously bogus values read patch by jbellis; reviewed by junrao for CASSANDRA-466
Replace calls to deprecated Class#newInstance  Part of #435 and Bugzilla Id: 62972
Load the ContextStoreProfileTest test with the same classloader as the ContextStore classes.
Trace constant roots WIP.
Supported message on skip (transformer returns NULL)
SPR-8234 Switch to strongly typed custom argument resolvers property
don't discard original exception (suspiciously/possibly eclipse-generated)
Remove empty PartitionedLookupSourceFactory.close() method
Use correct primary term for replicating NOOPs (#25128)  NOOPs should be, same as for indexing operations, written on the replica using the original operation term instead of the current term of the replica.
Move name from HotSpotNmethod to InstalledCode to have a name again for truffle nmethods.
Fixed compatibility problems against Java < 7
make empty strings always return the MINIMUM token, and DecoratedKeys containing the MINIMUM token always be considered empty.  This is something we probably should be doing anyway for consistency.  (It was already true for OPP, but not COPP or RP.)  No further special casing should be necessary because we have already abstracted out code that needs to work across multiple partitioners to use IPartitioner.isEmpty, including getRangeSlice.  patch by jbellis; reviewed by Stu Hood for CASSANDRA-745
PrebuiltOcamlLibrary: Remove unused SourcePathResolver  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: b4b6001
Rename. Might collapse some of these packages at a later point.
Add super.finalize to finalizers missing those calls.
Preserve sort order of resources  Reviewed By: marcinkosiba  fbshipit-source-id: 4af0bf9
Add the encoder/decoder getter methods to HttpClientCodec  Motivation:  There's no way for a user to get the encoder and the decoder of an HttpClientCodec.  The lack of such getter methods makes it impossible to remove the codec handlers from the pipeline correctly.  For example, a user could add more than one HttpClientCodec to the pipeline, and then the user cannot easily decide which encoder and decoder to remove.  Modifications:  - Add encoder() and decoder() method to HttpClientCodec which returns   HttpRequestEncoder and HttpResponseDecoder respectively - Also made the same changes to HttpServerCodec  Result:  A user can distinguish the handlers added by multiple HttpClientCodecs easily.
Truffle-DSL: Added a hack to get around eclipse bug 300408. (https://bugs.eclipse.org/bugs/show_bug.cgi?id=300408)
Move SplitSource to split package
Fix break bug in for/foreach loops.
fix for: https://issues.apache.org/jira/browse/AMQ-3742 with supplied unit test patch applied.
Fail store initialisation in case when header record can't be read  Throw StoreNotFoundException in case if we can't read first page of a store file to get header information out of it.
JsBundleGenrule: Allow to disable resource forwarding  Summary: Adds the ability to skip resource forwarding to `JsBundleGenrule`.  This is useful when the output of the rule is added to an apk or ipa in addition to the underlying js_bundle.  Test Plan: new unit tests  Reviewed By: dinhviethoa  fbshipit-source-id: 1e58bfb
Removed @version tag in javadoc as the javadoc plugin would fail on JDK1.6 sometimes
Move TestBuildRuleCreationContextFactory in test to correspond to source structure  Summary: BuildRuleCreationContext is under src.com.facebook.core.model.targetgraph This moves the test file to correspond to that  Reviewed By: styurin  fbshipit-source-id: d393bf28d3
Renamed Shape to Shape2D
Clean up after rebase
TIKA-1412 - Add UnitTest
Fix https://bz.apache.org/bugzilla/show_bug.cgi?id=58544,58541 Use Integer.toString(int) instead of Integer.valueOf(int).toString() when only a string representation of a primitive is needed. Based on a patch provided by Anthony Whitford.
bug 7433: In case of multiple zones deleting a tempate from a zone doesn't prevent a user from selecting it to deploy the VM in the same zone. It was still visible in the listTemplates. Made change to check for template_zone_ref and template_host_ref removed and destroyed columns. During deployVM disallow a vm to be deployed from a template that has been removed in the zone.
Added Texture#toString.  Sometimes it's the little things.
No need to clean up deleted phis.
Expose GlobalConstant in the NodeFactoryFacade
CustomJarOutputStream: Hash empty files  Summary: A zero-length file is still a file. This was causing some issues with dependency file rule keys when an AP was opening a zero-length resource file.  Test Plan: Updated unit tests  Reviewed By: asp2insp  fbshipit-source-id: 65a30c7
better exception when a field is missing
Rename WebTestClientConnectorTests to match class name
Fix the mocks in a couple of tests.  r5681
* Simpler sentences * More cross references * Fixed incorrect explanation related with attaching a pipeline to a channel
Use the Option annotation to specify CLI options for the sampler.
Use StringJoiner where possible to simplify String joining
Clean up lamda refs with method refs instead. Remove abstract from reg service UI info
Add support for ValueProvider in JdbcIO.DataSourceConfiguration methods  Allows JdbcIO transforms to be fully templatized by providing ValueProvider support for the following methods: - create - withConnectionProperties - withPassword - withUsername
Exists API can send response body, closes #2072.
More code review
Remove support default settings  Support for default settings has been removed in core and so some methods were refactored. This commit responds to this change in core.  Original commit: elastic/x-pack-elasticsearch@b22c612de46e48ac4ca1560bb69cd3ce0b0e60c4
Work around VMware problem about detaching volume that has snapshot been linked with it
avoid unnecessary loading of regex classes when assertions are disabled
Remove the annotation output of the abi targets from the source folders  Summary: This avoids adding duplicate classes to IntelliJ.  Reviewed By: asp2insp  fbshipit-source-id: b4b19109ee
Remove unused imports  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
minor refactor: allow improved future @Builder extensibility
don't discard original exception (suspiciously/possibly eclipse-generated)
Rename DiscoveryNodes#smallestNonClientNodeVersion to getSmallestNonClientNodeVersion
deprecated scheduling support for JDK 1.3 Timer
Notification about TraceInitializationFlag
More code review
Provide 'with implementationType' overloads  Provided overloaded versions of `forField` and `forMethodParameter` that accept a `ResolvableType` implementation type (as opposed to a Class).  Primarily added to allow resolution against implementation types that have been created programmatically using `forTypeWithGenerics`.  Issue: SPR-11218
updated attribute encoder relationship
Prepend -Xlinker to linker flags in project generation.  Summary: Buck prepends -Xlinker to linker_flags during building. This makes project generation have the same behaviour.  Test Plan: CI
Fix Like/RLike signature  Original commit: elastic/x-pack-elasticsearch@8ac7c17b39f623f3f3246cc46cb5676412e046ad
cxx: add parse-time deps for shared library interface factories  Test Plan: CI  Reviewed By: shivanker  fbshipit-source-id: 2680102
add progress to indices status API
Add tests for serialization of BigQueryIO.TableRowInfoCoder
PushNodesThroughPi: add metric for pushed nodes
Filters and Sorters work in the presence of suite() methods
Allow Checkstyle's unused imports test to be used with the o.a.el package Fix Eclipse warnings
cxx: add `version_universe` parameter to C/C++ binary rules  Summary: This allows `cxx_binary`/`cxx_test` rules to select the version universe they're in.  Test Plan: Added unittest.  Reviewed By: Coneko  fbshipit-source-id: 39d1517
DateTimeFormat annotation supports use as a meta-annotation as well
adding missing finals
Propagate all errors to createIsolate
Bug 51876 - Functionality to search in Samplers TreeView Enable searching AbstractJDBCTestElement subclasses
Use offset finding eol avoid repeated scaning.  Motivation:  A large frame will be componsed by many packages. Every time the package arrived, findEndOfLine will be called from the start of the buffer. It will cause the complexity of reading frame equal to  O(n^2). This can be eliminated by using a offset to mark the last scan position, when new package arrived, just find the delimter from the mark. The complexity will be O(n).  Modification:  Add a offset to mark the last scan position.  Result:  Better performance for read large frame.
Use Constants.SESSION_PARAMETER_NAME instead "jsessionid".
Add destination specifier attribute to apple_test.  Summary: This adds support for destination specifiers when running `apple_test`.  Test Plan: CI
instead of '==', use equals() to compare two strings in cloud-server
Reformatted to JMeter conventions. Minor JavaDoc updates.
Removed superfluous @Override annotations.
Allow an HttpClient to have a proxy be set
Restored log lines to TRACE for notification post alias creation and open/close index Introduced specific log level for those in OpenCloseIndexTests#testCloseOpenAliasMultipleIndices
Fix FakeProjectFilesystem.getFilesUnderPath()  Summary: `FakeProjectFilesystem.getFilesUnderPath()` is broken in a bunch of ways currently. It had no tests, so it sadly regressed.  1) `ProjectFilesystem.walkRelativeFileTree()` is polymorphic, but the most general version of the API which takes an `EnumSet<FileVisitOption>` was private, so `FakeProjectFilesystem` could not override it.  2) `ProjectFilesystem.getFilesUnderPath()` incorrectly converted the project-relative path to an absolute path before passing it to `ProjectFilesystem.walkRelativeFileTree()`. That method requires a project-relative path.  3) `FakeProjectFilesystem.getFilesUnderPath()` was implemented to always return the empty set.  Test Plan: New test added. Confirmed it failed until I fixed all above issues.
Added more convenience methods to bootstraps
removed exception printing in tests
Migrate <= operator for arrays to new framework
Introduce ProjectFilesystemDelegate.getDetailsForLogging()  Summary: This supersedes what was done in D5620740 to add more details in the Chrome trace about the `ProjectFilesystemDelegate` that was used. In particular, I worry about misspelling `eden.disable_sha1_fast_path` and it not having the desired effect, so this is a simple way to verify it.  Test Plan: Do a Buck build in Eden with and without `--config eden.disable_sha1_fast_path=true` and run the following after each run and verify it has the expected output:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  Reviewed By: ttsugriy  fbshipit-source-id: 6b54cca
Move memory pool classes to SPI
Set instance variables to null so that we don't OOM exceptions when using m2
Adds a start() method to custom source Reader.  This is a backwards incompatible change. Current Readers can be fixed by adding a start() method and calling advance() once in that method, i.e.,  @Override public boolean start() throws IOException {   return advance(); }  Code that uses readers should be updated to following form:  for (boolean available = reader.start(); available; available = reader.advance()) {  T value = reader.getCurrent();  ... }  [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=87570381
Fix (some) mocking issues due to upstream changes.  Two suites marked as awaitsFix while being worked on.  Original commit: elastic/x-pack-elasticsearch@06eb352b1e651bc5dc0f56703ce55e75969c1ae9
[java] Moving marionette specific test to the corresponding class
Make Hive view error message a constant
CAMEL-9210 - accessKey and secretKey options for CloudWatch is now optional  accessKey and secretKey options for CloudWatch is now optional and AWS Java SDK handles those keys unless they are not provided in URI.
javadoc, with override and inheritdoc flags
HIVE-9871: Print spark job id in history file [spark branch] (Chinna via Xuefu)
Fixed compatibility problems against Java < 7
Access java options through toolchain in AndroidPrebuiltAarDescription  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: e3074c1
Close and make noise
Rewrite wrong use of FunctionDeclaration to FunctionDefinition
Make PrecompiledHeaderData implement AddsToRuleKey  Summary: This allows us to remove the custom appendToRuleKey in CxxPreprocessAndCompile and will allow us to correctly derive its deps automatically.  Reviewed By: ttsugriy  fbshipit-source-id: c0bacf2
Renames class to match pattern used in Tiles
Make TasteOptionParser static
break down of strategy to composable parts
CAMEL-1662: Added option to show the exception message for the log component.
move test to a single node test
Increase visibility of some Metrics methods  Also revise the Javadoc on MetricsContainers.
[FLINK-5327] Remove IOException from StateObject::getStateSize  This closes #2993
Resync fails to notify on unavaiable exceptions (#33615)  We fail to notify the resync listener if the resync replication hits a shard unavailable exception. Moreover, we no longer need to swallow these unavailable exceptions.  Relates #28571 Closes #33613
[streaming] Fixed generics and added SuppressWarnings
Allow types to customize the name displayed in DESCRIBE
Modify the defaults for source file multi-fetch.  Summary: For now we're making preload-materialization the default strategy so as to clearly put aside the time for materializing files. Once we launch stampede into production, we can switch to on-demand materialization if it performs better.  Test Plan: Ran the build slave locally and experimented with a lot of different values for these parameters. Materializing during preload with a max buffer size of 40 performs decently in a large build (materializing more than 28k files in about 12-13s -- which we can hide by doing in parallel with action graph creation). On-demand materialization depends on a lot of variables, like the average number of files requested by the rules, or the highest number of files requested by a single rule.  Reviewed By: alisdair04  fbshipit-source-id: 6f75328
Fix for https://issues.apache.org/activemq/browse/AMQ-1449
Remove empty PartitionedLookupSourceFactory.close() method
BasicAuthorizationInterceptor belongs to http.client.support  Issue: SPR-14412
External UUID control support for AutoscaleVmProfile and AutoscaleVmGroup
Improve comments and javadoc
Fixes due to changes in master branch.
Issue #4014: Split and Organize Checkstyle inputs by Test for MethodCount
Moving a test for getTitle to a more appropriate class
Pass BuildContext to getPostBuildSteps  Summary: And use it in AppleDsym, rather than a SourcePathResolver from the constructor  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 69e9ea1
Put nonoss under Spring framework
AnnotationAwareOrderComparator is able to sort Class objects as well  Issue: SPR-10152
Apply all permissions scope to BigqueryClient
Add and correct javadocs
Pass BuildContext to getPostBuildSteps  Summary: And use it in AppleDsym, rather than a SourcePathResolver from the constructor  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 69e9ea1
Use a Set to multi-fetch source-file hashcodes.  Test Plan: CI  Reviewed By: ruibm  fbshipit-source-id: d12a35e
Suppress warnings and remove unused imports
Fail store initialisation in case when header record can't be read  Throw StoreNotFoundException in case if we can't read first page of a store file to get header information out of it.
Fix index query with embedded list key  Resolves: #5830
Use supplier to pass rules to exclude around AndroidBinary  Summary: This will allow to pass `rulesToExclude` to `AndroidBinaryGraphEnhancer` from `AndroidInstrumentationApkDescription` as a supplier which will be used in the following changes to avoid the instantiation the whole set.  Reviewed By: jtorkkola  shipit-source-id: 6a39074075
removed unused ResolvedJavaType.newArray(...)
CAMEL-13313: Add support for generating type converter loader source code to be able to load component type converters in a faster way.
api: remove some "experimental" javadoc  https://codereview.appspot.com/8107043/
Analysis : Fix no response from Analyze API without specified index  Fix error handling in TransportSingleShardAction without shardIt  Closes #15148
turned formatter implementations non-final
Internal testing change  ----Release Notes---- ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=97257395
[added] Stage and Group.unfocusAll method. You can call this on ApplicationListener.pause()/resume() to take away the focus from all focused Actors. You also have to make sure that any actor that depends on being focused, e.g. waits for a touch up event, resets its state.
Some pr comments
Fail store initialisation in case when header record can't be read  Throw StoreNotFoundException in case if we can't read first page of a store file to get header information out of it.
more test cases for attribute filters
Disable new RCFile writer by default
Removed unused imports
Add better validation error message and a dedicated test
Allow types to customize the name displayed in DESCRIBE
[BEAM-6201] Move fromJsonString() method to SyntheticOptions class
Removed matched_filters in favor for matched_queries.  Closes #3644
Use (Concurrent)Map.computeIfAbsent for lazy nested collection creation
Exposing HttpServletRequest/Response in ServletServerHttpRequest/Response
Restore the required default ciphers after the removal of the system property
Apply all permissions scope to BigqueryClient
Fixed test on windows
CAMEL-9014: Option to turn on extended JMX statistics for EIPs to track fine grained utilization statistics such as which and how often they send to dynamic endpoints.
Rename FIXED_RANDOM_DISTRIBUTION to FIXED_ARBITRARY_DISTRIBUTION
Patch by Luca Molino to fix issue 433
Use Splitter instead of String.split, in InternetDomainName.  RELNOTES=n/a  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=193087177
Removing extra empty lines
[hotfix] [runtime] Minor code cleanups and improved comments.    - Clarify the purposes of AllocationID versus SlotRequestId.   - Remove an unnecessary method indirection
Remove @GwtCompatible annotations from classes in the hash package, which have no corresponding .gwt.xml file.  Fixes #2983  RELNOTES=n/a  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=174196722
Make rage integration tests more reliable  Summary: The `testUpload` method was occasionally failing due to there not being any healthy servers to upload to. This was caused by the `/status.php` check returning 404 instead of a 200. This is because a Handler needs to signal it handled a request by setting the `handled` property to true, which the AbstractHandler implementations in tests were not doing. If the test "won" the race with the first health check from the SLB it would pass, otherwise it would fail.  Test Plan: re-run `buck test test/com/facebook/buck/rage` 20x on my machine. Before diff it would fail ~50% of the time, afterwards it was successful 100% of the time.  Reviewed By: ruibm  fbshipit-source-id: e7010e4
Allow to read transaction metadata from KernelTransaction.  Add method that will allow to read transaction metadata from KernelTransaction to avoid useless casting to KernelTransactionImplementation.
Ensure we only call ReferenceCountUtil.safeRelease(...) in finalize() if the refCnt() > 0  Motivation:  We need to ensure we only call ReferenceCountUtil.safeRelease(...) in finalize() if the refCnt() > 0 as otherwise we will log a message about IllegalReferenceCountException.  Modification:  Check for a refCnt() > 0 before try to release  Result:  No more IllegalReferenceCountException produced when run finalize() on OpenSsl* objects that where explicit released before.
Reduced debug output
fix heisenbug in RecoveryManager2Test where a compaction could add back a new sstable to the "cleared" ColumnFamilyStore patch by jbellis; reviewed by junrao for CASSANDRA-463
CompilerParameters.Builder.setStandardPaths -> setScratchPaths  Summary: New name makes it clearer that these are not for recorded outputs.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: bee5a3b
Introduce ProjectFilesystemDelegate.getDetailsForLogging()  Summary: This supersedes what was done in D5620740 to add more details in the Chrome trace about the `ProjectFilesystemDelegate` that was used. In particular, I worry about misspelling `eden.disable_sha1_fast_path` and it not having the desired effect, so this is a simple way to verify it.  Test Plan: Do a Buck build in Eden with and without `--config eden.disable_sha1_fast_path=true` and run the following after each run and verify it has the expected output:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  Reviewed By: ttsugriy  fbshipit-source-id: 6b54cca
move test to a single node test
[#2428] Proper fix of incorrect port range check  Motivation:  In the Internet Protocol, the valid port number range is from 1 to 65535 (inclusive on the both side.)  However, SocksCmdRequest and SocksCmdResponse refuses to construct itself when the port number 65535 is specified. Beside this it excepts 0 as port number which should not allowed.      Modification:  * Not raise an exception when the specified port number is 65535. * Raise an exception when the specified port number is 0  Result:  Fixes #2428
Use (Concurrent)Map.computeIfAbsent for lazy nested collection creation
Added Texture#toString.  Sometimes it's the little things.
Remove Phi nodes whithout any input
Consider wildcard type without bounds as eligible for fallback match too  Issue: SPR-11250
Updated OProfiler. Added getContext API
add TimeValue based getter
rename Table.doGC to forceCleanup.  patch by Eric Evans; reviewed by jbellis for CASSANDRA-211
SubProtocolWebSocketHandler checks if session is open  Issue: SPR-12812
WW-1488 Update license headers for Struts 2 source - cleanup.
Add java-doc for implemented methods of io.netty.util.concurrent.Future#cancel(boolean mayInterruptIfRunning)  Motivation:  The methods implement io.netty.util.concurrent.Future#cancel(boolean mayInterruptIfRunning) which actually ignored the param mayInterruptIfRunning.We need to add comments for the `mayInterruptIfRunning` param.  Modifications:  Add comments for the `mayInterruptIfRunning` param.  Result:  People who call the `cancel` method will be more clear about the effect of `mayInterruptIfRunning` param.
Return proper OVertex/OEdge on getProperty()
Bulk API: Rename `index` to `_index`, `type` to `_type` and `id` to `_id`, closes #421.
Convert ProvisioningProfileStore to an immutable  Summary: Reducing boilerplate  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: 3396655
move render search template methods to cluster admin client  In #13971, the RenderSearchTemplateAction was made a cluster level action but the client methods were not moved from the IndicesAdminClient. This is an inconsistency and this change cleans up the inconsistency so that the client methods are now part of the ClusterAdminClient since the action is now considered a cluster level action.
Package refactor for OHttpGraphRespons
bug 6832: returning the missing api value for destroyed volumes status 6832: resolved fixed
Fixed test on slow servers
Layout, added setFillParent(). Much easier to have a widget fill the screen, as is needed for almost any Table-based layout. Skin, added newTintedPatch/Region convenience methods. Slider, no longer fires listener when value is changed programatically. Table, add(String) convenience method to add a label. Window, fixed title bar when modal.
TIKA-1412 - Add UnitTest
Move ParseBuckProfilerReportEvent to an appropriate package.  Summary: Otherwise an attempt to add a dependency on it leads to cyclic deps.  Reviewed By: jtorkkola  fbshipit-source-id: a4c9665
Pass Elemets to Types constructor now that circularity is eliminated  Summary: Now that all `TreeBackedElement` creation happens in a separate class, there's no longer a circular dependency between `TreeBackedElements` and `TreeBackedTypes`. Taking advantage of that for a slight simplification.  Test Plan: CI  Reviewed By: asp2insp  fbshipit-source-id: 98915d9
Allow to read transaction metadata from KernelTransaction.  Add method that will allow to read transaction metadata from KernelTransaction to avoid useless casting to KernelTransactionImplementation.
rename default compiler config to basic to match configuration name
Fixes to LexerATNSimulator.closure, fixes to non-greedy positive closure
Updated gwt-backend emulation with Joint user data capability.
Remove Statement from ResourceGroupSelector.match()
Fixed lifecycle handling during slave switch. No longer causes deadlock with concurrent shutdown of database. Added predicate to wait for all instances to be joined when using arbiters  Conflicts:     community/kernel/src/main/java/org/neo4j/kernel/lifecycle/LifeSupport.java     enterprise/cluster/src/main/java/org/neo4j/cluster/MultiPaxosServerFactory.java     enterprise/ha/src/test/java/org/neo4j/ha/correctness/ClusterInstance.java     enterprise/ha/src/test/java/org/neo4j/test/ha/ClusterManager.java
Preserve headers in QuickfixjProducer.process()
Remove empty PartitionedLookupSourceFactory.close() method
JavaDoc for the logging package
Revert "Consistent naming style for enum"  This reverts commit 4feafc4a5226c6307f5a9b36665d8fe8d8a05072.
Update ImageInfo API + JavaDoc
Overloaded acknowledge method with StompHeaders  Issue: SPR-16519
bug 7970: some more improvements to the storage maintenance with 2 pools status 7970: resolved fixed
Added missing license headers
added bean name assertions
Add package-name option for spring init    For some reason, we forgot to add an attribute to customize the package  name when using spring init. This is now the case.    Closes gh-3716
HIVE-17954 : Implement pool, user, group and trigger to pool management API's (Harish Jaiprakash, reviewed by Sergey Shelukhin) ADDENDUM
api.object: add some missing javadoc
Adding license headers to files
bug 11051: Listing Secondary Storage - also show the total and used storage. Listing Storage pools show the realtime storage stats and correctly populate the allocated storage.
Pass BuildContext to getPostBuildSteps  Summary: And use it in AppleDsym, rather than a SourcePathResolver from the constructor  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 69e9ea1
[streaming] generateSequence source added
Remove NAME field from json field decoders
Expose GlobalConstant in the NodeFactoryFacade
PushNodesThroughPi: add metric for pushed nodes
Clean up after rebase
Updated for changes to messages.
Inner hits fail to propagate doc-value format. (#36310)  If you pass a doc-value format to inner hits, it gets ignored.
Use SQL types in error messages
non-fork optimization.
Updates NativeLabelScanStore on moved classes
Add default implementation to reduce duplication
Unignoring tests passing in updated HtmlUnit driver
updated mocks to Servlet 2.5 and JSP 2.1 API level
Fixed bug on query abstract classes
back pressure support
Make FluentIterabl#of @GoogleInternal ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=28454584
No Content-Disposition if HTML in the request mapping  Issue: SPR-13629
[#5507] SingleThreadEventExecutor should reject call invoke*() from within the EventLoop.  Motivation:  ExecutorService.invoke*(...) methods may block by API definition. This can lead to deadlocks if called from inside the EventLoop in SingleThreadEventExecutor as it only has one Thread that does all the work.  Modifications:  Throw a RejectedExectionException if someone tries to call SingleThreadEventExecutor.invoke*(...) while in the EventLoop.  Result:  No more deadlock possible.
https://issues.apache.org/jira/browse/AMQ-1706 - fix up doc comment
Remove calls to simple getters within classes. #1555  Fixes `CallToSimpleGetterInClass` inspection violations.  Description: >Reports any calls to a simple property getter from within the property's class. A simple property getter is defined as one which simply returns the value of a field, and does no other calculation. Such simple getter calls may be safely inlined, at a small performance improvement. Some coding standards also suggest against the use of simple getters for code clarity reasons.
Updated OProfiler. Added getContext API
KAFKA-4364: Remove secrets from DEBUG logging  leverage fix from KAFKA-2690 to remove secrets from task logging  Author: rnpridgeon <ryan.n.pridgeon@gmail.com>  Reviewers: Ewen Cheslack-Postava <ewen@confluent.io>  Closes #2115 from rnpridgeon/KAFKA-4364
Issue 11510: Throw Exception for missing settings file  An Exception will be thrown when the givven YAML-file doesn't exist.
Add more _selector.close()  Also add more log.
There was no need to introduce a thread local to avoid event recursion
Patch by Luca Molino to fix issue 345
Minor reformatting to fit project style
Removed unused imports
Actually run some tests that claim to be @GwtCompatible under GWT, stripping out the @GwtIncompatible parts. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=43617179
Renamed @WebTests to @WebTest  @WebTests has been renamed to @WebTest so that the Gradle build does not attempt to run it as a JUnit test.
added missing license text
working on ctor args
[FLINK-10087][tests] Update BucketingSinkMigrationTest for 1.5
Make the PageCache the only way to map files into memory.
SimonStewart: Lifting the proxy pac code into common  r8954
Use ErrorLogger for BuckIsDyingException  Summary: And still more consolidation of user-facing exception message extraction  Reviewed By: philipjameson  fbshipit-source-id: a08ce1f
Rewrite wrong use of FunctionDeclaration to FunctionDefinition
added log statements
Renamed LeftCurlyCheck to AbstractLeftCurlyCheck. Completely happy with the name. :-)
modest changes to interrupt
2.x: Add C.delaySubscription marble, fix some javadoc (#6257)
Fix insert on LINKMAP with subqueries  Resolves: #8646
Remove useless double canonicalization Fix warning
Post code review amendments
PushNodesThroughPi: add metric for pushed nodes
Modify the defaults for source file multi-fetch.  Summary: For now we're making preload-materialization the default strategy so as to clearly put aside the time for materializing files. Once we launch stampede into production, we can switch to on-demand materialization if it performs better.  Test Plan: Ran the build slave locally and experimented with a lot of different values for these parameters. Materializing during preload with a max buffer size of 40 performs decently in a large build (materializing more than 28k files in about 12-13s -- which we can hide by doing in parallel with action graph creation). On-demand materialization depends on a lot of variables, like the average number of files requested by the rules, or the highest number of files requested by a single rule.  Reviewed By: alisdair04  fbshipit-source-id: 6f75328
Javadoc changes to help fix #1322
Added ability to discover new tag libraries and template engines automatically WW-1590
re-enabled the enabling of remote shell by default, now with a test to express that contract
Removes unnecessary blobExists() check before reading a blob in the Azure and Google cloud blob containers, as the APIs for both return a 404 in the case of a missing object, which we already handle through a NoSuchFileFoundException.
Access java options through toolchain in AndroidPrebuiltAarDescription  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: e3074c1
Added some logic to support size on index hits
Move SplitSource to split package
Tests: log when an ensure green/yellow comes back  Also added some trace logging to SimpleRecoveryLocalGatewayTests
Removing debug statements
encode scroll id with base64 in url safe manner
External UUID control support for AutoscaleVmProfile and AutoscaleVmGroup
Round 3 of the immutable collections classdocs rewrite. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=89434768
fix for: https://issues.apache.org/jira/browse/AMQ-3481  Issues arises when the StompTransport is sending an Ack back for Auto Ack  mode in the same thread as the message was dispatched in.  If an incoming  command beats the auto ack to onCommand in the activity monitor it will block as the original thread is now waiting on the incoming command for the transport lock.  Need to send back the Auto Acks in their own thread using a Task Runner in the Stomp Transport so that the dispatch thread can complete and release its lock on the transport.
Add support for splitting a compressed source for uncompressed files  This adds support for splitting the file if the file name does not end with one of the supported compression formats (currently gz and bz2) and the delegate source also supports splitting.  This is for Apache Beam.  ----Release Notes----  [] ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=114894950
Expose graph builder configuration and some other details of Truffle compiler
Pass topScorer=false to sub-scorers if a scorer is wrapped. Wrapped BooleanQuery can return collect-only scorers. See #2505
Address why users should prefer our immutable collections to things like Collections.emptyList().  RELNOTES=n/a  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=221486706
GdxPay: mission copyright statements added (documentation).
GenericNativeIndexProvider is ExtensionType.DATABASE
added ResolvedJavaType.getClassInititalizer()
Fix issue with ldap attribute defaults. Added logging
Use the renamingDecorator to ensure that Services always run in appropriately named threads.  AbstractIdleService and AbstractScheduledService encode the current state in the name so you should see something like  MyService (STARTING|RUNNING|STOPPING)  AbstractExecutionThread service just uses the serviceName() (so it would be "MyService")  I could additionally try to encode the state but it didn't seem worth it. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=45135687
CAMEL-5055: Reverted the unintended removal of the call to 'container.setSessionTransacted(transacted)'.
HtmlUnit: disabling broken tests
Make PrecompiledHeaderData implement AddsToRuleKey  Summary: This allows us to remove the custom appendToRuleKey in CxxPreprocessAndCompile and will allow us to correctly derive its deps automatically.  Reviewed By: ttsugriy  fbshipit-source-id: c0bacf2
Allow to read transaction metadata from KernelTransaction.  Add method that will allow to read transaction metadata from KernelTransaction to avoid useless casting to KernelTransactionImplementation.
Clean up the @SuppressWarnings in camel-bean-validator, camel-hawtdb
Added Texture#toString.  Sometimes it's the little things.
Close temporary engine in launcher
bug 9774: display non-ready templates. Added "state" field to all snapshot* api responses.
Allow an HttpClient to have a proxy be set
Add support for splitting a compressed source for uncompressed files  This adds support for splitting the file if the file name does not end with one of the supported compression formats (currently gz and bz2) and the delegate source also supports splitting.  This is for Apache Beam.  ----Release Notes----  [] ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=114894950
Use supplier to pass rules to exclude around AndroidBinary  Summary: This will allow to pass `rulesToExclude` to `AndroidBinaryGraphEnhancer` from `AndroidInstrumentationApkDescription` as a supplier which will be used in the following changes to avoid the instantiation the whole set.  Reviewed By: jtorkkola  shipit-source-id: 6a39074075
Configure view controllers with ApplicationContext  Issue: SPR-13762
Remove the annotation output of the abi targets from the source folders  Summary: This avoids adding duplicate classes to IntelliJ.  Reviewed By: asp2insp  fbshipit-source-id: b4b19109ee
Tests: Rename tests with the same name  These two tests are confusing because they have the same class name in different packages.  This results in accidentally looking at the wrong file when trying to open the test by class name. They are also not "simple"..
Revert: [abi] Test for proper stubbing of static member classes, enums, and interfaces  Summary: This reverts commit [abi] Test for proper stubbing of static member classes, enums, and interfaces.  Test Plan: revert-hammer  fbshipit-source-id: 66a2000
Useful iterator util fromEnd
Fixed issue 11: http://code.google.com/p/orient/issues/detail?id=11 About execution of queries from ODatabaseObject.
Fix predicates for Raptor system.tables  Remove lowercase and fix handling of multiple values.
Fix toString() of some Source/Sink implementations to match method names. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=41036419
2.x: Detail distinct() & distinctUntilChanged() in JavaDoc (#5837)  * 2.x: Detail distinct() & distinctUntilChanged() in JavaDoc  * Address feedback
added ResolvedJavaType.getClassInititalizer()
Correctly create IsCompilationConstantNode in FastPE mode.
deprecated scheduling support for JDK 1.3 Timer
UCDetector  - use final
[SQL] Add ParseException to sqlEnv.explain()
Add expected mapping type to `MapperException` (#31564)  Currently if a document cannot be indexed because it violates the defined  mapping for the index, a MapperException is thrown. In some cases it is  useful to expose the expected field type in the exception itself,  so that the user can react based on the error message. This change adds  the expected data type to the MapperException.  Closes #31502
Added ability to discover new tag libraries and template engines automatically WW-1590
return security group status per zone
doh - added the correct headers
TraceRA: adopt visibility.
Move inlining decision tree logging into its own method.
Remove unused SourcePathResolver from CxxInferCaptureTransitive  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: bbceadb
Tidying up and one of the functional tests work
Issue #3896: Test failed due to locale message settings. (with non-English locale settings)
HIVE-7408 : HCatPartition needs getPartCols method (Navis reviewed by Alan Gates)
Add more metadata to the initial metadata event in the Chrome trace.  Summary: I would like to be able to get more information from a Buck trace so I can do some processing using `jq` to quickly extract the data I need about the user's recent local `buck` invocations.  Test Plan: After doing a `./bin/buck build` locally, I ran:      cat buck-out/log/build.trace | jq '.[0]'  and got the following, as expected:  ``` {   "cat": "buck",   "name": "process_name",   "ph": "M",   "pid": 0,   "tid": 0,   "ts": 0,   "tts": 0,   "args": {     "user_args": [       "build",       "buck"     ],     "is_daemon": true,     "timestamp": 1501953406765   } } ```  Reviewed By: dinhviethoa  fbshipit-source-id: 4dc5b49
Remove duplicated utils
Fixed unit test having problem on Windows deleting files for cleanup.
Fix some failing tests. No regression in Tomcat/Jasper, just need to take account of changes in test framework.
Make the PageCache the only way to map files into memory.
disable caching of messages for the Queue Cursor
Don't pass the raw configs as an extra parameter.  Summary: The raw configs are already available in the options so there is no need for them to be passed as an extra parameter.  Test Plan: CI  Reviewed By: beefon, marcinkosiba  fbshipit-source-id: f404667
Test case clean up
[FLINK-8705] [flip6] Add Flip-6 support to Remote(Stream)Environment  This commit enables the Remote(Stream)Environment to submit jobs to a Flip-6 based cluster. It achieves this by instantiating a RestClusterClient instead of a StandaloneClusterClient.
Propagate all errors to createIsolate
Pass BuildContext to getPostBuildSteps  Summary: And use it in AppleDsym, rather than a SourcePathResolver from the constructor  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 69e9ea1
enables resolving and the correct scope generation  for default arguments in parameters
Add Env#getSupportedMimeTypes()
[FLINK-1686] [streaming] Use different slot identifier per iteration
Move TestBuildRuleCreationContextFactory in test to correspond to source structure  Summary: BuildRuleCreationContext is under src.com.facebook.core.model.targetgraph This moves the test file to correspond to that  Reviewed By: styurin  fbshipit-source-id: d393bf28d3
Follows changes in kernel/index API
DRILL-1299: Enable short circuit evaluation for case expressions in the run-time generated code.
SyncedFlushResponse to implement ToXContentObject (#31155)  The response currently implements ToXContentFragment although the only time it's used it is supposed to print out a complete object rather than a fragment. Note that this is the client version of the response, used only in the high-level client.
clear pixMap page to remove texture artifacts
Use different method for getting component locator in EncodedStringTypeAdapter
MAHOUT-1214: Improve the accuracy of the Spectral KMeans Method - minor code cleanup
HIVE-9871: Print spark job id in history file [spark branch] (Chinna via Xuefu)
Add a LLVMFloatVectorToI64Node cast node  This change is in preparation for complex numbers.
Unignoring tests passing in updated HtmlUnit driver
Clean up lamda refs with method refs instead. Remove abstract from reg service UI info
CAMEL-7982: camel-git - A generic git component, add Log operation
Adressing review comments
Removing debug statements
SecurityIndexSearcherWrapper should build a filter instead of a query (elastic/elasticsearch#4953)  The SecurityIndexSearcherWrapper was calling toQuery instead of toFilter, which in certain cases can trip the max clause count check for a boolean query. The same query works fine as a filter and that is what users would expect when using the query for document level security.  Original commit: elastic/x-pack-elasticsearch@40330636ec5f65fb8bdd4a03b4285618aef363fb
Investigate issue with @ComponentScan as meta-annotation  This commit introduces unit and integration tests that attempt to reproduce the issue claimed by the reporter in SPR-11557. However, the tests pass without any problems.  Issue: SPR-11557
Tests: log when an ensure green/yellow comes back  Also added some trace logging to SimpleRecoveryLocalGatewayTests
non-fork optimization.
Added readInternal template method
Remove empty PartitionedLookupSourceFactory.close() method
wired up polling for AndroidController
Add Env#getSupportedMimeTypes()
Query: Add `index.query.default_field` allowing to control the default field used to search on, closes #1657.
Make SLTestSuite more flexible
Make inner classes static when possible, issue #778  All violations of Fildbugs rule [SIC: Should be a static inner class](http://findbugs.sourceforge.net/bugDescriptions.html#SIC_INNER_SHOULD_BE_STATIC) are fixed.
Rewrite wrong use of FunctionDeclaration to FunctionDefinition
Correctly create IsCompilationConstantNode in FastPE mode.
CLOUDSTACK-6358: Missing patches in master for VMware
Added JavaDoc for handler.codec.frame package.
Fix RangeFieldMapper rangeQuery to properly handle relations  This commit fixes the RangeFieldMapper and RangeQueryBuilder to pass the correct relation to the RangeQuery when performing a range query over range fields.
Access java options through toolchain in AndroidPrebuiltAarDescription  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: e3074c1
Introduce ProjectFilesystemDelegate.getDetailsForLogging()  Summary: This supersedes what was done in D5620740 to add more details in the Chrome trace about the `ProjectFilesystemDelegate` that was used. In particular, I worry about misspelling `eden.disable_sha1_fast_path` and it not having the desired effect, so this is a simple way to verify it.  Test Plan: Do a Buck build in Eden with and without `--config eden.disable_sha1_fast_path=true` and run the following after each run and verify it has the expected output:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  Reviewed By: ttsugriy  fbshipit-source-id: 6b54cca
[fixed] AssetManager, throw exception if get is called for an asset that doesn't exist. [added] Scaling modes for Image, stretchX and stretchY. [added] stack method for TableLayout. [fixed] JsonWriter, removed bad import and fixed exception when popping last object/array.
[CORE] Ensure GroupShardsIterator is consistent across requests  GroupShardsIterator is used in many places like the search execution to determin which shards to query. This can hold shards of one index as well as shards of multiple indices. The iteration order is used to assigne a per-request shard ID for each shard that is used as a tie-breaker when scores are the same. Today the iteration order is soely depending on the HashMap iteration order which is undefined or rather implementation dependent. This causes search requests to return inconsistent results across requests if for instance different nodes are coordinating the requests.  Simple queries like `match_all` may return results in arbitrary order if pagination is used or may even return different results for the same request even though there hasn't been a refresh call and preferences are used.
BuildRuleResolver Refactoring: remove unused public method from interface  Reviewed By: bobyangyf  fbshipit-source-id: e954ee67b0
Clean up dead code elimination.
[SPR-7960] Renamed @ActivateProfiles to @ActiveProfiles and fleshed out JavaDoc.
avoid rendering invalid ids (SPR-6840)
Fix index query with embedded list key  Resolves: #5830
Follows changes in kernel/index API
moved INVALID_CODE to HotSpotOptimizedCallTarget and better documented its necessity
Configure view controllers with ApplicationContext  Issue: SPR-13762
Fixes #3362 (Possible wrong behavior in `HttpResponseDecoder`/`HttpRequestDecoder` for large header/initline/content)  Motivation:  `HttpResponseDecoder` and `HttpRequestDecoder` in the event when the max configured sizes for HTTP initial line, headers or content is breached, sends a `DefaultHttpResponse` and `DefaultHttpRequest` respectively. After this `HttpObjectDecoder` gets into `BAD_MESSAGE` state and ignores any other data received on this connection. The combination of the above two behaviors, means that the decoded response/request are not complete (absence of sending `LastHTTPContent`). So, any code, waiting for a complete message will have to additionally check for decoder result to follow the correct semantics of HTTP.  If `HttpResponseDecoder` and `HttpRequestDecoder` creates a Full* invalid message then the request/response is a complete HTTP message and hence obeys the HTTP contract.  Modification:  Modified `HttpRequestDecoder`, `HttpResponseDecoder`, `RtspRequestDecoder` and  `RtspResponseDecoder` to return Full* messages from `createInvalidMessage()`  Result:  Fixes the wrong behavior of sending incomplete messages from these codecs
Remove unused SourcePathResolver from CxxInferCaptureTransitive  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: bbceadb
cxx: add parse-time deps for shared library interface factories  Test Plan: CI  Reviewed By: shivanker  fbshipit-source-id: 2680102
Fix failing CLI tests  This commit fixes some failing CLI tests. The failure here is that a guard against the system property es.path.conf was added yet these tests were not adapted for this change. This commit implements this adapation which overrides the createEnv method where the problematic guard is invoked. We do this to avoid having to set es.path.conf in tests.  Original commit: elastic/x-pack-elasticsearch@20e1724823589ce45a2067030e37512dbfb88537
Return exception object from `clearPendingException`.
Pass CxxTest its SourcePathResolver from runTests context  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 648fb82
Remove unused SourcePathResolver from AaptPackageResources  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: d930bdc
Make FluentIterabl#of @GoogleInternal ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=28454584
Add super.finalize to finalizers missing those calls.
Avoid NPE when using Acceptable Use Policy without repository (#2442)
Add better validation error message and a dedicated test
Clean up generics warnings in spring-oxm tests
Migrate map_concat to new scalar framework
[added] license headers to box2d tests.
[scene2d.ui] Changed widgets to use Actor#hasKeyboardFocus.
Convert  to the new settings infra
Make public announcement text clearer  Summary: This makes it clearer that there is a problem, and that there is a solution available. Before, the text just ran together as one unbroken statement  Reviewed By: cjhopman  fbshipit-source-id: 3997256
adding license headers
Fix a bug of DnsNameResolver while working with NoopDnsCache.  Motivation:  If DnsNameResolver works with NoopDnsCache, IndexOutOfBoundsException will be thrown.  Modifications:  Test if the result of DnsNameResolver.get(hostname) is empty before accessing it's elements.
Take expression compiler from QueryRunner in FunctionAssertions
Move string to BuildTarget conversion to a more appropriate class to avoid cyclic dependencies.  Summary: String->BuildTarget conversion is the BuildTargetParser's job. This diff also helps avoid cyclic dependencies in future work.  Test Plan: CI  Reviewed By: ruibm  fbshipit-source-id: e1b6d75
ValuePosition: refactor set(LIRInstruction, Value).
Introduce ProjectFilesystemDelegate.getDetailsForLogging()  Summary: This supersedes what was done in D5620740 to add more details in the Chrome trace about the `ProjectFilesystemDelegate` that was used. In particular, I worry about misspelling `eden.disable_sha1_fast_path` and it not having the desired effect, so this is a simple way to verify it.  Test Plan: Do a Buck build in Eden with and without `--config eden.disable_sha1_fast_path=true` and run the following after each run and verify it has the expected output:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  Reviewed By: ttsugriy  fbshipit-source-id: 6b54cca
Make FluentIterabl#of @GoogleInternal ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=28454584
added log statements
added better javadoc comments to add better descriptions on the XSD reference
don't discard original exception (suspiciously/possibly eclipse-generated)
updated log messages
Updated exp policy
Allow configuring JDBC HTTP client per connection
Improve Work Rejection handling  The timing between checking for a shutdown state and submitting work is racy. Re-check to see if a work rejection is acceptable because the underlying executor is shut down before throwing a RejectedExecutionException.
CAS-1474: Removed unneeded prop from handler.
Add protected Mesh constructor and move invalidate to VertexData
[STORM-3206] validate topoConf only against Config.java during submission
KAFKA-5412: Using connect-console-sink/source.properties raises an exception related to "file" property not found  Author: ppatierno <ppatierno@live.com>  Reviewers: Randall Hauch <rhauch@gmail.com>, Ewen Cheslack-Postava <ewen@confluent.io>  Closes #3279 from ppatierno/kafka-5412
Remove empty PartitionedLookupSourceFactory.close() method
Provide 'with implementationType' overloads  Provided overloaded versions of `forField` and `forMethodParameter` that accept a `ResolvableType` implementation type (as opposed to a Class).  Primarily added to allow resolution against implementation types that have been created programmatically using `forTypeWithGenerics`.  Issue: SPR-11218
Allow easier use of AIO transport via bootstrap. Related to [#725]
[streaming] Fixed generics and added SuppressWarnings
Move creation of Basic authorisation string Authorization class
Correctly deserialize pipeline options on Fn harness
Enforce that ABI rules are not created if there is no library jar  Summary: Previously we would just return a null `Path` for an ABI jar in such a case, but really we should never even create the ABI rule.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: c948fcd
CAS-1267: Remove the need to CAST the returned ticket object from ticket registry
don't discard original exception (suspiciously/possibly eclipse-generated)
Handle null argument in sendKeys  Signed-off-by: Simon Stewart <simon.m.stewart@gmail.com>
Fix handling of missing columns in Parquet Reader
Added more convenience methods to bootstraps
rename Table.doGC to forceCleanup.  patch by Eric Evans; reviewed by jbellis for CASSANDRA-211
Move string to BuildTarget conversion to a more appropriate class to avoid cyclic dependencies.  Summary: String->BuildTarget conversion is the BuildTargetParser's job. This diff also helps avoid cyclic dependencies in future work.  Test Plan: CI  Reviewed By: ruibm  fbshipit-source-id: e1b6d75
Move inlining decision tree logging into its own method.
Issue 11510: Throw Exception for missing settings file  An Exception will be thrown when the givven YAML-file doesn't exist.
Removing debug statements
FetchSubPhase to support a single parser that extends SearchExtParser
Prevent serialization exception from Env actuator    When `EnvironmentEndpoint` is building a response to return to the  web infrastructure, it creates a data structure containing all  property values from all property sources. Prior to this commit, it  was possible for the response data structure to contain property  values that were not serializable to JSON by Jackson, which would  cause an exception to be thrown by the web infrastructure. This  commit ensures the data structure is serializable to JSON by  ensuring property values are primitives or Strings, and returning  a placeholder value if a property value is of any other type.    Fixes gh-23805
Fail store initialisation in case when header record can't be read  Throw StoreNotFoundException in case if we can't read first page of a store file to get header information out of it.
Removed need for state after on load indexed, and new bytecodes.
Renames class to match pattern used in Tiles
Inner hits fail to propagate doc-value format. (#36310)  If you pass a doc-value format to inner hits, it gets ignored.
Renamings of installed code replacements
Model interface exposes getAttribute method (next to add/contains)  Fixes gh-22145
Remove empty PartitionedLookupSourceFactory.close() method
Increase visibility of some Metrics methods  Also revise the Javadoc on MetricsContainers.
return security group status per zone
Use (Concurrent)Map.computeIfAbsent for lazy nested collection creation
bug 13866: return publicIp info in listVms api response when vm is linked to public ip via static nat Reviewed-by: Frank
rename Table.doGC to forceCleanup.  patch by Eric Evans; reviewed by jbellis for CASSANDRA-211
JAVADOC: Added missing javadocs.
Removed unused imports
Support for reactive types in Conventions  Issue: SPR-14915
Rename transaction type to write state, update setter name.
Ignore deprecation warnings for AssumptionViolatedException
Move ParseBuckProfilerReportEvent to an appropriate package.  Summary: Otherwise an attempt to add a dependency on it leads to cyclic deps.  Reviewed By: jtorkkola  fbshipit-source-id: a4c9665
Pass BuildContext to getPostBuildSteps  Summary: And use it in AppleDsym, rather than a SourcePathResolver from the constructor  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 69e9ea1
Fix NPE exception when using invalid cipher during building SslContext. (#8171)  Motivation:  We missed to do a null check before trying to destroy the OpenSslSessionContext, which could lead to a NPE.  Modifications:  Add null check and tests.  Result:  Fix https://github.com/netty/netty/issues/8170.
Added ability to revoke trusted dev records
[inlining] no need for the suspense about return value
Implemented regular expression as validation
[CAMEL-13040] Move modules to core/ folder
Clean up the @SuppressWarnings in camel-bean-validator, camel-hawtdb
ForwardedHeaderFilter requestURI preserve encoding  Previously ForwardedHeaderFilter would override the requestURI with a URL decoded value. This would cause problems when using a URL encoded requestURI since downstream Filters would not see the URL encoded value as they should.  This commit resolves this issue by ensuring that the requestURI is properly encoded.  Issues SPR-15422
SSALinearScan: rename sub-phases.
Trace constant roots WIP.
Fixes #3362 (Possible wrong behavior in `HttpResponseDecoder`/`HttpRequestDecoder` for large header/initline/content)  Motivation:  `HttpResponseDecoder` and `HttpRequestDecoder` in the event when the max configured sizes for HTTP initial line, headers or content is breached, sends a `DefaultHttpResponse` and `DefaultHttpRequest` respectively. After this `HttpObjectDecoder` gets into `BAD_MESSAGE` state and ignores any other data received on this connection. The combination of the above two behaviors, means that the decoded response/request are not complete (absence of sending `LastHTTPContent`). So, any code, waiting for a complete message will have to additionally check for decoder result to follow the correct semantics of HTTP.  If `HttpResponseDecoder` and `HttpRequestDecoder` creates a Full* invalid message then the request/response is a complete HTTP message and hence obeys the HTTP contract.  Modification:  Modified `HttpRequestDecoder`, `HttpResponseDecoder`, `RtspRequestDecoder` and  `RtspResponseDecoder` to return Full* messages from `createInvalidMessage()`  Result:  Fixes the wrong behavior of sending incomplete messages from these codecs
Organize imports in Spring MVC Test classes
Remove calls to simple getters within classes. #1555  Fixes `CallToSimpleGetterInClass` inspection violations.  Description: >Reports any calls to a simple property getter from within the property's class. A simple property getter is defined as one which simply returns the value of a field, and does no other calculation. Such simple getter calls may be safely inlined, at a small performance improvement. Some coding standards also suggest against the use of simple getters for code clarity reasons.
Pass BuildContext to getPostBuildSteps  Summary: And use it in AppleDsym, rather than a SourcePathResolver from the constructor  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 69e9ea1
Updated license headers
AbstractJackson2Encoder uses private fields  Make the protected fields in AbstractJackson2Encoder private plus minor refactoring to the way streaming separators are applied.  The current (5.0.3) behavior is to always use '\n', but in 5.0.4 the newly supported "application/stream+x-jackson-smile" needs to be excluded from that. For now, separator determination remains private in the abstract base class, but current behavior remains which is to apply '\n' by default.  Issue: SPR-15424
Use SQL types in error messages
Tests: Muting OpenLDAP tests due to network issues  Original commit: elastic/x-pack-elasticsearch@c32d397a20e86a57422eb07e5fe578e6e60790cc
Fix UDP Multicast writes. See #237
Remove useless double canonicalization Fix warning
adding missing finals
Custom "jdbcExceptionTranslator" on HibernateJpaDialect  Also available on LocalSessionFactoryBean through HibernateExceptionTranslator, as with our former Hibernate 3 support.  Issue: SPR-17015
Move string to BuildTarget conversion to a more appropriate class to avoid cyclic dependencies.  Summary: String->BuildTarget conversion is the BuildTargetParser's job. This diff also helps avoid cyclic dependencies in future work.  Test Plan: CI  Reviewed By: ruibm  fbshipit-source-id: e1b6d75
Make comparators serializable
Move inlining decision tree logging into its own method.
Organize imports in Spring MVC Test classes
Pass BuildContext to getPostBuildSteps  Summary: And use it in AppleDsym, rather than a SourcePathResolver from the constructor  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 69e9ea1
Allow for reuse of key visitor classes in tooling  Based on https://github.com/SpringSource/spring-framework/pull/263
Java API: package private getters to become public if there have corresponding public setters  Some of our Java API requests have public setters but their corresponding getters are package private only. This commit makes those getters public as well.  Closes #9273
Patch by Luca Molino to fix issue 345
More code review
Exists API can send response body, closes #2072.
Ensure order is preserved in Rabbit addresses    Using StringUtils.commaDelimitedListToSet() does not preserve order (why?),  so we have to use commaDelimitedListToStringArray().    Fixes gh-1262
Move inlining decision tree logging into its own method.
Put nonoss under Spring framework
refactor(json): remove final modifier from private methods  Since private methods cannot be meaningfully overridden, declaring them final is redundant and can be confusing to those reviewing the code.
Make CLI argument parsing more robust  Summary: Fixing this exception:    java.lang.StringIndexOutOfBoundsException: String index out of range: 0     at java.lang.String.charAt(String.java:658)     at com.facebook.buck.cli.StringSetOptionHandler.parseArguments(StringSetOptionHandler.java:75)     at org.kohsuke.args4j.CmdLineParser.parseArgument(CmdLineParser.java:520)     at org.kohsuke.args4j.CmdLineParser.parseArgument(CmdLineParser.java:459)     at org.kohsuke.args4j.spi.SubCommandHandler.subCommand(SubCommandHandler.java:117)     at org.kohsuke.args4j.spi.SubCommandHandler.parseArguments(SubCommandHandler.java:102)     at org.kohsuke.args4j.CmdLineParser.parseArgument(CmdLineParser.java:520)     at com.facebook.buck.cli.Main.runMainWithExitCode(Main.java:642)     at com.facebook.buck.cli.Main.tryRunMainWithExitCode(Main.java:1479)     at com.facebook.buck.cli.Main.runMainThenExit(Main.java:1564)     at com.facebook.buck.cli.Main.main(Main.java:1582)     at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)     at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)     at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)     at java.lang.reflect.Method.invoke(Method.java:497)     at com.facebook.buck.cli.bootstrapper.ClassLoaderBootstrapper.main(ClassLoaderBootstrapper.java:62)  Test Plan: Save some text in a file and add an empty line to this file, then run this command:      buck targets --type java_test robolectric_test cxx_test python_test --referenced_file @/file/location  It should not fail.  Reviewed By: sdwilsh  fb-gh-sync-id: bfa22b8
Add diff contents to the report  Reviewed By: marcinkosiba  fbshipit-source-id: 120f50c
Clean up after rebase
WW-1488 Update license headers for Struts 2 source - cleanup.
Investigate issue with @ComponentScan as meta-annotation  This commit introduces unit and integration tests that attempt to reproduce the issue claimed by the reporter in SPR-11557. However, the tests pass without any problems.  Issue: SPR-11557
Added missing license headers
Added javadoc links to the code examples in the javadoc comments.
Javadoc changes to help fix #1322
Renamed ChunkStream to ChunkedInput Renamed ChunkStreamWriteHandler to ChunkedWriteHandler Renamed FileChunkStream to ChunkedFile
Remove unused SourcePathResolver from CxxInferCaptureTransitive  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: bbceadb
Make TasteOptionParser static
[hotfix][operator] Rename StreamInputProcessor to StreamOneInputProcessor  This is done in order to free `StreamInputProcessor` name as a base interface of all of the processors.
Move ExecutionContext and related classes to runners-core
make Predicate consistent with java 8
CAMEL-13313: Add support for generating type converter loader source code to be able to load component type converters in a faster way.
CAS-1475: Deprecated and added logs.
Rename WebTestClientConnectorTests to match class name
Update legacy test stuff too.
Make NoSuchBufferException message more useful
more convenience methods for introspection of Tuple and context
Add ClientRequest.attribute(String)  This commit adds the attribute(String) convenience method to the ClientRequest class. It also adapts the Basic Authentication filter to use it.
Put nonoss under Spring framework
Switch to using a varargs syntax in CommandRunner.  Summary: We use the array syntax for the final argument for CommandRunner.runCommand. If we use the varargs syntax, calling the method becomes cleaner.  Test Plan: buck test --all
CombineLatest: fixed concurrent requestUpTo yielding -1 requests sometimes.
HOTFIX: ChangeLoggingKeyValueStore.name() returns null  This class doesn't need to override this method as it is handled appropriately by the super class  Author: Damian Guy <damian.guy@gmail.com>  Reviewers: Guozhang Wang <wangguoz@gmail.com>  Closes #2397 from dguy/hotfix-npe-state-store
Whitespace removal from /java/org/apache/catalina/users
Update ClassLoaderSafe adapters with new layout spi
Remove type parameter from AuthCacheMBean interface  Patch by Sam Tunnicliffe; reviewed by Kurt Greaves for CASSANDRA-14687
Merging capabilities to options should be fluent
Remove type parameter from AuthCacheMBean interface  Patch by Sam Tunnicliffe; reviewed by Kurt Greaves for CASSANDRA-14687
fix for: https://issues.apache.org/jira/browse/AMQ-3742 with supplied unit test patch applied.
[BEAM-5945] add reverse
Added readInternal template method
rename Table.doGC to forceCleanup.  patch by Eric Evans; reviewed by jbellis for CASSANDRA-211
Extend TargetConfiguration to provide configuration targets used by the configuration  Summary: This will be used later to track configuration targets.  Reviewed By: bobyangyf  shipit-source-id: 874da85dc3
Remove AbstractElfSharedLibraryInterfaceFactory.getParseTimeDeps  Summary: Dead code  Reviewed By: bobyangyf  fbshipit-source-id: 2d0367b67f
Added more debug info to thrift http request workflow  Summary: Two of the possible failures are: - during connecting - while downloading the artifact  We add more logs in case there's a failure in one of those situations.  Test Plan: CI  fbshipit-source-id: 7956702
WW-4110 Marks AOP support as deprecated
move test to a single node test
Minor errorprone suggested fixes.
Propagate framework search paths from dependencies  Summary: When building cxx rules, propagate framework search paths from dependencies.  Test Plan:   * `buck test`
Close Spring context in SockJS integration test setup
Unignoring tests passing in updated HtmlUnit driver
Prefer org.junit over junit.framework for OkHttp code.
Exposing HttpServletRequest/Response in ServletServerHttpRequest/Response
Catch IAE when parsing content type  Issue: SPR-10308
Minor javadoc updates.  ----Release Notes---- [] ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=109913802
Correctly deserialize pipeline options on Fn harness
* Simpler sentences * More cross references * Fixed incorrect explanation related with attaching a pipeline to a channel
Introduce ProjectFilesystemDelegate.getDetailsForLogging()  Summary: This supersedes what was done in D5620740 to add more details in the Chrome trace about the `ProjectFilesystemDelegate` that was used. In particular, I worry about misspelling `eden.disable_sha1_fast_path` and it not having the desired effect, so this is a simple way to verify it.  Test Plan: Do a Buck build in Eden with and without `--config eden.disable_sha1_fast_path=true` and run the following after each run and verify it has the expected output:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  Reviewed By: ttsugriy  fbshipit-source-id: 6b54cca
Introduce ProjectFilesystemDelegate.getDetailsForLogging()  Summary: This supersedes what was done in D5620740 to add more details in the Chrome trace about the `ProjectFilesystemDelegate` that was used. In particular, I worry about misspelling `eden.disable_sha1_fast_path` and it not having the desired effect, so this is a simple way to verify it.  Test Plan: Do a Buck build in Eden with and without `--config eden.disable_sha1_fast_path=true` and run the following after each run and verify it has the expected output:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  Reviewed By: ttsugriy  fbshipit-source-id: 6b54cca
Clean up lamda refs with method refs instead. Remove abstract from reg service UI info
don't discard original exception (suspiciously/possibly eclipse-generated)
Ensure durations can be parsed as values
Expose GlobalConstant in the NodeFactoryFacade
Revert "mute failing filerealm hash caching tests (#42304)"  This reverts commit 8907dc9598667a1fa29be0ba22c7030ebee1101b.
don't discard original exception (suspiciously/possibly eclipse-generated)
fixed silent failure in case of missing set with dotted notation in odocument.field api, issue #5308
Enable separate thread pool for rulekey fetches  Summary: This enables the separate thread pool for rulekey fetches. The pool is given min(cache thread pool size, network io resources) thread max.  Test Plan: CI, `buck build --populate-cache fb4a` to ensure no OOM issues  Reviewed By: ruibm  fbshipit-source-id: 7c1be41
Remove GraalTruffleRuntime field from OptimizedDirectCallNode
Enforce that ABI rules are not created if there is no library jar  Summary: Previously we would just return a null `Path` for an ABI jar in such a case, but really we should never even create the ABI rule.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: c948fcd
allow multiple identities in MemoryCheckpoint interface
Revised IllegalArgumentException handling for Formatter parse calls  Issue: SPR-14661
cxx: add parse-time deps for shared library interface factories  Test Plan: CI  Reviewed By: shivanker  fbshipit-source-id: 2680102
SimonStewart: Chrome build now no longer hangs. Still fails. *sigh* Also fixing build for HtmlUnit since "isDisplayed" doesn't appear to be working properly at the moment. I've raised this on the htmunit developer mailing list.  r7686
Extend RuleScheduleInfo to include ResourceAmounts  Summary: Add a new field so we will be able to pass ResourceAmounts in RuleScheduleInfo  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: e5def71
Use ErrorLogger for BuckIsDyingException  Summary: And still more consolidation of user-facing exception message extraction  Reviewed By: philipjameson  fbshipit-source-id: a08ce1f
Issue #4165: Split and Organize Checkstyle inputs by Test for ExplicitInitializationCheckTest
Refactor to remove o.a.c -> o.a.c.util dependency
Removed unused imports
Add config to disable location aware scheduling
adding license headers
Add HashFunction#hashObject() shortcut. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=38044012
Bring OpenSSL integration code together under a common package
Rename WebTestClientConnectorTests to match class name
Prepend -Xlinker to linker flags in project generation.  Summary: Buck prepends -Xlinker to linker_flags during building. This makes project generation have the same behaviour.  Test Plan: CI
make Serializable to prevent NotSerializableException in weblogic (AMQ-501) - Patrick Villacorta
Improve comments and javadoc
Restrict QueryEnvironment.getTargetKind() to QueryBuildTarget.  Summary: Many methods in `QueryEnvironment` claim to accept a `QueryTarget`, but actually accept only a `QueryBuildTarget`. This is a first step in an attempt to make all of the methods of `QueryEnvironment` more specific.  I think that, in the limit, we probably want to replace `QueryBuildTarget` with a generic type `T` to make it easier to use with `com.facebook.buck.multitenant.service.Index`.  Reviewed By: bobyangyf  fbshipit-source-id: 45d6823cf7
Bug 57193: Remove self-closing elements like <p/> or <br/>. Bugzilla Id: 57193
Make Rule tests use Memo and Lookup
Add detectHandlerMethodsInAncestorContexts property to AbstractHandlerMethodMapping.
Add an in-process, blocking mode for running Arbiter
Refactor to remove o.a.c -> o.a.c.util dependency
Access java options through toolchain in AndroidPrebuiltAarDescription  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: e3074c1
Allow types to customize the name displayed in DESCRIBE
Use offset finding eol avoid repeated scaning.  Motivation:  A large frame will be componsed by many packages. Every time the package arrived, findEndOfLine will be called from the start of the buffer. It will cause the complexity of reading frame equal to  O(n^2). This can be eliminated by using a offset to mark the last scan position, when new package arrived, just find the delimter from the mark. The complexity will be O(n).  Modification:  Add a offset to mark the last scan position.  Result:  Better performance for read large frame.
WW-4110 Marks AOP support as deprecated
Use Throwables.propagate on ExecutionException
Add ImmutableBiMap.Builder.put(Entry) overload, which had previously not been overridden from ImmutableMap.Builder.  Now, it correctly returns ImmutableBiMap.Builder. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=75833810
Check that the declared versions match the backward indices.
Fail queries that have two aggregations with the same name.  Close #6255
Weaken the ES get request extractor dependency to ITuple
Remove LazyInitializable from ScriptServiceProxy  Closes elastic/elasticsearch#2062  Original commit: elastic/x-pack-elasticsearch@4eaf323158920bafa4a2a50f464ab7e99f1ab615
Ensure durations can be parsed as values
Add default implementation to reduce duplication
Add super.finalize to finalizers missing those calls.
Extend RuleScheduleInfo to include ResourceAmounts  Summary: Add a new field so we will be able to pass ResourceAmounts in RuleScheduleInfo  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: e5def71
Correctly identify partition deletions for index transactions  Patch by Sam Tunnicliffe; reviewed by Sylvain Lebresne for CASSANDRA-10343
Ticket metadata abstracted into methods
Updates NativeLabelScanStore on moved classes
Make parameters of Parser.getTargetNodeRawAttributes explicit  Summary: This will refactored later and explicit parameters make future refactoring easier.  Reviewed By: bobyangyf  fbshipit-source-id: b965f22409
added missing license text
Catch IAE when parsing content type  Issue: SPR-10308
Added "beforeExistingAdvisors" flag to AbstractAdvisingBeanPostProcessor  Just AsyncAnnotationBeanPostProcessor switches "beforeExistingAdvisors" to "true" by default. So effectively, MethodValidation/PersistenceExceptionTranslationPostProcessor apply after existing advisors by default again, fixing the 3.1->3.2 regression.  Issue: SPR-10309
Use SQL types in error messages
Whitelist extension if present in the request mapping  We know skip the Content-Disposition header for any extension if the chosen request mapping explicitly contains the URl extension.  Issue: SPR-13629
Bug 57193: Remove self-closing elements like <p/> or <br/>. Bugzilla Id: 57193
cleanup some unused imports
make empty strings always return the MINIMUM token, and DecoratedKeys containing the MINIMUM token always be considered empty.  This is something we probably should be doing anyway for consistency.  (It was already true for OPP, but not COPP or RP.)  No further special casing should be necessary because we have already abstracted out code that needs to work across multiple partitioners to use IPartitioner.isEmpty, including getRangeSlice.  patch by jbellis; reviewed by Stu Hood for CASSANDRA-745
Add buck config option for ProcessTracker  Test Plan: Verify that ProcessTracker gets instantiated only when adding the buck config option:      [log]         process_tracker_enabled = True  Reviewed By: marcinkosiba  fbshipit-source-id: 4f2d90e
WW-1488 Update license headers for Struts 2 source - cleanup.
Adress reviewer comments.
MANAGEMENT-161: Custom mbean server can be set on ManagementAgent.
Updated OProfiler. Added getContext API
Fixed CS for Camel-XMPP
OS monitor refresh interval setting  This commit converts the OS monitor refresh interval setting "monitor.os.refresh_interval" to the new settings infrastructure.
Added missing Stratosphere headers
Correctly deserialize pipeline options on Fn harness
BuildRuleResolver Refactoring: remove unused public method from interface  Reviewed By: bobyangyf  fbshipit-source-id: e954ee67b0
Improve logging when ce cluster fails to startup
CAMEL-1662: Added option to show the exception message for the log component.
Fix Eclipse warning: unused parameter.  Test Plan: Sandcastle builds.
Make Skylark functions private.  Summary: They should not be accessed directly, since `Runtime.setupModuleGlobals` should be used to set them up.  Test Plan: CI  Reviewed By: sbalabanov  fbshipit-source-id: 0c448bf
Correctly deserialize pipeline options on Fn harness
Rename DiscoveryNodes#smallestNonClientNodeVersion to getSmallestNonClientNodeVersion
move default value wrapper into support package (rather then interceptor)
CAMEL-13313: Add support for generating type converter loader source code to be able to load component type converters in a faster way.
Remove usage of AroundInterceptor as it has been removed from XWork 2.0  XW-1360
HIVE-5738: Need to clear global work in ExecMapper/ExecReducer for container reuse in tez (Gunther Hagleitner)
Filled in JavaDoc for trivial methods
Start Servers only in a ServerFactory
Move the option output formatting into LLVMOptions
Take expression compiler from QueryRunner in FunctionAssertions
Updated license headers
[CORE] Ensure GroupShardsIterator is consistent across requests  GroupShardsIterator is used in many places like the search execution to determin which shards to query. This can hold shards of one index as well as shards of multiple indices. The iteration order is used to assigne a per-request shard ID for each shard that is used as a tie-breaker when scores are the same. Today the iteration order is soely depending on the HashMap iteration order which is undefined or rather implementation dependent. This causes search requests to return inconsistent results across requests if for instance different nodes are coordinating the requests.  Simple queries like `match_all` may return results in arbitrary order if pagination is used or may even return different results for the same request even though there hasn't been a refresh call and preferences are used.
AMQ-6183 Add isDispatchSync to the subscription view and deprecate the meaningless one in the producer view
TIKA-440: [Patch] Fetch the composer information in the MP3 Parser  Patch by Nick Burch
Introduce ProjectFilesystemDelegate.getDetailsForLogging()  Summary: This supersedes what was done in D5620740 to add more details in the Chrome trace about the `ProjectFilesystemDelegate` that was used. In particular, I worry about misspelling `eden.disable_sha1_fast_path` and it not having the desired effect, so this is a simple way to verify it.  Test Plan: Do a Buck build in Eden with and without `--config eden.disable_sha1_fast_path=true` and run the following after each run and verify it has the expected output:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  Reviewed By: ttsugriy  fbshipit-source-id: 6b54cca
Issue 11510: Throw Exception for missing settings file  An Exception will be thrown when the givven YAML-file doesn't exist.
Fix Eclipse warning: unused parameter.  Test Plan: Sandcastle builds.
Clean up lamda refs with method refs instead. Remove abstract from reg service UI info
Add a utility method to ProjectFilesystem to include additional files in zip files.  Summary: I will use this in a subsequent diff to include additional metadata about cache artifacts in the zip files.  Test Plan: unit tests.
Fix a misspelling, tiny method change
Replace usages of deprecated Objects.toStringHelper() with MoreObjects.toStringHelper(). ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=69572761
Fixed regression with fallback for non-resolvable property type
Field Cache: Allow to set `index.cache.field.expire` when using `resident` type, closes #957.
common.graph: fix formatting error in Graph/ValueGraph/Network Javadoc.  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=169869396
There was no need to introduce a thread local to avoid event recursion
WW-1488 Update license headers for Struts 2 source - cleanup.
[TEST] assume assertions are enabled
Reformatted to JMeter conventions. Minor JavaDoc updates.
Use StringBuilder instead of StringBuffer
Android (fragment): Added isFragment method  This allows us to make check if the app is a fragment without having the developer depend on the support jar
doh - added the correct headers
Removed printStackTrace(...) from whole code, issue #660
fix heisenbug in RecoveryManager2Test where a compaction could add back a new sstable to the "cleared" ColumnFamilyStore patch by jbellis; reviewed by junrao for CASSANDRA-463
Added some io utils and removed an unused variable
Add accessors for AfterPane(StateMachine) parameters
http://issues.apache.org/activemq/browse/AMQ-2042 - fix for kaha persistence store
RemoteAccessVpn: fix regression preshared key is not sent to UI/clients  Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com> (cherry picked from commit c71339569d9d3e8e710a4c2490a50ffa6eff4d7f) Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>
Allow to read transaction metadata from KernelTransaction.  Add method that will allow to read transaction metadata from KernelTransaction to avoid useless casting to KernelTransactionImplementation.
Add accessors for AfterPane(StateMachine) parameters
adding license headers
Renamed AbstractXXX to XXXSupport to follow the convention in Camel
updating license and adding some generics
Clean up lamda refs with method refs instead. Remove abstract from reg service UI info
More JDK8 api change fixes.
Close and make noise
Fix failing CLI tests  This commit fixes some failing CLI tests. The failure here is that a guard against the system property es.path.conf was added yet these tests were not adapted for this change. This commit implements this adapation which overrides the createEnv method where the problematic guard is invoked. We do this to avoid having to set es.path.conf in tests.  Original commit: elastic/x-pack-elasticsearch@20e1724823589ce45a2067030e37512dbfb88537
deprecated scheduling support for JDK 1.3 Timer
add hasObservers method to Subjects (#1772)  as per https://github.com/ReactiveX/RxJava/issues/1772  SerializedSubject now keeps track of the actual Subject. BufferUntilSubscriber synchronizes on the state guard.
Watcher: Fix encoding of UTF8 data in HttpClient (elastic/x-pack-elasticsearch#3398)  The HttpClient uses an Apache HTTP client class named StringEntity to encode a HTTP request body. This one however assumes ISO-8859-1 as its charset when encoding the string based body to bytes.  This commit switches to a byte array based body, then sets the content type header and falls back to the old text/plain content type if no content type header is specified.  relates elastic/x-pack-elasticsearch#3397  Original commit: elastic/x-pack-elasticsearch@d5a6e7f0c7f65e507564b9aaab91be97e0beb77c
Random javadoc spruces for Maps.asMap/toMap and Ordering. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=49401524
2.x: Improve JavaDoc of XObserver types. (#5841)  * 2.x: Improve JavaDoc of XObserver types.  * Use "disposing", add missing space  * Add more explanation about throwing exceptions.
Clean up javadoc
make empty strings always return the MINIMUM token, and DecoratedKeys containing the MINIMUM token always be considered empty.  This is something we probably should be doing anyway for consistency.  (It was already true for OPP, but not COPP or RP.)  No further special casing should be necessary because we have already abstracted out code that needs to work across multiple partitioners to use IPartitioner.isEmpty, including getRangeSlice.  patch by jbellis; reviewed by Stu Hood for CASSANDRA-745
Fixed CS for Camel-XMPP
Use explicit locale in toLowerCase().
Migrate <= operator for arrays to new framework
Introduce ProjectFilesystemDelegate.getDetailsForLogging()  Summary: This supersedes what was done in D5620740 to add more details in the Chrome trace about the `ProjectFilesystemDelegate` that was used. In particular, I worry about misspelling `eden.disable_sha1_fast_path` and it not having the desired effect, so this is a simple way to verify it.  Test Plan: Do a Buck build in Eden with and without `--config eden.disable_sha1_fast_path=true` and run the following after each run and verify it has the expected output:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  Reviewed By: ttsugriy  fbshipit-source-id: 6b54cca
javadoc, with override and inheritdoc flags
Fixed lifecycle handling during slave switch. No longer causes deadlock with concurrent shutdown of database. Added predicate to wait for all instances to be joined when using arbiters  Conflicts:     community/kernel/src/main/java/org/neo4j/kernel/lifecycle/LifeSupport.java     enterprise/cluster/src/main/java/org/neo4j/cluster/MultiPaxosServerFactory.java     enterprise/ha/src/test/java/org/neo4j/ha/correctness/ClusterInstance.java     enterprise/ha/src/test/java/org/neo4j/test/ha/ClusterManager.java
fixed test cases with mongo
Fix analyzed prefix query in query_string (#35756)  This change fixes analyzed prefix queries in `query_string` to be ignored if all terms are removed during the analysis.  Closes #31702
Anchor InstanceOf to branches  This allows the anchor to be optimized
PrebuiltOcamlLibrary: Remove unused SourcePathResolver  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: b4b6001
made sure to use the class name as database name in distributed tests
Rename FIXED_RANDOM_DISTRIBUTION to FIXED_ARBITRARY_DISTRIBUTION
Investigate claim on SO regarding ctx cache in TCF  This commit introduces a test that investigates a claim made on Stack Overflow regarding context caching in the TestContext Framework (TCF).
updates for https://issues.apache.org/activemq/browse/AMQ-1311
Truffle-DSL: fixed additional wrong @SlowPath usage on generic. (GRAAL-490 #resolve)
Renamed to ManagedBrowsableEndpointXXX instead of ManagedBrowseableEndpointXXX.
Add additional description what properties should be used instead of deprecated.
CAMEL-11379: Optimise - core type converters to be invoked faster
dont throw exceptions. return flags instead
[fixed] AssetManager, throw exception if get is called for an asset that doesn't exist. [added] Scaling modes for Image, stretchX and stretchY. [added] stack method for TableLayout. [fixed] JsonWriter, removed bad import and fixed exception when popping last object/array.
[FLINK-9275] [streaming] Add taskName to the output flusher thread's name  This closes #5943
don't discard original exception (suspiciously/possibly eclipse-generated)
Load the ContextStoreProfileTest test with the same classloader as the ContextStore classes.
made Node implement NodeInterface to remove unnecessary bridge methods
merge from 1.1
Deprecate High Availability.  High availability edition/database is deprecated by this PR in favour of causal clustering. All high availability related public/not public code will be removed in next major release. All existent tools and usages should be updated to use causal clustering instead.
python: fix PEX executor when pointing to a rule  Summary: - Make sure to add the build target to parse time deps. - For tests, export all the binary's executable commands deps as   runtime deps, as they all need to be present to run.  Test Plan: added unittests  Reviewed By: Coneko, sdwilsh  fb-gh-sync-id: 98925ca shipit-source-id: 98925ca
Synchronized between 4.1 and master (part 3)  Motivation:  4 and 5 were diverged long time ago and we recently reverted some of the early commits in master.  We must make sure 4.1 and master are not very different now.  Modification:  Fix found differences  Result:  4.1 and master got closer.
Introduce TraceTruffleInliningTree option.
No Content-Disposition if HTML in the request mapping  Issue: SPR-13629
Change zip method signature from Collection to Iterable  Fix javadoc typos.
Isolate AbstractFuture from dependency on Ascii.  RELNOTES=n/a  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=206957925
change toInclusice in terms api to default to true instead of false
removed unused imports and fixed a javadoc mistake
use isHvm of template to decide to boot a HVM vm
Node Stats: add max content length to http info
Fixed lifecycle handling during slave switch. No longer causes deadlock with concurrent shutdown of database. Added predicate to wait for all instances to be joined when using arbiters  Conflicts:     community/kernel/src/main/java/org/neo4j/kernel/lifecycle/LifeSupport.java     enterprise/cluster/src/main/java/org/neo4j/cluster/MultiPaxosServerFactory.java     enterprise/ha/src/test/java/org/neo4j/ha/correctness/ClusterInstance.java     enterprise/ha/src/test/java/org/neo4j/test/ha/ClusterManager.java
Unignoring tests passing in updated HtmlUnit driver
Use offset finding eol avoid repeated scaning.  Motivation:  A large frame will be componsed by many packages. Every time the package arrived, findEndOfLine will be called from the start of the buffer. It will cause the complexity of reading frame equal to  O(n^2). This can be eliminated by using a offset to mark the last scan position, when new package arrived, just find the delimter from the mark. The complexity will be O(n).  Modification:  Add a offset to mark the last scan position.  Result:  Better performance for read large frame.
More multi-window fixes... the RC AJAX mode now supports multi-window mode as well.  r3027
[Tests] change BasicBackwardsCompatibilityTest to be compatible with 1.0.3  Also increase the time we wait for an external node to join Sadly tests are not yet stable enough, testing with 1.0.3 is still disabled
Remove unused SourcePathResolver from AaptPackageResources  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: d930bdc
Clean up of scheduler strategies. Make sure implicit null checks are only considered in the fixed reads schedule.
Fix RangeFieldMapper rangeQuery to properly handle relations  This commit fixes the RangeFieldMapper and RangeQueryBuilder to pass the correct relation to the RangeQuery when performing a range query over range fields.
Adds support for extracting store version descriptor for versions earlier than the last legacy
Added JavaDoc for handler.codec.frame package.
Revert "HIVE-13183 : Adds MapredLocalTasks logs in operation log (Rajat Khandelwal, reviwed by Amareshwari)"  This reverts commit a65917a3b9699a09fb5fe2569785ab1b14c17b0a.
Watcher: Fix encoding of UTF8 data in HttpClient (elastic/x-pack-elasticsearch#3398)  The HttpClient uses an Apache HTTP client class named StringEntity to encode a HTTP request body. This one however assumes ISO-8859-1 as its charset when encoding the string based body to bytes.  This commit switches to a byte array based body, then sets the content type header and falls back to the old text/plain content type if no content type header is specified.  relates elastic/x-pack-elasticsearch#3397  Original commit: elastic/x-pack-elasticsearch@d5a6e7f0c7f65e507564b9aaab91be97e0beb77c
Close and make noise
Add missing mappers to MapperBuilders.   - completion  - geo_point  - geo_shape  - parent  - size  - ttl  Close #4423
Fixes due to changes in master branch.
Imply text/event-stream when serializing ServerSentEvent  Issue: SPR-14748
Widgets now use setSize instead of setWidth/Height.  This avoids computing the pref size twice, since setWidth calls sizeChanged which invalidates.
<p> for Javadoc paragraphs.  Revision created by MOE tool push_codebase. MOE_MIGRATION=1296
cleanup some unused imports
Corrected naming Operator -> Operation
replaced Service marker interface with non-standard META-INF directory names to differentiate JVMCI providers from standard service providers META-INF/services/ files for Options provider are now generated directly from files in META-INF/jvmci.options/
Move string to BuildTarget conversion to a more appropriate class to avoid cyclic dependencies.  Summary: String->BuildTarget conversion is the BuildTargetParser's job. This diff also helps avoid cyclic dependencies in future work.  Test Plan: CI  Reviewed By: ruibm  fbshipit-source-id: e1b6d75
Correctly deserialize pipeline options on Fn harness
Added readInternal template method
Frame API: automatically change frame slot type for uninitialized slots
Refactor to remove o.a.c -> o.a.c.util dependency
CAMEL-10973: Deprecate some languages that are either EOL or can expose security issues or other issues and there is better alternatives like javascript, groovy etc.
SPR-7354 - Added equivalent of JAX-RS @Consumes to Spring MVC
Replace usages of deprecated Objects.toStringHelper() with MoreObjects.toStringHelper(). ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=69572761
Return proper OVertex/OEdge on getProperty()
Move string to BuildTarget conversion to a more appropriate class to avoid cyclic dependencies.  Summary: String->BuildTarget conversion is the BuildTargetParser's job. This diff also helps avoid cyclic dependencies in future work.  Test Plan: CI  Reviewed By: ruibm  fbshipit-source-id: e1b6d75
Get rid of BuckConfig from BuildSlaveFinishedStatus  Summary: Step 1 of being able to serialize BuildSlaveFinishedStatus.  Test Plan: CI  Reviewed By: alisdair04  fbshipit-source-id: 6a942a5
Fixed regression with fallback for non-resolvable property type
Make the BeanToJsonConverter avoid fields from java.lang.Object  I'm suspicious about the need for us to send "class" backwards and forwards, but it's apparently used by to reconstitute exceptions so we should probably leave it.
Exposing HttpServletRequest/Response in ServletServerHttpRequest/Response
ensure datetime and date are both supported for svc exp
added extra logging plus a few more ctor args
Make long running heartbeat in simple console configurable  Summary: The long running heartbeat is spamming the simple console. Make it possible to disable it.  Test Plan: CI + `buck build [target] | cat`  Reviewed By: styurin  fbshipit-source-id: da0333f
Per http://tomcat.markmail.org/thread/j7jk7xalhs7t7op7 Threads in the connection pool should not be created using the context loader, but rather the loader that loaded the pool
ResponseBodyResultHandler ignores ResponseEntity  Currently ResponseEntityResultHandler is ordered lower than ResponseBodyResultHandler by default whch means a ResponseEntity should not be picked by the ResponseBodyResultHandler.  However as it is easy to have both ResponseEntity and @ResponseBody e.g. in @RestControler (or even by mistake) and in general it makes sense for ResponseBodyResultHandler to explicitly recognize and ignore the ResponseEntity return type.
Renamed to ManagedBrowsableEndpointXXX instead of ManagedBrowseableEndpointXXX.
CAS-1474: Removed unneeded prop from handler.
PushNodesThroughPi: add metric for pushed nodes
api.object: add some missing javadoc
Polish: to get rid unnecessary array creation
Clean up after rebase
Unignoring tests passing in updated HtmlUnit driver
Fixed lifecycle handling during slave switch. No longer causes deadlock with concurrent shutdown of database. Added predicate to wait for all instances to be joined when using arbiters  Conflicts:     community/kernel/src/main/java/org/neo4j/kernel/lifecycle/LifeSupport.java     enterprise/cluster/src/main/java/org/neo4j/cluster/MultiPaxosServerFactory.java     enterprise/ha/src/test/java/org/neo4j/ha/correctness/ClusterInstance.java     enterprise/ha/src/test/java/org/neo4j/test/ha/ClusterManager.java
Allow to read transaction metadata from KernelTransaction.  Add method that will allow to read transaction metadata from KernelTransaction to avoid useless casting to KernelTransactionImplementation.
Pass topScorer=false to sub-scorers if a scorer is wrapped. Wrapped BooleanQuery can return collect-only scorers. See #2505
disable caching of messages for the Queue Cursor
Model interface exposes getAttribute method (next to add/contains)  Fixes gh-22145
Make Hive view error message a constant
Add WorkProcessor#transformProcessor method  This methods allows to write more streamlined transformations of the processor itself, e.g:  processor.transformProcessor(WorkProcessorUtils::flatten)
Make long running heartbeat in simple console configurable  Summary: The long running heartbeat is spamming the simple console. Make it possible to disable it.  Test Plan: CI + `buck build [target] | cat`  Reviewed By: styurin  fbshipit-source-id: da0333f
PrebuiltOcamlLibrary: Remove unused SourcePathResolver  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: b4b6001
findbugs: handling of long values and wrappers
Code formatting. Operator wrap -> eol No functional change
Add a utility method to ProjectFilesystem to include additional files in zip files.  Summary: I will use this in a subsequent diff to include additional metadata about cache artifacts in the zip files.  Test Plan: unit tests.
Remove Cell.getAbsolutePathToBuildFileUnsafe(BuildTarget)  Summary: This is a part in a series of changes to remove ParserConfig-related information from Cell.  Reviewed By: bobyangyf  fbshipit-source-id: 3719ffc3fb
Introduce ProjectFilesystemDelegate.getDetailsForLogging()  Summary: This supersedes what was done in D5620740 to add more details in the Chrome trace about the `ProjectFilesystemDelegate` that was used. In particular, I worry about misspelling `eden.disable_sha1_fast_path` and it not having the desired effect, so this is a simple way to verify it.  Test Plan: Do a Buck build in Eden with and without `--config eden.disable_sha1_fast_path=true` and run the following after each run and verify it has the expected output:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  Reviewed By: ttsugriy  fbshipit-source-id: 6b54cca
Added some links into the example code
Resync fails to notify on unavaiable exceptions (#33615)  We fail to notify the resync listener if the resync replication hits a shard unavailable exception. Moreover, we no longer need to swallow these unavailable exceptions.  Relates #28571 Closes #33613
Optimized scalar observeOn/subscribeOn
rename default compiler config to basic to match configuration name
[TEST] suppress sysout checks since CI runs with debug enabled
Add MaterializedResult.toPage()
Remove empty PartitionedLookupSourceFactory.close() method
Make HashAggregationBuilder implement AutoCloseable  This is required for future spilling. Close method will have to clean up spilled pages.
Replace usages of deprecated Objects.toStringHelper() with MoreObjects.toStringHelper(). ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=69572761
Trivial refactoring: optimize imports
Revised IllegalArgumentException handling for Formatter parse calls  Issue: SPR-14661
removed exception printing in tests
bug 13866: return publicIp info in listVms api response when vm is linked to public ip via static nat Reviewed-by: Frank
python: fix PEX executor when pointing to a rule  Summary: - Make sure to add the build target to parse time deps. - For tests, export all the binary's executable commands deps as   runtime deps, as they all need to be present to run.  Test Plan: added unittests  Reviewed By: Coneko, sdwilsh  fb-gh-sync-id: 98925ca shipit-source-id: 98925ca
Don't do DNS lookups from GeoIpProcessor  There is no need to involve DNS in this!
[#5507] SingleThreadEventExecutor should reject call invoke*() from within the EventLoop.  Motivation:  ExecutorService.invoke*(...) methods may block by API definition. This can lead to deadlocks if called from inside the EventLoop in SingleThreadEventExecutor as it only has one Thread that does all the work.  Modifications:  Throw a RejectedExectionException if someone tries to call SingleThreadEventExecutor.invoke*(...) while in the EventLoop.  Result:  No more deadlock possible.
Add a LLVMFloatVectorToI64Node cast node  This change is in preparation for complex numbers.
[CAMEL-13114] Provide single Cookie header for multiple cookies
Introduce ProjectFilesystemDelegate.getDetailsForLogging()  Summary: This supersedes what was done in D5620740 to add more details in the Chrome trace about the `ProjectFilesystemDelegate` that was used. In particular, I worry about misspelling `eden.disable_sha1_fast_path` and it not having the desired effect, so this is a simple way to verify it.  Test Plan: Do a Buck build in Eden with and without `--config eden.disable_sha1_fast_path=true` and run the following after each run and verify it has the expected output:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  Reviewed By: ttsugriy  fbshipit-source-id: 6b54cca
Improve validation for blackhole table properties
rename Table.doGC to forceCleanup.  patch by Eric Evans; reviewed by jbellis for CASSANDRA-211
Use kernel API in token creator
Remove request type parameter from CCR actions  Relates #31405
Move SplitSource to split package
HTTP/2 Server Example No Response for HTTP/1.x Only Clients  Motiviation: The HTTP/2 server example just hangs when a client is using only HTTP with no ALPN or upgrade attempts. We should still send some kind of response.  Modifications: The HTTP/2 server example has a special handler to detect no upgrade HTTP clients and generate a response.  Result: Clients that just use HTTP with no upgrade will no appear hung when interacting with the HTTP/2 server example.
Move the option output formatting into LLVMOptions
Fixed CS for Camel-main
Update to latest Reactor 3.1 API changes  Issue: SPR-15318
[STORM-3206] validate topoConf only against Config.java during submission
Refactoring, less guava, more standard JDK
CAMEL-8561: Better component docs summary of components - we use javadoc from the endpoint class instead of component so its in the same source file as @UriEndpoint.
python: add versioning support  Summary: Implement appropariate description interfaces to make python rules support versioning.  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 2ad3dad
Make TasteOptionParser static
Clean up lamda refs with method refs instead. Remove abstract from reg service UI info
Update copyright year of changed files    See gh-20020
Align JavaVersion.NINE name with JDK versioning    See gh-17611
Add Redis Sentinel database support    See gh-12556
Adapt to deprecation of StringUtils.isEmpty(Object)    See gh-23774
Delay property source initialization till LoggingSystem is initialized    Previously, the initialization of StandardServletEnvironment's  property sources in SpringBootServletInitializer led to debug logging  calls being made before the LoggingSystem had been initialized. As a  result, the system's default configuration was used and, in the case  of Logback at least, the debug logging was output to System.out  in a war deployment.    This commit updates SpringBootServletInitializer to delay the  initialization of StandardServletEnvironment's property sources until  after the LoggingSystem has been initialized, but still in time for  active profiles to be configured via servlet context parameters  (see gh-9972).    Closes gh-13736
refactor SimpleQueryParser settings into separate class, add "lenient" option  Fixes #5011
Add some missing nullable annotations.
Fix session timeout default value    Update DEFAULT_SESSION_TIMEOUT to use TimeUnit.MINUTES.toSeconds(30)  rather than TimeUnit.SECONDS.toMinutes(30) which would always return  0.    See gh-2084  (cherry picked from commit b33bbd56)
Add links to page that explains The Observable Contract
Add links to page that explains The Observable Contract
Rename onReponse in ClusterInterceptor to onMessage (#5528)
Remove redundant handling of a null exchange from WebFluxTags.uri()    Closes gh-14504
Disable LoggersEndpoint if the logging system is disabled    Closes gh-11793
Restore that fields shadow fields from super class    This commit restores the shadowing behaviour of JUnit 4.12. Some users  of JUnit 4 have tests that rely on this behaviour. Their tests would  fail with JUnit 4.13.    This commit finally reverts 39b8a92d24e6c81e4fc614cdf13003ce17bbc166.  Some parts have already been reverted by  ed6813d3bbe2da4d67892f73e641fa80ab4d126e.
Querying the response content-length never does I/O.
Add some missing nullable annotations.
Polish modifier declaration ordering    Follow that Java language specification.
Add mediaTypes (extension to media type mapping) in MVC resources    Allows users to configure 'allowed' file extensions for controller  mappings, so that browsers will not switch to downloading 'f.txt'  (part of the recent RFD attack fixes in Spring MVC).    See gh-4220
Follow up fixes for #1596    Small test and doc fixes.
Add control connection timeout property for Cassandra    Closes gh-24189
Allow case insensitive logging.level properties    Fixes gh-3356
Disable LoggersEndpoint if the logging system is disabled    Closes gh-11793
Update after RSocket changes in Spring Framework    Spring Framework recently removed the `MessageHandlerAcceptor` (which is  a sub-class of `RSocketMessageHandler`).  Instead of implementing directly the `SocketAcceptor` contract, it now  exposes them through `clientAcceptor()` and `serverAcceptor()` methods.    See gh-17280
Add configuration property for Spring Kafka's missingTopicsFatal    See gh-16740
Apply customizers to build when created embedded Mongo client    Closes gh-11132
Remove ex.printStackTrace() in tests    Closes gh-13952
Apply customizers to build when created embedded Mongo client    Closes gh-11132
Fix SpringProfileDocumentMatcher negation bug    Prior to this commit SpringProfileDocumentMatcher was returning 'found'  anytime a negated profile was not found, even if there were positive  profile matches required and unsatisfied.    Closes gh-5747  See gh-4953
Ensure Flyway/Liquibase runs before Quartz    Add post processors to ensure that SchedulerFactoryBean and Scheduler  beans depend on the Flyway and Liquibase beans.    See gh-17539
Harmonize class visibility    Closes gh-19414
Auto-configure cors on WelcomePageHandlerMapping    Update `WebMvcAutoConfiguration` to automatically apply cors  configuration to the `WelcomePageHandlerMapping`.    Fixes gh-21048
Auto-configuration of reactive Spring Session
Update copyright year of changed files    See gh-20020
Resolve placeholders in @ConfigurationProperties prefix
Remove ordering dependence from tests that create embedded databases    Closes gh-15423
rename the serviceStore to metadataReport; default MetadataReportFactory to redis
RestProtocol will be failed to export. (#2965)    * [REST] make the model init before export    * add line return to ActiveLimitFilter for checkstyle rule
rename the serviceStore to metadataReport; default MetadataReportFactory to redis
KAFKA-3740: Part I: expose StreamConfig properties in ProcessorContext  This is the part I of the work to add the StreamsConfig to ProcessorContext.  We need to access StreamsConfig in the ProcessorContext so other components (e.g. RocksDBWindowStore or LRUCache can retrieve config parameter from application)  Author: Henry Cai <hcai@pinterest.com>  Reviewers: Guozhang Wang <wangguoz@gmail.com>  Closes #1553 from HenryCaiHaiying/config
Forbid response bodies on HTTP 204 and 205 responses.
Allow an HttpClient to have a proxy be set
Use standard exception cause handling in RetrofitError.    Improves RetrofitError.toString() output.
Add links to page that explains The Observable Contract
Fix the mocks in a couple of tests.  r5681
Node Stats: add max content length to http info
rename the serviceStore to metadataReport; default MetadataReportFactory to redis
Whitelist extension if present in the request mapping  We know skip the Content-Disposition header for any extension if the chosen request mapping explicitly contains the URl extension.  Issue: SPR-13629
Add support for @GrabResolver to AetherGrapeEngine    @GrabResolver can now be used to add a repository to the list that is  used for dependency resolution. Any repository that is added via the  annotation will then be available for the lifetime of the  AetherGrapeEngine instance. In reality, this equates to the lifetime  of the Boot application. This is in keeping with the documented default  behaviour [1]: 'By default, the grape subsystem is shared globally, so  added resolvers will become available for any subsequent grab calls'.    [1] - http://groovy.codehaus.org/api/groovy/lang/GrabResolver.html    [bs-345]  [60145036]
Add javadoc to some classes in org.junit.experimental.theories
Cleanup TemporaryFolderUsageTest and add it to AllTests suite
Restore that fields shadow fields from super class    This commit restores the shadowing behaviour of JUnit 4.12. Some users  of JUnit 4 have tests that rely on this behaviour. Their tests would  fail with JUnit 4.13.    This commit finally reverts 39b8a92d24e6c81e4fc614cdf13003ce17bbc166.  Some parts have already been reverted by  ed6813d3bbe2da4d67892f73e641fa80ab4d126e.
Cleanup TemporaryFolderUsageTest and add it to AllTests suite
Add missing @Override annotations
Polish 'Improve details of neo4h health indicator'    See gh-20356
Change order of loggingCodecCustomizer    It is set to 0 so that users' customizers can be positioned before and  after it.    Fixes gh-14723
Skip scoped targets when determining endpoints    Update `EndpointDiscoverer` to filter out scoped target beans when  finding endpoints.    Closes gh-15182
Add mediaTypes (extension to media type mapping) in MVC resources    Allows users to configure 'allowed' file extensions for controller  mappings, so that browsers will not switch to downloading 'f.txt'  (part of the recent RFD attack fixes in Spring MVC).    See gh-4220
Handle wrapper types in Env actuator    This commit modifies the actuator `EnvironmentEndpoint` to allow  primitive wrapper types to be serialized in the response data  structure.    Fixes gh-24307
Polish 'Avoid string concatenation inside StringBuilder append()'    Closes gh-15589
OnClassCondition report should only include relevant condition    Closes gh-11086
Polish 'Simplify code'    See gh-18342
Changed exception message method name    Changed method name from setMissingExceptionMessage to  reportMissingExceptionWithMessage to be more consistent with the  existing API.
Add javaodcs about @IntegrationTest to SpringApplicationContextLoader    See gh-499
RestProtocol will be failed to export. (#2965)    * [REST] make the model init before export    * add line return to ActiveLimitFilter for checkstyle rule
Adapt to deprecation of StringUtils.isEmpty(Object)    See gh-23774
Add test for handling InitializationError    The code was changed by commit 0804ef4cd09b0e94783a9882c60914e22fca5108  but unfortunately the test was not part of the commit. The test is based  on Philip Graf's test in pull request #1065.    Co-authored-by: Philip Graf <git@acanda.ch>
Remove unused imports
Fix use generic invocation via API , lost 'version' value [#4784] (#4787)    * Fix use generic invocation via API , lost 'version' value [#4784]    * Modify unit test
rename the serviceStore to metadataReport; default MetadataReportFactory to redis
Querying the response content-length never does I/O.
Rename onReponse in ClusterInterceptor to onMessage (#5528)
Add some missing nullable annotations.
Make primary use of ConfigLoader static
Missing commit: fix compilation issues and broken guava import.
Change generics on ExpectedException.expectCause().    The previous generics (Matcher<? extends Throwable>) would not allow  you do use matchers on Object, like notNullValue().    Fixes #1073
[CALCITE-1394] Javadoc warnings due to CoreMatchers.containsString and mockito-all  Change occurrences of CoreMatchers.containsString to StringContains.containsString, and CoreMatchers.startsWith to StringStartsWith.startsWith, to be compatible with the version of hamcrest inside mockito-all.
Add ChannelPipeline.first/lastContext() / Cleanup
Polish modifier declaration ordering    Follow that Java language specification.
Querying the response content-length never does I/O.
Change order of loggingCodecCustomizer    It is set to 0 so that users' customizers can be positioned before and  after it.    Fixes gh-14723
