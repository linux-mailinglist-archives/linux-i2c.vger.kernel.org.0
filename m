Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4BE5762EC
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Jul 2022 15:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbiGONm1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Jul 2022 09:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiGONm0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Jul 2022 09:42:26 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2061.outbound.protection.outlook.com [40.107.104.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF5F7E001;
        Fri, 15 Jul 2022 06:42:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AH3vjoqJsvcmMtqb6+Iv3OYnVjrqHJxtbJqBtAKmLeUlG+ZXKt6hstn3AWKnLUK3a+pVUhWEfU6jlggegEN9sNua/ZAQxvEI7TGE1dwricASRfQi2adrgqDvt9OCh/WIQlOxsMnx2htEcgxQUO7jY8cle9WiK1Lf2LPsC2nfQxgmeHchJIKG/37v1RoJPD1ddx6jmDiqqjgdZklWPu/UNOp+O70XFncNXQY0US55zCGmBnBeMvjFtbC0WWf0a5ytag2paoreH61hjNru41KIAX44u8NwVmVZLnHDHrtPrq3XVvhcfoKrycI3zLROtQ9xG+Sgufi8JlVpNd1UZwES0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UT2YZNebZE7imDte3csX8Nk4Y2yyjUGK22Jn3XMMi9Q=;
 b=oEFgZuGqte5+pxF2ZgwRufPyNxaHtUI4WPB6vPMKrbax6Nw+t2FfkI4U+RFGAJ5s+JYd18vKD2flqbwhoW+lGha2xzqtpr6B0URvO6cUnBYfShUNKWkPBdk1JtNUt1R2HZU7NuxBpUnsCcQy0SagvnaCH5TAkz4rdaCCsMdyTZjgwOHGvuhwUNII43MxRq8lN2OLn9DI2QrSMr7N1Y35r9fKGC3ckNfRlynX1FQsdMex2lKsaktThtMtaZmqy9VJ0f9HzE11uFbBrWOOJz0Vnf/Fz9dpRPyMVStRzWqHaLDLJIhOa+mv+7cs9Bl3iZsVikAEQkH0PzaysV7XFl0nng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=asem.it;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=asem.it;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UT2YZNebZE7imDte3csX8Nk4Y2yyjUGK22Jn3XMMi9Q=;
 b=oq6JqUTSBRc+EqEKbxhriIxcc1chJVvbqIdaTRULaZnXYx38M4T/g3UJadNxSwMquP8dV5bv6iLqWHtks3EF7RiSatg0qy4s2gN+3Z0L9AJJqCcb9Jj2m8GwXQSgyR1GjtV3CJrunupFnEXLDN0unjD2LznoudezUde4P7uvMi4=
Received: from FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::23)
 by DB6PR0102MB2776.eurprd01.prod.exchangelabs.com (2603:10a6:6:5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Fri, 15 Jul
 2022 13:42:20 +0000
Received: from VE1EUR01FT070.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:48:cafe::ea) by FR0P281CA0046.outlook.office365.com
 (2603:10a6:d10:48::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.10 via Frontend
 Transport; Fri, 15 Jul 2022 13:42:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 VE1EUR01FT070.mail.protection.outlook.com (10.152.3.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Fri, 15 Jul 2022 13:42:20 +0000
Received: from flavio-x.asem.intra ([172.16.17.64]) by asas054.asem.intra with Microsoft SMTPSVC(10.0.14393.0);
         Fri, 15 Jul 2022 15:42:19 +0200
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH v2] i2c: imx: fix typo in comment
Date:   Fri, 15 Jul 2022 15:42:18 +0200
Message-Id: <20220715134218.595269-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Jul 2022 13:42:19.0798 (UTC) FILETIME=[B4593360:01D89850]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2e896e29-46ce-4e12-2be1-08da6667d730
X-MS-TrafficTypeDiagnostic: DB6PR0102MB2776:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +hszCp+RpXu54ITTcd1MfN0SugnNKzASv6tz0jFRafSybpnexjoC191vZmivWESpkDI5xSqGPiMLAteCbPeekXTaJAtYsK+pk68c4rK1yfXc+o6pW+/A7H7d1aFjC/o+69NKFmQ1WEDN+wH1g+4fjr4IukKOLgy53WndgmZB1bJvn8riC/hQqQiMviaNE+67pj+J0eU9JJUEcFPNlDNTtNeJpk1X5hDB6wUgCsFOqFT9E3Ftds4dPByMciZ5cbQP3bNNJMpIhBli16/i4quX+QKg2830c/stCr+FeWo1bfF1YHqRyEqeKlvHdVTCzXqafmgObvpeelTYvXBuoNL6dYGuj7w3kooe0fUarRlKOGx/wHJkGuRO2YUKph/6B/ERuDnUXzaFT5ZmgOc21KgwyZ6ogwWl5sL0nASK2DqG3wK0aT/Mx0aUj+xo1zvdfuIu4gI9TnEZcLz5IDKTqofGUegn7KmNoughwRASXjGILOTbqv7g9WrZ0as77RRJ1IC0/Jx9zTy0sBpJWsXl+CVgt8Vu23SJNYZtC85qrcXS9G7TNRGHi79S1GbQZZFXMGFgDDfpYxXwUW7NKOrpihYVXRrCUDkcVEGM2mrTy6HSIC6ZtxmYmo/Oy53XuuitX/b7LsUivRhS9ypS6q5/MsunJ3nswGlsrxFAiK4P5VONFpgH8ukABNjDlI0XwLS8Tl5Fn+3uyIn/X92TRxK8bHhAtuZKbmR0urFnZFWQ2eDiWOS+8wO/irkoKFY3bRl2s0q4wX+GWWqOOHRhtPdkyk2ZwjjDzETGZ+KxFwK3BUkKzyERgM1yqUvN8HPyb+bpebmf
X-Forefront-Antispam-Report: CIP:151.1.184.193;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:asas054.asem.intra;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(136003)(396003)(39840400004)(346002)(376002)(36840700001)(46966006)(4326008)(81166007)(186003)(41300700001)(8676002)(36860700001)(4744005)(356005)(86362001)(478600001)(36756003)(82310400005)(26005)(83380400001)(316002)(110136005)(5660300002)(40480700001)(2906002)(1076003)(2616005)(70586007)(336012)(107886003)(70206006)(47076005)(8936002)(450100002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 13:42:20.3175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e896e29-46ce-4e12-2be1-08da6667d730
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2;Ip=[151.1.184.193];Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT070.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0102MB2776
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

to provid --> to provide

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
v2:
 - fix typo in subject

 drivers/i2c/busses/i2c-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index e9e2db68b9fb..78fb1a4274a6 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -66,7 +66,7 @@
 
 /* IMX I2C registers:
  * the I2C register offset is different between SoCs,
- * to provid support for all these chips, split the
+ * to provide support for all these chips, split the
  * register offset into a fixed base address and a
  * variable shift value, then the full register offset
  * will be calculated by
-- 
2.25.1

