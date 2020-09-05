Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E41925EA99
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728935AbgIEUoE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728771AbgIEUmu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:50 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290B5C061258;
        Sat,  5 Sep 2020 13:42:49 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so11783612ljk.8;
        Sat, 05 Sep 2020 13:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SVIZolRkigMG5KeyY60o0qplGOEf+YGse9lnTNFQTF8=;
        b=KIZ0ost64cHgPw+51EqE+n9nLPp6Damip2giJDJtSVL+rn4I4JJV2FNk1TpE93KYbW
         9J70UEgw7GR3wXyg2fxqLmQkSHHElh3nrKwZRuS0uoIW787EUP2QvzBUBySLjpAepC1x
         l0GsgIM0P0sGYgKuAZHSs9vaGZ3z78AEJnnK714qVmUoqMritALAbmLk51gZTm1v0zoI
         RflZgt8BESf9H8pCfBHd7c6rt4ol1rvmX6JTFzXfsbDKYZdyPllVPQl8N+hS/tyEcGdC
         xjMa8L5wr/p+ftFOJEKI8dpxCYN+CfDTrPued0uF+DHA/IxdAwtLvEg9APKuGmcv17wp
         iXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SVIZolRkigMG5KeyY60o0qplGOEf+YGse9lnTNFQTF8=;
        b=mg7D6FNaQfY0ki+1pwFPROGpiryFCTfHK87+ORl/Lp3Sdkg6+c5IyevnLJrd5tr/gO
         /Mn1C5K8+aj2fCwc+ZTnGsYkBncn9vbT6GkKBrbfurhOtJD/LXE2jusGFI4xVEYUAeZD
         ScC3AqyrOi7qNc06RiClwiVs9Md8Ki4F/F65OorqpGp14vxJLMtT3L3aOnugSZ6rUija
         V4VUt0P8vuSbLwuzlrJPrQ4/p/bl3AiQgCy9F5hOl3Hx++bnbBGOKv3jjM7qgiJ53Z1v
         hQTLcT0TYacmxap7+QPsYy84PVvHOzQ9x85bjPf3Rb51gTTkMVVQCN3E99c79oZoahtQ
         Ktuw==
X-Gm-Message-State: AOAM530ozE+XBethp8LmVYrU04zLKbzgAhLtKXGW+fvMmwvKa5UKKBkT
        BAsD9r994b10ydLAiXIY+iE=
X-Google-Smtp-Source: ABdhPJz4mB6yn7gy1KC9/kUrOaH5rUaQwGCC4JaWDd85sZ/UZUJpXci8/OOJ1HWK1AaehpH2XCeaZw==
X-Received: by 2002:a2e:9c9:: with SMTP id 192mr6350314ljj.197.1599338567640;
        Sat, 05 Sep 2020 13:42:47 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:46 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 25/31] i2c: tegra: Check errors for both positive and negative values
Date:   Sat,  5 Sep 2020 23:41:45 +0300
Message-Id: <20200905204151.25343-26-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
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
 drivers/i2c/busses/i2c-tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 9b4107b07135..64776cd8e0ff 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -969,7 +969,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 
 		slv_config.device_fc = true;
 		ret = dmaengine_slave_config(chan, &slv_config);
-		if (ret < 0) {
+		if (ret) {
 			dev_err(i2c_dev->dev, "DMA slave config failed: %d\n",
 				ret);
 			dev_err(i2c_dev->dev, "falling back to PIO\n");
@@ -1208,7 +1208,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 						   xfer_size,
 						   DMA_FROM_DEVICE);
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
-			if (err < 0) {
+			if (err) {
 				dev_err(i2c_dev->dev,
 					"starting RX DMA failed, err %d\n",
 					err);
@@ -1233,7 +1233,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 						   xfer_size,
 						   DMA_TO_DEVICE);
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
-			if (err < 0) {
+			if (err) {
 				dev_err(i2c_dev->dev,
 					"starting TX DMA failed, err %d\n",
 					err);
-- 
2.27.0

