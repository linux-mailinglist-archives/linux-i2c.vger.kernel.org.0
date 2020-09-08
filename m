Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0300F26232D
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729942AbgIHWoa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729789AbgIHWkf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:40:35 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4565C061755;
        Tue,  8 Sep 2020 15:40:34 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z19so539370lfr.4;
        Tue, 08 Sep 2020 15:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hUUPRBULDiyvblMhx4V1F89haxR9rFzQ0ynZsEU3uxo=;
        b=q49T129r199DY86luMHEEwZ9WtFc3zQtkHwjuP6f9NlMeFtqaaUcMVaCn4BWdIOOUq
         +8+FJj7DNngx83sxHkfXuPrtkdg+2z197Moi4Tltxq25j+cFQMOQF3Fspgeo1ZbMuOMw
         x7Lcp20TOkzKNPOrnIjmoI104ybs3Xt2PnK4XBs6/6E9Da/uppoozgyh4jlD4VPvvlAx
         cQbuAYmqvQalv3hZ5S8Oc4oQsX0dfXUueHOkDhU+GfF2TfR+JTInu4yT7jgQtHncNs+m
         nJ44njw89Vs0srK71N6lvp8SPkxPrheoTG0c0bB+/nWfl2wMdHg1wA3qwGqkkq/g5uSY
         j7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hUUPRBULDiyvblMhx4V1F89haxR9rFzQ0ynZsEU3uxo=;
        b=mLMgqrs81p4kY8BScscPsxZ//urZofKmdgybd9knzj7b3OP4A8luzVx4bs2UMBn0BJ
         IChSaZwXZcNjKrienNPEai/u3jsIKJcm+0hwE/g2omLJVHkWiTbf6Pcbvh4F5IrtZWsS
         nNHSGTlgoJk4fIMQAOPkkqUt6M3Qku9fl8OyjM4yW/8IuoUV9hVDjqPaaOgSdYm4f4PD
         kMLnhyE3a3yffId30HiM7OmNHVWk+kSP8EE00wWHL4gzHnT1DkJ9vm2JLREeuGkQo/tK
         vIJP8KbqZvbJ3T3FXJtOi3iO/28DWRmfcH95XRjKtfjzXyUOqX49wfoB+/2dye3Mfecd
         Uc1w==
X-Gm-Message-State: AOAM532KcsYRIIJYoQW9pL4apkAdpoV7jgVceS+CDxZETIA+za5a/6f2
        fs/+5Eh6DhSWlC6MOrC12rA=
X-Google-Smtp-Source: ABdhPJz36wiwn0eDZa3Bo/dxiocNuoVT7nH0pYUDdmf/IKYoSD8ReB5v8KaOc9emkFVtqsvvr0X8lg==
X-Received: by 2002:a05:6512:70f:: with SMTP id b15mr537966lfs.39.1599604833326;
        Tue, 08 Sep 2020 15:40:33 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:32 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 11/34] i2c: tegra: Use platform_get_irq()
Date:   Wed,  9 Sep 2020 01:39:43 +0300
Message-Id: <20200908224006.25636-12-digetx@gmail.com>
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

Use common helper for retrieval of the interrupt number in order to make
code cleaner. Note that platform_get_irq() prints error message by itself.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c2bbdf92b11f..505b5d37077d 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1684,12 +1684,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	base_phys = res->start;
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "no irq resource\n");
-		return -EINVAL;
-	}
-	irq = res->start;
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
 
 	div_clk = devm_clk_get(&pdev->dev, "div-clk");
 	if (IS_ERR(div_clk)) {
-- 
2.27.0

