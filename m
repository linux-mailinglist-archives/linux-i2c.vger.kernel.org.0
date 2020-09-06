Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A76225EFA0
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729290AbgIFSxG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729229AbgIFSwO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:52:14 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7848BC06179E;
        Sun,  6 Sep 2020 11:52:12 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a22so7172552ljp.13;
        Sun, 06 Sep 2020 11:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SVokk+6bWdAw9HUovaB17WkapTo9mXA0U6FBVoYTkhM=;
        b=rhlcKc0+ydITRxVq9r+ByRSjn4m/+tVJNd+wHxmrGv7eX/4LwOLfpZer8tg8jdvatX
         GVXx74L5m5Dv5vNkCqV7GdsvVrhFQORhKsjzObr9c6QtIHw3F0rTIRqukUMoGjgNmg2c
         LXCE9PJgtrXotzrVcvHgRl7NQHeoggDhydpyGz81qVf6Kd0TxLgYKC8R4rH5vT8Wu7W6
         G2L3aElurGJgrmsPv32pA4OVJ2BWAJRvgc3zPZhv1NQNKn3Ekva3t45d2Md8hsSnd8lv
         EMj721QTCU9yeOjSD7V7BZfrw2BTSOWyWd53f5b8V1hYB6bjVW6+ca3X32i4PPZMBxDG
         1Lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SVokk+6bWdAw9HUovaB17WkapTo9mXA0U6FBVoYTkhM=;
        b=emmr1FyvltQKJyeL8aLGTWdXiEyzrpepqIGUvY6Y/Nh20UQLrDhGnc40lcKK3Ed/mI
         mrCFid46j1rnLCjTA/suYRfavKYJkzndeEEP5YXdiUesZpqhGjec9RWPmyTFE5xAMHfN
         HjN72lC/DVpr4AJfoo36YO1fjBeY98EG31PkfpXKMS1pAsAHJzexR6sAhA3qUV2uOb41
         015DlPChXNwvztxCkTxBQnl8cyt3Xl1sEw+iweSJsOSJLUOnkLPY9SApNwp9XgU3Tsd7
         GtH1MK4ZPJYeWi5ntA1ez6R/Q/3bnQtxIXvs0/uRpco5vhy+Z2O4K5hrf4dHPYPRQ0mX
         ELZw==
X-Gm-Message-State: AOAM531EEdCQ3AOJP84fzTLvj4WEy15gxuhy2chYzqFaxvuYhHn+xbJd
        Qj37m4Whpz/6V+zfD3PRv0JAswvsYEk=
X-Google-Smtp-Source: ABdhPJwH/fLvUrFc7+sNM5PhMdWm0qqX3f5Oq9fGuXFcsJQARFAjNRreIYp47CdiQwNrrXeDilo9BA==
X-Received: by 2002:a05:651c:2c9:: with SMTP id f9mr8333472ljo.257.1599418330924;
        Sun, 06 Sep 2020 11:52:10 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:52:10 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 36/36] i2c: tegra: Improve tegra_i2c_dev structure
