Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4F5326083B
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728604AbgIHCNq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:13:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728392AbgIHCMS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:12:18 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 049C6C061786;
        Mon,  7 Sep 2020 19:12:05 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y11so8331317lfl.5;
        Mon, 07 Sep 2020 19:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pLCqpTt0o9YasuFuanVeohNjbDRhOwjYnUF/dxHNwVo=;
        b=Bn6Y8gS86P2CIbHMn71b3x/m/8ijNlgo9DYln5gW5lVWp8MxAZSZxvkig5d8mWHdia
         fYJpQUttzhM627J2Hn2DrbKlRpmwfc/dlJjLWO0bjev69OydZcgSnyYMOC2GW/X1e/CT
         dfUIzdaZQWkNbQS9FhPgZrUo2/yw1I+6TVQeWUOWm7DZA2wy8td3sEYKtlZJ6TQu6Ktr
         p8xtHaQdat+FbBNTdBC9PLBCqDNiOyMXSLNr0EvPWJCX4fKFSEqUNC5Cc1Sr4G0hlnZa
         R6jcQ72EzNbtJf1nLleQaAexc2UmH0DXFaOV5ZqCOiZTXyfLgqDShFC7GFHo//Ie7lpV
         gGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pLCqpTt0o9YasuFuanVeohNjbDRhOwjYnUF/dxHNwVo=;
        b=lnxKjci3oB3GHIbG26vjiPM74yGWhNYenwu6bq8dw2qKHfO/5HMrkca8HWoUXEdpzY
         Px9usxmrkUpOvWU9Gi+koA7lO+ZCKnNFKQOOAQj35wdMdKa+uJyyp8rhujRXrla334yO
         Xvgv7Edq4iAO5JUiaZCYPR2TxvCztXVIKjKAQrAkF0P0nAMpZaUVNrJY0B88lZN6AkFR
         wo21+09jyheTADGjgS4p72wF4j7I2RheUXiFumGngAIn3msp8rHZCcAiZkPvQuWeqHoi
         mMC/21mU25ZPfMGGROI4UtERt4CY5burMqgRTRyOJEof9ICNFcz660bUYBOeENFFuQ57
         f51g==
X-Gm-Message-State: AOAM5308hqdLgxQ1pW9HL/AShq6X8VykfKAp2akDtmuJ8CTeDwd+fhfP
        vnjPrB+/HBWMSyKhLu6tu8Q=
X-Google-Smtp-Source: ABdhPJxJYr6nz36rfixlnpmmO0qhXJ93b8sUrVG9O/wBh1xEki/MisrenDSdbt9Eg3ToxqHul+bAug==
X-Received: by 2002:ac2:592d:: with SMTP id v13mr11566983lfi.124.1599531123369;
        Mon, 07 Sep 2020 19:12:03 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:12:02 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 31/35] i2c: tegra: Clean up variable names
Date:   Tue,  8 Sep 2020 05:10:17 +0300
Message-Id: <20200908021021.9123-32-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Rename "ret" variables to "err" in order to make code a bit more
expressive, emphasizing that the returned value is an error code.

Rename variable "reg" to "val" in order to better reflect the actual
usage of the variable in the code and to make naming consistent with
the rest of the code.

