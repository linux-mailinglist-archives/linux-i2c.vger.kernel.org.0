Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A54B2CB639
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 09:08:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387765AbgLBIFe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 03:05:34 -0500
Received: from mail-eopbgr770054.outbound.protection.outlook.com ([40.107.77.54]:53377
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387747AbgLBIFd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 03:05:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/2h2jKg4TGLo82zUNyx44CjbVS7hXRAUv6Kf+fMBcTdJKqnRWtRl0JEfLk4UORFCwP9icy1Lhpo2z4Xd0UQPsb7qkXsCCyL23CAE91I9swDcwFfI5UYTpWlXcyXN6/NBY8HzY5e4A8YMI1i3VCeN10YiZlaen2GRFBjBv45IX9qgkTteors1yTsb4ZOLuItk2wWv9isT1oCPSBYuDeTSDMiONWHp1BHMepI+PvjU52QbO40NUXHpDyNpo/i2XkaTN2IYfpbGWI+IBWKQj4ogYNfsApZjml1lulXSDa0fzyQ4fYDBEHJIX+0BPSZ7muU7tfYY2MSCamQb1/tjzeOWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=595i8qYAJj06O7chMo9vj+g4CoeMalJrgEeFxCtIp2E=;
 b=d6oruZM2NTEx3AFaAkBCzudsgq3UaE/dSwTQelE38fZiW7EKr7Gy4eiZ9gt/qYFctBonaS+RpPw7PxckXS9WKu5sMK5rjbAUrihptq8mf4zEqEC1hKGNS7MuGcRM8TvumnliToC1UOQFnLGHCQGKaYVMBFFQQafRRGzY10ZVlWlhsGvNpXMhPAlpB3kCRHty6zmP7fT0Ks4qpLwU1d9p21UqZnN2eDliOJ8B+iE3WS1V6O/Roo0Sh0K+IjFlCZSGpe8DOSLn/fJmpxxmyAywPoXX5taGsvpgj4LLuelvsZdiC5cT8q1e+zN0mjYPrspgvRdLdLQhPJ8ZRaPAt6zbAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=595i8qYAJj06O7chMo9vj+g4CoeMalJrgEeFxCtIp2E=;
 b=lNuoiwx+H4ZifZUaY5VUgFh6FblUaam2UsUNLQ2edEuO8d+bfPECi1jfyMa3VNuqppI6u1iXSBacxEXhClLmaAU8Rxe9YWuH7B61TZWCi4LYVHS/CIsV5WwJUyVni2UIrQC3Wy4xgsQ2mEogyyimQlOJfCNHMXZlwckQqox96Iw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from CH2PR13MB4458.namprd13.prod.outlook.com (2603:10b6:610:6c::22)
 by CH2PR13MB3543.namprd13.prod.outlook.com (2603:10b6:610:2b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.6; Wed, 2 Dec
 2020 08:04:34 +0000
Received: from CH2PR13MB4458.namprd13.prod.outlook.com
 ([fe80::bdcd:2c1b:bf81:515c]) by CH2PR13MB4458.namprd13.prod.outlook.com
 ([fe80::bdcd:2c1b:bf81:515c%7]) with mapi id 15.20.3632.006; Wed, 2 Dec 2020
 08:04:34 +0000
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
Subject: [PATCH 2/4] riscv: dts: add initial support for the SiFive FU740-C000 SoC
Date:   Wed,  2 Dec 2020 13:33:54 +0530
Message-Id: <1606896236-62780-3-git-send-email-yash.shah@sifive.com>
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
Received: from osubuntu003.open-silicon.com (159.117.144.156) by BMXPR01CA0018.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 08:04:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4329b155-3fcd-4bbf-4f7c-08d89698e835
X-MS-TrafficTypeDiagnostic: CH2PR13MB3543:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR13MB354338BC4C79BDD9F551919682F30@CH2PR13MB3543.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: riAp1BmZ/RVMIJ4OS+awx9afGzV61kRCFdQrQ2EUdC0HD20nwL/fVvJHjbzB5jGpJ6WJbFsIgALJFkqMOwWAmU09OOLORHG9VVh685CRjpcpEb+ALBtxfHunQMlCUSZoeHCtZsXN5O4QWtpRdLPsRyS+1TpVaAo5vBWgWVf3mfr80JCV/PttvlOT63iEsfrhPQufGyl7pzUJcAoPTZDBPVrB2Z5EkQuGjJ6fz+oF9at+iwPcd25lQvyORK6qFs4003Dm6fdFL4DoEhOHyEva9BH1THPkuq1a3i2AfQKIJAheeRzFTMvRg7nC5oSHcsos
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR13MB4458.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(366004)(136003)(396003)(39850400004)(346002)(376002)(83170400001)(36756003)(42882007)(66476007)(316002)(66556008)(83380400001)(2906002)(4326008)(956004)(2616005)(26005)(44832011)(5660300002)(7416002)(52116002)(478600001)(107886003)(66946007)(16526019)(8936002)(6512007)(6666004)(6506007)(186003)(6486002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nwPFtCQ/et7OTvJB2Gvv5zN1+yU89WRT7hVKI3hNJexlL0g0Bdffvvgz8WXS?=
 =?us-ascii?Q?9L2VuYGaTJrz++Wh+s+Qnm92aP/mAFqPu6CnzuOUSnoU0qCIYSdzrx094oXv?=
 =?us-ascii?Q?dVdFOExlUwvtUYL4MvFM7kAFn5M3GHNNn/0bUwRGLkYhI7sV9RzLart+b2O7?=
 =?us-ascii?Q?5lhcRMrdlQrsOd3FkX+zYPfZ7fHo9SiyJWAnGC8+1TwzXArdA+l7Eg7ZBQdL?=
 =?us-ascii?Q?Sq5gz1FcEwgocHQZfh4I8zrWGATDP7r8DAXTsK+l3C5D9DZ3FkllOQrjPKgd?=
 =?us-ascii?Q?/SqwERQe+DYfc2l2ynM6/rvCWEvoTM+L7vGW51BF52fGcqZauJl3loI+Kx3I?=
 =?us-ascii?Q?NCktRcAHtVdXTnfX3Tz7WPJRLAMH0RKsjF8OIzHQvPMROOMXMsRRMlyv1Yji?=
 =?us-ascii?Q?fU+yD882+VcFw/mN/YzcFy5/kG1IHGbbwUpgFwA0sR3KVpcL6BDynqPtXG7L?=
 =?us-ascii?Q?jDs857v2ytLFZ2y/deCFKir6tz96T5YM3TASpEnSziftAHvSdKAVDNSMTmQ2?=
 =?us-ascii?Q?lfj0CeVutjREPlXp0NW3SuOl+rI/ibKcQCxqoKr4P7pJdHOhIDVozVE0J9FP?=
 =?us-ascii?Q?r+Qa/wAG5pio8ToC0Su3LCTzXto9456AWdMt1nSuyfT1cRw393XmeID4FRMF?=
 =?us-ascii?Q?uSSBaJEcXsgUpwwXrT8ddCXFCHBRdQRWxRdgWZTtzybtDKkMyuvRC8NyXWYl?=
 =?us-ascii?Q?CPPypg3YXCdHuYdZookuZ7MfMRD09MQSq7JQ6bZfbhzG8hwMmBthZ3p/fOJa?=
 =?us-ascii?Q?wb7o/ObhFApyhrBteGYE8EjETrM3imbHDqiC7eEF55qoADhZgNMujAjw+aeu?=
 =?us-ascii?Q?SBlAFyljF8ASTdOKXYDWTYqz30ReJbRbZ2cBuN8gO31Xyo3zlKcX+oweVxZP?=
 =?us-ascii?Q?hqLsSSYrUnUJrTN8hd4SO11l3fRUI5/Dr2D59mrCxxhqHBySv274LmtAjOxK?=
 =?us-ascii?Q?D+ESrEZ7ih+wLPiayEJwDZECc+xdj0cdwkBa7HE9LX3SQxOv30VPLHIgTQF/?=
 =?us-ascii?Q?FaqT?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: CH2PR13MB4458.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 08:04:34.6743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: 4329b155-3fcd-4bbf-4f7c-08d89698e835
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qiqwU1My63XLhLnOlA6ZO7cRYXg/nHzj4ljWXXYmTE4KlPnHldHNbQuhYBuLA5nZ0dAQNzgXkKPHNuZpij3fLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3543
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add initial support for the SiFive FU540-C000 SoC. FU740-C000 is built
around the SiFIve U7 Core Complex and a TileLink interconnect.

This file is expected to grow as more device drivers are added to the
kernel.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 293 +++++++++++++++++++++++++++++
 1 file changed, 293 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sifive/fu740-c000.dtsi

diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
new file mode 100644
index 0000000..eeb4f8c3
--- /dev/null
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -0,0 +1,293 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2020 SiFive, Inc */
+
+/dts-v1/;
+
+#include <dt-bindings/clock/sifive-fu740-prci.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	compatible = "sifive,fu740-c000", "sifive,fu740";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		ethernet0 = &eth0;
+	};
+
+	chosen {
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		cpu0: cpu@0 {
+			compatible = "sifive,bullet0", "riscv";
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <16384>;
+			next-level-cache = <&ccache>;
+			reg = <0x0>;
+			riscv,isa = "rv64imac";
+			status = "disabled";
+			cpu0_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+		cpu1: cpu@1 {
+			compatible = "sifive,bullet0", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <40>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <40>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&ccache>;
+			reg = <0x1>;
+			riscv,isa = "rv64imafdc";
+			tlb-split;
+			cpu1_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+		cpu2: cpu@2 {
+			compatible = "sifive,bullet0", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <40>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <40>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&ccache>;
+			reg = <0x2>;
+			riscv,isa = "rv64imafdc";
+			tlb-split;
+			cpu2_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+		cpu3: cpu@3 {
+			compatible = "sifive,bullet0", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <40>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <40>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&ccache>;
+			reg = <0x3>;
+			riscv,isa = "rv64imafdc";
+			tlb-split;
+			cpu3_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+		cpu4: cpu@4 {
+			compatible = "sifive,bullet0", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <40>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <40>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&ccache>;
+			reg = <0x4>;
+			riscv,isa = "rv64imafdc";
+			tlb-split;
+			cpu4_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+	};
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+		plic0: interrupt-controller@c000000 {
+			#interrupt-cells = <1>;
+			#address-cells = <0>;
+			compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
+			reg = <0x0 0xc000000 0x0 0x4000000>;
+			riscv,ndev = <69>;
+			interrupt-controller;
+			interrupts-extended = <
+				&cpu0_intc 0xffffffff
+				&cpu1_intc 0xffffffff &cpu1_intc 9
+				&cpu2_intc 0xffffffff &cpu2_intc 9
+				&cpu3_intc 0xffffffff &cpu3_intc 9
+				&cpu4_intc 0xffffffff &cpu4_intc 9>;
+		};
+		prci: clock-controller@10000000 {
+			compatible = "sifive,fu740-c000-prci";
+			reg = <0x0 0x10000000 0x0 0x1000>;
+			clocks = <&hfclk>, <&rtcclk>;
+			#clock-cells = <1>;
+		};
+		uart0: serial@10010000 {
+			compatible = "sifive,fu740-c000-uart", "sifive,uart0";
+			reg = <0x0 0x10010000 0x0 0x1000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <39>;
+			clocks = <&prci PRCI_CLK_PCLK>;
+			status = "disabled";
+		};
+		uart1: serial@10011000 {
+			compatible = "sifive,fu740-c000-uart", "sifive,uart0";
+			reg = <0x0 0x10011000 0x0 0x1000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <40>;
+			clocks = <&prci PRCI_CLK_PCLK>;
+			status = "disabled";
+		};
+		i2c0: i2c@10030000 {
+			compatible = "sifive,fu740-c000-i2c", "sifive,i2c0";
+			reg = <0x0 0x10030000 0x0 0x1000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <52>;
+			clocks = <&prci PRCI_CLK_PCLK>;
+			reg-shift = <2>;
+			reg-io-width = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+		i2c1: i2c@10031000 {
+			compatible = "sifive,fu740-c000-i2c", "sifive,i2c0";
+			reg = <0x0 0x10031000 0x0 0x1000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <53>;
+			clocks = <&prci PRCI_CLK_PCLK>;
+			reg-shift = <2>;
+			reg-io-width = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+		qspi0: spi@10040000 {
+			compatible = "sifive,fu740-c000-spi", "sifive,spi0";
+			reg = <0x0 0x10040000 0x0 0x1000>,
+			      <0x0 0x20000000 0x0 0x10000000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <41>;
+			clocks = <&prci PRCI_CLK_PCLK>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+		qspi1: spi@10041000 {
+			compatible = "sifive,fu740-c000-spi", "sifive,spi0";
+			reg = <0x0 0x10041000 0x0 0x1000>,
+			      <0x0 0x30000000 0x0 0x10000000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <42>;
+			clocks = <&prci PRCI_CLK_PCLK>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+		spi0: spi@10050000 {
+			compatible = "sifive,fu740-c000-spi", "sifive,spi0";
+			reg = <0x0 0x10050000 0x0 0x1000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <43>;
+			clocks = <&prci PRCI_CLK_PCLK>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+		eth0: ethernet@10090000 {
+			compatible = "sifive,fu540-c000-gem";
+			interrupt-parent = <&plic0>;
+			interrupts = <55>;
+			reg = <0x0 0x10090000 0x0 0x2000>,
+			      <0x0 0x100a0000 0x0 0x1000>;
+			local-mac-address = [00 00 00 00 00 00];
+			clock-names = "pclk", "hclk";
+			clocks = <&prci PRCI_CLK_GEMGXLPLL>,
+				 <&prci PRCI_CLK_GEMGXLPLL>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+		pwm0: pwm@10020000 {
+			compatible = "sifive,fu740-c000-pwm", "sifive,pwm0";
+			reg = <0x0 0x10020000 0x0 0x1000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <44>, <45>, <46>, <47>;
+			clocks = <&prci PRCI_CLK_PCLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+		pwm1: pwm@10021000 {
+			compatible = "sifive,fu740-c000-pwm", "sifive,pwm0";
+			reg = <0x0 0x10021000 0x0 0x1000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <48>, <49>, <50>, <51>;
+			clocks = <&prci PRCI_CLK_PCLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+		ccache: cache-controller@2010000 {
+			compatible = "sifive,fu740-c000-ccache", "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <2048>;
+			cache-size = <2097152>;
+			cache-unified;
+			interrupt-parent = <&plic0>;
+			interrupts = <19 20 21 22>;
+			reg = <0x0 0x2010000 0x0 0x1000>;
+		};
+		gpio: gpio@10060000 {
+			compatible = "sifive,fu740-c000-gpio", "sifive,gpio0";
+			interrupt-parent = <&plic0>;
+			interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
+				     <30>, <31>, <32>, <33>, <34>, <35>, <36>,
+				     <37>, <38>;
+			reg = <0x0 0x10060000 0x0 0x1000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			clocks = <&prci PRCI_CLK_PCLK>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.7.4

