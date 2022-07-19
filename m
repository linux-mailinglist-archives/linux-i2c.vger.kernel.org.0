Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2009E579199
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jul 2022 06:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234278AbiGSEGQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jul 2022 00:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235670AbiGSEGN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Jul 2022 00:06:13 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBDDE21E23;
        Mon, 18 Jul 2022 21:06:12 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id t5-20020a17090a6a0500b001ef965b262eso14531919pjj.5;
        Mon, 18 Jul 2022 21:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pjjviKAxMWKcEuuLQJoo7ikBZpRXy53qslO/fzhKHaA=;
        b=n2Ec6vxbtolSecYkGQH4MNKSlooP6W0ajKlDuNMqgmT3w/dNEXOtrPCu6qkcueFXfs
         f9Ii/XAj5a4P1fNZPIHd0pL5uMur+B3imbAqu1/GVN0pTOi1zFporlpiChowQTcPlJ+I
         ysG9MwPr832fjSmh4Qo2TV5owvWaYbB21tIGXQRfAmiNWNHfq0vePMgc7tFjgUEPqgsJ
         Ane+aaDd1GZkvWT8A87cj6pnkNJTaulY7yDXMIYisdrp+5Ur7p5IHCOGtK84+7yLfF86
         RHiHiUCC73BoGpaso4EZUaHXOgJFoErvyJ9lP8u6iPKDhgnVlEweyhAZiE4beMF64375
         2oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pjjviKAxMWKcEuuLQJoo7ikBZpRXy53qslO/fzhKHaA=;
        b=NZRDTo84Y85/Y/qx9wSm3Gf1AgsM8HWqBAovHbWCWRosTJo0qPGm/9r4K214a0214w
         GvgaKLgu3MpHyAkiBVVrlKiJikfGp+JDy/h0AJmTp04iLtHdk/dYFoefmYnUEWovxdqC
         tB54rFOaNtSTfvFI7a8GHFJp4drU7zm2V6/tfvimYFYjRnVBR0SHYU4CIZVnl4Wi2SvH
         OkiKwC3WtRshaFRzEPQ3wFDV1LN2ul4qLPKapjr/1DtzRDueCv1mSuPd8dtbP1EowEUk
         nNJ/PE8mgWXfnRawfMtzktmVxAvaKsEY5wWEaabwiLggZ+du+Za9FGxQjRdMmj9Nb4Z8
         1yxg==
X-Gm-Message-State: AJIora948lLgl6uums42vqqR9xx+2FdGR14zxPKXdTyIyZTIEjwYQvKj
        7eJ8b3YJX2Fz+SmSbgAB2JJxYBLyS0I=
X-Google-Smtp-Source: AGRyM1seCzeINhr9uRv1a7ySsJqo7WjngwlZMYwTJFpssi85iyNG9CdlesA8YvqWYXNam6Mrg3ujOw==
X-Received: by 2002:a17:90b:4a4d:b0:1ef:bc34:405a with SMTP id lb13-20020a17090b4a4d00b001efbc34405amr35320947pjb.96.1658203571864;
        Mon, 18 Jul 2022 21:06:11 -0700 (PDT)
Received: from 7YHHR73.igp.broadcom.net (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id g5-20020a170902d1c500b0016bd72887fcsm10281807plb.59.2022.07.18.21.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 21:06:11 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-i2c@vger.kernel.org (open list:BROADCOM BRCMSTB I2C DRIVER),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX
        ARM ARCHITECTURE)
Subject: [PATCH] i2c: brcmstb: Use dev_name() for adapter name
Date:   Mon, 18 Jul 2022 21:06:10 -0700
Message-Id: <20220719040611.13979-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This make it easier to disambiguate the different i2c controllers
present in a system, and then correlating with /proc/interrupts allows
to know which instance is interrupt driven and which one is not.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/i2c/busses/i2c-brcmstb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index b00f35c0b066..3ba6cbbe84ac 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -684,9 +684,7 @@ static int brcmstb_i2c_probe(struct platform_device *pdev)
 	adap = &dev->adapter;
 	i2c_set_adapdata(adap, dev);
 	adap->owner = THIS_MODULE;
-	strlcpy(adap->name, "Broadcom STB : ", sizeof(adap->name));
-	if (int_name)
-		strlcat(adap->name, int_name, sizeof(adap->name));
+	strlcpy(adap->name, dev_name(&pdev->dev), sizeof(adap->name));
 	adap->algo = &brcmstb_i2c_algo;
 	adap->dev.parent = &pdev->dev;
 	adap->dev.of_node = pdev->dev.of_node;
-- 
2.25.1

