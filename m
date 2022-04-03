Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 156184F0813
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Apr 2022 08:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbiDCGfL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 Apr 2022 02:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiDCGfK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 Apr 2022 02:35:10 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3008B850;
        Sat,  2 Apr 2022 23:33:17 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id ku13-20020a17090b218d00b001ca8fcd3adeso226790pjb.2;
        Sat, 02 Apr 2022 23:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id;
        bh=nNYh9c9ygtGkMhE+lF3e5BAb42jdUgtNB+p2T9trf0I=;
        b=mRV6cSFU9vw/UoccggTlBWnVGV11ANuzMiDrnND6Yc6MUJk9/+jx2VqYYc0qGiCFL9
         GSn5ryg0/sjuqWs0f2qewkN7bXrfoafSlu4WRDLtj4KyDXr8WFwEmOky6RG5r3pCptA8
         yHiE5D6LypYVFAVf9AOeIFlT/MZ8KMmn+IH4sH7d+RQhwCfiQ1q/8OumQDq7KDzjef1t
         aW1dr5ZlR9J4IjR9oWLFrn8Lpzz7+jGTxYh3bJOI52ruEc9gdMMjw2JMiJR4iyirQ3Zr
         zm6WXShSDzyIHshPfNlMl/NEPduLdjSAj0A9yG9kRkWZ4KnXD+LAtYQDPmVUjPG6zi2E
         Ca2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=nNYh9c9ygtGkMhE+lF3e5BAb42jdUgtNB+p2T9trf0I=;
        b=GUL0oVZGEZL1m7bCuQ8Gn1epaYRbqsC5kp7XpaDOntd+KKOcgamLdy6XgSYLJfqXk5
         jou//X8XmU21Mn2BIQCyrXQl12bUoK7GHl0w1+EVEWhOfm6z5Ry8eycRw0wJKGvjKIOi
         XTo3LKGmIPDDzLieqK1/ziZVQ8WQ8auQqDOLAYhDpljUdZp3ffPVWoUaa6zYniCtMpmP
         NJJG6IXxBfOOnWCd4AU3v/Q8diFHB6D1vdwrVdBrZ3o/wKWA/fIHDAz9CLerSO4Kg4LZ
         6uceILjE5uEuJ98XkizpaXbRqOaS7JxOKlHzLcT1xkyqiV55sF1XobrSiWxUmLSBeDCs
         F5Hg==
X-Gm-Message-State: AOAM531Q+4gAH2N+bkin1Lsw6OxqFH8vihQJr8kn4x/rxrSkcr7gGr2b
        P4CkHqE5zHfOehFSozmciJU=
X-Google-Smtp-Source: ABdhPJwsbh4L7YbRKVYTF/NUFII2EoYJhc6Wa9Z9B+I5SrdL7yC1/KX2hAnVliW3fx3GG5py2lk7jw==
X-Received: by 2002:a17:90b:4a01:b0:1c9:a552:f487 with SMTP id kk1-20020a17090b4a0100b001c9a552f487mr20443830pjb.68.1648967597114;
        Sat, 02 Apr 2022 23:33:17 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
        by smtp.googlemail.com with ESMTPSA id u25-20020a62ed19000000b004f140515d56sm8128049pfh.46.2022.04.02.23.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 23:33:16 -0700 (PDT)
From:   Miaoqian Lin <linmq006@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Miaoqian Lin <linmq006@gmail.com>,
        Eric Anholt <eric@anholt.net>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Annaliese McDermond <nh6z@nh6z.net>, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: bcm2835: Fix error handling in bcm2835_i2c_probe
Date:   Sun,  3 Apr 2022 06:33:08 +0000
Message-Id: <20220403063310.7525-1-linmq006@gmail.com>
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
call. And clk_set_rate_exclusive calls clk_rate_exclusive_get(),
it should be balanced with call to clk_rate_exclusive_put().
, as already done in the remove function.

Fixes: bebff81fb8b9 ("i2c: bcm2835: Model Divider in CCF")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/i2c/busses/i2c-bcm2835.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 5149454eef4a..d794448866a7 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -454,18 +454,21 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(i2c_dev->bus_clk);
 	if (ret) {
 		dev_err(&pdev->dev, "Couldn't prepare clock");
-		return ret;
+		goto err_put_clk;
 	}
 
 	i2c_dev->irq = platform_get_irq(pdev, 0);
-	if (i2c_dev->irq < 0)
-		return i2c_dev->irq;
+	if (i2c_dev->irq < 0) {
+		ret =  i2c_dev->irq;
+		goto err_disable_clk;
+	}
 
 	ret = request_irq(i2c_dev->irq, bcm2835_i2c_isr, IRQF_SHARED,
 			  dev_name(&pdev->dev), i2c_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not request IRQ\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_disable_clk;
 	}
 
 	adap = &i2c_dev->adapter;
@@ -489,8 +492,16 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 
 	ret = i2c_add_adapter(adap);
 	if (ret)
-		free_irq(i2c_dev->irq, i2c_dev);
+		goto err_free_irq;
+
+	return ret;
 
+err_free_irq:
+	free_irq(i2c_dev->irq, i2c_dev);
+err_disable_clk:
+	clk_disable_unprepare(i2c_dev->bus_clk);
+err_put_clk:
+	clk_rate_exclusive_put(i2c_dev->bus_clk);
 	return ret;
 }
 
-- 
2.17.1

