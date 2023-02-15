Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30DE7697D78
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Feb 2023 14:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjBONcv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Feb 2023 08:32:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbjBONct (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Feb 2023 08:32:49 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2122D5BAC;
        Wed, 15 Feb 2023 05:32:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxO3w4jwRnI0NNynXEEcVR6uEzA/0nPYZj8L7/F1JclYa4a93CJK/2ZrbZdeWDLL7GxFHItBbvY+i3JUwpm3oiS9f5uHFXU8FMdngQzVrGYC0VQwC5uThYnJi7/GhJx6hYmZwjpOSFMFA6nlkpJm9Cq+IbB8k6tVfGltBkkIy0/eGyRlc3+rsSfxcQ0+cBbC4K8XJ45czBeF1tmGkUNlTO56INnAUnpH5ka8ZF35Oi2oFwHCaT51z/AXwu5fPy55fEpM0jyoD0QhNjFp9IOPQj8L+04NdGQy7yboFQ7pYdcULVH9ifpqYIbx8JTitFCi5dxPPFUC6PBKXuD1MsDa7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWc+fmJe88k/Ztjkc4W5AFUYJKWD/hgKU5yH09ZaZ9M=;
 b=F1cxP4z06YcJnoDAJhKMOlewmJyvtz8pJptPygPa7ytgXMhr29fAj9zPvEWPjridBQ5ViPdm/dDqDy8OZzLVshJEZkPQRP5x01KWO9BhO6Au56rbK7JwSiDt2MbPZH0yU/qCdxsaWYI+0pdkQmiQXXY17k8onMHtUO6+y+rZs4x9RXEQqp5F+Rvlh2YwumWziISicbnQ5E6uZ3Mcu2QLzG2/eUpNkpOwMEevvCrn/HaMTvE97rV2tYBwTEE2Tckf5i/8bytVf7wrN2gS+141Rd1C2L0y+4t7ZKR5M4mwqR50uyucNAh56jFTGTYU368v181km3TpBBai8sVyLlx7dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWc+fmJe88k/Ztjkc4W5AFUYJKWD/hgKU5yH09ZaZ9M=;
 b=hGYLKkHLt7jQV4QycZKSKl0a8t/XKdePVWE3wUr7+faL7fVtsXNLS9ikyqyh7yjyN57X1hJix+TuJ2F1dHKwyskW++vF7rOp/klL2oHpBawt0TQyu3jXMHg0viGChmMWPrjcs+GUDx4+Do4pSJpOsK7QkdyA7zx9Hb6Hqb6jlk4=
Received: from SA9PR13CA0083.namprd13.prod.outlook.com (2603:10b6:806:23::28)
 by MW4PR02MB7410.namprd02.prod.outlook.com (2603:10b6:303:7f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.27; Wed, 15 Feb
 2023 13:32:43 +0000
Received: from SN1NAM02FT0026.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:23:cafe::e) by SA9PR13CA0083.outlook.office365.com
 (2603:10b6:806:23::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12 via Frontend
 Transport; Wed, 15 Feb 2023 13:32:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0026.mail.protection.outlook.com (10.97.5.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.12 via Frontend Transport; Wed, 15 Feb 2023 13:32:43 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 15 Feb 2023 05:32:41 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 15 Feb 2023 05:32:41 -0800
Envelope-to: git@amd.com,
 manikanta.guntupalli@amd.com,
 michal.simek@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 manion05gk@gmail.com,
 robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org,
 andrew@lunn.ch,
 devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.3] (port=42318 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pSHto-0005FE-Om; Wed, 15 Feb 2023 05:32:41 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id B60B11055BA; Wed, 15 Feb 2023 19:02:27 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <devicetree@vger.kernel.org>, <andrew@lunn.ch>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <git@amd.com>, <manikanta.guntupalli@amd.com>,
        <srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
        <manion05gk@gmail.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH V6 1/3] dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to compatible
Date:   Wed, 15 Feb 2023 19:02:22 +0530
Message-ID: <1676467944-17426-2-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1676467944-17426-1-git-send-email-manikanta.guntupalli@amd.com>
References: <1676467944-17426-1-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1NAM02FT0026:EE_|MW4PR02MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c200d63-2901-4147-3535-08db0f591df5
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ty/Gva0ejqQehFf3F70j+xaee7E+jmRLYjwJsp7Bwv61NtwUboamAQMEAjkNAjwpmeyciXGXJigjD1CT6PtaICzn7Pf3AHDg16JrT6TSaGhY78zv8mrMHWcZ/nNS3gIeL+KT/9ByLA6vN+JKbliLV7i+utW09vFjaPOi4ORbDN3a6VXTC7MVTOoFnp/5YSP+Pb3Ve5Z7IIAGy1msIuqM26+EQXJ89Gp8E1GBYFYltrPIlBVhoQ9nm2J5fJFEtGcdqSusXBvm9hdsFkHeEyJ7F52h2Z7hjAE2P0sKo8R/W3RV3OFS8jdT8NrAlMbFmW40scz9yKEwyMP6MVNIldHHJOBQ/rWoa5Uk6iuiCoK9hLnubboJyIrTpf84eq7R+48kgnIS69Gj8UGtJEdbsCYAdEW6aDWKEKDgCXQhmcV/0LkSEUW+O3WmQjceJGBgLpLTZpsoZ05pGKZPHkb1WY+RZcKPzHCnUBpdc4M7oLe80LWJOMDQSm0yMP97TDLTC6uo9HadwmUT5eClCJDJ+u1EeE2cgDHOTSBy4lCCOz6U5XsPSeMbyTKZ0ryQnvmWSlzXVSzCGjGRN4wH4E94wZ28SfIc80w2StdgBzxVEu2abSBGqswgibwCHH/W1O2YCEhK4mEXaxbxNVYsbyTcnfs4I5eMMxBTusFtR95Qd38/m8y9Gr0I0e3UC7Wc/eYkfXGq9CZv6fv6XNHZo5E8w6G4Wo6Cy0qfuY/g3NTm9GvF7j6C9uW6riSSC8BYR6wMbGpI
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230025)(376002)(396003)(346002)(39860400002)(136003)(451199018)(40470700004)(36840700001)(46966006)(2906002)(44832011)(7416002)(5660300002)(83380400001)(8936002)(41300700001)(356005)(7636003)(36860700001)(36756003)(70206006)(70586007)(8676002)(4326008)(316002)(40460700003)(110136005)(42186006)(54906003)(83170400001)(186003)(82310400005)(478600001)(6266002)(40480700001)(336012)(47076005)(42882007)(82740400003)(107886003)(26005)(2616005)(6666004)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 13:32:43.0922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c200d63-2901-4147-3535-08db0f591df5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0026.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7410
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

Add xilinx I2C new version 'xlnx,axi-iic-2.1' string to compatible.
Add clock-frequency as optional property.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Acked-by: Michal Simek <michal.simek@amd.com>
---
Changes for v6:
Add enum for clock-frequency in xlnx,xps-iic-2.00.a.yaml
Changes for v5:
Update description and add default value details for clock-frequency
in xlnx,xps-iic-2.00.a.yaml
Changes for v4:
Add description for clock-frequency in xlnx,xps-iic-2.00.a.yaml
Changes since v3: none
---
 .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml  | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
index 8d241a703d85..1b598638d457 100644
--- a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
+++ b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: xlnx,xps-iic-2.00.a
+    enum:
+      - xlnx,axi-iic-2.1
+      - xlnx,xps-iic-2.00.a
 
   reg:
     maxItems: 1
@@ -30,6 +32,13 @@ properties:
     description: |
       Input clock name.
 
+  clock-frequency:
+    description:
+      Optional I2C SCL clock frequency. If not specified, do not configure
+      in software, rely only on hardware design value.
+    default: 100000
+    enum: [ 100000, 400000, 1000000 ]
+
 required:
   - compatible
   - reg
-- 
2.25.1

