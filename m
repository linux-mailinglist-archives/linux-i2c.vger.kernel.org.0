Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 796C0262319
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730243AbgIHWoH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730030AbgIHWkt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:40:49 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD71FC061757;
        Tue,  8 Sep 2020 15:40:48 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id c2so938538ljj.12;
        Tue, 08 Sep 2020 15:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XiCNom3qeiM4/HKNi2tbRXmQDZ+48GTNMpi9iQMW9rk=;
        b=X2pzHZ7hj2uWs1U1oTtnzDpD/pB+tlNateDbFmEplEPbkjW1y86/62B0tg1awBcLsr
         b29RQU5eo39EMXZP6RoBHs5SMDHS9nQRy8oact3xz5wWjOQrybgPPMrrqDC0sjKuFBgj
         lHDC1KySZWVSlTuT9BxCs18GqPN2XQQ7ibxFh1jfuOAba1qJb9QsH6Eq83P47vA4EGwB
         y39XC56P/cZ4N6PrdcaLpA/erJjLvd+QQzAV1BsNF3b7qdfAIewJ925UZjismDS/44l4
         VwLvD20NTkGcdHwXAgqz+ypeNnsOTdPZWSF/xRVU4rqbP7MT5igYo9yOzF4K4FnUs0jq
         V/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XiCNom3qeiM4/HKNi2tbRXmQDZ+48GTNMpi9iQMW9rk=;
        b=QT4Mfyii3MxVq8abflC5meoSMbDob5uXSI4dFesnjOZ1so1M2qbLyeGIf2beeDS2fP
         S+0DVnNatdBtnA6BSoYuPcbp0oIgR6M1T/RTuY0DbTTGPn0WxnPNBxQv42EEevOSTfX4
         tmnAdfcgVCPV0GyNavyyuX1vmxBgEYR7XuLfNsfkRCRn9+JFNokjUqa/HXa6iacTUm5s
         0ouJ1ivAY9riQr4Lt0rrPfdrmM/cvzHuoCfH3kPVTbEuiT7wUoYi0HllhBB7xBKPAF4p
         /utgU0Q3L1xYaJllI788slbBKgJ9H0n9bKvtP55QHhSx50DMOFv18TlmFDoRvIGTZQa/
         V7zA==
X-Gm-Message-State: AOAM530lAmGvQxau+QrEQn9n0doX2PrltXuUsFyZSP61oL7bHavr9EeJ
        bv0YxQyDb/YGovIBsXWHhlw=
X-Google-Smtp-Source: ABdhPJzcFheTR5/u5z6+j8Eje+GnpuWUgmHbzFMkNcHOQP09DHsWwELgG1+ZUQqqygSNCeRnZmd6kw==
X-Received: by 2002:a2e:9dcb:: with SMTP id x11mr77160ljj.450.1599604847306;
        Tue, 08 Sep 2020 15:40:47 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:46 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 16/34] i2c: tegra: Clean up variable types
Date:   Wed,  9 Sep 2020 01:39:48 +0300
Message-Id: <20200908224006.25636-17-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Don't use signed types for unsigned values and use consistent types
for sibling variables.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 38 +++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 5a0bb5b3876c..71e82a68c942 100644
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

