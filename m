Return-Path: <linux-i2c+bounces-14439-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 655D6CA71E9
	for <lists+linux-i2c@lfdr.de>; Fri, 05 Dec 2025 11:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7EA443173C59
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Dec 2025 07:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963963314B9;
	Fri,  5 Dec 2025 07:21:20 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10495329398
	for <linux-i2c@vger.kernel.org>; Fri,  5 Dec 2025 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764919271; cv=none; b=QI4wm7U/bJFobql+nYrf0MtyjpcYj9mmBgI9w8rf34DNQVUGho1j9KHsf6Y87lftj4LuJOPcam+UvYd1hMoDzcTMdYmyOXyAFDSjZWPY5EcSEUVXfbMfY6/NHhwFHCsm4r8PdWDi3wwAZq+ncB4ARXu4zxJHxrZdncfdjzZpw4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764919271; c=relaxed/simple;
	bh=Yu9e+dxc+9idKcbHwzd+Yi8MNegPjMt6TAcViPKBlfI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=k9xFymo35IhOMnmd2m82EOhKCPxaEiP47CaUl5jnSzvk4b61DpZNcH7F5JOGrphmh0StyOZrjvSBex868V85V4ZAPTgfcMIvqbsyt3QZEUk1NjaCddXOfmOjoBpl0DUaljFHtlL0LrJpNIJ+rlzBoHqHPcH2ld5hXSHOcG1yY2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-c2dff70000001609-a9-693287725a35
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Cc: kernel_team@skhynix.com,
	torvalds@linux-foundation.org,
	damien.lemoal@opensource.wdc.com,
	linux-ide@vger.kernel.org,
	adilger.kernel@dilger.ca,
	linux-ext4@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	will@kernel.org,
	tglx@linutronix.de,
	rostedt@goodmis.org,
	joel@joelfernandes.org,
	sashal@kernel.org,
	daniel.vetter@ffwll.ch,
	duyuyang@gmail.com,
	johannes.berg@intel.com,
	tj@kernel.org,
	tytso@mit.edu,
	willy@infradead.org,
	david@fromorbit.com,
	amir73il@gmail.com,
	gregkh@linuxfoundation.org,
	kernel-team@lge.com,
	linux-mm@kvack.org,
	akpm@linux-foundation.org,
	mhocko@kernel.org,
	minchan@kernel.org,
	hannes@cmpxchg.org,
	vdavydov.dev@gmail.com,
	sj@kernel.org,
	jglisse@redhat.com,
	dennis@kernel.org,
	cl@linux.com,
	penberg@kernel.org,
	rientjes@google.com,
	vbabka@suse.cz,
	ngupta@vflare.org,
	linux-block@vger.kernel.org,
	josef@toxicpanda.com,
	linux-fsdevel@vger.kernel.org,
	jack@suse.cz,
	jlayton@kernel.org,
	dan.j.williams@intel.com,
	hch@infradead.org,
	djwong@kernel.org,
	dri-devel@lists.freedesktop.org,
	rodrigosiqueiramelo@gmail.com,
	melissa.srw@gmail.com,
	hamohammed.sa@gmail.com,
	harry.yoo@oracle.com,
	chris.p.wilson@intel.com,
	gwan-gyeong.mun@intel.com,
	max.byungchul.park@gmail.com,
	boqun.feng@gmail.com,
	longman@redhat.com,
	yunseong.kim@ericsson.com,
	ysk@kzalloc.com,
	yeoreum.yun@arm.com,
	netdev@vger.kernel.org,
	matthew.brost@intel.com,
	her0gyugyu@gmail.com,
	corbet@lwn.net,
	catalin.marinas@arm.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	sumit.semwal@linaro.org,
	gustavo@padovan.org,
	christian.koenig@amd.com,
	andi.shyti@kernel.org,
	arnd@arndb.de,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	rppt@kernel.org,
	surenb@google.com,
	mcgrof@kernel.org,
	petr.pavlu@suse.com,
	da.gomez@kernel.org,
	samitolvanen@google.com,
	paulmck@kernel.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	josh@joshtriplett.org,
	urezki@gmail.com,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	chuck.lever@oracle.com,
	neil@brown.name,
	okorniev@redhat.com,
	Dai.Ngo@oracle.com,
	tom@talpey.com,
	trondmy@kernel.org,
	anna@kernel.org,
	kees@kernel.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	mark.rutland@arm.com,
	ada.coupriediaz@arm.com,
	kristina.martsenko@arm.com,
	wangkefeng.wang@huawei.com,
	broonie@kernel.org,
	kevin.brodsky@arm.com,
	dwmw@amazon.co.uk,
	shakeel.butt@linux.dev,
	ast@kernel.org,
	ziy@nvidia.com,
	yuzhao@google.com,
	baolin.wang@linux.alibaba.com,
	usamaarif642@gmail.com,
	joel.granados@kernel.org,
	richard.weiyang@gmail.com,
	geert+renesas@glider.be,
	tim.c.chen@linux.intel.com,
	linux@treblig.org,
	alexander.shishkin@linux.intel.com,
	lillian@star-ark.net,
	chenhuacai@kernel.org,
	francesco@valla.it,
	guoweikang.kernel@gmail.com,
	link@vivo.com,
	jpoimboe@kernel.org,
	masahiroy@kernel.org,
	brauner@kernel.org,
	thomas.weissschuh@linutronix.de,
	oleg@redhat.com,
	mjguzik@gmail.com,
	andrii@kernel.org,
	wangfushuai@baidu.com,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-i2c@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-modules@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	2407018371@qq.com,
	dakr@kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	neilb@ownmail.net,
	bagasdotme@gmail.com,
	wsa+renesas@sang-engineering.com,
	dave.hansen@intel.com,
	geert@linux-m68k.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v18 31/42] dept: assign unique dept_key to each distinct wait_for_completion() caller
