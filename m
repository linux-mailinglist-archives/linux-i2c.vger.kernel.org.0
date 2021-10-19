Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09492432D9F
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Oct 2021 08:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233874AbhJSGEW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Oct 2021 02:04:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:44996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229527AbhJSGEW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Oct 2021 02:04:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B4E860EBB;
        Tue, 19 Oct 2021 06:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634623329;
        bh=s/JBgwE7ICAcIzIuVBf7nWx+Nokb08B4f6Yr/Z68D/4=;
        h=From:To:Cc:Subject:Date:From;
        b=q1MvsQbdtSZudoOehmxVfSx6KJMkG6tE3iwWyCBWkBdr3IKgJbtyq+41KA1pDwse/
         iQkJWfAUJU/WSxobrc9JpUMmHpBsQNWaJYIDjU6anhhhicEoVvBvwXnWmcy8fuukEt
         SHaJ9huG6noD0QXfNHEjhqHnoeyYbQeiBJZXEh5IcYLyyjB3ECft+jgXh7euW6khWi
         ELrkzyDsxwvpsqq8Hn+5QcbMqtIWFZ1epuE/iFWNQ8eouPyyHRrlsA08OsQpowjFFG
         S2c+/Udi1PvO7H8C+f+3Q3fGvHBZ4OPD9s0SpAzE2DsKN7a+tMeIvWa2lFjEQAprvQ
         SQkTzoe1XVsNg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] i2c: qcom-geni: Add support for GPI DMA
Date:   Tue, 19 Oct 2021 11:31:58 +0530
Message-Id: <20211019060158.1482722-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This adds capability to use GSI DMA for I2C transfers

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
Changes since v3:
 - remove separate tx and rx function for gsi dma and make a common one
 - remove global structs and use local variables instead

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 6d635a7c104c..b783d85559f5 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -3,7 +3,9 @@
 
 #include <linux/acpi.h>
 #include <linux/clk.h>
+#include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma/qcom-gpi-dma.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -48,6 +50,8 @@
 #define LOW_COUNTER_SHFT	10
 #define CYCLE_COUNTER_MSK	GENMASK(9, 0)
 
