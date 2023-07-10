Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D792174CD2A
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jul 2023 08:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbjGJGgc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jul 2023 02:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231497AbjGJGgR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jul 2023 02:36:17 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2121.outbound.protection.outlook.com [40.107.117.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91BD719A5;
        Sun,  9 Jul 2023 23:35:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoKXb4jnSD46YZDyEscHSQi1wlyYh1R+Wi50tkyzF4dLrxmaqgDOy0ukmu5O6WgZLX9iGKkr4kWxPPG95oF0BtPlXzV9m/rLCRvTrjkO3b95XsbCzMc5PomLJ9hK2hA+gyQBlUtKkClVOtzq+30weq2vtzyiOBuwfqvSuJaUQUAirBkLGT3XIsiUB7gtUZQZt/1g6joRzkf29umuZVXUF+NLmPsv4jqtau3V2FNgT1vJbqNsMcIXlD2c/+8wXY2/VR6ieRUDbX3t2lkZkOf6StyLfgq9Ks75Dv/iZmLs1SnlVJ6BK5PuAD1T8WPK07ncSkHkQ9C84aEWSicnPy+Pog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEXyr7CCnTvij27+1OkJm+eQgTyZidz8WdhtGo6ZdJ8=;
 b=Li1MkXXfyZBe7jttdrWVHfKcspf+mzulPi52Is9Clxj70fjptxV2nhBEE0dHDs/v2l0MEGKJVBODeN1PLNbwQbH0cc6ka85UxjB7SbHaLmqEPwQToIFDqWk3NnyOqfFXDYMgr391+MpJ1ZEDDSx+UvonIBwRWuv8UtK3U9XAKoJ9gnZe2n20y4eC5/z5KA5q2+s8WTgB9iuLJCBHP4Rmdcr+/jp0jQE0vsSL7kfVsgQR0rb8qB7rgWqigVt3peNzVclKU8BRdMl0zKeft9NGPlu8psmEgay4nhxVmHYQ8iR8DMtYy8BzzmLeFpRtNCwvDQEUJfHa26Yjc8JRotT47g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEXyr7CCnTvij27+1OkJm+eQgTyZidz8WdhtGo6ZdJ8=;
 b=Wf4f/HCQrc3hcoaW4UE6cG4oX6mykvErsvVOas2dBIMYTq/w2BoeNBjXPh2dqkvVgocgWG8nhBYUKO+viwyyUhZLKq6qfEzHxFZXyt/KNLLJMEZOt96TCU5WjxGE82Vib1moXf1tlTGgwOs8U5jvANGV4hnzJUJOk0VZiDdqPysyy3ZtOooPFLGZ1NWvF54azbT24e3RKVg/xcaK+3GYvFHB8GqwrpEXfZZgfL/NDNUyvF65tleVPeam5p1h++Gy/yRp1tm+XprJbCR1ht1aDCYhCdSPkeps+eB6dn5WwHNf5W6uCD0IWZM1lhLbkG6by9u1nYrwU2sGWCVcjYztmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6586.apcprd06.prod.outlook.com (2603:1096:101:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 06:34:19 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 06:34:19 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Yangtao Li <frank.li@vivo.com>, linux-renesas-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/11] i2c: sh_mobile: Use devm_platform_get_and_ioremap_resource()
Date:   Mon, 10 Jul 2023 14:33:47 +0800
Message-Id: <20230710063351.17490-8-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710063351.17490-1-frank.li@vivo.com>
References: <20230710063351.17490-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6586:EE_
X-MS-Office365-Filtering-Correlation-Id: d3b6e916-187b-47cf-b256-08db810fb086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Miln90ZK7E1yzZ4TTPEU30fV5Z1rOzBGw16wnXr7wrSsELX0XSxy7bwZHkNMuE22Glw6wMCMXXROY/1emGljzouEusrg9aiuso9cnEArqeQl1bMlBRqZTgb4yKvyEsvhq6pn78/dPeNmb2YFyTr7/+N4gxo3nQKHSaF8h8A/KA/7QvMxwcrQLTYrvo164KpYRyXOKFo6pvun73S3LHHbXNYcQXH5zLSIqSjUQK3rI9pPHjeQxH8kjhJ+9Ddn6HgNLAxTfCi2QpsJPBT7C3EZDv1NM98uBNL8nRh+1Bcu3nV/evI0QOc0kly2LF/t+DaVxwqZzgOYz4p+AS98A5fhwdnSM2ZamtRHvVRTmrZWK4Y8vSf6iuoeAUuy6IiieYYRmXEP0bP347IrRbiOHpjM8FUoXM9tdbCR6uITq3CLObO7oaA2VeFdEyqHJDjQVrshGeerPqNBguANX9bcTqDjX9fnqTa/074w3n5RwjsEQxtwI5MiqJL7jRo67BnSVvghinfr1hkW7rII0mmw1AtQCg0pmOibdfUJXK39taNR3zy8YV+HCtLyFtdIn5DEurc3YhPLQYyeWafaf0lm4RpRxOeIme4gSFDoAIEqEwYiM/l3hddSGwYG5O5Wb8vNZ4HpkzNSoNKfHr+f8ULapTYEqs2KBc+VMWmNUSaVC9hy6gQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(52116002)(6486002)(478600001)(6666004)(110136005)(83380400001)(36756003)(86362001)(2616005)(2906002)(66946007)(186003)(6506007)(1076003)(26005)(6512007)(38350700002)(38100700002)(8676002)(4326008)(316002)(66556008)(66476007)(41300700001)(5660300002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rAqrp5Bdwi2IDHV+kkeD94DcChMx2uxlQL8wc+S5zKKQ1xcERVYgWAjW+Zh3?=
 =?us-ascii?Q?T4mUDtJN8879n7nBaJ68N5IVbcwu8YvY4H20V4579GELFpZIKqG/KItShgt7?=
 =?us-ascii?Q?lMPaPV4DtML0xCFo+Jf7LDyzW9ZmFllxCDqCb1AZAk+vGaa4Igxl9YWimCrC?=
 =?us-ascii?Q?CS6BESt7qNXJw+deSAkSC7Lu3ZPfcpDZTPAonbICTBP6OeKFicl1JX04TMm+?=
 =?us-ascii?Q?jP4nPdditPQ8zgPjLQRsxQBFI/eKzRgG5fKcth+coDZL2vR0zPWsDowM0Auz?=
 =?us-ascii?Q?oieKTW/D4CHejhLuDelulTipu5h7ES9BFDUxGgOFTDxS2M/2dTo+N91Ngjdx?=
 =?us-ascii?Q?wU0keD1itdmxGdxFJ67uZeTpM8zVdpbxYl50FUuTq7gon6zZrJOSdSreQ6hv?=
 =?us-ascii?Q?Le7cB/6bBH1Jg2xPS35jcQi6rPxRKfhH470jnpNWSHPCDhDll+4FmEP4H9ew?=
 =?us-ascii?Q?fi5T5bhDuQQVvc9j3pstKRX1REKRamEuas3Zghdb+2ael0V515yK3d9mfAzq?=
 =?us-ascii?Q?pt/TunWieELOnPOa6ol7j9O/5DOCjCpJDDiAsz5oZq9ucXr9LwKLm5ZeItn5?=
 =?us-ascii?Q?37NGflP3kWUuo7CsLYRK0hOSqShRE4SS+7HF/laKLRE6+PhGmjxbG9u819dW?=
 =?us-ascii?Q?9oUD1ijOUVEQj/DoJO67JJY1yQI1r+W1QgHl+N15gm7ZuFThsYlV9ssMo+HH?=
 =?us-ascii?Q?K9z+E4SnzQ3Jl7Py5lVcLSqhy1KK3vd2CbxZ7nLkI4NtBEj+sTApZb57JIMf?=
 =?us-ascii?Q?m/jfhoINYhsH8ySa4TT2H0PMG8H1h1khUY0+Nd5Bq8fpToHzoKmhDqcyg1Hy?=
 =?us-ascii?Q?2folr1Qi+mPjB/7f3xIKPRApZSFqTaDrWT93deSPBs1LHQkEDlOWVJrD8xJ8?=
 =?us-ascii?Q?XZgbjouLzIlfCeTgt6Uhn28z5E/Wy87frmmH0kv0I7cON7CU2yPmdDYjBfkj?=
 =?us-ascii?Q?9VpAYG/AH8Lvaujw0phrSZLirR8utsYYa1mFEqc4O8o+YbJiUfF72171/Pdz?=
 =?us-ascii?Q?6cihciZWibvVzD50U0CxbLqQe35oAJMqqla699b7nOKh29l3XDGQF4IriOOB?=
 =?us-ascii?Q?Un2u5zTa2am+9r1ecKXS0hLSkQPna8EXt8/8w1UJ+oLbOrsfLE3YZMaDKen9?=
 =?us-ascii?Q?6+au0/sBlf3pQQvJWObs3ZnHWke8PRccL/Ugaa6xc6D6d23vAyAkdSyccoBV?=
 =?us-ascii?Q?Wv40cSOxoFMTYvEtEOYJXNsYCybGb70cxw3LI4Fh/UHd/kMbqSGZPwonBAZe?=
 =?us-ascii?Q?/HxemCxo7hro8F6NJ5WRvvnzceWmoXGb4MhEkDtUsEu9Kq82BPysbtkJTFpe?=
 =?us-ascii?Q?JocX5qUdO48lfq25sRXxfF8i0saUdjvx8aSubtuyUjT9uIvUjxHSi7SzA0UR?=
 =?us-ascii?Q?dtdbZszjn7QvjnOIfTtJT80ULYsYvz5BKzGtlOCYq+eb3PrU4++3CMMoCCuP?=
 =?us-ascii?Q?KiQigq8e0lCP9szvTGYjTOyVD3fyd6OCCDW0w+ElQlFgPSaM444VUJmcg127?=
 =?us-ascii?Q?Nw8NVHmvqCKfMN2CItFfRAI+SHEzLqByeGLsGk5vwcMDtRyrmAkAS9sQPt8P?=
 =?us-ascii?Q?e5fLf0wf0tra7KP6zO4n3nILRA9En3khg2kBLoYk?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b6e916-187b-47cf-b256-08db810fb086
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 06:34:19.0755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sQQ9iHIdsMAri/UivAQTCJ3YrJpMz8cLpYBAJGAI2NkP3URMD710iwzbB+fBfwfFr0yBhWnR3/MMfIZ3n/+OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6586
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
-s/devm_platform_get_and_ioremap_resource(pdev/devm_platform_get_and_ioremap_resource(dev
 drivers/i2c/busses/i2c-sh_mobile.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 21717b943a9e..163fc118873f 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -871,7 +871,6 @@ static int sh_mobile_i2c_probe(struct platform_device *dev)
 {
 	struct sh_mobile_i2c_data *pd;
 	struct i2c_adapter *adap;
-	struct resource *res;
 	const struct sh_mobile_dt_config *config;
 	int ret;
 	u32 bus_speed;
@@ -893,10 +892,7 @@ static int sh_mobile_i2c_probe(struct platform_device *dev)
 	pd->dev = &dev->dev;
 	platform_set_drvdata(dev, pd);
 
-	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
-
-	pd->res = res;
-	pd->reg = devm_ioremap_resource(&dev->dev, res);
+	pd->reg = devm_platform_get_and_ioremap_resource(dev, 0, &pd->res);
 	if (IS_ERR(pd->reg))
 		return PTR_ERR(pd->reg);
 
@@ -905,7 +901,7 @@ static int sh_mobile_i2c_probe(struct platform_device *dev)
 	pd->clks_per_count = 1;
 
 	/* Newer variants come with two new bits in ICIC */
-	if (resource_size(res) > 0x17)
+	if (resource_size(pd->res) > 0x17)
 		pd->flags |= IIC_FLAG_HAS_ICIC67;
 
 	pm_runtime_enable(&dev->dev);
-- 
2.39.0

