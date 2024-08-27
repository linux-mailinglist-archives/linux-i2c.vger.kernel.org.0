Return-Path: <linux-i2c+bounces-5821-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB9695FFF9
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 05:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E704B281370
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 03:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150803C08A;
	Tue, 27 Aug 2024 03:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="YDzvKnEe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010041.outbound.protection.outlook.com [52.101.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDE71B978;
	Tue, 27 Aug 2024 03:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724730544; cv=fail; b=MlMZusfFf9MYbOJBg5K4QkTmxMeW3FG5khOkKV5zSQuMNXEGvYzBELMYnRvDVl5RwYFM2788gRqScvSHipTsC7T7g8DVHRKkSlCLR1dwPxPCyWGGMQ1HRgq4RdtEa5phv5U3M92gYUxzN4mZu5AANtbkCfFIaqU96Yt86nH+mm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724730544; c=relaxed/simple;
	bh=cF0AJa6LTRobnLH9L+nH+1pTx+DG8UDf0O0syA4Ja/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dQk+mI4coA316ESV7kS2VG+AZ8NRpxouEmQmM/0VlS6F335SdbO8++xR1DJdRtSRKt7NYfu7OzC+NmQfu+T84UKxA2Ni5tnbjPRx65nD3Q4teUwiNAYwLZAmxKvJNlhblEJfSTnOadsxng43T4Vk6zQnRj9sQEUTYRd+G/k4q84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=YDzvKnEe; arc=fail smtp.client-ip=52.101.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynIIEi6P+t8P8d6vLk5Xngu3rEvqCIPrtg7WSGYINQYeqOV0yCzxQy7CoR8zhIqTl7yaQh/BvyJCKTGT5Skw0I4Je/yTt2MAoISu+0o9/4KNTHGM9NqgNlHc4e0F4O1lSWcFU54tewiBS5tOB+98BIaDuhLWmdlIZS9qQVSXtOnVYm9Aw1ZtQY1N7cImxX9q6qLxsKrzYm/KsLBmKlosfqkEmcymN/VeKoqXuum7MflJLMypcLJ2oSmLV9O9QMKqU9O2HbkSlKcQrG60tAOx2W0C+BpeXoaoaYCOf9q29mq10oOLWQT/YNBvSB12KgiO9YjYKEQNjcON1YyN5xIeeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNJCGszWoHFq0L51NYpvZNK97qulYTh8Q7SAAhMmavE=;
 b=u8DKmBBrd+Ig/nfbP0Ch5TlWDClYCyy7Cu8Wmqo0fu5AOnQYsdDGqc9X42t5FJwWQxGpgYD0MhRH0WIVJ+Zt9xIrbBhU4NLoWN4AMBH+St2Iv+cMPTHW+R8s1ewEyxTCTPGsna08VT9eCYX57p8V0WdQURBSNpJgG1cWtslbbHUYV8GqFMoLanFLCZ+X7z6u4zYQs6UFth/R3d0PoCZsA4bgszD7IcHdRh83SD80/C6bn+VAoBitSAbeyJ4LSCY6HGTxdTkEwJvZ90dEKWoV8D0JmIH6OjpdbLBgjgX4h0kH9wJ3Xuh5dfD+iFQAVfPZfDrd+zw8s2NxE6AHl5A/xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNJCGszWoHFq0L51NYpvZNK97qulYTh8Q7SAAhMmavE=;
 b=YDzvKnEe2/Ed4GMNe5DtkMJpk6r7s5wmcJS+ylJT0Ef4WBfAHPY/WsFgLvAoBUfLOX81m8dTZPNR7cdt1h+TKWXYagz6XRqHVDAOW+CI2meDHRnNBj1lANlqeRPdGj0pQ0mpzaAFNUI1lWfh/KdbWZ+JlvOJMm3toeVHzUV2f4De0qn5osEGTTms9GvGflgY2lxzm0R99fY+F/QeoucymFsYdE8laZak2Fh8KPGGIXSW0X1cfPTnwJdgBfBqTFa1bGgvdd27lNHjTFsibHXjZsWiHMqVzbAFkzmC0CcnknaWu5kRiJWCGvybGsC1+vD8pgGIPFkObf99KFv9P3VZ7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB6531.apcprd06.prod.outlook.com (2603:1096:101:184::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 03:48:59 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 03:48:59 +0000
From: Rong Qianfeng <rongqianfeng@vivo.com>
To: andriy.shevchenko@intel.com,
	biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Rong Qianfeng <rongqianfeng@vivo.com>
Subject: [PATCH v4 1/3] i2c: emev2: Use devm_clk_get_enabled() helpers
Date: Tue, 27 Aug 2024 11:48:39 +0800
Message-Id: <20240827034841.4121-2-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240827034841.4121-1-rongqianfeng@vivo.com>
References: <20240827034841.4121-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0131.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::19) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEZPR06MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b518fc-5721-40f8-63e1-08dcc64b2f10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?grr+XaneuMzA0Sr5YS2aU8Mqy4Fjw7bjirzfTFmcxIdH+1yrLaTL5SUpBXlr?=
 =?us-ascii?Q?oMPWptWIWtO84G4tnvR0tIKeW6RZBy0oA0653pTWHxUajv0vp2O9oF7fK/Zg?=
 =?us-ascii?Q?lMpOsGVyURk4ZOWuWRaQ/pDcvrKBWC49Ybwx0Hmklag1e5NMoFQEytelVldy?=
 =?us-ascii?Q?uD5H8lM9Rjc2fFzk5nVPsUh2AMHoAKGVEcY+PZQh3vxxotO4WCN17bY4CUBh?=
 =?us-ascii?Q?nSjXOxJ1DucsGpe5RMWUK1hfzB0lubBdgJNHb3AAOXSM9fIG29hfNfNqDEHq?=
 =?us-ascii?Q?zfitGGBAyE4vEgwxAgfRDNihdegSwiWctlBKtAfg6OXtvAbc05YAnalaXF7N?=
 =?us-ascii?Q?D2l5KrFejGSuuDq5LNTk9ciVS7kWnd5Y2JiW45DuWviXc2i68Sg69ARezvtP?=
 =?us-ascii?Q?ue6nArEyh1yU0x1z5Aws8twhj2rYAMmrEDpWHn0nbnAY/b5oONDgUUWRnlgi?=
 =?us-ascii?Q?8nU97HF2D2dIwfkppQF3pqyZfAfm/pcRorbW2h3IlxP+4nticPPyWOjfXv5/?=
 =?us-ascii?Q?/REtcB1sLkimkXjxyV+rCUNQ9rhfUyudRMn7ArK+pDFSfafh+0vjodd+Mau1?=
 =?us-ascii?Q?X0qeWGic9UspERaK+TL8I3kgFZQl62lU4BpA3Q3mTzeRlE6CQzCJKYqBuXdK?=
 =?us-ascii?Q?NY6jWh25VrqZthPL/EXfxGKqEiMI7IkWR8f0eSXwQrSVLsNYJEGJ0Q0X+GDA?=
 =?us-ascii?Q?NIgxMnBKJJ4UPlcuaIsg+rSoCPgZXMcpBwYuZiaAbTu9YTNN1e+K+8qnrRTI?=
 =?us-ascii?Q?raAFPWHW5frHyxl4VyGoaYQPnRGhDs95QPR+tcKp0z4qs0DD2AviBITEP++v?=
 =?us-ascii?Q?BwJTQ5FaajtQ20PjMbxFHysUS5/mYXHGIP7ypuG61/0LdGN2XXpRx5BeugLE?=
 =?us-ascii?Q?cxGlJoKVyQ8PeRBOQz45OmzeUmEZdQFVbGdsmqtc6w4QWKAc0q7xEVM62h0Z?=
 =?us-ascii?Q?iA+apVZ05vQHfKy+RvrEHnXC76EcZtWcnZVAkBOwRVoqF0xf3HuKxkY3Ox7N?=
 =?us-ascii?Q?hcghXA9wU4L5TKGfnVEc+3zbBsEMnmk+yxgUfGLqGNBWJknOa5agCG44ZDml?=
 =?us-ascii?Q?RIzrJhuC9GhxeSz9F/jkNApZI3udh1HDEbLvMTd9kzhrGo7miTTDOHpbu1xT?=
 =?us-ascii?Q?/0yvJAD+D7QU8W7zBcxz98pR8WLJT0itBmLnxQ0cThneNtvDlMuAG5xZQ9Nx?=
 =?us-ascii?Q?aF5ZxUJPW/KUHa6Wc6bG5dNcFr2LepK8CPJ69xSDSmBA8MQ/iW8DKBKKuPOX?=
 =?us-ascii?Q?KsG4h3lzx3vDG+6qOuv/WMx5Mn1KRkbOMNjRo+4q2iJaZtvs/pEkpI6u2tZD?=
 =?us-ascii?Q?7EqOIE1bgOuXU4NQawZNDAI7c9lI8MQGTGiTHfhQraMSO49f43RcSifJZySB?=
 =?us-ascii?Q?s5JHINr7PGcLUfSLj3VkhfiaPupy2KQGJq7C7wFqgrWyWOOejg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UEmCQz1T+tOqSTobYuubtp1AL8/o/aRoiPoPxdBg58GZQEGbESvH07Yp+1iH?=
 =?us-ascii?Q?Srw3qz+XNqerAwV48L/1fEFuo76HHPYaAVVDXKfIOZHKxEb5C2iyXxkMlQ42?=
 =?us-ascii?Q?SUVu9WI2ARFi246qUiOgKCbqdbepFxDT03FdY9AIQd0fHpGbmLMgyplfcamk?=
 =?us-ascii?Q?nPraOxIxrJafiU9k5R6LgjAm4CFchAOi9nmSg8BWruGaraLdi3+n0Jqku/Ec?=
 =?us-ascii?Q?xawBx0T6AGivCCdPjPonVl5/Kf2yiFjNKehfWhE8Q8jWax3/jX0p0IULcAOV?=
 =?us-ascii?Q?VRd1Nxz1qTkkcPJBC+5W/Svgvafm37j6UnzwY/TB/KdCXbD/8Zm6gdbTHfQn?=
 =?us-ascii?Q?DQ1o4qZL60cZTmI59Hk/PlzyDeTaB6qrgDBo2jcgoB/1G6cseNftHdijNcfa?=
 =?us-ascii?Q?UNIt5BsHyoejcxStewhbefuE5vK7DX6my6LPhq9PKeCy3xya6n3e7DnT2Yg8?=
 =?us-ascii?Q?ou/gBZnnqnFIVGSjckFJmJxKqFnrD0jW/suE/IKjHLQCl5K0Gx/wBD3r3fIE?=
 =?us-ascii?Q?L0ZKqB7P/1l9etdoFLOryVlogzgBO+OLVY6OacN+uK+n8+OuURYSV10uJrWK?=
 =?us-ascii?Q?zlfPv0O53gWR6fGQoo/5VVo5xuSMxA+4Sv1UxZNYxUfkBcghwmy9o8alyO7Q?=
 =?us-ascii?Q?qmVZsZdjrJXsldYsgzSu7+KtPXGgJzF0fXb2yx6AXMeMD81eZi8If31c6zSC?=
 =?us-ascii?Q?EDGdJ62bzmxsn3D3CknZgogC6bim3ns2Xuf11lwSuKrfLa7nAPl8UeY50h8A?=
 =?us-ascii?Q?2yN38r+Ym4uRRPPPT/w3qZDnwau3xNtD3TGqainkz5KZff29sTVUX5AdV9Lc?=
 =?us-ascii?Q?glGmJTzdYoZz68aEPCAZXSMpe2jJEIa449VFioVHtJp1Ih0K7guFRUtRMiw2?=
 =?us-ascii?Q?RxFOngrG2fG2gOX6NO018QYEErGxqFkuXz7PsL/Sb5sLs6R3CALyjMFLMOz5?=
 =?us-ascii?Q?zEFZ+uWxQfczOvr62sBpagInDABKd+jYIwo8Wmrf30j1SIGoODA1Sy3IYsYP?=
 =?us-ascii?Q?P5zIMm4sRUdD3hZRMR1+ah9/Rnp7WXzyGCkwF5Zy9PjYfs/r5TI6XtzSNZs2?=
 =?us-ascii?Q?Soun3a/njIgvTdMElBBCY+g7tEc4pLCs0vczEx+Vv7N5BgzHsma42F+1emOr?=
 =?us-ascii?Q?Vqm5jX4rxzpLTLY1fCebrGkn1lpIvnS1nHaEkkTwL+blYyPLW35P++IdNDaa?=
 =?us-ascii?Q?Q9XI179JuRbnv3dvLbjgWuDx8QVzyZTM8reX44/APE6YyYGBpRNFi4t4Rk8B?=
 =?us-ascii?Q?E79/4QqBQEZrqdkvYLKkQx1+79558JWIFh8dHvSdXMYBY7zAQEJ+d8lIdVrn?=
 =?us-ascii?Q?Z0KeuM6JmnyH4rjLaOEO201CUjXhZVpEX5VSj2fiuhlPQRPNSIrytOmZFtpn?=
 =?us-ascii?Q?KQUCkHSbpZE2VsjKzGjFnrPP+/hiViXBGfuXBnL/79tXkTiFNEI6r5zWCHTl?=
 =?us-ascii?Q?+JnuPIKzFwyCSdANkTw7VhufH84FSrEYaXYfzLWdcwB00IIfQsnHPYDAogVF?=
 =?us-ascii?Q?+ftU2UTaPL5z6rZq2Krm+GrNGRTcXE8vTG3up62JDy9GlsS87AzH2QmQp822?=
 =?us-ascii?Q?OuWxjd/ZF5LFwHU9rt0+EamX3M6BuGdXI0mrbGwJ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b518fc-5721-40f8-63e1-08dcc64b2f10
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 03:48:59.6178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ajz1StS/GIbEEdOsZ4ze4Se91+4QvysDADlZ+Anfagcl8zvXmMmuysNVeWktPyKoh7f1lns0c4XdW/eeM+4DbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6531

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids the calls to clk_disable_unprepare().

