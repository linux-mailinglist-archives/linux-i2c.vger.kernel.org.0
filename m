Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEA8A3B3C2F
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jun 2021 07:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233197AbhFYFZM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Jun 2021 01:25:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:46436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233181AbhFYFZJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 25 Jun 2021 01:25:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A942E61421;
        Fri, 25 Jun 2021 05:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624598569;
        bh=8Wcq/ry0jthB/53LTJCYPtzMhVIL/Gc7Ld88MISTXf0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SoFREMkKVI5ZHbVYDVr0n4VC4nqdK0donk/am01UvBRXqV6itpfwKLmBSy3dVWuBV
         yz9cUV68+5RKMy+zIBHlW+9ygDExUQoJQsuK6t4I87lBfJUoquWl3M94etpURJAZ84
         NXQG991BQqkeEtwSMRr6IyeiaEthx9UzARE7LZlj2GezQk52EnxONwjBnlWpUL8xr8
         16gzsbGmJyLWmHEEuPHFsyjTAcQ/YITqZZeMInMUVPq7PHbbbLvUs4t/eLyLvl/Qhe
         PIcOxXwAGCvVkgrcUxpTRdc1GS4lGMvDAOjylQ6cdbt/U+sbPh8yx3hdsr6tZUztm5
         IpMcmF6jwv5CQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] i2c: qcom-geni: Add support for GPI DMA
Date:   Fri, 25 Jun 2021 10:52:13 +0530
Message-Id: <20210625052213.32260-6-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625052213.32260-1-vkoul@kernel.org>
References: <20210625052213.32260-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This adds capability to use GSI DMA for I2C transfers

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 309 ++++++++++++++++++++++++++++-
 1 file changed, 301 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 07b710a774df..839802f04b75 100644
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
@@ -89,6 +98,17 @@ struct geni_i2c_dev {
 	void *dma_buf;
 	size_t xfer_len;
 	dma_addr_t dma_addr;
+	struct dma_chan *tx_c;
+	struct dma_chan *rx_c;
+	dma_cookie_t rx_cookie, tx_cookie;
+	dma_addr_t tx_addr;
+	dma_addr_t rx_addr;
+	bool cfg_sent;
+	struct dma_async_tx_descriptor *tx_desc;
+	struct dma_async_tx_descriptor *rx_desc;
+	void *tx_buf;
+	void *rx_buf;
+	enum i2c_se_mode se_mode;
 };
 
 struct geni_i2c_err_log {
@@ -456,6 +476,213 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
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
+static void geni_i2c_gpi_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg *msg)
+{
+	if (gi2c->tx_buf) {
+		dma_unmap_single(gi2c->se.dev->parent, gi2c->tx_addr, msg->len, DMA_TO_DEVICE);
+		i2c_put_dma_safe_msg_buf(gi2c->tx_buf, msg, false);
+		gi2c->tx_buf = NULL;
+	}
+
+	if (gi2c->rx_buf) {
+		dma_unmap_single(gi2c->se.dev->parent, gi2c->rx_addr, msg->len, DMA_FROM_DEVICE);
+		i2c_put_dma_safe_msg_buf(gi2c->rx_buf, msg, false);
+		gi2c->rx_buf = NULL;
+	}
+}
+
+static int geni_i2c_gpi_rx(struct geni_i2c_dev *gi2c,
+			   struct i2c_msg *msg, struct dma_slave_config *config)
+{
+	struct gpi_i2c_config *peripheral;
+	unsigned int flags;
+	void *dma_buf;
+	int ret;
+
+	peripheral = config->peripheral_config;
+
+	dma_buf = i2c_get_dma_safe_msg_buf(msg, 1);
+	if (!dma_buf)
+		return -ENOMEM;
+
+	gi2c->rx_addr = dma_map_single(gi2c->se.dev->parent, dma_buf, msg->len, DMA_FROM_DEVICE);
+	if (dma_mapping_error(gi2c->se.dev->parent, gi2c->rx_addr)) {
+		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
+		return -ENOMEM;
+	}
+
+	peripheral->rx_len = msg->len;
+	peripheral->op = I2C_READ;
+
+	ret = dmaengine_slave_config(gi2c->rx_c, config);
+	if (ret) {
+		dev_err(gi2c->se.dev, "rx dma config error:%d\n", ret);
+		goto err_config;
+	}
+
+	peripheral->set_config =  false;
+	peripheral->multi_msg = true;
+	flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
+
+	gi2c->rx_desc = dmaengine_prep_slave_single(gi2c->rx_c, gi2c->rx_addr,
+						    msg->len, DMA_DEV_TO_MEM, flags);
+	if (!gi2c->rx_desc) {
+		dev_err(gi2c->se.dev, "prep_slave_sg for rx failed\n");
+		ret = -EIO;
+		goto err_config;
+	}
+
+	gi2c->rx_desc->callback_result = i2c_gsi_cb_result;
+	gi2c->rx_desc->callback_param = gi2c;
+	gi2c->rx_buf = dma_buf;
+
+	return 0;
+
+err_config:
+	dma_unmap_single(gi2c->se.dev->parent, gi2c->rx_addr, msg->len, DMA_FROM_DEVICE);
+	i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
+	return ret;
+}
+
+static int geni_i2c_gpi_tx(struct geni_i2c_dev *gi2c,
+			   struct i2c_msg *msg, struct dma_slave_config *config)
+{
+	struct gpi_i2c_config *peripheral;
+	unsigned int flags;
+	void *dma_buf;
+	int ret;
+
+	peripheral = config->peripheral_config;
+
+	dma_buf = i2c_get_dma_safe_msg_buf(msg, 1);
+	if (!dma_buf)
+		return -ENOMEM;
+
+	gi2c->tx_addr = dma_map_single(gi2c->se.dev->parent, dma_buf, msg->len, DMA_TO_DEVICE);
+	if (dma_mapping_error(gi2c->se.dev->parent, gi2c->tx_addr)) {
+		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
+		return -ENOMEM;
+	}
+
+	peripheral->op = I2C_WRITE;
+
+	ret = dmaengine_slave_config(gi2c->tx_c, config);
+	if (ret) {
+		dev_err(gi2c->se.dev, "tx dma config error:%d\n", ret);
+		goto err_config;
+	}
+
+	peripheral->set_config =  false;
+	peripheral->multi_msg = true;
+	flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
+
+	gi2c->tx_desc = dmaengine_prep_slave_single(gi2c->tx_c, gi2c->tx_addr,
+						    msg->len, DMA_MEM_TO_DEV, flags);
+	if (!gi2c->tx_desc) {
+		dev_err(gi2c->se.dev, "prep_slave_sg for tx failed\n");
+		ret = -EIO;
+		goto err_config;
+	}
+
+	gi2c->tx_desc->callback_result = i2c_gsi_cb_result;
+	gi2c->tx_desc->callback_param = gi2c;
+	gi2c->tx_buf = dma_buf;
+
+	return 0;
+
+err_config:
+	dma_unmap_single(gi2c->se.dev->parent, gi2c->tx_addr, msg->len, DMA_FROM_DEVICE);
+	i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
+	return ret;
+}
+
+static int geni_i2c_gsi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], int num)
+{
+	struct dma_slave_config config = {};
+	struct gpi_i2c_config peripheral = {};
+	int i, ret = 0, timeout, stretch;
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
+			ret =  geni_i2c_gpi_rx(gi2c, &msgs[i], &config);
+			if (ret) {
+				dev_err(gi2c->se.dev, "Rx txn setting failed: %d\n", ret);
+				goto err;
+			}
+
+			/* Issue RX */
+			gi2c->rx_cookie = dmaengine_submit(gi2c->rx_desc);
+			dma_async_issue_pending(gi2c->rx_c);
+		}
+
+		ret =  geni_i2c_gpi_tx(gi2c, &msgs[i], &config);
+		if (ret) {
+			dev_err(gi2c->se.dev, "Tx txn setting failed: %d\n", ret);
+			goto err;
+		}
+
+		/* Issue TX */
+		gi2c->tx_cookie = dmaengine_submit(gi2c->tx_desc);
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
+		geni_i2c_gpi_unmap(gi2c, &msgs[i]);
+	}
+
+	return 0;
+
+err:
+	dmaengine_terminate_sync(gi2c->rx_c);
+	dmaengine_terminate_sync(gi2c->tx_c);
+	geni_i2c_gpi_unmap(gi2c, &msgs[i]);
+	return ret;
+}
+
 static int geni_i2c_xfer(struct i2c_adapter *adap,
 			 struct i2c_msg msgs[],
 			 int num)
