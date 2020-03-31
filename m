Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C81141994D7
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Mar 2020 13:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730515AbgCaLL1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Mar 2020 07:11:27 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:33536 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730366AbgCaLL1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Mar 2020 07:11:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585653086; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=9CeOY47cRKUnZHA0P4VkQbiXSuXqkqOXF8nU1OCQSL8=; b=TqxzHvEaMl+FUYrQynSPbmAQMlPuh9cQtSZw9o6cRpAzG0tSndymUiheu/eaAGJyMAJeMRxQ
 88UNdawwD2G4s9oDhgNU3UQPKlahNuq7GZQyqsqJpYKf3UJ0jntbdIDpQ1t7bEsRWfEtfqy+
 1ulLAEYgVnL4jcDOF69CbCi6EQ0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e83255d.7f19b71a7f48-smtp-out-n05;
 Tue, 31 Mar 2020 11:11:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D81B6C44792; Tue, 31 Mar 2020 11:11:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0F05DC433D2;
        Tue, 31 Mar 2020 11:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0F05DC433D2
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
Subject: [PATCH V3 3/8] soc: qcom-geni-se: Add interconnect support to fix earlycon crash
Date:   Tue, 31 Mar 2020 16:39:31 +0530
Message-Id: <1585652976-17481-4-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

QUP core clock is shared among all the SE drivers present on particular
QUP wrapper, the system will reset(unclocked access) if earlycon used after
QUP core clock is put to 0 from other SE drivers before real console comes
up.

As earlycon can't vote for it's QUP core need, to fix this add ICC
support to common/QUP wrapper driver and put vote for QUP core from
probe on behalf of earlycon and remove vote during earlycon exit call.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
Reported-by: Matthias Kaehlcke <mka@chromium.org>
---
Change is V3:
 - Add geni_remove_earlycon_icc_vote API that will be used by earlycon
   exit function to remove ICC vote for earlyconsole.
 - Remove suspend/resume hook for geni-se driver as we are no longer
   removing earlyconsole ICC vote from system suspend, we are removing
   from earlycon exit.

 drivers/soc/qcom/qcom-geni-se.c       | 51 +++++++++++++++++++++++++++++++++++
 drivers/tty/serial/qcom_geni_serial.c |  7 +++++
 include/linux/qcom-geni-se.h          |  2 ++
 3 files changed, 60 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 9344c14..d30c282 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -90,8 +90,11 @@ struct geni_wrapper {
 	struct device *dev;
 	void __iomem *base;
 	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
+	struct geni_icc_path to_core;
 };
 
+struct geni_wrapper *earlycon_wrapper;
+
 #define QUP_HW_VER_REG			0x4
 
 /* Common SE registers */
@@ -818,6 +821,26 @@ int geni_icc_vote_off(struct geni_se *se)
 }
 EXPORT_SYMBOL(geni_icc_vote_off);
 
+void geni_remove_earlycon_icc_vote(void)
+{
+	struct geni_wrapper *wrapper = earlycon_wrapper;
+	struct device_node *parent = of_get_next_parent(wrapper->dev->of_node);
+	struct device_node *child;
+
+	for_each_child_of_node(parent, child) {
+		if (of_device_is_compatible(child, "qcom,geni-se-qup")) {
+			wrapper = platform_get_drvdata(of_find_device_by_node(
+					child));
+			icc_put(wrapper->to_core.path);
+			wrapper->to_core.path = NULL;
+		}
+	}
+	of_node_put(parent);
+
+	earlycon_wrapper = NULL;
+}
+EXPORT_SYMBOL(geni_remove_earlycon_icc_vote);
+
 static int geni_se_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -845,6 +868,34 @@ static int geni_se_probe(struct platform_device *pdev)
 		}
 	}
 
+#ifdef CONFIG_SERIAL_EARLYCON
+	wrapper->to_core.path = devm_of_icc_get(dev, "qup-core");
+	if (IS_ERR(wrapper->to_core.path))
+		return PTR_ERR(wrapper->to_core.path);
+	/*
+	 * Put minmal BW request on core clocks on behalf of early console.
+	 * The vote will be removed earlycon exit function.
+	 *
+	 * Note: We are putting vote on each QUP wrapper instead only to which
+	 * earlycon is connected because QUP core clock of different wrapper
+	 * share same voltage domain. If core1 is put to 0, then core2 will
+	 * also run at 0, if not voted. Default ICC vote will be removed ASA
+	 * we touch any of the core clock.
+	 * core1 = core2 = max(core1, core2)
+	 */
+	ret = icc_set_bw(wrapper->to_core.path, GENI_DEFAULT_BW,
+			GENI_DEFAULT_BW);
+	if (ret) {
+		dev_err(&pdev->dev, "%s: ICC BW voting failed for core\n",
+			__func__);
+		return ret;
+	}
+
+	if (of_get_compatible_child(pdev->dev.of_node, "qcom,geni-debug-uart"))
+		earlycon_wrapper = wrapper;
+	of_node_put(pdev->dev.of_node);
+#endif
+
 	dev_set_drvdata(dev, wrapper);
 	dev_dbg(dev, "GENI SE Driver probed\n");
 	return devm_of_platform_populate(dev);
diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 6119090..8c5d97c 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1090,6 +1090,12 @@ static void qcom_geni_serial_earlycon_write(struct console *con,
 	__qcom_geni_serial_console_write(&dev->port, s, n);
 }
 
+static int qcom_geni_serial_earlycon_exit(struct console *con)
+{
+	geni_remove_earlycon_icc_vote();
+	return 0;
+}
+
 static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
 								const char *opt)
 {
@@ -1135,6 +1141,7 @@ static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
 	writel(stop_bit_len, uport->membase + SE_UART_TX_STOP_BIT_LEN);
 
 	dev->con->write = qcom_geni_serial_earlycon_write;
+	dev->con->exit = qcom_geni_serial_earlycon_exit;
 	dev->con->setup = NULL;
 	return 0;
 }
diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index a83c86b..c830b38 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -452,5 +452,7 @@ int geni_icc_get(struct geni_se *se, const char *icc_core, const char *icc_cpu,
 int geni_icc_vote_on(struct geni_se *se);
 
 int geni_icc_vote_off(struct geni_se *se);
+
+void geni_remove_earlycon_icc_vote(void);
 #endif
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
