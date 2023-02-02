Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C25D868794C
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Feb 2023 10:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232603AbjBBJoy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Feb 2023 04:44:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232553AbjBBJot (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Feb 2023 04:44:49 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 397DB6B03D;
        Thu,  2 Feb 2023 01:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpodUzk6jIkSle0noJHm+rMH1esOyYrXTjU8vDPgavLU7ZXKToZGQpAxy1BDbwXNCJaNLUK92auN5M/6XYamvX28+RKjT4yoD4Ujc2aqFNgt4vaE0inqGP6S6wx00e8ONwsE6slo+ytV770ybWCC23sZGg86koUgIg6cDU76uxRTul89dDoKE5018DUpP+mVwJVVQp/Q4qMbBfRws1UvJb1Ra1FfIfhVirmVPo3QoyzWK1Dyc2oqcHnEnunX+qm3YtxdeNAnwf0cXrna6joYS8rshcpBYPKIHhvRTYjcicrd1U/sKPauhNgzQKJsDfzGDo7CnzRWtc6iKRJQqD9URA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZZnzs0iQxqKdtxkP8yCrlEW1QCuOzMXhrAK1oATYzQ=;
 b=XfWSVmD2NQadHx7fqL51X8aOFz5aggosMo+R07SYR/+ihE+Lg5JdeC26qX6wf0NEQD1LCR+BC5p4EEFaQfc+63luMbf8yXl+c8z82/EWEUovyQgfVr7c64IKvJJ0qk3vBj0YKjm2USE7NQx6OaXKpvbvTTT1ixS8xxqmuejQ9YPGJzp9rzMufJ9J0CEjkTyCbe8JZpBWuo4Xfunwl6YIt62AzBhll8yBUAvr69U96egdTHMbXrq6qPdyx3trcJLaMXRa7i0s0G5GYkKRgsXbR7cN026Tcx/RypRJTkSCKIIt+tqCmi2SK+GfCCAATA3qvtUiSM9VyeXAErnMc4y5cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZZnzs0iQxqKdtxkP8yCrlEW1QCuOzMXhrAK1oATYzQ=;
 b=LD9ZMPY2xr4fnuQMADX3Ci4cAturSDEh6LESH6jRcSapKd6W7XPp0xhN0rbMnBYCpTqgOgHeQBxfYaMTChpbhiQhdwWty9dSgvG030ffShNDGGsRMZ03r9g1ldzOyW3HUHuE92FMFpI/GX8qD1FRKDBAjcQmChGRxY45rFyF7hM=
Received: from SA9PR13CA0175.namprd13.prod.outlook.com (2603:10b6:806:28::30)
 by MW4PR02MB7218.namprd02.prod.outlook.com (2603:10b6:303:65::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 09:43:43 +0000
Received: from SN1NAM02FT0060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:28:cafe::c3) by SA9PR13CA0175.outlook.office365.com
 (2603:10b6:806:28::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.7 via Frontend
 Transport; Thu, 2 Feb 2023 09:43:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0060.mail.protection.outlook.com (10.97.4.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.27 via Frontend Transport; Thu, 2 Feb 2023 09:43:42 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 2 Feb 2023 01:43:39 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 01:43:39 -0800
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
Received: from [172.23.64.3] (port=37002 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pNW83-000Cag-F4; Thu, 02 Feb 2023 01:43:39 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id 52DA41055BF; Thu,  2 Feb 2023 15:12:26 +0530 (IST)
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
Subject: [PATCH V4 6/9] i2c: xiic: Remove interrupt enable/disable in Rx path
Date:   Thu, 2 Feb 2023 15:11:35 +0530
Message-ID: <1675330898-563-7-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
References: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1NAM02FT0060:EE_|MW4PR02MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9ff7f6-d61d-496c-3292-08db0501f8b0
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Kij0Z8upDseQuE6PzRYu5x3rg666rOpHiesHDdE9cST3u23z0Z6JZjppCdmocKCI64+OfaSaOZsy3R0oYX7HxfHhh4btqZYXpf+eaPp7sjMTyiS2s9ValEXmRDD36MH0ES9AAd6JiIZIUTaHeAhmW0oQCawm+muEQbEKkElh2MqeAxO7yQJlpWIgZ8tmAtXNsII8icnxx6lOKZ97e8BDiT/OCZblaFoHbqtSr/W0tDoG7OA4wu5NsS50mY5pqWE2I7gtpfMvMJtMC7SPb39tExjcWceop9bvJ7lWcBvr0YE47Ua6uXLOOq7HimJDu/vBpiRFr3LfSq16QcC3ieCI0Rwd0KX30gLSV/xdi4FAia+PaJ9sPgbFeb/Lp6xkzj/Kw8ccSsTC7kihEejFJvA8hk4XCWpAOmPzx6wSwyCRiVW18klKq2fmb+stnxzlLb/cnKMS4hIip5xeRV/voXb8tXK6kY/tO0Clr+m5z2uyeU1EJ0+Acp4T9qcUUDh9G/B7Q1Xx5Ww8ATAU0YijNPLOoMk8OUy+Lm7zSN9fwdt17Vf3eFddHTqgmQxqSX+n+dnzRpWnq9p1M4b671S04OHYhvZWKGREC26IcP7wUuQJ5XjqtJ0w3aG6S4fAfP5Gh7Dbog3QTidiDlhJz2dsC+P9BvfmTLr7YvqX5mk2EBxbXQ+4LyYd328kNYTlNZwibflsK5+ALpQgIlHmsLSvd1CUxOtI1vo2e/3RM1xK2G4rc3I+aMWg1q2aeTet5DmMH6N
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230025)(346002)(136003)(396003)(39860400002)(376002)(451199018)(46966006)(40470700004)(36840700001)(36756003)(42882007)(70586007)(478600001)(83170400001)(4326008)(83380400001)(82310400005)(8676002)(36860700001)(110136005)(54906003)(82740400003)(7636003)(70206006)(316002)(42186006)(107886003)(6666004)(26005)(186003)(6266002)(40460700003)(44832011)(7416002)(5660300002)(47076005)(40480700001)(41300700001)(356005)(2616005)(8936002)(336012)(2906002)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 09:43:42.7522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9ff7f6-d61d-496c-3292-08db0501f8b0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7218
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

'DYNAMIC_MODE_READ_BROKEN_BIT' quirk added in the driver,
effected IP versions no longer enter dynamic mode.
So, remove local_irq_save/local_irq_restore APIs from driver.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Acked-by: Michal Simek <michal.simek@amd.com>
---
 drivers/i2c/busses/i2c-xiic.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 554f83e34a2a..8503b5016aaf 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -741,7 +741,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 	u16 rx_watermark;
 	u8 cr = 0, rfd_set = 0;
 	struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
-	unsigned long flags;
 
 	dev_dbg(i2c->adap.dev.parent, "%s entry, ISR: 0x%x, CR: 0x%x\n",
 		__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
@@ -773,8 +772,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 			bytes--;
 		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, bytes);
 
-		local_irq_save(flags);
-
 		/* write the address */
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
 			      i2c_8bit_addr_from_msg(msg) |
@@ -787,8 +784,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);
 
 		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
-
-		local_irq_restore(flags);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
-- 
2.25.1

