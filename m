Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D37395BC5
	for <lists+linux-i2c@lfdr.de>; Mon, 31 May 2021 15:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbhEaNYd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 May 2021 09:24:33 -0400
Received: from mail-dm6nam12on2087.outbound.protection.outlook.com ([40.107.243.87]:15073
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231977AbhEaNWd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 May 2021 09:22:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hE8jwsFGa47Rbvi0dl3e1GyPlmziZiOyyy+toJhDbPBb0mdC61dod/GWtW3C8pfdjJcNR6EkotwE9jLqU1Y8jG2X1s2Q+3bHUAOK6i7dJYD00YJyVxdlzObCp8/uWwRijY0rYB6UFE8RBAeL8rKvQ/mtvE3IJwTrJv45xVVO1FBG0x/IbkImXGh4+38XgDtjWCQcqDYkKDkQ3Omc0RngsXpK2kvBVfaAR7EV6ogSXWewq2GhOCM1CxV6VA2aMFQZs5H5pFqqN0X5ZbUyIdyFLEKWsbPaCfqM2sCWHi/3Xx4QYKxHbZbQqTO7NGrMUJShdQkB/9kqM6HBzdfUbykAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LC4+zpcf0ZbBUTbWy21dXn/vwcKYYP23odGRQdGCAK8=;
 b=NqDnDpOq7HLxYah+yNlYqBAw/wf46I3AjCAmWGqcaTisQOJiOxu8MXequRRJ1UM4g5Dqklz5/C8Qs8ra24NymXFa65Vw9yEqrZWb06gxbHSIi4NX7AmDhGhodZhQg+qJNB/fgrMFk9gsCB6OnwjTFxrXi11bD5H4nTNuH+9P6sM4kLb08kjHKqqEfnyxHvwQK9Hs15BasRRmMLzSDwlrQBzNVzyp6vqlBUKcVUEH62B+qaczAWwP+fY/Pt89mMJFXyhUWYnFHIVlIwgBk8u1sgHjWV4ZFTFlKWpm1iAzTeRHDR5x4f1j69D2R9ZE7GjYpVFV+MYbQcb5Zq1ahrCzHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LC4+zpcf0ZbBUTbWy21dXn/vwcKYYP23odGRQdGCAK8=;
 b=ZQjGAQswUhk2KkZBdCfEnGwbfLw2zXMOmGkT+Fwbs6zI2u38Lu6vjtwCfdsExRWIdTjZ1jRrgz2cBMUo8vrInKtdQXRvr00Hw6NvGl6Ch56EzGcAbu20/MuGCav3G73PlZOUImGXzPmdMTjaGCF3wbdk0xxzO1IJdLSpoav4O1k=
Received: from SN6PR2101CA0018.namprd21.prod.outlook.com
 (2603:10b6:805:106::28) by MW4PR02MB7330.namprd02.prod.outlook.com
 (2603:10b6:303:7b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Mon, 31 May
 2021 13:20:46 +0000
Received: from SN1NAM02FT0060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:106:cafe::8d) by SN6PR2101CA0018.outlook.office365.com
 (2603:10b6:805:106::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.3 via Frontend
 Transport; Mon, 31 May 2021 13:20:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0060.mail.protection.outlook.com (10.97.4.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4150.30 via Frontend Transport; Mon, 31 May 2021 13:20:46 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 06:20:26 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 31 May 2021 06:20:26 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de
Received: from [10.140.6.25] (port=53014 helo=xhdnagasure40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lnhqC-0004GE-OM; Mon, 31 May 2021 06:20:25 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH 01/10] i2c: xiic: Fix Tx Interrupt path for grouped messages
Date:   Mon, 31 May 2021 07:19:39 -0600
Message-ID: <20210531131948.19477-2-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
References: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b458ab11-c663-4512-4b19-08d92436e668
X-MS-TrafficTypeDiagnostic: MW4PR02MB7330:
X-Microsoft-Antispam-PRVS: <MW4PR02MB7330627E2E278402923BA879CA3F9@MW4PR02MB7330.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h9zrsRT0kmDdmPUrdC5aCVjndtOERDTWuhQoGx+czKT04Tqt9D8hOK5YNf0WHPQ296inXyiTVWjqj093XzZ4JRxXIO4VhrdFt496PHQ/a1ifmlu/UluT9frOVNNvAb7BKn1TLDT2+7AXu63LqfOB9ghmn/MoauizaWDBlRONlNQrV3ZsXQlOV1bR5k8tq1/um8SfCUxzb0xf672ATrSnj/oxrNsYrzXuu6ytv2CmbNUbdfar+7/j+OgE+tbqfJCL0UYLx7I5p3s85BitAZthedNQVteisBrcZlzCGjXeHjHdjICbRhbRj4KTHvoCE72h0zushVMR6rCAAHAZt7sLvRhhHyjP/lIu/fSDmDQEfmB5Qo8wDdUlVXNMDbe2k6vapokseg8kqck4NbeROEmRSoFKmuewmOmu/kZMvZYK9kQUzwVHXwbWx7j2h+oqMCo7l7Y7A/qwG9wVqD0Yos0CcochbH5AACL+B1HDB2Ypk+aozcfsddLjbxLI9RP4Pf99xsPNzT2FX4SWNcAEJeuFMYRM8gqZxbqCdEEdFacHhyClHwaycbrv5krAMnp356BCArYMxco2Vel9NgLH5rWaLLZB4vZOzPbDM7f/MJ7QeKL55aF4/9T8MgllOVD9l8IC/eNJTSqlgGJ82CpNhP+wvatred3fiJTvJNTa2MPG8olNJKKTj2KKu7GCDi6w3h/v
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(36840700001)(46966006)(7696005)(5660300002)(36860700001)(26005)(8936002)(478600001)(107886003)(6666004)(1076003)(2906002)(47076005)(186003)(8676002)(82310400003)(6636002)(4326008)(70206006)(54906003)(2616005)(70586007)(82740400003)(7636003)(44832011)(36756003)(83380400001)(356005)(9786002)(336012)(15650500001)(316002)(110136005)(426003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 13:20:46.1264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b458ab11-c663-4512-4b19-08d92436e668
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7330
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When a group of messages are sent from user space as a set, if
the last message has less than Tx FIFO DEPTH number of bytes
to transfer, Tx half empty interrupt is triggered continuously
from the hardware. It is due to Bus not busy interrupt coming
along with Tx half empty and tx empty.

Hence, service the Tx interrupts before Bus not busy interrupt
to update the i2c message status correctly.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 2a8568b97c14..b0cfd9d15467 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -453,22 +453,6 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
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
-		if ((i2c->nmsgs == 1) && !i2c->rx_msg &&
-			xiic_tx_space(i2c) == 0)
-			xiic_wakeup(i2c, STATE_DONE);
-		else
-			xiic_wakeup(i2c, STATE_ERROR);
-	}
 	if (pend & (XIIC_INTR_TX_EMPTY_MASK | XIIC_INTR_TX_HALF_MASK)) {
 		/* Transmit register/FIFO is empty or ½ empty */
 
@@ -505,6 +489,24 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
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
+		if (i2c->nmsgs == 1 && !i2c->rx_msg &&
+		    xiic_tx_space(i2c) == 0)
+			xiic_wakeup(i2c, STATE_DONE);
+		else
+			xiic_wakeup(i2c, STATE_ERROR);
+	}
+
 out:
 	dev_dbg(i2c->adap.dev.parent, "%s clr: 0x%x\n", __func__, clr);
 
-- 
2.17.1

