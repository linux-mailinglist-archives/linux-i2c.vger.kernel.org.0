Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E16F2F196F
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 16:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387444AbhAKPSY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 10:18:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:54084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731411AbhAKPSX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 10:18:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31E9C22AAF;
        Mon, 11 Jan 2021 15:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610378262;
        bh=Dj4wFh5vS16qByBNkr4HY1a6D1zgNungXmamdi5kJ1E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=loYNRs4XdluA7qvIhaXmWzCfbZ3ueVd9DFq5fHVJrzOBYuBmlmOQtDt69kOqmr3/m
         vJgzXfkbI0Hv1ETso+vKqOKjBrwHpiwNy9BvLv9J6Ch7tI3+a4ZpmuUW9r8Yv+RZM3
         LzE0+9H2UENmTLi81lg04Hn9FpcXiWWKcwi7DEBVE8xLCNAxf5RQL5x/wbZgGv4iUX
         wanvy5Q+116AHmqL1ah3fD1i0UmkOCTOkI3q+zNYcvDRQYlqFu2HoGh1bgGUdk8aGt
         95k9yGG/ccZm6io7pVDeVGUqKIlAQsf9FPcFVLHJbVEsqHfGlRD1xGTeF5jTUCrEb+
         T3QSwsdPw8Ltw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] spi: spi-geni-qcom: Add support for GPI dma
Date:   Mon, 11 Jan 2021 20:46:48 +0530
Message-Id: <20210111151651.1616813-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111151651.1616813-1-vkoul@kernel.org>
References: <20210111151651.1616813-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We can use GPI DMA for devices where it is enabled by firmware. Add
support for this mode

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/spi/spi-geni-qcom.c | 395 +++++++++++++++++++++++++++++++++++-
 1 file changed, 384 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 512e925d5ea4..5bb0e2192734 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -2,6 +2,8 @@
 // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
 
 #include <linux/clk.h>
+#include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/log2.h>
@@ -10,6 +12,7 @@
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/qcom-geni-se.h>
+#include <linux/dma/qcom-gpi-dma.h>
 #include <linux/spi/spi.h>
 #include <linux/spinlock.h>
 
@@ -63,6 +66,35 @@
 #define TIMESTAMP_AFTER		BIT(3)
 #define POST_CMD_DELAY		BIT(4)
 
