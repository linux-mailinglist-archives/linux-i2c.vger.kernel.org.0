Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8AD34A8904
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Feb 2022 17:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352351AbiBCQrO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Feb 2022 11:47:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242660AbiBCQrN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Feb 2022 11:47:13 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF323C06173B
        for <linux-i2c@vger.kernel.org>; Thu,  3 Feb 2022 08:47:12 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id l27so2454372lfe.1
        for <linux-i2c@vger.kernel.org>; Thu, 03 Feb 2022 08:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IvlQ+rENmCpAj7qWt57rq8vkztahIT254tiNK/GFl+U=;
        b=RGYSj/148H3f+D2H8wk1BxK28dRoGJwtqGzVRSCRYQucxPxvMoMiPSwiKt2AD++JKC
         NQ0QxMjgZO91nxgm156s/oid30WWMrjXR5MUs6I2635avbvDCauCyzxsxUN2/V2yILai
         04qsOo49g8w5acvv4nEcAkXr/3ayzD2ymLRr0Xi6qiW/MxmwqwT9/EpyzrmBJvnO3JKk
         5nK4CHDhv46oN/6LBl6gBSPwtsQZumhL4aNgaTk/bECPxReMD2T4L0N1L/vrt1dhCNJh
         o9hFAtskvExruweqkHljYNAiD5r0KvDczyBtp4VjZT5slfWWvxWLI4G+XX5qXKXBcP1S
         OSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IvlQ+rENmCpAj7qWt57rq8vkztahIT254tiNK/GFl+U=;
        b=v0CBqtErUj3e0jYg/4J1lOIqXyeISmLoXXu+2omn7PhzOJoWQMXNYvMZKRRwSHV+pu
         3XR7oJ2Zl3Il/aM0nLTcF15HmV9yfohLz/cH14J4PxkNFCiH/058spXc51qay8iHAdTe
         TI8gnsTQT/iTwZ6YIjHtMyEobgS2yUZdKaejbf5RH/8TxYieSroY66ajRHP3t+iHP8Zs
         SpwKiIAGqrirZXwRoLitcfKhYU7ACdAbpHxgBkDPr6LXTUReSiKW3POVHdHkN/PewHut
         ZjgeOU3dm7v7mq6d/U9I1WSflC8ZLAgMNiVwJwDKV7OvghI+Re2gJ5Z5+4j/CD9ADIdX
         rkjQ==
X-Gm-Message-State: AOAM530ZSFZj95eEt6Rq2ZwGs/Cjmrmm6fErJmmEYUpqmntHx6LerIXs
        3fXfSFoROwt4W/ZCjEjYzZiIyQ==
X-Google-Smtp-Source: ABdhPJz6sKPo+9ZkxBUDlXkYHJdg7d3/h6qngUyHTSDuX3HUIf6lug0Xc48OzPYJPD8wXblrzjPGfw==
X-Received: by 2002:ac2:48ac:: with SMTP id u12mr27162061lfg.50.1643906831309;
        Thu, 03 Feb 2022 08:47:11 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id q11sm3186110lfu.88.2022.02.03.08.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 08:47:10 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 7/9] i2c: qcom-cci: simplify access to bus data structure
Date:   Thu,  3 Feb 2022 18:47:09 +0200
Message-Id: <20220203164709.1712069-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Trivial non-functional change, which adds an alias to a widely
used data location.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 32 ++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index cffc01b2285b..775945f7b4cd 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -593,6 +593,7 @@ static int cci_probe(struct platform_device *pdev)
 	dev_dbg(dev, "CCI HW version = 0x%08x", val);
 
 	for_each_available_child_of_node(dev->of_node, child) {
+		struct cci_master *master;
 		u32 idx;
 
 		ret = of_property_read_u32(child, "reg", &idx);
@@ -607,32 +608,33 @@ static int cci_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		cci->master[idx].adap.quirks = &cci->data->quirks;
-		cci->master[idx].adap.algo = &cci_algo;
-		cci->master[idx].adap.dev.parent = dev;
-		cci->master[idx].adap.dev.of_node = of_node_get(child);
-		cci->master[idx].master = idx;
-		cci->master[idx].cci = cci;
+		master = &cci->master[idx];
+		master->adap.quirks = &cci->data->quirks;
+		master->adap.algo = &cci_algo;
+		master->adap.dev.parent = dev;
+		master->adap.dev.of_node = of_node_get(child);
+		master->master = idx;
+		master->cci = cci;
 
-		i2c_set_adapdata(&cci->master[idx].adap, &cci->master[idx]);
-		snprintf(cci->master[idx].adap.name,
-			 sizeof(cci->master[idx].adap.name), "Qualcomm-CCI");
+		i2c_set_adapdata(&master->adap, master);
+		snprintf(master->adap.name,
+			 sizeof(master->adap.name), "Qualcomm-CCI");
 
-		cci->master[idx].mode = I2C_MODE_STANDARD;
+		master->mode = I2C_MODE_STANDARD;
 		ret = of_property_read_u32(child, "clock-frequency", &val);
 		if (!ret) {
 			if (val == I2C_MAX_FAST_MODE_FREQ)
-				cci->master[idx].mode = I2C_MODE_FAST;
+				master->mode = I2C_MODE_FAST;
 			else if (val == I2C_MAX_FAST_MODE_PLUS_FREQ)
-				cci->master[idx].mode = I2C_MODE_FAST_PLUS;
+				master->mode = I2C_MODE_FAST_PLUS;
 		}
 
-		init_completion(&cci->master[idx].irq_complete);
+		init_completion(&master->irq_complete);
 
-		ret = i2c_add_adapter(&cci->master[idx].adap);
+		ret = i2c_add_adapter(&master->adap);
 		if (ret < 0) {
 			of_node_put(child);
-			cci->master[idx].cci = NULL;
+			master->cci = NULL;
 			goto error_i2c;
 		}
 	}
-- 
2.33.0

