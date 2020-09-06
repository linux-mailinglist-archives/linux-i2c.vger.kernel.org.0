Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78A0F25EF8C
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729191AbgIFSv4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729122AbgIFSvq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:51:46 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B75C061756;
        Sun,  6 Sep 2020 11:51:45 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id k25so985895ljk.0;
        Sun, 06 Sep 2020 11:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qJN8JDMFMH1+jjJ2ZzpFoBxZu5G7qxZH/FmibKkpCOE=;
        b=DPUd44Hl9BFXL9ckdYr630ht4J/GZMDwn/otD1LlIFXQUg5AtJnhbhsjDRio6s5ZTq
         S54xXW838vaz1HMx0OiqZaUBEWTctTMUeiBAo0rxGt6uNXzTKAQMTwyGIuPZ0/i5NkPO
         x8BONI35Ffdh5w7R7UN7Qn2GOmlUzieuOyO9BydxRLeSTcfrlPDMwjGHI+2XFPheGnww
         DsM21mSz19For/BfuzdJqk1x7DqtLf6ba5+BVsRv5+sSkJRuXH1pj1DkELhfcRf2g6LL
         tmpL13rW7hHsI8lOehuWGRtuBDdga0n8vAhQwzskUDpmGhRuPZhBgv0T6ktHWmrt/HW3
         Q3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qJN8JDMFMH1+jjJ2ZzpFoBxZu5G7qxZH/FmibKkpCOE=;
        b=EVVJtwRQSO0cfx+zgxoO+UR4BfeCRFT390BETGZCk5cBci0sSe2bsPU6CS+Sd43f18
         CSuJs/FNPZrDoMziNaGvhEWHzjgtqqnXQBpxZDZHYLqL6rM6kslDqszZPsPlAq3rlhNN
         cRfUImqoft1groouAQzjeJLSY08eIJh6qfENBqKPbJT6rhy5sS3S6N7d6xmvjdfyuUVS
         CSMuCg1uVHPeQKU2mVUs9dWUmhaW5UTii0bMKNx/xIDbqRUxmHKyr4B3XOZk6kVxEeTb
         Fmy1emoG0Zi7uCGNsylPbf73hvB/neQmxkocsgEYjoDIgYgwH0SCA3uN/rvQbJ8q8otf
         QQzA==
X-Gm-Message-State: AOAM5317ozyyb+jF8suH7IMrWNnS5S/GzkJ1WgzZJemeSLPS8UiECRNq
        jzmCmYomyikXUz95P0WiCFw=
X-Google-Smtp-Source: ABdhPJz51IJTLdpwt7jOkMCqTuDfRxG4Bv68QtS2NBVohChznrzFkZU3+V2wCQd4y3BWIlOoUtaf4Q==
X-Received: by 2002:a2e:97d0:: with SMTP id m16mr9032797ljj.277.1599418303617;
        Sun, 06 Sep 2020 11:51:43 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:43 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 05/36] i2c: tegra: Remove i2c_dev.clk_divisor_non_hs_mode member
Date:   Sun,  6 Sep 2020 21:50:08 +0300
Message-Id: <20200906185039.22700-6-digetx@gmail.com>
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

