Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5144F559920
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jun 2022 14:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbiFXMGD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jun 2022 08:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiFXMGC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jun 2022 08:06:02 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDF167E039;
        Fri, 24 Jun 2022 05:06:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngi27QUmsFRw2Nayoi+d3yRImqqnNKufGyk8LUAJGCuMbkalXokTxqPuR5TQ45vt3NarOrs5ggGcV/gwhcEUYPR7quWglgbTTqnQCRmeXGOsLCql+irxDRsCSfd8OyC5m5i9/hDcwdgTqx3P+7JL/U7+Sdb9WL7y/0Xm7yXzyZP4lvuUPwgaE25wP1HSWLau+tYbTFHsBAmTbFlgH+mBD9mdsmOlOLNJD6c8MzRkcZ+uMdx5FNSNEOehiQZAXDoQPLrIr9nIradmj0qEp3TUqB9sCWfX7cHud6tpILC2B0Rk167zlHr4gR4B0PAL8daGeAkciWC3Msh+GTc6XFtL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pX7xlpPLhJjmvOzb4otaCQbfDCGBmHnvzCz/nEkdhxc=;
 b=mHdDPMBGnTzYw9QLkvJ8mNysz9KZMJFxRLz6G2QLWAU7tUijpBphZOtTfACxsb1LeJAZBl1m17L58VKD99Bq3Rk5u1qgu2vcp8cBueqV5pYJ7meFpBx11SL1uE2TGmFhL4ypVdzovQo2hq8+s+v57LBiknP9jtNUHygeyla5Dx5CGc2G8mUdGQmfKohivG9JWPfGlw52TEm9XRTLbuefbUPNVMdlYXmrZuOkM6JUDooYtfTWUHm5ytGIdU/CQMSUKRS7Sn5AypTwPOlNHdQDtRLxXahDMgjZ1hucwiDA2xT6jM3tqWaQTB5BeiACOxpwaFu5oKM3DH7b3eKG5c5UFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pX7xlpPLhJjmvOzb4otaCQbfDCGBmHnvzCz/nEkdhxc=;
 b=j3YzBlktxdNb+OejcUaP60zdAjxpsT5FzVA5501ASMHvV67NCVbmliygt7efzw0cD9VseCX0+8aZQBFp4VxCK7rkmRjB9kYaSwVTMlAQ/tfGxdiipXjB8WEVJSCaN6ccOAIBHMPmBo/sz7RRnNOUq8a4fDD/B4nM5yslKHLCZy0=
