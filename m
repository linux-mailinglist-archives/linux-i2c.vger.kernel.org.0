Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44485609B86
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Oct 2022 09:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbiJXHl5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Oct 2022 03:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbiJXHlz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Oct 2022 03:41:55 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA6955BC8A;
        Mon, 24 Oct 2022 00:41:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZpkZyDrvMCihDsBNx8fU5BPDkrpOcVH5v+W5nyOyD27CUNLDWMJvR+7BFE3t2Z/bBTvocg0epSTyY9QzRvZLFHQfg3a9DFajNT31oLYpcyzoHszYF+lgjoob4fEBNoFh9oSMQTBo+AKAdK4gqVyzkz2G0PrnrOxdTE6QVMkkvZNWtu3O4CWQseVlfybbFS+I8tGmAqCa17GNvQPjTebm2Tm8e4oDEYH3VIeTU7qfiCpfwt+/XeeiYSsIPr4HI0vHsUaUn7mpV1onUFqY8lqOt/mMGAkbkAo2/eTcOjHz8TbE2OEKUPPjSucGM1h9BD5YpTv7TG2MzsOzhLjPsiwyGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5qquIuupNl7ZliE5kSBRHSY//1lm/47aCgcaZGAkzo=;
 b=mfI8TgKdn69al75CRG06NmJ3Jocyz6krt2CQc9lziRdEzU40hKy5NvcDHtt/XcA1zxHLELz3K8y/oE+vjQeJzoUAu7xLwZxu7JEQGq4yuDyjcRYwz5IkiQDbp/T70WeRSYw+BWqvPcORDt5tvoXjGD7PlhuNvNYlpCPWZDpxHcvTy58B6pMLKG4km9nvtyoSUCOhjxzcJtuYHlqnQpaf7kYBWuIVPIzhatXNCl0JDo7Y02wX7wyvvIMZXKgKTIn9lxHBsnoxPVDmORpTKxqVPXvBgDhaVnirP2KIwi2mG62oIrJLml711NdthVlSwtaE24EOefu+dDc/UiIfEvXNMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5qquIuupNl7ZliE5kSBRHSY//1lm/47aCgcaZGAkzo=;
 b=ibKie/gu+cq5Q4IS1p6sqfR2xp9XHFRF/Kw48+5NhBeL2NZ0KK3GGG3MPMX7bYbhD2At8XebnD00SdZ4Qhm76dkPh89KykMnqh4eWJA/9cfDtnNoNM6n4Ou40NCmOmUhuIpXeVAB5bvHEQt+t62OBSZaLjRKdimCz5caLdoqt6V3+xf1snTMJ+rdyn4Jy/2m4rlD4UXl1aXCtRhcyGiS1f89kITKMJ38DgA4uNRg+qJFoMPr7g+kVi1M35Y9ZTT81UalJB9zLid00bRm4U3xGgksyt3ksJF04nu6RpMM916hdi3RBBD+/jox1bOHAWlR2ecS5TrXIrfaWbGWQ3DN+A==
