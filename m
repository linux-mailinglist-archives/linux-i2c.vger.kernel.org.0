Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C558627DFB
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Nov 2022 13:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237205AbiKNMlX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Nov 2022 07:41:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237199AbiKNMlW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Nov 2022 07:41:22 -0500
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2073.outbound.protection.outlook.com [40.107.101.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3FB5E0DA;
        Mon, 14 Nov 2022 04:41:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JosmnGJiM4taEfkFf7cGsAery5Ftm81TZ/Py8yOeTxFtaIJ1HU9u6FWHaOtIPMJxpKex18GnXc0NRAp2kUo8KzjyY+7FhO/0G7aUa1BUKsY1hkNLy2a4o8yUV0NAHTlxH4SGYrjnHplwfNtWPPpGD79kClihPgXxaIIGigaH0/l5NretZsXRkbPJFAwxScl2orKtrEZsgo4QExRdqxLsNVw4RFEaGbqCsJUJKjTXuTg0ZIlmQuvx8GgqR053AGnOltJqB0gH3x0xEnQ5L1SfiLYl6Aj9ET750Y8Z1prnYWoJ85k3e+uHZ5cK3UrGx5cIAeTexmRCo+HjR/r6d0epSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wC7PggcLQ/knU3i8uFHc/uypunC1K/38YYFaYv/y4/Y=;
 b=QPZHwMJvRntIrMR8H/A0M/af4yMy1hUpC4tRbBKPpRUMG33/D37JrVX/qvSO0y1sp8c8ajMZnnpSuXKAgcwPvRN1XUxS1fJOZ0VdRwDQk7V3i0m385C/XHw4ZAp2u62j78jiWQbCcmKC2dQD6x9gjdlC1MOPetprdxagqUYpXDjOdWkdATlMUDW+aQQW8hu07DiQ3l4Tb+v51WjoDJyiB7sBAWJjc9NjvRIimGoYOcQh/TysOBweNchukNEKOxfBmIqsfYEnPLw15EJRcFZegWdEkrVUjLBhQdpIo9Fq5Ds1vZCQQkxePV/Pj1O+Sv6IpaMaTJe+MfUGExkE5gRhTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wC7PggcLQ/knU3i8uFHc/uypunC1K/38YYFaYv/y4/Y=;
 b=khx0cSANUOKzg48/C+XHRFLKFNSeyHTzBuyICOPSk2RmiHfryhDe5MJx3D7ozEgqP9RDJkXG3zCwpv60DZ7JGwbkv87e9o1f089/v3zy+6ASlDYyzjbbsCACFBOF+wjcUgQxDSxrbLDKJ8bo7pYmZ1NqT1EBWLTuvyBCc7cwph0YXCIvDi+Gpy5Sx6Kqb8EpT/x8DKGbKtyMxpJaVDSdVPciL1RG5E5rzRdTrHJxRSXAHQh/oOOW8g48V2XsiD4D6hm0/Rv+/6QkDqi0K9pfABx/pju1CX6V18Jgs3PdccG4EoGFj6aL3gxoxHiFJPQs/X+uYYuppuoSC+JbR+0dcg==
Received: from BN9PR03CA0268.namprd03.prod.outlook.com (2603:10b6:408:ff::33)
 by CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 12:41:20 +0000
Received: from BL02EPF0000EE3C.namprd05.prod.outlook.com
 (2603:10b6:408:ff:cafe::62) by BN9PR03CA0268.outlook.office365.com
 (2603:10b6:408:ff::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Mon, 14 Nov 2022 12:41:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0000EE3C.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Mon, 14 Nov 2022 12:41:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 14 Nov
 2022 04:41:03 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 14 Nov
 2022 04:41:03 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Mon, 14 Nov 2022 04:40:59 -0800
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
Subject: [PATCH v3 01/13] dt-bindings: usb: tegra-xudc: Add Tegra234 XUSB controller support
Date:   Mon, 14 Nov 2022 20:40:41 +0800
Message-ID: <20221114124053.1873316-2-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114124053.1873316-1-waynec@nvidia.com>
References: <20221114124053.1873316-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3C:EE_|CO6PR12MB5489:EE_
X-MS-Office365-Filtering-Correlation-Id: dc2c948a-6194-4881-2447-08dac63d87b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KeJMJ5cqXbGUuUS3f6OCOK5aGtMg+yIoTV1CtO9tIe9fUbXKyVHnQR7gmULcOIwiwRMSaogd6eQRkDgQwsCEWYCiAWRXkmM7l/5nl3lbR1EBTVuW33o8/sH36oeAE8u0G5AdkQJYTqclMHyikuWvjCiR1sjoSFSpqEwjFfNeuFKjrfWzUyRNOTxKtuCzjdt4mrhvqCEAymadAdCagbDoqC/Zbx7IcLrBC9jBS3akI1Ye8mXprBBCDl6tH1qGrDdWazo16LeOE4DsFcU156P1oqwlUqARW2pAGeL+eFGJ7/20CFv4eIwoSBavqDtv17R2Ej9k02MN5BQBmJREEDeJgZwWiwnjQylWDQ+2xGgG//0fFJkxYfvrL19AMw87K+Btz376c4dGuRTNTix+lU1Zk6PhWhMIVqVrWgB9fDBt4Mwy6RwVR0WcRnXT7sNqVjN+8yBV7gfNoB3qdj/lrFHZR+srd5RjP9n+Jm78ijvChzYhEvJBiE03SwxQwrw1FdL7ocPR6l+m/WT5c9qfjFru2lums8nHjAhf+42m3Wrb8MPhKOR6Bq/88JkjhzEdhW2xOX1/B6cZFw6tN9wP5D815trp85ZqGSDxAviCFQKmL7NlF+S6/qpoPnNOrQXvqMqINJd8qqos6eVICTZzYMn9gFiWozJYmKML1v2w5Jq1ijaCPnYqgHmW9FoRPjNS9N8WC0bPwzmb7HwC9Fl3UHUgVjwisU87Y+98WjPrVqf4o7YBYAeFZY/XV6nT0byUjJQWZ0CdxzwNZw2Al3kNaWVn6O2B2HJqIv8g9FZUt2PMt6o=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(70206006)(2906002)(7416002)(70586007)(5660300002)(8936002)(8676002)(4326008)(41300700001)(478600001)(6666004)(82310400005)(36756003)(2616005)(7636003)(356005)(1076003)(47076005)(83380400001)(26005)(7696005)(426003)(6636002)(336012)(110136005)(186003)(54906003)(316002)(36860700001)(82740400003)(921005)(40480700001)(40460700003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 12:41:19.6546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2c948a-6194-4881-2447-08dac63d87b7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5489
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Extend the Tegra XUSB controller device tree binding with Tegra234
support.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V2 -> V3:nothing has changed
V1 -> V2:address the issue on phy-names property
 .../bindings/usb/nvidia,tegra-xudc.yaml       | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
index fd6e7c81426e..52488a731c4e 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
@@ -22,6 +22,7 @@ properties:
           - nvidia,tegra210-xudc # For Tegra210
           - nvidia,tegra186-xudc # For Tegra186
           - nvidia,tegra194-xudc # For Tegra194
+          - nvidia,tegra234-xudc # For Tegra234
 
   reg:
     minItems: 2
@@ -90,21 +91,27 @@ properties:
 
   phys:
     minItems: 1
+    maxItems: 8
     description:
       Must contain an entry for each entry in phy-names.
       See ../phy/phy-bindings.txt for details.
 
   phy-names:
     minItems: 1
+    maxItems: 8
     items:
-      - const: usb2-0
-      - const: usb2-1
-      - const: usb2-2
-      - const: usb2-3
-      - const: usb3-0
-      - const: usb3-1
-      - const: usb3-2
-      - const: usb3-3
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
+  dma-coherent:
+    type: boolean
 
   avddio-usb-supply:
     description: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
@@ -153,6 +160,7 @@ allOf:
             enum:
               - nvidia,tegra186-xudc
               - nvidia,tegra194-xudc
+              - nvidia,tegra234-xudc
     then:
       properties:
         reg:
-- 
2.25.1

