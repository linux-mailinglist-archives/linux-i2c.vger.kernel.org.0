Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 690DD678F9F
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 06:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232570AbjAXFGA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 00:06:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232631AbjAXFF5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 00:05:57 -0500
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2078.outbound.protection.outlook.com [40.107.101.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA07439B9E;
        Mon, 23 Jan 2023 21:05:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XE068E1av3zOx/EXSVTqh44W7VIvhB19xJizrC0R2YpaXJlQG9emDjRqLiD7zqBbhUgjkDooDRrzZcsK1XhcThOYSnPVAL70pjtc9PmYWPqgvuzdHBWPSgcsIghlRvDeL7sO73NA5npdzsyuLZc8zT23F02OM2RNt6ifD3mz3L00KjVK5L08tIup0+yrsOD8TNa20lXlRhlC4P31HwmvxywE4EI6WmWYDnYYk3zgT/DlohRT7xRnU6aoUQ0+Ydb31BW/QGxSCAktWx7TF8acX1748SRJA2dU+m25iA8WyZZ6ZcNNZpchdHtLBVB9KMlEBKTHJ6vgQCHNxgApHiy50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExBzXmoeQqQy6SJXii/rVwQPDE7JZKxm7zug/cBRlr0=;
 b=mVUlgf3rextF+afwbUSxjdZGTiO0KIxcYqrX+Hz1+JFWeRZprZeR156GSrY1IRylg7yDuB3VQu2xDoyiWr9GFof8YFdpqcspW/t/vjJCpFXw/ilZRVr1geyrmkJD8ghwR8ADbO2S4KbRz64zhtJz7Qd27CVn+OpkVveRh9B6/i7oNgdfH1C+yAeGbVvAMAcQV1LfQQ9XGtkZwj5axK30JJ5XwzxH+QIy6R21QwzrmnfYvJavmRjtaLV13PABsOS9wemcuuxADdHzkYMuu3bOeTIZpC4hsEaVTXJe+DsyJ70tVvluIFuT5pb85Z/2oT5DI0myexuVKnJHuAIAg7gxWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExBzXmoeQqQy6SJXii/rVwQPDE7JZKxm7zug/cBRlr0=;
 b=HdRhFcQzEP4tN7D+Hc894D+OBhYkb6pJSU3rRQ9b8td0i9XIiv0ILakwR/jtn/lkgKKgsPx5dp2CHBYBPAM4fYsVTaCLc4N4KA4VPA1X914ASurCn9vi/ZKlIbcD86Je8MdGMKXf2M9s9MF2wF8bndonuqMw8RfGPyS6DzGDhHc=
Received: from DM6PR03CA0094.namprd03.prod.outlook.com (2603:10b6:5:333::27)
 by PH7PR02MB9290.namprd02.prod.outlook.com (2603:10b6:510:276::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 05:05:48 +0000
Received: from DM3NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::42) by DM6PR03CA0094.outlook.office365.com
 (2603:10b6:5:333::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 05:05:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT063.mail.protection.outlook.com (10.13.5.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Tue, 24 Jan 2023 05:05:47 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 23 Jan 2023 21:05:39 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 21:05:39 -0800
Envelope-to: git@amd.com,
 manikanta.guntupalli@amd.com,
 michal.simek@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 manion05gk@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.3] (port=57529 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pKBV5-0000ob-A0; Mon, 23 Jan 2023 21:05:39 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id D4ADA1055B0; Tue, 24 Jan 2023 10:34:49 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <git@amd.com>, <manikanta.guntupalli@amd.com>,
        <srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
        <manion05gk@gmail.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH V3 4/9] i2c: xiic: Add wait for FIFO empty in send_tx
Date:   Tue, 24 Jan 2023 10:34:37 +0530
Message-ID: <1674536682-25278-5-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1674536682-25278-1-git-send-email-manikanta.guntupalli@amd.com>
References: <1674536682-25278-1-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3NAM02FT063:EE_|PH7PR02MB9290:EE_
X-MS-Office365-Filtering-Correlation-Id: 414b0937-788a-4b42-1d31-08dafdc8a814
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nTBvsJqkZdViryXs5sFGq+4HUwjAfyjKhtNMv5NBrr9YnfLUoCx37vZhWHyu2ZXYPJlKmQj8D84V95p0GvRMkpZz5QN/qDNDH6OD1jeP/FDUWDbOWvWXZO0VMFnLeLEnQswnrFXGU3/+tXyd2hhNc40JjcE9/40JC9KiO63JDPpCODjGMsbK4nFVA0SDlItmnKlNCeIocCaEwGIGBNr7giT4q1ypl1b9+evX3hcCbax3wJ2zOSso/KBcVEyhOVsMOztvP2Jj2Dff4L8TrqOGmj1oSrKGYzxky7hFuZAjVBbsjbttw8lhCLZbcTtve1HBE+X5IBzT1w0w8//PE8hNFUWXkzCgJCR75sZx9sRaacc54vkXZ9HzWyicb7stBy9rOI0dOqou2DzOHlgJaz7SHkysH8zWobQ7BpOCMMlnOuhnYYnWNW9g/CKuz5j3IIpIXmpiOfo0YUzlsCipCiMqKcaHHObNDD0YH3+wKKR+UbZWgE8FBhlnrFDJy442P9GADQrgN4qoE98ZvitketrsvJASvhbDqFa2VCz+PUhjcZwpWZHvpMHg6m73v/ZQoCufhAr+q9j2soKoSZCiDo1Fahy9qZvBOWkMk197pxjj66Si28B1t1tGQrDIrHnSi8JaOIUoGUXsblQ4yySbTOhwZ5LJL4BgZUTUBqOAhcAZWF1pdad5nVqvv+yz23UKkIMyA8ZzSpdhcP1onaxvxmgH5VJdOHDmSzq7TuYmqLLM0ob6gwEpNU+vkRKGC1p31IGv
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(40470700004)(46966006)(36840700001)(478600001)(26005)(6266002)(186003)(6666004)(107886003)(2616005)(4326008)(8676002)(54906003)(110136005)(47076005)(70586007)(70206006)(42882007)(5660300002)(44832011)(41300700001)(8936002)(2906002)(36860700001)(356005)(40480700001)(82740400003)(83170400001)(7636003)(42186006)(336012)(316002)(40460700003)(36756003)(82310400005)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 05:05:47.9648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 414b0937-788a-4b42-1d31-08dafdc8a814
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT063.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR02MB9290
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
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
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Acked-by: Michal Simek <michal.simek@amd.com>
---
 drivers/i2c/busses/i2c-xiic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index edc64b79e293..57084696429c 100644
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

