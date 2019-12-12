Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0F6D11DA19
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 00:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731347AbfLLXfV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Dec 2019 18:35:21 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45171 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730868AbfLLXfN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Dec 2019 18:35:13 -0500
Received: by mail-lf1-f65.google.com with SMTP id 203so541039lfa.12;
        Thu, 12 Dec 2019 15:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cofkplfJ+UfVuDUPTc+Z2SHSyUS2hYt1uSHcs31t8C4=;
        b=gmMjsAz2nSCvCNEEm1fZ8dksHyNFZmufMXdbWOzni5CZLca4c9ixVBpdNEOYgj7DSm
         4AuSrkYYpPQ0sP+A+K9Mh361jz7ABmK5Izkul1zap1adBdZTpvSU7BiTCER5rWiMpkrm
         9QE5vLyWLiK0s5EzbYj55S+ZhTTYeklUP6816zyxLjdQxEFwWK/Ik7w4tZcQXR6ZFSat
         SgCHMA0wkmKoLgpGq0AmquI0Ie1UyG3URjWBMa7JcnE4e4QSP+b4nlSzFj+AwoDK2z5e
         omDZqn9OZXSMwejdzpfdjlsXn/NNuhgOBKYNvJ6z5pSnTIF9UkUPtEond3SmC2TyoGiZ
         I6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cofkplfJ+UfVuDUPTc+Z2SHSyUS2hYt1uSHcs31t8C4=;
        b=IODWwWgEcwCy7u5jZs8LLnZtXJfR7V03N5aTWV3lgUZqODyQV/cBY0oqkpL+YLN8jP
         qZ8hb/mYwC5aZrTYTTkJ9kNorm51gGz3o7RCjO10H8yIu50YTjLymo7dt0u166q8jxB4
         sQ7WDfE3kWyLC4P6t83Cv7uspKsqIsw6KSbrAzUVVcm0hd2EnAAxyWNNDP3qLe7SHl1I
         uzZ2PT/68mdZt3KoI7oa/DbrIURd1UCgDXb2lPYt9Cs/N8Cv53ozK4sy6AmlWQxUIZoc
         VjayoYcLv4wv/y637vlJN60I6sUtAmxg4K/n6kv7o5jdAyjsgXrCcWbDzmqLoKCFxUEe
         Kwrg==
X-Gm-Message-State: APjAAAW5RPPjVtWTLFkQ/WNqhRL5L+nW9aRsVUyLHtJuYPGj1n/0mNiu
        Xz1T6Cy8g1323WVVo3tmcWI=
X-Google-Smtp-Source: APXvYqy4wT/jfAQX40pfdxu4uKgTXMtqmnPuDHO7thzfZ5wbSdPazJ6xTUey2mwCrGaQHMFqbrEBYw==
X-Received: by 2002:a19:7015:: with SMTP id h21mr7012401lfc.68.1576193709738;
        Thu, 12 Dec 2019 15:35:09 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id q27sm3764283ljm.25.2019.12.12.15.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 15:35:09 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] i2c: tegra: Support atomic transfers
Date:   Fri, 13 Dec 2019 02:34:26 +0300
Message-Id: <20191212233428.14648-2-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212233428.14648-1-digetx@gmail.com>
References: <20191212233428.14648-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

System shutdown may happen with interrupts being disabled and in this case
I2C core rejects transfers if atomic transfer isn't supported by driver.

