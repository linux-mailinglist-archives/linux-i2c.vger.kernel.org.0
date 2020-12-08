Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFD9B2D22D2
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Dec 2020 06:03:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728095AbgLHE6e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Dec 2020 23:58:34 -0500
Received: from mail-bn8nam11on2062.outbound.protection.outlook.com ([40.107.236.62]:38624
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726112AbgLHE6d (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Dec 2020 23:58:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EE3oy9izEk6PmhEo0jyiod/61jQut1ENqHHO6t0zt0DZ261gAue9Zr7WIVhJND8sbrUKD7iWKqI9aoaR3QpAzzomqOMM09kZc9Ov4e/38AZAIdKEijydHt/t2CrA1G/nAPT6yfWRQm3oSyULwmloA/zGW3l3EJe8lt7lJHAcrkD/98jF/k9kSlij8jFsgRwGWSmsvFgGUMVFPzdHbOd7rOnFZdX5w8l3Kt6vdtrl8RiZ9S4Ml7GTSL6GdImb9aTxOLwyy66RmHuezqVxwSLl1Lg0oo67KKQVr05gCXwA3HvT4Vh3XohM+fhdKaNStEeCy8kQaJwMjtirX5XOK9a+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDZ/WGWTZLipd61Fvk2rm2veRbyPa19lEjVRyXdUyjc=;
 b=e/boOLoxBuTP66jvTYZ+994/jwxanFxyiHQU6IvdVQpAS48yh/xZAO+xB/4oYmcae8yPzTHKi8cladh18aWmNW6KWZie1K+ekoVQOd7SB/NsxdTqhnZ+QPQnjyBbhF6efBncFFQt5R26xlvx4d5TxSlHCBjLCB9O/8vnJdiZrdAMJUHTD8UqSQEN258IOtCB0cGIvJYxYTm8DyZ1A+wr37J4vh16w/Oi5i0kqSDQrvShY8qMpqNrMf+uD+xUYzrZdfPWb5uFUG1Rq1JCZOcwAGmmwi3OYNQ90xitg7khTeoc9eSIWxuE+DNTA3gndqNajNT9p3HGuK3ZzBoj+I4YsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDZ/WGWTZLipd61Fvk2rm2veRbyPa19lEjVRyXdUyjc=;
 b=kMTumNNPuuoL4Ec+dO6ClFzWXVSpHjmDPnY7bFFPX7kNxsNQLjR3bNADVO4PWkdlf8tSXLOExUXlQQSJwIPVeKQ1MlDdkJUFDFVMpeOgx7RZmz1aqgY/GG+A8pDsRgVdH87/bPderyJN0Jek2F7pUo8nXxGdNk85PpNlNovnU+g=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BY5PR13MB4440.namprd13.prod.outlook.com (2603:10b6:a03:1d2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7; Tue, 8 Dec
 2020 04:57:02 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%8]) with mapi id 15.20.3654.012; Tue, 8 Dec 2020
 04:57:02 +0000
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
        linus.walleij@linaro.org, Yash Shah <yash.shah@sifive.com>
Subject: [PATCH v2 9/9] riscv: dts: add initial board data for the SiFive HiFive Unmatched
Date:   Tue,  8 Dec 2020 10:25:41 +0530
Message-Id: <1607403341-57214-10-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
Content-Type: text/plain
X-Originating-IP: [159.117.144.156]
X-ClientProxiedBy: PN1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::27) To BY5PR13MB4453.namprd13.prod.outlook.com
 (2603:10b6:a03:1d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by PN1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 04:56:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5febfd7-4098-4949-af14-08d89b35b3e8
X-MS-TrafficTypeDiagnostic: BY5PR13MB4440:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR13MB4440602D5B077095DA458FFC82CD0@BY5PR13MB4440.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qX1Vxp1qAn630t/VqvSPVEvu6vwQfaB8Sq21jnhx+IoRqFiBcvMPbICs1rMkwCl9gD6ZTPS7bTw13N5XGbmE3u4xsgMXyQJrlePZrFKuDWQrEC3RsSPRZKuoHIhuhuexWC6CmtqtYPAqhsxAMZv2fuWnnsEistWcSTi3XeqtfNvbEvmoM6jKTovWt5OAO8C5HLimBbv9PqnRexuU7d5KJFAU0XxLGTCetoaRdedzw8lnWjXkBUHl3fl0Ykof63d9Z/nmpFFKmtRyU/yD9yCFdlZ6mL6k/8lY6jslw4/bZaxpHYZT/JIQovTIbd8tjiR5ilaBtDW5m5Fmfwg63dEI3NYxgUSqWDKt8eM+wkjbTgzNSeiGQd8jaPf2HVf1tkiQk0QdVuJnj20t5viVwZazfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR13MB4453.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(396003)(376002)(39850400004)(366004)(136003)(346002)(52116002)(83170400001)(956004)(5660300002)(4326008)(107886003)(2616005)(26005)(2906002)(316002)(7416002)(42882007)(44832011)(6666004)(83380400001)(16526019)(6506007)(8936002)(8676002)(36756003)(478600001)(6486002)(186003)(966005)(6512007)(66946007)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?n+9ccuoVTME2rBYS0qcpR7op3zNjvTy1FtxVR22Ou4kdrWv6L2DuvGGgqEJ4?=
 =?us-ascii?Q?ZqGWZ2CBg7zLeDJvDFUa+8ecYZD82C7rQyCDt6p5dfYdBp7Njdu/ZLRfsjhy?=
 =?us-ascii?Q?sBskbqsApjgTsODNidV3Zv15Vbyf1pfeWx/CQ87rakZIwPRfdYFj9fcsPgjq?=
 =?us-ascii?Q?UY//Z1OqqXXEKPlliYGy1rh2vXQBZLWjXEIStoQOgjqACGf5P+zjxGbDFOcW?=
 =?us-ascii?Q?BIPw9sb0megijQnwv4Z4w4BMrZa8T/LRRDhygfGVFb9ua1L1VbktQAVyM3c7?=
 =?us-ascii?Q?nj254WY3xd/rW0e8vbhT4oC2qmogwY8faExF1G6RkQqugwifLriOvqhljmXN?=
 =?us-ascii?Q?GZDtOgu3Q7ic58JWUOatp1NFyZShcsnZb2FOj5+ua5tAryEJcKoHwRZ3xn83?=
 =?us-ascii?Q?r8UnpRQVKRsux7SbcvYHFvuQf+7G7UMWRVh6QsG1t/pv07TCmwp4R6SkRQ9r?=
 =?us-ascii?Q?LVyb8ZPtk5+OymCS8if9GbeXn5MElQAXPZJ5gDYRpPpgxeTUl3YtWTBfA6/Y?=
 =?us-ascii?Q?PySbg+sQJyULsYMxouqqBl2zN0XIgZj2d5ZOCbU5VvJo/NIyoRGRHr/8mYXK?=
 =?us-ascii?Q?+aoOHpLcXhsvUahXMReVMF+CHrjUki8RDlZJfA5lonfbzueN9Jlp4uz7+WUR?=
 =?us-ascii?Q?pNOS4tLE50NrmXZJ7Atxf3W+JespJO7dIeowQdjHlEh2wlVKvM6V/5t6Q26S?=
 =?us-ascii?Q?n5JXx8hx4qn18FT3gYjR2kJgIzGEYXlUCU7pYRL+KVHSH7iGJJd/7jwZ0vbo?=
 =?us-ascii?Q?7r76MJW73PAPtYfVxrYggVyKVih2oMR5op2jdhmzm6+SCLD2jISqjxD/D6Ko?=
 =?us-ascii?Q?lmDybUt7pneabV0PBMBw8SSPeoaKV0p2Gtn1OczEh/lnBRokqILmrOqwUYHn?=
 =?us-ascii?Q?yeZc4r2iNGXaro6fGcCO+4h08Gu3PRNswhJrC/uxmzSLvH/ciUWW5h7ib8A6?=
 =?us-ascii?Q?5bhf+hNno7Dom/SrgrRELWkOXerggBAS6ln/xP3VZZ8sYcw83wCAidKthfZ9?=
 =?us-ascii?Q?K9FV?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 04:57:02.5205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: e5febfd7-4098-4949-af14-08d89b35b3e8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FsCxZ+eFgYJGWyUlDDaV7iRnV0te8VB3PwvSIJLHmdyY9BXx6xJsoPu7djIUwBJNS/qvOYceS5GhNhIv3G3VFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB4440
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add initial board data for the SiFive HiFive Unmatched A00.
This patch is dependent on Zong's Patchset[0].

[0]: https://lore.kernel.org/linux-riscv/20201130082330.77268-4-zong.li@sifive.com/T/#u

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

