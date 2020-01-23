Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 283E9146E02
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 17:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729058AbgAWQNe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 11:13:34 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:27050 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728816AbgAWQNe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jan 2020 11:13:34 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00NGCWjH000791;
        Thu, 23 Jan 2020 17:13:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=2pLASYC7DKu+Ek/d/bAfcVV4JHnQ0bcSh78Nb7SNuXc=;
 b=aWuqCrF2rwbiQUbWUIc2yll44u/449dGj/giWC3bNHTZ9fNyWdFBKNZVMxcqst5iot6A
 /aKNp2QpgUPHKkp/SeoA5h4etLSTajWPra4v2sM7uesxRIFPTmhE8VtVBMw+DsbxqOaI
 CJrCd5I6mXnp/vE1fb5F6+6fOfuBe+D/3CKre2SK9SpCgaJuiI7xKsi9IwuhSlHfbbN8
 BM1mLLZc5L+B1DN1MS03FRd/ryrsSbD1XrPcidFh4G8jXY60O+x6HMAqZJU/KXxp3lal
 6Fa6srnEW/rGPf3+MPcxlZz5Z3R/TjF5U2eUBLk1o7hZACMKtj4gv05iYxvHL2k+yR/E vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xkr1ebaye-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Jan 2020 17:13:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2533110003A;
        Thu, 23 Jan 2020 17:13:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0FCD92BC7D5;
        Thu, 23 Jan 2020 17:13:18 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 23 Jan 2020 17:13:17
 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <alain.volmat@st.com>
Subject: [PATCH 4/5] ARM: dts: stm32: use st,stm32mp15-i2c compatible for stm32mp151
Date:   Thu, 23 Jan 2020 17:12:49 +0100
Message-ID: <1579795970-22319-5-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
References: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-23_08:2020-01-23,2020-01-23 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Replace previous st,stm32f7-i2c compatible with st,stm32mp15-i2c
for the platform stm32mp151.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 02918dd6cf25..2dbf32ca9b36 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -474,7 +474,7 @@
 		};
 
 		i2c1: i2c@40012000 {
-			compatible = "st,stm32f7-i2c";
+			compatible = "st,stm32mp15-i2c";
 			reg = <0x40012000 0x400>;
 			interrupt-names = "event", "error";
 			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
@@ -488,7 +488,7 @@
 		};
 
 		i2c2: i2c@40013000 {
-			compatible = "st,stm32f7-i2c";
+			compatible = "st,stm32mp15-i2c";
 			reg = <0x40013000 0x400>;
 			interrupt-names = "event", "error";
 			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
@@ -502,7 +502,7 @@
 		};
 
 		i2c3: i2c@40014000 {
-			compatible = "st,stm32f7-i2c";
+			compatible = "st,stm32mp15-i2c";
 			reg = <0x40014000 0x400>;
 			interrupt-names = "event", "error";
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
@@ -516,7 +516,7 @@
 		};
 
 		i2c5: i2c@40015000 {
-			compatible = "st,stm32f7-i2c";
+			compatible = "st,stm32mp15-i2c";
 			reg = <0x40015000 0x400>;
 			interrupt-names = "event", "error";
 			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
@@ -1468,7 +1468,7 @@
 		};
 
 		i2c4: i2c@5c002000 {
-			compatible = "st,stm32f7-i2c";
+			compatible = "st,stm32mp15-i2c";
 			reg = <0x5c002000 0x400>;
 			interrupt-names = "event", "error";
 			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
@@ -1504,7 +1504,7 @@
 		};
 
 		i2c6: i2c@5c009000 {
-			compatible = "st,stm32f7-i2c";
+			compatible = "st,stm32mp15-i2c";
 			reg = <0x5c009000 0x400>;
 			interrupt-names = "event", "error";
 			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.7.4