There were several occurrences where I found my Nexus 7 completely
discharged despite of being turned off and then one day I spotted this in
the log:

 reboot: Power down
 ------------[ cut here ]------------
 WARNING: CPU: 0 PID: 1 at drivers/i2c/i2c-core.h:40 i2c_transfer+0x95/0x9c
 No atomic I2C transfer handler for 'i2c-1'
 Modules linked in: tegra30_devfreq
 CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted 5.4.0-next-20191202-00120-gf7ecd80fb803-dirty #3195
 Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
 [<c010e4b5>] (unwind_backtrace) from [<c010a0fd>] (show_stack+0x11/0x14)
 [<c010a0fd>] (show_stack) from [<c09995e5>] (dump_stack+0x85/0x94)
 [<c09995e5>] (dump_stack) from [<c011f3d1>] (__warn+0xc1/0xc4)
 [<c011f3d1>] (__warn) from [<c011f691>] (warn_slowpath_fmt+0x61/0x78)
 [<c011f691>] (warn_slowpath_fmt) from [<c069a8dd>] (i2c_transfer+0x95/0x9c)
 [<c069a8dd>] (i2c_transfer) from [<c05667f1>] (regmap_i2c_read+0x4d/0x6c)
 [<c05667f1>] (regmap_i2c_read) from [<c0563601>] (_regmap_raw_read+0x99/0x1cc)
 [<c0563601>] (_regmap_raw_read) from [<c0563757>] (_regmap_bus_read+0x23/0x38)
 [<c0563757>] (_regmap_bus_read) from [<c056293d>] (_regmap_read+0x3d/0xfc)
 [<c056293d>] (_regmap_read) from [<c0562d3b>] (_regmap_update_bits+0x87/0xc4)
 [<c0562d3b>] (_regmap_update_bits) from [<c0563add>] (regmap_update_bits_base+0x39/0x50)
 [<c0563add>] (regmap_update_bits_base) from [<c056fd39>] (max77620_pm_power_off+0x29/0x2c)
 [<c056fd39>] (max77620_pm_power_off) from [<c013bbdd>] (__do_sys_reboot+0xe9/0x170)
 [<c013bbdd>] (__do_sys_reboot) from [<c0101001>] (ret_fast_syscall+0x1/0x28)
 Exception stack(0xde907fa8 to 0xde907ff0)
 7fa0:                   00000000 00000000 fee1dead 28121969 4321fedc 00000000
 7fc0: 00000000 00000000 00000000 00000058 00000000 00000000 00000000 00000000
 7fe0: 0045adf0 bed9abb8 004444a0 b6c666d0
 ---[ end trace bdd18f87595b1a5e ]---

The atomic transferring is implemented by enforcing PIO mode for the
transfer and by polling interrupt status until transfer is completed or
failed.

Now system shuts down properly every time.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 95 +++++++++++++++++++++++++++++++---
 1 file changed, 88 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a98bf31d0e5c..799c343571bc 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/ktime.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
@@ -248,6 +249,7 @@ struct tegra_i2c_hw_feature {
  * @dma_buf_size: DMA buffer size
  * @is_curr_dma_xfer: indicates active DMA transfer
  * @dma_complete: DMA completion notifier
+ * @is_curr_atomic_xfer: indicates active atomic transfer
  */
 struct tegra_i2c_dev {
 	struct device *dev;
@@ -279,6 +281,7 @@ struct tegra_i2c_dev {
 	unsigned int dma_buf_size;
 	bool is_curr_dma_xfer;
 	struct completion dma_complete;
+	bool is_curr_atomic_xfer;
 };
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
@@ -999,6 +1002,44 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 	i2c_writel(i2c_dev, val, reg);
 }
 
+static unsigned long
+tegra_i2c_poll_completion_timeout(struct tegra_i2c_dev *i2c_dev,
+				  unsigned int timeout_ms)
+{
+	ktime_t ktime = ktime_get();
+	ktime_t ktimeout = ktime_add_ms(ktime, timeout_ms);
+
+	do {
+		u32 status = i2c_readl(i2c_dev, I2C_INT_STATUS);
+
+		if (status) {
+			tegra_i2c_isr(i2c_dev->irq, i2c_dev);
+
+			if (completion_done(&i2c_dev->msg_complete)) {
+				s64 delta = ktime_ms_delta(ktimeout, ktime);
+
+				return msecs_to_jiffies(delta) ?: 1;
+			}
+		}
+
+		ktime = ktime_get();
+
+	} while (ktime_before(ktime, ktimeout));
+
+	return 0;
+}
+
+static unsigned long
+tegra_i2c_wait_msg_completion_timeout(struct tegra_i2c_dev *i2c_dev,
+				      unsigned int timeout_ms)
+{
+	if (i2c_dev->is_curr_atomic_xfer)
+		return tegra_i2c_poll_completion_timeout(i2c_dev, timeout_ms);
+
+	return wait_for_completion_timeout(&i2c_dev->msg_complete,
+					   msecs_to_jiffies(timeout_ms));
+}
+
 static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
@@ -1020,8 +1061,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
 	tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
-	time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
-						msecs_to_jiffies(50));
+	time_left = tegra_i2c_wait_msg_completion_timeout(i2c_dev, 50);
 	if (time_left == 0) {
 		dev_err(i2c_dev->dev, "timed out for bus clear\n");
 		return -ETIMEDOUT;
@@ -1066,7 +1106,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
 	i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_MAX_LEN) &&
