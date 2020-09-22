Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD366274CA0
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbgIVWxB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbgIVWxA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:53:00 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2918C0613D9;
        Tue, 22 Sep 2020 15:52:56 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b19so15519302lji.11;
        Tue, 22 Sep 2020 15:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ezfrpJld0c6qUJbQ+jKHyiJhNYtf0R9giimhrUC4m2Y=;
        b=LYQWPRVkmMcHEYmJiVrNAM9JE8NDKGEGslkS8jEqAJ8i1AC9LHvYcCfDKuJM90N20V
         1/i7+jbYlsRRfaN9CpnclAO6HGhW/cxsygaYx6S/pg45wV9wR9Vwdedw4cN7YBr5Qcg7
         a5x3mOYZVhIqfG+NlzWzVDQL3/VNXmJRghS4lQ/2B6G4gentfg5ADFvISsjiN8dGJzgZ
         QZbi+E+qTqd1kvhICkLJr+/rRC1C2IJtepJ1pLXJDc6OQD3wBxNJd+w07PJ405B+mv0P
         gvUE6YNrwpf9z71VWbVLiPoVcJPNBCY71OqI9nhwJgdRrDdN86XbxMoKjtf++1Tf0ZsD
         G+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ezfrpJld0c6qUJbQ+jKHyiJhNYtf0R9giimhrUC4m2Y=;
        b=MmqBIn8q6XwMmsIUFpp8t4Y1hWElK6HrmVx294RmCzyN7dQVvRwCXlrdZ+4pE60rhE
         QMxWVdnBYxa4zaQGSPw/7uZGvV8BGEnoD4OEwX8nN0o3TRc4KeA3wP2QzV/gHnaGHKkz
         sXGZNFAiVl0/6Wc/4qFZ1gZmk/y2tgvhYwsMkwNw2M7xRMA0Sg6jSUb3TfaU+gJ0nui9
         RCbj9gmYDM8orAaqu/GreKj+MXlfX9aeR7+CO2L3wFh7zmf2nqODXKwUeej4GeLLgrT0
         4py4sIgMw9l8ECyPrtKqLynvg2PjR/YFtlE7ELFIkYgBrvmIfYOq1WDMINTgIqXm0sC7
         qlGQ==
X-Gm-Message-State: AOAM531WlPwkWTBnf6SetvCO5rAy8PlazTzCKJdqqgMYKWZkUWsN8aYu
        QN4R3buqg15KlGuvIVT0z6k=
X-Google-Smtp-Source: ABdhPJzrI9CCRP2LU4XM58yQvc5E4RKEr38th2eDW4CjXyRdBGgnvrkJvqEv5H3gH4nFRNpe9aTI1A==
X-Received: by 2002:a05:651c:1214:: with SMTP id i20mr2047354lja.318.1600815175158;
        Tue, 22 Sep 2020 15:52:55 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:54 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 26/32] i2c: tegra: Check errors for both positive and negative values
Date:   Wed, 23 Sep 2020 01:51:49 +0300
Message-Id: <20200922225155.10798-27-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver's code is inconsistent in regards to the error values checking.
The correct way should be to check both positive and negative values.
This patch cleans up the error-checks in the code. Note that the
pm_runtime_get_sync() could return positive value on success, hence only
relevant parts of the code are changed by this patch.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a02675924a6f..2a5283915e24 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -982,7 +982,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 
 		slv_config.device_fc = true;
 		ret = dmaengine_slave_config(chan, &slv_config);
-		if (ret < 0) {
+		if (ret) {
 			dev_err(i2c_dev->dev, "DMA slave config failed: %d\n",
 				ret);
 			dev_err(i2c_dev->dev, "falling back to PIO\n");
@@ -1222,7 +1222,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 						   xfer_size,
 						   DMA_FROM_DEVICE);
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
-			if (err < 0) {
+			if (err) {
 				dev_err(i2c_dev->dev,
 					"starting RX DMA failed, err %d\n",
 					err);
@@ -1247,7 +1247,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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

