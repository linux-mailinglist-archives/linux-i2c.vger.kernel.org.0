Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E62B204F4B
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 12:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732380AbgFWKkD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jun 2020 06:40:03 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:18134 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732347AbgFWKj6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Jun 2020 06:39:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592908797; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=1N401eS8O7ILh/xTmhm+hUNH9c5/qJvFtf4yoM0VpO4=; b=ln+tGuUHHnD8gn2OXYVezca5Okt/Zasm4kPCMZLsTxqz5nFNOfyMBt1jD4eGDhEtJNqC3B9P
 E+ZZqBxtrtdUfLB8H1A+sPKD7vS+PJ5vUu2THUeeBzkzHhbBa2VZkBZQt58DPVKp5BzweXA5
 fLvgzicIVn8xkvueetrjRvW9aFA=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n20.prod.us-east-1.postgun.com with SMTP id
 5ef1dbf5356bcc26ab45754e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Jun 2020 10:39:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F144BC43395; Tue, 23 Jun 2020 10:39:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0468BC43395;
        Tue, 23 Jun 2020 10:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0468BC43395
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
Subject: [PATCH V8 6/8] spi: spi-geni-qcom: Add interconnect support
Date:   Tue, 23 Jun 2020 16:08:55 +0530
Message-Id: <1592908737-7068-7-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592908737-7068-1-git-send-email-akashast@codeaurora.org>
References: <1592908737-7068-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Get the interconnect paths for SPI based Serial Engine device
and vote according to the current bus speed of the driver.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
Changes in V2:
 - As per Bjorn's comment, removed se == NULL check from geni_spi_icc_get
 - As per Bjorn's comment, removed code to set se->icc_path* to NULL in failure
 - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
   path handle
 - As per Matthias comment, added error handling for icc_set_bw call

Changes in V3:
 - As per Matthias's comment, use helper ICC function from geni-se driver.

Changes in V4:
 - Move peak_bw guess as twice of avg_bw if nothing mentioned explicitly
   to ICC core.

Changes in V5:
 - Use icc_enable/disable in power on/off call.
 - Save some non-zero avg/peak value to ICC core by calling geni_icc_set_bw
   from probe so that when resume/icc_enable is called NOC are running at
   some non-zero value. No need to call icc_disable after BW vote because
   device will resume and suspend before probe return and will leave ICC in
   disabled state.

Changes in V6:
 - No change

Changes in V7:
 - As per Matthias's comment removed usage of peak_bw variable because we don't
   have explicit peak requirement, we were voting peak = avg and this can be
   tracked using single variable for avg bw.

Changes in V8:
 - Adjust ICC vote per transfer, in multimessage transfer scenario.
 - Move ICC voting to common API "geni_spi_set_clock_and_bw".

 drivers/spi/spi-geni-qcom.c | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index f186906..7a2e579 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -192,7 +192,8 @@ static void spi_setup_word_len(struct spi_geni_master *mas, u16 mode,
 	writel(word_len, se->base + SE_SPI_WORD_LEN);
 }
 
-static int geni_spi_set_clock(struct spi_geni_master *mas, unsigned long clk_hz)
+static int geni_spi_set_clock_and_bw(struct spi_geni_master *mas,
+					unsigned long clk_hz)
 {
 	u32 clk_sel, m_clk_cfg, idx, div;
 	struct geni_se *se = &mas->se;
@@ -218,6 +219,12 @@ static int geni_spi_set_clock(struct spi_geni_master *mas, unsigned long clk_hz)
 	writel(clk_sel, se->base + SE_GENI_CLK_SEL);
 	writel(m_clk_cfg, se->base + GENI_SER_M_CLK_CFG);
 
+	/* Set BW quota for CPU as driver supports FIFO mode only. */
+	se->icc_paths[CPU_TO_GENI].avg_bw = Bps_to_icc(mas->cur_speed_hz);
+	ret = geni_icc_set_bw(se);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -259,7 +266,7 @@ static int setup_fifo_params(struct spi_device *spi_slv,
 	writel(cpol, se->base + SE_SPI_CPOL);
 	writel(demux_output_inv, se->base + SE_SPI_DEMUX_OUTPUT_INV);
 
-	return geni_spi_set_clock(mas, spi_slv->max_speed_hz);
+	return geni_spi_set_clock_and_bw(mas, spi_slv->max_speed_hz);
 }
 
 static int spi_geni_prepare_message(struct spi_master *spi,
@@ -346,7 +353,7 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
 
 	/* Speed and bits per word can be overridden per transfer */
 	if (xfer->speed_hz != mas->cur_speed_hz) {
-		ret = geni_spi_set_clock(mas, xfer->speed_hz);
+		ret = geni_spi_set_clock_and_bw(mas, xfer->speed_hz);
 		if (ret)
 			return;
 	}
@@ -620,6 +627,17 @@ static int spi_geni_probe(struct platform_device *pdev)
 	spin_lock_init(&mas->lock);
 	pm_runtime_enable(dev);
 
+	ret = geni_icc_get(&mas->se, NULL);
+	if (ret)
+		goto spi_geni_probe_runtime_disable;
+	/* Set the bus quota to a reasonable value for register access */
+	mas->se.icc_paths[GENI_TO_CORE].avg_bw = Bps_to_icc(CORE_2X_50_MHZ);
+	mas->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
+
+	ret = geni_icc_set_bw(&mas->se);
+	if (ret)
+		goto spi_geni_probe_runtime_disable;
+
 	ret = spi_geni_init(mas);
 	if (ret)
 		goto spi_geni_probe_runtime_disable;
@@ -658,14 +676,24 @@ static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
 {
 	struct spi_master *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_master_get_devdata(spi);
+	int ret;
+
+	ret = geni_se_resources_off(&mas->se);
+	if (ret)
+		return ret;
 
-	return geni_se_resources_off(&mas->se);
+	return geni_icc_disable(&mas->se);
 }
 
 static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
 {
 	struct spi_master *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_master_get_devdata(spi);
+	int ret;
+
+	ret = geni_icc_enable(&mas->se);
+	if (ret)
+		return ret;
 
 	return geni_se_resources_on(&mas->se);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

