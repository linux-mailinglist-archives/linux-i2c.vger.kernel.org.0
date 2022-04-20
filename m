Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F11D508312
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Apr 2022 10:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376432AbiDTIDw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Apr 2022 04:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376616AbiDTICa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Apr 2022 04:02:30 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam08on2073.outbound.protection.outlook.com [40.107.101.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD74344DA
        for <linux-i2c@vger.kernel.org>; Wed, 20 Apr 2022 00:59:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8RWTziROxTq07rgpdFr6EEeSRLqvKupQxdnwerzt5UL7o3Cqb5ut3aZLiI+ieTdQTRrfNqtS5SDKHRqCqtT53HgSF0GOUG+tjijM5OPriuWbI/O5+OyjMmVdB/aeQQq26TkMUnop/c6mHjxpGNxxFLOLwngvTJYkIMmDbD2xc5TAKw7mpyez834nAGiPLA+6WH+nznUEkYRiQEV4rqT0H1UcH+tgEU9alARLLkTGdIPx2YVXQaLn5t/GiIRrkcvZpl9M3I5oAaBanj1O9/ARKnGQURuiNQYkgP5tdfK1bHOIDDaEUiFNVqRwKjuAnqwR3nNKDhK/6BD/nl6On0n+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OV1Fk45Rx1vHKKsO6XvRCDYiQjrBdzqKyNc0MHRG+Hw=;
 b=HY5Gkj5NGDFhPkXaSB/AN3SxNvLKLYUZfnpQQiqpaoK5xaErPf19gVORaXdvJS1VqO/DNOfX1TKEPd/XITEMaCP1Ue3f7Q/OLoWcTMnV2pgAPiIaQIC4qXeBodG+Z5xsArAOh6hlCkcVvm0qy1WDiheSpm9VVs2ExssxoIsK8d6LsaMaGphCNfu3xSS8eKXXXqV17zwtSeo17AHmJSt1XJLeaw8cZLgRubFmJ0Ivtkx8UXocLQGdFBiPANO+BCgY5r5m3tbUR1AoG/j6P77Hu419ldgF6X7LvKF1oPxDsTi8Rw+7nwpeOjHBCDhfbPxnXOgj7IWmonpIVrh27WrJzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OV1Fk45Rx1vHKKsO6XvRCDYiQjrBdzqKyNc0MHRG+Hw=;
 b=bhaDVVTEJ8RS/Cnk/83LUnlFhcSKER7mnDj2iDeSRhih5HLDyeUACXEMPSyXzJFNaAid95uyvZ71vhUNnL0BxQX1yJ+I6GC6EDJr7AKxRSGMkcJR+krrix3G0APA1wEo+t0JJSTjnmGz75e6xC0fVyGRPIo3HtiwI0exQTOD2uQ=
Received: from SA0PR11CA0093.namprd11.prod.outlook.com (2603:10b6:806:d1::8)
 by CY4PR02MB2406.namprd02.prod.outlook.com (2603:10b6:903:b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 07:59:44 +0000
Received: from SN1NAM02FT0003.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d1:cafe::95) by SA0PR11CA0093.outlook.office365.com
 (2603:10b6:806:d1::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Wed, 20 Apr 2022 07:59:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0003.mail.protection.outlook.com (10.97.4.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.14 via Frontend Transport; Wed, 20 Apr 2022 07:59:44 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 20 Apr 2022 00:59:37 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 20 Apr 2022 00:59:37 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org
Received: from [10.140.6.59] (port=54328 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1nh5FQ-0006KN-If; Wed, 20 Apr 2022 00:59:37 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git@xilinx.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 4/4] i2c: xiic: Fix Tx Interrupt path for grouped messages
Date:   Wed, 20 Apr 2022 13:29:24 +0530
Message-ID: <20220420075924.14546-5-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220420075924.14546-1-shubhrajyoti.datta@xilinx.com>
References: <20220420075924.14546-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5714380b-18c3-4ba1-f959-08da22a3bb48
X-MS-TrafficTypeDiagnostic: CY4PR02MB2406:EE_
X-Microsoft-Antispam-PRVS: <CY4PR02MB2406A4D6A8350616474F3EDCAAF59@CY4PR02MB2406.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ETaXr0H1Vd1IpnbxOrbXej0USCHytg21a7MGchBJMyrus1NHKM8ZDDRZ6McLJMoHMDzC0BPlVfz+ByVOUb0GJRRAefAh8JGR7mGDwAG3OwyNP0Py+Zc0vQDQokVOW11Y9s7BFH+xJl2912r4422aLQIjod6rkaCfHkIrgk1VnmDIQDMpE8OnLj7OWsz/Pydp3ajgWGDGSvTYB6l1dDeMbbUv0h5Lylqa+M8LzFS5/KOCTE7jZl9nVbpdHZjYSquOf1SB+dwq+yjHxL7hTN5wyE+HC7RIPN9i54tuhdYMzi2+J2gTlavQvlswG78oEku8xro7qg1TiVeBrIbzQNs8LoorHNHoqTmP7y+imi0n4H3e0Zk9Z2ZLmKddOCkssLlREwIfKy3kwZo0l3H2F/Po1QKlR16746b2Xax92FrFPEGHfOET62iTpzSYBwx5yNbOSkhBVkOtdv8wVcnlLsHwe+WqVqGjcyOW9I7XrhklQlt0F0TnBsyjKiwWUr9/S0qXTOkK9v6RB9xKImGyw/Ng/Y30ZRI6fPo1vfqUVe+F4lz3rJfPmrjna9AYL6xvRbKjzjsEyNnQKJ16rkJ5yOHor50J9NZ8/waQuB7xXxHRgaiPWRPFOk/bBYcm1x3MAqDO8mI4lxDWjYMrwYG24DoLidyhXrna7yog9x/H5ZvPjRAuOmqHCVir11FYeKe6Ti7ehXPfpt+W4vnqQUgm2+MNg==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(7636003)(26005)(9786002)(8936002)(316002)(6916009)(508600001)(5660300002)(54906003)(70206006)(4326008)(7696005)(6666004)(70586007)(356005)(8676002)(336012)(83380400001)(47076005)(186003)(1076003)(107886003)(36756003)(15650500001)(44832011)(82310400005)(2906002)(36860700001)(40460700003)(426003)(2616005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 07:59:44.2544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5714380b-18c3-4ba1-f959-08da22a3bb48
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0003.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2406
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

When a group of messages are sent from user space as a set, if
the last message has less than Tx FIFO DEPTH number of bytes
to transfer, Tx half empty interrupt is triggered continuously
from the hardware. It is due to Bus not busy interrupt coming
along with Tx half empty and tx empty.

Hence, service the Tx interrupts before Bus not busy interrupt
to update the i2c message status correctly.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 38 ++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index eb4d34e7c0fe..953f7cffe0d8 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -468,24 +468,6 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 			}
 		}
 	}
-	if (pend & XIIC_INTR_BNB_MASK) {
-		/* IIC bus has transitioned to not busy */
-		clr |= XIIC_INTR_BNB_MASK;
-
-		/* The bus is not busy, disable BusNotBusy interrupt */
-		xiic_irq_dis(i2c, XIIC_INTR_BNB_MASK);
-
-		if (!i2c->tx_msg)
-			goto out;
-
-		wakeup_req = 1;
-
-		if (i2c->nmsgs == 1 && !i2c->rx_msg &&
-		    xiic_tx_space(i2c) == 0)
-			wakeup_code = STATE_DONE;
-		else
-			wakeup_code = STATE_ERROR;
-	}
 	if (pend & (XIIC_INTR_TX_EMPTY_MASK | XIIC_INTR_TX_HALF_MASK)) {
 		/* Transmit register/FIFO is empty or ½ empty */
 
@@ -522,6 +504,26 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 			 */
 			xiic_irq_dis(i2c, XIIC_INTR_TX_HALF_MASK);
 	}
+
+	if (pend & XIIC_INTR_BNB_MASK) {
+		/* IIC bus has transitioned to not busy */
+		clr |= XIIC_INTR_BNB_MASK;
+
+		/* The bus is not busy, disable BusNotBusy interrupt */
+		xiic_irq_dis(i2c, XIIC_INTR_BNB_MASK);
+
+		if (!i2c->tx_msg)
+			goto out;
+
+		wakeup_req = 1;
+
+		if (i2c->nmsgs == 1 && !i2c->rx_msg &&
+		    xiic_tx_space(i2c) == 0)
+			wakeup_code = STATE_DONE;
+		else
+			wakeup_code = STATE_ERROR;
+	}
+
 out:
 	dev_dbg(i2c->adap.dev.parent, "%s clr: 0x%x\n", __func__, clr);
 
-- 
2.17.1

