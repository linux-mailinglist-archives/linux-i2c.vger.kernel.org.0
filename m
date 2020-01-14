Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63522139F17
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2020 02:37:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729377AbgANBhT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jan 2020 20:37:19 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36061 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729113AbgANBg7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jan 2020 20:36:59 -0500
Received: by mail-lj1-f193.google.com with SMTP id r19so12403068ljg.3;
        Mon, 13 Jan 2020 17:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wEg0EzubUAXCuWCT88kpkwZPLStwl6zwkMUSTMzS1fA=;
        b=PhvcQS3IxG5ZtnuaUMlfMdijlg8Q022UONddoekaaeVdAUlwZW/DaGW7Ugorw55ri5
         6gcGCNlMjBBRqRba6EdSgORbcdlVBt86ZCOpFUWEeaHKW6jpJ/eIfbltW6OF+S99ESPi
         4nKHMc0auwHJSVS5XDtpXe0W/TRftNNUq9vDBB89JNjNBd1stOO4lJDVJgxdyG/qMHZf
         8E29aGzCPU5NjWokNpa+cgjQNYeG+K6G3r6kCQTvPOlsztU93N3c5nwTTaEHN0XqCQWN
         EgIF8AEy+eYIMoaybs/X/p2taf8OUaDZeLcbwulyvFFIkeJgZBEkoKYCNW8tZFylTJuV
         6hvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wEg0EzubUAXCuWCT88kpkwZPLStwl6zwkMUSTMzS1fA=;
        b=Z5yrGqkzgSBclRs90ryjXad8xWyP+F8cr/w2XlvdhAGiRepJ5C86MgUFYm/IpmeS89
         uNaGd5TfmDUoauUB4Kxmx34Ftn+QfX7DQzAW2BCp+enU9NESZR/olaxBcQwS0ebH7Cr9
         N0tPEZa/Fwel/nWKmXCLqySsyZfzzcNocVm7F/Pc/jK4FBDdvogBxMPnWw0rESK5OOyr
         V5ic0RcZIIl2Ff4rLl5Mdb72325ckbA4czSpoBjDhK3U/oQaS/iptvxVQzwjWMoQV+5g
         F7RAJBapl9/q35mwrrVWKNS418J418XIrBehBzYZ+X8MdnMz+TXK/EwDbzu3ndJcPve4
         /wag==
X-Gm-Message-State: APjAAAWorC6jdnLacK3KQnf2FBA2hQL9u/05B3a3xdDBr3bTcgJDdofN
        XU7zbPVPbzjmWM57FHYNs1I=
X-Google-Smtp-Source: APXvYqw/MmzQxArVuwXDiR6ca7PRVLT+i6u2WgVLezQqG6UG6r8hQcgy6qWoQDAx3GFay/qIjxzKSw==
X-Received: by 2002:a2e:7405:: with SMTP id p5mr11845746ljc.34.1578965817385;
        Mon, 13 Jan 2020 17:36:57 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id m189sm6427627lfd.92.2020.01.13.17.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 17:36:56 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/8] i2c: tegra: Support atomic transfers
Date:   Tue, 14 Jan 2020 04:34:38 +0300
Message-Id: <20200114013442.28448-5-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200114013442.28448-1-digetx@gmail.com>
References: <20200114013442.28448-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

System shutdown may happen with interrupts being disabled and in this case
kernel may hang if atomic transfer isn't supported by driver.

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

Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 84 ++++++++++++++++++++++++++++------
 1 file changed, 69 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 882b283e0ed7..0245fc2b5684 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -18,6 +18,7 @@
 #include <linux/iopoll.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
