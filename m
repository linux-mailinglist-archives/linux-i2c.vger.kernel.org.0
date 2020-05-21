Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 976581DC8A8
	for <lists+linux-i2c@lfdr.de>; Thu, 21 May 2020 10:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728673AbgEUIaz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 May 2020 04:30:55 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:63556 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728675AbgEUIay (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 May 2020 04:30:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590049853; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=PvtVrZLt2424vHtFLBGzSUcW8lZcFT8cquS8g8v41Mw=; b=Lpruk3je35kWSAb4haTesCzt4vykJkmNRvNdGrdvFog1/p7dTehavRXTFNstJ8LeEU49wUGQ
 2dwwu3KS+3WQsyeWMmma6M58eJGYXhGT6XkNobFvJ3GU3Ony6ceU7RQIWWs4ZZRFNE6GsR7L
 ZvCt6Qz6bv24FWjtJ8g9s9Ijd4Q=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec63c25.7f111f9682d0-smtp-out-n02;
 Thu, 21 May 2020 08:30:29 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B8804C43395; Thu, 21 May 2020 08:30:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DF1FCC433C6;
        Thu, 21 May 2020 08:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DF1FCC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, msavaliy@codeaurora.org,
        evgreen@chromium.org, Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V6 6/7] spi: spi-qcom-qspi: Add interconnect support
Date:   Thu, 21 May 2020 13:59:23 +0530
Message-Id: <1590049764-20912-7-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590049764-20912-1-git-send-email-akashast@codeaurora.org>
References: <1590049764-20912-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Get the interconnect paths for QSPI device and vote according to the
current bus speed of the driver.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
Acked-by: Mark Brown <broonie@kernel.org>
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

 drivers/spi/spi-qcom-qspi.c | 59 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index 3c4f83b..d76001a 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
 
 #include <linux/clk.h>
+#include <linux/interconnect.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -139,7 +140,10 @@ struct qcom_qspi {
 	struct device *dev;
 	struct clk_bulk_data *clks;
 	struct qspi_xfer xfer;
-	/* Lock to protect xfer and IRQ accessed registers */
+	struct icc_path *icc_path_cpu_to_qspi;
+	unsigned int avg_bw_cpu;
+	unsigned int peak_bw_cpu;
+	/* Lock to protect data accessed by IRQs */
 	spinlock_t lock;
 };
 
@@ -241,6 +245,20 @@ static int qcom_qspi_transfer_one(struct spi_master *master,
 		return ret;
 	}
 
+	/*
+	 * Set BW quota for CPU as driver supports FIFO mode only.
+	 * We don't have explicit peak requirement so keep it equal to avg_bw.
+	 */
+	ctrl->avg_bw_cpu = Bps_to_icc(speed_hz);
+	ctrl->peak_bw_cpu = ctrl->avg_bw_cpu;
+	ret = icc_set_bw(ctrl->icc_path_cpu_to_qspi, ctrl->avg_bw_cpu,
+		ctrl->peak_bw_cpu);
+	if (ret) {
+		dev_err(ctrl->dev, "%s: ICC BW voting failed for cpu :%d\n",
+			__func__, ret);
+		return ret;
+	}
+
 	spin_lock_irqsave(&ctrl->lock, flags);
 
 	/* We are half duplex, so either rx or tx will be set */
@@ -458,6 +476,29 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 	if (ret)
 		goto exit_probe_master_put;
 
+	ctrl->icc_path_cpu_to_qspi = devm_of_icc_get(dev, "qspi-config");
+	if (IS_ERR(ctrl->icc_path_cpu_to_qspi)) {
+		ret = PTR_ERR(ctrl->icc_path_cpu_to_qspi);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get cpu path :%d\n", ret);
+		goto exit_probe_master_put;
+	}
+	/* Set BW vote for register access */
+	ret = icc_set_bw(ctrl->icc_path_cpu_to_qspi, Bps_to_icc(1000),
+				Bps_to_icc(1000));
+	if (ret) {
+		dev_err(ctrl->dev, "%s: ICC BW voting failed for cpu :%d\n",
+				__func__, ret);
+		goto exit_probe_master_put;
+	}
+
+	ret = icc_disable(ctrl->icc_path_cpu_to_qspi);
+	if (ret) {
+		dev_err(ctrl->dev, "%s: ICC disable failed for cpu :%d\n",
+				__func__, ret);
+		goto exit_probe_master_put;
+	}
+
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
 		goto exit_probe_master_put;
@@ -511,9 +552,17 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
 {
 	struct spi_master *master = dev_get_drvdata(dev);
 	struct qcom_qspi *ctrl = spi_master_get_devdata(master);
+	int ret;
 
 	clk_bulk_disable_unprepare(QSPI_NUM_CLKS, ctrl->clks);
 
+	ret = icc_disable(ctrl->icc_path_cpu_to_qspi);
+	if (ret) {
+		dev_err_ratelimited(ctrl->dev, "%s: ICC disable failed for cpu :%d\n",
+			__func__, ret);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -521,6 +570,14 @@ static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
 {
 	struct spi_master *master = dev_get_drvdata(dev);
 	struct qcom_qspi *ctrl = spi_master_get_devdata(master);
+	int ret;
+
+	ret = icc_enable(ctrl->icc_path_cpu_to_qspi);
+	if (ret) {
+		dev_err_ratelimited(ctrl->dev, "%s: ICC enable failed for cpu :%d\n",
+			__func__, ret);
+		return ret;
+	}
 
 	return clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
