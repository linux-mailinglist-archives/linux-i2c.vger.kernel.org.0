Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36E8C12BF67
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2019 23:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbfL1WRZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Dec 2019 17:17:25 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34044 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbfL1WRY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Dec 2019 17:17:24 -0500
Received: by mail-lj1-f194.google.com with SMTP id z22so25176583ljg.1;
        Sat, 28 Dec 2019 14:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8PkL5bnd0pmXf+lkKaCySAWexDYLt7K2/IiWjav9yI0=;
        b=rr17o3ptdySlIAOsSTUAFPlvdeiBy6sHxiENcbpcn+8e81kTpCwI3IGkT96irGP+Ox
         IEDMlfJeaUPEgrcYbAN46SN1ZCa5mI2zIISXWUBrSuTUknAjrCfQmxhH5mmLrqZ00hI7
         gqQVGuM+eWkpGa+R62DtE17HcIXxILoL7q45jtP0zbpPGFJBH5krcr6rg1dgeUwSWg4u
         Q8v3xMYyDf0CGxz1/aYQFoU2NmAKzd6ic93bzYsTV53t9fOualOrXdHTwNU80/LYZDlZ
         lOHyjTjC/kMK+k8cg2OVS4IABfIt3HCD2848Bj1eBtJ9VYsAdXaOKO6UTDN7oCXkCNgc
         BZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8PkL5bnd0pmXf+lkKaCySAWexDYLt7K2/IiWjav9yI0=;
        b=X/JM4YeUFvSEyAtDps5ibalm2LitxITTOzxWKKiSlHt7dQhPVtmBbjpJLig8wNaMWk
         SnDITIDOOBYDHIXZh8gA5Q5iCUdIfzlNzlqN3zo2kwUWyHUkK2zGyrDmWU2bZ84xVPZY
         SG9Ie5ZUePCwO5yaUubXko19uHX5wZ+Bs13b/5b8x14rq5eG2jUfwOMf+D6uptmGZ/4N
         E48eRuz/yx7hUhrtHbbdZor8/QnNwQeSgnA+0xOiXLIcBpN19j/ZSEZEmlbJR0L/5QZ0
         pnyexNd+iiYt5yHQFdMenejkPdSNvI6QrWVhsLBT2we1b9+84qlw0XHKOJx6LWejKqjG
         DHTg==
X-Gm-Message-State: APjAAAWuUqwR8nZkPNK6rwjftxRFk+ydqsqFhc6dQwDTUh/t8IdXT3iT
        PmLhkuA+0oJ/6LVT6Uur3WA=
X-Google-Smtp-Source: APXvYqx+oQBWsr9XHvS9ZdI3Ub6LoFmOe9gRcE32B7j5yZPmQ3A+73pmuaUXmO1Yxakku2E8/LT7gg==
X-Received: by 2002:a2e:800b:: with SMTP id j11mr29205171ljg.126.1577571441808;
        Sat, 28 Dec 2019 14:17:21 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id y10sm15209584ljm.93.2019.12.28.14.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2019 14:17:21 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] i2c: tegra: Prevent interrupt triggering after transfer timeout
Date:   Sun, 29 Dec 2019 01:16:51 +0300
Message-Id: <20191228221654.28842-4-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191228221654.28842-1-digetx@gmail.com>
References: <20191228221654.28842-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Potentially it is possible that interrupt may fire after transfer timeout.
That may not end up well for the next transfer because interrupt handling
may race with hardware resetting.

This is very unlikely to happen in practice, but anyway let's prevent the
potential problem by enabling interrupt only at the moments when it is
actually necessary to get some interrupt event.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 69 +++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 35 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 61339c665ebd..3016fd3eb064 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -16,6 +16,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -230,7 +231,6 @@ struct tegra_i2c_hw_feature {
  * @base_phys: physical base address of the I2C controller
  * @cont_id: I2C controller ID, used for packet header
  * @irq: IRQ number of transfer complete interrupt
- * @irq_disabled: used to track whether or not the interrupt is enabled
  * @is_dvc: identifies the DVC I2C controller, has a different register layout
  * @msg_complete: transfer completion notifier
  * @msg_err: error code for completed message
@@ -240,7 +240,6 @@ struct tegra_i2c_hw_feature {
  * @bus_clk_rate: current I2C bus clock rate
  * @clk_divisor_non_hs_mode: clock divider for non-high-speed modes
  * @is_multimaster_mode: track if I2C controller is in multi-master mode
- * @xfer_lock: lock to serialize transfer submission and processing
  * @tx_dma_chan: DMA transmit channel
  * @rx_dma_chan: DMA receive channel
  * @dma_phys: handle to DMA resources
@@ -260,7 +259,6 @@ struct tegra_i2c_dev {
 	phys_addr_t base_phys;
 	int cont_id;
 	int irq;
-	bool irq_disabled;
 	int is_dvc;
 	struct completion msg_complete;
 	int msg_err;
@@ -270,8 +268,6 @@ struct tegra_i2c_dev {
 	u32 bus_clk_rate;
 	u16 clk_divisor_non_hs_mode;
 	bool is_multimaster_mode;
-	/* xfer_lock: lock to serialize transfer submission and processing */
-	spinlock_t xfer_lock;
 	struct dma_chan *tx_dma_chan;
 	struct dma_chan *rx_dma_chan;
 	dma_addr_t dma_phys;
@@ -790,11 +786,6 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 	if (err)
 		return err;
 
-	if (i2c_dev->irq_disabled) {
-		i2c_dev->irq_disabled = false;
-		enable_irq(i2c_dev->irq);
-	}
-
 	return 0;
 }
 
@@ -825,18 +816,12 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 
 	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
-	spin_lock(&i2c_dev->xfer_lock);
 	if (status == 0) {
 		dev_warn(i2c_dev->dev, "irq status 0 %08x %08x %08x\n",
 			 i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS),
 			 i2c_readl(i2c_dev, I2C_STATUS),
 			 i2c_readl(i2c_dev, I2C_CNFG));
 		i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
-
-		if (!i2c_dev->irq_disabled) {
-			disable_irq_nosync(i2c_dev->irq);
-			i2c_dev->irq_disabled = true;
-		}
 		goto err;
 	}
 
@@ -925,7 +910,6 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 
 	complete(&i2c_dev->msg_complete);
 done:
-	spin_unlock(&i2c_dev->xfer_lock);
 	return IRQ_HANDLED;
 }
 
@@ -999,6 +983,21 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 	i2c_writel(i2c_dev, val, reg);
 }
 