Received: from BN6PR16CA0009.namprd16.prod.outlook.com (2603:10b6:404:f5::19)
 by SN6PR02MB5278.namprd02.prod.outlook.com (2603:10b6:805:67::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Fri, 24 Jun
 2022 12:06:00 +0000
Received: from BN1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:f5:cafe::f) by BN6PR16CA0009.outlook.office365.com
 (2603:10b6:404:f5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Fri, 24 Jun 2022 12:06:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT053.mail.protection.outlook.com (10.13.2.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 12:05:59 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 24 Jun 2022 05:05:59 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 24 Jun 2022 05:05:59 -0700
Envelope-to: git@amd.com,
 michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.2] (port=47731 helo=xhdvnc102.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1o4i4V-00056d-5J; Fri, 24 Jun 2022 05:05:59 -0700
Received: by xhdvnc102.xilinx.com (Postfix, from userid 90444)
        id 5FB34104546; Fri, 24 Jun 2022 17:35:35 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <git@amd.com>
CC:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH 02/12] i2c: xiic: Enter standard mode only for > 255 byte read transfers
Date:   Fri, 24 Jun 2022 17:35:17 +0530
Message-ID: <1656072327-13628-3-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a84927d-940c-4e5f-e574-08da55d9e726
X-MS-TrafficTypeDiagnostic: SN6PR02MB5278:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V5JBDczcE3qhX9ZFiw4+//N+EE/3kN+ECnqhdCjzJNQZe8YHf026aNd6YJ5VVdghVy/cCUTqCj6EjgIKdVBCdBKZuLVjnpxW0T/G1KvufL2xCP3poTJRAAjU4KK6M//kdAED5gDT/WuibwDjwu0eYAsV9cyMJwiH6sBVrBT/Ho3Bz6S0gaKZIlxn5IUnu1UL2vJq7TG8c2LY1i5p66xCoOGSdcDg3R31pQ8xnkPfNhhAdGHkWn1J3v6VqC5f0cpbCdmJslPZSZbw14xZwWF8AOFQYl6Q8VszLmkpmnYmbqvsJKwgKfnH68jdrEUsav3CelYW8xieIVCxzcOOQo84DKM1thuizwHKW6pP6x4BvOGqGQoiM3wRhpkvsgO8Onia9dHaFc44HWET38gfKxmSmiGTa8Xm0IB2V7IThPpBYeuznKR35V5FM9JZAvcTaqvGdiTbL83tsLgVnK1WABZbJfPo2aeY8FDHR7NlcIIFarJzoEbnV6QyNayH31qNGD5NRWtphIngUb959x4s1f3LMwyqDdzm1r13RD7Yuv4D+DG+HqPW+AeWoZt/jVgRqvEfOKinyHMAw3yVzguuWMRlNDEfj1tZamoF3ES9Cd8K77EQw/2wXim/WoMD9rgAkNckhahuSfG0tFigR/r+/g4g5GVnCQprb1WxOTKGmsCoMtKMvnEbH2unYrg2CUNXgNlvEKlYcrHJnHIEt2EkZ3Y2GEpabrHVVy87s3XmNSZS6T81tderkw+DceM34K0H3ZFC39DEka6dOIFa5xh5jsmwDWr1eG0n9StfDH4HAvEyS+P22jmA0v9E4JmhRB81QzcnGnXjraVQw1lRqlOUOlmUwHnMYVXMVvLe312SmhxgwI8=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(346002)(136003)(376002)(40470700004)(36840700001)(46966006)(47076005)(54906003)(36860700001)(186003)(336012)(110136005)(8676002)(107886003)(40460700003)(70586007)(82740400003)(36756003)(316002)(426003)(2616005)(4326008)(42186006)(6666004)(40480700001)(6266002)(44832011)(41300700001)(26005)(83380400001)(8936002)(7636003)(478600001)(82310400005)(356005)(70206006)(2906002)(5660300002)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 12:05:59.9290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a84927d-940c-4e5f-e574-08da55d9e726
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT053.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5278
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

To maintain backward compatibility the default transfer mode is dynamic
mode. Enter standard mode only when the size of read transfer is > 255
bytes.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index fb2443623844..c8b68176427c 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -904,7 +904,7 @@ static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
 static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 {
 	struct xiic_i2c *i2c = i2c_get_adapdata(adap);
-	int err;
+	int err, count;
 
 	dev_dbg(adap->dev.parent, "%s entry SR: 0x%x\n", __func__,
 		xiic_getreg8(i2c, XIIC_SR_REG_OFFSET));
@@ -916,27 +916,12 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	/* Decide standard mode or Dynamic mode */
 	i2c->dynamic = true;
 
-	/*
-	 * If number of messages is 1 and read length is > 255 bytes,
-	 * enter standard mode
-	 */
-
-	if (i2c->nmsgs == 1 && (i2c->tx_msg->flags & I2C_M_RD) &&
-	    i2c->tx_msg->len > MAX_READ_LENGTH_DYNAMIC) {
-		i2c->dynamic = false;
-	} else if (i2c->nmsgs > 1) {
-		int count;
-
-		/*
-		 * If number of messages is more than 1 and one of them is
-		 * a read message, enter standard mode. Since repeated start
-		 * operation in dynamic mode read is not happenning
-		 */
-		for (count = 0; count < i2c->nmsgs; count++) {
-			if (i2c->tx_msg[count].flags & I2C_M_RD) {
-				i2c->dynamic = false;
-				break;
-			}
+	/* Enter standard mode only when read length is > 255 bytes */
+	for (count = 0; count < i2c->nmsgs; count++) {
+		if ((i2c->tx_msg[count].flags & I2C_M_RD) &&
+		    i2c->tx_msg[count].len > MAX_READ_LENGTH_DYNAMIC) {
+			i2c->dynamic = false;
+			break;
 		}
 	}
 
-- 
2.25.1