Date:   Sun,  6 Sep 2020 21:50:39 +0300
Message-Id: <20200906185039.22700-37-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200906185039.22700-1-digetx@gmail.com>
References: <20200906185039.22700-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Rename, reorder and change type of a few members of the tegra_i2c_dev
structure in order to improve readability of the code and have consistent
typing of the variables.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 94 ++++++++++++++++++----------------
 1 file changed, 50 insertions(+), 44 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 880fbcd28c5e..10372c582aed 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -246,45 +246,52 @@ struct tegra_i2c_hw_feature {
  * @msg_buf_remaining: size of unsent data in the message buffer
  * @msg_read: indicates read direction of a transfer
  * @bus_clk_rate: current I2C bus clock rate
- * @is_multimaster_mode: indicates that I2C controller is in multi-master mode
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
-	const struct tegra_i2c_hw_feature *hw;
 	struct i2c_adapter adapter;
-	struct clk *div_clk;
-	struct clk_bulk_data *clocks;
-	unsigned int nclocks;
+
+	const struct tegra_i2c_hw_feature *hw;
 	struct reset_control *rst;
-	void __iomem *base;
+	unsigned int cont_id;
+	unsigned int irq;
+
 	phys_addr_t base_phys;
-	int cont_id;
-	int irq;
-	int is_dvc;
-	bool is_vi;
+	void __iomem *base;
+
+	struct clk_bulk_data *clocks;
+	unsigned int nclocks;
+
+	struct clk *div_clk;
+	unsigned int bus_clk_rate;
+
 	struct completion msg_complete;
+	size_t msg_buf_remaining;
 	int msg_err;
 	u8 *msg_buf;
-	size_t msg_buf_remaining;
-	int msg_read;
-	u32 bus_clk_rate;
-	bool is_multimaster_mode;
+
+	struct completion dma_complete;
 	struct dma_chan *tx_dma_chan;
 	struct dma_chan *rx_dma_chan;
+	size_t dma_buf_size;
 	dma_addr_t dma_phys;
 	u32 *dma_buf;
-	unsigned int dma_buf_size;
-	bool is_curr_dma_xfer;
-	struct completion dma_complete;
-	bool is_curr_atomic_xfer;
+
+	bool multimaster_mode;
+	bool atomic_mode;
+	bool msg_read;
+	bool dma_mode;
+	bool is_dvc;
+	bool is_vi;
 };
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val, u32 reg)
@@ -523,7 +530,7 @@ static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
 	void __iomem *addr = i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg);
 	u32 val;
 
-	if (!i2c_dev->is_curr_atomic_xfer)
+	if (!i2c_dev->atomic_mode)
 		return readl_relaxed_poll_timeout(addr, val, !(val & mask),
 						  delay_us, timeout_us);
 
@@ -663,7 +670,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (err)
 		return err;
 
