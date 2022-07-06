Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21D40569086
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jul 2022 19:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233722AbiGFRVV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jul 2022 13:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233475AbiGFRVU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jul 2022 13:21:20 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3A771D326;
        Wed,  6 Jul 2022 10:21:19 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id q82so7342806pgq.6;
        Wed, 06 Jul 2022 10:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iQ5noOvGBeEdUsZZU3bl5ZMukN/7ulkT0cDCAalkyJg=;
        b=IGb49zmS+Sa2ncGd5HLtS7vDXnDSEBOfwavtDQ5eh0Uikr4GMhDpaDg0ML0YSrqgSq
         ZfNpElMTMwlSwAjCFuuWcEWrNZCCHLUnJFrboD+PC4IU625a9ixYg9vPbiVlqWnoGD0X
         yoxXQbe0yfEtuZ5f7YBjv1Spki8+7U5kJmx8kz9iSTyufD+FdHMjaOoBq9Y1NO2XpfuW
         oVQlS7SBI9EUC2F3Ls0ehAdTMHasul2l4SkDElcI7ozow78tFDyub0Z03LlopSYd/xOq
         NNBnxc7cXDMehUznO2Jr106dp0hiCkE+JF1ixdsogh730neb4NaHM6I1QjuIYCgGlFx6
         eEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iQ5noOvGBeEdUsZZU3bl5ZMukN/7ulkT0cDCAalkyJg=;
        b=IZPJ/WhyDnJAyy9yVhJJ0Y5jw8ZCYd7wTqcYcv4DixwQIXXI9KN8Ee7PVOMTOm47dz
         4t4qkP8la6Vw3q9RA+J/VhZNCQuoadQaMBUvU2xRhohU7LHkKM2Jho3zhmIsKBh5EEb9
         1plqsAyPGqCxXVIR5oU5/ewbL50sbuHxwsYJm/Wmu++pRk884SpiHwVeDj5lN3XJYiR/
         k+Ge8cOYcb3ftb5kncJFmNiPJ4xCEBdHxVbxqBEVZy9wyZRXn5eSL3W4zgpyOaBo/b4n
         vL7PXrEYy+X7WQMdiDZgn8zvx0bcOYq4zfWvLfylVB89Hu4wWUd4sUY2btwj7lpoWdkC
         8ckg==
X-Gm-Message-State: AJIora9RARe7VXkKQjlhQlbzQQ0YVr4iq7Qw+JCpZa9gHtd+VT218Xzm
        SYeNcICRCzKfEIdp6Ns/lRqxuAMFOKo=
X-Google-Smtp-Source: AGRyM1sngHdZngEJQqUY76AjUmgw2ddwaF7gm4SgEXnx0rqBNMDKYZcBMJq0E2JPQtYYTSzJ1CodJg==
X-Received: by 2002:a65:6bc8:0:b0:412:9b2c:1700 with SMTP id e8-20020a656bc8000000b004129b2c1700mr3114873pgw.8.1657128078922;
        Wed, 06 Jul 2022 10:21:18 -0700 (PDT)
Received: from localhost.localdomain (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id cd21-20020a056a00421500b0051b32c2a5a7sm24710409pfb.138.2022.07.06.10.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 10:21:18 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org (open list:BROADCOM BRCMSTB I2C DRIVER),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX
        ARM ARCHITECTURE)
Subject: [PATCH] i2c: brcmstb: Fixed adapter named with optional interrupts
Date:   Wed,  6 Jul 2022 10:21:15 -0700
Message-Id: <20220706172115.224240-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When the adapter is registered without interrupts, we would be showing
the following:

  # i2cdetect -l
  i2c-3   i2c             Broadcom STB :                          I2C adapter

which is visually disturbing, only add the separator if we do have an
interrupt.

Fixes: dd1aa2524bc5 ("i2c: brcmstb: Add Broadcom settop SoC i2c controller driver")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/i2c/busses/i2c-brcmstb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index b00f35c0b066..538a51299e04 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -684,9 +684,11 @@ static int brcmstb_i2c_probe(struct platform_device *pdev)
 	adap = &dev->adapter;
 	i2c_set_adapdata(adap, dev);
 	adap->owner = THIS_MODULE;
-	strlcpy(adap->name, "Broadcom STB : ", sizeof(adap->name));
-	if (int_name)
+	strlcpy(adap->name, "Broadcom STB", sizeof(adap->name));
+	if (int_name) {
+		strlcat(adap->name, ": ", sizeof(adap->name));
 		strlcat(adap->name, int_name, sizeof(adap->name));
+	}
 	adap->algo = &brcmstb_i2c_algo;
 	adap->dev.parent = &pdev->dev;
 	adap->dev.of_node = pdev->dev.of_node;
-- 
2.25.1

