Return-Path: <linux-i2c+bounces-8718-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 536739FC8DF
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 07:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B62B218831B5
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 06:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09FBE155C9E;
	Thu, 26 Dec 2024 06:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cjRHAvQz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2070.outbound.protection.outlook.com [40.107.249.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4735A2837A;
	Thu, 26 Dec 2024 06:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735193676; cv=fail; b=XPLli1zIixFtj7WNwoIYmM3x17GwPLo3vRbxjk+sm+GnYZun96w5MA+KThuB0N3z0jS/2GGskROs6pg/5T6sY4jNQGCo8eI/YsThAPoW3q0BNeV4lswTNPb0S47FLX2n5S5zPT6zxnbJgk19bSkoI5BdZLrAq5T9QnGdkd+HVvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735193676; c=relaxed/simple;
	bh=RF0QHB47ofk4iHZ+VU5aHspsdqz9sspLMqg+INzzYSs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=W1AWtH7hghd9Lkz0/qaq9LlsROBOZTOJBchd27hXHOngAE6HKkePnKZMqHYTpOS6AD/rYD53NW/qssMNIduBtelHl3CI68FV5Oopn0vE5vksQZrZdDbd+NluFxzZWYQALH8D2eeZFTG0aFY5jUa3keuKtE081Tvor7GGLJ69TcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cjRHAvQz; arc=fail smtp.client-ip=40.107.249.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wT6BLRMfgVxC5AwZyf8cd1jJ5Cx9Jh1QLWOBRmsvFWOmFi/susL7D839tKgcjK5NEid4JbruxLHbw6W5KPHEkk5UDllyUktj+Q+7p/Je+hgshpAL3SG0gKfU5uIe1dfLgD3mZ6CjprJMfyjQv38t2UGGB0BmPrIIS3mwvKJFNeSJSmOwhUvr4uzX1yLu6857mGIwogVzLCIm12NRkjet5qChqOPh4ZeyILMGcAtaqCgguYOpI1CuswZCAp18FQSoWPeUFlkEOuXYxgOxbvYz7bGczOor5zL8cwegfSOzBOyCTAnQT7xANqk+sPhRlqlS8cFfgvvMQfh1FJ1x47aNHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EysI5icpJCamrUzklDSTcaAAt7p8sc65VdhLuFr3kV4=;
 b=kGRtDec6Jahx6tFSKU0EnY5O2ryKJRb2Qzc8pbrAHyRmEK806ANE3rhedOiT0TBnYadmkgo4Ay/4lF4G7kdmlIS2gZQbaRO9mpNx215DFrRJr7fT17BwBkioRWBy9HchcXx5+JUhiYiwyao9C6K9IPzOMs0OvUaSVMU0uiO0zBF17lFcG97V1oxMmEy26twf6jkOVLZ+c4IoIWaxl2Gon/GZQz7G/gXV2AaPBVYVyqBG0Fb4bgyrb06Qfr7kTH3hfAE2mIX6SN6Sl5wZRO0KEeGsI3uvpmMvY4PKSEWPJadU3eQ5siAZSKCHeMOiNUFpKrG+GFzrhRvWKnHqIWsZSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EysI5icpJCamrUzklDSTcaAAt7p8sc65VdhLuFr3kV4=;
 b=cjRHAvQz5yE6k0eAK7Nttjg2NgCddyEzfe6IQN75FQ0YFPv3V9XgzABJ7AR/zoLREP9CaP5lKQTYKz9KsMpGIFZ793nVQTFiMVeAkmg6HDrsLumTew1NkBeTNrvRDm3O6FKQN8pVgJf2plJ4rXXfydmOV274Udr/szexZknhfhurVuATQnuKLk/7wBouHfcBqmwrn7AKvh2kr8Z5nHoQeZtC0+BmZrPYETg9I7elu97fQZ8J8gx8w3AtXd+i+K1SZyBhbkn+7DqPWVcErZaZpniFbE+0mlaJwmYRUXWct8LAv2NY19XoZ78TzJ773vnifst4y0p+lyNXvVdOSSn6Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by AM8PR04MB7971.eurprd04.prod.outlook.com (2603:10a6:20b:234::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Thu, 26 Dec
 2024 06:14:27 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%5]) with mapi id 15.20.8272.013; Thu, 26 Dec 2024
 06:14:25 +0000
From: Carlos Song <carlos.song@nxp.com>
To: andi.shyti@kernel.org,
	frank.li@nxp.com,
	o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Carlos Song <carlos.song@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v7] i2c: imx: support DMA defer probing
