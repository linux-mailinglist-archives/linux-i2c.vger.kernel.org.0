Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5639E2F767
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2019 08:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727280AbfE3GOT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 May 2019 02:14:19 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:16560 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbfE3GOT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 May 2019 02:14:19 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cef74b80000>; Wed, 29 May 2019 23:14:16 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 29 May 2019 23:14:16 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 29 May 2019 23:14:16 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 May
 2019 06:14:15 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 30 May 2019 06:14:16 +0000
Received: from dhcp-10-19-65-14.client.nvidia.com (Not Verified[10.19.65.14]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cef74b50006>; Wed, 29 May 2019 23:14:16 -0700
From:   Bitan Biswas <bbiswas@nvidia.com>
To:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V2] drivers: i2c: tegra: fix checkpatch defects
Date:   Wed, 29 May 2019 23:14:10 -0700
Message-ID: <1559196850-7007-1-git-send-email-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559196856; bh=lhZEYcWs+bX9dWmaxHmu6mA/ZD+CoOjYsNApVFCLG/I=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=rEchka1BT4iP8W4vjrsueifYFOERYdGmZeCJdsZMlko39rsFEj/OEhc4OOlpBj4GV
         rk2+Q1gxhs31QGVPeu3zJMPRphAwiI0g20wohtB5FRLMzsH6EnPPF/o+pwh2OASNzp
         tZO1QITHqG71Wuu7Hs4HpkBWYHD93bqKOvfkXfeDVcgqA5EuwDG13TFn4Oe3h+6yl9
         cja7LhpGLY6oeUB0Ur7sBQnIZc3l5D0U2fuXD2qjNICSa9LoPlzSebbDFKsNwJmML2
         kq5Ycn82fWKQDdO73t2C/CwFZ1yitOuCpX3UukS/BClHbK0K8K0XTvzXtRsuLFGdG/
         v2HWQ/so4L3dA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c
except for BUG/BUG_ON checks

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 54 +++++++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index ebaa78d..59f19d3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -112,7 +112,7 @@
 #define I2C_CLKEN_OVERRIDE			0x090
 #define I2C_MST_CORE_CLKEN_OVR			BIT(0)
 
-#define I2C_CONFIG_LOAD_TIMEOUT			1000000
+#define I2C_CONFIG_LOAD_TMOUT			1000000
 
 #define I2C_MST_FIFO_CONTROL			0x0b4
 #define I2C_MST_FIFO_CONTROL_RX_FLUSH		BIT(0)
@@ -280,6 +280,7 @@ struct tegra_i2c_dev {
 	u32 bus_clk_rate;
 	u16 clk_divisor_non_hs_mode;
 	bool is_multimaster_mode;
+	/* xfer_lock: lock to serialize transfer submission and processing */
 	spinlock_t xfer_lock;
 	struct dma_chan *tx_dma_chan;
 	struct dma_chan *rx_dma_chan;
@@ -306,7 +307,7 @@ static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
  * to the I2C block inside the DVC block
  */
 static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
-	unsigned long reg)
+					unsigned long reg)
 {
 	if (i2c_dev->is_dvc)
 		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
@@ -314,7 +315,7 @@ static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
 }
 
 static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
-	unsigned long reg)
+		       unsigned long reg)
 {
 	writel(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 
@@ -329,13 +330,13 @@ static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
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
@@ -486,7 +487,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 			dev_warn(i2c_dev->dev, "timeout waiting for fifo flush\n");
 			return -ETIMEDOUT;
 		}
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 	return 0;
 }
@@ -680,10 +681,11 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
 		if (in_interrupt())
 			err = readl_poll_timeout_atomic(addr, val, val == 0,
-					1000, I2C_CONFIG_LOAD_TIMEOUT);
+							1000,
+							I2C_CONFIG_LOAD_TMOUT);
 		else
