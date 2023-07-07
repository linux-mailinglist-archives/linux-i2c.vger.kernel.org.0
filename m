Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA0D474AD54
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jul 2023 10:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232073AbjGGIty (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jul 2023 04:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232068AbjGGItx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jul 2023 04:49:53 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884341FDD;
        Fri,  7 Jul 2023 01:49:51 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3a1e6022b93so1423183b6e.1;
        Fri, 07 Jul 2023 01:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688719791; x=1691311791;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6/HZzggng6ImBWV7Wybriq5wumL5ur/8rhDYyBTGzM=;
        b=mf2siBo5J9gq7eABB7Nm8y6ECnAEsFhsLEjn9li1jzqAut7sTbDqAzUa5vmqESHoT/
         3V7qqY/rXNervnLuM/b/IdNC5AthkbP9dmqgviypmZqeP4zr1W9ZUqUI/aYCZzwGLThi
         pw9taTdJ9DySBaNb5xk1Q0wHMgnKv3Ihs/+hiSaSIONlHvr2Oo8y4uNRb6xPWepYiAd1
         yN0s9e+qQa/GkPPGErhZrmbe9OIzOhg3FpxV9l6w7PcdVH8+hkMnr1yOUHtDe67vSzEq
         X6mpTOIDnVs6G3/7R4djSPKVu9TyOFyn16HsaaCZW0suPaNkVseHbsYRvmxE7iFTjn1s
         sKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688719791; x=1691311791;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6/HZzggng6ImBWV7Wybriq5wumL5ur/8rhDYyBTGzM=;
        b=Q6pY7pqDxNtqOTzcFCulCF/SCrsh3D2vwBqy8+Mal0qThMSbTICRx3qCIhgY94HuZF
         A8gQJXpFSDfBHpOnGRtoKA+48LOqhSeJ4Hz0w6nHJ+vTyStTsYt0evD/kOX/UhAi09Yh
         Ga8ZUtE4Inq3XtNxyrw5HgL+nXIEP4vfXzmMG7v3Fs2NRecBCrbcDO15QvRWIv3l5bMd
         H3vZbN7hYbViVxIS6XDhHBtaxGT8Tebhv+zbFz93ZowNAHTfHw3K7ulA+gsZuaNKny0L
         R1X5zCDxKRlQomTcv1HDglcSJbSGR27r1HjFqQ/PtsBpErD8Gch+8R34IW5ilgnyfV0E
         rp2A==
X-Gm-Message-State: ABy/qLa5zCIocFi8URO5ebppcRuxhMhbTTz/SBr5w2PPlEeZyrJSCW3z
        3zddw0AMUjbp4ReOIFacGns=
X-Google-Smtp-Source: APBJJlFEpyo2vzyYqd2ZbgKtDCdcUh1QAkHSVhZFDmSzOSWV5c7me5KQwGYq59UC1guXPwa84d3oQA==
X-Received: by 2002:aca:1c04:0:b0:3a1:e13e:a89e with SMTP id c4-20020aca1c04000000b003a1e13ea89emr3739262oic.19.1688719790616;
        Fri, 07 Jul 2023 01:49:50 -0700 (PDT)
Received: from 377044c6c369.cse.ust.hk (191host097.mobilenet.cse.ust.hk. [143.89.191.97])
        by smtp.gmail.com with ESMTPSA id bc13-20020a056808170d00b003a38df6284dsm1462632oib.11.2023.07.07.01.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 01:49:50 -0700 (PDT)
From:   Chengfeng Ye <dg573847474@gmail.com>
To:     andi.shyti@kernel.org, rjui@broadcom.com, sbranden@broadcom.com,
        wsa@kernel.org
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chengfeng Ye <dg573847474@gmail.com>
Subject: [PATCH v2] i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
Date:   Fri,  7 Jul 2023 08:49:41 +0000
Message-Id: <20230707084941.28964-1-dg573847474@gmail.com>
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

iproc_i2c_rd_reg() and iproc_i2c_wr_reg() are called from both
interrupt context (e.g. bcm_iproc_i2c_isr) and process context
(e.g. bcm_iproc_i2c_suspend). Therefore, interrupts should be
disabled to avoid potential deadlock. To prevent this scenario,
use spin_lock_irqsave().

Fixes: 9a1038728037 ("i2c: iproc: add NIC I2C support")
Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 85d8a6b04885..30a2a3200bed 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -233,13 +233,14 @@ static inline u32 iproc_i2c_rd_reg(struct bcm_iproc_i2c_dev *iproc_i2c,
 				   u32 offset)
 {
 	u32 val;
+	unsigned long flags;
 
 	if (iproc_i2c->idm_base) {
-		spin_lock(&iproc_i2c->idm_lock);
+		spin_lock_irqsave(&iproc_i2c->idm_lock, flags);
 		writel(iproc_i2c->ape_addr_mask,
 		       iproc_i2c->idm_base + IDM_CTRL_DIRECT_OFFSET);
 		val = readl(iproc_i2c->base + offset);
-		spin_unlock(&iproc_i2c->idm_lock);
+		spin_unlock_irqrestore(&iproc_i2c->idm_lock, flags);
 	} else {
 		val = readl(iproc_i2c->base + offset);
 	}
@@ -250,12 +251,14 @@ static inline u32 iproc_i2c_rd_reg(struct bcm_iproc_i2c_dev *iproc_i2c,
 static inline void iproc_i2c_wr_reg(struct bcm_iproc_i2c_dev *iproc_i2c,
 				    u32 offset, u32 val)
 {
+	unsigned long flags;
+
 	if (iproc_i2c->idm_base) {
-		spin_lock(&iproc_i2c->idm_lock);
+		spin_lock_irqsave(&iproc_i2c->idm_lock, flags);
 		writel(iproc_i2c->ape_addr_mask,
 		       iproc_i2c->idm_base + IDM_CTRL_DIRECT_OFFSET);
 		writel(val, iproc_i2c->base + offset);
-		spin_unlock(&iproc_i2c->idm_lock);
+		spin_unlock_irqrestore(&iproc_i2c->idm_lock, flags);
 	} else {
 		writel(val, iproc_i2c->base + offset);
 	}
-- 
2.17.1