Date: Fri,  5 Dec 2025 16:18:44 +0900
Message-Id: <20251205071855.72743-32-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251205071855.72743-1-byungchul@sk.com>
References: <20251205071855.72743-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa2xTZRjHfc/lPWeFykklejZUTKPBSJjdRHw+eCEx6BsSE4aJQdBgw07s
	Cd3F7q4SNhGoyxjLdCBrxzrZ2m2njNpC2BYGu8gER1lxCUxkN53DrV2npSt264bdCN9+z/O/
	PF8entbcZpN4OTNXMmXqjVqsYlTTK+s2mA6nyrrodCqYD+6H2bCZAesZJ4YFy3kOzO4TLPha
	FAQjs2YE9+ctNCxU9nLgPFtCwfHJEgZm7GUI7OOLFNT+4MHgP/YPhnlvPw11Y0M0dDR+heGv
	inM0BF0Y2kbbObjhj1GguN+DqL2ZA4t3gIXYWAoMHa1ioGW6nwX/RCWG88WjHLh/u4zAWTYR
	77m9HswLYQS9rX9QMNBuxeDr7GPhV8XHwJm7gxT09V5h4Gp1EwO/e49y0N9+moWGWzco8Hiv
	0RApXwP22RkOSrpOMdBU60AQqo8wcOjeIgtey3UW7pRPxcf6HylwO29iuFtdQ8GcI34/VBO3
	VMXMGFz/OjCUX38X/nP9yUKwIsyC5fIwt3kzcZ50IjI/V4lIuOEATXoCMzT52lNAGvoCmHRE
	bAxpqx7iiM2dR05dmKSIu/kbTK58P8+QuuIqmpy8mkb+9pxA5MiBIN729E7V6+mSUc6XTC+/
	+YnKMG5Jyw5/Vhh19KBi1PpxKUrgRWGj2P7zJeoRjz/oYpYYC+vEwcEovcSrhedEz5EJthSp
	eFoYWCsejpYvC08Ikjj5XSwe5nlGeEG8dgkvrdXCJnHklzL0sHOtqLg6l+0J8X3Vrbll1giv
	irWl95c7RUFJEAP2O/hhIFHsahxkKpDahh5rRho5Mz9DLxs3JhuKMuXC5D1ZGW4U/zj7vtiu
	VhTyvd+NBB5pV6o7C1JkDavPzynK6EYiT2tXqwNGnaxRp+uLPpdMWbtNeUYppxut4RntU+rU
	SEG6RvhUnyvtlaRsyfRIpfiEpGK0/ksSMiTlUqGDiW/U29T+kGHbt+6bgY9iPw37V+VtCu47
	tMj26PYSojy/dceISd590frsxWNZp8casxvT1vk+eIsNNkzV9F3Y1ebY/84XD7Zyrz3ZvyVS
	VjiVjJ+515L7Ykh8fPvbTcc7lERWWbFTp1uhMHkfWl8Z3uIaMFs7baNaJsegT3mJNuXo/wec
	JbP7bQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSX0xTBxTGPfdfL8UuN5XEqz64NHEzRBQNkpNopj4Yb5agaMzMlqA2cpWG
	UqFFhG1OSu3AqlgbWybFiTCqARTWKhNcZwUh/sFARYSorLJVNgKKgxYsULCw+HLyO9/3nZPz
	cFhS3kAvZVWabFGrUaoVjJSSbt9giNMWrlPF64PRWGQ8ji99fhqf6T0UBgNFFJbV1TIYtv8m
	wSLnBRrv9xRQ2Hm9BtAXLAKcmLKTaGycpTBsaZNgIPRCglY94Ky7DdDmtZDY23mHxNobegLH
	6mcYHGoZBbT2+xksGdRTOOI4DVg6YJfgYOs2fOO7TeNs3z8E9owPAzr8MwT6PYWAYVs6Xqpw
	RcZt7xicetxBYom1E/Byfx+Jo4OvAG+0/QnovlrA4GvzTRK7/J/g0+AIgw+spxh84y0j8G09
	g+UFbhq97UOAF+0WwIHnbgINlXUM2i46KWx81SRB79A0gS9tFgJrnEnocwxQ+MhcQUTOjaR+
	XYz2EgMRKf8SaL12m8CQo1qyuQqECWMxJVS7GgjB+CTMCLU/14IwNWkBIVBlIAWjOdK2DI+Q
	wgnXUaHq0TAjTAa7GcE9Xk4JDyt44ZeTk4Rw7nGc0FjaJ0ne8o10Y6qoVuWI2jVf7Jem+e07
	MwNZuaErLZAPt1JMEMXyXALvn71LzTHDfc739obIOY7hPuVdZwZoE0hZkutazheGiueNRZzI
	D56fJkzAshS3gm+/w8zJMi6R9z08Df/vXM7X1Hvm41ER3dozOc9ybj1/yTRBm0FaDguqIUal
	yclQqtTrV+vS0/I0qtzVBw5nOCHyTY5j0+duQaBrWzNwLCgWyjxH16rktDJHl5fRDDxLKmJk
	w+p4lVyWqsz7VtQe3qc9ohZ1zbCMpRSLZV/uEffLuUPKbDFdFDNF7UeXYKOW5oPnr1U5sTu/
	Sk6YjsvMuLqk25TkOBDX6j20bGvxovjPDl5rqOmhHe3v1/zd9GP//U27i0+0JTSGL+9KMU+d
	nSBWPogeiSmVVHCpv+c2hG1fS2PH/qhckLwjv+77687vQGro+GHvhqyzPzXdbO2eubeSTPyv
	ObZMt+egP8mVaH79VFOgyFJQujTl2lhSq1N+AFdBCE5JAwAA
