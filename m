Return-Path: <linux-i2c+bounces-847-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E1E814E86
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 18:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F061C286C0E
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 17:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81785482FE;
	Fri, 15 Dec 2023 17:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="xUGyJIo2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9739180E14;
	Fri, 15 Dec 2023 17:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3BFEqKhI028436;
	Fri, 15 Dec 2023 18:13:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=6AU3mM4W4Dpoj7He082seCwDnAZEhdu+kcbYvk2yFl8=; b=xU
	GyJIo2ahPSqlJydkQ5p2lhjm7fD/DUBsZbDFAFYYs2bG0gGsH69AjkITxW1fmcGZ
	u8PUjf8rqPOahUVoZxoVvK7QO0FwyyvLpgagHk8T6CzEENPLkj073nlJ/ZLLQiKn
	dEt3H4N3Ul3A60G+CcG0LaRz1+/haKTEKUPJbepQN5IoqILE0VENBGe+T142rnvk
	4Ga2vFlt+Zu3g/vWJ36RtfMI+nv7J1sJj7R43pbdBi38Q1DCzc3c/a61cQFwMvdt
	ri93r505g1yv7EjtLJGwfnJ4Rd/GIr0ImnNzQCwb3HdCU3nkbyiLoMlSlsCmGSbZ
	EkXBgklaKIiDU8m1+bjQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvehmu8mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 18:13:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E7BF8100052;
	Fri, 15 Dec 2023 18:12:59 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCB8423BE19;
	Fri, 15 Dec 2023 18:12:59 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Dec
 2023 18:12:59 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Pierre-Yves MORDRET
	<pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>
CC: Conor Dooley <conor@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 9/9] arm64: dts: st: add i2c2 / i2c8 properties on stm32mp257f-ev1
Date: Fri, 15 Dec 2023 18:06:13 +0100
Message-ID: <20231215170617.95868-10-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231215170617.95868-1-alain.volmat@foss.st.com>
References: <20231215170617.95868-1-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_10,2023-12-14_01,2023-05-22_02

Add properties for i2c2 and i2c8 available on the stm32mp257f-ev1.
i2c2 is enabled since several devices are attached to it while
i2c8 is kept disabled since only used via the gpio expansion connector.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index b2d3afb15758..0ea8e69bfb3d 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -55,6 +55,26 @@ &arm_wdt {
 	status = "okay";
 };
 
+&i2c2 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c2_pins_a>;
+	pinctrl-1 = <&i2c2_sleep_pins_a>;
+	i2c-scl-rising-time-ns = <100>;
+	i2c-scl-falling-time-ns = <13>;
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&i2c8 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c8_pins_a>;
+	pinctrl-1 = <&i2c8_sleep_pins_a>;
+	i2c-scl-rising-time-ns = <57>;
+	i2c-scl-falling-time-ns = <7>;
+	clock-frequency = <400000>;
+	status = "disabled";
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
-- 
2.25.1


