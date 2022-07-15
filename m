Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 831585762C8
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Jul 2022 15:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbiGON23 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Jul 2022 09:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232154AbiGON22 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Jul 2022 09:28:28 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2070.outbound.protection.outlook.com [40.107.20.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ABB078DDF;
        Fri, 15 Jul 2022 06:28:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDV7S02357N4Y9xv7ibRghB/DnbPo+OyeV6LyJgQj+OrNJVMko4oi70FzxvHbiOsT3ehiqcwKMhULlph1FiYt1AM1FSJqJZN1qF8cwbAezyfKDxywWB92fXT7KT56wkslNPVg/A5OYZOQ+C4mMNMESFKMbk7ndlZtF8FH3C/RIwwAi6DWSgEFwOckFHobGtqqgizQQggwDOzy0IS2G0LGUWsjT54omH/5YsnWyLWf8fjAgCzxhoQydSHRHJuyVVmD1xcMw5QX3+av9blprtC++DXKXA+W1S4yLQlYOK6dYDhMJxqrOFbdPOB6Z4poGR8PQrtZKyl/q6sMq+d1/V2NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQnHQRE4XcKwhuLaI/t0iiaa21iKoxzvGgzXnm+iB8Y=;
 b=AT2uMxLIuUuH550G3Pc8NyPdLcFL+tREuskTrATNEZKg6SugOKUSfGJA8T5MO+0A+5U+h7L530pBQB65csWSerDYofx5AdX4Y8wW65qgOp0J6dKkegXeGxsiP0XqGY5SP1qvKH8q/ze0GJG0JUAmJbWFnqdqCo+X5N6aWSQ/Wqt2A7FaPY4Pu5IFczJaXnLPyf+KzZL1AH/rOVqtClGcmhdp7IXhX3DRVk0/CiCYVbnBPKMVAQF4Fi96riy7byIOIKiR+QEAoAPUosPFU9j2iCG8L067LPtvzfGy5T5CWxhlRSrl+EXeu1H2j6eQuFoEqv6APdVX8qjGmzf3/yPkCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=asem.it;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=asem.it;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQnHQRE4XcKwhuLaI/t0iiaa21iKoxzvGgzXnm+iB8Y=;
 b=UJ19b53VjmskKOWDLzdklnKM9EaCoUxYw7+55GWbkIQcE/hpwwrVyEmO8j6nMAUbydPjaZyLw/gVBKDpMLSLwfwXU6yL6hB/v3O9fprFimTYsADzvMsYeYXp6vYCCv3enHzgezMSPVx+iCj6tIMd9TcKLPTXFnin/5BZ5hTByMg=
Received: from DB6PR0301CA0102.eurprd03.prod.outlook.com (2603:10a6:6:30::49)
 by AM7PR01MB6994.eurprd01.prod.exchangelabs.com (2603:10a6:20b:1c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21; Fri, 15 Jul
 2022 13:28:22 +0000
Received: from DB5EUR01FT013.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::d0) by DB6PR0301CA0102.outlook.office365.com
 (2603:10a6:6:30::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19 via Frontend
 Transport; Fri, 15 Jul 2022 13:28:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 DB5EUR01FT013.mail.protection.outlook.com (10.152.4.239) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.14 via Frontend Transport; Fri, 15 Jul 2022 13:28:21 +0000
Received: from flavio-x.asem.intra ([172.16.17.64]) by asas054.asem.intra with Microsoft SMTPSVC(10.0.14393.0);
         Fri, 15 Jul 2022 15:28:21 +0200
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
Subject: [PATCH v1] 2c: imx: fix typo in comment
Date:   Fri, 15 Jul 2022 15:28:16 +0200
Message-Id: <20220715132816.592657-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Jul 2022 13:28:21.0281 (UTC) FILETIME=[C08DA910:01D8984E]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8a09c203-bff9-4d04-98ac-08da6665e36f
X-MS-TrafficTypeDiagnostic: AM7PR01MB6994:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: szfOPd7NwCr92X+gRNhgtk9s/0rbTzg/r2hUw4Kgl0kyh2VAo6d5nAZVlh3gaOOEcn7s/NGcGG7uIReZiTNErZNxlvVA2wqKSiauYeA88VeDwvDtd1ZBmmEJ/NC4MYT1DTLoj91jHNMhAh9r9deEJP+jXl6PWIl35TdEb5IHxDyvoanK8p5T3C+pRdPkzuxHWWtYwae1SUNh0DcE8cxLuEQQui0JcnA+9QubXyRgkuY+TZZJ9qO4vibVXukgj6FHfKoLLAauS13XgoA3tpbwJw/rPE4KmhUsBHlbst7i+V6V6wFpHNgaxIub0UlAnNde43FcFHEqtDZ9LqdgUxQacN7os7/7RUrltFWHXzBc94iXXVjXvlnMqcnGd27NV1QZWJirZQLbWmbLVLHqc3q7+5/TxqY90j68mhFz16APXVlr0PtVKu2wVXWS7HFpS2xgRbxCmwOJb3FPznmQ36qVfPBTR1V2dA8McH7UNgD/NfZCBKRvn+IP//Jg1+nnusogLEOcJI2Mg5b9/7bnaScOCJJ03o4qBIETb7uqJdRLD0sgkE+OQ8GS6Z/6SuuoyMVJWvNj87kZPq7BMWZiUmdM64eSuuZLz3hSgvjpo07d//Fes78C2BEgcX6otJkNsNmx7PKP8IuUucXSaOohSvmI9zz6yy64U7YkDu5y5+uzSO1iRcS61D1I0N5MX7aSp8rk6GLaQpZze9TDNZoU5NadC9RGTzCid/QP3BBvUZeUMWWL33A20lT3Ww8l1/8uuwEco6liHZQeyQDbonqs81OoT0mDmlihnn9PnCUqZig7JNrvRNfEf9K7kVCaUiJSTfFv
X-Forefront-Antispam-Report: CIP:151.1.184.193;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:asas054.asem.intra;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(136003)(346002)(376002)(396003)(39840400004)(46966006)(36840700001)(110136005)(70206006)(81166007)(47076005)(70586007)(356005)(450100002)(1076003)(316002)(41300700001)(6666004)(336012)(2616005)(107886003)(186003)(26005)(36860700001)(478600001)(36756003)(8676002)(86362001)(2906002)(4326008)(40480700001)(82310400005)(4744005)(5660300002)(8936002)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 13:28:21.8568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a09c203-bff9-4d04-98ac-08da6665e36f
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2;Ip=[151.1.184.193];Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT013.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR01MB6994
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

to provid --> to provide

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
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

