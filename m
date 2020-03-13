Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 860BD1847A7
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Mar 2020 14:13:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbgCMNNh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 09:13:37 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:23902 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726716AbgCMNNh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Mar 2020 09:13:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584105217; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=PDamk0KvzLWAiSLzE0n+S9+f9b02q7m12Buk6cFGbog=; b=HwqyqlvZe8cgT0Ylm3uXes9Do3gzYJuZQfbeuoXrsSTcsWE+wkuo7+aT3MvZ7OIa2UW393z6
 LHe7yvjc529dwHdnvzAhRv0Sedmfbrq4UAWhMv9r89ZWEyABmAe5ZOA0HqVicIxkIvPyISVn
 D0gxMqyjJmVUMQ3YXtzcyQ+eiKM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6b86f8.7fb93bad4110-smtp-out-n02;
 Fri, 13 Mar 2020 13:13:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 26367C43636; Fri, 13 Mar 2020 13:13:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 57807C433D2;
        Fri, 13 Mar 2020 13:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 57807C433D2
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
Subject: [PATCH V2 6/8] spi: spi-geni-qcom: Add interconnect support
Date:   Fri, 13 Mar 2020 18:42:12 +0530
Message-Id: <1584105134-13583-7-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Get the interconnect paths for SPI based Serial Engine device
and vote according to the current bus speed of the driver.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
 - As per Bjorn's comment, removed se == NULL check from geni_spi_icc_get
 - As per Bjorn's comment, removed code to set se->icc_path* to NULL in failure
 - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
   path handle
 - As per Matthias comment, added error handling for icc_set_bw call

 drivers/spi/spi-geni-qcom.c | 74 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index c397242..09c4709 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -118,6 +118,19 @@ static int get_spi_clk_cfg(unsigned int speed_hz,
 	return ret;
 }
 
+static int geni_spi_icc_get(struct geni_se *se)
+{
+	se->icc_path_geni_to_core = devm_of_icc_get(se->dev, "qup-core");
+	if (IS_ERR(se->icc_path_geni_to_core))
+		return PTR_ERR(se->icc_path_geni_to_core);
+
+	se->icc_path_cpu_to_geni = devm_of_icc_get(se->dev, "qup-config");
+	if (IS_ERR(se->icc_path_cpu_to_geni))
+		return PTR_ERR(se->icc_path_cpu_to_geni);
+
+	return 0;
+}
+
 static void handle_fifo_timeout(struct spi_master *spi,
 				struct spi_message *msg)
 {
@@ -234,6 +247,20 @@ static int setup_fifo_params(struct spi_device *spi_slv,
 		return ret;
 	}
 
+	/*
+	 * Set BW quota for CPU as driver supports FIFO mode only.
+	 * Assume peak bw as twice of avg bw.
+	 */
+	se->avg_bw_cpu = Bps_to_icc(mas->cur_speed_hz);
+	se->peak_bw_cpu = Bps_to_icc(2 * mas->cur_speed_hz);
+	ret = icc_set_bw(se->icc_path_cpu_to_geni, se->avg_bw_cpu,
+			se->peak_bw_cpu);
+	if (ret) {
+		dev_err(mas->dev, "%s: ICC BW voting failed for cpu\n",
+			__func__);
+		return ret;
+	}
+
 	clk_sel = idx & CLK_SEL_MSK;
 	m_clk_cfg = (div << CLK_DIV_SHFT) | SER_CLK_EN;
 	spi_setup_word_len(mas, spi_slv->mode, spi_slv->bits_per_word);
@@ -578,6 +605,15 @@ static int spi_geni_probe(struct platform_device *pdev)
 	spin_lock_init(&mas->lock);
 	pm_runtime_enable(dev);
 
+	ret = geni_spi_icc_get(&mas->se);
+	if (ret)
+		goto spi_geni_probe_runtime_disable;
+	/* Set the bus quota to a reasonable value for register access */
+	mas->se.avg_bw_core = Bps_to_icc(CORE_2X_50_MHZ);
+	mas->se.peak_bw_core = Bps_to_icc(CORE_2X_100_MHZ);
+	mas->se.avg_bw_cpu = Bps_to_icc(1000);
+	mas->se.peak_bw_cpu = Bps_to_icc(1000);
+
 	ret = spi_geni_init(mas);
 	if (ret)
 		goto spi_geni_probe_runtime_disable;
@@ -616,14 +652,50 @@ static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
 {
 	struct spi_master *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_master_get_devdata(spi);
+	int ret;
+
+	ret = geni_se_resources_off(&mas->se);
+	if (ret)
+		return ret;
 
-	return geni_se_resources_off(&mas->se);
+	ret = icc_set_bw(mas->se.icc_path_geni_to_core, 0, 0);
+	if (ret) {
+		dev_err_ratelimited(mas->dev, "%s: ICC BW remove failed for core\n",
+			__func__);
+		return ret;
+	}
+
+	ret = icc_set_bw(mas->se.icc_path_cpu_to_geni, 0, 0);
+	if (ret) {
+		dev_err_ratelimited(mas->dev, "%s: ICC BW remove failed for cpu\n",
+			__func__);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
 {
 	struct spi_master *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_master_get_devdata(spi);
+	int ret;
+
+	ret = icc_set_bw(mas->se.icc_path_geni_to_core, mas->se.avg_bw_core,
+		mas->se.peak_bw_core);
+	if (ret) {
+		dev_err_ratelimited(mas->dev, "%s: ICC BW voting failed for core\n",
+			__func__);
+		return ret;
+	}
+
+	ret = icc_set_bw(mas->se.icc_path_cpu_to_geni, mas->se.avg_bw_cpu,
+		mas->se.peak_bw_cpu);
+	if (ret) {
+		dev_err_ratelimited(mas->dev, "%s: ICC BW voting failed for cpu\n",
+			__func__);
+		return ret;
+	}
 
 	return geni_se_resources_on(&mas->se);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
