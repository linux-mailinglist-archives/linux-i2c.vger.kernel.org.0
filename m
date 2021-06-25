Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D9D3B3C2C
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jun 2021 07:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233176AbhFYFZH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Jun 2021 01:25:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:46396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233180AbhFYFZF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 25 Jun 2021 01:25:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C97961424;
        Fri, 25 Jun 2021 05:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624598565;
        bh=Yzpyztg2oyfb6L8hoG6V4EDp945nS3Jw82VdCGaUvbg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AOXfEiMsscmO3Q8hM9bDLvP0BuTFnF4N2hwKGfqNLLaHawW3Fqv3gXFKJLG3/Q6EW
         kduv3Z6NlPnn75HiQP1YxOav0S7u1cFQ+6Ev6B1ouVJ8SOPXS06xBR4fgO5RCS9Vkt
         Kyq7rKxs0yGRNmL1gG0I/CcUf3bRWnM5i9cctReGpl9W1dVZcepqzsgPEgkqpvpRh3
         8FQmAmTlf2qext2gXnD0BsstVPxgwbEJyb0uEAtdd4cNxpH7veKZ4GBy2SYkJzjc07
         4mh5uXTroaPJgEr8LZk3uIm6LfZPA8TIJStldIo7YFYUlu4NvPaCz6n1Cibq4Tw6Gk
         hV6O91ByBEIqQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] spi: spi-geni-qcom: Add support for GPI dma
Date:   Fri, 25 Jun 2021 10:52:12 +0530
Message-Id: <20210625052213.32260-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625052213.32260-1-vkoul@kernel.org>
References: <20210625052213.32260-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We can use GPI DMA for devices where it is enabled by firmware. Add
support for this mode

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/spi/spi-geni-qcom.c | 329 ++++++++++++++++++++++++++++++++++--
 1 file changed, 315 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 3d0d8ddd5772..c64355c246be 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -2,6 +2,9 @@
 // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
 
 #include <linux/clk.h>
