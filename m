Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1DC4DAAD2
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Mar 2022 07:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243193AbiCPGsg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Mar 2022 02:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236005AbiCPGsf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Mar 2022 02:48:35 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C58461A2D;
        Tue, 15 Mar 2022 23:47:22 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id h2so2695356pfh.6;
        Tue, 15 Mar 2022 23:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=S0FWgyXHo+RiwHLAlAUSX2fIHtUAv+xZLkceIzty9Ik=;
        b=pGXJv8iNe3Ts1r32TM0SWeThT7nY3rTIAVasalVKbishbAeQ+h/655CMOsd1XYdYWo
         BsRCT+VUAArAclU+Kd3mCOb4jQQyK569ZYvLOL68aBGfWvbk1VufbI9PfX0FM18qHVmu
         nbeI3JtD6qkQLLW86Q9oXohrzjQeBvPzMAtUnXRCc6SObKZri4G+ZfYp6OenGoXtOXI3
         yelHZsvv+Ojvy6frAK8MV9A87ox6daOSb08TpU3dKFyvF6wRMxxNNBH8jFNykF7QPnOs
         NdJd6L4U9TBtu7hhlYZyKlSgBrZA8eOSDU9ANHCwb6M7WTY7Tt88BCWIt0fSk896ljSe
         mSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=S0FWgyXHo+RiwHLAlAUSX2fIHtUAv+xZLkceIzty9Ik=;
        b=EDHP6uxV0eLCc+4RxqG6/sw+y46aYqtlDVSebuMqFpefzeVACoWwzoaYwX6exzscyE
         GlMGCxmDHvOc3/Eym8/8pJMr1nZFB49fzWm3o6KQV62AQm96Nwvw7DkhoJa67EkN3bMF
         Lkwebdsj0mtskOcEsETFyQ5PLvPcJKbDBFNOUTUXRbnn9lAzPK2a9PEHUMVYyWWxLuK8
         HPMoQXasKSv5YIK/8IFc1EGS7nGx3MpAZd6qqIYdBNqiZ1ENH8V3GnF7OiV0/RZroYMx
         eb++28yJC3ENs4cBs6GEJtgCI1ZdyZRBkn6Rddh2jC4xeqrIcAcojsqFdpDe6CgxV4Jc
         pnRw==
X-Gm-Message-State: AOAM531SrXB9AiVpBP4utlGTYRxuWbhjykf2xlI8PZdoZdzTucghwAJ8
        je51Zrw2Ytg8dwljqxmSt0Y=
X-Google-Smtp-Source: ABdhPJyNfrvHPS9v5aFY47ezqFWUPYtX64d1cbJ8omEHt6OfsoXkor86QeerO9raIY7odqSgynFsxA==
X-Received: by 2002:a63:2b05:0:b0:380:95c8:e0a with SMTP id r5-20020a632b05000000b0038095c80e0amr27681969pgr.257.1647413241816;
        Tue, 15 Mar 2022 23:47:21 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
        by smtp.googlemail.com with ESMTPSA id b16-20020a056a00115000b004f6ff260c9esm1534452pfm.207.2022.03.15.23.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 23:47:21 -0700 (PDT)
From:   Miaoqian Lin <linmq006@gmail.com>
To:     Ard Biesheuvel <ardb@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     linmq006@gmail.com
Subject: [PATCH] i2c: busses: Fix error handling in synquacer_i2c_probe
Date:   Wed, 16 Mar 2022 06:47:16 +0000
Message-Id: <20220316064716.16587-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In the error handling path, the clk_prepare_enable() function
call should be balanced by a corresponding 'clk_disable_unprepare()'
call, as already done in the remove function.

Fixes: 0d676a6c4390 ("i2c: add support for Socionext SynQuacer I2C controller")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/i2c/busses/i2c-synquacer.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index e4026c5416b1..cd955224d629 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -569,22 +569,27 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
 	    i2c->pclkrate > SYNQUACER_I2C_MAX_CLK_RATE) {
 		dev_err(&pdev->dev, "PCLK missing or out of range (%d)\n",
 			i2c->pclkrate);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_disable_clk;
 	}
 
 	i2c->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(i2c->base))
-		return PTR_ERR(i2c->base);
+	if (IS_ERR(i2c->base)) {
+		ret = PTR_ERR(i2c->base);
+		goto err_disable_clk;
+	}
 
 	i2c->irq = platform_get_irq(pdev, 0);
-	if (i2c->irq < 0)
-		return i2c->irq;
+	if (i2c->irq < 0) {
+		ret = i2c->irq;
+		goto err_disable_clk;
+	}
 
 	ret = devm_request_irq(&pdev->dev, i2c->irq, synquacer_i2c_isr,
 			       0, dev_name(&pdev->dev), i2c);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "cannot claim IRQ %d\n", i2c->irq);
-		return ret;
+		goto err_disable_clk;
 	}
 
 	i2c->state = STATE_IDLE;
@@ -607,7 +612,7 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
 	ret = i2c_add_numbered_adapter(&i2c->adapter);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to add bus to i2c core\n");
-		return ret;
+		goto err_disable_clk;
 	}
 
 	platform_set_drvdata(pdev, i2c);
@@ -616,6 +621,11 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
 		 dev_name(&i2c->adapter.dev));
 
 	return 0;
+
+err_disable_clk:
+	if (!IS_ERR(i2c->pclk))
+		clk_disable_unprepare(i2c->pclk);
+	return ret;
 }
 
 static int synquacer_i2c_remove(struct platform_device *pdev)
-- 
2.17.1

