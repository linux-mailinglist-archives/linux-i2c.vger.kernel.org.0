Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0161199517
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Mar 2020 13:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730722AbgCaLMu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Mar 2020 07:12:50 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:61923 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730716AbgCaLMu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Mar 2020 07:12:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585653169; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=OB7r0p9mbeW0EkgH3rS12A527iLmrRtmpQkWVTFYQ9U=; b=MPLAzHlkhHMZP1NFuI3QNq+h2Xk/CIj5wX4SuCiLBFleyfsocu1X+3WI6fKIf6i8Qo9FjxsJ
 0IC31Nun0XseBA2H2QQRfd7reBXreXDk8zbt7xIyw6gqKp56FHvjRD83dUIzoW0IY8ig7KAG
 62aqZUcvn3btjsV6LNJds59Ugs4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8325ad.7f7fb60870a0-smtp-out-n05;
 Tue, 31 Mar 2020 11:12:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C7130C43637; Tue, 31 Mar 2020 11:12:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4CA03C4478C;
        Tue, 31 Mar 2020 11:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4CA03C4478C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org, georgi.djakov@linaro.org
Cc:     linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V3 7/8] spi: spi-qcom-qspi: Add interconnect support
Date:   Tue, 31 Mar 2020 16:39:35 +0530
Message-Id: <1585652976-17481-8-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Get the interconnect paths for QSPI device and vote according to the
current bus speed of the driver.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
Changes in V2:
 - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
   path handle
 - As per Matthias comment, added error handling for icc_set_bw call

Changes in V3:
 - No Change.

 drivers/spi/spi-qcom-qspi.c | 46 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index 3c4f83b..ad48f43 100644
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
+	 * Assume peak bw as twice of avg bw.
+	 */
+	ctrl->avg_bw_cpu = Bps_to_icc(speed_hz);
+	ctrl->peak_bw_cpu = Bps_to_icc(2 * speed_hz);
+	ret = icc_set_bw(ctrl->icc_path_cpu_to_qspi, ctrl->avg_bw_cpu,
+		ctrl->peak_bw_cpu);
+	if (ret) {
+		dev_err(ctrl->dev, "%s: ICC BW voting failed for cpu\n",
+			__func__);
+		return ret;
+	}
+
 	spin_lock_irqsave(&ctrl->lock, flags);
 
 	/* We are half duplex, so either rx or tx will be set */
@@ -458,6 +476,15 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 	if (ret)
 		goto exit_probe_master_put;
 
+	ctrl->icc_path_cpu_to_qspi = devm_of_icc_get(dev, "qspi-config");
+	if (IS_ERR(ctrl->icc_path_cpu_to_qspi)) {
+		ret = PTR_ERR(ctrl->icc_path_cpu_to_qspi);
+		goto exit_probe_master_put;
+	}
+	/* Put BW vote on CPU path for register access */
+	ctrl->avg_bw_cpu = Bps_to_icc(1000);
+	ctrl->peak_bw_cpu = Bps_to_icc(1000);
+
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
 		goto exit_probe_master_put;
@@ -511,9 +538,17 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
 {
 	struct spi_master *master = dev_get_drvdata(dev);
 	struct qcom_qspi *ctrl = spi_master_get_devdata(master);
+	int ret;
 
 	clk_bulk_disable_unprepare(QSPI_NUM_CLKS, ctrl->clks);
 
+	ret = icc_set_bw(ctrl->icc_path_cpu_to_qspi, 0, 0);
+	if (ret) {
+		dev_err_ratelimited(ctrl->dev, "%s: ICC BW remove failed for cpu\n",
+			__func__);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -521,6 +556,15 @@ static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
 {
 	struct spi_master *master = dev_get_drvdata(dev);
 	struct qcom_qspi *ctrl = spi_master_get_devdata(master);
+	int ret;
+
+	ret = icc_set_bw(ctrl->icc_path_cpu_to_qspi, ctrl->avg_bw_cpu,
+		ctrl->peak_bw_cpu);
+	if (ret) {
+		dev_err_ratelimited(ctrl->dev, "%s: ICC BW voting failed for cpu\n",
+			__func__);
+		return ret;
+	}
 
 	return clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
