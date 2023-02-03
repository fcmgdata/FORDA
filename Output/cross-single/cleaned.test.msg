Test placeholder expansion supports relaxed names    A test to ensure that the updated configuration properties support  correctly expands placeholders using mapped properties.    Prior to the updated support an `application.properties` file of the  form:     <tab> my.prefix.some-url=http://github.com   <tab> my.prefix.login-url=${my.prefix.some-url}/login    Would not correctly expand the placeholder against the environment  variable `MY_PREFIX_SOME_URL`    Closes gh-2496
Create jetty access log file in the temp directory
Remove ConfigurationProperySource    Remove `ConfigurationProperySource` from `PropertySourcesPropertyValues`  so that the deprecated code to continues to work.    See gh-4910
Try to make RunningDocumentationTests platform independent    Windows seems unable to decide if the temp dir is in System32 or  system32 which breaks the comparison. This commit attempts to appease  the gods of case sensitity by reducing the portion of the path that we  check so that system32 vs System32 doesn't come into it.    See gh-8920
Make RunningDocumentationTests platform independent    Closes gh-8920
Change codec auto-configuration in HandlerStrategies    Since SPR-15415 and SPR-15435, the HandlerStrategies and its companion  builder are now using the new CodecConfigurer infrastructure to  configure codecs in a cross-cutting way.    This commit looks for a custom instance of `HandlerStrategies.Builder`  provided by the user, or create a default one if none was found.    Fixes gh-8897
Polish 'Use JDK hashCode() variants for primitives'    Closes gh-8768
Restore DataMongoTestReactiveIntegrationTests    Closes gh-8885
Align test logging config with latest change in Spring Framework    See spring-projects/spring-framework@ea5cb26d750f
Update HtmlUnitDriver tests to align with HtmlUnit 2.26    See gh-8853 and cb34189c66a21def2b5f79fcc13a61a3e5828e37
Update tests that use WebClient following changes to its API
Fix compilation error with latest webflux changes    See commit c5bcefbd in Spring Framework, which refactored  the RequestMappingHandlerAdapter.
Add a missing test for 'Fix properties parsing for comment chars'    Closes gh-8699
Replace empty string concatenation with String.valueOf()    Closes gh-8686
Avoid problem caused by new mime mappings in Framework snapshots
Remove System.out    Closes gh-8647
Drop superfluous `@Order` annotation    Remove `@Order` which has no effect on `ImportBeanDefinitionRegistrar`.    Fixes gh-8603
Fix SpringBootVersion tangle    Update `SpringBootVersion` to no longer reference `SpringApplication`  for the root package.    Fixes gh-8610
Update tests to align with slight change in HtmlUnit's behaviour    See gh-8515
Remove unused parameter    Closes gh-8552
Remove deprecated OKHttp 2.0 tests
Polish forward merge to reflect renamed classes
Correct HAL Browser location to reflect version of web jar    See gh-8382
Fix forward merge of new SpyBean test to use correct Mockito 2 API
Adapt to Assert.instanceOf changes    Since SPR-15196, the behavior of `Assert` methods changed and some were  deprecated. This commit adapts to the new error mechanism implemented in  `Assert.instanceOf`.    Fixes gh-8140
Make use of new extensions point in IntegrationComponentScanRegistrar    SI 5 has made IntegrationComponentScanRegistrar more extensible by  offering a method for getting the back packages that can be  overridden.    This commit takes advantage of that change by removing our creation  of 'fake' annotation metadata and overriding getBackPackages to return  the auto-configuration packages instead.    Closes gh-7744
show scoring threshold in trace output, so it's clear exactly what calculation drove the decision to inject (or not)  r3361 
TIKA-196: Configuration parser fails in Java 1.4  Fixed based on suggestion by Dmitry Kudryavtsev.  
Make AbsTstCtxBootstrapper.resolveContextLoader protected  This commit increases the extensibility of AbstractTestContextBootstrapper by making the resolveContextLoader() and resolveExplicitContextLoaderClass() methods protected instead of private.  Furthermore, resolveContextLoader() now throws an IllegalStateException if getDefaultContextLoaderClass() returns null.  Issue: SPR-12682 
Reduce IN list size for tests  Some connectors are unable to deal with large NOT IN lists, reduce the size such that all connectors pass tests. 
AlexeiBarantsev: Adding tests for decoration of annotated and non-annotated element lists  r14574 
TIKA-692: TikaCLI -x or -h on a Word doc sometimes adds newline after </b> tag  Don't indent parser output to avoid unexpected extra whitespace  
No logical changes: remove unused import 
DanielWagnerHall: Add testname logging to debug CI problems  r9936 
Polish whitespace on JpaTransactionManager 
Revise SpringExtension based on recent changes in JUnit Jupiter  This commit revises the implementation of the SpringExtension to use the getRequired*() methods in the ExtensionContext which are now built into JUnit Jupiter thanks to inspiration from the initial "convenience" methods implemented here. 
Make MapType.getObjectValue fail if a map does not use SingleMapBlock  This makes sure that tests will fail if any one attempts to output a map that does not use SingleMapBlock. It also affects production use, in particular serialization for Presto client protocol. 
First pass add fixing the not implemented list for Oracle  
Use unmodifiableSet in Analysis#getColumnReferences  Previously a copy of set was made that used equality instead of identity for comparisons. 
Add missing space after comma in TestVarbinaryFunction  Fixes checkstyle failure 
added test for expression re-evaluation 
FrancoisReynaud: updating the URL grid listen to so that it matches the url of a webdriver server.Keeping the old url as well for backward compatibility.  r12271 
SPR-6464 Add one more minor Javadoc comment 
Be explicit about webapp version  
Update imports following TIKA-1361 changes, to match our current preference for explicit (not wildcard) imports  
make ConnectionType searilize as integer (#6176)  https://github.com/SeleniumHQ/mobile-spec/blob/master/spec-draft.md#device-modes expects connection type to be serialized to an integer as well as chromedriver does not accept currently sent string value.
Fix bottleneck in InternalResourceGroup::internalGenerateCpuQuota  internalGenerateCpuQuota() is called from InternalResourceGroupManager::refreshAndStartQueries(), which is called every millisecond to start queries. Under a high query submission rate internalGenerateCpuQuota() becomes a bottleneck when Math.multiplyExact() throws an exception (which is possible with the default value of cpuQuotaGenerationMillisPerSecond) while holding the monitor of the root resource group. Plenty of methods in the query starting path grabs the monitor of the root resource group, and since internalGenerateCpuQuota() locks the root for extended amount of time (due to filling in the stack traces when exceptions are thrown) the rate at which the coordinator starts queries drops significantly. This change fixes that by using the guava math methods, which don't throw exceptions on overflow.  In a performance test before the fix, given a config that allows 200 concurrent queries the coordinator was only able to run < 50 queries in the cluster. After this fix it was able to saturate the entire cluster. 
Complete the lists of unmapped ciphers Test now passes but keep disabled as it currently requires openssl and that needs to be optional  
remove javadoc warnings from cache(); add @since annotation to cache(b) 
Size BlockBuilder appropriately in array_intersect  Previously we allocated one row worth of space per byte of input 
Clean up warnings in SampleAsyncTests 
JasonLeyba: Remove unused imports.  r17993 
remove an uneccessary System.out.println statement     
Use IntArrayList in TypedSet to avoid wasting memory  Before this change, TypedSet used IntBigArray which allocates at least 8KB at initialization, while initialization of IntArrayList only consumes no more than 256 bytes.  This change might fix the memory limit issues in map_agg and multimap_agg. 
Refactor in preparation for fixing BZ 55120  
Update exception message when no page sink provided  Previously the exception would say `No page sink provider for connector 'catalog-name'`. 
TIKA-2249 -- update javadocs to alert devs that tables are not "maintained" by the PDFParser 
Make names consistent with standard Java names  
No logical change: reformatting code 
Remove unused StatementAnalyzer#analyzeWhere method 
Added ASM-based tests for custom scoping annotations  Issue: SPR-11574 
DouniaBerrada: Consolidating synchronized blocks in AndroidWebDriver.java when waiting for a page to load.  r15647 
Fix resource leak in query queue  Queries can transition to the CANCELED state before they are started. In particular, this happens if a user cancels their query while it is queued. In this case, the state change listener is never called, because the query is already finished, and this leaks one slot in the query queue. 
Fix bad version check for old RCFile header 
Use buffered bytes to estimate compression ratio 
AlexeiBarantsev: Adding a space between the browser flavor and the path. Fixes issue 2413  r13909 
SimonStewart: Deprecating methods from the RenderedWebElement that are no longer meaningful  r10415 
Refactor TransformUncorrelatedInPredicateSubqueryToSemiJoin  Remove unnessasary class InPredicateRewriteResult and remove copy paste code of adding inPredicate mappings by pushing it down to the rewriteInPredicates method. 
Remove unnecessary type arguments 
Change some TestTaskExecutor tests to use new scheduler 
Extracted some methods for SessionExtensionJS test   r5434 
Refactor choosing distribution for plan fragments 
Corrected date pattern in JavaDocs  The 'hh' pattern should be 'HH' as ISO dates use 24hr notation. 
Update javadoc for new tooltip implementation  
Remove duplicated code  
using junit assert, not selenium assert now, so we need to catch junit exception  r2252 
Adding null check for username being null.  The username is usually not null, but it  could be for some embedded databases.  Always setting generatedKeysColumnNameArraySupported to false when getGeneratedKeysSupported is false, since it can't be supported without having generated keys supported. This change only affects logging messages.  Issue: SPR-9006 
DispatcherPortlet uses a forward for rendering a view as resource response  Issue: SPR-9876 
ignore failing test for now - andy c to investigate next wk 
Change type of currentSize to long  This change is for preventing potential overflow. 
MichaelTamm: Reverted changes to TakesScreenshotTest.java because the broke the build -- it worked in IntelliJ IDEA :(  r12226 
Rewrite projection only if there is inPredicate mapping  Rewriting ProjectNode when there is no inPredicate mapping is not needed. What is worse it makes planning to be much slower as it is performed for each ProjectNode.  Fixes #6129 
Rename minimumNumberOfTasks to minimumNumberOfDrivers 
Implement toString for OutputType.  Returns a String that textually represents the object. I desire this for viewing in a debugger and for user code that logs OutputType.  Signed-off-by: Seva Lotoshnikov <vlotoshnikov@gmail.com> 
restore using SeleniumServer.getDefaultPort to determine what port to talk to.  This is so I can set the Java property selenium.port in my environment and not use a standard port, which protects me from the possibility of interfering w/ anyone else's selenium server should I be working on a host where I'm not alone (e.g., bugles -- not that I plan on doing anything on that box anytime soon).  r3699 
minor tweaks to javadocs for new onBackpressureBuffer variants 
Calculating capacity before allocation.  This commit optimizes the `CharSequenceEncoder` to allocate `DataBuffer` instances with a predicted capacity.  Issue: SPR-17558 
Start scheduling query management thread in a separate method  To prevent unsafe publication. 
On balance, I think keeping these methods separate is the better option due to: - easier to follow code - simpler maintenance - subtle differences between blocking/non-blocking that may be lost / become less obvious if combined - ability for sub-classes to over-ride  
Disabling a test that fails in geckodriver 
Size BlockBuilder appropriately in map_values  Previously we allocated one row worth of space per byte of input 
WW-3163, fixing NPE, but throwing StrutsException instead, not a great fix, but when I get a chance to work closer with JBoss, I will come back to this  
WW-1422   - fixed else tag executed when it is not suppose, when used with ElseIf tag.  
JasonLeyba: Removing unused import that slipped in with r8018.    r8019 
Increase the write timeout (5s -> 10s) to see how the test reacts (or if it's a deadlock somewhere), I see some significant spikes in my own testing if I put some load on my computer.  
Make `newRemoteWebElement` `protected`  - Reverted newRemoteWebElement() method visibility from private to protected so other depending frameworks didn't break. - Fixes : https://github.com/qmetry/qaf/issues/119 which was introduced because of newRemoteWebElement method visibility changed from protected to private - minor code improvement to reduce representative statements and it will also support any Dialect added in future.  Signed-off-by: Simon Stewart <simon.m.stewart@gmail.com> 
[java] Fixing a unit test to make it independent on the current platform 
Fix failure in performance build  The JettySockJsIntegrationTests are enabled in the performance build only. Following the upgrade to Jetty 9.3 where the JettyRequestUpgradeStrategy is now Lifecycle as wel as ServletContextAware, we need to make sure the ApplicationContext refresh occurs after the ServletContext has been set. This change removes the explicit .refresh() call in the test setup and instead relies on the DispatcherServlet to do that, which ensures that the ServletContext with which it is initialized by Jetty has been set on the ApplicationContext before that. 
Skip shards in progress for temporal compaction  When pick shards for compaction, we should filter out the shards that are currently submitted for compaction as it can cause transaction conflicts. This was missed out for temporal compaction in an earlier commit. 
Update Javadoc to reflect changed default for useEquals  
SimonStewart: Remove printf debugging  r16828 
cleanup; remove no longer needed check  Signed-off-by: Simon Stewart <simons@fb.com> 
WW-1410   - Provide a hook for FilterDispatcher such that a custom Dispatcher     could be used.    
AlexeiBarantsev: Adding "non-null" check. Fixes issue 4906  r18343 
Remove unnessasary Lookup::resolve usage 
Fix SPEL tests when using maven.  With the maven test runner expression.spel.SetValueTests is run before expression.spel.EvaluationTests. The order is reversed in eclipse/spring-build.  Static variables are modifed in SetValueTests that cause EvaluationTests to fail if it is run first.  Make a simple fix so SetValueTests uses a local evaluation context variable instead of a static variable. 
Free DriverContext reserved when OperatorContext fails to reserve 
Delegate to common ClassUtils.getQualifiedName  Issue: SPR-15237 
URIEditor uses straight ClassPathResource.getURI() access  Issue: SPR-16581 
Moving a test from gson to our json 
Test for actual HttpInvokerProxyFactoryBean usage with plain FactoryBean return type  Issue: SPR-12141 
WW-1349 MailReader - Change to Spring copyproperties, per Matt Raible's suggestion, since OSCore BeanUtils has been removed from Struts Core.  
Add comparison test 
Polish Javadoc for EmbeddedDatabaseBuilder 
WW-1823 rename getAutocompleterModel to getAutocompleter in StrutsModels  
Add Null Check before registering a metric. 
Unblock probe side as soon as all partitions ready or spilling  Previously probe side was unblock only after build side fully consumed the input. This commit unblocks probe side as soon as every partition is either ready or spilling. 
Follow-up to 1617445. Updated expected value that has changed in 1617445  
Preserve ordering in window assertion output  Keeping the output in the same order as processed by the window operator makes it easier to reason about and debug failures. 
Showing user friendly error message about htmlrunner CLI options instead of stacktrace 
Add join pruning plan test 
Add test to assess claims in SPR-10411  This commit verifies that the return type of a parameterized instance factory method is properly resolved.  Issue: SPR-10411 
JasonLeyba: Reduce log level.  r16847 
Delete unused imports 
SimonStewart: rolling back an overly eagerly checked in change  r12510 
DouniaBerrada: Changing main context from /hub to /wd/hub for Android to be consistent with the RWDS.  r12423 
Add some tests for truncated valid values  
we need this referer check t be cmore inclusive now that proxy injection mode is there as well, since the same prolem occurs with PI mode, only that the referer URL is slightly different   r2696 
Add --container-aware-detector option to the Tika CLI, which will switch the detector used by the auto parser  
Support nullable arguments in PolymorphicScalarFunction  Similarly how those are supported in ReflectionParametricScalar.  For nullable arguments primitive wrapper must be used instead of primitive type. Those arguments must be properly matched to the type returned by `Type#getJavaType` which is usually primitive. 
Javadoc improvement. Fixes #4194 
Follow-up to r1791095 Need to update OpenSSL names for ciphers that are not supported by IBM JREs  
java: Adding a method toList that allows converting CompositeAction to JSON 
clean up onBackpressureDrop() javadocs and make similar to those for onBackpressureBuffer() (#1854) 
Remove debug code  
GeometryType write functions to handle null slice 
Re-reading the spec, this is not required.  
Ignore furthur messages after entering terminate state 
clean up coordinator component conf 
Remove redundent is decimal check  Check for decimal type is already performed at: com/facebook/presto/rcfile/RcFileEncoding.java:89 
Add minor optimization to AbstractErrors  Issue: SPR-11304 
Add support for extracting boolean literals 
WW-4044 Solves problem with infinitive loop when used with <s:action/> tag and attribute executeResult is set to "true"  
2.x: update some marbles of Observable (#5351)  
Add additional tests for StandardErrorCode 
KevinMenard: Removed an unnecessary semicolon.  r15040 
WW-4036 Extends support of Dynamic Attributes to evaluate null attributes to empty string  
Remove unused method 
Add the so-far needed properties specific to concrete plan nodes 
directly compare stderr to empty string in testRedirectionOfStreams to obtain more meaningful messages if test fails 
Remove completed TODOs and pointless Javadoc  
Add additional test for SPR-16210  Issue: SPR-16210 
SimonStewart: Removing deprecated methods from the FirefoxProfile  r14715 
Cleanup: Remove unused imports (#6591)  Remove unused imports in java/client to prevent unwanted dependencies.
Remove redundant format call 
Adding a guard to a logging test that should fail in chrome with chromedriver1 
DefaultSubscriptionRegistry defensively checks for removal between keySet and get calls  Issue: SPR-13205 
SimonStewart: Making our use of the Map constructor for DesiredCapabilities more robust  r5828 
TransactionAspectSupport stores given PlatformTransactionManager instance as strong reference  Issue: SPR-14609 
TIKA-1955: Updated to use mark() and reset() 
Never return null from AnnotationMetadata.getMetaAnnotationTypes  Issue: SPR-17046 
Remove AbstractWebSocketClient from SockJsClient  SockJsClient now implements WebSocketClient directly without extending AbstractWebSocketClient.  Issue: SPR-12030 
Deprecate aggregate in favor of reduce  We have had aggregate from Rx.Net for a while but long ago migrated to reduce as the primary. Time to deprecate it. 
Only try and set the Firefox profile if it's not null.  Otherwise, we get an exception being thrown, which is less than ideal. 
Added check to not delegate to objectfactory when unknown bean is object factory WW-1491   
[java] Small refactoring of debug server 
Add some simple JavaDoc descriptions of the property types, to help people who don't natively speak xmp! (TIKA-926 related)  
STORM-3161 Local mode should force setting min replication count to 1  When topology.min.replication.count is set to more than 1, nimbus in local mode never achieve condition for replication, hence stuck on handling blobs. We should force set it to 1 in local mode to avoid this situation. 
Code cleanup in mocking storm-starter tests 
STORM-3328 Allow overriding function name for BasicDRPCTopology 
Update Javadoc on exception resolvers in MVC config  Issue: SPR-15324 
Make GroovyBeanDefinitionSource accessible to the CLI again    It was made package-private in 31b0e817 but it needs to be protected  due to its use in the CLI's GroovyBeansTransformation.
Don't mock package private class    See gh-7770
Fix implementation of PoolingConnectionFactoryBean.createXAContext()    Closes gh-7306
simplify map empty judgment (#3376)
collect async export services (#5905)
Doc error. `@QueryMap` with `encoded=true` will stop default url encoding. So, calling with `foo.list(ImmutableMap.of('foo', 'foo+bar'))` yields '/search?foo=foo+bar' instead of '/search?foo=foo%2Bbar'.
Fix foo/bar/baz in @Query documentation
Ensure checking customizer ordering    See gh-15603
Make stylistic changes    Put { on first line with a space before it
Replace use of deprecated Reactor MonoProcessor in tests    Fixes gh-23627
Fix undertow access_log file name    Undertow 1.3.2 changed the default access log file suffix from '.log'  to just 'log'. Thus we need to adapt the file name pattern to include  the missing dot.    Closes gh-4670
Doc: OkHttpClient should be treated as immutable once shared    ...given that requirement, it's safe for many threads to call the  open() method concurrently to open their own connections.    https://github.com/square/okhttp/pull/634#discussion_r10487815
Remove redundant judgment (#5456)
Use try-with-resources in HttpTunnelPayload    See gh-11779
Remove redundant field fCause
In order to facilitate the consumer to better locate the failure of provider token check, the token value called by consumer will be printed out in the exception information (#6800)
Making Super and Sub member classes as suggested.  https://github.com/KentBeck/junit/pull/293/files#r403246
Close ResponseBody on 204/205 to avoid connection leak
Release websocket transmitter before failing response #4695
Remove outdated reference
Default to optimized launch of the JVM when using spring-boot:run    See gh-16941
Add some missing @Nullable annotations to Utils
Add some missing Nullable annotations
Don't throw NettyWebServer on permission errors    Update `NettyWebServer` so that the `PortInUseException` is not thrown  for permission denied errors.    Fixes gh-19807
Make containsDescendantOf a default method    Change `ConfigurationPropertySource.containsDescendantOf` to have a  default implementation that return `UNKNOWN`.    Fixes gh-12539
Log warning on slow host resolution    Update `StartupInfoLogger` so that if the `InetAddress` call takes  more than 200ms a warning is logged.    Closes gh-7087
Change LoggingSystemTests to use real temp folder    Update AbstractLoggingSystemTests to use a TemporaryFolder rule.    Fixes gh-3349
Move osgi tests to Junit 5 (#6373)
document support for SNI
Fix health indicator auto-configuration order    Previously, the health auto-configuration `AutoconfigureOrder` entry for  couchbase was referring to the standard couchbase auto-configuration that  is not responsible to configure the `CouchbaseOperations` bean. Yet, the  health indicator implementation was relying on the presence of such a  bean.    This commit fixes the `AutoconfigureOrder` entry so that it refers to  `CouchbaseDataAutoConfiguration` now.    Closes gh-7543
Polish contribution    Closes gh-15984
Fix data type of telnet and ssh ports    Define shell.ssh.port and shell.telnet.port as integer properties  so that the generated meta-data exposes the proper type.    Fixes gh-2076
Add default order for JobLauncherCommandLineRunner    Closes gh-2943
Disable bean method proxying in SpringBootJdbcConfiguration    Closes gh-22231
Test that LaunchedURLClassLoader works when thread is interrupted    Previously, RandomAccessDataFile used a semaphore and acquired it  interruptibly. This meant that an interrupted thread was unable to  access the file. Notably, this would prevent LaunchedURLClassLoader from  loading classes or resources on an interrupted thread.    The previous commit (937f857) updates RandomAccessDataFile to acquire  the semaphore uninterruptibly. This commit adds a test to  LaunchedURLClassLoader to verify that it can now load a resource from  an interrupted thread.    Closes gh-6683
Better diagnotics when ESCF subclass breaks with custom management port    When a custom management.port is used, the child context is configured  with an EmbeddedServletContainerFactory bean that has the same class  as the parent contextÃ¢ÂÂs EmbeddedServletContainerFactory bean. This  ensures that the child context uses the same type of embedded container  as its parent when there are multiple embedded containers on the  classpath. It also causes a failure when the custom  EmbeddedServletContainerFactory subclass cannot be instantiated, for  example because itÃ¢ÂÂs an anonymous inner-class.    This commit improves the diagnostics so that we fail fast with an  information exception message when we detect that the embedded servlet  container factory beanÃ¢ÂÂs class cannot be instantiated.    Closes gh-6193
Set TCCL before initialising test class in FilteredClassPathRunner    Closes gh-7435
Use accessor for in-progress async count added in Tomcat 9.0.33    Closes gh-20440
Avoid creating unnecessary garbage during URL normalization    Closes gh-11207
Ensure that JtaAutoConfiguration runs before ArtemisAutoConfiguration    Closes gh-7062
Ensure that AWTError from image banner does not prevent app starting    Closes gh-6617
Log classpath once environment has been prepared    Previously, the classpath would be logged in response to the  ApplicationStartedEvent. At this point, logging could be disabled  while the logging system is being initialized, or because the  log levels configured in the environment have not yet been applied.    This commit moves the logging to happen in response to an  ApplicationEnvironmentPreparedEvent by which point the logging  system has been initialized and its levels have been configured.    Closes gh-5313
Align test with Spring MVC's internals once again    The internals have been updated so that the field that was originally  used, interceptors, can be used again.    This reverts commit 2a1bca6806a696dadf7f470086e21d55f66ac953.
Align default scopes for Google with changes in Spring Security 5.0.1    Closes gh-11573
add @SPI annotation (#6436)
DynamicConfiguration: return default value if not implemented. (#6086)    fixes #5916
add comment for FutureAdapter, see #3979
Fixed typo in NamedThreadFactory: mDeamo
Fixed #520 change Main.class wait/notify to lock/condition
Make the crawler a little better.    Name threads by their URLs. Don't follow all fragments of the same URL.
Fix an invalid HTML entity in the SlackApi Javadoc.    And-per-se-and
Add Call.isExecuted().    Might be useful to expose this bookkeeping to app developers.
Fix flakiness in CallTest.cancelTagImmediatelyAfterEnqueue()    There's a race where the HTTP engine has been created, but not yet connected  and the cancel isn't as immediate as it could be. Fix the test by making sure  there's a response to be retrieved.    With the upcoming connection pool changes we might make the implementation  more robust.    Closes: https://github.com/square/okhttp/issues/2001
Test that conditional misses update the cache.    Closes https://github.com/square/okhttp/issues/1712
Add a test for interceptors throwing unchecked exceptions.    Our behavior here is not good. Right now it looks like we're leaking  resources; nothing is releasing the socket in a 'finally' clause when  interceptors crash. We're also not notifying the callback that the  call has failed; that's left hanging.    That said, we don't expect applications to recover from these  exceptions.    Closes https://github.com/square/okhttp/issues/1482
Test for redirect leak bug.
Make ConnectionPoolTest less flaky    I was seeing flaky results in the debugger because pooled  connections were being evicted as the test ran.
Add missing import.
Fix annotation link. EncodedPath is gone.
Add docs about null responses.
Properly name ignored exception in 'catch' block.
Correct javadoc to point to proper annotation.
Request entity tests for the Apache client shim.
Minor doc fix.
fix misspelling    git-svn-id: http://code.alibabatech.com/svn/dubbo/trunk@145 1a56cb94-b969-4eaa-88fa-be21384802f2
extract duplicate code to a method (#5541)
Deprecate rule ExpectedException (#1519)    The method Assert.assertThrows provides a nicer way for verifying  exceptions. In addition the use of ExpectedException is error-prone  when used with other rules like TestWatcher because the order of rules  is important in that case.
Converted tabs to spaces    Converted tabs to spaces for newly added code to be in line with  guidelines.
remove reference destroy guardian (#5863)    fix #5855
move construction of ConfigChangeEvent outside the lambda expression (#3398)
fix typo (#3110)
Enable ZookeeperMetadataReportTest (#3360)
Adding a human-readable name to the Server interface
AndroidLog: Added getTag() and logChunk() methods    Ã¢Â?for easier subclassing.
fix:Remove unused variable parameters in AbstractProxyInvoker (#5651)
minor ParentRunner refactoring
Fix style nits per review
Used assertArrayEquals to avoid converting an array to a list.    Incomplete - task : Issue 551: Resolve sensitive equality in  MethodSorter test.
Refactoring of the test case for JVM Method sorter    Removed the string based equality, and improved naming  (in particular calling the expected result 'actual' was confusing).    Incomplete - task : Issue 551: Resolve sensitive equality in  MethodSorter test.
fix #1641, support get system load on windows (#2631)
Close the context in TypeExcludeFilterTests    Closes gh-5672
spelling: methods
Simplification of theory parameter names, since format automatically deals with toString() and nulls.
Added two simple tests for boolean assertArrayEquals
Make code of process callback of method cleaner in DubboBeanDefinitionParser (#4770)
Correct @Parameter config of field of ConfigCenterConfig (#3688)
Polish apache/dubbo#6296 : Adding the new methods into MetadataReport to manipulate the exported URLs for service introspection (#6299)
Fix missing trailing / in resource paths
improved names of test methods
Prefer ByteString.encodeString.    This saves cloning the byte array because the byte array can't be modified by the caller.
Fix code reference in Javadoc.
Remove untrue Callback statement from doc
Change COMPATIBLE_TLS to be TLSv1.0 and not SSLv3    Based on a discussion with Jesse Wilson during  https://github.com/square/okhttp/pull/1189.
Prevent MockSpdyPeer interfering with Android tests    On Android we run the OkHttp tests as an instrumented test case.  The default UncaughtExceptionHandler on Android will quit the  app, causing the current test to fail.    MockSpdyPeer creates a thread that fails for various reasons  that are not related to / required for the actual test. Often the  exception is thrown during a subsequent test.    This change logs the exception but prevent it from  propagating out of the top of the call stack. This decreases  overall flakiness.
Fix ResponseCacheTest for Android    Pull #1011 broke ResponseCacheTest on Android.    The test was asserting a header generated  using a copy of the old broken implementation.    The test now just uses HttpDate, which now has its own  tests.
Fix for SslContextBuilder/MockWebServer disagreeing about localhost    MockWebServer binds to getByName('localhost'), SslContextBuilder was using  InetAddress.getByName(null) (null == any loopback). On Android, null  returns IPv6 loopback, which has the name 'ip6-localhost'.
Remove unused code.
Remove unnecessary null check and fix typo.
Remove unnecessary null check.
Remove unnecessary null check.
Use JSONObject.putOpt in JsonConverter    Closes gh-15595
fix #789: Reorder test to ensure call is canceled before its body is returned.
We're 4.7 now    Signed-off-by: Kent Beck <kent@threeriversinstitute.org>
getNanos() is a single thread confinement. Volatiles not needed!
Improved Test: ParallelMethodTest fails few times
Add test for nested properties
Enhanced missing test.jar error message
Deprecate Assert#assertThat    The method 'assertThat' is used for writing assertions with Hamcrest.  Hamcrest is an independent assertion library and contains an own  'assertThat' method in the class 'org.hamcrest.MatcherAssert'. It is  available both in the old Hamcrest 1.3 release and in the current  Hamcrest 2.1. Therefore the JUnit team recommends to use Hamcrest's own  'assertThat' directly.
reformat with two-space indent
Use %n in string.format() (#1346)    In format strings, it is generally preferable better to use %n, which will produce the platform-specific line separator.
Remove useless variable (#1342)
Removal of Unnecessary Creation of String Builder    if typeArguments has length 0 there is no point to create stringBuilder for that. that condition check needs to happen before stringBuilder creation.
Fix javac build    Replace both() with allOf()
Fix typo in test name
Upate TestName to make the 'name' field volatile.    This ensures that the name is published across threads correctly--for  instance, if a parallelized runner is used.    Closes #1157
Update javadoc based on PR comment.
port #3568 into main trunk (#3993)    fixes #3991
switch from CopyOnWriteArrayList to regular list in order to avoid potential UnsupportedOperationException (#3978)    Fixes #3242
Defensive check to solve issue #3923 (#3931)
#2072: need javadoc and articles for spring annotation use. (#2076)
rename log file from alibaba to custom-access (#2057)
remove getContext() (#3235)
add unit test for parsing path
adds optional request body for DELETE requests to ammend #610
HTTP/1 >> HTTP1
Reused HasWrongExpectedException instead of own defined class  (they were the same) and relocated the changes to a better location  in the file which is more inline with the rest of the file. And,  of course, removed the superfluous brackets.
Align TestRestTemplate Javadoc with documentation    See gh-21318
Removed the unnecessary Note: block in javadoc
format code style (#2475)
Remove unnecessary null check    See gh-17916
Close all servers/ports after tests finish (#2741)
Fix typo #1260
Change CopyOnWriteArrayList to regular list in DubboProtocol (#4056)