While at it, no need to save clk pointer, drop sclk from struct
em_i2c_device.

Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
---
 drivers/i2c/busses/i2c-emev2.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-emev2.c b/drivers/i2c/busses/i2c-emev2.c
index 557409410445..d08be3f3cede 100644
--- a/drivers/i2c/busses/i2c-emev2.c
+++ b/drivers/i2c/busses/i2c-emev2.c
@@ -67,7 +67,6 @@ struct em_i2c_device {
 	void __iomem *base;
 	struct i2c_adapter adap;
 	struct completion msg_done;
-	struct clk *sclk;
 	struct i2c_client *slave;
 	int irq;
 };
@@ -361,6 +360,7 @@ static const struct i2c_algorithm em_i2c_algo = {
 static int em_i2c_probe(struct platform_device *pdev)
 {
 	struct em_i2c_device *priv;
+	struct clk *sclk;
 	int ret;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -373,13 +373,9 @@ static int em_i2c_probe(struct platform_device *pdev)
 
 	strscpy(priv->adap.name, "EMEV2 I2C", sizeof(priv->adap.name));
 
-	priv->sclk = devm_clk_get(&pdev->dev, "sclk");
-	if (IS_ERR(priv->sclk))
-		return PTR_ERR(priv->sclk);
-
-	ret = clk_prepare_enable(priv->sclk);
-	if (ret)
-		return ret;
+	sclk = devm_clk_get_enabled(&pdev->dev, "sclk");
+	if (IS_ERR(sclk))
+		return PTR_ERR(sclk);
 
 	priv->adap.timeout = msecs_to_jiffies(100);
 	priv->adap.retries = 5;
@@ -397,26 +393,22 @@ static int em_i2c_probe(struct platform_device *pdev)
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto err_clk;
+		return ret;
 	priv->irq = ret;
+
 	ret = devm_request_irq(&pdev->dev, priv->irq, em_i2c_irq_handler, 0,
 				"em_i2c", priv);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	ret = i2c_add_adapter(&priv->adap);
-
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	dev_info(&pdev->dev, "Added i2c controller %d, irq %d\n", priv->adap.nr,
 		 priv->irq);
 
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(priv->sclk);
-	return ret;
 }
 
 static void em_i2c_remove(struct platform_device *dev)
@@ -424,7 +416,6 @@ static void em_i2c_remove(struct platform_device *dev)
 	struct em_i2c_device *priv = platform_get_drvdata(dev);
 
 	i2c_del_adapter(&priv->adap);
-	clk_disable_unprepare(priv->sclk);
 }
 
 static const struct of_device_id em_i2c_ids[] = {
-- 
2.39.0


