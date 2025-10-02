Return-Path: <linux-i2c+bounces-13341-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A78BB3320
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 10:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A6005401EA
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 08:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC9D31A540;
	Thu,  2 Oct 2025 08:14:18 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866DD313D53;
	Thu,  2 Oct 2025 08:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759392856; cv=none; b=r7sQrBMXmvCX//IyXNexpa/bAey87iRfq4JPeYRZqyueouFIAEczqcl9sCN6MiS5k2P22UyPR5U0FJnWuad1lvH2EXlmSyanSzNLSOOOZLFakJnDf6iH6j4PsxPIQ2aZ9j4Ovay7gPITw+czOTHMcnh2z9TDu2fuCazkTPSa6lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759392856; c=relaxed/simple;
	bh=IVs7UrTREahv4P4gaL8VNCv4Y1x1l3V8HrPMnx32xWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=swBig1ZXSKmh8yS8vWNYC7NeZXXjWIOWt4DYgNi5aaLf383i+10qvXgmppvsMKiP6fC1fihZq7RUaJeYUEq36N10qEy152YcbTpXX24tcn49riXzuVYn7w4OnElIncIcsGr8AIuXvGBHjGnswaHrwGJr1jPBId2jXw3t/3qI0iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-c2dff70000001609-31-68de3419efec
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
Subject: [PATCH v17 47/47] mm: percpu: increase PERCPU_DYNAMIC_SIZE_SHIFT on DEPT and large PAGE_SIZE
Date: Thu,  2 Oct 2025 17:12:47 +0900
Message-Id: <20251002081247.51255-48-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251002081247.51255-1-byungchul@sk.com>
References: <20251002081247.51255-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0xTdxjG9z/3NlZOOpIeQLOtiTc2wQvON1EXvxjOFzKSZSZqiFQ5eppx
	MS1XjQkC9TYxWAIk4FhrsVJaFMELKjUVtQSRUMBgRS4WAWWlNCPQDKV2rdFvv/yeJ2+eDy+D
	y4fIWEadnStoslWZSkpKSH0rjBtjk8bETeecK2HolIOAyzdsFLiuWxHo7oUICOqdNCwsvaYh
	ZHciqO7X4+B9PI/Ab76AYOZpMvjGH5DwMjCLwDz5CYNJxxkEf19po+Bjbx8ORs8oDu9bwu6W
	cwyBvbGEgsHJlfBi0U9Bd9WfFPj6L2Mw10LBX3V6BKWmGxT0e5cxGKnWY2BtTYGaGQqqbyqg
	qvkBBkvmJhqem0YIqOsdJGHZsxlChhxwWt/RcN3XR0L32BAJ3mk9BeNdp0m4W/wmvP+FBwPb
	hWkcWt+GU/vwj2A83UDA2eACAmf7BAZjthAJLkcPCQNWFwHdtRYC+u43k9DW+xyHwMU4cF0q
	J8FdMYWgcm4agTdgxsG86Kd3Z/BNbXcwXjcQpHhbvQ3xHz/oEa+rCNPjWT/OX+2ZpXh7wEDw
	z65w/KXejfy92lGaL3s4TPOG1jy+7ImP5E0dMxg/7N2VmrBfujNDyFTnC5rEX9KlovuJmzx2
	W1J492yILkYT9HkkYTg2ibN3vMe/8n+WKSrCFLuOc7uXPvto9nuurXyajDDO9qzihvp/ivC3
	rMDd/6c93GEYgl3D1Zfui2gZ+zPnf2r5cvI7ztri+MySsB/09BARlrPbOJ2/DDuPpOGOScLN
	ef79sieGe9ToJiqQzIC+aUJydXZ+lkqdmZQgFmWrCxMO52S1ovC3mU8uH2hH867fOhHLIOUK
	mWvNqCgnVfnaoqxOxDG4MlqW3jgiymUZqqLjgibnoCYvU9B2ojiGUCpkWwIFGXL2qCpX+EMQ
	jgmarynGSGKLkTowpdg1Hq8rHSg+NHwk+ZNhtCxK3hF/LeVRkiKvwRR8JfsgWn7fujposRzq
	01Zvj0qdSN+7IMbhg111qvLXO6LRBuxouXhizxSZPL96d9OJk3tqCi7+Wuowxq5yd29arGku
	+aF+dsvxlPHcqLnEZbKkKG19ljFm7a1KRX1MamWaktCKqs3xuEar+h+V1r69aQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSXUyTdxTG/b/fbax500H6jo2pNcRoJorKcqbG6IXh1UTizbKoF9LoG1op
	H7YCZZuGUhrJhA2bFIQqVogNX2qlwKimC4JUsRCsVSBKZZBSUMBmE2QI2LWa3Zz8zvM8OXku
	DoNL28g4RpV1VtBkKdRySkyIU3cbtny585VyW5FzAwzqOwmYnysh4MrtZgpKWqpIeHKrCcHo
	fAmChSULDkZnmIAVk5uGucWXNIRdbgQVXhMOza16DN7ZP1Iw3f0PAvNYgILK13oCQrZSBNVB
	Cw2ve1JgdvQeCWH/JAZD72cQ2AIfMQh0XkCwUpEB12odFCz1D+BQaX6C4PqYH4cpe8Rsdb9C
	4KovomCivA0HX2ANPJsPUdBrvkjBrPcKBm/tFFiLXCRctZgQGOpuU1BxtYUA5193afBOL2Mw
	UmHCoKnlMIzaggR4ymuxSL9I6o4MLJUGLDKmMDDfvIfBoq2Rhr66EQJshQlg6feRMF5fTcPy
	WBKErdngbpqkwf+7mYBbswPkPjPiF4y/EXyjox3jjU9XKL65phnxSx9MiJ+7YcB5Y3lk7Z4J
	4XyxI5+/4Zmh+A/zzyne9d5K8I9rOf5S/xbeWe2n+eI/X9BHdh0T7zklqFV5gmbr3jSxcvjB
	MJnTJtL9URKmC9E4/SsSMRy7k/u3YYKKMsVu5IaHF/Eox7DrOEdZkIwyznq+5ga930b5C1bg
	7r7piGQYhmATuBrD0agsYb/jQj0N+OeTa7kme+cnFkV035iHiLKUTeaMoWKsHImtaFUjilFl
	5WUqVOrkRG2GsiBLpUs8mZ3ZgiLPZDu3fKkDzflSuhDLIPlqiTfBr5SSijxtQWYX4hhcHiNJ
	qx9RSiWnFAU/CZrsE5pctaDtQl8xhFwmOfSjkCZl0xVnhQxByBE0/7sYI4orRPe/CQbzN+oa
	7HT7YYv4oUO3Y2j/NVtsaezlX2JdPQe7c55bRb1Jsvjk0qKB9b7l3X2bJzpO63MT/e369B9k
	lqGA2r6neMOChq5xn1fVulKdcoXgkf68nZAdonSbvj9Z2l125u/BxLbc1Ibt8Qf0+HR6X1Vw
	ZrTV/Ch/U//+3uNyQqtUJG3GNVrFfyOFB8lIAwAA
