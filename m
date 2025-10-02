Return-Path: <linux-i2c+bounces-13316-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FDFBB2FB4
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 10:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BA54387885
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 08:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0F72FE594;
	Thu,  2 Oct 2025 08:13:47 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6424F2FBDF8;
	Thu,  2 Oct 2025 08:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759392827; cv=none; b=d6IfKQkpTd0mUUr8G6fcf+FBWadXiN9e+Ivkt9IRWO81I1qrU+1kvfaircLkg54BJBaRMwXjMHNyrt1FPSOYdGmhlidJNtKW3thYIqta9zVF6TxY6QQdfLNIbsUYD8Bk6PvDp9F0bE60hY+36gFFjkaPUdjj+iQkpFdFokiMbpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759392827; c=relaxed/simple;
	bh=9o9SI0ONdb1WbiIWXrCSb5nX53qir4UGX5Gt0IQgpYM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=cjyYyJxrgIcFjAEhHpXtZsPXj3FoFyPEA0fAMcFOqx+iBwSMDSWqGKPAaXha+NZGnwPpesUzDaomJQsBEgWtwR9u3RhrG7JPf6CZbnFoY9l68YdtY0g1SMF27bsqA0JYzNGXRg29ISElweYAYMqwruQIoCa8/dMtsMYNDcRU8M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-c45ff70000001609-cd-68de340f264e
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
Subject: [PATCH v17 20/47] dept: apply timeout consideration to swait
Date: Thu,  2 Oct 2025 17:12:20 +0900
Message-Id: <20251002081247.51255-21-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251002081247.51255-1-byungchul@sk.com>
References: <20251002081247.51255-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSe0hTcRQH8H73veXsNqOuKSQLiyTXgxUHkojo8YMSgiDoaZe8tOEj20yz
	CBWcWSapZaGzpWliU1M2jMqg0kw0nC6fPcwWWkpNYU1j6aip+N+H7/ly4MDhSGUuvZrTJSZL
	+kQxXsXIKbkroDyS13zRbs67HwhTnhwKhqdyEPgK37Lg8X5iocg5woBruImGf0M/CBiY/uWf
	3omDmc4uEkbzG0noGQkEl6OUgHumQgTPvj5nwfFzloAaazQU1TUR4K2ysGDq7KHhW3UJC7PO
	LfDY1UXDcFs2DdYPrQg8vU4Cis2fGcjxeRDcaGik4UvtPxraSx5R0PW8joaHAw4CnF8Haegu
	yKOhbuIBA9/7sglofGlE4K6cpqAt7xUBV8eaGLDW9jNw630ZA0WzOQzkGu9Q0Nj6x39SjYWB
	Ol8/2rUZW2xPCGx872NwrbkW4Zm/hQgb8/1q+TVJ4ixbKv471cfggs5I/KxkiMVl1gvYVh2B
	K16ME9hqucZgq7uQxeUzY+ShkGPyqFgpXpci6TftPC3X1o9koqTfzMW7rZV0BuqgryMZJ/Aa
	ofSuj120zWOZN8OvFwYHveScV/Bhgi3v+3yf5N+FCv2OjdcRxwXxe4W+7Ii5mOLDBbvbMV9X
	8NuFqqpOcmHlGqGm4dW8Zf68x/mOmrOS3yYYJ7OIhY5JJjjqQxccLLyuHqTykaIMLbEgpS4x
	JUHUxWvU2rRE3UX1mXMJVuR/kaors8efInf34WbEc0gVoOgOH9IqaTHFkJbQjASOVK1QnK7+
	rFUqYsW0S5L+XIz+QrxkaEYhHKVapdg6nRqr5M+KyVKcJCVJ+sUpwclWZ6CbERv2Fwfp7//I
	MmvOW4uTxX1vTBnB4e25lz9y5hcBarocdVfeXsmNK6NPpbS39Htdt82bsCG82BQ0mXmiSK5+
	utv+yXJmBw6TKZenp8YMrFz3oXIfbQ5lV21VRx09OdqxO3hUE/Xn4B7Lt9508zJvpF2ciLav
	TY85srTi5+sDKsqgFbdEkHqD+B/yumwFHgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+5+7q9VhSR26UA2sGF0MLF660ZfoFHT5UAl281SnNpwzNrMM
	gs25Eiuz0ZRcF7M8iVtpW0aWCzMSbJktu0i5zFhmObNsy8zZmkZfXn7v8zy8PB9eBlfUkFMY
	jS5T1OsErZKSEbINy8zzJyS9UyeeNs2GV6Z6AsKhPALOVzkpyHOdI+HZDQeCjnAegoEhOw6W
	2igBw9ZGGkKDb2mIehoRFPmsODhvmTD4Uf2Hgp6H/QhsnQEKij+bCOiTTiIo6bLT8PnRGujt
	uEdC1P8Jg9c/gwikwB8MAvXHEQwXpcGlMjcFQ80tOBTbniG43OnHobs6Zt5qfIfAU5FDwcfC
	GhxaA+PhRbiPgibbCQp6fecx+FpNQWmOh4QLdisC85UqCoouuAiofX+XBl9PBIP2IisGDtd6
	6JC6CPAWlmGxfrHUzclgLzZjsdGNge36PQwGpUoanlxpJ0AyJoC9uZWEDxUlNEQ6F0G0NAMa
	HZ9o8J+2EXCjt4VcZUP8gKWA4CvdtzHe8nyY4p0XnYgf+m1FfKjcjPOWwtj6MNiH87nuQ3y5
	N0jxv8MvKd7zs5TgH5dx/Jnm+XxtiZ/mc++/oTctTZEt3ytqNVmifuHKVJm6KmBCB35Qh4sf
	XSWN6DGZj+IYjk3i3KFKeoQpdg7X1jaIj3A8O5Nzn+oazeCsdxr3yjcvHzHMRHY19/KYakQm
	2ATuab9vNC5nl3CS1Iz/OzmDc1TXj3JcTG/t9BIjrGAXc5a+XKwQyUrRmEoUr9FlpQsa7eIF
	hjR1tk5zeMGejHQXij2TdDRy5g4Kta5pQCyDlOPkvgS/WkEKWYbs9AbEMbgyXp5a0a5WyPcK
	2UdEfcYu/UGtaGhAUxlCOVm+LllMVbD7hUwxTRQPiPr/LsbETTGiWdszd+x+s/usqqDOaa/7
	fkc1vbzuwdVwRDcwWLct0dW0zMQGtDVKz69ZyoQTG7W1R3b2RJMuJU9aoRYc3qSUb6b8zby7
	bN9YVXr/tYHtOc5I0/WULTe1bRtqgtKQ8Vzil7FzPwoTVDOW1t8OusePWWs4ldxmxAq6DeYW
	zVYho0VJGNTCIhWuNwh/AZJ25gpIAwAA
X-CFilter-Loop: Reflected
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

Now that CONFIG_DEPT_AGGRESSIVE_TIMEOUT_WAIT was introduced, apply the
consideration to swait, assuming an input 'ret' in ___swait_event()
macro is used as a timeout value.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/swait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/swait.h b/include/linux/swait.h
index 277ac74f61c3..233acdf55e9b 100644
--- a/include/linux/swait.h
+++ b/include/linux/swait.h
@@ -162,7 +162,7 @@ extern void finish_swait(struct swait_queue_head *q, struct swait_queue *wait);
 	struct swait_queue __wait;					\
 	long __ret = ret;						\
 									\
-	sdt_might_sleep_start(NULL);					\
+	sdt_might_sleep_start_timeout(NULL, __ret);			\
 	INIT_LIST_HEAD(&__wait.task_list);				\
 	for (;;) {							\
 		long __int = prepare_to_swait_event(&wq, &__wait, state);\
-- 
2.17.1


