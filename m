Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B771609B8C
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Oct 2022 09:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbiJXHmR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Oct 2022 03:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbiJXHmJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Oct 2022 03:42:09 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2043.outbound.protection.outlook.com [40.107.212.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C082860E85;
        Mon, 24 Oct 2022 00:42:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F4jcqlz9NFoyEMjER9YqEYaAljRMsfz5qvv1Bcy9rLMNxpoKng8J/i9c1zd36/3A0jRuWb/MEG6Maz71gLQLiBqqlckhEN1eIMI29Hsa03AQa3YgwxsOYLal3ke55IgPu+bx9Jc4VtCfIUnLgruk1t+vFLAv5HysTKO+hrVTkaj0JNr2oCsb76bHD9a1UcrP+YjtW9dOQYR61Y1VWL0548LG02G5tPyIIlPy9XPFA7uQ9TldtLYVVZA16cj4Gmy9addhJe9Q2JVoODfq5VE8o2Rmuuk0u1xF81FmFw78551Irb8AHSdviHeXnX0s3s5qi6H8wamITshBy1MhH5hZ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3P5MLT2jVkkm4pUw4ihlcN391Lg9Qk+F6RA2HSmM1Jo=;
 b=AWbdUr5hQ2zlCdLWByyy+VFArTuv0ABgOFemgSu1oGSFewokqLkKkMOTdqHF3QqVcn05XY16SdonryYCBYJ3h0W6RdjXTDc4nJD5PgyYMDY96VqSXZ9MDF8RnkSQ9/2dYkMR6vUDFmaRkYoCRIpTORbRY07GNvLhcPNohLs/iETGNgULyWJCUFaScUMMfS3yQGwR1QKydJG5h1nXETmNh9R1vd9pWFcsZcwvirGUrrQ2+pEWBPmz4p3rGW5X+EtVKmi5NHHXmrFhhIAie3QpoCiksLsCwC7xac/HM9fIth8DVtwnG+jPDY6ye8iUHtbXR/AuP/rXt/7XxzRQh8iiGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3P5MLT2jVkkm4pUw4ihlcN391Lg9Qk+F6RA2HSmM1Jo=;
 b=a9zM8bm6DDIsIoi6j8t4xWS0ahlIxy+IPnp6tj5w3w96TZAlYnNhQAbcs9UUL8GGf+w6SwA4QayjhYxvMir6SdheoCL7WoNFI1oTZf82P11pLUoIA63Cg5K8JxnhGl/aouLjRf2njIgCWUoteP5V+7VxXg48ii4Kzs7HGn8xpGfoEU4KVAGtHDthCfSJlS0g3BiLoF9CeFFyRfV/NilXvRKbizjej6mPw3qBM0LmznpauLs0HGP46LmTujwMOzvL6iph5D0AribCmowyO2fIJbeOyJZNKWBeKEjAiQV3kXLrGWCkwnIshwPEO8qLZZzHPE9++jI920VBNTgN7T6WmQ==
Received: from DS7PR05CA0011.namprd05.prod.outlook.com (2603:10b6:5:3b9::16)
 by DS0PR12MB7654.namprd12.prod.outlook.com (2603:10b6:8:11d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 07:42:01 +0000
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::1f) by DS7PR05CA0011.outlook.office365.com
 (2603:10b6:5:3b9::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.8 via Frontend
 Transport; Mon, 24 Oct 2022 07:42:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM6NAM11FT041.mail.protection.outlook.com (10.13.172.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 07:42:01 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Mon, 24 Oct
 2022 00:41:49 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 24 Oct 2022 00:41:48 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.986.29
 via Frontend Transport; Mon, 24 Oct 2022 00:41:45 -0700
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
Subject: [PATCH 03/11] dt-bindings: usb: Add binding for Cypress cypd4226 I2C driver
Date:   Mon, 24 Oct 2022 15:41:20 +0800
Message-ID: <20221024074128.1113554-4-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024074128.1113554-1-waynec@nvidia.com>
References: <20221024074128.1113554-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT041:EE_|DS0PR12MB7654:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d1f769-0bd6-4fc5-c54a-08dab5933d3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sDQWNEgNzwdYkHssKr66W94mQHGJvVUukUXiY3yUlhY6+yj5H3RBPp+9rrt2V9APcNg/Awsvogm+KgbeXXvkSDzjOH/6P8JkTSs5x+SUwXwztQjbRKSKCRCCUizTq+4Gaf6aBWv13ploluu2/D4gd3TUI65Z1HFv2KITffLcTNlzXmIfRI17PbsucgcLN+68Bv+ZdgvjYQIXqugI88/3ekVfLGtABQsNwDlzSZ/+1r7MiX7j3LMy2lwWEjs3fDxnrDdK8gYxvoP2G8UORMLybViY930BjbdvoQ3sH8WfEIl3EQHZVYYTAcKm5tghCrnH+YA8SIToat/HqNjD8W6UpZcbIS3tQ8kCJZDddeS7bE35uFqeI/9alP8NcfcIxxfSYhJ6uU7itjtWpld/Z29CHLsfZqCI/kP07d0XyvJ/PQjPDMxNNIFxSqsw2qY9/NAk4wvbPmXjk6P8xo7wlTTe97301rcF3BSuzRQzbGY+z7hG62rzOeCfX77HgIco8j5io1Y70nn6OYH9hyWiUaJDizip+8KmyZW8VmMlQqhiL3YyJru8XKGJw4F9WMv4wucat4sKeB7JTWwK/pbKzvN2N/TjEA0SvQrk6McUHsN8a8yhCFsQoLj/55/lrivNQCKdy9YHMFs+Deu9ufGnZx3RaJ9eO1dfI6tX41L43B0MlzFN/XapOTLGbFG+r0FjOJaUcw/sYakPbwIViB79e31EXZqLuQdHCobM4u7ABxq3VytAGFEFC6CgDwxGyKpo+Rn8H27ZoLPGgEX3mBVZaTXmg0DdRmiSjUDKUusEcshNRAZ81Gz3pwiMUCUQsamJytx1B0T2pcoVGwJTo9gknqfRitbfQhO1i1w1p0qWnthiAc+rEdhqgHubgjdHDUYnIhi+
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(40470700004)(36840700001)(46966006)(36756003)(36860700001)(86362001)(2906002)(82740400003)(336012)(40460700003)(2616005)(47076005)(1076003)(186003)(356005)(7636003)(426003)(921005)(6666004)(7696005)(26005)(966005)(316002)(110136005)(5660300002)(70586007)(54906003)(40480700001)(6636002)(41300700001)(8676002)(70206006)(4326008)(82310400005)(7416002)(8936002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 07:42:01.7153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d1f769-0bd6-4fc5-c54a-08dab5933d3c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7654
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

add device-tree binding documentation for Cypress cypd4226 type-C
controller's I2C interface. It is a standard i2c slave with GPIO
input as IRQ interface.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
 .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
new file mode 100644
index 000000000000..5ac28ab4e7a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/cypress,cypd4226.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cypress cypd4226 UCSI I2C Type-C Controller
+
+maintainers:
+  - Wayne Chang <waynec@nvidia.com>
+
+description: |
+  The Cypress cypd4226 UCSI I2C type-C controller is a I2C interface type-C
+  controller.
+
+properties:
+  compatible:
+    const: cypress,cypd4226
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  reg:
+    const: 0x08
+
+  interrupts:
+    maxItems: 1
+
+  cypress,firmware-build:
+    enum:
+      - nv
+      - gn
+    description: |
+      the name of the CCGx firmware built for product series.
+      should be set one of following:
+      - "nv" for the RTX product series
+      - "gn" for the Jetson product series
+
+patternProperties:
+  '^connector@[0-9a-f]+$':
+    $ref: /schemas/connector/usb-connector.yaml#
+    properties:
+      reg:
+        maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/gpio/tegra194-gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      #interrupt-cells = <2>;
+
+      ucsi_ccg: ucsi_ccg@8 {
+        compatible = "cypress,cypd4226";
+        interrupt-parent = <&gpio_aon>;
+        interrupts = <TEGRA194_AON_GPIO(BB, 2) IRQ_TYPE_LEVEL_LOW>;
+        reg = <0x08>;
+        cypress,firmware-build = "gn";
+        status = "okay";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        ccg_typec_con0: connector@0 {
+          compatible = "usb-c-connector";
+          reg = <0>;
+          label = "USB-C";
+          data-role = "dual";
+          port {
+            ucsi_ccg_p0: endpoint {
+              remote-endpoint = <&usb_role_switch0>;
+            };
+          };
+        };
+      };
+    };
-- 
2.25.1

