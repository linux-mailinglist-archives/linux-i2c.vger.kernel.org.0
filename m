Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10652627E00
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Nov 2022 13:41:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237222AbiKNMl1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Nov 2022 07:41:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237218AbiKNMl0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Nov 2022 07:41:26 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EDE023140;
        Mon, 14 Nov 2022 04:41:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGAErK/GDitDEwHFkrLCsAyTjWK1zAsO/a410R1L38EUfIt5DqrVkCRW0T47QSyq/rDOq2tC0hlgv7hWsLmYp19TTwPL0iEenpCr/jqhGCKTP1Bxx9vrdPwPQrvyDigl4SL2u4es9cTmFT1D1NIrxC5o153o9qAsQgMkvNse12srPVjZNbWodAKZe+CE2AdTfATKbrUPcNhZQzd6jLNpKc/VKUzw+Z12HyetsVlf6xCXKhC6/cHjbVnsYAw6n8uKZtYrICgg1ZWY7fu1XIoxqSd5ZpKO3tbEuEDzmGnu7S5FaAFnOD8LWw0pjgtFaWEfu7l1lW3WnERIFW7iZINfjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vykaUhl38ejpm5d1sfh9J2G0Cl6HfQXATGaa/oT8ZA=;
 b=RuPGP7HTc61Pour7+gVs4JVsWRBre0i9AHZ+g5FPd45QfGpTjvG6fv4FaN8nWlU5RY4tES3mMZH9TFfhEM4WG9gcnMT8OvFzJRHHrea8MtXHavn7Njbt4TqxON5/LFBiY8v1Rah3ULqlgUtILReYutOpfuE+3QYhKmUFqF3Un3mHwQnHFXglUq3wgqc+ztLk04BmD+hPwF6BIilfVJFSXiz/Jo4AZBiZwBfd2JPy9QuG1V+MgQk/C84zJpA39xnUWczx0MjqDYkCWtMm/4Ll8wHtzalR4Y3zGbBT4i8KC50KipuGv/SXsmUuJ6/bI4q1E8ZkLI4o9BLKqDEe3m7jGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vykaUhl38ejpm5d1sfh9J2G0Cl6HfQXATGaa/oT8ZA=;
 b=iTFwTDGQy0sFgzK7uabTOAmC8An24YI1HLc9SlFj9JLyb4zQM+jLOsKQHk72j7moyeQVob2Y7eCPyNpN1zX9McmA65KjoIbpE906yHQNvqUrEgjokYVz28wYSvGTwXdBkODcMi+lvGPQlWYQi7zlgRch3GnvI7iz4PDIOmlj/1PK6TfgNh6NGANHU9Ny6vmF6FLHHV45Xr2xVHGY3K/UbwK4wxY6O1+BSWOefPXdWCkp6O/q2EwQAKFpPtSR7q7gk4l4hlY9loSNFA9hfK2aVl1RlWHjw4i9Gx1L0XCrzwAgDdahHECuC8dIfMKzw3aW0Or+LgmwZbSh30dWloeNLg==
Received: from BN9P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::31)
 by DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 12:41:23 +0000
