Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED522213B6A
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jul 2020 15:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgGCN4H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jul 2020 09:56:07 -0400
Received: from mail-dm6nam12on2062.outbound.protection.outlook.com ([40.107.243.62]:6163
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726035AbgGCN4H (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 3 Jul 2020 09:56:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiaXqnYK1fmZZ0E6/8UdtFyVbs5gjeIuaH5hElnKB3ee2OiK5WlMszIHTqoYtysx8XGhBso+3Vhx6sygHWKIyQJMj4Sg3Ul427n+Z5ojoY8+XpsclWT1WiytkOkP/G8lxcqjdZqVewLjwYWbDE4LC9Eei+4/KiIsGZoVLJOVG2XCdOE+CKiUuxEENHnNLAY9LA3w5HVFVC4/gZUn8YuFgk7SzKnlMW/sg864yjqFQJNqUIMnDkv64N8bT9QwnbpMyosbfK8IOsw5pqmUH10U211QpasNbBIOZ1oF4E5AZZB1ZzJq5ri3OrgTstw9HsFtNIkB/cIn3ltraWgMUp6Lqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WchCHECsvgIR3DgyY/0kDtgXEnmCbgfhyJrwn7yszpI=;
 b=jdcKFj9KC40KPfU0mGboFvnhVqpqwYpUQfcyx/1dpC0uVvDxPBrohnQ7NfWnOT/ELnb0pmamaW6WbN0OyR7sCaaHRJLq3NW4hJ90AOPdpcXG1bF0V7NLkSaiLB7EpeEdmwnpogbtbHWfynsrvOrYgCvG3gOEwBrkVQmjEk/5GxJrPWPPdLZx4LH/h7m8hfEic/lgFzA4Rdeds+avHrqghAr7hq4F3Z7m8q98QIjRvfi8fCwqzlyI/CJyttzDbqYKSd2LjFhFQFnPjSUeF7nGBaeGFDhJLThMhvcEbN29fx9T/cT64y4fbwL6I47qeamSeh7hU7ejLUzp04/JSF1gVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WchCHECsvgIR3DgyY/0kDtgXEnmCbgfhyJrwn7yszpI=;
 b=d1tKNZ0BfxjYDuvC0u+1yvfQUoDmKrATIXAR1ejbsdAjHv9ptHcs6Qwcf+DPytxJHtKyEk4Wc3pcMEWuFQ2dd3dEDg+Buw5phTTZLNR1UKW+7BaVAj1XC3Tv2bt2ryukSdsrehSbVKAGanMSFqLciF1u+erC5zZ6ndEGOnsjnNs=
Received: from SN1PR12CA0084.namprd12.prod.outlook.com (2603:10b6:802:21::19)
 by BY5PR02MB6913.namprd02.prod.outlook.com (2603:10b6:a03:230::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Fri, 3 Jul
 2020 13:56:04 +0000
Received: from SN1NAM02FT003.eop-nam02.prod.protection.outlook.com
 (2603:10b6:802:21:cafe::4d) by SN1PR12CA0084.outlook.office365.com
 (2603:10b6:802:21::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend
 Transport; Fri, 3 Jul 2020 13:56:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT003.mail.protection.outlook.com (10.152.73.29) with Microsoft SMTP
 Server id 15.20.3153.24 via Frontend Transport; Fri, 3 Jul 2020 13:56:04
 +0000
Received: from [149.199.38.66] (port=58211 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1jrM9F-0002wm-LY; Fri, 03 Jul 2020 06:54:37 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1jrMAe-0004QD-05; Fri, 03 Jul 2020 06:56:04 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 063Dtt6C014340;
        Fri, 3 Jul 2020 06:55:56 -0700
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1jrMAV-0004Mo-E7; Fri, 03 Jul 2020 06:55:55 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, git@xilinx.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH 1/2] Revert "i2c: cadence: Fix the hold bit setting"
Date:   Fri,  3 Jul 2020 19:25:49 +0530
Message-Id: <1593784549-21489-1-git-send-email-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(136003)(39860400002)(396003)(346002)(376002)(46966005)(44832011)(8676002)(8936002)(47076004)(5660300002)(478600001)(2906002)(107886003)(426003)(356005)(82740400003)(2616005)(336012)(81166007)(9786002)(6916009)(70206006)(6666004)(82310400002)(26005)(186003)(70586007)(7696005)(316002)(36756003)(83380400001)(4326008);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9e53b414-878a-4252-a438-08d81f58d3c2
X-MS-TrafficTypeDiagnostic: BY5PR02MB6913:
X-Microsoft-Antispam-PRVS: <BY5PR02MB691354E98606BE8DE629073BCA6A0@BY5PR02MB6913.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hl14khzXnpZXL82TUIH89LH93WZTf+O4jklwfg024Zz6DXKn43sQxy3g9nwMUL3nZuaMnLXs0j4zgqjW09GKyc2moLEK/VrWBSCdhCJRtXKsXSNUKy/hen5v9Pb1hhraN4j46Rz1oQ3c4CMGEK5L40kTkpyRaWl8px4IXY2fS/41CDzZq4Xts4F1n7BvfPkJkvrg3cFLvRWmA0phu/dVXC/ygh32NMBdrUFhhBXLBje5baGszNDbj69vb0T9921pXdDJ77KWk5LZNTlpXyKGkmwkifTqJs43GIKksaICFqWqrt4dNsoQBwI6+GQWqlXm3m69fQkG9ahd2O3iVYEA9uDFQ/2bGU3wV3vfscaVGD5zvw96Lw6ikz2uhgnux2ST2KBM/4e+TdATqhIyUVrukw==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 13:56:04.3206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e53b414-878a-4252-a438-08d81f58d3c2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT003.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6913
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This reverts commit d358def706880defa4c9e87381c5bf086a97d5f9.

There are two issues with "i2c: cadence: Fix the hold bit setting" commit.

1. In case of combined message request from user space, when the HOLD
bit is cleared in cdns_i2c_mrecv function, a STOP condition is sent
on the bus even before the last message is started. This is because when
the HOLD bit is cleared, the FIFOS are empty and there is no pending
transfer. The STOP condition should occur only after the last message
is completed.

2. The code added by the commit is redundant. Driver is handling the
setting/clearing of HOLD bit in right way before the commit.

The setting of HOLD bit based on 'bus_hold_flag' is taken care in
cdns_i2c_master_xfer function even before cdns_i2c_msend/cdns_i2c_recv
functions.

The clearing of HOLD bit is taken care at the end of cdns_i2c_msend and
cdns_i2c_recv functions based on bus_hold_flag and byte count.
Since clearing of HOLD bit is done after the slave address is written to
the register (writing to address register triggers the message transfer),
it is ensured that STOP condition occurs at the right time after
completion of the pending transfer (last message).

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
---
 drivers/i2c/busses/i2c-cadence.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 4b72398..e069602 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -594,10 +594,8 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
 	 * Check for the message size against FIFO depth and set the
 	 * 'hold bus' bit if it is greater than FIFO depth.
 	 */
-	if ((id->recv_count > CDNS_I2C_FIFO_DEPTH)  || id->bus_hold_flag)
+	if (id->recv_count > CDNS_I2C_FIFO_DEPTH)
 		ctrl_reg |= CDNS_I2C_CR_HOLD;
-	else
-		ctrl_reg = ctrl_reg & ~CDNS_I2C_CR_HOLD;
 
 	cdns_i2c_writereg(ctrl_reg, CDNS_I2C_CR_OFFSET);
 
@@ -654,11 +652,8 @@ static void cdns_i2c_msend(struct cdns_i2c *id)
 	 * Check for the message size against FIFO depth and set the
 	 * 'hold bus' bit if it is greater than FIFO depth.
 	 */
-	if ((id->send_count > CDNS_I2C_FIFO_DEPTH) || id->bus_hold_flag)
+	if (id->send_count > CDNS_I2C_FIFO_DEPTH)
 		ctrl_reg |= CDNS_I2C_CR_HOLD;
-	else
-		ctrl_reg = ctrl_reg & ~CDNS_I2C_CR_HOLD;
-
 	cdns_i2c_writereg(ctrl_reg, CDNS_I2C_CR_OFFSET);
 
 	/* Clear the interrupts in interrupt status register. */
-- 
2.7.4

