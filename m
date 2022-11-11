Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2805F6257BD
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 11:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233567AbiKKKQF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 05:16:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233468AbiKKKQC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 05:16:02 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA79667100;
        Fri, 11 Nov 2022 02:15:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kf1286Yrv/al95PJt0mMMYhj/2OgCAi2+GH/Yy4jQxATiS33bZmqW3+pJFyBdKMhdUvtYFi53qw80c7BOmZkcvbGs1GUsDUTpkM5Buw52+0yjxxmzwzFfZ8ivwUxYl6NMivnzYmRhZxNlafFel+v4Mx1jv7GqHfHMAkYbvO1jW+MVJZV/cy18jJgc2Blbl6e/faVadN/TCugoDK2+t0G/eNbvUrLeHuAq2U9Py23dN50A6/CC1xGDUHBcZoprLhSp8v+3W0V+O14Sxt8agjsHnVLayu04JykPZQ4VFrq+LEfvKnh1tE87Lp3QubvhpVF4P/YydJhNPP53myxBLDOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8dpUG1wROtwJ+ymMrT9Iew8vZ5ehFJIhhAiDRG/w4k=;
 b=jVSjnFhH2zMmBypV+R7b8kDAZaSp1smETu5ofFTU5bd+/E87AHu6MQeUdzwpRbINh2AxuyQT1u4urwqkhLPp1epTdlo9Xyaajk8gKCwGMWWNaH4ii2tDspu69t2c2/qM3ZBnrjDCa1LQ9M551xGd3oivz4FPJdt6SJrJd6yAR47gJN2jeeeMVBYbYALjMQ/WqgL0UT37lrf4+RZIvISqxksbwhJ0zO9umQYKj+u5ElZak/Gj4QyBwzo+QtJUI9+VEhuzZIDaq00Z1fnz0ChXAiHDlm/1PwzALYw7aMDUkbWXjqLEzpFIjgNCrX1Z3Wn+Chp+dNU2FtSzTIK2bAZwXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8dpUG1wROtwJ+ymMrT9Iew8vZ5ehFJIhhAiDRG/w4k=;
 b=a5zoyorzyZf4/VRIQ1sRQk1utSVsS6ZBHFJfE7eQRLO9YqH00T28lq4xk2Sifu4EFAKnmrkiE70YGCEBJ63M47sJ1jI2Z2XOhCbnNjlDzZ2359IJkJ/Xek4OOBcn903AEPCHd3dk7a3G4b9msSWiAe1hRSEEdkKK3y4XT4FuEu27abGA/YUVaH+MUeFcGdjskUAVHg0bh8bOmD3kFrb8NSWkatm7E7AOGA002VxyMAlw6cxmaArnp4ASSW6iYObWnCy747zPM5SQF9w/RCIGrrIBH5jBS2/ayu0PeHbyKzpnNvBQSCjEr154nW0YjpRQxBkLSZz+QgLNHaj6pLlumA==
Received: from DS7PR03CA0160.namprd03.prod.outlook.com (2603:10b6:5:3b2::15)
 by SN7PR12MB6689.namprd12.prod.outlook.com (2603:10b6:806:273::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 10:15:55 +0000
Received: from CY4PEPF0000B8EE.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::f0) by DS7PR03CA0160.outlook.office365.com
 (2603:10b6:5:3b2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Fri, 11 Nov 2022 10:15:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000B8EE.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Fri, 11 Nov 2022 10:15:55 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 11 Nov
 2022 02:15:45 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 11 Nov
 2022 02:15:45 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Fri, 11 Nov 2022 02:15:41 -0800
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
Subject: [PATCH v2 01/13] dt-bindings: usb: tegra-xudc: Add Tegra234 XUSB controller support
Date:   Fri, 11 Nov 2022 18:14:57 +0800
Message-ID: <20221111101509.999589-2-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111101509.999589-1-waynec@nvidia.com>
References: <20221111101509.999589-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EE:EE_|SN7PR12MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: 7149c9ee-abe1-44ea-6469-08dac3cdb85b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xfN+Wn4ywFaGycVq1sHjBf+wcCBx5CRp9hia0olwqKzAvgquRbtrVbcAjqxcctq1Yt3wv3g8fulTQ1tSv4brJCdtKW6RSpb5604jpAIth0Yq1ZRTPv4syal8qagtdPoUlfl22qVd3lCVEjVLHyAbGq+QTQUBWVJOt3oPSwkNdyWgR6BY2aeYm7PPL4gurC7L6Nnz3kPktR14tRPr7g+7czI9SjJT926D/7yfBgw2bcnNxLcdj3wIF6hAKLSPs5hZnyq+LpP1xX1OX4dSRlIufONFR9w7wJWSARAPjClYAlIskIK34HVA4hMvmhEz1PZddQNQA0LVBwKr3Pvw079C0dTKAzRKMIH3XAktQxDzcAi/IV86rK/BPXVFTQXN0upGHNwLKX58+OBO9wSi30WlUm12UYHagjf4Lc437fL6eJacq/CQAbbClAGyERlGw/p+av7AuTy5KcBfBxGOXpTQYrwKacJyEPl3HVUaaoO4HRaZChCaJRi5VoOLYh48w46E4N3sygV/DcpdDvMmXrXrDa4Hsz6wuRbNqE+YUFoMuNn99jdIpVdmgvLSYAdxD/gIOaroiEavWZAoqYFnAuIufFf2Rz1+xXW7Dzj0Z6g6eZs1Y4LztN4Jh/k8nKKpCROqNou49SZmIBgFoi5Siqd9AKhy/YcjV1sJandcRlxgOpZoSmhfd0bL8Wo+J2aOUIsd//0BsrIxCzpJLBd4mppq9UsPelQfhRTXhOdw33sLGhURTbB1mGl0ITKLlJijmd2rPDVymHJWhI55bBSxTAk7C+AhyTEdwhdNXsgFGhq0Qf4=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199015)(36840700001)(40470700004)(46966006)(7416002)(921005)(8936002)(41300700001)(8676002)(70586007)(36756003)(70206006)(4326008)(2906002)(5660300002)(426003)(86362001)(47076005)(478600001)(40460700003)(336012)(40480700001)(83380400001)(6666004)(26005)(7696005)(1076003)(356005)(7636003)(316002)(82740400003)(2616005)(186003)(110136005)(6636002)(54906003)(36860700001)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 10:15:55.3493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7149c9ee-abe1-44ea-6469-08dac3cdb85b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6689
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

