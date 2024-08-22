Return-Path: <linux-i2c+bounces-5642-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3BE95AB9A
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 05:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C75B51F24D20
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 03:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DAFE3611B;
	Thu, 22 Aug 2024 02:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="FksC+jML"
X-Original-To: linux-i2c@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010040.outbound.protection.outlook.com [52.101.128.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A341CF9A;
	Thu, 22 Aug 2024 02:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724295239; cv=fail; b=XqUVlqQd/37IhG4wj2FWlwse42ZKyrMUG4sHFXXc82HWBM6gGlnbegMT2cy8kTrOtmqmOq/8kkVxJlUZazNEq20Mkl7rp4YAZP2Qc8dZajRxQiU2b+D3LbBxB7ddndKL1/KVx92AJLzsNZ2HhntFfKgLasTgQGPG2yB/3g8/x8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724295239; c=relaxed/simple;
	bh=eukMocBaSIj04YTmeXwq8lRSfiOCc8qfJMNZuwFrtyE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VZhb61VffRKhzVk9qWYGvt2HJKoI9VNMebUfG7joFaXI74uflO9kq+QCwN2rxftiSNuFE82XiV5HfaBaD5K6Gu/11ZofcvIsHuQLjVtHjxMsNnBmPqcycpJ8aLEU1Kfi1hBdDVewUrMuDkFFiDjWhyHNBCkzGYj4gLLVB9HS5n8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=FksC+jML; arc=fail smtp.client-ip=52.101.128.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKkQ4kpq/g8ssrVjINonp/V5Cw7WGUkE6+xfRK6rtgTIkbNFBpDEdBYluCL6f2eJiNr83Zt1tcf0DdXVUdI6A+iR728NpSMKx692ENkHNuAzVKuI5mg6JhMUMiQ+jKY5NihaAVoUqF5fxUPsTyolwxRLvL+gBwyjF9Lpsq+BjLyDXqzbI0W4y+Ut3GzC88u4PnlnCCO/Lr/jVtGt4aoswltzb2Bc6P7ic68334Ya8Mf+DU25QnsZ3dfLpdvJXNF2sKlEqL5HAjm4Q2lsV753Z7yWeLnJ8nn8ussd7rDSCjMrWdU4yZhatiYzLQuC1ptTxw+lEHP7o4Go4ryQGK4Y1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOrDO9UbLr3Jvx96zifJRWw8lfqqYFrFS2p+2C0sGoE=;
 b=l5TkxGz3e6XCBPHqwPOMKj7Szyva25gqEZd3IR2N5BCCsQW5tIiZEp9clDXlFGJOZmPUMK37rhpyP5x5oqyJHAftg2PUnT1Bn0vK+ctuSNjdh6bqC+yl3NmR7GoxSM0ja0bu9gS/oZElCEN8nTgA35uQX25xepTAwNPrumrwweHhaX9IOucHy9OTKq0UqSpSjn8sdtW7LzV9TRmG1DrU31wXasT94n0qi+CQhLOFr0wsPGQ9I+gj4PbHnef18dK0PCJKjdMSZBqpKY91rEMD2vP91B7t748ptkFiCdP7aD4lPcs+Jwhs8LWOWM6tD+Og33bqn9HdYfQaUuDixje98A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOrDO9UbLr3Jvx96zifJRWw8lfqqYFrFS2p+2C0sGoE=;
 b=FksC+jMLUMZtWMPGHeGRjVhgeS36pttq+yr8KhSOfKKteBxoUUlIkatE6xBfHanRFL1vWkCmnl8VSJ9lLHhJFTmqhk8rtkc35/gp8Q2lqUIWfZRTtI75XpMyxtEPKud3CQvBsEjMLXJeke0J4lgOkrar8TnSMELqA4HWIvhJ0J1iOLRdpjjF3b2+MApo225WfVavr0i/w8pbCyipHUnOITqP/0FowXQrBablos7wUbnOHK8dLzAFeI0qWQoEs2Mp0HVput1SVhSUFn2HXN8WmpMSLEQD48SSsXfNGL2vHRCk4EyUmF/5GWeLgkHD8iQtSxetLoHp3cIJWC4mMEg8aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB6485.apcprd06.prod.outlook.com (2603:1096:101:17e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 02:53:54 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 02:53:54 +0000
From: Rong Qianfeng <rongqianfeng@vivo.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Rong Qianfeng <rongqianfeng@vivo.com>
Subject: [PATCH 1/2] i2c: emev2: Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 10:52:57 +0800
Message-Id: <20240822025258.53263-2-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240822025258.53263-1-rongqianfeng@vivo.com>
References: <20240822025258.53263-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0280.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::8) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEZPR06MB6485:EE_
X-MS-Office365-Filtering-Correlation-Id: b757c25b-8002-461e-7ba5-08dcc25596f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IM3l0xXHuQ6Ic+sGg7GwuaMfzXLLsC5YMq44Z7l7I5r8OrbZBoKdUM+2Md77?=
 =?us-ascii?Q?wuzf44FqioT1LGfZ9aI13u0Iky6k6Ryq5b3nY8X/Kn/0ect8dqPPW5hy/DI2?=
 =?us-ascii?Q?msrA9F5mTqkoZe4S7tiIWDPTEtHa7ZNNBBimCjAkshSS1mC41tSl+WDyFR2M?=
 =?us-ascii?Q?5+E4tBdqcZScQ1vx2xXuxrD6WwGBuQrv5tkFpB3ujIfCUuULbGHrKP7kcKOw?=
 =?us-ascii?Q?z9cCfB8o+3HqpnhyrP0y8l1WBkWwCLgzLk0P/MMlT8xhL4yfoZ+Z4pLRTJLo?=
 =?us-ascii?Q?sQAJGOLniCyZyJDe2EknOvYX6AKUq23ab9pcZdXMneB9QTLsLJWTUsi1arDp?=
 =?us-ascii?Q?xqxYUu2qpZ8slBK6N65V/MWzYSNHjLm1g0KX3gn9ZcTwQErYxA3/QzUv/+tt?=
 =?us-ascii?Q?ArI+Sm4x9oU3aoyhXHnfjYTOqspe/tgkSQNWnBgspfBtfenmxuTqeDp7FBw5?=
 =?us-ascii?Q?3JW88QXFmCfaIQ6qqjlACZIykXqUVpYvNpL4/JIesXhsQ6aakRryieRakKWm?=
 =?us-ascii?Q?zJqrB+DNPJ5Qp80PRf0UT9NqRBLd39Khe7Uaxa3CHgSxqar4sEpQdkQbpNL7?=
 =?us-ascii?Q?N1crRXHmF9tsGFOQNZ6cQHI7dzOWM8jIt4R61G0V3W8M0GoSs+hIiw6583yc?=
 =?us-ascii?Q?IRrAkLYtvaXrBLM0HjGeMueLE5YBkecpJGWXjQbrDF/qR5tnr9R8M7BcJw9U?=
 =?us-ascii?Q?+9S7JvDzju1TPL/CezfEd8uN5VL05d21E3N1YccoQiBCThtYPhOkAvArcSUQ?=
 =?us-ascii?Q?4c5Isjp0GQH5hUStKej295SD4RZ+9I417XCxA5l9wQemcnH3D137KHFlmW4B?=
 =?us-ascii?Q?Vyyy2Kpnx3rxsRP38xY8RJPk9W7J8GwzxY4RoiJQpr025PIctesWe50Wov8Q?=
 =?us-ascii?Q?fdVe4hmdvEDnPrrlBb0PE0Rhx6/Mi2OFRupgK1DymoSerHe9cmdwlSaSvMTb?=
 =?us-ascii?Q?m8CJm2GiuMmzTNoneUPjtGk6+isx51ErQ/we0bmNuE4Q85Ygr5vcjW0cXAha?=
 =?us-ascii?Q?m0c0NQzQtaMiYoKNhTRVgEkrhZHnEYYpK+xIeU36k+KXAvUi3vF1bLgi8AVj?=
 =?us-ascii?Q?VGOM54gHyQRJuoEx6sjPFsXm+ZwfWv9uSlkBCzVTmiX1tAlGdZBbwe4eNNqn?=
 =?us-ascii?Q?wsT/jA/raGFvAhZLkMcYuWV5N7o7Jld0ND+MRLGhcu7RPpeuvrOnTQXEv5tx?=
 =?us-ascii?Q?YFrM5a1/EHd/4SU5i6TdFW2lre3x9mltFXDv2jF6W09ogqiic4K/K64LVwIJ?=
 =?us-ascii?Q?uWuJ97smfxRJZArkKlqfpxofKiNdiRkbaeeFvvB2PLdQO25kyt2enlLgsiQq?=
 =?us-ascii?Q?skVHc66IFkoprKI2xYlqQo0xrmvSux6LE/pHY4qvWqmIIxCR+g/Gb+PrUmc8?=
 =?us-ascii?Q?zbohEzE6Hn9oVL4dFxaYBK7qZtzCUZ9kzzo1HnDr4sdiw0uoog=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EetOEPUuJ+Odg9/wjT9Qh/u7Nz2KG39AF2k7LDFav/0oXorBBfZMkAgEm3F+?=
 =?us-ascii?Q?0sn3uRH8oh2gidPAZtIoRBfqPCCxL9SWKuMZcybD+6NSP/1wPePAWgkdFnAW?=
 =?us-ascii?Q?8xxqF+P/8xq9HAS7IpDZKTdea7QmSK+0md09o8PhS6EVQs9z0/90odWWhhQw?=
 =?us-ascii?Q?6steEo3lu7NZaSE0D3bfVUAQSc47f460Vv8MwziATYZTLBb9KJKj9SkZqLdN?=
 =?us-ascii?Q?InhYoCI37y+lAUztaxX6wEAIFGgSZkeSUipU2LO8NNvSmg+nZmXcE2TRRMkX?=
 =?us-ascii?Q?0zWci8jnsOYCtNdH9EsUaXzoHwLK4Mtppvdt9DYu0BDv9DOoOOIxWzfz13z4?=
 =?us-ascii?Q?8IQPJOPOyHFpkjNa7fwrHkpouFoIoKcKbKxmV54XkNWKlOKzb4N09276lyii?=
 =?us-ascii?Q?OkoColiTj+kxQexo/MvwyKJX7LKp1zbmXdAgT6+AIGEZISyYaVGFJ/yvQirN?=
 =?us-ascii?Q?tT5up/noFP/BI8dlay+ycxDnb5UOFoSBS2HqSlRTZzdjb/xlnLJwfX3DtJJO?=
 =?us-ascii?Q?4vC+bA3iEEwKETb7eFHHFiqu08PqMjJCINQqHB2xRJmyH/ij6QY0LufNPYM1?=
 =?us-ascii?Q?J7wMsfYY8hD26x8TLRpKqiGecWkj1UANOJMZixHkIBWUR/WIAYbe5ONdRgZM?=
 =?us-ascii?Q?fCFwgc1IeRkr8iSdEQRRHsdIWrfLR9j4RY6bshJMz0eSqcTLZ6Wf7KLWlTuz?=
 =?us-ascii?Q?An+rVsYJyCdghRXlf865kIfB9s/hPypg5XqXztfLbRfz373/OA03+q+AT1D/?=
 =?us-ascii?Q?A4ewSh1JaoTijpp0dWvBDIGV2dLmVPP3zuYAcOPoUBJqZmtUCvPOVPm0Z8xS?=
 =?us-ascii?Q?CabNUadgIKaoVGupCaKRu5DVvVuXxM63KHax1XtVvwVxsqUrKfTMvNTI1O+L?=
 =?us-ascii?Q?eyTBBV77ZXsnnojr71Z/CVgrxRhrbTzn280oR0P6/OjE0Q+jjbaRtWpfWN2k?=
 =?us-ascii?Q?eciDSRVz04wEXeMIXmFkkqLwYzmNCG+IIHK5MaHY1wuL2tg6+qwHNkbfMqoa?=
 =?us-ascii?Q?68JSAsRLpbWQISFLmDUPULKQTNm5h6AkmBlbwi8+kutTDxXZBG3KO5uEDwVM?=
 =?us-ascii?Q?NcF9JJIbYrAHZLYbgRTJY2/pSkqDwCn7HxBZdTfTUT/9samzwD3tfceOvIe6?=
 =?us-ascii?Q?Nkg2HJNig3ny91PdTtl8TUDJl/pj5B/4LO6WTQ6/agE8wXiPh7otugZl4P/b?=
 =?us-ascii?Q?5xqbH/15noxaoH8rHitHW5Oppc+xkLCS6mjeNq5yE9W9LjwyFAGeyMX76Ccd?=
 =?us-ascii?Q?qHr4/TeuFu92fNULyAsPIyt3WwBMAHzUcRJYqbkpbBQYMHb8GKCN71fbHL4K?=
 =?us-ascii?Q?nrqYUx80/N64BWcJZUT1D0Bl/hPWBWnXBFxNjtUPNXqHhswJA5A5VrlDNFiX?=
 =?us-ascii?Q?60HzFhcXtD1GNO7fMP2e8MzprLL4aNNaS+HQDDkcLeARGfF95YJxX6VT9Glp?=
 =?us-ascii?Q?EAWMxYVxSGIP0IBoU0NDwvUXrCZacmTxdigtRQYM/bfBEo9wxYp4Ehz+KHir?=
 =?us-ascii?Q?HPm07A1lVd+avvjfg10XyEgM2cCD4cPlRPhMLpGOeYTfjsIx9hxtncqTKD+Z?=
 =?us-ascii?Q?u8T9NB1WBydaPntUcqoWtPydqTcGNAGu5awK60Ec?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b757c25b-8002-461e-7ba5-08dcc25596f1
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 02:53:54.2559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zI2r/GBvV0dmxZC8r0pC0Y/FaIK6sfq7j2McpqnHs7lnEqRclowG3rUQw7okKH/0fVuctxc/OJplKkM6BqrMvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6485

The devm_clk_get_enabled() helpers:=0D
    - call devm_clk_get()=0D
    - call clk_prepare_enable() and register what is needed in order to=0D
     call clk_disable_unprepare() when needed, as a managed resource.=0D
=0D
This simplifies the code and avoids the calls to clk_disable_unprepare().=0D
=0D
While at it, remove the goto label "err_clk:", and use its return value =0D
to return the error code.

Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
---
 drivers/i2c/busses/i2c-emev2.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-emev2.c b/drivers/i2c/busses/i2c-emev2.c
index 557409410445..20efe0b0cb85 100644
--- a/drivers/i2c/busses/i2c-emev2.c
+++ b/drivers/i2c/busses/i2c-emev2.c
@@ -373,14 +373,10 @@ static int em_i2c_probe(struct platform_device *pdev)
=20
 	strscpy(priv->adap.name, "EMEV2 I2C", sizeof(priv->adap.name));
=20
-	priv->sclk =3D devm_clk_get(&pdev->dev, "sclk");
+	priv->sclk =3D devm_clk_get_enabled(&pdev->dev, "sclk");
 	if (IS_ERR(priv->sclk))
 		return PTR_ERR(priv->sclk);
=20
-	ret =3D clk_prepare_enable(priv->sclk);
-	if (ret)
-		return ret;
-
 	priv->adap.timeout =3D msecs_to_jiffies(100);
 	priv->adap.retries =3D 5;
 	priv->adap.dev.parent =3D &pdev->dev;
@@ -397,26 +393,22 @@ static int em_i2c_probe(struct platform_device *pdev)
=20
 	ret =3D platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto err_clk;
+		return ret;
 	priv->irq =3D ret;
 	ret =3D devm_request_irq(&pdev->dev, priv->irq, em_i2c_irq_handler, 0,
 				"em_i2c", priv);
 	if (ret)
-		goto err_clk;
+		return ret;
=20
 	ret =3D i2c_add_adapter(&priv->adap);
=20
 	if (ret)
-		goto err_clk;
+		return ret;
=20
 	dev_info(&pdev->dev, "Added i2c controller %d, irq %d\n", priv->adap.nr,
 		 priv->irq);
=20
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(priv->sclk);
-	return ret;
 }
=20
 static void em_i2c_remove(struct platform_device *dev)
@@ -424,7 +416,6 @@ static void em_i2c_remove(struct platform_device *dev)
 	struct em_i2c_device *priv =3D platform_get_drvdata(dev);
=20
 	i2c_del_adapter(&priv->adap);
-	clk_disable_unprepare(priv->sclk);
 }
=20
 static const struct of_device_id em_i2c_ids[] =3D {
--=20
2.39.0


