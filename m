Return-Path: <linux-i2c+bounces-6385-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3F2970CC5
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 06:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71C221C21C2B
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 04:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391361ACDFC;
	Mon,  9 Sep 2024 04:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="p2UEfbsD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010067.outbound.protection.outlook.com [52.101.228.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E777812E4A;
	Mon,  9 Sep 2024 04:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725856971; cv=fail; b=HUPkQ8RWZfF8cIlBH6jlxZfkqzJQUNKdH3unzGXBPgMNy59aOO6FvwYXTzOmHtmAU4iVA5lP2GvWz1ML6VG1JCsacmi8Egp8wHrVQsNnVDrnhMkDD+IXkBkUr6YkhfHD3HIBpMYpcgsKPkY56GLmlItX5uY05VxbEvBY2bSgdvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725856971; c=relaxed/simple;
	bh=8rb9Y/FdEzpSD1vCYaN7Hdz+ZHNGCgzHvodkPBaDTAQ=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=RPrezu8gP2yIhSJliZ6OCQF9e6OTOK86nXeConwvOCXBuvXOFS5PBwkU8tgczbmSW4BqAeHmB/+9WMQ2gO0K5t4VwdvSxtTHRlbum2Eiz+Q6nWbj1sBpf/yERhr3S1ikgmA1ugxRY4svi9xfIq2pGUJ9YCyI9VxOkwXBfHN9/is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=p2UEfbsD; arc=fail smtp.client-ip=52.101.228.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7KsMarWqtrVPDLMvniPnZ6MWIG7D4P7yOTiQXs+pYaWJ5OJ02H9Yd/xhcwn/VNFR571y/j61ovJ8omL+lf9/Z7+OH65Dy/uIa99QAWToFIBNulyR+oZ6EqUhS16KxnzMOry/rglnUpxdFCHiefAXGID4XTd1O4+lJ66Lq01ZJReq+QYTRjAsf5868QUpuht1B+FB6FLBbQuVQhb+tfYdmZnVAY9MVKrSbcB2VI4nswljTyllME3kzyoObjWmiW08xqqSCPgOMM5toXFCOpZ8PcRKZ4yh0ZMQhJH2DkUAVAUJaesxUOZnFOygB0230wXynShtsgp///xn/VXdHGX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7Ab8d9tOW9IMRuwH2gwn2yDdT17cVlpMEaXQhbTVpQ=;
 b=ZALHyuoHidjZmUc5rVEN0r7OZpJyu/zsfej0TcVIt1eLGIVOFHvQPcMnBXFXmtM1jWm6MauLk5gOB8x91GMF3VqXDHVz+iGGLwTJW39CmsN9nTzBPmyjQBdQ2GYB/enAFh0+V5n/qMnCd/PxwKZ/75lirk93PS7O+IeB6iJBh3fJ+lG9YApRn8cBZPMeLkgGDNH3LlcRPUGoLY90OKaXoox09pmvFmf+5w+Mgqy24CkLnuA8Ir8T9E5HEDGo6U8FQS52pg8+UCDmZX+5afxjzLmtKJILVE521hff6JGjHlCAbiE6rD8AWqPwGwYDpBGXeQE5WWs5XoN5GOGZORARnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7Ab8d9tOW9IMRuwH2gwn2yDdT17cVlpMEaXQhbTVpQ=;
 b=p2UEfbsDpOTN6Vif8jrWHtVnqE71+AixIonort54vwYmXTM43WqMSsZMHLMlE11GiaMhjtJATu1V6CB+UIaY01WG2yr36S5thGM4Ua5OXrEZcLBgrtNmf1k7FY2QB8VfrNXOTA6xXG8Qv+xNXECHwPrDAkmhhmtZeHG7MIW4fOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11267.jpnprd01.prod.outlook.com
 (2603:1096:400:3f2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Mon, 9 Sep
 2024 04:42:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 04:42:45 +0000
Message-ID: <87a5ghsaii.wl-kuninori.morimoto.gx@renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3] i2c: rcar: tidyup priv->devtype handling on rcar_i2c_probe()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Sep 2024 04:42:45 +0000
X-ClientProxiedBy: TYCP301CA0047.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11267:EE_
X-MS-Office365-Filtering-Correlation-Id: 97f5499b-c3a0-49fa-3b58-08dcd089d955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VQes+Kk35Gog6URyVGo7vJ2XAy0W9Xr6vPyVVYexgLS4dt01Q2TO/tIqLZKR?=
 =?us-ascii?Q?znFwUsFmJ/A6Wqvd3AOAQhfPqjRWbVhx/7gqgNUQZvqQUTvaqTX0VHY9enln?=
 =?us-ascii?Q?qn1/Uo+ebTa0WjktELsyOVaJkDxR/u/tUDHRoRsUAMXW3It8W9SPEFIjmImz?=
 =?us-ascii?Q?OcViDi+9OSYWBNiCluOHX6GpZSJDcLAoXvdDw8KR4v/3hAenEJDa4bs6sg8l?=
 =?us-ascii?Q?d6mw+h274Us8n2o+4jpn/X7drBaVPoN/Zwa6AoNe45/KeAFfWjrxUSGULOMI?=
 =?us-ascii?Q?YXUCMiJvZp+ZLJJPbc5LEicAaCfWgxmbyodGvyITBfl3VYct7BCagTRuEgBu?=
 =?us-ascii?Q?A5tlPcVDAEwuM7AO4yiebqYrnp+Idh6TYScCkRUnLfXClBiP8piedR6F64L9?=
 =?us-ascii?Q?hQVrgheF5ARiBnT9P4+m2FQHW62vqu1Nau4PstgGSB5wK/xM4DtcAAr+k2kU?=
 =?us-ascii?Q?16qCsMJefhKtkfX7udjYEeVwdRXWq4DPZckA9M/PXVeKZUYOXbOu+fnR1rZD?=
 =?us-ascii?Q?A9o5725qF6ZAjkIJ25Q+mJ1sXOhHGHHo+EtpXWHT7Y3TvnuYqCIBtTX/BPN7?=
 =?us-ascii?Q?mTLl2gjABjakwytC6OlrdZMjtgFtqHII+srrMac1HhyMOoDAUOh0K650kmxh?=
 =?us-ascii?Q?8PZeK89KXalDUBr9By2YsUVUh2VWJrNzerT4k+JY7eQ5aVCA4llOthiInlaf?=
 =?us-ascii?Q?2lKVHETS5DdIG1BwIKtSxYurq/ZvD9sxmFb7VZ0qjkZQouxeKvhmRXzwX+bR?=
 =?us-ascii?Q?hWaqpBC3RC5q5GQD4FztqnjZ4OqVfz6U5tmyxZuKGJkARkTf/8VlYr+fRzSH?=
 =?us-ascii?Q?CdBeqI0uUDxh2rUBllvZtJoHLmfHAfiMQuppvoszD22wQgglm+OxIv2Y17r4?=
 =?us-ascii?Q?3LYvvBiIqzcBVngw34S+HtFHjpHZT9NCNFu3sZR2/pr7W8If0A+eiNX8aEhy?=
 =?us-ascii?Q?4MMNTRfG5OHmiAzOXKTUJjTUUPak+2uZZDHRZ5imnpCxI7j7rk/fvr63ALSW?=
 =?us-ascii?Q?ZNqp9BTTbzeH6Lvb4TW8oXXYdckQjos4FgtMDQ8aC3quJtUeiXgxAYo8Jw3I?=
 =?us-ascii?Q?Z+oD/6OiETtZ5fZMsmFWw4Mc8kd2ka93YtWELrNNQV2+GiSp002frX5UjS4+?=
 =?us-ascii?Q?QNk89/PJMo4LQyCsCrwq4Me1zTej25Iq2DdA/ejMgepak4cNkgInLd1/5E3u?=
 =?us-ascii?Q?xmyGy8CcSKjfflkHA2bag4tH0em2zekgstfhiC2JKtwLSphcMCEseFlaRVRM?=
 =?us-ascii?Q?VhvOpcnDqUl1TsWCXNJTdQ3FEMcip2yvZB/Ug0ZOZWsB++hLxnCS9cFNOJ/k?=
 =?us-ascii?Q?Q52P3dltjU7J2IYnu3LVMzm26ixQPLFzLXINHwc38U5zxwgobn+b9Ny7zrvR?=
 =?us-ascii?Q?qFVlTNLb1PwLWojFpVRAE4NXA1EuF5h+FsssT1/Wami8Il6q1Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/5TwWP8sPgCAEYPANmEh4ucMiZgFino3B/zm6IOEb0/8HCq0tDMDjbyoV+j1?=
 =?us-ascii?Q?czyL7hGy6gKZmHPiy3gvPMZA7ktVPzeCH2DTfLnJfhj8BtO5jzMHYI5pHR5L?=
 =?us-ascii?Q?AFeFbNHqGubY2qBffbfPWCflWc8b4Da/SV4RDAXhCCFotBwiSYm6JK4kcaCR?=
 =?us-ascii?Q?mXI08j0pc4Zqb7NuG30/egy6FCOMqefWheIwVpVQN+LAW9l7MT/bx4FOWIeR?=
 =?us-ascii?Q?Wv4mYZUAoSUZFVOnqoaVdZVUd9RFFnGg+n6CbVs/r+NGv70hCs+skDvT1eQ6?=
 =?us-ascii?Q?6FG9Dcmasd+fEWQ63LyyQCr8kI6KFwxFFgosnk3l/YEoksRkogwpWnJysam5?=
 =?us-ascii?Q?l/KjFb14H9zugcEuM/VY+8eRoa3YiStAL0rmurO+n3mI+8/Tp1H2TZAPClv5?=
 =?us-ascii?Q?NbJkx6jrp0TnKcn2oR4Lg+8XuY2kwSM0dcz2IR1zbmHfVxwoq9HIsECYl6BC?=
 =?us-ascii?Q?WV44rE7DjwVJBYSIOLanTBqrhhVlnYzVDfgfPz6J3zOLTXowns6gvbimSZdf?=
 =?us-ascii?Q?un3hql/FoNnw06tYImw9OPmwr3uPG5ZFRxRjzuiPz4orajO0gCCW3yrgtLgw?=
 =?us-ascii?Q?w2MfKB73dA8yKHCCn/WSDqIu6z7UOhEpVX1HxzajjnjhYtQRSn4cUeTKKbTF?=
 =?us-ascii?Q?qzGIFafSiSTpDp1QhsmkJWESYgZCZfq93r3pMTlnsJK6FQFFDvQnHXNb2GiT?=
 =?us-ascii?Q?2/2zLT9swnAXTb6KvE4dt0iuxINVEVEi49NvH+UMFVCB7FByqEQ0cppS/Xad?=
 =?us-ascii?Q?AQZOz5V84mrvEHoEc3Qt8EW1pZukO3yS40zptrr4iW5dOL93yBph2PQS3xaK?=
 =?us-ascii?Q?tbLimkPKV7ddBLDB/wWvMpzt4smRl/9eEHeJMun4MXx6F4qs7avGPmhVbMCx?=
 =?us-ascii?Q?d0C3ClrQwYA+D83s6NH01VKDtYZo4+XoXIdY6LqMNE2hKLnFJJ616gK3OR7i?=
 =?us-ascii?Q?7fTLuigpvpScWqw+gQpAX2XTBPiwm5rdZH52jF+p6/1dsf5cvYL+sw5bP18A?=
 =?us-ascii?Q?y7UTASEjmUeb3584iNctlDCE3Ch/S0o8cTigSerJdSVPnOXh66ZrP0F9Z+jo?=
 =?us-ascii?Q?deUe6ZgUERyTnksivg92LH6vY9i8D1pCErJEa6GZkWxy8iJFzkY1DRwpWLCc?=
 =?us-ascii?Q?f9yPy+IPdOG6APxgq0M1hQXlboKjGc7wP6sc/hHZ4Mjkk52tTxSdP0EGoVh1?=
 =?us-ascii?Q?Yp2UBe5+gXPPnPZQxM3P6UYuwEvHyUpk9HKBN6zK8gdR2X+9PQwmkO6v+zoT?=
 =?us-ascii?Q?/4PFYMBi5SYPBatCewWsbUfewAyRWsggDZibc3Sxsow1vQz+EICF8DQ0z8/X?=
 =?us-ascii?Q?6cWb5q1tW0XhfF3OCh1yV/leIV3geHZXeNflHWNt13wubiH0oytl1uJ4r5wv?=
 =?us-ascii?Q?EMqoI+8lXmlkD28npSwuBZmIXoLS8+XPCqj5mFlVa421X6Qh4fIQQUiX23uI?=
 =?us-ascii?Q?L05g6Zsx6lzQLes+AvJWPHCDAMV0tWHEwBNffyF7yUu1fXqJMmsKC6fk4uOS?=
 =?us-ascii?Q?nedGrRyvOCc/63wGnWjc0HEOZoAIVg5SBqvi2n7Kk/p2gmK77jhJHpb3XlSr?=
 =?us-ascii?Q?HeFpqAfMNKGlfl+urc+3XeJIjvmxS6BwWuaVN+7GbePyOh2pq8zecK4+l2kp?=
 =?us-ascii?Q?VHyP7XTlYWN8C04QdlETV5g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f5499b-c3a0-49fa-3b58-08dcd089d955
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 04:42:45.5891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sG3nSJC7uAhYlEPoENztMUZFipn5CksiPJrdie7lEXzF1TbWLZS4Y9YSjD4aspb8dRy08S30p1l+HK2ohTGIVxfKQJpHQ1AwRtyGNviqzdRrZXlr83IDZQ+wU6RpR+OF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11267

