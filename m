Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 215281DC8A4
	for <lists+linux-i2c@lfdr.de>; Thu, 21 May 2020 10:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728669AbgEUIav (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 May 2020 04:30:51 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:42778 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728670AbgEUIau (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 May 2020 04:30:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590049850; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=L3So3cMp+A9F8imbp0mYNFbkKfJC7N+p0SSBlbNUPnQ=; b=KkfuDVFtdN1+33hiuHxm/9iCSMw8SuqoK+Cj7uZV3fQlRgupEPz1i9KVrMbvwvvF+Ks3bLhi
 2kmVKrL05dEd++8NKoV9+LTmGGYdr4gv5MiDFFXV4yNWlUsFht+DpXWSUTIzYdMTmotCdJ05
 DmX8/vNqNvRsZoBAK0rut20E8Yw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec63c18.7f1af8bd8c70-smtp-out-n01;
 Thu, 21 May 2020 08:30:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B5A35C433CA; Thu, 21 May 2020 08:30:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2AD9DC433C6;
        Thu, 21 May 2020 08:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2AD9DC433C6
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
Subject: [PATCH V6 4/7] spi: spi-geni-qcom: Add interconnect support
Date:   Thu, 21 May 2020 13:59:21 +0530
Message-Id: <1590049764-20912-5-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590049764-20912-1-git-send-email-akashast@codeaurora.org>
References: <1590049764-20912-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Get the interconnect paths for SPI based Serial Engine device
and vote according to the current bus speed of the driver.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Acked-by: Mark Brown <broonie@kernel.org>
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

 drivers/spi/spi-geni-qcom.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index c397242..cc637d2 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -234,6 +234,13 @@ static int setup_fifo_params(struct spi_device *spi_slv,
 		return ret;
 	}
 
+	/* Set BW quota for CPU as driver supports FIFO mode only. */
+	geni_icc_bw_init(&se->icc_paths[CPU_TO_GENI],
+				Bps_to_icc(mas->cur_speed_hz), 0);
+	ret = geni_icc_set_bw(se);
+	if (ret)
+		return ret;
+
 	clk_sel = idx & CLK_SEL_MSK;
 	m_clk_cfg = (div << CLK_DIV_SHFT) | SER_CLK_EN;
 	spi_setup_word_len(mas, spi_slv->mode, spi_slv->bits_per_word);
@@ -578,6 +585,18 @@ static int spi_geni_probe(struct platform_device *pdev)
 	spin_lock_init(&mas->lock);
 	pm_runtime_enable(dev);
 
+	ret = geni_icc_get(&mas->se, NULL);
+	if (ret)
+		goto spi_geni_probe_runtime_disable;
+	/* Set the bus quota to a reasonable value for register access */
+	geni_icc_bw_init(&mas->se.icc_paths[GENI_TO_CORE],
+			Bps_to_icc(CORE_2X_50_MHZ), 0);
+	geni_icc_bw_init(&mas->se.icc_paths[CPU_TO_GENI], GENI_DEFAULT_BW, 0);
+
+	ret = geni_icc_set_bw(&mas->se);
+	if (ret)
+		goto spi_geni_probe_runtime_disable;
+
 	ret = spi_geni_init(mas);
 	if (ret)
 		goto spi_geni_probe_runtime_disable;
@@ -616,14 +635,24 @@ static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
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
