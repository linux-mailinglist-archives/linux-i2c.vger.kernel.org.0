Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB2C161386
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2020 14:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728873AbgBQNb0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Feb 2020 08:31:26 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:63024 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728999AbgBQNb0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Feb 2020 08:31:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581946285; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=FM1wfGw0ofSjtxHnraoQ21SP5WNmgAeJRJEUp6jm44I=; b=EiCYg8/iiLseII5zbF0afyTV2JRXSl+RsW32xBGOL9iQ5t66pVW1ojgWXgo4nq9zVSlF3xMs
 zltzNGM/FxBgyIYz20nI9mnTxcFaDq/kf6y8AK+8+dJ2MbuISn0NmV++sUFz1wITk1xa17E6
 wTj3fjadZ8XZBk5EDm4KLDW2LOU=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4a95a4.7f0e06af9148-smtp-out-n03;
 Mon, 17 Feb 2020 13:31:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A237BC447AD; Mon, 17 Feb 2020 13:31:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F1BF2C4479F;
        Mon, 17 Feb 2020 13:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F1BF2C4479F
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
        dianders@chromium.org, Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH 5/6] spi: spi-qcom-qspi: Add interconnect support
Date:   Mon, 17 Feb 2020 19:00:04 +0530
Message-Id: <1581946205-27189-6-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
References: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Get the interconnect paths for QSPI device and vote according to the
current bus speed of the driver.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
 drivers/spi/spi-qcom-qspi.c | 38 +++++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index 3c4f83b..3636438 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
 
 #include <linux/clk.h>
+#include <linux/interconnect.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -134,12 +135,19 @@ enum qspi_clocks {
 	QSPI_NUM_CLKS
 };
 
+enum qspi_icc_path {
+	CPU_TO_QSPI
+};
+
 struct qcom_qspi {
 	void __iomem *base;
 	struct device *dev;
 	struct clk_bulk_data *clks;
 	struct qspi_xfer xfer;
-	/* Lock to protect xfer and IRQ accessed registers */
+	struct icc_path *icc_path[2];
+	unsigned int avg_bw_cpu;
+	unsigned int peak_bw_cpu;
+	/* Lock to protect data accessed by IRQs */
 	spinlock_t lock;
 };
 
@@ -241,6 +249,11 @@ static int qcom_qspi_transfer_one(struct spi_master *master,
 		return ret;
 	}
 
+	/* Set BW quota for CPU as driver supports FIFO mode only */
+	ctrl->avg_bw_cpu = Bps_to_icc(speed_hz);
+	ctrl->peak_bw_cpu = Bps_to_icc(2 * speed_hz);
+	icc_set_bw(ctrl->icc_path[CPU_TO_QSPI], ctrl->avg_bw_cpu, ctrl->peak_bw_cpu);
+
 	spin_lock_irqsave(&ctrl->lock, flags);
 
 	/* We are half duplex, so either rx or tx will be set */
@@ -458,14 +471,23 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 	if (ret)
 		goto exit_probe_master_put;
 
+	ctrl->icc_path[CPU_TO_QSPI] = of_icc_get(dev, "qspi-config");
+	if (IS_ERR(ctrl->icc_path[CPU_TO_QSPI])) {
+		ret = PTR_ERR(ctrl->icc_path[CPU_TO_QSPI]);
+		goto exit_probe_master_put;
+	}
+	/* Put BW vote on CPU path for register access */
+	ctrl->avg_bw_cpu = Bps_to_icc(1000);
+	ctrl->peak_bw_cpu = Bps_to_icc(1000);
+
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto exit_probe_master_put;
+		goto exit_probe_icc_put;
 	ret = devm_request_irq(dev, ret, qcom_qspi_irq,
 			IRQF_TRIGGER_HIGH, dev_name(dev), ctrl);
 	if (ret) {
 		dev_err(dev, "Failed to request irq %d\n", ret);
-		goto exit_probe_master_put;
+		goto exit_probe_icc_put;
 	}
 
 	master->max_speed_hz = 300000000;
@@ -489,6 +511,8 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 
 	pm_runtime_disable(dev);
 
+exit_probe_icc_put:
+	icc_put(ctrl->icc_path[CPU_TO_QSPI]);
 exit_probe_master_put:
 	spi_master_put(master);
 
@@ -498,6 +522,9 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 static int qcom_qspi_remove(struct platform_device *pdev)
 {
 	struct spi_master *master = platform_get_drvdata(pdev);
+	struct qcom_qspi *ctrl = spi_master_get_devdata(master);
+
+	icc_put(ctrl->icc_path[CPU_TO_QSPI]);
 
 	/* Unregister _before_ disabling pm_runtime() so we stop transfers */
 	spi_unregister_master(master);
@@ -514,6 +541,8 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
 
 	clk_bulk_disable_unprepare(QSPI_NUM_CLKS, ctrl->clks);
 
+	icc_set_bw(ctrl->icc_path[CPU_TO_QSPI], 0, 0);
+
 	return 0;
 }
 
@@ -522,6 +551,9 @@ static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
 	struct spi_master *master = dev_get_drvdata(dev);
 	struct qcom_qspi *ctrl = spi_master_get_devdata(master);
 
+	icc_set_bw(ctrl->icc_path[CPU_TO_QSPI], ctrl->avg_bw_cpu,
+		ctrl->peak_bw_cpu);
+
 	return clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
