Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4CFE27DBF2
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729799AbgI2WWh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728851AbgI2WUn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:20:43 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 483E3C061755;
        Tue, 29 Sep 2020 15:20:41 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id y4so5336472ljk.8;
        Tue, 29 Sep 2020 15:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xNvKe8W0opE97in5l5nVfxTdp9pYNfnjjw7aoaaRKlU=;
        b=EpZsdBQI+amG/TW9ErIIyti8Iar4kE/OvpZV0Zjc7qUBE+HB3k+sWZNDJbBKq2n3pl
         +fOeSpz1CXVXSW516Hm2hraNha9runsXjKHjcBx9M2uuRRzsSJxh8SXxuy1SO0xlVqxm
         Yd9M7UXJ93WvnKPAQYh6FedfWQ2YxwAx1C1/4OTdh3h73s0YZw3iXkUglzsbsehppSXU
         9pVIL/Xy+a71OpBXwHMpGEX6XEBAKyzTr2AuZnN509ai+UxP+MfxawERCA6Aut2nCEfN
         ygNgyPp3glE1lQNZLv7vZ1GXsdxFWgOheZn/nITBV1BoxxgUhPWXufgTg6vH0E1ZjzFY
         gBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xNvKe8W0opE97in5l5nVfxTdp9pYNfnjjw7aoaaRKlU=;
        b=asNaAer8yJmlGvCjyuAForF4vmTMIeXMBPzM45sW2ltQapJMb7VwbWYTT1Vaab+oRG
         cVYUvGzVK7Uwzqri4RcXTYJjjZekcH48GJj4F4VmlKW/S8WE/kOeFg8ujD0Nu47FPEZg
         KswUEQA45A9oAD0oRh+qZ/RGoxV9NXT7V2rrODjbi8efsyV5g7K4EmNaXQuOHo9mEIah
         odA3jT+xVNMUbtgpv0LyJFh6l28ye3M04Auq2Fz2uXIfs3QAhwlqwyBo4Aw+t07vuqAm
         sPYmXgIa60YUzD0b+ABt3jVYqyEP0pVsuMvVrG1zmCC8KxoIVj+WdLGJXty/LGX5nn4U
         WUvA==
X-Gm-Message-State: AOAM530o84QV8AgG8bWUfKTEsQk8fPINe0kIdHhI247zkvHMr08tp2JD
        S7lhz8+B1RkD87vJpG9jXOc=
X-Google-Smtp-Source: ABdhPJz76eamIlSdz0eiz1xUu979/ZTHFUKR52REcHCzqlc0v9AR/Mdk0+ugabUou5fs3GI0NpjHUA==
X-Received: by 2002:a2e:2286:: with SMTP id i128mr1968952lji.288.1601418039388;
        Tue, 29 Sep 2020 15:20:39 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:38 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 04/32] i2c: tegra: Mask interrupt in tegra_i2c_issue_bus_clear()
Date:   Wed, 30 Sep 2020 01:18:47 +0300
Message-Id: <20200929221915.10979-5-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The tegra_i2c_issue_bus_clear() may fail and in this case BUS_CLR_DONE
stays unmasked. Hence let's mask it for consistency. This patch doesn't
fix any known problems.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 88d6e7bb14a2..1d1ce266255a 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1149,6 +1149,8 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 
 	time_left = tegra_i2c_wait_completion_timeout(
 			i2c_dev, &i2c_dev->msg_complete, 50);
+	tegra_i2c_mask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
+
 	if (time_left == 0) {
 		dev_err(i2c_dev->dev, "timed out for bus clear\n");
 		return -ETIMEDOUT;
-- 
2.27.0