@@ -475,6 +702,12 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
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
 
@@ -489,6 +722,7 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 		if (ret)
 			break;
 	}
+geni_i2c_txn_ret:
 	if (ret == 0)
 		ret = num;
 
@@ -517,11 +751,44 @@ static const struct acpi_device_id geni_i2c_acpi_match[] = {
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
+	geni_se_select_mode(&gi2c->se, GENI_GPI_DMA);
+	gi2c->tx_c = dma_request_chan(gi2c->se.dev, "tx");
+	if (IS_ERR_OR_NULL(gi2c->tx_c)) {
+		dev_err(gi2c->se.dev, "TX dma_request_slave_channel fail\n");
+		return PTR_ERR(gi2c->tx_c);
+	}
+
+	gi2c->rx_c = dma_request_chan(gi2c->se.dev, "rx");
+	if (IS_ERR_OR_NULL(gi2c->rx_c)) {
+		dev_err(gi2c->se.dev, "RX dma_request_slave_channel fail\n");
+		dma_release_channel(gi2c->tx_c);
+		gi2c->tx_c = NULL;
+		return PTR_ERR(gi2c->rx_c);
+	}
+
+	dev_dbg(gi2c->se.dev, "Grabbed GPI dma channels\n");
+	return 0;
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
 
@@ -601,16 +868,43 @@ static int geni_i2c_probe(struct platform_device *pdev)
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
@@ -621,8 +915,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
-
 	gi2c->suspended = 1;
 	pm_runtime_set_suspended(gi2c->se.dev);
 	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
@@ -645,6 +937,7 @@ static int geni_i2c_remove(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
 
+	release_gpi_dma(gi2c);
 	i2c_del_adapter(&gi2c->adap);
 	pm_runtime_disable(gi2c->se.dev);
 	return 0;
-- 
2.31.1

