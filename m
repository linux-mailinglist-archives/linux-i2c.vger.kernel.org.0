Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83F7E4A8907
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Feb 2022 17:47:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242660AbiBCQrP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Feb 2022 11:47:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352419AbiBCQrP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Feb 2022 11:47:15 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2CCC061714
        for <linux-i2c@vger.kernel.org>; Thu,  3 Feb 2022 08:47:14 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id f10so7184343lfu.8
        for <linux-i2c@vger.kernel.org>; Thu, 03 Feb 2022 08:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LWTTS6cNG1lHs9tV1LFBIhAQTBfTKeF7kFMQ+dBIqKs=;
        b=A0Ter7ED0JuleUrlJVlwedem5p2FbiGXny2G6lOEAnGixlqgLnJgBQZls9DHKIXnJQ
         w60a+wcbBiFMba4A1LU5a7+BcldzS96eLqscb5Nph/DznvDw4c6gQ2jwa4GTsrf9d1E7
         phwH1C60ayYrRd2g4GAbVwqyAj903v4a0Dm41a0ZBnTXMYDmB2GrMAZUeYGlfXRhM8rX
         nFw/BMe+cKVSQXPFK4XteWk7cP0oPriTDuMuZ0YZ809JFonTcbwtWqWVri14ubKzmBmK
         jxNUVmeMtE4LmzJoRDY8jIm+B5iT705WHlRm/Lkg8Y0eQnNn81TEe9sCMXtHDgEX2GYr
         7ANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LWTTS6cNG1lHs9tV1LFBIhAQTBfTKeF7kFMQ+dBIqKs=;
        b=If1vnXCs4yQEMFtTIhCiIcvZthdIMjhsKXvq9zLa03LfoMdJn3Mnn7pgIbqKNwcOOC
         HA4silBrS2OHjccGbSN1BoA+XDtbc3cYzlw1WoNr59invB8krkRI5TkK54jHY0Twvf9v
         5zleuNkF7U8fuUZyKO4ZrfBVxS1Fl3XRlyKV1FVGVxzC+A5LmZ+QHtjH0rh3eKwhGYLR
         +2NUqDnO6CgRAYv2T0QREIzkCvYM+5k/asvhMpbQ77Kyhf1VUXtunVc9ED5lBuM1amne
         97PHFi7y7oaPls5px/x0g7TcuOJhtL9pAWMR/5xrvrkHHWJsP8cOEGeccpaJi+3VVDU7
         2qjw==
X-Gm-Message-State: AOAM531TspqVWeTzkT+vTAKeotZvk8uYiPdVH2woz8QBBZ/BfcsQpLI1
        T7JrTx6flks+lfHqTspz9ifZBg==
X-Google-Smtp-Source: ABdhPJzVBgyfbNzgFxGqTcERYCOl7xleJup4s8UDCnfMoKdrzXgVYTqwGh6bM4XBPIaD2aJ4tfHHjQ==
X-Received: by 2002:a05:6512:39c2:: with SMTP id k2mr27282461lfu.53.1643906833201;
        Thu, 03 Feb 2022 08:47:13 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id p28sm4702488lfo.79.2022.02.03.08.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 08:47:12 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 8/9] i2c: qcom-cci: add support of optional vbus-supply regulators
Date:   Thu,  3 Feb 2022 18:47:11 +0200
Message-Id: <20220203164711.1712090-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The change adds handling of optional vbus regulators in the driver.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 49 +++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 775945f7b4cd..2fc7f1f2616f 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -11,6 +11,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 
 #define CCI_HW_VERSION				0x0
 #define CCI_RESET_CMD				0x004
@@ -480,6 +481,20 @@ static void cci_disable_clocks(struct cci *cci)
 static int __maybe_unused cci_suspend_runtime(struct device *dev)
 {
 	struct cci *cci = dev_get_drvdata(dev);
+	struct regulator *bus_regulator;
+	unsigned int i;
+
+	for (i = 0; i < cci->data->num_masters; i++) {
+		if (!cci->master[i].cci)
+			continue;
+
+		bus_regulator = cci->master[i].adap.bus_regulator;
+		if (!bus_regulator)
+			continue;
+
+		if (regulator_is_enabled(bus_regulator) > 0)
+			regulator_disable(bus_regulator);
+	}
 
 	cci_disable_clocks(cci);
 	return 0;
@@ -488,12 +503,30 @@ static int __maybe_unused cci_suspend_runtime(struct device *dev)
 static int __maybe_unused cci_resume_runtime(struct device *dev)
 {
 	struct cci *cci = dev_get_drvdata(dev);
+	struct regulator *bus_regulator;
+	unsigned int i;
 	int ret;
 
 	ret = cci_enable_clocks(cci);
 	if (ret)
 		return ret;
 
+	for (i = 0; i < cci->data->num_masters; i++) {
+		if (!cci->master[i].cci)
+			continue;
+
+		bus_regulator = cci->master[i].adap.bus_regulator;
+		if (!bus_regulator)
+			continue;
+
+		if (!regulator_is_enabled(bus_regulator)) {
+			ret = regulator_enable(bus_regulator);
+			if (ret)
+				dev_err(dev, "failed to enable regulator: %d\n",
+					ret);
+		}
+	}
+
 	cci_init(cci);
 	return 0;
 }
@@ -593,6 +626,7 @@ static int cci_probe(struct platform_device *pdev)
 	dev_dbg(dev, "CCI HW version = 0x%08x", val);
 
 	for_each_available_child_of_node(dev->of_node, child) {
+		struct regulator *bus_regulator;
 		struct cci_master *master;
 		u32 idx;
 
@@ -637,6 +671,21 @@ static int cci_probe(struct platform_device *pdev)
 			master->cci = NULL;
 			goto error_i2c;
 		}
+
+		/*
+		 * It might be possible to find an optional vbus supply, but
+		 * it requires to pass the registration of an I2C adapter
+		 * device and its association with a bus device tree node.
+		 */
+		bus_regulator = devm_regulator_get_optional(&master->adap.dev,
+							    "vbus");
+		if (IS_ERR(bus_regulator)) {
+			ret = PTR_ERR(bus_regulator);
+			if (ret == -EPROBE_DEFER)
+				goto error_i2c;
+			bus_regulator = NULL;
+		}
+		master->adap.bus_regulator = bus_regulator;
 	}
 
 	ret = cci_reset(cci);
-- 
2.33.0

