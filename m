Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3D28559936
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jun 2022 14:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231983AbiFXMI1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jun 2022 08:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232051AbiFXMIW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jun 2022 08:08:22 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8872B80516;
        Fri, 24 Jun 2022 05:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTl27Kkaq9vbhBnlZJSII4N4JZFsVwsEvLQu5Xt4xzvXS37/zGT43MzjMeckCNYGeMLCt3BpoUA0fIW6al9ifU+/St0a5832kbpD7lJTrDa6FfCfnOrgAjBrJ1ROe25wlCLuqzQ08y5H0gtvFB3EUsYVMzh1BtlqaKWEEGvfb7hiPc38HtNQHAu2a5IzOQ1R96YNKLYwDXFRuQWcYE+9QdbqX+ZMQF+evI53lGaIMeCN9sLTbdN2SmrwHhB2OqGRdJ+4DFkHsTw3LcM8/S+P3bgd8WxGmpgNcj1A4Lqr7QX8zLxqxZLofDIg3EsLFN/f7wKqXLBNfAvbskLl/Awqjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guHhU86EEcYsTUE1xCOphKC4D0End8nTO+NTJFKyStM=;
 b=fyoNdEJmsNPTtN7f1FdpzE/PdPMDZfvJSg5eupxg8fs/81B3sBO6pFpcaykaox6eOBipwgsk6OiqMVHCWy5cMdQD322JlNIoVCKqD9EFaxqQd18d2ECFxeQj4w03BIQEQURxbbFBsi2v2j/UlXMYOJ9eTOJYK3W2ogQvjGcJY7gjl0puqgkfy6Y8F3LL+ByjZ7TrT/9yXeXrxCMPe05HgPuMda5KE9Cri5MaFBNssxE7sw7uXEB12PHnReqO998E6SvQTo8gU8+u+3eA0SMsm8DcESxh2Yl+GqWJVU1oYdXd0UKNmCT/v5WZRufa/YbGt3Ff8mWGrRX312fL+KWs4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guHhU86EEcYsTUE1xCOphKC4D0End8nTO+NTJFKyStM=;
 b=D+CN7I55pfq1SLGT/VW7ylc6AYH319s3V6GkiSZdPU3LiXnqmZWyuogNvDaaU305CSYxMyyHTeXB2aWm607zmSF068i6/8bPUC84mW9a6BLIMPR8ZrBsw7hXBx76v5OWWZHfxClqmOfOPY3NmqSH3mc/2DvkOh2N7VSvf0SfZp8=