X-CFilter-Loop: Reflected
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

Yunseong reported a build failure due to the BUILD_BUG_ON() statement in
alloc_kmem_cache_cpus().  In the following test:

  PERCPU_DYNAMIC_EARLY_SIZE < NR_KMALLOC_TYPES * KMALLOC_SHIFT_HIGH * sizeof(struct kmem_cache_cpu)

The following factors increase the right side of the equation:

  1. PAGE_SIZE > 4KiB increases KMALLOC_SHIFT_HIGH.
  2. DEPT increases the size of the local_lock_t in kmem_cache_cpu.

Increase PERCPU_DYNAMIC_SIZE_SHIFT to 11 on configs with PAGE_SIZE
larger than 4KiB and DEPT enabled.

Reported-by: Yunseong Kim <ysk@kzalloc.com>
Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/percpu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index 85bf8dd9f087..dd74321d4bbd 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -43,7 +43,11 @@
 # define PERCPU_DYNAMIC_SIZE_SHIFT      12
 #endif /* LOCKDEP and PAGE_SIZE > 4KiB */
 #else
+#if defined(CONFIG_DEPT) && !defined(CONFIG_PAGE_SIZE_4KB)
+#define PERCPU_DYNAMIC_SIZE_SHIFT      11
+#else
 #define PERCPU_DYNAMIC_SIZE_SHIFT      10
+#endif /* DEPT and PAGE_SIZE > 4KiB */
 #endif
 
 /*
-- 
2.17.1


