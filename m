Return-Path: <linux-i2c+bounces-6085-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9BA96ABB2
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 00:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7330A1C24575
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 22:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0724A1D5CE5;
	Tue,  3 Sep 2024 22:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nyM2fDv1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8B420E3;
	Tue,  3 Sep 2024 22:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725401048; cv=none; b=LvEv6OFIIxmnB41YTa3TuNJF2A1tEFSQ+9qoCxS28SkW8dWerOuvCfGVHSyTJSDHQY8q69jLfFS/vTmCORbM2FitgHLupS6XMgvaltwdWvjPrbgXDmFY/F/zKprPs02voLoh5oUU2uXptSaxCX2RnLIV/18TbXFYgU3TBY/ShRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725401048; c=relaxed/simple;
	bh=hTzfh1X7AV9AVwJgppKHfCHUzLeVyNzyKrKF5CTWCCg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c93EuH3oabdU6HxaVRpTD5RV1L1/gVk27PbNpJ1v40VDW4FCZKNL0vcAcysVYh25s1QT0tATxNtI/ThmLKdQJLKRTMYCQhB/U+zv7kqZjANB2/fgYzoDe8sKePgTjyPs3kmo8l9lXS/FC+i7JlMs5hIfy5gxt6hHJkEPaFk8kms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nyM2fDv1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483LB1aK013444;
	Tue, 3 Sep 2024 22:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JmgFo8zWb1fW/+LsoC/IUUmqxS31j6PEdGfo4IS29KY=; b=nyM2fDv1gLprn3I9
	GqHSCUyIYoK1aZuyLRvtdlLoBv/SSBwXhXBiCRB+4DuYhpDqmuHIRYQHS8JZOqB7
	VtCE1f9gG1i/RMQksnetnGKKCtsb/skoMMw5yHAiQnZUwqRI4xz7MjICXePQQFRe
	R+rYXOMBzpUGef99AYrLja3yfGx1IjJhqSlG4j7jzaM0aPxuXTdzMJxE3AKaZV+/
	78a0D/zpnNkD45ouZHWTWxUZT0yLWEzZS97KGdYGGMXhWr+gjXfXK/thOcEnJqAg
	kfVcna1/mrTsVLJtaXOZbMaaW/AniBRdFXCHHqEV0locIrxBMU1lV6GV+0YPtHYe
	8Q9kIw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41btrxrucv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 22:03:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483M3Hic002738
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 22:03:17 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Sep 2024 15:03:12 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <quic_nkela@quicinc.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>, <sudeep.holla@arm.com>, <andi.shyti@kernel.org>,
        <tglx@linutronix.de>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jassisinghbrar@gmail.com>, <lee@kernel.org>,
        <linus.walleij@linaro.org>, <amitk@kernel.org>,
        <thara.gopinath@gmail.com>, <broonie@kernel.org>,
        <cristian.marussi@arm.com>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <iommu@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
Subject: [PATCH v2 21/21] arm64: dts: qcom: Add reduced functional DT for SA8255p Ride platform
Date: Tue, 3 Sep 2024 15:02:40 -0700
Message-ID: <20240903220240.2594102-22-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903220240.2594102-1-quic_nkela@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Wkk3So9U7pS4bUXDJ3OSReDGe_8tZgSw
X-Proofpoint-ORIG-GUID: Wkk3So9U7pS4bUXDJ3OSReDGe_8tZgSw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_10,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409030177

SA8255p Ride platform is an automotive virtual platform. This platform
abstracts resources such as clocks, regulators etc. in the firmware VM.
The device drivers request resources operations over SCMI using power,
performance, reset and sensor protocols.

Multiple virtual SCMI instances are being employed for greater parallelism.
These instances are tied to devices such that devices can have dedicated
SCMI channel. Firmware VM (runs SCMI platform stack) is SMP enabled and
can process requests from agents in parallel. Qualcomm smc transport is
used for communication between SCMI agent and platform.

Let's add the reduced functional support for SA8255p Ride board.
Subsequently, the support for PCIe, USB, UFS, Ethernet will be added.

Co-developed-by: Shazad Hussain <quic_shazhuss@quicinc.com>
Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |    1 +
 arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi |   80 +
 arch/arm64/boot/dts/qcom/sa8255p-ride.dts   |  148 ++
 arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi  | 2312 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8255p.dtsi       | 2405 +++++++++++++++++++
 5 files changed, 4946 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8255p.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index ae002c7cf126..38e9bf09961d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -119,6 +119,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sa8255p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