The "non_hs_mode" divisor value is fixed, thus there is no need to have
the variable i2c_dev.clk_divisor_non_hs_mode struct member. Let's remove
it and move the mode selection into tegra_i2c_init() where it can be
united with the timing selection.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 45 +++++++++++++++-------------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index bfdb8d388ce2..4a9375fc71d8 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -250,7 +250,6 @@ struct tegra_i2c_hw_feature {
  * @msg_buf_remaining: size of unsent data in the message buffer
  * @msg_read: identifies read transfers
  * @bus_clk_rate: current I2C bus clock rate
- * @clk_divisor_non_hs_mode: clock divider for non-high-speed modes
  * @is_multimaster_mode: track if I2C controller is in multi-master mode
  * @tx_dma_chan: DMA transmit channel
  * @rx_dma_chan: DMA receive channel
@@ -281,7 +280,6 @@ struct tegra_i2c_dev {
 	size_t msg_buf_remaining;
 	int msg_read;
 	u32 bus_clk_rate;
-	u16 clk_divisor_non_hs_mode;
 	bool is_multimaster_mode;
 	struct dma_chan *tx_dma_chan;
 	struct dma_chan *rx_dma_chan;
@@ -783,6 +781,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	u32 val;
 	int err;
 	u32 clk_divisor, clk_multiplier;
+	u32 non_hs_mode;
 	u32 tsu_thd;
 	u8 tlow, thigh;
 
@@ -805,24 +804,32 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->is_vi)
 		tegra_i2c_vi_init(i2c_dev);
 
-	/* Make sure clock divisor programmed correctly */
-	clk_divisor = FIELD_PREP(I2C_CLK_DIVISOR_HSMODE,
-				 i2c_dev->hw->clk_divisor_hs_mode) |
-		      FIELD_PREP(I2C_CLK_DIVISOR_STD_FAST_MODE,
-				 i2c_dev->clk_divisor_non_hs_mode);
-	i2c_writel(i2c_dev, clk_divisor, I2C_CLK_DIVISOR);
-
-	if (i2c_dev->bus_clk_rate > I2C_MAX_STANDARD_MODE_FREQ &&
-	    i2c_dev->bus_clk_rate <= I2C_MAX_FAST_MODE_PLUS_FREQ) {
+	switch (i2c_dev->bus_clk_rate) {
+	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
 		tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
 		thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
 		tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
-	} else {
+
+		if (i2c_dev->bus_clk_rate > I2C_MAX_FAST_MODE_FREQ)
+			non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
+		else
+			non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
+		break;
+
+	default:
 		tlow = i2c_dev->hw->tlow_std_mode;
 		thigh = i2c_dev->hw->thigh_std_mode;
 		tsu_thd = i2c_dev->hw->setup_hold_time_std_mode;
+		non_hs_mode = i2c_dev->hw->clk_divisor_std_mode;
+		break;
 	}
 
+	/* Make sure clock divisor programmed correctly */
+	clk_divisor = FIELD_PREP(I2C_CLK_DIVISOR_HSMODE,
+				 i2c_dev->hw->clk_divisor_hs_mode) |
+		      FIELD_PREP(I2C_CLK_DIVISOR_STD_FAST_MODE, non_hs_mode);
+	i2c_writel(i2c_dev, clk_divisor, I2C_CLK_DIVISOR);
+
 	if (i2c_dev->hw->has_interface_timing_reg) {
 		val = FIELD_PREP(I2C_INTERFACE_TIMING_THIGH, thigh) |
 		      FIELD_PREP(I2C_INTERFACE_TIMING_TLOW, tlow);
@@ -837,7 +844,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
 
 	clk_multiplier  = tlow + thigh + 2;
-	clk_multiplier *= i2c_dev->clk_divisor_non_hs_mode + 1;
+	clk_multiplier *= non_hs_mode + 1;
 
 	err = clk_set_rate(i2c_dev->div_clk,
 			   i2c_dev->bus_clk_rate * clk_multiplier);
@@ -1750,18 +1757,6 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		goto unprepare_fast_clk;
 	}
 
-	if (i2c_dev->bus_clk_rate > I2C_MAX_FAST_MODE_FREQ &&
-	    i2c_dev->bus_clk_rate <= I2C_MAX_FAST_MODE_PLUS_FREQ)
-		i2c_dev->clk_divisor_non_hs_mode =
-				i2c_dev->hw->clk_divisor_fast_plus_mode;
-	else if (i2c_dev->bus_clk_rate > I2C_MAX_STANDARD_MODE_FREQ &&
-		 i2c_dev->bus_clk_rate <= I2C_MAX_FAST_MODE_FREQ)
-		i2c_dev->clk_divisor_non_hs_mode =
-				i2c_dev->hw->clk_divisor_fast_mode;
-	else
-		i2c_dev->clk_divisor_non_hs_mode =
-				i2c_dev->hw->clk_divisor_std_mode;
-
 	ret = clk_prepare(i2c_dev->div_clk);
 	if (ret < 0) {
 		dev_err(i2c_dev->dev, "Clock prepare failed %d\n", ret);
-- 
2.27.0

