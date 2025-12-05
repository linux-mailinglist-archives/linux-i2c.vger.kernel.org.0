Return-Path: <linux-i2c+bounces-14450-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 544B1CA68C5
	for <lists+linux-i2c@lfdr.de>; Fri, 05 Dec 2025 08:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D011D3093A8B
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Dec 2025 07:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B0F33F8A3;
	Fri,  5 Dec 2025 07:21:45 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D2D334C0B;
	Fri,  5 Dec 2025 07:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764919293; cv=none; b=FaOGeagvV2WqA6vjGREcaEKG1NJyCgg4AH5X9dWINEzUsT+aC47FIsgPb0BJzP97t7O4PhUeSCD85sPBcu0KQSSv2ObRoQkIVNhHkxbgrR57hLDgupdCquhJ0rPMo7jtesRSwc666CCa7a9EwrebqFvMJoZGPSvSNTGhbEjhuec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764919293; c=relaxed/simple;
	bh=BKdTduih/1l/oeBZ8PU6DuY+E9HBd565xkElM5qpN+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=MGurb2KFLvLFRvsiA55lx1MRzrlVUXPqDIiaT/ARczPKkd6t1FDJ5j3Qzs9pr6JKG3BSQoPZBR9/s+jxvtXemPoquwX3hnThfvDuZwSXcUrsZ1kTbyvxvBdG3fF4Cewy474Uij5e4dYXxTk9jVMdZ6H8/2CZq6RPAwmNku5x5/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-c2dff70000001609-bf-69328776a145
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
Subject: [PATCH v18 40/42] dept: track PG_writeback with dept
Date: Fri,  5 Dec 2025 16:18:53 +0900
Message-Id: <20251205071855.72743-41-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251205071855.72743-1-byungchul@sk.com>
References: <20251205071855.72743-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSW0xTaRSF/c+1bag5qSQeIZFJ1ZiYiEAEt4lOfHE4mUSD8UEdjNrIURpL
	0aKVTmJCkSqSsdYarIKViiNC2ygeBG9QsRQ0aAkXhaoMF8U6DTCMpdgpIk7B+PbtvfZeWQ9L
	hMv6yTiRUn2U16gVKjklISTjMZWrtadTlElhTzz0D46QUCxcJuFZXyEBg1PFCAwPvhHw1dxG
	QyjyloZSPYLJ2lkKLAE9AYHWdKgamcUgGBhCcLdtAEFTdSEFH0z1OPSMLISXUxMU2AqbSOh6
	MYrgolUgoGt0BgOHsAXKLScxiFTZaSj39pDwrrqMhpnhZGhzfKRh8OkpEpx/+HEQ3vdGU30N
	IRhwfiOhoDxMQrejk4Dnbc8IGB7ykVDnfYFD5/mzJPhMHxC8tozRUDU1QUN3sw0D/6tTGNQ0
	eSmoqbiJwOwP0lD/2IDAVTyEgef2PQxu+1twuNBto6BOKMWh11xBgbehPZpMb0RQ3xqmofbT
	TQr0k4MIivpTwdiRDtZQMoQcdmrTJi5sMBKc86oTcV+mzYgL3TiJcwZTdGwZm8C5G8/HKK69
	kuX+PDONcQ/K/qK5ItcbmrMJx7gizzjJXW8MYJxgP0NxQtBMZyT8JtmQxauUWl6z5ud9kuxb
	/1Sjw5Gl+cMNRqwARZaUILGIZday18pC1A+21HQRc0wxK1mfL4LPcSzzE1t31k+WIIkIZ3oS
	2NMR47ywiNnIXrzVQs4xwaxgg/8+xuZYyqSxlyeDxHfTBNZR2zx/L47uS/um51nGpLIVJeF5
	U5YpF7N3+s7h3x+WsE+qfYQJSW1ogR3JlGptjkKpWpuYrVMr8xP35+YIKNq5qhMzmfdRsHO7
	GzEiJI+RNh9PVspIhTZPl+NGrAiXx0rHVElKmTRLofud1+Tu1RxT8XluFC8i5IulKZ+PZ8mY
	g4qj/CGeP8xrfqiYSBxXgE6U6ZJsAW3qoUpPfONUBnxe/mRlwXiC2FS4N8brTd/Vb3fMegML
	tv5t6Thfuzrp4FB8Zr6tb33riNtKW9t1rprE2B139FfYbYautC+bH6W51e8zrJm5l/6TzTS2
	7Old50rbvezqveu/9KrxX5vxc84Dn9aV5ruuNYym2HYe6XjokRN52YrkVbgmT/E/T6d84W8D
	AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0hTcRTH+923o8VtSd0MykYRBNoDixM9qD+qS5D0V0UEOfKWN+eDzUdG
	YdMumpas2Sa5fGQ5TE3XZqnZaChJ75xWSrVMmpa5tHw2l9o0+ufwOef7PV/OH4fBFQ1kCCPG
	JwmaeJVaSckIWeTWzLDkrI3i+jIpArKldPjY7SHhnc5JwNhoNgHXa6spmDLX05Btu0bCk84M
	AtpqqhB0j2UjmPCbcZAaZwiYMrTSMOr7QINRh2DG0YrA5DLg0NX2CIfqOh0GI9ZpCgZahhEY
	ezwUFPTrCBiyXEJQ2Gemof/xXvjR3UTCjPsrBp3jXgQWzzQGHmcWgilTLJSU2QPrpp8U+F++
	xqHA2IbgRo8bh+H+zwjqWj8hcFRkUNCrv4dDh2cBvBkbouCpMZeCH67rGAxaKSjNcJDgejGA
	oMhsQND33oFB5s1aCkxFNgIaPz+gwTXwB4OPJgMGVbb90G3pI+C5vgwLnBtw3V0C5oJMLFC+
	YWC804SBz1JJ7yxH/ISUR/CV9vsYL7VPUXx1cTXi/ZMGxI+WZ+K8pA+0Ld4hnL9gT+XLn3sp
	fnLsLcU7xksJ/lkZx9+6OInxV16G8Y2FbvrAriOybdGCWkwRNOt2RMliagYrUKJv+eme+3nY
	eeRbmoOCGI6N4Apuu4hZptg1XFeXD5/lYDaUs1/uI3OQjMHZjhVcli9vTljEbudMNS3kLBPs
	am745yNsluXsZu7ayDDxL3QFV2V1zvmDAnNj5+QcK9hNXEnOBKlHslI0rxIFi/EpcSpRvSlc
	GxuTFi+eDj+eEGdDgX+ynPtzpQGNduxtRiyDlPPlztQNooJUpWjT4poRx+DKYLlXvV5UyKNV
	aWcETcIxTbJa0DajZQyhXCLfd0iIUrAnVUlCrCAkCpr/KsYEhZxHxQ11Cekq84lDBze/Ct1z
	tPhUVMdjjTnfeXehfW14mGQ1rEwvKuEGv+yIfvXQpZOW+UMdqx6KjZ25bfvIXmd707OkX78X
	aw7HJRfLdkcOzUt1WrxifVaFtHQkVKxPFPVnS9cZr85vWZC/hSmMzHf3br0ZQee4u/wv/O++
	76Yz2pWENka1YS2u0ar+AkgIPJZLAwAA
