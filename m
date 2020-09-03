Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7F325B7D3
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 02:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgICAyn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 20:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727929AbgICAyO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 20:54:14 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0D66C061260;
        Wed,  2 Sep 2020 17:54:13 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id 12so816845lfb.11;
        Wed, 02 Sep 2020 17:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9WNZAy5d8w/2aZQaSppgQxzu4NzUo1Ls4jIsDPeeyAE=;
        b=cL8gaMkP/qIe5jIburqRzxHjDtaEvXk8r00yeDxJLi4kosFKKTgwGthfIhpsYFwzU9
         LuznNryaNMV/wQ/F1EiFPzwYKBtalDbhJCMBUwkXLxX6h2ZZw/yXOjtj1v2XeZfzEkLa
         rV+qh7U11K05I9+6kRgsQf+0sOoDegZbzjQ57z0NWZczIUn4reQn/8sGL2b7t9NNHozO
         hBzRVnNRn1RCt8JkhsqAxg2KEnU9V68tM2dw2h3EKXsWYVlLNOPCzgX8IaELUMQXtRQ4
         Y8w0+3Y/dOW1yPwFUBGke6+373ERELzT3ExVvVFjgp+v+yL0T+EhjoC7cnnyUa9piu5P
         phSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9WNZAy5d8w/2aZQaSppgQxzu4NzUo1Ls4jIsDPeeyAE=;
        b=A24ABjlzTQpvTd3xNTYAL2LURaW6UA5NDyr262uQ0PzWCDCrxRZIgvcFyc0tFjNnWo
         hzRFBbjoMPfvU/gO81CxNAH2nl/IdYTcixT9W+MLHjeypqvM4vy2V+Abq4mEDY5nlKnn
         DioUhbcJmVi1MhwN2XK8dSb0DIV7+5wUsANuhplbquTXGr4dN1gfJeAVkiTHGvEeVMV/
         wOPQdNuIrI23r5pL0TUCTqirvPGsD1Sa2VIMHZTIDjHyB66Qjw7/ijTknweTPMRE/mo7
         DK95iWNb6oYLyp40eh2CPefuCTdC8nd9G17h+OBYiFz9I78hs7af7sFkqaVwIL6g6Nig
         x9gg==
X-Gm-Message-State: AOAM532ilD9EDjpMSH6z+G4GJW+YAlfUiRFyvHekKo0OgYjZ72KaR9ps
        AAhehkxkpNic+ZUBuUNuwrE=
X-Google-Smtp-Source: ABdhPJw5rTqeH77amUjG22ecDVv57oKV7/8lxjbux8BAiymEhT0sZROtLoCrIiuaF9YtBFkOdMY4OQ==
X-Received: by 2002:a19:6e45:: with SMTP id q5mr292110lfk.104.1599094452095;
        Wed, 02 Sep 2020 17:54:12 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:54:11 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 22/22] i2c: tegra: Remove i2c_dev.clk_divisor_non_hs_mode member
Date:   Thu,  3 Sep 2020 03:53:00 +0300
Message-Id: <20200903005300.7894-23-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903005300.7894-1-digetx@gmail.com>
References: <20200903005300.7894-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The "non_hs_mode" divisor value is fixed, thus there is no need to have
the variable i2c_dev.clk_divisor_non_hs_mode struct member. Let's remove
it and move the mode selection into tegra_i2c_init() where it can be
united with the timing selection.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 52 ++++++++++++++--------------------
 1 file changed, 21 insertions(+), 31 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index bc7954c8a5a0..f3540dcb0e06 100644
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
@@ -603,7 +601,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
-	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh;
+	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
 	int err;
 
 	err = reset_control_reset(i2c_dev->rst);
@@ -625,24 +623,32 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
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
@@ -657,7 +663,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
 
 	clk_multiplier  = tlow + thigh + 2;
-	clk_multiplier *= i2c_dev->clk_divisor_non_hs_mode + 1;
+	clk_multiplier *= non_hs_mode + 1;
 
 	err = clk_set_rate(i2c_dev->div_clk,
 			   i2c_dev->bus_clk_rate * clk_multiplier);
@@ -1633,7 +1639,7 @@ static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 	const struct tegra_i2c_hw_feature *hw = i2c_dev->hw;
 	struct device *dev = i2c_dev->dev;
 	struct clk *clk;
-	int err, mode;
+	int err;
 
 	clk = devm_clk_get(dev, "div-clk");
 	if (IS_ERR(clk))
@@ -1686,22 +1692,6 @@ static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 		}
 	}
 
-	switch (i2c_dev->bus_clk_rate) {
-	case I2C_MAX_FAST_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
-		mode = hw->clk_divisor_fast_plus_mode;
-		break;
-
-	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_FREQ:
-		mode = hw->clk_divisor_fast_mode;
-		break;
-
-	default:
-		mode = hw->clk_divisor_std_mode;
-		break;
-	}
-
-	i2c_dev->clk_divisor_non_hs_mode = mode;
-
 	return 0;
 
 unprepare_div_clk:
-- 
2.27.0

