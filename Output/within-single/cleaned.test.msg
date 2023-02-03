Test placeholder expansion supports relaxed names    A test to ensure that the updated configuration properties support  correctly expands placeholders using mapped properties.    Prior to the updated support an `application.properties` file of the  form:     <tab> my.prefix.some-url=http://github.com   <tab> my.prefix.login-url=${my.prefix.some-url}/login    Would not correctly expand the placeholder against the environment  variable `MY_PREFIX_SOME_URL`    Closes gh-2496
Create jetty access log file in the temp directory
Remove ConfigurationProperySource    Remove `ConfigurationProperySource` from `PropertySourcesPropertyValues`  so that the deprecated code to continues to work.    See gh-4910
Try to make RunningDocumentationTests platform independent    Windows seems unable to decide if the temp dir is in System32 or  system32 which breaks the comparison. This commit attempts to appease  the gods of case sensitity by reducing the portion of the path that we  check so that system32 vs System32 doesn't come into it.    See gh-8920
Make RunningDocumentationTests platform independent    Closes gh-8920
Change codec auto-configuration in HandlerStrategies    Since SPR-15415 and SPR-15435, the HandlerStrategies and its companion  builder are now using the new CodecConfigurer infrastructure to  configure codecs in a cross-cutting way.    This commit looks for a custom instance of `HandlerStrategies.Builder`  provided by the user, or create a default one if none was found.    Fixes gh-8897
Polish 'Use JDK hashCode() variants for primitives'    Closes gh-8768
Restore DataMongoTestReactiveIntegrationTests    Closes gh-8885
Fix devtools support in NettyWebServer    This commit improves the lifecycle of the `NettyWebServer` and allows  multiple restarts when using devtools. Previously, the lifecycle was  tailored for a single start/stop cycle.    Fixes gh-8771
Align test logging config with latest change in Spring Framework    See spring-projects/spring-framework@ea5cb26d750f
Update HtmlUnitDriver tests to align with HtmlUnit 2.26    See gh-8853 and cb34189c66a21def2b5f79fcc13a61a3e5828e37
Ensure that entry is completely configured before putting to the stream    Previously, BootZipCopyAction would put the next entry to the stream  and then, in the case of a stored entry, configure its size, CRC32  etc. This had the benefit of being able to copy the entry into the  zip once, capturing its bytes for the calculation of the CRC32 as it  was copied. Unfortunately, while this produced zip files that could  be read by the JVM, other zip tools failed. For example, Go's zip  support that's used by CloudFoundry could not unzip the archive.    This commit updates BootZipCopy action to completely configure the  entry before putting it to the stream. This has the downside of  copying the file twice (once for the CRC32 and once to actually write  it to the zip stream) but this appears to be unavoidable as we have to  produce archives that can be unzipped without problems on all  platforms.    Closes gh-8816
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
Ignore test until couchbase support is restored    The changes required to restore our Couchbase support are too involved  and we should hear from the data couchbase team first.    See gh-8200
Adapt to Assert.instanceOf changes    Since SPR-15196, the behavior of `Assert` methods changed and some were  deprecated. This commit adapts to the new error mechanism implemented in  `Assert.instanceOf`.    Fixes gh-8140
Make use of new extensions point in IntegrationComponentScanRegistrar    SI 5 has made IntegrationComponentScanRegistrar more extensible by  offering a method for getting the back packages that can be  overridden.    This commit takes advantage of that change by removing our creation  of 'fake' annotation metadata and overriding getBackPackages to return  the auto-configuration packages instead.    Closes gh-7744
Test: improve error message on leftover tasks  After every REST test we wait for the list of pending cluster tasks to empty before moving on to the next task. If the list doesn't empty in 10 second we fail the test. This improves the error message when we fail the test to include the list of running tasks. 
Shutdown all connections opened in the testcase so that the broker shutdown between cases.  Fixes failures that happened ocasionally   
show scoring threshold in trace output, so it's clear exactly what calculation drove the decision to inject (or not)  r3361 
GraalCompiler: rename LIRTier scope to LIRStages. 
Use default Skylark semantics.  Summary: Bazel is now using lazy ranges by default. Woohoo.  Reviewed By: philipjameson  fbshipit-source-id: 65a08d1079 
Issue #1555: Make return collection 'unmodifiable'  Fixes `ReturnOfCollectionField` inspection violation.  Description: >Reports any attempt to return an array or Collection field from a method. Since the array or Collection may have its contents modified by the calling method, this construct may result in an object having its state modified unexpectedly. While occasionally useful for performance reasons, this construct is inherently bug-prone. 
Make dummy HiveEventClient use DEBUG log instead of INFO  This reduces logging output during tests. 
Test: Guard deprecation check when 0 nodes created  The internal test cluster can sometimes have 0 nodes. In this situation, the http.enabled flag will never be read, and thus no deprecation warning will be emitted. This commit guards the deprecation warning check in this case. 
CAMEL-7351: camel-cache - Should create default cache manager factory if no specific config file configured 
TIKA-196: Configuration parser fails in Java 1.4  Fixed based on suggestion by Dmitry Kudryavtsev.  
parent/child: Explicitly disabled the query cache  It was already disabled, but during tests the test framework enabled the query cache by setting the static default query cache. The caching behaviour should be the same in production and in tests. 
Make AbsTstCtxBootstrapper.resolveContextLoader protected  This commit increases the extensibility of AbstractTestContextBootstrapper by making the resolveContextLoader() and resolveExplicitContextLoaderClass() methods protected instead of private.  Furthermore, resolveContextLoader() now throws an IllegalStateException if getDefaultContextLoaderClass() returns null.  Issue: SPR-12682 
For https://issues.apache.org/bugzilla/show_bug.cgi?id=53119 Port r1344253 to AjpNioProcessor  Prevent possible overflow exception with buffer in AjpNioProcessor.output() if it is called again after the previous write failed with IOException.  This is based on review of the issue fixed by r1344253. I see several reasons why it is hard to observe in Nio, but it is easy to prevent this issue. An overflow exception is bad because it is RuntimeException and is generally unexpected. This change: - avoids writing to the buffer if att == null - always clears the buffer. Note that Buffer.clear() method is rather lightweight one.  
Reduce IN list size for tests  Some connectors are unable to deal with large NOT IN lists, reduce the size such that all connectors pass tests. 
Fixed and speedup test 
a more complete equals impl 
CAMEL-3957: Made DefaultExecutorServiceStrategy more easy for end users to extend by more protected method. To be used for a CommonJ WorkManager donation to Apache Camel by Preben.  
Change method name to new name in IOUtils. 
InstrumentationTestLanguage:  make a bit more friendly for tool development use by throwing IOException instead of RuntimeException for syntax errors. 
AlexeiBarantsev: Adding tests for decoration of annotated and non-annotated element lists  r14574 
TIKA-692: TikaCLI -x or -h on a Word doc sometimes adds newline after </b> tag  Don't indent parser output to avoid unexpected extra whitespace  
[BEAM-2379] Avoid reading projectId from environment variable in tests. SpannerOptions.Builder requires projectId to be not-null. 
Remove unnessary use of streams in IndexTransaction implementations.  Patch by Sam Tunnicliffe; reviewed by marcuse for CASSANDRA-10218 
[TEST] Add test to ensure `transport.tcp.compress` works  This adds a basic unittest to ensure `transport.tcp.compress` has effect on all basic TcpTransport implementations.  Relates to #21526 
add assert to prevent garbage column writes.  patch by jbellis  
No logical changes: remove unused import 
Cleanup: Removed unused imports in AndroidNet 
CAMEL-12396: Use $simple{} instead to avoid spring to evaluate Camel simple expression in the property 
added delete iso api to the simulator in the smoke tests, this will fix test_03_delete_iso when run against a simulator  Signed-off-by: Koushik Das <koushik@apache.org> 
DanielWagnerHall: Add testname logging to debug CI problems  r9936 
DRILL-2013: Part 2 - Improve test for flatten bug 
Polish whitespace on JpaTransactionManager 
Force lowercase of username in case-sensitive hashing  Intended to stay consistent with forced lowercasing of case-sensitive username key in constructHashedKey().  Refer to https://github.com/Jasig/cas/pull/359
give test more gc wiggle room - AMQ-4930 
Fixed test bug, lastFollowTime is null if there are no follower indices. 
change throttle gz config to support duration 
Deprecate methods in AbstractChannel that have no real usage.  Motivation:  We should deprecate methods that are not used.  Modifications:  Add @Deprecated to methods  Result:  Be able to cleanup stuff sooner. 
update ShieldActionMapper to handle the change to use TransportSingleShardAction  This relates to commit cafc7078e228ab696d0689ec8b2119cb1626e9cd in elasticsearch  Original commit: elastic/x-pack-elasticsearch@72f8a92b80f5270224b56b8b20788a04811e0a5e 
removes public attribute for <clinit> to be in line with java  
Test warnings for system-graph instead of native in Commercial Edition 
Fixed issue on Windows when the directory is deleted and the OS is trying to do it and OrientDB is creating a new file... This happens on frequently create/delete 
Revise SpringExtension based on recent changes in JUnit Jupiter  This commit revises the implementation of the SpringExtension to use the getRequired*() methods in the ExtensionContext which are now built into JUnit Jupiter thanks to inspiration from the initial "convenience" methods implemented here. 
Do not warn about Unsafe in Android 
Fix array reflective allocation.  A "{{Class Foo[] is instantiated reflectively but was never registered.}}" error is wrongly reported at runtime when an array type is only allocated through reflection (i.e., {{Array.newInstance()}}), even if the array type was previously registered for reflection.
Fixed exception during stopping about concurrent access to hash map  
fix test after merging in master branch 
Fixed issue: NETTY-205 Unnecessary exception log on early disconnection * Do not log ClosedChannelException in RegisterTask.run() 
Allow TransformEvaluatorFactory#forApplication to throw  Certain Transforms (like sources) can throw an exception while being constructed. This allows the transforms to throw an exception while being constructed rather than on first application.  ----Release Notes---- [] ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=115122695 
Make MapType.getObjectValue fail if a map does not use SingleMapBlock  This makes sure that tests will fail if any one attempts to output a map that does not use SingleMapBlock. It also affects production use, in particular serialization for Presto client protocol. 
Add missing @Override annotations  Summary: To prepare for updating the lexer/parser library, make sure ideabuck marks overrides correctly so we know if anything gets removed.  Reviewed By: sbalabanov  fbshipit-source-id: a3b40060d4 
remove dead collections 
CAMEL-7061 Fixed the issue of DefaultCxfRsBinding only uses Exchange.getOut() with thanks to Dominik 
Some clean up after reviewing 
Added an exception handler and nicer message if --numWords is set too small and causes an ArrayIndexOutOfBoundsException  
Reduce access to TargetPatternEvaluator  Summary: It's not used outside of the package.  Reviewed By: jtorkkola  fbshipit-source-id: 8b8ae15b65 
Removed an unnecessary method. 
Add a couple comments 
Use log debug 
Add a debug helper in ZipScrubber  Summary: When debugging ZipScrubber, it's useful to be able to get the name of the current entry, but it seems like IntelliJ's "watch" window isn't able to watch a set of statements.  Pull the logic out into a helper function ot make it easier to use.  Test Plan: Used it in the debugger.  Reviewed By: illicitonion  fbshipit-source-id: 7ea3af1 
Remove unnecessary stream creation overhead.  Reviewed By: bobyangyf  fbshipit-source-id: 9b2675a677 
[#1735] Disable usage of JdkZlibDecoder by default, will be enabled in 4.1.0.Final 
First pass add fixing the not implemented list for Oracle  
Code clean-up prompted by the UCDetector.  
Don't unwrap exceptions in TargetSpecResolver  Summary: Buck's exception handling unwraps exceptions much better than this. Unwrapping them here (especially with throwIfAnyInstanceOf) is bound to lose useful information.  Reviewed By: sbalabanov  fbshipit-source-id: f84b3ecc59 
Sleep for a full second before handling "close" requests; added a long comment to explain what this is for.   r4183 
MINOR: Log successful/failed authentications with socket information (#5856)  Use `info` for failed authentications and `debug` for successful ones.  Reviewers: Rajini Sivaram <rajinisivaram@googlemail.com>, Ismael Juma <ismael@juma.me.uk>
bug 10422: Correctly populating the used and reserved capacity in ComputeCapacityListener Status 10422: resolved fixed 
test annotated as deprecated, assert on size of result set added 
improved javadocs for automatic doc generation 
fixup! fixup! Allow Fusion to Continue with unknown PTransforms 
Use unmodifiableSet in Analysis#getColumnReferences  Previously a copy of set was made that used equality instead of identity for comparisons. 
lua: create parent dirs for in-place binaries  Summary: This would cause occasional test failures.  Test Plan: CI  Reviewed By: yiding  fb-gh-sync-id: 7d8b581 shipit-source-id: 7d8b581 
Remove left-over debugging code. 
Clean import statements  
Revert: [buck project] Mute the 'arc focus' nudge when generating a Project View  Summary: This reverts commit [buck project] Mute the 'arc focus' nudge when generating a Project View.  Test Plan: revert-hammer  fbshipit-source-id: 35efe69 
Move another test -> itest 
Add missing space after comma in TestVarbinaryFunction  Fixes checkstyle failure 
Bug 58426 - use DPI scaling of interface for high resolution devices Remove hard code size Bugzilla Id: 58426  
Remove incorrectly spelled methods that have been deprecated in 8.5.x.  
Replace CxxInferCaptureAndAggregatingRules<CxxInferAnalyze> with two ImmutableSets  Summary: This is another step in deleting CxxInferCaptureAndAggregatingRules  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: e4fc22a 
Fix code smell, remove null assignment  
Dataflow JavaDoc: fix typo (vary --> very).  [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=85667847 
Changes "File << String" to call File.append(String)   
Fix testRelocateWhileContinuouslyIndexingAndWaitingForRefresh (#37560)  This test failed because the refresh at the end of the test is not guaranteed to run before the indexing is completed, and therefore there's no guarantee that the refresh will free all operations. This triggers an assertion failure in the test clean-up, which asserts that there are no more pending operations.
CAMEL-12847: IntrospectionSupport - Allow to use dash style naming 
Improvements to AWS-EC2 logging 
Do not ignore stacktrace of previous exception. #1555  Fixes `ExceptionFromCatchWhichDoesntWrap` inspection violation.  Description: >Reports exceptions constructed and thrown from inside catch blocks, which do not "wrap" the caught exception. It is considered good practice when throwing an exception in response to an exception to wrap the initial exception, so that valuable context information such as stack frames and line numbers are not lost. 
Fixed SelectBox::hideList()  stageListener of SelectList should be removed in hideList() (not only in touchUp method, where it was removed previously), because hideList() call be called without any touch input.
Issue #1555: Replace qualifier with an import  Fixes `UnnecessaryFullyQualifiedName` inspection violations introduced in recent commits.  Description: >Reports on fully qualified class names which can be shortened. The quick fix for this inspection will shorten the fully qualified names, adding import statements as necessary. 
Fixes crash of shade plugin on SparkProcessContext  Error discovered by debugging the Maven plugin itself (using mvnDebug) and setting a breakpoint for the exception and then inspecting the call stack to spot a weird-looking method signature descriptor:  `Lorg/apache/beam/sdk/transforms/windowing/WindowFn<Ljava/lang/Object;!*>.AssignContext;`  (note the exclamation mark, which is an invalid character AFAIK! I have no idea where it came from, but the current change makes it go away)  Further change the signature to make javap happy  When I compile beam using Eclipse Compiler in IntelliJ, this is the only file that produces an invalid class file unless I make the current change. 
Remove completed TODO  
made a change to allow different color background peter   
Character arithmetic javadoc comment minor tweak  
Improved javadoc for management attachment 
rbd: Allow RBD disks to be attached to a Instance 
added test for expression re-evaluation 
FrancoisReynaud: updating the URL grid listen to so that it matches the url of a webdriver server.Keeping the old url as well for backward compatibility.  r12271 
add verifier test for set/get exception listener on pooled connection  
change iszoneready, to use imagestore table 
Use STGroupFile filename constructor  - URL constructor unnecessary 
MockConfigurationDaoImpl: Fix build issue, add base class method  Signed-off-by: Rohit Yadav <bhaisaab@apache.org> 
Fix overly pessimistic synchronization  Summary: ``` ERROR: /Users/ttsugrii/local/buck/src/com/facebook/buck/event/listener/BUILD:38:1: Building src/com/facebook/buck/event/listener/liblistener.jar (44 source files) failed: Worker process sent response with exit code: 1. src/com/facebook/buck/event/listener/RuleKeyDiagnosticsListener.java:93: error: [GuardedBy] This access should be guarded by 'this.diagKeysLock', which is not currently held                       diagKeys.add(line);                       ^     (see http://errorprone.info/bugpattern/GuardedBy) src/com/facebook/buck/event/listener/RuleKeyDiagnosticsListener.java:94: error: [GuardedBy] This access should be guarded by 'this.diagKeysLock', which is not currently held                       diagKeysSize += line.length();                       ^     (see http://errorprone.info/bugpattern/GuardedBy) Target //src/com/facebook/buck/cli:cli failed to build ```  Test Plan: buck test ...  Reviewed By: dinhviethoa  fbshipit-source-id: 812da18 
added return types and fixed class name, so class is syntactically correct 
AMQ-6403 - init broker temp from provided temp store to align usage checks. Thanks for the patchh shailendra14k@gmail.com, made a mod to respect broker.tmpDataDirectory as a default. This closes #204 
SPR-6464 Add one more minor Javadoc comment 
Move getProcessingTimeMs above getParseTimeMs in PerfTimesStats  Summary: The order in the file should, ideally, match the order that they occur.  Test Plan: CI.  Reviewed By: aiked  fbshipit-source-id: 5db2747 
Be explicit about webapp version  
Minor clean-up of RunnableOnService definition 
Restore lost javadoc in Debugger class. 
2.x: Improve BehaviorProcessor JavaDoc (#5778)  * 2.x: Improve BehaviorProcessor JavaDoc  * Use &gt; in the first example 
Increase size of file the test tries to send since there is enough buffering on my system that 200k can hide in the buffers triggering a test failure (the limit works - it just fails in a way the test doesn't expect)  
Check if call node needs split first.  This is needed because calling getNonTrivialNodeCount actually caches the result, so calling it to early can cache a "wrong" value causing problems in inlining. 
Make akka cluster failure detector more lenient.  Fewer false failure detections, but more time to detect crashes. 
MINOR: Bump admin client retries for creating repartition topics (#6063)  The topology optimization test was getting intermittent failures because of failures to create repartition topics on startup. This PR Increased admin client retries  I kicked off the system test with 25 repeats, all passed http://confluent-kafka-branch-builder-system-test-results.s3-us-west-2.amazonaws.com/2018-12-21--001.1545436859--bbejeck--MINOR_flaky_optimization_test_create_repartition_fails--6cd55e2/report.html  Reviewers: Guozhang Wang <wangguoz@gmail.com>
concurrency: Remove acquireExclusiveLock  During getUser, select from OUser reads It does not need an exclusive lock  This logic is similar to @lvca commit Minor: removed lock on authentication at https://github.com/orientechnologies/orientdb/commit/000e40420feb842f4e1182f2c08b6e3010547a22  Reviewed-by: Lloyd Chang <lloydchang@gmail.com> Signed-off-by: Lloyd Chang <lloydchang@gmail.com> 
tweak process test case so it no longer provides a fals fail on the linux box at teamcity.jetbrains.com  
Enable for async requests (invoke just passes the request through so no issues with async)  
Update imports following TIKA-1361 changes, to match our current preference for explicit (not wildcard) imports  
Updated ArrayUtil javadoc one more time so that people quite wondering what it is used for.  
make ConnectionType searilize as integer (#6176)  https://github.com/SeleniumHQ/mobile-spec/blob/master/spec-draft.md#device-modes expects connection type to be serialized to an integer as well as chromedriver does not accept currently sent string value.
Fix bottleneck in InternalResourceGroup::internalGenerateCpuQuota  internalGenerateCpuQuota() is called from InternalResourceGroupManager::refreshAndStartQueries(), which is called every millisecond to start queries. Under a high query submission rate internalGenerateCpuQuota() becomes a bottleneck when Math.multiplyExact() throws an exception (which is possible with the default value of cpuQuotaGenerationMillisPerSecond) while holding the monitor of the root resource group. Plenty of methods in the query starting path grabs the monitor of the root resource group, and since internalGenerateCpuQuota() locks the root for extended amount of time (due to filling in the stack traces when exceptions are thrown) the rate at which the coordinator starts queries drops significantly. This change fixes that by using the guava math methods, which don't throw exceptions on overflow.  In a performance test before the fix, given a config that allows 200 concurrent queries the coordinator was only able to run < 50 queries in the cluster. After this fix it was able to saturate the entire cluster. 
Initialize CassandraSession lazily  This enables us to postpone Cassandra's host resolution till it's needed. It's especially useful in product tests setup where the same set of catalog/*.properties is shared between multiple environments. E.g. LDAP environment does not have any tests of Cassandra, therefore it does not need to spin up Cassandra docker container but while the Cassandra plugin is loaded it will try to resolve 'cassandra' hostname. Thanks to this patch, we would not need to spin up cassandra container when it's not needed. 
Complete the lists of unmapped ciphers Test now passes but keep disabled as it currently requires openssl and that needs to be optional  
add unit test to ensure that range with count of 0 sends onComplete even when initial request is 0 
remove unused import 
Remove @Beta from Iterator-accepting methods in Joiner (except for the Map.Entry related methods because the Iterable-accepting versions are still @Beta themselves). ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=31180145 
remove javadoc warnings from cache(); add @since annotation to cache(b) 
Fix additional issue related to https://issues.apache.org/bugzilla/show_bug.cgi?id=45785 Exclude directories named *.jar for the extension validator Also simplify isDirectory() check as that includes exists() Based on a patch by Rolf Wojtech  
Add system properties to RexProgramFuzzyTest to simplify git bisect 
Add some tests for annotation values of type Class  Summary: `StubJar` is going to be gaining the ability to generate stub jars based on `TypeElement`s.  This commit closes some test holes. No bugs found, but good to have the coverage.  Test Plan: New unit tests  Reviewed By: dreiss  fbshipit-source-id: 24378a9 
Make Version.java aware of 6.x Lucene upgrade  Relates to #37913 
Use WebsocketOutbound#sendClose  Switch to using the sendClose method available since Reactor Netty 0.8 vs explicitly sending a CloseWebSocketFrame.  Related to SPR-17306, but does not address the root cause. 
Bug 50799 - Having a non-HTTP sampler in a http test plan prevents multiple header managers from working  The good fix  
Migrate callers of (Long|Int)Math.checked(Add|Multiply) to the new saturated math methods if it appears that that is what they wanted. ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=110255813 
Size BlockBuilder appropriately in array_intersect  Previously we allocated one row worth of space per byte of input 
CLOUDSTACK-10032 : Database entries for templates created from snapshots disappear after management-server service restart (#2224)  This issue occurs only with KVM hypervisor. Database entries for templates created from snapshots disappear after management-server service restart  # STEPS TO REPRODUCE  Create a ACS setup and add KVM hypervisor as host. Create snapshot of any disk (root or data disk) of an instance. Create template using disk snapshot. Verify that template got downloaded completely and is in Ready state. Also, verify that entry for this template is present in template_store_ref table in database. Now restart management server. Once management server is restarted completely and web UI is available, check the template status. It will be in Active state instead of downloaded. Also, entry for this template vanishes from template_store_ref table in database.  # Fix for the Issue  In NfsSecondaryStorageResource.java class, inside method copySnapshotToTemplateFromNfsToNfs() bufferwriter which was created for writing data in template.properties file is not closed and hence few properties were not getting written in template.properties. As few properties were absent in template.properties file, so after management server restart, this template is not loaded and hence it goes into Active state.
Allow subclasses of BytecodeParser to intercept customize exception dispatch 
Nits in PerBuildStateFactory.  Summary: Fixed a spelling issue duplication for creating a factory instance.  Reviewed By: jtorkkola  fbshipit-source-id: c2ca417e8b 
added a quote test for internal punc 
Mute testRecoveryWithConcurrentIndexing  Relates #33473 Relates #33616 
Updated Javadoc of HttpHeaders 
Fix issues in Javadocs and exception messages.  Signed-off-by: Alexei Barantsev <barancev@gmail.com> 
Clean up warnings in SampleAsyncTests 
JasonLeyba: Remove unused imports.  r17993 
Mark ResourceEntry.loadedClass as volatile. That is because WebappClassLoader#findClassInternal() uses double-checked locking to initialize this field.  
Disable abis from source when there is no source  Summary: The regular ABI production mechanism works fine in such cases, and trying to use the source-based one complicates things later on.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: f531883 
delete no useful intermediate variables  delete no useful intermediate variables 
CLOUDSTACK-9981 : Regression occurs after upgrading to 4.10 while registering a template. 
Add constructor that converts a normal bytecode position into a bytecode position with id. 
Remove NON-NLS comment as it upsets SVN.  
Updated XML integration test to work for non-GCS paths as well.  ----Release Notes---- [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=91905312 
remove duplicate line 
Improved documentation of LifeCycleAwareChannelHandler 
Added John "tug" Wilson in the @author tag of the javadoc   
CLOUDSTACK-8969: VPN customer gateway can't be registered with hostname (#955)  When we have VPN customer gateway which is resolved by a hostname , we should be able to register the VPN customer gateway with its hostname instead of the IP address, this would be useful in case where the remote device IP is dynamically assigned , where customers use DDNS to resolve it.
remove an uneccessary System.out.println statement     
Remove sysout in test and use assertThat instead of assertTrue, to get better error reporting.  
improve trace logging on failure and tidy up future - try to nail down intermittent duplex bridge half start 
[java] Fixing capability matcher tests, Safari TP should be identified by browserName. 
Use IntArrayList in TypedSet to avoid wasting memory  Before this change, TypedSet used IntBigArray which allocates at least 8KB at initialization, while initialization of IntArrayList only consumes no more than 256 bytes.  This change might fix the memory limit issues in map_agg and multimap_agg. 
Better error reporting if requesting options fails due to some language initialization issue. 
AMQ-6248 fix logging statement to use the connected URI.
improve fields iteration trying to find customer valued analyzer 
changing the logging and error msgs from 1:1 NAT to static NAT (in accordance with the feature being called static and not 1:1 NAT) 
Fix bad toXContent for derivative aggregation  I busted it in the last commit. 
Fix non-static args binding in JTT Do not run the version with arg binding when there is no args 
Corrected a typo in the test 
Test: RelocationTests.testMoveShardsWhileRelocation should wait on nodes to start before asking for a client  The client call may create another node if none of the previous nodes are published. That node throws the test off. 
Javadoc:ed static loadConfigurations method.    
Use log format strings  Part of #435 and Bugzilla Id: 62972   
Improve warning message for fallback-image builds 
Remove unused code  
Refactor in preparation for fixing BZ 55120  
Update test name after tested class was renamed Remove algorithm that isn't supported on all platforms from test  
Update exception message when no page sink provided  Previously the exception would say `No page sink provider for connector 'catalog-name'`. 
SupportsInputBasedRuleKey.isSupported to accept BuildEngineAction  Summary: build engine will work with build engine action  fbshipit-source-id: ae16b209da 
added missing author tag   
Test can fail on slower machines, give it a bit more time and improve the assert output.   
Do not make the regex language interactive  This makes it so that it no longer appears as one of the available languages in the GraalVM shell. 
Fixed bug on remote opening using users different by ADMIN. 
Pass context to all methods in case needed later   
TIKA-2249 -- update javadocs to alert devs that tables are not "maintained" by the PDFParser 
bug 7951: Added source nat field for ip address usage status 7951: resolved fixed 
Make names consistent with standard Java names  
Polished. This closes #1322 
Standalone runner expects path.home to be set  Don't use forbidden API. Actually we don't need to create any `tmp` dir.  Related to #167. 
Read skip_build from .buckconfig  Summary: Changing project command to read `skip_build` option from `.buckconfig`. By default the build is not skipped.  Test Plan: Add the following to `.buckconfig.local`:    [project}     skip_build = true  Run `buck project app`, should not build the app.  Reviewed By: marcinkosiba  fbshipit-source-id: fe22baa 
Improved javadoc contract of idempotent repo. 
Add "classpath:/" in front of each xxx.xml resource file (class CamelResourceConfig), otherwise camel-web cannot run in standalone mode  
Minor varargs refactoring.   
CAMEL-12198: Remove PGDataSource type check as some container implementations may wrap it using a different class 
Move BatchInsertTest to lucene-index module  To have access to real index implementations 
add test for read elimination 
Log the error that caused the rollback  
Refactored String.format to toF. 
add test for: https://issues.apache.org/jira/browse/AMQ-3484  
Calling getVariable() when a key is not yet available throws MPE, so handle this case by querying the variable map directly 
Disply the Locale to make it easier to check Locale-related CI tests  
Remove useless null testing  
Removed unused code 
Query refactoring: resolve guice injection issue after last commit 
server: print log on INFO if Host reached Max Guests Limit (#3013)  This should not be in DEBUG as people would want to know that the host was skipped because it didn't have enough slots available to run the VM.  Signed-off-by: Wido den Hollander <wido@widodh.nl>
More pom fixes in preparation of release  
Trivial ws change to trigger CI for test  
Re-removed old config documentation.  
No logical change: reformatting code 
Remove unexpected bad text  Doh! 
ignore subdirectories (snapshots) within a keyspace directory when scanning for files. Patch by Paul Bohm, reviewed by Gary Dusbabek. CASSANDRA-983  
NIO2 seems less likely to detect a disconnect when writing, for some reason. When the test fails (extremely rare for me), no error is actually reported by NIO2 so there's nothing that can really be improved from what I can see. Try to disconnect earlier to try to improve the test's reliability on gump (this also makes the test run faster).  
[FLINK-10283][runtime] Remove misleading logging in FileCache 
Improved logging in 229 to 2210 upgrade 
[FLINK-3461] [runtime] Remove redundant check in ZooKeeperLeaderElectionService  This closes #1700. 
Fix DaemonicParserState.toString  Test Plan: Check in debugger that the class's `toString` does not throw an exception.  Reviewed By: Coneko  fb-gh-sync-id: 7565c37 
CAMEL-5001: recipient list shareUnitOfWork is no longer @deprecated. Its useable when people want to move the original message into the DLC.  
Remove unused StatementAnalyzer#analyzeWhere method 
Option to disable logging request details  Issue: SPR-16898 
Resolved conflicts in SctpData/SctpMessage refactoring 
tidied up imports  
Remove unused imports   
HIVE-6383: Newly added tests in TestJdbcDriver2 from HIVE-4395 is not running (Prasad Mujumdar reviewed by Thejas Nair  
Improve javadoc for Source#createUnavailableSection. 
Added ASM-based tests for custom scoping annotations  Issue: SPR-11574 
bug 13845: as you can't add physical devices name from UI when you create zone, use kvm.{guest|public|private}.devices in the global configuration. status 13845: resolved fixed Reviewed-by: frank 
Add missing dimension to CompilationFinal field in StructLiteralNode 
Drop volatile in favor of failing fast if not subscribed from UI thread
CLOUDSTACK-7348 InvalidParameter Exception while executing scale vm.  We do not throw the exceptions any more, so added info in the logs to say what happend to this command.  Signed-off-by: Rajani Karuturi <rajanikaruturi@gmail.com> (cherry picked from commit 659edb4d9b64377a52eb587ab07039e6badb604e) 
Add @Deprecated to deprecated methods to silence IDE warnings 
Update Javadoc. Patch provided by isapir  
Set required runtime version to 4.6. 
DouniaBerrada: Consolidating synchronized blocks in AndroidWebDriver.java when waiting for a page to load.  r15647 
CAMEL-9835: Updated documentation 
Fix other CoNLL format output test. 
[TEST] Rename variable to make it less confusing 
[scene2d] Reset the gesture listener when touch focus is cancelled. 
Add check for unsupported Hive partition type 
Return empty schema to pre-1.2 nodes' migration requests 
GROOVY-6895: Add null check to avoid errors to be swallowed 
Always reset the MB when doing getBytes  Fix for bug #36155  1) an unconditional reset is cheap if I'm going to call MB.setBytes 2) the JK connector doesn't support any charset except iso-latin-1 anyway 3) This particular connector is on the fast track to deprecated   
Fix num docs to be positive in bucket deferring collector test 
AndroidSounds now respond to lifecycle  Fixes #1263 on Android Behavior is now alike with music on Android 
Fix typo in comment 
Emit to _spoutConfig.outputStreamId  Even though KafkaSpout.declareOutputFields declaresStream using outputStreamId (if present), the message gets emitted to a stream matching the Kafka topic it was read from. Looks like it may have been a merge conflict between the fix for STORM-1210 and STORM-1379.
Fix javadoc warnings in IDE with more specific exception info  
[TEST] Wait for stable cluster to avoid spurious test failures  Original commit: elastic/x-pack-elasticsearch@4c0d9a0fac1b18f7f52f0e662ac0d0eb10d3ce2d 
Issue #3209: add example to TokenTypes for FOR_EACH_CLAUSE 
Fix a bug in the doUpdateHostPassword() method    - 2 years ago a change in that method caused an issue when trying to update the hosts password:     - they would be updated in the databse but not in the host it self, causing the hosts to disconnect after a management server resstart  Signed-off-by: wilderrodrigues <wrodrigues@schubergphilis.com> 
Modified startup timeout test to use TestDirectory 
Do not log explicit no unsafe, fixes helper method. (#8111)  Motivation:  Users should not see a scary log message when Netty is initialized if Netty configuration explicitly disables unsafe. The log message that produces this warning was previously guarded but by recent refactoring a bug was introduced inside the guard helper method.  Modifications:  This commit brings back the guard against the scary log message if unsafe is explicitly disabled.  Result:  No log message is produced when unsafe is unavailable because Netty was told to not look for it.  Relates https://github.com/netty/netty/pull/5624, https://github.com/netty/netty/pull/6696
Fix resource leak in query queue  Queries can transition to the CANCELED state before they are started. In particular, this happens if a user cancels their query while it is queued. In this case, the state change listener is never called, because the query is already finished, and this leaks one slot in the query queue. 
Fix bad version check for old RCFile header 
Add lower bound on poll_interval (#39593)  A poll_interval of less than 1 second doesn't make much sense, and can cause  excess load on the master node if  it's set too low (e.g. single digit milliseconds).  However, we still want to allow relatively short poll intervals, for testing purposes, so we put a lower limit of 1 second.
Cache .so files containing debug symbols.  Summary: The `extract_symbols` step on buildbot has been broken for a long time because whenever we hit a cache hit for ndk libraries, the script cannot find these files with symbols.  Test Plan: buck build instagram buck clean buck build instagram  `find buck-out -type f -name '*.so' | grep local` is not empty. 
Add perf tests for cache(1) variant
Improve error message  
Tweak doc comment 
Update Javadoc for methods that are likely to be used by scripting test elements  
fixed check style error- removed unused imports 
Allow CloneSchema to be specified in terms of url, driver, user, password; not just dataSource. 
Use index name rather than Index.java to lookup IndexService 
Do not set SO_LINGER to 0 when not shutting down (#26871)  This is a follow up to #26764. That commit set SO_LINGER to 0 in order to fix a scenario where we were running out of resources during CI. We are primarily interested in setting this to 0 when stopping the tranport. Allowing TIMED_WAIT is standard for other failure scenarios during normal operation.  Unfortunately this commit set SO_LINGER to 0 every time we close NodeChannels. NodeChannels can be closed in case of an exception or other failures (such as parsing a response). We want to only disable linger when actually shutting down. 
Use buffered bytes to estimate compression ratio 
Add examples of how to get hold of the dependencies for a sentence. 
Temp hack to get reasonable line numbers into the AST nodes.   
AlexeiBarantsev: Adding a space between the browser flavor and the path. Fixes issue 2413  r13909 
Mark ChannelHandlerAdapter.exceptionCaught(...) as @deprecated. (#8826)  Motivation:  41e03adf249ee9d23938fecf9be980a096710b36 marked ChannelHandler.exceptionCaught(...) as @deprecated but missed to also mark ChannelHandlerAdapter.exceptionCaught(...) as @deprecated. We should do so as most people extend the base classes and not implement the interfaces directly.  Modifications:  Mark ChannelHandlerAdapter.exceptionCaught(...) as @deprecated as well.  Result:  Mark method as @deprecated to warn users about its removal.
Weaken inflexible inserts for future additions  
Use name instead of ip for ldaps tests 
Better message on Client target address creation 
As currently defined, the hashcode of every unordered EndpointPair which is a self-loop is zero! This is particularly not good for graphs with many self-loops, such as the transitive closure graph, where every node has an incident self-loop. Change hash to use + instead of ^ (this still preserves the property of symmetry, even with overflow).  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=135539805 
Remove unused import from o.e.e.Environment 
change logging level, nodes FD will detect it as well 
test fix for page cache stress test 
updated license headers on the test class 
New version number that returns 3 int for current version 
Special handling for JRuby exceptions to display the actual error message   
SimonStewart: Deprecating methods from the RenderedWebElement that are no longer meaningful  r10415 
[hotfix] [java] Allow setting DataSink parallelism to default value  This was missed in FLINK-3589. 
https://issues.apache.org/jira/browse/AMQ-5621  The tests no longer need to worry about configuring the scheduler store as the broker will use an in-memory or kahadb based version depending on the broker persistence value.
Correcting a faulty edit/commit -- removed the duplicate and reinstated the deleted test.   
add license header 
Add TAG_SETTING to list of allowed tags for the ec2 discovery plugin.  I am unable to set ec2 discovery tags because this setting was accidentally omitted from the register settings list in Ec2DiscoveryPlugin.java. I get this:  java.lang.IllegalArgumentException: unknown setting [discovery.ec2.tag.project] 
Fix flaky build engine test  Summary:The `BuildRuleEventTests` ordered rule events by timestamp to verify begin/end pairs ran on the same thread.  However, it was possible that a end and begin event had the same timestamp which caused the tests to pair up two begin events which would run on different threads.  This diff switches the tests to use a fake incrementing clock to gaurantee timestamps are always different.  Test Plan: ran the tests  Reviewed By: k21  fb-gh-sync-id: f53d839 fbshipit-source-id: f53d839 
Remove unused import  
Fixed typo in user-facing message  Summary: Fixed typo in user-facing message  Reviewed By: bobyangyf  fbshipit-source-id: 34b7a9d 
[BEAM-2808] Improving error message in ParDo.validateWindowTypeForMethod. 
Resolve missing imports due to changes in master 
Fixed check of the network protocol. Now it throw an exception if the delta of versions is > than 2 
Add version 6.0.0-rc2 
CAMEL-3894: Improved javadoc due recent change in API  
Fix unused import checktyle issue 
Skip remote caches for `JSFile`  Summary: Most `JSFile` rules can be built quicker than downloading them from the http cache until Buck will have a better downloading strategy.  This simply skips http / dircache lookups for `JSFile`. We might want to evolve this into a better strategy. Short-term, this saves build time.  Reviewed By: marcinkosiba  fbshipit-source-id: 156992d 
AccountManagerImpl: Fix method to check and return systemuser, spring injection failsafe  Signed-off-by: Rohit Yadav <bhaisaab@apache.org> 
Refactor TransformUncorrelatedInPredicateSubqueryToSemiJoin  Remove unnessasary class InPredicateRewriteResult and remove copy paste code of adding inPredicate mappings by pushing it down to the rewriteInPredicates method. 
Removed Java6 compatibility problem 
beef up Javadoc 
Remove unnecessary type arguments 
updated static imports 
Completion postings format: Write hole character  Another issue found by randomized testing. 
Utility method for getting the first version prior to given version 
Change some TestTaskExecutor tests to use new scheduler 
Extracted some methods for SessionExtensionJS test   r5434 
Added missing keys. 
More logging cleanup 
Removed unused imports 
Refactor choosing distribution for plan fragments 
createServiceOffering had cpuSpeed passed twice when creating the offering rather than cpuNumber then cpuSpeed...fixed 
Add missing native-to-Java transition for isolate-creating entry points. 
Close ObjectInputStream in ObjectDecoder.decode(...)  Motivation:  We create a new CompactObjectInputStream with ByteBufInputStream in ObjectDecoder.decode(...) method and don't close this InputStreams before return statement.  Modifications:  Save link to the ObjectInputStream and close it before return statement.  Result:  Close InputStreams and clean up unused resources. It will be better for GC. 
Fix Javadocs for ThreadPool#schedule  This commit fixes an issue with an @throws tag on ThreadPool#schedule not containing a description. 
Minor: fixed issue on drop database using the GraphFactory 
Fix NPE in SearchContext.toString()  Fixes NPE in SearchContext.toString() for user requests that contain scroll id but not scroll timeout. 
check alter property valid after schame reload, issue #3498 . 
Corrected date pattern in JavaDocs  The 'hh' pattern should be 'HH' as ISO dates use 24hr notation. 
Update javadoc for new tooltip implementation  
token types bumped by 1 I assume due to recent lexer updates for 0-length tokens or for channel thing? 
More explicit type arguments for the generic PriorityMap, to help some versions of javac 
Remove duplicated code  
using junit assert, not selenium assert now, so we need to catch junit exception  r2252 
Adding null check for username being null.  The username is usually not null, but it  could be for some embedded databases.  Always setting generatedKeysColumnNameArraySupported to false when getGeneratedKeysSupported is false, since it can't be supported without having generated keys supported. This change only affects logging messages.  Issue: SPR-9006 
Add test case for [CALCITE-1153] 
MINOR: Do not log retriable offset commit exceptions as errors (#5904)  Reviewers: Jason Gustafson <jason@confluent.io>
[hotfix] [tests] Remove unnecessary stack trace printing in StreamTaskTest 
CLOUDSTACK-2545: Change unit of network statistics from 1000 to 1024 for KVM Signed-off-by: Chip Childers <chip.childers@gmail.com> 
Deduplicates an assignment of type/bits 
Remove unused call  
remove unbound method template parameters 
Optimize single character starts with. #1555  Fixes `SingleCharacterStartsWith` inspection violations.  False-negative reported to PMD: https://sourceforge.net/p/pmd/bugs/1392 
Camel-AWS: Lets use AbstractAWSLambda in the AWS Lambda Client Mock for tests 
Improved watch dog daemon output 
Fix check style issues with useless imports 
Fixed issue on import with null values 
Removed unread private field. 
Use min priority for the utility threads, as an experiment.  
try to fix possible encoding issue with new encryption algorithm 
Documentation on BaseOneByteHeaderRecordFormat utility methods 
assign expected and actual result to variables, eases debugging 
Reverted checkin, we can use a fully qualified class name inside of the protocol   
Remove mentioning of BuildRule from ConfigSettingDescription javadoc  Summary: This phrase is no longer true.  Reviewed By: jtorkkola  fbshipit-source-id: 4aa442f4d1 
checking an enhancement to create the field with white background peter  
CAS-1337: Improve pattern to detect unprintable characters  Conventional non-printable characters also include 0x1A - 0x1F. 
Print link to debugger UI  After successfully registering a debuggee, print a link to go to the appropriate UI. 
javadoc only - remove warning and tidy up wording  
Document exclusion of jrt from SVM default FileSystemProviders 
Added javadocs comments wrt postgresql and BLOB handling   
[FLINK-2194] [type extractor] Excludes Writable type from WritableTypeInformation to be treated as an interface  This closes #814. 
Removing unused member map from TraceCompilationListener. 
Cache Objenesis instantiators  Summary: Looking up instantiators is slow and these should be cached.  Reviewed By: ttsugriy  fbshipit-source-id: be84943 
DispatcherPortlet uses a forward for rendering a view as resource response  Issue: SPR-9876 
updated test cases 
ignore failing test for now - andy c to investigate next wk 
Stricter ObjectStamp type checking  
Change type of currentSize to long  This change is for preventing potential overflow. 
Added missing license header. 
added support for samlp 
Migrated to TimeUtils.nanosTime()  Updated as suggested.
Add index name to log statements when settings update fails  When an index setting is invalid and fails to be set, a WARN statement is logged but it doesn't contain the index name, making tracking down and fixing the problem more difficult. This commit adds the index name to the log statement. 
Remove `StringUtils`'s `@author` and `@since` info added by accident. 
[TEST] Removed incorrect assertion (it is expected that the flush doesn't execute on all shard copies, because we don't wait for green status) 
added more logging to the calling of princexml  
MichaelTamm: Reverted changes to TakesScreenshotTest.java because the broke the build -- it worked in IntelliJ IDEA :(  r12226 
Rewrite projection only if there is inPredicate mapping  Rewriting ProjectNode when there is no inPredicate mapping is not needed. What is worse it makes planning to be much slower as it is performed for each ProjectNode.  Fixes #6129 
Rename minimumNumberOfTasks to minimumNumberOfDrivers 
add Collections.shuffle(splits) so Hadoop doesn't send all the jobs to the same nodes at once.  patch by Joost Ouwerkerk; reviewed by jbellis for CASSANDRA-1096  
better logging and added TODO  
[hotfix] Remove RecoveryMode from JobMaster  The recovery mode is not used any more by the latest CheckpointCoordinator.  All difference in recovery logic between high-availability and non-high-availability is encapsulated in the HighAvailabilityServices. 
Implement toString for OutputType.  Returns a String that textually represents the object. I desire this for viewing in a debugger and for user code that logs OutputType.  Signed-off-by: Seva Lotoshnikov <vlotoshnikov@gmail.com> 
do not reset the error and warning lists after writing them, they may be needed multiple times  
restore using SeleniumServer.getDefaultPort to determine what port to talk to.  This is so I can set the Java property selenium.port in my environment and not use a standard port, which protects me from the possibility of interfering w/ anyone else's selenium server should I be working on a host where I'm not alone (e.g., bugles -- not that I plan on doing anything on that box anytime soon).  r3699 
Added fix for @type in json parsing 
Test: add wait for nodes to restorePersistentSettingsTest  Sometimes by the time update settings is called the second node is not in the cluster yet. As a result change of minimum master node settings to 2 is ignored making this test to fail. 
better voaltile management 
Properly shutdown with regards to Snapshot, avoid causing NPE with null Executor 
add a test for term docs version deletes 
updating the class so I can set the background to white peter   
minor tweaks to javadocs for new onBackpressureBuffer variants 
Calculating capacity before allocation.  This commit optimizes the `CharSequenceEncoder` to allocate `DataBuffer` instances with a predicted capacity.  Issue: SPR-17558 
require @Option annotated fields to start with upper case letter 
Check cast is safe  
Significantly improve the performance of JavaUnicodeInputStream.LA(1) 
increased number of records operated by distributed test to make sure it execute all the steps 
Start scheduling query management thread in a separate method  To prevent unsafe publication. 
Fix multiple subscription bug on operation filter  A new subscription must be created on every subscribe call, otherwise any subscribe call after the first directly fails. 
Watcher: Ensure non duplicate Wid ids (elastic/elasticsearch#4423)  Removing the WatchLockService could result in duplication of wids, because of a wrong call to replace underscores with dashes. As UUIDs.createBase64UUID() can contain underscores but they are kind of reserved in the Wid class due to handling of watch ids, this just uses the toString() representation of a random UUID.  Closes elastic/elasticsearch#4422  Original commit: elastic/x-pack-elasticsearch@dceb01ae5edad8199877c6c11754b6cdd4520bda 
adding some missing else parts to get/setAttribute and get/setProperty  
Issue #7723 unused import was removed 
Made sure all exceptions are printed (2nd try) 
CLOUDSTACK-8656: restructure of tests
making bind to local thread synchronized because of concurent modification execption 
On balance, I think keeping these methods separate is the better option due to: - easier to follow code - simpler maintenance - subtle differences between blocking/non-blocking that may be lost / become less obvious if combined - ability for sub-classes to over-ride  
the sjms tests should use dynamic ports to prevent port already in use exceptions  
Better spaceWidth computation.  The space glyph should have both a width and xadvance. 
better failure message for sorting when mapping is not found 
server: increase POST timeout for local template upload (#3356)  Increase template upload POST timeout for local template upload to 1 hr or 60 minutes. 
Disables parallel native index populator by default  Because it will only be an overhead in most scenarios until a bunch of other things with index population are made more parallel. 
Print the performance warnings that caused the test to fail. 
CAMEL-3931. Remove duplicate strategy field masking one with the same name in superclass  
ClusterHealth shouldn't fail with "unexpected failure" if master steps down while waiting for events  In order to wait for events of a certain priority to pass, TransportClusterHealthAction submits a cluster state update task. If the current master steps down while this task is in the queue, the task will fail causing the ClusterHealth to report an unexpected error.  We often use this request to ensure cluster stability in tests after disruption. However, depends on the nature of the failure it may happen (if we're unfortunate) that two master election rounds are needed. The above issues causes the get health request to fail after the first one. Instead we should try to wait for a new master to be elected (or the local node to be re-elected).  Closes #11493 
Test: increase zen logging 
Add some more useful statistics about a parser to the PrintTag tool 
Removed a potentially dangerous 
MINOR: reduce verbosity of cache flushes  This log message tends to be extremely verbose when state stores are being restored  Author: Xavier LÃ©autÃ© <xavier@confluent.io>  Reviewers: Guozhang Wang <wangguoz@gmail.com>  Closes #2412 from xvrl/reduce-verbosity 
Disabling a test that fails in geckodriver 
A better printout   
minor patch to improve graceful shutdown; by adding the consumer first so its stopped first. See http://www.nabble.com/Stopping-some-routes-and-ServiceSupport-question.-tf4837886s22882.html  
reverting a faulty commit to ACG to avoid ClassCastExceptions. However this patch corrects als the original problem with having fields with illegal names for the classes if the class is an array, too   
MINOR: Update TupleForwarder comment (#4414)  Reviewers: Guozhang Wang <wangguoz@gmail.com>
Added test case to make sure using unique nodes works from the batch API. 
Size BlockBuilder appropriately in map_values  Previously we allocated one row worth of space per byte of input 
Add new property names  This is towards indexed side inputs.  ----Release Notes----  [] ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=113064801 
clean up conds for authn throttling 
deprecate own ConcurrentSet for removal (#8340)  Motivation:  Java since version 6 has the wrapper for the ConcurrentHashMap that could be created via Collections.newSetFromMap(map). So no need to create own ConcurrentSet class. Also, since netty plans to switch to Java 8 soon there is another method for that - ConcurrentHashMap.newKeySet(). For now, marking this class @deprecated would be enough, just to warn users who use netty's ConcurrentSet. After switching to Java 8 ConcurrentSet should be removed and replaced with ConcurrentHashMap.newKeySet().  Modification:  ConcurrentSet deprecated.
WW-3163, fixing NPE, but throwing StrutsException instead, not a great fix, but when I get a chance to work closer with JBoss, I will come back to this  
WW-1422   - fixed else tag executed when it is not suppose, when used with ElseIf tag.  
r/m debug println  
Easier example for ChannelConfig downcasting 
OfficeParser: choose correct Decryptor for document  
Re-introduce allowObjectConstantToStackMove until regressions are fixed 
Fix wrong argument of StandardWrapper.remove() in case when singleThreadModel and instancePool are used.  
Added a break early test where if the list of property trackers is empty no iteration takes place - should shave of some time from the iterator creation overhead. 
Remove unused method form the SubstrateLoweringProvider 
Fix FieldCapabilities compilation in Eclipse (#23855)  Eclipse can't deal with the generics, maybe the fixed but unreleased https://bugs.eclipse.org/bugs/show_bug.cgi?id=511750
Fix regression from 5044128caa9265215645ae7a8881ed931de256af  Summary: `setTargetDevice` was accidentally removed but it means testing with multiple active devices no long obeys the argument  Test Plan: Run more than one device, try to reproduce the failure. See whether this works  fbshipit-source-id: 8c61862 
Ignore failing test  This test fails because of Javac that does not send the deferred diagnostic to compile-testing, despite the call to print it as an error. 
Test fix for def equals test in Painless. (#21945)  Closes #21801
HHH-3111 fixed TM.getStatus() to delegate to getTransaction().getStatus(), or return STATUS_NO_TRANSACTION  
Forces the test to fail if any worker encounter an exception 
JasonLeyba: Removing unused import that slipped in with r8018.    r8019 
Added default role (writer) 
Refactor to remove use of unnecessary LinkObject  
rbd: Remove debug line  This is no longer needed. It was here for testing purposes, but it was actually a bug in libvirt which has been resolved. 
Make error message more clear  Test Plan: None  Reviewed By: Coneko  fbshipit-source-id: 8c3874d 
Removed an unnecessary empty line 
Modfiy casing in JVM home log message  This makes the log message consistent with the following line that shows the JVM arguments. 
Full field paths not respected in sort parameters, closes #1226. 
Added checks to avoid ArrayOutOfBound exception instead of the real exception about wrong cluster 
Bring back unused LuceneKernelExtension constructor  because removing it breaks the public API, according to clirr. 
Modify Abstract transport tests to use impls (#28270)  There a number of tests in `AbstractSimpleTransportTestCase` that create `MockTcpTransport` impls. This commit modifies two of these tests to use the transport implementation that is being tested.
TextField - Editable repeat time for cursor movements  The properties keyRepeatInitialTime and keyRepeatTime should be public for personalization, and static for mantain the same behaviour for all the TextFiled and TextArea inside the game.
Increase the write timeout (5s -> 10s) to see how the test reacts (or if it's a deadlock somewhere), I see some significant spikes in my own testing if I put some load on my computer.  
Added an unit test based on users mailinglist 
Mute SharedClusterSnapshotRestoreIT#testSnapshotSucceedsAfterSnapshotFailure with @AwaitsFix.  The issue is being tracked in #30507. 
Refactor TestShowStats  Extract logic to create the `nation_partitioned` table into a a setup method to allow multiple tests to access the table when running in parallel. 
added try/catch to the setup method so that the sampler captures any failures. peter  
Removing basic connectivity provider and OVS network offering as not needed for Bonita 
Make `newRemoteWebElement` `protected`  - Reverted newRemoteWebElement() method visibility from private to protected so other depending frameworks didn't break. - Fixes : https://github.com/qmetry/qaf/issues/119 which was introduced because of newRemoteWebElement method visibility changed from protected to private - minor code improvement to reduce representative statements and it will also support any Dialect added in future.  Signed-off-by: Simon Stewart <simon.m.stewart@gmail.com> 
Do not propagate state over loop exits in conditional elimination phase as the phase does not insert proxy nodes. 
Fixed typo  Thanks for your patience on all these minor edits. Note to self: don't submit code changes from the browser :)
fix callback when repair request times out (see #2069) patch by jbellis  
increase the max amount of time we wait for reconnect since the default network reconnect delay could be up to 5 seconds  
[java] Fixing a unit test to make it independent on the current platform 
Removed exception in favor of log for differences in mvrb-tree protocol versions 
CAS-1462: corrected oauth test cases. mock-httprequest omits default ports 
Change default multicast IP used as we had been using one in the reserved range, now it uses 239.255.2.3, which is in th e range designated for site-local stuff   
On recovery (startup), the recovery translog file handle is not properly closed, closes #1866. 
Fixing assertions in integration test (#33833)  
Fix failure in performance build  The JettySockJsIntegrationTests are enabled in the performance build only. Following the upgrade to Jetty 9.3 where the JettyRequestUpgradeStrategy is now Lifecycle as wel as ServletContextAware, we need to make sure the ApplicationContext refresh occurs after the ServletContext has been set. This change removes the explicit .refresh() call in the test setup and instead relies on the DispatcherServlet to do that, which ensures that the ServletContext with which it is initialized by Jetty has been set on the ApplicationContext before that. 
Skip shards in progress for temporal compaction  When pick shards for compaction, we should filter out the shards that are currently submitted for compaction as it can cause transaction conflicts. This was missed out for temporal compaction in an earlier commit. 
Update Javadoc to reflect changed default for useEquals  
word_count uses better ks/cf names now that we're not piggybacking off storage definitions in the config.  Patch by brandonwilliams  
SimonStewart: Remove printf debugging  r16828 
add check on document schema load for open database 
server: warn on migration of volumes within the same storage pool (#3424)  Added an if statement that catches the destination poolid as an invalid parameter if it is similer to the current poolid.   Fixes #3291
Summary: Quiet erroneous stopVM failures on kvm  Detail: Cloudstack tries to stop VMs all the time, for all sorts of reasons, but usually just to get into a known state.  Libvirt throws an exception of 'Domain not found' when attempting to stop a VM that doesn't exist. This causes problems for troubleshooting real issues. Domain not found should equate to success if trying to stop.  BUG-ID: CLOUDSTACK-4011 Bugfix-for: 4.2 Signed-off-by: Marcus Sorensen <marcus@betterservers.com> 1375825281 -0600 
cleanup; remove no longer needed check  Signed-off-by: Simon Stewart <simons@fb.com> 
Remove the last nullable field.  Summary: Test infra is now able to wait for all launched processes without affecting production code.  Reviewed By: sbalabanov  fbshipit-source-id: f79203b8c2 
Fixxed missing closing brace
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=54497 Make error handling more robust so an error in the leak detection code doesn't prevent the Context from stopping unless the error is fatal to the JVM  
fix format string to match count of values 
Fixed delete mapping to return acknowledged false when ack times out 
 added test on unique edges, issue #3990. 
[FLINK-2529] [runtime] Remove some unused code in Execution  This closes #1022 
CLOUDSTACK-10157: Wrong notification while migration (#2337)  Root Cause: Earlier, it was failing with ArrayIndexOutOfBoundsException, when the list is empty and accessing the first element. The error was only observed in Log, but was not showing in UI as it was not throwing any exception. Hence the API call was in turn successful.  Solution: Added the empty check before sending device details. Which says either the required GPU device is not available or out of capacity.
Move test to neo4j module instead of kernel-enterpise 
SQL: improved speed of like 
merge from 0.8   
WW-1410   - Provide a hook for FilterDispatcher such that a custom Dispatcher     could be used.    
rewrote Thread.isInterrupted() substitution to use @Alias mechanism 
Add missing displayData to ElasticsearchIO.Read 
TEST : Add bootstrap test to boot strap different history indices.  Original commit: elastic/x-pack-elasticsearch@72c36f6d4dfdf0842f869a042b90aa96a57ec26a 
Allow to get version of available OpenSSL library  Motivation:  Sometimes it's useful to get informations about the available OpenSSL library that is used for the OpenSslEngine.  Modifications:  Add two new methods which allows to get the available OpenSSL version as either an int or an String.  Result:  Easy to access details about OpenSSL version. 
support to set the version of apache-camel feature in OSGi test support  
Fix CREATE  VERTEX to handle default target (V) 
switched to using new NodeFieldIterator and NodeFieldIterable for traversing Node inputs and successors changed Node fields to be protected or package-private (they can no longer be private) generate isLeafNode() and isOptionalInput() 
AlexeiBarantsev: Adding "non-null" check. Fixes issue 4906  r18343 
Forgot to commit one file (since it was in another component).   
CAMEL-1801: ftp component will now automatic try to reconnect in case the connection could not be established. Added options to control this behavior. Will try 3 times waiting 1 sec by default.  
Remove unnessasary Lookup::resolve usage 
Change infinite loop with break to loop with condition  Summary: .  Reviewed By: rajyengi  fbshipit-source-id: 5d6c6e1af1 
CAMEL-640: Added Delayer (interceptor) to slow processing of messages down so you can watch what happens nice and slowly.  
Fix SPEL tests when using maven.  With the maven test runner expression.spel.SetValueTests is run before expression.spel.EvaluationTests. The order is reversed in eclipse/spring-build.  Static variables are modifed in SetValueTests that cause EvaluationTests to fail if it is run first.  Make a simple fix so SetValueTests uses a local evaluation context variable instead of a static variable. 
Java API: Calling SearchHit#sourceAsString will not decompress the source to convert it to string, closes #1814. 
when there are several monitor threadgroups, the probability of another thread calling parseBytes() while the parser is busy is low, but it does happen. When it does, it cases SAX to throw an exception. Adding sync fixes the problem and doesn't appear to have any performance impact. peter lin   
[#1046] Make sure HttpContentEncoder calls ByteBuf.retain() if needed 
Free DriverContext reserved when OperatorContext fails to reserve 
Adapting to changes in master 
Issue #2161: unify test input locations for doclets package
Avoid diamond shape for methods that return a condition. 
Disabling buck plugin choose target action if we're indexing  Summary: When indexing, we should disable choosing buck target, since we don't have the intellij file system.  Test Plan: Tested in Intellij  Reviewed By: alsutton  fb-gh-sync-id: 17c7cbd fbshipit-source-id: 17c7cbd 
[buck][ocaml] expose ocamldep output on error  Summary: Shelling out to `ocamldep` is pretty much the first thing we do, and it can fail on things like basic syntax errors. We were unhelpfully printing nothing but 'ocamldep failed'.  It looks like this is normally taken care of automatically, but we don't use that because we need to parse the ocamldep output sans TTY control chars.  Fix by explicitly stuffing the output into the exception.  Test Plan: Grab some random ocaml code that already builds with buck; add some semicolons to break it; see output includes the syntax error of the form    BUILD FAILED: File "blah", line 19, characters 4-5:  where previously it just said `ocamldep failed`. 
Propagate -R:FallbackExecutorRuntimeJavaArg to fallback image as build argument.  
Delegate to common ClassUtils.getQualifiedName  Issue: SPR-15237 
URIEditor uses straight ClassPathResource.getURI() access  Issue: SPR-16581 
Moving a test from gson to our json 
modified PiPushable implementation for IsNullNode to account for an input that is an unsafe cast from a word value 
Inline remaining usages of Throwables.propagate. We are removing all calls in preparation for deleting the method. ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=121489882 
Test for actual HttpInvokerProxyFactoryBean usage with plain FactoryBean return type  Issue: SPR-12141 
Unmuted testRecoverBrokenIndexMetadata  These tests should be okay as we flush at the end of peer recovery.  Closes #40867 
INSERT IGNORE more sensible and faster than REPLACE INTO to handle possible duplicates  
Removing unused imports  Original commit: elastic/x-pack-elasticsearch@40c094af917064e72b3318c19b8b25c67bfc533d 
Remove WorkerProcessProtocol.CommandReceiver  Summary: Dead code  Reviewed By: rajyengi  fbshipit-source-id: ee8348cde7 
Remove unused array  
No need to make the timeout of thread model test too long  Using m1.large instance fixed the unstable build problem with CloudBees
CLOUDSTACK-9650: Allow starting VMs regardless of cpu/memory cluster.disablethreshold setting Fixed the scope of configuration flag 'cluster.threshold.enabled' introduced as part of PR#1812 to global 
LibvirtComputingResource: Fix coverity scan, recent bugfixes revealed a potential unhandled null in getResizeScriptType  Change-Id: I5715a4424646261f2c43cd5e0a16fd72dd12c753 
https://issues.apache.org/jira/browse/AMQ-5222  Add test to show this is working as it should.
incorporated auto-format fix 
Document the ProcessUtil class 
Add 5.6.9 snapshot version 
DRILL-2826: Simplify and centralize Operator cleanup 
Removed merge conflict in javadoc 
Moved the CamelChoiceWithmanagementTest to org.apache.camel.spring.management package  
WW-1349 MailReader - Change to Spring copyproperties, per Matt Raible's suggestion, since OSCore BeanUtils has been removed from Struts Core.  
Marvel: Check that document count is the same on all data nodes  closes elastic/elasticsearch#1214  Original commit: elastic/x-pack-elasticsearch@1cf352fa3bbaca6ff3559cbd255b50d19a37d317 
Add comparison test 
Polish Javadoc for EmbeddedDatabaseBuilder 
Reorder a loop a little bit to be robust to buggy parse trees 
Support for external paths (old version only loads from asset). 
Bug 47622 - don't add Connection header from browser  
CAMEL-12126: camel-ftp - Add option for resume download  minimal improvement of javadoc comment 
enabled tests for issue #7145 
WW-1823 rename getAutocompleterModel to getAutocompleter in StrutsModels  
Add Null Check before registering a metric. 
Updating srx resource to make sure it logs into the srx after establishing a connection 
add fix for test order issues in test cases 
[TEST] set mmn to avoid split brain 
parse correct enabled flag on all field when passed as number, closes #76 
remove check for failure, might rarely not fail at all 
[FLINK-2262][utils] rename method for default integer value in ParameterTool 
Fix sparc compress/uncompress logic with base register 
Avoid unnecessary Iteration while parsing Math Flags 
fixed wrong default value of test file pattern to **/*Test.groovy   
Deprecate unused methods.  
Unblock probe side as soon as all partitions ready or spilling  Previously probe side was unblock only after build side fully consumed the input. This commit unblocks probe side as soon as every partition is either ready or spilling. 
Also use realloc when shrink the buffer.  Motivation:  We should also use realloc when shrink the buffer to eliminate extra allocations / memory copies when possible.  Modifications:  Use realloc for expanding and shrinking when possible.  Result:  Less memory copies and allocations 
Follow-up to 1617445. Updated expected value that has changed in 1617445  
Removed format parameter in sysdate() because haven't really much sense. 
Preserve ordering in window assertion output  Keeping the output in the same order as processed by the window operator makes it easier to reason about and debug failures. 
bug 13428: upgrade newly issued realhostip certificate. Reviewed by: Anthony 
Showing user friendly error message about htmlrunner CLI options instead of stacktrace 
Added canSleep method to prevent Profiler from sleeping 
Add join pruning plan test 
Remove redundant null check as per sebb note  
Add regression test for antlr/antlr4#19 (getter for context is not a list when it should be) 
fixed highlighted styled built in schema tags to properly increate from hlt1 to hlt10 
Profiler: used full db name 
Add test to assess claims in SPR-10411  This commit verifies that the return type of a parameterized instance factory method is properly resolved.  Issue: SPR-10411 
Unmute PermissionsIT test and enable debug logging for it (#42876)  This unmutes `testWhenUserLimitedByOnlyAliasOfIndexCanWriteToIndexWhichWasRolledoverByILMPolicy` and enables DEBUG logging. The failure from this test case from a query running rather than ILM itself, so more information is needed.  Relates to #41440
Update to the latest Reactory Netty snapshot 
Deploy from server-setup.xml: Fixed createDefaultNetworks to use correct guru names 
JasonLeyba: Reduce log level.  r16847 
Temporary disable failing test 
Reducing the amount of repeated documentation. 
Cleanup Javadoc as well as code  
Issue #4966: Update `AnnotationUseStyleCheck` documentation to match actual defaults 
Delete unused imports 
reproduced comment from markOop.hpp in MonitorSnippets for convenience 
SimonStewart: rolling back an overly eagerly checked in change  r12510 
DouniaBerrada: Changing main context from /hub to /wd/hub for Android to be consistent with the RWDS.  r12423 
Add some tests for truncated valid values  
we need this referer check t be cmore inclusive now that proxy injection mode is there as well, since the same prolem occurs with PI mode, only that the referer URL is slightly different   r2696 
Add --container-aware-detector option to the Tika CLI, which will switch the detector used by the auto parser  
remove outdated comment  Original commit: elastic/x-pack-elasticsearch@06a51abb6556f4f3810ebfef902f8dcb5c725dc1 
LinearScanLifetimeAnalysisPhase: more debug output. 
extract diagnostic file path correctly 
Cleanup: removes two unused constants 
Add null check to isSkippable. Fixes #9278 (#9280)  Motivation:  Currently GraalVM substrate returns null for reflective calls if the reflection access is not declared up front.  A change introduced in Netty 4.1.35 results in needing to register every Netty handler for reflection. This complicates matters as it is difficult to know all the possible handlers that need to be registered.  Modification:  This change adds a simple null check such that Netty does not break on GraalVM substrate without the reflection information registration.  Result:  Fixes #9278
Use LinkedHashMap for step contexts in BaseExecutionContext  This gives a performance improvement when all step contexts need to be traversed, such as for state cleanup operations. 
CAMEL-9210 - csfix -> accessKey and secretKey options for CloudWatch is now optional  csfix -> accessKey and secretKey options for CloudWatch is now optional and AWS Java SDK handles those keys unless they are not provided in URI. 
Add while loop to wait() to guard against "spurious wakeups" 
- Fix recycling glitch. I prefer using nextRequest although it's a bit slower, since it's identical to regular request   processing.  
[test]Â cloud-aws has been replaced by repository-s3 and discovery-ec2 
Support nullable arguments in PolymorphicScalarFunction  Similarly how those are supported in ReflectionParametricScalar.  For nullable arguments primitive wrapper must be used instead of primitive type. Those arguments must be properly matched to the type returned by `Type#getJavaType` which is usually primitive. 
Fixing Soap Sampler to send headers correctly   
Ignore unsupported test. 
Provide expected size when creating an array list.  Reviewed By: styurin  fbshipit-source-id: 41b92f5a15 
Fixed bug while changing the schema in transaction: an exception is raised 
Fix NPE in unconfigured VirtualWebappLoader. StringTokenizer throws the NPE if the virtualClassPath wasn't explicitely configured (null by default).  This might not be observed in the wild because a VirtualWebappLoader without a configured virtualClassPath isn't expected. But if you extend the class and add features, then this might well happen.   
Removed unused API. 
Do not use deprecated classes. 
Make return types more precise for AfterWatermarkTriggerStateMachine 
MAHOUT-560 - allow for more flexible file handling when converting text files to sequence files.   
[TEST] Remove unused plugin isolation leftover 
MINOR: Add logging when commitSync fails in StreamTask  When `consumer.commitSync` fails in `StreamTask`, the `CommitFailedException` bubbles up to [here](https://github.com/apache/kafka/blob/trunk/streams/src/main/java/org/apache/kafka/streams/processor/internals/StreamThread.java#L780) and swallowed.  It'd be great if we knew which offsets failed to commit so that we may rewind our consumer.  Author: J$ <jmonette@homeaway.com>  Reviewers: Matthias J. Sax <matthias@confluent.io>, Guozhang Wang <wangguoz@gmail.com>  Closes #2514 from jmoney8080/jsm.addCommitLogLogging 
Add missing tests for padding in CHAR equal operators 
Javadoc improvement. Fixes #4194 
Truffle-DSL: fixed minor issue in implicit cast tests. 
Created test case for issue https://github.com/orientechnologies/orientjs/issues/48 
rename steps to stepSize for clarity 
Follow-up to r1791095 Need to update OpenSSL names for ciphers that are not supported by IBM JREs  
[FLINK-11334] Remove old deserialization logic from new EnumSerializer Snapshot  This code will never be used to deserialize from an old SerializerConfigSnapshot. 
Fix type inference w/ JDK8  Motivation:  Compile crash w/ JDK8:  ``` [ERROR] /Users/slandelle/Documents/dev/workspaces/workspace-ahc2/async-http-clie nt-project/netty-bp/codec-dns/src/main/java/io/netty/handler/codec/dns/D nsMessageUtil.java:[176,16] reference to append is ambiguous   both method append(java.lang.String) in java.lang.StringBuilder and method append(java.lang.StringBuffer) in java.lang.StringBuilder match ```  Modification:  Force type explicitly  Result:  Class compile w/ JDK8 
Only attempt to create auth file parent directory if missing  Fixes an odd issue where java.nio.file.Files.createDirectories() throws an error, because the directory already exists but is a symlink. 
DefaultJavaLibraryBuilder: Let BuildRuleResolver manage its own index  Summary: In some cases, `DefaultJavaLibraryBuilder` was creating multiple rules on its own and manually adding them to the `BuildRuleResolver` index. There's no need for that, since the rules in question would get created just fine by just `require`ing them. Manually adding them to the index was causing difficulties when changing how the rules are hooked up.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: 9385ec6 
java: Adding a method toList that allows converting CompositeAction to JSON 
Removed unused import 
Add proper synchronization when access metrics.  Motivation:  We also need to add synchronization when access fields to ensure we see the latest updates.  Modifications:  Add synchronization when read fields that are written concurrently.  Result:  Ensure correct visibility of updated. 
primitive stamp folding test: exclude constant float stamps that may include negative zero from expecting to be folded 
adding toString() for debug purpose 
AbiCompilationModeTest: Give better names to the parameter values  Summary: TSIA  Test Plan: Run one of the test subclasses (e.g. `DefaultJavaLibraryTest`) in IntelliJ, observe useful names instead of `[0]` and `[1]`.  Reviewed By: dreiss  fbshipit-source-id: 65b27ba 
License header added by maven. 
clean up onBackpressureDrop() javadocs and make similar to those for onBackpressureBuffer() (#1854) 
updated test failure error message 
move to 0.18.7 
Exchange assert and blacklist check in requireInferCaptureBuildRules  Summary: `requireInferCaptureBuildRules` asserts that `source` satisfies `requireInferCaptureBuildRules` before testing if it is blacklisted. This diff exchanges these tests in order to enable blacklisting problematic files.  Test Plan: CI  I'm not sure how this should be tested, suggestions welcome!  Reviewed By: donsbot  fbshipit-source-id: 37ab20e 
added test for readonly databases not being allowed to share store files 
HIVE-1030 Hive should use scratchDir instead of system temporary directory for storing plans (Zheng Shao via namit)    
Reverted the unnecessary changes related with shutting FindBug up 
Change GWT preloader to load assets concurrently. 
Remove unused hashmap 
Refactor: use non-deprecated api 
Replace Function<X,Boolean> with Predicate to avoid boxing boolean  Summary: .  Reviewed By: philipjameson  fbshipit-source-id: 453637e187 
Add link groups setting  Summary: We add a setting to control whether link groups functionality is active. We do not want to introduce any runtime costs for pre-existing setups and would like to rollout the feature gradually.  The new API is used in a follow-up diff.  Reviewed By: williamtwilson  shipit-source-id: ddfdef8b80 
Fixed license header to AGPL 
KAFKA-8563: Remove redundant `NetworkSend.sizeDelimit()` method (#6967)  Reviewers: Ismael Juma <ismael@juma.me.uk>
Drop unnecessary synch. qualifiers  
Improve logging of raw rest actions on failure  Log the method and the path. 
[CALCITE-3146] Support the detection of nested aggregations for JdbcAggregate in SqlImplementor.(Wenhui Tang) 
Applied patch by "agile.guo@gmail.com" to fix issue 924 
Remove debug code  
Scale back this test a little bit.  It was storing 1.6 GIG is message contents. Which took a long time to store and also  will fail on machines that don't have the much free space.  If we want to run BIG tests like that they should go into a system testing module.  Scaled it back so that only 160 Megs of data are generated by the test   
removed leftover comment 
camel-hazelcast: HazelcastAggregationRepositoryOperationsTest use different keys, to prevent OptimisticLockingExceptions when running all test methods 
correct unit, avoid overflow 
Mute GatewayMetaStateTests.testAtomicityWithFailures (#39079)  Mute test GatewayMetaStateTests.testAtomicityWithFailures
Updated Observable API 
Decouple rule function creation from registration  Summary: This is in preparation to introduce a `native` provider, so that calls to native rules inside of Skylark extensions use `native.<rule>` instead of calling `<rule>` directly.  Test Plan: CI  Reviewed By: styurin  fbshipit-source-id: e8e48cd 
Make PageCache.flush take read-locks  It used to take write-locks, but this brings it in line with PagedFile.flush, which already only takes read-locks. Pessimistic read-locks are good enough, because the `dirty` flag is only ever set to `true` under a write lock. 
DX RegisterSpec optimization for de-interning: mapSourceRegisters  Summary: An upcoming change will make the RegisterSpec class not interned as a part of making DX in-process safe.  PhiInsn.mapSourceRegisters is currently doing an "==" check to determine whether to call SsaMethod.onSourceChanged.  Without interning, that check might fail where it would have previously succeeded (for two equivalent but not reference-equal RegisterSpecs), resulting in an unnecessary call to onSourceChanged.  (I don't know if this can *actually* happen.)  This diff optimizes that case by doing an early exit if the new and old source have the same register.  Inspection of the method shows that when this is the case, it just removes the instruction from a list, then adds it right back.  This diff should be correct and safe on its own, but it seems unlikely to have any benefit as long as RegisterSpec is interned.  Test Plan: ant dx-tests 
GeometryType write functions to handle null slice 
remove unused variables and useless java doc comments 
Fix missing parenthesis in commit timeout message 
[TEST][Monitoring] Use specific LAST_UPDATED constant to avoid issues when they're not the same (elastic/x-pack-elasticsearch#1976)  Original commit: elastic/x-pack-elasticsearch@a41bff564ab5914446b132352cfb3b4375087e34 
Better Exception in NetworkUtilsTests (#42109)  * We are still running into an exception here every so often    * Adjusted exception to contain interface name  * Relates to #41549  
MINOR: Specify character encoding in NetworkTestUtils (#5965)  This attempts to address the flaky test `SaslAuthenticatorTest.testCannotReauthenticateWithDifferentPrincipal()`   I was not able to reproduce locally even after 150 test runs in a loop, but given the error message:  ``` org.junit.ComparisonFailure: expected: <[6QBJiMZ6o5AqbNAjDTDjWtQSa4alfuUWsYKIy2tt7dz5heDaWZlz21yr8Gl4uEJkQABQXeEL0UebdpufDb5k8SvReSK6wYwQ9huP-9]> but was:<[????Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½????OAUTHBEARER]> ```  `????Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½????` seems to mean invalid UTF-8.  We now specify the charset when writing out and reading in bytes.  Reviewers: Ismael Juma <ismael@juma.me.uk>
CAME-713: Forced update of SimulatorTest to see if Bamboo picks up the comitted code.  
Remove unneeded import 
make javadocs for reduce() more precise (#1856) 
Simplify. Casts are unnecessary.  
[#1683] Mark unused ChannelOption @deprecated, to prepare for removal in 4.1.0.Final 
fixed cs issue with unused imports 
Speed up Xcode project generation  Summary:   * Creating header symlink trees made project generation slower than when we     used header maps. This diff mitigates this slow-down on repeated     `buck project` runs by only regenerating the header symlink trees if their     contents have changed.   * With this diff the performance of "no-op" `buck project` is comparable to     what it was before the introduction of header symlink trees and about 60%     faster than it was after header symlink trees were introduced.  Test Plan:   * `buck test`.   * Manually check the improved performance of `buck project`. 
Fix incorrect removed directory in FileWatchIT. 
Re-reading the spec, this is not required.  
[FLINK-5014] [RocksDB backend] Add toString for RocksDBStateBackend  This closes #2760 
Add missing closing paren 
update WordCount for SuperColumn refactor 
updated javadoc on eval object    
Restore non-static method in CommandPostCommand to fix compilation issue in Gremlin module 
remove extra log lines 
Remove unused parameter, and @NotNull annotation 
Better overriding support  
Minor: removed warnings, added useful methods 
Ignore furthur messages after entering terminate state 
corrects println and print implementation for Scripts to use the DefaultGroovyMethods method instead of directly printing to System.out. This adds the custom toString methods for maps, arrays and lists to the object we want to print.  
clean up coordinator component conf 
[CALCITE-403] Additional test cases for NOT on nullable expression 
Categorize error creating Hive imput format 
No-op module reflection modifications.  The WeakPairMap inside Module$ReflectionData was changing, sometimes, during heap generation of native-image.  Delete the class and no-op the relevant methods that used it.  Might be a sub-optimal solution, but avoids spurious native-image failures at this point when using JDK11+. 
rename lock_ -> sstableLock_. patch by jbellis; reviewed by Jun Rao for CASSANDRA-287  
Expose internal constructors for TestStream events  These are needed for deserialization from proto. 
ListenableFileManager to not cache ListenableJavaFileObject  Summary: FileManager keeps all JavaFileObject in memory keeping them from being picked up by garbage collector until command finishes which impacts memory usage. Object creation and destruction in young generation is cheap so let's just not cache at all.  Reviewed By: ttsugriy  fbshipit-source-id: 60f343f 
Remove redundent is decimal check  Check for decimal type is already performed at: com/facebook/presto/rcfile/RcFileEncoding.java:89 
CAMEL-10291: add test case timestamp as date value for producer 
Fix expectation on parsing exception (#31108)  The structure of the expected exception slightly changed, the change adapts the assertions accordingly.  Closes #31104
CAMEL-6407: Include message history in stacktraces from error handler, making it easier to know where the problem was. Work in progress. 
Add minor optimization to AbstractErrors  Issue: SPR-11304 
Fix CID 1186644: ES: Checking String equality using == or !=
Polished. This closes #1359. This closes #1358. This closes #1357. 
fieldValues() method not necessarily returns values in the same order as fieldNames(). Replace values[i] with this.field(field)
Add @CheckReturnValue to the com.google.common.eventbus package. This forces the caller of these APIs to "do something" with the result of the call.  For more information, see [] ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=113855301 
Log full stack trace when there is an error - may provide more clues as to what is going on.  
Clean-up. No functional change.  
Added a new tests case that proves RateLimiter works even for very small numbers.  Fixes #2594  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=146144129 
Add support for extracting boolean literals 
GROOVY-7171: DGM getIndices methods (changed List to Collection and also added object array for completeness) 
WW-4044 Solves problem with infinitive loop when used with <s:action/> tag and attribute executeResult is set to "true"  
add fireInboundBufferUpdated to fix #1085 socksproxy example 
Adjust to logger API changes in Elasticsearch  Previously core Elasticsearch had methods in a test class for removing and adding appenders. However, these methods were moved to production code. This commit adjusts x-plugins for this change.  Original commit: elastic/x-pack-elasticsearch@83e37ef65a0528df8b8213ae16c7e30b5c1bc8f1 
fixing #13 by catching all exceptions for correct return. 
Reorder timer options so advanced are last 
Issue #2089: Allow COMMA again in NoWhiteSpaceBefore 
Remove javax.xml.bind dependency from KotlinToJarStepFactory  Summary: `javax.xml.bind` is deprecated and no longer on the default classpath in Java 9/10, and is going away in Java 11 (http://openjdk.java.net/jeps/320). Removing our last dependency on this.  Reviewed By: styurin  fbshipit-source-id: cb86dd62a4 
2.x: update some marbles of Observable (#5351)  
Log cause when a write and flush fails  This commit logs the cause of a write and flush operation on the network layer that failed. 
Add additional tests for StandardErrorCode 
Properly dispose completion listener in openal 
Add awaits fix for HasChildQueryBuilderTests  These tests are failing since 569d0c0e897478be4f05a1daba8d217a526e0eeb. This commit adds an awaits fix for them until they can be addressed. 
KevinMenard: Removed an unnecessary semicolon.  r15040 
Fixed Daemon integration test  Summary: I don't know how it worked before because only `Cell.equals` affects daemon invalidation and `Cell.equals` checks only filesystem and config Closes https://github.com/facebook/buck/pull/941  Reviewed By: Coneko  fbshipit-source-id: 7216a89 
WW-4036 Extends support of Dynamic Attributes to evaluate null attributes to empty string  
CLOUDSTACK-6278 Baremetal Advanced Networking support 
Remove unused method 
Add some javadoc to MergeableState 
Fix elimination of unnecessary UnsafeCastNode 
Automated g4 rollback of changelist 108345794.  *** Reason for rollback ***  Causes performance regression in J2CL transpiler and requires incorrect code to be accepted.  *** Original change description ***  Automated g4 rollback of changelist 108184450.  *** Reason for rollback ***  Change no longer needed, j2cl transpiler was updated.  *** Original change description ***  Remove import for java.util.Formatter since it's needed only for the javadoc. This class is not supported by GWT and in the new version of GWT (J2CL) we plan to strip not needed imports only if the class/method is marked with @GwtIncompatible.  ***  *** ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=115640681 
[CALCITE-757] Fix expansion of view of another view (Venki Korukanti)  Pass ViewExpanderImpl to SqlToRelConverter so that a view of another view is expanded properly.  The issue was found in [DRILL-1145].  Close apache/incubator-calcite#94 
Correct method names in log messages  
2.x: Improve the wording of the Maybe.fromCallable JavaDoc (#5848)  
 added unit test to the gui class   
Add the so-far needed properties specific to concrete plan nodes 
removed code not used anymore from binary serialization. 
Minor refactoring: remove duplicated code of `StaticInvocationWriter` 
Test case for issue #29 
directly compare stderr to empty string in testRedirectionOfStreams to obtain more meaningful messages if test fails 
CLOUDSTACK-5145 : Added permission checks while deleting network ACLs  Conflicts:     server/src/com/cloud/network/vpc/NetworkACLServiceImpl.java 
removed the IterableNodeType marker interface from MaterializedObjectState (GRAAL-471) 
DRILL-738: Add test for left, right and replace function from sql 
Remove completed TODOs and pointless Javadoc  
NaaS: Enforce the checking of VirtualRouterElement  If SourceNAT is not provided, VirtualRouter wouldn't provide firewall, portforwarding, loadbalance, static Nat and VPN service as well. 
refactor test to cleanup persistence adapter creation for combos - fix ci 
Add additional test for SPR-16210  Issue: SPR-16210 
fixed the typeos suggested by Claus on this issue https://issues.apache.org/activemq/browse/CAMEL-255  
makes the class final, because different parts of the runtime compare directly to this class  
bug 9274: listPublicIpAddresses - don't list Direct ip addresses by default; list them only when "forVirtualNetwork=false" is specified in the request. status 9274: resolved fixed 
Fix the test as the recent fixes ensure that for a non-persistent broker config, there is not a persistent DB store.  
SimonStewart: Removing deprecated methods from the FirefoxProfile  r14715 
Cleanup: Remove unused imports (#6591)  Remove unused imports in java/client to prevent unwanted dependencies.
[ML] Add license downgrade warning (elastic/x-pack-elasticsearch#1912)  When applying a license that will cause ML to be disabled, a warning to this effect is now included in the acknowledgement messages.  relates elastic/x-pack-elasticsearch#1888  Original commit: elastic/x-pack-elasticsearch@e453f20f58658776c96e2c8a164733b37f3c2569 
Remove redundant format call 
Adding a guard to a logging test that should fail in chrome with chromedriver1 
Don't change the domain state when the domain can't be removed (cleanup=false and there are resources referencing it) Reviewed-by: Edison Su 
Start transport client round-robin randomly  This commit modifies the initial value of the transport client round-robin index to a random value so that initial requests are more likely to not all hit the same node.  Relates #14143 
Added an unit test for verify the http4 component port issue 
add method for access the storage path of a database if any. 
Add a debug flag for AbstractCollinsHeadFinder 
Fix split_zip step exception  Summary: I am trying out release builds with buck and am seeing a weird issue during proguard. Without obfuscation, everything works fine and dandy. With obfuscation, I see stuff like   ```failed on step split_zip with an exception: classpath android/support/v7/widget/ListPopupWindow$1 is contained in multiple dex stores: ``` It is usually some layout's anonymous inner classes.  Upon debugging further it seems like there are duplicate entries in the list of dex stores that cause the exception to be thrown unnecessarily.  <img width="905" alt="screen shot 2017-07-10 at 10 55 48 pm" src="https://user-images.githubusercontent.com/291148/28053763-04d669c8-65c7-11e7-8203-4ee9e3bc05da.png">  This change removes the source of the duplication without affecting the check. Verified that the `split_zip` step works correctly after this change when proguard obfuscation is enabled for a test build Closes https://github.com/facebook/buck/pull/1414  Reviewed By: dreiss  Pulled By: dreiss  fbshipit-source-id: de662b1 
DefaultSubscriptionRegistry defensively checks for removal between keySet and get calls  Issue: SPR-13205 
Use try-with statement to simplify code.  
extend from WatcherRestTestCase to make sure watcher gets restarted after each test  Original commit: elastic/x-pack-elasticsearch@6932cfd185876b8c0db9b89a885c9edc69dc24aa 
Copy phase refactor: Introduce ProjectGenerator.addCopyFilesBuildPhase()  Summary: ProjectGenerator.addCopyFrameworksBuildPhase() is the only step in the current project generator that adds a PBXCopyFilesBuildPhase to the project.  However, we'll need to add a PBXCopyFilesBuildPhase to copy application extensions into the bundle's PlugIns directory. This diff extracts out the logic to add a PBXCopyFilesBuildPhase to the project into a new routine, addCopyFilesBuildPhase(), so we can use it in later diffs to support extensions. 
SimonStewart: Making our use of the Map constructor for DesiredCapabilities more robust  r5828 
Bug 58884 - JMeter report generator : need better error message #resolve #102 Bugzilla Id: 58884  
HIVE-18528: Stats: In the bitvector codepath, when extrapolating column stats for String type columnStringColumnStatsAggregator uses the min value instead of max (Vaibhav Gumashta reviewed by Ashutosh Chauhan) 
remove writeBoolean from searchExtBuilders serialization in SearchSourceBuilder  The list is not optional anymore, default is empty list 
Made an implied generic explicit in test to help compiler 
Apply changes in FOSS because of prioprietary merges 
Tests that the data endpoint is up and running after install, and closed after uninstall 
SpecificMasterNodesIT shouldn't use autoMinMasterNodes  as it tweaks the `discovery.initial_state_timeout` setting. 
register the future with teh listener when deleting an index, so it can be canceled 
HIVE-12066 : Add javadoc for methods added to public APIs (Sergey Shelukhin) 
Fixing broken HTTP/2 benchmark  Motivation:  The `NoPriorityByteDistibbutionBenchmark` was broken with a recent commit.  Modifications:  Fixed the benchmark to use the new HTTP2 handler builder.  Result:  It builds. 
[hotfix] [runtime] Minor improvement to logging in CheckpointCoordinator 
MAHOUT-401: Creates NamedVectors when writing out merged vectors.  
TransactionAspectSupport stores given PlatformTransactionManager instance as strong reference  Issue: SPR-14609 
Added another case where casting null is not necessary 
Minor: removed warnings 
TIKA-1955: Updated to use mark() and reset() 
Fix the function registry to allow several registrations of call target lists 
Never return null from AnnotationMetadata.getMetaAnnotationTypes  Issue: SPR-17046 
[hotfix] [core] Fix assignment of strictly local splits to host instances  This closes #1345 
Dialog, prevent centering at fraction of pixel. 
Lists: only fetch cell path if you have a valid value to add patch by dbrosius, reviewed by rstupp for CASSANDRA-10941 
I reverted the change I made. the fields are back to private. I decided not to extend MainFrame. peter lin   
GROOVY-3594 reduce number of entries in the line number table  
Update IR performance test numbers 
Add workaround for missing delete key events  In Jelly Bean, the behavior when hitting delete on the soft keyboard was changed so it does not send key events in certain circumstances. We want the key events so we send them ourselves.  This workaround was previously added for GL10 but was missed for GL20. 
give test more time, was teetering on the limit locally with some builds 
slightly more helpful exception messages 
Expand scaling thread pool configuration coverage  This commit slightly expands the scaling thread pool configuration test coverage. In particular, the test testScalingThreadPoolConfiguration is expanded to include the case when min is equal to size, and the test testDynamicThreadPoolSize is expanded to include all possible cases when size is greater than or equal to min. 
Remove AbstractWebSocketClient from SockJsClient  SockJsClient now implements WebSocketClient directly without extending AbstractWebSocketClient.  Issue: SPR-12030 
Deprecate aggregate in favor of reduce  We have had aggregate from Rx.Net for a while but long ago migrated to reduce as the primary. Time to deprecate it. 
[hotfix] [tests] Harden timeout logic for TaskManager registration in AbstractTaskManagerProcessFailureRecoveryTest 
Only try and set the Firefox profile if it's not null.  Otherwise, we get an exception being thrown, which is less than ideal. 
deprecated document api 
[ML] Catch any error thrown while closing data frame analytics process (#44958)  In case closing the process throws an exception we should be catching it no matter its type. The process may have terminated because of a fatal error in which case closing the process will throw a server error, not an `IOException`. If this happens we fail to mark the persistent task as failed and the task gets in limbo.
Ignores the multi JVM zookeeper tests because they are very unstable on Hudson 
fix OMemory for handle errors new jdk9 errors 
Remove unused imports 
Added check to not delegate to objectfactory when unknown bean is object factory WW-1491   
Simplify; no need to save client and context Bugzilla Id: 53782   
[TEST] Add test to show how to parse an enum from a string in ObjectParser.java 
Minor code clean-up  
AndroidLibraryDescription: Move ABI rule construction into the builder  Summary: This finally allows us to have source-generated ABIs for `android_library` targets.  Test Plan: CI  Reviewed By: asp2insp  fbshipit-source-id: 764bb6c 
Copy improved Javadoc from 8.5.x
Do not try to find compiled class files of test classes by looking directly into "known" places, but ask the classloader where it loads them from. This fixes test failure when ${tomcat.output} ant property has non-default value.  
add missing import 
DRILL-3661: Update:  Added a @link and a @code.  This closes #119 
Reflect renaming of base test class 
Fixed bug on rendering records in JSON. The linked record is not connected anymore if not needed 
Replace toArray() argument with correctly sized array. #1555  Fixes `ToArrayCallWithZeroLengthArrayArgument` inspection violation.  Description: >Reports any call to toArray() on an object of type or subtype java.util.Collection with a zero-length array argument. When passing in an array of too small size, the toArray() method has to construct a new array of the right size using reflection. This has significantly worse performance than passing in an array of at least the size of the collection itself. 
Propagate PATH environment variable in HgCmdLineInterfaceIntegrationTest  Summary: `hg` command could require `PATH` variable to find the correct binary, so we have to propage the environment variable to the hg command launcher.  Reviewed By: styurin  fbshipit-source-id: 732d6faa4f 
Don't illegally reuse scorer in this test  Closes elastic/elasticsearch#3216  Original commit: elastic/x-pack-elasticsearch@63654c55859fb0c82a079b338845ee77ff563fca 
remove debug comment  
Partially revert 2edd481 since it can cause the entire hub to deadlock if BaseRemoteProxy#getStatus blocks. 
Convert deoptimize to guard also when deoptimize is behind (possibly nested) loop exit 
Change BWC version for VerifyRepositoryResponse (#30796)  The BWC version was previously at 7.0, because the 6.x backport had not yet landed. Now that it has landed, this commit replaces the BWC compat with the real version, 6.4.0.  Relates #30762
[java] Small refactoring of debug server 
Bug 53522 - Cache Manager should not store at all response with header "no-cache" and store other types of Cache-Control having max-age value (edit)   Fix broken test Bugzilla Id: 53522  
GROOVY-3182 add line number for automatically added returns of user expressions  
Add missing synchronzation around scheduled task  Summary: This is a linked list and should be synchronized. This is causing flakey test failures.  Reviewed By: sbalabanov  fbshipit-source-id: 14c0e72d53 
Better use of read / write locks when reading meta page and state pages 
[CALCITE-2673] Default implementation of SqlDialect should not support pushing all functions  * Adding ROW operator as supported by default 
replace isDirect with !hasArray for correctness  
Fixed argument substituion check to use exact type match 
Added missing iOS devices 
Use NRTCachingDirectory over FSDirectory  NRTCachingDirectory is a Directory implementation that wraps a RAMDirectory over the given delegate persistent Directory. The in-memory directory caches small Lucene segments and lowers merge cost for them.  This change makes cost of SearcherManager#maybeRefresh after insertion of new documents lower and improves write performance.  co-author: @MishaDemianenko 
Make test timeout bigger to adapt to slow machines 
Patched the String helper methods so that they work on any CharSequence implementation   
Fixed bug that caused push of logs to slave to roate log for each slave.    
bug 9013: Adding hypercisor type for xs-tools.iso when inserting it into vm_template. status 9013: resolved fixed 
Fix some typos in MediaType javadocs and error messages. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=28512819 
Fix MiltiArtifactCache BorrowablePath handling on get  Summary: If we get a cache hit, then we will want to return the resulting Path, therefore it can't be 'consumed' by the store.  Test Plan: CI  Reviewed By: beefon  fbshipit-source-id: a87c91f 
Update comments (paths in properties). 
Wait for all threads stopped, even those add on the fly during a test  Bugzilla Id: 60933   
Add some simple JavaDoc descriptions of the property types, to help people who don't natively speak xmp! (TIKA-926 related)  
STORM-3161 Local mode should force setting min replication count to 1  When topology.min.replication.count is set to more than 1, nimbus in local mode never achieve condition for replication, hence stuck on handling blobs. We should force set it to 1 in local mode to avoid this situation. 
Remove unused code.  
Remove reading node settings as defaults for hdfs repository settings 
Add support for additional 500 error codes. Allow responses to include blank lines  
Update core/src/main/java/com/orientechnologies/orient/core/db/ODatabaseRecordWrapperAbstract.java  Allow set user back to current database instance
Use MessageList.first() and last() wherever possible  - Related issue: #1530 
Internal: remove unused MapperQueryParser constructor 
Custom Import Order Check, rewrote compare method, issue #234 
Code cleanup in mocking storm-starter tests 
Improve failure message from testUrls to help us figure out why it's failing on Travis, e.g., https://travis-ci.org/google/guava/jobs/53222839 "testUrls(com.google.common.reflect.ClassPathTest): expected:<3> but was:<1>" ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=87967592 
Revert "[TEST] added @AwaitsFix to failing StringTermsTests while I work on a fix"  This reverts commit 18a713a2ae896e72c5821bf3f6d239ce634d1f52. 
CLOUDSTACK-3428 UCS:API: We need listUCSManager API to lists all UCS managers registered with CloudStack  fixed resolved 
Remove unnecessary @throws in javadoc 
only ping timeout trigger host HA, otherwise there may be two threads try to HA the same VM 
[hotfix] [tests] Minor code cleanups in SavepointITCase 
Fix the TGC cookie expiration to only apply remember me max age when remember me param is specified and remember me is enabled. (#3176)  
Improve javadoc wording on ngram features. 
STORM-3328 Allow overriding function name for BasicDRPCTopology 
Add xcode_project_generation chrome trace events  Summary: See which projects took a long time to generate their projects.  Test Plan: run buck project on an xcode project, see xcode_project_generation events in the chrome trace  Reviewed By: beefon  fb-gh-sync-id: b2a54f9 shipit-source-id: b2a54f9 
Update Javadoc on exception resolvers in MVC config  Issue: SPR-15324 
[changed] a shitload. Removed FloatMesh, FixedPointMesh and MeshRenderer. Everything Mesh specific can now be done via the Mesh class. Introduced SpriteBatch, it's now the only way to render text. Need to do some more testing of it and offer more methods (e.g. similar to XNA SpriteBatch, add rotation, scale, origin and effect (mirroring)). This change makes for a pretty slick API which easily allows having two code paths for OpenGL ES 1.x and 2.0. 
HIVE-13174: Remove Vectorizer noise in logs (Wei Zheng, reviewed by Matt McCline) 
minor refactor: remove javadoc warning 
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