Date: Thu, 26 Dec 2024 14:25:21 +0800
Message-Id: <20241226062521.1004809-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::6) To AM0PR0402MB3937.eurprd04.prod.outlook.com
 (2603:10a6:208:5::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|AM8PR04MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: aef94913-295d-4467-0c9b-08dd25748c40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hDk5SY9dzAjV3/8+3Wg6M6mE0uhf+OkBItQKUTKdVhibdl5QsYTGamV995yb?=
 =?us-ascii?Q?sLhEu30XHRBXkdTJqIKmB4wMnPov2KwgxvwsXUuGm81jexNVqTr5aN8Kyhp5?=
 =?us-ascii?Q?78YCcSe15VEG1wEMrGefPChLiRSE6Ay04fZ/pLndiSGGkWupqYuOFozPcGIS?=
 =?us-ascii?Q?Q3OycGGvBbPgvbCJadPOydFxdfFV5h+P9Dku0IjcxImVfr3vS/TbJtGxa8GU?=
 =?us-ascii?Q?jACRp7+fIT08KaCymBCTwpSgrslmNsRI33+5iNXUCxkI5ZUlBFaUteAGOjcG?=
 =?us-ascii?Q?xZbeGZ3qR+yZn9u1LBbSDsaUhJtsI2QlOSB4O8GtjNIiGHlZJjH+LvQTo6sh?=
 =?us-ascii?Q?I+x4IOtL+k/6bGotcCeoXogQj3WumlQEFadtCukwMp+WoZOLfIwL4ZG7r8z+?=
 =?us-ascii?Q?IjyGHWJ9Fa6Dxn+ryzrWjl6mta9eYTHMPRTuzwx3YlEq5fU0Ov2+DMEaJTT7?=
 =?us-ascii?Q?VmH3xbOer2/BWg3/S/j7KGLlBNsXOMqM8+xEiI2Lygt7h6miyhy0wSVt2dJW?=
 =?us-ascii?Q?ZWnNgNPn4w1wVaaObhBaVW9BvKXEI+fraZ3pl6lPSOaeFPEfST0qdq0C3GiJ?=
 =?us-ascii?Q?EOhhKq6z5XmRH/idUixVe15Tdt6PCyg9LBg6d8nf7WlS25Iqt+eI58aFTIKW?=
 =?us-ascii?Q?OSPLVtsdKO5Jpwyvf8eRi4x4tfo/jDc2FXBciUNblCCS2lW9pt4YWs12dYz1?=
 =?us-ascii?Q?rWe31/0s+LEgHKFUbgl/5NSxGGgxIKxO5zwlLIJMAMraD/jIWlyTyb64V+0J?=
 =?us-ascii?Q?sH5nuM8t9oP3/ajwgeYc0IQ5MfILsL+E2Oj+G0ynL/ceAdy016bgteUynW00?=
 =?us-ascii?Q?gLx7v+Rb4xWedUxmgcoS4rQ8F1lAzgY8T2thweE67atLc4Kdkm1G1DyF/ohA?=
 =?us-ascii?Q?s0DrNMC8vpLfSTE9t2qsrZVEceJlv7cSpmbU4gbASXYy5DfGjhEUyGlFZxEr?=
 =?us-ascii?Q?J1xQtfBop/6VwvSnB8+tivjN0r01rY8rSYa8lDUobqv17EaJkyXPKEiu8vwo?=
 =?us-ascii?Q?J5m++rQOzbacL3Ctym3gSSbtMqEOJ2mSw72wHmqBNz7xT/8Dn0FnwDS51buA?=
 =?us-ascii?Q?4DyKEhUo3+98xesRf0r0zTJmMiFX3QmwCqCtiDjl322/Xsx47n0jdVZ/KFL4?=
 =?us-ascii?Q?z7nzrzP5cBG3nUl8c2LpZgD/oeKgSQlh6+923DE5xcWuUvJUDs4zx1X1PweY?=
 =?us-ascii?Q?3zorv13vkd+lXC8wzVcdOu+KE0V8pyx3GZpba8FZNVFu/YoNV2FGwRyfadow?=
 =?us-ascii?Q?O5gb8TAKHopkvWGblNyXcae32u9L+ESpWz9IsJGW2HH6VVU89oOK+YNvBHSR?=
 =?us-ascii?Q?voIdhuAinJGkgZjk0FuSbvj5r/qWn/4gVWTqV9WAiwVTehnCadH5/qVMQ9Ca?=
 =?us-ascii?Q?YULDZqaHn4VoESPpPqlwDA9UjNmGXnXgzHMhBSfpelRKzuZJtIe1EP3wsUn4?=
 =?us-ascii?Q?7pR0PqN9jnCbXwYg6nYhP7eqcasjAEXX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3pSRwQ5JFNXuCs4HYqLYrg6k84w6w68lt5YYpC9ISeOqOTjGHiKJL/zlTpEM?=
 =?us-ascii?Q?r6EXy7f/W7x65Lp94BsgJZWxhsNKy0OeNmWkb7MWPIss/ljdJzvurHaoMETC?=
 =?us-ascii?Q?rAU4R9WDIhjz/9DFDbw/xlWprcQOpC+N/JR/3nv5paG7NwBHHdkTLvyJoJ2t?=
 =?us-ascii?Q?+Yr3MMjB96pXh8lrH07ynYZhS7j8ZhcVTuggAHY43S5i4JWuSkUCJS3T8VgM?=
 =?us-ascii?Q?IoeEzCfDF7Z50Xd2D0PP4FUJp4gFcncf/o032nPeuFr+KDGTLnBIP4V7pzWr?=
 =?us-ascii?Q?RAZiJZqN8OAVLeABNvFnVqj41ExwgLY2X7kmUETuSsorPr/HZa3vqcdvdR2C?=
 =?us-ascii?Q?FQn1oExMYz56vU/qVsMjR5qxLi5yqrYFiFviQ2xW7YFFHTY91K9LPVqqImha?=
 =?us-ascii?Q?JOpa+jWReXXt17bckpDsgwaf3HDxb7KEwwP3A7ZK4n6Z1Ez/CrVVbojFyg+8?=
 =?us-ascii?Q?G4brBqazuWKf0oc63T3LKKd4/QHrX9R7TWYQU7lPxCk5GtkxouMJogsrLD/E?=
 =?us-ascii?Q?otlTH0rybzXAgKJ0L7tdtwv7Q0QCDA3V2W0nyoVjanOJc1Mb0OBH/6eEhgIP?=
 =?us-ascii?Q?QiyyQxTFlwwtQrp7d/1nSOXAx5+ki+ZmWWjZm5w4poFvFLvJXlq/1dv7dk6t?=
 =?us-ascii?Q?+GKrW0LHo6TZ5uL9y5YWfCedt0JFfi3vuYrApauepNBHFfM6JyRbBhJ2/00r?=
 =?us-ascii?Q?MkXsF1QO16gVvpy29T5VgfGcV7eT2VtJMzGWVV82ad1SHCrbvhAV5ytNl4Gy?=
 =?us-ascii?Q?TwC2faRkdJNakFEW12tNdak6HzB5B0jIXCVU52FGduPahnbKHd459Nm7pCGC?=
 =?us-ascii?Q?e7DEvVzRRwx/BXOsh1lc7Gb9QIxstPXv0t0HbcJqeQQaAVMrWP/OZy1Vjskb?=
 =?us-ascii?Q?v8pghILnm7EDprtEkLrvfpPy1LXR2CxLie9Kk/D5MqI0OhZtx/2hQyu6ffkD?=
 =?us-ascii?Q?0s2ipZU+BrlsHk668xbP08mXpIDP9IBYXrBo1c9k24ens7PomRy7Ws6O7u7F?=
 =?us-ascii?Q?0+yzS1KH4Mp7Ligi4y9YSvhZFvFWPMcGtq6M5hkTaeJd0eSvXJprpRQ+E4v8?=
 =?us-ascii?Q?CQkMngIN+ahgnNzjVFoD2swTqrh3AXeua7fAvv3ACR4ka8AnJf9MtlTcP2Ye?=
 =?us-ascii?Q?MaFAdcQeH4IwGPd2H4icj9Id+HAlndW7bjxnwdCPXXCw70NsgmCt6+aA1Gsy?=
 =?us-ascii?Q?QULkx00sWX/Tq4nVpsbaz2vp7gfHVGqkSvGDKDhZFaetoYhWzfWy0dm6IhnZ?=
 =?us-ascii?Q?GMCyHIh2ZHGmbqYrRi916jDSO+k8yvpiGhV+YHTXp7vm6bXD4SNRFsp8y60Q?=
 =?us-ascii?Q?w5zJ6sa8DPGrJUSKeSmvIQkOAV28g/j0zMJKXHpJsRqQXihqRty2G7rVn2H1?=
 =?us-ascii?Q?0vGK/uvi9uCJ6CS5VhRExHH2NoFlH3DZ0sQEtSq8CxzjH0ORF7Q3Q2Y8mkpH?=
 =?us-ascii?Q?o/HnDiOntWNo7ISeSebZOhgax2TU9p9QFRv+3XQUnFzmoYyD9Jg5vpMXCHND?=
 =?us-ascii?Q?gRcGkvAtzdcByWQrzB9G5HTHOVX1Mzip/xS+aZp3RWXpw1wQRcacYvNObMOb?=
 =?us-ascii?Q?DuPvnQNiHiIxLPKKv2f2/CGPAXyxpnwAFM7BUqJ1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aef94913-295d-4467-0c9b-08dd25748c40
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2024 06:14:25.8397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ntrD93eye02JiPuN7uE2Zo6y3+ajmzosGsf0p9av0C8UMDFhurwe4k+BL9pG5Em6BV1GKA80+kOtcaXIcDkFBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7971

Return -EPROBE_DEFER when dma_request_slave_channel() because DMA driver
have not ready yet.

Move i2c_imx_dma_request() before registering I2C adapter to avoid
infinite loop of .probe() calls to the same driver, see "e8c220fac415
Revert "i2c: imx: improve the error handling in i2c_imx_dma_request()""
and "Documentation/driver-api/driver-model/driver.rst".

Use CPU mode to avoid stuck registering i2c adapter when DMA resources
are unavailable.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Acked-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
Change for V7:
- According to Andi's comment, use dev_warn to replace dev_err to print
  warning log in failing setting up DMA path and use a more detailed
  comment to explain why we decided not to leave when meet DMA error. 
Change for V6:
- According to Ahmad and Oleksij's comment, use dev_err to print error
  log in failing setting up DMA path and simplify code comment.
Change for V5:
- Add Ahmad Acked-by. No code change.
Change for V4:
- Output "Only use PIO mode" log in debug level when no DMA configure.
Change for V3:
- According to Marc's comment, remove error print when defer probe.
  Add info log when DMA has not been enabled and add error log when
  DMA error, both won't stuck the i2c adapter register, just for reminding,
  i2c adapter is working only in PIO mode.
Change for V2:
- According to Frank's comments, wrap at 75 char and Simplify fix code
  at i2c_imx_dma_request().
- Use strict patch check, fix alignment warning at i2c_imx_dma_request()
---
 drivers/i2c/busses/i2c-imx.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 1f441227bfdc..ee0d25b498cb 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -397,17 +397,16 @@ static void i2c_imx_reset_regs(struct imx_i2c_struct *i2c_imx)
 }
 
 /* Functions for DMA support */
