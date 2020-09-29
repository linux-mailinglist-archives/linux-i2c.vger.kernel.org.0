Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3358527DBBC
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729545AbgI2WVc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729350AbgI2WVK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:21:10 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE623C0613DB;
        Tue, 29 Sep 2020 15:21:02 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b19so5330374lji.11;
        Tue, 29 Sep 2020 15:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9aD6etkmvo1fYeG3cPGzRo4H9tx2Gqz/sOZkipHdkrI=;
        b=atzFrsYrRtr5u3yOm5pJFmqSBdF5mAFwKKg9gBFNR6O3G1JjU3X6LQqL5nO8lhMGGt
         QzAKJEi5tu5nZ6MlcSMdymJbgfVul2IFZXZMDaAApOr3g0wCaoZjv8q2tnsyGRXc12Oo
         7CzKTRETppGt5DZ7L7xX59mjFffxxT0t5TgHvT5SYARWRuIjgvYHiM29iwg+Mq29FsZC
         GDK2DI84IAH7KMFd8XdzJWk4yfLUfdpy/MAgIalzlJeH0AIZLOsYoYj6MJGGD9yqImhU
         /1PBHn1ZfoX8Ds/uYSgOQxjtKksgTxwZbkB8ScjwbEw4ZYq2jvkEK3n6rn7ATZcARpp1
         9TEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9aD6etkmvo1fYeG3cPGzRo4H9tx2Gqz/sOZkipHdkrI=;
        b=Tq2X9h1C/snSTi2KsFpumvQ0Fa0WWG/hMZG53qnnidBkYubqWcwnz3sO7zFVaDYc+P
         IYo0YN9Yl0VcvC3/AvEOARh+Bc9xCD9mDUy9V6x7Mjk4QX+nyN95e7YF2aA2S8N3qoJv
         wVdydNIpX95nQEKI4GUxjf1iYxP9g09XqX05LL9A8JaSBycOA5aQ+9n8BXpXNDKDXNFi
         edMOUo6lzE465KFThq31s2+A8S33xaP9oyue/keeQms/UhYojQCy8xs8WfJD+aK0+RiT
         blPlZhVWy76JwjOQA9WH6hMAjmV4MWVZQ86IBXvBY2SNtVvm/+EHxOPKvMzFpjtLO02u
         2Ysg==
X-Gm-Message-State: AOAM530Pd47AzHUQnxaDxO13yh1NxlUXj7ZHGF7pqyvDMaj0ht0WEE9C
        IoOZ5QQXbryFRrYeP23Xb2Y=
X-Google-Smtp-Source: ABdhPJzsQfB+RYXdP70WC6uYPaueFUOUwGx7JsH2YBCu4A8Jo9DyI4AeqiMMbcGZno3pZcCYDkYDxg==
X-Received: by 2002:a2e:9583:: with SMTP id w3mr1754508ljh.60.1601418061353;
        Tue, 29 Sep 2020 15:21:01 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:21:00 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 26/32] i2c: tegra: Check errors for both positive and negative values
Date:   Wed, 30 Sep 2020 01:19:09 +0300
Message-Id: <20200929221915.10979-27-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d8fc5cdcc310..41b6341be7b5 100644
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
@@ -1248,7 +1248,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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