+#define I2C_PACK_EN		(BIT(0) | BIT(1))
+
 enum geni_i2c_err_code {
 	GP_IRQ0,
 	NACK,
@@ -72,6 +76,11 @@ enum geni_i2c_err_code {
 #define XFER_TIMEOUT		HZ
 #define RST_TIMEOUT		HZ
 
+enum i2c_se_mode {
+	I2C_FIFO_SE_DMA,
+	I2C_GPI_DMA,
+};
+
 struct geni_i2c_dev {
 	struct geni_se se;
 	u32 tx_wm;
@@ -89,6 +98,10 @@ struct geni_i2c_dev {
 	void *dma_buf;
 	size_t xfer_len;
 	dma_addr_t dma_addr;
+	struct dma_chan *tx_c;
+	struct dma_chan *rx_c;
+	bool cfg_sent;
+	enum i2c_se_mode se_mode;
 };
 
 struct geni_i2c_err_log {
@@ -456,6 +469,171 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	return gi2c->err;
 }
 
+static void i2c_gsi_cb_result(void *cb, const struct dmaengine_result *result)
+{
+	struct geni_i2c_dev *gi2c = cb;
+
+	if (result->result != DMA_TRANS_NOERROR) {
+		dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
+		return;
+	}
+
+	if (result->residue)
+		dev_dbg(gi2c->se.dev, "DMA xfer has pending: %d\n", result->residue);
+
+	complete(&gi2c->done);
+}
+
+static void geni_i2c_gpi_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
+			       void *tx_buf, dma_addr_t tx_addr,
+			       void *rx_buf, dma_addr_t rx_addr)
+{
+	if (tx_buf) {
+		dma_unmap_single(gi2c->se.dev->parent, tx_addr, msg->len, DMA_TO_DEVICE);
+		i2c_put_dma_safe_msg_buf(tx_buf, msg, false);
+	}
+
+	if (rx_buf) {
+		dma_unmap_single(gi2c->se.dev->parent, rx_addr, msg->len, DMA_FROM_DEVICE);
+		i2c_put_dma_safe_msg_buf(rx_buf, msg, false);
+	}
+}
+
+static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
+			   struct dma_slave_config *config, dma_addr_t *dma_addr_p,
+			   void **buf, unsigned int op, struct dma_chan *dma_chan)
+{
+	struct gpi_i2c_config *peripheral;
+	unsigned int flags;
+	void *dma_buf = &buf;
+	dma_addr_t addr;
+	enum dma_data_direction map_dirn;
+	enum dma_transfer_direction dma_dirn;
+	struct dma_async_tx_descriptor *desc;
+	int ret;
+
+	peripheral = config->peripheral_config;
+
+	dma_buf = i2c_get_dma_safe_msg_buf(msg, 1);
+	if (!dma_buf)
+		return -ENOMEM;
+
+	if (op == I2C_WRITE)
+		map_dirn = DMA_TO_DEVICE;
+	else
+		map_dirn = DMA_FROM_DEVICE;
+
+	addr = dma_map_single(gi2c->se.dev->parent, dma_buf, msg->len, map_dirn);
+	if (dma_mapping_error(gi2c->se.dev->parent, addr)) {
+		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
+		return -ENOMEM;
+	}
+
+	peripheral->rx_len = msg->len;
+	peripheral->op = op;
+
+	ret = dmaengine_slave_config(dma_chan, config);
+	if (ret) {
+		dev_err(gi2c->se.dev, "dma config error: %d for op:%d\n", ret, op);
+		goto err_config;
+	}
+
+	peripheral->set_config =  false;
+	peripheral->multi_msg = true;
+	flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
+
+	if (op == I2C_WRITE)
+		dma_dirn = DMA_MEM_TO_DEV;
+	else
+		dma_dirn = DMA_DEV_TO_MEM;
+
+	desc = dmaengine_prep_slave_single(dma_chan, addr, msg->len, dma_dirn, flags);
+	if (!desc) {
+		dev_err(gi2c->se.dev, "prep_slave_sg failed\n");
+		ret = -EIO;
+		goto err_config;
+	}
+
+	desc->callback_result = i2c_gsi_cb_result;
+	desc->callback_param = gi2c;
+
+	dmaengine_submit(desc);
+	*dma_addr_p = addr;
+
+	return 0;
+
+err_config:
+	dma_unmap_single(gi2c->se.dev->parent, addr, msg->len, map_dirn);
+	i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
+	return ret;
+}
+
+static int geni_i2c_gsi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], int num)
+{
+	struct dma_slave_config config = {};
+	struct gpi_i2c_config peripheral = {};
+	int i, ret = 0, timeout, stretch;
+	dma_addr_t tx_addr, rx_addr;
+	void *tx_buf = NULL, *rx_buf = NULL;
+
+	config.peripheral_config = &peripheral;
+	config.peripheral_size = sizeof(peripheral);
+
+	if (!gi2c->cfg_sent) {
+		const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
+
+		gi2c->cfg_sent = true;
+		peripheral.pack_enable = I2C_PACK_EN;
+		peripheral.cycle_count = itr->t_cycle_cnt;
+		peripheral.high_count = itr->t_high_cnt;
+		peripheral.low_count = itr->t_low_cnt;
+		peripheral.clk_div = itr->clk_div;
+		peripheral.set_config =  true;
+	}
+	peripheral.multi_msg = false;
+
+	for (i = 0; i < num; i++) {
+		gi2c->cur = &msgs[i];
+		dev_dbg(gi2c->se.dev, "msg[%d].len:%d\n", i, gi2c->cur->len);
+
+		stretch = (i < (num - 1));
+		peripheral.addr = msgs[i].addr;
+		peripheral.stretch = stretch;
+
+		if (msgs[i].flags & I2C_M_RD) {
+			ret =  geni_i2c_gpi(gi2c, &msgs[i], &config, &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
+			if (ret)
+				goto err;
+		}
+
+		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config, &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
+		if (ret)
+			goto err;
+
+		if (msgs[i].flags & I2C_M_RD)
+			dma_async_issue_pending(gi2c->rx_c);
+		dma_async_issue_pending(gi2c->tx_c);
+
+		timeout = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+		if (!timeout) {
+			dev_err(gi2c->se.dev, "I2C timeout gsi flags:%d addr:0x%x\n",
+				gi2c->cur->flags, gi2c->cur->addr);
+			gi2c->err = -ETIMEDOUT;
+			goto err;
+		}
+
+		geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
+	}
+
+	return 0;
+
+err:
+	dmaengine_terminate_sync(gi2c->rx_c);
+	dmaengine_terminate_sync(gi2c->tx_c);
+	geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
+	return ret;
+}
+
 static int geni_i2c_xfer(struct i2c_adapter *adap,
 			 struct i2c_msg msgs[],
 			 int num)
@@ -475,6 +653,12 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 	}
 
 	qcom_geni_i2c_conf(gi2c);
