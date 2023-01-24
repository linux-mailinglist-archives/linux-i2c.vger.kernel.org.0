Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72CEC678FA5
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 06:07:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbjAXFHH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 00:07:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjAXFHG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 00:07:06 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF13D3B3D9;
        Mon, 23 Jan 2023 21:06:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9yTXvpYBIET1ggvjDe9xBf5I7GZohRiavONjUsYoQKk+ma8yz43ncKcKutZbWRlrLfu+d03btygVHRhWaXmCi7MSEkhMhASr8L1Ki30XVSUrGy8IxXTF+UbITHL0XhicrpAdqJTjDCHTpbnZ/pN0UALTdODtZ/fr//tl/7WJAVMhJr4k5YISZwijaPb7O36ML69uoQBEhXqPY2aA9yK4wKZ7Vt89IxwaV2EKuGeYF2WFfFLIqruYBLKJx/MOw+hN0XeKGIJS29zbAlIBqwGftc1+WTbnvb7VEr+3++DER7OmSXh0MtV8FhR6Tr+IZ28SJD82llbc4GfgopL3l8GcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYwt7cMrZtbnDYBwuC4rSPWfWTckzOwSS3KipnVDL90=;
 b=ht+tSbr6DcZmwzdPH8qW+8pKDMD2PENzq2GmlJxe4Q9UUxy9s0hLwBvFQVFnq96BHWsqZ76FSLTn/bTbwBNcvbr2fpGCE4FYx1C2nXqheGym7ZnGWBUFFaNo+L+8rzpkzBIhoL0Id5DOQ3tu8iFVCgR9yf7BUbnH1p+97Wx+1+ATm626HzkZWw1Rdt3ntQXlTWSGNvZjFuOP/2g4wHggPZpJx/7nSu2Jkh8Z5WFYlqKa6IQnVfu3BOim7jEvk5MNx4mAkmPiBOP+jlqIdd3mM+3qzpIJFMfStbuaokKvmr0Nqd9OPJRDwc/0QvNEedFcmkuTz742TfWoA8DqktKalw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYwt7cMrZtbnDYBwuC4rSPWfWTckzOwSS3KipnVDL90=;
 b=qwbh5yUTBKB8ytkEPdzOKJvE4qowbmJJ8Zj3vorh7bC5bZj5o561S7iXqByRnEAupVl8oQ64oDg3RFtqQfdA3xdLUNAPN7odTvGSmFtb+/NTdDqTDpAtKHa4BQk6n86VsNxy3HxelK+97HbZtXRo0VOApO5AToLbt/1VFk78OxI=
Received: from DM6PR02CA0113.namprd02.prod.outlook.com (2603:10b6:5:1b4::15)
 by DM6PR02MB6972.namprd02.prod.outlook.com (2603:10b6:5:250::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 05:06:25 +0000
Received: from DM3NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::67) by DM6PR02CA0113.outlook.office365.com
 (2603:10b6:5:1b4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 05:06:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT036.mail.protection.outlook.com (10.13.5.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Tue, 24 Jan 2023 05:06:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 21:06:19 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 21:06:19 -0800
Envelope-to: git@amd.com,
 manikanta.guntupalli@amd.com,
 michal.simek@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 manion05gk@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.3] (port=57535 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pKBVi-00041w-QL; Mon, 23 Jan 2023 21:06:19 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id 1F4981055B3; Tue, 24 Jan 2023 10:34:54 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <git@amd.com>, <manikanta.guntupalli@amd.com>,
        <srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
        <manion05gk@gmail.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH V3 7/9] dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to
Date:   Tue, 24 Jan 2023 10:34:40 +0530
Message-ID: <1674536682-25278-8-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1674536682-25278-1-git-send-email-manikanta.guntupalli@amd.com>
References: <1674536682-25278-1-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3NAM02FT036:EE_|DM6PR02MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 54b3fd3c-df83-4059-402d-08dafdc8be50
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IM+EZdywaiXvL3umzMSa+GF4sRozoKnLKfhJFipWSYpTGOipJ6SZUPXMI4HCsgwDQyIPvMMxe6xqUJtQtnkPpk+7LqZa8cMHriRUx20ue64WX0iFdQtN6iE1EP+f/yDdbVMtuNkZ55u3ZI4HN+dlVx7lb217ZGM/iuR7CERrSAKPIFbKafwRhvsaVjyrQ35g/1/TJL4nzPxtr2pSMjvlajlRziSPWib4W9Uguib0zA2YMe3ERWzMA9JkHB8a03xZwLK5TBlL4KwYDwkxQfy5eOVRD71inTClKqaR2AaURUs0gqYMKtlkXxjZYXiZ0Z52XCxFHxBgvqitDfyMueyOmHN0Cdl00ENCov1fNLX1l1QLC6FsXBokAOJ5I/IBJ7KTc6R1GdiayAKrggKaNJyw/1vQHiyu64z+LF22VUiSwDCmAqdeSJNiEYleIQkbkLdak5bRuj0VF+7P084oipLaR81KDATqNklBDZ5QNS4lW4Hkn+Y45gYYUZ2M/0enWcwq4c3Z9vDB+9B0030AEFqHaH6YIVHjOAM+7xScBo4aP+3v+1cdpXOYqszUhUiwITXeeCLanC6vJGGpv6Cb4XLYRF6wMYOv8c4MU8hj4CDUlY9vLyTpORr489TVSeQnW5kWsPftKEUF/vJzOVxf8nBvTSJ74jlyHEmugvVglE0oUnd8lN+5OzpX7xtbFnHsqLSJihIbZScXkWLriqAscavhPo5V8MPH5k20Mnqd/hdfLV/VNx/S8aAjVg6WMkJe1D/P
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(83380400001)(36860700001)(83170400001)(82740400003)(41300700001)(356005)(7636003)(82310400005)(44832011)(2906002)(5660300002)(8936002)(4326008)(40460700003)(40480700001)(26005)(6266002)(186003)(8676002)(316002)(6666004)(42882007)(107886003)(47076005)(336012)(70586007)(70206006)(54906003)(2616005)(42186006)(110136005)(478600001)(36756003)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 05:06:25.3625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b3fd3c-df83-4059-402d-08dafdc8be50
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT036.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6972
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
 .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml       | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
index 8d241a703d85..42488a67260c 100644
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
@@ -36,6 +38,9 @@ required:
   - interrupts
   - clocks
 
+optional:
+  - clock-frequency
+
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1