-				    i2c_dev->dma_buf;
+				    i2c_dev->dma_buf &&
+				    !i2c_dev->is_curr_atomic_xfer;
 	tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
 	dma = i2c_dev->is_curr_dma_xfer;
 	/*
@@ -1202,8 +1243,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 					      i2c_dev->tx_dma_chan);
 	}
 
-	time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
-						msecs_to_jiffies(xfer_time));
+	time_left = tegra_i2c_wait_msg_completion_timeout(i2c_dev, xfer_time);
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
 	if (time_left == 0) {
@@ -1270,6 +1310,45 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 	return ret ?: i;
 }
 
+static int tegra_i2c_xfer_atomic(struct i2c_adapter *adap,
+				 struct i2c_msg msgs[], int num)
+{
+	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
+	int ret;
+
+	i2c_dev->is_curr_atomic_xfer = true;
+
+	/* sanity check that shouldn't fail ever */
+	WARN_ON_ONCE(i2c_dev->irq_disabled);
+
+	/*
+	 * Hardware interrupt could be handled by a sibling CPU core,
+	 * while interrupts are disabled only for the current CPU. Thus
+	 * I2C interrupt needs to be disabled globally in order to avoid
+	 * interrupt-handler clashes.
+	 */
+	if (!i2c_dev->irq_disabled) {
+		disable_irq_nosync(i2c_dev->irq);
+		i2c_dev->irq_disabled = true;
+	}
+
+	ret = tegra_i2c_xfer(adap, msgs, num);
+
+	/*
+	 * Interrupt will be enabled after hardware reset which happens in
+	 * a case of transfer failure. For successful transfers interrupt
+	 * needs to be re-enabled.
+	 */
+	if (i2c_dev->irq_disabled) {
+		enable_irq(i2c_dev->irq);
+		i2c_dev->irq_disabled = false;
+	}
+
+	i2c_dev->is_curr_atomic_xfer = false;
+
+	return ret;
+}
+
 static u32 tegra_i2c_func(struct i2c_adapter *adap)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
@@ -1297,8 +1376,9 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 }
 
 static const struct i2c_algorithm tegra_i2c_algo = {
-	.master_xfer	= tegra_i2c_xfer,
-	.functionality	= tegra_i2c_func,
+	.master_xfer		= tegra_i2c_xfer,
+	.master_xfer_atomic	= tegra_i2c_xfer_atomic,
+	.functionality		= tegra_i2c_func,
 };
 
 /* payload size is only 12 bit */
@@ -1607,6 +1687,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		goto unprepare_fast_clk;
 	}
 
+	pm_runtime_irq_safe(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	if (!pm_runtime_enabled(&pdev->dev))
 		ret = tegra_i2c_runtime_resume(&pdev->dev);
-- 
2.24.0

