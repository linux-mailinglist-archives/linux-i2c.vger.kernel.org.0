Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66DA25EFC3
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729390AbgIFSyW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729196AbgIFSv5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:51:57 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A57BC061573;
        Sun,  6 Sep 2020 11:51:57 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id u27so6366478lfm.13;
        Sun, 06 Sep 2020 11:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6CsyZHMgeyKQ9RhAZiGTewkFvOhCcuymJguNVyDQdTA=;
        b=EFOARFRPLV8Nc2TQclzd1k3vpy1grapJnMWyEk5gyZ8Opvkl547itwA//ZfSQLeYlh
         Ho4FmkEDiCs6fYLHvZgfgdOXlyBDZReyHZrH+pJrRxFnp8pxxvW6zSrzRIi9OLIpm1LY
         RjUYodpPvwDXC4aFoOe9ZExCg+GaDpt7ueuBd+fZFXQC3F0OsLuqhfWO9gNAXlrqKmen
         VMQMegWrhcfUQDxVthgrF42apNJcy8Vvx3+VaJQH2e4Jyg4IPzZpqqPMog9qUmxhxLg9
         hDp8fUZv1/23gmD0czGN18i3BtTixYVJsBrul16/LtkmxeFurlrPhP762UtjfZm4G47a
         zf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6CsyZHMgeyKQ9RhAZiGTewkFvOhCcuymJguNVyDQdTA=;
        b=g34qV6euVdnHvTCD9HzTDIbZ9EbXVj5gXSBj8vNOE+SC19wNT2I18uBst7l02flgTc
         kQ6bfLYmFd/4p1H0baDDG93e93ZpdC9k1RrXbn/UuyPYe9SzeB4sXCdCGTaw/7LAUKrL
         wW4Rdb9+8oxmrofKPD19/B/S6BERJz2KqmgOgOdC56y8yvm8m7S1NHDdKMAmwndAIWu3
         0/+kjz2IzpS15k6nsWEnQTsy2FjJjdATVA+3WGjMNOkMrlaPeY8cbN1w5hX8xtVeW5CN
         3PUWCmQ0jHSgKv2NFh/kxKuAi2gY/Km+isnl5OUDBLBpPHlU+DoBeAAsxF/hfawQ2AQS
         NHiA==
X-Gm-Message-State: AOAM5327DCQurKNwlU9yXTXvRLse4/s9whiOomDZcBQY4aMQikNjDz3y
        0FxxZ2pIqe+pcKS47fMQapM=
X-Google-Smtp-Source: ABdhPJwcx9FruHFNL+j5oScPyBM5Yy/bt616iDmY19euR1gSOQo6lWO7QN8vwdlwsmkssrxmNTyJxg==
X-Received: by 2002:ac2:5597:: with SMTP id v23mr8536798lfg.5.1599418315741;
        Sun, 06 Sep 2020 11:51:55 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:55 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 19/36] i2c: tegra: Improve formatting of function variables
Date:   Sun,  6 Sep 2020 21:50:22 +0300
Message-Id: <20200906185039.22700-20-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200906185039.22700-1-digetx@gmail.com>
References: <20200906185039.22700-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Reorder definition of variables in the code to have them sorted by length
in order to make code easier to read.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 61 +++++++++++++---------------------
 1 file changed, 24 insertions(+), 37 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index f38e0f3fe367..5ecc9f7c9b78 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -290,13 +290,12 @@ struct tegra_i2c_dev {
 
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev);
 
-static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
-		       unsigned long reg)
+static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val, u32 reg)
 {
 	writel_relaxed(val, i2c_dev->base + reg);
 }
 
-static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
+static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, u32 reg)
 {
 	return readl_relaxed(i2c_dev->base + reg);
 }
@@ -305,8 +304,7 @@ static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
  * i2c_writel and i2c_readl will offset the register if necessary to talk
  * to the I2C block inside the DVC block
  */
-static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
-					unsigned long reg)
+static u32 tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev, u32 reg)
 {
 	if (i2c_dev->is_dvc)
 		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
@@ -315,8 +313,7 @@ static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
 	return reg;
 }
 
