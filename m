Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C72F11312CF
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 14:29:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbgAFN3z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jan 2020 08:29:55 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:8710 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726173AbgAFN3z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jan 2020 08:29:55 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 006DRNnX015657;
        Mon, 6 Jan 2020 14:29:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=c9G/qBaD6wsHZtRalQiManSBv5FP4+ZNE06mF1ysdlo=;
 b=fImKT+q0k3XNjwQl3vJ/o1MPpgHY2Z8Qe9K0rRvGEtghldYKkGvTXhLO8P9GeDgDG+R1
 bOGB7xDF7d8PBkZ/4ezSxuelTG+MGrHnGFXdlt6rcksslE38EPQ3G+a8p4fbX47Vylfg
 na3d3nQR0fQ3IVhgMwSO5FjZ+hBvLoO3xZxrrxRTlXtvL8HMQGoZERZpBOsaGje78nn5
 LoAO0rjEjxAjyXZcMPFrb7/j/wLSejs2QquTJ/PwMF+HuuYSfK5lFB+h8hPmQtCAsAiy
 WYXhKEHpcdmbpdfD/G8pnUZsnw8Vj7qfbT8o17/wlY88i3s7Ppkv4TcKexMWns6GEM3V /Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xakuqg3qk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Jan 2020 14:29:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F0C20100038;
        Mon,  6 Jan 2020 14:29:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DFD752D378B;
        Mon,  6 Jan 2020 14:29:41 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 6 Jan 2020 14:29:41
 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: [PATCH 1/6] ARM: dts: stm32: add i2c4 sleep pinctrl on stm32mp15xx-dkx
Date:   Mon, 6 Jan 2020 14:28:29 +0100
Message-ID: <1578317314-17197-2-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578317314-17197-1-git-send-email-alain.volmat@st.com>
References: <1578317314-17197-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_04:2020-01-06,2020-01-06 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the sleep state pinctrl entry for the i2c4 node
of the stm32mp15xx-dkx.dtsi

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
index f6672e87aef3..7f5fcb2c5b03 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
@@ -216,8 +216,9 @@
 };
 
 &i2c4 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&i2c4_pins_a>;
+	pinctrl-1 = <&i2c4_pins_sleep_a>;
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
 	status = "okay";
-- 
2.7.4

