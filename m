Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 055AF6257CB
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 11:16:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233563AbiKKKQZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 05:16:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233577AbiKKKQN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 05:16:13 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A0367125;
        Fri, 11 Nov 2022 02:16:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwKtjGMUdalmHpdx0hq2ijVaTOc3yleJ/ff4Ofgw+j+I82Mpge/vbud7fTpcw0cVbRRBqTmrzGgWfIyD0+dLKNtK0hszMCZ3ZuLsr6s6NLbICbXMYGaU0IxeuOnmlw1Z1XnLwxUpxZsJzlnze0jzKSn9RyvP8lHX7bO9tMF6kf9oQYkGhXJjXVp0OR4lk7OiMBoxFXLLRf7oeEiWpStrUjWE1hXnkSJgXrbjTbwQ72KiqisIcGW/MVdN8ixCSHIZZmX6PGTEv4PAq0ZDV51MGOmXUfh8GRhnQPYziuP1+EvSy27B46W+nrDGe70s0CstShE6VXMamW1ToZEnpI7J1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UE+pAt+PFeQpx0TGAzlqAkYYvI78kM/x+OtLKXiESHo=;
 b=N+0WCklmY1ygDwwNMsuYisjPQzSjkTvtAm0tAxm1NlWZOWZQ/ip5rX2CpYf25aLFXlMocDAE6mLHM+OD7gtV0pynL+tlH59IffAT8oU9CY6t99Iyvl59fT+T5Pl9BaTZ0W2nE2judsUEwpT6m9stfeJ1xIWTC/qRLuoKdLLUQQLx/d80AEPXpU5L7sLKtvzgssFuHRMCUhTSCG15uulgS+4yHdyVzoOz0zlKii3wgJefU4Pp61oCziIFgs4+0UrlYjIXo0UCp5vWftXguagqZMKM4CuqXB1Uw9LqKejEEAqx1jx9BHjbCEvFISPfkodAlYDf1mvRQPy1GA3sUXcz2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UE+pAt+PFeQpx0TGAzlqAkYYvI78kM/x+OtLKXiESHo=;
 b=qzrIrJQ4bPlZwe+wmNZAlgch0jZzloSl2vRcfnnn3pD1vjUHGYzGzCKI/n1UL1JAoSUJ7I4oOpu0jWjiR4WDEB0wWYCJWEArUqKOkWb5rpDkKlXQwE54nuyIh6lyCoa5VHucpaagtxuH7e+agIuPT/iB4MK3XdHznlPzSeaTy4r7UAWashecMu2Sj45z1QTqn/jdX5Dt1+9nUpsZ8QlFJdv+jurSGj7wLfP/Ol6wt1AjRi9eGZ+kFf7oyYJefXygO2mJBzDy9GgrWmBXrWR1R8Da6nGP73OoBjV52XT0pQfHPQzzMWvsLCh4olRIlaJlc5xo7v3xQg9vgiCXgwJcBw==
Received: from MN2PR14CA0005.namprd14.prod.outlook.com (2603:10b6:208:23e::10)
 by MW4PR12MB7141.namprd12.prod.outlook.com (2603:10b6:303:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 10:16:10 +0000
Received: from BL02EPF0000EE3D.namprd05.prod.outlook.com
 (2603:10b6:208:23e:cafe::74) by MN2PR14CA0005.outlook.office365.com
 (2603:10b6:208:23e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Fri, 11 Nov 2022 10:16:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0000EE3D.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Fri, 11 Nov 2022 10:16:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 11 Nov
 2022 02:15:54 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 11 Nov
 2022 02:15:54 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Fri, 11 Nov 2022 02:15:50 -0800
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
Subject: [PATCH v2 03/13] dt-bindings: usb: Add binding for Cypress cypd4226 I2C driver
Date:   Fri, 11 Nov 2022 18:14:59 +0800
Message-ID: <20221111101509.999589-4-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111101509.999589-1-waynec@nvidia.com>
References: <20221111101509.999589-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3D:EE_|MW4PR12MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b539402-91c1-439a-18e1-08dac3cdc11e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MmnHmnxFFYH5ogxUksV+3w0QvK9PEgdvAhYorvhxCA6skZwHZk+VGeuT1fU6Rbu/B8BiRO5drk44b20QBFOdnH6rQbrPPkCUalpYlzBpJ43pmEMT17Au4Fs5tph9/cBPnAq6bB0jb9q6csuXKI343QCAXgvY6qRwTWgrjPXLXokhQFVTve1q5PZ9eQlq7mnD3WFU9fN1iJkaK3mYB7jHGFCrFWvowmNWfojtCH5ohE8V9It2fPgx+ut0i7JpcrcQA53OeI4kkLno4L6shV7chhueVm8lbrjY22UuxAjqjjNPV0LnCRMQKwt9eCYXxc4JyuypJvSKlMVTMdXsoAHPAiGoZuzi/BLX5A1DeQfEEhpPQ+1JZYHYMUO5rBOTesaV2k2FhFurpvQV1uE6ya/5ocZtFca7kGBZuIkt/0hH+wTRXeQbqDZpeEdQ0WWV5v6fomdnV4FmY8h/FunXiv+lCywMePXLXSinx2P+78JVjfGz31LXXvkCN93gYqj355AXUeaiSRFhGUUWmKU/0B04HFk9V2xWaz43ykyoRcYQzUi2SBJGCtVEr6CN4iWmX9lZx/Olsz18+L4i+WliWRcUkOsCVINQR6mPXQ/tH0JorPknl7VhmyYOzzTprDRD00WNGf+y6hO3D0+uqfzXEKLLczGUGYJYOQzl+PPUfHVY7Z/nYgRNweHuTY2Btofow2rxBiDMxVYEH3tKyrpQC9kHjo0m3HW04G4FMACh8K/dpWlsTtmNt70jcbx+9MX0hVNGtxlrMUui+GoBkDBmH+ZJct/gMrVsHywbTE4vqSc6O1WgMUcKKgwVIzoD2n+fZRmsgNvSUUcKh7147PyW/IB2dn/w7wVQ0kWZYEIuESnrv78TxTFeuBsic6MBkdLdf4XCSBN4sj1iPyqxSzy8HntZ0bOIZAklA2j6MCl3Z61Rjn4=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(36860700001)(7696005)(86362001)(47076005)(426003)(40460700003)(2906002)(36756003)(26005)(40480700001)(82740400003)(82310400005)(41300700001)(8676002)(1076003)(966005)(186003)(2616005)(7636003)(478600001)(70586007)(5660300002)(356005)(4326008)(7416002)(54906003)(6636002)(110136005)(8936002)(70206006)(921005)(336012)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 10:16:10.0159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b539402-91c1-439a-18e1-08dac3cdc11e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7141
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
V1 -> V2:Based on the review comments. Fix some addressed issues on
description, interrupts, cypress,firmware-build, connector, and 
additionalProperties properties. And also remove the status in the example.
 .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
new file mode 100644
index 000000000000..70db97e0ad31
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
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
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

