Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7A0136D66
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 09:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbfFFHfb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 03:35:31 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:18250 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFHfb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jun 2019 03:35:31 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf8c2330000>; Thu, 06 Jun 2019 00:35:15 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 06 Jun 2019 00:35:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 06 Jun 2019 00:35:30 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Jun
 2019 07:35:29 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 6 Jun 2019 07:35:29 +0000
Received: from dhcp-10-19-65-14.client.nvidia.com (Not Verified[10.19.65.14]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cf8c23f0001>; Thu, 06 Jun 2019 00:35:29 -0700
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
Subject: [PATCH V4] drivers: i2c: tegra: fix checkpatch defects
Date:   Thu, 6 Jun 2019 00:35:23 -0700
Message-ID: <1559806523-1352-1-git-send-email-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559806515; bh=xTS/y7J4+etuub23p/riej8BKRgkyM8NNzohK1IwmBg=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=X0hEAkf3JMvnuCGe09b0RzM08uojqidK5pA7rj2TXQl89nbaqGlAsKHa9LJmRusmk
         g/VcriU536GHbdbRnflaNEBqCU6ejogDv6q70oFkwhU8vDSp0RuM+bwLD0SPM8GExU
         cfCxHoa3KvgKz42h4PiJZefXUyoJ2JEiX5j7W5HpuPRNceebugSEMbne2wNgLJFyA2
         Ig6hafDerZJWWvGAv24H7P/U9QWlzDN7u0Wh+9xjpETPyf8gObazJoPDua35oMissG
         rf/1xXXRafr8NF9Wq1wduXWl/xoqWy9lcq5Jzn/TrVIodGtg0pEhESBV08FKab22SA
         nKR32OTtUGr2Q==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c

Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
as needed. Replace BUG() with error handling code.
Define I2C_ERR_UNEXPECTED_STATUS for error handling.

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 67 +++++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 76b7926..55a5d87 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -78,6 +78,7 @@
 #define I2C_ERR_NO_ACK				0x01
 #define I2C_ERR_ARBITRATION_LOST		0x02
 #define I2C_ERR_UNKNOWN_INTERRUPT		0x04
+#define I2C_ERR_UNEXPECTED_STATUS               0x08
 
 #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
 #define PACKET_HEADER0_PACKET_ID_SHIFT		16
@@ -112,7 +113,7 @@
 #define I2C_CLKEN_OVERRIDE			0x090
 #define I2C_MST_CORE_CLKEN_OVR			BIT(0)
 
-#define I2C_CONFIG_LOAD_TIMEOUT			1000000
+#define I2C_CONFIG_LOAD_TMOUT			1000000
 
 #define I2C_MST_FIFO_CONTROL			0x0b4
 #define I2C_MST_FIFO_CONTROL_RX_FLUSH		BIT(0)
@@ -280,6 +281,7 @@ struct tegra_i2c_dev {
 	u32 bus_clk_rate;
 	u16 clk_divisor_non_hs_mode;
 	bool is_multimaster_mode;
+	/* xfer_lock: lock to serialize transfer submission and processing */
 	spinlock_t xfer_lock;
 	struct dma_chan *tx_dma_chan;
 	struct dma_chan *rx_dma_chan;
@@ -306,7 +308,7 @@ static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
  * to the I2C block inside the DVC block
  */
 static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
-	unsigned long reg)
+					unsigned long reg)
 {
 	if (i2c_dev->is_dvc)
 		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
@@ -314,7 +316,7 @@ static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
 }
 
 static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
-	unsigned long reg)
+		       unsigned long reg)
 {
 	writel(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 
@@ -329,13 +331,13 @@ static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
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
@@ -486,7 +488,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 			dev_warn(i2c_dev->dev, "timeout waiting for fifo flush\n");
 			return -ETIMEDOUT;
 		}
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 	return 0;
 }