Received: from BL02EPF0000EE3D.namprd05.prod.outlook.com
 (2603:10b6:408:10c:cafe::a7) by BN9P222CA0026.outlook.office365.com
 (2603:10b6:408:10c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Mon, 14 Nov 2022 12:41:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0000EE3D.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Mon, 14 Nov 2022 12:41:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 14 Nov
 2022 04:41:11 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 14 Nov
 2022 04:41:11 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Mon, 14 Nov 2022 04:41:07 -0800
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
Subject: [PATCH v3 03/13] dt-bindings: usb: Add binding for Cypress cypd4226 I2C driver
Date:   Mon, 14 Nov 2022 20:40:43 +0800
Message-ID: <20221114124053.1873316-4-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114124053.1873316-1-waynec@nvidia.com>
References: <20221114124053.1873316-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3D:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 63dbec14-5f6f-4264-4f1d-08dac63d89e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h2aHIYeSr82JKFR2mIxIudRYoomxjKJJIMPstNOyi1nv16xbJsW2DnJ1HvEzSaj5ASG8sFlYaIjeoEICvdyzN6RK/thRNz2CxGNHoYcQs5keDMp6OqfcIr/+B4owZK57LB6NW8nvbmUcDg6OwvWD6oSHqeUMV0DPSYSl8vb9gxZDKlxpF4roDjvmYoeP4mjQj4AixYcFi4X0nICGXpjfAGXIeeFM2HWWjjGuHs07RBTZriktBHELXbIYtUxTsxsXFzXPPPk/F4MtR9maM7yK1RM9z3Y3r00Ryc7a/iN5rCwh3EKEHv/ubeknpGJsT38XgztCsCIH9ov0EZcBII+SmVhLfmcQDzr+yg0AU8ZRT9kI2Tli1ia/2xNlXZl/XHyxl2D6NSo8s7gz597OYcgvrYLfK/wMMnC89TIN663pVjDxZB5GzS2jvhHpA0/SmGm2B9zxzEbh0LP0XvUwTjoIRISZCYqpFQpc684Fgrqi5No3A0gRAnIbfcHY2YLW+ALvcNE4XZd9AkhzqoZSk6+KuO5+g7aSfRNJuHy+LAfjqNeFmAa4i9AyIbGSRVeyLSvBg+sxiGMUIqxLiqtvUBLOAaApsJ51XeMuG/YLoXDFDs/eA05co75fFLwqiosljiiOm1JmNmCOgbkVLk1RyKJtKdz8gLRNPSdBy2U+MlbFmkJ5zSuuNGEGBZtL3g/OqHEYDBck30CpRrnojIOrXoGE3rrEci1DahnB51dt4gijRZ41W24UpZiJ5X6RD2OCm3xFdbPFr+wZu5/U51DlfgMeqM6wPYwpwZqSio0UL3wJrPK9L9sWb9XgVk+K0Z8qcAMQqc2BHqd6GL8V+/y1tIcwmVDliyhv7Bv0bWy97EWaLJAuKSQ8H90kOqkxr+htJcdhNm0Zjp4K4EfRSqdRdSjwCzqzmkQgWPrd2k5J6i4qi58=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199015)(46966006)(40470700004)(36840700001)(26005)(41300700001)(6666004)(7696005)(478600001)(4326008)(110136005)(6636002)(316002)(54906003)(8676002)(70586007)(70206006)(36860700001)(40460700003)(7636003)(356005)(921005)(82740400003)(47076005)(2616005)(336012)(1076003)(186003)(426003)(40480700001)(83380400001)(86362001)(36756003)(2906002)(7416002)(8936002)(966005)(5660300002)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 12:41:23.3414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63dbec14-5f6f-4264-4f1d-08dac63d89e7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

add device-tree binding documentation for Cypress cypd4226 type-C
controller's I2C interface. It is a standard I2C slave with GPIO
input as IRQ interface.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V2 -> V3:fix additionalProperties warning on new schema
V1 -> V2:based on the review comments. Fix some addressed issues on
description, interrupts, cypress,firmware-build, connector, and 
additionalProperties properties. And also remove the status in the example.
 .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
new file mode 100644
index 000000000000..854fe2f9181c
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
+description:
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
+    items:
+      - description: cypd4226 I2C interrupt
+
+  cypress,firmware-build:
+    enum:
+      - nvidia,gpu
+      - nvidia,jetson-agx-xavier
+    description: |
+      the name of the CCGx firmware built for product series.
+      should be set one of following:
+      - "nvidia,gpu" for the NVIDIA RTX product series
+      - "nvidia,jetson-agx-xavier" for the NVIDIA Jetson product series
+
+patternProperties:
+  '^connector@[0-1]+$':
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
+additionalProperties: false
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
+      ucsi-ccg@8 {
+        compatible = "cypress,cypd4226";
+        interrupt-parent = <&gpio_aon>;
+        interrupts = <TEGRA194_AON_GPIO(BB, 2) IRQ_TYPE_LEVEL_LOW>;
+        reg = <0x08>;
+        cypress,firmware-build = "nvidia,jetson-agx-xavier";
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

