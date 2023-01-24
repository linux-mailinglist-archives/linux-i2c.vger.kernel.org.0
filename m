Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 166BA678FA7
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 06:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbjAXFHX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 00:07:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231601AbjAXFHW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 00:07:22 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E74E30E8A;
        Mon, 23 Jan 2023 21:06:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4QCFhHJU+oYxjtLIFRQ9pqW8RGyfWRDXJbAKcRPLrqq8ZQCH1S1WUEq7Jzu0bsF8O2tq2TUekW3zsPJv41ruqnfBENLPicNpoNDTMJeaLS8ewBub6p9NnG+pvcnVF+A38HPU+2RnHCf33DcLkqkPYnyIMFg5H1nqDgiZgL2u0C24gfvp+pSBCMq8UQ0VrbXrOWz6eRUcxAnAETHjNulxenAA3dT2Uxm8gT5HnnYFxhro0BL8xzpyoCdJiulefoKBFiAZCA5R66BpS/Ky95ucvexIGL/eC/DEKM8ux9EMVirZsHMNTE1/Bf7ZH8tcNFAd9lMMMJG1uxwm59Ak/SDvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZLZrM4GSYMzhyzC2nQYtiApVF+lzGSXoOy5Fbym7iA=;
 b=kgkLbu7dNdeP2iDqoMkQBuCcLlDNvzYYl05JAyYzYfbXMAURJKRsdnt1yJompavhngvSpYNQPbaY6uZkmz4GsHAfIPLG90MDb54i1J4YYzSVjMLLvbb+U3AeW+ft+Xx4o64JlJTgUAaahGXaCaR1hLQ0mauxYhFg/5igYcWi5VWwrMn5nvKQdQGSgiXKME1HwarxQL1c8Zm51/b5M1PS/wSmbDmPrA/869AFeylp0lINfCXu5gDPw58HJsK4tQniGPElY4cAR6rD9RzfYc22q1YIrUwuk+IZUbrSFLCYnBT87MHsysSfIIIU3V+7hUoyn7B5Ijlyo/zqSsYX8M2NzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZLZrM4GSYMzhyzC2nQYtiApVF+lzGSXoOy5Fbym7iA=;
 b=Rd4Wd3dBjH2z5ie1wn6UxeTnHcKL3aBmPZLV+2D0zqlokmCr3YMuVgQTU76lHtctAUYJ49nRntoFF8dy+6VwXfY/adjbmRPuE435jcJqgdPJZUAcJTqbr+2BNnZEFawf+PePLu1MC37hLjXcI9lupMkCjgAioJqHHBtAsSCMsDY=
Received: from DS7PR03CA0359.namprd03.prod.outlook.com (2603:10b6:8:55::35) by
 DS0PR02MB9080.namprd02.prod.outlook.com (2603:10b6:8:13a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Tue, 24 Jan 2023 05:06:34 +0000
Received: from DM3NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::50) by DS7PR03CA0359.outlook.office365.com
 (2603:10b6:8:55::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 05:06:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT015.mail.protection.outlook.com (10.13.5.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Tue, 24 Jan 2023 05:06:34 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 21:06:32 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 21:06:32 -0800
Envelope-to: git@amd.com,
 manikanta.guntupalli@amd.com,
 michal.simek@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 manion05gk@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.3] (port=57541 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pKBVv-0001S2-TP; Mon, 23 Jan 2023 21:06:32 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id E5F861055B4; Tue, 24 Jan 2023 10:34:55 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <git@amd.com>, <manikanta.guntupalli@amd.com>,
        <srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
        <manion05gk@gmail.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH V3 8/9] i2c: xiic: Update compatible with new IP version
Date:   Tue, 24 Jan 2023 10:34:41 +0530
Message-ID: <1674536682-25278-9-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1674536682-25278-1-git-send-email-manikanta.guntupalli@amd.com>
References: <1674536682-25278-1-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3NAM02FT015:EE_|DS0PR02MB9080:EE_
X-MS-Office365-Filtering-Correlation-Id: 49cad61f-6b2d-4e7f-81d1-08dafdc8c3a5
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AxdsaSC140B4h1ZBVtLV52ENc5oKfE+9Vc6CR1sgIy0zW7epaYxrAOC9GL6hPWnsZBdUX/S5e9QH6ySmT4hS+sN/JEzAM5UKvr63BXOgAHfuIyZl0aXJUmdAvRJXrMMkwMJTkorH36K47oKuKiQA3WKundy8Pv5Ku1yeezz3UdjzuDwVboSNAuF07lfw6AqdNxMnM/qOye+pJdaVPhbOU8l8cYBZV/+veBQD0oJ2fw9HQAAmWdu8EKdrDT6OmiJ20vtIZ6roBCuQERZf22P2Zq4Gtew9C4MA5HRpVKbPnAlmQQZmy8gjrr6Y0R77Gkzlxj59IWAInrsc/h4cJz9om4EEjQeq2ay/c1YUnPnlQqBrmmpz3t9kS8JvcmEvam4Eox4ba8LOJ1mDwUyW6ugsy8NxxgS9i8ya2yEQViSIqqVsgtIyRr1wXonE6js7IvHFi21SpbZsPwd5V3ZDA5dbTvxN/cp9YvxxGVqM9X4LU8YwnyDfe/g+IlT+S+yIo27CV1ERS+SlgUjSfe+P4mCQUoW5miu0D2AAMHwygEEVLOcBP5iPpHJxjQXfuePOoLVrW8wGQCEl+SzkgVDpxPpQrVzk46b7kogYvniwpQFSDlwIRKgo3vG06f0BmPzKTk5JfSyOePK5WRflGiAXSUVlHfnI6G4FWTuLpaa/yUymaHXB5eRSi1hMZfR6kieS1vKCW0NEn9H71N8UmNcqRrd0FGu36K/PDJMOmdnIPgxDjgR7nXr6RFzz4ho/xaakQP5Y
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(40460700003)(40480700001)(36756003)(54906003)(110136005)(478600001)(42186006)(316002)(107886003)(6666004)(44832011)(5660300002)(15650500001)(2906002)(4326008)(8676002)(8936002)(70586007)(70206006)(41300700001)(83170400001)(36860700001)(7636003)(356005)(82740400003)(82310400005)(2616005)(26005)(186003)(6266002)(83380400001)(42882007)(336012)(47076005)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 05:06:34.3099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49cad61f-6b2d-4e7f-81d1-08dafdc8c3a5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT015.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9080
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

Xilinx AXI I2C IP is updated with a bug fix for dynamic mode reads.
Older IPs are handled with a workaround in which they are using
xiic standard mode for all these effected use cases.
Added the new IP version to compatible.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Acked-by: Michal Simek <michal.simek@amd.com>
---
 drivers/i2c/busses/i2c-xiic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 8503b5016aaf..682b3567e83e 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1074,6 +1074,7 @@ static const struct xiic_version_data xiic_2_00 = {
 #if defined(CONFIG_OF)
 static const struct of_device_id xiic_of_match[] = {
 	{ .compatible = "xlnx,xps-iic-2.00.a", .data = &xiic_2_00 },
+	{ .compatible = "xlnx,axi-iic-2.1", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, xiic_of_match);
-- 
2.25.1

