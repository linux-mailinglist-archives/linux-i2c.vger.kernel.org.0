Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB67559932
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jun 2022 14:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbiFXMHx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jun 2022 08:07:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231927AbiFXMHt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jun 2022 08:07:49 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D7B87FD2B;
        Fri, 24 Jun 2022 05:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHmnaKOB4MbX2HpUIzDv37R7SI49wpSyTYezfOcCb8JIpzPjFX9qOvHOaCeRNrSMyM6vQCbbzzy3XHMIFZBJMkvS8H6q8H8fJ/iZ0AJbZM4oe1b6r5bSbA3Me6tLUoyQOI0CPEMUqVG6I1oDSl9ZMaVMxTc4TBuDg6vhaqUNNb5DPRh6gMf2pmHms3WNKhL5j9tZO6ynqxDIOa80bsqso0He6Q5QmCgLheMviAHnvCDTXZxWP+eU3HKMbX+Bgt+fuqSaiGm6GOBpQxDPVwwx2Qy7NN9Sxt/JBaPa3vQz2ArdnXCn5otBfPXCP+qPqFi6TpdYJ9w+aiptjqZEmT3qUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFmVjPRDMbpcURpGuyh3Ti7h8x3zMgfIulT1JWjE1ho=;
 b=RtivwALVIg4Xq4oI8z0QO/g+uCzUSZenXCffUNGPEKykVItc+YjT3hz3+wnyTspW9ivFw1z95gV5JEv+xS8cqEx1pLA86YBClb830bPhOgo4Pqu0z6Dk4V0mLNh4wseqFykhFClA4XjEKD1L9xRsDn/FeaFjBdeKThyKTx8qgvMNiDPKNhL/KEmGdFJgYAmaS5qNCrpc5qgvIes+e+LFkzA/lMBpdmCvgUXtik3BYdlMa7xWHnPLudIeWTrRY9enEbO6NRsCdcAUCJVnzfevXFAq8yF/UCbufDqRVCd5MOX3zAWbZbtBdwbDwrC5U3r2Kg6yYgf5Jv7EVNpuGPW+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFmVjPRDMbpcURpGuyh3Ti7h8x3zMgfIulT1JWjE1ho=;
 b=XkD/fn4Y5p4ThM2iABj8SY1jayugdPiEmBsYap8bYZABfk8qqyuaVGrO4PhH0yWcQwsmcS9DFIU8zc3QYlPUZZCGkO1HA4seslshATImwDM/SN8vV6pbhhCroEa9K0STZSLQBy+VqaOI0d8e5yr1jeKFH6qtuUqy9ZxLoznIqyQ=
Received: from SA0PR11CA0102.namprd11.prod.outlook.com (2603:10b6:806:d1::17)
 by BL0PR02MB6513.namprd02.prod.outlook.com (2603:10b6:208:1c3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Fri, 24 Jun
 2022 12:07:45 +0000
Received: from SN1NAM02FT0051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d1:cafe::24) by SA0PR11CA0102.outlook.office365.com
 (2603:10b6:806:d1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Fri, 24 Jun 2022 12:07:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0051.mail.protection.outlook.com (10.97.5.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 12:07:45 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 24 Jun 2022 05:07:44 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 24 Jun 2022 05:07:44 -0700
Envelope-to: git@amd.com,
 michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.2] (port=47739 helo=xhdvnc102.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1o4i6C-000BZC-Jo; Fri, 24 Jun 2022 05:07:44 -0700
Received: by xhdvnc102.xilinx.com (Postfix, from userid 90444)
        id 8111B10454D; Fri, 24 Jun 2022 17:35:56 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <git@amd.com>
CC:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH 10/12] i2c: xiic: Update compatible with new IP version
Date:   Fri, 24 Jun 2022 17:35:25 +0530
Message-ID: <1656072327-13628-11-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d24a4ffd-4658-4487-c700-08da55da25f8
X-MS-TrafficTypeDiagnostic: BL0PR02MB6513:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EhV7j5QofGerxt9KSR1mA5mUbtenTx99s8/8hEJ2yEhivkzd/qZ4DEHRSup/yIBkd3sONp+r3IzyFYqAGoBQBw9FDLapbE0xBE6GcOU3v4NsrfJ30ogEyvvJUITr0xK17Bi08oobqP1dSyElVZedG036kLZWkw+4YDrVMNurwP4l43f8ws1YSQI0iW/oibWR+qSLD2W3uoAvkOEffAVhxfiiSEexw9n9czxuUvFMV7Ync4rT4xT0uPujOrJb26TiQjGxFiLUIiYMRApcQBnNR4q1JOxUHNHnvWGMMOT7k0jm6o00EiKrjsDPVigC+3PYwi5g66z0qu/z/zewu0oBZWxHzPTViuPKclL7dSyHQb4Z9wx1NgpPgvBpxWb+um2/VRoR/Xq1QRvydhW9dkGxtFVJ7R4x0r9fQkBwlYuiNUsTSKN6rpQAVxB95/CXmQut2BRnYq4YDRXcodet2qoY4fZeq2GBXIH2qTBu2jluE20TLBQaHm+b9qV03lyiOj+M1xLV+AwnXXT1JphlIh7AZ1H2BIDK/7bnZlCH1AvFNtKw7+/PqyUL2Zz4D8UAehLE7z0WVgW0QIzOk32cMWlJ3RmqkZYsqByVwdrV+rqx1qNoxK7lbGN24IboKuR5kubCGw0/ndW1vlzEEkPlSCXXfcIFwvFsGB8BiNx2qeL1elgsRpipQi4VXrCBVB54Wha3po/qHGcU88OCBi8xpwqm8gBJEe87eEahTZusorBeyR5tY3io1Nhsw7nOB3YFtkejDncmQdFPZaLVEybLfqKYWn45pJQ8RS1qv/MahuDW1RMlCjUJb4/U8LRAX+ht+1pyGGMoriaYQaKQheptElTNu/V7JX9YAP9EQh9JFYDZMls=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966006)(40470700004)(36840700001)(110136005)(26005)(316002)(6266002)(41300700001)(70206006)(82310400005)(6666004)(356005)(7636003)(36756003)(4326008)(36860700001)(70586007)(54906003)(2906002)(8676002)(336012)(5660300002)(47076005)(8936002)(42186006)(107886003)(426003)(40460700003)(2616005)(82740400003)(478600001)(15650500001)(83380400001)(4744005)(40480700001)(186003)(44832011)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 12:07:45.3701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d24a4ffd-4658-4487-c700-08da55da25f8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6513
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
Added the new IP version to compatible.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 720aa671f74b..f9492c39d3c7 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1112,6 +1112,7 @@ static const struct xiic_version_data xiic_2_00 = {
 #if defined(CONFIG_OF)
 static const struct of_device_id xiic_of_match[] = {
 	{ .compatible = "xlnx,xps-iic-2.00.a", .data = &xiic_2_00 },
+	{ .compatible = "xlnx,axi-iic-2.1", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, xiic_of_match);
-- 
2.25.1

