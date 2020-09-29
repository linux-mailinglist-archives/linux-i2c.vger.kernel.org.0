Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6CF627DBB7
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729404AbgI2WVM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728676AbgI2WVK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:21:10 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30239C0613DD;
        Tue, 29 Sep 2020 15:21:06 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id v23so5363984ljd.1;
        Tue, 29 Sep 2020 15:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/c0orpn9EPMaLf+WiOaU6tddhZjs45dqhwv3NuJ9CUw=;
        b=PWgtOL02adHl+x20MdChAlOKG/0lpauor+DyYBsZW0cyFfHk2R7/LUT60wLcj/GVBV
         PYBHdUb/AMAn2WpAX+vw2udUdVOGE6cRaYXTfd1LIjkGoHxLPNVxDh+HDbu0YuTH29Na
         z4arg5AFvElWVSwx7fW+MwKeTWZ2umPsmo9Yo1BLmppwYXpRdq9oOjFvZeVIB3mHurH8
         LY8mpjCZf7TG1OOczrRh/UWwSkP8Rc5mLV7T9F2SIbTqO27+t+Y040Ebu5EDh7cvy3px
         UeO6H30sTRcefMXIfpQ4aDbi/IiZeAMhpIzEkE7Xb9e5Y7nFFoBEbThIhrqNRV0SukDZ
         Phdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/c0orpn9EPMaLf+WiOaU6tddhZjs45dqhwv3NuJ9CUw=;
        b=UXiAfhYURn4hC+D7JYWb97prC7Wd2/ZGfaSFP6aQI9nas0VgGmERM1CO/s5xpYyMZ/
         pZ5dbQ6OrXIkyLfsDiaIO+SGbTy6nmw9Y4aiDZKjxc0PoybqTf6+bKkLYd9AUs+l+I99
         YS7zzpUwAAFEruEsIK6MadV44wL+hfYL1V2WwjPzHEb5ygmCDLDUm9HJEXqhI71jSBRM
         K0jlf28iZ6VGWE7zlPdSSZoVfV6YH9UdjKCbKdKldNQ4xyJYaoRLn6/RvTOtfEN0/LBw
         2PE1DduZCtEULTXSeFoVdH+YyHy7KhxHLW364MbBt1YE3L1BXyoaxmmXQuuI2askavC8
         PI5A==
X-Gm-Message-State: AOAM531vsP/uU30MTDE7IVYJQxDwCj4JhmU66pL9iuJT4UjBEGEG7QOj
        hpNzfP4reuwq1BtNFr6BQjw=
X-Google-Smtp-Source: ABdhPJwJNtejOnaLWZvmxtA4zX2wGU4eRUv432QqPHgcVgUfvNZ5IKVeIxXHB2wbNK2PWsTtEX+jPA==
X-Received: by 2002:a2e:8059:: with SMTP id p25mr1681091ljg.291.1601418063717;
        Tue, 29 Sep 2020 15:21:03 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:21:02 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 28/32] i2c: tegra: Clean up variable names
Date:   Wed, 30 Sep 2020 01:19:11 +0300
Message-Id: <20200929221915.10979-29-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Rename "ret" variables to "err" in order to make code a bit more
expressive, emphasizing that the returned value is an error code.
Same vice versa, where appropriate.

Rename variable "reg" to "val" in order to better reflect the actual
usage of the variable in the code and to make naming consistent with
the rest of the code.

Use briefer names for a few members of the tegra_i2c_dev structure in
order to improve readability of the code.

All dev/&pdev->dev are replaced with i2c_dev->dev in order to have uniform
code style across the driver.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 177 +++++++++++++++++----------------
 1 file changed, 90 insertions(+), 87 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 823d5baadd68..1a1388339660 100644
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
 	void *dma_buf;
 
-	bool is_multimaster_mode;
-	bool is_curr_atomic_xfer;
-	bool is_curr_dma_xfer;
+	bool multimaster_mode;
+	bool atomic_mode;
+	bool dma_mode;
 	bool msg_read;
 	bool is_dvc;
 	bool is_vi;
@@ -526,7 +526,7 @@ static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
 	void __iomem *addr = i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg);
 	u32 val;
 
-	if (!i2c_dev->is_curr_atomic_xfer)
+	if (!i2c_dev->atomic_mode)
 		return readl_relaxed_poll_timeout(addr, val, !(val & mask),
 						  delay_us, timeout_us);
 
