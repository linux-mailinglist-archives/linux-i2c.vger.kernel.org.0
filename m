Return-Path: <linux-i2c+bounces-13320-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CF9BB2FC9
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 10:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A415319E33B1
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 08:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF113302749;
	Thu,  2 Oct 2025 08:13:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EFA2DAFC4;
	Thu,  2 Oct 2025 08:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759392834; cv=none; b=oQruMcKt47PU495NLOtQn7bpwSCJPSov0T/zZ8qenpln29t+3nzZ0OqxQyA0b/CjglN6gpLwKEARqFIxI1Dbun+O+d9D0VpxjUINPE0mLoEt9b1QBmFwtsO5wSEqKoYutsjXH3LnYJ8GInS+7GMjbnvfjkpIlvPaRNl1/JXlhJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759392834; c=relaxed/simple;
	bh=NR59yXk0VhmzqvBwuz7ZNKYjLJtlk1nNdLpsiROVe3k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=rCWdl26z75rDBEXqaO92U/pAVkwxtrLo3IeEwtKymyw8Q+OTZTKvDevumTRsCK8MeaNke+mCPD8+SJBTlGQ6Aa2OfYWnDNCHpu33OHPQjpaCaf+HjgSuqaAeFpr7XM4mCq7synfml/Po/wc14IM7MRDGPFtSJJYFyxufc8cfQNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-c2dff70000001609-2e-68de34100f44
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
	dave.hansen@linux.intel.com,
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
	linux-rt-devel@lists.linux.dev
