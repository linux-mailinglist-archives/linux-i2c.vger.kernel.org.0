Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628E72CB652
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 09:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387837AbgLBIGS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 03:06:18 -0500
Received: from mail-bn7nam10on2068.outbound.protection.outlook.com ([40.107.92.68]:64224
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387654AbgLBIGS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 03:06:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0YriRyNs2QHgLSTKv+Rb5dyraSaYjxnZTdRmtfOBGiaGQKLvFuNpq29uJPpcPGb4QvdH5ZTSyvGrYAn4rk8K8Tp+vqvJHUJdPZcUaq5/eEYeDF2Tx+AWWM7GkZjOEs0rZN1jX531eORHiUuXtaQE5/qnEtIaFlWT/RmroofA1ja2j+2u7U2MDHqR7Fhdn2v2MtXtcEWwk9Cxl8vqfS22TodHNgykBO3KBcg5hLHo3MagBa1NOnYXTZZE9u26nAD5EDTCQQlFdvscp2vdlpAo1YuvsKVYTiGfC4FSGwHhgDMpdretiDsaWzVcFG2L9qXE8I6XSg0vx32C0pv/aA/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXZ2cqQb+PKX4OQqvpL1oiXVHTrIWB/tL9KWb3D3lYI=;
 b=a/eyfFKaKhq9ba5QSsbJT+LfANltGyBqR/hGOMDKykem0yG8rZjh7OGgcXB2PtVvehatxPietgPSPhusaqLILCqYCdLpmsgbSGzZyKO3FkZUXqSmk1JHcHC7KsekKczpHmGOncOMO5EmMsVpefZzbNYnDMBLkiZscS0M6mkVW5C4TJ4Ue81NQjkBO5+OFKnmLT6L4WXetmoKagEBMgpBXWSkHuMdRLGz5kwrVKmen7YaPTTok3by7Q/+ErmbF6m6YSc3/U3p7wWSPR4lUXCnrv7oH9SRvizZ6XTDJ052XgOmt8DIX1Lge3sndx8hcchISOLAJ8eomMp8qENTKqTKEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXZ2cqQb+PKX4OQqvpL1oiXVHTrIWB/tL9KWb3D3lYI=;
 b=fmHWpnvTjrpjbXixk8ybbc45R3zvWpBNeLuYNeokzXtZhUuUNO5TgoMPUHbNumJgcKCkiXtKRfvRRSCk2HNImnQTbmOQ2RI1sZwji03UD/fd4dV5kxWxf+ymHVOp+UfUvDjliVnScPF7RHx337f2g4H2zVwClMkC8HYk2TwZg50=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from CH2PR13MB4458.namprd13.prod.outlook.com (2603:10b6:610:6c::22)
 by CH2PR13MB3543.namprd13.prod.outlook.com (2603:10b6:610:2b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.6; Wed, 2 Dec
 2020 08:04:48 +0000
Received: from CH2PR13MB4458.namprd13.prod.outlook.com
 ([fe80::bdcd:2c1b:bf81:515c]) by CH2PR13MB4458.namprd13.prod.outlook.com
 ([fe80::bdcd:2c1b:bf81:515c%7]) with mapi id 15.20.3632.006; Wed, 2 Dec 2020
 08:04:48 +0000
From:   Yash Shah <yash.shah@sifive.com>
To:     linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     broonie@kernel.org, gregkh@linuxfoundation.org,
        aou@eecs.berkeley.edu, lee.jones@linaro.org,
        u.kleine-koenig@pengutronix.de, thierry.reding@gmail.com,
        andrew@lunn.ch, peter@korsgaard.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, robh+dt@kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, sachin.ghadi@sifive.com,
        Yash Shah <yash.shah@sifive.com>
Subject: [PATCH 4/4] riscv: dts: add initial board data for the SiFive HiFive Unmatched
Date:   Wed,  2 Dec 2020 13:33:56 +0530
Message-Id: <1606896236-62780-5-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606896236-62780-1-git-send-email-yash.shah@sifive.com>
References: <1606896236-62780-1-git-send-email-yash.shah@sifive.com>
Content-Type: text/plain
X-Originating-IP: [159.117.144.156]
X-ClientProxiedBy: BMXPR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::28) To CH2PR13MB4458.namprd13.prod.outlook.com
 (2603:10b6:610:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by BMXPR01CA0018.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 08:04:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2723f445-5272-4926-cd5f-08d89698f073
X-MS-TrafficTypeDiagnostic: CH2PR13MB3543:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR13MB35433BBC38AB2255F2301CB782F30@CH2PR13MB3543.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7rB6JJ/bGp85SrsjM3455hs/3alPRuWyyVoAEJm36FN+KQ9+rjraexbSd+NtCuYv4ebx02inXF0dWzdWCIjtZv+usBo3p8j8pGAIaUIh2N1vPPhhSLjZCSkJMBRJg/5WSbIWtKTNBNinE8lDKtfDiqGnCAMYUFLQf53ymXaBJrT3gzicJjcnUfZU9+gPGwuCxNZKUGWH6uh3bKOZ9eM0SOHagX0QVcMN1OprMNB8bMZiqRqfLaXK25KPUavjJBm/z6HpK92uKSApWPQCz209BthbfmhBx/zNT87HmDClfGKXjgymv3tda3rf9EDvky99C4rIDByVwEXyHKE6dxkmEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR13MB4458.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(366004)(136003)(396003)(39850400004)(346002)(376002)(83170400001)(36756003)(42882007)(66476007)(316002)(66556008)(83380400001)(2906002)(4326008)(956004)(2616005)(26005)(44832011)(5660300002)(7416002)(52116002)(478600001)(107886003)(66946007)(16526019)(8936002)(6512007)(6666004)(6506007)(186003)(6486002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?q4uLYTt1eCFrWR8hrhgmpr0mx5UD5uQlkMLJPbw4daWqa/v41tD0sHw6KDJY?=
 =?us-ascii?Q?KwdlypZlAz9FuUhv+5Uml1EgNIIfopSqsSPxH8DYukfa5xoVbEQeauo0N1yl?=
 =?us-ascii?Q?32G8L2Ag5+be4EHcpKxglRfB6dbrcHPRsleWgMa9AhrVE+LSHX66wUgKi4oC?=
 =?us-ascii?Q?NOksxXLjYZEveiD0nIVjMNBAXopowVUOrk2PAO41gyOF9tSfSpsVcUkCpwtt?=
 =?us-ascii?Q?evsp8zrrFgUYZej7my5/R9G8hDBZwtp4Gv0tg7TgeshDPo6SlrKVXHwTRzyy?=
 =?us-ascii?Q?pHWnNTYWzokaQkh2wFMMkjgRFK4PE0qgSFrH0aEIydSYY2Ae+AOJ5dsfvlb0?=
 =?us-ascii?Q?YGKG0Bf4N2CGxE6trxIyEP4YsEesjLTu1KVrNdZe3OYhbkwHN1vg0wB4QOsL?=
 =?us-ascii?Q?li5fc7jnathiZj0dNwbSbYgCN3KOh+mcU6Ktwybr1FNBXFNigYDsZ+S+h9ov?=
 =?us-ascii?Q?yep7IB2mGHid2VMNExPlQ83A8igR3zrvuhDfaMFFbOFCTxqIRvrfWczJj8+e?=
 =?us-ascii?Q?NWOrr2aGElMVBx6K7puvFHY6Yl/HeiFMEuGDXtxasjl2mWbvSTAkth7sTCA7?=
 =?us-ascii?Q?rlCt921tEf30KQBIrvuiy5b49Pli9Zt5gcKPtezsk5VHXFjd9XjXMUN9QQsl?=
 =?us-ascii?Q?eA+JjclJgnFqh1AxWcg2LFRww95OrkFoI+WI1SAblgv9bQFwOY4KbZobYGwh?=
 =?us-ascii?Q?QmdNe3CMXLpzMKQ0Yu1SG0NJrcF7Tv3BtLkSuOOlNsrmGIYdlQVVhdCdKpUY?=
 =?us-ascii?Q?1zNskzwjVypujj3fecs7sBecIWyANnQBkc6QfdCCFf4wNvaA9wUx+526Vunk?=
 =?us-ascii?Q?wvhzH/gc2cIapTg/Ovy0LV+JIench2x9MXxVCodeAt554sfvvIjHOO75FF0U?=
 =?us-ascii?Q?o4daSOes1R3kIliJAEyWGxCTeiTUJ3Mp33SGPqRX/23KLIxeFWM9JWQS91hV?=
 =?us-ascii?Q?4+8IYB3Q97ZiUh1hEWK87VKnbr6+2fwIv/RYFOm+nC8HOdFw+ahYS+UrdN9b?=
 =?us-ascii?Q?97Mg?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: CH2PR13MB4458.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 08:04:48.4788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: 2723f445-5272-4926-cd5f-08d89698f073
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jf+usVyydGv8ovuU9HLyt7/41mwikWEzoi47UJKOFNSq6gfEzhWMcbITWagyAuyzYr6TEV+wwUq/0phkKR3U+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3543
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add initial board data for the SiFive HiFive Unmatched A00

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 arch/riscv/boot/dts/sifive/Makefile                |   3 +-
 .../riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 253 +++++++++++++++++++++
 2 files changed, 255 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts

diff --git a/arch/riscv/boot/dts/sifive/Makefile b/arch/riscv/boot/dts/sifive/Makefile
index 6d6189e..74c47fe 100644
--- a/arch/riscv/boot/dts/sifive/Makefile
+++ b/arch/riscv/boot/dts/sifive/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_SOC_SIFIVE) += hifive-unleashed-a00.dtb
+dtb-$(CONFIG_SOC_SIFIVE) += hifive-unleashed-a00.dtb \
+			    hifive-unmatched-a00.dtb
diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
new file mode 100644
index 0000000..b1c3c59
--- /dev/null
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -0,0 +1,253 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2020 SiFive, Inc */
+
+#include "fu740-c000.dtsi"
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/* Clock frequency (in Hz) of the PCB crystal for rtcclk */
+#define RTCCLK_FREQ		1000000
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	model = "SiFive HiFive Unmatched A00";
+	compatible = "sifive,hifive-unmatched-a00", "sifive,fu740-c000",
+		     "sifive,fu740";
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	cpus {
+		timebase-frequency = <RTCCLK_FREQ>;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x2 0x00000000>;
+	};
+
+	soc {
+	};
+
+	hfclk: hfclk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <26000000>;
+		clock-output-names = "hfclk";
+	};
+
+	rtcclk: rtcclk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <RTCCLK_FREQ>;
+		clock-output-names = "rtcclk";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	temperature-sensor@4c {
+		compatible = "ti,tmp451";
+		reg = <0x4c>;
+		interrupt-parent = <&gpio>;
+		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	pmic@58 {
+		compatible = "dlg,da9063";
+		reg = <0x58>;
+		interrupt-parent = <&gpio>;
+		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+
+		regulators {
+			vdd_bcore1: bcore1 {
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-min-microamp = <5000000>;
+				regulator-max-microamp = <5000000>;
+				regulator-always-on;
+			};
+
+			vdd_bcore2: bcore2 {
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-min-microamp = <5000000>;
+				regulator-max-microamp = <5000000>;
+				regulator-always-on;
+			};
+
+			vdd_bpro: bpro {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microamp = <2500000>;
+				regulator-max-microamp = <2500000>;
+				regulator-always-on;
+			};
+
+			vdd_bperi: bperi {
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-min-microamp = <1500000>;
+				regulator-max-microamp = <1500000>;
+				regulator-always-on;
+			};
+
+			vdd_bmem: bmem {
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-min-microamp = <3000000>;
+				regulator-max-microamp = <3000000>;
+				regulator-always-on;
+			};
+
+			vdd_bio: bio {
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-min-microamp = <3000000>;
+				regulator-max-microamp = <3000000>;
+				regulator-always-on;
+			};
+
+			vdd_ldo1: ldo1 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microamp = <100000>;
+				regulator-max-microamp = <100000>;
+				regulator-always-on;
+			};
+
+			vdd_ldo2: ldo2 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microamp = <200000>;
+				regulator-max-microamp = <200000>;
+				regulator-always-on;
+			};
+
+			vdd_ldo3: ldo3 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microamp = <200000>;
+				regulator-max-microamp = <200000>;
+				regulator-always-on;
+			};
+
+			vdd_ldo4: ldo4 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microamp = <200000>;
+				regulator-max-microamp = <200000>;
+				regulator-always-on;
+			};
+
+			vdd_ldo5: ldo5 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microamp = <100000>;
+				regulator-max-microamp = <100000>;
+				regulator-always-on;
+			};
+
+			vdd_ldo6: ldo6 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microamp = <200000>;
+				regulator-max-microamp = <200000>;
+				regulator-always-on;
+			};
+
+			vdd_ldo7: ldo7 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microamp = <200000>;
+				regulator-max-microamp = <200000>;
+				regulator-always-on;
+			};
+
+			vdd_ldo8: ldo8 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microamp = <200000>;
+				regulator-max-microamp = <200000>;
+				regulator-always-on;
+			};
+
+			vdd_ld09: ldo9 {
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-min-microamp = <200000>;
+				regulator-max-microamp = <200000>;
+			};
+
+			vdd_ldo10: ldo10 {
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-min-microamp = <300000>;
+				regulator-max-microamp = <300000>;
+			};
+
+			vdd_ldo11: ldo11 {
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2500000>;
+				regulator-min-microamp = <300000>;
+				regulator-max-microamp = <300000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&qspi0 {
+	status = "okay";
+	flash@0 {
+		compatible = "issi,is25wp256", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&spi0 {
+	status = "okay";
+	mmc@0 {
+		compatible = "mmc-spi-slot";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+		voltage-ranges = <3300 3300>;
+		disable-wp;
+	};
+};
+
+&eth0 {
+	status = "okay";
+	phy-mode = "gmii";
+	phy-handle = <&phy0>;
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&pwm0 {
+	status = "okay";
+};
+
+&pwm1 {
+	status = "okay";
+};
+
+&gpio {
+	status = "okay";
+};
-- 
2.7.4

