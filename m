Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6D43395BD1
	for <lists+linux-i2c@lfdr.de>; Mon, 31 May 2021 15:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbhEaNZC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 May 2021 09:25:02 -0400
Received: from mail-co1nam11on2059.outbound.protection.outlook.com ([40.107.220.59]:35297
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231659AbhEaNXB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 May 2021 09:23:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuyNRAIbmVAFdwl8d4e5upihZK78q2GDvJL9mb96BVZZ2dcrKrWXr8ryuXXuJmK9RaIbV61CD82OrHWZJmHlCjE5XD0Y5b0mA0ZKQ5Q5MDfw6UyvJxXRulj5lEemEIlRgE2lAZq0PR7ug5uutEPaRb2kdzywnrUG6JTd45M3/zTod9AHfZGoVdFWPwPmVNvizlFGgEhRwAkk0fL7/NVto5jNCCkoeKDQ9qV+PEZ7M6GIefjm/82RSlTnEJ5Di6zljpRX9tmriB3e26mqstBuefPdJ94f2ec4QncAZeBQFphxZ9bOpLKPY5wMy3BGkLWYB1VPo7jFqVYZkDJDGzYpQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ClKogobnQcNSwgLE99C4BZTqFyy1HYLlq1HIx6KRyvA=;
 b=LW8asUwBcP1ij5TvXz7D0MMMNTSkFoS6s60y+/emTWSNxauEyXSzCjYi/gLvKa/ougxiK9vYumCsOUoDYsCInBE7psyrLnIpNXrer3JI5EnkFq4yNfiNV84MnuKANqHNjc45mSCEyR7mdmbtccICIrmaKcVmpfSeEJyVQwDQCKjbHpbawd3uQMtLQQPV0WDBc6IvtA2Loh4xqgFSJKvpxa+QONGD9NCmn55L4GxHmvHOD75A4m7mklFL8Jqem9GIGxRP2JKV0/iBjlJOfM+KBYurRnxw9xd6qQ+H+NpVRHnVvaFfIDqro5WJJNKk0QE3FoiZCDZt6cYJJ0RuXWphMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ClKogobnQcNSwgLE99C4BZTqFyy1HYLlq1HIx6KRyvA=;
 b=gQ5CxCMg558eZZQK4SUeWoWID/LxRkEcc1EI0xxpRlpE+ozSGdfrkn8aUFmQ5o8aHBYjD//b4amSmdY9VxHttF81LZw60wh7Zp+JjFm1FtiWwSnWqzE/BsWYSsM8qN7r7OEcq+YDY05FpeO+hjmljFGDyhyhukCyShI5McixNyU=
Received: from SN6PR04CA0089.namprd04.prod.outlook.com (2603:10b6:805:f2::30)
 by MN2PR02MB6766.namprd02.prod.outlook.com (2603:10b6:208:1dc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Mon, 31 May
 2021 13:21:19 +0000
Received: from SN1NAM02FT0018.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:f2:cafe::db) by SN6PR04CA0089.outlook.office365.com
 (2603:10b6:805:f2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Mon, 31 May 2021 13:21:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0018.mail.protection.outlook.com (10.97.5.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4150.30 via Frontend Transport; Mon, 31 May 2021 13:21:19 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 06:20:47 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 31 May 2021 06:20:47 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de
Received: from [10.140.6.25] (port=53014 helo=xhdnagasure40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lnhqX-0004GE-Ne; Mon, 31 May 2021 06:20:46 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH 05/10] i2c: xiic: Return value of xiic_reinit
Date:   Mon, 31 May 2021 07:19:43 -0600
Message-ID: <20210531131948.19477-6-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
References: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b2e8fb6-728f-4cdc-140b-08d92436fa0d
X-MS-TrafficTypeDiagnostic: MN2PR02MB6766:
X-Microsoft-Antispam-PRVS: <MN2PR02MB6766522E2E96C4A1D37A7BE7CA3F9@MN2PR02MB6766.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E3vUVEp3RjPrwZu/Xw84nU1ahOl8HfqiJD8zYnr4UiO3EPiCJxqHJaEjNjpUaDlpBOAuO+n9PEfX79/0STL9GYAb/9mRIYFr6mZ9oL1g9D6r3oIQHoqvuMt0iNKyHNgrMaL5oYKeyP91K5ArZQd3cOEDzNFa3He4noICxBDHhA+G1A0/MSu7fBF/3HcvkwdYXLSB6Mm+pnzdjJK69S8M7vBH7OhmnyNhdOjo25mjd1E59A5pqP3oQAT8WA+O63kdZe4k/fWQVipEKdgKjiBXlNfJvozb7PEx9mA5VvghwIEh28HsBYH/wh0e1AWVnxRr7vmmIeA2YkSCr7UptEslNSMl+euFtrDot+Y4P+z0pr2U107ik7wqt4jev8ybkR7LRREaTb0NGxPjnPivGiepZx9VTlEHWMz5C5B/Z32uTN3GeG3XQ1MhY8fbvFsHQXWURF7IRvLDSe0WAa59bXDJTJRWWyCa+RxntbhxYXiF4WkHLft5HJdzzVMGXXo9dmYiszGx538pywYj4BgSocs2k6j4snviKeRKXhTigNm4EOeEorBN0hULunQJ+EK6sSqrnMJg9ihcoKWxoJF0RVadqcnSd5b6BQSFdbZ/6oEcEtvwJQi9UZuGEPaUL2qNeY1SHeEWxnw/cQDyfGQLpr1oFaU1znSzU4FZnELZUjkFmi8sX3YbobNqJdYfE3Fwr3vX
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(36840700001)(46966006)(7696005)(2616005)(44832011)(5660300002)(26005)(36756003)(336012)(478600001)(426003)(9786002)(6636002)(70206006)(110136005)(47076005)(54906003)(8676002)(4326008)(2906002)(82310400003)(83380400001)(82740400003)(1076003)(8936002)(186003)(36906005)(70586007)(316002)(107886003)(36860700001)(7636003)(6666004)(356005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 13:21:19.0831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b2e8fb6-728f-4cdc-140b-08d92436fa0d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0018.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6766
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
index 51b5fd5768db..b2ac76d94212 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -556,6 +556,7 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 	struct xiic_i2c *i2c = dev_id;
 	u32 pend, isr, ier;
 	u32 clr = 0;
+	int ret;
 
 	/* Get the interrupt Status from the IPIF. There is no clearing of
 	 * interrupts in the IPIF. Interrupts must be cleared at the source.
@@ -592,7 +593,9 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
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
2.17.1

