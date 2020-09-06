Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC1DF25EF9D
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729243AbgIFSw2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729212AbgIFSwF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:52:05 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53F25C061797;
        Sun,  6 Sep 2020 11:52:05 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so13555872ljk.8;
        Sun, 06 Sep 2020 11:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wqWNZwbBclBQY1Nu86987iujO2vmCbBN95FMSXkMVoY=;
        b=dt1WMot6KaHamPlrXHEqGMHCDDdYgVvkBtcmQQencrOEOjCQHUhfi1mxT6VhP73qIY
         P5reSXF1NC3t39yRf7HCm/zg2Ur5WMDFT/ooLVx/XY6raBU3QH4fBXoRyvr77sqfe40X
         o3vAqTSQpDRNerOmkgqOvP9gapLZc9xeHkG0xjPH2LSSkuaLMagGxEU7wKqZisSoaS8i
         N1ftUtFiBerm8QkzRV8f9iDl0Eurdp2GnN6dVgmLtTLVVMIdiCASrfqwjtECocB4jEIC
         ZnoXoTp1OMdnauI0RbRsKfLc3hmqWE/WCXLWneShc9M2ObaiL+XQUajuHNXTxO++gS5K
         p8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wqWNZwbBclBQY1Nu86987iujO2vmCbBN95FMSXkMVoY=;
        b=CbgFwHEQQWOo6yxi0ZlrvjtImZ52uvIGoX8fCX9r6BuOxyscr82+pTLxx6UnngudH5
         yn39XhKbrla81pqRWSqadmeRLGh/MFs38Plvbhxq1y9Po+N3kItS2d9hSvLk2Id1LnCQ
         S3vArppzwlGUcnw3RZ4H30CBSjCjbIwuY7y0lM4hh671YN2txSIxTbVGerfZi++WsoyR
         /6VJ2zdGJYyMKRfY+UsOGDF9+sE5UUdHhUtYNSIMipzlzOd9Wuo3kMdp6rr6rlXd3DjL
         /d5SeAK0imXJQ8467vyFb+seuOXyt5hfpwdMxUPsgN0vsKnr1PW2ipK3/Ik3RmWQlVu/
         ajQQ==
X-Gm-Message-State: AOAM532tRHYxtlMpHo48BRL53F6wiSbjArDqcO3eVtnz1zvSC7PyjREx
        hg4YF0jhPHmWoem57Tdd488=
X-Google-Smtp-Source: ABdhPJw65uKuWqXi1B+77qN8/yPWGoh9pyP/Sk2ULcClWZHViiHnueAdxeJ7IqXXSSczvdwqIegJ2A==
X-Received: by 2002:a2e:b60b:: with SMTP id r11mr2251147ljn.415.1599418323840;
        Sun, 06 Sep 2020 11:52:03 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:52:03 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 28/36] i2c: tegra: Check errors for both positive and negative values
Date:   Sun,  6 Sep 2020 21:50:31 +0300
Message-Id: <20200906185039.22700-29-digetx@gmail.com>
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

The driver's code is inconsistent in regards to the error values checking.
The correct way should be to check both positive and negative values.
This patch cleans up the error-checks in the code. Note that the
pm_runtime_get_sync() could return positive value on success, hence only
relevant parts of the code are changed by this patch.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d34b6bb295b9..68becf9da9e1 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -963,7 +963,7 @@ static int tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev, size_t len)
 
 		slv_config.device_fc = true;
 		ret = dmaengine_slave_config(chan, &slv_config);
-		if (ret < 0) {
+		if (ret) {
 			dev_err(i2c_dev->dev, "DMA slave config failed: %d\n",
 				ret);
 			return ret;
@@ -1205,7 +1205,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 						   xfer_size,
 						   DMA_FROM_DEVICE);
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
-			if (err < 0) {
+			if (err) {
 				dev_err(i2c_dev->dev,
 					"starting RX DMA failed, err %d\n",
 					err);
@@ -1230,7 +1230,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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

