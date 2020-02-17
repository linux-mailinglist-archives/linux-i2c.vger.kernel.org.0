Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD717161373
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2020 14:31:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728794AbgBQNbJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Feb 2020 08:31:09 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:46144 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728827AbgBQNbJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Feb 2020 08:31:09 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581946269; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=1qAStlStzunLGge/G/O1GF0FDhcrfOVRQyx06oj13bU=; b=QAbAUauwnGn/CI71gJYJgnoj17yJcMORuU6E4dBaFYiAodApu0XcsAgr5YNIartYQL7uvHpi
 ky4NjzEuglDwo3DNUZUhSB1a2dpywpQkwEbGr9rgthoQ50jIaJiNZuVWPHhEtuQnoSdR+juK
 jHRyedsTwe5+BH+/VRJvkiushfQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4a959c.7fd1073c12d0-smtp-out-n03;
 Mon, 17 Feb 2020 13:31:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AAE7CC447A5; Mon, 17 Feb 2020 13:31:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8E448C4479C;
        Mon, 17 Feb 2020 13:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8E448C4479C
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
Subject: [PATCH 4/6] spi: spi-geni-qcom: Add interconnect support
Date:   Mon, 17 Feb 2020 19:00:03 +0530
Message-Id: <1581946205-27189-5-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
References: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Get the interconnect paths for SPI based Serial Engine device
and vote according to the current bus speed of the driver.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
 drivers/spi/spi-geni-qcom.c | 65 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index c397242..a066ef26 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -118,6 +118,35 @@ static int get_spi_clk_cfg(unsigned int speed_hz,
 	return ret;
 }
 
+static int geni_spi_icc_get(struct geni_se *se)
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
+	return 0;
+}
+
+void geni_spi_icc_put(struct geni_se *se)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(se->icc_path); i++) {
+		icc_put(se->icc_path[i]);
+		se->icc_path[i] = NULL;
+	}
+}
+
 static void handle_fifo_timeout(struct spi_master *spi,
 				struct spi_message *msg)
 {
@@ -234,6 +263,11 @@ static int setup_fifo_params(struct spi_device *spi_slv,
 		return ret;
 	}
 
+	/* Set BW quota for CPU as driver supports FIFO mode only */
+	se->avg_bw_cpu = Bps_to_icc(mas->cur_speed_hz);
+	se->peak_bw_cpu = Bps_to_icc(2 * mas->cur_speed_hz);
+	icc_set_bw(se->icc_path[CPU_TO_GENI], se->avg_bw_cpu, se->peak_bw_cpu);
+
 	clk_sel = idx & CLK_SEL_MSK;
 	m_clk_cfg = (div << CLK_DIV_SHFT) | SER_CLK_EN;
 	spi_setup_word_len(mas, spi_slv->mode, spi_slv->bits_per_word);
@@ -578,13 +612,22 @@ static int spi_geni_probe(struct platform_device *pdev)
 	spin_lock_init(&mas->lock);
 	pm_runtime_enable(dev);
 
-	ret = spi_geni_init(mas);
+	ret = geni_spi_icc_get(&mas->se);
 	if (ret)
 		goto spi_geni_probe_runtime_disable;
+	/* Set the bus quota to a reasonable value */
+	mas->se.avg_bw_core = Bps_to_icc(CORE_2X_50_MHZ);
+	mas->se.peak_bw_core = Bps_to_icc(CORE_2X_100_MHZ);
+	mas->se.avg_bw_cpu = Bps_to_icc(1000);
+	mas->se.peak_bw_cpu = Bps_to_icc(1000);
+
+	ret = spi_geni_init(mas);
+	if (ret)
+		goto spi_geni_icc_put;
 
 	ret = request_irq(mas->irq, geni_spi_isr, 0, dev_name(dev), spi);
 	if (ret)
-		goto spi_geni_probe_runtime_disable;
+		goto spi_geni_icc_put;
 
 	ret = spi_register_master(spi);
 	if (ret)
@@ -593,6 +636,8 @@ static int spi_geni_probe(struct platform_device *pdev)
 	return 0;
 spi_geni_probe_free_irq:
 	free_irq(mas->irq, spi);
+spi_geni_icc_put:
+	geni_spi_icc_put(&mas->se);
 spi_geni_probe_runtime_disable:
 	pm_runtime_disable(dev);
 	spi_master_put(spi);
@@ -608,16 +653,25 @@ static int spi_geni_remove(struct platform_device *pdev)
 	spi_unregister_master(spi);
 
 	free_irq(mas->irq, spi);
+	geni_spi_icc_put(&mas->se);
 	pm_runtime_disable(&pdev->dev);
 	return 0;
 }
 
 static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
 {
+	int ret;
 	struct spi_master *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_master_get_devdata(spi);
 
-	return geni_se_resources_off(&mas->se);
+	ret = geni_se_resources_off(&mas->se);
+	if (ret)
+		return ret;
+
+	icc_set_bw(mas->se.icc_path[GENI_TO_CORE], 0, 0);
+	icc_set_bw(mas->se.icc_path[CPU_TO_GENI], 0, 0);
+
+	return 0;
 }
 
 static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
@@ -625,6 +679,11 @@ static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
 	struct spi_master *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_master_get_devdata(spi);
 
+	icc_set_bw(mas->se.icc_path[GENI_TO_CORE], mas->se.avg_bw_core,
+		mas->se.peak_bw_core);
+	icc_set_bw(mas->se.icc_path[CPU_TO_GENI], mas->se.avg_bw_cpu,
+		mas->se.peak_bw_cpu);
+
 	return geni_se_resources_on(&mas->se);
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
