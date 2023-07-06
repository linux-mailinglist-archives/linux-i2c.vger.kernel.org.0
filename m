Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA0A74A5C7
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 23:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232394AbjGFVOg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jul 2023 17:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232672AbjGFVOf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jul 2023 17:14:35 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F7751BF8;
        Thu,  6 Jul 2023 14:14:29 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-56597d949b1so816183eaf.1;
        Thu, 06 Jul 2023 14:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688678068; x=1691270068;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HPMk53DYK8e+Bl4mudoo8nEvNlWFMO8Yu/MUeAfcgw=;
        b=ZP97fNRMvWcbMExc1H7NSAHzWi9iQ0xIKjsiOpTh7ZYnCiKemLc54lgjzF0PME6/rt
         2yKAYt5Lm/pd6tTQ54AQ05jUIuMN+ITG3dWtb1dJ0F6a1ugAKz/BmfWnPDOwTxyTVhos
         Xgd4QPaczjHJIMpSfnhAO7JKU/p5201ioz95KDcBTY/io3T2OhcMp1Tsga8r2lrcpnAQ
         3phKz03UuaZNTOEVv5+RrCP0bo+wWFQmXfgzoWqODaeK4tXa9imo1TsJ3QYvSWZkQiFT
         +JblbI3IwvlUIiH/bXZpAW1l91imIAXQChMJrEsvxV+SpSLodocKsGc4s5s8rZ8ZPM7q
         Gbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688678068; x=1691270068;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5HPMk53DYK8e+Bl4mudoo8nEvNlWFMO8Yu/MUeAfcgw=;
        b=lH1UfOPQdFPllT+KHrJxC27kSDDAN8qcHluH8jD14uldIOmcwTH3Ka6y8pXsqNFRuW
         oga7tv2oWk6OUe5nScBZNfiVVO/RPRy4YOonxRSXG+I7u/dnxYjI37aDq6FbneYsWte6
         TFuKFOSewPwjt48UV3fq2NVPx9Fr88YODy2uwV1svm+DY2oV0hz1Ckjtz3FaHsvrDE58
         i+JtVug1DiF7NcScp9XyC7BLHWohVWGEQ2qCZXJ90L3qZgGzeJvOoGgnfak7KrQCd7s2
         BmyRTjoKhQUYFelrM/F/wzAeuFHDseNjctk7FHEFhYl0k1BqDyPA7FnORG1FnCKVZZe4
         0ruA==
X-Gm-Message-State: ABy/qLZSdJWluJPVrXpxsCiMKCERlM5UdgGKGbZE8Xf0ygxRuWSfnbPO
        iAB6MbbEXkHB0exTZzSAWfY=
X-Google-Smtp-Source: APBJJlEJRSlMqTAsb1/Mhe3I9HeKRUQFktrGM9vLEsMb/HkYxNLD2l/sDxoUsRgbeM51/mMsK7sRgA==
X-Received: by 2002:a4a:5207:0:b0:565:9028:d034 with SMTP id d7-20020a4a5207000000b005659028d034mr2334846oob.4.1688678068662;
        Thu, 06 Jul 2023 14:14:28 -0700 (PDT)
Received: from 377044c6c369.cse.ust.hk (191host097.mobilenet.cse.ust.hk. [143.89.191.97])
        by smtp.gmail.com with ESMTPSA id v14-20020a4a8c4e000000b00565fcfabab8sm1077585ooj.21.2023.07.06.14.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 14:14:28 -0700 (PDT)
From:   Chengfeng Ye <dg573847474@gmail.com>
To:     andi.shyti@kernel.org, rjui@broadcom.com, sbranden@broadcom.com,
        wsa@kernel.org
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chengfeng Ye <dg573847474@gmail.com>
Subject: [PATCH RESEND] i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
Date:   Thu,  6 Jul 2023 21:14:14 +0000
Message-Id: <20230706211414.10660-1-dg573847474@gmail.com>
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

iproc_i2c_rd_reg and iproc_i2c_wr_reg are called from both
interrupt context (e.g. bcm_iproc_i2c_isr) and process context
(e.g. bcm_iproc_i2c_suspend). Therefore, interrupts should be
disabled to avoid potential deadlock. To prevent this scenario,
use spin_lock_irqsave.

Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 85d8a6b04885..d02245e4db8c 100644
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
@@ -250,12 +251,13 @@ static inline u32 iproc_i2c_rd_reg(struct bcm_iproc_i2c_dev *iproc_i2c,
 static inline void iproc_i2c_wr_reg(struct bcm_iproc_i2c_dev *iproc_i2c,
 				    u32 offset, u32 val)
 {
+	unsigned long flags;
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