-static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
-		       unsigned long reg)
+static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val, u32 reg)
 {
 	writel_relaxed(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 
@@ -325,19 +322,19 @@ static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 }
 
-static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
+static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, u32 reg)
 {
 	return readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 }
 
 static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
-			unsigned long reg, int len)
+			u32 reg, int len)
 {
 	writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
 }
 
 static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
-		       unsigned long reg, int len)
+		       u32 reg, int len)
 {
 	readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
 }
@@ -412,8 +409,8 @@ static void tegra_i2c_release_dma(struct tegra_i2c_dev *i2c_dev)
 static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 {
 	struct dma_chan *chan;
-	u32 *dma_buf;
 	dma_addr_t dma_phys;
+	u32 *dma_buf;
 	int err;
 
 	if (!i2c_dev->hw->has_apb_dma || i2c_dev->is_vi)
@@ -505,11 +502,11 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 {
-	u32 val;
-	int rx_fifo_avail;
-	u8 *buf = i2c_dev->msg_buf;
 	size_t buf_remaining = i2c_dev->msg_buf_remaining;
+	u8 *buf = i2c_dev->msg_buf;
 	int words_to_transfer;
+	int rx_fifo_avail;
+	u32 val;
 
 	/*
 	 * Catch overflow due to message fully sent
@@ -566,11 +563,11 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 {
-	u32 val;
-	int tx_fifo_avail;
-	u8 *buf = i2c_dev->msg_buf;
 	size_t buf_remaining = i2c_dev->msg_buf_remaining;
+	u8 *buf = i2c_dev->msg_buf;
 	int words_to_transfer;
+	int tx_fifo_avail;
+	u32 val;
 
 	if (i2c_dev->hw->has_mst_fifo) {
 		val = i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
@@ -754,12 +751,8 @@ static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
-	u32 val;
+	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
 	int err;
-	u32 clk_divisor, clk_multiplier;
-	u32 non_hs_mode;
-	u32 tsu_thd;
-	u8 tlow, thigh;
 
 	err = reset_control_reset(i2c_dev->rst);
 	WARN_ON_ONCE(err);
@@ -872,9 +865,9 @@ static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
 
 static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 {
-	u32 status;
 	const u32 status_err = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	struct tegra_i2c_dev *i2c_dev = dev_id;
+	u32 status;
 
 	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
@@ -977,12 +970,10 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 
 static int tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev, size_t len)
 {
-	u32 val, reg;
-	u8 dma_burst;
 	struct dma_slave_config slv_config = {0};
+	u32 val, reg, dma_burst, reg_offset;
 	struct dma_chan *chan;
 	int ret;
-	unsigned long reg_offset;
 
 	if (i2c_dev->hw->has_mst_fifo)
 		reg = I2C_MST_FIFO_CONTROL;
@@ -1108,9 +1099,8 @@ tegra_i2c_wait_completion_timeout(struct tegra_i2c_dev *i2c_dev,
 static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
+	u32 reg, time_left;
 	int err;
-	unsigned long time_left;
-	u32 reg;
 
 	reinit_completion(&i2c_dev->msg_complete);
 	reg = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
@@ -1148,13 +1138,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			      struct i2c_msg *msg,
 			      enum msg_end_type end_state)
 {
-	u32 packet_header;
-	u32 int_mask;
-	unsigned long time_left;
-	size_t xfer_size;
+	unsigned long time_left, xfer_time = 100;
+	u32 packet_header, int_mask;
 	u32 *buffer = NULL;
-	int err = 0;
-	u16 xfer_time = 100;
+	size_t xfer_size;
+	int err;
 
 	err = tegra_i2c_flush_fifos(i2c_dev);
 	if (err)
@@ -1353,8 +1341,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			  int num)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
-	int i;
-	int ret;
+	int i, ret;
 
 	ret = pm_runtime_get_sync(i2c_dev->dev);
 	if (ret < 0) {
@@ -1408,8 +1395,8 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 {
 	struct device_node *np = i2c_dev->dev->of_node;
-	int ret;
 	bool multi_mode;
+	int ret;
 
 	ret = of_property_read_u32(np, "clock-frequency",
 				   &i2c_dev->bus_clk_rate);
-- 
2.27.0

