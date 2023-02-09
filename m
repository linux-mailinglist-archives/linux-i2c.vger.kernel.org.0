Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB2D6907C8
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Feb 2023 12:51:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjBILvs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Feb 2023 06:51:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbjBILvF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Feb 2023 06:51:05 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F5A29773;
        Thu,  9 Feb 2023 03:38:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqAY3LPKpLOWpnrySsu3PgPU5Gr2a2gBkRiMWpEuShj9iT6zjH7u3UVoBPb4kzfa2UBncIUp4f72c6quF8p2ZiDDMcXG1Aw8rGc+MhMJFQrUvkRdsMMbIuOgvxm17WdLqrhjjzcoyUanAkroGT+IEnrtQavO9ce7AEj5OSw9D2IKYsdgzDL+uVCF1QqDwNGESAJwg91bRX8vp3jSe+9cPYf1m/8cfEHwOu+CjgOgGhvoX4aa892Bcmxeo34LfjESafCSq4RnaV3WsXW0Stz7h+dzyW0hGPh/ChDm7NoQhNaBA72OekIAk9IeFCfOdfHCCs6laE5BOt0BNU4G+Tlwgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEVsbWMhvskk0tDHfRtWjbb5khEKp1SDVyrJPV5vf04=;
 b=X/Q8KEbdGTeFBaZSaBlKKe05rpWp19PNVIh6T+I2skOTU6gyChdQzQ1LMt9E02tSFWngEQ9AfgxyAb/8wouN6ZaE6Ox6klRwYwsd794A3TaEY27q2NzCv+IyEe5obz06SexiSSx453TkQQrAUO/VKJ5f4cMWY3WivXibTe5wXnD/3oBENPEdeU3JjPfi4z7mH5fQMtTxGkQUKFravisawvFnldi3fv11Wyc8SJFLb9Xe3Tm+TUIYIE8TDi0aObSvCQTxuBXK6ONZGlQF1xtuJKfLg4pckizY8HO2iqeAfmK3RE/FyyR5a2iGE2AQC5weUvZr6d4rEs7BxsFwY4BmnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEVsbWMhvskk0tDHfRtWjbb5khEKp1SDVyrJPV5vf04=;
 b=fPc4xec45CBoc3pdwKImTGSI3xkH42/xQAXflyyRZMH3+i976BieCAKep62JQgClQD3d/4VPDEIYumHd91vX9hknhfM5bEqeKat3rMKhkbn9LuG5zv94FwC4kLGUbVoJ+Xe16mSgyo7buPKPA3weYSTQ8PuOKkkDIGjXOaFB/sM=
Received: from DM6PR06CA0025.namprd06.prod.outlook.com (2603:10b6:5:120::38)
 by BL3PR02MB8185.namprd02.prod.outlook.com (2603:10b6:208:338::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Thu, 9 Feb
 2023 11:37:59 +0000
Received: from DM3NAM02FT027.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::b) by DM6PR06CA0025.outlook.office365.com
 (2603:10b6:5:120::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19 via Frontend
 Transport; Thu, 9 Feb 2023 11:37:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT027.mail.protection.outlook.com (10.13.5.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.19 via Frontend Transport; Thu, 9 Feb 2023 11:37:58 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 9 Feb 2023 03:37:56 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 9 Feb 2023 03:37:56 -0800
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
Received: from [172.23.64.3] (port=47173 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pQ5FT-0007SE-QM; Thu, 09 Feb 2023 03:37:56 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id 1AEFE1055BB; Thu,  9 Feb 2023 17:07:31 +0530 (IST)
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
Subject: [PATCH V5 2/3] i2c: xiic: Update compatible with new IP version
Date:   Thu, 9 Feb 2023 17:07:25 +0530
Message-ID: <1675942646-31006-3-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1675942646-31006-1-git-send-email-manikanta.guntupalli@amd.com>
References: <1675942646-31006-1-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3NAM02FT027:EE_|BL3PR02MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: d537d8e2-4de4-43b5-9395-08db0a9217fa
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SDJg5qtDSlMkDYf8d3ufPKEI3/v8ubmUV1nStq4H9phLFLKLu4QllmiLyGGZ/C0KBuLiUMP+QXee5xUkU2A/00XMKI0BZmYZ2h+PtdDSTtaFela3fD0tM91Nh5aeGl73AHgtpGntMjVR2pKgqSYITkichpm4xYU7tc2EOq1Pn6MptogVlyYNITttVvjxeIv786kxtNS2/obbxgTsMMLfLV2Dsqdmrfw+fzxf3h3mDzzGVv9Ncj+3be6dL8EchDsd5QIQuEJ4bR7gGC2wrzNP7/szSJQwVI3k/NZ4CwfLvw1189onpup4kC7s0BepNO51ckUYeIvq/jl+/Yijssywc9FUQ121oOWpB05TB/O6jyTYYrU3Owggg954IIP7K1ZAJTtSXRVoD9XK9l7bVWyFHaQ/f6Bc8Wy2/g8R+itN7zd+IQX76YhgkMJ4L0SHJIjPaGS0TPCft5yQJPIB6IvXFPXkxS7fb0DradfCXICvBmCIDvyFj6HfJlebhaJywBc4NJs1AtoJM+EbVTFzk8cWDrRDc4ps2nbEUr/t2gy/KDRI3W5/q7aYuwuM1qCW1kUtzRNN2S9uvg+N0pWnuR8SZ0rVfJiI1vvb7VAcSvWiKfrljYkzII8bIGENcPRIhQirV+IRpSE9/aXLJhSOIherWCswvN6ILu5SMo4GLQdhCwG+SoCzGBC1MDWLvQOSwsko+z8N8iqRt+K4h8HXir+90iFatX7QFZBDWX109uQyp3WMnIHI4BKbf72Dgg6o4EV8
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230025)(376002)(136003)(346002)(39860400002)(396003)(451199018)(40470700004)(36840700001)(46966006)(40480700001)(316002)(42882007)(36860700001)(42186006)(478600001)(47076005)(83380400001)(110136005)(336012)(54906003)(36756003)(2616005)(15650500001)(40460700003)(356005)(26005)(6266002)(186003)(44832011)(5660300002)(7416002)(70206006)(70586007)(4326008)(82310400005)(41300700001)(8676002)(8936002)(6666004)(107886003)(2906002)(7636003)(83170400001)(82740400003)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 11:37:58.5920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d537d8e2-4de4-43b5-9395-08db0a9217fa
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT027.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8185
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
Add the new IP version to compatible.

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

