Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0661627DBF5
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728752AbgI2WUm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728287AbgI2WUk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:20:40 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1CBC0613D0;
        Tue, 29 Sep 2020 15:20:39 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a15so5355125ljk.2;
        Tue, 29 Sep 2020 15:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xZh9DUwMiABr7Gp9RmerC4SnMDMlQAanRqXDCmR4TSU=;
        b=JGRoeWWKH4JfUv6+Y0dsJyLqp8LeSI+eFst1unS2Z4Qe+kP+AqkwbpZe6ovtbaGeqd
         UngcNBusY0IHuGNcDTwU9JCByhjoKF88mnTM+bwI5ockaUE0xtnWpgZ9+lVGBsKJKqVz
         /FAEO1FPtLiAi5a2ZfGZrG+aM16sHIUu9j5ByHyeNuqrldtBY47F4HG3ho+38xMPgXPq
         iIurz9/MilJbxnoxmsni/B1WH03y/qkmXVOL3/7UcEIRtWvRY0+YPO4BuWESHjdvmHsZ
         9CfDem3WUAwD2MxJVd4TVR1bxSxWoXS1v0zcjfXYNFNihF4wD6BY75rGg2W4ESgW4fdK
         kV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xZh9DUwMiABr7Gp9RmerC4SnMDMlQAanRqXDCmR4TSU=;
        b=NT87y4Lu/p2sn4HrjBHEa9SXkhOSzXTEGk1MoW1poJbSlomt1c5FZ7RlyXSaU6hnm7
         PxNmoC6GgldvAEOB4dLp9sbmXp+cEj83UvUJPIkR19BuM6LV47aLphY5BV0M50WCb9Zp
         bkb1l65rVON0EDfKBMBVm2m1oV420RMAD6BHQZp49AUsMmWHQaApdyomRXyEFWiQ0BXo
         x0wh9Z5qESrid3TnqZ+zclUh85ls7hwyPg6SB5vbAGGY8dbZdBF9aZPfxkDlZhpH1wvc
         kCeAWbZ6nSVc5QVXOGmYH4Tn6o1nnxYo4GEBypfLdeeOgVK48OWpTq8El2qE09BgZz49
         Aq4Q==
X-Gm-Message-State: AOAM530g0+tpa2KcSnbKFOy/gvcc2wWZlRybszgyX107hexiuFmRPo1b
        2uJjY59MX/XPtoXbn7ePDso=
X-Google-Smtp-Source: ABdhPJy1SZUxrjoQKujJL/m12RY0cXLNEdMSIzU/BuEaAeILDJsMgn9QlrjXlydR739Sydh1/6y8Tg==
X-Received: by 2002:a2e:a411:: with SMTP id p17mr1951937ljn.282.1601418038424;
        Tue, 29 Sep 2020 15:20:38 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:34 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 03/32] i2c: tegra: Handle potential error of tegra_i2c_flush_fifos()
Date:   Wed, 30 Sep 2020 01:18:46 +0300
Message-Id: <20200929221915.10979-4-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Technically the tegra_i2c_flush_fifos() may fail and transfer should be
aborted in this case, but this shouldn't ever happen in practice unless
there is a bug somewhere in the driver. Let's add the error check just
for completeness.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4e7d0eec0dd3..88d6e7bb14a2 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1177,7 +1177,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	bool dma;
 	u16 xfer_time = 100;
 
-	tegra_i2c_flush_fifos(i2c_dev);
+	err = tegra_i2c_flush_fifos(i2c_dev);
+	if (err)
+		return err;
 
 	i2c_dev->msg_buf = msg->buf;
 	i2c_dev->msg_buf_remaining = msg->len;
-- 
2.27.0

