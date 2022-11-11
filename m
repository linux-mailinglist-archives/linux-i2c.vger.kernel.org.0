Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C98416257BF
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 11:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233601AbiKKKQF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 05:16:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233587AbiKKKQC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 05:16:02 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA3410B8;
        Fri, 11 Nov 2022 02:15:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcAlaSSizgkWe4aVFnwQuWV2pZGSIqNYOgSZBQ2294G6hkpHE9L35wpManXXrYa/x6skG4XchS1HUbNkpMq5i6bhFBhdH5BAv4fXAsotHPTz/7NwGepp0pCAXfytyukEqB0USn6AElxX/El6jyJEzKiegT4cRktAZRhrc3vXqG2MW87TN1IG/VMJaGbES8lWF0RlbHH0XbkFMSOTmPoA2xf/7AIoSX9Y1+qltxrQimymU5qc5zzGrGNpmceO12uK4CsdhvC45XlhdeC/ifz1IYIEJN8kwIVgG2pkzAZEnv19wz8XGDpVzUp9I/AkYiTjZSji1lKootHUjWbMkLGYeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vs/S4cWkFvBdXcr1u/3YfmRTM0i3TVOlY3uRjy0sRLI=;
 b=MTItGxsqwLk1Mea2XwJSY+mhvyfHlsjGMFS15Jmug6FDzVOFp16ws7LC/eMvX/Ocag33hkaYvsskiamDxumDRDrfOWFKfwxy2eb0tfzWDnxnIXxRyQSa1c+eZoQ0Hhvtg5L+X3xYhbMqj70C3s8b+Z9a+ekR2aDA1BLrNG2nIC8EaM1syudSl5jv6tiD4icr+hq5M5Dol/UTXc0NGx748tG7FBVSbznbM4JEp51ldLMoAOVwVYJcdvxjaItPJXoNiZgpoQ6hgt0wDnN6+MAHM50ua48q570Xe9FsjF+o6fXNRJBZbYc4hENwmxeTG9BIkIr+9hEPQKMnapTE+SmqJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vs/S4cWkFvBdXcr1u/3YfmRTM0i3TVOlY3uRjy0sRLI=;
 b=iQ1Bv2767QOKtfVaHqs0F67xJwIVaxbqQuhr6VlrHAfftiq7pA2fSbfVLhOO26v5qFB3W1MMqMmJGxmiFoY15HLYhwqbx5o7jvX4HqCdDako6WJX3pyUyq38nNvu8nv/2BfzY2O0L3az/3/uO1ah6HooxQRwM3MOiJwrCjyLQw+WobAtMzQVBY8srnQXlocP78fz4+sRDIWjiDUucb2V/0+hiasykf6GTPVkRyig2vQ0Pw8MUpc6w+fhuN7UOIXwSZ5KmBul765hHR+DVPc9376AZPvnajjIQ8HEsEtqtGz5DOnqMR2F50DXHevPpLv97uEifn5FE1otEc/yolAqHQ==
