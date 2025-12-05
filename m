Return-Path: <linux-i2c+bounces-14435-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 98470CA6718
	for <lists+linux-i2c@lfdr.de>; Fri, 05 Dec 2025 08:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1163F3114747
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Dec 2025 07:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D69329E40;
	Fri,  5 Dec 2025 07:20:57 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6276D398F9D;
	Fri,  5 Dec 2025 07:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764919251; cv=none; b=rAtCIgQemeq/zr0rYKzNYD3nUQ1DO11OnW74RS0eoRouNlfZA1BDR5o03lhaTFcufbs9ZYO4G4vQrtEEOaUu6k11utZNpFhV9tq3LaFVuT6hluXjRbwf82eeRVitHlYEXMgi4w/nGIZbSmjA/tFhvdGqVsHjVE/XiQpi4pQ20Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764919251; c=relaxed/simple;
	bh=PAgX+XFFVcrRCuZJksm1avuMBgGWXywEurxn0c5Q3Ww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=lIwP3Bdo+pxAvLwplffJGZFzJ7LVO25ucmu42lsS5xCDLyBOVIrHdS7PU7m5msMi/Dp3QYHR2Ou3yinpmJlZHwWrBYBPH2IqsPzVjwiw6iCkymWXoAfJRAQbzIGMRQ6XKA/WApo8Q78AE+b/Xe3ztrWtDoIWaDNQrSwHjxWbKnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-c45ff70000001609-97-69328770b747
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
Subject: [PATCH v18 22/42] dept: track PG_locked with dept
Date: Fri,  5 Dec 2025 16:18:35 +0900
Message-Id: <20251205071855.72743-23-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251205071855.72743-1-byungchul@sk.com>
References: <20251205071855.72743-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSeUxTeRDH+b2rpaHJs5L41Bi1CZpgUPDKhGyMJrvJSzZEE6NR+WO3gZfl
	SSlYLAWjkS5XJUhqDSA85arURop06ZIVEEKB4IEoXlAJh0S3bAP1KC0NVGRLd/1n8pmZ73xn
	/hgxLhsnN4l51XlOrVIo5ZSEkHiiGuKySvby8aNXtoG+6DKM6noJ8Pv0BKwIf4ng0djvBIzc
	a0Yw7dcjCAQFHFaMgyKo0CFY7R5EYP1Th8GC7RsFc/1eBFVuHQE1LkEEnukuElYnZzEYW5xH
	YP7wDYO6RntIV/mZguDwcxy87ncI/ja04/Da/4mCjzYKbglGBAWmVgo63nWKYKLSiMG02UXA
	kKERA6GqYC38g0FFSxcGS+a7IjDnx8DXmQRYrc+EOZeRgumHxST4Xs9gYC1z4dD2fpSE7vFd
	0FB8m4Dq2gkK9Cs+BGW2dhLyhQAJrbNODIYGHxHwvLOFhKaxFxjYh5/isFi+GVo+NoZOXjTj
	8LZqPrTN/0kEOoeJAMuXKhJcb4qxw6lsoKicYIterlCstdaK2OCyEbG+pgKcLTKE0kK7lm0a
	mqfYZf8bir02HMd21EyK2MKecRFb36ZhCwc8JGu3xLKmB27sWNwZyQ+pnJLP4dR7Dv0qSatt
	sOBZk5m59hszeD66nVyKIsUMvZ+5bpkiv3PP5wVsjSl6J+N0LuFrHE1vY+xXXSGNRIzTr7Yy
	JUvl4cZ6OpG5M2IOM0HHME/dnjBL6YPME7Mb/890K9Ns6w1zZKheMbYcZhl9gKkrDYRNGbou
	kqlZePv/wEbGYXESBiStRxF3kYxX5WQoeOX+3Wl5Kj53d0pmRhsKfZz50tfk+8g7crwP0WIk
	j5L2ahN4GanIyc7L6EOMGJdHS+eV8bxMmqrIu8CpM39Ra5Rcdh/aLCbkG6R7F7WpMvo3xXku
	neOyOPX3LiaO3JSPqs+dVcRPDVrTGa2JSRqYOKeJ8ArjF3l1xEtv+8krTmf7jtwT6SkO37BD
	tS422J8UYzi92p/4szGxRLPlx50pmrbHB2xHHT/1lQUuL9xvbjjy4bBJOKUVziR7Ymb12thn
	wavRlRfWFUex2xOSjNXrfXOlsuS81rpJvLX/5h9T++REdpoiIRZXZyv+BUbg3HxtAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxScRTG+997uSBFu6HNW33Q0XubVi7b6WXN+lB3bb2sPrSVLVndkoni
	IE1bLyIhpuWMBpSUqenN1FLBSjPKqFylLcxKV5JZZDI1m0LMt4xofTn7nfM859n5cAS4uJ43
	VyBLOsoqk6RyCSkkhNvXaSIUuijZCpcnGrK1p6Gr28WD9+omAryebAKuVFeRMGm+x4dsy2Ue
	PO/IJMBxuxJBtzcbgW/cjIO2YYqASX0zHzyjH/lgUCOYsjUjMLbpceh0PMKhqk6NwUjNbxL6
	nwwjMPS4SDC51QQMcecQFPSa+eB+tgUGuxt5MOX8jkHHrwEEnOs3Bq4mHYJJYwJcK7H6140/
	SRh/9RoHk8GBoLjHicOw+zOCuuZPCGzlmSR8y7+DQ7trJrz1DpHwwpBLwmDbFQx+1JBQlGnj
	QVtrP4KrZj2C3g82DDTXq0kwXrUQ0PD5Ph/a+icw6DLqMai0bINurpeAlvwSzH+u31UbCmaT
	BvOXPgwMtxoxGOUq+DFliPFp8wimwnoXY7RvJkmmqrAKMeNjesR4yjQ4o833t08GhnDmjPUY
	U9YyQDJj3nckY/tVRDAvS2im9OwYxlx4FcE0FDj5OzfuFa4/xMplqaxy+YY4YXxhcTme7FSk
	WS/14BmodF8OChLQ1Cr64c8R7C+T1GK6s3MU/8shVDhtPd/Ly0FCAU61h9G60byAEEytpW84
	uAAT1EK61T0YYBG1mn7JufF/oWF0ZU1TgIP8c0PHWIDFVDR9LcfHy0fCIjStAoXIklITpTJ5
	dKQqIT49SZYWeVCRaEH+f+JOTlyoR572LXZECZBkhqjp2EqZmCdNVaUn2hEtwCUhogH5CplY
	dEiafpxVKg4oU+Ssyo7mCQhJqGjrHjZOTB2RHmUTWDaZVf5XMUHQ3AwUF9uSkqHwPajZXWlf
	sNlUnpWbFjW4KJiJKCIty1NTyu9ynp7Gp0tilWeSfX0LCnaEBw13PZtYF1o6fd/SNRU5ycj6
	yKyLPBWc+3GxKZaYLapXO3bVZnDzv7q8h1uXho4kOGeJoh/vv1jfhz34ElZ9YtN4nz0mypg1
	h9LoThavvikhVPHSlctwpUr6B2hhE7BLAwAA
