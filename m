Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB865450FE
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jun 2022 17:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240557AbiFIPh5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jun 2022 11:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344546AbiFIPhy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jun 2022 11:37:54 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF09157E9A
        for <linux-i2c@vger.kernel.org>; Thu,  9 Jun 2022 08:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bk3Qxoh6OEx5XzQ1amh+L1gZKxKy0pXUrM+V0x0Bx0R+CHQrRo/GSTSGVwvSmy06JSCj7KZdlyvbsNNH4fOCpXb6Zgv4XVh9hsTnq80mixb5LLtR+IZfCev3E2O7Hc7R+1AZe8V/8NxB50tTuM2ijkSRC5vnyyGfHbxo8cEt9GwxZsuiyoxkEwVhWM7FysbASYeocmBaa+NLhlaqgh1UuekMz4wkF59K0VQ/ABWMpbDjv8YAxmgxsHUaWw4xYThkGKA0ALaekc1ze8uKkgGB8ZRObNnjsZfOsarGzI3GWuQN1HqZ6rGl5anOAm+/9u+y0vkR2T5/JWn5suZKKo6vlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzkFlo7f84xmbj0tYfoMhpNlR1xWPNnWb6orYg0qG1w=;
 b=EN3BgEERnCjtQ985kBwTAT9ocd66NfXCPDbKoqo800yUH0BUOH4rdQ+AN78XDJS+ls3IXv0PvDu9+iJ54aES8VdENrfP/3tJJ4WDpL7WmbRP8SUUWRwJWS696rurHWT+6GHKekYxGsPIKkocxKmfz5DFbzn21Jk0+PHbegf3PHBZjmPhgTc69qon2gKES7vCR1davN2kaqfv6ozslBFsgyApkJ2Ir+RqFlgFGPoaB5k7dR/nMfKPHHWss3ARMuIq1Ex0s7q+hjLuZ/VFGbJeXImAfT9+X50RD9taEOwQ/EjXIZ2Dml9E61Jyji8X6RzRns21g4S+QxAo51m83E04Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzkFlo7f84xmbj0tYfoMhpNlR1xWPNnWb6orYg0qG1w=;
 b=ciWwQwUbEsZ1zTUWZFVSqmdUXGRHN7m7JBbwznnlNX0Yt0GgsxfjILGxS9sTJxWo5mqIZm1czHSlI4MZeeybHWBTrnVs6Z2Idz6Xf7sBUGhJjRHrU+fKOKRs/1dg53fTBV6+evNJ+CBP4E4jJ73vCF1dZTZzl11lhBHZUJg++Xg=
Received: from BN9PR03CA0795.namprd03.prod.outlook.com (2603:10b6:408:13f::20)
 by SN6PR02MB5600.namprd02.prod.outlook.com (2603:10b6:805:eb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 15:37:49 +0000
Received: from BN1NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::e0) by BN9PR03CA0795.outlook.office365.com
 (2603:10b6:408:13f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13 via Frontend
 Transport; Thu, 9 Jun 2022 15:37:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT057.mail.protection.outlook.com (10.13.2.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Thu, 9 Jun 2022 15:37:48 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 9 Jun 2022 08:37:43 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 9 Jun 2022 08:37:43 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org
Received: from [10.140.6.59] (port=37774 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1nzKEA-0001md-O2; Thu, 09 Jun 2022 08:37:43 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v2] i2c-xiic: Fix the type check for xiic_wakeup
Date:   Thu, 9 Jun 2022 21:07:38 +0530
Message-ID: <20220609153738.6557-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba3379b9-f1e3-4b1b-887b-08da4a2e0224
X-MS-TrafficTypeDiagnostic: SN6PR02MB5600:EE_
X-Microsoft-Antispam-PRVS: <SN6PR02MB5600E6347BE1C9458785AAFDAAA79@SN6PR02MB5600.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yEKeswPwga69AgQVPxysF93YB2UPvy2L/KebRqg2UtOb1+3yJ4JCE3ykBZy1vPIlx1bHkNvDO3GBK+aEgLeNvTDXcI2ssKiy7qgezTxeAdUVftmzC4TZZIszGVyGSa4GFeHQWKI9nWni1Fh/Vfo0etADf4vlyeKoRY38o0LSkUl9HwaOz72TvELOx5zzaUBcp4L0e1x0jw89ZKmwn3ZCxhgjUOakkaHV1pBlwnO/ikeVYm25V2QKiY9OCEB/qlHEGJVxnu3Hvu8wT/bTjQRsfqkC9tc9VnAtoeUC7wCiD/l3zTLbm21Rr9alxlVRki/emr+QYshnOoDbPXHQKXqFFNRC+7pjQ0vzyNqypffE5meO8q1vS5R84Eiz+CT2zK7OpeK0pRc06fIvwD3WDDLM2DLq9dGHfe33vbj+ogeUO0E+aiqu3eGsRUrvXqDcfeI0cOUAqOFDmYLSnGyRozfr9w4KN2U83anVCaxmkp7PnUg6zrEVojcYJ9i3l9izYfkNofYGZ7ef8yl8nr+iy5vAeiGVB60W44LeEk+AMvqQLh0N6eH+j2v+H0OsBZ23DLRr3w14WUEIsqeHH5gAAa060ykUibJ3ypoOP5cfpsHDYxsyktm3QD2qd5LnZ2Fx6v53sPGLPLgHGxrO3coEHJ3RER7QJbfWbpkwnm0VnwWrufm7y5igrSDu0HFTmdgNswGJZ7zCC5mO2B+1o5IW2HKmgg==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2616005)(7696005)(508600001)(6666004)(26005)(36860700001)(426003)(47076005)(336012)(186003)(1076003)(107886003)(2906002)(83380400001)(70206006)(9786002)(44832011)(5660300002)(36756003)(7636003)(82310400005)(54906003)(40460700003)(6916009)(316002)(4326008)(8676002)(8936002)(70586007)(356005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 15:37:48.9840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba3379b9-f1e3-4b1b-887b-08da4a2e0224
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5600
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

We are passing an enum in the xiic_wakeup lets change
the function parameters to reflect that.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v2:
Update the wakeup_code to enum

 drivers/i2c/busses/i2c-xiic.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 9a1c3f8b7048..ec56b80653d3 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -34,9 +34,9 @@
 #define DRIVER_NAME "xiic-i2c"
 
 enum xilinx_i2c_state {
-	STATE_DONE,
-	STATE_ERROR,
-	STATE_START
+	STATE_DONE = 0,
+	STATE_ERROR = 1,
+	STATE_START = 2
 };
 
 enum xiic_endian {
@@ -367,7 +367,7 @@ static void xiic_fill_tx_fifo(struct xiic_i2c *i2c)
 	}
 }
 
-static void xiic_wakeup(struct xiic_i2c *i2c, int code)
+static void xiic_wakeup(struct xiic_i2c *i2c, enum xilinx_i2c_state code)
 {
 	i2c->tx_msg = NULL;
 	i2c->rx_msg = NULL;
@@ -383,7 +383,7 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 	u32 clr = 0;
 	int xfer_more = 0;
 	int wakeup_req = 0;
-	int wakeup_code = 0;
+	enum xilinx_i2c_state wakeup_code = STATE_DONE;
 	int ret;
 
 	/* Get the interrupt Status from the IPIF. There is no clearing of
-- 
2.17.1