+#define GSI_LOOPBACK_EN		(BIT(0))
+#define GSI_CS_TOGGLE		(BIT(3))
+#define GSI_CPHA		(BIT(4))
+#define GSI_CPOL		(BIT(5))
+
+#define MAX_TX_SG		(3)
+#define NUM_SPI_XFER		(8)
+#define SPI_XFER_TIMEOUT_MS	(250)
+
+struct gsi_desc_cb {
+	struct spi_geni_master *mas;
+	struct spi_transfer *xfer;
+};
+
+struct spi_geni_gsi {
+	dma_cookie_t tx_cookie;
+	dma_cookie_t rx_cookie;
+	struct dma_async_tx_descriptor *tx_desc;
+	struct dma_async_tx_descriptor *rx_desc;
+	struct gsi_desc_cb desc_cb;
+};
+
+enum spi_m_cmd_opcode {
+	CMD_NONE,
+	CMD_XFER,
+	CMD_CS,
+	CMD_CANCEL,
+};
+
 struct spi_geni_master {
 	struct geni_se se;
 	struct device *dev;
@@ -79,10 +111,21 @@ struct spi_geni_master {
 	struct completion cs_done;
 	struct completion cancel_done;
 	struct completion abort_done;
+	struct completion xfer_done;
 	unsigned int oversampling;
 	spinlock_t lock;
 	int irq;
 	bool cs_flag;
+	struct spi_geni_gsi *gsi;
+	struct dma_chan *tx;
+	struct dma_chan *rx;
+	struct completion tx_cb;
+	struct completion rx_cb;
+	bool qn_err;
+	int cur_xfer_mode;
+	int num_tx_eot;
+	int num_rx_eot;
+	int num_xfers;
 };
 
 static int get_spi_clk_cfg(unsigned int speed_hz,
@@ -274,31 +317,269 @@ static int setup_fifo_params(struct spi_device *spi_slv,
 	return geni_spi_set_clock_and_bw(mas, spi_slv->max_speed_hz);
 }
 
+static int get_xfer_mode(struct spi_master *spi)
+{
+	struct spi_geni_master *mas = spi_master_get_devdata(spi);
+	struct geni_se *se = &mas->se;
+	int mode = GENI_SE_FIFO;
+	int fifo_disable;
+	bool dma_chan_valid;
+
+	fifo_disable = readl(se->base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
+	dma_chan_valid = !(IS_ERR_OR_NULL(mas->tx) || IS_ERR_OR_NULL(mas->rx));
+
+	/*
+	 * If FIFO Interface is disabled and there are no DMA channels then we
+	 * can't do this transfer.
+	 * If FIFO interface is disabled, we can do GSI only,
+	 * else pick FIFO mode.
+	 */
+	if (fifo_disable && !dma_chan_valid) {
+		dev_err(mas->dev, "Fifo and dma mode disabled!! can't xfer\n");
+		mode = -EINVAL;
+	} else if (fifo_disable) {
+		mode = GENI_GPI_DMA;
+	} else {
+		mode = GENI_SE_FIFO;
+	}
+
+	return mode;
+}
+
+static void
+spi_gsi_callback_result(void *cb, const struct dmaengine_result *result, bool tx)
+{
+	struct gsi_desc_cb *gsi = cb;
+
+	if (result->result != DMA_TRANS_NOERROR) {
+		dev_err(gsi->mas->dev, "%s: DMA %s txn failed\n", __func__, tx ? "tx" : "rx");
+		return;
+	}
+
+	if (!result->residue) {
+		dev_dbg(gsi->mas->dev, "%s\n", __func__);
+		if (tx)
+			complete(&gsi->mas->tx_cb);
+		else
+			complete(&gsi->mas->rx_cb);
+	} else {
+		dev_err(gsi->mas->dev, "DMA xfer has pending: %d\n", result->residue);
+	}
+}
+
+static void
+spi_gsi_rx_callback_result(void *cb, const struct dmaengine_result *result)
+{
+	spi_gsi_callback_result(cb, result, false);
+}
+
+static void
+spi_gsi_tx_callback_result(void *cb, const struct dmaengine_result *result)
+{
+	spi_gsi_callback_result(cb, result, true);
+}
+
+static int setup_gsi_xfer(struct spi_transfer *xfer, struct spi_geni_master *mas,
+			  struct spi_device *spi_slv, struct spi_master *spi)
+{
+	int ret = 0;
+	unsigned long flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
+	struct spi_geni_gsi *gsi;
+	struct dma_slave_config config;
+	struct gpi_spi_config peripheral;
+
+	memset(&config, 0, sizeof(config));
+	memset(&peripheral, 0, sizeof(peripheral));
+	config.peripheral_config = &peripheral;
+	config.peripheral_size = sizeof(peripheral);
+
+	if (xfer->bits_per_word != mas->cur_bits_per_word ||
+	    xfer->speed_hz != mas->cur_speed_hz) {
+		mas->cur_bits_per_word = xfer->bits_per_word;
+		mas->cur_speed_hz = xfer->speed_hz;
+		peripheral.set_config = true;
+	}
+
+	if (!(mas->cur_bits_per_word % MIN_WORD_LEN)) {
+		peripheral.rx_len = ((xfer->len << 3) / mas->cur_bits_per_word);
+	} else {
+		int bytes_per_word = (mas->cur_bits_per_word / BITS_PER_BYTE) + 1;
+
+		peripheral.rx_len = (xfer->len / bytes_per_word);
+	}
+
+	if (xfer->tx_buf && xfer->rx_buf) {
+		peripheral.cmd = SPI_DUPLEX;
+	} else if (xfer->tx_buf) {
+		peripheral.cmd = SPI_TX;
+		peripheral.rx_len = 0;
+	} else if (xfer->rx_buf) {
+		peripheral.cmd = SPI_RX;
+	}
+
+	peripheral.cs = spi_slv->chip_select;
+
+	if (spi_slv->mode & SPI_LOOP)
+		peripheral.loopback_en = true;
+	if (spi_slv->mode & SPI_CPOL)
+		peripheral.clock_pol_high = true;
+	if (spi_slv->mode & SPI_CPHA)
+		peripheral.data_pol_high = true;
+	peripheral.pack_en = true;
+	peripheral.word_len = xfer->bits_per_word - MIN_WORD_LEN;
+	ret = get_spi_clk_cfg(mas->cur_speed_hz, mas,
+			      &peripheral.clk_src, &peripheral.clk_div);
+	if (ret) {
+		dev_err(mas->dev, "%s:Err setting clks:%d\n", __func__, ret);
+		return ret;
+	}
+
+	if (!xfer->cs_change) {
+		if (!list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers))
+			peripheral.fragmentation = FRAGMENTATION;
+	}
+
+	gsi = &mas->gsi[mas->num_xfers];
+	gsi->desc_cb.mas = mas;
+	gsi->desc_cb.xfer = xfer;
+	if (peripheral.cmd & SPI_RX) {
+		dmaengine_slave_config(mas->rx, &config);
+		gsi->rx_desc = dmaengine_prep_slave_single(mas->rx, xfer->rx_dma,
+							   xfer->len, DMA_DEV_TO_MEM, flags);
+		if (IS_ERR_OR_NULL(gsi->rx_desc)) {
+			dev_err(mas->dev, "Err setting up rx desc\n");
+			return -EIO;
+		}
+		gsi->rx_desc->callback_result = spi_gsi_rx_callback_result;
+		gsi->rx_desc->callback_param = &gsi->desc_cb;
+		mas->num_rx_eot++;
+	}
+
+	if (peripheral.cmd & SPI_TX_ONLY)
+		mas->num_tx_eot++;
+
+	dmaengine_slave_config(mas->tx, &config);
+	gsi->tx_desc = dmaengine_prep_slave_single(mas->tx, xfer->tx_dma,
+						   xfer->len, DMA_MEM_TO_DEV, flags);
+
+	if (IS_ERR_OR_NULL(gsi->tx_desc)) {
+		dev_err(mas->dev, "Err setting up tx desc\n");
+		return -EIO;
+	}
+	gsi->tx_desc->callback_result = spi_gsi_tx_callback_result;
+	gsi->tx_desc->callback_param = &gsi->desc_cb;
+	if (peripheral.cmd & SPI_RX)
+		gsi->rx_cookie = dmaengine_submit(gsi->rx_desc);
+	gsi->tx_cookie = dmaengine_submit(gsi->tx_desc);
+	if (peripheral.cmd & SPI_RX)
+		dma_async_issue_pending(mas->rx);
+	dma_async_issue_pending(mas->tx);
+	mas->num_xfers++;
+	return ret;
+}
+
+static int spi_geni_map_buf(struct spi_geni_master *mas, struct spi_message *msg)
+{
+	struct spi_transfer *xfer;
+	struct device *gsi_dev = mas->dev->parent;
+
+	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
+		if (xfer->rx_buf) {
+			xfer->rx_dma = dma_map_single(gsi_dev, xfer->rx_buf,
+						      xfer->len, DMA_FROM_DEVICE);
+			if (dma_mapping_error(mas->dev, xfer->rx_dma)) {
+				dev_err(mas->dev, "Err mapping buf\n");
+				return -ENOMEM;
+			}
+		}
+
+		if (xfer->tx_buf) {
+			xfer->tx_dma = dma_map_single(gsi_dev, (void *)xfer->tx_buf,
+						      xfer->len, DMA_TO_DEVICE);
+			if (dma_mapping_error(gsi_dev, xfer->tx_dma)) {
+				dev_err(mas->dev, "Err mapping buf\n");
+				dma_unmap_single(gsi_dev, xfer->rx_dma, xfer->len, DMA_FROM_DEVICE);
+				return -ENOMEM;
+			}
+		}
+	};
+
+	return 0;
+}
+
+static void spi_geni_unmap_buf(struct spi_geni_master *mas, struct spi_message *msg)
+{
+	struct spi_transfer *xfer;
+	struct device *gsi_dev = mas->dev;
+
+	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
+		if (xfer->rx_buf)
+			dma_unmap_single(gsi_dev, xfer->rx_dma, xfer->len, DMA_FROM_DEVICE);
+		if (xfer->tx_buf)
+			dma_unmap_single(gsi_dev, xfer->tx_dma, xfer->len, DMA_TO_DEVICE);
+	};
+}
+
 static int spi_geni_prepare_message(struct spi_master *spi,
 					struct spi_message *spi_msg)
 {
 	int ret;
 	struct spi_geni_master *mas = spi_master_get_devdata(spi);
+	struct geni_se *se = &mas->se;
+
+	mas->cur_xfer_mode = get_xfer_mode(spi);
+
+	if (mas->cur_xfer_mode == GENI_SE_FIFO) {
+		geni_se_select_mode(se, GENI_SE_FIFO);
+		reinit_completion(&mas->xfer_done);
+		ret = setup_fifo_params(spi_msg->spi, spi);
+		if (ret)
+			dev_err(mas->dev, "Couldn't select mode %d\n", ret);
+
+	} else if (mas->cur_xfer_mode == GENI_GPI_DMA) {
+		mas->num_tx_eot = 0;
+		mas->num_rx_eot = 0;
+		mas->num_xfers = 0;
+		reinit_completion(&mas->tx_cb);
+		reinit_completion(&mas->rx_cb);
+		memset(mas->gsi, 0, (sizeof(struct spi_geni_gsi) * NUM_SPI_XFER));
+		geni_se_select_mode(se, GENI_GPI_DMA);
+		ret = spi_geni_map_buf(mas, spi_msg);
+
+	} else {
+		dev_err(mas->dev, "%s: Couldn't select mode %d", __func__, mas->cur_xfer_mode);
+		ret = -EINVAL;
+	}
 
-	ret = setup_fifo_params(spi_msg->spi, spi);
-	if (ret)
-		dev_err(mas->dev, "Couldn't select mode %d\n", ret);
 	return ret;
 }
 
