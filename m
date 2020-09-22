Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66DE5274CC1
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbgIVWyI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbgIVWwr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:52:47 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4923AC061755;
        Tue, 22 Sep 2020 15:52:47 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id m5so19865580lfp.7;
        Tue, 22 Sep 2020 15:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6xnw+sFR+gXn0SkV0RlCBllV99zkflMnQ50l4nHtI4Q=;
        b=l60/rV1Fu+ypdzOSSHaz4AR1dRB4Uk+EyYzU4LoUTXlAo5SgehEdD6quha+tITjMag
         WFhV3CrE5zGOhECVVWXqAMx9h5aHaox6PWmz6NyTt4N/dTB1v5Q3ZdutGDOZRpOEpgqH
         Paj2YkCq41ewn6JO7IG5UuXb3OAnB3V+uewmYC90qnj7UmHpS+Qcajhi1EQXaiHNeHyf
         zlpF9+aVnw/71404+F0PFBJnJ/Ml3I9agDbPI9vmJL4NeigaAS2X90clw7egPl3hxESo
         TnZsf9I9a7T7+kZ8dSf5a2c3+sW4I6ss7C1RJ9aq4oQi/SgmLTRqZM9BF1SpiB1GRM4b
         xkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6xnw+sFR+gXn0SkV0RlCBllV99zkflMnQ50l4nHtI4Q=;
        b=gtymEgMrhvmI4IIephtmkguejatMhcNbwUeQ1xWC7RfkWVgVeXh0dZJPlVYNaKn5I/
         4xT6Vfv5Sa2gMMoh4qCYSx1Uqoo49upoNFAilZVML3qxoguEpy6RyNvwT3hZD1PVvy0b
         bWiLljLeBoAYTVw0BCm7XdpxQmNby3ZZcZ3ZuF955Hb2L5RN2I/IsO0qH5Wog0XqdhR7
         IYKscNZHJ2AQTwBJOjgjTrOcT1lbUNJqzNidUlrndnQGXteIht/1mffpsH23Hm+Wj9+f
         yqLbe6FdNoyvo/Dj4SbpiwRbbWeL1dSxogMlypOIJtisUe1UgJdSr5ga/X2MkVLbdiF7
         wf/w==
X-Gm-Message-State: AOAM530NJJqsS6IHSK0IGAHVekpUTqU2ghWf53+A/zEe/WFPvlrgPal2
        GfbKFZ20GyvlURRJ45k76R8=
X-Google-Smtp-Source: ABdhPJwJKfttmDpwef0Mi739I9kan+R6ACwnx9PcoirtAchWa87zWqA4P+T7V1AjT6vmQNhQ8fjF/Q==
X-Received: by 2002:ac2:50cd:: with SMTP id h13mr2337822lfm.437.1600815165730;
        Tue, 22 Sep 2020 15:52:45 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:45 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 16/32] i2c: tegra: Clean up variable types
Date:   Wed, 23 Sep 2020 01:51:39 +0300
Message-Id: <20200922225155.10798-17-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Don't use signed types for unsigned values and use consistent types
for sibling variables.

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

