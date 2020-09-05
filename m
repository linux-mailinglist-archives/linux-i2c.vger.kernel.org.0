Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B7125EAD3
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729034AbgIEUq4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728663AbgIEUmd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:33 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B57C061245;
        Sat,  5 Sep 2020 13:42:31 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id y2so5584174lfy.10;
        Sat, 05 Sep 2020 13:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ig51UfBjg6HZoCk+VbyJzirSDSJ63Dqj6PUDPcp4CWo=;
        b=NLVvf4YB7hYGuUb/lgrVgC2Tgi3erZUs1c31bdIuGrdKSdcpfRIEYXZlGx0X8F5QKe
         zCSel5Q3zS51E0pfGNnlIwO4pWrbz8UUn75jtMhkNBiFJJzPQ/v3qh8EUAsVxWNyRBNF
         U/MuUsFviB6PZyTvWwdwL+nHROtMxpN4ugnfA2nFkI1ccXSZ0AUpYyr2+N5PBL5yuMN6
         939z6+cTYyvTHFUUITkHaKYeYYsOd+5vEJZlo9QAa62xB/aY8tZ4iOtDA603+7IMJ+p9
         NUG9w6TAo6ADeNioq9Q/sMM98EfF9R/DvwghumlFaj9my/hwfdkyqwFJb+/rOIhNRWkH
         I0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ig51UfBjg6HZoCk+VbyJzirSDSJ63Dqj6PUDPcp4CWo=;
        b=jJqEBVuAm7y3+c67NcJKZlejhPgJCU/ut9E/w+K3sDg4WRWdA3EtnuU9GvZ8ORtgo2
         Npuyu+5n0J3Dhp7OPuEw1J3UIgaCKdO9QLD4mttNNcCZcKgHNBI2Z+FSs/bqFaVOkNr/
         N3X43Rr1ZLRqDaaaDX3tiWVpQQcAx+D/jM39Dr7NrfVyiuaoQaG+75m1ZI9ueebNNOmv
         UfghEfBqMaAbHCfakoJpVq0hyTr50lP2VEeMTvNVknD9DqbUJXMreaqTkD2u/zu4O8jY
         o/kY+6JaHLfl8fK13Ovcq1NtKMYucy+UJsaVfQD1IBsofsWYpkDpuCit25l0ooR38mis
         QjpQ==
X-Gm-Message-State: AOAM530JO4nvcCRSeI8mgsOkkzHBGEzHIrEVnftiUM1V4wwhHGuDFaFL
        yZp9BLnCeTN1QhP+qJazpv8=
X-Google-Smtp-Source: ABdhPJy5LvUKtMwAXEcCZ8EaDHnEv15smIiA62myYX5zTqHz3fJxLHq8MhWRFzXZ2LV5P9ZSoTGEQg==
X-Received: by 2002:a19:418e:: with SMTP id o136mr6606685lfa.145.1599338550415;
        Sat, 05 Sep 2020 13:42:30 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:30 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/31] i2c: tegra: Remove error message used for devm_request_irq() failure
Date:   Sat,  5 Sep 2020 23:41:26 +0300
Message-Id: <20200905204151.25343-7-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The error message prints number of vIRQ, which isn't a useful information.
In practice devm_request_irq() never fails, hence let's remove the bogus
message in order to make code cleaner.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 9f0269bffab4..2f74bdd75e1c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1803,10 +1803,8 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
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

