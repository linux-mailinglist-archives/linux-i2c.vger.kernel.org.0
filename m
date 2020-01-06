Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6331312D7
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 14:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgAFN36 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jan 2020 08:29:58 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:54430 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726303AbgAFN35 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jan 2020 08:29:57 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 006DRPGq006070;
        Mon, 6 Jan 2020 14:29:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=wjQdFwE1hTJLf/l3Bfadi5K3scAmh1frqnNxBbfuOeY=;
 b=tdrHsJCTNJm6YvCLcAKl1AQg8qfwhkFOuqsriNFaVw70kmJuOK1/PBmIFVnQElWVhWWN
 M4WkILKO4rwkowxqAW6DzXpvYxl25V0/m+efnEeIeqO3AyjXaQKF6g6YyHQVzyiRN9j3
 P+/+iUhqbuV1kvSleSJIMbLmv1hbspyN7e4SZatecuDXFYTgcr+zMiTl9VBUxkl6+B2l
 6bnlIFWbs4+RJQ/4O1BG0dXysAJqaYxuxUGegoOLfoE2yRHxfe1KZd2rjbPMXO4RQ50Z
 c/dIdScvNdkySyPd8cZyRq3t66h5ZclGU77xYC2+n89j8fi33PeibfqK0VBCGnI+J/gZ Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xakm584up-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Jan 2020 14:29:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3D64710002A;
        Mon,  6 Jan 2020 14:29:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3037F2D378B;
        Mon,  6 Jan 2020 14:29:44 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 6 Jan 2020 14:29:43
 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: [PATCH 6/6] ARM: dts: stm32: add wakeup-source in all I2C nodes of stm32mp157c
Date:   Mon, 6 Jan 2020 14:28:34 +0100
Message-ID: <1578317314-17197-7-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578317314-17197-1-git-send-email-alain.volmat@st.com>
References: <1578317314-17197-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_04:2020-01-06,2020-01-06 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the wakeup-source property in all i2c nodes of
the SoC stm32mp157c so that those I2C controllers can become
wakeup-source.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 3dd570b10181..5706c4f41b0b 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -483,6 +483,7 @@
 			resets = <&rcc I2C1_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			wakeup-source;
 			status = "disabled";
 		};
 
@@ -496,6 +497,7 @@
 			resets = <&rcc I2C2_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			wakeup-source;
 			status = "disabled";
 		};
 
@@ -509,6 +511,7 @@
 			resets = <&rcc I2C3_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			wakeup-source;
 			status = "disabled";
 		};
 
@@ -522,6 +525,7 @@
 			resets = <&rcc I2C5_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			wakeup-source;
 			status = "disabled";
 		};
 
@@ -1473,6 +1477,7 @@
 			resets = <&rcc I2C4_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			wakeup-source;
 			status = "disabled";
 		};
 
@@ -1508,6 +1513,7 @@
 			resets = <&rcc I2C6_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			wakeup-source;
 			status = "disabled";
 		};
 
-- 
2.7.4

