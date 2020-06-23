Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7452A204F53
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 12:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732405AbgFWKkL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jun 2020 06:40:11 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:26023 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732362AbgFWKkE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Jun 2020 06:40:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592908803; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=093s4Q6UjWhPg1FWwScxBkXycVQAoBfvgHbEZmyGg3U=; b=wRVf0LIqS/aZ8OwluLmpqvJDHCu8Z8OBtseHxriNCSzCfDvGF3ndYLlxrdzqZSk1nh50mSUv
 qhHs7Ij8S140YgHPiBm2tGpqMJt/yeVJ+npwOsif5V1JMXXkOeWymh9H21pCxMR1pKcJSFw1
 2eHemOuUUc4r4wutGiB/XLMgXtA=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5ef1dbfb0206ad41d1270135 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Jun 2020 10:39:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DFCDBC433AD; Tue, 23 Jun 2020 10:39:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B2F99C433C8;
        Tue, 23 Jun 2020 10:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B2F99C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V8 7/8] spi: spi-qcom-qspi: Add interconnect support
Date:   Tue, 23 Jun 2020 16:08:56 +0530
Message-Id: <1592908737-7068-8-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592908737-7068-1-git-send-email-akashast@codeaurora.org>
References: <1592908737-7068-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Get the interconnect paths for QSPI device and vote according to the
current bus speed of the driver.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in V2:
 - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
   path handle
 - As per Matthias comment, added error handling for icc_set_bw call

Changes in V3:
 - No Change.

Changes in V4:
 - As per Mark's comment move peak_bw guess as twice of avg_bw if
   nothing mentioned explicitly to ICC core.

Changes in V5:
 - Add icc_enable/disable to power on/off call.
 - Save some non-zero avg/peak value to ICC core by calling geni_icc_set_bw
   from probe so that when resume/icc_enable is called NOC are running at
   some non-zero value.

Changes in V6:
 - As per Matthias's comment made print statement consistent across driver

Changes in V7:
 - As per Matthias's comment removed usage of peak_bw variable because we don't
   have explicit peak requirement, we were voting peak = avg and this can be
   tracked using single variable for avg bw.
 - As per Matthias's comment improved print log.

Changes in Resend V7:
 - As per Matthias comment removed "unsigned int avg_bw_cpu" from
   struct qcom_qspi as we are using that variable only once.

Changes in V8:
 - No change

 drivers/spi/spi-qcom-qspi.c | 56 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index 3c4f83b..b5b4cf6 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
 
 #include <linux/clk.h>
+#include <linux/interconnect.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -139,7 +140,8 @@ struct qcom_qspi {
 	struct device *dev;
 	struct clk_bulk_data *clks;
 	struct qspi_xfer xfer;
-	/* Lock to protect xfer and IRQ accessed registers */
+	struct icc_path *icc_path_cpu_to_qspi;
+	/* Lock to protect data accessed by IRQs */
 	spinlock_t lock;
 };
 
@@ -229,6 +231,7 @@ static int qcom_qspi_transfer_one(struct spi_master *master,
 	int ret;
 	unsigned long speed_hz;
 	unsigned long flags;
+	unsigned int avg_bw_cpu;
 
 	speed_hz = slv->max_speed_hz;
 	if (xfer->speed_hz)
@@ -241,6 +244,18 @@ static int qcom_qspi_transfer_one(struct spi_master *master,
 		return ret;
 	}
 
+	/*
+	 * Set BW quota for CPU as driver supports FIFO mode only.
+	 * We don't have explicit peak requirement so keep it equal to avg_bw.
+	 */
+	avg_bw_cpu = Bps_to_icc(speed_hz);
+	ret = icc_set_bw(ctrl->icc_path_cpu_to_qspi, avg_bw_cpu, avg_bw_cpu);
+	if (ret) {
+		dev_err(ctrl->dev, "%s: ICC BW voting failed for cpu: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
 	spin_lock_irqsave(&ctrl->lock, flags);
 
 	/* We are half duplex, so either rx or tx will be set */
@@ -458,6 +473,29 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 	if (ret)
 		goto exit_probe_master_put;
 
+	ctrl->icc_path_cpu_to_qspi = devm_of_icc_get(dev, "qspi-config");
+	if (IS_ERR(ctrl->icc_path_cpu_to_qspi)) {
+		ret = PTR_ERR(ctrl->icc_path_cpu_to_qspi);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get cpu path: %d\n", ret);
+		goto exit_probe_master_put;
+	}
+	/* Set BW vote for register access */
+	ret = icc_set_bw(ctrl->icc_path_cpu_to_qspi, Bps_to_icc(1000),
+				Bps_to_icc(1000));
+	if (ret) {
+		dev_err(ctrl->dev, "%s: ICC BW voting failed for cpu: %d\n",
+				__func__, ret);
+		goto exit_probe_master_put;
+	}
+
+	ret = icc_disable(ctrl->icc_path_cpu_to_qspi);
+	if (ret) {
+		dev_err(ctrl->dev, "%s: ICC disable failed for cpu: %d\n",
+				__func__, ret);
+		goto exit_probe_master_put;
+	}
+
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
 		goto exit_probe_master_put;
@@ -511,9 +549,17 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
 {
 	struct spi_master *master = dev_get_drvdata(dev);
 	struct qcom_qspi *ctrl = spi_master_get_devdata(master);
+	int ret;
 
 	clk_bulk_disable_unprepare(QSPI_NUM_CLKS, ctrl->clks);
 
+	ret = icc_disable(ctrl->icc_path_cpu_to_qspi);
+	if (ret) {
+		dev_err_ratelimited(ctrl->dev, "%s: ICC disable failed for cpu: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -521,6 +567,14 @@ static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
 {
 	struct spi_master *master = dev_get_drvdata(dev);
 	struct qcom_qspi *ctrl = spi_master_get_devdata(master);
+	int ret;
+
+	ret = icc_enable(ctrl->icc_path_cpu_to_qspi);
+	if (ret) {
+		dev_err_ratelimited(ctrl->dev, "%s: ICC enable failed for cpu: %d\n",
+			__func__, ret);
+		return ret;
+	}
 
 	return clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

