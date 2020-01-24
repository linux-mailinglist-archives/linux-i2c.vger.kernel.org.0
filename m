Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3620E1479D5
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2020 09:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgAXI5h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jan 2020 03:57:37 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:5448 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725787AbgAXI5h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jan 2020 03:57:37 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00O8qWRa022445;
        Fri, 24 Jan 2020 09:57:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=pTHPVX7/gaXr9zuXZ4ds+Q85JK3nKgeefdELPART7X0=;
 b=HNjl9N/J7l2hCuZlbTNtRTBHqnJ5tgJ7ZvWukjVm73s4MqeWaIxEw8qwQcrv9rxaGhZv
 1baVcM1PSf0fE9P1YBvaRQWlJMyiDRVGoXevVK/INT18medgTHZYVKz/i6jBoakY/gZQ
 /q2HoMszTvxrbbHB03am52hu1XKy4OHzm82pz8aruYujQoyGtpHi7pDMXSsq8lC3mMVo
 u9FWfZGf+St9dfqOn9AcwEIvB08f85iMKwwWOlTjuYpwVvSGd8NxjMbRVIe+11wkQB/5
 7wMS/a0C8yFQlp0uzwHuSbZwZup3JDWcpUSv3K57DFcQ9Hj1eMHphwMmxrliVZ5mXIsy zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xkr1eey68-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Jan 2020 09:57:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EE4E110002A;
        Fri, 24 Jan 2020 09:57:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE96D210F99;
        Fri, 24 Jan 2020 09:57:21 +0100 (CET)
Received: from SFHDAG5NODE2.st.com (10.75.127.14) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 24 Jan
 2020 09:57:21 +0100
Received: from SFHDAG5NODE2.st.com ([fe80::1cb5:6767:370b:9af0]) by
 SFHDAG5NODE2.st.com ([fe80::1cb5:6767:370b:9af0%20]) with mapi id
 15.00.1473.003; Fri, 24 Jan 2020 09:57:21 +0100
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
To:     Alain VOLMAT <alain.volmat@st.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Fabrice GASNIER <fabrice.gasnier@st.com>
Subject: RE: [PATCH 5/5] ARM: dts: stm32: add Fast Mode Plus info in I2C nodes
 of stm32mp151
Thread-Topic: [PATCH 5/5] ARM: dts: stm32: add Fast Mode Plus info in I2C
 nodes of stm32mp151
Thread-Index: AQHV0ggGJuzCPj0St021atB5ZULrDaf5hHuA
Date:   Fri, 24 Jan 2020 08:57:21 +0000
Message-ID: <c7e1ed1294894d5697c649a26f82f498@SFHDAG5NODE2.st.com>
References: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
 <1579795970-22319-6-git-send-email-alain.volmat@st.com>
In-Reply-To: <1579795970-22319-6-git-send-email-alain.volmat@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-24_02:2020-01-24,2020-01-24 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Ok pour la serie

-----Original Message-----
From: Alain VOLMAT <alain.volmat@st.com>=20
Sent: jeudi 23 janvier 2020 17:13
To: wsa@the-dreams.de; robh+dt@kernel.org
Cc: mark.rutland@arm.com; Pierre Yves MORDRET <pierre-yves.mordret@st.com>;=
 mcoquelin.stm32@gmail.com; Alexandre TORGUE <alexandre.torgue@st.com>; lin=
ux-i2c@vger.kernel.org; devicetree@vger.kernel.org; linux-stm32@st-md-mailm=
an.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-kernel@vger.=
kernel.org; Fabrice GASNIER <fabrice.gasnier@st.com>; Alain VOLMAT <alain.v=
olmat@st.com>
Subject: [PATCH 5/5] ARM: dts: stm32: add Fast Mode Plus info in I2C nodes =
of stm32mp151

Add the syscfg-fmp property in each i2c node in order to allow Fast Mode Pl=
us speed if clock-frequency >=3D 1MHz is indicated.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp1=
51.dtsi
index 2dbf32ca9b36..ecd0a932aa78 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -483,6 +483,7 @@
 			resets =3D <&rcc I2C1_R>;
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
+			st,syscfg-fmp =3D <&syscfg 0x4 0x1>;
 			wakeup-source;
 			status =3D "disabled";
 		};
@@ -497,6 +498,7 @@
 			resets =3D <&rcc I2C2_R>;
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
+			st,syscfg-fmp =3D <&syscfg 0x4 0x2>;
 			wakeup-source;
 			status =3D "disabled";
 		};
@@ -511,6 +513,7 @@
 			resets =3D <&rcc I2C3_R>;
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
+			st,syscfg-fmp =3D <&syscfg 0x4 0x4>;
 			wakeup-source;
 			status =3D "disabled";
 		};
@@ -525,6 +528,7 @@
 			resets =3D <&rcc I2C5_R>;
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
+			st,syscfg-fmp =3D <&syscfg 0x4 0x10>;
 			wakeup-source;
 			status =3D "disabled";
 		};
@@ -1477,6 +1481,7 @@
 			resets =3D <&rcc I2C4_R>;
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
+			st,syscfg-fmp =3D <&syscfg 0x4 0x8>;
 			wakeup-source;
 			status =3D "disabled";
 		};
@@ -1513,6 +1518,7 @@
 			resets =3D <&rcc I2C6_R>;
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
+			st,syscfg-fmp =3D <&syscfg 0x4 0x20>;
 			wakeup-source;
 			status =3D "disabled";
 		};
--
2.7.4

