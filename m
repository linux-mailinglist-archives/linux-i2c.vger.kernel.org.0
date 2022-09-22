Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D32025E5DD3
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 10:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbiIVIqw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 04:46:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230493AbiIVIqa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 04:46:30 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2046.outbound.protection.outlook.com [40.107.100.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14348B6565;
        Thu, 22 Sep 2022 01:46:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gga7+V4El/7Bi2ZrSw+b9R5HeDQvEPjxw4PgRx8AFRTzuJS4wOTxtAhDEHpQGj3mKREx1zKLFrEhZHGfZLpbr6oChsnsyKe1QU4j8zga0inXwurFboqKQzxJGAI5iNHILxgsDwXmnl08gEq6NJ/54nt4zCFN9nxSrpktki4iTOcehzPpzM2DG3+x5P4tSyh1SEurm/M8HjJCAElxTLYZ7KFvsuqciTnO6VbEFmfI5F0sSSasybOsdzH6NxYYE4Pg/LoNp1tbkvQXC/7GjbkuZGumdbpLqINPErJTYz/f3lJIFO/9R8KdCJMtID6MQW5prsls+apsaGqTUUTiJG0nOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KJwMFuuDmz5apsIasDs37iISZynxtGyatMYsHtHn9k=;
 b=WC3yAA/5KQVaBkeOeemdCGGBXFylfp5zEd2uEQ5Qcr3QZt2fYJ0ALCpP9QPWWbMDxn79v9MfgY7GXY1pCw2M33mw0LExBq11Dmn5CPSgvoCVr2tMhnypxBjtxm9rY0itlKxCbD7eF6S0+zsbG7hd8BJqx/6+X8V5YRBO5oK+Q2Pm+XuKJF6u3EK9RknR9Laqhnah3XSgj5Dwg+9s+2m5uVR1jciFIHqI/jCr+tlhKXnKXKrV06ypdV8ESgKeyCwwxHhwUndTrKzGYFayvwcHD7Jna+jPo543uzxlukQYdBr70rleZFGTXYqJtxcnXoYAX1lvneHYnrpLk2g55EjzQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KJwMFuuDmz5apsIasDs37iISZynxtGyatMYsHtHn9k=;
 b=Ip4i3HHnaa9AEAmQJqgZOkxuec7uViC/eZFP4P1Ac/pAbbwB4iUS+3E2KLuUAk/d63jbkEk8IluyHzkLwAYRO5cB7ok7sSFZhdiaKp0zQF8oUDdkaaCHLGw7WERGb0zv3vG7rrxLkVizzT/d+eYBmOWF2CGGZKeuQRr6+EhgCKM=
Received: from BN9PR03CA0943.namprd03.prod.outlook.com (2603:10b6:408:108::18)
 by SJ0PR02MB7232.namprd02.prod.outlook.com (2603:10b6:a03:2a2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Thu, 22 Sep
 2022 08:46:13 +0000
Received: from BN1NAM02FT050.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::c1) by BN9PR03CA0943.outlook.office365.com
 (2603:10b6:408:108::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19 via Frontend
 Transport; Thu, 22 Sep 2022 08:46:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT050.mail.protection.outlook.com (10.13.2.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 08:46:12 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 22 Sep 2022 01:45:56 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.9 via Frontend Transport; Thu, 22 Sep 2022 01:45:56 -0700
Envelope-to: michal.simek@amd.com,
 radhey.shyam.pandey@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.6] (port=54842 helo=xhdvnc106.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1obHqG-0005Yh-HM; Thu, 22 Sep 2022 01:45:56 -0700
Received: by xhdvnc106.xilinx.com (Postfix, from userid 90444)
        id 349BF61050; Thu, 22 Sep 2022 14:15:10 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
        <shubhrajyoti.datta@amd.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
Subject: [PATCH V2 4/9] i2c: xiic: Add wait for FIFO empty in send_tx
Date:   Thu, 22 Sep 2022 14:14:49 +0530
Message-ID: <1663836294-5698-5-git-send-email-manikanta.guntupalli@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
References: <1663836294-5698-1-git-send-email-manikanta.guntupalli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1NAM02FT050:EE_|SJ0PR02MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: 4efbda05-ef01-4860-a43f-08da9c76e785
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4lZosBZ+aZnJb/uX2AxMfVoTfxpqddMIsQAmA1hlHsrW0CSWgkosaZ0xN5y7FsDKqqKaQw8gIY/yanRkiqmqMu7WciDGEgvCjdXwG3E9cP+kOVdajw8Ch/8Yupmn9hh5qs5IPi6jE/wTM8SztfRf+8jjgzv7U+XUySF6DQq7HY7n1Onm9Fm1O1QwRu96PaGuz51zooU2PFgYAl6YOiNuIfCX0dw5wqe8OacQLCd9V0DavhWhTzd/VUHJr3OxpAFLomT8soAdZ6gYZIBx2zQ2qjmZ3xvaMa+Fr9b7HbVOZkVbTKJlP/PBVTFaDBnKAOS6PZZ+V/uktSBn45or9aafJ3ZvU49IEiJ9lYlDpF6Yctf3o60LAT9NSItKdzVQdE1vPS3MezC5GwjnuaXOV3/YcAR+wUSBDC0P2Unnwu7CV9eIxAMgs3WZimyeVanpEGoEu8/axEJV2pSb77vmhOLL/io9eKIwXSCwaDm/5X3ifeEiSiyqb2/vveOl4boYOUjlDnWDFGavBjp4uQWBCJiiQNhQvMsaxZfKpQG+cwrZAHB80gmwiJ7T0jcKqjlh7y4730Bj/kDfYcSFrC8fpsHUa0m0P0c8tHdFSjV8w5rUk+ctzFtP2Wjvz3I/nxHQsBGOPrW8A5tgMocSpJwr1wuLYYpvST79AIuXpm+ZU1h9596/MJPhoB1xzoPQZd5Ku6XZDVlOI+WZF3WD1Z1Ir42SdQkW8vF1fH1sUbKGl9UI2+WmPYz4dz0ZQn3YQ3pDnGJs/Np6wYPlpuZIyoaIZNIOfnDndGLAc3kpQBclxxPhF/nnDcWMJBJ3FNH4gu4IAfRY
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199015)(40470700004)(46966006)(36840700001)(70206006)(47076005)(336012)(356005)(7636003)(4326008)(70586007)(40480700001)(5660300002)(2906002)(44832011)(82740400003)(36756003)(8936002)(40460700003)(36860700001)(478600001)(426003)(82310400005)(26005)(186003)(2616005)(8676002)(6266002)(107886003)(54906003)(41300700001)(6666004)(110136005)(316002)(42186006)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 08:46:12.9153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4efbda05-ef01-4860-a43f-08da9c76e785
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT050.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7232
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

If the tx_half_empty interrupt comes first instead of tx_empty,
STOP bit is generated even before all the bytes are transmitted
out on the bus.
STOP bit should be sent only after all the bytes in the FIFO are
transmitted out of the FIFO. So wait until FIFO is empty before sending
the STOP bit.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 10e0fafb25f1..1149104074a7 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -436,6 +436,13 @@ static void xiic_fill_tx_fifo(struct xiic_i2c *i2c)
 				data |= XIIC_TX_DYN_STOP_MASK;
 			} else {
 				u8 cr;
+				int status;
+
+				/* Wait till FIFO is empty so STOP is sent last */
+				status = xiic_wait_tx_empty(i2c);
+				if (status)
+					return;
+
 				/* Write to CR to stop */
 				cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
 				xiic_setreg8(i2c, XIIC_CR_REG_OFFSET, cr &
-- 
2.25.1

