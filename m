Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B878425EAB9
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728800AbgIEUpp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728727AbgIEUmn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:43 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43FA9C061261;
        Sat,  5 Sep 2020 13:42:42 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id c2so11745854ljj.12;
        Sat, 05 Sep 2020 13:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6akcyAKbNZHjlI/uA35cHe7PHmb9+14I4wwalCgHJ54=;
        b=lXTUVS1R1eGWEfrpt6e/OzuCGhC2bM6A1teS7PCe0bYHyCMhqAzcej75Ftq5kYsu1J
         +VF7/gvyTOSZ9j0Us9dwBXip0dt9GqnTlAVB/QxTVndnqKW2Upk55P6IW2s3qSJ8QBJl
         7o5SYz2fv73Dmjro2qL5ASM/fneuO57RPjCfphgwLZ3kCO+hBWXFx2dBfp+PkjC2RNId
         itDe+Q+VTYNAaZyPh8ZXdbxnkf05D8w1Zdz4XU7Gu/4rzriwttQGxYMGug506z2Gc8dN
         HvP3elyBXurqGUltMZZEDrUOhstt92veXbzGE/Bym0CMKmtvggeC6+Ey33nT3UGDyJI+
         zy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6akcyAKbNZHjlI/uA35cHe7PHmb9+14I4wwalCgHJ54=;
        b=N23XmrDANWyX0gk0PWYPRCRzixGn5PHf6J7jXygj1AsRev2SofEbct53JbS/n63Ef3
         dWvAoVU4eCjDV6x8gV4JVVYRlLUDypqW0qX+u21wE8ozHf+5+C2eW256jKtGFpDUl9iJ
         XJc45Q3jlNqC83+VmCUvcRCNQAGHCa8nSliLM0z3tWB5f2mpDQsBcgKpSQ3Vqk5FUO7u
         vLdQMmWK5whk7IZlpDS3WfJkzK7Ad3ykIuWCtrGEaRMvjq9YAME3mzzoFIwhaIdlvkGY
         kvynutsK5vHpzIhPYY+sQfjqPzW326MTj8SGXy3TIpB5ptuMOpX3CzA4dzdNAgdEE9En
         IQPg==
X-Gm-Message-State: AOAM531vih/nYgBU2b7r3A5pqBbcsKcbc9u149S1nt6yiCsvStXtzsWj
        L91DO7hOrEbfRLqdd6MPgtI=
X-Google-Smtp-Source: ABdhPJxHQF+OGxHVTShvHlCJqHugUPPebGHI7YcLZmvsDxF59mqqqXzyrIapDDnW5pEAQBLdWCa9+A==
X-Received: by 2002:a2e:810e:: with SMTP id d14mr7279620ljg.100.1599338560314;
        Sat, 05 Sep 2020 13:42:40 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:39 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 17/31] i2c: tegra: Improve formatting of function variables
Date:   Sat,  5 Sep 2020 23:41:37 +0300
Message-Id: <20200905204151.25343-18-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
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
 drivers/i2c/busses/i2c-tegra.c | 44 ++++++++++++++--------------------
 1 file changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index f52046593b8b..a2ae4dab8001 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -412,8 +412,8 @@ static void tegra_i2c_release_dma(struct tegra_i2c_dev *i2c_dev)
 static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 {
 	struct dma_chan *chan;
-	u32 *dma_buf;
 	dma_addr_t dma_phys;
+	u32 *dma_buf;
 	int err;
 
 	if (!i2c_dev->hw->has_apb_dma || i2c_dev->is_vi)
@@ -505,11 +505,11 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 
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
@@ -566,11 +566,11 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 
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
@@ -755,12 +755,8 @@ static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
 
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
@@ -873,9 +869,9 @@ static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
 
 static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 {
-	u32 status;
 	const u32 status_err = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	struct tegra_i2c_dev *i2c_dev = dev_id;
+	u32 status;
 
 	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
@@ -979,12 +975,11 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
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
@@ -1110,9 +1105,9 @@ tegra_i2c_wait_completion_timeout(struct tegra_i2c_dev *i2c_dev,
 static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
-	int err;
 	unsigned long time_left;
 	u32 reg;
+	int err;
 
 	reinit_completion(&i2c_dev->msg_complete);
 	reg = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
@@ -1149,13 +1144,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
@@ -1351,8 +1344,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			  int num)
 {
 	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
-	int i;
-	int ret;
+	int i, ret;
 
 	ret = pm_runtime_get_sync(i2c_dev->dev);
 	if (ret < 0) {
@@ -1406,8 +1398,8 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
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

