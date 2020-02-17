Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15A03161370
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2020 14:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728749AbgBQNbB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Feb 2020 08:31:01 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:48175 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728778AbgBQNbB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Feb 2020 08:31:01 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581946260; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=MkX8Bxw3WcqbzRbq/XK6GqwUrbIioGukwcHL/N7ggWU=; b=H1VKZ/vcVIpCHL0RQF6RfRRzM19qijRRKNLB46qWjTZP0IhXf5VQwhDs1mRdSpUPbN8QDS80
 yjx6cirHdy6L+xEw/X8A2643qnfypXvlEArxUe1lv4q2B+cUW9Ra+BR9AyuMc4DDd2DuOm89
 B9YhxrMy+iTfie/DXOtSie/1CHs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4a958e.7ff82b1c0068-smtp-out-n03;
 Mon, 17 Feb 2020 13:30:54 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 43FE6C447A9; Mon, 17 Feb 2020 13:30:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 39A56C43383;
        Mon, 17 Feb 2020 13:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 39A56C43383
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
        dianders@chromium.org, Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH 2/6] tty: serial: qcom_geni_serial: Add interconnect support
Date:   Mon, 17 Feb 2020 19:00:01 +0530
Message-Id: <1581946205-27189-3-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
References: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Get the interconnect paths for Uart based Serial Engine device
and vote according to the baud rate requirement of the driver.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 84 ++++++++++++++++++++++++++++++-----
 1 file changed, 74 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 191abb1..a8fb2b7 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -174,6 +174,35 @@ static struct qcom_geni_serial_port qcom_geni_console_port = {
 	},
 };
 
+static int geni_serial_icc_get(struct geni_se *se)
+{
+	if (!se)
+		return -EINVAL;
+
+	se->icc_path[GENI_TO_CORE] = of_icc_get(se->dev, "qup-core");
+	if (IS_ERR(se->icc_path[GENI_TO_CORE]))
+		return PTR_ERR(se->icc_path[GENI_TO_CORE]);
+
+	se->icc_path[CPU_TO_GENI] = of_icc_get(se->dev, "qup-config");
+	if (IS_ERR(se->icc_path[CPU_TO_GENI])) {
+		icc_put(se->icc_path[GENI_TO_CORE]);
+		se->icc_path[GENI_TO_CORE] = NULL;
+		return PTR_ERR(se->icc_path[CPU_TO_GENI]);
+	}
+
+	return 0;
+}
+
+void geni_serial_icc_put(struct geni_se *se)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(se->icc_path); i++) {
+		icc_put(se->icc_path[i]);
+		se->icc_path[i] = NULL;
+	}
+}
+
 static int qcom_geni_serial_request_port(struct uart_port *uport)
 {
 	struct platform_device *pdev = to_platform_device(uport->dev);
@@ -949,6 +978,12 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	ser_clk_cfg = SER_CLK_EN;
 	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
 
+	/* Put BW vote only on CPU path as driver supports FIFO mode only */
+	port->se.avg_bw_cpu = Bps_to_icc(baud);
+	port->se.peak_bw_cpu = Bps_to_icc(2 * baud);
+	icc_set_bw(port->se.icc_path[CPU_TO_GENI], port->se.avg_bw_cpu,
+			port->se.peak_bw_cpu);
+
 	/* parity */
 	tx_trans_cfg = readl(uport->membase + SE_UART_TX_TRANS_CFG);
 	tx_parity_cfg = readl(uport->membase + SE_UART_TX_PARITY_CFG);
@@ -1179,11 +1214,20 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
 	if (old_state == UART_PM_STATE_UNDEFINED)
 		old_state = UART_PM_STATE_OFF;
 
-	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
+	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF) {
+		/* Put BW vote for core clocks and CPU */
+		icc_set_bw(port->se.icc_path[GENI_TO_CORE],
+			port->se.avg_bw_core, port->se.peak_bw_core);
+		icc_set_bw(port->se.icc_path[CPU_TO_GENI], port->se.avg_bw_cpu,
+			port->se.peak_bw_cpu);
 		geni_se_resources_on(&port->se);
-	else if (new_state == UART_PM_STATE_OFF &&
-			old_state == UART_PM_STATE_ON)
+	} else if (new_state == UART_PM_STATE_OFF &&
+			old_state == UART_PM_STATE_ON) {
 		geni_se_resources_off(&port->se);
+		/* Remove BW vote from core clocks and CPU */
+		icc_set_bw(port->se.icc_path[GENI_TO_CORE], 0, 0);
+		icc_set_bw(port->se.icc_path[CPU_TO_GENI], 0, 0);
+	}
 }
 
 static const struct uart_ops qcom_geni_console_pops = {
@@ -1274,15 +1318,30 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
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
+	port->se.avg_bw_cpu = Bps_to_icc(1000);
+
 	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
 			"qcom_geni_serial_%s%d",
 			uart_console(uport) ? "console" : "uart", uport->line);
-	if (!port->name)
-		return -ENOMEM;
+	if (!port->name) {
+		ret = -ENOMEM;
+		goto geni_serial_put_icc;
+	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	if (irq < 0) {
+		ret = irq;
+		goto geni_serial_put_icc;
+	}
 	uport->irq = irq;
 	uport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE);
 
@@ -1295,7 +1354,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 
 	ret = uart_add_one_port(drv, uport);
 	if (ret)
-		return ret;
+		goto geni_serial_put_icc;
 
 	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
 	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
@@ -1303,7 +1362,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
 		uart_remove_one_port(drv, uport);
-		return ret;
+		goto geni_serial_put_icc;
 	}
 
 	/*
@@ -1320,11 +1379,15 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 		if (ret) {
 			device_init_wakeup(&pdev->dev, false);
 			uart_remove_one_port(drv, uport);
-			return ret;
+			goto geni_serial_put_icc;
 		}
 	}
 
 	return 0;
+
+geni_serial_put_icc:
+	geni_serial_icc_put(&port->se);
+	return ret;
 }
 
 static int qcom_geni_serial_remove(struct platform_device *pdev)
@@ -1335,6 +1398,7 @@ static int qcom_geni_serial_remove(struct platform_device *pdev)
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
 	uart_remove_one_port(drv, &port->uport);
+	geni_serial_icc_put(&port->se);
 
 	return 0;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
