Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69C86260890
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728893AbgIHCQS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728273AbgIHCLo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:11:44 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C76CC061786;
        Mon,  7 Sep 2020 19:11:44 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v23so18076422ljd.1;
        Mon, 07 Sep 2020 19:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4LurUv+YpHFsrZm3AgTKy4azZ/BxWvLTGRcrIRYEkzE=;
        b=OOCvpUWjIT421nqNEXwbXTwgIeA5X4h2Wx0v7XLajJgW5QWSmAH6jc4Rk7kquOf0fK
         qa/HCYvo46YsN7PQkyEQh/yyFBGrtnxf2hwTObXadXIgtSnbVlXPHNxhFC0KLXnCEM7G
         OjK1xfbo5I8qWZe6VGgeM+vcTpGjaOfaG2vlJaaH3dY8ie9hyBf4Eel6BxE+quVo5Zbj
         3QKzEkGELZtSzZck36qiRLi/d6BFASJzb6ZWnzmne2D4GD+9DJsEC4cwHKnCr840/GNq
         b8y+f6ImVZ+Unle2TYoTDa2+h9ljKGXndr2MM7e2NWLOkuIf2ifKV9zjZiKRyQ2oW0DO
         D/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4LurUv+YpHFsrZm3AgTKy4azZ/BxWvLTGRcrIRYEkzE=;
        b=V5MuD6op9cZeNKpJAYKjUw1JnnTgW0Cj8ELZ2BNXl/IRe22ey3wV87MTftztc9mLiU
         /WI351gWYB8NIEUxwOWaDX7QGdViSHobyM1xi/+lueSvyNQD2IQtwaDf9st2rG0UCBAQ
         At/EUTcFrAPv/afGtWftjy7xSEbnPc6MSI6UVtvdgRMcB+1KHXnehIBm7/c/goMMZ5Bw
         nTYOEyyzGySk3iDtA+kTfeKCL7vctdHWjcwCBIXB9UFNfRBMe2vio/XTiP8WgBy4K9V8
         hJy3oymP4CZeu+tgwQ5TIF+URNTlpXcNEIDascrH0//mDkgnFGNMRFWYm2Krf6NTHZNb
         LfXw==
X-Gm-Message-State: AOAM531hMlTRv123n/NLQq7D8l6WtUX9AdB7f4hh0YkbjoXYwI0e0s0z
        O0obel9vaOb7ahTbtLMEguPnHr3+y0M=
X-Google-Smtp-Source: ABdhPJxWSVvqEv0wjHt404BOiIUvdySwHMpgG546eO7wUznuf605L76/nnA8b3Jc2dGes2Gau/5TAQ==
X-Received: by 2002:a2e:9212:: with SMTP id k18mr6725550ljg.241.1599531102790;
        Mon, 07 Sep 2020 19:11:42 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:42 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 08/35] i2c: tegra: Remove error message used for devm_request_irq() failure
Date:   Tue,  8 Sep 2020 05:09:54 +0300
Message-Id: <20200908021021.9123-9-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The error message prints number of vIRQ, which isn't a useful information.
In practice devm_request_irq() never fails, hence let's remove the bogus
message in order to make code cleaner.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a52c72135390..b813c0976c10 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1807,10 +1807,8 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
 			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
+	if (ret)
 		goto release_dma;
-	}
 
 	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
 	i2c_dev->adapter.owner = THIS_MODULE;
-- 
2.27.0