-			err = readl_poll_timeout(addr, val, val == 0,
-					1000, I2C_CONFIG_LOAD_TIMEOUT);
+			err = readl_poll_timeout(addr, val, val == 0, 1000,
+						 I2C_CONFIG_LOAD_TMOUT);
 
 		if (err) {
 			dev_warn(i2c_dev->dev,
@@ -863,11 +865,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 		}
 
 		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
-			if (i2c_dev->msg_buf_remaining)
-				tegra_i2c_fill_tx_fifo(i2c_dev);
-			else
+			if (i2c_dev->msg_buf_remaining) {
+				if (tegra_i2c_fill_tx_fifo(i2c_dev))
+					goto err;
+			} else {
 				tegra_i2c_mask_irq(i2c_dev,
 						   I2C_INT_TX_FIFO_DATA_REQ);
+			}
 		}
 	}
 
@@ -1024,7 +1028,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 }
 
 static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
-	struct i2c_msg *msg, enum msg_end_type end_state)
+			      struct i2c_msg *msg, enum msg_end_type end_state)
 {
 	u32 packet_header;
 	u32 int_mask;
@@ -1034,7 +1038,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	u32 *buffer = NULL;
 	int err = 0;
 	bool dma;
-	u16 xfer_time = 100;
+	u16 xfer_tm = 100;
 
 	tegra_i2c_flush_fifos(i2c_dev);
 
@@ -1058,7 +1062,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	 * Transfer time in mSec = Total bits / transfer rate
 	 * Total bits = 9 bits per byte (including ACK bit) + Start & stop bits
 	 */
-	xfer_time += DIV_ROUND_CLOSEST(((xfer_size * 9) + 2) * MSEC_PER_SEC,
+	xfer_tm += DIV_ROUND_CLOSEST(((xfer_size * 9) + 2) * MSEC_PER_SEC,
 					i2c_dev->bus_clk_rate);
 	spin_lock_irqsave(&i2c_dev->xfer_lock, flags);
 
@@ -1137,7 +1141,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 				goto unlock;
 			}
 		} else {
-			tegra_i2c_fill_tx_fifo(i2c_dev);
+			if (tegra_i2c_fill_tx_fifo(i2c_dev))
+				goto unlock;
 		}
 	}
 
@@ -1161,9 +1166,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		if (err)
 			return err;
 
-		time_left = wait_for_completion_timeout(
-						&i2c_dev->dma_complete,
-						msecs_to_jiffies(xfer_time));
+		time_left =
+			wait_for_completion_timeout(&i2c_dev->dma_complete,
+						    msecs_to_jiffies(xfer_tm));
 		if (time_left == 0) {
 			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
 			dmaengine_terminate_sync(i2c_dev->msg_read ?
@@ -1189,7 +1194,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	}
 
 	time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
-						msecs_to_jiffies(xfer_time));
+						msecs_to_jiffies(xfer_tm));
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
 	if (time_left == 0) {
@@ -1225,7 +1230,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 }
 
 static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
-	int num)
+			  int num)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 	int i;
@@ -1273,12 +1278,12 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 	int ret;
 
 	ret = of_property_read_u32(np, "clock-frequency",
-			&i2c_dev->bus_clk_rate);
+				   &i2c_dev->bus_clk_rate);
 	if (ret)
 		i2c_dev->bus_clk_rate = 100000; /* default clock rate */
 
 	i2c_dev->is_multimaster_mode = of_property_read_bool(np,
-			"multi-master");
+							     "multi-master");
 }
 
 static const struct i2c_algorithm tegra_i2c_algo = {
@@ -1622,7 +1627,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_request_irq(&pdev->dev, i2c_dev->irq,
-			tegra_i2c_isr, 0, dev_name(&pdev->dev), i2c_dev);
+			       tegra_i2c_isr, 0, dev_name(&pdev->dev), i2c_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
 		goto release_dma;
@@ -1691,6 +1696,7 @@ static const struct dev_pm_ops tegra_i2c_pm = {
 	SET_RUNTIME_PM_OPS(tegra_i2c_runtime_suspend, tegra_i2c_runtime_resume,
 			   NULL)
 };
+
 #define TEGRA_I2C_PM	(&tegra_i2c_pm)
 #else
 #define TEGRA_I2C_PM	NULL
-- 
2.7.4

