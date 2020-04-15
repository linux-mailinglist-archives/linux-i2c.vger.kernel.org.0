Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCDC11A9AE0
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 12:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408754AbgDOKig (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 06:38:36 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:63689 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2408575AbgDOKYz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 06:24:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586946295; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=9nsMC90OsDmv2imJqmEZJh+LxnL0yMqc42PMWTwxJmY=; b=FcWxlx/CCu7LU15d7dl3gVG96ilaeQfg46VoFUoUtE7VjmjfvW7SuQ5xDa6mS6sV3ygoHxcs
 oingpKhSiZCNXRrhjdk2k8EhJAfnmx82vz2ziVqo6fs0ql5nxKxfHwY1c+2CIxxrOnOr7F3v
 MgF0MEsGwMnZ6SnayUUlDbyDCtA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e96e0ec.7f855cb44928-smtp-out-n03;
 Wed, 15 Apr 2020 10:24:44 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 00A91C433BA; Wed, 15 Apr 2020 10:24:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D14AC432C2;
        Wed, 15 Apr 2020 10:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7D14AC432C2
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
Subject: [PATCH V4 6/9] spi: spi-geni-qcom: Add interconnect support
Date:   Wed, 15 Apr 2020 15:53:15 +0530
Message-Id: <1586946198-13912-7-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586946198-13912-1-git-send-email-akashast@codeaurora.org>
References: <1586946198-13912-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Get the interconnect paths for SPI based Serial Engine device
and vote according to the current bus speed of the driver.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
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

 drivers/spi/spi-geni-qcom.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index c397242..782d495 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -234,6 +234,12 @@ static int setup_fifo_params(struct spi_device *spi_slv,
 		return ret;
 	}
 
+	/* Set BW quota for CPU as driver supports FIFO mode only. */
+	se->icc_paths[1].avg_bw = Bps_to_icc(mas->cur_speed_hz);
+	ret = geni_icc_vote_on(se);
+	if (ret)
+		return ret;
+
 	clk_sel = idx & CLK_SEL_MSK;
 	m_clk_cfg = (div << CLK_DIV_SHFT) | SER_CLK_EN;
 	spi_setup_word_len(mas, spi_slv->mode, spi_slv->bits_per_word);
@@ -578,6 +584,13 @@ static int spi_geni_probe(struct platform_device *pdev)
 	spin_lock_init(&mas->lock);
 	pm_runtime_enable(dev);
 
+	ret = geni_icc_get(&mas->se, NULL);
+	if (ret)
+		goto spi_geni_probe_runtime_disable;
+	/* Set the bus quota to a reasonable value for register access */
+	mas->se.icc_paths[0].avg_bw = Bps_to_icc(CORE_2X_50_MHZ);
+	mas->se.icc_paths[1].avg_bw = GENI_DEFAULT_BW;
+
 	ret = spi_geni_init(mas);
 	if (ret)
 		goto spi_geni_probe_runtime_disable;
@@ -616,14 +629,24 @@ static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
 {
 	struct spi_master *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_master_get_devdata(spi);
+	int ret;
 
-	return geni_se_resources_off(&mas->se);
+	ret = geni_se_resources_off(&mas->se);
+	if (ret)
+		return ret;
+
+	return geni_icc_vote_off(&mas->se);
 }
 
 static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
 {
 	struct spi_master *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_master_get_devdata(spi);
+	int ret;
+
+	ret = geni_icc_vote_on(&mas->se);
+	if (ret)
+		return ret;
 
 	return geni_se_resources_on(&mas->se);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
