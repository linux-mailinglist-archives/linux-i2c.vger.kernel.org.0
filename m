Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F09AC274CD3
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgIVWyX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbgIVWwm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:52:42 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D9DC061755;
        Tue, 22 Sep 2020 15:52:42 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id y2so19834715lfy.10;
        Tue, 22 Sep 2020 15:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QbR8Wg7SiLjwizAtD6cV/clscat69GMg31E2yK/bKZU=;
        b=hKN5zMf2AIUflu+9/CF3bmsXOcNYHMqHRZGX0QTNQ1BVS3cuEZ1d16e+uW6ylD3q+f
         KDYDDyY4c5NqYK6EtpBd+jfVzw8FOr2bXNI0VkSA6fUltmi9ut/pAVYyVXhPY1c2bhHE
         /kjnVlswsybOSUCyO4D94gJhX4cs4MFbeS3dVxlPim2w4WJ6DWzKIJQ8pvQgBnL3kNB/
         5ZJMG6Gsoto7zkg3Y33FFOA5RTIAjOvZ98rsxV7oBAU2qERUGCTYM6BJ5V+MkraJDXGp
         J+9t7JSsbprU0v3ZJPVhwh7E7NkIKs7H+qC8BDeNbN07aCV2Qda0oyG6a/gijv83LMwH
         zDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QbR8Wg7SiLjwizAtD6cV/clscat69GMg31E2yK/bKZU=;
        b=gPW6MFsI0A0AqdKoGsdo3RPdwwl0AN4Y4ar5XmcaHxhdZelZ3RPyfnLxedDGdedR1n
         V8xe+IWjsslqARZsFDXJqKdYSmGAC4PTTSalP81dt5D2Usk/Ps1xxsHTv1v/AXks+b7O
         evPMQLsrtZsFlpcSshtvqI5nwCFgcldQvzDSqXpK31LglV9NLO0GoFvxP5W1OA2Ncg3h
         2mdytsW+kuAsRGqX7Mcw832wgSX5J3cvips3+JIH8bOJeo97OA40b7KeSpZTlR4PKD31
         oBaKMSX071scSvnnGIWHH1JqdLP6c0z7HpGzjQvdsQ34ZqfWBP1EdR8AowHTmhOKPT0j
         N2RA==
X-Gm-Message-State: AOAM531LfBA1tOKGuL7pG+eYiAkXgu23wtefT/0Q9Egm+7iQahCxIGfT
        qRtncU7tMFNWmgGZF3sM6VFhoZoifeE=
X-Google-Smtp-Source: ABdhPJz6R2OlHS5EqG+k/RS/USYY0yAsULAPfilfUKOuVv+4C08CqjlN/7cJaoR8N09mdccFq+FyDQ==
X-Received: by 2002:a19:23c6:: with SMTP id j189mr2572190lfj.79.1600815160449;
        Tue, 22 Sep 2020 15:52:40 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:39 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 11/32] i2c: tegra: Use platform_get_irq()
Date:   Wed, 23 Sep 2020 01:51:34 +0300
Message-Id: <20200922225155.10798-12-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use common helper for retrieval of the interrupt number in order to make
code cleaner. Note that platform_get_irq() prints error message by itself.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
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