@@ -525,7 +527,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 	 * prevent overwriting past the end of buf
 	 */
 	if (rx_fifo_avail > 0 && buf_remaining > 0) {
-		BUG_ON(buf_remaining > 3);
 		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
 		val = cpu_to_le32(val);
 		memcpy(buf, &val, buf_remaining);
@@ -533,7 +534,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 		rx_fifo_avail--;
 	}
 
-	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
 	i2c_dev->msg_buf_remaining = buf_remaining;
 	i2c_dev->msg_buf = buf;
 
@@ -591,7 +591,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 	 * boundary and fault.
 	 */
 	if (tx_fifo_avail > 0 && buf_remaining > 0) {
-		BUG_ON(buf_remaining > 3);
 		memcpy(&val, buf, buf_remaining);
 		val = le32_to_cpu(val);
 
@@ -680,10 +679,11 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
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
@@ -858,16 +858,21 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
 			if (i2c_dev->msg_buf_remaining)
 				tegra_i2c_empty_rx_fifo(i2c_dev);
-			else
-				BUG();
+			else {
+				dev_err(i2c_dev->dev, "unexpected rx data request\n");
+				i2c_dev->msg_err |= I2C_ERR_UNEXPECTED_STATUS;
+				goto err;
+			}
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
 
@@ -885,7 +890,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
 		if (i2c_dev->is_curr_dma_xfer)
 			i2c_dev->msg_buf_remaining = 0;
-		BUG_ON(i2c_dev->msg_buf_remaining);
+		WARN_ON_ONCE(i2c_dev->msg_buf_remaining);
 		complete(&i2c_dev->msg_complete);
 	}
 	goto done;
@@ -1024,7 +1029,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 }
 
 static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
-	struct i2c_msg *msg, enum msg_end_type end_state)
+			      struct i2c_msg *msg, enum msg_end_type end_state)
 {
 	u32 packet_header;
 	u32 int_mask;
@@ -1034,7 +1039,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	u32 *buffer = NULL;
 	int err = 0;
 	bool dma;
-	u16 xfer_time = 100;
+	u16 xfer_tm = 100;
 
 	tegra_i2c_flush_fifos(i2c_dev);
 
@@ -1058,7 +1063,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	 * Transfer time in mSec = Total bits / transfer rate
 	 * Total bits = 9 bits per byte (including ACK bit) + Start & stop bits
 	 */
-	xfer_time += DIV_ROUND_CLOSEST(((xfer_size * 9) + 2) * MSEC_PER_SEC,
+	xfer_tm += DIV_ROUND_CLOSEST(((xfer_size * 9) + 2) * MSEC_PER_SEC,
 					i2c_dev->bus_clk_rate);
 	spin_lock_irqsave(&i2c_dev->xfer_lock, flags);
 
@@ -1137,7 +1142,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 				goto unlock;
 			}
 		} else {
-			tegra_i2c_fill_tx_fifo(i2c_dev);
+			if (tegra_i2c_fill_tx_fifo(i2c_dev))
+				goto unlock;
 		}
 	}
 
@@ -1161,9 +1167,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
@@ -1189,7 +1195,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	}
 
 	time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
-						msecs_to_jiffies(xfer_time));
+						msecs_to_jiffies(xfer_tm));
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
 	if (time_left == 0) {
@@ -1225,7 +1231,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 }
 
 static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
-	int num)
+			  int num)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 	int i;
@@ -1273,12 +1279,12 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
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
@@ -1622,7 +1628,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_request_irq(&pdev->dev, i2c_dev->irq,
-			tegra_i2c_isr, 0, dev_name(&pdev->dev), i2c_dev);
+			       tegra_i2c_isr, 0, dev_name(&pdev->dev), i2c_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
 		goto release_dma;
@@ -1714,6 +1720,7 @@ static const struct dev_pm_ops tegra_i2c_pm = {
 	SET_RUNTIME_PM_OPS(tegra_i2c_runtime_suspend, tegra_i2c_runtime_resume,
 			   NULL)
 };
+
 #define TEGRA_I2C_PM	(&tegra_i2c_pm)
 #else
 #define TEGRA_I2C_PM	NULL
-- 
2.7.4