-static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
-						dma_addr_t phy_addr)
+static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx, dma_addr_t phy_addr)
 {
 	struct imx_i2c_dma *dma;
 	struct dma_slave_config dma_sconfig;
-	struct device *dev = &i2c_imx->adapter.dev;
+	struct device *dev = i2c_imx->adapter.dev.parent;
 	int ret;
 
 	dma = devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
 	if (!dma)
-		return;
+		return -ENOMEM;
 
 	dma->chan_tx = dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->chan_tx)) {
@@ -452,7 +451,7 @@ static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
 	dev_info(dev, "using %s (tx) and %s (rx) for DMA transfers\n",
 		dma_chan_name(dma->chan_tx), dma_chan_name(dma->chan_rx));
 
-	return;
+	return 0;
 
 fail_rx:
 	dma_release_channel(dma->chan_rx);
@@ -460,6 +459,8 @@ static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
 	dma_release_channel(dma->chan_tx);
 fail_al:
 	devm_kfree(dev, dma);
+
+	return ret;
 }
 
 static void i2c_imx_dma_callback(void *arg)
@@ -1802,6 +1803,22 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	if (ret == -EPROBE_DEFER)
 		goto clk_notifier_unregister;
 
+	/*
+	 * DMA mode should be optional for I2C, when encountering DMA errors,
+	 * no need to exit I2C probe. Only print warning to show DMA error and
+	 * use PIO mode directly to ensure I2C bus available as much as possible.
+	 */
+	ret = i2c_imx_dma_request(i2c_imx, phy_addr);
+	if (ret) {
+		if (ret == -EPROBE_DEFER)
+			goto clk_notifier_unregister;
+		else if (ret == -ENODEV)
+			dev_dbg(&pdev->dev, "Only use PIO mode\n");
+		else
+			dev_warn(&pdev->dev, "Failed to setup DMA (%pe), only use PIO mode\n",
+				 ERR_PTR(ret));
+	}
+
 	/* Add I2C adapter */
 	ret = i2c_add_numbered_adapter(&i2c_imx->adapter);
 	if (ret < 0)
@@ -1816,9 +1833,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		i2c_imx->adapter.name);
 	dev_info(&i2c_imx->adapter.dev, "IMX I2C adapter registered\n");
 
-	/* Init DMA config if supported */
-	i2c_imx_dma_request(i2c_imx, phy_addr);
-
 	return 0;   /* Return OK */
 
 clk_notifier_unregister:
-- 
2.34.1


