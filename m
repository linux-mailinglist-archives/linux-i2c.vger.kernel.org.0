Return-Path: <linux-i2c+bounces-1072-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C6D81FF50
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 13:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C9531C21671
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 12:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BACE611197;
	Fri, 29 Dec 2023 12:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="XwUp+3rM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6241811187;
	Fri, 29 Dec 2023 12:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E556A40E01AC;
	Fri, 29 Dec 2023 12:08:37 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QvfOF0d8TSHs; Fri, 29 Dec 2023 12:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1703851715; bh=Kfd1jieI9qV+3NknFAZpcLVi7tzXyVNY3wF/gry+AQ8=;
	h=Date:From:To:Cc:Subject:From;
	b=XwUp+3rMIRnGPMdKubaV0xzBC/sAs+4Hh0egy62kBIYEzTA/BtCNGD0lbmy073ETu
	 w/naJ7onJfg4ehf6u/FkiUlCoKTLUgYFE425cpq2sUXHRU1YCPsV7P8tnNd9GVElZF
	 q3maDX7Ha5jEzkrBKk5YO+rmEo2UTyUm2naJz3NsT34NoHC0lHf4FdlyRjfbXMvUsN
	 Qm2gzEm8Jq3UJYh6lPTgIlQO5VcdCCmDwVIvJKobzgnUH5fZXE62qH9+ZbdiZoVbxJ
	 cwUnMAOSiNCh8FzrfTL2Hu50gm96iSwgN6+nm8St5wk9le+MGiX63rbtfBvQ6VVkSK
	 HoFPFswtyukWQgTkEmTN6ySOHcJ+vdlaPp2E0UjGsGfQduZNFo/ugSjyY5MwLHQ3t/
	 TYME8/ugZkDRwZCfbvLREm0aclFORPeXnrUDSdx0PvX5G75iwGnFV8XMmq6L0hLuGG
	 eRK6M1J53rCkUge8JbunWabu4WdRTQTphGHJ9AH3xi+Aa2pu1qBBXzyeRIkZUiPxXq
	 2lg05di+DeGxMXvxNOUZnOMoKAJ4DS8GVXRkzKV/BQO2LQbZcSTxo3Q4wG2vTTI0lS
	 f8Kl6YP8XLhZRFwXroNu/UN1uUw/oXgcF5O7BOfkuRshSBH1MfheOnuHMtxcJRrrAB
	 Mk3Gu7mjZEd6rFtY+tqHeexo=
