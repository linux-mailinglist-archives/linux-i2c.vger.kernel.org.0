Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A33A6907C5
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Feb 2023 12:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjBILvb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Feb 2023 06:51:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjBILuv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Feb 2023 06:50:51 -0500
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2042.outbound.protection.outlook.com [40.107.102.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DDB40FE;
        Thu,  9 Feb 2023 03:37:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tenu2ftdbPhdhWd48RzGfdvVm0RtqDTTiv7DSrenATtpR76J+E86Ms+tNelAu4vP8B/ECDE9otek28+5Ru7WcYlvenyDpI2NhYPYJ97OdQtZqzyUa5vq8O+mx3u6R88b9OdJli3dfLeyWeosHglDaU3SvkSgg+ODwBuAQfYUzQ7uKArPduI8Pp0S41zHGArqvm3OVQZfWpLVImDRxi2HDTk3H0g2sJnf3SuAhOjmPIfZOb31G7k4yIO0QDyEdOk1PzKRQ1qOz+/PZleRNBdnHVV90xVAJXuQqcwOzi57Ei1zQIji+iNPuNbz9UhX8x6DnjnFnZ8hP3FM3R14ILDObw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTW1rPAfGYXE0C7eFxNCzEElcbw2ilIUMSihvB88G4M=;
 b=F+Fb/2Q/Jl6NqDJsVdEDPbXdZtMvU8N/fyZw0f7w5HyZjLbzJ2zVQwXm50Ek+Y7O+wGzeMiIlb570K2Xc2iHvTzg7V7AD6610RbS9nKqC/XYdbmGHiMyqBs/pfh/Cj8hxwD0iztd8ZejKquTGX6ahrAfAAfbh+Mc7BP8wikQIzgZGLVT2rcGRgV7D1JkhuHJBynQj5y8STfNnr8XxMQ1lTy5ErCifpA5eOlkMnTKAp0FHseXVdIJiN7JLofzqPEE2A4kMY6Dmy4bzRlheoL4eqFFwAvWYR/bDXxH9zYRQtwwr/utteFenzIN0TdoC8ILne4vUUefhM5LxXlnohkfSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTW1rPAfGYXE0C7eFxNCzEElcbw2ilIUMSihvB88G4M=;
 b=jTOe0RJvlqHf251jLSTAXfQXtLyHpB6tR3MdNlo2pJq/+kKExIHPk5bVH0lyQJY3Bx2g7K4iQ2XKe9UYKmDt2DJBY4CCft0a6Fs7FU4hu/CpG4+zF/VMa/9cJ4JFPchuDbEhO36x0jfk5rnT3B/ivcKlNwmOlLT1bsiJQpdjtoM=
Received: from DS7PR03CA0082.namprd03.prod.outlook.com (2603:10b6:5:3bb::27)
 by CY8PR02MB9180.namprd02.prod.outlook.com (2603:10b6:930:9b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Thu, 9 Feb
 2023 11:37:49 +0000
Received: from DM3NAM02FT009.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::c1) by DS7PR03CA0082.outlook.office365.com
 (2603:10b6:5:3bb::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19 via Frontend
 Transport; Thu, 9 Feb 2023 11:37:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT009.mail.protection.outlook.com (10.13.5.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.19 via Frontend Transport; Thu, 9 Feb 2023 11:37:48 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 9 Feb 2023 03:37:42 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 9 Feb 2023 03:37:42 -0800
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
Received: from [172.23.64.3] (port=47171 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pQ5FG-0009Ke-Kf; Thu, 09 Feb 2023 03:37:42 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id 95BCA1055BA; Thu,  9 Feb 2023 17:07:29 +0530 (IST)
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
Subject: [PATCH V5 1/3] dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to compatible
Date:   Thu, 9 Feb 2023 17:07:24 +0530
Message-ID: <1675942646-31006-2-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1675942646-31006-1-git-send-email-manikanta.guntupalli@amd.com>
References: <1675942646-31006-1-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3NAM02FT009:EE_|CY8PR02MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: 196c2329-f2ab-408f-4e5a-08db0a92122e
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sje8ZvIdcD1F2xFL2snlpcQX0I+YxaISbD+wu2lmeoDJvZz/L+FlZz2GMJitA0bPxf6agNWR83xv7mbS12Ob6uPMcwHNrWevoYx/dhmGKdWDLTjdkzIcHH/Quy87eaSI+Sf+9OkN0jQFCrcwnLaza/6OGNworpouN56mYLf4kONAeXhnFu8J75ClggSZHHyhFvhg4JGFD+zCAjQ0+JphylAwgs4JEiU2mtlnQIC6muG1+I29hfHdLQ+CfGWzq5OVOJ1kdhkS+FcO4kwF4y+05WOs9pKvJImOF+GnQaSG6aM3vrZFMBG9j0zUbEqdCl3lKa6p93EgVD4bnRmxlJOFYKjVhntygZLBhqZ5OSAq3ItRqjXUM6bPJQ25AJZ2xB1LuZBAJTld6XTZdUD5njfsFVg6rdbFwRWr7JPlqf3//j0MsL6NgTFBj6hB9U6xsgLdBR18DhUiQwDyQypF+nhsLfhJmsl/fxR/UyXra/9AEXG/F0LVWpoKToNtilM/5uiCuHplrzXPANczZhUwFCtAszSmOFCx1ZybosZ4ozlz2SMkutbi8YQZ7R67e1Y/0QBUbN9E5AkL2K0OeCj2Zq36eAZR5TpN/Fa17MU2wpi6EcRgAjJ6dXqzsLALiEEWuepPvlQnytIqis9lC2+lWfLUWiTVdJ+ZJLw8GH05AiRNLqfdTlh/E3HHHVDFuxE0lSjyA1xNoIoDBtRYHSh3gk24qfGmE9fD8fTSvM32u/JC+uFX4eoZRKCiukBiLKVI7I3w
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230025)(376002)(39860400002)(396003)(136003)(346002)(451199018)(36840700001)(40470700004)(46966006)(42882007)(336012)(7416002)(36860700001)(5660300002)(8936002)(2616005)(70586007)(70206006)(4326008)(82310400005)(8676002)(478600001)(41300700001)(47076005)(36756003)(54906003)(110136005)(2906002)(316002)(356005)(83380400001)(42186006)(7636003)(82740400003)(26005)(83170400001)(186003)(40460700003)(6266002)(6666004)(44832011)(40480700001)(107886003)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 11:37:48.8647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 196c2329-f2ab-408f-4e5a-08db0a92122e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT009.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR02MB9180
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

Add xilinx I2C new version 'xlnx,axi-iic-2.1' string to compatible
Add clock-frequency as optional property.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Acked-by: Michal Simek <michal.simek@amd.com>
---
Changes for v4:
Add description for clock-frequency in xlnx,xps-iic-2.00.a.yaml
Changes for v5:
Update description and add default value details for clock-frequency
in xlnx,xps-iic-2.00.a.yaml
---
 .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml  | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
index 8d241a703d85..3f95ff2b5771 100644
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
+      in software, rely only on hardware design value. Supported frequencies
+      are 100KHz, 400KHz and 1MHz.
+    default: 100000
+
 required:
   - compatible
   - reg
-- 
2.25.1

