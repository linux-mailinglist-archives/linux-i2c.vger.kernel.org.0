Return-Path: <linux-i2c+bounces-13303-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 554EABB2DBF
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 10:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 201C3382BB2
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 08:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41092EA754;
	Thu,  2 Oct 2025 08:13:25 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBFE2E8B62;
	Thu,  2 Oct 2025 08:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759392805; cv=none; b=sMyGkY3fYtJX2/L6Tcb6RMOz1Qyai/T2M1htKPGIwbedXbVrYpsBurBQ3bR+GeuhEpWROrEw3FxlFw5+1dIu1kpv/hlKeesdLiiZKckILH6I+wOT1qtkXfkN1RtMlZ6k/ob5hGQP/I8QFSzxPsdslJvRddiTQQGoRP8Ad8L8jlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759392805; c=relaxed/simple;
	bh=qC+IR5GZA2zhKidsaNPgh+s2SNwZBlAHaPQiuaDTpZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=VZgYTzT+p3zIKTBB6I/4ZvEZIx+PiR7sjWVKSJ4ZUrQ3hCpgrUdmWC3xuFtZSypF4EIAxOuKX8FZSjVi3x8ZE0CW2jblONvCiZbi+hMnwElb6UzwS4cuQga2HxxDPnf+Iwc/MaIR9rjW0TuYwVQU9OWO/au6LdmA6jxK/NPEaY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-c45ff70000001609-17-68de340c919f
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
Subject: [PATCH v17 08/47] x86_64, dept: add support CONFIG_ARCH_HAS_DEPT_SUPPORT to x86_64
Date: Thu,  2 Oct 2025 17:12:08 +0900
Message-Id: <20251002081247.51255-9-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251002081247.51255-1-byungchul@sk.com>
References: <20251002081247.51255-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0iTcRSH+7/Xbbh4WYZvViQjjczKUuMQJQkF76co/FJ2c+RLG+qUWToF
	aVGalpqN1Jp5n7Zs4ZqK00SXaKRWWpmsmObUVhYmXvPWZVP8cnjgPL/f+XIEuCSb9BYolJd5
	lVIWI6VEhGjco2y3OHhQHrhY4QFfZjMQ/F4qxCHPMUpBwdg1AiaqshDonIU0/MmPhqU3PTgU
	5PUi+G66iaDu5SCCD6PrwZ6vxaA7txyDwoLr7vEdg4WqahpeV9gJGDboaFh27IOfTi0FDZoh
	GoxZThzMI/0kPCi2U5DxZ8ZV1PSQgixTPQmduscEOIZsJPycq8LhvbUUA61zioYp/RwBlTO/
	cLDn/CAgXf8Mg75PzxFUGsZJMBv7KfimK8KgX1tCQddiFwbDOeOuWNFfEvKWMyiYN42QUNgx
	SB8J5IzFRsR1lbNco26A5krNV7hagz9X0TyGcebqTIp7dX+J4Mo0eThX3HmSq9Vf5bKv/6K4
	xrQvJDf59TPBTbR8pLiauo/EiY0RokNRfIwikVftDY0UycvNj+j4dk/1j5cWWoOGmVtIKGCZ
	YPbWuzFsjW8vayg3U8wO1mZbwN3syfiwtdlO0s04072F7X8X4OYNzBl2uvkt4WaC8WUbm96v
	sJgJYedbe8nVzm3sE5N1pUfIHGA/OLpXHInLSZu44borcjklQrazr5ZeDWxiXxhsRC4Sl6J1
	1UiiUCbGyhQxwXvkyUqFes/FuFgzcj1JVeryGQua6g1vQ4wAST3Evb4DcgkpS0xIjm1DrACX
	eoojDXa5RBwlS07hVXEXVFdi+IQ2tFlASL3E++eSoiTMJdllPprn43nV2hYTCL01KH8x8GFQ
	xMCpsB6P7YQ6bsDPURaWqmqdCt90PCwx6d7Zohr0re+s5dzpYv1MtjDdLrae92rYavucYtpK
	KyOtfu1HtfrwncJd5X6D261Hhv+R7OG4RkuIQH16VuITNH2no2zSFHD32NN6jQUyZ1+1HDyg
	CU0NVfcsjBq7che866VEgly2zx9XJcj+Ax5sSwMgAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTYRjHe895zznbaHFYVocMipEE3S9WD93wm6eiCPoQFKQrD214ZauV
	SeVtJV1ttVmui2kuc2a2WbnSMs1FmeZarSinKba0tFE6zabZZvTl4ffw//Hn+fCISNk9arpI
	lbRXUCcpEuS0BEs2r85aMDGyTbm4YWgeuDNqMfgHcjBcul1GQ471IgUt5RYE7f4cBEMBEwk6
	+xiGUb2DgYHhjwyM1TgQGJ16EsoqMwjor/hDw7f6nwgMHV005PVkYPCZTyLI95oY6GmIhr72
	hxSMeb4Q8G6wF4G56w8BXbXHEIwa4+FqoY2GQNMrEvIMLQiudXhI6K4IhpWONgQ1JZk0fM69
	S4KraxK88ftoeG44QUOf8xIB3ytoKMisoeCySY8gq+g2DcbLVgz2Tw8YcH4bIaDVqCfAYt0E
	7WYvhsbcQiJ4X9C6Mw1MeVlEcHQTYLj1kIBhcykDL4taMZjTI8DU5KKgsySfgZGOJTBWkAwO
	yxcGPGcMGMr7XlFRBsQP6U5jvtR2j+B1r0dpvuxKGeIDv/WIHyjOInldbnCt7/WRfLZtP1/c
	2Evzv/1vab5msADzLwo5/mzTAt6e72H47EcfmC2rtkvWxAkJKq2gXrQuVqIstN5gUp6GHfjq
	qGLSUSd7HIlFHBvJnRhJp0NMs3O49++HyRCHsbM42ykvFWKSbZzBuZ3zQzyZ3cH1VzfjEGM2
	grM/eD3OUnY59+txC/WvcyZnqagd7xGzKzhXR+O4Iws6Ol82kYskBWhCKQpTJWkTFaqE5Qs1
	8crUJNWBhbuTE60o+E3mQyNnq9CAK7oOsSIknyh1RniUMkqh1aQm1iFORMrDpLElrUqZNE6R
	elBQJ8eo9yUImjoULsLyadIN24RYGbtHsVeIF4QUQf0/JUTi6enI/Wv0CTHXH1OqXfy9s/pp
	1K7oVqUnZspSY3hzQCI6tPaILPBj1dBbZ2LxvGWDVc3nPrlmn5dlp7hPp02t9L7sv45jIvPP
	uW1pV2v7qm/uzFk/Y1nlUUvy9fC19psrceYFMfG1/lnbfX98WoqkYatFWyTuvvJu80Zfb9xh
	r2aN82iUHGuUiiVzSbVG8Rd7PnfISQMAAA==
