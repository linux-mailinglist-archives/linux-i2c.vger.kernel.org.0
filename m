Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D252C1F1D
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Nov 2020 08:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730158AbgKXHrX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Nov 2020 02:47:23 -0500
Received: from mail-bn7nam10on2073.outbound.protection.outlook.com ([40.107.92.73]:23904
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730064AbgKXHrX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Nov 2020 02:47:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQiScXPR5YrgeBLgbxDe9ZT0t0Fm0HLyqKpWxv6ULPjZX7JdCO57N/CMg+iu28aN7mVSp5QlXkoMhEgMQueOM7c2NTpmSnh6gPurwb0fLI2tvyIjWaUnaPINJVfmJuaabwVXEi7O2m3U9CFmEerO+oCFIP6crN3TcSidF4hpqmuarVfgpQAqdv4ErqVcfhlfot1abBxxxttsiJgiUTL+8DpRWEiVq6oNBJbdliw66APX9rjswWc2FKQ1PODGDHLcxibwWKEkEY9kOmNkiqd6GqXontQz3tfs1LlPm61Q8hvR28QX0VVit67BpU9RWbdJMZk9ptJZlo1L9Isjf8pZNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHe5GS1VC8Pmeb2wEhatNNfP4IOBZcmmPBR4Vwed6rI=;
 b=j/mct7Kh3Jg7sCHqcBR2BCA4oms5RILrD7PeOkdFR0BInTN9vGdKHniBB0+r93eObW4XZGmmxqYeGlwjBRD6he2oJx90IugsQ6//8CeAY6k/wB6FssMUwOYYkg1wqFw+sCedmu8r5fGPG81jFgaXZYsTVCIr1kflnR1MPLL8KBBqv9bauBKsNqMVSdx6+GpennSTAVezZQ/Hn+uAq+z8z1bvvLwwr/F/+sysjP6MTbkBXjpVlUXSO6zwd+T4L2OgP4Ie74aCYgqq37OA4mzdQ48HRL58/yK2nKPWdfnOHV/RlnrCdKd49LCNMwogG0uT20R/6Ll2Fj3Xrgcm40bfAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHe5GS1VC8Pmeb2wEhatNNfP4IOBZcmmPBR4Vwed6rI=;
 b=f8hM43VQABlsSc3ZBNmmSODp/bLng5AriLkA+ugtHrW1MUjHvjsL33bPOxF3Mq3MpID0BLSTId3ObNnRZHylPHzZQsE4txLyRSGyKhkGt3esQRVQT4EPGVFvuBT4ekjnxmlv08931FszGZDYRe3yJ7G5r4tWO8HXqwGnCdkrD8Q=
Received: from MN2PR19CA0018.namprd19.prod.outlook.com (2603:10b6:208:178::31)
 by BYAPR02MB4789.namprd02.prod.outlook.com (2603:10b6:a03:46::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.30; Tue, 24 Nov
 2020 07:47:18 +0000
Received: from BL2NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:178:cafe::d1) by MN2PR19CA0018.outlook.office365.com
 (2603:10b6:208:178::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Tue, 24 Nov 2020 07:47:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT049.mail.protection.outlook.com (10.152.77.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 07:47:17 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 23 Nov 2020 23:46:44 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 23 Nov 2020 23:46:44 -0800
Envelope-to: git@xilinx.com,
 michal.simek@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.6] (port=46320 helo=xhdappanad40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1khT2B-00009O-5N; Mon, 23 Nov 2020 23:46:43 -0800
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH] i2c: cadence: Clear HOLD bit before xfer_size register rolls over
Date:   Tue, 24 Nov 2020 13:16:05 +0530
Message-ID: <1606203965-31595-1-git-send-email-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c64bf69f-2a54-46e0-866b-08d8904d2acb
X-MS-TrafficTypeDiagnostic: BYAPR02MB4789:
X-Microsoft-Antispam-PRVS: <BYAPR02MB47891F2E0C9F2AF19D224F09CAFB0@BYAPR02MB4789.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7JZNx/BGgF2oQonH5d0KSNOaaNl/IhPN5ui7yM9wpo9kTZHk7S6oNjolM2O7H58R7U8TKk/rtCWtVAZaSNAUqwattErCroofTr7Ve7S6DTleUvW3jkgmRyUM4/4yRXCcLcBXOCrtR/lNAlAgGBwfmCXapUBULQJ87zy00jDnB28pxpwL231QtjTj6jw4RHhALkVjgYds98X0OJVh3r7ydFJhrou25ojBxGPwK1L/i5IongyOtct/kDs7LWsa0GE2YoGePcFRN/CUjl+dkG8R8AGoAiP0/cqwqphNVn/7Yu8duxHzUzddZBm1uBasIs0dNXIeourS0U8T/rAasoKYG4v9fCCe4cedCcE7UqPkzILi9JNTpKfQNsYjyMfbZ9mwAizHOvUWgbuJB02PYVPUecRZaT5aftvLQI5deZ8BUs4=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(46966005)(9786002)(5660300002)(186003)(83380400001)(478600001)(7636003)(336012)(356005)(26005)(107886003)(36756003)(54906003)(426003)(7696005)(82310400003)(4326008)(316002)(2616005)(82740400003)(2906002)(8936002)(6666004)(6916009)(70586007)(70206006)(47076004)(36906005)(8676002)(44832011)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 07:47:17.6358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c64bf69f-2a54-46e0-866b-08d8904d2acb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4789
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Xilinx zynq SOC if the delay between address register write and
control register write in cdns_mrecv function is more, the xfer size
register rolls over and controller is stuck. This is an IP bug and
is resolved in later versions of IP.

To avoid this scenario, disable the interrupts on the current processor
core between the two register writes and enable them later. This can
help achieve the timing constraint.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
---
 drivers/i2c/busses/i2c-cadence.c | 48 ++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index e4b7f2a..81b7c45 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -578,6 +578,11 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
 {
 	unsigned int ctrl_reg;
 	unsigned int isr_status;
+	unsigned long flags;
+	bool hold_clear = false;
+	bool irq_save = false;
+
+	u32 addr;
 
 	id->p_recv_buf = id->p_msg->buf;
 	id->recv_count = id->p_msg->len;
@@ -618,14 +623,43 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
 		cdns_i2c_writereg(id->recv_count, CDNS_I2C_XFER_SIZE_OFFSET);
 	}
 
-	/* Set the slave address in address register - triggers operation */
-	cdns_i2c_writereg(id->p_msg->addr & CDNS_I2C_ADDR_MASK,
-						CDNS_I2C_ADDR_OFFSET);
-	/* Clear the bus hold flag if bytes to receive is less than FIFO size */
+	/* Determine hold_clear based on number of bytes to receive and hold flag */
 	if (!id->bus_hold_flag &&
-		((id->p_msg->flags & I2C_M_RECV_LEN) != I2C_M_RECV_LEN) &&
-		(id->recv_count <= CDNS_I2C_FIFO_DEPTH))
-			cdns_i2c_clear_bus_hold(id);
+	    ((id->p_msg->flags & I2C_M_RECV_LEN) != I2C_M_RECV_LEN) &&
+	    (id->recv_count <= CDNS_I2C_FIFO_DEPTH)) {
+		if (cdns_i2c_readreg(CDNS_I2C_CR_OFFSET) & CDNS_I2C_CR_HOLD) {
+			hold_clear = true;
+			if (id->quirks & CDNS_I2C_BROKEN_HOLD_BIT)
+				irq_save = true;
+		}
+	}
+
+	addr = id->p_msg->addr;
+	addr &= CDNS_I2C_ADDR_MASK;
+
+	if (hold_clear) {
+		ctrl_reg = cdns_i2c_readreg(CDNS_I2C_CR_OFFSET) & ~CDNS_I2C_CR_HOLD;
+		/*
+		 * In case of Xilinx Zynq SOC, clear the HOLD bit before transfer size
+		 * register reaches '0'. This is an IP bug which causes transfer size
+		 * register overflow to 0xFF. To satisfy this timing requirement,
+		 * disable the interrupts on current processor core between register
+		 * writes to slave address register and control register.
+		 */
+		if (irq_save)
+			local_irq_save(flags);
+
+		cdns_i2c_writereg(addr, CDNS_I2C_ADDR_OFFSET);
+		cdns_i2c_writereg(ctrl_reg, CDNS_I2C_CR_OFFSET);
+		/* Read it back to avoid bufferring and make sure write happens */
+		cdns_i2c_readreg(CDNS_I2C_CR_OFFSET);
+
+		if (irq_save)
+			local_irq_restore(flags);
+	} else {
+		cdns_i2c_writereg(addr, CDNS_I2C_ADDR_OFFSET);
+	}
+
 	cdns_i2c_writereg(CDNS_I2C_ENABLED_INTR_MASK, CDNS_I2C_IER_OFFSET);
 }
 
-- 
2.7.4

