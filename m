Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00B764A8903
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Feb 2022 17:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352408AbiBCQrM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Feb 2022 11:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242660AbiBCQrL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Feb 2022 11:47:11 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB7C2C061714
        for <linux-i2c@vger.kernel.org>; Thu,  3 Feb 2022 08:47:10 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id x23so7356515lfc.0
        for <linux-i2c@vger.kernel.org>; Thu, 03 Feb 2022 08:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CZkW/5anEw5GrivfXwnX+cAuoc6zYllNAJ26zHVAzzA=;
        b=clR2GdAbej5ki7kv6ANbm+BsBtf/uWblDU8kRHZz9d+fMUhLt43E9+0alRcE1SpOrK
         gwv95xz3tiQa8x0hhpdlJFx04GMlSZOVslgt4eJnTDKSe5uLQaJG5PRco4Htg38TVU9G
         UCWNFIb87/yuo3wEtoZ4NlZhTYKAVgZfJ7eMXQY07EEin5BLRx2wTJTCPkFbo4mUEo1z
         thcgLPNyGrWNZfMptGs1GNEl/6TC8BfsxfMHMwHDrrHTncdrkIp4Lc8XiaVx4SRXumQJ
         2q41azt8xY47UjVFo2BwkZni/RksU8ZTFkAD3dkxLoL1/Yg1vUqEBH9nnizfW7SB78JI
         7Dlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CZkW/5anEw5GrivfXwnX+cAuoc6zYllNAJ26zHVAzzA=;
        b=GEGweWEvUvpcTzYqNSGNH2O9RkcnAoMWcGP7V7FtikLFEDtFMaNi+UHa+DePngTDtF
         InBHmz/pou0BRqTxLuwO1lbkAxVgDkWT7TobKhou6XkI21SR4c4Dk3s07leCdhja9YcE
         2GYfCB66Ktt8OTDYeQn/qXGQci8lEbpF0CHOOwJPiQBaGmFqy8V5auBzKSZjri8rEhn/
         oteGF4O7jV73Qub6Yk93HlOysKbS924gqHIvkvTyuHYS1OlgA4PeXNnY6u6xIN4RilVI
         6M9jNOAduqD/nncTNVWLG9bYBS3Hl7uXxM21+fuj1D3X3AIgTAbTlhaEfW5NpP1OQldV
         8QqA==
X-Gm-Message-State: AOAM530qlXHDUUKG24Qb0dNkaPmhMolPwERITxaWGhcGAFCWW+tvzcMV
        Se1wUicS4Lmbqd0S/Dk8sU0XjQ==
X-Google-Smtp-Source: ABdhPJxOV0nyX/VBI6df0uxPSocrpS1o8pdYoUdtjq5jjc48S8Yv+Ohxi4CQzJJTzHLloUa74wuEaw==
X-Received: by 2002:a19:7507:: with SMTP id y7mr26804715lfe.224.1643906829297;
        Thu, 03 Feb 2022 08:47:09 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id t25sm5144559lfr.86.2022.02.03.08.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 08:47:09 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 6/9] i2c: qcom-cci: simplify probe by removing one loop over busses
Date:   Thu,  3 Feb 2022 18:47:07 +0200
Message-Id: <20220203164707.1712048-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It's possible to slightly simplify cci_probe() function by merging
a loop over I2C busses found on CCI controller with a loop which
actually registers I2C adapters, the data per I2C bus collected early
on probe is not used before calling i2c_add_adapter() since cci_reset()
and cci_init() calls were moved to the end of probe.

The change is intended to be non-functional.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 82 +++++++++++++++----------------
 1 file changed, 39 insertions(+), 43 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index eebf9603d3d1..cffc01b2285b 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -540,44 +540,6 @@ static int cci_probe(struct platform_device *pdev)
 	if (!cci->data)
 		return -ENOENT;
 
