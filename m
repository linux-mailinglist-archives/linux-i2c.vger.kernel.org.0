Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 729846B3FF2
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Mar 2023 14:08:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjCJNI1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Mar 2023 08:08:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjCJNI0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Mar 2023 08:08:26 -0500
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F9F23A79
        for <linux-i2c@vger.kernel.org>; Fri, 10 Mar 2023 05:08:21 -0800 (PST)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2023031013081823fcfce189932f33ff
        for <linux-i2c@vger.kernel.org>;
        Fri, 10 Mar 2023 14:08:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=s+nH5Ngbx99XFOSVxo8glQSgmMDst6MuEb0MTETwA+Y=;
 b=R7foaMtAEICNtNXJWxgRyZXQ4bfQVUANuqlxgtDu9sYlgs0J+0LJXsdEHRRpNmN5DG3OlN
 POwo8uk3nTg219YP91ncGsV1l8VqFTJvZiLMYUYfosT8uQonJGyjlDJB0qo25f725bNSl+gV
 YFeI4V1GdPdgJly7m2nyXRiBgibCk=;
From:   "A. Sverdlin" <alexander.sverdlin@siemens.com>
To:     NXP Linux Team <linux-imx@nxp.com>
Cc:     Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] i2c: lpi2c: cache peripheral clock rate
Date:   Fri, 10 Mar 2023 14:08:15 +0100
Message-Id: <20230310130815.562418-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
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
ffff8000096cae08 (prepare_lock){+.+.}-{3:3}, at: clk_prepare_lock

but task is already holding lock:
ffff000011021100 (i2c_register_adapter){+.+.}-{3:3}, at: i2c_adapter_lock_bus

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #2 (i2c_register_adapter){+.+.}-{3:3}:
       lock_acquire
       rt_mutex_lock_nested
       i2c_adapter_lock_bus
       i2c_transfer
       regmap_i2c_read
       _regmap_raw_read
       _regmap_bus_read
       _regmap_read
       regmap_read
       pcf85063_probe
       i2c_device_probe
       really_probe
       __driver_probe_device
       driver_probe_device
       __device_attach_driver
       bus_for_each_drv
       __device_attach
       device_initial_probe
       bus_probe_device
       device_add
       device_register
       i2c_new_client_device
       of_i2c_register_devices
       i2c_register_adapter
       __i2c_add_numbered_adapter
       i2c_add_adapter
       lpi2c_imx_probe
       platform_probe
       really_probe
       __driver_probe_device
       driver_probe_device
       __device_attach_driver
       bus_for_each_drv
       __device_attach
       device_initial_probe
       bus_probe_device
       deferred_probe_work_func
       process_one_work
       worker_thread
       kthread
       ret_from_fork

-> #1 (rtc_pcf85063:560:(&config->regmap)->lock){+.+.}-{3:3}:
       lock_acquire
       __mutex_lock
       mutex_lock_nested
       regmap_lock_mutex
       regmap_read
       pcf85063_clkout_recalc_rate
       __clk_register
       devm_clk_register
       pcf85063_probe
       i2c_device_probe
       really_probe
       __driver_probe_device
       driver_probe_device
       __device_attach_driver
       bus_for_each_drv
       __device_attach
       device_initial_probe
       bus_probe_device
       device_add
       device_register
       i2c_new_client_device
       of_i2c_register_devices
       i2c_register_adapter
       __i2c_add_numbered_adapter
       i2c_add_adapter
       lpi2c_imx_probe
       platform_probe
       really_probe
       __driver_probe_device
       driver_probe_device
       __device_attach_driver
       bus_for_each_drv
       __device_attach
       device_initial_probe
       bus_probe_device
       deferred_probe_work_func
       process_one_work
       worker_thread
       kthread
       ret_from_fork

-> #0 (prepare_lock){+.+.}-{3:3}:
       __lock_acquire
       lock_acquire.part.0
       lock_acquire
       __mutex_lock
       mutex_lock_nested
       clk_prepare_lock
       clk_get_rate
       lpi2c_imx_xfer
       __i2c_transfer
       i2c_transfer
       regmap_i2c_read
       _regmap_raw_read
       regmap_raw_read
       regmap_bulk_read
       at24_read
       nvmem_reg_read
       bin_attr_nvmem_read
       sysfs_kf_bin_read
       kernfs_fop_read_iter
       new_sync_read
       vfs_read
       ksys_read
       __arm64_sys_read
       invoke_syscall
       ...

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
 #0: ffff0000146eb288 (&of->mutex){+.+.}-{3:3}, at: kernfs_fop_read_iter
 #1: ffff000010fe4400 (kn->active#72){.+.+}-{0:0}, at: kernfs_fop_read_iter
 #2: ffff0000110168e8 (&at24->lock){+.+.}-{3:3}, at: at24_read
 #3: ffff000011021100 (i2c_register_adapter){+.+.}-{3:3}, at: i2c_adapter_lock_bus

stack backtrace:
CPU: 1 PID: 2332 Comm: ... Tainted: G           O      5.15.71+... #1
Hardware name: ... (DT)
Call trace:
 dump_backtrace
 show_stack
 dump_stack_lvl
 dump_stack
 print_circular_bug
 check_noncircular
 __lock_acquire
 lock_acquire.part.0
 lock_acquire
 __mutex_lock
 mutex_lock_nested
 clk_prepare_lock
 clk_get_rate
 lpi2c_imx_xfer
 __i2c_transfer
 i2c_transfer
 regmap_i2c_read
 _regmap_raw_read
 regmap_raw_read
 regmap_bulk_read
 at24_read
 nvmem_reg_read
 bin_attr_nvmem_read
 sysfs_kf_bin_read
 kernfs_fop_read_iter
 new_sync_read
 vfs_read
 ksys_read
 __arm64_sys_read
 invoke_syscall
 ...

Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 33 +++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

Changelog:
v3: fixed build error reported by kernel test robot <lkp@intel.com>
    https://lore.kernel.org/oe-kbuild-all/202303102010.pAv56wKs-lkp@intel.com/
v2: added clk_notifier as Alexander suggested

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 188f2a36d2fd6..5f1d1d4e018bd 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -100,6 +100,8 @@ struct lpi2c_imx_struct {
 	__u8			*rx_buf;
 	__u8			*tx_buf;
 	struct completion	complete;
+	struct notifier_block	clk_change_nb;
+	unsigned int		rate_per;
 	unsigned int		msglen;
 	unsigned int		delivered;
 	unsigned int		block_data;
@@ -198,24 +200,37 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx)
 	} while (1);
 }
 
+static int lpi2c_imx_clk_change_cb(struct notifier_block *nb,
+				   unsigned long action, void *data)
+{
+	struct clk_notifier_data *ndata = data;
+	struct lpi2c_imx_struct *lpi2c_imx = container_of(nb,
+							  struct lpi2c_imx_struct,
+							  clk_change_nb);
+
+	if (action & POST_RATE_CHANGE)
+		lpi2c_imx->rate_per = ndata->new_rate;
+
+	return NOTIFY_OK;
+}
+
 /* CLKLO = I2C_CLK_RATIO * CLKHI, SETHOLD = CLKHI, DATAVD = CLKHI/2 */
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
@@ -588,6 +603,18 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	lpi2c_imx->clk_change_nb.notifier_call = lpi2c_imx_clk_change_cb;
+	ret = devm_clk_notifier_register(&pdev->dev, lpi2c_imx->clks[0].clk,
+					 &lpi2c_imx->clk_change_nb);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "can't register peripheral clock notifier\n");
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