Received: from DM6PR03CA0098.namprd03.prod.outlook.com (2603:10b6:5:333::31)
 by DM4PR12MB7671.namprd12.prod.outlook.com (2603:10b6:8:104::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 24 Oct
 2022 07:41:45 +0000
Received: from DM6NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::16) by DM6PR03CA0098.outlook.office365.com
 (2603:10b6:5:333::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27 via Frontend
 Transport; Mon, 24 Oct 2022 07:41:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM6NAM11FT096.mail.protection.outlook.com (10.13.173.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 07:41:45 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Mon, 24 Oct
 2022 00:41:45 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 24 Oct 2022 00:41:44 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.986.29
 via Frontend Transport; Mon, 24 Oct 2022 00:41:41 -0700
From:   Wayne Chang <waynec@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <treding@nvidia.com>,
        <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
        <heikki.krogerus@linux.intel.com>, <ajayg@nvidia.com>,
        <kishon@ti.com>, <vkoul@kernel.org>, <p.zabel@pengutronix.de>,
        <balbi@kernel.org>, <mathias.nyman@intel.com>, <jckuo@nvidia.com>
CC:     <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <singhanc@nvidia.com>, <linux-i2c@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH 02/11] dt-bindings: usb: Add NVIDIA Tegra XUSB host controller binding
Date:   Mon, 24 Oct 2022 15:41:19 +0800
Message-ID: <20221024074128.1113554-3-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024074128.1113554-1-waynec@nvidia.com>
References: <20221024074128.1113554-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT096:EE_|DM4PR12MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: cc1604bd-489e-4d03-4e0c-08dab593338b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rg2RqxvjGu8yoMh/rKN8UOwG7vb3j3BnRoRQwjxTk1xh7LWM1RHpmHJwSsPL5l2DUJHgaOlvTMmYru2hF8zuDH1xqiEAN4qiNwjr9E5eQ70PUygP/ygQ9RnOZCo0N+lfd4NOW/arbOFigdpHwQeKHYoM9yw5f/Fo2jttN1tfxzRiG5p8JcoIfshz/uNE4bQXVyXHShrocJf2cGMATcm4ocrHdtcdSiZHEBVvNDL0VcsSpSXQZagxwM4DjbMNrHdBeVhZQHMJtX96NPY2IyArSzf+XC9nHJeE5ab4fyBECP5kwzQ+j1ddb5NMhzFpjynxfVPgfayzEDqHjadFfARFPPA6c/dTJ2XwnjZpLK9vVMWORfQx8cSTSgFlTk3Jd/pSPZ3ttwBJFrYc12ycfyVqoM5lap3rVCEsvYOl6Sxk9GjVv1TBSXdVyzz0eBrgrfvBuAc4gB0xW2tOQ5I8wNvii0yc+F3e9E2hovc0aMuFyfsVVqpNrsF5xiDOelpS6qLGYy04zVO0fWxfs3Ra5KpUMCHbzOc1FO5UpzcjkV30xn1AoQWZC4XDkiw0zJOsP/7G05noLEG5vnjq8/a378MDrzfSyTzdltdJofZq/LOMr2Wg1wVNxjEgWxmwHgGRc5ieUdK7FFqS9YMh39AW26t7jjYQ9BfjAjzdqBjip2M4SfRXRc6cVgQBz/iAPWkZj/3ewjajqKKNuWV0NNfbhEWrimuZfzW0W8hxVBQV9QZwc9c9qLaEty8IMpMGS1pXIV17/S1A75a+LkwuTKKVy8FTH9uLZxmAwClP9HSFajnjITYuU0wv0mbGoblSX/kGEyYNj1qbqlQk+dRhlvL67i8rrSSs4yX0xXT+lYg37KPk8n84D9nENaWVtZrkfiHI9bPK
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(186003)(316002)(426003)(83380400001)(6666004)(47076005)(110136005)(54906003)(86362001)(5660300002)(6636002)(8936002)(70206006)(36756003)(8676002)(7696005)(2616005)(41300700001)(4326008)(70586007)(7416002)(40460700003)(26005)(1076003)(40480700001)(336012)(2906002)(82310400005)(478600001)(356005)(82740400003)(7636003)(921005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 07:41:45.4371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1604bd-489e-4d03-4e0c-08dab593338b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7671
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add device-tree binding documentation for the XUSB host controller present
on Tegra194 and Tegra234 SoC. This controller supports the USB 3.1
specification.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
 .../bindings/usb/nvidia,tegra-xhci.yaml       | 213 ++++++++++++++++++
 1 file changed, 213 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xhci.yaml

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xhci.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xhci.yaml
new file mode 100644
index 000000000000..d261a419a04f
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xhci.yaml
@@ -0,0 +1,213 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/nvidia,tegra-xhci.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Device tree binding for NVIDIA Tegra XUSB host controller
+
+description:
+  The Tegra XHCI controller supports both USB 2.0 HighSpeed/FullSpeed and
+  USB 3.1 SuperSpeed protocols.
+
+maintainers:
+  - Wayne Chang <waynec@nvidia.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nvidia,tegra194-xusb # For Tegra194
+          - nvidia,tegra234-xusb # For Tegra234
+
+  reg:
+    minItems: 2
+    items:
+      - description: XUSB host controller registers
+      - description: XUSB host PCI Config registers
+      - description: XUSB host bar2 registers
+
+  reg-names:
+    minItems: 2
+    items:
+      - const: hcd
+      - const: fpci
+      - const: bar2
+
+  interrupts:
+    items:
+      - description: Must contain the XUSB host interrupt.
+      - description: Must contain the XUSB mbox interrupt.
+
+  clocks:
+    items:
+      - description: Clock to enable core XUSB host clock.
+      - description: Clock to enable XUSB falcon clock.
+      - description: Clock to enable XUSB super speed clock.
+      - description: Clock to enable XUSB super speed dev clock.
+      - description: Clock to enable XUSB high speed dev clock.
+      - description: Clock to enable XUSB full speed dev clock.
+      - description: Clock to enable XUSB UTMI PLL clock.
+      - description: Clock to enable core XUSB dev clock.
+      - description: Clock to enable XUSB PLLE clock.
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
+      - description: memory read client
+      - description: memory write client
+
+  interconnect-names:
+    items:
+      - const: dma-mem # read
+      - const: write
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    items:
+      - description: XUSBC(host) power-domain
+      - description: XUSBA(superspeed) power-domain
+
+  power-domain-names:
+    items:
+      - const: xusb_host
+      - const: xusb_ss
+
+  nvidia,xusb-padctl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the XUSB pad controller that is used to configure the USB pads
+      used by the XUDC controller.
+
+  phys:
+    minItems: 1
+    maxItems: 8
+    description:
+      Must contain an entry for each entry in phy-names.
+      See ../phy/phy-bindings.txt for details.
+
+  phy-names:
+    minItems: 1
+    maxItems: 8
+    items:
+      anyOf:
+        - const: usb2-0
+        - const: usb2-1
+        - const: usb2-2
+        - const: usb2-3
+        - const: usb3-0
+        - const: usb3-1
+        - const: usb3-2
+        - const: usb3-3
+
+  dma-coherent:
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - nvidia,xusb-padctl
+  - phys
+  - phy-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra194-xusb
+    then:
+      properties:
+        reg:
+          minItems: 2
+        reg-names:
+          minItems: 2
+        clocks:
+          minItems: 9
+        clock-names:
+          minItems: 9
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra234-xusb
+    then:
+      properties:
+        reg:
+          minItems: 3
+        reg-names:
+          minItems: 3
+        clocks:
+          minItems: 9
+        clock-names:
+          minItems: 9
+
+additionalProperties: false
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

