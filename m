Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D90325B7F8
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 02:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgICAzZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 20:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727804AbgICAx6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 20:53:58 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5143AC061245;
        Wed,  2 Sep 2020 17:53:58 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a15so1448951ljk.2;
        Wed, 02 Sep 2020 17:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Fbav35DylyG31VGtNGcRkkQWl1nlYoWvd2/HtfHxMg=;
        b=Gd8Mzjmn32f0v35D4tGYOAhJQWqbzqMDQD1l6HyRi6zyjY3o4yG1PFNeXkFgrT0WCJ
         Mnu7cG98PZiFd6mVRQW28auxAjaB/Bp/8H4Iww5IZktX0aDOOmjISknZ2Y1Ia8phPavR
         vhI9bIFiydnxPaKXc06rJwMLGY+ZKp7kWaFtB/6bzUOeq705C8LCUDb/Bveu984c7EBQ
         E3GYETNMJn84TYPI6+Q3T4GuBGyXXxbmivbU1jfNmgWWpqeibToqmpjEopfVF69vLw5J
         GzUKq4topKPjJl/ftGf+v2qd1hwhZBHEpd1kyj7QFsV/AF5Gp/5is30vLtxwcp0IQfuz
         y+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Fbav35DylyG31VGtNGcRkkQWl1nlYoWvd2/HtfHxMg=;
        b=UX4maxzGBA7NmJdeBIGFinvLBSZ1p1ruNSF7kpovUlUGh3ICqnZXFVEtWWpFlSo6yv
         zVJyahD9lDA9JmrRm0Hq4yU80iFAotMah9Gtl/b6a4K5qcc9y9dnj4rppwLHOlOXFygS
         /FfYSxw89o252ua76G6KZHYuQrc8cK5RyjxEDN8Dh3uax90E57/DjAMFFYbKlfVWg5n4
         nZ/UsUWwKVXeW2s8fPUXkQR6DBS1OTqzP1NHCY/Oi+jneiJ3vsMm5Gkiv8O2FZocFDTP
         PuebSTyY06kz6C13Xauzz/Idbxp4IfFubhe0tjqKVp8XrvL9jIi0RBDTIiaOurLD1o/Z
         cupQ==
X-Gm-Message-State: AOAM530SpQyb8MVBqUJOemdUOrAj2C5fLGNPI8IEn8u8GyGqnQ2q2Bz1
        jOns0VIQfZMsEROLuXsvw0M=
X-Google-Smtp-Source: ABdhPJwJjDHDKkUpzQ0cPkBGkWXHGKq3sgUsvGnsE6eYMRLxtL+2wD16LJpEX0Wh9uk63mbn3cvtZA==
X-Received: by 2002:a2e:9e43:: with SMTP id g3mr263001ljk.122.1599094436722;
        Wed, 02 Sep 2020 17:53:56 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:53:56 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/22] i2c: tegra: Improve formatting of function variables
Date:   Thu,  3 Sep 2020 03:52:44 +0300
Message-Id: <20200903005300.7894-7-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903005300.7894-1-digetx@gmail.com>
References: <20200903005300.7894-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Reorder the definition of variables in the code in order to make code
easier to read.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 51 ++++++++++++++--------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 22f6020e79aa..98b1a5656518 100644
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
@@ -523,11 +523,11 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 
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
@@ -584,11 +584,11 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 
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
@@ -794,11 +794,8 @@ static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 {
-	u32 val;
+	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh;
 	int err;
-	u32 clk_divisor, clk_multiplier;
-	u32 tsu_thd;
-	u8 tlow, thigh;
 
 	err = reset_control_reset(i2c_dev->rst);
 	if (WARN_ON_ONCE(err))
@@ -906,9 +903,9 @@ static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
 
 static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 {
-	u32 status;
 	const u32 status_err = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	struct tegra_i2c_dev *i2c_dev = dev_id;
+	u32 status;
 
 	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
@@ -1012,12 +1009,11 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
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
@@ -1142,9 +1138,9 @@ tegra_i2c_wait_completion_timeout(struct tegra_i2c_dev *i2c_dev,
 static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
-	int err;
 	unsigned long time_left;
 	u32 reg;
+	int err;
 
 	reinit_completion(&i2c_dev->msg_complete);
 	reg = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
@@ -1180,14 +1176,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
@@ -1381,8 +1375,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			  int num)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
-	int i;
-	int ret;
+	int i, ret;
 
 	ret = pm_runtime_get_sync(i2c_dev->dev);
 	if (ret < 0) {
@@ -1437,8 +1430,8 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 {
 	struct device_node *np = i2c_dev->dev->of_node;
-	int ret;
 	bool multi_mode;
+	int ret;
 
 	ret = of_property_read_u32(np, "clock-frequency",
 				   &i2c_dev->bus_clk_rate);
@@ -1664,14 +1657,12 @@ MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
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

