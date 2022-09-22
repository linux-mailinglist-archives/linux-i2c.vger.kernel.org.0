Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA1315E5DDE
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 10:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbiIVIrW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 04:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbiIVIrA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 04:47:00 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 412A86AE93;
        Thu, 22 Sep 2022 01:46:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ge0ghQ74EQYRWPa6RObwOQ4zo5/FBpMEl9ET7M3EsQO/RmybyIbV/GargsgWgqNPmtdyhIDzCKUrlYnOxCyTPLM4l6FC9ahlMMdxzTLiNSM2gfi1CgdfyfHOUJZQUTF4iImeY4fMROljD7S0VU5xqu7qMud6djNd2y9LvPbgrrQPmhdpwerMCdSUzgvBxccJi9semF6PvBHOuo8oKvigf5HaFHFqBtCP9FCIa2uJfauu83NFo6Lyu/bJd6hDV0O6PLKnaitUuoVxRCO647HPHxaWpb6+7wdsKMZNySThjovLfgwhEAIdlcjA9R+jLqkkftnKCkKjrTba+mPv7zjD4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnTYSsVAd6/RmHTREkppQ/vRl/sJDn4n/3fjpNh/Azs=;
 b=nzMMy4zvNupnnWDLYhy1UIh9oGL4I85O7ZEd82M6xD/MwadMITf9AtZjn7y4BHeZ6BLIcpEwVc6W4YMje5EdhPQ4/M6b9OIzt9jPpaxihVpRGSHS/IC0SxR/XD7yiE6W4yt08FDutELkJQRhNkqQpeoYHBsAwfpjzPsd1OQivfQYZ5mfoFradErFzG8g5mFcQUJswNdvf+vaLdr7P5086kD+J8Gl731khsulfQ5Hf0h0XyVSs1/Sh+/f2dEfZKEEewl2jh96t9Csh7phoM9wO0wIf/QhE2ISSLYZebHoAjcVQ8kjOf3oILal5p2iyJgJTJvnpUWTN07V2sXFFCBGTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnTYSsVAd6/RmHTREkppQ/vRl/sJDn4n/3fjpNh/Azs=;
 b=GhqpYESJlBfRGNj/OjIVAyXpYxqkVn9fzDyYPlZ50FusmQ4dMIiVWLQZT6dd0YbJSIxwCkd67hjY9ISpAXZ44aOU6+5hMMrNlkTdxFcc0TisFIYvZsopTi2OHwJy1wsBYr16x84w9GHIa6HXNhkKueVFUJDFpm4OW+UUTCws/V8=
Received: from BN9PR03CA0368.namprd03.prod.outlook.com (2603:10b6:408:f7::13)
 by SN4PR0201MB8712.namprd02.prod.outlook.com (2603:10b6:806:1eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Thu, 22 Sep
 2022 08:46:37 +0000
Received: from BN1NAM02FT058.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::7f) by BN9PR03CA0368.outlook.office365.com
 (2603:10b6:408:f7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18 via Frontend
 Transport; Thu, 22 Sep 2022 08:46:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT058.mail.protection.outlook.com (10.13.2.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 08:46:37 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 22 Sep 2022 01:46:23 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.9 via Frontend Transport; Thu, 22 Sep 2022 01:46:23 -0700
Envelope-to: michal.simek@amd.com,
 radhey.shyam.pandey@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.6] (port=54844 helo=xhdvnc106.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1obHqg-00061B-Vx; Thu, 22 Sep 2022 01:46:23 -0700
Received: by xhdvnc106.xilinx.com (Postfix, from userid 90444)
        id 9C01B610B0; Thu, 22 Sep 2022 14:15:14 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
        <shubhrajyoti.datta@amd.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH V2 6/9] i2c: xiic: Remove interrupt enable/disable in Rx path
Date:   Thu, 22 Sep 2022 14:14:51 +0530
Message-ID: <1663836294-5698-7-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1NAM02FT058:EE_|SN4PR0201MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: 28796093-bc21-4c53-6016-08da9c76f60e
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nzmVttu6dOXZzzYPCeVq3Ha6E3tEOqpA2GIDbA3a/n2qGYXlAgSyJ5Ch9ETKXnGYBKUlISD4WOFgy3jOl+xWzifU35ZhGu8KgwnCOgRxn812rW4QD1NxomkzWr8DK7RzsXJdhuoIoQSJMLPy4obxsOpOy/GURtMj7dx33b+TH4YfzsW0B+E44G4BVFQUo7XhjWwuTBQM2o/05T/9YHBewwqwrshl35gXAJdt9ABiGP9hNSre/OLNfI5qbo7qoNgBSDdGW00vkpiH8K6ptNVnourIhyBhbgbPzF/uHZKYduLY37sB9+8TtZYRTDPo5YL7TABwt5+G9ZWaJZhXUF5uNEtfk//i91cIEHD0GZ7jshFBbPkTLVf7MG7gEfQBloGOSZ+3HIJf9dfoChY4kTIFyaDVgOoxK3PKvQiSFXMfRgoZjZLneU4spQHQDA2JCnT8ketHJMI6b8zmRWfTfepBPM7DH5yIPrk8AwXd8Nbr6YW/TKqlHG6yskSUpKpeMAymOnk/m+Qc5cQafQ2S+xR+iVGyVFg4DqFB3aLMvoqTHBR8sQjO+ye/NVaxcIDQXQAqCAjCYxLgXgq9tvwXNkVCy98fdKcmF2y9YB8kCySi4A6iiVdIIlTGTJm/pgFkUR++fTFo1+xTXvZfdd7DfPzwOcLcaTmrKNc0So6GKiPdXGnar2HXnmYN20ZSPZGk5JYVH+tVsnbf/p2OADJZXWeY3oivO7BPES28O1sWKoGIlS5Vlm60VLHIVBRxMxZ8xaY/kH6pot8/8uMiGhelisF3ZKTC95D+JQ948DU9CovpAqgoHJys79LIJzU9puykgHZNrZjKgNY5r3Kx/vyiyeYn4/vknVjKcMHxct4UfRO0GB15FtGuivejpjgcPc4ap3JG
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(44832011)(110136005)(5660300002)(70206006)(42186006)(70586007)(4326008)(8936002)(40480700001)(54906003)(316002)(8676002)(41300700001)(82740400003)(83380400001)(47076005)(36860700001)(7636003)(6666004)(6266002)(478600001)(2616005)(40460700003)(336012)(426003)(186003)(356005)(107886003)(26005)(82310400005)(36756003)(2906002)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 08:46:37.3151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28796093-bc21-4c53-6016-08da9c76f60e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT058.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB8712
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 8bd33dfdff91..31296e252279 100644
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

