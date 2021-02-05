Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD9431071E
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Feb 2021 09:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhBEIxT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 03:53:19 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:53884 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229651AbhBEIxE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 Feb 2021 03:53:04 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1158ofSl025992;
        Fri, 5 Feb 2021 09:52:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=hZZHp1JpStDPwHbkG6Dc3WR7sLwf+/8Ce3BPuIJA6Mw=;
 b=hMF/sP5IBXJlIt2YgWNYk938KAJvAQt7WqLOz/8Z25zeOAPJaEcb4tKVECLkjrbvlQK1
 MT09T+rhgNmJZe3x6yRA2LsvQY5sseJcKA1I+jsjfHclXXVUMTX8giQDCjExCpsaF0Jd
 BYCN2S45OB0tl7HmuXiHJHZSfWpp78AWffwUkuDS1eeCq80nN6HLYVVLvyUS1RKQqDxl
 wRLTEn4490EQzOooUM2ABiNeIMXbzPlI/5arFwW4eGxgVhgkewvKZtuLsAfe+8vRbNKX
 zWQ5umUrQ7arX/88xN/0Ue6gC1ETjDwYP+Z5CSd+GP4lOq0tPZTh+3xcz8FM2SSHu2nt rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36ey7hev2g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 Feb 2021 09:52:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A9C8B10002A;
        Fri,  5 Feb 2021 09:52:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9C8DA221793;
        Fri,  5 Feb 2021 09:52:07 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 09:52:07
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
Subject: [PATCH 4/5] ARM: dts: stm32: enable the analog filter for all I2C nodes in stm32mp151
Date:   Fri, 5 Feb 2021 09:51:43 +0100
Message-ID: <1612515104-838-5-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-05_06:2021-02-05,2021-02-05 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Enable the analog filter for all I2C nodes of the stm32mp151.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 3c75abacb374..558fc8fb38b6 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -493,6 +493,7 @@
 			#size-cells = <0>;
 			st,syscfg-fmp = <&syscfg 0x4 0x1>;
 			wakeup-source;
+			i2c-analog-filter;
 			status = "disabled";
 		};
 
@@ -508,6 +509,7 @@
 			#size-cells = <0>;
 			st,syscfg-fmp = <&syscfg 0x4 0x2>;
 			wakeup-source;
+			i2c-analog-filter;
 			status = "disabled";
 		};
 
@@ -523,6 +525,7 @@
 			#size-cells = <0>;
 			st,syscfg-fmp = <&syscfg 0x4 0x4>;
 			wakeup-source;
+			i2c-analog-filter;
 			status = "disabled";
 		};
 
@@ -538,6 +541,7 @@
 			#size-cells = <0>;
 			st,syscfg-fmp = <&syscfg 0x4 0x10>;
 			wakeup-source;
+			i2c-analog-filter;
 			status = "disabled";
 		};
 
@@ -1533,6 +1537,7 @@
 			#size-cells = <0>;
 			st,syscfg-fmp = <&syscfg 0x4 0x8>;
 			wakeup-source;
+			i2c-analog-filter;
 			status = "disabled";
 		};
 
@@ -1570,6 +1575,7 @@
 			#size-cells = <0>;
 			st,syscfg-fmp = <&syscfg 0x4 0x20>;
 			wakeup-source;
+			i2c-analog-filter;
 			status = "disabled";
 		};
 
-- 
2.17.1

