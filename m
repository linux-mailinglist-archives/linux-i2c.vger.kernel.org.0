Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8488516137B
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2020 14:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbgBQNbO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Feb 2020 08:31:14 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:63024 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728828AbgBQNbO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Feb 2020 08:31:14 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581946273; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=eAVniZlN5XgduD/08xREXVlmt0saWmRHmsOAnRbaQ/M=; b=F9evbf1GTHBa1mf11hGQKirNT0RaOk7tmM0nEP49Inggcoxgs7oSqG2umh0pdp0F3crNz0Nt
 W9oETpAHEtRezGiTXcAKsRqH6heoc9/gYRq5vFAkGSJdA/rIGowFMegA7Q9gmeHXl4huPVku
 OnbujxvxHmY/0q2yyBCX7OGS02E=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4a9594.7f6e3393bb90-smtp-out-n01;
 Mon, 17 Feb 2020 13:31:00 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 97FB0C447A9; Mon, 17 Feb 2020 13:30:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 55501C4479F;
        Mon, 17 Feb 2020 13:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 55501C4479F
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
Subject: [PATCH 3/6] i2c: i2c-qcom-geni: Add interconnect support
Date:   Mon, 17 Feb 2020 19:00:02 +0530
Message-Id: <1581946205-27189-4-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
References: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Get the interconnect paths for I2C based Serial Engine device
and vote according to the bus speed of the driver.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 84 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 17abf60c..5de10a1 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -163,6 +163,44 @@ static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
 	writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
 }
 
+static int geni_i2c_icc_get(struct geni_se *se)
+{
+	if (!se)
+		return -EINVAL;
+
+	se->icc_path[GENI_TO_CORE] = of_icc_get(se->dev, "qup-core");
+	if (IS_ERR(se->icc_path[GENI_TO_CORE]))
+		return PTR_ERR(se->icc_path[GENI_TO_CORE]);
+
+	se->icc_path[CPU_TO_GENI] = of_icc_get(se->dev, "qup-config");
+	if (IS_ERR(se->icc_path[CPU_TO_GENI])) {
+		icc_put(se->icc_path[GENI_TO_CORE]);
+		se->icc_path[GENI_TO_CORE] = NULL;
+		return PTR_ERR(se->icc_path[CPU_TO_GENI]);
+	}
+
+	se->icc_path[GENI_TO_DDR] = of_icc_get(se->dev, "qup-memory");
+	if (IS_ERR(se->icc_path[GENI_TO_DDR])) {
+		icc_put(se->icc_path[GENI_TO_CORE]);
+		se->icc_path[GENI_TO_CORE] = NULL;
+		icc_put(se->icc_path[CPU_TO_GENI]);
+		se->icc_path[CPU_TO_GENI] = NULL;
+		return PTR_ERR(se->icc_path[GENI_TO_DDR]);
+	}
+
+	return 0;
+}
+
+void geni_i2c_icc_put(struct geni_se *se)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(se->icc_path); i++) {
+		icc_put(se->icc_path[i]);
+		se->icc_path[i] = NULL;
+	}
+}
+
 static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
 {
 	u32 m_cmd = readl_relaxed(gi2c->se.base + SE_GENI_M_CMD0);
@@ -563,17 +601,34 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	gi2c->adap.dev.of_node = pdev->dev.of_node;
 	strlcpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
 
+	ret = geni_i2c_icc_get(&gi2c->se);
+	if (ret)
+		return ret;
+	/* Set the bus quota to a reasonable value */
+	gi2c->se.avg_bw_core = Bps_to_icc(1000);
+	gi2c->se.peak_bw_core = Bps_to_icc(CORE_2X_100_MHZ);
+	gi2c->se.avg_bw_cpu = Bps_to_icc(1000);
+	gi2c->se.peak_bw_cpu = Bps_to_icc(1000);
+	gi2c->se.avg_bw_ddr = Bps_to_icc(gi2c->clk_freq_out);
+	gi2c->se.peak_bw_ddr = Bps_to_icc(2 * gi2c->clk_freq_out);
+
+	/* Vote for core clocks and CPU for register access */
+	icc_set_bw(gi2c->se.icc_path[GENI_TO_CORE], gi2c->se.avg_bw_core,
+				gi2c->se.peak_bw_core);
+	icc_set_bw(gi2c->se.icc_path[CPU_TO_GENI], gi2c->se.avg_bw_cpu,
+				gi2c->se.peak_bw_cpu);
 	ret = geni_se_resources_on(&gi2c->se);
 	if (ret) {
 		dev_err(&pdev->dev, "Error turning on resources %d\n", ret);
-		return ret;
+		goto geni_i2c_put_icc;
 	}
 	proto = geni_se_read_proto(&gi2c->se);
 	tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
 	if (proto != GENI_SE_I2C) {
 		dev_err(&pdev->dev, "Invalid proto %d\n", proto);
 		geni_se_resources_off(&gi2c->se);
-		return -ENXIO;
+		ret = -ENXIO;
+		goto geni_i2c_put_icc;
 	}
 	gi2c->tx_wm = tx_depth - 1;
 	geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
@@ -582,8 +637,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	ret = geni_se_resources_off(&gi2c->se);
 	if (ret) {
 		dev_err(&pdev->dev, "Error turning off resources %d\n", ret);
-		return ret;
+		goto geni_i2c_put_icc;
 	}
+	/* Remove vote from core clocks and CPU */
+	icc_set_bw(gi2c->se.icc_path[GENI_TO_CORE], 0, 0);
+	icc_set_bw(gi2c->se.icc_path[CPU_TO_GENI], 0, 0);
 
 	dev_dbg(&pdev->dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
 
@@ -597,12 +655,16 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "Error adding i2c adapter %d\n", ret);
 		pm_runtime_disable(gi2c->se.dev);
-		return ret;
+		goto geni_i2c_put_icc;
 	}
 
 	dev_dbg(&pdev->dev, "Geni-I2C adaptor successfully added\n");
 
 	return 0;
+
+geni_i2c_put_icc:
+	geni_i2c_icc_put(&gi2c->se);
+	return ret;
 }
 
 static int geni_i2c_remove(struct platform_device *pdev)
@@ -611,6 +673,7 @@ static int geni_i2c_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&gi2c->adap);
 	pm_runtime_disable(gi2c->se.dev);
+	geni_i2c_icc_put(&gi2c->se);
 	return 0;
 }
 
@@ -629,6 +692,11 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 		gi2c->suspended = 1;
 	}
 
+	/* Remove BW votes */
+	icc_set_bw(gi2c->se.icc_path[GENI_TO_CORE], 0, 0);
+	icc_set_bw(gi2c->se.icc_path[CPU_TO_GENI], 0, 0);
+	icc_set_bw(gi2c->se.icc_path[GENI_TO_DDR], 0, 0);
+
 	return 0;
 }
 
@@ -637,6 +705,14 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 	int ret;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
+	/* Vote on Core, DDR and CPU path respectively */
+	icc_set_bw(gi2c->se.icc_path[GENI_TO_CORE], gi2c->se.avg_bw_core,
+		gi2c->se.peak_bw_core);
+	icc_set_bw(gi2c->se.icc_path[CPU_TO_GENI], gi2c->se.avg_bw_cpu,
+		gi2c->se.peak_bw_cpu);
+	icc_set_bw(gi2c->se.icc_path[GENI_TO_DDR], gi2c->se.avg_bw_ddr,
+		gi2c->se.peak_bw_ddr);
+
 	ret = geni_se_resources_on(&gi2c->se);
 	if (ret)
 		return ret;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
