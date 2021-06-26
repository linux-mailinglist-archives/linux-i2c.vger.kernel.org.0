Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3393B4E06
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Jun 2021 12:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbhFZKbT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Jun 2021 06:31:19 -0400
Received: from mail-bn8nam12on2063.outbound.protection.outlook.com ([40.107.237.63]:44224
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230040AbhFZKbJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 26 Jun 2021 06:31:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2TEq0gl7/Blefv8WFw8bhekwpZtTbnOP1v4VJpIg2D4p/1FdmTX8NqmGRdKh8/Uop40vkJIpj0Pq38t26FhhSDdk0TtvRp1DkxM+cNImvdbO+GlvRvQe4xrp9JUrBY0tTN5dvFjAPwAItubflgJ7upZrOMs+DXCM9DU9Xg1s9HAapmJ5ACxo0HDXYkwwojvO1bmVjITj0gwU+Xkey+0hkXwYRULcaAzJu/fNWY3qM+hdC2q4zBdD8aC7s/CeHEJkl8DCrie3TAtC7WXQvAaxN/d3kQ684NrN2WoMkjGYpUxW3+dVxAIQAdXz3npJ9cN0ZvM2YXfsuv5NPp/CpgTPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+rHyRdipJ/VM+/Whnrp1CDYpAEEFhO4ukHZjSHZJ6o=;
 b=QDfMPLjf08+Z9j965ca9GufSEEnr9TNIFGwwksiL4FUUXC3R8wZMASKOESIboFg2ZN4A5XMpLyFHsFNtzK2LhgrGZxPSa4g1tIcbZeWaqgDKeT9rNg9twc4xUkz8LUnFOqZ/HshGRzkC5p2PFqS/sSagFIpuYegGMappIIf3jEVRZRUaX3CIdzkkDsWaKjWO7RHrcPRZPHKGqv3i1GasXhRJBRH1lY9UZFe/UOd3CkfXIgbEIVb6T6DNYDipIVe6sD7vJL3CMJNr7+/hqNMYmwiPmQDOStXvHK9eozm8WpZdRNKQ+mU/Vjx1t/ogfENOtatueXun/UZSYap2aZclQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+rHyRdipJ/VM+/Whnrp1CDYpAEEFhO4ukHZjSHZJ6o=;
 b=g2ELEqc2hjHKWJoZ9kwMNBmrIXR6bPiOUCZIFKRUSfsy4EaJAfXBTqcX1SjIOB5rSpPcbnE8kRZuLXzWZYk27UG3XIpIoRxcKmYTdgjXEFXV2D14DlhgA56xY6Zr9zzpZZH5y3xix6x+cNtLuHswtbz6u0pEaCjSC83AK41fDzY=
Received: from SA9PR11CA0013.namprd11.prod.outlook.com (2603:10b6:806:6e::18)
 by MN2PR02MB7040.namprd02.prod.outlook.com (2603:10b6:208:1f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Sat, 26 Jun
 2021 10:28:43 +0000
Received: from SN1NAM02FT0005.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:6e:cafe::7a) by SA9PR11CA0013.outlook.office365.com
 (2603:10b6:806:6e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Sat, 26 Jun 2021 10:28:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0005.mail.protection.outlook.com (10.97.4.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Sat, 26 Jun 2021 10:28:43 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 26 Jun 2021 03:28:31 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sat, 26 Jun 2021 03:28:31 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de,
 joe@perches.com
Received: from [10.140.6.6] (port=55646 helo=xhdappanad40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lx5Y6-000AWJ-OE; Sat, 26 Jun 2021 03:28:31 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        <joe@perches.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH v2 05/10] dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to compatible
Date:   Sat, 26 Jun 2021 15:58:01 +0530
Message-ID: <20210626102806.15402-6-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f37514e8-0573-4a4d-9be5-08d9388d2c8b
X-MS-TrafficTypeDiagnostic: MN2PR02MB7040:
X-Microsoft-Antispam-PRVS: <MN2PR02MB7040F620E8E9655DB94222FDCA059@MN2PR02MB7040.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 64lecYFMcKoqGo8pvZ+AmdXpABSBsCULKNyCy+Wx7W76WfuQw7Tml0DI8SaywVYEZDB+jcKyBLYykYUekyeVlWqwc1r6uapc8H13hY9I4r4F0R35NptC3YIenxtCn1WkfAlM+QFZaOtJ3GyED8LV88ssOoSA6c9s2Oq6iEIcIm6Xw1pe1yfPnTG1ccwZfn7il6qMoMFXHKsp2UnloNSkyNswSb1DlhKyPpslATM60/v09baXwmupEfjA5cEDej7tqSOu/kb3HU+pmvLSb75OdQvWOs8/lI097ioFr8vxLTkTdY+TZ9IvfRILZYyJp6VAsUJTDJ1OWki8LVequ2Qe1NrmPrISzQL70mT4rzMHWMETZPJRoavOlutGKJomvO6o0DFdSMZ4BbjBSa03AWGU7YNul0hqUOXbI6/0B1l3XtH0cipSwbZSWESaunNfwc7ddsR3R+YD/X7RYNH2raGU1RYGTo9ERhVHoiOvx14ive4/7llG+E9tEZwDbPcFAVAavVJgN0IIiPWPM+KgQNsliFo3bZKohcWmPUGGapffYhmt65bGgctNJIY8IsBvk2hhfvLDTc5FG7s0pxop0VM7X6WgilTldiKW8xR8puUHIpFgSdkBH0FQWQPpFSSweSU6SBRwCO5SWarIf6T+Ea72rAkjbN071FVQcuSDWl9ORSx2dLMipSFQ0c3jhZT8Eus0
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966006)(36840700001)(2616005)(2906002)(478600001)(82310400003)(9786002)(426003)(1076003)(36756003)(47076005)(4326008)(336012)(5660300002)(36860700001)(44832011)(107886003)(6636002)(8676002)(7636003)(26005)(356005)(70206006)(70586007)(83380400001)(186003)(8936002)(82740400003)(7696005)(4744005)(110136005)(36906005)(6666004)(54906003)(316002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2021 10:28:43.7727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f37514e8-0573-4a4d-9be5-08d9388d2c8b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0005.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB7040
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Added the xilinx I2C new version 'xlnx,axi-iic-2.1' string to compatible

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
---
 .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
index 715dcfa5a922..e516c1ed358c 100644
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
-- 
2.25.1