+#include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
+#include <linux/dma/qcom-gpi-dma.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/log2.h>
@@ -63,6 +66,29 @@
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
+	struct gsi_desc_cb tx_cb;
+	struct gsi_desc_cb rx_cb;
+};
+
 struct spi_geni_master {
 	struct geni_se se;
 	struct device *dev;
@@ -84,6 +110,13 @@ struct spi_geni_master {
 	int irq;
 	bool cs_flag;
 	bool abort_failed;
+	struct spi_geni_gsi *gsi;
+	struct dma_chan *tx;
+	struct dma_chan *rx;
+	struct completion tx_cb;
+	struct completion rx_cb;
+	int cur_xfer_mode;
+	int num_xfers;
 };
 
 static int get_spi_clk_cfg(unsigned int speed_hz,
@@ -330,18 +363,230 @@ static int setup_fifo_params(struct spi_device *spi_slv,
 	return geni_spi_set_clock_and_bw(mas, spi_slv->max_speed_hz);
 }
 
+static void
+spi_gsi_callback_result(void *cb, const struct dmaengine_result *result, bool tx)
+{
+	struct gsi_desc_cb *gsi = cb;
+
+	if (result->result != DMA_TRANS_NOERROR) {
+		dev_err(gsi->mas->dev, "%s DMA txn failed\n", tx ? "TX" : "RX");
+		return;
+	}
+
+	if (!result->residue) {
+		if (tx)
+			complete(&gsi->mas->tx_cb);
+		else
+			complete(&gsi->mas->rx_cb);
+	} else {
+		dev_err(gsi->mas->dev, "%s DMA txn has pending %d data\n",
+			tx ? "TX" : "RX", result->residue);
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
+	unsigned long flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
+	struct spi_geni_gsi *gsi;
+	struct dma_slave_config config = {};
+	struct gpi_spi_config peripheral = {};
+	unsigned long timeout, jiffies;
+	int ret, i;
+
+	config.peripheral_config = &peripheral;
+	config.peripheral_size = sizeof(peripheral);
+	peripheral.set_config = true;
+
+	if (xfer->bits_per_word != mas->cur_bits_per_word ||
+	    xfer->speed_hz != mas->cur_speed_hz) {
+		mas->cur_bits_per_word = xfer->bits_per_word;
+		mas->cur_speed_hz = xfer->speed_hz;
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
+	if (spi_slv->mode & SPI_LOOP)
+		peripheral.loopback_en = true;
+	if (spi_slv->mode & SPI_CPOL)
+		peripheral.clock_pol_high = true;
+	if (spi_slv->mode & SPI_CPHA)
+		peripheral.data_pol_high = true;
+
+	peripheral.cs = spi_slv->chip_select;
+	peripheral.pack_en = true;
+	peripheral.word_len = xfer->bits_per_word - MIN_WORD_LEN;
+	peripheral.fragmentation = FRAGMENTATION;
+
+	ret = get_spi_clk_cfg(mas->cur_speed_hz, mas,
+			      &peripheral.clk_src, &peripheral.clk_div);
+	if (ret) {
+		dev_err(mas->dev, "Err in get_spi_clk_cfg() :%d\n", ret);
+		return ret;
+	}
+
+	gsi = &mas->gsi[mas->num_xfers];
+	gsi->rx_cb.mas = mas;
+	gsi->rx_cb.xfer = xfer;
+
+	if (peripheral.cmd & SPI_RX) {
+		dmaengine_slave_config(mas->rx, &config);
+		gsi->rx_desc = dmaengine_prep_slave_sg(mas->rx, xfer->rx_sg.sgl, xfer->rx_sg.nents,
+						       DMA_DEV_TO_MEM, flags);
+		if (!gsi->rx_desc) {
+			dev_err(mas->dev, "Err setting up rx desc\n");
+			return -EIO;
+		}
+		gsi->rx_desc->callback_result = spi_gsi_rx_callback_result;
+		gsi->rx_desc->callback_param = &gsi->rx_cb;
+	}
+
+	dmaengine_slave_config(mas->tx, &config);
+	gsi->tx_desc = dmaengine_prep_slave_sg(mas->tx, xfer->tx_sg.sgl, xfer->tx_sg.nents,
+					       DMA_MEM_TO_DEV, flags);
+	if (!gsi->tx_desc) {
+		dev_err(mas->dev, "Err setting up tx desc\n");
+		return -EIO;
+	}
+
+	gsi->tx_cb.mas = mas;
+	gsi->tx_cb.xfer = xfer;
+	gsi->tx_desc->callback_result = spi_gsi_tx_callback_result;
+	gsi->tx_desc->callback_param = &gsi->tx_cb;
+
+	if (peripheral.cmd & SPI_RX)
+		gsi->rx_cookie = dmaengine_submit(gsi->rx_desc);
+	gsi->tx_cookie = dmaengine_submit(gsi->tx_desc);
+
+	if (peripheral.cmd & SPI_RX)
+		dma_async_issue_pending(mas->rx);
+	dma_async_issue_pending(mas->tx);
+	mas->num_xfers++;
+
+	jiffies = msecs_to_jiffies(SPI_XFER_TIMEOUT_MS);
+	timeout = wait_for_completion_timeout(&mas->tx_cb, jiffies);
+	if (timeout <= 0) {
+		dev_err(mas->dev, "Tx[%d] timeout%lu\n", i, timeout);
+		ret = -ETIMEDOUT;
+		goto err_gsi_geni_transfer_one;
+	}
+
+	if (peripheral.cmd & SPI_RX) {
+		jiffies = msecs_to_jiffies(SPI_XFER_TIMEOUT_MS);
+		timeout = wait_for_completion_timeout(&mas->rx_cb, jiffies);
+		if (timeout <= 0) {
+			dev_err(mas->dev, "Rx[%d] timeout%lu\n", i, timeout);
+			ret = -ETIMEDOUT;
+			goto err_gsi_geni_transfer_one;
+		}
+	}
+
+	spi_finalize_current_transfer(spi);
+	return 0;
+
+err_gsi_geni_transfer_one:
+	dmaengine_terminate_all(mas->tx);
+	return ret;
+}
+
+static bool geni_can_dma(struct spi_controller *ctlr,
+			 struct spi_device *slv, struct spi_transfer *xfer)
+{
+	struct spi_geni_master *mas = spi_master_get_devdata(slv->master);
+
+	/* check if dma is supported */
+	if (mas->cur_xfer_mode == GENI_GPI_DMA)
+		return true;
+
+	return false;
+}
+
 static int spi_geni_prepare_message(struct spi_master *spi,
 					struct spi_message *spi_msg)
 {
-	int ret;
 	struct spi_geni_master *mas = spi_master_get_devdata(spi);
+	int ret;
 
-	if (spi_geni_is_abort_still_pending(mas))
-		return -EBUSY;
+	switch (mas->cur_xfer_mode) {
+	case GENI_SE_FIFO:
+		if (spi_geni_is_abort_still_pending(mas))
+			return -EBUSY;
+		ret = setup_fifo_params(spi_msg->spi, spi);
+		if (ret)
+			dev_err(mas->dev, "Couldn't select mode %d\n", ret);
+		return ret;
 
-	ret = setup_fifo_params(spi_msg->spi, spi);
-	if (ret)
-		dev_err(mas->dev, "Couldn't select mode %d\n", ret);
+	case GENI_GPI_DMA:
+		mas->num_xfers = 0;
+		reinit_completion(&mas->tx_cb);
+		reinit_completion(&mas->rx_cb);
+		memset(mas->gsi, 0, (sizeof(struct spi_geni_gsi) * NUM_SPI_XFER));
+
+		return 0;
+	}
+
+	dev_err(mas->dev, "Mode not supported %d", mas->cur_xfer_mode);
+	return -EINVAL;
+}
+
+static int spi_geni_grab_gpi_chan(struct spi_geni_master *mas)
+{
+	size_t gsi_sz;
+	int ret;
+
+	mas->tx = dma_request_chan(mas->dev, "tx");
+	if (IS_ERR_OR_NULL(mas->tx)) {
+		dev_err(mas->dev, "Failed to get tx DMA ch %ld", PTR_ERR(mas->tx));
+		ret = PTR_ERR(mas->tx);
+		goto err_tx;
+	}
+	mas->rx = dma_request_chan(mas->dev, "rx");
+	if (IS_ERR_OR_NULL(mas->rx)) {
+		dev_err(mas->dev, "Failed to get rx DMA ch %ld", PTR_ERR(mas->rx));
+		ret = PTR_ERR(mas->rx);
+		goto err_rx;
+	}
+
+	gsi_sz = sizeof(struct spi_geni_gsi) * NUM_SPI_XFER;
+	mas->gsi = devm_kzalloc(mas->dev, gsi_sz, GFP_KERNEL);
+	if (IS_ERR_OR_NULL(mas->gsi))
+		goto err_mem;
+	return 0;
+
+err_mem:
+	dma_release_channel(mas->rx);
+err_rx:
+	dma_release_channel(mas->tx);
+err_tx:
+	mas->tx = NULL;
+	mas->rx = NULL;
 	return ret;
 }
 
@@ -349,15 +594,15 @@ static int spi_geni_init(struct spi_geni_master *mas)
 {
 	struct geni_se *se = &mas->se;
 	unsigned int proto, major, minor, ver;
-	u32 spi_tx_cfg;
+	u32 spi_tx_cfg, fifo_disable;
+	int ret = -ENXIO;
 
 	pm_runtime_get_sync(mas->dev);
 
 	proto = geni_se_read_proto(se);
 	if (proto != GENI_SE_SPI) {
 		dev_err(mas->dev, "Invalid proto %d\n", proto);
-		pm_runtime_put(mas->dev);
-		return -ENXIO;
+		goto out_pm;
 	}
 	mas->tx_fifo_depth = geni_se_get_tx_fifo_depth(se);
 
@@ -380,15 +625,38 @@ static int spi_geni_init(struct spi_geni_master *mas)
 	else
 		mas->oversampling = 1;
 
-	geni_se_select_mode(se, GENI_SE_FIFO);
+	fifo_disable = readl(se->base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
+	switch (fifo_disable) {
+	case 1:
+		ret = spi_geni_grab_gpi_chan(mas);
+		if (!ret) { /* success case */
+			mas->cur_xfer_mode = GENI_GPI_DMA;
+			geni_se_select_mode(se, GENI_GPI_DMA);
+			dev_dbg(mas->dev, "Using GPI DMA mode for SPI\n");
+			break;
+		}
+		/*
+		 * in case of failure to get dma channel, we can till do the
+		 * FIFO mode, so fallthrough
+		 */
+		dev_warn(mas->dev, "FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode\n");
+		fallthrough;
+
+	case 0:
+		mas->cur_xfer_mode = GENI_SE_FIFO;
+		geni_se_select_mode(se, GENI_SE_FIFO);
+		ret = 0;
+		break;
+	}
 
 	/* We always control CS manually */
 	spi_tx_cfg = readl(se->base + SE_SPI_TRANS_CFG);
 	spi_tx_cfg &= ~CS_TOGGLE;
 	writel(spi_tx_cfg, se->base + SE_SPI_TRANS_CFG);
 
+out_pm:
 	pm_runtime_put(mas->dev);
-	return 0;
+	return ret;
 }
 
 static unsigned int geni_byte_per_fifo_word(struct spi_geni_master *mas)
@@ -575,8 +843,11 @@ static int spi_geni_transfer_one(struct spi_master *spi,
 	if (!xfer->len)
 		return 0;
 
-	setup_fifo_xfer(xfer, mas, slv->mode, spi);
-	return 1;
+	if (mas->cur_xfer_mode == GENI_SE_FIFO) {
+		setup_fifo_xfer(xfer, mas, slv->mode, spi);
+		return 1;
+	}
+	return setup_gsi_xfer(xfer, mas, slv, spi);
 }
 
 static irqreturn_t geni_spi_isr(int irq, void *data)
@@ -671,6 +942,15 @@ static int spi_geni_probe(struct platform_device *pdev)
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
@@ -710,14 +990,17 @@ static int spi_geni_probe(struct platform_device *pdev)
 	spi->max_speed_hz = 50000000;
 	spi->prepare_message = spi_geni_prepare_message;
 	spi->transfer_one = spi_geni_transfer_one;
+	spi->can_dma = geni_can_dma;
+	spi->dma_map_dev = mas->dev->parent;
 	spi->auto_runtime_pm = true;
 	spi->handle_err = handle_fifo_timeout;
-	spi->set_cs = spi_geni_set_cs;
 	spi->use_gpio_descriptors = true;
 
 	init_completion(&mas->cs_done);
 	init_completion(&mas->cancel_done);
 	init_completion(&mas->abort_done);
+	init_completion(&mas->tx_cb);
+	init_completion(&mas->rx_cb);
 	spin_lock_init(&mas->lock);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);
@@ -738,6 +1021,14 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (ret)
 		goto spi_geni_probe_runtime_disable;
 
+	/*
+	 * check the mode supported and set_cs for fifo mode only
+	 * for dma (gsi) mode, the gsi will set cs based on params passed in
+	 * TRE
+	 */
+	if (mas->cur_xfer_mode == GENI_SE_FIFO)
+		spi->set_cs = spi_geni_set_cs;
+
 	ret = request_irq(mas->irq, geni_spi_isr, 0, dev_name(dev), spi);
 	if (ret)
 		goto spi_geni_probe_runtime_disable;
@@ -754,6 +1045,14 @@ static int spi_geni_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void spi_geni_release_dma_chan(struct spi_geni_master *mas)
+{
+	if (mas->rx)
+		dma_release_channel(mas->rx);
+	if (mas->tx)
+		dma_release_channel(mas->tx);
+}
+
 static int spi_geni_remove(struct platform_device *pdev)
 {
 	struct spi_master *spi = platform_get_drvdata(pdev);
@@ -762,6 +1061,8 @@ static int spi_geni_remove(struct platform_device *pdev)
 	/* Unregister _before_ disabling pm_runtime() so we stop transfers */
 	spi_unregister_master(spi);
 
+	spi_geni_release_dma_chan(mas);
+
 	free_irq(mas->irq, spi);
 	pm_runtime_disable(&pdev->dev);
 	return 0;
-- 
2.31.1