X-CFilter-Loop: Reflected
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

Makes dept able to track PG_writeback waits and events, which will be
useful in practice.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/mm_types.h   | 1 +
 include/linux/page-flags.h | 7 +++++++
 mm/filemap.c               | 6 +++++-
 mm/mm_init.c               | 1 +
 4 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 85d06073d37b..fa6ba4196e0d 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -222,6 +222,7 @@ struct page {
 #endif
 	struct dept_page_usage usage;
 	struct dept_ext_wgen pg_locked_wgen;
+	struct dept_ext_wgen pg_writeback_wgen;
 } _struct_page_alignment;
 
 /*
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 0b0655354b08..ec736811a2c6 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -203,6 +203,7 @@ enum pageflags {
 #include <linux/dept.h>
 
 extern struct dept_map pg_locked_map;
+extern struct dept_map pg_writeback_map;
 
 static inline void dept_set_page_usage(struct page *p,
 		unsigned int new_type)
@@ -292,6 +293,8 @@ static inline void dept_page_set_bit(struct page *p, int bit_nr)
 
 	if (bit_nr == PG_locked)
 		dept_request_event(&pg_locked_map, &p->pg_locked_wgen);
+	else if (bit_nr == PG_writeback)
+		dept_request_event(&pg_writeback_map, &p->pg_writeback_wgen);
 }
 
 static inline void dept_page_clear_bit(struct page *p, int bit_nr)
@@ -300,6 +303,8 @@ static inline void dept_page_clear_bit(struct page *p, int bit_nr)
 
 	if (bit_nr == PG_locked)
 		dept_event(&pg_locked_map, evt_f, _RET_IP_, __func__, &p->pg_locked_wgen);
+	else if (bit_nr == PG_writeback)
+		dept_event(&pg_writeback_map, evt_f, _RET_IP_, __func__, &p->pg_writeback_wgen);
 }
 
 static inline void dept_page_wait_on_bit(struct page *p, int bit_nr)
@@ -311,6 +316,8 @@ static inline void dept_page_wait_on_bit(struct page *p, int bit_nr)
 
 	if (bit_nr == PG_locked)
 		dept_wait(&pg_locked_map, evt_f, _RET_IP_, __func__, 0, -1L);
+	else if (bit_nr == PG_writeback)
+		dept_wait(&pg_writeback_map, evt_f, _RET_IP_, __func__, 0, -1L);
 }
 
 static inline void dept_folio_set_bit(struct folio *f, int bit_nr)
diff --git a/mm/filemap.c b/mm/filemap.c
index d7e567af3261..0ce3f9307582 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1191,7 +1191,7 @@ static void folio_wake_bit(struct folio *folio, int bit_nr)
 	 * dept_page_clear_bit() being called multiple times is harmless.
 	 * The worst case is to miss some dependencies but it's okay.
 	 */
