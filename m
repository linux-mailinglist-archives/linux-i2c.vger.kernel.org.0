Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43B4625827E
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 22:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgHaUYH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 16:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729993AbgHaUXe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Aug 2020 16:23:34 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD0AFC061575;
        Mon, 31 Aug 2020 13:23:32 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w14so8242698ljj.4;
        Mon, 31 Aug 2020 13:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GLHlPtKZW3oaSnAxdxb6Ut2lkaobqhUaiSU4BDIhVwo=;
        b=s2SjT3e5zert8kx3/5iT0KLS2r/M2QZPRU+fOo1Ej8jCqasA/C4EWk65mCz8t0Abc8
         rJ/2+iRYqi71Uy6+XL8I0hekJbHq+WKIBOjSAbGRtJDb81Lji9CgJX8G56PuVsvneJd9
         VtKq/wECUEW0A45aqY5UAPgqIZMLFFYxDHxwxc2+X/hrZStL8gEg/gDXdwa5IOGDQ4vp
         nQ/0HMfT69UJHBNev9lNZ5EjG3GWI+4UBVvuxWkxpdY/iWXB5IuWtNdHPV+vd/IzFaOq
         ghNkoR9hvpe5Id8CQRADbkItJOdQB68tDu8LXH/Btw5vNLiMqu7Ik6HugHsUZKp4gKcK
         KC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GLHlPtKZW3oaSnAxdxb6Ut2lkaobqhUaiSU4BDIhVwo=;
        b=nGmEHifOifSq4uvMrvfDAw61F9gwuuEjRZhzstDTR/qrac6W/3EXlZsjZPOCEsktUU
         EndT1GKHteAJ9FQYqJhHiHrcO8W4qiIr/0BxSDJOT44sNU+w8qJoSr/VkIYf2zJSHExj
         w/944ITzaqMWCrNzAekcK+Pr+cyvaFhj1KS6Yu0gXnYkcfi1M2ZZOgYxwA7DtqNDirX6
         kuuoZ1D+WUoA+/H1rJPV1y9ZUFqdZQtqg4Y41JijfQ1mOldgiZWiyZ8SpaQ0Q2x5d0qn
         GmL6f29In+jfbLbvISnhxXuop7U/jkBiP4IhSxs6aLUI8dVEZWajle21knsA0GfksQCI
         5zRg==
X-Gm-Message-State: AOAM530wbc65y0HAX3jtWzTuSykBuFNI/ZEHLNyd8Sc5af4eOv7jLxOH
        sQ063hlowGQuXviEe9iBUzs=
X-Google-Smtp-Source: ABdhPJxUJ8ffttDOOKmAUBy3luHUOjhvo5Ks3SEUuUzrQnHA6uys/qvPMM57XkQ+cMi1ywycUB6DLw==
X-Received: by 2002:a05:651c:1b4:: with SMTP id c20mr1320998ljn.432.1598905411289;
        Mon, 31 Aug 2020 13:23:31 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id z20sm1769054ljk.97.2020.08.31.13.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 13:23:30 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 06/12] i2c: tegra: Improve formatting of function variables
Date:   Mon, 31 Aug 2020 23:22:57 +0300
Message-Id: <20200831202303.15391-7-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200831202303.15391-1-digetx@gmail.com>
References: <20200831202303.15391-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Reorder the definition of variables in the code in order to make code
easier to read.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 51 ++++++++++++++--------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6957be34bc41..2c00f2e39514 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -419,8 +419,8 @@ static void tegra_i2c_release_dma(struct tegra_i2c_dev *i2c_dev)
 static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 {
 	struct dma_chan *chan;
-	u32 *dma_buf;
 	dma_addr_t dma_phys;
+	u32 *dma_buf;
 	int err;
 
 	if (!i2c_dev->hw->has_apb_dma || i2c_dev->is_vi)
@@ -513,11 +513,11 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 
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
@@ -574,11 +574,11 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 
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
@@ -785,11 +785,8 @@ static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 {
-	u32 val;
+	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh;
 	int err;
-	u32 clk_divisor, clk_multiplier;
-	u32 tsu_thd;
-	u8 tlow, thigh;
 
 	reset_control_reset(i2c_dev->rst);
 
@@ -895,9 +892,9 @@ static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
 
 static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 {
-	u32 status;
 	const u32 status_err = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	struct tegra_i2c_dev *i2c_dev = dev_id;
+	u32 status;
 
 	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
@@ -1001,12 +998,11 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 				       size_t len)
 {
-	u32 val, reg;
-	u8 dma_burst;
 	struct dma_slave_config slv_config = {0};
+	unsigned long reg_offset;
+	u32 val, reg, dma_burst;
 	struct dma_chan *chan;
 	int ret;
-	unsigned long reg_offset;
 
 	if (i2c_dev->hw->has_mst_fifo)
 		reg = I2C_MST_FIFO_CONTROL;
@@ -1132,9 +1128,9 @@ tegra_i2c_wait_completion_timeout(struct tegra_i2c_dev *i2c_dev,
 static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
-	int err;
 	unsigned long time_left;
 	u32 reg;
+	int err;
 
 	reinit_completion(&i2c_dev->msg_complete);
 	reg = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
@@ -1170,14 +1166,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
+	size_t xfer_size;
 	bool dma;
-	u16 xfer_time = 100;
+	int err;
 
 	err = tegra_i2c_flush_fifos(i2c_dev);
 	if (err)
@@ -1371,8 +1365,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			  int num)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
-	int i;
-	int ret;
+	int i, ret;
 
 	ret = pm_runtime_get_sync(i2c_dev->dev);
 	if (ret < 0) {
@@ -1427,8 +1420,8 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 {
 	struct device_node *np = i2c_dev->dev->of_node;
-	int ret;
 	bool multi_mode;
+	int ret;
 
 	ret = of_property_read_u32(np, "clock-frequency",
 				   &i2c_dev->bus_clk_rate);
@@ -1654,14 +1647,12 @@ MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
 static int tegra_i2c_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct clk *div_clk, *fast_clk;
 	struct tegra_i2c_dev *i2c_dev;
+	phys_addr_t base_phys;
 	struct resource *res;
-	struct clk *div_clk;
-	struct clk *fast_clk;
 	void __iomem *base;
-	phys_addr_t base_phys;
-	int irq;
-	int ret;
+	int irq, ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base_phys = res->start;
-- 
2.27.0

