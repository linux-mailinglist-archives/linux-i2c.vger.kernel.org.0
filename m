Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB07168795D
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Feb 2023 10:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232636AbjBBJpR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Feb 2023 04:45:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232614AbjBBJpA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Feb 2023 04:45:00 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E487D6B021;
        Thu,  2 Feb 2023 01:44:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZw+nOB7aD8ewf6acM9LVb80jPOnhqGhKDuN14Y0ED3JDjEnFzlhJaAU8yPs6DtxJsFBFhFEZrGVx62U5C0dM02s3lDk6UQJr+mIM/p7xLlYn+SasB3oANcjwRBZr9NGrb+rqE2a+6WVweqyUyHxdrYH0l8zyglUyIWYVZvDAmvQRqbYJYUZJnfRDfl8u/v72gg2dMDNJCJSeoI99miVM6okEwpj4b3P4vN+vpCmmMP4OmV/gWwFAxzTJ0gipA1hDHAI0lfx2gBydLXJVBQFWg8Pm9pjKPXEGYYWbOIj04J4uLyYlDKFiegcEPzCHP4LLMCg6n4vI/ahCeTegsq8bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZLZrM4GSYMzhyzC2nQYtiApVF+lzGSXoOy5Fbym7iA=;
 b=XU2DyB3R/4WsYZpfZ63GaC7D4cHwYYbHLryOLWUsKkgKsk0XzNYHzaQQCkKzYTPwxTZ3HQfs15CeZMWcn7hS805/Xm0XLtsnhu/xIWNeSSR5NbDyvO+78juIqXZ7mK6NhpUohzzkeOymt1Y0xoza9Vk9P4VLbNFOHIR1notgIoMC//GWxEQgvo4r1meq5CKb6/Xjj88P1/jJ6rZxcpu44ijC2KLi9J9dQ5UG0DKy/0BKntekwUMa1lnQE7i+4lLKfdEc69Oc+aJ9WL+XiD+b6YVKurqAQywzP3tuwj35bpM4x2OVxxxNeCRLwccgPbcxkQapvpYDEUyivcPuD3eeOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZLZrM4GSYMzhyzC2nQYtiApVF+lzGSXoOy5Fbym7iA=;
 b=JMuyMTTQ+uKsZAx/+zn2YvhJu3yBn1dd/E8LuVMBcNOGVzY+FV5VMTXxO+y/4TifBhP0CTKYqv6T4+2CkjJeLFJRwz5mLnBwDEOHND7oNK+bfbQ97qUFVUze3CXjdDuhrSrcdRBWhUoUAw3FLYCkwGwId75xNthD2N8TKAMok4E=
Received: from SN7PR04CA0019.namprd04.prod.outlook.com (2603:10b6:806:f2::24)
 by DM6PR02MB6954.namprd02.prod.outlook.com (2603:10b6:5:22d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Thu, 2 Feb
 2023 09:44:12 +0000
Received: from SN1NAM02FT0057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:f2:cafe::10) by SN7PR04CA0019.outlook.office365.com
 (2603:10b6:806:f2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25 via Frontend
 Transport; Thu, 2 Feb 2023 09:44:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0057.mail.protection.outlook.com (10.97.4.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.25 via Frontend Transport; Thu, 2 Feb 2023 09:44:11 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 2 Feb 2023 01:44:06 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 01:44:05 -0800
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
Received: from [172.23.64.3] (port=37005 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pNW8T-000Ccs-N3; Thu, 02 Feb 2023 01:44:05 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id 3876E1055C1; Thu,  2 Feb 2023 15:12:28 +0530 (IST)
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
Subject: [PATCH V4 8/9] i2c: xiic: Update compatible with new IP version
Date:   Thu, 2 Feb 2023 15:11:37 +0530
Message-ID: <1675330898-563-9-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
References: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1NAM02FT0057:EE_|DM6PR02MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fc2f70b-ea0c-4693-2d32-08db05020a1a
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uplB1FBnyk9N7MZg+vp7yedB3NHBlGuW3skkhBPt74JMaIl7n2PDEgZBUx5GHbor/huSakxfboa9yF2GW9GUzKOtHr14fEoWzkg5UEyOKz5l6h8sODsJyMAbHxy/KRASlfEjn8a4Hjb4rzM2ILpxt5VB0xYTlC37A26xDb4MgsHDbeBcQipEQHUFKBnAUlyMsCpsxv1qOXrEhtm13Yiq3+2I6M2up94avI4pbnK+VLrXF67jRDEO8A8yPdKumcwrbjUihaumMowADgetQyOV9hGrkEbdmGqD9bfKopkfDvjiis5h7j0Gw3IS5XalsGjumwqsF9Z4TbM+7LwqGTX2wlLolpKjhWCjzeUClsEkU4UQnwmn2FhfwNvTr2Up2Fcq0c2v40KJULB0MsK6W/x+2r8LItOAvWWfayjZWqcLu6y3KblzRK+T/g+72XX8PMiz+PYrYAYkVHN1MED4NW09hUyjZ7Gtp5OgRvvPXrNfNu+wcx9TpcxUY+KqVACuCd34KwJXWipFIIdx4H0Rzd3vwCrfdA0c+rLxIP+rn1pU1i0+lSBeKCJUKOFwF+brl11tbxKdezQBnYzOUGdcBxAxYgNoM0m0jqlhy5ulTxxWYqvDlLGRKm1IP5T87d7GvpxvR+fR2rDAUmQcMfGHO1WSvMG8WaLLwp4cBlT/iVUugDaZeT4rNZ8k7EDlQW04//tVbjc1ZEQmdPY/0sxDj3JJFrZCa1KwRKz899tXi4RD3ZQEaA1fdarxgxjVsy2Yt4tt
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230025)(136003)(396003)(346002)(39860400002)(376002)(451199018)(40470700004)(46966006)(36840700001)(40460700003)(110136005)(42186006)(15650500001)(36756003)(107886003)(478600001)(40480700001)(2906002)(44832011)(7416002)(54906003)(5660300002)(6666004)(316002)(36860700001)(336012)(70586007)(83380400001)(4326008)(42882007)(70206006)(47076005)(83170400001)(6266002)(186003)(26005)(356005)(41300700001)(7636003)(8936002)(82740400003)(82310400005)(8676002)(2616005)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 09:44:11.9837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc2f70b-ea0c-4693-2d32-08db05020a1a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6954
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

