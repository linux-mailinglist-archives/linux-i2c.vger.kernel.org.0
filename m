Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBDE655992D
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jun 2022 14:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbiFXMHl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jun 2022 08:07:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231912AbiFXMHj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jun 2022 08:07:39 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F2E7FD35;
        Fri, 24 Jun 2022 05:07:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYT6T+g/pToeztR/E5kvwjcTFzX5d0tfqu3985QhhkTss8WaF+/sdm3grG0NUZMb6bQoIoPrKB6QL13ItQtWyxB/DmKjJsNu3n2c4a5/s3N0aODmztRHI4o1E/5PwUa933by3wsv4VzYAXSzU4kvweJnk8DvGPsxdpGa/x+xZsUAFEc5O9VBsvD+UfGUzy4gJ83K4AS7c47P+Qt7vdpebFx9x40zmXkBOasNgX8/KskBxADU15bHc8WkruxRZAGtpMt18k45lPfWzXxJrsbol70dtwCzw9awFW1T8GDzTOu9RhdIRkKO/Z7WvQPNOAMv3EcEPqJIArjyv/k50oCrWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UglXwQ8315VDT7Db2CyxMMeqT8Qbp4ICreWy9dnboEU=;
 b=ak0qmmp8QkpSgbP5BELPepIYfU9ByFVQ5z1Sc4wA1sX5fpgs6vyKR+T+Q1LE2gYR6mEgnWVcJZuZW7/opqFzPS0b9MKcMno243jF8DItTqNeM28M7J28STWY5S6bmTyqh+z63p4xUD37TDrrdOHqwmTPAVwh+qObr6nMbIIoqKwL9qN5laDiL/Po8Sdp+2sfI5NZ8Cp4l9itfOYPdUFqqgruYPE3hDcHrTqmEbnnw4LxsLlmvBT88G4hkrQIlFFuzBjOc0rrSEUzuaAJhD+pWoX7xyxi4+ME1RsFMNwF+F/7RUHlAK+5XDdobzOKpAyCYmzOrw+KgY2gA7trMcXsgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UglXwQ8315VDT7Db2CyxMMeqT8Qbp4ICreWy9dnboEU=;
 b=ZpYFp5XbXhNbqeM6Lgxr2SCXrRd5SJAjlDpr0nPLYBo4D4Soak5EPLq/bfTCZx4mDNj3aJLBk5VHp+y9RZ4sJ3/eYDTExIBsSHqpPSJ+GBwufSXcFvA7XqQ7RuNkDVanmuq2vSBDfqjwnkZqes5zsAvHf8t2/bW9RHETSIKFOJ4=
Received: from SN7PR04CA0116.namprd04.prod.outlook.com (2603:10b6:806:122::31)
 by SN1PR02MB3758.namprd02.prod.outlook.com (2603:10b6:802:2c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Fri, 24 Jun
 2022 12:07:33 +0000
Received: from SN1NAM02FT0039.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:122:cafe::c2) by SN7PR04CA0116.outlook.office365.com
 (2603:10b6:806:122::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16 via Frontend
 Transport; Fri, 24 Jun 2022 12:07:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0039.mail.protection.outlook.com (10.97.5.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 12:07:33 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 24 Jun 2022 05:07:31 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 24 Jun 2022 05:07:31 -0700
Envelope-to: git@amd.com,
 michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.2] (port=47738 helo=xhdvnc102.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1o4i5z-0005Oz-Gr; Fri, 24 Jun 2022 05:07:31 -0700
Received: by xhdvnc102.xilinx.com (Postfix, from userid 90444)
        id 928C010454C; Fri, 24 Jun 2022 17:35:54 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <git@amd.com>
CC:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH 09/12] dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to compatible
Date:   Fri, 24 Jun 2022 17:35:24 +0530
Message-ID: <1656072327-13628-10-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2853b89-ffc6-4e5e-cdc9-08da55da1ebe
X-MS-TrafficTypeDiagnostic: SN1PR02MB3758:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2NsFFxmG1DK+b9BuMDHuF/YISmiXnAbMuwmrcMAchldpUmSYsOaQtPW2sz7iwIC8q7QLrTcKoBye4TTMgPtU2iNlcpIbbfnm9R1esc18OWG6hnGDNdeMVhJEyfAH/o6P9GATMC826rqUf4WFMyWcGMsVqI7AsMVg/CJO617dgpLnhV1H69JwQ7qDYwVEyz7OrtO4/kmfR9Kiesqa6HG9VsJ6iuJcw+dMbRib2djMLfZP0QUOD4/fL2tOskUAS51u4PXdM4yvYNWQlfUrIKjX943x5i7hj9q/Rlk3Xkk48fKcDU2JIwC3eBxBQJbvzeZTC8Wpnr6YCMOea8SIP67HUuySo9AEOTaWvMBEXkPz+RvGhW3oWlXmRUQr0xcSnnvdL00ap6eOXEbAZpODzd7NqMBylZ80fZqUyfizRqqwDfmXbIdNJHNagJLWG3kslkrxgrKCcMvFJUBIRyvGl9z7rnzIJPQftmwDLzHqddDcqceyea8VD2BlveWMazvUimO/iGmIqBRs5hUVI8u4+u9DEySmvsj3SnxTBhi6r64DXSbA6pZuFWqGnrv5AmvGEihgMuj4V2SmkpeppcKxwcKSod8HEK2uJfERU4BsxSW1cMieibnHq2ynw0SNroYUfuVTMwvEMeysxIBzlkWz24WXuohOCxiYDeixTiYBvqrVTtKJABkieS8fqEq9jYl6vZpt0i2A0IUkqr0o8ybDWMxXkkmImHOap1AH8Q2Q0V9PqVVDIOyp36UQPhDAFPTe+0MlOxvwVi2qY8Ir1BoohaLv5/+eN79qum/Urx4TPV3GaPDJt/1NDzsp9dDjvJml/TPvEvUv4g3Yqq7vW+7mmpLrWOpBCVWTbLgi0WdYapNkUzQ=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(396003)(36840700001)(40470700004)(46966006)(4326008)(478600001)(2906002)(82310400005)(8676002)(70206006)(2616005)(40480700001)(8936002)(36860700001)(70586007)(41300700001)(7636003)(5660300002)(6266002)(82740400003)(26005)(44832011)(54906003)(42186006)(36756003)(83380400001)(426003)(356005)(107886003)(110136005)(6666004)(47076005)(40460700003)(336012)(316002)(186003)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 12:07:33.2461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2853b89-ffc6-4e5e-cdc9-08da55da1ebe
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0039.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3758
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

Xilinx AXI I2C IP is updated with a bug fix for dynamic mode reads.
Older IPs are handled with a workaround in which they are using
xiic standard mode for all these effected use cases.
Added the xilinx I2C new version 'xlnx,axi-iic-2.1' string to
compatible.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
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

