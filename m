Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC61D18479C
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Mar 2020 14:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgCMNN1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 09:13:27 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:54186 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726526AbgCMNN1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Mar 2020 09:13:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584105206; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=TMCjXiCd22oaTIvt1nqWA3krN7Avu7WdjmJ3LXbEBQU=; b=u7uyw+WFbXRmQ7h4i0pAoUApYbJFb2UP6S+ZbjAQVvNs6EVjG7HK+jovP5YMAOXLaRfUPd2O
 nspqaJStIkph13vUtiAZloBchsmSpZ7rkKKIMjwvGkkFBftVQ2HJeoybIvq/R+czwtrCoph3
 ZHxzOaCj9hnbXVRJ+EuODiu5NfI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6b86f1.7f1981611c00-smtp-out-n01;
 Fri, 13 Mar 2020 13:13:21 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BF9F0C44793; Fri, 13 Mar 2020 13:13:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D8E6BC44793;
        Fri, 13 Mar 2020 13:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D8E6BC44793
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
        dianders@chromium.org, evgreen@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V2 5/8] i2c: i2c-qcom-geni: Add interconnect support
Date:   Fri, 13 Mar 2020 18:42:11 +0530
Message-Id: <1584105134-13583-6-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Get the interconnect paths for I2C based Serial Engine device
and vote according to the bus speed of the driver.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
Changes in V2:
 - As per Bjorn's comment, removed se == NULL check from geni_i2c_icc_get
 - As per Bjorn's comment, removed code to set se->icc_path* to NULL in failure
 - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
   path handle
 - As per Matthias comment, added error handling for icc_set_bw call

 drivers/i2c/busses/i2c-qcom-geni.c | 110 +++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 17abf60c..33ab685 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -163,6 +163,23 @@ static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
 	writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
 }
 
+static int geni_i2c_icc_get(struct geni_se *se)
+{
+	se->icc_path_geni_to_core = devm_of_icc_get(se->dev, "qup-core");
+	if (IS_ERR(se->icc_path_geni_to_core))
+		return PTR_ERR(se->icc_path_geni_to_core);
+
+	se->icc_path_cpu_to_geni = devm_of_icc_get(se->dev, "qup-config");
+	if (IS_ERR(se->icc_path_cpu_to_geni))
+		return PTR_ERR(se->icc_path_cpu_to_geni);
+
+	se->icc_path_geni_to_ddr = devm_of_icc_get(se->dev, "qup-memory");
+	if (IS_ERR(se->icc_path_geni_to_ddr))
+		return PTR_ERR(se->icc_path_geni_to_ddr);
+
+	return 0;
+}
+
 static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
 {
 	u32 m_cmd = readl_relaxed(gi2c->se.base + SE_GENI_M_CMD0);
@@ -563,6 +580,39 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	gi2c->adap.dev.of_node = pdev->dev.of_node;
 	strlcpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
 
+	ret = geni_i2c_icc_get(&gi2c->se);
+	if (ret)
+		return ret;
+	/*
+	 * Set the bus quota for core and cpu to a reasonable value for
+	 * register access.
+	 * Set quota for DDR based on bus speed, assume peak requirement
+	 * as twice of avg bw.
+	 */
+	gi2c->se.avg_bw_core = Bps_to_icc(1000);
+	gi2c->se.peak_bw_core = Bps_to_icc(CORE_2X_100_MHZ);
+	gi2c->se.avg_bw_cpu = Bps_to_icc(1000);
+	gi2c->se.peak_bw_cpu = Bps_to_icc(1000);
+	gi2c->se.avg_bw_ddr = Bps_to_icc(gi2c->clk_freq_out);
+	gi2c->se.peak_bw_ddr = Bps_to_icc(2 * gi2c->clk_freq_out);
+
+	/* Vote for core clocks and CPU for register access */
+	ret = icc_set_bw(gi2c->se.icc_path_geni_to_core, gi2c->se.avg_bw_core,
+				gi2c->se.peak_bw_core);
+	if (ret) {
+		dev_err(&pdev->dev, "%s: ICC BW voting failed for core\n",
+			__func__);
+		return ret;
+	}
+
+	ret = icc_set_bw(gi2c->se.icc_path_cpu_to_geni, gi2c->se.avg_bw_cpu,
+				gi2c->se.peak_bw_cpu);
+	if (ret) {
+		dev_err(&pdev->dev, "%s: ICC BW voting failed for cpu\n",
+			__func__);
+		return ret;
+	}
+
 	ret = geni_se_resources_on(&gi2c->se);
 	if (ret) {
 		dev_err(&pdev->dev, "Error turning on resources %d\n", ret);
@@ -584,6 +634,19 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Error turning off resources %d\n", ret);
 		return ret;
 	}
+	/* Remove vote from core clocks and CPU */
+	ret = icc_set_bw(gi2c->se.icc_path_geni_to_core, 0, 0);
+	if (ret) {
+		dev_err(&pdev->dev, "%s: ICC BW remove failed for core\n",
+			__func__);
+		return ret;
+	}
+
+	ret = icc_set_bw(gi2c->se.icc_path_cpu_to_geni, 0, 0);
+	if (ret) {
+		dev_err(&pdev->dev, "%s: ICC BW remove failed for cpu\n",
+			__func__);
+	}
 
 	dev_dbg(&pdev->dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
 
@@ -629,6 +692,28 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 		gi2c->suspended = 1;
 	}
 
+	/* Remove BW votes */
+	ret = icc_set_bw(gi2c->se.icc_path_geni_to_core, 0, 0);
+	if (ret) {
+		dev_err_ratelimited(gi2c->se.dev, "%s: ICC BW remove failed for core\n",
+			__func__);
+		return ret;
+	}
+
+	ret = icc_set_bw(gi2c->se.icc_path_cpu_to_geni, 0, 0);
+	if (ret) {
+		dev_err_ratelimited(gi2c->se.dev, "%s: ICC BW remove failed for cpu\n",
+			__func__);
+		return ret;
+	}
+
+	ret = icc_set_bw(gi2c->se.icc_path_geni_to_ddr, 0, 0);
+	if (ret) {
+		dev_err_ratelimited(gi2c->se.dev, "%s: ICC BW remove failed for ddr\n",
+			__func__);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -637,6 +722,31 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 	int ret;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
+	/* Vote on Core, CPU and DDR path respectively */
+	ret = icc_set_bw(gi2c->se.icc_path_geni_to_core, gi2c->se.avg_bw_core,
+		gi2c->se.peak_bw_core);
+	if (ret) {
+		dev_err_ratelimited(gi2c->se.dev, "%s: ICC BW voting failed for core\n",
+			__func__);
+		return ret;
+	}
+
+	ret = icc_set_bw(gi2c->se.icc_path_cpu_to_geni, gi2c->se.avg_bw_cpu,
+		gi2c->se.peak_bw_cpu);
+	if (ret) {
+		dev_err_ratelimited(gi2c->se.dev, "%s: ICC BW voting failed for cpu\n",
+			__func__);
+		return ret;
+	}
+
+	ret = icc_set_bw(gi2c->se.icc_path_geni_to_ddr, gi2c->se.avg_bw_ddr,
+		gi2c->se.peak_bw_ddr);
+	if (ret) {
+		dev_err_ratelimited(gi2c->se.dev, "%s: ICC BW voting failed for ddr\n",
+			__func__);
+		return ret;
+	}
+
 	ret = geni_se_resources_on(&gi2c->se);
 	if (ret)
 		return ret;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