rcar_i2c_probe() has priv->devtype operation, but handling (A) and (C)
in same place is more understandable ( (A) and (B) are independent).

(A)	if (priv->devtype < I2C_RCAR_GEN3) {
		...
	}

(B)	...

(C)	if (priv->devtype >= I2C_RCAR_GEN3) {
		...
	}

Let's merge it with if-else

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2 -> v3
	- based on latest linux-next/master branch
	- add Reviewed-by from Wolfram

 drivers/i2c/busses/i2c-rcar.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index da4b07c0ed4c..9267df38c2d0 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1164,11 +1164,6 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	rcar_i2c_init(priv);
 	rcar_i2c_reset_slave(priv);
 
-	if (priv->devtype < I2C_RCAR_GEN3) {
-		irqflags |= IRQF_NO_THREAD;
-		irqhandler = rcar_i2c_gen2_irq;
-	}
-
 	/* Stay always active when multi-master to keep arbitration working */
 	if (of_property_read_bool(dev->of_node, "multi-master"))
 		priv->flags |= ID_P_PM_BLOCKED;
@@ -1178,8 +1173,11 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	if (of_property_read_bool(dev->of_node, "smbus"))
 		priv->flags |= ID_P_HOST_NOTIFY;
 
-	/* R-Car Gen3+ needs a reset before every transfer */
-	if (priv->devtype >= I2C_RCAR_GEN3) {
+	if (priv->devtype < I2C_RCAR_GEN3) {
+		irqflags |= IRQF_NO_THREAD;
+		irqhandler = rcar_i2c_gen2_irq;
+	} else {
+		/* R-Car Gen3+ needs a reset before every transfer */
 		priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 		if (IS_ERR(priv->rstc)) {
 			ret = PTR_ERR(priv->rstc);
-- 
2.43.0


