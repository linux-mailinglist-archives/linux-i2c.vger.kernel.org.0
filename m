Return-Path: <linux-i2c+bounces-1267-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E8582AF05
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jan 2024 13:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEC94285DBC
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jan 2024 12:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D1C15AFD;
	Thu, 11 Jan 2024 12:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7PLnmu+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271AD15AC8
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jan 2024 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704977825; x=1736513825;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f2mF3Q0OD4e8GrP6vsI6FkUd2nZ7qPJ3dXmU61ZUGOM=;
  b=n7PLnmu+u2Yw+Aw1uY4ifEk0GM2YjYlCaet/fNxF6NOvbZdZUdrslp5S
   UYg6zh5I7BD5iMsB+INIInwVqhN5zzKeRYzYv+3UzAGIpniKwrdv21tQi
   B1aY3lGh/P4QgF07Roo/DPsy++CAyt9Sc31CRIc4wx8ytFNQ+DJEYccmt
   x9usFgA4h6iaA64XGwaFz3KnR3sj7ZWR5RzCpgBQgYsAKs7D0gyl7/5jo
   ZRw7eawk5lD2Vfdph3Rchoan05Lui3ZVPZm2eOuqbzfWuwbw5/4oy77O4
   RQgpP78tUPyiXyaUldZUOhHFk8mWpUshGrArcQ0fRyh7aL9PnZnQF6/iZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="463123018"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="463123018"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 04:57:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="732220830"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="732220830"
Received: from marquiz-s-2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.58])
  by orsmga003.jf.intel.com with ESMTP; 11 Jan 2024 04:57:01 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>,
	V Narasimhan <Narasimhan.V@amd.com>,
	Kim Phillips <kim.phillips@amd.com>
Subject: [PATCH] i2c: designware: Revert recent changes to i2c_dw_probe_lock_support()
Date: Thu, 11 Jan 2024 14:56:58 +0200
Message-ID: <20240111125658.921083-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Borislav Petkov reported a regression below on an AMD system and it
appeared on linux-next only after late December 2023. V, Narasimhan and
Kim Phillips helped to track down regression to commit 2f571a725434
("i2c: designware: Fix lock probe call order in dw_i2c_plat_probe()").

Unfortuately above commit is not directly revertible so revert it by
reverting also two other related commits on top of it. So this patch
reverts following commits:

f9b51f600217 ("i2c: designware: Save pointer to semaphore callbacks instead of index")
b8034c7d28a9 ("i2c: designware: Replace a while-loop by for-loop")
2f571a725434 ("i2c: designware: Fix lock probe call order in dw_i2c_plat_probe()")

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

Reported-by: Borislav Petkov <bp@alien8.de>
Reported-by: V Narasimhan <Narasimhan.V@amd.com>
Reported-by: Kim Phillips <kim.phillips@amd.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-core.h    |  4 +--
 drivers/i2c/busses/i2c-designware-platdrv.c | 35 ++++++++++++---------
 2 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 5405d4da2b7d..efec9ed305a9 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -186,8 +186,6 @@ struct clk;
 struct device;
 struct reset_control;
 
-struct i2c_dw_semaphore_callbacks;
-
 /**
  * struct dw_i2c_dev - private i2c-designware data
  * @dev: driver model device node
@@ -291,7 +289,7 @@ struct dw_i2c_dev {
 	u16			hs_lcnt;
 	int			(*acquire_lock)(void);
 	void			(*release_lock)(void);
-	const struct i2c_dw_semaphore_callbacks *semaphore_cb;
+	int			semaphore_idx;
 	bool			shared_with_punit;
 	int			(*init)(struct dw_i2c_dev *dev);
 	int			(*set_sda_hold_time)(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index fa9c0c56b11e..e523df18bb0d 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -176,23 +176,17 @@ static const struct i2c_dw_semaphore_callbacks i2c_dw_semaphore_cb_table[] = {
 	{}
 };
 
-static void i2c_dw_remove_lock_support(void *data)
-{
-	struct dw_i2c_dev *dev = data;
-
-	if (!dev->semaphore_cb)
-		return;
-
-	if (dev->semaphore_cb->remove)
-		dev->semaphore_cb->remove(dev);
-}
-
 static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
 {
 	const struct i2c_dw_semaphore_callbacks *ptr;
+	int i = 0;
 	int ret;
 
-	for (ptr = i2c_dw_semaphore_cb_table; ptr->probe; ptr++) {
+	ptr = i2c_dw_semaphore_cb_table;
+
+	dev->semaphore_idx = -1;
+
+	while (ptr->probe) {
 		ret = ptr->probe(dev);
 		if (ret) {
 			/*
@@ -203,14 +197,25 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
 			if (ret != -ENODEV)
 				return ret;
 
+			i++;
+			ptr++;
 			continue;
 		}
 
-		dev->semaphore_cb = ptr;
+		dev->semaphore_idx = i;
 		break;
 	}
 
-	return devm_add_action_or_reset(dev->dev, i2c_dw_remove_lock_support, dev);
+	return 0;
+}
+
+static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
+{
+	if (dev->semaphore_idx < 0)
+		return;
+
+	if (i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove)
+		i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove(dev);
 }
 
 static void dw_i2c_plat_assert_reset(void *data)
@@ -340,6 +345,8 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
+
+	i2c_dw_remove_lock_support(dev);
 }
 
 static const struct of_device_id dw_i2c_of_match[] = {
-- 
2.43.0