Received: from zn.tnic (pd9530f8c.dip0.t-ipconnect.de [217.83.15.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 31BC540E00C7;
	Fri, 29 Dec 2023 12:08:26 +0000 (UTC)
Date: Fri, 29 Dec 2023 13:08:20 +0100
From: Borislav Petkov <bp@alien8.de>
To: linux-i2c@vger.kernel.org
Cc: lkml <linux-kernel@vger.kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>, narasimhan.v@amd.com
Subject: i2c-designware: NULL ptr at RIP: 0010:regmap_read+0x12/0x70
Message-ID: <20231229120820.GCZY62tM7z4v2XmOAZ@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

we're seeing the below splat in our testing of linux-next.

Disassembling Code: gives

  17:	90                   	nop
  18:	f3 0f 1e fa          	endbr64
  1c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  21:	55                   	push   %rbp
  22:	48 89 e5             	mov    %rsp,%rbp
  25:	41 55                	push   %r13
  27:	41 54                	push   %r12
  29:	53                   	push   %rbx
  2a:*	8b 87 fc 01 00 00    	mov    0x1fc(%rdi),%eax		<-- trapping instruction

which is

regmap_read:
	endbr64
1:	call	__fentry__
	.section __mcount_loc, "a",@progbits
	.quad 1b
	.previous
	pushq	%rbp	#
	movq	%rsp, %rbp	#,
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
# drivers/base/regmap/regmap.c:2826: 	if (!IS_ALIGNED(reg, map->reg_stride))
	movl	508(%rdi), %eax	# map_12(D)->reg_stride, tmp107
	^^^^^^^^

i.e., that @map argument is 0.

Looking at the call stack, I see

  2409205acd3c ("i2c: designware: fix __i2c_dw_disable() in case master is holding SCL low")

which does that dev->map deref in __i2c_dw_disable() but maybe ->map is
invalid by then...?

Just a stab in the dark anyway...

Thx.

[    6.245173] i2c_designware AMDI0010:00: Unknown Synopsys component type: 0xffffffff
[    6.252683] BUG: kernel NULL pointer dereference, address: 00000000000001fc
[    6.256551] #PF: supervisor read access in kernel mode
[    6.256551] #PF: error_code(0x0000) - not-present page
[    6.256551] PGD 0 
[    6.256551] Oops: 0000 [#1] PREEMPT SMP NOPTI
[    6.256551] CPU: 32 PID: 211 Comm: kworker/32:0 Not tainted 6.7.0-rc6-next-20231222-1703820640818 #1
[    6.256551] Workqueue: pm pm_runtime_work
[    6.256551] RIP: 0010:regmap_read+0x12/0x70
[    6.256551] Code: 00 00 00 00 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 53 <8b> 87 fc 01 00 00 83 e8 01 85 f0 75 42 48 89 fb 41 89 f4 49 89 d5
[    6.256551] RSP: 0018:ff7fa5c740bcbc98 EFLAGS: 00010246
[    6.256551] RAX: 0000000000000000 RBX: ff38ff5c159f1028 RCX: 0000000000000008
[    6.256551] RDX: ff7fa5c740bcbcc4 RSI: 0000000000000034 RDI: 0000000000000000
[    6.256551] RBP: ff7fa5c740bcbcb0 R08: ff38ff5c02ceb8b0 R09: ff38ff5c002a4500
[    6.256551] R10: 0000000000000003 R11: 0000000000000003 R12: ff38ff5c159f1028
[    6.256551] R13: 0000000000000000 R14: 0000000000000000 R15: ff38ff5c159ed8f4
[    6.256551] FS:  0000000000000000(0000) GS:ff38ff6b0d200000(0000) knlGS:0000000000000000
[    6.256551] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.256551] CR2: 00000000000001fc CR3: 000000007403c001 CR4: 0000000000771ef0
[    6.256551] PKRU: 55555554
[    6.256551] Call Trace:
[    6.256551]  <TASK>
[    6.256551]  ? show_regs+0x6d/0x80
[    6.256551]  ? __die+0x29/0x70
[    6.256551]  ? page_fault_oops+0x153/0x4a0
[    6.256551]  ? do_user_addr_fault+0x30f/0x6c0
[    6.256551]  ? exc_page_fault+0x7c/0x190
[    6.256551]  ? asm_exc_page_fault+0x2b/0x30
[    6.256551]  ? regmap_read+0x12/0x70
[    6.256551]  ? update_load_avg+0x82/0x7d0
[    6.256551]  __i2c_dw_disable+0x38/0x180
[    6.256551]  i2c_dw_disable+0x3f/0xb0
[    6.256551]  i2c_dw_runtime_suspend+0x33/0x50
[    6.256551]  ? __pfx_pm_generic_runtime_suspend+0x10/0x10
[    6.256551]  pm_generic_runtime_suspend+0x2f/0x40
[    6.256551]  __rpm_callback+0x48/0x120
[    6.256551]  ? __pfx_pm_generic_runtime_suspend+0x10/0x10
[    6.256551]  rpm_callback+0x66/0x70
[    6.256551]  ? __pfx_pm_generic_runtime_suspend+0x10/0x10
[    6.256551]  rpm_suspend+0x166/0x700
[    6.256551]  ? srso_alias_return_thunk+0x5/0xfbef5
[    6.256551]  ? __schedule+0x3df/0x1720
[    6.256551]  pm_runtime_work+0xb2/0xd0
[    6.256551]  process_one_work+0x178/0x350
[    6.256551]  worker_thread+0x2f5/0x420
[    6.256551]  ? __pfx_worker_thread+0x10/0x10
[    6.256551]  kthread+0xf5/0x130
[    6.256551]  ? __pfx_kthread+0x10/0x10
[    6.256551]  ret_from_fork+0x3d/0x60
[    6.256551]  ? __pfx_kthread+0x10/0x10
[    6.256551]  ret_from_fork_asm+0x1a/0x30
[    6.256551]  </TASK>
[    6.256551] Modules linked in:
[    6.256551] CR2: 00000000000001fc
[    6.256551] ---[ end trace 0000000000000000 ]---
[    6.256551] RIP: 0010:regmap_read+0x12/0x70
[    6.256551] Code: 00 00 00 00 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 53 <8b> 87 fc 01 00 00 83 e8 01 85 f0 75 42 48 89 fb 41 89 f4 49 89 d5
[    6.256551] RSP: 0018:ff7fa5c740bcbc98 EFLAGS: 00010246
[    6.256551] RAX: 0000000000000000 RBX: ff38ff5c159f1028 RCX: 0000000000000008
[    6.256551] RDX: ff7fa5c740bcbcc4 RSI: 0000000000000034 RDI: 0000000000000000
[    6.256551] RBP: ff7fa5c740bcbcb0 R08: ff38ff5c02ceb8b0 R09: ff38ff5c002a4500
[    6.256551] R10: 0000000000000003 R11: 0000000000000003 R12: ff38ff5c159f1028
[    6.256551] R13: 0000000000000000 R14: 0000000000000000 R15: ff38ff5c159ed8f4
[    6.256551] FS:  0000000000000000(0000) GS:ff38ff6b0d200000(0000) knlGS:0000000000000000
[    6.256551] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.256551] CR2: 00000000000001fc CR3: 000000007403c001 CR4: 0000000000771ef0
[    6.256551] PKRU: 55555554
[    6.256551] note: kworker/32:0[211] exited with irqs disabled


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

