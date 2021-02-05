Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42C4B310727
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Feb 2021 09:56:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbhBEIyA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 03:54:00 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:23508 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229601AbhBEIxE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 Feb 2021 03:53:04 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1158pvIC017513;
        Fri, 5 Feb 2021 09:52:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=WAtejRpIzmpts18wpGgXgf05/HdqNvlkdeGPvsYexF0=;
 b=iEeNsPh2Cg0fF2r5ArRqppt766EZwLeMYhvIs16HIepNpwi36ZzIPvfa1tTlhaw/y8+J
 F8Jg7A0p6Lc0E5BrbfpqxBatKUdSYfKSlMuIcdK+pGS7LaZlVgL3dKpNqQ6XjFcldtT0
 yYLx2HQueyPTaLjvN1aykWTJzYCBpTCxyc+KOuDilUJfQm28BHcdmSNmyIsLMiL5zu7B
 O4fhsEdryugMOs7UV5jHxr9dkqDXAOnOsEYTzwh6H343XuV0Byp2WLxXq8kDf+2TSZsy
 d1stgKxtC3Z0v2Aegk4/J1M+3BjJGidipqYluQlAJN2zHxy/yu1mP/L8kgts2rU+UDg5 PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36d0fsdb68-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 Feb 2021 09:52:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3D805100034;
        Fri,  5 Feb 2021 09:52:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3091D221793;
        Fri,  5 Feb 2021 09:52:07 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 09:52:06
 +0100
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <wsa@kernel.org>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@foss.st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <alain.volmat@foss.st.com>
Subject: [PATCH 3/5] i2c: stm32f7: add support for DNF i2c-digital-filter binding
Date:   Fri, 5 Feb 2021 09:51:42 +0100
Message-ID: <1612515104-838-4-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-05_06:2021-02-05,2021-02-05 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the support for the i2c-digital-filter binding, allowing to enable
the digital filter via the device-tree and indicate its value in the DT.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 0c539fea2754..f77cd6512a86 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -222,7 +222,6 @@ struct stm32f7_i2c_spec {
  * @clock_src: I2C clock source frequency (Hz)
  * @rise_time: Rise time (ns)
  * @fall_time: Fall time (ns)
- * @dnf: Digital filter coefficient (0-16)
  * @fmp_clr_offset: Fast Mode Plus clear register offset from set register
  */
 struct stm32f7_i2c_setup {
@@ -230,7 +229,6 @@ struct stm32f7_i2c_setup {
 	u32 clock_src;
 	u32 rise_time;
 	u32 fall_time;
-	u8 dnf;
 	u32 fmp_clr_offset;
 };
 
@@ -310,6 +308,8 @@ struct stm32f7_i2c_msg {
  * @smbus_mode: states that the controller is configured in SMBus mode
  * @host_notify_client: SMBus host-notify client
  * @analog_filter: boolean to indicate enabling of the analog filter
+ * @dnf_dt: value of digital filter requested via dt
+ * @dnf: value of digital filter to apply
  */
 struct stm32f7_i2c_dev {
 	struct i2c_adapter adap;
@@ -339,6 +339,8 @@ struct stm32f7_i2c_dev {
 	bool smbus_mode;
 	struct i2c_client *host_notify_client;
 	bool analog_filter;
+	u32 dnf_dt;
+	u32 dnf;
 };
 
 /*
@@ -384,13 +386,11 @@ static struct stm32f7_i2c_spec stm32f7_i2c_specs[] = {
 static const struct stm32f7_i2c_setup stm32f7_setup = {
 	.rise_time = STM32F7_I2C_RISE_TIME_DEFAULT,
 	.fall_time = STM32F7_I2C_FALL_TIME_DEFAULT,
-	.dnf = STM32F7_I2C_DNF_DEFAULT,
 };
 
 static const struct stm32f7_i2c_setup stm32mp15_setup = {
 	.rise_time = STM32F7_I2C_RISE_TIME_DEFAULT,
 	.fall_time = STM32F7_I2C_FALL_TIME_DEFAULT,
-	.dnf = STM32F7_I2C_DNF_DEFAULT,
 	.fmp_clr_offset = 0x40,
 };
 
@@ -459,10 +459,11 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
 		return -EINVAL;
 	}
 
-	if (setup->dnf > STM32F7_I2C_DNF_MAX) {
+	i2c_dev->dnf = DIV_ROUND_CLOSEST(i2c_dev->dnf_dt, i2cclk);
+	if (i2c_dev->dnf > STM32F7_I2C_DNF_MAX) {
 		dev_err(i2c_dev->dev,
 			"DNF out of bound %d/%d\n",
-			setup->dnf, STM32F7_I2C_DNF_MAX);
+			i2c_dev->dnf * i2cclk, STM32F7_I2C_DNF_MAX * i2cclk);
 		return -EINVAL;
 	}
 
@@ -473,13 +474,13 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
 	af_delay_max =
 		(i2c_dev->analog_filter ?
 		 STM32F7_I2C_ANALOG_FILTER_DELAY_MAX : 0);
-	dnf_delay = setup->dnf * i2cclk;
+	dnf_delay = i2c_dev->dnf * i2cclk;
 
 	sdadel_min = specs->hddat_min + setup->fall_time -
-		af_delay_min - (setup->dnf + 3) * i2cclk;
+		af_delay_min - (i2c_dev->dnf + 3) * i2cclk;
 
 	sdadel_max = specs->vddat_max - setup->rise_time -
-		af_delay_max - (setup->dnf + 4) * i2cclk;
+		af_delay_max - (i2c_dev->dnf + 4) * i2cclk;
 
 	scldel_min = setup->rise_time + specs->sudat_min;
 
@@ -645,6 +646,7 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 	setup->speed_freq = t->bus_freq_hz;
 	i2c_dev->setup.rise_time = t->scl_rise_ns;
 	i2c_dev->setup.fall_time = t->scl_fall_ns;
+	i2c_dev->dnf_dt = t->digital_filter_width_ns;
 	setup->clock_src = clk_get_rate(i2c_dev->clk);
 
 	if (!setup->clock_src) {
@@ -652,6 +654,9 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 		return -EINVAL;
 	}
 
+	if (!of_property_read_bool(i2c_dev->dev->of_node, "i2c-digital-filter"))
+		i2c_dev->dnf_dt = STM32F7_I2C_DNF_DEFAULT;
+
 	do {
 		ret = stm32f7_i2c_compute_timing(i2c_dev, setup,
 						 &i2c_dev->timing);
@@ -681,7 +686,7 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 	dev_dbg(i2c_dev->dev, "I2C Rise(%i) and Fall(%i) Time\n",
 		setup->rise_time, setup->fall_time);
 	dev_dbg(i2c_dev->dev, "I2C Analog Filter(%s), DNF(%i)\n",
-		(i2c_dev->analog_filter ? "On" : "Off"), setup->dnf);
+		(i2c_dev->analog_filter ? "On" : "Off"), i2c_dev->dnf);
 
 	i2c_dev->bus_rate = setup->speed_freq;
 
@@ -732,7 +737,7 @@ static void stm32f7_i2c_hw_config(struct stm32f7_i2c_dev *i2c_dev)
 	stm32f7_i2c_clr_bits(i2c_dev->base + STM32F7_I2C_CR1,
 			     STM32F7_I2C_CR1_DNF_MASK);
 	stm32f7_i2c_set_bits(i2c_dev->base + STM32F7_I2C_CR1,
-			     STM32F7_I2C_CR1_DNF(i2c_dev->setup.dnf));
+			     STM32F7_I2C_CR1_DNF(i2c_dev->dnf));
 
 	stm32f7_i2c_set_bits(i2c_dev->base + STM32F7_I2C_CR1,
 			     STM32F7_I2C_CR1_PE);
-- 
2.17.1

