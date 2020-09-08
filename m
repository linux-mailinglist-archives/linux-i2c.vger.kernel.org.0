Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87DB2622E6
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbgIHWmT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730131AbgIHWlI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:41:08 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D4AC0617A0;
        Tue,  8 Sep 2020 15:41:00 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id r24so1001520ljm.3;
        Tue, 08 Sep 2020 15:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jp6sLoMvSh2T712L5Y0H84TY9KtRLg7Lg5NuMcGn8oY=;
        b=FPhQFowQarLiiZwI6sJZ8U/6C0aTSgTO8uvITkJT+HNS2UbLBfGKep1FFlIDQ0u1dg
         DPiczwFumyLE7edkU/maCwZa650Jbycssu8MgLfZ1cOEb/ghtID7FIwIl+N9VNbJFm/D
         NfVmerXoRSRxTXtN/Uac4DjPdq6ICvA6+6/XzVItleZ8B/trZ+9s3fui8OE/7NOn5JmQ
         zpfwsYj92/f94NR/Mu2qFmdP98CRWVx/X7i78cCbHqWbdykeLCPEoaxq5TwauXZXOpaZ
         qZWO/rVcMuJAtgbb6UDGxkIkY5464cko0/rkEPK6G7zmfOn36y8eMCS0VUxmkCInTTlF
         +NNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jp6sLoMvSh2T712L5Y0H84TY9KtRLg7Lg5NuMcGn8oY=;
        b=Q/KqxOYZ8r1gQpZ/McWi1POIzUyH2pzCJi1yRvMyvb7B/AXq4IBxKt/Xfz1IqqBiNT
         y/19Cal1JN8kyOa5KcGvtiM3alwvdeEoF975gpXA3e5O633vcAIrbHrGj5Uf/hYF3A94
         aOrmCKst+rmIwuDoRHe1RFkVpAGh9+DyO9ccDNGIJRVKB+6N7R0c/AUD/sR4bi0/aoQ5
         PEuX8ar08qfNoinzv+GMVO8YkXyuT3GVf4BFR0AKBxcHdmvQk19FKLdojgpYU2wsvNsq
         9k1JrWQ+yhcYhGYQkDsHPvP0lMYHyMgFVfzULLHh4VneJS3t8uqXdQ3gRB6PE73/qp87
         zxLg==
X-Gm-Message-State: AOAM533Mhutl35bL0qDFD3iamChPHPuaarTrNIOhzcsTPTstiPXy+Hi7
        5fTp1mEjsXFemTKJJXLRhqMa7TBk2Us=
X-Google-Smtp-Source: ABdhPJztZWUEnyiTWjQV6lOD5lhS0sFIEp2WQffuBeULcUuz9Xe64roVfgDvRb7qW1Crf4rQjxWPgA==
X-Received: by 2002:a2e:a550:: with SMTP id e16mr194696ljn.125.1599604858840;
        Tue, 08 Sep 2020 15:40:58 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:58 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 29/34] i2c: tegra: Improve formatting of variables
Date:   Wed,  9 Sep 2020 01:40:01 +0300
Message-Id: <20200908224006.25636-30-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Reorder definition of variables in the code to have them sorted by length
and grouped logically, also replace "unsigned long" with "u32". Do this in
order to make code easier to read.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 97 ++++++++++++++++------------------
 1 file changed, 45 insertions(+), 52 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index ac40c87f1c21..2376f502d299 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -259,42 +259,48 @@ struct tegra_i2c_hw_feature {
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
-	phys_addr_t base_phys;
 	unsigned int cont_id;
 	unsigned int irq;
-	bool is_dvc;
-	bool is_vi;
+
+	phys_addr_t base_phys;
+	void __iomem *base;
+
+	struct clk_bulk_data *clocks;
+	unsigned int nclocks;
+
+	struct clk *div_clk;
+	u32 bus_clk_rate;
+
 	struct completion msg_complete;
+	size_t msg_buf_remaining;
 	int msg_err;
 	u8 *msg_buf;
-	size_t msg_buf_remaining;
-	bool msg_read;
-	u32 bus_clk_rate;
-	bool is_multimaster_mode;
+
+	struct completion dma_complete;
 	struct dma_chan *tx_dma_chan;
 	struct dma_chan *rx_dma_chan;
+	unsigned int dma_buf_size;
 	dma_addr_t dma_phys;
 	u32 *dma_buf;
-	unsigned int dma_buf_size;
-	bool is_curr_dma_xfer;
-	struct completion dma_complete;
+
+	bool is_multimaster_mode;
 	bool is_curr_atomic_xfer;
+	bool is_curr_dma_xfer;
+	bool msg_read;
+	bool is_dvc;
+	bool is_vi;
 };
 
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
@@ -303,8 +309,7 @@ static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
  * i2c_writel and i2c_readl will offset the register if necessary to talk
  * to the I2C block inside the DVC block
  */
