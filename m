Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F17422B3A
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Oct 2021 16:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235660AbhJEOkQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Oct 2021 10:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235652AbhJEOkO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Oct 2021 10:40:14 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28BDCC061765
        for <linux-i2c@vger.kernel.org>; Tue,  5 Oct 2021 07:38:23 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id n8so30878280lfk.6
        for <linux-i2c@vger.kernel.org>; Tue, 05 Oct 2021 07:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=klTjczTUx8b1c2tX38XlKQEw8mKHpQEoY//ZV2AWwv8=;
        b=Dt8fAg1I9xPaomCa7reH7OK7NJBIuG3OckiqCfqYhOscZS+aDefAdl2iB6gSGYc9N8
         FWy4PDKwKyaeGINQDfSU+6/FBU8W2XimCAdNYeQAQ/yWL5WwZd6iCnfQQBRBP1g7DC6f
         vLM0zBqkF++xS5L5lTB3R/2D1vO5dxzLFDjFb50sfpu7WYK0pdYEvIi1gcO8GBaDGfnm
         fh1wWuUp7K97RzDezKc/7D1y1AK9c82a9Y8QmOT7ySgQYgQTM4LKqn1uWWEEW2t8q1uy
         FXPACkkrzTjyQMyaektNdKcOQ3M9x7HIp3bTHhSlCyhsoNjUWaaeTrWdBF6eUGbNP2SE
         ePWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=klTjczTUx8b1c2tX38XlKQEw8mKHpQEoY//ZV2AWwv8=;
        b=j/hPS9bgBV/ZOBthc6TO6WjIespi6VyJy5ujU7FLZnFyeSRC/nwp/THZaBtfrVsF0Y
         qR3BKvdQCHk6GjprUA/UzrL4lmhpA9yojZiGIrgVu01qUg5UQm8c7GaukMJdn71aVsx2
         PKf/9dhgDO2gpphX+WlKtHbzrz3yzj2Rhl+U8/+AWTaDcmAdQe8ByYPnXY+kQRfMSj+s
         bD8ERJxG/vZ48aFxuvVIf97+YlxQBpvJpJPglO+eecLGGaUI6Pgwmi1gcbhXcawX5T3r
         SQVeHtbqr+tYiAPfZTN/xHdhL9j10phoQCkBUYdB/6AAshFWf4Ckw37kVfwRz33OSOfq
         5Fpw==
X-Gm-Message-State: AOAM531e9nrob20sZ+6/Eg7Wnwx5QCLfkqF1L+wPX33TTi274JUEtJkv
        /s+FvBYrXvCPR4XssWGlGsQOZA==
X-Google-Smtp-Source: ABdhPJyClsOWQd1HOJx8+kEKXL8GXAvDh/ETWKrerqxRvGr3pDmCfDtf3PwnNF8948g8MDS7LYIO4w==
X-Received: by 2002:a05:6512:32c1:: with SMTP id f1mr3769373lfg.471.1633444692745;
        Tue, 05 Oct 2021 07:38:12 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id u25sm1973835lfc.176.2021.10.05.07.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 07:38:12 -0700 (PDT)
From:   =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
To:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, robh+dt@kernel.org,
        p.zabel@pengutronix.de, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, dinguyen@kernel.org, p.yadav@ti.com,
        Tudor.Ambarus@microchip.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        alexandre.belloni@bootlin.com, sre@kernel.org,
        thunder.leizhen@huawei.com, Jonathan.Cameron@huawei.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        ka@semihalf.com, tn@semihalf.com, jam@semihalf.com,
        amstan@google.com,
        =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH v2 1/4] i2c: check bus number property in DesignWare I2C Controller
Date:   Tue,  5 Oct 2021 16:37:45 +0200
Message-Id: <20211005143748.2471647-2-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005143748.2471647-1-pan@semihalf.com>
References: <20211005143748.2471647-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On SoCFPGA systems, it's desireable to have fixed numbering for
i2c busses, while being able to enable/disable them (e.g. have i2c1
be mapped to /dev/i2c-1, even though i2c0 is disabled). This can also
be achieved using devicetree aliases (see i2c_add_adapter). However,
having the driver be self-contained without relying on aliases is more
robust.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 21113665ddea..f27e6bc9ad9d 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -280,7 +280,8 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 					I2C_CLASS_HWMON : I2C_CLASS_DEPRECATED;
 	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
 	adap->dev.of_node = pdev->dev.of_node;
-	adap->nr = -1;
+	if (of_property_read_u32(pdev->dev.of_node, "busno", &adap->nr))
+		adap->nr = -1;
 
 	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
 		dev_pm_set_driver_flags(&pdev->dev,
-- 
2.25.1