X-CFilter-Loop: Reflected
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

dept needs to notice every entrance from user to kernel mode to treat
every kernel context independently when tracking wait-event dependencies.
Roughly, system call and user oriented fault are the cases.

Make dept aware of the entrances of x86_64 and add support
CONFIG_ARCH_HAS_DEPT_SUPPORT to x86_64.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 arch/x86/Kconfig            | 1 +
 arch/x86/entry/syscall_64.c | 7 +++++++
 arch/x86/mm/fault.c         | 7 +++++++
 3 files changed, 15 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 05880301212e..46021cf5934b 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -38,6 +38,7 @@ config X86_64
 	select ZONE_DMA32
 	select EXECMEM if DYNAMIC_FTRACE
 	select ACPI_MRRM if ACPI
+	select ARCH_HAS_DEPT_SUPPORT
 
 config FORCE_DYNAMIC_FTRACE
 	def_bool y
diff --git a/arch/x86/entry/syscall_64.c b/arch/x86/entry/syscall_64.c
index b6e68ea98b83..66bd5af5aff1 100644
--- a/arch/x86/entry/syscall_64.c
+++ b/arch/x86/entry/syscall_64.c
@@ -8,6 +8,7 @@
 #include <linux/entry-common.h>
 #include <linux/nospec.h>
 #include <asm/syscall.h>
+#include <linux/dept.h>
 
 #define __SYSCALL(nr, sym) extern long __x64_##sym(const struct pt_regs *);
 #define __SYSCALL_NORETURN(nr, sym) extern long __noreturn __x64_##sym(const struct pt_regs *);
@@ -86,6 +87,12 @@ static __always_inline bool do_syscall_x32(struct pt_regs *regs, int nr)
 /* Returns true to return using SYSRET, or false to use IRET */
 __visible noinstr bool do_syscall_64(struct pt_regs *regs, int nr)
 {
+	/*
+	 * This is a system call from user mode.  Make dept work with a
+	 * new kernel mode context.
+	 */
+	dept_update_cxt();
+
 	add_random_kstack_offset();
 	nr = syscall_enter_from_user_mode(regs, nr);
 
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index 998bd807fc7b..017edb75f0a0 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -19,6 +19,7 @@
 #include <linux/mm_types.h>
 #include <linux/mm.h>			/* find_and_lock_vma() */
 #include <linux/vmalloc.h>
+#include <linux/dept.h>
 
 #include <asm/cpufeature.h>		/* boot_cpu_has, ...		*/
 #include <asm/traps.h>			/* dotraplinkage, ...		*/
@@ -1219,6 +1220,12 @@ void do_user_addr_fault(struct pt_regs *regs,
 	tsk = current;
 	mm = tsk->mm;
 
+	/*
+	 * This fault comes from user mode.  Make dept work with a new
+	 * kernel mode context.
+	 */
+	dept_update_cxt();
+
 	if (unlikely((error_code & (X86_PF_USER | X86_PF_INSTR)) == X86_PF_INSTR)) {
 		/*
 		 * Whoops, this is kernel mode code trying to execute from
-- 
2.17.1