+#include <linux/ktime.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
@@ -247,6 +248,7 @@ struct tegra_i2c_hw_feature {
  * @dma_buf_size: DMA buffer size
  * @is_curr_dma_xfer: indicates active DMA transfer
  * @dma_complete: DMA completion notifier
+ * @is_curr_atomic_xfer: indicates active atomic transfer
  */
 struct tegra_i2c_dev {
 	struct device *dev;
@@ -275,6 +277,7 @@ struct tegra_i2c_dev {
 	unsigned int dma_buf_size;
 	bool is_curr_dma_xfer;
 	struct completion dma_complete;
+	bool is_curr_atomic_xfer;
 };
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
@@ -683,7 +686,8 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 		reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_CONFIG_LOAD);
 		addr = i2c_dev->base + reg_offset;
 		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
-		if (in_interrupt())
+
+		if (i2c_dev->is_curr_atomic_xfer)
 			err = readl_poll_timeout_atomic(addr, val, val == 0,
 							1000,
 							I2C_CONFIG_LOAD_TIMEOUT);
@@ -983,6 +987,34 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 	i2c_writel(i2c_dev, val, reg);
 }
 
+static unsigned long
+tegra_i2c_poll_completion_timeout(struct tegra_i2c_dev *i2c_dev,
+				  struct completion *complete,
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
+			if (completion_done(complete)) {
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
 static unsigned long
 tegra_i2c_wait_completion_timeout(struct tegra_i2c_dev *i2c_dev,
 				  struct completion *complete,
@@ -990,18 +1022,24 @@ tegra_i2c_wait_completion_timeout(struct tegra_i2c_dev *i2c_dev,
 {
 	unsigned long ret;
 
-	enable_irq(i2c_dev->irq);
-	ret = wait_for_completion_timeout(complete,
-					  msecs_to_jiffies(timeout_ms));
-	disable_irq(i2c_dev->irq);
+	if (i2c_dev->is_curr_atomic_xfer) {
+		ret = tegra_i2c_poll_completion_timeout(i2c_dev, complete,
+							timeout_ms);
+	} else {
+		enable_irq(i2c_dev->irq);
+		ret = wait_for_completion_timeout(complete,
+						  msecs_to_jiffies(timeout_ms));
+		disable_irq(i2c_dev->irq);
 
-	/*
-	 * There is a chance that completion may happen after IRQ
-	 * synchronization, which is done by disable_irq().
-	 */
-	if (ret == 0 && completion_done(complete)) {
-		dev_warn(i2c_dev->dev, "completion done after timeout\n");
-		ret = 1;
+		/*
+		 * There is a chance that completion may happen after IRQ
+		 * synchronization, which is done by disable_irq().
+		 */
+		if (ret == 0 && completion_done(complete)) {
+			dev_warn(i2c_dev->dev,
+				 "completion done after timeout\n");
+			ret = 1;
+		}
 	}
 
 	return ret;
@@ -1073,7 +1111,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
 	i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_MAX_LEN) &&
-				    i2c_dev->dma_buf;
+				    i2c_dev->dma_buf &&
+				    !i2c_dev->is_curr_atomic_xfer;
 	tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
 	dma = i2c_dev->is_curr_dma_xfer;
 	/*
@@ -1271,6 +1310,19 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 	return ret ?: i;
 }
 
+static int tegra_i2c_xfer_atomic(struct i2c_adapter *adap,
+				 struct i2c_msg msgs[], int num)
+{
+	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
+	int ret;
+
+	i2c_dev->is_curr_atomic_xfer = true;
+	ret = tegra_i2c_xfer(adap, msgs, num);
+	i2c_dev->is_curr_atomic_xfer = false;
+
+	return ret;
+}
+
 static u32 tegra_i2c_func(struct i2c_adapter *adap)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
@@ -1298,8 +1350,9 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 }
 
 static const struct i2c_algorithm tegra_i2c_algo = {
-	.master_xfer	= tegra_i2c_xfer,
-	.functionality	= tegra_i2c_func,
+	.master_xfer		= tegra_i2c_xfer,
+	.master_xfer_atomic	= tegra_i2c_xfer_atomic,
+	.functionality		= tegra_i2c_func,
 };
 
 /* payload size is only 12 bit */
@@ -1607,6 +1660,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		goto unprepare_fast_clk;
 	}
 
+	pm_runtime_irq_safe(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	if (!pm_runtime_enabled(&pdev->dev)) {
 		ret = tegra_i2c_runtime_resume(&pdev->dev);
-- 
2.24.0