diff --git a/arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi
new file mode 100644
index 000000000000..fb268d13b997
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/ {
+	thermal-zones {
+		pmm8654au_0_thermal: pm8255-0-thermal {
+			polling-delay-passive = <100>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_1_thermal: pm8255-1-thermal {
+			polling-delay-passive = <100>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_2_thermal: pm8255-2-thermal {
+			polling-delay-passive = <100>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_3_thermal: pm8255-3-thermal {
+			polling-delay-passive = <100>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
new file mode 100644
index 000000000000..771e8a21484f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "sa8255p.dtsi"
+#include "sa8255p-pmics.dtsi"
+#include "sa8255p-scmi.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SA8255P Ride";
+	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
+
+	aliases {
+		i2c11 = &i2c11;
+		i2c18 = &i2c18;
+		serial0 = &uart10;
+		serial1 = &uart4;
+		spi16 = &spi16;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&adreno_smmu {
+	power-domains = <&scmi15_pd 0>;
+
+	status = "okay";
+};
+
+&gpll0_board_clk {
+	clock-frequency = <300000000>;
+};
+
+&i2c11 {
+	clock-frequency = <400000>;
+	power-domains = <&scmi9_pd 11>;
+
+	status = "okay";
+};
+
+&i2c18 {
+	clock-frequency = <400000>;
+	power-domains = <&scmi9_pd 18>;
+
+	status = "okay";
+};
+
+&pmm8654au_0_thermal {
+	thermal-sensors = <&scmi23_sensor 0>;
+};
+
+&pmm8654au_1_thermal {
+	thermal-sensors = <&scmi23_sensor 1>;
+};
+
+&pmm8654au_2_thermal {
+	thermal-sensors = <&scmi23_sensor 2>;
+};
+
+&pmm8654au_3_thermal {
+	thermal-sensors = <&scmi23_sensor 3>;
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&qupv3_id_2 {
+	status = "okay";
+};
+
+&scmi9 {
+	status = "okay";
+};
+
+&scmi10 {
+	status = "okay";
+};
+
+&scmi11 {
+	status = "okay";
+};
+
+&scmi15 {
+	status = "okay";
+};
+
+&scmi23 {
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&spi16 {
+	power-domains = <&scmi10_pd 16>, <&scmi10_dvfs 16>;
+	power-domain-names = "power", "perf";
+
+	status = "okay";
+};
+
+&tlmm {
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio8";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio9";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+};
+
+&uart4 {
+	power-domains = <&scmi11_pd 4>, <&scmi11_dvfs 4>;
+	power-domain-names = "power", "perf";
+
+	status = "okay";
+};
+
+&uart10 {
+	power-domains = <&scmi11_pd 10>, <&scmi11_dvfs 10>;
+	power-domain-names = "power", "perf";
+
+	status = "okay";
+};
+
+&xo_board_clk {
+	clock-frequency = <38400000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi b/arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi
new file mode 100644
index 000000000000..a470b68ea4de
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi
@@ -0,0 +1,2312 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+&firmware {
+	scmi0: scmi-0 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem0>;
+
+		interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi0_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi0_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi0_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi1: scmi-1 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem1>;
+
+		interrupts = <GIC_SPI 964 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi1_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi1_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi1_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi2: scmi-2 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem2>;
+
+		interrupts = <GIC_SPI 965 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi2_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi2_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi2_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi3: scmi-3 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem3>;
+
+		interrupts = <GIC_SPI 966 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi3_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi3_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi3_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi4: scmi-4 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem4>;
+
+		interrupts = <GIC_SPI 967 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi4_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi4_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi4_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi5: scmi-5 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem5>;
+
+		interrupts = <GIC_SPI 968 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi5_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi5_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi5_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi6: scmi-6 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem6>;
+
+		interrupts = <GIC_SPI 969 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi6_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi6_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi6_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi7: scmi-7 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem7>;
+
+		interrupts = <GIC_SPI 970 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi7_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi7_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi7_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi8: scmi-8 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem8>;
+
+		interrupts = <GIC_SPI 971 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi8_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi8_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi8_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi9: scmi-9 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem9>;
+
+		interrupts = <GIC_SPI 972 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi9_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi9_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi9_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi10: scmi-10 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem10>;
+
+		interrupts = <GIC_SPI 973 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi10_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi10_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi10_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi11: scmi-11 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem11>;
+
+		interrupts = <GIC_SPI 974 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi11_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi11_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi11_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi12: scmi-12 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem12>;
+
+		interrupts = <GIC_SPI 975 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi12_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi12_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi12_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi13: scmi-13 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem13>;
+
+		interrupts = <GIC_SPI 976 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi13_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi13_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi13_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi14: scmi-14 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem14>;
+
+		interrupts = <GIC_SPI 977 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi14_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi14_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi14_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi15: scmi-15 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem15>;
+
+		interrupts = <GIC_SPI 978 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi15_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi15_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi15_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi16: scmi-16 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem16>;
+
+		interrupts = <GIC_SPI 979 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi16_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi16_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi16_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi17: scmi-17 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem17>;
+
+		interrupts = <GIC_SPI 980 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi17_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi17_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi17_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi18: scmi-18 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem18>;
+
+		interrupts = <GIC_SPI 981 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi18_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi18_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi18_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi19: scmi-19 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem19>;
+
+		interrupts = <GIC_SPI 982 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi19_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi19_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi19_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi20: scmi-20 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem20>;
+
+		interrupts = <GIC_SPI 983 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi20_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi20_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi20_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi21: scmi-21 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem21>;
+
+		interrupts = <GIC_SPI 984 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi21_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi21_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi21_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi22: scmi-22 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem22>;
+
+		interrupts = <GIC_SPI 985 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi22_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi22_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi22_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi23: scmi-23 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem23>;
+
+		interrupts = <GIC_SPI 986 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi23_sensor: protocol@15 {
+			reg = <0x15>;
+			#thermal-sensor-cells = <1>;
+		};
+	};
+
+	scmi24: scmi-24 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem24>;
+
+		interrupts = <GIC_SPI 987 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi24_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi24_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi24_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi25: scmi-25 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem25>;
+
+		interrupts = <GIC_ESPI 0 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi25_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi25_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi25_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi26: scmi-26 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem26>;
+
+		interrupts = <GIC_ESPI 1 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi26_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi26_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi26_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi27: scmi-27 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem27>;
+
+		interrupts = <GIC_ESPI 2 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi27_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi27_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi27_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi28: scmi-28 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem28>;
+
+		interrupts = <GIC_ESPI 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi28_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi28_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi28_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi29: scmi-29 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem29>;
+
+		interrupts = <GIC_ESPI 4 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi29_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi29_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi29_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi30: scmi-30 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem30>;
+
+		interrupts = <GIC_ESPI 5 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi30_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi30_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi30_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi31: scmi-31 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem31>;
+
+		interrupts = <GIC_ESPI 6 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi31_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi31_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi31_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi32: scmi-32 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem32>;
+
+		interrupts = <GIC_ESPI 7 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi32_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi32_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi32_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi33: scmi-33 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem33>;
+
+		interrupts = <GIC_ESPI 8 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi33_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi33_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi33_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi34: scmi-34 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem34>;
+
+		interrupts = <GIC_ESPI 9 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi34_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi34_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi34_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi35: scmi-35 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem35>;
+
+		interrupts = <GIC_ESPI 10 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi35_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi35_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi35_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi36: scmi-36 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem36>;
+
+		interrupts = <GIC_ESPI 11 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi36_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi36_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi36_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi37: scmi-37 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem37>;
+
+		interrupts = <GIC_ESPI 12 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi37_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi37_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi37_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi38: scmi-38 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem38>;
+
+		interrupts = <GIC_ESPI 13 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi38_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi38_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi38_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi39: scmi-39 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem39>;
+
+		interrupts = <GIC_ESPI 14 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi39_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi39_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi39_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi40: scmi-40 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem40>;
+
+		interrupts = <GIC_ESPI 15 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi40_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi40_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi40_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi41: scmi-41 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem41>;
+
+		interrupts = <GIC_ESPI 16 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi41_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi41_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi41_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi42: scmi-42 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem42>;
+
+		interrupts = <GIC_ESPI 17 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi42_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi42_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi42_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi43: scmi-43 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem43>;
+
+		interrupts = <GIC_ESPI 18 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi43_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi43_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi43_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi44: scmi-44 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem44>;
+
+		interrupts = <GIC_ESPI 19 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi44_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi44_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi44_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi45: scmi-45 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem45>;
+
+		interrupts = <GIC_ESPI 20 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi45_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi45_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi45_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi46: scmi-46 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem46>;
+
+		interrupts = <GIC_ESPI 21 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi46_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi46_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi46_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi47: scmi-47 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem47>;
+
+		interrupts = <GIC_ESPI 22 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi47_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi47_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi47_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi48: scmi-48 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem48>;
+
+		interrupts = <GIC_ESPI 23 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi48_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi48_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi48_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi49: scmi-49 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem49>;
+
+		interrupts = <GIC_ESPI 24 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi49_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi49_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi49_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi50: scmi-50 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem50>;
+
+		interrupts = <GIC_ESPI 25 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi50_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi50_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi50_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi51: scmi-51 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem51>;
+
+		interrupts = <GIC_ESPI 26 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi51_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi51_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi51_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi52: scmi-52 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem52>;
+
+		interrupts = <GIC_ESPI 27 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi52_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi52_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi52_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi53: scmi-53 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem53>;
+
+		interrupts = <GIC_ESPI 28 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi53_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi53_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi53_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi54: scmi-54 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem54>;
+
+		interrupts = <GIC_ESPI 29 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi54_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi54_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi54_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi55: scmi-55 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem55>;
+
+		interrupts = <GIC_ESPI 30 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi55_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi55_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi55_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi56: scmi-56 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem56>;
+
+		interrupts = <GIC_ESPI 31 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi56_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi56_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi56_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi57: scmi-57 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem57>;
+
+		interrupts = <GIC_ESPI 32 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi57_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi57_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi57_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi58: scmi-58 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem58>;
+
+		interrupts = <GIC_ESPI 33 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi58_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi58_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi58_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi59: scmi-59 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem59>;
+
+		interrupts = <GIC_ESPI 34 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi59_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi59_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi59_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi60: scmi-60 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem60>;
+
+		interrupts = <GIC_ESPI 35 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi60_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi60_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi60_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi61: scmi-61 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem61>;
+
+		interrupts = <GIC_ESPI 36 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi61_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi61_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi61_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi62: scmi-62 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem62>;
+
+		interrupts = <GIC_ESPI 37 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi62_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi62_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi62_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+
+	scmi63: scmi-63 {
+		compatible = "qcom,scmi-smc";
+		arm,smc-id = <0xc6008012>;
+		shmem = <&shmem63>;
+
+		interrupts = <GIC_ESPI 38 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "a2p";
+
+		max-rx-timeout-ms = <3000>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+
+		scmi63_pd: protocol@11 {
+			reg = <0x11>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi63_dvfs: protocol@13 {
+			reg = <0x13>;
+			#power-domain-cells = <1>;
+		};
+
+		scmi63_rst: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
+	};
+};
+
+&soc {
+	sram@d0000000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "mmio-sram";
+		reg = <0x0 0xd0000000 0x0 0x40000>;
+		ranges = <0x0 0x0 0x0 0xffffffff>;
+
+		shmem0: scmi-sram@d0000000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0000000 0x1000>;
+		};
+
+		shmem1: scmi-sram@d0001000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0001000 0x1000>;
+		};
+
+		shmem2: scmi-sram@d0002000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0002000 0x1000>;
+		};
+
+		shmem3: scmi-sram@d0003000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0003000 0x1000>;
+		};
+
+		shmem4: scmi-sram@d0004000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0004000 0x1000>;
+		};
+
+		shmem5: scmi-sram@d0005000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0005000 0x1000>;
+		};
+
+		shmem6: scmi-sram@d0006000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0006000 0x1000>;
+		};
+
+		shmem7: scmi-sram@d0007000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0007000 0x1000>;
+		};
+
+		shmem8: scmi-sram@d0008000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0008000 0x1000>;
+		};
+
+		shmem9: scmi-sram@d0009000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0009000 0x1000>;
+		};
+
+		shmem10: scmi-sram@d000a000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd000a000 0x1000>;
+		};
+
+		shmem11: scmi-sram@d000b000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd000b000 0x1000>;
+		};
+
+		shmem12: scmi-sram@d000c000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd000c000 0x1000>;
+		};
+
+		shmem13: scmi-sram@d000d000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd000d000 0x1000>;
+		};
+
+		shmem14: scmi-sram@d000e000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd000e000 0x1000>;
+		};
+
+		shmem15: scmi-sram@d000f000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd000f000 0x1000>;
+		};
+
+		shmem16: scmi-sram@d0010000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0010000 0x1000>;
+		};
+
+		shmem17: scmi-sram@d0011000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0011000 0x1000>;
+		};
+
+		shmem18: scmi-sram@d0012000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0012000 0x1000>;
+		};
+
+		shmem19: scmi-sram@d0013000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0013000 0x1000>;
+		};
+
+		shmem20: scmi-sram@d0014000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0014000 0x1000>;
+		};
+
+		shmem21: scmi-sram@d0015000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0015000 0x1000>;
+		};
+
+		shmem22: scmi-sram@d0016000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0016000 0x1000>;
+		};
+
+		shmem23: scmi-sram@d0017000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0017000 0x1000>;
+		};
+
+		shmem24: scmi-sram@d0018000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0018000 0x1000>;
+		};
+
+		shmem25: scmi-sram@d0019000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0019000 0x1000>;
+		};
+
+		shmem26: scmi-sram@d001a000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd001a000 0x1000>;
+		};
+
+		shmem27: scmi-sram@d001b000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd001b000 0x1000>;
+		};
+
+		shmem28: scmi-sram@d001c000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd001c000 0x1000>;
+		};
+
+		shmem29: scmi-sram@d001d000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd001d000 0x1000>;
+		};
+
+		shmem30: scmi-sram@d001e000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd001e000 0x1000>;
+		};
+
+		shmem31: scmi-sram@d001f000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd001f000 0x1000>;
+		};
+
+		shmem32: scmi-sram@d0020000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0020000 0x1000>;
+		};
+
+		shmem33: scmi-sram@d0021000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0021000 0x1000>;
+		};
+
+		shmem34: scmi-sram@d0022000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0022000 0x1000>;
+		};
+
+		shmem35: scmi-sram@d0023000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0023000 0x1000>;
+		};
+
+		shmem36: scmi-sram@d0024000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0024000 0x1000>;
+		};
+
+		shmem37: scmi-sram@d0025000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0025000 0x1000>;
+		};
+
+		shmem38: scmi-sram@d0026000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0026000 0x1000>;
+		};
+
+		shmem39: scmi-sram@d0027000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0027000 0x1000>;
+		};
+
+		shmem40: scmi-sram@d0028000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0028000 0x1000>;
+		};
+
+		shmem41: scmi-sram@d0029000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0029000 0x1000>;
+		};
+
+		shmem42: scmi-sram@d002a000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd002a000 0x1000>;
+		};
+
+		shmem43: scmi-sram@d002b000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd002b000 0x1000>;
+		};
+
+		shmem44: scmi-sram@d002c000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd002c000 0x1000>;
+		};
+
+		shmem45: scmi-sram@d002d000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd002d000 0x1000>;
+		};
+
+		shmem46: scmi-sram@d002e000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd002e000 0x1000>;
+		};
+
+		shmem47: scmi-sram@d002f000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd002f000 0x1000>;
+		};
+
+		shmem48: scmi-sram@d0030000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0030000 0x1000>;
+		};
+
+		shmem49: scmi-sram@d0031000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0031000 0x1000>;
+		};
+
+		shmem50: scmi-sram@d0032000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0032000 0x1000>;
+		};
+
+		shmem51: scmi-sram@d0033000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0033000 0x1000>;
+		};
+
+		shmem52: scmi-sram@d0034000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0034000 0x1000>;
+		};
+
+		shmem53: scmi-sram@d0035000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0035000 0x1000>;
+		};
+
+		shmem54: scmi-sram@d0036000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0036000 0x1000>;
+		};
+
+		shmem55: scmi-sram@d0037000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0037000 0x1000>;
+		};
+
+		shmem56: scmi-sram@d0038000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0038000 0x1000>;
+		};
+
+		shmem57: scmi-sram@d0039000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd0039000 0x1000>;
+		};
+
+		shmem58: scmi-sram@d003a000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd003a000 0x1000>;
+		};
+
+		shmem59: scmi-sram@d003b000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd003b000 0x1000>;
+		};
+
+		shmem60: scmi-sram@d003c000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd003c000 0x1000>;
+		};
+
+		shmem61: scmi-sram@d003d000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd003d000 0x1000>;
+		};
+
+		shmem62: scmi-sram@d003e000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd003e000 0x1000>;
+		};
+
+		shmem63: scmi-sram@d003f000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0xd003f000 0x1000>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sa8255p.dtsi b/arch/arm64/boot/dts/qcom/sa8255p.dtsi
new file mode 100644
index 000000000000..0c85262a4337
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8255p.dtsi
@@ -0,0 +1,2405 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/mailbox/qcom-ipcc.h>
+
+/ {
+	interrupt-parent = <&intc>;
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clocks {
+		xo_board_clk: xo-board-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+		gpll0_board_clk: gpll0-board-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			clocks = <&xo_board_clk>;
+			clock-mult = <1>;
+			clock-div = <2>;
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "qcom,kryo";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			next-level-cache = <&L2_0>;
+			L2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3_0>;
+				L3_0: l3-cache {
+					compatible = "cache";
+					cache-level = <3>;
+					cache-unified;
+				};
+			};
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "qcom,kryo";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			next-level-cache = <&L2_1>;
+			L2_1: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "qcom,kryo";
+			reg = <0x0 0x200>;
+			enable-method = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			next-level-cache = <&L2_2>;
+			L2_2: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "qcom,kryo";
+			reg = <0x0 0x300>;
+			enable-method = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			next-level-cache = <&L2_3>;
+			L2_3: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		cpu4: cpu@10000 {
+			device_type = "cpu";
+			compatible = "qcom,kryo";
+			reg = <0x0 0x10000>;
+			enable-method = "psci";
+			qcom,freq-domain = <&cpufreq_hw 1>;
+			next-level-cache = <&L2_4>;
+			L2_4: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3_1>;
+				L3_1: l3-cache {
+					compatible = "cache";
+					cache-level = <3>;
+					cache-unified;
+				};
+
+			};
+		};
+
+		cpu5: cpu@10100 {
+			device_type = "cpu";
+			compatible = "qcom,kryo";
+			reg = <0x0 0x10100>;
+			enable-method = "psci";
+			qcom,freq-domain = <&cpufreq_hw 1>;
+			next-level-cache = <&L2_5>;
+			L2_5: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3_1>;
+			};
+		};
+
+		cpu6: cpu@10200 {
+			device_type = "cpu";
+			compatible = "qcom,kryo";
+			reg = <0x0 0x10200>;
+			enable-method = "psci";
+			qcom,freq-domain = <&cpufreq_hw 1>;
+			next-level-cache = <&L2_6>;
+			L2_6: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3_1>;
+			};
+		};
+
+		cpu7: cpu@10300 {
+			device_type = "cpu";
+			compatible = "qcom,kryo";
+			reg = <0x0 0x10300>;
+			enable-method = "psci";
+			qcom,freq-domain = <&cpufreq_hw 1>;
+			next-level-cache = <&L2_7>;
+			L2_7: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&L3_1>;
+			};
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+
+				core1 {
+					cpu = <&cpu5>;
+				};
+
+				core2 {
+					cpu = <&cpu6>;
+				};
+
+				core3 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+	};
+
+	firmware: firmware {
+		scm {
+			compatible = "qcom,scm-sa8255p", "qcom,scm";
+			memory-region = <&tz_ffi_mem>;
+			qcom,dload-mode = <&tcsr 0x13000>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		sail_ss_mem: sail-ss@80000000 {
+			reg = <0x0 0x80000000 0x0 0x10000000>;
+			no-map;
+		};
+
+		hyp_mem: hyp@90000000 {
+			reg = <0x0 0x90000000 0x0 0x600000>;
+			no-map;
+		};
+
+		xbl_boot_mem: xbl-boot@90600000 {
+			reg = <0x0 0x90600000 0x0 0x200000>;
+			no-map;
+		};
+
+		aop_image_mem: aop-image@90800000 {
+			reg = <0x0 0x90800000 0x0 0x60000>;
+			no-map;
+		};
+
+		aop_cmd_db_mem: aop-cmd-db@90860000 {
+			compatible = "qcom,cmd-db";
+			reg = <0x0 0x90860000 0x0 0x20000>;
+			no-map;
+		};
+
+		uefi_log: uefi-log@908b0000 {
+			reg = <0x0 0x908b0000 0x0 0x10000>;
+			no-map;
+		};
+
+		ddr_training_checksum: ddr-training-checksum@908c0000 {
+			reg = <0x0 0x908c0000 0x0 0x1000>;
+			no-map;
+		};
+
+		reserved_mem: reserved@908f0000 {
+			reg = <0x0 0x908f0000 0x0 0xe000>;
+			no-map;
+		};
+
+		secdata_apss_mem: secdata-apss@908fe000 {
+			reg = <0x0 0x908fe000 0x0 0x2000>;
+			no-map;
+		};
+
+		smem_mem: smem@90900000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x90900000 0x0 0x200000>;
+			no-map;
+			hwlocks = <&tcsr_mutex 3>;
+		};
+
+		tz_sail_mailbox_mem: tz-sail-mailbox@90c00000 {
+			reg = <0x0 0x90c00000 0x0 0x100000>;
+			no-map;
+		};
+
+		sail_mailbox_mem: sail-ss@90d00000 {
+			reg = <0x0 0x90d00000 0x0 0x100000>;
+			no-map;
+		};
+
+		sail_ota_mem: sail-ss@90e00000 {
+			reg = <0x0 0x90e00000 0x0 0x300000>;
+			no-map;
+		};
+
+		aoss_backup_mem: aoss-backup@91b00000 {
+			reg = <0x0 0x91b00000 0x0 0x40000>;
+			no-map;
+		};
+
+		cpucp_backup_mem: cpucp-backup@91b40000 {
+			reg = <0x0 0x91b40000 0x0 0x40000>;
+			no-map;
+		};
+
+		tz_config_backup_mem: tz-config-backup@91b80000 {
+			reg = <0x0 0x91b80000 0x0 0x10000>;
+			no-map;
+		};
+
+		ddr_training_data_mem: ddr-training-data@91b90000 {
+			reg = <0x0 0x91b90000 0x0 0x10000>;
+			no-map;
+		};
+
+		cdt_data_backup_mem: cdt-data-backup@91ba0000 {
+			reg = <0x0 0x91ba0000 0x0 0x1000>;
+			no-map;
+		};
+
+		tz_ffi_mem: tz-ffi@91c00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x91c00000 0x0 0x1400000>;
+			no-map;
+		};
+
+		lpass_machine_learning_mem: lpass-machine-learning@93b00000 {
+			reg = <0x0 0x93b00000 0x0 0xf00000>;
+			no-map;
+		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@94a00000 {
+			reg = <0x0 0x94a00000 0x0 0x800000>;
+			no-map;
+		};
+
+		pil_camera_mem: pil-camera@95200000 {
+			reg = <0x0 0x95200000 0x0 0x500000>;
+			no-map;
+		};
+
+		pil_adsp_mem: pil-adsp@95c00000 {
+			reg = <0x0 0x95c00000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_gdsp0_mem: pil-gdsp0@97b00000 {
+			reg = <0x0 0x97b00000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_gdsp1_mem: pil-gdsp1@99900000 {
+			reg = <0x0 0x99900000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_cdsp0_mem: pil-cdsp0@9b800000 {
+			reg = <0x0 0x9b800000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_gpu_mem: pil-gpu@9d600000 {
+			reg = <0x0 0x9d600000 0x0 0x2000>;
+			no-map;
+		};
+
+		pil_cdsp1_mem: pil-cdsp1@9d700000 {
+			reg = <0x0 0x9d700000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		pil_cvp_mem: pil-cvp@9f500000 {
+			reg = <0x0 0x9f500000 0x0 0x700000>;
+			no-map;
+		};
+
+		pil_video_mem: pil-video@9fc00000 {
+			reg = <0x0 0x9fc00000 0x0 0x700000>;
+			no-map;
+		};
+
+		audio_mdf_mem: audio-mdf-region@ae000000 {
+			reg = <0x0 0xae000000 0x0 0x1000000>;
+			no-map;
+		};
+
+		firmware_mem: firmware-region@b0000000 {
+			reg = <0x0 0xb0000000 0x0 0x800000>;
+			no-map;
+		};
+
+		hyptz_reserved_mem: hyptz-reserved@beb00000 {
+			reg = <0x0 0xbeb00000 0x0 0x11500000>;
+			no-map;
+		};
+
+		scmi_mem: scmi-region@d0000000 {
+			reg = <0x0 0xd0000000 0x0 0x40000>;
+			no-map;
+		};
+
+		firmware_logs_mem: firmware-logs@d0040000 {
+			reg = <0x0 0xd0040000 0x0 0x10000>;
+			no-map;
+		};
+
+		firmware_audio_mem: firmware-audio@d0050000 {
+			reg = <0x0 0xd0050000 0x0 0x4000>;
+			no-map;
+		};
+
+		firmware_reserved_mem: firmware-reserved@d0054000 {
+			reg = <0x0 0xd0054000 0x0 0x9c000>;
+			no-map;
+		};
+
+		firmware_quantum_test_mem: firmware-quantum-test@d00f0000 {
+			reg = <0x0 0xd00f0000 0x0 0x10000>;
+			no-map;
+		};
+
+		tags_mem: tags@d0100000 {
+			reg = <0x0 0xd0100000 0x0 0x1200000>;
+			no-map;
+		};
+
+		qtee_mem: qtee@d1300000 {
+			reg = <0x0 0xd1300000 0x0 0x500000>;
+			no-map;
+		};
+
+		deepsleep_backup_mem: deepsleep-backup@d1800000 {
+			reg = <0x0 0xd1800000 0x0 0x100000>;
+			no-map;
+		};
+
+		trusted_apps_mem: trusted-apps@d1900000 {
+			reg = <0x0 0xd1900000 0x0 0x3800000>;
+			no-map;
+		};
+
+		tz_stat_mem: tz-stat@db100000 {
+			reg = <0x0 0xdb100000 0x0 0x100000>;
+			no-map;
+		};
+
+		cpucp_fw_mem: cpucp-fw@db200000 {
+			reg = <0x0 0xdb200000 0x0 0x100000>;
+			no-map;
+		};
+
+		cma: linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x0 0xdfffffff>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x2000000>;
+			linux,cma-default;
+		};
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0 0 0 0 0x10 0>;
+
+		ipcc0: mailbox@408000 {
+			compatible = "qcom,sa8255p-ipcc", "qcom,ipcc";
+			reg = <0x0 0x00408000 0x0 0x1000>;
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#mbox-cells = <2>;
+		};
+
+		ipcc1: mailbox@488000 {
+			compatible = "qcom,sa8255p-ipcc", "qcom,ipcc";
+			reg = <0x0 0x00488000 0x0 0x1000>;
+			interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#mbox-cells = <2>;
+			status = "disabled";
+		};
+
+		qupv3_id_2: geniqup@8c0000 {
+			compatible = "qcom,sa8255p-geni-se-qup";
+			reg = <0x0 0x008c0000 0x0 0x6000>;
+			ranges;
+			iommus = <&apps_smmu 0x5a3 0x0>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			status = "disabled";
+
+			i2c14: i2c@880000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0x880000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi14: spi@880000 {
+				compatible = "qcom,sa8255p-geni-spi";
+				reg = <0x0 0x880000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart14: serial@880000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				reg = <0x0 0x00880000 0x0 0x4000>;
+				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c15: i2c@884000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0x884000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi15: spi@884000 {
+				compatible = "qcom,sa8255p-geni-spi";
+				reg = <0x0 0x884000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart15: serial@884000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				reg = <0x0 0x00884000 0x0 0x4000>;
+				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c16: i2c@888000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0x888000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi16: spi@888000 {
+				compatible = "qcom,sa8255p-geni-spi";
+				reg = <0x0 0x00888000 0x0 0x4000>;
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			uart16: serial@888000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				reg = <0x0 0x00888000 0x0 0x4000>;
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c17: i2c@88c000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0x88c000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi17: spi@88c000 {
+				compatible = "qcom,sa8255p-geni-spi";
+				reg = <0x0 0x88c000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart17: serial@88c000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				reg = <0x0 0x0088c000 0x0 0x4000>;
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c18: i2c@890000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0x00890000 0x0 0x4000>;
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spi18: spi@890000 {
+				compatible = "qcom,sa8255p-geni-spi";
+				reg = <0x0 0x890000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart18: serial@890000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				reg = <0x0 0x00890000 0x0 0x4000>;
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c19: i2c@894000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0x894000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi19: spi@894000 {
+				compatible = "qcom,sa8255p-geni-spi";
+				reg = <0x0 0x894000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart19: serial@894000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				reg = <0x0 0x00894000 0x0 0x4000>;
+				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c20: i2c@898000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0x898000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi20: spi@898000 {
+				compatible = "qcom,sa8255p-geni-spi";
+				reg = <0x0 0x898000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart20: serial@898000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				reg = <0x0 0x00898000 0x0 0x4000>;
+				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+		};
+
+		qupv3_id_0: geniqup@9c0000 {
+			compatible = "qcom,sa8255p-geni-se-qup";
+			reg = <0x0 0x9c0000 0x0 0x6000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			iommus = <&apps_smmu 0x403 0x0>;
+			status = "disabled";
+
+			i2c0: i2c@980000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0x980000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi0: spi@980000 {
+				compatible = "qcom,sa8255p-geni-spi";
+				reg = <0x0 0x980000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart0: serial@980000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				reg = <0x0 0x980000 0x0 0x4000>;
+				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@984000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0x984000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi1: spi@984000 {
+				compatible = "qcom,sa8255p-geni-spi";
+				reg = <0x0 0x984000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart1: serial@984000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				reg = <0x0 0x984000 0x0 0x4000>;
+				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@988000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0x988000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi2: spi@988000 {
+				compatible = "qcom,sa8255p-geni-spi";
+				reg = <0x0 0x988000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart2: serial@988000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				reg = <0x0 0x988000 0x0 0x4000>;
+				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c3: i2c@98c000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0x98c000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi3: spi@98c000 {
+				compatible = "qcom,sa8255p-geni-spi";
+				reg = <0x0 0x98c000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart3: serial@98c000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				reg = <0x0 0x98c000 0x0 0x4000>;
+				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c4: i2c@990000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0x990000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi4: spi@990000 {
+				compatible = "qcom,sa8255p-geni-spi";
+				reg = <0x0 0x990000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart4: serial@990000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				reg = <0x0 0x990000 0x0 0x4000>;
+				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c5: i2c@994000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0x994000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi5: spi@994000 {
+				compatible = "qcom,sa8255p-geni-spi";
+				reg = <0x0 0x994000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart5: serial@994000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				reg = <0x0 0x994000 0x0 0x4000>;
+				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+		};
+
+		qupv3_id_1: geniqup@ac0000 {
+			compatible = "qcom,sa8255p-geni-se-qup";
+			reg = <0x0 0x00ac0000 0x0 0x6000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			iommus = <&apps_smmu 0x443 0x0>;
+			status = "disabled";
+
+			i2c7: i2c@a80000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0xa80000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi7: spi@a80000 {
+				compatible = "qcom,sa8255p-geni-spi";
+				reg = <0x0 0xa80000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart7: serial@a80000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				reg = <0x0 0x00a80000 0x0 0x4000>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c8: i2c@a84000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0xa84000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi8: spi@a84000 {
+				compatible = "qcom,sa8255p-geni-spi";
+				reg = <0x0 0xa84000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart8: serial@a84000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				reg = <0x0 0x00a84000 0x0 0x4000>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c9: i2c@a88000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0xa88000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi9: spi@a88000 {
+				compatible = "qcom,sa8255p-geni-spi";
+				reg = <0x0 0xa88000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart9: serial@a88000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				reg = <0x0 0xa88000 0x0 0x4000>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c10: i2c@a8c000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0xa8c000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi10: spi@a8c000 {
+				compatible = "qcom,sa8255p-geni-spi";
+				reg = <0x0 0xa8c000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart10: serial@a8c000 {
+				compatible = "qcom,sa8255p-geni-debug-uart";
+				reg = <0x0 0x00a8c000 0x0 0x4000>;
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c11: i2c@a90000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0xa90000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi11: spi@a90000 {
+				compatible = "qcom,sa8255p-geni-spi";
+				reg = <0x0 0xa90000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart11: serial@a90000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				reg = <0x0 0x00a90000 0x0 0x4000>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c12: i2c@a94000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0xa94000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi12: spi@a94000 {
+				compatible = "qcom,sa8255p-geni-spi";
+				reg = <0x0 0xa94000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart12: serial@a94000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				reg = <0x0 0x00a94000 0x0 0x4000>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			i2c13: i2c@a98000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0xa98000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+		};
+
+		qupv3_id_3: geniqup@bc0000 {
+			compatible = "qcom,sa8255p-geni-se-qup";
+			reg = <0x0 0xbc0000 0x0 0x6000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			iommus = <&apps_smmu 0x43 0x0>;
+			status = "disabled";
+
+			i2c21: i2c@b80000 {
+				compatible = "qcom,sa8255p-geni-i2c";
+				reg = <0x0 0xb80000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			spi21: spi@b80000 {
+				compatible = "qcom,sa8255p-geni-spi";
+				reg = <0x0 0xb80000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			uart21: serial@b80000 {
+				compatible = "qcom,sa8255p-geni-uart";
+				reg = <0x0 0x00b80000 0x0 0x4000>;
+				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+		};
+
+		rng: rng@10d2000 {
+			compatible = "qcom,sa8255p-trng", "qcom,trng";
+			reg = <0x0 0x010d2000 0x0 0x1000>;
+		};
+
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x01f40000 0x0 0x20000>;
+			#hwlock-cells = <1>;
+		};
+
+		tcsr: syscon@1fc0000 {
+			compatible = "qcom,sa8255p-tcsr", "syscon";
+			reg = <0x0 0x1fc0000 0x0 0x30000>;
+		};
+
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,sa8255p-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x20000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <2>;
+			dma-coherent;
+			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sa8255p-pdc", "qcom,pdc";
+			reg = <0x0 0x0b220000 0x0 0x30000>,
+			      <0x0 0x17c000f0 0x0 0x64>;
+			qcom,pdc-ranges = <0 480 40>,
+					  <40 140 14>,
+					  <54 263 1>,
+					  <55 306 4>,
+					  <59 312 3>,
+					  <62 374 2>,
+					  <64 434 2>,
+					  <66 438 2>,
+					  <70 520 1>,
+					  <73 523 1>,
+					  <118 568 6>,
+					  <124 609 3>,
+					  <159 638 1>,
+					  <160 720 3>,
+					  <169 728 30>,
+					  <199 416 2>,
+					  <201 449 1>,
+					  <202 89 1>,
+					  <203 451 1>,
+					  <204 462 1>,
+					  <205 264 1>,
+					  <206 579 1>,
+					  <207 653 1>,
+					  <208 656 1>,
+					  <209 659 1>,
+					  <210 122 1>,
+					  <211 699 1>,
+					  <212 705 1>,
+					  <213 450 1>,
+					  <214 643 2>,
+					  <216 646 5>,
+					  <221 390 5>,
+					  <226 700 2>,
+					  <228 440 1>,
+					  <229 663 1>,
+					  <230 524 2>,
+					  <232 612 3>,
+					  <235 723 5>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
+		tsens2: thermal-sensor@c251000 {
+			compatible = "qcom,sa8255p-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c251000 0x0 0x1ff>,
+			      <0x0 0x0c224000 0x0 0x8>;
+			interrupts = <GIC_SPI 572 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 609 IRQ_TYPE_LEVEL_HIGH>;
+			#qcom,sensors = <13>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens3: thermal-sensor@c252000 {
+			compatible = "qcom,sa8255p-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c252000 0x0 0x1ff>,
+			      <0x0 0x0c225000 0x0 0x8>;
+			interrupts = <GIC_SPI 573 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 610 IRQ_TYPE_LEVEL_HIGH>;
+			#qcom,sensors = <13>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens0: thermal-sensor@c263000 {
+			compatible = "qcom,sa8255p-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c263000 0x0 0x1ff>,
+			      <0x0 0x0c222000 0x0 0x8>;
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
+			#qcom,sensors = <12>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c265000 {
+			compatible = "qcom,sa8255p-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c265000 0x0 0x1ff>,
+			      <0x0 0x0c223000 0x0 0x8>;
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
+			#qcom,sensors = <12>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
+		aoss_qmp: power-management@c300000 {
+			compatible = "qcom,sa8255p-aoss-qmp", "qcom,aoss-qmp";
+			reg = <0x0 0x0c300000 0x0 0x400>;
+			interrupts-extended = <&ipcc0 IPCC_CLIENT_AOP
+					       IPCC_MPROC_SIGNAL_GLINK_QMP
+					       IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&ipcc0 IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
+			#clock-cells = <0>;
+		};
+
+		tlmm: pinctrl@f000000 {
+			compatible = "qcom,sa8255p-tlmm", "qcom,sa8775p-tlmm";
+			reg = <0x0 0x0f000000 0x0 0x1000000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 149>;
+			wakeup-parent = <&pdc>;
+		};
+
+		apps_smmu: iommu@15000000 {
+			compatible = "qcom,sa8255p-smmu-500", "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x15000000 0x0 0x100000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <2>;
+
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 689 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 708 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 709 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 710 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 711 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 712 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 713 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 714 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 715 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 912 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 911 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 910 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 909 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 908 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 907 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 906 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 905 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 904 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 903 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 902 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 901 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 900 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 899 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 898 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 897 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 896 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 895 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 894 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 893 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 892 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 891 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		intc: interrupt-controller@17a00000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x17a00000 0x0 0x10000>,	/* GICD */
+			      <0x0 0x17a60000 0x0 0x100000>;	/* GICR * 8 */
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			#redistributor-regions = <1>;
+			redistributor-stride = <0x0 0x20000>;
+		};
+
+		watchdog@17c10000 {
+			compatible = "qcom,apss-wdt-sa8255p", "qcom,kpss-wdt";
+			reg = <0x0 0x17c10000 0x0 0x1000>;
+			clocks = <&sleep_clk>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
+		};
+
+		memtimer: timer@17c20000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0 0x17c20000 0x0 0x1000>;
+			ranges = <0x0 0x0 0x0 0x20000000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			frame@17c21000 {
+				reg = <0x17c21000 0x1000>,
+				      <0x17c22000 0x1000>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <0>;
+			};
+
+			frame@17c23000 {
+				reg = <0x17c23000 0x1000>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <1>;
+				status = "disabled";
+			};
+
+			frame@17c25000 {
+				reg = <0x17c25000 0x1000>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <2>;
+				status = "disabled";
+			};
+
+			frame@17c27000 {
+				reg = <0x17c27000 0x1000>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <3>;
+				status = "disabled";
+			};
+
+			frame@17c29000 {
+				reg = <0x17c29000 0x1000>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <4>;
+				status = "disabled";
+			};
+
+			frame@17c2b000 {
+				reg = <0x17c2b000 0x1000>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <5>;
+				status = "disabled";
+			};
+
+			frame@17c2d000 {
+				reg = <0x17c2d000 0x1000>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				frame-number = <6>;
+				status = "disabled";
+			};
+		};
+
+		cpufreq_hw: cpufreq@18591000 {
+			compatible = "qcom,sa8255p-cpufreq-epss",
+				     "qcom,cpufreq-epss";
+			reg = <0x0 0x18591000 0x0 0x1000>,
+			      <0x0 0x18593000 0x0 0x1000>;
+			reg-names = "freq-domain0", "freq-domain1";
+
+			clocks = <&bi_tcxo_div2>, <&gpll0_board_clk>;
+			clock-names = "xo", "alternate";
+
+			#freq-domain-cells = <1>;
+		};
+	};
+
+	thermal-zones {
+		aoss-0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-0-0-0-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-0-1-0-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-0-2-0-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-0-3-0-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-0-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-1-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-2-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		audio-thermal {
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		camss-0-thermal {
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pcie-0-thermal {
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpuss-0-0-thermal {
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		aoss-1-thermal {
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-0-0-1-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-0-1-1-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens1 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-0-2-1-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens1 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-0-3-1-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens1 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-3-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-4-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens1 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		gpuss-5-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens1 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens1 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		camss-1-thermal {
+			thermal-sensors = <&tsens1 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		pcie-1-thermal {
+			thermal-sensors = <&tsens1 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpuss-0-1-thermal {
+			thermal-sensors = <&tsens1 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		aoss-2-thermal {
+			thermal-sensors = <&tsens2 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-1-0-0-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens2 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-1-1-0-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens2 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-1-2-0-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens2 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-1-3-0-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens2 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsp-0-0-0-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens2 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsp-0-1-0-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens2 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsp-0-2-0-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens2 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsp-1-0-0-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens2 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsp-1-1-0-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens2 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsp-1-2-0-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens2 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		ddrss-0-thermal {
+			thermal-sensors = <&tsens2 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpuss-1-0-thermal {
+			thermal-sensors = <&tsens2 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		aoss-3-thermal {
+			thermal-sensors = <&tsens3 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-1-0-1-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens3 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-1-1-1-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens3 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-1-2-1-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens3 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu-1-3-1-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens3 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsp-0-0-1-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens3 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsp-0-1-1-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens3 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsp-0-2-1-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens3 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsp-1-0-1-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens3 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsp-1-1-1-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens3 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		nsp-1-2-1-thermal {
+			polling-delay-passive = <10>;
+
+			thermal-sensors = <&tsens3 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		ddrss-1-thermal {
+			thermal-sensors = <&tsens3 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpuss-1-1-thermal {
+			thermal-sensors = <&tsens3 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				trip-point1 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
+	arch_timer: timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};
-- 
2.34.1