Use briefer names for a few members of the tegra_i2c_dev structure in
order to improve readability of the code.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 109 ++++++++++++++++-----------------
 1 file changed, 54 insertions(+), 55 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 62c7334fe601..44c75595a173 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -247,15 +247,15 @@ struct tegra_i2c_hw_feature {
  * @msg_buf_remaining: size of unsent data in the message buffer
  * @msg_read: identifies read transfers
  * @bus_clk_rate: current I2C bus clock rate
- * @is_multimaster_mode: track if I2C controller is in multi-master mode
+ * @multimaster_mode: indicates that I2C controller is in multi-master mode
  * @tx_dma_chan: DMA transmit channel
  * @rx_dma_chan: DMA receive channel
  * @dma_phys: handle to DMA resources
  * @dma_buf: pointer to allocated DMA buffer
  * @dma_buf_size: DMA buffer size
- * @is_curr_dma_xfer: indicates active DMA transfer
+ * @dma_mode: indicates active DMA transfer
  * @dma_complete: DMA completion notifier
- * @is_curr_atomic_xfer: indicates active atomic transfer
+ * @atomic_mode: indicates active atomic transfer
  */
 struct tegra_i2c_dev {
 	struct device *dev;
@@ -287,9 +287,9 @@ struct tegra_i2c_dev {
 	dma_addr_t dma_phys;
 	u32 *dma_buf;
 
-	bool is_multimaster_mode;
-	bool is_curr_atomic_xfer;
-	bool is_curr_dma_xfer;
+	bool multimaster_mode;
+	bool atomic_mode;
+	bool dma_mode;
 	bool msg_read;
 	bool is_dvc;
 	bool is_vi;
@@ -525,7 +525,7 @@ static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
 	void __iomem *addr = i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg);
 	u32 val;
 
-	if (!i2c_dev->is_curr_atomic_xfer)
+	if (!i2c_dev->atomic_mode)
 		return readl_relaxed_poll_timeout(addr, val, !(val & mask),
 						  delay_us, timeout_us);
 
@@ -673,7 +673,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (err)
 		return err;
 
-	if (i2c_dev->is_multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
+	if (i2c_dev->multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
 		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
 
 	err = tegra_i2c_wait_for_config_load(i2c_dev);
@@ -859,7 +859,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	if (i2c_dev->hw->supports_bus_clear && (status & I2C_INT_BUS_CLR_DONE))
 		goto err;
 
-	if (!i2c_dev->is_curr_dma_xfer) {
+	if (!i2c_dev->dma_mode) {
 		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
 			if (tegra_i2c_empty_rx_fifo(i2c_dev)) {
 				/*
@@ -893,7 +893,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	 * so forcing msg_buf_remaining to 0 in DMA mode.
 	 */
 	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
-		if (i2c_dev->is_curr_dma_xfer)
+		if (i2c_dev->dma_mode)
 			i2c_dev->msg_buf_remaining = 0;
 		/*
 		 * Underflow error condition: XFER_COMPLETE before message
@@ -917,7 +917,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	if (i2c_dev->is_dvc)
 		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
 
-	if (i2c_dev->is_curr_dma_xfer) {
+	if (i2c_dev->dma_mode) {
 		if (i2c_dev->msg_read)
 			dmaengine_terminate_async(i2c_dev->rx_dma_chan);
 		else
@@ -936,14 +936,14 @@ static int tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev, size_t len)
 	struct dma_slave_config slv_config = {0};
 	u32 val, reg, dma_burst, reg_offset;
 	struct dma_chan *chan;
-	int ret;
+	int err;
 
 	if (i2c_dev->hw->has_mst_fifo)
 		reg = I2C_MST_FIFO_CONTROL;
 	else
 		reg = I2C_FIFO_CONTROL;
 
-	if (i2c_dev->is_curr_dma_xfer) {
+	if (i2c_dev->dma_mode) {
 		if (len & 0xF)
 			dma_burst = 1;
 		else if (len & 0x10)
@@ -976,11 +976,11 @@ static int tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev, size_t len)
 		}
 
 		slv_config.device_fc = true;
-		ret = dmaengine_slave_config(chan, &slv_config);
-		if (ret) {
+		err = dmaengine_slave_config(chan, &slv_config);
+		if (err) {
 			dev_err(i2c_dev->dev, "DMA slave config failed: %d\n",
-				ret);
-			return ret;
+				err);
+			return err;
 		}
 
 		goto out;
@@ -1030,7 +1030,7 @@ static unsigned long tegra_i2c_wait_completion(struct tegra_i2c_dev *i2c_dev,
 {
 	unsigned long ret;
 
-	if (i2c_dev->is_curr_atomic_xfer) {
+	if (i2c_dev->atomic_mode) {
 		ret = tegra_i2c_poll_completion(i2c_dev, complete, timeout_ms);
 	} else {
 		enable_irq(i2c_dev->irq);
@@ -1058,20 +1058,20 @@ static unsigned long tegra_i2c_wait_completion(struct tegra_i2c_dev *i2c_dev,
 static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
-	u32 reg, time_left;
+	u32 val, time_left;
 	int err;
 
 	reinit_completion(&i2c_dev->msg_complete);
-	reg = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
+	val = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
 	      I2C_BC_TERMINATE;
-	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
+	i2c_writel(i2c_dev, val, I2C_BUS_CLEAR_CNFG);
 
 	err = tegra_i2c_wait_for_config_load(i2c_dev);
 	if (err)
 		return err;
 
-	reg |= I2C_BC_ENABLE;
-	i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
+	val |= I2C_BC_ENABLE;
+	i2c_writel(i2c_dev, val, I2C_BUS_CLEAR_CNFG);
 	tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
 	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete,
@@ -1083,8 +1083,8 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 		return -ETIMEDOUT;
 	}
 
-	reg = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
-	if (!(reg & I2C_BC_STATUS)) {
+	val = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
+	if (!(val & I2C_BC_STATUS)) {
 		dev_err(i2c_dev->dev,
 			"un-recovered arbitration lost\n");
 		return -EIO;
@@ -1106,14 +1106,14 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 			FIELD_PREP(PACKET_HEADER0_CONT_ID, i2c_dev->cont_id) |
 			FIELD_PREP(PACKET_HEADER0_PACKET_ID, 1);
 
-	if (i2c_dev->is_curr_dma_xfer && !i2c_dev->msg_read)
+	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
 		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
 
 	packet_header = msg->len - 1;
 
-	if (i2c_dev->is_curr_dma_xfer && !i2c_dev->msg_read)
+	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
 		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
@@ -1138,7 +1138,7 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	if (msg->flags & I2C_M_RD)
 		packet_header |= I2C_HEADER_READ;
 
-	if (i2c_dev->is_curr_dma_xfer && !i2c_dev->msg_read)
+	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
 		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
@@ -1154,7 +1154,7 @@ static int tegra_i2c_error_recover(struct tegra_i2c_dev *i2c_dev,
 
 	/* start recovery upon arbitration loss in single master mode */
 	if (i2c_dev->msg_err == I2C_ERR_ARBITRATION_LOST) {
-		if (!i2c_dev->is_multimaster_mode)
+		if (!i2c_dev->multimaster_mode)
 			return i2c_recover_bus(&i2c_dev->adapter);
 
 		return -EAGAIN;
@@ -1195,9 +1195,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		xfer_size = msg->len + I2C_PACKET_HEADER_SIZE;
 
 	xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
-	i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_PREFERRED_LEN) &&
-				    i2c_dev->dma_buf &&
-				    !i2c_dev->is_curr_atomic_xfer;
+	i2c_dev->dma_mode = (xfer_size > I2C_PIO_MODE_PREFERRED_LEN) &&
+			    i2c_dev->dma_buf && !i2c_dev->atomic_mode;
 
 	err = tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
 	if (err)
@@ -1212,7 +1211,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
-	if (i2c_dev->is_curr_dma_xfer) {
+	if (i2c_dev->dma_mode) {
 		if (i2c_dev->msg_read) {
 			dma_sync_single_for_device(i2c_dev->dev,
 						   i2c_dev->dma_phys,
@@ -1237,7 +1236,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	tegra_i2c_push_packet_header(i2c_dev, msg, end_state);
 
 	if (!i2c_dev->msg_read) {
-		if (i2c_dev->is_curr_dma_xfer) {
+		if (i2c_dev->dma_mode) {
 			memcpy(i2c_dev->dma_buf, msg->buf, msg->len);
 			dma_sync_single_for_device(i2c_dev->dev,
 						   i2c_dev->dma_phys,
@@ -1257,7 +1256,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	if (i2c_dev->hw->has_per_pkt_xfer_complete_irq)
 		int_mask |= I2C_INT_PACKET_XFER_COMPLETE;
-	if (!i2c_dev->is_curr_dma_xfer) {
+	if (!i2c_dev->dma_mode) {
 		if (msg->flags & I2C_M_RD)
 			int_mask |= I2C_INT_RX_FIFO_DATA_REQ;
 		else if (i2c_dev->msg_buf_remaining)
@@ -1268,7 +1267,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	dev_dbg(i2c_dev->dev, "unmasked irq: %02x\n",
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
-	if (i2c_dev->is_curr_dma_xfer) {
+	if (i2c_dev->dma_mode) {
 		time_left = tegra_i2c_wait_completion(i2c_dev,
 						      &i2c_dev->dma_complete,
 						      xfer_time);
@@ -1317,7 +1316,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		time_left, completion_done(&i2c_dev->msg_complete),
 		i2c_dev->msg_err);
 
-	i2c_dev->is_curr_dma_xfer = false;
+	i2c_dev->dma_mode = false;
 
 	err = tegra_i2c_error_recover(i2c_dev, msg);
 	if (err)
@@ -1369,9 +1368,9 @@ static int tegra_i2c_xfer_atomic(struct i2c_adapter *adap,
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 	int ret;
 
-	i2c_dev->is_curr_atomic_xfer = true;
+	i2c_dev->atomic_mode = true;
 	ret = tegra_i2c_xfer(adap, msgs, num);
-	i2c_dev->is_curr_atomic_xfer = false;
+	i2c_dev->atomic_mode = false;
 
 	return ret;
 }
@@ -1596,15 +1595,15 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 {
 	struct device_node *np = i2c_dev->dev->of_node;
 	bool multi_mode;
-	int ret;
+	int err;
 
-	ret = of_property_read_u32(np, "clock-frequency",
+	err = of_property_read_u32(np, "clock-frequency",
 				   &i2c_dev->bus_clk_rate);
-	if (ret)
+	if (err)
 		i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ; /* default clock rate */
 
 	multi_mode = of_property_read_bool(np, "multi-master");
-	i2c_dev->is_multimaster_mode = multi_mode;
+	i2c_dev->multimaster_mode = multi_mode;
 
 	if (of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
 		i2c_dev->is_dvc = true;
@@ -1635,7 +1634,7 @@ static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 		}
 	}
 
-	if (!i2c_dev->is_multimaster_mode)
+	if (!i2c_dev->multimaster_mode)
 		return 0;
 
 	err = clk_enable(i2c_dev->div_clk);
@@ -1654,7 +1653,7 @@ static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 
 static void tegra_i2c_release_clocks(struct tegra_i2c_dev *i2c_dev)
 {
-	if (i2c_dev->is_multimaster_mode)
+	if (i2c_dev->multimaster_mode)
 		clk_disable(i2c_dev->div_clk);
 
 	clk_bulk_unprepare(i2c_dev->nclocks, i2c_dev->clocks);
@@ -1798,15 +1797,15 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 {
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
-	int ret;
+	int err;
 
-	ret = pinctrl_pm_select_default_state(i2c_dev->dev);
-	if (ret)
-		return ret;
+	err = pinctrl_pm_select_default_state(i2c_dev->dev);
+	if (err)
+		return err;
 
-	ret = clk_bulk_enable(i2c_dev->nclocks, i2c_dev->clocks);
-	if (ret)
-		return ret;
+	err = clk_bulk_enable(i2c_dev->nclocks, i2c_dev->clocks);
+	if (err)
+		return err;
 
 	/*
 	 * VI I2C device is attached to VE power domain which goes through
@@ -1815,8 +1814,8 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 	 * domain ON.
 	 */
 	if (i2c_dev->is_vi) {
-		ret = tegra_i2c_init(i2c_dev);
-		if (ret)
+		err = tegra_i2c_init(i2c_dev);
+		if (err)
 			goto disable_clocks;
 	}
 
@@ -1825,7 +1824,7 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 disable_clocks:
 	clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
 
-	return ret;
+	return err;
 }
 
 static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
-- 
2.27.0

