Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA4D91C2C13
	for <lists+linux-i2c@lfdr.de>; Sun,  3 May 2020 14:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727982AbgECMI7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 May 2020 08:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727955AbgECMI7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 May 2020 08:08:59 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9B3C061A0C;
        Sun,  3 May 2020 05:08:58 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id z6so5642427plk.10;
        Sun, 03 May 2020 05:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=OPAruJN93T/BqNZ0orjpx+YVAhbV4pfvgi5Yk5S86ps=;
        b=TNFPAeenGYQbmWv/hoyiLr7ltiaSlCGNRaCikOM02NUvqd81LLAdzX7ZdyXXSTDSkB
         U92lpGZEFB2FEYS77NlttQ02q1NbMYearGAlXBXUPzmNVH73Nft0ni+iTkvS+5m1k0s8
         Q331Zq+8Eccx4akiBl/4DRb6C9VFX/q/8WPH7N6PjsSJpawPdTb4hqG3JyEYiBQ6PacM
         26RUxOagitSxAat09fRabluxc4Kv3nmqanPclPZct6ltOkzpKMb8ip5yvwKVoj/hk3xI
         wrFc1cVIqQ+G5RD1yNXHNjESuOAxxxrLEnspaVtoZp30zFUiSkOCRdfmaK4uj5pSbNyS
         4PjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OPAruJN93T/BqNZ0orjpx+YVAhbV4pfvgi5Yk5S86ps=;
        b=sabEGqasVA4JkGuOoZjAmlCDr70dvf1zYAmDalZj5JLNOJJxfRgmSF/xlySPokQZtq
         a8quvTbjueJi/VtAQR/etAxft63m2/l4o6dV7syUUeLoCzCaoy6ct2AxhnHLAmE7qVJS
         tmGBP44HvDBb4g28bbKoQpLyz8lo0Vb2WPImDR/x/MamWvOIpClfv/fKMmShSFYTshD1
         3CV6GgrmdiYP7gr6TB98Cz4M/QAy/0/FBNpVSIxZeN9q1lVURSMNCFm4PsL9O1RiacLK
         gAD73cU+WOH4zvf/9WozjqEr2uqxCwhBtbqtM5fuU5L00AMefDyB9P2DjulQdISWoFRr
         1xsw==
X-Gm-Message-State: AGi0PuZjQywqiQdkyU+SATxnPXm6Z/Bz9qIjPkeJffVKJ+r8q9Lf/JhR
        TtiiydJtWDcbSA0bKlh9shO8aJTv
X-Google-Smtp-Source: APiQypLDDAB1Sw4AmqmTtsN4ogJyVEpa9EMzvsAE8pljFhpLnM1apQ97W8SeUn0gNbrpl1ptfy1YVg==
X-Received: by 2002:a17:90a:f698:: with SMTP id cl24mr11046094pjb.71.1588507738318;
        Sun, 03 May 2020 05:08:58 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:8b:8746:9817:f6e9:c9f8:6a59])
        by smtp.gmail.com with ESMTPSA id q201sm6371388pfq.40.2020.05.03.05.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 05:08:57 -0700 (PDT)
From:   Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     aishwaryarj100@gmail.com
Subject: [PATCH] i2c: uniphier: Remove superfluous error message in uniphier_i2c_probe()
Date:   Sun,  3 May 2020 17:38:47 +0530
Message-Id: <20200503120847.13528-1-aishwaryarj100@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The function platform_get_irq can log an error by itself.
This omit a redundant message for exception handling in the
calling function.

Suggested by Coccinelle.

Signed-off-by: Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
---
 drivers/i2c/busses/i2c-uniphier.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-uniphier.c b/drivers/i2c/busses/i2c-uniphier.c
index 668b1fa2b0ef..ee00a44bf4c7 100644
--- a/drivers/i2c/busses/i2c-uniphier.c
+++ b/drivers/i2c/busses/i2c-uniphier.c
@@ -324,10 +324,8 @@ static int uniphier_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->membase);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "failed to get IRQ number\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	if (of_property_read_u32(dev->of_node, "clock-frequency", &bus_speed))
 		bus_speed = I2C_MAX_STANDARD_MODE_FREQ;
-- 
2.17.1

