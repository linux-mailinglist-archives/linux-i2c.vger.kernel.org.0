Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E14846B25AE
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 14:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbjCINn0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 08:43:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbjCINnO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 08:43:14 -0500
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C10531CBE7
        for <linux-i2c@vger.kernel.org>; Thu,  9 Mar 2023 05:43:09 -0800 (PST)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202303091343061f1f673d7c34af0d72
        for <linux-i2c@vger.kernel.org>;
        Thu, 09 Mar 2023 14:43:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=LWWKSwja5zpZiSyAbqGvPA3W0gLM9JY5S2eHp533JBM=;
 b=Nb4H6nKWf5vNXd8NWPi/hVRmqfXPnDDgQ2IE8j8xcJpvFWkAeqEuOTqBkLyf/irAEMHwFp
 IlAX383PnSPfy3MkxMlvvwFK589VAzVepM5sL2zJmn4KITmd4vNhE18h3uwvvDVZHlyeTyw2
 BiRd8tfUQFI/w6XlNTpfT4YnHIIxE=;
From:   "A. Sverdlin" <alexander.sverdlin@siemens.com>
To:     NXP Linux Team <linux-imx@nxp.com>
Cc:     Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: lpi2c: cache peripheral clock rate
Date:   Thu,  9 Mar 2023 14:43:01 +0100
Message-Id: <20230309134302.74940-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

One of the reasons to do it is to save some CPU cycles on cpu_freq_get()
under mutex. The second reason if the (false-positive) lockdep splat caused
by the recursive feature of the "prepare_lock" (one clock instance is I2C
peripheral clock and another is pcf85063 RTC as clock provider):

======================================================
WARNING: possible circular locking dependency detected
5.15.71+... #1 Tainted: G           O
------------------------------------------------------
fs-value/2332 is trying to acquire lock:
ffff8000096cae08 (prepare_lock){+.+.}-{3:3}, at: clk_prepare_lock+0x50/0xb0

but task is already holding lock:
ffff000011021100 (i2c_register_adapter){+.+.}-{3:3}, at: i2c_adapter_lock_bus+0x2c/0x3c

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #2 (i2c_register_adapter){+.+.}-{3:3}:
       lock_acquire+0x68/0x8c
       rt_mutex_lock_nested+0x88/0xe0
       i2c_adapter_lock_bus+0x2c/0x3c
       i2c_transfer+0x58/0x130
       regmap_i2c_read+0x64/0xb0
       _regmap_raw_read+0x114/0x440
       _regmap_bus_read+0x4c/0x84
       _regmap_read+0x6c/0x270
       regmap_read+0x54/0x80
       pcf85063_probe+0xec/0x4cc
       i2c_device_probe+0x10c/0x350
       really_probe+0xc4/0x470
       __driver_probe_device+0x11c/0x190
       driver_probe_device+0x48/0x110
       __device_attach_driver+0xc4/0x160
       bus_for_each_drv+0x80/0xe0
       __device_attach+0xb0/0x1f0
       device_initial_probe+0x1c/0x2c
       bus_probe_device+0xa4/0xb0
       device_add+0x398/0x8ac
       device_register+0x28/0x40
       i2c_new_client_device+0x144/0x290
       of_i2c_register_devices+0x18c/0x230
       i2c_register_adapter+0x1dc/0x6b0
       __i2c_add_numbered_adapter+0x68/0xbc
       i2c_add_adapter+0xb0/0xe0
       lpi2c_imx_probe+0x354/0x5e0
       platform_probe+0x70/0xec
       really_probe+0xc4/0x470
       __driver_probe_device+0x11c/0x190
       driver_probe_device+0x48/0x110
       __device_attach_driver+0xc4/0x160
       bus_for_each_drv+0x80/0xe0
       __device_attach+0xb0/0x1f0
       device_initial_probe+0x1c/0x2c
       bus_probe_device+0xa4/0xb0
       deferred_probe_work_func+0xa0/0xfc
       process_one_work+0x2ac/0x6f4
       worker_thread+0x7c/0x47c
       kthread+0x150/0x16c
       ret_from_fork+0x10/0x20