@@ -674,7 +674,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (err)
 		return err;
 
-	if (i2c_dev->is_multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
+	if (i2c_dev->multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
 		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
 
 	err = tegra_i2c_wait_for_config_load(i2c_dev);
@@ -860,7 +860,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	if (i2c_dev->hw->supports_bus_clear && (status & I2C_INT_BUS_CLR_DONE))
 		goto err;
 
-	if (!i2c_dev->is_curr_dma_xfer) {
+	if (!i2c_dev->dma_mode) {
 		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
 			if (tegra_i2c_empty_rx_fifo(i2c_dev)) {
 				/*
@@ -894,7 +894,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	 * so forcing msg_buf_remaining to 0 in DMA mode.
 	 */
 	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
-		if (i2c_dev->is_curr_dma_xfer)
+		if (i2c_dev->dma_mode)
 			i2c_dev->msg_buf_remaining = 0;
 		/*
 		 * Underflow error condition: XFER_COMPLETE before message
@@ -918,7 +918,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	if (i2c_dev->is_dvc)
 		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
 
-	if (i2c_dev->is_curr_dma_xfer) {
+	if (i2c_dev->dma_mode) {
 		if (i2c_dev->msg_read)
 			dmaengine_terminate_async(i2c_dev->rx_dma_chan);
 		else
@@ -938,14 +938,14 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
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
@@ -978,13 +978,13 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 		}
 
 		slv_config.device_fc = true;
-		ret = dmaengine_slave_config(chan, &slv_config);
-		if (ret) {
+		err = dmaengine_slave_config(chan, &slv_config);
+		if (err) {
 			dev_err(i2c_dev->dev, "DMA slave config failed: %d\n",
-				ret);
+				err);
 			dev_err(i2c_dev->dev, "falling back to PIO\n");
 			tegra_i2c_release_dma(i2c_dev);
-			i2c_dev->is_curr_dma_xfer = false;
+			i2c_dev->dma_mode = false;
 		} else {
 			goto out;
 		}
@@ -1032,7 +1032,7 @@ static unsigned long tegra_i2c_wait_completion(struct tegra_i2c_dev *i2c_dev,
 {
 	unsigned long ret;
 
-	if (i2c_dev->is_curr_atomic_xfer) {
+	if (i2c_dev->atomic_mode) {
 		ret = tegra_i2c_poll_completion(i2c_dev, complete, timeout_ms);
 	} else {
 		enable_irq(i2c_dev->irq);
@@ -1060,20 +1060,20 @@ static unsigned long tegra_i2c_wait_completion(struct tegra_i2c_dev *i2c_dev,
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
 
 	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete, 50);
@@ -1084,8 +1084,8 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 		return -ETIMEDOUT;
 	}
 
-	reg = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
-	if (!(reg & I2C_BC_STATUS)) {
+	val = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
+	if (!(val & I2C_BC_STATUS)) {
 		dev_err(i2c_dev->dev,
 			"un-recovered arbitration lost\n");
 		return -EIO;
@@ -1107,14 +1107,14 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
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
@@ -1139,7 +1139,7 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	if (msg->flags & I2C_M_RD)
 		packet_header |= I2C_HEADER_READ;
 
-	if (i2c_dev->is_curr_dma_xfer && !i2c_dev->msg_read)
+	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
 		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
@@ -1155,7 +1155,7 @@ static int tegra_i2c_error_recover(struct tegra_i2c_dev *i2c_dev,
 
 	/* start recovery upon arbitration loss in single master mode */
 	if (i2c_dev->msg_err == I2C_ERR_ARBITRATION_LOST) {
-		if (!i2c_dev->is_multimaster_mode)
+		if (!i2c_dev->multimaster_mode)
 			return i2c_recover_bus(&i2c_dev->adapter);
 
 		return -EAGAIN;
@@ -1196,9 +1196,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		xfer_size = msg->len + I2C_PACKET_HEADER_SIZE;
 
 	xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
-	i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_PREFERRED_LEN) &&
-				    i2c_dev->dma_buf &&
-				    !i2c_dev->is_curr_atomic_xfer;
+	i2c_dev->dma_mode = (xfer_size > I2C_PIO_MODE_PREFERRED_LEN) &&
+			    i2c_dev->dma_buf && !i2c_dev->atomic_mode;
+
 	tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
 
 	/*
@@ -1210,7 +1210,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
-	if (i2c_dev->is_curr_dma_xfer) {
+	if (i2c_dev->dma_mode) {
 		if (i2c_dev->msg_read) {
 			dma_sync_single_for_device(i2c_dev->dev,
 						   i2c_dev->dma_phys,
@@ -1235,7 +1235,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	tegra_i2c_push_packet_header(i2c_dev, msg, end_state);
 
 	if (!i2c_dev->msg_read) {
-		if (i2c_dev->is_curr_dma_xfer) {
+		if (i2c_dev->dma_mode) {
 			memcpy(i2c_dev->dma_buf + I2C_PACKET_HEADER_SIZE,
 			       msg->buf, msg->len);
 			dma_sync_single_for_device(i2c_dev->dev,
@@ -1256,7 +1256,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	if (i2c_dev->hw->has_per_pkt_xfer_complete_irq)
 		int_mask |= I2C_INT_PACKET_XFER_COMPLETE;
-	if (!i2c_dev->is_curr_dma_xfer) {
+	if (!i2c_dev->dma_mode) {
 		if (msg->flags & I2C_M_RD)
 			int_mask |= I2C_INT_RX_FIFO_DATA_REQ;
 		else if (i2c_dev->msg_buf_remaining)
@@ -1267,7 +1267,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	dev_dbg(i2c_dev->dev, "unmasked irq: %02x\n",
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
-	if (i2c_dev->is_curr_dma_xfer) {
+	if (i2c_dev->dma_mode) {
 		time_left = tegra_i2c_wait_completion(i2c_dev,
 						      &i2c_dev->dma_complete,
 						      xfer_time);
@@ -1316,7 +1316,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		time_left, completion_done(&i2c_dev->msg_complete),
 		i2c_dev->msg_err);
 
-	i2c_dev->is_curr_dma_xfer = false;
+	i2c_dev->dma_mode = false;
 
 	err = tegra_i2c_error_recover(i2c_dev, msg);
 	if (err)
@@ -1363,9 +1363,9 @@ static int tegra_i2c_xfer_atomic(struct i2c_adapter *adap,
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
 	int ret;
 
-	i2c_dev->is_curr_atomic_xfer = true;
+	i2c_dev->atomic_mode = true;
 	ret = tegra_i2c_xfer(adap, msgs, num);
-	i2c_dev->is_curr_atomic_xfer = false;
+	i2c_dev->atomic_mode = false;
 
 	return ret;
 }
@@ -1590,15 +1590,15 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
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
@@ -1630,7 +1630,7 @@ static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 
 	i2c_dev->div_clk = i2c_dev->clocks[0].clk;
 
-	if (!i2c_dev->is_multimaster_mode)
+	if (!i2c_dev->multimaster_mode)
 		return 0;
 
 	err = clk_enable(i2c_dev->div_clk);
@@ -1649,7 +1649,7 @@ static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 
 static void tegra_i2c_release_clocks(struct tegra_i2c_dev *i2c_dev)
 {
-	if (i2c_dev->is_multimaster_mode)
+	if (i2c_dev->multimaster_mode)
 		clk_disable(i2c_dev->div_clk);
 
 	clk_bulk_unprepare(i2c_dev->nclocks, i2c_dev->clocks);
@@ -1674,7 +1674,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 {
 	struct tegra_i2c_dev *i2c_dev;
 	struct resource *res;
-	int ret;
+	int err;
 
 	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
 	if (!i2c_dev)
@@ -1695,36 +1695,36 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	i2c_dev->base_phys = res->start;
 
-	ret = platform_get_irq(pdev, 0);
-	if (ret < 0)
-		return ret;
+	err = platform_get_irq(pdev, 0);
+	if (err < 0)
+		return err;
 
-	i2c_dev->irq = ret;
+	i2c_dev->irq = err;
 
 	/* interrupt will be enabled during of transfer time */
 	irq_set_status_flags(i2c_dev->irq, IRQ_NOAUTOEN);
 
-	ret = devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
-			       IRQF_NO_SUSPEND, dev_name(&pdev->dev),
+	err = devm_request_irq(i2c_dev->dev, i2c_dev->irq, tegra_i2c_isr,
+			       IRQF_NO_SUSPEND, dev_name(i2c_dev->dev),
 			       i2c_dev);
-	if (ret)
-		return ret;
+	if (err)
+		return err;
 
-	i2c_dev->rst = devm_reset_control_get_exclusive(&pdev->dev, "i2c");
+	i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
 	if (IS_ERR(i2c_dev->rst)) {
-		dev_err_probe(&pdev->dev, PTR_ERR(i2c_dev->rst),
+		dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
 			      "failed to get reset control\n");
 		return PTR_ERR(i2c_dev->rst);
 	}
 
 	tegra_i2c_parse_dt(i2c_dev);
 
-	ret = tegra_i2c_init_clocks(i2c_dev);
-	if (ret)
-		return ret;
+	err = tegra_i2c_init_clocks(i2c_dev);
+	if (err)
+		return err;
 
-	ret = tegra_i2c_init_dma(i2c_dev);
-	if (ret)
+	err = tegra_i2c_init_dma(i2c_dev);
+	if (err)
 		goto release_clocks;
 
 	/*
@@ -1735,16 +1735,16 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	 * not be used for atomic transfers.
 	 */
 	if (!i2c_dev->is_vi)
-		pm_runtime_irq_safe(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
+		pm_runtime_irq_safe(i2c_dev->dev);
+	pm_runtime_enable(i2c_dev->dev);
 
-	ret = tegra_i2c_init_hardware(i2c_dev);
-	if (ret)
+	err = tegra_i2c_init_hardware(i2c_dev);
+	if (err)
 		goto release_rpm;
 
 	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
-	i2c_dev->adapter.dev.of_node = pdev->dev.of_node;
-	i2c_dev->adapter.dev.parent = &pdev->dev;
+	i2c_dev->adapter.dev.of_node = i2c_dev->dev->of_node;
+	i2c_dev->adapter.dev.parent = i2c_dev->dev;
 	i2c_dev->adapter.retries = 1;
 	i2c_dev->adapter.timeout = 6 * HZ;
 	i2c_dev->adapter.quirks = i2c_dev->hw->quirks;
@@ -1756,23 +1756,23 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (i2c_dev->hw->supports_bus_clear)
 		i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;
 
-	strlcpy(i2c_dev->adapter.name, dev_name(&pdev->dev),
+	strlcpy(i2c_dev->adapter.name, dev_name(i2c_dev->dev),
 		sizeof(i2c_dev->adapter.name));
 
-	ret = i2c_add_numbered_adapter(&i2c_dev->adapter);
-	if (ret)
+	err = i2c_add_numbered_adapter(&i2c_dev->adapter);
+	if (err)
 		goto release_rpm;
 
 	return 0;
 
 release_rpm:
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(i2c_dev->dev);
 
 	tegra_i2c_release_dma(i2c_dev);
 release_clocks:
 	tegra_i2c_release_clocks(i2c_dev);
 
-	return ret;
+	return err;
 }
 
 static int tegra_i2c_remove(struct platform_device *pdev)
@@ -1781,7 +1781,7 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&i2c_dev->adapter);
 
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(i2c_dev->dev);
 
 	tegra_i2c_release_dma(i2c_dev);
 	tegra_i2c_release_clocks(i2c_dev);
@@ -1791,15 +1791,15 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 {
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
-	int ret;
+	int err;
 
-	ret = pinctrl_pm_select_default_state(i2c_dev->dev);
-	if (ret)
-		return ret;
+	err = pinctrl_pm_select_default_state(dev);
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
@@ -1808,8 +1808,8 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 	 * domain ON.
 	 */
 	if (i2c_dev->is_vi) {
-		ret = tegra_i2c_init(i2c_dev);
-		if (ret)
+		err = tegra_i2c_init(i2c_dev);
+		if (err)
 			goto disable_clocks;
 	}
 
@@ -1818,7 +1818,7 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 disable_clocks:
 	clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
 
-	return ret;
+	return err;
 }
 
 static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
@@ -1827,20 +1827,23 @@ static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
 
 	clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
 
-	return pinctrl_pm_select_idle_state(i2c_dev->dev);
+	return pinctrl_pm_select_idle_state(dev);
 }
 
 static int __maybe_unused tegra_i2c_suspend(struct device *dev)
 {
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
-	int err = 0;
+	int err;
 
 	i2c_mark_adapter_suspended(&i2c_dev->adapter);
 
-	if (!pm_runtime_status_suspended(dev))
+	if (!pm_runtime_status_suspended(dev)) {
 		err = tegra_i2c_runtime_suspend(dev);
+		if (err)
+			return err;
+	}
 
-	return err;
+	return 0;
 }
 
 static int __maybe_unused tegra_i2c_resume(struct device *dev)
-- 
2.27.0

