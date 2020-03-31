Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6080D199518
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Mar 2020 13:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730715AbgCaLMu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Mar 2020 07:12:50 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:62867 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730711AbgCaLMu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Mar 2020 07:12:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585653169; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=MOIplqSOzxdDflcixA2mxrZ3W7/pbwwdWuqRVNd2jE8=; b=wcST8Gp4jTWvgXlqOnkIl8PVbPv5qOv1F6n9mKycp3EVUpNCV1Lxs5Nt161qqJLKwG8EKdZL
 VjZrPEBxbi2+sl0qTnCflmoQeDnAA/Czt/ATUOEW81vmGC/rdNqnroJuhtnvuSPE9aaMZVR9
 NFXOvUWx6XYiGaPAkY9igntEoxQ=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8325a3.7f979f45b848-smtp-out-n04;
 Tue, 31 Mar 2020 11:12:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3E8CAC44798; Tue, 31 Mar 2020 11:12:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 55856C44788;
        Tue, 31 Mar 2020 11:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 55856C44788
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
Subject: [PATCH V3 6/8] tty: serial: qcom_geni_serial: Add interconnect support
Date:   Tue, 31 Mar 2020 16:39:34 +0530
Message-Id: <1585652976-17481-7-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Get the interconnect paths for Uart based Serial Engine device
and vote according to the baud rate requirement of the driver.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
Changes in V2:
 - As per Bjorn's comment, removed se == NULL check from geni_serial_icc_get
 - As per Bjorn's comment, removed code to set se->icc_path* to NULL in failure
 - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
   path handle
 - As per Matthias comment, added error handling for icc_set_bw call

Changes in V3:
 - As per Matthias comment, use common library APIs defined in geni-se
   driver for ICC functionality.

 drivers/tty/serial/qcom_geni_serial.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 8c5d97c..2befe72 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -965,6 +965,14 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	ser_clk_cfg = SER_CLK_EN;
 	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
 
+	/*
+	 * Bump up BW vote on CPU path as driver supports FIFO mode only.
+	 * Assume peak_bw as twice of avg_bw.
+	 */
+	port->se.from_cpu.avg_bw = Bps_to_icc(baud);
+	port->se.from_cpu.peak_bw = Bps_to_icc(2 * baud);
+	geni_icc_vote_on(&port->se);
+
 	/* parity */
 	tx_trans_cfg = readl(uport->membase + SE_UART_TX_TRANS_CFG);
 	tx_parity_cfg = readl(uport->membase + SE_UART_TX_PARITY_CFG);
@@ -1202,11 +1210,14 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
 	if (old_state == UART_PM_STATE_UNDEFINED)
 		old_state = UART_PM_STATE_OFF;
 
-	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
+	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF) {
+		geni_icc_vote_on(&port->se);
 		geni_se_resources_on(&port->se);
-	else if (new_state == UART_PM_STATE_OFF &&
-			old_state == UART_PM_STATE_ON)
+	} else if (new_state == UART_PM_STATE_OFF &&
+			old_state == UART_PM_STATE_ON) {
 		geni_se_resources_off(&port->se);
+		geni_icc_vote_off(&port->se);
+	}
 }
 
 static const struct uart_ops qcom_geni_console_pops = {
@@ -1304,6 +1315,17 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 			return -ENOMEM;
 	}
 
+	ret = geni_icc_get(&port->se, "qup-core", "qup-config", NULL);
+	if (ret)
+		return ret;
+	/* Set the bus quota to a reasonable value */
+	port->se.to_core.avg_bw = console ? GENI_DEFAULT_BW :
+		Bps_to_icc(CORE_2X_50_MHZ);
+	port->se.to_core.peak_bw = console ? GENI_DEFAULT_BW :
+		Bps_to_icc(CORE_2X_100_MHZ);
+	port->se.from_cpu.avg_bw = GENI_DEFAULT_BW;
+	port->se.from_cpu.peak_bw = GENI_DEFAULT_BW;
+
 	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
 			"qcom_geni_serial_%s%d",
 			uart_console(uport) ? "console" : "uart", uport->line);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
