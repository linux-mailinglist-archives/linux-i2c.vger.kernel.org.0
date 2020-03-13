Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02F9018478C
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Mar 2020 14:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgCMNNF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 09:13:05 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:42258 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726652AbgCMNNE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Mar 2020 09:13:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584105183; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=l9I0LI3fI/obwIP6gIsHiUXkayLXim7WYmPsr03c2pY=; b=BaWhvaEBfe++eaigfpdi42B/zjVQymuRFI33i9CP9um4/PTTXShCfxp/kobyZ4d+YnX6xH33
 00aiSI5Ye9Rv5DLRNnBRNM/9pn+AttlzFeDM8CMQKJETS0+cKIKS4jmYNThTRF1PC1Ft3PKZ
 QauHeK/fF5uPlB273y8X2CLqK0E=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6b86df.7f12f6a1a5e0-smtp-out-n02;
 Fri, 13 Mar 2020 13:13:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 07B0AC432C2; Fri, 13 Mar 2020 13:13:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 364F9C433D2;
        Fri, 13 Mar 2020 13:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 364F9C433D2
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
Subject: [PATCH V2 3/8] soc: qcom-geni-se: Add interconnect support to fix earlycon crash
Date:   Fri, 13 Mar 2020 18:42:09 +0530
Message-Id: <1584105134-13583-4-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

V1 patch@https://patchwork.kernel.org/patch/11386469/ caused SC7180 system
to reset at boot time.

As QUP core clock is shared among all the SE drivers present on particular
QUP wrapper, the reset seen is due to earlycon usage after QUP core clock
is put to 0 from other SE drivers before real console comes up.

As earlycon can't vote for it's QUP core need, to fix this add ICC
support to common/QUP wrapper driver and put vote for QUP core from
probe on behalf of earlycon and remove vote during sys suspend.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
Reported-by: Matthias Kaehlcke <mka@chromium.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 7d622ea..d244dfc 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -90,6 +90,7 @@ struct geni_wrapper {
 	struct device *dev;
 	void __iomem *base;
 	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
+	struct icc_path *icc_path_geni_to_core;
 };
 
 #define QUP_HW_VER_REG			0x4
@@ -747,11 +748,50 @@ static int geni_se_probe(struct platform_device *pdev)
 		}
 	}
 
+#ifdef CONFIG_SERIAL_EARLYCON
+	wrapper->icc_path_geni_to_core = devm_of_icc_get(dev, "qup-core");
+	if (IS_ERR(wrapper->icc_path_geni_to_core))
+		return PTR_ERR(wrapper->icc_path_geni_to_core);
+	/*
+	 * Put minmal BW request on core clocks on behalf of early console.
+	 * The vote will be removed in suspend call.
+	 */
+	ret = icc_set_bw(wrapper->icc_path_geni_to_core, Bps_to_icc(1000),
+			Bps_to_icc(1000));
+	if (ret) {
+		dev_err(&pdev->dev, "%s: ICC BW voting failed for core\n",
+			__func__);
+		return ret;
+	}
+#endif
+
 	dev_set_drvdata(dev, wrapper);
 	dev_dbg(dev, "GENI SE Driver probed\n");
 	return devm_of_platform_populate(dev);
 }
 
+static int __maybe_unused geni_se_sys_suspend(struct device *dev)
+{
+	struct geni_wrapper *wrapper = dev_get_drvdata(dev);
+	int ret;
+
+#ifdef CONFIG_SERIAL_EARLYCON
+	ret = icc_set_bw(wrapper->icc_path_geni_to_core, 0, 0);
+	if (ret) {
+		dev_err(dev, "%s: ICC BW remove failed for core\n",
+			__func__);
+		return ret;
+	}
+#endif
+
+	return 0;
+}
+
+static const struct dev_pm_ops geni_se_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(geni_se_sys_suspend,
+				NULL)
+};
+
 static const struct of_device_id geni_se_dt_match[] = {
 	{ .compatible = "qcom,geni-se-qup", },
 	{}
@@ -762,6 +802,7 @@ static struct platform_driver geni_se_driver = {
 	.driver = {
 		.name = "geni_se_qup",
 		.of_match_table = geni_se_dt_match,
+		.pm = &geni_se_pm_ops,
 	},
 	.probe = geni_se_probe,
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
