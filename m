Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66AC04E7D52
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Mar 2022 01:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbiCYThD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Mar 2022 15:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbiCYTg4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Mar 2022 15:36:56 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A0A52042B7
        for <linux-i2c@vger.kernel.org>; Fri, 25 Mar 2022 12:09:47 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-de48295467so9034703fac.2
        for <linux-i2c@vger.kernel.org>; Fri, 25 Mar 2022 12:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Or3XD0+Zb4OV2+OCkaJAUpyaadYeZVEGGbOLPheJqiU=;
        b=MOkglHrE+qluYE0n2oJYXD++OIpDTYTZd7qFcjz9GJTHYU0iZlWNMErzQX/oHzczlK
         bFEQCC65kETyWcJDgZQp3Uh+GahNf2crCYEZKLU5t5E4QnJh8FyNO/KkKSY3USqCLGP8
         0BvUlxzlLjrZ7guFBmEsAkdtQT0xtLXdXfdlPStQabU1J6lfi2f/7A+zToHXIJvmoune
         lYXjmtm3fLGXVCpexOPYltbsJu502UXwXFRJIcKFp8hpt44jxAOVBM2+GC5ZWvO39MGa
         ts64MThTanZO4DTsKwzyy+nzU4i0Gbc1//virPgkg50ZHj4b2gUo3S4j2O//MVh/19fK
         v/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Or3XD0+Zb4OV2+OCkaJAUpyaadYeZVEGGbOLPheJqiU=;
        b=qXJqYlAXTUvF5m0+G+fHg3swlvIdA46STMfO2pszimwRfB5OR8hdAogYB1nbCAmbbT
         u0M7xceDspgwi/mglkIe7odVzY2EbhmcyjVY6Ht7ks+Jw0kDrjQBIs/uGJMPlwPQhQ1w
         CFyq0yUIldmQyAm2GJ9ESDO5YZezccCBh67TdfNPvzIYNap2PDov8oPlOGuKBTidrvkB
         PdmpUDqJNmtR0+2c1zjB0kxmpWtZgv3b66nKD7ZZdkLQMMubZxWqLbi3S6M/VQzEJT1x
         U90UqpcMhf6ontVlIP2H8jIBq+0yAthAwpIOBV0LoHJqp3F5B1arSiabGqsnaVhSIS6C
         ekcQ==
X-Gm-Message-State: AOAM532PVDtjHR47MRq2AH21KPvUG2q2j5EH0SwK+lGnrhkzjDt5O/ds
        CO4JoJm5c4ZQLZNWoPMU7duNn+Vu+wk=
X-Google-Smtp-Source: ABdhPJxpxscr5Eqf/EOMrjECcaIFMFw92O44qlOfPYNBAzJOoITwNyLzZvyarTujWzT+I4GeB4d4Cg==
X-Received: by 2002:a05:6870:4411:b0:de:6c37:43b4 with SMTP id u17-20020a056870441100b000de6c3743b4mr8000099oah.25.1648231596716;
        Fri, 25 Mar 2022 11:06:36 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id c8-20020a4ad788000000b0031ce69b1640sm2725519oou.10.2022.03.25.11.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 11:06:34 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-i2c@vger.kernel.org
Cc:     gregory.clement@bootlin.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH] i2c: mv64xxx: Remove shutdown method from driver
Date:   Fri, 25 Mar 2022 13:06:25 -0500
Message-Id: <20220325180625.31414-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

When I attempt to shut down (or reboot) my R8 based NTC CHIP with this
i2c driver I get the following error: "i2c i2c-0: mv64xxx: I2C bus
locked, block: 1, time_left: 0". Reboots are successful but shutdowns
freeze. If I comment out the shutdown routine the device both reboots
and shuts down successfully without receiving this error (however it
does receive a warning of missing atomic_xfer).

It appears that very few i2c drivers have a shutdown method, I assume
because these devices are often used to communicate with PMICs (such
as in my case with the R8 based NTC CHIP). I'm proposing we simply
remove this method so long as it doesn't cause trouble for others
downstream. I'll work on an atomic_xfer method and submit that in
a different patch.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index 5c8e94b6cdb5..424c53e4c513 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -1047,14 +1047,6 @@ mv64xxx_i2c_remove(struct platform_device *pd)
 	return 0;
 }
 
-static void
-mv64xxx_i2c_shutdown(struct platform_device *pd)
-{
-	pm_runtime_disable(&pd->dev);
-	if (!pm_runtime_status_suspended(&pd->dev))
-		mv64xxx_i2c_runtime_suspend(&pd->dev);
-}
-
 static const struct dev_pm_ops mv64xxx_i2c_pm_ops = {
 	SET_RUNTIME_PM_OPS(mv64xxx_i2c_runtime_suspend,
 			   mv64xxx_i2c_runtime_resume, NULL)
@@ -1065,7 +1057,6 @@ static const struct dev_pm_ops mv64xxx_i2c_pm_ops = {
 static struct platform_driver mv64xxx_i2c_driver = {
 	.probe	= mv64xxx_i2c_probe,
 	.remove	= mv64xxx_i2c_remove,
-	.shutdown = mv64xxx_i2c_shutdown,
 	.driver	= {
 		.name	= MV64XXX_I2C_CTLR_NAME,
 		.pm     = &mv64xxx_i2c_pm_ops,
-- 
2.25.1