-static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
-					unsigned long reg)
+static u32 tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev, u32 reg)
 {
 	if (i2c_dev->is_dvc)
 		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
@@ -313,8 +318,7 @@ static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
 	return reg;
 }
 
-static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
-		       unsigned long reg)
+static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val, u32 reg)
 {
 	writel_relaxed(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 
@@ -323,19 +327,19 @@ static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 }
 
-static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
+static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, u32 reg)
 {
 	return readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 }
 
 static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
-			unsigned long reg, unsigned int len)
+			u32 reg, unsigned int len)
 {
 	writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
 }
 
 static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
-		       unsigned long reg, unsigned int len)
+		       u32 reg, unsigned int len)
 {
 	readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
 }
@@ -410,8 +414,8 @@ static void tegra_i2c_release_dma(struct tegra_i2c_dev *i2c_dev)
 static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 {
 	struct dma_chan *chan;
-	u32 *dma_buf;
 	dma_addr_t dma_phys;
+	u32 *dma_buf;
 	int err;
 
 	if (!i2c_dev->hw->has_apb_dma || i2c_dev->is_vi)
@@ -577,12 +581,8 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
-	u32 val;
+	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
 	int err;
-	u32 clk_divisor, clk_multiplier;
-	u32 non_hs_mode;
-	u32 tsu_thd;
-	u8 tlow, thigh;
 
 	/*
 	 * The reset shouldn't ever fail in practice. The failure will be a
@@ -704,11 +704,10 @@ static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 {
-	u32 val;
-	unsigned int rx_fifo_avail;
-	u8 *buf = i2c_dev->msg_buf;
 	size_t buf_remaining = i2c_dev->msg_buf_remaining;
-	unsigned int words_to_transfer;
+	unsigned int words_to_transfer, rx_fifo_avail;
+	u8 *buf = i2c_dev->msg_buf;
+	u32 val;
 
 	/*
 	 * Catch overflow due to message fully sent
@@ -765,11 +764,10 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 {
-	u32 val;
-	unsigned int tx_fifo_avail;
-	u8 *buf = i2c_dev->msg_buf;
 	size_t buf_remaining = i2c_dev->msg_buf_remaining;
-	unsigned int words_to_transfer;
+	unsigned int words_to_transfer, tx_fifo_avail;
+	u8 *buf = i2c_dev->msg_buf;
+	u32 val;
 
 	if (i2c_dev->hw->has_mst_fifo) {
 		val = i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
@@ -830,9 +828,9 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 
 static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 {
-	u32 status;
 	const u32 status_err = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	struct tegra_i2c_dev *i2c_dev = dev_id;
+	u32 status;
 
 	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
@@ -935,12 +933,10 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 
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
@@ -1062,9 +1058,8 @@ static unsigned long tegra_i2c_wait_completion(struct tegra_i2c_dev *i2c_dev,
 static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
+	u32 reg, time_left;
 	int err;
-	unsigned long time_left;
-	u32 reg;
 
 	reinit_completion(&i2c_dev->msg_complete);
 	reg = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
@@ -1178,11 +1173,10 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			      struct i2c_msg *msg,
 			      enum msg_end_type end_state)
 {
-	u32 int_mask;
-	unsigned long time_left;
+	unsigned long time_left, xfer_time = 100;
 	size_t xfer_size;
-	int err = 0;
-	u16 xfer_time = 100;
+	u32 int_mask;
+	int err;
 
 	err = tegra_i2c_flush_fifos(i2c_dev);
 	if (err)
@@ -1340,8 +1334,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			  int num)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
-	int i;
-	int ret;
+	int i, ret;
 
 	ret = pm_runtime_get_sync(i2c_dev->dev);
 	if (ret < 0) {
@@ -1601,8 +1594,8 @@ MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
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

