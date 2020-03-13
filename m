Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69CF31847A2
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Mar 2020 14:13:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgCMNNb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 09:13:31 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:22309 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726689AbgCMNNb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Mar 2020 09:13:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584105210; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Np4py6SMy6cMT5iS1ieP6hJGq7sWvtHg15kg9bsZHkc=; b=NJ616DphA0ucVcK/pfCbiUozDt/ROYEGBC0CJlyjo21xAWnmCui5FzoFombB9tQT1ymMVd8l
 X1w/VAHhuckUoqW2jmpnzan+KjPP+M1QykWdPnSXMYJSovMA5ja0opwdMCoRyZff+/PV/ORY
 nk2SIbDeSWpKl/3QAlwnpu3juoQ=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6b86ea.7f4ba6337298-smtp-out-n01;
 Fri, 13 Mar 2020 13:13:14 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EA234C433BA; Fri, 13 Mar 2020 13:13:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3297EC44788;
        Fri, 13 Mar 2020 13:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3297EC44788
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
Subject: [PATCH V2 4/8] tty: serial: qcom_geni_serial: Add interconnect support
Date:   Fri, 13 Mar 2020 18:42:10 +0530
Message-Id: <1584105134-13583-5-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
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

 drivers/tty/serial/qcom_geni_serial.c | 69 +++++++++++++++++++++++++++++++++--
 1 file changed, 65 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 272bae0..c8ad7e9 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -184,6 +184,19 @@ static struct qcom_geni_serial_port qcom_geni_console_port = {
 	},
 };
 
+static int geni_serial_icc_get(struct geni_se *se)
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
 static int qcom_geni_serial_request_port(struct uart_port *uport)
 {
 	struct platform_device *pdev = to_platform_device(uport->dev);
@@ -962,6 +975,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
 	unsigned long clk_rate;
 	u32 ver, sampling_rate;
+	int ret;
 
 	qcom_geni_serial_stop_rx(uport);
 	/* baud rate */
@@ -983,6 +997,18 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	ser_clk_cfg = SER_CLK_EN;
 	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
 
+	/*
+	 * Put BW vote only on CPU path as driver supports FIFO mode only.
+	 * Assume peak_bw as twice of avg_bw.
+	 */
+	port->se.avg_bw_cpu = Bps_to_icc(baud);
+	port->se.peak_bw_cpu = Bps_to_icc(2 * baud);
+	ret = icc_set_bw(port->se.icc_path_cpu_to_geni, port->se.avg_bw_cpu,
+			port->se.peak_bw_cpu);
+	if (ret)
+		dev_err(uport->dev, "%s: ICC BW voting failed for cpu\n",
+			__func__);
+
 	/* parity */
 	tx_trans_cfg = readl(uport->membase + SE_UART_TX_TRANS_CFG);
 	tx_parity_cfg = readl(uport->membase + SE_UART_TX_PARITY_CFG);
@@ -1208,16 +1234,40 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
 		unsigned int new_state, unsigned int old_state)
 {
 	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
-
+	int ret;
 	/* If we've never been called, treat it as off */
 	if (old_state == UART_PM_STATE_UNDEFINED)
 		old_state = UART_PM_STATE_OFF;
 
-	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
+	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF) {
+		/* Put BW vote for core clocks and CPU */
+		ret = icc_set_bw(port->se.icc_path_geni_to_core,
+			port->se.avg_bw_core, port->se.peak_bw_core);
+		if (ret)
+			dev_err(uport->dev, "%s: ICC BW voting failed for core\n",
+				__func__);
+
+		ret = icc_set_bw(port->se.icc_path_cpu_to_geni,
+			port->se.avg_bw_cpu, port->se.peak_bw_cpu);
+		if (ret)
+			dev_err(uport->dev, "%s: ICC BW voting failed for cpu\n",
+				__func__);
+
 		geni_se_resources_on(&port->se);
-	else if (new_state == UART_PM_STATE_OFF &&
-			old_state == UART_PM_STATE_ON)
+	} else if (new_state == UART_PM_STATE_OFF &&
+			old_state == UART_PM_STATE_ON) {
 		geni_se_resources_off(&port->se);
+		/* Remove BW vote from core clocks and CPU */
+		ret = icc_set_bw(port->se.icc_path_geni_to_core, 0, 0);
+		if (ret)
+			dev_err(uport->dev, "%s: ICC BW remove failed for core\n",
+				__func__);
+
+		ret = icc_set_bw(port->se.icc_path_cpu_to_geni, 0, 0);
+		if (ret)
+			dev_err(uport->dev, "%s: ICC BW remove failed for cpu\n",
+				__func__);
+	}
 }
 
 static const struct uart_ops qcom_geni_console_pops = {
@@ -1308,6 +1358,17 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
 	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
 
+	ret = geni_serial_icc_get(&port->se);
+	if (ret)
+		return ret;
+	/* Set the bus quota to a reasonable value */
+	port->se.avg_bw_core = console ? Bps_to_icc(1000) :
+		Bps_to_icc(CORE_2X_50_MHZ);
+	port->se.peak_bw_core = console ? Bps_to_icc(1000) :
+		Bps_to_icc(CORE_2X_100_MHZ);
+	port->se.avg_bw_cpu = Bps_to_icc(1000);
+	port->se.peak_bw_cpu = Bps_to_icc(1000);
+
 	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
 			"qcom_geni_serial_%s%d",
 			uart_console(uport) ? "console" : "uart", uport->line);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