-	if (bit_nr == PG_locked)
+	if (bit_nr == PG_locked || bit_nr == PG_writeback)
 		dept_page_clear_bit(&folio->page, bit_nr);
 
 	spin_lock_irqsave(&q->lock, flags);
@@ -1248,6 +1248,9 @@ static inline bool folio_trylock_flag(struct folio *folio, int bit_nr,
 struct dept_map __maybe_unused pg_locked_map = DEPT_MAP_INITIALIZER(pg_locked_map, NULL);
 EXPORT_SYMBOL(pg_locked_map);
 
+struct dept_map __maybe_unused pg_writeback_map = DEPT_MAP_INITIALIZER(pg_writeback_map, NULL);
+EXPORT_SYMBOL(pg_writeback_map);
+
 static inline int folio_wait_bit_common(struct folio *folio, int bit_nr,
 		int state, enum behavior behavior)
 {
@@ -1686,6 +1689,7 @@ void folio_end_writeback_no_dropbehind(struct folio *folio)
 		folio_rotate_reclaimable(folio);
 	}
 
+	dept_page_clear_bit(&folio->page, PG_writeback);
 	if (__folio_end_writeback(folio))
 		folio_wake_bit(folio, PG_writeback);
 
diff --git a/mm/mm_init.c b/mm/mm_init.c
index f1d3e4afd43b..9f99eeb99ca3 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -589,6 +589,7 @@ void __meminit __init_single_page(struct page *page, unsigned long pfn,
 	page_cpupid_reset_last(page);
 	page_kasan_tag_reset(page);
 	dept_ext_wgen_init(&page->pg_locked_wgen);
+	dept_ext_wgen_init(&page->pg_writeback_wgen);
 
 	INIT_LIST_HEAD(&page->lru);
 #ifdef WANT_PAGE_VIRTUAL
-- 
2.17.1