Subject: [PATCH v17 23/47] dept: apply timeout consideration to dma fence wait
Date: Thu,  2 Oct 2025 17:12:23 +0900
Message-Id: <20251002081247.51255-24-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251002081247.51255-1-byungchul@sk.com>
References: <20251002081247.51255-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0iTexjH+723vVutXpfRmwanM5LCshsWTyGdiOC8cSCiIugCtdqLG95i
	y1sQrJrd9ISN4zo6081w2VxZM6isgUmtbEmbq7VqmivRRNfF5kRzrVerfx4+z/f3fb7P7wc/
	Gpe9JpNode5hXpOryJZTEkISnmFJS0jvVq3ouJcM1U12Ct6OnEYw+s2EQ8mdOAExg0sEkbE3
	Iog7XQiMXgMOFaFeCi4MHCPgk7UMQVWfSQQDD/+G8Nu7JLyMDiGw9n7HoLf1FIKYMQtq65oF
	f4UHgSXUhcOH64J+09WNoL2ilALzcScJF00GIfyigwDv4AQGQaMBA3d5HSasocB4Yy6YLpzA
	hPIBgzGrTQRPLwUJsOpSwNThI2EitBJcjf0iuBZ+RsJgn0F4xqOTJNzS9YjA8eohgsjzEAb2
	sj4cHO/9JFTWBCk4HYsg8LVUU9Btj5OgM42S4Gl1k9DZ6CGgqT8gXMH1mID2qisEPGu5SkL9
	Sy8GoZ4ACdFzyXD1Yx0Fg1ErvkHJlXTGKM5eY0fct3ED4iL1J3CupFxox0deUJwzaia4J3Us
	d74jjbtT1SXizI58Tv8gTHLNDancpXsDGGcZHiE5h+0MtXXxbkmGks9WF/Ca5ev3S1S37o7h
	h3x00RNfBNehRtFZJKZZJp0N6ALUbx7yfJnSKWYRGwiM4ZOcyCxgm//tIycZZ9zzWb936STP
	ZrawTV9Lp2YJJoX1P2ia8kuZNex/+pu/8v9gG6+3TuliQfeF3MQky5jVbMknPXYWSQSPScyO
	hOPYz4F57P2GAFGOpGY0zYZk6tyCHIU6O32ZqjhXXbTsYF6OAwk/znp0Ys9tNOzZ3oYYGsln
	SD0pXSoZqSjQFue0IZbG5YnS/Q1BlUyqVBQf4TV5+zT52by2DSXThHyudFW0UCljMhWH+Sye
	P8Rrfp9itDhJh/Dx/EKb5B9t/872yoUNSXQhM1S/JLXquyUvetA6b35WNauObP3Mx9QHFqT9
	Zc5z1hatlSX2OPm9CfFh/59+YyXTmZGZuW3T5tJ34S6xbdZm/cY5mxQZyv9nmqWndoQZ2y7s
	2LoyL155PzNB31Irf/fZfWTLRI3FPLrtcuLT6UE5oVUpVqbiGq3iBwsd8xhtAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTcRTG+7/XuVq8LMW3C1QDKSKzION0pcsH34Qi6ENRoI58a8Mrm1kG
	kTpXll10tUlOyyyXOM21mbVkYquMNHVrZVJOmy2tnNllJqZmm9SXw+88z8Ph+XAEuLiBXCCQ
	p2bwilRpsoQSEsLdG1WRzNpe2WqvYz505TQTMOrPJ6C0roaCfPNVEhx3jAj6RvMRjE3ocVBb
	pwmY0rTQ4B9/R8O0rQWBzqnBoaY+B4Ofpj8UDD3+gUDr8VJQ/DmHgBHDeQQlA3oaPj+NgeG+
	RhKm3YMYvPnlQ2Dw/sHA23wGwZQuCa5XWCiYaO/EoVjrQHDD48bhkylg1rf0IrBV5VLwsfAe
	Di7vXHg1OkLBc20BBcPOUgy+migoz7WRUKbXIFDdrKNAV2YmwPr+IQ3OoUkMenQaDIzmXdBn
	GCCgrbACC/QLpO6Gg75YhQXGJwy0tY0YjBuqaXhxs4cAQ3YE6NtdJPRXldAw6VkD0+Vp0GIc
	pMF9SUvAneFOcqsWcWPqiwRXbWnAOPXLKYqruVaDuInfGsT5K1U4py4MrI99IziXZznGVbb5
	KO736GuKs/0qJ7jWCpYrao/krCVumstrekvv2XBAuCmRT5Zn8oqoLQlC2f3GcTzdJTje6vLj
	2chIn0MhApZZy/oc32eYYpax3d3jeJBDmSWs5cIAGWScaVvEdjlXBnkes5ut+1lABZlgItiu
	J3UzeRGzjr2SV//v5mLWaGqe0UMCusvTRgRZzESz6pE8rBAJy9GsahQqT81MkcqTo1cpk2RZ
	qfLjqw6lpZhR4JsMJyeLHiC/K8aOGAGSzBE5I9wyMSnNVGal2BErwCWhooSqHplYlCjNOsEr
	0uIVR5N5pR0tFBCScFHsPj5BzByRZvBJPJ/OK/67mCBkQTbK5S9uxroPl3TIJLMJa9SLvcrE
	+1k/uvfN3ryn9rTXNLB3u6WCNJK3dqw4cWhrf3x4QX9sxFTSw+F71cW+LUtxT/qzs/vLBsNu
	L47KHdpeH2dtCmuy23u/vquNS1F7x/aTB+N2xjwSr1dc/lDLnkqUbHN0DJU+Zb58WK4KMX/T
	2aokhFImXbMCVyilfwG1nG8USQMAAA==
X-CFilter-Loop: Reflected
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

Now that CONFIG_DEPT_AGGRESSIVE_TIMEOUT_WAIT was introduced, apply the
consideration to dma fence wait.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/dma-buf/dma-fence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 787fa10a49f1..0a4b519e3351 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -801,7 +801,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
 	cb.task = current;
 	list_add(&cb.base.node, &fence->cb_list);
 
-	sdt_might_sleep_start(NULL);
+	sdt_might_sleep_start_timeout(NULL, timeout);
 	while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
 		if (intr)
 			__set_current_state(TASK_INTERRUPTIBLE);
@@ -905,7 +905,7 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 		}
 	}
 
-	sdt_might_sleep_start(NULL);
+	sdt_might_sleep_start_timeout(NULL, timeout);
 	while (ret > 0) {
 		if (intr)
 			set_current_state(TASK_INTERRUPTIBLE);
-- 
2.17.1


