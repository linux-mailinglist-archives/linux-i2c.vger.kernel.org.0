Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7E015349A6
	for <lists+linux-i2c@lfdr.de>; Thu, 26 May 2022 06:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238033AbiEZEJ3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 May 2022 00:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231209AbiEZEJ1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 May 2022 00:09:27 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FE0BCE8E
        for <linux-i2c@vger.kernel.org>; Wed, 25 May 2022 21:09:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOTFKzZRX6BEvG1SzOv2it5VN0w47eGwu6kTL/yDjwFqGkOAsjO8D14pmW1BeaSvXqHVuc+eX0UP1/guFuWjaLPAHmR6ZaIUSwl81p+d1jXwkahmjHg7Q7Nkap++uiJfhP2sG6XyXM9N6rh8+Gz1S0ymUz9MoNuSH1WKXyu6nYm0iSvQePvFvqQqaMjS+HrLttDC4x4MmIn428I3JNy2lU5lCHpsKrnBgXk2T9DcNn90PX14ge7rURMt3SpwvHLcAyDA+ZWaY4uLtfM0ZFWg9qEVXHG2Q4yORIbUNF39FdMlLSvTVjnMBW2Rvy/jrK+BfrErllCrt8ZRekq9XOxr3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhcYE6VBBb2MpQaOyepmdUaQBSvkXjjjYuYZSPJ+dYk=;
 b=UanSd0fl1pmvcnsYVql2vL9F3yC1Z+B9Yg+1xrXJEQQfhZWTLcNZT1ZTIBxweUoTEbzqADkfEAD/GX//OhYwynCOdhyIAa1dEsPWUlYgSPB13BfGLbC1Y/EXDzuy0hZmwseo2R6ZSWcGt6L72MSqa1JiSk3/l1IYxuOoIUDEW99cCjRaQieMvoz5PlrqLKQPWkM+dXnhfRIIrqNv9TvFLPUyDSjx7WGG8CWA2encNlCXOBTSvtl9LYRssJJBsrr8y7Q25JlQlKEhKG7weEZ9XPq0sFnyc2b9R+djfVAypqEhkaqIc7ysHgj88Ntc5BaS8Wb9gqC84ZuXDELmggTm2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhcYE6VBBb2MpQaOyepmdUaQBSvkXjjjYuYZSPJ+dYk=;
 b=cPWh33EdgAjSa2SOOqPBsLR8D41atEnBdO1XoEsJmmrkpRilMuMPY8EXfDrOVt6sdn/OBumZ5AUGcPUDBOh6k8iwRu0BLOxBrTrTcVt1hQ3Qh/8T9tDDEl1QPkn3eu6xBOxK8HU5wM8uVYxkehYA5gScLNmJ297swVHKSIK/XRw=
Received: from BN8PR16CA0029.namprd16.prod.outlook.com (2603:10b6:408:4c::42)
 by SA0PR02MB7211.namprd02.prod.outlook.com (2603:10b6:806:e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 04:09:23 +0000
Received: from BN1NAM02FT013.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::5a) by BN8PR16CA0029.outlook.office365.com
 (2603:10b6:408:4c::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23 via Frontend
 Transport; Thu, 26 May 2022 04:09:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT013.mail.protection.outlook.com (10.13.2.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Thu, 26 May 2022 04:09:23 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 25 May 2022 21:09:21 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 25 May 2022 21:09:21 -0700
Envelope-to: linux-i2c@vger.kernel.org
Received: from [10.140.6.39] (port=53862 helo=xhdsgoud40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1nu4oH-0001Fi-5K; Wed, 25 May 2022 21:09:21 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH] i2c-xiic: Fix the type check for xiic_wakeup
Date:   Thu, 26 May 2022 09:39:14 +0530
Message-ID: <20220526040914.4159495-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2bfd3f0-4ccb-4e01-de51-08da3ecd8447
X-MS-TrafficTypeDiagnostic: SA0PR02MB7211:EE_
X-Microsoft-Antispam-PRVS: <SA0PR02MB72116948238C9272FC21FD74AAD99@SA0PR02MB7211.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w2PnpsD2n23LLTxGYI2cp1MkaNuuj7EP1MAuoiLIXnI+VZd/3KoVsWmxFDYmKjWTXhc8gMu7GsbVvyAZQucaqP3pWhLxkvNRxdF+NUX/GndVI1ZwhNuSxGwcB2wOE/IqhmfGhwKDFOYG3xWXWefVaA3OHMIByJ1mF1ZotgpJXJvDUcMvzmZHpCAvkgvQ+p+MtmSISx2vTfrv5044CmIWaCkpvspGtsO/i/FakSkr8lCkA5mwv3TCuPgofUi3Lp+4PBi4O3myxeZK7Vpt76QRz+e7BElKBcH05URLOsiY8948Yppxpcy5FO8PoOqY+I9ArL4NROSWq3T4FHW3I8/7+v6eTE3BZL4ECuxA10wLenByUfgz0QFNRxyEqxSY3SLmRwlsZKgYVXALEF8ajHetAUyUmdrD1wrZP4MPMOIcU78v1fb/Bpm15O7gNcfhF5TB87TJSfgJRb15s4eW9Y0Rg+D1UspfwEhuzhen2F4cyV+Yme2o+co2G9+EoGpBRURDk8jtQvbZ25ULHFULgM6uAOiDmTbRnJmGtTUm+1JmYPBCx/yPf6BK5eymf2iVZnbAmBveDXu0mTm8qXsonDzxYCt692LG3qjPAls0/rhojn0yphOGArwbvE5TlGmZhXOr4g5krBAtwCDhf+yLPzzUCAGD7GMluxORUOuuxU+hlyKW+SpASq6VHWk3SUDvZQRPW+b8rV4AisHiwdC/M/FgZg==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(508600001)(6666004)(107886003)(1076003)(2616005)(47076005)(70586007)(82310400005)(4744005)(40460700003)(36756003)(9786002)(44832011)(7696005)(7636003)(186003)(336012)(2906002)(426003)(8936002)(26005)(5660300002)(316002)(83380400001)(356005)(4326008)(8676002)(54906003)(70206006)(6916009)(36860700001)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 04:09:23.3304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2bfd3f0-4ccb-4e01-de51-08da3ecd8447
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT013.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7211
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix the coverity warning
mixed_enum_type: enumerated type mixed with another type

Enum is passed to xiic_wakeup, change the function parameter
to reflect it.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---

 drivers/i2c/busses/i2c-xiic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 9a1c3f8b7048..2b6341f08d71 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -367,7 +367,7 @@ static void xiic_fill_tx_fifo(struct xiic_i2c *i2c)
 	}
 }
 
-static void xiic_wakeup(struct xiic_i2c *i2c, int code)
+static void xiic_wakeup(struct xiic_i2c *i2c, enum xilinx_i2c_state code)
 {
 	i2c->tx_msg = NULL;
 	i2c->rx_msg = NULL;
-- 
2.25.1

