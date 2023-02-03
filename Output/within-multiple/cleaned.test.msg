Make management.port default to server.port
Replace getParameterTypes().length with getParameterCount()    Closes gh-10377
Test support for HTTP range requests to endpoints returning a Resource    Closes gh-9978
Polish and reinstate usage of FileSystemUtils.deleteRecursively    Closes gh-9942
Use standard bean validation annotations that are new in 2.0    See gh-9969
Polish 'Remove usage of `HttpStatus` in Web Endpoints'    Closes gh-10350
Polish 'Improve Spring Session sample'    Closes gh-10351
Remove usage of `HttpStatus` in Web Endpoints    See gh-10350
Duplicate values should bind properly to List    Fixes gh-10106
[bs-87] Add /dump endpoint    * Just dumps ThreadInfo, simple but effective  * Implementation is part of TraceEndpoint    [Fixes #49056831]
Remove runComponents from SpringApplication    It was basically duplicating run(Object[], String[]) - unless  there is some harm in registering a non-component with the context  that I haven't seen yet.
Polish 'Fix handling of empty/null arguments'    Closes gh-9916
[bs-47] Add default command line args to SpringApplication    * See SpringApplication.setDefaultCommandLineArgs  * Assumes command line is in 'simple' form (TODO: if we  need JOpt etc. support then the command line args parsing from  Spring needs to be exposed)  * If defaults are provided the command line might be re-ordered  slightly (non-option args come after option args)  * Allows custom application.properties file names to be specified  as a side effect (--spring.config.name=... or  --spring.config.location=...}.    [Fixes #48284369]
[bs-62] Add assertions to CLI integration tests    [Fixes #48658503]
Rework Lettuce configuration to use new client pooling config API    Closes gh-9538
Configure SessionRepositoryFilter with a custom SessionRepository    This commit makes sure that customizations on the  SessionRepositoryFilter are also applied when the user provides its  own SessionRepository.    Closes gh-10254
Rework health response structure to eliminate chance of key clashes    Previously, if a health's details contained a key named status (either  because an indicator bean was named statusHealthIndicator or an  indicator added an entry named status to its details) this would  clash with the health's own status as the details were serialized as  siblings of the status field.    This commit updates Health to remove @JsonAnyGetter from getDetails().  This means that all of a Health's details will now be nested within  a separate details field, thereby preventing a possible clash with  the status field.    Closes gh-10249
Restore `endpoints.env.keys-to-sanitize` binding    Closes gh-10174
Add 'onClass' condition on web server auto-configurations    This commit adds new Conditional annotations on auto-configurations  creating the Servlet/Reactive web servers. These conditions only depend  on request primitives used by the servers themselves and aren't  framework specific.    Closes gh-10163
Discover endpoints in parent context    Closes gh-10144
Close reactive Redis connection after health check    Closes gh-10153
Change default order of AutoConfigureOrder to 0    Previously, AutoConfigureOrder defaulted to Ordered.LOWEST_PRECEDENCE.  This made is impossible for an individual auto-configuration to  indicate that it wanted to go 'last', i.e. after any  auto-configuration classes that didn't not specify an order, or  specified an order other than LOWEST_PRECEDENCE.    This commit changes to default to 0, allowing a single   auto-configuration to easily indicate that it should go last.     Closes gh-10142
Allow an operation to specify the media types that it produces    Closes gh-10118
Polish adapt to and from Mono conversion    See gh-10112
Avoid substring() invocation when the result is itself    Closes gh-10077
Make BootRunIntegrationTests compatible with Java 9    Closes gh-10019
Improve structure of Flyway endpoint response, add missing properties    Closes gh-9973
Wait for process to exit when stopping DevTools integration test apps
Require separate management port to use management context path of /    Closes gh-9898
Revert 'Nested Map should not bind to null'    This reverts commit 5406567783ab2cc2dd9295c7b2281a0d086f4f41.
Fix compatibility with JUnit's ExpectedException    This commit ensures that an exception that is thrown as part of the  `ContextConsumer` callback is thrown as is.    Closes gh-9878
Polish 'Allow to customize OkHttpClient.Builder'    Closes gh-9669
Allow to customize OkHttpClient.Builder    This commit enables to auto-configure OkHttpClient.Builder in  InfluxDbAutoConfiguration if it is available.    See gh-9669
Move port in use exception test as it does not apply to Tomcat    See gh-8737
Add system property support to TestPropertyValues    Update `TestPropertyValues` so that it can also be used to update  system properties.  Properties are set before the call is made and  restored to their previous value afterwards.    Fixes gh-9792
Align to API change of Spring Data Cassandra
Expose AssertionErrors as is    Closes gh-9760
Add support to ContextLoader for configuring context's parent    Closes gh-9749
Polish 'Align with breaking API changes in RedisCacheManager'    Closes gh-9734
Polish 'Rename HCP to SAP'    Closes gh-9747
Align with breaking API changes in RedisCacheManager    See gh-9734
Rename HCP to SAP    See gh-9747
Allow to specify multiple auto-configs in autoConfigFirst
Properly set redis password for Cluster and Sentinel config    Closes gh-9583
Upgrade to Tomcat 8.5.16    This commit uses the replacement for deprecated APIs in 8.5.16 to ease  a forward compatibility with Tomcat 9    Closes gh-9611
Remove dead code
Add prefix to all properties in maven plugin    This commit add prefix `spring-boot` to all Mojo's properties.    See gh-9567
Alias spring.datasource.name to Hikari's poolName property    Closes gh-9547
Polish 'Add support for CustomConversions with Cassandra'    Closes gh-8534
Add support for CustomConversions with Cassandra    This commit add the support for CustomConversions in  spring-data-cassandra. To customize, bean just need to be declared and  it will be auto-configured.    See gh-8534
Set Lettuce shutdown timeout properly    We now properly set the Lettuce client shutdown for unpooled and pooled  configuration.    See gh-9526
Configure Derby to write its log in the target directory
Polish 'Use Redis client configuration to configure connection factories'    In particular, the Lettuce code is not using the new builder API when  pooling is required. This will be fixed in a future milestone.    Closes gh-9510
Add SAP Hana Cloud Platform to CloudPlatform    Closes gh-9487
Fix `QuartzAutoConfigurtion` failure with multiple `Executor` beans    `QuartzAutoConfigurtion` currently blows up if there are multiple  `Executor` beans in the context.    This commit changes the configuration to retrieve `Executor` bean using  `ObjectProvider#getIfUnique` which won't fail in scenarios where there  are multiple `Executor` beans with none marked as `@Primary`.    Closes gh-9434
Use ObjectFactory rather than Usages to create Usage on Gradle 4.0    Usages has been removed in Gradle 4.0 and replaced with the use of  a new ObjectFactory API that can be used to create a Usage. This  commit uses reflection to access the ObjectFactory from the Project  and use it to create a Usage when an attempt to use Usages fails.    Closes gh-9364
Replace `WebMvcRegistrationsAdapter` with default methods    Closes gh-9340
Clear configurationProperty from context before bind    Fixes gh-9295
Adapt to relocated packages in Spring Data Cassandra    See gh-9291
Add support for binding to immutable collection    Fixes gh-9290
Allow nested square brackets in map key when binding    Fixes gh-3202
Use try-with-resources to close resources automatically    See gh-8045
Display unconditional classes in auto-config endpoint    Closes gh-9227
Modify return on post /loggers to HTTP 204    This commit alter the return http status code from 200 to 204.    Closes gh-8919
Add missing tests for Collection and Map binders
Restrict scalars in MapBinder to java.lang    Fixes gh-9209
Make SpringApplicationJsonEnvironmentPostProcessor origin aware    Closes gh-8932
Remove redundant uses of @NestedConfigurationProperty    Closes gh-9216
Avoid exposing `spring.resources.favicon-locations` as a property    Closes gh-9214
Properties treated as Map<String, String> for bind    Fixes gh-9152
Ensure that WebApplicationType.NONE results in a non-web environment    Following the changes made in a7f148091eb9 the environment was being  bound to the SpringApplication instance after it had, if necessary  being converted to a standard, i.e non-web environment. This meant  that if a property in the environment set the web application type  to NONE it would have no effect on the type of environment used by  the application.    This commit reorders the binding of the environment to the  Spring Application instance so that it happens before the environment  is potentially converted.    Closes gh-9161
Improve `HashMapSessionConfiguration`    This commit updates `MapSessionRepository` bean definition return type  and applies equivalent change to `SessionAutoConfigurationTests`.    These changes also ensure compatibility with Spring Session 2.0 which  will merge `ExpiringSession` API with `Session` API.    Closes gh-9145
Remove redundant ordering from ImportBeanDefinitionRegistrar implementations    Closes gh-8603
Update samples following API changes in Spring Data snapshots    findOne is now findById
Update CLI's tests following introduction of spring-jcl module    The new spring-jcl module is now a dependency of spring-core. This  commit updates the CLI's dependency resolution-related tests to  account for the new dependency.
Make argument ordering consistent across web server initialized events
Update port file writer to support reactive servers    Closes gh-8531
Stop setting org.jboss.logging.provider when using Logback    This fix for gh-1928 to address a problemw with Log4j was to set  a system property that forces JBoss Logging to use SLF4J. This has the  unwanted side-effect of crashing Glassfish. We no longer support Log4j  so gh-1928 is no longer a concern. However, you can shoot yourself in  the foot by having Logback and Log4j2 on the classpath in that  particular order, but the latter has to be without its  log4j-slf4j-impl module. At this point you don't get any warnings or  error output at startup, but JBoss Logging uses Log4j2 while  everything else uses SLF4J and Logback. As a result, any logging  that's performed through JBoss Logging is silently lost.    Given the problems caused by setting the system property, and the  contrived nature of the arrangement that's necessary to cause a  problem when the property isn't set, this commit updates  LogbackLoggingSystem so that the system property is no longer set.    Closes gh-8669
Replace lambdas with method references    Closes gh-9049
Polish configuration properties and binder    Fix a few issues and try a few more things to improve performance.    See gh-9000
Add missing tests
Don't rely on ConfigurationPropertyName exceptions    Update `ConfigurationPropertySourcesPropertySource` to no longer use  `try/catch` when checking for valid names. A new `isValid` method has  been introduced to `ConfigurationPropertyName` which is offers better  performance.    Fixes gh-9058
Ignore nested with NoUnboundElementsBindHandler    Update `NoUnboundElementsBindHandler` to also support ignoring  nested properties. This change is required to allow the  `NoUnboundElementsBindHandler` to be used alongside the  `IgnoreNestedPropertiesBindHandler`.    See gh-9000
Group tasks and provide descriptions for tasks and configurations    Closes gh-8817
Use new configuration properties in samples    Update `spring-boot-samples` to use the new configuration properties  support.    See gh-9000
Use new configuration properties in devtools    Update `spring-boot-devtools` to use the new configuration properties  support.    See gh-9000
Use new configuration properties in spring-boot-test    Update `spring-boot-test` to use the new configuration properties  support.    See gh-9000
Attach ConfigurationPropertiesSource    Update `SpringApplication` to automatically attached the  `ConfigurationPropertiesSource` when a `SpringApplication` runs.    See gh-4910
Make Audit events MVC endpoint `after` parameter required    Closes gh-9002
Rename cassandra bean names    Closes gh-8982
Deprecate relaxed property concepts    Deprecate `RelaxedDataBinder`, `RelaxedPropertyResolver` and related  classes in preparation for the updated configuration properties binder  work.    See gh-9000
Allow bootWar to package webapp resources in dirs that overlap loader    Previously, the presence of a src/main/webapp/org directory would  cause the execution of BootWar to fail due to an attempt to write  a duplicate org/ entry to the zip output stream.    This commit updates BootZipCopyAction so that FileTreeElements that  match a directory entry created while writing the loader classes are  skipped.    Closes gh-8972
Fix WebClientTest calls    Update calls to WebClientTest following upstream changes.
Harmonize Solr status health details    This commit renames the `solrStatus` property of the Solr health indicator  to `status` and its type. This is now an integer corresponding to the  status Solr sent rather than a String that can be 'OK' when all is well.    Closes gh-8878
Make sure Admin MBean works also with webflux    This commit improves `SpringApplicationAdminMXBeanRegistrar` so that it  work with traditional Servlet-based app but also with Spring WebFlux.    Closes gh-8533
Use JDK hashCode() variants for primitives    See gh-8768
Include directory entries when copying loader into a Boot archive    See gh-8816
Polish the Gradle plugin's javadoc
Update WebFlux auto-configuration following recent API changes
Don't write the default loader classes when a custom launcher is used
Use a convention mapping for resolving main class from the classpath
Align with latest Neo4j OGM 3.0 snapshots    See gh-8687
React to the Java plugin being applied rather than always applying it
Revert 'Change default for new_generator_mappings to true'    This reverts commit 735dbc4583480475d1299ca56bb5eb0f609a7267.
Change default for new_generator_mappings to true    Closes gh-7612
Make ReactiveWebServerFactory functional interface    Update `ReactiveWebServerFactory` to contain only a single method.    Fixes gh-8559
Fix Configuration processor test tangle    Move `Metadata` test class to fix a package tangle in the test code.    Fixes gh-8613
Remove useless checked exception throw clause
Enable Tomcat, Jetty and Undertow reactive auto-conf    Closes gh-8403
Hide javax.servlet.SessionTrackingMode    The server's session can now be configured in both a servlet and a  reactive environment. The latter has not requirement on the servlet API  and this commit removes the requirement to the `SessionTrackingMode`  enum.    Closes gh-8402
Move RandomValuePropertySource into org.springframework.boot.env    Closes gh-8249
Align Security filter dispatcher types with Spring Security's defaults    Closes gh-8289
Align default Filter dispatcher types with the Servlet spec    The Servlet spec states that the default is REQUEST. This commit  aligns Spring Boot with that default.    Closes gh-7467
Use DefaultUriBuilderFactory instead of DefaultUriTemplateHandler    Closes gh-8247
Restore couchbase support    This commit effectively reverts the changes that were applied to  workaround the breakage in spring-data-couchbase.    Closes gh-8200
Reuse `ConfigurationProperties` bean defined in parent    This commit makes sure that if a `ConfigurationProperties` annotated bean  already exists in the parent context, a new one is not created in the  child anymore.    This makes sure that a single bean exists in a parent/child hierarchy if  `@EnableConfigurationProperties` is processed in both context on the same  class.    Closes gh-8187
Clear system property in SpringApplicationTests    See gh-8101  Closes gh-8161
Remove usage of Assert.notNull(Object)    This commit updates the Spring Boot codebase to adapt to the removal of  `Assert.notNull(Object)` in SPR-15196.    See gh-8140
Add @FunctionalInterface to remaining public and protected interfaces    See gh-6857
Replace and remove deprecated API usage
Use directExecutorService instead of sameThreadExecutor  sameThreadExecutor is deprecated in Guava 20. 
Painless: Special Case def (#32871)  This removes def from the classes map in PainlessLookup and instead always special  cases it. This prevents potential calls against the def type that shouldn't be made and  forces all cases of def throughout Painless code to be special cased.
Trivial refactoring: remove unused imports 
Tests: Add type-unrestricted version of field mapper getter to SearchContext.  This fixes an NPE when using TestSearchContext in SignificanceHeuristicTests. 
Fix incorrect stream property derivations from GroupIdNode  AddExchanges and AddLocalExchanges were inconsistent in the way that properties were derived for the GroupIdNode. StreamPropertyDerivations incorrectly passed through all child properties, when in fact the GroupIdNode destroys partitioning properties on grouping columns that are not common to all grouping sets. In some cases this led to incorrect results. We now use the same logic in PropertyDerivations and StreamPropertyDerivations. 
Added license header 
Exposes the algorithm which finds paths of a certain length in GraphAlgoFactory (it's just the ShortestPath algo with an option sent to it)   
CLOUDSTACK-1668: Fix IP conflict in VPC tier  Currently, allPossibleIps return the Ip lists which include the gateway, so we need to remove gateway ip from this list.  Now, for non-VPC network it works, because NetUtils.getAllIpsFromCidr return the Ip lists which do not include the first IP of the network (like 192.168.0.1). We need too add the first IP into the returned Ip list, because it can be used for VM if it is not the gateway IP (for example, VPC networks).  The corresponding patch for 4.0.1 has been posted on https://reviews.apache.org/r/9923/  Signed-off-by: Chip Childers <chip.childers@gmail.com> 
replaced invalid entity "&nsbp;" with simple space in java docs 
clean up hz config 
Sets cursor exception on bad index read  so that such will be thrown as real exceptions, i.e. treated as tree inconsistencies, after consistent read. 
Remove duplication of Optional API behavior.  get() throws NSE when absent and orElse(T) returns the provided value when absent. 
add more tests 
[#787] Move the socks package to the right place 
removed unnecessary logging 
OM-DSL: formatting changes. 
Fix compilation error due to airlift change  Airlift 0.113 changed some interfaces to use Java's Optional instead of Guava's, which broke some usages when we updated to that version 
More cleanup. 
Adds metadata to rewritten aggregations (#28185)  * Adds metadata to rewritten aggregations  Previous to this change, if any filters in the filters aggregation were rewritten, the rewritten version of the FiltersAggregationBuilder would not contain the metadata form the original. This is because `AbstractAggregationBuilder.getMetadata()` returns an empty map when not metadata is set.  Closes #28170  * Always set metadata when rewritten 
Add baToHexBytes method to avoid unnecessary conversion via string  
Remove unnecessary cast   
Make fillInStackTrace final and non-synchronized in exceptions that do not need stack trace. 
removed uses of Debug.forceDump that pollute test logs 
Cleanup inspection warnings: MissingOverrideAnnotation 
Polish PathVariableMapMethodArgumentResolver  Return an empty map when there are no path variables, rather than raising an exception. This is consistent with similar resolvers for extracting headers and request parameters.  Issue: SPR-9289 
Object and Type parsing: Fix include_in_all in type  include_in_all can also be set on type level (root object). This fixes a regression introduced  in #6093  closes #6304 
Fix streaming for JDBC-based connectors  Because the JDBC base query builder was changed in #4651 to use prepared statements, the JdbcClient instance has no chance to to customize creation of the statement.  Here we add a new method, getPreparedStatement, that implementors can override. The query builder buildSql function uses this function to create new prepared statements, rather than creating them directly on the connection object.  Since #4651 the JDBC connectors no longer use getStatement, so these have been removed both from JdbcClient and all implementors, and proper getPreparedStatement methods have been added to the MySQL and PostgreSQL connectors. 
TEST: write ops should execute under shard permit (#28966)  Currently ESIndexLevelReplicationTestCase executes write operations without acquiring  index shard permit. This may prevent the primary term on replica from being updated or cause a race between resync and indexing on primary. This commit ensures that write operations are always executed under shard permit like the production code.
record an OptionDescriptor in an OptionValue so that it can be queried for a name 
Fixed loading of large data split in multiple ORecordBytes by calling the record.detach(), issue 179 
MAHOUT-176: Refactor out VectorIterable in favor of Iterable<Vector>  
Remove unused SourcePathResolver from PrebuiltNativeLibrary  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 35273bb 
Revert processing change  The close refactoring is enough to ensure connections are properly closed.
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=55171 If the client closed the connection, the write of any remainign data in the buffer in AbstractServletOutputStream would fail but the remote endpoint was not notified. This meant that blocking writes would block for ever eventually locking up the entire server.  
Remove unused interface method as promised in an earlier diff.  Test Plan: sandcastle 
Fix the incorrect usage/value of 'Connection: upgrade'  Motivation:  HttpClientUpgradeHandler uses HttpHeaderNames.UPGRADE as the value of the 'Connection' header, which is incorrect. It should use HttpHeaderValues.UPGRADE instead (note Names vs Values.)  Also, HttpHeaderValues.UPGRADE should be 'upgrade' rather than 'Upgrade', as defined in:  - https://tools.ietf.org/html/rfc7230#section-6.7  Modifications:  - Use HttpHeaderValues.UPGRADE for a 'Connection' header - Lowercase the value of HttpHeaderValues.UPGRADE  Result:  - Fixes #4508 - Correct behavior 
Make getSupportedAnnotationTypes more robust. 
Rename test classes to match Test* convention 
some cleanups suggested by @uschindler and break some long lines 
Convert some tests to junit 4 style and add test timeouts.  
Add missing code for closing the pageCache when used in migration/tools 
JsBundleGenrule/skipResources: don't exclude bundle on android  Summary: `skip_resources = True` would also prevent JS bundles from being included into apk. Fix in here.  Test Plan: - Adapted unit tests  Reviewed By: michalgr  fbshipit-source-id: 9ae95e9 
CAMEL-7375 Removed the @author 
Convert SourceControlInfo to @BuckStyleValue  Summary: - migrates to the new style of immutable - replaces `.of()` with constructor calls  Reviewed By: bobyangyf  fbshipit-source-id: ef1ccb602b 
[fixed] documentation in Transform [added] ComboBox.setSelection(), what was i thinking... 
rename config-option from   insert_guard to enable_execution_guard 
TIKA-476: Add page count to metadata  Use the xmpPTg:NPages property for the MS Office page count metadata  
Remove deprecated code  
SWIFT : remove template_zone_ref when delete template 
Changed visibility of Lwjgl3Window, that way people can post window specific runnables 
Add suppress warnings annotation for unused parameter. 
Improve names of GetStackSpace factory methods.  
Update PMD to 5.5.1, removed unused jars  Summary: This updated version handles java 8 syntax much better.  I put this together by deleting all the jars, and putting them in from the release zip one by one till I get no more classloader errors.  Test Plan: ant pmd  Reviewed By: Coneko  fbshipit-source-id: b3b233f 
pattern replace with empty "" setting fails we should default the replacement to "", since in the settings, if its set to "", we remove the setting 
Suppress warnings in tests  This commit suppresses warnings in test classes that were polluting the Gradle build output. 
SimonStewart: Cleaning up some compilation warnings  r5235 
Deprecate IncompleteFlushException as its not used anymore 
[GR-10964] Move *Internal options to the same category (DEBUG). 
Update VectorUtil to print out unescaped schema paths. 
Clean up javadoc issues 
[BEAM-743] JdbcIO deals right getConnection() to use with DBCP BasicDataSource 
More common AcknowledgedRestResponseActionListener  Introduced use of AcknowledgedRestResponseActionListener in put/delete alias & delete index 
Remove now unnecessary code 
Watcher: Add ssl.trust email account setting (#31684)  In order to allow users to specify hosts, where SSL is always trusted, this setting is exposed. Otherwise the system keystore needs to be configured properly.  For more info see https://javaee.github.io/javamail/docs/api/com/sun/mail/smtp/package-summary.html
further improvements to the sp code, especially for the local storage case 
removed unnecessary String creation 
TargetNode's equals & hashcode go back to default  Summary:TargetNode equals() and hashcode() don't take into account the contents of the Arg. The reason the current implementation of these method worked up till now is because the DaemonicParserState would only allow a single instance of a TargetNode to be associated with a given BuildTarget, therefore the BuildTarget was the unique identity of the TargetNode.  The current implementations of hashCode and equals make it impossible to use the TargetNode as a 'key' for caching the ActionGraph, as two TargetNodes with different Args will be equal as long as their BuildTargets match. Using the default implementations derived from Object solves that issue. The downside of this approach is that we are overly-pessimistic: TargetNodes with equal Args will still appear as different, but this approach will serve for now.  Test Plan: CI  Reviewed By: marcinkosiba  fb-gh-sync-id: b934256 fbshipit-source-id: b934256 
Deleting unused imports
More example code to show usage of annotations based on MrHaki's Groovy Goodness blog posts (closes #275, closes #271)  * More examples for API doc readers to understand how to use the annotations. * Used HTML entity code for @-symbol instead of enclosing in {@code...} block. 
Reconcile GeoPoint toString and fromString methods  GeoPoint.toString prints as a json array of values, but resetFromString expects comma delimited. This commit reconciles the methods. 
Update incoming recoveries stats when shadow replica is reinitialized (#20612)  When an active shadow replica is reinitialized during primary promotion, the recovery stats that are used by the allocation decider settings `cluster.routing.allocation.node_concurrent_recoveries` and `cluster.routing.allocation.node_concurrent_incoming_recoveries` have to be updated.
Reflect 3.2=>3.1.2 backports in @since tags etc  Issue: SPR-9443, SPR-6847, SPR-9446, SPR-9444, SPR-9439, SPR-9302,        SPR-9507, SPR-9238, SPR-9397, SPR-9406, SPR-9502 
Cleanup GenericInfo initialization  
Moved writeOut() method into LockableWindow and renamed MappedPersistenceWindow#unmap() to writeOut() to be able to skip the instanceof check in those places calling it 
ResolvableType.getType() returns ParameterizedType when built with forClassWithGenerics  Issue: SPR-12701 
clean up rest config to use services 
use config cpp and cxxpp flags during xcode project generation  Summary: Is there any reason why target pp flags where included in target and config pp flags where not? In my case build done with buck build --config-file ... is different compare to buck project --config-file ... and then Xcode build  Reviewed By: williamtwilson  fbshipit-source-id: 2afa9ead51 
SQL: Don't allow inexact fields for MIN/MAX (#39563)  MIN/MAX on strings are supported and are implemented with TopAggs FIRST/LAST respectively, but they cannot operate on `text` fields without underlying `keyword` fields => inexact.  Follows: #39427
OmnibusRoots: exclude roots which don't support omnibus linking  Summary: Previously, we'd try to link nodes as omnibus roots even if the node blacklisted itself.  Test Plan: added test  Reviewed By: ttsugriy  fbshipit-source-id: 49bde75 
check the progress in case the index size has not been set yet... 
[BEAM-1948] Defend against absent Aggregators  Add protection against null pointer exception if aggregator key is not present in aggregatorSteps 
Relax declared field type for LoopEnd and LoopExit nodes  The declared type of the field cannot be LoopBeginNode, because loop explosion during partial evaluation can temporarily assign a non-loop begin. This node will then be deleted shortly after - but we still must not have type system violations for that short amount of time. 
Use TimeUnit for readability  
Clarify nomenclature; add PhrasePenalty to baseline feature set 
DefaultCxxPlatforms: Copy cflags to cppflags, cxxflags to cxxppflags  Summary: @andrewjcg and I agreed that compiler flags should automatically propagate to preprocessor flags (they all need to be duplicated otherwise).  Depends On D1855475  Test Plan: Unit test added. `ant java-test -Dtest.class=DefaultCxxPlatformsTest` 
Polish EmbeddedDatabaseBuilder  Minor improvements made during the triage of SPR-8817 
adding missing finals 
Improve static type safety of PinnedArray vs PinnedObjectArray. 
Improving parsing of extension list to be more intuitive WW-1715   
Allow to override how wrapped direct ByteBuffer are allocated to make it easier to extend 
Follow up to r1574785 - Ensure blockExternal init param is set - Remove unused constant  
Treat lldb as a tool  Summary: Resolve and pass lldb as a tool. This enables supporting scenarios where lldb is not available on the system, but is provided as part of the toolchain/platform.  Test Plan: unit test + manual test 
Wrong endpoint for  `cn-north-1`  Commit ea9609c642c84309b6df08bc6103cf227719c2ab does not work as expected.  China is not part of the [S3 regions](http://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region) but part of [Isolated Regions](http://docs.aws.amazon.com/general/latest/gr/isolated_regions.html).  The patch uses for S3 `s3-cn-north-1.amazonaws.com` which is wrong because in that case the end point is `s3.cn-north-1.amazonaws.com.cn`. Same goes for EC2 which was `ec2.cn-north-1.amazonaws.com` but should be `ec2.cn-north-1.amazonaws.com.cn`.  Related documentation:  * http://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region * http://docs.aws.amazon.com/general/latest/gr/rande.html#ec2_region * http://docs.aws.amazon.com/general/latest/gr/isolated_regions.html  Closing #156 (cherry picked from commit 491a59b) (cherry picked from commit f12cacc) 
CAMEL-11021: Add missing docs 
Some more cleaning up of finish/rollback communication with master   
Java: Using CloseableHttpClient instead HttpClient to get rid of deprecated method calls 
Added log lines to log (debug level) acknowledgements regarding index alias creation and index state change 
Mark return values from ProjectFileSystem as Immutable  Summary: They're immutable (or treated as immutable) in any case. Better call this out in method signatures so that null-checking is simpler.  Test Plan: buck test --all 
Add debug log messages to Netty stack 
Appled Arvid's patch to prevent deadlocks for short-running tasks 
Use USE_NULL_FLAG for null convention in RowDistinctFromOperator  RowDistinctFromOperator should conform to the calling convention for IS DISTINCT FROM. 
TracingTaskListener: Handle it when analyze events are issued in batches  Summary: When invoking `javac` phases individually (e.g. enter then generate), analyze begin events are issued all together, followed by analyze end events all together. (Enter events were already like this.) This commit enables our trace cleaner to deal with that.  Test Plan: Updated unit test  Reviewed By: asp2insp  fbshipit-source-id: 7a08e57 
Refactor SystemTable isDistributed interface 
apply patch from https://issues.apache.org/jira/browse/AMQ-3067 with thanks and additional test  
Removes remaining references to CLOUDSDK_EXTRA_SCOPES  These were long unnecessary since https://code.google.com/p/google-cloud-sdk/issues/detail?id=128 and some references were already removed, but not all. ----Release Notes---- [] ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=103139474 
Fix time field extraction after upstream change (elastic/elasticsearch#873)  Elasticsearch changed doc_values of date fields to return a joda DateTime object. Thus, we need to call getMillis() to extract the epoch millis value.  Original commit: elastic/x-pack-elasticsearch@b992882af525e1043f5a7858dd9f07934a0649d2 
[java] Adding a test for extension installation and deinstallation in Firefox
Make table owner required  Guava Optional cannot be used in handles because Guava is not part of the SPI and thus they cannot be serialized due to being in a separate class loader. 
Adding support for accessing EC2 and S3 over an http proxy. This is configured using the network.proxyHost and network.proxyPort settings. 
Deleted ticket counts should include PGTs in the final cumulative count (#1987)  * Changed the deleteTicket(String) method on the org.jasig.cas.ticket.registry.TicketRegistry to return a integer that is the count of tickets (including child tickets) that were deleted.  * Fixed Codacy issues  * Fixed one final Codacy issue with org.apereo.cas.ticket.registry.InfinispanTicketRegistryTests  * Changed tests when ProxyGrantingTicket is created then check if it is of type org.apereo.cas.ticket.proxy.ProxyGrantingTicket  * Reported deleted ticket counts may not include PGTs in the final cumulative count.  This would not affect TGTs and STs. 
HIVE-2459. remove all @author tags from source (Ashutosh Chauhan via jvs)    
Removed warnings and unused packages 
ConfiguredCompilerFactory: Convenience constructor for empty extra classpath  Summary: I wnat `ConfiguredCompilerFactory` to be used for more than just Android rules. Other rules don't need a special extra classpath, so having to always pass  in the constructor is unnecessarily complicating.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: 69e4e1e 
Removed unnecessary argument 
Improve error message when parsing invalid bitcode files. 
Make AbstractHeaderVerification use AddsToRuleKey  Summary: Makes this use AddToRuleKey annotations instead of a custom appendToRuleKey method(). This slightly changes the logic such that even if the mode is IGNORE, the whitelist will be added to the rulekey, but I don't expect that to negatively affect anyone (it would be strange to be ignoring the verification and building with multiple different whitelists).  Reviewed By: jtorkkola  fbshipit-source-id: 94a537e 
formatted annotations more nicely 
MAHOUT-910 revamp sampling candidate strategy to expose sampling of items, items' users, and those users' items  
CAS-1335: Refactored exception handling logic to use new instances rather than static throws. 
CAMEL-1987: Easier to disable JMX. CAMEL-1965: Added retry for renaming and deleting files as Windows have potential problems here.  
test: Do not use random index writer as test expects a single segment check against right version 
Make StateInternals short state method defaulting to the implementation all runners use to simplify the contract the user has to implement 
[FLINK-7544] [REST] Make all path parameters mandatory 
Treat TransportService stopped error as node is closing (#39800)  If TransportService is stopped before a shard-failure request is sent but after the request is registered, TransportService will notify ReplicationOperation a TransportException with an error message: "transport stop, action: internal:cluster/shard/failure".  Relates #39584
[hotfix] Fix typo in some API comments (#7867)  * Fix typos in DataStream * merge other fixes into one PR 
Add proper getPositions implementation to specialty Blocks 
Make Lua resources loaded using the current class loader  Summary: Lua functionality was moved to a module (which is a stand-alone jar) with all its resources, but these resources are accessed using current thread's classloader, not the current class's classloader.  The fix is to use the current class as the loading point and change the location of resources to be relative.  Test Plan: Local testing  Reviewed By: ttsugriy  fbshipit-source-id: 02f1d3d 
Fix for https://jira.logicblaze.com/jira/browse/AMQ-501  - ActiveMQManagedConnectionFactory now implements equals() and hashCode()  - ActiveMQActivationSpec is now serializable.  
Change nanosBetween method  If the result of "end - start" is negative it is rather an incorrect measurement. Therefore it should not be recorded. 
move sniff related stuff to sniff package 
CLOUDSTACK-1253: Remove @author tag. 
Update license headers 
ingest: Use BiConsumer instead of Cunsumer to pass down the failed index request with throwable 
Issue #3891: reorganized doclet package inputs
Refactoring constructor that accepts FirefoxProfile 
Accept SKIPPED as a valid cache result type  Summary: Looks like AbstractAsynchronousCache will cancel all pending requests on the first failure and return them as SKIPPED result type. And so SKIPPED should be considered a valid final cache result type. I don't know how this possibly wasn't causing problems since that change, but it is now.  Reviewed By: LLITCHEV  fbshipit-source-id: 9924933fe2 
Removed duplicate code and unused imports which was causing build failure. 
Introduced "spring.jdbc.getParameterType.ignore" property  Issue: SPR-11386 
Change info to debug statement  This log line creates a huge amount of noise in the logs.  In addition with google charging for stackdriver I believe that this will cost a lot of $$'s 
Fix javadoc links and tags  Motivation:  There are some wrong links and tags in javadoc.  Modifications:  Fix the wrong links and tags in javadoc.  Result:  These links will work correctly in javadoc. 
Remove pointless generic constraint in getCxxPreprocessorDeps  Summary: Code cleanup.  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 727653d 
Use LinkedHash* when traversing graphs  Summary: Generally, we shouldn't be doing non-deterministic traversals of graphs as it too often leads to hard to debug issues.  Reviewed By: philipjameson  shipit-source-id: 378bb05fd0 
Use write aggregator from DataBufferUtils  This commit uses the newly introduced write aggregator from DataBufferUtils throughout WebFlux.  Issue: SPR-16351 
Start stop of page cache warmer. Track start of extension to be able to determine if warmer also needs to be shutdown. 
removed need of check for remote/embedded for avoid use of thread local 
Fix instrumentation apk desugaring (#2213)  Summary: Instrumentation apks were not being passed the full classpath for interface method desugaring due to the apkUnderTest's classpath being removed ahead of time from the dexing call. This change makes the full classpath available and ensures that instumentation apks are also correctly desugared by d8 when enabled. Pull Request resolved: https://github.com/facebook/buck/pull/2213  Reviewed By: styurin  Pulled By: styurin  fbshipit-source-id: 3029781f8d 
Value: simplify some `equals' and `hashcode' implementations even more 
CAMEL-10183: Camel-Aws: add list and delete buckets operations on the S3 Producer Endpoint - Fixed Spring Tests 
Fix checkstyle warnings (#1163)  * add OSGI metadata  * more default behavior  * add OSGI info  * whitespace  * fix checkstyle warnings 
Fix password comparison in UsernamePasswordToken.equals  The password comparison in the UsernamePasswordToken compares the instances password to itself instead of the other instances password.  Closes elastic/elasticsearch#405  Original commit: elastic/x-pack-elasticsearch@3cb5658edf6540f438478fe5481cab62a56d5769 
Allow customization of SpEL method resolution  This change introduces a protected ReflectiveMethodResolver#getMethods, allowing subclasses to specify additional static methods not declared directly on the type being evaluated. These methods then become candidates for filtering by any registered MethodFilters and ultimately become available within for use within SpEL expressions.  Issue: SPR-9038 
Explicitly require Project in Dataflow Options  Place the Validation.Required annotation on the getProject method to allow the PipelineOptionsValidator to verify that a project is provided in DataflowPipelineOptions, while not requiring it for all PipelineOptions interfaces that extend the GcpOptions class.  ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=96788059 
Table, set the cell widget size even when there is no widget. 
More information is gotten directly from the Traverser instance, rather than being passed as parameters to the ExpansionSourceImpl instances.   
Mute tests, update how begin shell command determine transaction keyword, add shell transaction termination test. 
add missing test, fix failure in couchdb (#3698)  
Rename dfs.domain-socket-path  The new name is hive.dfs.domain-socket-path. 
CAMEL-2441: Skipping test which requires online internet connection. Will be addressed in Camel 2.3 with a mocked server.  
Improve validation error message on PutMappingRequest 
Remove need for canHandle(...) in RecordSinkProvider 
Mark More values methods Internal  PCollectionTuple#ofPrimitiveOutputsInternal is internal.  TaggedPValue is internal. 
move the fields doc queue to a better package location 
GROOVY-5431: Allow @EqualsAndHashCode, @Canonical, @TupleConstructor, @ToString to use an array of Strings in addition to a comma separated String (fixed up a couple of missing cases plus unified excludes for AutoClone and AutoExternalize) 
SPR-6976 - Add debug log for HttpMessageConverter usage  
Remove unused imports  
Remove useless continue statements 
CAMEL-11611 - Adjusted the code to reflect the use of Apache Sshd 1.6.0 
Use "" for the default name for the rest route to make sure it doesn't try to lookup a component named "default".  Someday there might actually be a component named that.  :) 
Create VALUES with row values  This is often necessary in tests to have VALUES filled with some data rows, otherwise `QueryCardinalityUtil` will deem VALUES as scalar, affecting testing conditions. 
Make important security entities Serializable 
 Document the reasoning behind the 127-part limit, with an RFC reference.  Revision created by MOE tool push_codebase. MOE_MIGRATION=1109   
Debugger:  import cleanup in tests 
[runtime] Add docs to BufferPool classes 
 reformat  Revision created by MOE tool push_codebase. MOE_MIGRATION=2276   
add exit code to machine readable log  Summary: This adds the exit code of a command to the machine readable log.  Test Plan: Added the field to the integration test. Log example: `ExitCode {"exitcode:0}`.  Reviewed By: Coneko  fbshipit-source-id: a2346c6 
Removed some unnecessary test code 
[#2939] Fix SslContext usage in the examples for client side  Motivation:  We incorrectly used SslContext.newServerContext() in some places where a we needed a client context.  Modifications:  Use SslContext.newClientContext() when using ssl on the client side.  Result:  Working ssl client examples. 
Improved robustness of object serializer/deserializer 
fix bad merge; add overrideable CompactionIterator.getScanners for cleaner subclassing.  patch by jbellis  
Use a clean dir for the AbstractGenruleStep step in AndroidBinaryRule.  Summary: Previously this had been running at the root of the repo, like Genrule. This diff cleans up AndroidBinaryRule, and deletes the no-working-dir constructor that it had been using. Environment variables now need to be provided as absolute paths, since we're not in the root of the repo anymore. 
Convert ProjectBuildFileParserFactory to be non-static  Summary: This is a part in a series of changes to reduce complexity in `PerBuildState`.  Changing this factory to be non-static so that it can be passed as a parameter.  Reviewed By: philipjameson  fbshipit-source-id: 90d472f 
Tests: Fix CLI help checking tests under windows  As windows has different line endings and this has already been fixed by another test, the method has been moved into CliToolTestCase.  In addition one test has been removed, as it was redundant. 
SocksCmdRequest and SocksCmdResponse are trying to convert host from IDN for the non-DOMAIN address types  Motivation:  In the SocksCmdRequest and SocksCmdResponse constructors a host param converts from IDN to ascii compatible form regardless address type.  Modifications:  Use `IDN#toASCII` only for `DOMAIN` address type.  Result:  More correct host handling in socks commands. 
Add writableChannel to WritableResource  This commit introduces a `writableChannel()` method to `WritableResource`, defaulting to `Channels.newChannel`, but with overrides for file-based resources. 
Add getMaskWithSizePacked method for better shader compatibility checks. Mask encodes the vertex attributes count to compare. e.g. better shader compatibility with different BoneUsage vertex attribute counts 
Move duplicated code into utility method. 
Changed SearchCriteria2 to GenericQueryBuilder to reflect the same placement 
Improved HTTP Protocol management 
Internal: AdapterActionFuture should not set currentThread().interrupt()  If someone blocks on it and it is interrupted, we throw an ElasticsearchIllegalStateException. We should not set Thread.currentThread().interrupt(); in this case because we already communicate the interrupt through an exception.  Similar to #9001  Closes #9141 
add getRangeToEndPointMap to JMX.  Requires making Token and Range Serializable.  Patch by Eric Evans; reviewed by jbellis for CASSANDRA-211  
Use SESSION_NOT_RELIABLE when no messages received  When a WebSocket session is closed after not having received any messages, we'll use SESSION_NOT_RELIABLE to indicate to other parts of the session closing code not to send anything further (e.g. SockJS "Go Away!" frame).  Issue: SPR-11884 
move the ClusterWriter code to be in the correct package  
Revert "DefaultPromise make listeners not volatile"  This reverts commit 4d8132ff246c95cf677c525f8dfce6de00685842 as I missed something I want to discuss first. 
read compatibility support for ORecordFlat 
optimize get/delete/index response xcontent generation 
Move ProvisioningProfileStore.DEFAULT_READ_COMMAND to AppleConfig  Summary: Moving to a better place  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: 21553d8 
Reindex task state initialized before reindex (#45123)  Currently the process to execute a reindex process is tightly coupled to step of initializing the task state. This creates problems when this process is asynchronous. It is possible that the task state has not been initialized which prevents follow-up actions such as rethrottle. This commit separates the task initialization so that it can be executed as a first step in the persistent reindex process.
OServerCommandGetServerVersion updated: version retrieved through OConstants. 
returning the public ip address in the creation of firewall rule, for the UI to consume 
Allow the HTTP test to have extra time to wait for all messages to arrive as the transmission rate is much slower. 
[changed] Skin to prefer loading fonts relative to skin XML. [updated] ToggleButton and ComboBox text position to be centered better. [ 
TIKA-704: PDF and Outlook docs embedded in MS Word documents not parsed  Remove hidden Yamaha manual from the EmbeddedPDF.docx test file.  
Move StripStep to android package  Summary: Moving `StripStep` to `com.facebook.buck.android` package where it's only used.  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: 7b3d363 
Move resolveType to TreeBackedTypes  Summary: This is going to be useful in more places than just `TreeBackedTypeElement`.  Test Plan: CI  Reviewed By: asp2insp  fbshipit-source-id: c1d4145 
Stop using index populator after flip  It is possible for multiple indexes to be populated at the same time using single node store scan. This is done in MultipleIndexPopulator which contains multiple regular populators and delivers node property updates to relevant ones. All flippable index proxies are flipped at the same time after store scan completes.  Currently MultipleIndexPopulator closes individual populator after corresponding flippable proxy is fliped to online mode. At the same time populator is not removed from the list of populators. This could result in updates from other non yet flipped indexes be delivered to this closed populator.  This commit makes MultipleIndexPopulator remove IndexPopulation (abstraction that contains populator, proxy...) after it is flipped to online mode. This prevents MultipleIndexPopulator from writing irrelevant updates into online indexes. 
Use common impementation of createAllocatableRegisters  All the subclasses of RegisterAllocationConfig were overriding createAllocatableRegisters with a standard implementation that does not make assumptions about the order of the elements in the registers parameter. Using this generic implementation in RegisterAllocationConfig allows to remove all the overrides. 
Use separate translog dir in testDeleteWithFatalError  This test currently opens a new engine but shares the same translog directory of the previous opening engine. 
[moved] native lib loading to static block in JoglApplication 
Remove support for session properties as selection criteria 
Added improved debugging for incorrect message handling. 
camel-nats: Adjust header names. 
Support bucket-to-node update in DynamicLifespanScheduler  For recoverable grouped execution, a bucket is possible to change the assigned node if the previous run fails 
Removed ChannelBuffer.readBytes() which is useless 
Consistent naming style for enum  Motivation:  We should use camel-case for Enums.  Modifications:  Rename enums to use camel-case.  Result:  Consistent naming 
Rename utility class to ImageInfo and refine JavaDoc 
Add basic javadoc to spring-messaging annotations 
Changes for Bug 8997 - Fail to create volume from snapshot: NPE at "allocateToPool(FirstFitStoragePoolAllocator.java:63)  - ClusterId passed in could be null 
Fix broken build.  Summary: Test files were missing the license header.  Test Plan: buck test --all 
report error in case of constructor-arg index ambiguity (SPR-6329) 
All SFBuilder setters return 'this' & use varargs  Touch up a few setter methods across the SessionFactoryBuilder hierarchy that were still returning void.  Use varargs... syntax wherever possible. 
HIVE-5210: WebHCatJTShim implementations are missing Apache license headers (Jarek Jarcec Cecho via Brock Noland, Thejas Nair)  
Making sure each package-info profiles a @since tag 
add license headers to generated Thrift files.  patch by jbellis   
CLOUDSTACK-4882: list Clusters/pods/zones API not accounting for reserved in the used capacity percentage. Fix listCapacity cmd for reserved as well Signed off by : nitin mehta<nitin.mehta@citrix.com> 
Remove unused SourcePathResolver from BinaryWrapperRule  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 43a8a0f 
[streaming] StreamRecord copy updated 
Remove extranous non-null checks executer per row 
Move the stack nuller creation to the node factory facade 
Fix loop peeling problem with VirtualState: duplicate states deeply and only clear the parts of the exit's state that's not used by the duplicated nodes. 
Minor clean up of LabelSet 
Move across to the correct package 
Ensure fixed serialization order of InnerHitBuilder (#22820)  Usually the order in which we serialize sets and maps of things doesn't matter, but since InnerHitBuilder is part of SearchSourceBuilder, which is in turn used as a cache key in its bytes serialization, we need to ensure the order of all these fields when writing them to an output stream.  This adds tests and makes sure we iterate over the scriptField set and the childInnerHits map in a fixed order.  Closes #22808
Fix SQL formatting and view creation for grouping sets  View creation failed for some queries containing grouping sets due to the SQL not round-tripping. The formatted SQL had the expressions de-duplicated and arranged in an arbitrary order. 
Accept a wider range of responses from find and findAll using InvokerHelper support  Don't return null when find and findAll fails to find any matching nodes   
o Moved org.neo4j.commons -> org.neo4j.helpers o Merged org.neo4j.helpers.iterator.* -> org.neo4j.helpers.collection   since .iterator already contained iterator,iterable,collection stuff      This to avoid conflict if you happen to have neo4j-commons jar file on the classpath, even though you shouldn't have (it's deleted since some time ago).       
Refactor dispatches processing  Processors such as HTTP/2 need to process these per stream so it needs to be handled in the Processor, not in the SocketWrapper.  
DavidBurns removing the rest of the SetSelected and Toggle code so trunk can build  r13463 
Prepared for backport to 4.3.20 and 5.0.10  Issue: SPR-17295 
removed recursive save from ridbags, fixed multiple save of same record with dirty mananger. 
add value as last cause to error in takeWhile(predicate) 
Update Iterators.emptyIterator() @deprecated Javadoc to specify the replacement as ImmutableList.<T>of().iterator() rather than just ImmutableList.of().iterator(). The latter will basically never compile. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=73064832 
Check HTTP method before raising 415  This commit moves the check whether an HTTP method supports request body up to the base class so that all sub-classes can benefit (not just @RequestBody).  Issue: SPR-13176 
Take into account that executors can be provided, standard and non standard thread pool executors through config or programmatically. Hence we want to expose the correct values for curThread and curThreadBusy    
patch and test case for AMQ-514 to make BrokerInfo and the broker name visible to an ActiveMQConnection  
Replace <code> tags with {@code ...} constructs. #1555  Fixes `HtmlTagCanBeJavadocTag` inspection violations in test code.  Description: >Reports use of <code> tags in Javadoc comments. Since JDK1.5 these constructs may be replaced with {@code ...} constructs. This allows the use of angle brackets (<, >) inside the comment, instead of HTML character entities. 
Profiler: fixed reduntant metadata 
KAFKA-7476: Fix Date-based types in SchemaProjector  Various converters (AvroConverter and JsonConverter) produce a SchemaAndValue consisting of a logical schema type and a java.util.Date. This is a fix for SchemaProjector to properly handle the Date.  Author: Robert Yokota <rayokota@gmail.com>  Reviewers: Konstantine Karantasis <konstantine@confluent.io>, Ewen Cheslack-Postava <ewen@confluent.io>  Closes #5736 from rayokota/KAFKA-7476 
create NodeEnvironment outside of guice so if it fails, it fails early and does not takes ages with guice trying to create it per injection 
Bug 13962 - CloudRuntimeException: Failed to update keypairs on disk: cannot create key file null/.ssh/id_rsa  Changes for Script.java: 1. Even the script is non-timeout one, set default timeout to one hour. This avoid a wrongn script forever hang 2. When InterruptedException happens, check if timeout is really reached, if not, continue  status 13962: resolved fixed reviewed-by: Alex, Edison 
Moved WriteMessageQueue to the util package   
Issue #7540, code observations were fixed 
Fixing HtmlUnitDriver to enter RETURN and ENTER to a text area. Fixes issue 5890 
Removed unused imports 
 Add a wrap() method to Equivalences that returns objects whose equals() and hashCode() methods are implemented using and Equivalence and a value.  Revision created by MOE tool push_codebase. MOE_MIGRATION=816   
Rename WebTEL to ServletTEL  Renamed WebTestExecutionListener to ServletTestExecutionListener.
Oops. License headers  
clean up checkstyle issues 
[FLINK-10785] [tests] Upgrade FlinkKinesisConsumerMigrationTest to test restoring from 1.7.x 
Removed GraphDatabaseService#enableRemoteShell method(s). It doesn't belong in the graph database service interface and has been @Deprecated at least one major release. It now lives as a KernelExtension and to start it pass in enable_remote_shell=true config parameter to the graph database constructor and that extension will be loaded if it's available on the classpath. 
SimonStewart: Fixing a free that happens too early in the IE driver, which was causing JVM crashes. Also moving support classes to the same package to allow their visibility to be reduced.  r6312 
Ensure that the android device has a writable temp directory.  Summary: When installing software on an Android device, using the temp directory can be essential. Check that the temp directory is writable.  Test Plan: buck test --all 
Remove unused createFunctionDescriptor factory method 
CAS-1475: Refactoring username->service API  Taking into account Google apps alt username 
refactoring. If it gets like a bean and sets like a bean, then it is a bean. 
ChainingPrincipalResolver changes to allow overriding the Principal ID (#3371)  * Changing the behavior of ChainngPrincipalResolver so that the final principal is taken from the last resolved principal, and moving EchoingPrincipalResolver as the first resolver.  * Removing unused imports.  * Restoring block that counts distinct principal IDs so that it can be logged.  * Fixed mistake where expected and actual values are swapped in an assert statement in verifyChainingResolverOverwritePrincipal().  * Fix broken test verifyChainingResolverOverwrite().  * Fixed checkstyle line length violation.  * Fixed checkstyle final local variable violation. 
2.x: Improve the wording of the share() JavaDocs (#5824)  * 2.x: Improve the wording of the share() JavaDocs  * Fix typo. 
Add test cases for COLLATE on ORDER BY 
give machine code printed by the CFGPrinterObserver a cfg context so that does not depend on the LIR also being printed 
Cleanups to the PortableDirectRunner  Remove unused field. Make the runner public, so it can be used in the Job Service. 
Rename generateLea to generateAddress. 
Improve comparison between release and RC  Summary: Before, the comparison between "17.1" and "17.1_rc1" showed the 2nd as newer, which was wrong. Now the comparison happens correctly for both `rc-release` and `rc-rc` comparison. `preview` is still ignored.  Test Plan: Added/tweaked the unit tests to check for more cases in general.  Reviewed By: marcinkosiba  fbshipit-source-id: 6de6f11 
Addressing review feedback:  Ensure that we unsubscribe upstream "parent" when switching to alternate. That way upstream will trigger unsubscribe when the first Observable completes. Added test. Child should contain downstream subscriptions - not parent. 
Add missing javadoc tags, remove unused code and add some logging  
Moved a functional test back to the unit tests since we have a nice way of isolating test runs with *very* temporary files.  
Use stronger write-once semantics for Azure repository (#30437)  There's no need for an extra blobExists() call when writing a blob to the Azure service. Azure provides an option (with stronger consistency guarantees) on the upload method that guarantees that the blob that's uploaded does not already exist. This saves one network roundtrip.  Relates to #19749
Remove ToolchainProvider from constructor of AndroidBuildConfigDescription  Summary: Instead use `ToolchainProvider` from `BuildRuleCreationContext`.  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: d4856af 
Don't convert values toString for adding in fulltext/custom indexes. That's just a leftover from previous versions 
Move iterative rule tests from rule/test/ to rule/  The rule.test package is for the testing framework, not for the tests themselves. 
Fixes shard level snapshot metadata loading when index-N file is missing (#21813)  In making changes for the 5.0 version of snapshots, a bug was introduced where if an index-N file could not be found for an individual shard, the backup was to iterate over all snap-*.dat files in the shard folder to know which snapshots contain that shard's data, but in 5.0, reading the snap-*.dat files as backup was incorrectly passing in the blob name for the snap-*.dat file, thereby failing to load all index files for a given snapshot when the index-N file is missing.  This condition should be rare as there is no reason an index-N file should be absent (unless it was deleted or there was corruption reading the file), but nevertheless, this situation can be encountered and this commit fixes the bug by reading the correct snap-*.dat blob name in the shard data folder. 
Change log level when file is missing of scripting error occurs  
Add some finals where appropriate 
CLOUDSTACK-7920: NPE in the payload was causing the ssvm agent to not connect, fix it and also make sure that template/volume sync are robust that exceptions do not cause ssvm agent disconnect issues.  (cherry picked from commit 5213401ace08f4a5247a325e9d99a4a66bd7df11) Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>  Conflicts:     engine/storage/volume/src/org/apache/cloudstack/storage/volume/VolumeServiceImpl.java 
Fix two javadoc typos in Forwarding[Loading]Cache ("delegete" -> "delegate"). ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=102646747 
AMQ-1976, individual messages passing through a network bridge need an individual ack; for an individual ack, it is ok to have more than one message dispatched  
Fix TimeTrigger#isCompatible  Previously, TimeTrigger#isCompatible was true only when the time transformation functions were the same object, not merely equal transformations. Now when they are created via the primary builder methods, equality is decidable and compatibility is more useful.  ----Release Notes----  [] ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=113683351 
re-added a graph context to the debug scopes entered by Truffle partial evaluation and compilation so that -G:+DumpOnError works again 
Correctly apply boosts in query string.  This applies boosts to phrase queries generated by query string queries both in boolean and dismax mode. 
Optimize ImmutableCollection.Builder.addAll(ImmutableCollection) to use System.arraycopy when possible.  RELNOTES=n/a  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=174373581 
Fixed license headers in LWJGL3 backend 
Line cleanup. 
simplified class file path retrieval, added test 
Cleaned up formatting; added log statements 
Used UncheckedThrowingFuture in another place. Add tests for Error throwing now that that's easy to do.  This also eliminates a usage of Forwarding*Future: https://github.com/google/guava/issues/2416 ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=116853544 
fixing a bug with the initConnection. Some JMS providers have issues if getTopicConnectionFactory isn't called first.  
ignoring some htmlunit tests to get travis to pass 
Avoid sorting of zip_file.srcs  Summary: The order of sources in `zip_file` is important and it should not be changed during parsing.  This is not possible to test right now because `zip_file` fails when there are two files with the same in input, but this will be used later.  Reviewed By: mykola-semko  shipit-source-id: 18cba5b509 
Make sure properties are cleared between tests 
Polished. Removed unused Endpoint constructors  
Remove unused Pixmap's from AssetLoaders 
Javadoc improvements. 
Fixed Api doc for create/listNetworks 
Revert "Java: Using CloseableHttpClient instead HttpClient to get rid of deprecated method calls"  This reverts commit a01061a0bc7fe553caaeb1b0add2f92be87f2672. 
Change visibility of FileBasedSource subclass methods and fix return types for existing subclasses.  Limit createForSubrangeOfFile and createSingleFileReader to protected for FileBasedSource and all of its subclasses. Also change the return type for subclasses to return FileBasedSource and FileBasedReader instead of the specific types.  Note that these methods were meant to be used only by the FileBasedSource/BlockBasedSource and not called by users but if they did, this change would be backwards incompatible because of the return type and visibility changes.  This is for Apache Beam.  ----Release Notes----  [] ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=115301831 
Avoid sorting rules to exclude in AndroidBinaryGraphEnhancer  Summary: No need for sorting  Reviewed By: bobyangyf  shipit-source-id: 7bcff81a8a 
Ignore path parameters in request mappings  Before this change the presence of path params (e.g. "/foo;q=1/bar") expected the request mapping to contain a URI variable in the place of semicolon content (e.g. either "/{foo}/bar" or "/{foo};{fooParams}").  The change ensures path params are ignored in @RequestMapping patterns so that "/foo/bar" matches to "/foo;q=1/bar" as well as "/foo;q=1;p=2/bar".  Along with this change, the RequestMappingHandlerMapping no longer defaults to having semicolon content removed from the URL, which means @MatrixVariable is supported by default without the need for any further configuration.  Issue: SPR-10234 
Allow Kotlin libraries to use prefix matching, like Java.  Summary: Allow Kotlin libraries to use the same prefix-matching strategies as Java modules.  Reviewed By: asp2insp  fbshipit-source-id: b82114c495 
Add slop to prefix phrase query after parsing query string  This fixes a regression introduced by #5005 where the query slop was simply ignored when a `match_phrase_prefix` type was set.  Closes #5437 
Make SimpleTestSelector match full classname  Summary: SimpleTestSelector currently would match the outer class even if an inner class is specified, which is incorrect.  Reviewed By: styurin  fbshipit-source-id: 10a9c900cc 
Added first/last methods for getting iterator elements. Also changed singleValueOrNull method to singleOrNull and uses "element" in javadocs instead of "value", since it goes in line with Iterator javadocs   
Renamed REMOVE commands in DROP commands to stay closer to SQL standard 
Log shard rewrite and delete stats 
Remove no-op check.  The only way for the current port to be equal to defaultPort is if it's a valid port. That's already covered by the hasPort() check.  RELNOTES=n/a  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=174737802 
2.x: add missing 'the' to the changed sentences of 5413
Add functionality to initialize a type 
rename: makeNonNull -> nullCheckedValue 
polish / code review of data source embedded and init 
Call super() for consistency even if it is not strictly necessary.  Currently the call is idempotent.   
Migrated the beam-sdks-java-extensions-join-library module to TestPipeline as a JUnit rule. 
Reuse metadata mappers for dynamic updates.  When a metadata mapper is not specified in a mapping update, it should default to the current metadata mapper instead of the general default in order for the update to not conflict with the current mapping.  Closes #15997 
Fixed parsing of name for ognl when no id is specified and using name value WW-1617   
Fixed the bug when domR was re-created as a part of implement() method in network gurus with sourceNatIp address belonging to incorrect user (System user instead of network owner).  Conflicts:      server/src/com/cloud/network/element/DhcpElement.java     server/src/com/cloud/network/element/VirtualRouterElement.java 
Update license (remove copyright)  
TraceRA: move trace logging to TraceBuilderPhase. 
be more robust in CompilationWrapper to exceptions raised when creating a dump path 
Remove unused SourcePathResolver from SrcZip  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: acd8721 
Removed unused imports 
Issue #1555: Refer to collections by interface  Fixes `DeclareCollectionAsInterface` inspection violations.  Description: >Reports on declarations of Collection variables made by using the collection class as the type, rather than an appropriate interface. 
HIVE-8643 DDL operations via WebHCat with doAs parameter in secure cluster fail  
Add regression test for crash  Summary: Adding a test for the crash fixed in my earlier commit.  Test Plan: New test  Reviewed By: dinhviethoa  fbshipit-source-id: 645d432 
update kafkaspout to write metadata into zookeeper so that lag monitoring can be done 
CAMEL-2833 support for binary file in HttpProducer by applying patch with thanks to Nick  
Revert 1310541 that removed static imports  
Clean up of code gen configuration 
add some traces to enable easier monitor of message flow  
Fix path separator in AndroidBinaryRuleTest.  Summary: `File.getParent()` returns a path with backslashes on Windows. This makes the function to return a mixed-style slashes, which is not able to match patterns.  Test Plan: Unit tests. 
Clean up oauth config. Clean up formatting 
[FLINK-10227] Remove javax.xml.bind.DatatypeConverter for java 9 compatibility  
Update CEntryPointActions documentation and no longer require rigid order of calls, it is a non-public interface and users must know what they're doing 
Add missing @Nullable annotations.  Summary: Add missing @Nullable annotations.  Test Plan: buck test --all 
Remove some unused statements (closes #214) 
Javadoc for PolyglotEngine & TruffleLanguage; more fixes and clarifications, response to comments. 
[streaming] JobGraphBuilder method name refactor 
Use KnownRuleTypes in RawTargetNodeToTargetNodeFactory  Summary: This allows to use configuration rules in that factory.  Reviewed By: ttsugriy  fbshipit-source-id: 92b187d626 
Fixed a bug with removing data from a relationship index.   
DRILL-452: Conversion functions for external data types  * Length need not be a parameter in varchar* functions. * Added test cases for UTF8 conversion. 
Remove ActionResponse uses from HLRC (#44091)  The rest client does not communicate over the transport protocol. However, in the move to make all apis supported in the HLRC, some response classes were copied with extending ActionResponse, which is meant strictly for the transport protocol. This commit removes uses of that base class from HLRC.
Added page size to atlas format.  It's optional so old atlases still parse. Useful for loading the atlas without the images. 
Removed some useless imports 
MAHOUT-1310: Fixed to use the CLI provided DistanceMeasure for distance calculation of Point to Cluster Centroid.  
HIVE-6793 : DDLSemanticAnalyzer.analyzeShowRoles() should use HiveAuthorizationTaskFactory (Xuefu Zhang via Ashutosh Chauhan)  
Rename MIME type and extension to remove future bitcode ambiguity 
Tests: Fixing AbstractTest and some tests failing because the web pages evolved  r5114 
clean up saml metadata config 
CAMEL-5047: MDC logging keys has been prefixed with camel. Adjusted tests.  
Change compatibility version to 5.6 after backport 
Add @since Fix sonar warnings  
retain all user information for a run as request  In the authentication service, we currently only copy the username and roles of the user that was authenticated but we should instead preserve all of their information in the newly created user object. This change does that through the user of a new constructor in the user class that takes in both users.  Closes elastic/elasticsearch#3877  Original commit: elastic/x-pack-elasticsearch@7455078841c1880701dd4669d49c81f71c88301d 
Consider primary attribute with getBean(Class)  Update DefaultListableBeanFactory.getBean(Class<?> beanClass) to consider the 'primary' attribute of bean definitions. This makes getBean() behave in the same way as autowiring.  Issue: SPR-7854 
Quiet the logging of the docs tests  Significantly quiets the logging of the docs tests by: 1. Switching two log statements to debug level. 2. Only calling ESTestCase#afterIfFailed if the test failure wasn't just assumptions being violated. 
Fix the NPE issue of org.codehaus.groovy.tools.gse.DependencyTest.testDep when Parrot enabled by default 
Implement SessionFactoryImplementor in SF proxies  SessionFactoryBuilderSupport implementations create DisposableBean proxies for SessionFactory objects created using #buildSessionFactory.  Prior to this change, these proxies create problems when working agaist SessionFactoryUtils.getDataSource(SessionFactory), because this method expects the given SessionFactory to implement Hibernate's SessionFactoryImplementor interface (which the stock SessionFactoryImpl does).  With this change, the DisposableBean proxies created by SFBuilders now also implement SessionFactoryImplementor to satisfy this and probably other such cases.  Issue: SPR-8469 
Remove unused putIfAbsent interface 
Add controller listeners clear method  I find this usefull 
Formatting the Javadoc according to the guidelines 
Watcher: Remove version/versiontype support in get/delete watch (elastic/elasticsearch#3977)  As we are not dependent on any versions any more and we never exposed an version type functionality, nor documented it nor tested it, we should remove this for the next major release.  Note, this just removes the ability to set those options, which we ignored anyway in the transport action.  Original commit: elastic/x-pack-elasticsearch@3830203f50c0e129b63a5b1a38b6579f874bb1a2 
Remove obsolete comments. 
Issue #2836: moved error message fields to the check that reports them
move unreachable node construction into the node facade 
rename: constantReflectionProvider -> constantReflection 
CLOUDSTACK-9025: Fixed can't create usable template from snapshot in Xenserver and Vmware  Fix also reverts below commit as below solution making assumption about hypervisor which are not applicable in case of XenServer and VmWare  Revert "CLOUDSTACK-8964: Can't create template or volume from snapshot"  This reverts commit ccf5d75cfbe769b34c021ab3653ed318cae25933. 
* Changed the semantic of HttpMessage.isChunked() * updated the Javadoc of HttpMessageDecoder 
Remove deprecated QueryStringQueryBuilder#splitOnWhiteSpace (#35763)  This parameter has been deprecated and was ignored since 6.0, so its Java API methods can be removed.
Inline and remove BuildTargets.createFlavoredBuildTarget  Summary: Part of removal of BuildTarget.Builder  Test Plan: CI  fbshipit-source-id: 4a6612d 
Add missing @Override annotations  Summary: .  Reviewed By: styurin  fbshipit-source-id: 8d2e79b0a7 
scene2d.ui, support for a whitespace stripped atlas. Skin had a few place it wasn't using AtlasRegion. BitmapFont needed to shift glyph positions for amount of whitespace stripped from top and left edges. 
Improve handshake failure messages (#44485)  Today we report an exception on a handshake failure (e.g. cluster name mismatch) but the message does not include all the details of the mismatch. If the mismatch is something subtle like `my-cluster` instead of `my_cluster` then we cannot diagnose this from the message alone. This commit adds the details of the local cluster to the message, along with the details of the remote cluster, improving the utility of the exception message if reported in isolation.
Make DepsAwareTask.call set the status  Summary: We rely on "call" making the task "done" so we should do this  Reviewed By: styurin  fbshipit-source-id: 5fd6dd5f56 
Rename InputChangedListener => NodeChangedListener. Add event for usage count of a node dropping to 0. 
Update DiffRepository documentation. 
Prepend context/servlet path to FormTag action  The Form tag now fills in the context and servlet path if not present in the specified action.  Issue: SPR-8684 
Renamed OFlattenIterator in OMultiCollectionIterator allowing generic types 
Instantiates PageAwareByteArrayCursor in @Before  instead of in field initialization, because it would have the potential to leave old data affecting other tests, where pointers would be observed as BROKEN 
Improve grouping of Truffle dumps.  Added a group for inline information as well as changed the method header to differentiate the Truffle part from the Graal part. 
Allow custom instances of WebJarAssetLocator  This commit allows to configure a custom WebJarAssetLocator in WebJarResourceResolvers.  Issue: SPR-14092 
Retain ByteBuf extras when aggregating  Motivation:  BinaryMemcacheObjectAggregator doesn't retain ByteBuf `extras`. So `io.netty.util.IllegalReferenceCountException: refCnt: 0, decrement: 1` will be thrown when aggregating a message containing `extras`. See the unit test for an example.  Modifications:  `ratain` extras to fix IllegalReferenceCountException.  Result:  `extras` is retained. 
C/C++: make `Archive` rules use input-based rule keys  Summary: All inputs are specified as `SourcePath`s and added the rule key, which make this rule type eligible.  Test Plan: CI  Reviewed By: Coneko  fb-gh-sync-id: 2545be7 
Make DirectHeaderMap use relative paths  Summary: Outputs shouldn't include absolute paths. Make DirectHeaderMap use paths relative to its include root, just like HeaderSymlinkTreeWithHeaderMap.  Reviewed By: andrewjcg  fbshipit-source-id: bb84c1c3e3 
[Security] handle null values when attempting to parse as DN when mapping roles (elastic/x-pack-elasticsearch#3791)  This commit adds special handling for null values when building a DistinguishedNamePredicate for role mapping. Previously this would have resulted in an exception from the unboundid ldapsdk as the DN is invalid.  relates elastic/x-pack-elasticsearch#3787  Original commit: elastic/x-pack-elasticsearch@9386dae03e6c099592ade57d28bacb873276ce50 
Cleanup: remove logging and unused location 
Remove unused SourcePathResolver from CxxLink  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 87a8f0e 
Stop unwrapping and re-wrapping proguardConfig as a SourcePath  Summary: We only actually accept SourcePaths in BUCK files, so let's enforce that in the parser, rather than assuming everything can be converted to a SourcePath, and giving an awful error in the middle if not.  Test Plan: CI  Reviewed By: aiked  fbshipit-source-id: ef973e9 
Remove incorrect Javadoc.  It looks like we got this wrong back in CL 62226066 (from https://codereview.appspot.com/58760044/patch/1/10006): The tests aren't identical. One tests a null key; the other, a null value. Does that sound right?  (Motivation: The @link in the Javadoc is broken, so we're getting warnings from the Guava build.)  RELNOTES=n/a  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=184573912 
Add a local bind otherwise for box with multi IP httpd may use the wrong port.   
Clean up surrogate web flow handling 
set the user header on new requests in IndexAuditTrail  The IndexAuditTrail was not setting the appropriate user header on requests to see if the index exists and the mapping is updated. This did not fail in tests because we set shield.user, but fails during a normal installation.  Closes elastic/elasticsearch#626  Original commit: elastic/x-pack-elasticsearch@3771612b20a0bc83ec5d007660cc14adb8db16c4 
Clean up warnings in tests in spring-jdbc 
Rename HistogramAggregation s/Numeric/Double/  This is to allow introduction of FloatHistogramAggregation 
[fixed] license headers in android backend 
[scene2d] TextField should not rely on focus events to determine focused state.  Also reverts "[scene2d] When a focus event is cancelled, fire another event to put it back.", commit 837456aa2d816d003a73a5b0293269f50e096666. We don't fire a second event for any other event type when the change is cancelled, so it's odd to do it only for keyboard focus. 
revert rename InternalTemplateService -> MustacheTemplateService 
Add waiting remote actions to console output  Summary: When we're building remotely, the simplified RE super console output doesn't tell the user anything useful and looks like it has stalled.  Update simplified RE console line to include the number of remote actions we're currently waiting on and the number of total successful remote actions.  Reviewed By: cjhopman  fbshipit-source-id: 00d561c2f1 
#113 Add missing license headers 
Disable IPv6 address lookups when -Djava.net.preferIPv4Stack=true  Motivation:  According to the Oracle documentation:  > java.net.preferIPv4Stack (default: false) > > If IPv6 is available on the operating system, the underlying native > socket will be an IPv6 socket. This allows Java applications to connect > to, and accept connections from, both IPv4 and IPv6 hosts. > > If an application has a preference to only use IPv4 sockets, then this > property can be set to true. The implication is that the application > will not be able to communicate with IPv6 hosts.  which means, if DnsNameResolver returns an IPv6 address, a user (or Netty) will not be able to connect to it.  Modifications:  - Move the code that retrieves java.net.prefer* properties from   DnsNameResolver to NetUtil - Add NetUtil.isIpV6AddressesPreferred() - Revise the API documentation of NetUtil.isIpV*Preferred() - Set the default resolveAddressTypes to IPv4 only when   NetUtil.isIpv4StackPreferred() returns true  Result:  - Fixes #5657 
Make round() of infinity return infinity  It was previously returning Long.MAX_VALUE due to how Java's Math.round() behavior. 
Remove redundant throws IOException, InterruptedException  Summary: Dead code  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: 175ebcd 
CompositeValue: rename forEachComponent to visitEachComponent. 
Remove Javac.isWorkspace  Summary: Simplify implementations by just creating the scratch directory.  Test Plan: buck test --all 
Remove Platform.clone(), along with various supersource versions. The last non-test caller was removed in CL 45290173. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=45408889 
Refactored service responses into individual components 
CAMEL-8772: Added documentation for salesforce login config and endpoint options 
Core: Remove nasty hack in toString  This makes the output of EsThreadPoolExecutor#toString less pretty but we no longer have funky hacky that rely on the specific format of the toString produced by ThreadPoolExecutor which isn't part of its API and could change with any JVM version and break the output. 
Ading special case for retry batch, in case of trident a transaction retry should not jump the offset requested as part of retry. 
JAVADOC: Added missing javadocs. 
Revert to BoundedExecutor  We are seeing weird scheduling latencies with BoundedThreadPool. 
Use a DirectExecutor for Watermark Callbacks  This fixes a resource leak where the executor service is not properly shut down with the rest of the DirectRunner. 
cleaning up unit tests 
Keep the same field name as VertexBufferObject. 
rename commit on rotatingtransactionalstate to cleanupbefore 
KAFKA-5550; Connect Struct.put() should include the field name if validation fails (#3507)  Changed call to use the overload of ConnectSchema.validateValue() method with the field name passed in. Ensure that field in put call is not null.  Reviewers: Randall Hauch <rhauch@gmail.com>, Jason Gustafson <jason@confluent.io>
Add counter for POST requests to statement resource  This counter makes it easier to monitor large spikes in the incoming query rate. This counter is incremented prior to potentially expensive operations in SqlQueryManager (which has its own counters). 
Expose ResolvableType in NoSuchBeanDefinitionException  This commit improves NoSuchBeanDefinitionException to expose a full ResolvableType rather than a raw class if a lookup by type failed. This allows to know more about the underlying type and is typically useful when a collection or map is required as the relevant generic type is the actual bean that wasn't found.  Issue: SPR-14831 
Make Bootstrap and ServerBootstrap fully overridable  Related: #2034  Motivation:  Some users want to mock Bootstrap (or ServerBootstrap), and thus they should not be final but be fully overridable and extensible.  Modifications:  Remove finals wherever possible  Result:  @daschl is happy. 
[FLINK-1160] Method added to RecordReaders to allow publishing events to specific inputs 
javadoc: add description to param and return tags.  
Update ExecutableStageMatcher to accept Matchers  For Output PCollections, when flattens are unzipped, tests will not be able to know which stage has which PCollection as output. Instead, accept matchers to simplify the construction of the greater matcher. 
Allow rules to opt out of compiling against source-only ABIs  Summary: Some rules (particularly those that work with the output of annotation processors) can't handle compiling against source-only ABIs. Allow those rules to opt-out and compile against normal ABIs.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: 64a4764 
allow CAS API to return ticket objects rather than string ids  This helps with callers to not have to mess with the ticket registry 
Minus 16 calls to getMessage  Adds *Exception(Throwable cause) constructors and calls them where appropriate thus getting rid of 16 instances of calling getMessage and eliminating the risk of loosing exception context.  Fixes ElasticsearchTimeoutException along the way (used to discard the parameter args in the (String message, Object... args) constructor, passes it up to super now.  Relates to #10021 
[3450] Added bindings for custom ChromeDriver commands (GET_NETWORK_CONDITIONS, SET_NETWORK_CONDITIONS and DELETE_NETWORK_CONDITIONS) that allows client code to utilize built-in throttling functionality. (#3479)  
Remove unused timezone parameters 
[#2454] Correctly return null when DefaultChannelPipeline.firstContext() is called on empty pipeline  Motivation: DefaultChannelPipeline.firstContext() should return null when the ipeline is empty. This is not the case atm.  Modification: Fix incorrect check in DefaultChannelPipeline.firstContext() and add unit tests.  Result: Correctly return null when DefaultChannelPipeline.firstContext() is called on empty pipeline. 
record gossipped enpoint/token pairs as we see them.  also clean up SystemTable code to avoid unnecessary CF fetches.  patch by Gary Dusbabek and jbellis for CASSANDRA-437  
Remove BuildTargetParser.fullyQualifiedNameToBuildTarget  Summary: This is duplicated API, no need to have it.  Reviewed By: jtorkkola  fbshipit-source-id: f24457ea93 
Reformat the docs. 
Fix handling of fractional time value settings (#37171)  This commit addresses an issue when setting a time value setting using a value that has a fractional component when converted to its string representation. For example, trying to set a time value setting to a value of 1500ms is problematic because internally this is converted to the string "1.5s". When we go to get this setting, we try to parse "1.5s" back to a time value, which does not support fractional values. The problem is that internally we are relying on a method which loses the unit when doing the string conversion. Instead, we are going to use a method that does not lose the unit and therefore we can roundtrip from the time value to the string and back to the time value.
SSLManager should now read client certificates. Changed exception handling to make diagnosing similar issues easier.   
Enforce max_buckets limit only in the final reduction phase (#36152)  Given that we check the max buckets limit on each shard when collecting the buckets, and that non final reduction cannot add buckets (see #35921), there is no point in counting and checking the number of buckets as part of non final reduction phases.  Such check is still needed though in the final reduction phases to make sure that the number of returned buckets is not above the allowed threshold.  Relates somehow to #32125 as we will make use of non final reduction phases in CCS alternate execution mode and that increases the chance that this check trips for nothing when reducing aggs in each remote cluster.
Additional URISupport methods  This adds `stripSuffix` and `joinPaths` methods to URISupport, seemingly also a common pattern of utility methods that we can take advantage of doing only once.  Also refactors `stripPrefix` for additional `null` safety in case `prefix` is `null`. 
Removes unecessary console output from tests 
Add a BailoutOnException option on C1X to be able to tell expected exceptions (bailouts on jsr etc.) appart from true/unexpected exceptions 
Adding tests to ensure results are overridden correctly WW-2559   
Adjusting SpanTermQuery to work w/ latest changes.  One final refactoring of the SpanTermQuery - makes sure the class hierarchy works again.  Relates to #10217 
Split test code for graal.graph into new project graal.graph.test. 
Polish AbstractContextLoaderInitializer and subclasses  This commit polishes the Javadoc and assertion failure messages for AbstractContextLoaderInitializer and its subclasses. 
Remove unused methods from Block 
Remove uses of CreatePCollectionView#getView  Views output by this transform should be obtained by inspecting the graph node, not by interrogating the PTransform. Doing otherwise may use incorrect views after Graph Surgery has been performed.  The result of getView can be used to, for example, return the same type of view. The view returned by this method should be interpreted as a PCollectionView spec rather than a PValue, as the graph containing the PTransform and PCollectionView can change independently. 
network: Send userdata to Virtual Router if IPv6 is enabled (#3100)  There is no reason to not send userdata+password to the VR as all Instances in CloudStack are Dual-Stacked. They have IPv4 and IPv6 so they can query their metadata over IPv4 at the VR.  Signed-off-by: Wido den Hollander <wido@widodh.nl>
Resolve ResourceUrlProvider from current request  This commit changes `ResourceTransformerSupport` to look for the `ResourceUrlProvider` in the current request if none is configured on the resource transformer itself.  Issue: SPR-15369 
Bug 6873: disable/enable mode for clusters (and pods and zones and hosts)  Fixed problems in setting default 'allocation_state'. It is now set to 'Enabled' by default if not provided in the API command. 
r/m unused code patch by jbellis; reviewed by Jun Rao for CASSANDRA-65  
added javadoc comments 
Check code style 
Restore default transaction manager by name lookup  Fix a regression introduced by 961574bd17b that prevents a proper lookup of the default transaction manager by name as the absence of a qualifier is represented by an empty string (passing the faulty null check).  Issue: SPR-12577 
Clarifications and javadocs 
GROOVY-1202: provide a feature to declare TestCases as 'notYetImplemented' and thus expected to fail: disable all security tests...   
Fixed error message when a wildcard //foo/bar/... points to a folder foo/bar that doesn't exist  Summary: ``` $ buck build //path/to/non/existant/folder/... ```  would fail with an exception.  Instead, an error message will be more helpful.  Test Plan: In case watchman is not used:  Before diff:  ``` $ buck build //path/to/non/existant/folder/... ``` shows an exception  After diff: ``` $ buck build //path/to/non/existant/folder/... BUILD FAILED: The folder /Users/dvh/path/to/non/existant/folder could not be found. Please check that you spelled the name of the buck target correctly. ```  Reviewed By: ttsugriy  fbshipit-source-id: f3ded1b 
Add `CellPathResolver` to metadata description interface  Summary: Subsequent changes will use this parameter.  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: cb0f192 
Make all methods of SslBufferPool public so a subclass can be placed in another package. See #336 
CAS-1251: Possible Cross-Site Scripting on /login using execution parameter  Fixed an issue with the webflow exception resolver to also ignore badly formatted key exception, since it will result in an infinite redirect loop. 
[inlining] redux, no need for the suspense about return value 
removed special case of remote index key serialization during tx not used anymore 
Refactor and fixes m2e integration  The delta check wasn't properly working (because of absolute paths). Factorised the checking method. Added debug logs. 
Producer no CQL Uri Param handling on doStart()  Problem: - cql Uri param is not mandatory (default null) - prepareStatements Uri param default true Therefore creating a Producer like "cql://localhost/camel_ks" fails; also, the error returned is misleading.  Details: With the above premises, the top of the stacktrace is "org.apache.camel.FailedToCreateProducerException: Failed to create Producer for endpoint: Endpoint[cql://localhost/camel_ks]. Reason: com.datastax.driver.core.exceptions.NoHostAvailableException: All host(s) tried for query failed (tried: localhost/127.0.0.1:9042 (com.datastax.driver.core.TransportException: [localhost/127.0.0.1:9042] Error writing))" However this actually: - is caused by the Producer doStart() trying to prepare a null cql statement - error looks like server/host is unreachable, but is actually the failure of trying to prepare a null statement  Proposed solution: Modify the the Producer's doStart() to invoke the Endpoint's prepareStatement() method with additional condition that cql is not null. An additional unit test is provided to illustrate the scenario, for instance a component earlier in the route would provide the actual cql statement as part of the header, for example an EIP Translator. Therefore in this scenario the cql is not unique and cannot be configured in the Producer endpoint uri.  Aditional Notes: On my machine maven test do fail on the master branch earlier than this modification, and this modification does not solve those problems. 
Always set heart-beat header in STOMP CONNECTED frames  Since SPR-10954, the SimpleBrokerMessageHandler supports `heart-beats`.  Even if the STOMP spec states that the `heart-beat` header is OPTIONAL, and if absent considered as `heart-beat: 0,0`, some clients rely on this to be set in CONNECTED frames.  This commit adds this header information even if no task scheduler/heart-beat have been configured.  See: https://stomp.github.io/stomp-specification-1.2.html#Heart-beating  Issue: SPR-10954 
TraceRA: rename LinearScanRegisterAllocationPhase to TraceLinearScanRegisterAllocationPhase. 
Remove unused imports. 
Fix buffer leak in DefaultFullBinaryMemcacheRequest/Response  Motivation:  DefaultFullBinaryMemcacheRequest/Response overrides release(), retain(), and touch() methods without calling its super, resulting in a leak of the extras.  Modifications:  When overriding release(), retain(), and touch(), ensure to call super.  Result:  Fixes #2533 by fixing the buffer leak 
Clean up Spring MVC Test Framework code   - Formatting  - Suppress warnings  - Remove unused imports 
Remove unnecessary qualifiers. #1555  Fixes `UnnecessarilyQualifiedStaticUsage` inspection violations.  Description: >Reports calls to static methods or accesses of static fields on the current class which are qualified with the class name. Such qualification is unnecessary, and may be safely removed. 
Strip debug symbols when bundling.  Summary: apple_bundle uses dsymutil to create a separate debug symbol file but leaves the debug symbol references in the binary. This fixes that.  Test Plan: CI 
Added missing license headers.   
Renamed getSupportedMimeTypes() in [En|De]coder  Renamed getSupportedMimeTypes() to getEncodableMimeTypes and getDecodableMimeTypes. This will allow for both Encoder and Decoder to be implemented in the same class.  This issue fixes #113. 
Fix JOINs that have ORDER BY rand()  Previously "Only deterministic expressions may be considered for rewrite" exception was thrown 
Add before and after logging for unit tests  Currently we have these logs for integration tests only.  This adds the following log at the start: ``` logger.info("[{}]: before test", getTestName()); ```  and this is logged at the end, but before any clean up done in sub classes  ```  logger.info("[{}]: after test", getTestName()); ```  Original commit: elastic/x-pack-elasticsearch@2ca7296665e35fa417576a4cea1bfeb366244f34 
fix UnixChannelUtil#isBufferCopyNeededForWrite fix not execute unit test in transport-native-unix-common-tests module  Motivation:  - Commit 047da11 introduced an bug for still copy byteBuf for composed of n(n <= IOV_MAX) NIO direct buffers - Commit 3c4dfed add UnixChannelUtilTest in transport-native-unix-common-tests module, but not execute in maven compile  as issue #6825, #6870  Modifications:  - modified UnixChannelUtil#isBufferCopyNeededForWrite(ByteBuf), and UnixChannelUtilTest - move UnixChannelUtilTest into transport-native-unix-common module, and add packet scope method UnixChannelUtil#isBufferCopyNeededForWrite(ByteBuf, int)  Result:  - no copy byteBuf for composed of n(n <= IOV_MAX) NIO direct buffers - auto execute unit tests in UnixChannelUtilTest and it is easier to mock IOV_MAX 
Create option for convert deoptimize to guard phase. 
adding missing finals 
HHH-6392 Extracting the attribute overrides. Next step is to apply the overrides when creating the attribute bindings 
Migrate AppleTest test binary blacklisting to platform-locked  Summary: Move a downcast into the interface and then it's a simple translation to use the platform-locked versions.  Allows deleting one of the final functions in NativeLinkableGroups.  Reviewed By: bobyangyf  shipit-source-id: eba8b95fbd 
Minor refactoring: reuse `findActualTypeByPlaceholderName` 
Implement MemoryAccess for ReadNode 
Remove unused imports 
Make SourcePath#asReference protected instead of public.  Summary: SourcePath#asReference is being used for two unrelated reasons: one is to have AbstractSourcePath implement some default methods to reduce boilerplate, the other is to access the value embedded in the SourcePath, Path in one case and BuildRule in the other. This changes the method to have protected visibility for the first use case, and adds a getRelativePath method to PathSourcePath to mirror BuildRuleSourcePath#getRule for the second one.  Test Plan: CI 
Use Pair<String, String> instead of String concatenation to reduce garbage when searching in Rex expr caches 
add memcached.enabled setting allowing to disable memcached even if its added as a plugin (by default, it is enabled) 
Implementation of freeze database without false warnings about incorrectly closed files was implemented. 
Rename `RestrictedAccessMode` to `OverriddenAccessMode` 
Show stacktrace of startup exception  Whether or not the stacktrace is displayed is controlled by bootstrap log level setting, so that bootstrap: DEBUG displays the stack trace on output, like it does on log  Closes #5102 
Followup to Mark's r1228724 The ObjectName.quote() must always be called with address, because ip6 addresses have characters that are must be quoted in QName. The Connector.java changes in r1228724 bypassed that call. Update TestRegistration.java accordingly.  
Minor cleanups. 
Renaming files   - Forgot to add "Citrix" before the new command wrappers 
grooy-json extend testing of javadoc examples 
Update "configuration changed" message  Summary: The current message indicates that buckd is restarting when it really isn't. Instead, let people know that the caches are being dropped and that builds will be slower.  Reviewed By: bobyangyf  fbshipit-source-id: b12b9351c4 
Autoformat java files in src/com/facebook/buck/bsd.  Test Plan: CI  Reviewed By: aiked  fbshipit-source-id: 13344ea 
Adds class javadoc to TaskControl and associates 
Moving FpGrowthJob to core and renamed as FPGrowthDriver and some other refactor  
Disallow empty @PropertySource(value = {})  Previously, a user could specify an empty array of resource locations to the @PropertySource annotation, which amounts to a meaningless no-op.  ConfigurationClassParser now throws IllegalArgumentException upon encountering any such misconfiguration. 
Add license headers to PhoneExtractingContentHandler and its test.  
Cleanup mentions of ancient java versions in javadocs. 
Changed predicate to stopPredicate: stops on becoming true.
Renamed ChunkedInput.available to hasNextChunk Renamed ChunkedInput.readChunk to nextChunk 
Make `TestRule.runTests` return a ImmutableList  Summary: This resolves some lint warnings issues where we may return an ##ImmutableList## from implementations.  Test Plan: buck test --all 
Add usersFile to pseudo distributed recommender  
[FLINK-7556] Allow Integer.MIN_VALUE for fetch size in JDBCInputFormat  Allow Integer.MIN_VALUE to be accepted as a parameter for setFetchSize for MySQL Driver.  The combination of a forward-only, read-only result set, with a fetch size of Integer.MIN_VALUE serves as a signal to the driver to stream result sets row-by-row. After this, any result sets created with the statement will be retrieved row-by-row.  This closes #4617. 
Add unit test for TextIO output to support the mvn exec:exec example we provide in README  Satisfy checkstyle 
Removed wildcard imports.  Fixed test with equal mode and token name. 
Camel-Pulsar: More polishing 
Fix JsonServiceRegistryDao serialization/deserialization of the salt  Jackson was serializing salt as a byte[] and deserializing as a String, we now force it to serialize and deserialize against the String value only. Updated test to actually check serialization/deserialization for the ShibbolethIdGenerator. 
Document meta-annotation support in the TCF  - Completed Javadoc for MetaAnnotationUtils. - Added Javadoc notes to multiple annotations in the TCF, pointing out   which annotations can be used as meta-annotations.  Issue: SPR-11109 
Add missing copyright headers 
MessageToByteEncoder always starts with ByteBuf that use initalCapacity == 0  Motivation:  MessageToByteEncoder always starts with ByteBuf that use initalCapacity == 0 when preferDirect is used. This is really wasteful in terms of performance as every first write into the buffer will cause an expand of the buffer itself.  Modifications:   - Change ByteBufAllocator.ioBuffer() use the same default initialCapacity as heapBuffer() and directBuffer()  - Add new allocateBuffer method to MessageToByteEncoder that allow the user to do some smarter allocation based on the message that will be encoded.  Result:  Less expanding of buffer and more flexibilty when allocate the buffer for encoding. 
fix topology.metrics.consumer.register validation: Map, not String The topology.metrics.consumer.register is a list of hashes, but its schema was StringsValidator. Added a 'MapsValidator' (list of Map) and fixed the schema. 
Use Credentials object instead of 2 attributes for Basic Authentication  This commit changes the usage of two separate attributes (username and password) into one: a single `Credentials` object. Additionally, the attributes key under which the credentials are stored is changed to be specific to Basic Authentication, in order to allow for other sorts of authentication later.  Issue: SPR-15764 
CLOUDSTACK-9252: Mock application context for unit test 
Replace `String... args` with `List<String>` as args4j supports `Collection<String>`.  Summary: Lists are much more pleasant to work with than arrays in Java.  Test Plan: Sandcastle builds. 
2.X: Fix disposed LambdaObserver onError to route to global error handler (#6036)  
KAFKA-4300: NamedCache throws an NPE when evict is called and the cache is empty  If evict is called on a NamedCache and the cache is empty an NPE is thrown. This was reported on the user list from a developer running 0.10.1.  Author: Damian Guy <damian.guy@gmail.com>  Reviewers: Eno Thereska, Matthias J. Sax, Guozhang Wang  Closes #2024 from dguy/cache-bug 
Add license headers.  r1472 
Make equality checks for standard type classes faster  Treat the standard types as singletons, which allows us to implement equals() with reference equality. 
add debug logging to IntervalTree creation; see CASSANDRA-3407  
Make AbstractCapabilities.asMap return `Map<String, Object>`  Co-variant return types mean that this is legal to do in Java, and it makes dealing with the output of these things easier.  With hindsight, it would have been better to use a different return type for `asMap` in the first place. Maybe we can fix this in Selenium 4. 
rename SinkManager.addSink -> SinkManager.add patch by jbellis  
added test case and support for selectors on Stomp subscriptions  
Address comments: 1. Use SqlFunction.like to implement like operator. 2. Add an integration test for like functionality. 
Added some more useful methods in MapUtil and some basic javadocs   
Make EndPoint objects immmutable, so hashcode can't change (making the EndPoint potentially disappear from a map) patch by jbellis; reviewed by Sandeep Tata for CASSANDRA-497  
Add TargetConfiguration to BuildTarget interface  Summary: It uses `EmptyTargetConfiguration` for now, but that allows to indicate that the target configuration should be passed in some places.  Reviewed By: bobyangyf  fbshipit-source-id: 408b70e6a9 
Replace getRuleOptional..addToIndex with computeIfAbsent in CxxDescriptionEnhancer.requireSharedLibrarySymlinkTree  Summary: This prevents possible race conditions when action graph creation is done in parallel.  Also use the fixed requireSharedLibrarySymlinkTree in CxxGenruleDescription, which used to just duplicate this logic.  Test Plan: CI  fbshipit-source-id: 405b9d3 
Log exceptions in ClientSideSlb  Summary: These exceptions are currently swallowed and it's impossible to debug what types of http exceptions are actually happening on the pings used for determine health of the server.  Meanwhile we have ton of logs in the RetryableHttpException that aren't helpful for debugging and duplicate logging for the exception that later raised as RetryingHttpServiceException: ``` > ag -i "encountered an exception while connecting to" ~/Downloads/buck-0.log |wc -l  1374392 ```  Reviewed By: sbalabanov  fbshipit-source-id: a15c272023 
Changing request encoding to apply to file uploads, allowing zero-sized file uploads  WW-1324   
Aggregations: Fixed Moving Average prediction to calculate the correct keys  The Moving average predict code generated incorrect keys if the key for the first bucket of the histogram was < 0. This fix makes the moving average use the rounding class from the histogram to generate the keys for the new buckets.  Closes #11369 
Add some logging for cancellation events 
package-private is sufficient for @VisibleForTesting: should not be protected unless overridden.  Summary: I noticed a handful of methods that were declared `protected` in classes that have no subclasses (and do not appear to be designed to be subclassed). I think this was an errant assumption that this was necessary because these were `@VisibleForTesting`.  Check your Java visibility chart, folks! http://docs.oracle.com/javase/tutorial/java/javaOO/accesscontrol.html  `protected` is also package-private, but package-private is all we need for testing. Also, marking things as `protected` is confusing because it suggests that (1) there are subclasses and (2) such members are designed to be overridden.  If there are other areas of the code that also have this issue, please clean them up if you are aware of them.  Test Plan: CI 
Switch to suspended mode before demand  After this commit, Tomcat and Undertow WebSocketSession imlpementations start out in suspended mode and wait for demand.  The JettyWebSocketSession is capable of suspending but it doesn't seem to work if invoked before any messages are received. That may become an issue if there is a case where no demand appears long enough for more messages to accumulate than we can hold.  UnderowServerHttpRequest would ideally also start in suspended mode but that also doesn't work. It is not an issue in this case since we can ignore the read notifications.  Servlet API requires a proactive check before it calls you back so there is no need to suspend.  Issue: SPR-16207 
No logical changes: Fix warnings and remove unused imports  - Fix warning of varargs null calling - Remove unused imports  Signed-off-by: Simon Stewart <simon.m.stewart@gmail.com> 
Unflake TestCommunication by increasing timeout 
Handle AsyncListener.onComplete in Servlet adapter  Typically the Mono<Void> from the HttpHandler also reflects the completion of the request and response body processors and at that point invoking AsyncContext#complete() from HandlerResultSubscriber should be sufficient.  This commit explicitly propagates the AsyncListener.onComplete event to the request and response body processors for added safety. Technically as mentioned those processors should have completed but depending on how the controller is written there is a possibility the body processors may not have completed.  Issue: SPR-14772 
Restore log level for resolved exceptions  The fix for SPR-17178 switched from debug to warn level warning for all sub-classes of AbstractHandlerExceptionResolver where the request concerned the DefaultHandlerExceptionResolver only.  This commit restores the original DEBUG level logging that was in AbstractHandlerExceptionResolver from before SPR-17178. In addition DefaultHandlerExceptionResolver registers a warnLogCategory by default which enables warn logging and hence fulfilling the original goal for SPR-17178.  Issue: SPR-17383 
fix the typos in the Traffic example java docs.  ----Release Notes----  [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=90852578 
[BEAM-446] Improve IOChannelUtils.resolve to accept multiple paths 
Added note to javadoc about threadsafety  
Add constructor utility methods to BuckTargetPattern  Summary: Add utility methods to construct BuckTargetPatterns for use in resolving (non-absolute) targets.  Reviewed By: asp2insp  fbshipit-source-id: 8638154bd6 
Pull getNodes up to TraversableGraph  Summary: All implementations have this function, and it's useful to be able to access.  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 8213324 
OIDC: change to scope name saved for custom scope (#3916)  * change so scope name saved for custom scope  * removed unused constructors without required fields  * checkstyle  * checkstyle  * avoid creating class if no default constructor  * spotbugs change 
Rethrow exception during recovery finalization even if source if not broken  Today we miss to throw / rethrow an recovery exception if it happens during the finalization of phase 1 if the source files are not affected. Even worse this can cause some dataloss if the reason for this exception is a failure of deleting a corruption marker or similar pre-existing corruptions since we continue with the recovery and mark the target shared as started which will in-turn open an engine with an empty index. 
Fix type mismatch during YAML properties decrypting (#2474)  * Fix type mismatch during YAML properties decrypting * make methods decryptProperties and loadYamlProperties use a typed Map in CasCoreBootstrapStandaloneConfiguration * handle map with objects CasConfigurationJasyptDecryptor#decrypt  * Codestyle fixes 
Removed some code duplication. 
mute failing filerealm hash caching tests (#42304)  some tests are failing after the introduction of #41792.  relates #42267 and #42289.
CLI: Fix esusers tool to not create bogus role entry  If a user was created, but the user was not supplied roles on the commandline, a bogus 'user:' was added to the roles file. This fix checks, if roles were supplied when creating a user and only changes the roles file in that case.  Original commit: elastic/x-pack-elasticsearch@286951c0167f032fa25523584cf63edec25c4553 
disabled tests with strong encryption not possible in some country 
Build with --keep-going when generating an IJ project.  Summary: If someone has broken code in their repository we should try to make as much of the project work as possible.  Test Plan: type random characters in a Java file to make it not compile, run `buck project --experimental-ij-generation` observe error message 
One call target can only take up 20% of splitting budget.  The percentage is controllable by command line option. 
JarDirectoryStep: Take a remove entries predicate instead of a `RemoveClassesPatternsMatcher`  Summary: This allows more flexibility in terms of what the rules are, so that, for example `java_binary`'s `blacklist` parameter might allow more than just classes.  Test Plan: CI; this is a straightforward refactor  Reviewed By: andrewjcg  fbshipit-source-id: 948714c 
Never use the current node's stamp in ValueNode.inferStamp overrides. Removed unused PhiNode.inferPhiStamp 
Exception for OSIV deferred close with async requests  OSIV deferred close mode is not supported with async requests and is unlikely to be what's the desired. This change adds an exception with a message stating this.  Issue: SPR-8517 
Use soname as intermediate build product name  Summary: The debug symbol scanner relies on being able to find a shared library under its soname.  Test Plan: automated 
[java] Installing Firefox extensions in the same form as they provided, either as a file or as a directory. With the release of Firefox 62 Mozilla discontinued support for unpacked sideloaded extensions in Release channel. Users must themselves choose proper format to use in their tests depending on the browser version they run tests in. 
Take String.getBytes() out of rule key generation  Summary: Forces full recompile ... but does great things for variance (std-dev / mean) of null-compile runtimes: master was at 0.13553 yesterday, and this change pushes it down to 0.0674  Test Plan: Builds and runs `orca` ... null-compile build-time variance is down.  Reviewed By: dreiss  fbshipit-source-id: 434b9f5 
Add more cases to EscaperTest.  Summary: There was a lot of untested code in Escape.java: now it's tested. No issues were discoverd.  Test Plan: EscaperTest 
Added generics test cases for ExplicitInitializationCheck. 
Clean up unused imports for the tc6 source tree  
Clean up unused import package of aws  
Remove unused config 
MAHOUT-857: minor formatting  
Start adding testing for ProGuard and allocation testing for common.hash.  Initial HashingProGuard measurements: 85448 bytes 51 classes 197 methods  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=157137394 
Clean up unused imports and variables  
updated delete test 
Use bundle_loader's product_name in project gen  Summary: Currently only uses the bundle's shortname, whereas the correct value can be overridden if a product_name is set on the bundle loader.  If the optional `product_name` is not set, it will default to the current bundle short name. Closes https://github.com/facebook/buck/pull/1504  Reviewed By: ttsugriy, dinhviethoa  Pulled By: dinhviethoa  fbshipit-source-id: d38a963 
added missing xbean-spring annotations to allow nicer XML configuration  
Added/modified some javadocs in the index API   
Better error message when the incorrect arguments are passed to `buck query`  Summary: New message (when misusing `rdeps`, for instance): ``` `syntax error at ')'` when parsing call to the function `rdeps(EXPRESSION, EXPRESSION [, INTEGER ])`.  Please see https://buckbuild.com/command/query.html#rdeps for complete documentation.```  Test Plan: `ant test -D"test.class"="QueryParserTest"`  Reviewed By: bhamiltoncx  fb-gh-sync-id: bcbfd68 
Bug 41788 - Log viewer (console window) needed as an option Clear content on enable   
Add Lookup#resolveGroup method and make Lookup#resolve depricated  In the future, equivalence based memo would store multiple plan nodes per group. Therefore resolve() that returns singleton should be unused. 
SPR-8524 Add flag to AbstractCachingViewResolver to suppress subsequent resolution of unresolved view names. 
Removed the auto-discovery of Jetty thread pool by looking at available processors. It caused problems/hangs when running tests. Enabled again when it's working. It's still possible to set the thread pool size with configuration 
Deprecate unused code identified by FindBugs  
aapt2: Add support for android_prebuilt_aar and react_native_library  Summary: Both of these produce Android resources, so they must be able to supply aapt2_compile rules to work with aapt2.  ReactNativeLibraryGraphEnhancer being in a separate package means that Aapt2Compile and AAPT2_COMPILE_FLAVOR need to be public.  I'm open to discussion for whether this is the right approach.  Is it reasonable to require every resource-supplying rule to support the aapt2_compile flavor, or should android_binary create those rules for them?  Test Plan: CI. Built and ran FB4A with it.  Reviewed By: asp2insp  fbshipit-source-id: 7f0b665 
Improve error messages for invalid casts 
[#4087] Correctly forward bytes when remove codec and handle channelInactive / channelReadComplete(...)  Motivation:  We missed to correctly implement the handlerRemoved(...) / channelInactive(...) and channelReadComplete(...) method, this leaded to multiple problems:   - Missed to forward bytes when the codec is removed from the pipeline  - Missed to call decodeLast(...) once the Channel goes in active  - No correct handling of channelReadComplete that could lead to grow of cumulation buffer.  Modifications:  - Correctly implement methods and forward to the internal ByteToMessageDecoder - Add unit test.  Result:  Correct behaviour 
#! minor polishing and removing of warnings 
make forceFlush block until the flush action is queued on MemtableManager.  That way calling forceFlush; waitForFlush will be guaranteed that the action waitFF puts on MtM will run after the flush completes, i.e., the wait will actually do what it's supposed to.  patch by jbellis; reviewed by Eric Evans for #59  
Improve EvictingQueue.addAll()'s performance by skipping the head of collections larger than the size of the queue. Also clear the backing queue in such cases to avoid calling .remove() n times.  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=129679957 
Add missing pre built analysis components closes #6770 
Mappings: Fix _field_names to not have doc values  When doc values were turned on a by default, most meta fields had it explicitly disabled.  However, _field_names was missed. This change forces doc values to be off always for _field_names and removes the unnecessary support when creating index fields.  closes #10892 
STORM-974 remove unused fields / imports 
Fixed bad defaults for html sanitization  - Corrected the `_tables` element list. now it contains the following elements: `<table>`, `<th>`, `<tr>`, `<td>`, `<caption>`, `<col>`, `<colgroup>`, `<thead>`, `<tbody>`, `<tfoot>`  - Added support for empty `<span>` elements  Closes elastic/elasticsearch#660  Original commit: elastic/x-pack-elasticsearch@ce5e57c4aa50112b7ae278763d4287cdfbed9cb4 
Check style issues fixed 
Deprecate unused method on internal Jar abstraction  
- Call onClose before actually closing anything (sending a close message closes the endpoint). - If onClose throws an exception, call onError. - After using a blocking send, clear the client buffer in case it gets reused (I have no idea why this is needed ...).  
Pass Swift AST paths when using apple_library  Summary: In order to debug mixed language `apple_library` (i.e., Obj-C + Swift), we need to correctly export linker flags to add the AST paths to the `.swiftmodule` files. This was already happening for `swift_library` rule but not for `apple_library`. See https://bugs.swift.org/browse/SR-2660 for more context on `-add_ast_path`.  Test Plan: Build and debug a mixed Obj-C + Swift app using `lldb`.  Reviewed By: dinhviethoa  fbshipit-source-id: f9a51c5 
Minimize reference count checks in SlicedByteBuf  Motivation:  SlicedByteBuf did double reference count checking for various bulk operations, which affects performance.  Modifications:  - Add package private method to AbstractByteBuf that can be used to check indexes without check the reference count - Use this new method in the bulk operation os SlicedByteBuf as the reference count checks take place on the wrapped buffer anyway - Fix test-case to not try to read data that is out of the bounds of the buffer.  Result:  Better performance on bulk operations when using SlicedByteBuf (and sub-classes) 
Clean up bean definitions and double aliasing. 
Preparations for configurable bloom index analyzer 
Add missing @Override annotation.  Test Plan: Eliminated warning in Eclipse. Unfortunately our linter does not appear to catch these. 
Adding license headers since Hudson moans about them but does not bother to actually fix the problem.  
Polish WebJarsResourceResolver  Follow up to accb8519fd - same fix when resolving missing resources or resolving a public URL for these resources. 
Moved executor null check to AsyncExecutionInterceptor, allowing AbstractAsyncExecutionAspect to fall back to sync execution (as in 3.2.1)  Issue: SPR-10636 
Add fetch task instance id directly from SqlTaskManager  Currently when the task instance id is needed the caller asks for the entire task info, which is very expensive to compute, and then the caller extracts the single id field. 
fixed regression: method-level patterns without type-level pattern do not need to start with a slash (SPR-6598) 
javadoc fixes. Add description to throws tag and really use code tag  
Polish the code of camel-core 
better exception messages 
Allow disabling of ChromeTraceBuildListener  Summary: ChromeTraceBuildListener is not essential to builds, so it's useful to be able to disable it when developers don't need/want a chrome trace from their builds.  Test Plan: - Local testing  Reviewed By: Coneko  fbshipit-source-id: 65aa3bf 
Moved input conversion drivers from examples to utils as they have general utility outside of the examples  
implement method `shouldCaptureFrames` on RootNode to allow languages to ask for read-only frames in TruffleStackTraceElements 
[Minor] Remove unnecessary semicolons 
- New parameter "server.cache.http.static" to put cache expiration to high age in HTTP headers - Renamed parameter "server.cache.staticResources" in "server.cache.file.static" 
camel-master: add some javadoc 
convert settings for ResourceWatcherService to new infrastructure  This commit converts the settings for the ResourceWatcherService to use the new infrastructure and registers the settings so that they do not cause errors when used. 
fixed import warnings + further commenting 
Add withElements to CommittedBundle  The unprocessed elements of a partially completed bundle must be placed in a new bundle to be processed at a later time. The bundle in which they are processed should also have identical properties to the bundle which the elements were initially present in.  withElements provides a simple way to create a "copy" of a bundle that contains different elements. 
Remove some duplicate code in AbstractCachingBuildRule.  Test Plan: Sandcastle builds. 
Simplify exception handling. 
improved error messages  
Remove StepStarted/Finished logs  Summary: Remove StepStarted/Finished logs I don't see any benefit from having them around. We will still post exception when step fails, and I think this is what we need and that's enough.  Test Plan: CI  Reviewed By: marcinkosiba  fbshipit-source-id: a9c1f9e 
Exclude directories by default in glob function  Summary: This is the default behavior of Buck and Bazel.  Test Plan: CI  Reviewed By: styurin  fbshipit-source-id: 5d66aa9 
Remove undefined generic arguments for ExternalTransformBuilder  The type arguments are very verbose and do not help the type checking. 
Rename local plugin componenents list for clarity 
renamed ValueWrapperImpl to SimpleValueWrapper (for use in Cache implementations) 
Also use the correct rfc number in unit test 
refactoring ValidateGroup -> ValidationGroup 
HIVE-7530 - Go thru the common code to find references to HIVE_EXECUCTION_ENGINE to make sure conditions works with Spark (Na Yang via Brock) [Spark Branch]  
Rename flushAndWrite() to writeAndFlush()  - Fixes: #2066 - Fixed inspection warnings 
[flink] Use default value for checkpoint timeout  The checkpoint timeout in Beam should be the same as in Flink. 
Disable correct linking of external variables per default  The correct linking of external variables that are defined in other bitcode files causes a run-time overhead due to the slow textual LLVM IR parser. 
Fix bug when rewriting NegativeExpression  It was discarding the rewritten subexpression of an arithmetic negation 
Added missing license info to the bunch of files 
Make BalancedAllocationDecider assignments deterministic  a previous change introduces an identity hashset that has non-deterministic iteration order which kill the reproducibility of our unittests if they fail. This patch adds back deterministic allocations. 
fix up master advisory, advisories are only fired after broker is fully started so the nowMaster advisory needs to ocurr after start rather than as part of persistence adapter start, resolves org.apache.activemq.broker.ft.QueueMasterSlaveTestSupport#testAdvisory failures  
For places formatting numbers in fixed formats, or case-insensitive comparing Ascii strings, use Locale.ROOT not Locale.getDefault() to ensure predictable behaviour, and avoid issues in locales like Turkish. TIKA-1387  
cxx: add per-`CxxPlatform` config option to set explicit header mode  Summary: Allows `CxxPlatform`s to explicitly configure the header mode used for builds.  Reviewed By: styurin  fbshipit-source-id: f0d4d41 
Update after last review  We check for null. Test added as well. 
Pull test running logic out of StepRunner  Summary: This is a pure refactor.  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: ca01833 
clean up equals and hashCode gen for credentials 
Do not copy byte arrays out of ByteString  Summary: Using `writeTo` causes us to allocate new Byte arrays and copy bytes out of the ByteString.  Switching to `asReadOnlyBufferedList` helps ensure we aren't allocating new Byte arrays and should help memory pressure from running Remote Execution builds.  https://developers.google.com/protocol-buffers/docs/reference/java/com/google/protobuf/ByteString#asReadOnlyByteBufferList--  Reviewed By: cjhopman  fbshipit-source-id: 6d9c95c874 
Can now use a Rescorer with RecommenderIRStatsEvaluator. Added fall-out IR statistic.  
Implement edgeValue() via edgeValueOrDefault() instead of vice versa. For edgeValue() this is the same efficiency, but makes edgeValueOrDefault() perform fewer hash lookups.  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=134820696 
Fix regression in static setter method support  The intention of ExtendedBeanInfo, introduced with SPR-8079 in v3.1.0.M2, was to support dependency injection against non-void returning write methods. However, it also inadvertently introduced support for injection against static setter methods.  When use of ExtendedBeanInfo was made optional with SPR-9723 in v3.2.0.M2, ExtendedBeanInfo continued to support static write methods, but its new BeanInfoFactory-based approach to testing whether or not a given bean class contains candidate write methods was written in a fashion exclusive of static methods, and this thereby introduced a regression - a regression in an otherwise undocumented and unintended feature, but a regression nevertheless.  The reporting of SPR-10115 proves that at least one user has come to depend on this behavior allowing injection against static write methods, and so this commit fixes the regression by ensuring that the candidacy test includes standard and non-void setter methods having a static modifier.  Issue: SPR-10115, SPR-9723, SPR-8079 
Allow to define custom prefix for settings when components do not use the org.elasticsearch package 
Update javadoc. The previous sample code was not actually doing what the comment describes. In particular, it was calling adjacentNodes() instead of successors(). The comment says "all nodes reachable from node", but adjacentNodes() will also travel AGAINST the direction of the edge (not necessarily "reachable" in the directed case). ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=125022633 
Some system calls can be called later to improve accept() performance 
TIKA-60 - Rename Microsoft parser classes  
Improve EngineSearcher tracking  Currently we fail tests is any searcher reference is pending. Yet, on a slow machine the freeContext calls that are async could still be in flight so if there are pending searchers we wait for a bit to make sure we don't fail if a freeContext call is in flight. The MockEngine now also contains the stack trace of the first close call if a searcher is closed twice. 
Polish Javadoc for MVC exception handling classes 
update tests for deterministic naming in 08ed19078 
Rename to getApplicationListener() 
Update to 2.0b licence header  
Resolve some of Javadoc problems, issue #291 
merge from 0.7  
No System.out printing. The UDC tests are now silent 
TIKA-416: Out-of-process text extraction  Rename ForkSerializer to ForkObjectInputStream to better reflect its current role  
AMQ-6377: Storing JournalSyncStrategy as an enum  Switching MessageDatabase to store JournalSyncStrategy as its enum value instead of String to avoid the performance penalty of comparing Strings everytime isEnableJournalDiskSyncs() is called which currently happens on every write. 
api: include tags in listvmsnapshots response (#3216)  This ensures that tags of a VM snapshot are listed in the UI, available in the list vmsnapshots API response.  Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>
Port test checking that provider is undecided in transaction 
WW-769   - added javadoc to method populateComponentHtmlId in Form     and FormButton    
Added somments to AbstractVectorClassifier. Improved error message in KMeansMapper.setup() when no clusters are found  
CAMEL-11621: extend simple date formatter for properties
minor cleanup: update apache license header 
rename components to match housing module 
changes to support API changes in JDK 1.8.0-ea-b84 
Added diagnostics for WindowPoolStats of all stores.  These diagnostics can be queried explicitly only (since they are never interesting at startup). 
Guice: Ensure no exceptions are thrown in constructor  Because this leads to endless loops when starting elasticsearch some components have been refactored to AbstractLifecycleComponents so that the exception throwing logic can executed in the `doStart()` method.  Closes elastic/elasticsearch#505  Original commit: elastic/x-pack-elasticsearch@75d1fd358a923775551e556e559f02e745b3d3a2 
Added further author tags  Issue: SPR-1528 
added @since javadoc tags and upgraded some javadocs on the AST transformations.     
Improve CryptoService error message on missing secure file (#43623)  This improves the error message when encrypting of sensitive watcher data is configured, but no system file was specified in the keystore. This error message is displayed on startup.  This also closes the input stream of the secure file properly.  Closes #43619
 In CheckedFuture Javadoc, emphasize that it has checkedGet(), not that it has addListener(), since any ListenableFuture has the latter. In Futures.transform/chain Javadoc, attempt to simplify the text about cancellation, and revise and move a not always accurate statement about sameThreadExecutor().  Revision created by MOE tool push_codebase. MOE_MIGRATION=2181   
Fixed javadoc formatting. 
Refactor PageSwapperFactory.moveUnopenedFile -> renameUnopenedFile  To align better with PageCache.renameFile and FileSystemAbstraction.renameFile 
WW-3023 Use ClassLoaderUtils to resolve the class in ConcentionServiceImpl  thanks to Travis Rein for the patch    
added a test case and fix for http://issues.apache.org/activemq/browse/CAMEL-206  
Fix issue in connector refactoring identified by Gump. Ensure UpgradeProcessors are unmapped from sockets once the connection is closed.  
Limit the number of values for min/max n functions  min_n/max_n or min_by_n/max_by_n functions do not check the value of n before creating the corresponding heaps for the states. This led to production failure due to OOM when n is big enough. This patch enforces n to be no greater than 10000. 
disable VCS info gathering from most commands  Summary: This adds an extra field on each command that shows if we want to gather source control information while executing this command. This is because gathering the information is slowing down some commands and does not necessarily provide some useful information.  You can still force the gathering of the information by adding the following to buckconfig:    [version_control]       generate_statistics = true  Test Plan: Checked that invoking commands that don't gather the data actually don't gather the data.  Reviewed By: marcinkosiba  fbshipit-source-id: df86325 
test case for default authz strategy 
Removing implicit dependency on system clock.  Introduced the Clock interface to remove the direct dependency on System.currentTimeMillis() 
Fixed check style issues 
Restore parameter name auto_generate_phrase_queries (#19514)  During query refactoring the query string query parameter 'auto_generate_phrase_queries' was accidentally renamed to 'auto_generated_phrase_queries'.  With this commit we restore the old name.  Closes #19512
Allow inlining invokestatic for non-initialized holders  The caller should perform the necessary barriers. 
ShBinary: Remove unused SourcePathResolver  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: aab7970 
Distributed: improved tests by closing all storages before the test. 
Clean up computation of grouping expression candidates  The code was iterating over the list and calling indexOf to compute a stream of indexes from 0 to N only to then invoke a function that would get the Nth element in the list. 
fix CI build  Prior to this commit, AnnotatedJCacheableService contained an annotated method demonstrating a failure scenario. This could break depending on the order of the methods array as AopUtils creates the proxy if the pointcut matches by checking each method.  On the CI server, the first method was this invalid use case so checking if the proxy has to be created lead to an unexpected exception. This scenario has been moved to its own private class now. 
https://issues.apache.org/jira/browse/AMQ-3454 - remove copy of destinationMap in region getDestinationMap api, return a direct reference to the unerlying concurrent hash map, makes it more efficient to determine presence of a destination  
Renamed node method parser base class. 
CAMEL-7134 camel-twitter supports to set if using SSL or not 
Write proper english :) 
CAMEL-11339: Optimise to use LongAdder instead of AtomicLong 
removed extra service parameter to authz. adjusted log levels to TRACE 
Renamed isAncestor to better match isDescendant. Few minor changes. 
[hotfix] Removed lamba indices for type extraction for abstract classes 
Improve exception reporting  Add the source spec in the error stacktrace  Original commit: elastic/x-pack-elasticsearch@bc7ed6ac60229fea82e4d32dcecfbfd620c9339a 
Truffle: cleanup to the LoopNode API. 
When lowering a fixed guard, the usages should be forwarded to the floating guard instead of the value anchor. FixedGuardNode should have a dependency stamp 
move column iterators to own subpackage of db patch by jbellis; reviewed by gdusbabek for CASSANDRA-1338    
Update particular database dependencies setup and lifecycle  Move global components into a platform module, do not add any database scoped component into global dependency container. Move ThreadToTransactionBridge into platform. 
Copy exported deps from AppleBuildRules  Summary: If we had the situation:    foo.framework [depends on] barDylib.framework [depends on and exports] bazDylib.framework  then when asking `AppleBuildRules` which dependencies of `foo.framework` to copy, we were only copying `barDylib.framework`, not `bazDylib.framework`.  This fixes the bug and adds a test.  Test Plan: Added new test. Before fix, ran:    ant java-test -Dtest.class=AppleBuildRulesTests  Confirmed test failed. Applied fix, re-ran command, test passed. 
[#3373] Rename class to match naming scheme  Motivation:  The ReplayingDecoderBuffer does not match the naming scheme we use for ByteBuf types.  Modifications:  Rename to ReplayingDecoderByteBuf to match naming scheme  Result:  Consistent naming 
Truffle: refactored inlining interfaces to a more compact CallNode. 
MarshallingView explicitly skips BindingResult when searching for a model object  Just implementing common custom subclass behavior out-of-the-box...  Issue: SPR-11417 
javadocs: withLatestFrom diagram, @since annotations, standardize on formatting and terminology, add compiler nags for missing content 
AbstractFuture should not wrap CancellationException  Motivation: AbstractFuture currently wraps CancellationException in a ExecutionException. However the interface of Future says that this exception should be directly thrown.  Modifications: - Throw CancellationException from AbstractFuture.get  Result: Interface contract for CancellationException is honored in AbstractFuture. 
execute the indices store listener as a last listener, to make sure we clean things up before we delete content if needed 
Clean up the @SuppressWarnings of camel-core  
bug 10368: Print out the hash code of the db connection instead of the toString().  Changed the transaction in changeToStart() method to be of a shorter interval so it won't cause so many db connection exceptions 
Add the memory used on segment/segments stats The memory used for the Lucene index (term dict, bloom filter, ...) can now be reported per segment using the segments API, and on the segments flag on node/indices stats closes #4512 
Puts up the access guard when handling a kernel panic to prevent users of the database during the recovery to get random failures.  co-author: Lasse Westh-Nielsen 
SimonStewart: Cleaning up import statements  r16116 
netty-1597: Rewrite ByteBufInputStream.readLine() to avoid IndexOutOfBoundsException and to behave more correctly for lines ending in '\r'. 
use SeleniumServer.getDefaultPort() instead of SeleniumServer.DEFAULT_PORT so as to get the port named by the system prop selenium.port; this allows users to easily reset which port they are using (e.g., on a shared machine where not everyone can have port 4444).  r3450 
[TEST] added ability to provide settings for external nodes in backwards compatibility tests  Closes #6809 
Remove event bus from TargetGraph.  Summary: TargetGraph has an event bus left over from when it used to create ActionGraph. This removes it.  Test Plan: CI 
Allow fixed read phase to be configurable with boolean whether inputs should be replaced with constants. Make sure canDeoptimize in SafeDivRemNode cannot change after removing PiNodes. 
Cleanup DeleteByQuery code from IndexShard 
Update a test for new RecordStorageEngine.apply exception handling 
Added JavaDoc to handler.ssl package 
HIVE-14423 : S3: Fetching partition sizes from FS can be expensive when stats are not available in metastore (Rajesh Balamohan via Chris Nauroth, Ashutosh Chauhan)  Signed-off-by: Ashutosh Chauhan <hashutosh@apache.org> 
Watcher: Improve assertion output in flaky test  The slack tests seem to fail periodically with not output This commit tries to add some more verbose output by making the query more broad and take failures into account to uncover, what happens in this test.  Relates elastic/x-pack-elasticsearch#836  Original commit: elastic/x-pack-elasticsearch@e601b3a0df71a8c1efc675d45f6de14ae674fc05 
Consistency checker closes the report file  when it's done writing the report, if any. Oh and StringLogger#lazyLogger() was changed so that close() on such will not first create the logger to then close it right after, instead close only if it was created earlier. 
Fix DefaultShardOperationFailedException subclass xcontent serialization (#43435)  The current toXContent implementation can fail when the superclasses toXContent is called (see #43423). This change makes sure that  DefaultShardOperationFailedException#toXContent is final and implementations need to add special fields in #innerToXContent. All implementations should write to self-contained xContent objects. Also adding a test for xContent deserialization  to CloseIndexResponseTests.  Closes #43423 
cleanup generics for the ingest action filters 
Update to latest Reactor snapshot 
[scene2d] Allow text button labels to be replaced.  Sometimes need to subclass Label. 
*Builder.java: add @param documentation for the node/value/edge types that clarifies their behavior.  This is in response to (and should resolve) https://github.com/google/guava/issues/3299.  RELNOTES=n/a  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=218186251 
Camel-Ftp: Removed unused imports 
Rename OperationAmb to OperatorAmb 
made more services implement com.oracle.graal.api.runtime.Service for faster loading 
Use default executor pool  Summary: There's no need to customize these (and the current customization uses way too few threads).  Reviewed By: ttsugriy  fbshipit-source-id: e38e4492 
Add Generic Types to StageBundleFactory  A stage will only ever consume one type of element. Add the type to the bundle factor rather than the call to `getBundle`. 
Rename beforeRead/Write() to resolveRead/WriteHints()  This commit also removes the ServerHttpResponse parameter, not needed here since it is possible to override the write() method.  Issue: SPR-14557 
Updated some Truffle-SL classes to new naming convention. 
Change default xmlBase to prevent exceptions on start up and errors every time the background thread checks for descriptors. Remove unused code block.  
CAMEL-13659: TokenizerDefinition to support string based contructor 
Minor fix to name of attribute used to store FlashMap instances. 
Add duration info to checkArugment() call in Suppliers.memoizeWithExpiration()  RELNOTES=Add duration info to checkArugment() call in Suppliers.memoizeWithExpiration()  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=198051129 
Fix graph traversal projections in SQL  Return a collection of RIDs instead of an OEdgeToVertexIterator, that creates problems in remote  Resolves: #8415 
support different order PEM files  Summary: The PEM sections inside client identity PEM files can be ordered in various ways, support all orders for reading certificates.  Reviewed By: rajyengi  shipit-source-id: b9aa0456fe 
Add SetCoordinator and EnqueueMinions to the DistBuildService.  Summary: [stampede] Add SetCoordinator and EnqueueMinions to the DistBuildService.  Test Plan: unit tests  Reviewed By: alisdair04  fbshipit-source-id: f734d94 
Protect against NPE when resolving generic array  Update ResolvableType to check that the resolved component type from a generic array is not null before attempting to use it to generate the resolved array class.  Issue: SPR-11044 
SimonStewart: Fixing the Augmenter so that it doesn't attempt to copy final fields  r11827 
Add ServerHttpResponse.addCookie method  This commit adds a `addCookie(ResponseCookie)` method to the reactive `ServerHttpResponse` interface.  Issue: SPR-15523 
fixed javadocs, reset formatting 
Updated test cases 
Don't show warnings and other logs when verbosity is turned off  Summary: Silent mode should only show failures.  Reviewed By: scottrice  fbshipit-source-id: 3fe439d 
Add missing @Override  
Refine exception handling  Refine exception handling responsibilities between the DispatcherHandler and the HandlerAdapter. 
CAMEL-10386: array size > 0 to enable nullsafe empty list expressions
removed deprecated concepts 
phase contracts: add contractor string to avoid eager evaluating getName for each phase.  getName is called on each phase every time and the first time the name is created, however this only is necessary to report an actual error. for this case constructing the string is fine. 
Rename package categorization. Cleanup package description. 
CAMEL-5948: Removed ObjectHelper.isPrimitiveType() utility as it's already provided through the java.lang.Class.isPrimitive() API itself.  
PR comments: final fields, explicit creation of system and other databases, explicit exception in case default db can't be found. 
AlexeiBarantsev: Enabling a couple of tests for HtmlUnitDriver that pass green in my local environment  r17098 
allSeesAllAsAvailable now has allSeesAllAsJoined as precondition Added test for starting up single instance cluster 
Fixing bug where write to transaction log would fail for values > 256KB  * Our call to buffer.put(...) was telling it to read beyond the end of the   byte array that it passed in and would therefore blow up with an   ArrayIndexOutOfBoundsException. * Added tests checking the writing of various sized values to the log channel 
_all: Stop NPE querying _all when it doesn't exist  This can happen in two ways: 1. The _all field is disabled. 2. There are documents in the index, the _all field is enabled, but there are no fields in any of the documents.  In both of these cases we now rewrite the query to a MatchNoDocsQuery which should be safe because there isn't anything to match.  Closes #12439 
add property  optimizeMessageStoreInFlightLimit on destinations so can set the inflight limit above which optimize store dispatch is no longer applied - for https://issues.apache.org/jira/browse/AMQ-3750  
Polish Javadoc for AopUtils, Advised, & related classes 
Remove unused field from HiveMetadata 
Add WorkProcessor#flatten method  This method enables flattening of WorkProcessors created directly by WorkProcessor#create It is also less complex then previous flatTransform implementation 
Allow prebuilt_cxx_library rules to be packaged as assets in Android  Summary: Mirrors logic from cxx_library  Test Plan: Used it in Facebook.  fbshipit-source-id: e6d31ee 
Remove unused SourcePathResolver from AndroidInstrumentationTest  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 0341188 
CLOUDSTACK-8754: VM migration triggered by dynamic scaling is failing This is caused by serialization failure for VmWorkMigrateForScale object. Replaced DeployDestination member present in VmWorkMigrateForScale with serializable types. 
Follow-Up to r1590120: Simplify code by using Integer.compare(int, int) which is available since Java 1.7.  
Variant of ProjectFilesystem.walkFileTree() which works in integration tests.  Summary: I was working on an integration test where `ProjectFilesystem.walkFileTree()` would fail essentially saying 'root dir does not exist'. I was confused because running the same buck build command as the integration test from inside both the `.../testdata/project` or `/tmp/junitxxx` (where `ProjectWorkspace` sets up a testdata project) would not fail!  So the reason the integration test was failing was because the current working directory which running those would be `~/devtools/buck` and not `/tmp/junitxxx`.  This diff adds an explicit `ProjectFilesystem.walkRelativeFileTree()` and makes sure that it works correctly in integration tests as well. I will send out another diff that uses this function in FilterResourcesStep. 
Don't check whether build files exist as frequently  Summary: Having the check when looking up TargetNodes makes little sense: if a TargetNode has been created then the file must have existed (otherwise how could we have read from it).  Test Plan: CI Manually:  1. buck build buck, make sure it's using buckd  2. deleted src/com/facebook/buck/rules/BUCK  3. buck build buck  4. confirmed that the build failed with a `missing BUCK file` error.  Reviewed By: k21  fbshipit-source-id: d7b6c94 
stop precomputing some fields in UnflavoredBuildTarget  Summary: This drops buckd idle memory usage after `buck project fb4a` from 1.9GB to 1.1GB.  Test Plan: buck project fb4a  Reviewed By: andrewjcg  fb-gh-sync-id: 84d22ed shipit-source-id: 84d22ed 
Better Javadoc for beginners 
Remove BWC conditions after backport of #35731  This PR was backported to 6.x, so the extra BWC conditions are not needed anymore 
Scheduler instances should be or behave like singletons  - remove the Func0 factory signature for Scheduler creation. 
rename: RuntimeCallStub -> ForeignCallStub 
[TEST] move FakeRestRequest to org.elasticsearch.test.rest  FakeRestRequest is used by a few tests and can also be leveraged by tests outside of elasticsearch. Moving the package will mean the class gets exported as part of the test jar. 
Cleanup type handling code for JDBC connectors 
Rename an argument in JoinFilterFunction for clarity 
Small refactor to SqlQueryExecution  SqlQueryScheduler#getStageInfo is guaranteed to be not null 
Change return type of openBufferedStream() on ByteSource, ByteSink and CharSink to the base stream type rather than the Buffered* type to allow implementations to avoid unnecessarily adding additional buffering to streams that do not benefit from it. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=46926342 
Polish: Maps with keys that are enum values should be replaced with EnumMap 
Clear expression caches on context shutdown  Issue: SPR-12691 
Added missing types to list of RPC types 
bug 10094: The problem was we added code that won't add any more ha work items if it already has one.  However, that is wrong.  HA Manager stores the existing snapshot of the VM state machine.  Before working on HA for a VM, it checks to see if that snapshot has been changed.  So by not scheduling HA work, we've effectively made HA not work under multi-failure situations.  I've fixed by removing that code and instead at the time of performing HA, do a quick check to see if there are pwork underway for the same VM and work scheduled in the future for that VM.  If there are work scheduled in the future, then we simply cancel the current work.  If there are already work underway, then we retry again in 1 minute. 
Remove ExecutorService constructor parameter from BuckEventBus.  Summary: A direct executor is always what we want in tests, so there is no need for it to be completely configurable.  Test Plan: CI  Reviewed By: michath  fbshipit-source-id: 3a66628 
Provide a message for callers of the EmptyTrustManager (elastic/x-pack-elasticsearch#2052)  This change will provide a exception with a message to any callers of the empty trust manager for better visibility into issues.  Original commit: elastic/x-pack-elasticsearch@c8241aea98801f4020a5e655a0b5b49d99d2cf03 
Continue some casual experimentation with HTTP/2. Apparently there is a "deadlock" with reads in some cases [like when shutting down and there's a blocked read, it's visible with the testsuite; I'll work on it].  
Add missing TruffleBoundary annotations 
CAMEL-10040 camel-ahc - Upgrade AHC client to 2.x - Fixed CS and little fixes 
Include the type of ProjectFilesystemDelegate used in the build trace.  Summary: This adds a metadata event to the build trace with the name `ProjectFilesystemDelegate` whose `args` have a property named `class` that is the name of the class of the `ProjectFilesystemDelegate` for the `ProjectFilesystem` for the root cell in the current build.  I decided to use `Class.getName()` to get the name of the class after comparing the options as described on https://stackoverflow.com/q/15202997/396304.  Test Plan: After doing a build in Eden, ran:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  and saw:  ``` [   {     "cat": "buck",     "name": "ProjectFilesystemDelegate",     "ph": "M",     "pid": 0,     "tid": 0,     "ts": 1502689765215000,     "tts": 1502689765215000,     "args": {       "class": "com.facebook.buck.eden.EdenProjectFilesystemDelegate"     }   } ] ```  Reviewed By: yiding  fbshipit-source-id: 82d2cda 
Add distinct from operator for BingTile type  Types with "equal" operator should also have "distinct from" operator, just like they do for "not equal" operator. 
remove dead code 
Rename bloom_analyzer setting to bloom_default_analyzer 
Reduce retention lease sync intervals (#40302)  This commit adjusts the frequency with which CCR renews retention leases and with which primaries sync retention leases to replicas. This helps Lucene reclaim soft-deleted documents more aggressively, which we have found in some use-cases can help improve performance, and either way will help keep disk space under more control.
Use Types.forName in ExpressionAnalyzer visitCast  Make Types.forName return null for unknown type so a specific Exception message can be generated 
Fix sharable check logic Motivation:  There is an logic issue when checking if ChannelHandler is sharable.  Modification:  Corrected || to && 
Document and improve the method names of the LLVMOption class 
added licence header 
Log and handle unresolved exceptions  Before this change use of ExceptionHandlingWebHandler did ensure no error signals are allowed to escape (hence relying on runtime behavior).  This change ensures the same is done even when ExceptionHandlingWebHandler is not configured for use, at the lowest level which is the WebToHttpHandlerAdapter. 
added javadoc and fixed some bad indentation 
Add `toJson` to various classes  The reflective call to `toJson` was a relatively late addition in the development of Selenium. It is now time to use it. 
CAMEL-9486: Add support for alternative syntax in Camel @UriEndpoint so we are aware of this. 
Move some stuff into the class that uses it  Summary: These constants will feel better in the type-specific helpers.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: 26a4c0d 
Add some toString() methods for debugging  
Clean up web application response builders 
Fix compatibility with JDK9    Cast runtime object retrieved reflectively to their public interface  counterpart.    See gh-7226
Update ConditionalOnJava and its usage now that Boot requires Java 8    Closes gh-6982
Suppress Neo4J-related deprecation warnings    See gh-6976
Address warnings caused by deprecations in Spring Framework 5    See gh-6977
[bs-14] Ensure all servlet context initializers are called    Misuse of TreeSet in EmbeddedWebApplicationContext corrected  (use List and Comparator instead of TreeSet).    [Fixes #48055339]
Fix #1411 Java Locale use '_' split language, country, variant. (#1413)
`URL` overload for `Retrofit.Builder#baseUrl`    Functionally does nothing, just somewhat cleaner to be able to do `baseUrl(URL)` than `baseUrl(URL#toString());` if handling a `URL` rather than `String`.  Used `HttpUrl.get(String)` as `HttpUrl.get(URL)` returns null instead of throwing an exception.
Support escaped characters in BasicJsonParser    This commit adds the ability to have escaped characters, like the quote,  when using the BasicJsonParser. It also adds a short test for escaped  quotes.    Closes gh-14521
Fix inconsistencies in javadocs.    These changes were made with consistency in mind, in relation to the rest of the project:   - Change self-closing <p/> tags to regular <p> tags.   - Add missing <p> tags.
Update multipart documentation.
Support protocol config for reference annotation (#1675)
Make sure exception tag values are not empty in web metrics    See gh-13187
Add external-file-property to LogFileMvcEndpoint    Add an additional property to LogFileMvcEndpoint to allow log files to  be read from an external location. This is helpful when a launch.script  is used to start the boot-application and the logfile is written by a  redirect of stdout/stderr.    Fixes gh-4255  Closes gh-4836
Prefer interfaces over concrete classes    Makes code easier to scan by removing unnecessary noise.
Add some missing Nullable annotations
Use a dummy value to further validation optional delegation    Prior to this other things might cause a null value. This ensures the value can only come from only place.
Reformat code using Spring code formatter plugin
Improve startup times    Improve startup times (although not by much) by adding more background  pre-initializers and lazily evaluating the whitelabel SpEL view.    See gh-6177
Move connection tests to Junit 5 (#6376)
Fix mapping of Cassandra's idle-timeout and heartbeat-interval    Previous to this commit the connection idle timeout and heartbeat  interval were mapped to seconds whereas Cassandra expects ms for all  duration types.    This commit fixes the mapping and removes the default duration unit  since it should be considered ms like every other duration properties.    Closes gh-23249
Polish 'Debug mode is not logging web and sql related loggers'    Closes gh-16018
Do not enable cglib if spring.aop.proxy-target-class is configured    This commit makes sure to honour the `spring.aop.proxy-target-class`  property if set by the user. Previously, the  `PersistenceExceptionTranslationPostProcessor` was always configured to  use cglib, regardless of the value of that property.    Closes gh-8887
Polish RSocket support
Polish 'Add configuration property for Spring Kafka's missingTopicsFatal'    Closes gh-16740
Polish 'Allow customization of MongoClientSettings.Builder'    Closes gh-9341
Generate default values from Duration and Period .ZERO    Closes gh-23082
Align with changes in latest Integration snapshots    See gh-22729
Remove use of regular expressions in Spring profile-based doc matching    Closes gh-1309
Report non-matching outer class conditions    Update ConditionEvaluationReport so that, whenever a negative outcome  is added for a source, any existing outcomes for inner classes of that  source are updated with a non-matching outcome that indicates that the  outer configuration did not match.    Conditions are evaluated in two phases; PARSE_CONFIGURATION first and  REGISTER_BEAN second. If a parent classÃ¢ÂÂs conditions match in  PARSE_CONFIGURATION then its inner classes will have their  PARSE_CONFIGURATION conditions evaluated. If they all match, the inner  class will be reported as a positive match in the auto-configuration  report even if the outer class does not match as a result of the  subsequent evaluation of a REGISTER_BEAN condition.    Fixes gh-2122
Rename preferred-mapper property so its clear it only applies to JSON    preferred-mapper has been renamed to preferred-json-mapper to make it  clear that it only affects the JSON mapper and that the XML mapper  that will be used (if any) is unaffected    See gh-2247
Order char encoding filter so it sets encoding before request is read    For the character encoding filter to work, it's vital that it sets  the request's encoding before any other filters attempt to read the  request. This commit updates the order of  OrderedCharacterEncodingFilter to be HIGHEST_PRECEDENCE and improves  the existing test to check that the ordering is as required.    Closes gh-3912
Apply spring.jackson.* config to Spring Data REST object mappers    Closes gh-1698
No-op ResetMocksTestExecutionListener when Mockito is not present    Closes gh-11508
Drop ignoreNestedProperties attribute from @ConfigurationProperties    Closes gh-8657
Align with API changes in latest Spring Data Kay snapshots    See gh-7461
Add comments for gRPC implementations
Add 'getUniqueServiceKey' to keep backward compatibility.
duplicate decrease for ExecuteLimitFilter onError (#4380)
Add spring annotation support for ConfigCenter.
Inject a leading . for better matching under JavaNetCookieJar    Closes: https://github.com/square/okhttp/issues/2549
Documentation for endpoint resolving on a base URL.
Remove deprecated error identifier.    This whole class is probably going to die or morph, but killing off tech debt before major refactorings makes me feel good.
Update documentation for handling of @Field and @Part values.
Rename 'pair' to 'field' to match annotation.    Closes #206.
Reset thread name to idle when not in use.    Closes #188.
remove unnecessary null check  before instance of (#4321)    Signed-off-by: jimin.jm <develope97>
move isMetaMethod to MethodUtils (#4387)
Honour ext and classifier on @Grabbed dependencies    We currently honour type, but ignore ext. Aether doesn't make a  distinction between the two so a Grab that specifies both type and ext  but with different values is considered to be an error.    Fixes #995
For #855, remove FrameworkMethod.getParameterSignatures()    Having this method in place made a class from the 'core' of JUnit  (org.junit.runners.model) depend on something from 'experimental' --  a dependency going in the wrong direction.
Replaced IllegalArgumentException for IOException    It's more consistent to throw an IOException instead of an  IllegalArgumentException
Remove usages of FrameworkMember as a raw type. (#1596)
Fix regression in TemporaryFolder.newFolder(String) for paths with slashes. (#1402)    In JUnit 4.11, newFolder(String) was changed to no longer support paths  with a file separator. This has been fixed. The overload of newFolder()  that supports passing in multiple strings still does not allow strings  containing file separators.
Add @Override annotations
Align SessionsEndpoint with Spring Session API improvements    This commit aligns SessionsEndpoint with  FindByIndexNameSessionRepository API improvements that simplifies  retrieval of sessions by principal name.    Closes gh-14124
Configure PathPattern for RSocket routing    This commit configures a `PathPatternRouteMatcher` in the RSocket  support if spring-web is on the classpath. This `RouteMatcher`  implementation is more efficient than the `SimpleRouteMatcher`, which is  based on the `AntPathMatcher`.    Closes gh-16865
Align counter behaviour between metric exporters    The MetricCopyExporter has had the capability for a while to keep  track of counters internally. This change aligns that with the  PrefixMetricGroupExporter.    Fixes gh-5762
Set UserDetailsService in default AuthenticationManagerBuilder    Only affects the default AuthenticationManagerBuilder (so when users  are not overriding the default global user details). Makes the  UserDetailsService effectively available as it would be if we used  AuthenticationManagerBuilder.inMemoryAuthentication() as a  shared object in the HttpSecurity.    Fixes gh-3152
Fix ordering of keys in PropertySourcesPropertyValues    Since @ConfigurationProperties binding uses a single instance of  PropertySourcesPropertyValues per bean, there doesn't seem to be  any issue with using a normal LinkedHashMap. Then the order  passed in as PropertySources will be preserved.    Fixes gh-2487
Use deterministic ordering of JavaBean methods    Update `JavaBeanBinder` so that methods and fields are sorted before  being processed. This ensures that setters are called in a deterministic  order, rather than the unspecified and variable order that reflection  provides.    Fixes gh-24068
Add group property to DynatraceProperties    See gh-19369
Optimize checks for java classes in Binder    Closes gh-13567
Fix issue 30. Make TestWatcher abstract.
Polish 'Fix request factory used with withBasicAuth'    Fixes gh-15982
make metadata key contain : when version and group is empty (#4465)
Typos in Javadocs
Throw exception with helpful message if annotated field is not public (fixes issue #260).
Move TestClassTest to package org.junit.runners.model.    It is common to add tests to the same package as the class under test.
typo for AccessLogFilter (#3633)
Class comment error (#3481)
Remove unnecessary use of grouping parentheses    Let's remove warnings found by errorprone.    - attempt  ```  okhttp/okhttp/src/test/java/okhttp3/CallTest.java:2056: warning: [UnnecessaryParentheses] Unnecessary use of grouping parentheses              sink.writeUtf8('attempt ' + (attempt++));                                          ^      (see https://errorprone.info/bugpattern/UnnecessaryParentheses)    Did you mean 'sink.writeUtf8('attempt ' + attempt++);'?  ```    - isEaualTo  ```  okhttp/src/test/java/okhttp3/OkHttpClientTest.java:287: warning: [UnnecessaryParentheses] Unnecessary use of grouping parentheses        assertThat(expected.getMessage()).isEqualTo(('protocols must not contain null'));                                                    ^      (see https://errorprone.info/bugpattern/UnnecessaryParentheses)  ```
Refactor: remove NetUtils.getHostAddress() and relace it with NetUtils.getLocalHost() (#5526)
Add Retrofit.Builder.adapterFactories(). (#2486)
Simplify code with Lambda (#4834)    Simplify code with Lambda
Remove unused import for unit test (#4976)    * clear unused import
Rename withStacktrace() to isException()/isThrowable()    Following suggestion by @sf105
fix #4587: enhance url equals (#6706)
refactor some string operations with StringUtils (#5112)    refactor string empty check statements.
When pool autocommit is disabled, inform Hibernate    Starting with Hibernate 5.2.10, the JPA property  `hibernate.connection.provider_disables_autocommit` should be set to true  when the datasource has autocommit disabled in order to improve  performance.    See gh-9737
Remove redundant throws.
Add @IntegrationComponentScan auto-configuration    Update Spring Integration auto-configuration so that  `@IntegrationComponentScan` from `AutoConfigurationPackages` is  implicitly applied. Prior to this commit `@MessagingGateway` interfaces  would only get picked up if `@IntegrationComponentScan` was added  alongside with the `@SpringBootApplication`.    Fixes gh-2037  Closes gh-7718