Received: from DS7PR03CA0166.namprd03.prod.outlook.com (2603:10b6:5:3b2::21)
 by IA1PR12MB7541.namprd12.prod.outlook.com (2603:10b6:208:42f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 10:15:57 +0000
Received: from CY4PEPF0000B8EE.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::80) by DS7PR03CA0166.outlook.office365.com
 (2603:10b6:5:3b2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Fri, 11 Nov 2022 10:15:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000B8EE.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Fri, 11 Nov 2022 10:15:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 11 Nov
 2022 02:15:50 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 11 Nov
 2022 02:15:49 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Fri, 11 Nov 2022 02:15:45 -0800
From:   Wayne Chang <waynec@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <treding@nvidia.com>,
        <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
        <heikki.krogerus@linux.intel.com>, <ajayg@nvidia.com>,
        <vkoul@kernel.org>, <p.zabel@pengutronix.de>, <balbi@kernel.org>,
        <mathias.nyman@intel.com>, <jckuo@nvidia.com>
CC:     <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <singhanc@nvidia.com>, <linux-i2c@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH v2 02/13] dt-bindings: usb: Add NVIDIA Tegra234 XUSB host controller binding
Date:   Fri, 11 Nov 2022 18:14:58 +0800
Message-ID: <20221111101509.999589-3-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111101509.999589-1-waynec@nvidia.com>
References: <20221111101509.999589-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EE:EE_|IA1PR12MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 0602a273-8069-4a4a-b90e-08dac3cdb993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lU4479cudM7SEBGkm09xFzp2rd39TkHFCamJavm8ZWoMNir8o/hvY/cP3AvhYAOexk/S4CF3EJrBDabgf21yxtDw51L4ylBAAFCW/o+DuFdFO5b87063X1pMCpU6B0hVMP5GzZiov8GgXfuvDywmwN0LecpNjokV6G9H0A57p5dnXuhEO6xRxCALaL9jDaLXu8KnQADH4U7YWZ1VNtIQEfCVuYn5fWX5qjYV8pNaHUaZXJvnnXkIRr8ckJqIYVcLzBVvcC7QgXxY68GH9+y/Ma9YozY0bA+3HSpUKAPonOAqxErpOlFCP3pdChve91S6zIU88fx/cCxBm5VF5pFA8Q/oe/JwjZCNnNGNOaeoR5omewEyPt/vEGE2X4R+itzO4e/AkkUTRnwPtNwDxTweGlSPdlsSYgpF/+bfDkWlb1d/K95fc30pdPw2QYyc7U1H/Oc4YLXNydvxOfF4ss3dCxlRdDVurkxLT0lAYg74yWjOhP3MiRhcATkkv9sNdu5lHPw7LszPYYC5mGhPEm5nyb9Z6Wyytm0GSC0K30UJWuSNRSZkV3iKTKLVCfX5oY/cMREcJb9o/kPfu/g8veUObnky3a+uEoQafgk3WMppG4UsIcRjdvYim5UZSaL00eutDl4Gvch8DpU6TvjggYtQ2nd7v14YRHqADOSZG/EpIilCQJwj0mI8/NvlARMgua1SoW5R0QT8eKJB52/xXYJE9S8G673PnNz68Bue3jXspUbZEUWHnn5Eakx2/u4VDNC7YquIcwom5p53f5VlzHWGhY0SWXi5pqTvFQ9vwNghHxWhZrxqz5RBKaSWWImbyyhAZR7byk9URqU0QeicfP7kJyxsGEn7ffGDO0AqEfS/RPIMTBbhtlwUqlxkl8WlHjRajPS2s82Sj7+RYqdpjdbZG3Enq61i+S2PraLNkwkYwd0=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(426003)(336012)(1076003)(40480700001)(186003)(6666004)(2616005)(356005)(2906002)(4326008)(47076005)(36860700001)(83380400001)(70586007)(110136005)(966005)(70206006)(41300700001)(921005)(26005)(7636003)(5660300002)(8936002)(54906003)(86362001)(82740400003)(8676002)(6636002)(7416002)(40460700003)(7696005)(316002)(478600001)(36756003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 10:15:57.3962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0602a273-8069-4a4a-b90e-08dac3cdb993
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7541
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add device-tree binding documentation for the XUSB host controller present
on Tegra234 SoC. This controller supports the USB 3.1 specification.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V1 -> V2: new change for adding nvidia,tegra234-xusb.yaml
 .../bindings/usb/nvidia,tegra234-xusb.yaml    | 159 ++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
new file mode 100644
index 000000000000..d78ee88ed208
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
@@ -0,0 +1,159 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/nvidia,tegra234-xusb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra234 xHCI controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: The Tegra xHCI controller supports both USB2 and USB3 interfaces
+  exposed by the Tegra XUSB pad controller.
+
+properties:
+  compatible:
+    const: nvidia,tegra234-xusb
+
+  reg:
+    items:
+      - description: base and length of the xHCI host registers
+      - description: base and length of the XUSB FPCI registers
+      - description: base and length of the XUSB bar2 registers
+
+  reg-names:
+    items:
+      - const: hcd
+      - const: fpci
+      - const: bar2
+
+  interrupts:
+    items:
+      - description: xHCI host interrupt
+      - description: mailbox interrupt
+
+  clocks:
+    items:
+      - description: XUSB host clock
+      - description: XUSB Falcon source clock
+      - description: XUSB SuperSpeed clock
+      - description: XUSB SuperSpeed source clock
+      - description: XUSB HighSpeed clock source
+      - description: XUSB FullSpeed clock source
+      - description: USB PLL
+      - description: reference clock
+      - description: I/O PLL
+
+  clock-names:
+    items:
+      - const: xusb_host
+      - const: xusb_falcon_src
+      - const: xusb_ss
+      - const: xusb_ss_src
+      - const: xusb_hs_src
+      - const: xusb_fs_src
+      - const: pll_u_480m
+      - const: clk_m
+      - const: pll_e
+
+  interconnects:
+    items:
+      - description: read client
+      - description: write client
+
+  interconnect-names:
+    items:
+      - const: dma-mem # read
+      - const: write
+
+  iommus:
+    maxItems: 1
+
+  nvidia,xusb-padctl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the XUSB pad controller that is used to configure
+      the USB pads used by the XHCI controller
+
+  phys:
+    minItems: 1
+    maxItems: 8
+
+  phy-names:
+    minItems: 1
+    maxItems: 8
+    items:
+      enum:
+        - usb2-0
+        - usb2-1
+        - usb2-2
+        - usb2-3
+        - usb3-0
+        - usb3-1
+        - usb3-2
+        - usb3-3
+
+  power-domains:
+    items:
+      - description: XUSBC power domain
+      - description: XUSBA power domain
+
+  power-domain-names:
+    items:
+      - const: xusb_host
+      - const: xusb_ss
+
+  dma-coherent:
+    type: boolean
+
+allOf:
+  - $ref: usb-xhci.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/tegra234-gpio.h>
+    #include <dt-bindings/clock/tegra234-clock.h>
+    #include <dt-bindings/memory/tegra234-mc.h>
+    #include <dt-bindings/power/tegra234-powergate.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    usb@3610000 {
+      compatible = "nvidia,tegra234-xusb";
+      reg = <0x03610000 0x40000>,
+            <0x03600000 0x10000>,
+            <0x03650000 0x10000>;
+      reg-names = "hcd", "fpci", "bar2";
+
+      interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+             <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+
+      clocks = <&bpmp TEGRA234_CLK_XUSB_CORE_HOST>,
+         <&bpmp TEGRA234_CLK_XUSB_FALCON>,
+         <&bpmp TEGRA234_CLK_XUSB_CORE_SS>,
+         <&bpmp TEGRA234_CLK_XUSB_SS>,
+         <&bpmp TEGRA234_CLK_CLK_M>,
+         <&bpmp TEGRA234_CLK_XUSB_FS>,
+         <&bpmp TEGRA234_CLK_UTMIP_PLL>,
+         <&bpmp TEGRA234_CLK_CLK_M>,
+         <&bpmp TEGRA234_CLK_PLLE>;
+      clock-names = "xusb_host", "xusb_falcon_src",
+              "xusb_ss", "xusb_ss_src", "xusb_hs_src",
+              "xusb_fs_src", "pll_u_480m", "clk_m",
+              "pll_e";
+      interconnects = <&mc TEGRA234_MEMORY_CLIENT_XUSB_HOSTR &emc>,
+          <&mc TEGRA234_MEMORY_CLIENT_XUSB_HOSTW &emc>;
+      interconnect-names = "dma-mem", "write";
+      iommus = <&smmu_niso1 TEGRA234_SID_XUSB_HOST>;
+
+      power-domains = <&bpmp TEGRA234_POWER_DOMAIN_XUSBC>,
+          <&bpmp TEGRA234_POWER_DOMAIN_XUSBA>;
+      power-domain-names = "xusb_host", "xusb_ss";
+
+      nvidia,xusb-padctl = <&xusb_padctl>;
+
+      phys =  <&pad_lanes_usb2_0>;
+      phy-names = "usb2-0";
+
+    };
-- 
2.25.1