X-CFilter-Loop: Reflected
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

Makes dept able to track PG_locked waits and events, which will be
useful in practice.  See the following link that shows dept worked with
PG_locked and detected real issues in practice:

   https://lore.kernel.org/lkml/1674268856-31807-1-git-send-email-byungchul.park@lge.com/

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/mm_types.h   |   2 +
 include/linux/page-flags.h | 125 +++++++++++++++++++++++++++++++++----
 include/linux/pagemap.h    |  37 ++++++++++-
 mm/filemap.c               |  34 ++++++++++
 mm/mm_init.c               |   2 +
 5 files changed, 187 insertions(+), 13 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 3b7d05e7169c..42b6959882b3 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -22,6 +22,7 @@
 #include <linux/types.h>
 #include <linux/rseq_types.h>
 #include <linux/bitmap.h>
+#include <linux/dept.h>
 
 #include <asm/mmu.h>
 
@@ -219,6 +220,7 @@ struct page {
 	struct page *kmsan_shadow;
 	struct page *kmsan_origin;
 #endif
+	struct dept_ext_wgen pg_locked_wgen;
 } _struct_page_alignment;
 
 /*
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index f7a0e4af0c73..8ab39823ea31 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -198,6 +198,61 @@ enum pageflags {
 
 #ifndef __GENERATING_BOUNDS_H
 
+#ifdef CONFIG_DEPT
+#include <linux/kernel.h>
+#include <linux/dept.h>
+
+extern struct dept_map pg_locked_map;
+
+/*
+ * Place the following annotations in its suitable point in code:
+ *
+ *	Annotate dept_page_set_bit() around firstly set_bit*()
+ *	Annotate dept_page_clear_bit() around clear_bit*()
+ *	Annotate dept_page_wait_on_bit() around wait_on_bit*()
+ */
+
+static inline void dept_page_set_bit(struct page *p, int bit_nr)
+{
+	if (bit_nr == PG_locked)
+		dept_request_event(&pg_locked_map, &p->pg_locked_wgen);
+}
+
+static inline void dept_page_clear_bit(struct page *p, int bit_nr)
+{
+	if (bit_nr == PG_locked)
+		dept_event(&pg_locked_map, 1UL, _RET_IP_, __func__, &p->pg_locked_wgen);
+}
+
+static inline void dept_page_wait_on_bit(struct page *p, int bit_nr)
+{
+	if (bit_nr == PG_locked)
+		dept_wait(&pg_locked_map, 1UL, _RET_IP_, __func__, 0, -1L);
+}
+
+static inline void dept_folio_set_bit(struct folio *f, int bit_nr)
+{
+	dept_page_set_bit(&f->page, bit_nr);
+}
+
+static inline void dept_folio_clear_bit(struct folio *f, int bit_nr)
+{
+	dept_page_clear_bit(&f->page, bit_nr);
+}
+
+static inline void dept_folio_wait_on_bit(struct folio *f, int bit_nr)
+{
+	dept_page_wait_on_bit(&f->page, bit_nr);
+}
+#else
+#define dept_page_set_bit(p, bit_nr)		do { } while (0)
+#define dept_page_clear_bit(p, bit_nr)		do { } while (0)
+#define dept_page_wait_on_bit(p, bit_nr)	do { } while (0)
+#define dept_folio_set_bit(f, bit_nr)		do { } while (0)
+#define dept_folio_clear_bit(f, bit_nr)		do { } while (0)
+#define dept_folio_wait_on_bit(f, bit_nr)	do { } while (0)
+#endif
+
 #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 DECLARE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
 
