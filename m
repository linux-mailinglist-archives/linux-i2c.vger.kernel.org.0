Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 796BC395BD5
	for <lists+linux-i2c@lfdr.de>; Mon, 31 May 2021 15:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbhEaNZF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 May 2021 09:25:05 -0400
Received: from mail-dm6nam12on2047.outbound.protection.outlook.com ([40.107.243.47]:52417
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232326AbhEaNXD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 May 2021 09:23:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CD0lrV4k0VTEC5lZcjzOvw3IdKbKaWRvd8tJljZc5EAe1FiMRPFOzVsmTNL1GVtrKV0ZN04JSoH1TAavaJuf31CGkLU4a4ZEni8OGIPuU9lOciwwUGasQb9aOvo3w8L7WiOjQR5YgEqfYa/cm9Flz333/Qzvxxql5OG15uV5lofn0HZb094iDkH/mbZErvTICaU655+mGuRLMFPed24KNNnaaDo0USW3oAz/i+DltTNx1RxnQLvf/y9abFqN8ZcSZLcXJhjmpBHuL25VYINAy57T4Bj9wHRPRqlbdo2w2Q2swsqpjy2I1ElkTgi0Lyws2Y3nu7ll0XIM08/KxBn1og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1mSY4xjMpvJiPHE0Kng2VNRZf7RmIpdHKpS2KRDKlg=;
 b=KcW7k75B5H42tURfgyBxDXumgbDX5GaitZUPPVcCCS2SWjXQQJ0nDGYqZJQG5q1zLf9xD86vyY9rZWuT7/2pOE5ARUtbbISZvVglYgRQMKOMjVpTtB9YWgyrjlMSOQo+zrxmLZu3qyg72MoBftn0ywL0GaXZ50HUQYIJQzjRaEIFG8O35VCoYXLHliQY5WRU0IU3Aso+1Uae0vSQAgxQ6vNFQo3uYws24IjmXwYqmCHkWCLrLoy8EvM6cptCLoJXj15bP9iW2HKKM/h0bYx6F6JSylOlWEn1MNFJcHH7eWbpp66N0A7t3oWtwCmSebupo0qR8/8DPYirS6lc4LxaFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1mSY4xjMpvJiPHE0Kng2VNRZf7RmIpdHKpS2KRDKlg=;
 b=D3znCu5vYep9IQemri29xXvFkn79XDJ034MGKD0lkYpVkQOlxtOsVn/y6LNvbd0RkgkutqdWLSq9npOrSLedaxcw+iSy3hFt7yWtOAOoXhvYFXTWt1C3Yos0WVWb5NceW8+kNWBK77sqzfad2GPOAdpY6ZxBNBQjVQzHxzBCNEo=
Received: from SN6PR04CA0099.namprd04.prod.outlook.com (2603:10b6:805:f2::40)
 by BN0PR02MB8286.namprd02.prod.outlook.com (2603:10b6:408:159::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Mon, 31 May
 2021 13:21:22 +0000
Received: from SN1NAM02FT0018.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:f2::4) by SN6PR04CA0099.outlook.office365.com
 (2603:10b6:805:f2::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Mon, 31 May 2021 13:21:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0018.mail.protection.outlook.com (10.97.5.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4150.30 via Frontend Transport; Mon, 31 May 2021 13:21:22 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 06:21:02 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 31 May 2021 06:21:02 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 marex@denx.de
Received: from [10.140.6.25] (port=53014 helo=xhdnagasure40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <raviteja.narayanam@xilinx.com>)
        id 1lnhqn-0004GE-02; Mon, 31 May 2021 06:21:01 -0700
From:   Raviteja Narayanam <raviteja.narayanam@xilinx.com>
To:     <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>, <marex@denx.de>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH 08/10] i2c: xiic: Remove interrupt enable/disable in Rx path
Date:   Mon, 31 May 2021 07:19:46 -0600
Message-ID: <20210531131948.19477-9-raviteja.narayanam@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
References: <20210531131948.19477-1-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d752382e-51d6-481e-7163-08d92436fbd3
X-MS-TrafficTypeDiagnostic: BN0PR02MB8286:
X-Microsoft-Antispam-PRVS: <BN0PR02MB8286A5017F7DAF238663B8BDCA3F9@BN0PR02MB8286.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jmx0wRlpWuKOptUNSWP9hfoYp3HmFilP3yacePR5gP3ItnLvNXSce3VQ+6ErlMECUtKWCnNmQsMXJWikRB7j8E7GRi0M3a8DXs6zJlTwIeb0yO4vSbfIxdWSToQCb4wNmkmlrXmLu16us17HAbS+sYGpVJPN7ZSC839xmTR9TP2E2x97vViH6969UDbr9peQjeHpcT1kLk4zyAVdVmzn/u1+pJVXEMsg0E/acNINOIWxfKKrRR0+rFYOuqgSij0XSbga7zNgedUfBoJKbpWtpY0Bf56i8IkUjgyRAr/WrVJ2MIMfIuNMYYLu09DP/8HrEicuShJV7/jfTD/HoLviwb3gtNKNIfSNIndy3e+OdJZRYbl9yH3rxSM5nz3bQOuAYPnNnRIc/7YAoXdJubKdve0BcCW/3DL/P60o1hDWoUaW28vtOHuhoRD6Hjscr2dgWLDUSK4jH0N0qR9TDIbQVY2dp63CIl5z7oWQLyiQepDD9dKe9uSfLFJnL4hhhU736pHdxQt/b+KEFsKpXnui4yszl1kVhomxNXOwKwUPYZsEZZ6b107YQxhSzi6jVupPN2QDNt7zynCUK65Rdy8JGMuBEkCRp2l7MRAwyDAkPKXTUU/ZVsd5QIA6htN7uth3kffaXgvIe96MWDAIFeyToa52pH9zTLlhcXcXgTQp46RNROjHwXUvjsj/OqBJKFD+
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966006)(36840700001)(4326008)(107886003)(8676002)(8936002)(6666004)(6636002)(478600001)(7696005)(110136005)(47076005)(2616005)(9786002)(44832011)(2906002)(70206006)(1076003)(70586007)(7636003)(36860700001)(5660300002)(36906005)(316002)(426003)(36756003)(54906003)(336012)(83380400001)(356005)(82740400003)(26005)(186003)(82310400003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 13:21:22.0588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d752382e-51d6-481e-7163-08d92436fbd3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0018.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8286
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

As the 'DYNAMIC_MODE_READ_BROKEN_BIT' quirk is added in the driver,
we no longer enter dynamic mode for the effected IP versions.
So, remove local_irq_save/local_irq_restore APIs from driver.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 2f0808249ceb..f022a1885b6a 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -759,7 +759,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 	u16 rx_watermark;
 	u8 cr = 0, rfd_set = 0;
 	struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
-	unsigned long flags;
 
 	dev_dbg(i2c->adap.dev.parent, "%s entry, ISR: 0x%x, CR: 0x%x\n",
 		__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
@@ -790,7 +789,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, bytes);
 
-		local_irq_save(flags);
 		if (!(msg->flags & I2C_M_NOSTART))
 			/* write the address */
 			xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
@@ -804,7 +802,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 		val |= msg->len;
 
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);
-		local_irq_restore(flags);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
-- 
2.17.1

