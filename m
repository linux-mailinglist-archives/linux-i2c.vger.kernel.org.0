Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B457525B7EA
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 02:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbgICAzD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 20:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727867AbgICAyG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 20:54:06 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92506C061244;
        Wed,  2 Sep 2020 17:54:05 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v23so1451983ljd.1;
        Wed, 02 Sep 2020 17:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zZ5romOj71w+BP60fF9NtT6rTMQR/LTg+gaRvAuiW7Q=;
        b=IWUZeKXMHeL7uFx2lG+K6kWnLIogXAV6WYRqYvuDXpyN9BY3r3x+vpVA1pWo7bVnxM
         ng8FU3p+6CGOj4SGTj0d0dis2tZ1/BpJF7N0b0ZKWxM+Soihf3wBiEOjXYczIk3mXUeu
         qfCtZjCIAqsfQ6de2Ogls/skxEZSI4t1L9zAOYIT6qalHJMCaUEyVTfj92C652xfUgYS
         YUi6NqQCLOyJRxug6t4Qv2Et6YCXZX7IsIahcYtWYYesc3OLsZ9PbyvCC3dv7zTNR0cg
         7ZeIE0JmAMGtJzWo0GjT2AiYSzA26uSYdfawPTZETmIpGZkqHnpA0bm5TVH6TjX5Ttc3
         z8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zZ5romOj71w+BP60fF9NtT6rTMQR/LTg+gaRvAuiW7Q=;
        b=WdtU5P9LQCzr/oZ1YWwfbaHEhR3LJFlo7f358eJVSBGO9f9NudKbfnsIX1w7IrSjtM
         +QyEFunp9Ax97/J830KycysRuThsy+Jr/CACy3ytTvtY4xhzNAc5RV2sIMsfYyOkXj0u
         bURmqis0nFKm94aSIw7cKdNh0Qx1xkl4s5otQNzTaW9x6vmRg3MW8auI8bZpDDXW2AXQ
         A3a68aOYCt4yImsKAEgFvPmlXt46g5HnQzEIqndmZJu0fFBArxCCOjVe/gE+gaebtguG
         TGLZdC5VoVL4otPhlThspzX9+42RA+RqD6KpDPdKYf9XYcpN2FyESQjEA+cr+cADquBs
         lWew==
X-Gm-Message-State: AOAM533pMl9vtHfrjOjOUoIsejZDqncYPV7dtYsMkoU4kqNXPK9b4zsa
        nhlEtPmCHQaFY9o07xX+dDg=
X-Google-Smtp-Source: ABdhPJxFFum1VxT9tAN9kFrCa3Gay5WC0Fn6Y9IofUcPj2i+lECyJtorHMHRYe0KZTH3aeRTtzMc3Q==
X-Received: by 2002:a2e:6815:: with SMTP id c21mr254180lja.132.1599094443628;
        Wed, 02 Sep 2020 17:54:03 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:54:03 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/22] i2c: tegra: Check errors for both positive and negative values
Date:   Thu,  3 Sep 2020 03:52:51 +0300
Message-Id: <20200903005300.7894-14-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903005300.7894-1-digetx@gmail.com>
References: <20200903005300.7894-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver's code is inconsistent in regards to the error values checking.
The correct way should be to check both positive and negative values.
This patch cleans up the error-checks in the code. Note that the
pm_runtime_get_sync() could return positive value on success, hence only
relevant parts of the code are changed by this patch.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 19cea39bd4c4..0f2b6eb5fa27 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -684,19 +684,19 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 		return ret;
 
 	ret = clk_enable(i2c_dev->fast_clk);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(dev, "failed to enable fast clock: %d\n", ret);
 		return ret;
 	}
 
 	ret = clk_enable(i2c_dev->slow_clk);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(dev, "failed to enable slow clock: %d\n", ret);
 		goto disable_fast_clk;
 	}
 
 	ret = clk_enable(i2c_dev->div_clk);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(dev, "failed to enable div clock: %d\n", ret);
 		goto disable_slow_clk;
 	}
@@ -1057,7 +1057,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 
 		slv_config.device_fc = true;
 		ret = dmaengine_slave_config(chan, &slv_config);
-		if (ret < 0) {
+		if (ret) {
 			dev_err(i2c_dev->dev, "DMA config failed: %d\n", ret);
 			dev_err(i2c_dev->dev, "falling back to PIO\n");
 			tegra_i2c_release_dma(i2c_dev);
@@ -1245,7 +1245,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 						   xfer_size,
 						   DMA_FROM_DEVICE);
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
-			if (err < 0) {
+			if (err) {
 				dev_err(i2c_dev->dev,
 					"starting RX DMA failed: %d\n", err);
 				return err;
@@ -1304,7 +1304,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 						   xfer_size,
 						   DMA_TO_DEVICE);
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
-			if (err < 0) {
+			if (err) {
 				dev_err(i2c_dev->dev,
 					"starting TX DMA failed: %d\n", err);
 				return err;
-- 
2.27.0

