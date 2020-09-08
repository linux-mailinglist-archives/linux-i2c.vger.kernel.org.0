Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA80926086B
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729007AbgIHCP0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728305AbgIHCMA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:12:00 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03D4EC061756;
        Mon,  7 Sep 2020 19:11:51 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id c2so17973363ljj.12;
        Mon, 07 Sep 2020 19:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nnCEXogDxtK7hntlv9V/OnoOYZ3tQL0WnuA892WUn2E=;
        b=XXPY1nb/YzMDEPH88wBqjwnc8Lx90+vYwkcikpRo7f51G72fpUjQV2ZjbZiFfvAigz
         b4lnxzpdKBwFfZ/K7nX6Tts99XtrKTUg8KtKUAA7XmVurpp8rgXXrG/gwkVhm4Q2EiCQ
         87jnDhPbjp9/Q2vgpOZ3NdrpspDJi2XXocvXs3t79s/pXrHIP1F9H02g7QUccMCzqBj1
         kz32VtXYbDswBv6pKdFM5k33OY1/4A2Uuw7ejHRjTCe/OkDQMma9Y0lGq7Xfj4jYOzUp
         53c58dX6Auur/qsz3ZMp/D5C4jeIroh16AVe8M1SF6zmfMBQMWZlUtQM0FmMMCvHRWaT
         Vm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nnCEXogDxtK7hntlv9V/OnoOYZ3tQL0WnuA892WUn2E=;
        b=ZSCRs1O5Nyw78zGLgGMkHrTREV6UmWNoVgH0PQS10nOY9iXqLP+cWnttbJhDVo6oYi
         Icvg7RHYaHt7d6N64P4PGoLKv2IHuofTqqUEXAQvDWC5iT9lE6fa+Zi9wn8Ilzp4UQ8C
         F5XbRjGe7l3NjFxwKwe95bDChd7M+jTWZ22c6RjwVu+WHLE78I3XPFG4FSvcnVSh9XYh
         sU7L7tbFe1/FzpJUW/v8CcX+E2Z6OFxphZOOFuucmvjhNkndIN2PHd4vUiKilRzXF4KO
         IOn2rYtmVfh22OyA+3gL/Fa2NdUukBrnNkMeTdZfFeUBDos1VTUU8Cn35JT2NC6PYK3z
         mYJQ==
X-Gm-Message-State: AOAM5331JnoalHbfRtuhNyEzl5PFxxU7lSdYuPbX2U3Rhc9V6cwNWoJU
        D2jGx/IMorkkHjKUoU402OU=
X-Google-Smtp-Source: ABdhPJwayapKA0enyxcQDqxpj9flYu8iQAbzeP1/WSJOBQfD5bs+mZSC0uECelLUW/nCqWY3+lAd9A==
X-Received: by 2002:a05:651c:124b:: with SMTP id h11mr12241468ljh.172.1599531109504;
        Mon, 07 Sep 2020 19:11:49 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:48 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 15/35] i2c: tegra: Clean up variable types
Date:   Tue,  8 Sep 2020 05:10:01 +0300
Message-Id: <20200908021021.9123-16-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
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
index 01637e1fccde..8ab31f8100a8 100644
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
@@ -331,13 +331,13 @@ static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
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
@@ -506,10 +506,10 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
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
@@ -567,10 +567,10 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
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
@@ -1178,7 +1178,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	i2c_dev->msg_buf = msg->buf;
 	i2c_dev->msg_buf_remaining = msg->len;
 	i2c_dev->msg_err = I2C_ERR_NONE;
-	i2c_dev->msg_read = (msg->flags & I2C_M_RD);
+	i2c_dev->msg_read = !!(msg->flags & I2C_M_RD);
 	reinit_completion(&i2c_dev->msg_complete);
 
 	if (i2c_dev->msg_read)
-- 
2.27.0

