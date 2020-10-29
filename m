Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8C3529E4CF
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Oct 2020 08:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387630AbgJ2HrW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Oct 2020 03:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387599AbgJ2HrS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Oct 2020 03:47:18 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ADCCC0613CF;
        Thu, 29 Oct 2020 00:47:18 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id e15so1651823pfh.6;
        Thu, 29 Oct 2020 00:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RMptxvJmzOcZiuXNgbU/HwziNAPryxG8DYu7tZwcxLQ=;
        b=ujy//ADrms1eofnQAz11bblwO1E1flvt7rEanUwzH3ALIbzvBP8QBeaL8UwceylDcl
         YXu+MnsHF6Ic+PrAKO3yIyzJLA1R99bWvJYzlrOClwOiPjDKaipwPPi5E4RC/kYAE8SQ
         ZAaFZFUfYjlzhrKNLO/PD4/DxffevErzJ21FnJ8G9pPKJQnLrqQgnaYSF1rweqqAf/lm
         qrlo+rrqS+2m+4fbCkt8p94IQXKMtyAIOmlbGUmz/fX5f9JdlaYyBAEqlGq37dpDK0AV
         NQIDiHozX1XNOaonMf0QYYT2GexsXc/bwQWdeiaodSADmULgs8GPhKr9yk5arffDnDf2
         wTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RMptxvJmzOcZiuXNgbU/HwziNAPryxG8DYu7tZwcxLQ=;
        b=rXLkYuX7VzEioQiYL/FweKtmwUcSblY5LbUHmPn+XQEM8+6vTxjNd8EzvOGP0tlou0
         Yu0tuyQ5rasqxmU5QJfXs5ayYlLn4jVRAXZS2BwWMzqr8EdEUtKDoQizELLIbpgsCR59
         kAzXmnfRi8i/n0/0/X570Z7g9R2dPZiFdHUpySI0ZIkw/3xjxHN8StMOkDICFq3NNY1O
         RTQ6+hsdXUzx/Y2peHm5quCoFH3tfljqR8F8rtH6yMX1iYL4ORqLRTkCKMqsQcyPK8+E
         Vb+dHdDvyEEei0oUWwZYDRhbWOdTjlOKBhPEdpdLzojm/1/xkZ8mu62+/7WGt2Rfp1Xk
         jrXg==
X-Gm-Message-State: AOAM533onKxjH/O1N/ZZTFPRDOxBzIDsf2+Woa2YHcibAdxffSavM1Nc
        II3h5wTCShdhI/1FUjlXnw29bYKY0f0KTKHI
X-Google-Smtp-Source: ABdhPJw8P1RoK4I78C2zTcT3FY9ZJ4cZamb/26Rqvh2ViBc7KDj3Fnsuu9LYIO9HCkQJTW/1BzyCMA==
X-Received: by 2002:aa7:9dcd:0:b029:152:421f:23eb with SMTP id g13-20020aa79dcd0000b0290152421f23ebmr3223431pfq.58.1603957637685;
        Thu, 29 Oct 2020 00:47:17 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
        by smtp.gmail.com with ESMTPSA id v125sm1864615pfv.75.2020.10.29.00.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 00:47:17 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     linux-i2c@vger.kernel.org
Cc:     Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/5] i2c: mediatek: remove unnecessary CONFIG_PM_SLEEP
Date:   Thu, 29 Oct 2020 15:46:51 +0800
Message-Id: <20201029074654.227263-2-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074654.227263-1-coiby.xu@gmail.com>
References: <20201029074654.227263-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 0cbdfbe605b5..c2939f2e5dea 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1284,7 +1284,6 @@ static int mtk_i2c_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int mtk_i2c_resume(struct device *dev)
 {
 	int ret;
@@ -1302,7 +1301,6 @@ static int mtk_i2c_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops mtk_i2c_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(NULL, mtk_i2c_resume)
-- 
2.28.0

