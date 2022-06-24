Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 840FB55993A
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jun 2022 14:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbiFXMHZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jun 2022 08:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231905AbiFXMHW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jun 2022 08:07:22 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2084.outbound.protection.outlook.com [40.107.101.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19CFC7FD0B;
        Fri, 24 Jun 2022 05:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpcoLl1xsf0rlxCHHfPy6pu8z02lKqRMbDacEsGJCYsiBwFumS9327vENWed+XwBBn2syWdP9OlET+ypfjpmS3F1WCBb1m17TM8LtgZbIDKXsOhfBs5LWFuATWRmSpC5XQouSVaGkzKz3D2FweVTuEZgmWp+kndVwcvCkwgsIIddZgEtrXTCRxeDwcbUnxCIIjOu0cUvdTQxTJVn34HPPmTWlVWdexmU1vQszf6oPDQMbT7ZRFv9RCHImogFmS54QlV7ACsPG3Qz3v3NeBrmGXaoBeMwjJ8Nsg87Qnnbgo75K9kREqePNDJcwuAl31hxnvJeBrDEetiDuyY+wInP0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=de9gZ7n9b6NWufyMztspmnWVJ4wgBgwr4L2S6POIpwI=;
 b=gE3gudo6FupURr73HONFKGtNdB7sNfTTcQ+Qk8MUL+mGbwHhxPBXpfVKafQq3qHPHfCVreXlOosqUqwVaAfrDmgi1OJETb+eTg6GyraY6x8QwWUBdujNh8OD65phh2Q7PIq2VOkswCopmGPat7bUEF/iCKO5jRK5m/ZeI6tqNHdynvL8cN6Lf/mXn802bz6a4bxDq+7l7saiGlqufWaJnAtz6inyfUoABaw8wP1c4g4PqwkH/xWIqG/ybiTTA0qKPRN4byPxafEuGPuAFNKreZwkkEiBWwbgmCW52iQVNPPJt/NWn6XoCZOCSpZ1NxCLFWiTMXq/HGuA7TFWmN0RPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=de9gZ7n9b6NWufyMztspmnWVJ4wgBgwr4L2S6POIpwI=;
 b=rPCWefPnySSYCAtE5wRefDes28Ev8EsjcQA6qvsm3q28k5IMhn0WmRaWM6eQHq5SDu4wAVBc6cTMPpouOTZ+2QOCh91543DN2vS6eE9DpVZLp0cuZ0DwlZhUO3PvbdsHgquEToAU/HKdqrPZ3mZmJIwXjpM6MxVjC6IqMgZ5fX0=
Received: from SA0PR13CA0015.namprd13.prod.outlook.com (2603:10b6:806:130::20)
 by CO6PR02MB8771.namprd02.prod.outlook.com (2603:10b6:303:142::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Fri, 24 Jun
 2022 12:07:19 +0000
Received: from SN1NAM02FT0020.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:130:cafe::fe) by SA0PR13CA0015.outlook.office365.com
 (2603:10b6:806:130::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.6 via Frontend
 Transport; Fri, 24 Jun 2022 12:07:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0020.mail.protection.outlook.com (10.97.5.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 12:07:19 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 24 Jun 2022 05:07:18 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 24 Jun 2022 05:07:18 -0700
Envelope-to: git@amd.com,
 michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.2] (port=47737 helo=xhdvnc102.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1o4i5m-0005OP-DX; Fri, 24 Jun 2022 05:07:18 -0700
Received: by xhdvnc102.xilinx.com (Postfix, from userid 90444)
        id 7362210454B; Fri, 24 Jun 2022 17:35:52 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <git@amd.com>
CC:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH 08/12] i2c: xiic: Remove interrupt enable/disable in Rx path
Date:   Fri, 24 Jun 2022 17:35:23 +0530
Message-ID: <1656072327-13628-9-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16833a2a-5a4a-4290-5dd1-08da55da165c
X-MS-TrafficTypeDiagnostic: CO6PR02MB8771:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +8EOmDfnKVJRZWfxs0zkgJ6E4rmMqu1Z7FVOUxvl1X2bikd94tluUPYtllbY/Wst8dZhw8+bcATdVI7bkoY4xbOAWExFuWMtme4RkOOaAtdG5AYVEtNq9O/8XF1LeBxChkCjQLvcLzLP/+OP7kFM6y0hrN9vCIi3W+dz45tXmJB5dKBbxoqEa5f83TwOcSPAwVYHoLo72JWX80I7Dsc+un3B2qYVe0QH1efYNrL/3TxhQsy2YCfDvtvnccGKSrKcbcLazjnYeTXAoJbjcEjnjJoM68WJZMoDWeGcmuhlSZbjEeIvatOjPbMwm4J1E3Bx8nEanphle6Zl3nbAQVbQToKrerSRfsMopZNNZnPv/9001sp9F1ayem45dIHVDPC2Z2L0XVCmHFOYIAnnrSC8cCwvrgRV8gQmsfLQ3XMqiBFwFGt5hRzsWW3PpJ1I5e3fWZ/+QB6lR07RM/SQSsgYsmh5sonqjiQLaa1gCMy8aAKoW5HwpfrWVhoi+nc9dsvwEGNn9Z9851bpyH4VfjvWbgaW1Zj8IOZ1Zogo7Ut5l2bR+3CQsDR6GeYe8bXiyOeoXzI68Bpl5JmLt1KOOfoJGH7cvrTWnPpJASXCQRl4SPhfAQ9t9Sf6EN5vm4NJ7llKYKm3U6Q7w8JYwXAum1lg51jy8mDzUU+SI/CU71sdb4yUt6R36Kyrjv69wK1D6PE27NYQLckbQbmOxPYaRwHBvfPgAp09InLmmngXSqAQML456W+Zfgqyi1sJnrfxn89HoTbFjI4LbWG8oSm7d8HUOO42iO9g8QhwdbEVkhzhLJx3WFh4aZSrKpldCPVm3Fg6B5u+ZARSG04kytVBbEvc4u/eCAJa2OJbyjTqrWkXsjM=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966006)(40470700004)(36840700001)(70586007)(2906002)(356005)(41300700001)(82310400005)(40460700003)(70206006)(83380400001)(4326008)(6266002)(316002)(42186006)(8676002)(82740400003)(6666004)(7636003)(36756003)(8936002)(36860700001)(40480700001)(54906003)(478600001)(186003)(26005)(426003)(5660300002)(44832011)(110136005)(47076005)(336012)(107886003)(2616005)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 12:07:19.1792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16833a2a-5a4a-4290-5dd1-08da55da165c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0020.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB8771
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

As the 'DYNAMIC_MODE_READ_BROKEN_BIT' quirk is added in the driver,
we no longer enter dynamic mode for the effected IP versions.
So, remove local_irq_save/local_irq_restore APIs from driver.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 74cd50478694..720aa671f74b 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -776,7 +776,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 	u16 rx_watermark;
 	u8 cr = 0, rfd_set = 0;
 	struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
-	unsigned long flags;
 
 	dev_dbg(i2c->adap.dev.parent, "%s entry, ISR: 0x%x, CR: 0x%x\n",
 		__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
@@ -808,7 +807,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, bytes);
 
-		local_irq_save(flags);
 		if (!(msg->flags & I2C_M_NOSTART))
 			/* write the address */
 			xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
@@ -822,7 +820,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 		val |= msg->len;
 
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);
-		local_irq_restore(flags);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
-- 
2.25.1

