Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC8A204DFE
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 11:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731945AbgFWJc3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jun 2020 05:32:29 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:26186 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731921AbgFWJc1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Jun 2020 05:32:27 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05N9NoaL028773;
        Tue, 23 Jun 2020 11:31:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Weg0RcL/DVf4Oy73jsoOhA5zRr02V3dL56h1oGO0waY=;
 b=h3ztPvbNJRqBmRFmjJqzjCtiE/9dI0oL6hVSPD6oB4RtwFuhkGto2DZU1wL9/yxNOtwr
 uqNsmRbkq6+d5EyOClF0kV0RtRVcIaxWZwJyv3gyJe2MhGmy6Q0gsm9gyoLbuEXjYAst
 /k2czctZimUvv5IUzXxeXhDum0ydDfvzK0lN6ddLZr4lgbbILzvzjWU8Q4msz7e+QsiI
 nYyzxQjYyDTwTNgi0/PQUyo0J26PKh1q8VQWX5scoVHrvPDk16SamnHL7XensjbaXKAb
 934YNq4bZrhCTBtYzPEci0FT/vsamf5o24GazsRj5NLkxTEpDpEQ7E43OqnnicPnUUCo +w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31s87vecn2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Jun 2020 11:31:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7A46210002A;
        Tue, 23 Jun 2020 11:31:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 699602B64A7;
        Tue, 23 Jun 2020 11:31:13 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 23 Jun 2020 11:31:12
 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@kernel.org>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <alain.volmat@st.com>
Subject: [PATCH] ARM: dts: stm32: configure i2c5 support on stm32mp15xx-dkx
Date:   Tue, 23 Jun 2020 11:31:12 +0200
Message-ID: <1592904672-12781-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-23_05:2020-06-22,2020-06-23 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Fabrice Gasnier <fabrice.gasnier@st.com>

Configure I2C5 on stm32mp15 DK boards. It's available and can be used on:
- Arduino connector
- GPIO expansion connector
Keep it disabled by default, so the pins are kept in their initial state to
lower power consumption. This way they can also be used as GPIO.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
index fcf50131e5fe..e69aba9830b3 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
@@ -361,6 +361,19 @@
 	};
 };
 
+&i2c5 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c5_pins_a>;
+	pinctrl-1 = <&i2c5_sleep_pins_a>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	clock-frequency = <400000>;
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "disabled";
+};
+
 &i2s2 {
 	clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
 	clock-names = "pclk", "i2sclk", "x8k", "x11k";
-- 
2.17.1

