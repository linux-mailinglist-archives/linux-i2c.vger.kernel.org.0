Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4142622F8
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730367AbgIHWmz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730116AbgIHWlI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:41:08 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C43C06179F;
        Tue,  8 Sep 2020 15:40:59 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id k25so1014409ljk.0;
        Tue, 08 Sep 2020 15:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GqX7EAitDfk5FuQKkylcPiJFZGC8+mAMTNK0jlhGt/k=;
        b=FoEWJ7390BbRlvcaxx+i8uqgVVPIXVQ0CotoZFM8erHl+zQj2H6BFIdQ4Z1VC3/OYr
         2lJ66/nw8F9iM/U+cKvs/a/6r7c3ElNHdrTlpfc6/oBP+PqfGOiavY/Y8ZIGOab2yWBd
         Rr6/i89dm9rlrNeayLLKst0F+wgvEP0l2UM2UX2UNnOSs1vtRRQUMVeAN2x42QnlixQu
         /hFc8XRCygrM8/VyxL6M+jgEHuX6Ou++zvL9fzYqfKM9HdtF9e1ubMrHeCUPHozhUUJ3
         LGXWWoNqQmUPyDfPR1evURvudAIuuJ2WjGGECZGYlpM+CVDF4yNvoR5rOpZ3VY3tuMhk
         uVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GqX7EAitDfk5FuQKkylcPiJFZGC8+mAMTNK0jlhGt/k=;
        b=MS/ztXmTjYtC8HnchAWaiWT1926mmDDewIT67LTK5M6cBi0oNTwcpVdfB91/wD28S+
         zrlr2hLNUynOVPCe8O5f500lYzS7aflLKlEV2w1W7aLEVBWDth7vos/CJ7rNSui9vQJ1
         bVTv4STn2ExYHvEx6jQYCsdEAZTr6s3++cpTvfFXZEgZfH0Ei97Bh3ufmRk0usG97LhS
         33KgX1DzEUZW9Qkj1bDoNY3E2wkXEiIfFbM+AoA+xGFTbLRssyyk4g2jdLhuZRIwYQF0
         jRLIdbNoDRNhCVAmEqDMVoU+/UlBzLPk7LBGdiMZ5IrG9KxCW9aayNCaOjBzRIS8BRtC
         0yog==
X-Gm-Message-State: AOAM530mDkzs6275SHUst2kPMbVIR/FR4Dfh/TqOQ6bR093xzaJxamCm
        Mds1nBtifOF6OT8fMj2vWEA=
X-Google-Smtp-Source: ABdhPJzsFKsmzTgpqHw5CIoFQtYWLen0Gt3lYLM+RSGhqdtYLnyDUaC40Mcxbf5ZwZoEHWXAL4wGHQ==
X-Received: by 2002:a2e:9919:: with SMTP id v25mr359031lji.167.1599604857958;
        Tue, 08 Sep 2020 15:40:57 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:57 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 28/34] i2c: tegra: Consolidate error handling in tegra_i2c_xfer_msg()
Date:   Wed,  9 Sep 2020 01:40:00 +0300
Message-Id: <20200908224006.25636-29-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
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
index fe672cfebe12..ac40c87f1c21 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1293,8 +1293,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 		if (!time_left && !completion_done(&i2c_dev->dma_complete)) {
 			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
-			tegra_i2c_init(i2c_dev);
-			return -ETIMEDOUT;
+			err = -ETIMEDOUT;
+			goto reset_hardware;
 		}
 
 		if (i2c_dev->msg_read && i2c_dev->msg_err == I2C_ERR_NONE) {
@@ -1314,8 +1314,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	if (time_left == 0) {
 		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
-		tegra_i2c_init(i2c_dev);
-		return -ETIMEDOUT;
+		err = -ETIMEDOUT;
+		goto reset_hardware;
 	}
 
 	dev_dbg(i2c_dev->dev, "transfer complete: %lu %d %d\n",
@@ -1329,6 +1329,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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