+
+	if (gi2c->se_mode == I2C_GPI_DMA) {
+		ret = geni_i2c_gsi_xfer(gi2c, msgs, num);
+		goto geni_i2c_txn_ret;
+	}
+
 	for (i = 0; i < num; i++) {
 		u32 m_param = i < (num - 1) ? STOP_STRETCH : 0;
 
@@ -489,6 +673,7 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 		if (ret)
 			break;
 	}
+geni_i2c_txn_ret:
 	if (ret == 0)
 		ret = num;
 
@@ -517,11 +702,49 @@ static const struct acpi_device_id geni_i2c_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
 #endif
 
+static void release_gpi_dma(struct geni_i2c_dev *gi2c)
+{
+	if (gi2c->rx_c) {
+		dma_release_channel(gi2c->rx_c);
+		gi2c->rx_c = NULL;
+	}
+	if (gi2c->tx_c) {
+		dma_release_channel(gi2c->tx_c);
+		gi2c->tx_c = NULL;
+	}
+}
+
+static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
+{
+	int ret;
+
+	geni_se_select_mode(&gi2c->se, GENI_GPI_DMA);
+	gi2c->tx_c = dma_request_chan(gi2c->se.dev, "tx");
+	ret = dev_err_probe(gi2c->se.dev, IS_ERR(gi2c->tx_c), "Failed to get tx DMA ch\n");
+	if (ret < 0)
+		goto err_tx;
+
+	gi2c->rx_c = dma_request_chan(gi2c->se.dev, "rx");
+	ret = dev_err_probe(gi2c->se.dev, IS_ERR(gi2c->rx_c), "Failed to get rx DMA ch\n");
+	if (ret < 0)
+		goto err_rx;
+
+	dev_dbg(gi2c->se.dev, "Grabbed GPI dma channels\n");
+	return 0;
+
+err_rx:
+	dma_release_channel(gi2c->tx_c);
+	gi2c->tx_c = NULL;
+err_tx:
+	gi2c->rx_c = NULL;
+	return ret;
+}
+
 static int geni_i2c_probe(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c;
 	struct resource *res;
-	u32 proto, tx_depth;
+	u32 proto, tx_depth, fifo_disable;
 	int ret;
 	struct device *dev = &pdev->dev;
 
@@ -601,27 +824,52 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 	proto = geni_se_read_proto(&gi2c->se);
-	tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
 	if (proto != GENI_SE_I2C) {
 		dev_err(dev, "Invalid proto %d\n", proto);
 		geni_se_resources_off(&gi2c->se);
 		return -ENXIO;
 	}
-	gi2c->tx_wm = tx_depth - 1;
-	geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
-	geni_se_config_packing(&gi2c->se, BITS_PER_BYTE, PACKING_BYTES_PW,
-							true, true, true);
+
+	fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
+
+	switch (fifo_disable) {
+	case 1:
+		ret = setup_gpi_dma(gi2c);
+		if (!ret) { /* success case */
+			gi2c->se_mode = I2C_GPI_DMA;
+			geni_se_select_mode(&gi2c->se, GENI_GPI_DMA);
+			dev_dbg(dev, "Using GPI DMA mode for I2C\n");
+			break;
+		}
+		/*
+		 * in case of failure to get dma channel, we can till do the
+		 * FIFO mode, so fallthrough
+		 */
+		dev_warn(dev, "FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode\n");
+		fallthrough;
+
+	case 0:
+		gi2c->se_mode = I2C_FIFO_SE_DMA;
+		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
+		gi2c->tx_wm = tx_depth - 1;
+		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
+		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
+				       PACKING_BYTES_PW, true, true, true);
+
+		dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
+
+		break;
+	}
+
 	ret = geni_se_resources_off(&gi2c->se);
 	if (ret) {
 		dev_err(dev, "Error turning off resources %d\n", ret);
-		return ret;
+		goto err_dma;
 	}
 
 	ret = geni_icc_disable(&gi2c->se);
 	if (ret)
-		return ret;
-
-	dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
+		goto err_dma;
 
 	gi2c->suspended = 1;
 	pm_runtime_set_suspended(gi2c->se.dev);
@@ -633,18 +881,23 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(dev, "Error adding i2c adapter %d\n", ret);
 		pm_runtime_disable(gi2c->se.dev);
-		return ret;
+		goto err_dma;
 	}
 
 	dev_dbg(dev, "Geni-I2C adaptor successfully added\n");
 
 	return 0;
+
+err_dma:
+	release_gpi_dma(gi2c);
+	return ret;
 }
 
 static int geni_i2c_remove(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
 
+	release_gpi_dma(gi2c);
 	i2c_del_adapter(&gi2c->adap);
 	pm_runtime_disable(gi2c->se.dev);
 	return 0;
-- 
2.31.1

