Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 581D327DBED
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729780AbgI2WW2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728943AbgI2WUz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:20:55 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0712FC0613D6;
        Tue, 29 Sep 2020 15:20:53 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id z19so7443860lfr.4;
        Tue, 29 Sep 2020 15:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XWFoXs3hK7SKJQyLKEJ5CxHSUwIhrk56YArYvrcfKrQ=;
        b=LmlmmgqhUtfXKWdMhfJ5VJDq++XWq2XlWlKR8mA0J9OjnfZNmuYvWEiy6r8MAb/puV
         R8lEtIYcxn+JO8lG66I2C1IFha7+UaTWXPEP0PQdQTBWvOUKcqVIteFqADY8mKe4PWT9
         EKIDGO5hbL3PcDlv6HEGZfuo0jgCcp5fXbOOQoG9B7PeEcMaFYFYJUhlUBJvPzmyZp8k
         07Qwiu6Z+i2dY5GvsVAouHeHIbTYQnhW04LVBVtPsjLw/AUizcrLla5YeVNF9UOSCqWj
         399ae75B4Z2xKOxLnWb96MSADViOUYStPJz8LnlDPs4pzQMeL/4cf+VDIns32GhTGGSd
         E17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XWFoXs3hK7SKJQyLKEJ5CxHSUwIhrk56YArYvrcfKrQ=;
        b=TjSUJilcnOYveB7Mp4oo5mGX4AGfJSxIPvO/89iaXCPT9muH3NeSHXZ0OlDvMtjO4p
         wDZ4yXDrVhJ6ECN4moghmavM1ffWfbVWTtWUobZdCJwGV4snwtoJolw0Rq2wg3w0Oyky
         Ei5O7Xbb4JJB35MaXtWWhevll6b/UfcnG3LulWB9YAu8K4H2DGQDSAKDU3+LVjwRTZsk
         bUl2O6VnMcALAgJFNgdfTd4bZiYgq/hCDMcYfUsuJzYogsUHkS5hY3uCV169xeQPhyKl
         NcnRH3ucINVdvc/l9X/S802I41YCatecmyN7gA2LIw4LMju/gH3bujKe/pm76NgppNpv
         Yobg==
X-Gm-Message-State: AOAM531d/cFvCg4KsyWUZ/kG90d0jSRSXA88nHdqkitgHXzL+lr4J6PA
        E6EoOzvH1fOUyLex5oZ/3x4=
X-Google-Smtp-Source: ABdhPJx8VwKUaYeLf/zeO61pAMEeEChqrgzZz+GCBfzTXtUye8NQYsUboHI7gUhKBdYaRahRTlCv5A==
X-Received: by 2002:a19:e03:: with SMTP id 3mr1794675lfo.488.1601418051451;
        Tue, 29 Sep 2020 15:20:51 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:51 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 16/32] i2c: tegra: Clean up variable types
Date:   Wed, 30 Sep 2020 01:18:59 +0300
Message-Id: <20200929221915.10979-17-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Don't use signed types for unsigned values and use consistent types
for sibling variables.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 38 +++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 990eeb832492..a56c0873f4a3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -206,20 +206,20 @@ struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
 	bool has_per_pkt_xfer_complete_irq;
 	bool has_config_load_reg;
-	int clk_divisor_hs_mode;
-	int clk_divisor_std_mode;
-	int clk_divisor_fast_mode;
-	u16 clk_divisor_fast_plus_mode;
+	u32 clk_divisor_hs_mode;
+	u32 clk_divisor_std_mode;
+	u32 clk_divisor_fast_mode;
+	u32 clk_divisor_fast_plus_mode;
 	bool has_multi_master_mode;
 	bool has_slcg_override_reg;
 	bool has_mst_fifo;
 	const struct i2c_adapter_quirks *quirks;
 	bool supports_bus_clear;
 	bool has_apb_dma;
-	u8 tlow_std_mode;
-	u8 thigh_std_mode;
-	u8 tlow_fast_fastplus_mode;
-	u8 thigh_fast_fastplus_mode;
+	u32 tlow_std_mode;
+	u32 thigh_std_mode;
+	u32 tlow_fast_fastplus_mode;
+	u32 thigh_fast_fastplus_mode;
 	u32 setup_hold_time_std_mode;
 	u32 setup_hold_time_fast_fast_plus_mode;
 	u32 setup_hold_time_hs_mode;
@@ -267,15 +267,15 @@ struct tegra_i2c_dev {
 	struct reset_control *rst;
 	void __iomem *base;
 	phys_addr_t base_phys;
-	int cont_id;
-	int irq;
-	int is_dvc;
+	unsigned int cont_id;
+	unsigned int irq;
+	bool is_dvc;
 	bool is_vi;
 	struct completion msg_complete;
 	int msg_err;
 	u8 *msg_buf;
 	size_t msg_buf_remaining;
-	int msg_read;
+	bool msg_read;
 	u32 bus_clk_rate;
 	bool is_multimaster_mode;
 	struct dma_chan *tx_dma_chan;
@@ -329,13 +329,13 @@ static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
 }
 
 static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
-			unsigned long reg, int len)
+			unsigned long reg, unsigned int len)
 {
 	writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
 }
 
 static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
-		       unsigned long reg, int len)
+		       unsigned long reg, unsigned int len)
 {
 	readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
 }
@@ -712,10 +712,10 @@ static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
 static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val;
-	int rx_fifo_avail;
+	unsigned int rx_fifo_avail;
 	u8 *buf = i2c_dev->msg_buf;
 	size_t buf_remaining = i2c_dev->msg_buf_remaining;
-	int words_to_transfer;
+	unsigned int words_to_transfer;
 
 	/*
 	 * Catch overflow due to message fully sent
@@ -773,10 +773,10 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val;
-	int tx_fifo_avail;
+	unsigned int tx_fifo_avail;
 	u8 *buf = i2c_dev->msg_buf;
 	size_t buf_remaining = i2c_dev->msg_buf_remaining;
-	int words_to_transfer;
+	unsigned int words_to_transfer;
 
 	if (i2c_dev->hw->has_mst_fifo) {
 		val = i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
@@ -1134,7 +1134,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	i2c_dev->msg_buf = msg->buf;
 	i2c_dev->msg_buf_remaining = msg->len;
 	i2c_dev->msg_err = I2C_ERR_NONE;
-	i2c_dev->msg_read = (msg->flags & I2C_M_RD);
+	i2c_dev->msg_read = !!(msg->flags & I2C_M_RD);
 	reinit_completion(&i2c_dev->msg_complete);
 
 	if (i2c_dev->msg_read)
-- 
2.27.0