Received: from BN8PR04CA0055.namprd04.prod.outlook.com (2603:10b6:408:d4::29)
 by BYAPR02MB5606.namprd02.prod.outlook.com (2603:10b6:a03:9f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Fri, 24 Jun
 2022 12:08:13 +0000
Received: from BN1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::d4) by BN8PR04CA0055.outlook.office365.com
 (2603:10b6:408:d4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Fri, 24 Jun 2022 12:08:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT007.mail.protection.outlook.com (10.13.3.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 12:08:12 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 24 Jun 2022 05:08:11 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 24 Jun 2022 05:08:11 -0700
Envelope-to: git@amd.com,
 michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.2] (port=47741 helo=xhdvnc102.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1o4i6c-0005Qv-Vx; Fri, 24 Jun 2022 05:08:11 -0700
Received: by xhdvnc102.xilinx.com (Postfix, from userid 90444)
        id 7B663104546; Fri, 24 Jun 2022 17:35:59 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <git@amd.com>
CC:     Srinivas Goud <srinivas.goud@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH 12/12] i2c: xiic: Correct the BNB interrupt enable sequence
Date:   Fri, 24 Jun 2022 17:35:27 +0530
Message-ID: <1656072327-13628-13-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ee012a8-ee2a-46ee-664f-08da55da365c
X-MS-TrafficTypeDiagnostic: BYAPR02MB5606:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6aIRN2ykVxqKsqhxI9UA2LKqnupxdfsBzUqdtPk7dDQ799a3GJ9Z+31iCTiQce5j+sM3+j2Z/rKUt0Wz5WQPGLNzrqV/+8NondzNcYMMEZ3rlGe/1IJYoJD55aeSf20Jy38IX7cjb6yVi0OIefcS/+mImYL7zhGEP5HVSAW1PVxxlVF6f1xrI5Eqi+cNe8F4uS38G+K+4HXCojdNwChJ1GcpO7ssL6CnQaJS5o8tTuGhEPuLMEu/qgefDWRSZGGCzgblr+/Fr+WuL7gkR1mb3D6ISLJhtAoL08lccNzmIhagf666RslJlZHIyXS/+GEyJqOGe0NbX2vnJeK8TWE97juGYgdeeHDSu0g65tEKri27MtINEFUSAKkUaTXVbtJ9rpExPivst6+9quJvjqa+zVMh6kv2i5OY2IINCBT3VMGt25VfhfUVckc4+5g/ojt/H3407BTJ/WOp3QE8PXQY/TYN541zkoIkSNQyjH5Eq+2aM7HA3OenF1fjxhUKCTSueaPwQCSoCxXbt6UkIq9mDCGR9VE0gUrukIhQ2Wn3hCA7xcawjn6QBYsaSZWI3e0Kp+ICoNnYy5wYbLr5hpviFXJlP2Ij6mWEx0DzlRkeUyCeQcPiB1aVJmH1Jh39/OBVTkPljrYyuxONyc93pE3ZGyHFEaVV6WezQB3R7UNY5T98bGOc6f5j9K+0tfyiNEpUXtdKhuqzt5zkG951V7KmiAz0xhjfxRCkxJCTDn0mmV2d0xJ1tPEnc509dbdE3JTu/5EYulT2A68WcQ/KSCwmBmsFRPyEOWmyMDZa/wM9aZ/lgaXlrft3plJRGHd3GSNBrXrpHr/2E1Czw3SSfE4D5BOGrgXCu3ABk+6ZyY9SdmY=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(346002)(396003)(36840700001)(46966006)(40470700004)(478600001)(82740400003)(4326008)(356005)(42186006)(44832011)(83380400001)(70586007)(40460700003)(54906003)(186003)(6266002)(41300700001)(2616005)(336012)(70206006)(110136005)(6666004)(8676002)(316002)(36756003)(107886003)(7636003)(26005)(47076005)(5660300002)(426003)(8936002)(2906002)(82310400005)(36860700001)(40480700001)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 12:08:12.8040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee012a8-ee2a-46ee-664f-08da55da365c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5606
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Srinivas Goud <srinivas.goud@xilinx.com>

With updated AXI IIC IP core(v2.1)there is change in IP behavior
in dynamic mode, where controller initiate read transfer on IIC
bus only after getting the value for the number of bytes to receive.

In the existing xiic_start_recv function Bus Not Busy(BNB)
interrupt is enabled just after "slave address + start"
write to FIFO and before the "count + stop"write to FIFO.
Since IIC controller drives the start address of a transaction
on the bus only after it has received the byte count information
the above sequence can lead to spurious BNB interrupt in case
there is any delay after "slave address + start" write to FIFO.

This is fixed by ensuring that BNB interrupt is enabled only
after "count + stop" has been written to FIFO.

Signed-off-by: Srinivas Goud <srinivas.goud@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index f29acabba5e7..0a34daa9e372 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -851,13 +851,13 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 				      i2c_8bit_addr_from_msg(msg) |
 				      XIIC_TX_DYN_START_MASK);
 
-		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
-
 		/* If last message, include dynamic stop bit with length */
 		val = (i2c->nmsgs == 1) ? XIIC_TX_DYN_STOP_MASK : 0;
 		val |= msg->len;
 
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);
+
+		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
-- 
2.25.1

