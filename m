Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 900EE117D6B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2019 02:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbfLJB73 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Dec 2019 20:59:29 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40542 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbfLJB73 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Dec 2019 20:59:29 -0500
Received: by mail-lj1-f194.google.com with SMTP id s22so17952532ljs.7;
        Mon, 09 Dec 2019 17:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WXjnsGwtfZqka2R7m7SW8ohrhA4KQPsG5oGGT/Eq4lE=;
        b=nGOqDbVIDsNymrvYh2TB0OljcXoFPk2skPUIFhcJ0CCsq4T4dzrf0eXLpsvQPEKiMV
         uHtc9eKl7+c4TpfptpoZLmdg95uSn5gCrwtHCFUNmFhw1LIytg33J/VCyKupyzC/b7SE
         R4lbQOsayLpXkhUv65TU9iKtGhmuv4eBqmo/VgWw9tuCIdzx6rYtAAHIXB4paGnGo4S0
         LVGNh731ZaFCgDAniLL/9f71isbFMbDWzfcQwewhCFOUFM572VVTSPsEiBIJhkKhMx4D
         3LSZnhTw/F+ltIzYio3KckVh9E7ZFEHP1/6YhNlM9Kt2CFBDtdWzSKvw+6YN7OTPnop+
         q+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WXjnsGwtfZqka2R7m7SW8ohrhA4KQPsG5oGGT/Eq4lE=;
        b=En5SAlppLenyYpsz8SaoDilhY8kefetfcoS+L9q7LPx6KIaMc2GptJqULMeFuh+nXk
         9BHNAoGodnRwSnJ69EArUcm1P1rt9T9XWltO8R5SP+RNIVCFlecyrwB3/5y06k3rCL7x
         0t+fHmyH6nAm8DJ8YVrIIG3cyH4H9bcKreOu2UP34Y9OQ/HBB3lG8CCpDHmxAoiCxAgZ
         wfd7OLbhXE2YOfpjJv2TkcahrVq/WdCnUdI7zOzQ3vWSWB6QOeTT4lOU5ldNW/BblVjS
         A2cOaKfAfnfiR5h7UpvqZw/6OVlpMN0Tl8h6hcccXpQu3qT8/ZsGRTSQ5uRrOYrJoWTW
         Zjlg==
X-Gm-Message-State: APjAAAWpOKjbJEFbCmpS6HJC2AY6cw4xJDafdfqSNRGNgovKGigs22p3
        wYATOuAzsnsMTjs8uTV05xo=
X-Google-Smtp-Source: APXvYqzXzj2axJHCfw5NsyZKOoiIpVJJDlKRN+9uTg6Fc6rDns5lO/XPi2aBSj/mp4iZpgJ/uOTngg==
X-Received: by 2002:a2e:9587:: with SMTP id w7mr18233740ljh.42.1575943166017;
        Mon, 09 Dec 2019 17:59:26 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id a24sm756856ljp.97.2019.12.09.17.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 17:59:25 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] i2c: tegra: Support atomic transfers
Date:   Tue, 10 Dec 2019 04:58:56 +0300
Message-Id: <20191210015856.5268-1-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
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
 drivers/i2c/busses/i2c-tegra.c | 87 +++++++++++++++++++++++++++++++---
 1 file changed, 80 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a98bf31d0e5c..19acf3e75605 100644
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
@@ -279,6 +280,7 @@ struct tegra_i2c_dev {
 	unsigned int dma_buf_size;
 	bool is_curr_dma_xfer;
 	struct completion dma_complete;
+	bool is_curr_atomic_xfer;
 };
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
@@ -999,6 +1001,44 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
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
@@ -1020,8 +1060,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
 	tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
-	time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
-						msecs_to_jiffies(50));
+	time_left = tegra_i2c_wait_msg_completion_timeout(i2c_dev, 50);
 	if (time_left == 0) {
 		dev_err(i2c_dev->dev, "timed out for bus clear\n");
 		return -ETIMEDOUT;
@@ -1066,7 +1105,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
 	i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_MAX_LEN) &&
-				    i2c_dev->dma_buf;
+				    i2c_dev->dma_buf &&
+				    !i2c_dev->is_curr_atomic_xfer;
 	tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
 	dma = i2c_dev->is_curr_dma_xfer;
 	/*
@@ -1202,8 +1242,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 					      i2c_dev->tx_dma_chan);
 	}
 
-	time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
-						msecs_to_jiffies(xfer_time));
+	time_left = tegra_i2c_wait_msg_completion_timeout(i2c_dev, xfer_time);
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
 	if (time_left == 0) {
@@ -1270,6 +1309,38 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
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
+	WARN_ON_ONCE(i2c_dev->irq_disabled);
+
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
+	 * need to be re-enabled.
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
@@ -1297,8 +1368,9 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 }
 
 static const struct i2c_algorithm tegra_i2c_algo = {
-	.master_xfer	= tegra_i2c_xfer,
-	.functionality	= tegra_i2c_func,
+	.master_xfer		= tegra_i2c_xfer,
+	.master_xfer_atomic	= tegra_i2c_xfer_atomic,
+	.functionality		= tegra_i2c_func,
 };
 
 /* payload size is only 12 bit */
@@ -1607,6 +1679,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		goto unprepare_fast_clk;
 	}
 
+	pm_runtime_irq_safe(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	if (!pm_runtime_enabled(&pdev->dev))
 		ret = tegra_i2c_runtime_resume(&pdev->dev);
-- 
2.24.0