-> #1 (rtc_pcf85063:560:(&config->regmap)->lock){+.+.}-{3:3}:
       lock_acquire+0x68/0x8c
       __mutex_lock+0x9c/0x4d0
       mutex_lock_nested+0x48/0x5c
       regmap_lock_mutex+0x1c/0x30
       regmap_read+0x44/0x80
       pcf85063_clkout_recalc_rate+0x34/0x80
       __clk_register+0x520/0x880
       devm_clk_register+0x64/0xc4
       pcf85063_probe+0x24c/0x4cc
       i2c_device_probe+0x10c/0x350
       really_probe+0xc4/0x470
       __driver_probe_device+0x11c/0x190
       driver_probe_device+0x48/0x110
       __device_attach_driver+0xc4/0x160
       bus_for_each_drv+0x80/0xe0
       __device_attach+0xb0/0x1f0
       device_initial_probe+0x1c/0x2c
       bus_probe_device+0xa4/0xb0
       device_add+0x398/0x8ac
       device_register+0x28/0x40
       i2c_new_client_device+0x144/0x290
       of_i2c_register_devices+0x18c/0x230
       i2c_register_adapter+0x1dc/0x6b0
       __i2c_add_numbered_adapter+0x68/0xbc
       i2c_add_adapter+0xb0/0xe0
       lpi2c_imx_probe+0x354/0x5e0
       platform_probe+0x70/0xec
       really_probe+0xc4/0x470
       __driver_probe_device+0x11c/0x190
       driver_probe_device+0x48/0x110
       __device_attach_driver+0xc4/0x160
       bus_for_each_drv+0x80/0xe0
       __device_attach+0xb0/0x1f0
       device_initial_probe+0x1c/0x2c
       bus_probe_device+0xa4/0xb0
       deferred_probe_work_func+0xa0/0xfc
       process_one_work+0x2ac/0x6f4
       worker_thread+0x7c/0x47c
       kthread+0x150/0x16c
       ret_from_fork+0x10/0x20

-> #0 (prepare_lock){+.+.}-{3:3}:
       __lock_acquire+0x1298/0x20d0
       lock_acquire.part.0+0xf0/0x250
       lock_acquire+0x68/0x8c
       __mutex_lock+0x9c/0x4d0
       mutex_lock_nested+0x48/0x5c
       clk_prepare_lock+0x50/0xb0
       clk_get_rate+0x28/0x80
       lpi2c_imx_xfer+0xb0/0xa9c
       __i2c_transfer+0x174/0xa80
       i2c_transfer+0x68/0x130
       regmap_i2c_read+0x64/0xb0
       _regmap_raw_read+0x114/0x440
       regmap_raw_read+0x19c/0x28c
       regmap_bulk_read+0x1b8/0x244
       at24_read+0x14c/0x2c4
       nvmem_reg_read+0x2c/0x54
       bin_attr_nvmem_read+0x8c/0xbc
       sysfs_kf_bin_read+0x74/0x94
       kernfs_fop_read_iter+0xb0/0x1d0
       new_sync_read+0xf0/0x184
       vfs_read+0x154/0x1f0
       ksys_read+0x70/0x100
       __arm64_sys_read+0x24/0x30
       invoke_syscall+0x50/0x120
       el0_svc_common.constprop.0+0x68/0x124
       do_el0_svc+0x30/0x9c
       el0_svc+0x54/0x110
       el0t_64_sync_handler+0xa4/0x130
       el0t_64_sync+0x1a0/0x1a4

other info that might help us debug this:

Chain exists of:
  prepare_lock --> rtc_pcf85063:560:(&config->regmap)->lock --> i2c_register_adapter

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(i2c_register_adapter);
                               lock(rtc_pcf85063:560:(&config->regmap)->lock);
                               lock(i2c_register_adapter);
  lock(prepare_lock);

 *** DEADLOCK ***