@@ -419,27 +474,51 @@ static __always_inline bool folio_test_##name(const struct folio *folio) \
 
 #define FOLIO_SET_FLAG(name, page)					\
 static __always_inline void folio_set_##name(struct folio *folio)	\
-{ set_bit(PG_##name, folio_flags(folio, page)); }
+{									\
+	set_bit(PG_##name, folio_flags(folio, page));			\
+	dept_folio_set_bit(folio, PG_##name);				\
+}
 
 #define FOLIO_CLEAR_FLAG(name, page)					\
 static __always_inline void folio_clear_##name(struct folio *folio)	\
-{ clear_bit(PG_##name, folio_flags(folio, page)); }
+{									\
+	clear_bit(PG_##name, folio_flags(folio, page));			\
+	dept_folio_clear_bit(folio, PG_##name);				\
+}
 
 #define __FOLIO_SET_FLAG(name, page)					\
 static __always_inline void __folio_set_##name(struct folio *folio)	\
-{ __set_bit(PG_##name, folio_flags(folio, page)); }
+{									\
+	__set_bit(PG_##name, folio_flags(folio, page));			\
+	dept_folio_set_bit(folio, PG_##name);				\
+}
 
 #define __FOLIO_CLEAR_FLAG(name, page)					\
 static __always_inline void __folio_clear_##name(struct folio *folio)	\
-{ __clear_bit(PG_##name, folio_flags(folio, page)); }
+{									\
+	__clear_bit(PG_##name, folio_flags(folio, page));		\
+	dept_folio_clear_bit(folio, PG_##name);				\
+}
 
 #define FOLIO_TEST_SET_FLAG(name, page)					\
 static __always_inline bool folio_test_set_##name(struct folio *folio)	\
-{ return test_and_set_bit(PG_##name, folio_flags(folio, page)); }
+{									\
+	bool __ret = test_and_set_bit(PG_##name, folio_flags(folio, page)); \
+									\
+	if (!__ret)							\
+		dept_folio_set_bit(folio, PG_##name);			\
+	return __ret;							\
+}
 
 #define FOLIO_TEST_CLEAR_FLAG(name, page)				\
 static __always_inline bool folio_test_clear_##name(struct folio *folio) \
-{ return test_and_clear_bit(PG_##name, folio_flags(folio, page)); }
+{									\
+	bool __ret = test_and_clear_bit(PG_##name, folio_flags(folio, page)); \
+									\
+	if (__ret)							\
+		dept_folio_clear_bit(folio, PG_##name);			\
+	return __ret;							\
+}
 
 #define FOLIO_FLAG(name, page)						\
 FOLIO_TEST_FLAG(name, page)						\
@@ -454,32 +533,54 @@ static __always_inline int Page##uname(const struct page *page)		\
 #define SETPAGEFLAG(uname, lname, policy)				\
 FOLIO_SET_FLAG(lname, FOLIO_##policy)					\
 static __always_inline void SetPage##uname(struct page *page)		\
-{ set_bit(PG_##lname, &policy(page, 1)->flags.f); }
+{									\
+	set_bit(PG_##lname, &policy(page, 1)->flags.f);			\
+	dept_page_set_bit(page, PG_##lname);				\
+}
 
 #define CLEARPAGEFLAG(uname, lname, policy)				\
 FOLIO_CLEAR_FLAG(lname, FOLIO_##policy)					\
 static __always_inline void ClearPage##uname(struct page *page)		\
-{ clear_bit(PG_##lname, &policy(page, 1)->flags.f); }
+{									\
+	clear_bit(PG_##lname, &policy(page, 1)->flags.f);			\
+	dept_page_clear_bit(page, PG_##lname);				\
+}
 
 #define __SETPAGEFLAG(uname, lname, policy)				\
 __FOLIO_SET_FLAG(lname, FOLIO_##policy)					\
 static __always_inline void __SetPage##uname(struct page *page)		\
-{ __set_bit(PG_##lname, &policy(page, 1)->flags.f); }
+{									\
+	__set_bit(PG_##lname, &policy(page, 1)->flags.f);			\
+	dept_page_set_bit(page, PG_##lname);				\
+}
 
 #define __CLEARPAGEFLAG(uname, lname, policy)				\
 __FOLIO_CLEAR_FLAG(lname, FOLIO_##policy)				\
 static __always_inline void __ClearPage##uname(struct page *page)	\
-{ __clear_bit(PG_##lname, &policy(page, 1)->flags.f); }
+{									\
+	__clear_bit(PG_##lname, &policy(page, 1)->flags.f);		\
+	dept_page_clear_bit(page, PG_##lname);				\
+}
 
 #define TESTSETFLAG(uname, lname, policy)				\
 FOLIO_TEST_SET_FLAG(lname, FOLIO_##policy)				\
 static __always_inline int TestSetPage##uname(struct page *page)	\
-{ return test_and_set_bit(PG_##lname, &policy(page, 1)->flags.f); }
+{									\
+	bool ret = test_and_set_bit(PG_##lname, &policy(page, 1)->flags.f);\
+	if (!ret)							\
+		dept_page_set_bit(page, PG_##lname);			\
+	return ret;							\
+}
 
 #define TESTCLEARFLAG(uname, lname, policy)				\
 FOLIO_TEST_CLEAR_FLAG(lname, FOLIO_##policy)				\
 static __always_inline int TestClearPage##uname(struct page *page)	\
-{ return test_and_clear_bit(PG_##lname, &policy(page, 1)->flags.f); }
+{									\
+	bool ret = test_and_clear_bit(PG_##lname, &policy(page, 1)->flags.f);\
+	if (ret)							\
+		dept_page_clear_bit(page, PG_##lname);			\
+	return ret;							\
+}
 
 #define PAGEFLAG(uname, lname, policy)					\
 	TESTPAGEFLAG(uname, lname, policy)				\
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index e601a3144f28..3abb45c5557c 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -1111,7 +1111,12 @@ void folio_unlock(struct folio *folio);
  */
 static inline bool folio_trylock(struct folio *folio)
 {
-	return likely(!test_and_set_bit_lock(PG_locked, folio_flags(folio, 0)));
+	bool ret = !test_and_set_bit_lock(PG_locked, folio_flags(folio, 0));
+
+	if (ret)
+		dept_page_set_bit(&folio->page, PG_locked);
+
+	return likely(ret);
 }
 
 /*
@@ -1147,6 +1152,16 @@ static inline bool trylock_page(struct page *page)
 static inline void folio_lock(struct folio *folio)
 {
 	might_sleep();
+
+	/*
+	 * dept_page_wait_on_bit() will be called if __folio_lock() goes
+	 * through a real wait path.  However, for better job to detect
+	 * *potential* deadlocks, let's assume that folio_lock() always
+	 * goes through wait so that dept can take into account all the
+	 * potential cases.
+	 */
+	dept_page_wait_on_bit(&folio->page, PG_locked);
+
 	if (!folio_trylock(folio))
 		__folio_lock(folio);
 }
@@ -1167,6 +1182,15 @@ static inline void lock_page(struct page *page)
 	struct folio *folio;
 	might_sleep();
 
+	/*
+	 * dept_page_wait_on_bit() will be called if __folio_lock() goes
+	 * through a real wait path.  However, for better job to detect
+	 * *potential* deadlocks, let's assume that lock_page() always
+	 * goes through wait so that dept can take into account all the
+	 * potential cases.
+	 */
+	dept_page_wait_on_bit(page, PG_locked);
+
 	folio = page_folio(page);
 	if (!folio_trylock(folio))
 		__folio_lock(folio);
@@ -1185,6 +1209,17 @@ static inline void lock_page(struct page *page)
 static inline int folio_lock_killable(struct folio *folio)
 {
 	might_sleep();
+
+	/*
+	 * dept_page_wait_on_bit() will be called if
+	 * __folio_lock_killable() goes through a real wait path.
+	 * However, for better job to detect *potential* deadlocks,
+	 * let's assume that folio_lock_killable() always goes through
+	 * wait so that dept can take into account all the potential
+	 * cases.
+	 */
+	dept_page_wait_on_bit(&folio->page, PG_locked);
+
 	if (!folio_trylock(folio))
 		return __folio_lock_killable(folio);
 	return 0;
diff --git a/mm/filemap.c b/mm/filemap.c
index dfc8a31f1222..d7e567af3261 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -48,6 +48,7 @@
 #include <linux/rcupdate_wait.h>
 #include <linux/sched/mm.h>
 #include <linux/sysctl.h>
+#include <linux/dept.h>
 #include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 #include "internal.h"
@@ -1145,6 +1146,7 @@ static int wake_page_function(wait_queue_entry_t *wait, unsigned mode, int sync,
 		if (flags & WQ_FLAG_CUSTOM) {
 			if (test_and_set_bit(key->bit_nr, &key->folio->flags.f))
 				return -1;
+			dept_page_set_bit(&key->folio->page, key->bit_nr);
 			flags |= WQ_FLAG_DONE;
 		}
 	}
@@ -1185,6 +1187,13 @@ static void folio_wake_bit(struct folio *folio, int bit_nr)
 	key.bit_nr = bit_nr;
 	key.page_match = 0;
 
+	/*
+	 * dept_page_clear_bit() being called multiple times is harmless.
+	 * The worst case is to miss some dependencies but it's okay.
+	 */
+	if (bit_nr == PG_locked)
+		dept_page_clear_bit(&folio->page, bit_nr);
+
 	spin_lock_irqsave(&q->lock, flags);
 	__wake_up_locked_key(q, TASK_NORMAL, &key);
 
@@ -1228,6 +1237,7 @@ static inline bool folio_trylock_flag(struct folio *folio, int bit_nr,
 	if (wait->flags & WQ_FLAG_EXCLUSIVE) {
 		if (test_and_set_bit(bit_nr, &folio->flags.f))
 			return false;
+		dept_page_set_bit(&folio->page, bit_nr);
 	} else if (test_bit(bit_nr, &folio->flags.f))
 		return false;
 
@@ -1235,6 +1245,9 @@ static inline bool folio_trylock_flag(struct folio *folio, int bit_nr,
 	return true;
 }
 
+struct dept_map __maybe_unused pg_locked_map = DEPT_MAP_INITIALIZER(pg_locked_map, NULL);
+EXPORT_SYMBOL(pg_locked_map);
+
 static inline int folio_wait_bit_common(struct folio *folio, int bit_nr,
 		int state, enum behavior behavior)
 {
@@ -1246,6 +1259,8 @@ static inline int folio_wait_bit_common(struct folio *folio, int bit_nr,
 	unsigned long pflags;
 	bool in_thrashing;
 
+	dept_page_wait_on_bit(&folio->page, bit_nr);
+
 	if (bit_nr == PG_locked &&
 	    !folio_test_uptodate(folio) && folio_test_workingset(folio)) {
 		delayacct_thrashing_start(&in_thrashing);
@@ -1339,6 +1354,23 @@ static inline int folio_wait_bit_common(struct folio *folio, int bit_nr,
 		break;
 	}
 
+	/*
+	 * dept_page_set_bit() might have been called already in
+	 * folio_trylock_flag(), wake_page_function() or somewhere.
+	 * However, call it again to reset the wgen of dept to ensure
+	 * dept_page_wait_on_bit() is called prior to
+	 * dept_page_set_bit().
+	 *
+	 * Remind dept considers all the waits between
+	 * dept_page_set_bit() and dept_page_clear_bit() as potential
+	 * event disturbers. Ensure the correct sequence so that dept
+	 * can make correct decisions:
+	 *
+	 *	wait -> acquire(set bit) -> release(clear bit)
+	 */
+	if (wait->flags & WQ_FLAG_DONE)
+		dept_page_set_bit(&folio->page, bit_nr);
+
 	/*
 	 * If a signal happened, this 'finish_wait()' may remove the last
 	 * waiter from the wait-queues, but the folio waiters bit will remain
@@ -1496,6 +1528,7 @@ void folio_unlock(struct folio *folio)
 	BUILD_BUG_ON(PG_waiters != 7);
 	BUILD_BUG_ON(PG_locked > 7);
 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
+	dept_page_clear_bit(&folio->page, PG_locked);
 	if (folio_xor_flags_has_waiters(folio, 1 << PG_locked))
 		folio_wake_bit(folio, PG_locked);
 }
@@ -1526,6 +1559,7 @@ void folio_end_read(struct folio *folio, bool success)
 
 	if (likely(success))
 		mask |= 1 << PG_uptodate;
+	dept_page_clear_bit(&folio->page, PG_locked);
 	if (folio_xor_flags_has_waiters(folio, mask))
 		folio_wake_bit(folio, PG_locked);
 }
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 7712d887b696..f1d3e4afd43b 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -32,6 +32,7 @@
 #include <linux/vmstat.h>
 #include <linux/kexec_handover.h>
 #include <linux/hugetlb.h>
+#include <linux/dept.h>
 #include "internal.h"
 #include "slab.h"
 #include "shuffle.h"
@@ -587,6 +588,7 @@ void __meminit __init_single_page(struct page *page, unsigned long pfn,
 	atomic_set(&page->_mapcount, -1);
 	page_cpupid_reset_last(page);
 	page_kasan_tag_reset(page);
+	dept_ext_wgen_init(&page->pg_locked_wgen);
 
 	INIT_LIST_HEAD(&page->lru);
 #ifdef WANT_PAGE_VIRTUAL
-- 
2.17.1


