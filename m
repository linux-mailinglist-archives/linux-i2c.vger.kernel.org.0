Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20E1D4A88FF
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Feb 2022 17:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbiBCQrJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Feb 2022 11:47:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352408AbiBCQrI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Feb 2022 11:47:08 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75DF6C061714
        for <linux-i2c@vger.kernel.org>; Thu,  3 Feb 2022 08:47:08 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id o12so7138505lfg.12
        for <linux-i2c@vger.kernel.org>; Thu, 03 Feb 2022 08:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=reEPrw9sqpKkfTltdTv+Hj/7serim+AXRNC/H74bgHM=;
        b=OWFstwB2gFB/0kMFf5Vs2iED+LaRqQrFkoghdt6xdDbpKgVusiczw/ynb+caQoqJPI
         5E7YLIQA7OoJbyT5zddPa+PXn7ljWqa4/mV5pCKuy9ApiqTWpEsHbUoiaXrHxAdvSKl0
         ghOL9zgfPf7py/2Q5qK8KaH0Nb/CcPMNcOcGzS7azsd2ilENpfP949pZzQ903+0i+Z9R
         q8CbV5zam8mbQfoKonjZixx4bQ6bkIw4WzDIagv8rgQoN5vy/GnxgmV2H47gbjY/nN34
         gf5EVEkAflePAIP6fZg0MoBvqg8I/taHw2OrojZsp9sYZm37uKETy1gjdtkS+FUcq5AZ
         NJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=reEPrw9sqpKkfTltdTv+Hj/7serim+AXRNC/H74bgHM=;
        b=1ZhatETEJ/oxXcrmvrer1nQGqF7NjQmM/EOJ20lzGn6oZZgAB/oAf6xqYvv+hFX84Q
         Al0dWswk+3p+wWlnlSIZigXTe7wu/RsyGnEnlkNwECpNyfa56rOTf9PvGxuNk0T1Tpr/
         9BECwIGgtU03OuamGEcsSOTjTmbEPidGtjgvG8uR9COrH3oYk7ATy2PGbwgcXzXtG42t
         WjW8VLyfATMklfu1dOfk81tdw/mSosfkOZ6Maj7/JP1XZR9p79/F7BlF9ao/YKCDt2nz
         pl77jsVA/VJ5IUyICXmD93xBpXb0quTNpSj8YaNwaQAV9aDc7iy1RvUqGht35mzXMSNn
         onOA==
X-Gm-Message-State: AOAM530RsMajYGyWQYeQjoKs/ut+KH5S56O1cIIlXjsRr6IkoGX+ADy9
        jytVX4ZWrslQpkjVXmRZktW70A==
X-Google-Smtp-Source: ABdhPJwPyySBBtqTR0AgfkJFyxuAXgiUcz+WqWhlpUsO74QjQfGbU19Edvm/MIOKZGf9Nc9ZKE5rnA==
X-Received: by 2002:a19:c201:: with SMTP id l1mr27512108lfc.485.1643906826872;
        Thu, 03 Feb 2022 08:47:06 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id p2sm4208017lfh.55.2022.02.03.08.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 08:47:06 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 5/9] i2c: qcom-cci: initialize CCI controller after registration of adapters
Date:   Thu,  3 Feb 2022 18:47:05 +0200
Message-Id: <20220203164705.1712027-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The change is wanted to postpone initialization of busses on CCI controller
by cci_init() and cci_reset() till adapters are registered, the later is
needed for adding I2C bus devices and get correspondent vbus regulators.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index cf54f1cb4c57..eebf9603d3d1 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -630,14 +630,6 @@ static int cci_probe(struct platform_device *pdev)
 	val = readl(cci->base + CCI_HW_VERSION);
 	dev_dbg(dev, "CCI HW version = 0x%08x", val);
 
-	ret = cci_reset(cci);
-	if (ret < 0)
-		goto error;
-
-	ret = cci_init(cci);
-	if (ret < 0)
-		goto error;
-
 	for (i = 0; i < cci->data->num_masters; i++) {
 		if (!cci->master[i].cci)
 			continue;
@@ -649,6 +641,14 @@ static int cci_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = cci_reset(cci);
+	if (ret < 0)
+		goto error_i2c;
+
+	ret = cci_init(cci);
+	if (ret < 0)
+		goto error_i2c;
+
 	pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_active(dev);
@@ -663,7 +663,6 @@ static int cci_probe(struct platform_device *pdev)
 			of_node_put(cci->master[i].adap.dev.of_node);
 		}
 	}
-error:
 	disable_irq(cci->irq);
 disable_clocks:
 	cci_disable_clocks(cci);
-- 
2.33.0

