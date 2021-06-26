Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3093B4E0A
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Jun 2021 12:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbhFZKbc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Jun 2021 06:31:32 -0400
Received: from mail-mw2nam10on2041.outbound.protection.outlook.com ([40.107.94.41]:51557
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230091AbhFZKbP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 26 Jun 2021 06:31:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGva/2hX7cJcjr0u9qX3Ihg+wRtqrCYkRgQn2qvAwYu4vZLU+cVbT9DibNYQzJyuIClm6m1NANt1f1vXy8+PuBH5AkDreKRcwnZUpP4bPH7AoYOdIRyoKk4EmMZYC1KtuLVLdKjTL4gGD1tiEFuWcNmDeJDHcAi8ojBBXBy6gXXklblrGRnwFo3ddCTL2678a5U7Tr1eP2IljrW2nPk5V7ARiFvzEHYQL9R8+qu8VezZyR4TxCNS2+66zOD/T4HzawvkLAWSEaD1oYhC01vRykyY35/KUcn2ChyDcEfC3+e5w2zQUGzoof3ZnKnh5d8hfbqwzL1kfpAML2WBrmADiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZHdWlItDItKdHqHd7COthhh0FQoeZRENhTACPti+3Q=;
 b=hlrI1xa2wEozyZCh3CnXBT9Jhh25Bkkv6Cm0f4x8AsLlkIJsCRyTX1OFjaAb6wpRkm84PU7pVqsDe1Dtb8GDW+Te2XLdYclxobf7rahnjdeIOOV6ulU9D+6iERtPjpIpa/Ui2/wSLkaGxPUB9yST+YLL+QYgzgfqnnlRP0MJwonfsxC7P6ubhIFyzrtc62TaTiZMKYuwnCZKTdb/iPLX/+C5AC8qOYAMFYgYM0LBCfJ2eKEN5VQGxwjpIeQ2xu7gAQXZk4eIOKQ3oOHRiLBpO03D7Vec75DvMaSke8WNVPuP7XgeXL/bguqEZFPGJrULdjQXqd+TPX4wNMs3miQs2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZHdWlItDItKdHqHd7COthhh0FQoeZRENhTACPti+3Q=;
 b=Oq0LQ5YFPvffqeGQhMhQpROLSb0D9TjfzAxM0jBItbBmkAOd5cRbF/EF17chRXkZvr5cpZ7DP7n4RwFFD0kJvLJ9S6YD8UZJM/ScYQviaQ8hSFihe03lymhjKy4euFPR+dbXXpZ1/reDXzdRq23uq9QVIfKE1GzsIjWT7RnibKc=
Received: from SA9PR11CA0013.namprd11.prod.outlook.com (2603:10b6:806:6e::18)
 by BN6PR02MB3332.namprd02.prod.outlook.com (2603:10b6:405:6b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Sat, 26 Jun
 2021 10:28:51 +0000
Received: from SN1NAM02FT0005.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:6e:cafe::37) by SA9PR11CA0013.outlook.office365.com
 (2603:10b6:806:6e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Sat, 26 Jun 2021 10:28:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0005.mail.protection.outlook.com (10.97.4.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Sat, 26 Jun 2021 10:28:51 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 26 Jun 2021 03:28:41 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sat, 26 Jun 2021 03:28:41 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de,
 joe@perches.com
Received: from [10.140.6.6] (port=55646 helo=xhdappanad40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lx5YG-000AWJ-Hm; Sat, 26 Jun 2021 03:28:40 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        <joe@perches.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH v2 07/10] i2c: xiic: Return value of xiic_reinit
Date:   Sat, 26 Jun 2021 15:58:03 +0530
Message-ID: <20210626102806.15402-8-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d126b5b-55c7-47a1-da84-08d9388d3133
X-MS-TrafficTypeDiagnostic: BN6PR02MB3332:
X-Microsoft-Antispam-PRVS: <BN6PR02MB3332EFE60A7456DF16564A34CA059@BN6PR02MB3332.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: botN33TYnEf3/B7+9DkTUcjric4eVxNIPv8j4qD2pvogi8/O2P9S/n3JtJzH5vwG4GKXhyTrmesmNTXux5f75L06jKMUBDycGo8ITbMUdazvuF7XKojqVea1I+Btzdxpr0W46YKg+WahXXo6uiEuEZ9ZsZV+H2jaqxTyY6YFat93TZ8VtHOo5Z8jEOhVbn/kj19Es1mbVcv3fW/+r+bHdB2Km+IXj6bzKkgEpYFe65F45aYXrMJgd4mruqS4EhGVnVMRB2P61HwJRCJXJ+nfwRJLJFjNvggga7vJMYN+qGSwdXI6enOOAkyP3C2PeNX83PczcvTNkYhBbz2hFn+8t1GB75+xZWWPShSd8g4C5S23zbefbR4Ft2B04DpPH0PQSLIjvTUgx5plZta6fkG3xIQXSADBhiG17eR8pkzyQB39jxfFqYcg2eMrM2voFY8ks/XZulYAvSJ0QBiOBfv3Fzxstt/Lm0kSy49KcuNEqIHNYDghdWq7pYpAwQymR/tzBMTqSjZetFO1meFw+diJ7ESxd6y3QAzfTect1hm9seXY7HgaHuUsEJwSe9pHg4E5lHrJl0rJAql0RPs717IekdMmuEUzTQU2BuwuJi0E2rcnqA14dyvTNFocURydlMxCwetH9U//5PPEaAxZmUZbIHOpOq5eIeQNeKhSaOPIR/h4xF6zd0UKCS5oLLzNejlZjYpf9GTsVzFGpikV01aJ3scJB5hg2U5SwNJU9QpLiIY=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(46966006)(36840700001)(336012)(36860700001)(7696005)(1076003)(186003)(2616005)(26005)(5660300002)(47076005)(36756003)(54906003)(8676002)(44832011)(426003)(36906005)(316002)(6666004)(70206006)(70586007)(110136005)(107886003)(4326008)(478600001)(2906002)(8936002)(82740400003)(82310400003)(6636002)(9786002)(356005)(7636003)(83380400001)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2021 10:28:51.5862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d126b5b-55c7-47a1-da84-08d9388d3133
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0005.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3332
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Check the return value of xiic_reinit.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 007a78215a90..0d76261f1841 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -504,6 +504,7 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 	struct xiic_i2c *i2c = dev_id;
 	u32 pend, isr, ier;
 	u32 clr = 0;
+	int ret;
 
 	/* Get the interrupt Status from the IPIF. There is no clearing of
 	 * interrupts in the IPIF. Interrupts must be cleared at the source.
@@ -540,7 +541,9 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 		 * fifos and the next message is a TX with len 0 (only addr)
 		 * reset the IP instead of just flush fifos
 		 */
-		xiic_reinit(i2c);
+		ret = xiic_reinit(i2c);
+		if (!ret)
+			dev_dbg(i2c->adap.dev.parent, "reinit failed\n");
 
 		if (i2c->rx_msg)
 			xiic_wakeup(i2c, STATE_ERROR);
-- 
2.25.1