+static unsigned long
+tegra_i2c_wait_completion_timeout(struct tegra_i2c_dev *i2c_dev,
+				  struct completion *complete,
+				  unsigned int timeout_ms)
+{
+	unsigned long timeout = msecs_to_jiffies(timeout_ms);
+	unsigned long ret;
+
+	enable_irq(i2c_dev->irq);
+	ret = wait_for_completion_timeout(complete, timeout);
+	disable_irq(i2c_dev->irq);
+
+	return ret;
+}
+
 static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
@@ -1020,8 +1019,8 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
 	tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
-	time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
-						msecs_to_jiffies(50));
+	time_left = tegra_i2c_wait_completion_timeout(
+			i2c_dev, &i2c_dev->msg_complete, 50);
 	if (time_left == 0) {
 		dev_err(i2c_dev->dev, "timed out for bus clear\n");
 		return -ETIMEDOUT;
@@ -1044,7 +1043,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	u32 packet_header;
 	u32 int_mask;
 	unsigned long time_left;
-	unsigned long flags;
 	size_t xfer_size;
 	u32 *buffer = NULL;
 	int err = 0;
@@ -1075,7 +1073,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	 */
 	xfer_time += DIV_ROUND_CLOSEST(((xfer_size * 9) + 2) * MSEC_PER_SEC,
 					i2c_dev->bus_clk_rate);
-	spin_lock_irqsave(&i2c_dev->xfer_lock, flags);
 
 	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
@@ -1090,7 +1087,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 				dev_err(i2c_dev->dev,
 					"starting RX DMA failed, err %d\n",
 					err);
-				goto unlock;
+				return err;
 			}
 
 		} else {
@@ -1149,7 +1146,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 				dev_err(i2c_dev->dev,
 					"starting TX DMA failed, err %d\n",
 					err);
-				goto unlock;
+				return err;
 			}
 		} else {
 			tegra_i2c_fill_tx_fifo(i2c_dev);
@@ -1169,15 +1166,10 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	dev_dbg(i2c_dev->dev, "unmasked irq: %02x\n",
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
-unlock:
-	spin_unlock_irqrestore(&i2c_dev->xfer_lock, flags);
-
 	if (dma) {
-		if (err)
-			return err;
+		time_left = tegra_i2c_wait_completion_timeout(
+				i2c_dev, &i2c_dev->dma_complete, xfer_time);
 
-		time_left = wait_for_completion_timeout(&i2c_dev->dma_complete,
-							msecs_to_jiffies(xfer_time));
 		if (time_left == 0) {
 			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
 			dmaengine_terminate_sync(i2c_dev->msg_read ?
@@ -1202,15 +1194,21 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 					      i2c_dev->tx_dma_chan);
 	}
 
-	time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
-						msecs_to_jiffies(xfer_time));
+	time_left = tegra_i2c_wait_completion_timeout(
+			i2c_dev, &i2c_dev->msg_complete, xfer_time);
+
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
 	if (time_left == 0) {
 		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
 
-		tegra_i2c_init(i2c_dev, true);
-		return -ETIMEDOUT;
+		if (completion_done(&i2c_dev->msg_complete)) {
+			dev_err(i2c_dev->dev,
+				"i2c transfer completed after time out\n");
+		} else {
+			tegra_i2c_init(i2c_dev, true);
+			return -ETIMEDOUT;
+		}
 	}
 
 	dev_dbg(i2c_dev->dev, "transfer complete: %lu %d %d\n",
@@ -1568,7 +1566,6 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 				I2C_PACKET_HEADER_SIZE;
 	init_completion(&i2c_dev->msg_complete);
 	init_completion(&i2c_dev->dma_complete);
-	spin_lock_init(&i2c_dev->xfer_lock);
 
 	if (!i2c_dev->hw->has_single_clk_source) {
 		fast_clk = devm_clk_get(&pdev->dev, "fast-clk");
@@ -1644,6 +1641,8 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		goto release_dma;
 	}
 
+	irq_set_status_flags(i2c_dev->irq, IRQ_NOAUTOEN);
+
 	ret = devm_request_irq(&pdev->dev, i2c_dev->irq,
 			       tegra_i2c_isr, 0, dev_name(&pdev->dev), i2c_dev);
 	if (ret) {
-- 
2.24.0

