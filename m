Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49E3427DBE9
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728895AbgI2WUn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728877AbgI2WUn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:20:43 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1506EC0613D0;
        Tue, 29 Sep 2020 15:20:43 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u21so5347587ljl.6;
        Tue, 29 Sep 2020 15:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YI1iqQsHMNSYTVgtCUu6Ok1BzINJKMrx0SnKnTj+a0Y=;
        b=GcBQo9RdmIRU4Wqb6tZqKkcGrdbAlBYPCik1uGMHAnhWFdsNP8aM2kD1Q/z4qH3TBt
         t8HNEg9VQnQZxVAOXYIjUwwX4Ad0FO8XPO98v89rDyxGyAQh84vcdALLl8Gohr+kXdJ3
         SDuWKV0jl79ML2KD1CIaaSw/PRt4YU6Fj0Y72LBf5gmDEXwHRI8dkD+VJO7FxlK5o/gw
         wkqXeTZ6P2gv28gtz7NEoMavFjAkbMu/5DM9/Fk1l5Q/JGswOqBP8BojvHt493xIdqG1
         jkElfdA4cqMJM9g8NoKHegxSREI+MTcjk1cdbn4XzFicmsO/Xg37IbvDdQw+9TPks6jA
         5PPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YI1iqQsHMNSYTVgtCUu6Ok1BzINJKMrx0SnKnTj+a0Y=;
        b=AN2gnM06gbqvCpTYefY36WtOgSr6wqH6dhWEoHAxKJvcmk1U8WHdJb9k6L0+ZgNPwd
         nJ5tOikMQ8rVdZLa0v86Ut1cw4O+JHxYh3vvz3UHVwHpty1/Vr1FZKGUD7AQqIHq+0YO
         lCzqk1j4mFVYpwiGR0hmVCcd/edFpv0WtUH2j136qP/ydEM8tO9vpIZn6jTXA64dfH5i
         oMUSCVgTVSxwQB4JQxmPb0J/3JJve9LKqpWIKAknSvEzCFinvyCna6WYz9YIwy3uBJgS
         JwCIKOfuUhEEndVMReV9/Us4x2zJzX1y6XOXN474ABPwEPS5PrSfjDJXtb39Msb0Xmvf
         UfFg==
X-Gm-Message-State: AOAM532rNRQ3KrAXgvyurjG4g9z/5Akm0NjoiC2+zW2qINl4KG5k3ixq
        SnYvg7pXGyfg8enB+oaVHFUw2Zam5l4=
X-Google-Smtp-Source: ABdhPJxrnjzmsr4QwCdoucE25nAuX38rVB6pYMsQ9Z26NYBDQ+o2yNmQ11QhqDO7KZbaDs4v7sr0GQ==
X-Received: by 2002:a2e:b161:: with SMTP id a1mr1740197ljm.189.1601418041419;
        Tue, 29 Sep 2020 15:20:41 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:40 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 06/32] i2c: tegra: Remove i2c_dev.clk_divisor_non_hs_mode member
Date:   Wed, 30 Sep 2020 01:18:49 +0300
Message-Id: <20200929221915.10979-7-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The "non_hs_mode" divisor value is fixed, thus there is no need to have
the variable i2c_dev.clk_divisor_non_hs_mode struct member. Let's remove
it and move the mode selection into tegra_i2c_init() where it can be
united with the timing selection.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 46 ++++++++++++++++------------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 720a75439e91..85ed0e02d48c 100644
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
 
@@ -805,24 +804,33 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
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
+	default:
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
+	case 0 ... I2C_MAX_STANDARD_MODE_FREQ:
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
@@ -837,7 +845,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
 
 	clk_multiplier  = tlow + thigh + 2;
-	clk_multiplier *= i2c_dev->clk_divisor_non_hs_mode + 1;
+	clk_multiplier *= non_hs_mode + 1;
 
 	err = clk_set_rate(i2c_dev->div_clk,
 			   i2c_dev->bus_clk_rate * clk_multiplier);
@@ -1751,18 +1759,6 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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

