Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB75868794F
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Feb 2023 10:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbjBBJoy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Feb 2023 04:44:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232583AbjBBJov (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Feb 2023 04:44:51 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16AA46FD11;
        Thu,  2 Feb 2023 01:44:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMQ7IfpcOflPyec4yX1uFu7FzYNlTotUiImHfrK6Mh2tXbBX2RSjiO3iCpOFsi9LY6z41pkpFyhsgbPXQKfZVCM/l4bnL75fZAhzrBNlGJHGN/Tw98D6Ad9TvklilA0yHBT8JDfARBi6L/4X7I1CEM/sBTLHUnmRQj5yF9USJ66hrrNgFvIfuY9LH7S0oKGZw+E0PJPW7eASWoT6sRH7CWNFbzOINfbkW9rd9rXPdvI+Ulc+dOWhsyBhm/GJFMVYRI5+tQCh3JThYgg70a0kCu3B96/nbow+rTT4PXY5q67k8kj8f+g8f74Om4Cp1WaQ51xQzypxDUZH0SkPvPMRXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyPURJ7YvaIZHGY7TY89MiLtQD4FECT8iF9+IpjMrQ4=;
 b=AgbXTSZgVTOCS4HS6C2gXLdKX9Lrtbb20vp7qSSua2S4I2EgCsCpth9LE8dTb8IlkRhoMpSBZ2vu3go/hh1TwVwE1tnfTsKtmzFiDdU+VwU4/v60XX7XDZFmUboyt6786v/BHFxbnF6ICvUyoIAzgoKDWpJKFIR9QLgrqJ2SHJGkPqqBsiGXEaVHt2zWDOGB5m5F3bVh540zfKProdO8J5nOmqIDvO1KUSCaL7bjxMigL3C3KYxudRiKdaqGtJuJX211fM4RADMiHdBWBPEHGGzulDZjCzPfRV/u90H0YJtQQSTnWOegxEwWq/IZSNyXpKcmrw/8mcHxgGWMVO+oFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyPURJ7YvaIZHGY7TY89MiLtQD4FECT8iF9+IpjMrQ4=;
 b=Ppoz9kctsdfPsFyzCKHRCoVvO97kKARm033kYJv+qc32FGKE+IIFiL9ZnoTfhtEapE3VoZYWEXrUeBPKf+TBTigtyVX+GIfNaylUzWRqdm86BZvmwKVykS7VM/LzprgulBi0KtFvkOwrj3DomuC/uIo8fRfgG7CXWuRXDRTBSBQ=
Received: from BN9PR03CA0582.namprd03.prod.outlook.com (2603:10b6:408:10d::17)
 by DS0PR02MB9533.namprd02.prod.outlook.com (2603:10b6:8:f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.28; Thu, 2 Feb
 2023 09:43:56 +0000
Received: from BN1NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::ff) by BN9PR03CA0582.outlook.office365.com
 (2603:10b6:408:10d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27 via Frontend
 Transport; Thu, 2 Feb 2023 09:43:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT036.mail.protection.outlook.com (10.13.2.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.25 via Frontend Transport; Thu, 2 Feb 2023 09:43:56 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 01:43:52 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 01:43:52 -0800
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
Received: from [172.23.64.3] (port=37004 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pNW8G-000Cb0-JD; Thu, 02 Feb 2023 01:43:52 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id 4AEA21055C0; Thu,  2 Feb 2023 15:12:27 +0530 (IST)
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
Subject: [PATCH V4 7/9] dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to
Date:   Thu, 2 Feb 2023 15:11:36 +0530
Message-ID: <1675330898-563-8-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
References: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1NAM02FT036:EE_|DS0PR02MB9533:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe263ae-9c8d-4e68-1255-08db050200c0
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wC9zdnK//5DR849Ah/jPAxjak0B9n6E9vx/318433zsShhivwdZLzvXgZTtnCIGDCHLjL5nbsc+CFsJ2lrCa/L93MZatHmrM9cEYcSkbrBgPeFBTAH+BY8pEb2aQe5lSlrATaXF3L0YhLaF4/C6Cn7nRcQkoYIfhIOhiP4ZdJgKxpp29AkhoUnIK30mGonB9bggiCz8yb/m3DhL3CglANLlQ7jh/MhOBxUDUtC5ePX0El+PYTiavc+z0BV5GHwD2Dt35eLIZBG0oRkIXDfUzRQDu4n/I8jaN4H4lrvw18dJurfx3DD/CkEWTD3CKCKqKI7LMURMrzALWUVCDwk5cbvdi6fXO8T5LrdtWQDNPEhrFmoHwA5tUZ3o+ltzndATv6riWg0bKaEidbNRiC8oWGXBAv410AczONS9m5+yyOR9Ot5s3CuVLO+danPzahOb963Mf24HytdYe9BJdcHqsk9DhtuoSYIX5KYF/ZZ25raZKkVVXhrlfbJod37hFnziQx82q5nLmyMzZEtj+KmexIuMclfhTZ4ycbBFEo6v2/X08cXuiYVuzdVu6UHwOaUe6jJ/TIrWO7JlBAwqLzmx/ae0VmLXUgHF5sIYbD0LSTEpXATAxXO3yb6XYNNbGbGf6FXwEvEtoU8RdieR7hDrGq42CeFgePK4YfBrkz2vSk2i9KSwOg54uEGDJX9zEbD/iY8YO2XSLW1C9mRfSxkXawYHfEkl3ZRER8iUp1bsE+FTfDQ1i0I5hKbYg0RvtDf/X
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230025)(39860400002)(396003)(136003)(376002)(346002)(451199018)(46966006)(36840700001)(40470700004)(47076005)(40460700003)(36756003)(356005)(40480700001)(7636003)(82740400003)(36860700001)(83170400001)(82310400005)(6266002)(2616005)(26005)(186003)(83380400001)(336012)(42882007)(478600001)(44832011)(7416002)(110136005)(42186006)(316002)(54906003)(8676002)(6666004)(107886003)(70586007)(70206006)(4326008)(41300700001)(8936002)(5660300002)(2906002)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 09:43:56.2312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe263ae-9c8d-4e68-1255-08db050200c0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT036.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9533
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

compatible

Added the xilinx I2C new version 'xlnx,axi-iic-2.1' string to compatible
Added clock-frequency as optional property.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Acked-by: Michal Simek <michal.simek@amd.com>
---
Changes for v4:
Added description for clock-frequency in xlnx,xps-iic-2.00.a.yaml
---
 .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml      | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
index 8d241a703d85..92cb9006e8b7 100644
--- a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
+++ b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: xlnx,xps-iic-2.00.a
+    enum:
+      - xlnx,xps-iic-2.00.a
+      - xlnx,axi-iic-2.1
 
   reg:
     maxItems: 1
@@ -30,6 +32,10 @@ properties:
     description: |
       Input clock name.
 
+  clock-frequency:
+    description:
+      Optional I2C SCL clock frequency.
+
 required:
   - compatible
   - reg
-- 
2.25.1

