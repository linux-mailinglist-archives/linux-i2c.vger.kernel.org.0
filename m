Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 726435E5DDA
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 10:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbiIVIrn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 04:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbiIVIrK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 04:47:10 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A52D07B8;
        Thu, 22 Sep 2022 01:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaO+XLFr5RTXlF2bCQ2mwkZ/qlxeu6zQuVEd9va8UJZn6f43eyuEEfcX+b7gwPwzw4Cf43VxnC95UdU4g1agB+YO+2a+B6U+H1RE/Gb4VspyVLbaZj2ASumDYck9YnwePBdqbi6GnoWYPzhQg/PvkAZpB2SIFc//4XcyfiiCP1nD2XmddiMuHk6uffwPMaNtJ0it922+lXPF45yPvvJv2prjr7lOJv9SxQHGQPNGwEIlaEhNMniXYfKYn8oICy+yV0Zpxi1rviYENkq4OgvmtfUrTjYDL9ibTMJi4jCPw128jjP15AW+i4ql9tnGOHcYzS5TJoPStp9T9ZRCeYreMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okSr+iEQcgcGyO4EBQbjCiN3vuvsMIawcM/mOV2h7JI=;
 b=UtCnVZGhzy397WGTRbI9hfBdJaoKRnB3UjuI5y936RtMoFaMvUNoHur8QMvpUANIDdswhFk59kMmLSWAaWgdKZ2RLGRZmi/4h3HAuNbwr/eSaQg9wlXKzzs9feUXAXNROJm4OdVCOPsS+0F/u69ghrf3aapWzR49iuxEwed7EohkemHWWHYv75d7ikprtJ1xfU2y09gWeFKnaLNphAIsUfdpl8gDSLYyr4MRSBtZzz4mTq6fYu8L5sJ5dYPD9vmy+XO3CmAQQA6gt2MlqykTbfTk8XpCgzYBsa/zv9v4qIKl3NxU1nh5sC9/A1qIUH5FMC2YY+cOC4Rs7Y1jpeWwoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okSr+iEQcgcGyO4EBQbjCiN3vuvsMIawcM/mOV2h7JI=;
 b=pM0+dRKf/EtE4h1y2EdMYkZsS/usfYHN8OtGGZN2n65KC4sBBz5zaWcoVKaY9URuGwzRAfp5w2xL6Tp3kaVATj3dwhddIq+bAxiVzQOOrW6bngPpcnQYA171t6IJj5qsGF7qC+3tswJ7M9BAtuyvzdW5rUX9nRLRu7A+oanauAo=
Received: from BN9PR03CA0031.namprd03.prod.outlook.com (2603:10b6:408:fb::6)
 by CO6PR02MB8706.namprd02.prod.outlook.com (2603:10b6:303:135::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19; Thu, 22 Sep
 2022 08:46:57 +0000
Received: from BN1NAM02FT043.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::cc) by BN9PR03CA0031.outlook.office365.com
 (2603:10b6:408:fb::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18 via Frontend
 Transport; Thu, 22 Sep 2022 08:46:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT043.mail.protection.outlook.com (10.13.2.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 08:46:56 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 22 Sep 2022 01:46:36 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.9 via Frontend Transport; Thu, 22 Sep 2022 01:46:36 -0700
Envelope-to: michal.simek@amd.com,
 radhey.shyam.pandey@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.6] (port=54845 helo=xhdvnc106.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1obHqu-0001u2-3u; Thu, 22 Sep 2022 01:46:36 -0700
Received: by xhdvnc106.xilinx.com (Postfix, from userid 90444)
        id C67FE610BB; Thu, 22 Sep 2022 14:15:16 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
        <shubhrajyoti.datta@amd.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH V2 7/9] dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to
Date:   Thu, 22 Sep 2022 14:14:52 +0530
Message-ID: <1663836294-5698-8-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1NAM02FT043:EE_|CO6PR02MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 03060c63-1d27-4651-9b7f-08da9c7701ab
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ZZFK1okCiL2LZ09pmIFZbdyesRPNLNtZ1Sg2mnYYaJq3eVnm+ROHd8f6/MgG3wKlZQhi97PTBT6FHUyqhIT4rcQ1lVqPlb89ktXLtqsEcGV/fGeDVdImJ6XL/siiCnLbSSSeqt+aSI5g0AuXjYzAP6KntHsWw7gNyeWxEHSOgyp1oYyHf3sTL8K0bO8i2HZvTjFwzBqQfiW1KYhQfNXGuG7K2l7kNyiJM1aBniYScIVwMDFyrBWE7x78dPI2Bl/VBtIsEThh0nGhj46NdDOWCIFwpoMVFTUFvA0Ov0CzbmVQbQmaKpqQ8y+IRvQ8r7eYMuVSnM1hZrsYUiLIDk2pfdGWSwwHxpT5+AWb8DazczKRUgPiyCmJ2k+HO5UDP91ea+u4rhWG/7qAglMtZ0FAAeUvPZjOzmiRrIFQPbLiy1Rzat6mw08GzrkZ1YtOur33WIlXlwcgrisxrAxRxqC/JO4AXFthWEYqNYeO+KjppQLbcjYJuseEfAc/I6W3NTXLeziuWwhUFqU74EA5b+9z4dLR03GVQe7+D/caie0cMjQFRJM9V43vhug6XMu2yLG9A9gumMNapEBAWFFsVLRQ65yP98OD65b7PXxxRSR8gIh4ApClXUz4wkcd4CShSvsyeGfhx8smx3+yADiEv9Z9JPj4HRkAOiK1jN3BMfBz4Ufdc+jI4yBdH+3LvEzpHUmTDQIZ+UFCs2GHKoxgiVIARBlHti7ippNqbW1MHDulb5wl6Hr3aHpD7wdeBsGwvj4FswDKBDu80YlXTBKBhS4u1dMTw2rXAibKv09YTGaswIsnEJLBDSymlHesd2j+5HR
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(7636003)(82310400005)(356005)(82740400003)(478600001)(6666004)(41300700001)(4326008)(8676002)(316002)(70586007)(70206006)(42186006)(40480700001)(83380400001)(186003)(44832011)(107886003)(110136005)(54906003)(36860700001)(2906002)(26005)(6266002)(5660300002)(40460700003)(47076005)(8936002)(2616005)(336012)(426003)(36756003)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 08:46:56.7849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03060c63-1d27-4651-9b7f-08da9c7701ab
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT043.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB8706
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

Added the xilinx I2C new version 'xlnx,axi-iic-2.1' string to compatible
Added clock-frequency as optional property.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
---
 .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml       | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
index 715dcfa5a922..be6c18b2c19e 100644
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