+static int spi_geni_unprepare_message(struct spi_master *spi_mas, struct spi_message *spi_msg)
+{
+	struct spi_geni_master *mas = spi_master_get_devdata(spi_mas);
+
+	mas->cur_speed_hz = 0;
+	mas->cur_bits_per_word = 0;
+	if (mas->cur_xfer_mode == GENI_GPI_DMA)
+		spi_geni_unmap_buf(mas, spi_msg);
+	return 0;
+}
+
 static int spi_geni_init(struct spi_geni_master *mas)
 {
 	struct geni_se *se = &mas->se;
 	unsigned int proto, major, minor, ver;
 	u32 spi_tx_cfg;
+	size_t gsi_sz;
+	int ret = 0;
 
 	pm_runtime_get_sync(mas->dev);
 
 	proto = geni_se_read_proto(se);
 	if (proto != GENI_SE_SPI) {
 		dev_err(mas->dev, "Invalid proto %d\n", proto);
-		pm_runtime_put(mas->dev);
-		return -ENXIO;
+		ret = -ENXIO;
+		goto out_pm;
 	}
 	mas->tx_fifo_depth = geni_se_get_tx_fifo_depth(se);
 
@@ -328,8 +609,34 @@ static int spi_geni_init(struct spi_geni_master *mas)
 	spi_tx_cfg &= ~CS_TOGGLE;
 	writel(spi_tx_cfg, se->base + SE_SPI_TRANS_CFG);
 
+	mas->tx = dma_request_slave_channel(mas->dev, "tx");
+	if (IS_ERR_OR_NULL(mas->tx)) {
+		dev_err(mas->dev, "Failed to get tx DMA ch %ld", PTR_ERR(mas->tx));
+		ret = PTR_ERR(mas->tx);
+		goto out_pm;
+	} else {
+		mas->rx = dma_request_slave_channel(mas->dev, "rx");
+		if (IS_ERR_OR_NULL(mas->rx)) {
+			dev_err(mas->dev, "Failed to get rx DMA ch %ld", PTR_ERR(mas->rx));
+			dma_release_channel(mas->tx);
+			ret = PTR_ERR(mas->rx);
+			goto out_pm;
+		}
+
+		gsi_sz = sizeof(struct spi_geni_gsi) * NUM_SPI_XFER;
+		mas->gsi = devm_kzalloc(mas->dev, gsi_sz, GFP_KERNEL);
+		if (IS_ERR_OR_NULL(mas->gsi)) {
+			dma_release_channel(mas->tx);
+			dma_release_channel(mas->rx);
+			mas->tx = NULL;
+			mas->rx = NULL;
+			goto out_pm;
+		}
+	}
+
+out_pm:
 	pm_runtime_put(mas->dev);
-	return 0;
+	return ret;
 }
 
 static unsigned int geni_byte_per_fifo_word(struct spi_geni_master *mas)
