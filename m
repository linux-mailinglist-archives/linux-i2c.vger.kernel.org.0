Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 656311F33C4
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jun 2020 07:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgFIF5R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jun 2020 01:57:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:58171 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727122AbgFIF5P (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Jun 2020 01:57:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591682235; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=/G/GqYLeSLoHbdjLKwmizehbfLm59jhTXgm5/Cvo+4Y=; b=eFKgRjBGE7tJESSjIrtE1qLKicuwZp/UDt9ZK/dbySWTj24pmMmx4a8gGqNU8IDLNifwz0/t
 t561yc5u0TMH6UEbcmnHEPuqQBwp3yxGVX4sIpxZy6cK7i2GE8UelcNcBwl+m+zSNn4SYm+k
 b0BqXrIaRzJycAu7BwV+WdsZL8Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5edf24bad9f1a4ceef4d8762 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Jun 2020 05:57:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9F7BDC433AD; Tue,  9 Jun 2020 05:57:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9FE8BC43395;
        Tue,  9 Jun 2020 05:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9FE8BC43395
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
        msavaliy@codeaurora.org, Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V7 RESEND 3/7] i2c: i2c-qcom-geni: Add interconnect support
Date:   Tue,  9 Jun 2020 11:26:30 +0530
Message-Id: <1591682194-32388-4-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591682194-32388-1-git-send-email-akashast@codeaurora.org>
References: <1591682194-32388-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Get the interconnect paths for I2C based Serial Engine device
and vote according to the bus speed of the driver.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Acked-by: Wolfram Sang <wsa@kernel.org>
---
Changes in V2:
 - As per Bjorn's comment, removed se == NULL check from geni_i2c_icc_get
 - As per Bjorn's comment, removed code to set se->icc_path* to NULL in failure
 - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
   path handle
 - As per Matthias comment, added error handling for icc_set_bw call

Changes in V3:
 - As per Matthias comment, use common library APIs defined in geni-se
   driver for ICC functionality.

Changes in V4:
 - Move peak_bw guess as twice of avg_bw if nothing mentioned explicitly
   to ICC core.

Changes in V5:
 - Use icc_enable/disable in power on/off call.

Changes in V6:
 - No changes

Changes in V7:
 - As per Matthias's comment removed usage of peak_bw variable because we don't
   have explicit peak requirement, we were voting peak = avg and this can be
   tracked using single variable for avg bw.

 drivers/i2c/busses/i2c-qcom-geni.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 18d1e4f..32b2a99 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -557,6 +557,22 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	gi2c->adap.dev.of_node = dev->of_node;
 	strlcpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
 
+	ret = geni_icc_get(&gi2c->se, "qup-memory");
+	if (ret)
+		return ret;
+	/*
+	 * Set the bus quota for core and cpu to a reasonable value for
+	 * register access.
+	 * Set quota for DDR based on bus speed.
+	 */
+	gi2c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
+	gi2c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
+	gi2c->se.icc_paths[GENI_TO_DDR].avg_bw = Bps_to_icc(gi2c->clk_freq_out);
+
+	ret = geni_icc_set_bw(&gi2c->se);
+	if (ret)
+		return ret;
+
 	ret = geni_se_resources_on(&gi2c->se);
 	if (ret) {
 		dev_err(dev, "Error turning on resources %d\n", ret);
@@ -579,6 +595,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = geni_icc_disable(&gi2c->se);
+	if (ret)
+		return ret;
+
 	dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
 
 	gi2c->suspended = 1;
@@ -623,7 +643,7 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 		gi2c->suspended = 1;
 	}
 
-	return 0;
+	return geni_icc_disable(&gi2c->se);
 }
 
 static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
@@ -631,6 +651,10 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 	int ret;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
+	ret = geni_icc_enable(&gi2c->se);
+	if (ret)
+		return ret;
+
 	ret = geni_se_resources_on(&gi2c->se);
 	if (ret)
 		return ret;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