X-CFilter-Loop: Reflected
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

wait_for_completion() can be used at various points in the code and it's
very hard to distinguish wait_for_completion()s between different usages.
Using a single dept_key for all the wait_for_completion()s could trigger
false positive reports.

Assign unique dept_key to each distinct wait_for_completion() caller to
avoid false positive reports.

While at it, add a rust helper for wait_for_completion() to avoid build
errors.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/completion.h | 100 +++++++++++++++++++++++++++++++------
 kernel/sched/completion.c  |  60 +++++++++++-----------
 rust/helpers/completion.c  |   5 ++
 3 files changed, 120 insertions(+), 45 deletions(-)

diff --git a/include/linux/completion.h b/include/linux/completion.h
index 3200b741de28..4d8fb1d95c0a 100644
--- a/include/linux/completion.h
+++ b/include/linux/completion.h
@@ -27,12 +27,10 @@
 struct completion {
 	unsigned int done;
 	struct swait_queue_head wait;
-	struct dept_map dmap;
 };
 
 #define init_completion(x)				\
 do {							\
-	sdt_map_init(&(x)->dmap);			\
 	__init_completion(x);				\
 } while (0)
 
@@ -43,17 +41,14 @@ do {							\
 
 static inline void complete_acquire(struct completion *x, long timeout)
 {
-	sdt_might_sleep_start_timeout(&x->dmap, timeout);
 }
 
 static inline void complete_release(struct completion *x)
 {
-	sdt_might_sleep_end();
 }
 
 #define COMPLETION_INITIALIZER(work) \
-	{ 0, __SWAIT_QUEUE_HEAD_INITIALIZER((work).wait), \
-	  .dmap = DEPT_MAP_INITIALIZER(work, NULL), }
+	{ 0, __SWAIT_QUEUE_HEAD_INITIALIZER((work).wait), }
 
 #define COMPLETION_INITIALIZER_ONSTACK_MAP(work, map) \
 	(*({ init_completion_map(&(work), &(map)); &(work); }))
@@ -119,18 +114,18 @@ static inline void reinit_completion(struct completion *x)
 	x->done = 0;
 }
 
