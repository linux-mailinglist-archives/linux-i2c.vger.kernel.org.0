Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86C283B4DFD
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Jun 2021 12:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhFZKa6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Jun 2021 06:30:58 -0400
Received: from mail-bn7nam10on2046.outbound.protection.outlook.com ([40.107.92.46]:54401
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229952AbhFZKa5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 26 Jun 2021 06:30:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHcCzhmhwIi/En/NeqRb6suTOYqL1bWlsBOWotrV6yH3N/OP77z6VERRFgKmxvdMW+SOm5ZDTSARpLBwIvNvHfd821N7r4+JgDz0FE4c1JM1Me/+0BQyN5M9oCsQfVdJjDTGk8oZo4Q4QK4uxrVo97Mi388mGe5jbH2LjjMpR4NNOPcmNMW8sCO3Wa6uTft6qb/cVRbHLXbx+czl/HyhwhmqfP2q3f/pZn+3v6Zos0duZJDC9vZFzuywI+AIWUyoOaJzkIcI+dTzFKmnJjMk2UhND31dP2zswgCflfa8zKNnbwgOQ1zvxz2TBLC1K55AOBxW0BnHjklSC22/YvwtZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kL8lolMTkO63Fg/K73nW307o00cEo5h5ZAlDpKI4w8E=;
 b=NjgeEQenEU9kh6vJy6qOPI39dh05eQnlTzg+H4WqctFZ9kdMbaaKtSZEfT6/L6g0Yij2SbDRTwmIzA5yrMMSMA9FCoDuXEoHj14v9K9x5ijZ/De7k5E/t8OvbIl8A1Y1LWNOsJ4AMSiOSvCIxPzxbljbJ23G4QjviuzARoGHwLKWNb1lltgAzTrNvDJPoikpqkDTh0NUTKUUC3F+DDI25wRGyh4XC+BQkZY3o3lT93Dt8fg6K8awiSAQZWqToOViU8e9c1T9tafVZZzVuCulktyLVeB3dFFkAte2shCOUPJ9mnYM/xdXfeerOUC4Kz2WN003lnVfTtEcnupv5A7eEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kL8lolMTkO63Fg/K73nW307o00cEo5h5ZAlDpKI4w8E=;
 b=VlvH5IITFy9Y0E9rgOVy1jTNPYvjWu6sznZFVyE2s2BpsrMzfETm4AxICFsRFO8Qbdsw51tk+v02VzMK+MaNdXVKA0fE1lsFPVlrBgA8CXInl09iVfXYQh+eUDb5SZmZHz2bQR4avBAVboyTDYswPE+89LY26IghDGCR5uDTAjU=
Received: from SN4PR0701CA0016.namprd07.prod.outlook.com
 (2603:10b6:803:28::26) by DM6PR02MB6234.namprd02.prod.outlook.com
 (2603:10b6:5:1f5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Sat, 26 Jun
 2021 10:28:32 +0000
Received: from SN1NAM02FT0064.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:28:cafe::24) by SN4PR0701CA0016.outlook.office365.com
 (2603:10b6:803:28::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Sat, 26 Jun 2021 10:28:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0064.mail.protection.outlook.com (10.97.4.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Sat, 26 Jun 2021 10:28:32 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 26 Jun 2021 03:28:16 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sat, 26 Jun 2021 03:28:16 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de,
 joe@perches.com
Received: from [10.140.6.6] (port=55646 helo=xhdappanad40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lx5Xr-000AWJ-GV; Sat, 26 Jun 2021 03:28:15 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        <joe@perches.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH v2 01/10] i2c: xiic: Fix Tx Interrupt path for grouped messages
Date:   Sat, 26 Jun 2021 15:57:57 +0530
Message-ID: <20210626102806.15402-2-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 452f3eca-8e9b-4f69-33ce-08d9388d25be
X-MS-TrafficTypeDiagnostic: DM6PR02MB6234:
X-Microsoft-Antispam-PRVS: <DM6PR02MB6234B3079F70814B14888483CA059@DM6PR02MB6234.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pWRMzQMPoWffA6sWITgJVEqjqrFqDppQ6NYVkN9IItPEXCdq72VFezrddbjoulUuYDNOEFmZ4fRlzBnJetaXvIvp4Ha4bLAxFwGVRkFjffghlrCj7hU/v9KDQuj441rBUdKa72kFAmpDyOWWKQKULydX6FEZnxyCGSYU9a9uGc84q7Z/hD3JYMQk/m5TS10PYq6K9HHJ6l8IFFFJI+i5K77tUaS5JL5l0eV3LR3VxOwfILy0NYTo9KwT3LNqq1UmBhk6SkCYW+laxWZ5h1jYNA5EjBoLUv5u/Lp93h2ViLvSFVhkEutdYrkKwSzg1Tntws2Xxdm8HfSGO/vvQYL1wARG/JocfVGdWyV+eXiH4KW70kSy6nu9bhyVwU0JfKhIRLkdqY/lnuazRMJUKn4YMy4A5fhuBVg8yy1RahzzjFHm7YnOVt4TEWaXfz8Vqft+Uz0p5QwORwJzm8+d/jh4IO98WaZyvjaA+sG+gBmx9510MBENmouI6kmnzuqX5dziTWajJGGEtRqZEsDanRDzNnCHcMy7Bj9FDXzEgh6wB22JvTlGlTLr4LHoJMLcEDj2GJn3q1/QmFHZGAUEjketJdJBtG5VzqgwTLyVcO+R9/AH/RJTHA3xUVf3tNnjzbl01yc64+WLDDWw0dtWrs+xmHwX2JYJNKgk99H6aQZX9vIlPG/Z0QJ5y9XI3wayuuZd
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966006)(36840700001)(70586007)(478600001)(2616005)(9786002)(7696005)(110136005)(54906003)(70206006)(2906002)(1076003)(36756003)(336012)(7636003)(316002)(36906005)(356005)(6636002)(15650500001)(6666004)(8936002)(5660300002)(36860700001)(107886003)(426003)(44832011)(4326008)(82310400003)(82740400003)(83380400001)(26005)(47076005)(186003)(8676002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2021 10:28:32.3612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 452f3eca-8e9b-4f69-33ce-08d9388d25be
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0064.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6234
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
2.25.1