@@ -420,6 +727,7 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
 {
 	u32 m_cmd = 0;
 	u32 len;
+	u32 m_param = 0;
 	struct geni_se *se = &mas->se;
 	int ret;
 
@@ -457,6 +765,11 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
 		len = xfer->len / (mas->cur_bits_per_word / BITS_PER_BYTE + 1);
 	len &= TRANS_LEN_MSK;
 
+	if (!xfer->cs_change) {
+		if (!list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers))
+			m_param |= FRAGMENTATION;
+	}
+
 	mas->cur_xfer = xfer;
 	if (xfer->tx_buf) {
 		m_cmd |= SPI_TX_ONLY;
@@ -475,7 +788,7 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
 	 * interrupt could come in at any time now.
 	 */
 	spin_lock_irq(&mas->lock);
-	geni_se_setup_m_cmd(se, m_cmd, FRAGMENTATION);
+	geni_se_setup_m_cmd(se, m_cmd, m_param);
 
 	/*
 	 * TX_WATERMARK_REG should be set after SPI configuration and
@@ -494,13 +807,52 @@ static int spi_geni_transfer_one(struct spi_master *spi,
 				struct spi_transfer *xfer)
 {
 	struct spi_geni_master *mas = spi_master_get_devdata(spi);
+	unsigned long timeout, jiffies;
+	int ret = 0i, i;
 
 	/* Terminate and return success for 0 byte length transfer */
 	if (!xfer->len)
-		return 0;
+		return ret;
+
+	if (mas->cur_xfer_mode == GENI_SE_FIFO) {
+		setup_fifo_xfer(xfer, mas, slv->mode, spi);
+	} else {
+		setup_gsi_xfer(xfer, mas, slv, spi);
+		if (mas->num_xfers >= NUM_SPI_XFER ||
+		    (list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers))) {
+			for (i = 0 ; i < mas->num_tx_eot; i++) {
+				jiffies = msecs_to_jiffies(SPI_XFER_TIMEOUT_MS);
+				timeout = wait_for_completion_timeout(&mas->tx_cb, jiffies);
+				if (timeout <= 0) {
+					dev_err(mas->dev, "Tx[%d] timeout%lu\n", i, timeout);
+					ret = -ETIMEDOUT;
+					goto err_gsi_geni_transfer_one;
+				}
+				spi_finalize_current_transfer(spi);
+			}
+			for (i = 0 ; i < mas->num_rx_eot; i++) {
+				jiffies = msecs_to_jiffies(SPI_XFER_TIMEOUT_MS);
+				timeout = wait_for_completion_timeout(&mas->tx_cb, jiffies);
+				if (timeout <= 0) {
+					dev_err(mas->dev, "Rx[%d] timeout%lu\n", i, timeout);
+					ret = -ETIMEDOUT;
+					goto err_gsi_geni_transfer_one;
+				}
+				spi_finalize_current_transfer(spi);
+			}
+			if (mas->qn_err) {
+				ret = -EIO;
+				mas->qn_err = false;
+				goto err_gsi_geni_transfer_one;
+			}
+		}
+	}
 