-	if (i2c_dev->is_multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
+	if (i2c_dev->multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
 		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
 
 	err = tegra_i2c_wait_for_config_load(i2c_dev);
@@ -854,7 +861,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	if (i2c_dev->hw->supports_bus_clear && (status & I2C_INT_BUS_CLR_DONE))
 		goto err;
 
-	if (!i2c_dev->is_curr_dma_xfer) {
+	if (!i2c_dev->dma_mode) {
 		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
 			if (tegra_i2c_empty_rx_fifo(i2c_dev)) {
 				/*
@@ -889,7 +896,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	 * so forcing msg_buf_remaining to 0 in DMA mode.
 	 */
 	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
-		if (i2c_dev->is_curr_dma_xfer)
+		if (i2c_dev->dma_mode)
 			i2c_dev->msg_buf_remaining = 0;
 		/*
 		 * Underflow error condition: XFER_COMPLETE before message
@@ -919,7 +926,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	if (i2c_dev->is_dvc)
 		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
 
-	if (i2c_dev->is_curr_dma_xfer) {
+	if (i2c_dev->dma_mode) {
 		if (i2c_dev->msg_read)
 			dmaengine_terminate_async(i2c_dev->rx_dma_chan);
 		else
@@ -945,7 +952,7 @@ static int tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev, size_t len)
 	else
 		reg = I2C_FIFO_CONTROL;
 
-	if (i2c_dev->is_curr_dma_xfer) {
+	if (i2c_dev->dma_mode) {
 		if (len & 0xF)
 			dma_burst = 1;
 		else if (len & 0x10)
@@ -1031,7 +1038,7 @@ static unsigned long tegra_i2c_wait_completion(struct tegra_i2c_dev *i2c_dev,
 {
 	unsigned long ret;
 
-	if (i2c_dev->is_curr_atomic_xfer) {
+	if (i2c_dev->atomic_mode) {
 		ret = tegra_i2c_poll_completion(i2c_dev, complete, timeout_ms);
 	} else {
 		enable_irq(i2c_dev->irq);
@@ -1107,14 +1114,14 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
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
@@ -1139,7 +1146,7 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	if (msg->flags & I2C_M_RD)
 		packet_header |= I2C_HEADER_READ;
 
-	if (i2c_dev->is_curr_dma_xfer && !i2c_dev->msg_read)
+	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
 		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
@@ -1155,7 +1162,7 @@ static int tegra_i2c_error_recover(struct tegra_i2c_dev *i2c_dev,
 
 	/* start recovery upon arbitration loss in single master mode */
 	if (i2c_dev->msg_err == I2C_ERR_ARBITRATION_LOST) {
-		if (!i2c_dev->is_multimaster_mode)
+		if (!i2c_dev->multimaster_mode)
 			return i2c_recover_bus(&i2c_dev->adapter);
 
 		return -EAGAIN;
@@ -1197,9 +1204,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
 
-	i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_PREFERRED_LEN) &&
-				    i2c_dev->dma_buf &&
-				    !i2c_dev->is_curr_atomic_xfer;
+	i2c_dev->dma_mode = xfer_size > I2C_PIO_MODE_PREFERRED_LEN &&
+			    i2c_dev->dma_buf && !i2c_dev->atomic_mode;
 
 	err = tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
 	if (err)
@@ -1215,7 +1221,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
 
-	if (i2c_dev->is_curr_dma_xfer) {
+	if (i2c_dev->dma_mode) {
 		if (i2c_dev->msg_read) {
 			dma_sync_single_for_device(i2c_dev->dev,
 						   i2c_dev->dma_phys,
@@ -1234,7 +1240,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	tegra_i2c_push_packet_header(i2c_dev, msg, end_state);
 
 	if (!i2c_dev->msg_read) {
-		if (i2c_dev->is_curr_dma_xfer) {
+		if (i2c_dev->dma_mode) {
 			memcpy(i2c_dev->dma_buf, msg->buf, msg->len);
 
 			dma_sync_single_for_device(i2c_dev->dev,
@@ -1252,7 +1258,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	if (i2c_dev->hw->has_per_pkt_xfer_complete_irq)
 		int_mask |= I2C_INT_PACKET_XFER_COMPLETE;
 
-	if (!i2c_dev->is_curr_dma_xfer) {
+	if (!i2c_dev->dma_mode) {
 		if (msg->flags & I2C_M_RD)
 			int_mask |= I2C_INT_RX_FIFO_DATA_REQ;
 		else if (i2c_dev->msg_buf_remaining)
@@ -1263,7 +1269,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	dev_dbg(i2c_dev->dev, "unmasked IRQ: %02x\n",
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
-	if (i2c_dev->is_curr_dma_xfer) {
+	if (i2c_dev->dma_mode) {
 		time_left = tegra_i2c_wait_completion(i2c_dev,
 						      &i2c_dev->dma_complete,
 						      xfer_time);
@@ -1311,7 +1317,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		time_left, completion_done(&i2c_dev->msg_complete),
 		i2c_dev->msg_err);
 
-	i2c_dev->is_curr_dma_xfer = false;
+	i2c_dev->dma_mode = false;
 
 	err = tegra_i2c_error_recover(i2c_dev, msg);
 	if (err)
@@ -1363,9 +1369,9 @@ static int tegra_i2c_xfer_atomic(struct i2c_adapter *adap,
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 	int ret;
 
-	i2c_dev->is_curr_atomic_xfer = true;
+	i2c_dev->atomic_mode = true;
 	ret = tegra_i2c_xfer(adap, msgs, num);
-	i2c_dev->is_curr_atomic_xfer = false;
+	i2c_dev->atomic_mode = false;
 
 	return ret;
 }
@@ -1598,7 +1604,7 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 		i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;
 
 	multi_mode = of_property_read_bool(np, "multi-master");
-	i2c_dev->is_multimaster_mode = multi_mode;
+	i2c_dev->multimaster_mode = multi_mode;
 
 	if (of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
 		i2c_dev->is_dvc = true;
@@ -1629,7 +1635,7 @@ static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 		}
 	}
 
-	if (!i2c_dev->is_multimaster_mode)
+	if (!i2c_dev->multimaster_mode)
 		return 0;
 
 	err = clk_enable(i2c_dev->div_clk);
@@ -1648,7 +1654,7 @@ static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 
 static void tegra_i2c_release_clocks(struct tegra_i2c_dev *i2c_dev)
 {
-	if (i2c_dev->is_multimaster_mode)
+	if (i2c_dev->multimaster_mode)
 		clk_disable(i2c_dev->div_clk);
 
 	clk_bulk_unprepare(i2c_dev->nclocks, i2c_dev->clocks);
-- 
2.27.0

