Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B095E1CA3EF
	for <lists+linux-i2c@lfdr.de>; Fri,  8 May 2020 08:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgEHGe1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 May 2020 02:34:27 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:43030 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726009AbgEHGe0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 May 2020 02:34:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588919666; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=xSZYU6GaRt0LBr4G3xL61q6i5tGBuQZd9GXqd+sHpfE=; b=fV6rP0RtIYAPu5QEwjGwhpmKkM5Oi8zihO4tcwRr+6GXd+pMmZaiw8uwPxOfmmygR4E1rqYp
 7qEmJUGUAxAMgz5EKAplqxWtdIU6M0BxDkCATsp2KS+3KWNBXQbc7Vbco+dwdUA9Gl2B1zcX
 BP6C8k4Pve6uhV+HWebpZO1SCaY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb4fd6f.7f1fffaeaf10-smtp-out-n05;
 Fri, 08 May 2020 06:34:23 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9B4CEC433BA; Fri,  8 May 2020 06:34:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 621DCC433D2;
        Fri,  8 May 2020 06:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 621DCC433D2
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
        georgi.djakov@linaro.org, Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V5 3/7] i2c: i2c-qcom-geni: Add interconnect support
Date:   Fri,  8 May 2020 12:03:35 +0530
Message-Id: <1588919619-21355-4-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588919619-21355-1-git-send-email-akashast@codeaurora.org>
References: <1588919619-21355-1-git-send-email-akashast@codeaurora.org>
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

Changes in V3:
 - As per Matthias comment, use common library APIs defined in geni-se
   driver for ICC functionality.

Changes in V4:
 - Move peak_bw guess as twice of avg_bw if nothing mentioned explicitly
   to ICC core.

Changes in V5:
 - Use icc_enable/disable in power on/off call.

 drivers/i2c/busses/i2c-qcom-geni.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 18d1e4f..f2e786d 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -557,6 +557,25 @@ static int geni_i2c_probe(struct platform_device *pdev)
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
+	geni_icc_bw_init(&gi2c->se.icc_paths[GENI_TO_CORE], GENI_DEFAULT_BW,
+				0);
+	geni_icc_bw_init(&gi2c->se.icc_paths[CPU_TO_GENI], GENI_DEFAULT_BW,
+				0);
+	geni_icc_bw_init(&gi2c->se.icc_paths[GENI_TO_DDR],
+				Bps_to_icc(gi2c->clk_freq_out), 0);
+
+	ret = geni_icc_set_bw(&gi2c->se);
+	if (ret)
+		return ret;
+
 	ret = geni_se_resources_on(&gi2c->se);
 	if (ret) {
 		dev_err(dev, "Error turning on resources %d\n", ret);
@@ -579,6 +598,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = geni_icc_disable(&gi2c->se);
+	if (ret)
+		return ret;
+
 	dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
 
 	gi2c->suspended = 1;
@@ -623,7 +646,7 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 		gi2c->suspended = 1;
 	}
 
-	return 0;
+	return geni_icc_disable(&gi2c->se);
 }
 
 static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
@@ -631,6 +654,10 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
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