4 locks held by .../2332:
 #0: ffff0000146eb288 (&of->mutex){+.+.}-{3:3}, at: kernfs_fop_read_iter+0x74/0x1d0
 #1: ffff000010fe4400 (kn->active#72){.+.+}-{0:0}, at: kernfs_fop_read_iter+0x7c/0x1d0
 #2: ffff0000110168e8 (&at24->lock){+.+.}-{3:3}, at: at24_read+0x8c/0x2c4
 #3: ffff000011021100 (i2c_register_adapter){+.+.}-{3:3}, at: i2c_adapter_lock_bus+0x2c/0x3c

stack backtrace:
CPU: 1 PID: 2332 Comm: ... Tainted: G           O      5.15.71+... #1
Hardware name: ... (DT)
Call trace:
 dump_backtrace+0x0/0x1d4
 show_stack+0x20/0x2c
 dump_stack_lvl+0x8c/0xb8
 dump_stack+0x18/0x34
 print_circular_bug+0x1f8/0x200
 check_noncircular+0x130/0x144
 __lock_acquire+0x1298/0x20d0
 lock_acquire.part.0+0xf0/0x250
 lock_acquire+0x68/0x8c
 __mutex_lock+0x9c/0x4d0
 mutex_lock_nested+0x48/0x5c
 clk_prepare_lock+0x50/0xb0
 clk_get_rate+0x28/0x80
 lpi2c_imx_xfer+0xb0/0xa9c
 __i2c_transfer+0x174/0xa80
 i2c_transfer+0x68/0x130
 regmap_i2c_read+0x64/0xb0
 _regmap_raw_read+0x114/0x440
 regmap_raw_read+0x19c/0x28c
 regmap_bulk_read+0x1b8/0x244
 at24_read+0x14c/0x2c4
 nvmem_reg_read+0x2c/0x54
 bin_attr_nvmem_read+0x8c/0xbc
 sysfs_kf_bin_read+0x74/0x94
 kernfs_fop_read_iter+0xb0/0x1d0
 new_sync_read+0xf0/0x184
 vfs_read+0x154/0x1f0
 ksys_read+0x70/0x100
 __arm64_sys_read+0x24/0x30
 invoke_syscall+0x50/0x120
 el0_svc_common.constprop.0+0x68/0x124
 do_el0_svc+0x30/0x9c
 el0_svc+0x54/0x110
 el0t_64_sync_handler+0xa4/0x130
 el0t_64_sync+0x1a0/0x1a4

Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 188f2a36d2fd6..cf36f12b85573 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -100,6 +100,7 @@ struct lpi2c_imx_struct {
 	__u8			*rx_buf;
 	__u8			*tx_buf;
 	struct completion	complete;
+	unsigned int		rate_per;
 	unsigned int		msglen;
 	unsigned int		delivered;
 	unsigned int		block_data;
@@ -202,20 +203,19 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx)
 static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
 {
 	u8 prescale, filt, sethold, clkhi, clklo, datavd;
-	unsigned int clk_rate, clk_cycle;
+	unsigned int clk_cycle;
 	enum lpi2c_imx_pincfg pincfg;
 	unsigned int temp;
 
 	lpi2c_imx_set_mode(lpi2c_imx);
 
-	clk_rate = clk_get_rate(lpi2c_imx->clks[0].clk);
 	if (lpi2c_imx->mode == HS || lpi2c_imx->mode == ULTRA_FAST)
 		filt = 0;
 	else
 		filt = 2;
 
 	for (prescale = 0; prescale <= 7; prescale++) {
-		clk_cycle = clk_rate / ((1 << prescale) * lpi2c_imx->bitrate)
+		clk_cycle = lpi2c_imx->rate_per / ((1 << prescale) * lpi2c_imx->bitrate)
 			    - 3 - (filt >> 1);
 		clkhi = (clk_cycle + I2C_CLK_RATIO) / (I2C_CLK_RATIO + 1);
 		clklo = clk_cycle - clkhi;
@@ -588,6 +588,12 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	lpi2c_imx->rate_per = clk_get_rate(lpi2c_imx->clks[0].clk);
+	if (!lpi2c_imx->rate_per) {
+		dev_err(&pdev->dev, "can't get I2C peripheral clock rate\n");
+		return -EINVAL;
+	}
+
 	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
-- 
2.34.1

