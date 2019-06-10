Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 962E73BA61
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 19:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387750AbfFJRIx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 13:08:53 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:13196 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfFJRIx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jun 2019 13:08:53 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cfe8ea30000>; Mon, 10 Jun 2019 10:08:51 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 10 Jun 2019 10:08:50 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 10 Jun 2019 10:08:50 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Jun
 2019 17:08:50 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Jun
 2019 17:08:50 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 10 Jun 2019 17:08:50 +0000
Received: from dhcp-10-19-65-14.client.nvidia.com (Not Verified[10.19.65.14]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cfe8e9e0006>; Mon, 10 Jun 2019 10:08:49 -0700
From:   Bitan Biswas <bbiswas@nvidia.com>
To:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Osipenko <digetx@gmail.com>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>,
        "Bitan Biswas" <bbiswas@nvidia.com>
Subject: [PATCH V4 3/6] i2c: tegra: fix alignment and spacing violations
Date:   Mon, 10 Jun 2019 10:08:32 -0700
Message-ID: <1560186515-30797-3-git-send-email-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560186515-30797-1-git-send-email-bbiswas@nvidia.com>
References: <1560186515-30797-1-git-send-email-bbiswas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560186531; bh=gkVAgi883mFo4ovDrxUpbkstUJM7W+FogM1jwcRwhyY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=MBjCcYhFHXy4Y0R4fgcnHhjd0hQRX9T0JP4bLuVaToUD0IcsWQsQeJ6V/lkd5MwoD
         Pv7WmXmy0adsCCsgWbzQnyz7f2MamepYxwb78ROSYNyYU6MIzRu5Cc9rC8FKyEEClP
         OJJWBylEHnt1PXyGmMeCdkP3RIu5/ShnoebLleV5JNHpxqJ0gj7S5B8p6dPFLPQqdT
         h6nLV1g0sLM7U3CMLMa8VOFMYAnGunTHKi4KgbGQjx+GsnPKI7nYf+fVzlSuEykWMa
         q0x5Lm+mIuX4H8qBp0ik+/+UdokRVQZGbrArLEAGEQxU0Pt4Okc1fNScTbVYD+ILWj
         9XfNXguAH5U6Q==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix checkpatch.pl alignment and blank line check(s) in i2c-tegra.c

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index f7116b7..2d381de 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -295,7 +295,7 @@ static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
  * to the I2C block inside the DVC block
  */
 static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
-	unsigned long reg)
+					unsigned long reg)
 {
 	if (i2c_dev->is_dvc)
 		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
@@ -303,7 +303,7 @@ static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
 }
 
 static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
-	unsigned long reg)
+		       unsigned long reg)
 {
 	writel(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 
@@ -318,13 +318,13 @@ static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
 }
 
 static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
-	unsigned long reg, int len)
+			unsigned long reg, int len)
 {
 	writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
 }
 
 static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
-	unsigned long reg, int len)
+		       unsigned long reg, int len)
 {
 	readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
 }
@@ -669,10 +669,11 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
 		if (in_interrupt())
 			err = readl_poll_timeout_atomic(addr, val, val == 0,
-					1000, I2C_CONFIG_LOAD_TIMEOUT);
+							1000,
+							I2C_CONFIG_LOAD_TIMEOUT);
 		else
-			err = readl_poll_timeout(addr, val, val == 0,
-					1000, I2C_CONFIG_LOAD_TIMEOUT);
+			err = readl_poll_timeout(addr, val, val == 0, 1000,
+						 I2C_CONFIG_LOAD_TIMEOUT);
 
 		if (err) {
 			dev_warn(i2c_dev->dev,
@@ -1013,7 +1014,8 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 }
 
 static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
-	struct i2c_msg *msg, enum msg_end_type end_state)
+			      struct i2c_msg *msg,
+			      enum msg_end_type end_state)
 {
 	u32 packet_header;
 	u32 int_mask;
@@ -1150,9 +1152,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		if (err)
 			return err;
 
-		time_left = wait_for_completion_timeout(
-						&i2c_dev->dma_complete,
-						msecs_to_jiffies(xfer_time));
+		time_left = wait_for_completion_timeout(&i2c_dev->dma_complete,
+							msecs_to_jiffies(xfer_time));
 		if (time_left == 0) {
 			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
 			dmaengine_terminate_sync(i2c_dev->msg_read ?
@@ -1214,7 +1215,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 }
 
 static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
-	int num)
+			  int num)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 	int i;
@@ -1260,14 +1261,15 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 {
 	struct device_node *np = i2c_dev->dev->of_node;
 	int ret;
+	bool multi_mode;
 
 	ret = of_property_read_u32(np, "clock-frequency",
-			&i2c_dev->bus_clk_rate);
+				   &i2c_dev->bus_clk_rate);
 	if (ret)
 		i2c_dev->bus_clk_rate = 100000; /* default clock rate */
 
-	i2c_dev->is_multimaster_mode = of_property_read_bool(np,
-			"multi-master");
+	multi_mode = of_property_read_bool(np, "multi-master");
+	i2c_dev->is_multimaster_mode = multi_mode;
 }
 
 static const struct i2c_algorithm tegra_i2c_algo = {
@@ -1611,7 +1613,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_request_irq(&pdev->dev, i2c_dev->irq,
-			tegra_i2c_isr, 0, dev_name(&pdev->dev), i2c_dev);
+			       tegra_i2c_isr, 0, dev_name(&pdev->dev), i2c_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
 		goto release_dma;
@@ -1704,6 +1706,7 @@ static const struct dev_pm_ops tegra_i2c_pm = {
 	SET_RUNTIME_PM_OPS(tegra_i2c_runtime_suspend, tegra_i2c_runtime_resume,
 			   NULL)
 };
+
 #define TEGRA_I2C_PM	(&tegra_i2c_pm)
 #else
 #define TEGRA_I2C_PM	NULL
-- 
2.7.4