-extern void wait_for_completion(struct completion *);
-extern void wait_for_completion_io(struct completion *);
-extern int wait_for_completion_interruptible(struct completion *x);
-extern int wait_for_completion_killable(struct completion *x);
-extern int wait_for_completion_state(struct completion *x, unsigned int state);
-extern unsigned long wait_for_completion_timeout(struct completion *x,
+extern void __wait_for_completion(struct completion *);
+extern void __wait_for_completion_io(struct completion *);
+extern int __wait_for_completion_interruptible(struct completion *x);
+extern int __wait_for_completion_killable(struct completion *x);
+extern int __wait_for_completion_state(struct completion *x, unsigned int state);
+extern unsigned long __wait_for_completion_timeout(struct completion *x,
 						   unsigned long timeout);
-extern unsigned long wait_for_completion_io_timeout(struct completion *x,
+extern unsigned long __wait_for_completion_io_timeout(struct completion *x,
 						    unsigned long timeout);
-extern long wait_for_completion_interruptible_timeout(
+extern long __wait_for_completion_interruptible_timeout(
 	struct completion *x, unsigned long timeout);
-extern long wait_for_completion_killable_timeout(
+extern long __wait_for_completion_killable_timeout(
 	struct completion *x, unsigned long timeout);
 extern bool try_wait_for_completion(struct completion *x);
 extern bool completion_done(struct completion *x);
@@ -139,4 +134,79 @@ extern void complete(struct completion *);
 extern void complete_on_current_cpu(struct completion *x);
 extern void complete_all(struct completion *);
 
+#define wait_for_completion(x)						\
+({									\
+	sdt_might_sleep_start_timeout(NULL, -1L);			\
+	__wait_for_completion(x);					\
+	sdt_might_sleep_end();						\
+})
+#define wait_for_completion_io(x)					\
+({									\
+	sdt_might_sleep_start_timeout(NULL, -1L);			\
+	__wait_for_completion_io(x);					\
+	sdt_might_sleep_end();						\
+})
+#define wait_for_completion_interruptible(x)				\
+({									\
+	int __ret;							\
+									\
+	sdt_might_sleep_start_timeout(NULL, -1L);			\
+	__ret = __wait_for_completion_interruptible(x);			\
+	sdt_might_sleep_end();						\
+	__ret;								\
+})
+#define wait_for_completion_killable(x)					\
+({									\
+	int __ret;							\
+									\
+	sdt_might_sleep_start_timeout(NULL, -1L);			\
+	__ret = __wait_for_completion_killable(x);			\
+	sdt_might_sleep_end();						\
+	__ret;								\
+})
+#define wait_for_completion_state(x, s)					\
+({									\
+	int __ret;							\
+									\
+	sdt_might_sleep_start_timeout(NULL, -1L);			\
+	__ret = __wait_for_completion_state(x, s);			\
+	sdt_might_sleep_end();						\
+	__ret;								\
+})
+#define wait_for_completion_timeout(x, t)				\
+({									\
+	unsigned long __ret;						\
+									\
+	sdt_might_sleep_start_timeout(NULL, t);				\
+	__ret = __wait_for_completion_timeout(x, t);			\
+	sdt_might_sleep_end();						\
+	__ret;								\
+})
+#define wait_for_completion_io_timeout(x, t)				\
+({									\
+	unsigned long __ret;						\
+									\
+	sdt_might_sleep_start_timeout(NULL, t);				\
+	__ret = __wait_for_completion_io_timeout(x, t);			\
+	sdt_might_sleep_end();						\
+	__ret;								\
+})
+#define wait_for_completion_interruptible_timeout(x, t)			\
+({									\
+	long __ret;							\
+									\
+	sdt_might_sleep_start_timeout(NULL, t);				\
+	__ret = __wait_for_completion_interruptible_timeout(x, t);	\
+	sdt_might_sleep_end();						\
+	__ret;								\
+})
+#define wait_for_completion_killable_timeout(x, t)			\
+({									\
+	long __ret;							\
+									\
+	sdt_might_sleep_start_timeout(NULL, t);				\
+	__ret = __wait_for_completion_killable_timeout(x, t);		\
+	sdt_might_sleep_end();						\
+	__ret;								\
+})
 #endif
diff --git a/kernel/sched/completion.c b/kernel/sched/completion.c
index 5e45a60ff7b3..7262000db114 100644
--- a/kernel/sched/completion.c
+++ b/kernel/sched/completion.c
@@ -4,7 +4,7 @@
  * Generic wait-for-completion handler;
  *
  * It differs from semaphores in that their default case is the opposite,
- * wait_for_completion default blocks whereas semaphore default non-block. The
+ * __wait_for_completion default blocks whereas semaphore default non-block. The
  * interface also makes it easy to 'complete' multiple waiting threads,
  * something which isn't entirely natural for semaphores.
  *
@@ -42,7 +42,7 @@ void complete_on_current_cpu(struct completion *x)
  * This will wake up a single thread waiting on this completion. Threads will be
  * awakened in the same order in which they were queued.
  *
- * See also complete_all(), wait_for_completion() and related routines.
+ * See also complete_all(), __wait_for_completion() and related routines.
  *
  * If this function wakes up a task, it executes a full memory barrier before
  * accessing the task state.
@@ -139,23 +139,23 @@ wait_for_common_io(struct completion *x, long timeout, int state)
 }
 
 /**
- * wait_for_completion: - waits for completion of a task
+ * __wait_for_completion: - waits for completion of a task
  * @x:  holds the state of this particular completion
  *
  * This waits to be signaled for completion of a specific task. It is NOT
  * interruptible and there is no timeout.
  *
- * See also similar routines (i.e. wait_for_completion_timeout()) with timeout
+ * See also similar routines (i.e. __wait_for_completion_timeout()) with timeout
  * and interrupt capability. Also see complete().
  */
-void __sched wait_for_completion(struct completion *x)
+void __sched __wait_for_completion(struct completion *x)
 {
 	wait_for_common(x, MAX_SCHEDULE_TIMEOUT, TASK_UNINTERRUPTIBLE);
 }
-EXPORT_SYMBOL(wait_for_completion);
+EXPORT_SYMBOL(__wait_for_completion);
 
 /**
- * wait_for_completion_timeout: - waits for completion of a task (w/timeout)
+ * __wait_for_completion_timeout: - waits for completion of a task (w/timeout)
  * @x:  holds the state of this particular completion
  * @timeout:  timeout value in jiffies
  *
@@ -167,28 +167,28 @@ EXPORT_SYMBOL(wait_for_completion);
  * till timeout) if completed.
  */
 unsigned long __sched
-wait_for_completion_timeout(struct completion *x, unsigned long timeout)
+__wait_for_completion_timeout(struct completion *x, unsigned long timeout)
 {
 	return wait_for_common(x, timeout, TASK_UNINTERRUPTIBLE);
 }
-EXPORT_SYMBOL(wait_for_completion_timeout);
+EXPORT_SYMBOL(__wait_for_completion_timeout);
 
 /**
- * wait_for_completion_io: - waits for completion of a task
+ * __wait_for_completion_io: - waits for completion of a task
  * @x:  holds the state of this particular completion
  *
  * This waits to be signaled for completion of a specific task. It is NOT
  * interruptible and there is no timeout. The caller is accounted as waiting
  * for IO (which traditionally means blkio only).
  */
-void __sched wait_for_completion_io(struct completion *x)
+void __sched __wait_for_completion_io(struct completion *x)
 {
 	wait_for_common_io(x, MAX_SCHEDULE_TIMEOUT, TASK_UNINTERRUPTIBLE);
 }
-EXPORT_SYMBOL(wait_for_completion_io);
+EXPORT_SYMBOL(__wait_for_completion_io);
 
 /**
- * wait_for_completion_io_timeout: - waits for completion of a task (w/timeout)
+ * __wait_for_completion_io_timeout: - waits for completion of a task (w/timeout)
  * @x:  holds the state of this particular completion
  * @timeout:  timeout value in jiffies
  *
@@ -201,14 +201,14 @@ EXPORT_SYMBOL(wait_for_completion_io);
  * till timeout) if completed.
  */
 unsigned long __sched
-wait_for_completion_io_timeout(struct completion *x, unsigned long timeout)
+__wait_for_completion_io_timeout(struct completion *x, unsigned long timeout)
 {
 	return wait_for_common_io(x, timeout, TASK_UNINTERRUPTIBLE);
 }
-EXPORT_SYMBOL(wait_for_completion_io_timeout);
+EXPORT_SYMBOL(__wait_for_completion_io_timeout);
 
 /**
- * wait_for_completion_interruptible: - waits for completion of a task (w/intr)
+ * __wait_for_completion_interruptible: - waits for completion of a task (w/intr)
  * @x:  holds the state of this particular completion
  *
  * This waits for completion of a specific task to be signaled. It is
@@ -216,7 +216,7 @@ EXPORT_SYMBOL(wait_for_completion_io_timeout);
  *
  * Return: -ERESTARTSYS if interrupted, 0 if completed.
  */
-int __sched wait_for_completion_interruptible(struct completion *x)
+int __sched __wait_for_completion_interruptible(struct completion *x)
 {
 	long t = wait_for_common(x, MAX_SCHEDULE_TIMEOUT, TASK_INTERRUPTIBLE);
 
@@ -224,10 +224,10 @@ int __sched wait_for_completion_interruptible(struct completion *x)
 		return t;
 	return 0;
 }
-EXPORT_SYMBOL(wait_for_completion_interruptible);
+EXPORT_SYMBOL(__wait_for_completion_interruptible);
 
 /**
- * wait_for_completion_interruptible_timeout: - waits for completion (w/(to,intr))
+ * __wait_for_completion_interruptible_timeout: - waits for completion (w/(to,intr))
  * @x:  holds the state of this particular completion
  * @timeout:  timeout value in jiffies
  *
@@ -238,15 +238,15 @@ EXPORT_SYMBOL(wait_for_completion_interruptible);
  * or number of jiffies left till timeout) if completed.
  */
 long __sched
-wait_for_completion_interruptible_timeout(struct completion *x,
+__wait_for_completion_interruptible_timeout(struct completion *x,
 					  unsigned long timeout)
 {
 	return wait_for_common(x, timeout, TASK_INTERRUPTIBLE);
 }
-EXPORT_SYMBOL(wait_for_completion_interruptible_timeout);
+EXPORT_SYMBOL(__wait_for_completion_interruptible_timeout);
 
 /**
- * wait_for_completion_killable: - waits for completion of a task (killable)
+ * __wait_for_completion_killable: - waits for completion of a task (killable)
  * @x:  holds the state of this particular completion
  *
  * This waits to be signaled for completion of a specific task. It can be
@@ -254,7 +254,7 @@ EXPORT_SYMBOL(wait_for_completion_interruptible_timeout);
  *
  * Return: -ERESTARTSYS if interrupted, 0 if completed.
  */
-int __sched wait_for_completion_killable(struct completion *x)
+int __sched __wait_for_completion_killable(struct completion *x)
 {
 	long t = wait_for_common(x, MAX_SCHEDULE_TIMEOUT, TASK_KILLABLE);
 
@@ -262,9 +262,9 @@ int __sched wait_for_completion_killable(struct completion *x)
 		return t;
 	return 0;
 }
-EXPORT_SYMBOL(wait_for_completion_killable);
+EXPORT_SYMBOL(__wait_for_completion_killable);
 
-int __sched wait_for_completion_state(struct completion *x, unsigned int state)
+int __sched __wait_for_completion_state(struct completion *x, unsigned int state)
 {
 	long t = wait_for_common(x, MAX_SCHEDULE_TIMEOUT, state);
 
@@ -272,10 +272,10 @@ int __sched wait_for_completion_state(struct completion *x, unsigned int state)
 		return t;
 	return 0;
 }
-EXPORT_SYMBOL(wait_for_completion_state);
+EXPORT_SYMBOL(__wait_for_completion_state);
 
 /**
- * wait_for_completion_killable_timeout: - waits for completion of a task (w/(to,killable))
+ * __wait_for_completion_killable_timeout: - waits for completion of a task (w/(to,killable))
  * @x:  holds the state of this particular completion
  * @timeout:  timeout value in jiffies
  *
@@ -287,12 +287,12 @@ EXPORT_SYMBOL(wait_for_completion_state);
  * or number of jiffies left till timeout) if completed.
  */
 long __sched
-wait_for_completion_killable_timeout(struct completion *x,
+__wait_for_completion_killable_timeout(struct completion *x,
 				     unsigned long timeout)
 {
 	return wait_for_common(x, timeout, TASK_KILLABLE);
 }
-EXPORT_SYMBOL(wait_for_completion_killable_timeout);
+EXPORT_SYMBOL(__wait_for_completion_killable_timeout);
 
 /**
  *	try_wait_for_completion - try to decrement a completion without blocking
@@ -334,7 +334,7 @@ EXPORT_SYMBOL(try_wait_for_completion);
  *	completion_done - Test to see if a completion has any waiters
  *	@x:	completion structure
  *
- *	Return: 0 if there are waiters (wait_for_completion() in progress)
+ *	Return: 0 if there are waiters (__wait_for_completion() in progress)
  *		 1 if there are no waiters.
  *
  *	Note, this will always return true if complete_all() was called on @X.
diff --git a/rust/helpers/completion.c b/rust/helpers/completion.c
index b2443262a2ae..5bae5e749def 100644
--- a/rust/helpers/completion.c
+++ b/rust/helpers/completion.c
@@ -6,3 +6,8 @@ void rust_helper_init_completion(struct completion *x)
 {
 	init_completion(x);
 }
+
+void rust_helper_wait_for_completion(struct completion *x)
+{
+	wait_for_completion(x);
+}
-- 
2.17.1


