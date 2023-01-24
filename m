Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFD5678FA3
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 06:06:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbjAXFGv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 00:06:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjAXFGu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 00:06:50 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A978737F14;
        Mon, 23 Jan 2023 21:06:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdDTTt++/KNyeTdCNAH89OxVS/5fjw1UW6C4lKdOckV3thyunb74rxPAout/rDx/BqQOLQ4VgKiO4Af8+wdVGMEOnEMHVJUoDSaB3rmFAwsL4ZRFnX4hz1NZw7gX81P3q3OGZALtRPaPSgqnRLuutsp0RvHA1sT6UdUCTn/xM4TBir4Z9ELYj+OcxnQH7cy7NQuN4Sp4gs14RTSXAKqjJ1uV29tbf0GRgJo4OlgyyynCZWY0NUMfkhWWgufq1dxMSsx2b8GSgz8oBPUdTAqq2kka4GYekWFHvzSwKS/PgHS3n2BM6ikpxhuvQCG1Yw72arzcd5ucO/iBx8Y3DdQVDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZZnzs0iQxqKdtxkP8yCrlEW1QCuOzMXhrAK1oATYzQ=;
 b=kpGIthnQF+NuLLllMt15B9oDeluwjN2MBSQHGC5N1f3Anxhe0WCInk/40SBKV+MSws/bz/jKBMKkLmjOG0757VoW6cTmXtbJsEd9y0YHtEWZ+pV+BOzOblISQVzjOZxO0SxWoYjKr7FKTovFo95E3N3pBNnNg1o0vUqUD3RgTCOYodNFnxHKljElCCVGL0GSZCoYG8rUhXVkUbUyLQ8H89Wrqcj+NuYCXP70n1LjCxdrlmR4UkkrygWPM6b2UhyWBDvh4rapQEN74nrZEAjxVTsQXUz3a707ChHn4uzW9ggNTZPTllmpem4VvcRgQsn0bWyFddMcnGFRe8GJgGTMNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZZnzs0iQxqKdtxkP8yCrlEW1QCuOzMXhrAK1oATYzQ=;
 b=UBzBYMgb0Xz3q9q5fz1uKZtmCnrHR57Zqry3SD4S6/ivf1sy36L6GnvhmngbiW+txRSLyN9wWBjYETxoUpOcTxmcPo5jifd3Xh/L5KHFSIdeO9+nv2Pd3W8oJOX39JVQgFYQspl4Wp1B5kJyQEmQ43nPbsH70UmbZdkYd7z9mRs=
Received: from DS7PR05CA0039.namprd05.prod.outlook.com (2603:10b6:8:2f::16) by
 PH0PR02MB7445.namprd02.prod.outlook.com (2603:10b6:510:14::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Tue, 24 Jan 2023 05:06:12 +0000
Received: from DM3NAM02FT026.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::8f) by DS7PR05CA0039.outlook.office365.com
 (2603:10b6:8:2f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.16 via Frontend
 Transport; Tue, 24 Jan 2023 05:06:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT026.mail.protection.outlook.com (10.13.5.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Tue, 24 Jan 2023 05:06:12 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 21:06:08 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 21:06:08 -0800
Envelope-to: git@amd.com,
 manikanta.guntupalli@amd.com,
 michal.simek@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 manion05gk@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.3] (port=57533 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pKBVV-0001GX-NT; Mon, 23 Jan 2023 21:06:05 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id B16EA1055B2; Tue, 24 Jan 2023 10:34:52 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <git@amd.com>, <manikanta.guntupalli@amd.com>,
        <srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
        <manion05gk@gmail.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH V3 6/9] i2c: xiic: Remove interrupt enable/disable in Rx path
Date:   Tue, 24 Jan 2023 10:34:39 +0530
Message-ID: <1674536682-25278-7-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1674536682-25278-1-git-send-email-manikanta.guntupalli@amd.com>
References: <1674536682-25278-1-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3NAM02FT026:EE_|PH0PR02MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: f216c642-d369-4abf-301b-08dafdc8b6a2
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3JAvDuWcRJ0RHIzmusuvr2mKHtIJvKZ64zTdEPmAsp30cgKtwze/FmhqiwZ00jrj5dfPDKElaabgfvxZcdXcnOlZx1UDXtDlgCyrFnM+Qh79QCpC+0mJWlSJRBPN0wWgBgCYGhc/cIl7Nu4yAKUCLXBAt3QZ/mNFcPlGZxkP/qzgNSBJMOv2zcrHgQomSWX8nb38OQFW1d+BqjFogADxZIhLsLiKtRaOjVWNR4BLjEWA3GFBOXN1t83VEUxVKGN14cHATaDfI8EzA0bS3M//y+g5S41P80sNU2GKdN0mz2giRL/fr9LF3pJX3Cl/DxUAGIUmsNWDC+YhYQfZop/Ct22f0myiL8YsIigfsvsGWW+kUtHxhtmtaDTNHNsZho0jcOpcKPC5gjwexIgiMCkuCfw3wJ53RlCjUKbCvNpwdnWRnNhMPlu0kU4VyBkGGrYGBCtN7aoph0QVoEfW+5D/Jif/Z2PbTkfJY2ixBp+KBj2sfmYxPyAX/FhFWHN75cTTj1eFH04oNNFe7B9Yfm3Dkcsa0pZ9XGuweSvJiLiStI5MxDSkX2tYiiTzeTSA328CezZmQu992ZNKOeb81Tn2qM+4HuEQ1Au2HO/WP9lpuGp0ibyvraxW1jySuD4ykRGXWpiVnEKkO96w6KFXNIA4FFPt9be+WgZ3awXOddTDEgocADiu1VORr4T67Gt9/ef4ob6oMbvzMY0DbcqCLhyyhxEVC7022abCytrCAb4KLLHLmJ//pTc/vjT3aE20gaW7
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(83380400001)(36860700001)(83170400001)(82740400003)(41300700001)(356005)(7636003)(82310400005)(44832011)(2906002)(5660300002)(8936002)(4326008)(40460700003)(40480700001)(26005)(6266002)(186003)(8676002)(316002)(6666004)(42882007)(107886003)(47076005)(336012)(70586007)(70206006)(54906003)(2616005)(42186006)(110136005)(478600001)(36756003)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 05:06:12.4621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f216c642-d369-4abf-301b-08dafdc8b6a2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT026.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7445
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

'DYNAMIC_MODE_READ_BROKEN_BIT' quirk added in the driver,
effected IP versions no longer enter dynamic mode.
So, remove local_irq_save/local_irq_restore APIs from driver.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Acked-by: Michal Simek <michal.simek@amd.com>
---
 drivers/i2c/busses/i2c-xiic.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 554f83e34a2a..8503b5016aaf 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -741,7 +741,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 	u16 rx_watermark;
 	u8 cr = 0, rfd_set = 0;
 	struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
-	unsigned long flags;
 
 	dev_dbg(i2c->adap.dev.parent, "%s entry, ISR: 0x%x, CR: 0x%x\n",
 		__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
@@ -773,8 +772,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 			bytes--;
 		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, bytes);
 
-		local_irq_save(flags);
-
 		/* write the address */
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
 			      i2c_8bit_addr_from_msg(msg) |
@@ -787,8 +784,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);
 
 		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
-
-		local_irq_restore(flags);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
-- 
2.25.1

