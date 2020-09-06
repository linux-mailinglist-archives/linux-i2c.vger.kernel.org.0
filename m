Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6FA25EFB3
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729278AbgIFSx4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729214AbgIFSwG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:52:06 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A82C061799;
        Sun,  6 Sep 2020 11:52:06 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id n25so2645943ljj.4;
        Sun, 06 Sep 2020 11:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=niMclq0Bz04SlSAMv6i0rHKb8wDZflPWAf2a3prGZ0c=;
        b=VcQAiGYufQ0HlA8qvaFoQdiv4adUSLdnRZInoF0iE2NWxNGa+5mcjWqB88ygj3EdY6
         5nqC6tbsMRM7NPLtEuuKLZ+FxcRC2dZWLD5CL3q8jkTyyvZusQca/ngKOM1gQnVsXYmC
         q123hCiPcp+pgZ0PAFSkjaOe188Gon4yqwOWu06Me2pRzmsVnlyk7fWnKKohcP2c98OW
         weGa8DKkBBpYHuhGZWRyNx9ScLnBAFpxwQv75WAuAsXFgUPf0vgqDPcxrghNmpHR6I2G
         rQ1izF7Hj34oYA9HT1fsf1MH7ikWzUtWduPZuR0r8QMbtK4y8UN7gzPY+JQD8y+zQMob
         wZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=niMclq0Bz04SlSAMv6i0rHKb8wDZflPWAf2a3prGZ0c=;
        b=IT0opxwrh2gElU+FA5EuPJFbbj24PS14hGtwpQjfSII5pvS0aYNXKA6woOC9NsN5/y
         FN+sWSmjaME7/J6h5wOi0xcGfHWSLtNVNhdA4p2jxhkdUAHyxXmoVKM3yiLY1BQ6uMpp
         nr7mdi3h/l0/9UoLDEMCmR21ZKRyUa0YsbsQnRzsDaimfaw0D/vXIVUwr2KtYWtZ/hiG
         /Y88Dz2ol7EGFjHb3ui62rcy4Yd1JQPnXjaLVqcCSm2Pu4xRbd4WgTArbYSpTjza3H0H
         2q7yFS8Rrr4WQ6dnC54wR6LAuV5wBf92DdZb3L/zkp++F9XugCWYjC1fmRXFZ22wqlWC
         B64w==
X-Gm-Message-State: AOAM531G1kgIy5v2qtmalUgDo3OW+HbQ/1yVIuok10uuolg52QB7YH9O
        tTMkkxzXUy2Z/F1klYAMSKs=
X-Google-Smtp-Source: ABdhPJzZFs4QA5d62+/7V8tvhiIekLyOwsSJJXzN3ZScxg4Aq/XeO2nGjw9fiJiTw6tb6pyH0KAPnQ==
X-Received: by 2002:a2e:5c09:: with SMTP id q9mr8484728ljb.423.1599418324763;
        Sun, 06 Sep 2020 11:52:04 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:52:04 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 29/36] i2c: tegra: Consolidate error handling in tegra_i2c_xfer_msg()
Date:   Sun,  6 Sep 2020 21:50:32 +0300
Message-Id: <20200906185039.22700-30-digetx@gmail.com>
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

Consolidate error handling in tegra_i2c_xfer_msg() into a common code
path in order to make code cleaner.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 68becf9da9e1..63ae9bdee502 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1274,8 +1274,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 		if (!time_left && !completion_done(&i2c_dev->dma_complete)) {
 			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
-			tegra_i2c_init(i2c_dev);
-			return -ETIMEDOUT;
+			err = -ETIMEDOUT;
+			goto reset_hardware;
 		}
 
 		if (i2c_dev->msg_read && i2c_dev->msg_err == I2C_ERR_NONE) {
@@ -1295,8 +1295,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	if (time_left == 0) {
 		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
-		tegra_i2c_init(i2c_dev);
-		return -ETIMEDOUT;
+		err = -ETIMEDOUT;
+		goto reset_hardware;
 	}
 
 	dev_dbg(i2c_dev->dev, "transfer complete: %lu %d %d\n",
@@ -1310,6 +1310,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		return err;
 
 	return 0;
+
+reset_hardware:
+	tegra_i2c_init(i2c_dev);
+
+	return err;
 }
 
 static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
-- 
2.27.0

