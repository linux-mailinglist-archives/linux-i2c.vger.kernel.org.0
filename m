Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BAC3687941
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Feb 2023 10:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232475AbjBBJoT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Feb 2023 04:44:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbjBBJoR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Feb 2023 04:44:17 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0EE6FD12;
        Thu,  2 Feb 2023 01:43:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BauQr/6RcqkuneW2Mzl5GHs4to5Q+L/rneUx4R1EWbPx3G/SQFAsP1YI2GqKdlK3TLdUxR7s+FSJWYAQ0w/N9Cor0trA9TALbl0jmM1Qyrw8LGCc5J81jakYusq8LL1qG6ne0Yh9XfQORgXhZz78Elghntjsn2BipmRo03z0oKq8FVEIVNwCnXBJepQCe4bisIq/J10xt93Nxt2D1zVSwyvMCSxyddpUZCl8l0T0p7+F4j2+Ey9PQip7WIS2/iDzAQXZWjbUL3ubTiPRXIKDmDwZC+NRyrLdY2uhIKpbUv6xwwXU88icit+mSDMbgio38UuSg7mOgyj37ZG9HmRqng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExBzXmoeQqQy6SJXii/rVwQPDE7JZKxm7zug/cBRlr0=;
 b=DwxIxOiMrB1MfEZuI5/GqqFKeI6kor6ENRTBDvnIjB2Fc9VQCac1gu4O/36VwCjtNQJ+AqOl7z3eKQRyDrkf9ZSbHfmXcaSp1i1bQQMNvmgo/kN9dmJdwGnAqmLxNgT7IMznwHsOKW3VV3EObYpGzy3lN/+NuiAq4ZPjluBBwSQH8nZPut2QCcQ3XBL72giNvtUmL2ki8b/zavd3axOQpeEUM+Yu5Zlt1Tw6cam3EiqTjU7gRiR7J3j2DMnoDT2nkAJM4CxYfOdvwHARUKl9Ooxoz7kc4yr9MmDcnLHocg+fKqu4PMrIQLe+w10RvXwEgr+5ZkwgPlHPLcd09hVblg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExBzXmoeQqQy6SJXii/rVwQPDE7JZKxm7zug/cBRlr0=;
 b=SUpNAOPfdSCFHVvAPo5AVWEyMqIfRt+Z3KSIJWCgOFRiAeLJ5VBVh7xn0KkRqbAg7mbpUCKV45XRtxeBCWCnx1TMqiCUJAjqnZs3IwjNr9/NS6sxZFD4lVy/PXZk1d/oZeFzZjsjXU4iRydcg/lV/lxRObBTdlLHIfIySOLbi0k=
Received: from SA0PR13CA0013.namprd13.prod.outlook.com (2603:10b6:806:130::18)
 by MW4PR02MB7347.namprd02.prod.outlook.com (2603:10b6:303:71::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Thu, 2 Feb
 2023 09:43:18 +0000
Received: from SN1NAM02FT0043.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:130:cafe::d1) by SA0PR13CA0013.outlook.office365.com
 (2603:10b6:806:130::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.7 via Frontend
 Transport; Thu, 2 Feb 2023 09:43:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0043.mail.protection.outlook.com (10.97.5.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.25 via Frontend Transport; Thu, 2 Feb 2023 09:43:17 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 2 Feb 2023 01:43:13 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 01:43:13 -0800
Envelope-to: git@amd.com,
 manikanta.guntupalli@amd.com,
 michal.simek@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 manion05gk@gmail.com,
 robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org,
 andrew@lunn.ch,
 devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.3] (port=36999 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pNW7d-0003R6-0N; Thu, 02 Feb 2023 01:43:13 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id 554801055BD; Thu,  2 Feb 2023 15:12:24 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <devicetree@vger.kernel.org>, <andrew@lunn.ch>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <git@amd.com>, <manikanta.guntupalli@amd.com>,
        <srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
        <manion05gk@gmail.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: [PATCH V4 4/9] i2c: xiic: Add wait for FIFO empty in send_tx
Date:   Thu, 2 Feb 2023 15:11:33 +0530
Message-ID: <1675330898-563-5-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
References: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1NAM02FT0043:EE_|MW4PR02MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: d0847ade-83cc-4a36-202b-08db0501e9a1
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y/dbxxj4t5TAcKWONVEfhrbUDT56QVIMoOlFZMNGyF4Q64Rt5qSU7bvlQwP0VPRULlFzVvi1oCq/KAVjRL3j23dXFP3NmT/rHd2J/pcAFT6XWTB3WBdaDtc6ryhRBZB+SIfjkXkmDbzZlp/E1kNTnOyWsQpEldcgnjJHn9L01tgj6CdmEG7VKtqTF2n8wu6ZyjBBGv9cB8RXCfOf1X2Cyf7/oSKCSeKcwQSBsyIN3HueDowrY6xyxj/n1qsfj46t8V0eyqJaMyzlFIyesxFH4cGneoZ0taR6o3QpA1+B5i9/lYimfNJTan9B7OuR5Dy1zGGCOAjF6xGnNCuOux4W/m7GxqTV3TfLm7OW4uKPq950UWZSquAL7uog8ZBIMyWS5WDpWi0qtzX7Z54t+WzZoNaXBKK94hybdD0roOt+YMtc7oG6w8b9tEfumdPxt2Ehgh2TPryrsdWis7Lvgvb9dxCK6++DygMXeZoR/hvPGGAbJDAA9XB3CFOgr/Q2j96qZDezvXPULXKHIkdXDqCSUSHjn/1flc6nGyGFJJLcM3wANTMNrzh9WTd1bbM3azB5FmHtjatP68L0qIF5Gz9mwPu7kgskrapDcllJVm5JeuzJWolLLVEVRMo1wMWh9/ueWPmGSX8wqge3UQaVKT75G5B8CowCyLoSERoxDVdATSpV99osOvJ2ZYrqCUbtkluIr1BVa39N7F6mK5QKPA7MHXYm+0IH7nybPINc8exSA7kFtVJgFa3zqLDHwtBQZc8A
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230025)(39860400002)(136003)(396003)(376002)(346002)(451199018)(40470700004)(46966006)(36840700001)(5660300002)(44832011)(7416002)(41300700001)(8936002)(478600001)(36860700001)(4326008)(47076005)(70206006)(70586007)(8676002)(107886003)(6666004)(36756003)(186003)(6266002)(42882007)(336012)(110136005)(2616005)(42186006)(26005)(2906002)(7636003)(82740400003)(40460700003)(356005)(83170400001)(54906003)(316002)(40480700001)(82310400005)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 09:43:17.5033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0847ade-83cc-4a36-202b-08db0501e9a1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0043.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7347
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