-	for_each_available_child_of_node(dev->of_node, child) {
-		u32 idx;
-
-		ret = of_property_read_u32(child, "reg", &idx);
-		if (ret) {
-			dev_err(dev, "%pOF invalid 'reg' property", child);
-			continue;
-		}
-
-		if (idx >= cci->data->num_masters) {
-			dev_err(dev, "%pOF invalid 'reg' value: %u (max is %u)",
-				child, idx, cci->data->num_masters - 1);
-			continue;
-		}
-
-		cci->master[idx].adap.quirks = &cci->data->quirks;
-		cci->master[idx].adap.algo = &cci_algo;
-		cci->master[idx].adap.dev.parent = dev;
-		cci->master[idx].adap.dev.of_node = of_node_get(child);
-		cci->master[idx].master = idx;
-		cci->master[idx].cci = cci;
-
-		i2c_set_adapdata(&cci->master[idx].adap, &cci->master[idx]);
-		snprintf(cci->master[idx].adap.name,
-			 sizeof(cci->master[idx].adap.name), "Qualcomm-CCI");
-
-		cci->master[idx].mode = I2C_MODE_STANDARD;
-		ret = of_property_read_u32(child, "clock-frequency", &val);
-		if (!ret) {
-			if (val == I2C_MAX_FAST_MODE_FREQ)
-				cci->master[idx].mode = I2C_MODE_FAST;
-			else if (val == I2C_MAX_FAST_MODE_PLUS_FREQ)
-				cci->master[idx].mode = I2C_MODE_FAST_PLUS;
-		}
-
-		init_completion(&cci->master[idx].irq_complete);
-	}
-
 	/* Memory */
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -630,13 +592,47 @@ static int cci_probe(struct platform_device *pdev)
 	val = readl(cci->base + CCI_HW_VERSION);
 	dev_dbg(dev, "CCI HW version = 0x%08x", val);
 
-	for (i = 0; i < cci->data->num_masters; i++) {
-		if (!cci->master[i].cci)
+	for_each_available_child_of_node(dev->of_node, child) {
+		u32 idx;
+
+		ret = of_property_read_u32(child, "reg", &idx);
+		if (ret) {
+			dev_err(dev, "%pOF invalid 'reg' property", child);
 			continue;
+		}
+
+		if (idx >= cci->data->num_masters) {
+			dev_err(dev, "%pOF invalid 'reg' value: %u (max is %u)",
+				child, idx, cci->data->num_masters - 1);
+			continue;
+		}
+
+		cci->master[idx].adap.quirks = &cci->data->quirks;
+		cci->master[idx].adap.algo = &cci_algo;
+		cci->master[idx].adap.dev.parent = dev;
+		cci->master[idx].adap.dev.of_node = of_node_get(child);
+		cci->master[idx].master = idx;
+		cci->master[idx].cci = cci;
+
+		i2c_set_adapdata(&cci->master[idx].adap, &cci->master[idx]);
+		snprintf(cci->master[idx].adap.name,
+			 sizeof(cci->master[idx].adap.name), "Qualcomm-CCI");
 
-		ret = i2c_add_adapter(&cci->master[i].adap);
+		cci->master[idx].mode = I2C_MODE_STANDARD;
+		ret = of_property_read_u32(child, "clock-frequency", &val);
+		if (!ret) {
+			if (val == I2C_MAX_FAST_MODE_FREQ)
+				cci->master[idx].mode = I2C_MODE_FAST;
+			else if (val == I2C_MAX_FAST_MODE_PLUS_FREQ)
+				cci->master[idx].mode = I2C_MODE_FAST_PLUS;
+		}
+
+		init_completion(&cci->master[idx].irq_complete);
+
+		ret = i2c_add_adapter(&cci->master[idx].adap);
 		if (ret < 0) {
-			of_node_put(cci->master[i].adap.dev.of_node);
+			of_node_put(child);
+			cci->master[idx].cci = NULL;
 			goto error_i2c;
 		}
 	}
@@ -657,7 +653,7 @@ static int cci_probe(struct platform_device *pdev)
 	return 0;
 
 error_i2c:
-	for (--i ; i >= 0; i--) {
+	for (i = 0; i < cci->data->num_masters; i++) {
 		if (cci->master[i].cci) {
 			i2c_del_adapter(&cci->master[i].adap);
 			of_node_put(cci->master[i].adap.dev.of_node);
-- 
2.33.0