-	setup_fifo_xfer(xfer, mas, slv->mode, spi);
-	return 1;
+	return ret;
+
+err_gsi_geni_transfer_one:
+	dmaengine_terminate_all(mas->tx);
+	return ret;
 }
 
 static irqreturn_t geni_spi_isr(int irq, void *data)
@@ -595,6 +947,15 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (ret) {
+		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+		if (ret) {
+			dev_err(&pdev->dev, "could not set DMA mask\n");
+			return ret;
+		}
+	}
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
@@ -632,15 +993,18 @@ static int spi_geni_probe(struct platform_device *pdev)
 	spi->num_chipselect = 4;
 	spi->max_speed_hz = 50000000;
 	spi->prepare_message = spi_geni_prepare_message;
+	spi->unprepare_message = spi_geni_unprepare_message;
 	spi->transfer_one = spi_geni_transfer_one;
 	spi->auto_runtime_pm = true;
 	spi->handle_err = handle_fifo_timeout;
-	spi->set_cs = spi_geni_set_cs;
 	spi->use_gpio_descriptors = true;
 
 	init_completion(&mas->cs_done);
 	init_completion(&mas->cancel_done);
 	init_completion(&mas->abort_done);
+	init_completion(&mas->xfer_done);
+	init_completion(&mas->tx_cb);
+	init_completion(&mas->rx_cb);
 	spin_lock_init(&mas->lock);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);
@@ -661,6 +1025,15 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (ret)
 		goto spi_geni_probe_runtime_disable;
 
+	/*
+	 * query the mode supported and set_cs for fifo mode only
+	 * for dma (gsi) mode, the gsi will set cs based on params passed in
+	 * TRE
+	 */
+	mas->cur_xfer_mode = get_xfer_mode(spi);
+	if (mas->cur_xfer_mode == GENI_SE_FIFO)
+		spi->set_cs = spi_geni_set_cs;
+
 	ret = request_irq(mas->irq, geni_spi_isr, 0, dev_name(dev), spi);
 	if (ret)
 		goto spi_geni_probe_runtime_disable;
-- 
2.26.2

