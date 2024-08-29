Return-Path: <linux-i2c+bounces-5909-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F81964010
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 11:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 588241F2523A
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782F418DF97;
	Thu, 29 Aug 2024 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DW64/aEg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D746818DF79;
	Thu, 29 Aug 2024 09:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923713; cv=fail; b=YxH1CREJRyPaq5JPCczQH4IF/Nogdvb6EPuRH1kSk6rkA59aDdSvacr/MRF5Uj6+7AiNVDzIkdWIx74EinVfgSlT8K/uqvuZCAoJOuWFiUQZ+aaEMr3V7I1354GhYMHVMj50qwpwwRXPCpd3yVoQPHboQaxdVNZssFy8UelkzXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923713; c=relaxed/simple;
	bh=PfPF3qu2MyWZcOqml4AIx9yGeoWD4A8i7ckzWz2aiws=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=D9d7FxzBBRzFPIXBUaxr3d48qi6rJXZoRWvaGOearPxO45WSghuJhHr8DucNzkCm8jgEoDdMmNoiV7rXugvkAEO8bUCopxQUX01+6QMD7+F01YeVnvvSVzIzf/sn/2KcBx1Afd+5PZMyw3jsKQkSg36xDeS45xNWNK702fiHDZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DW64/aEg; arc=fail smtp.client-ip=52.101.70.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofdzapnLc4TcKoYNEH8yQKX+eZSShsjzW5iYO4ymn88IxHGbHW94G8jZixumoqxS3ZjOimvgGP26B92unngug6yZvjCJ14h7zwLQ6BhHY2Yv2QIEqFhipoi6zcUBZrUSonxr9CLz/OUo566buCZpkrK9RSFoOGeIW4qV8gz6LWSMJus8hfCzALoD1CTSV4mwVL31v82lI+gy8wJ2sGrkWESU0MiiX78uPDI//1LE/sOuSvb13vQmP3wxQ/BTS7Wrt2J83HZ5n8SideLA8RG6qgsts3fXItdEhbppfmzk25DGe4CNXqfTEaeUWrUXGDv5+wejz1TPs/TdkluXaHZCiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4YfDm6yAAeBub8EpRX/rvJadtEFi73fGZWC4CpU3D4=;
 b=Nfpmh5oKIjZJEIqxs529w8qFdtYDUdurYpsYCYB2tc59rwyeloUHYnYUwsmYcCABvy3DNtA03QuVompfxdoWEvTBaZvGVGqmLQe7icqYuojVPN9jrp0UTUdZNJQz2EdTlgu0Q6BhJzzwrASiVXRTSrLpaxot6PHseIwdviwY2d5gDGzSt/eYwoRLrX2vcgfUXFOBBYN3Jct1SkwasQnhQ9TPDYRqnEG3pY8DGq2nO0RIGlXnF5h9rFXEbR9KaLyMFL0v32ggy+ggl0cJhdHo6noh5rkGCbNG5jO6uxKSt+Mfcd9j//mzc7wOXm4+IpwYp28NJtuQ3iwl6Q6weSsoJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4YfDm6yAAeBub8EpRX/rvJadtEFi73fGZWC4CpU3D4=;
 b=DW64/aEgkEGhyY/6vuHynjTCfpPcDLAvPcu5he55ZPRCaj109Ht2QzNcqUaoxvpz/qwtbRnWVTdAzYWXkdIw+0as2bsHF/5H8jncGWZQXGF+eJfF8ON/DbwSRdhLJlfYMJNv0AIswBcfvBNk0jHZ6Y0qAVRFGi7b6V81PqKip0rbP4ddosAn14Zxs8J9uKgTekpDWb6CZt4Bn2pvgVzkXLr6K+i8ugHCfXHGuPl02ELGtUWsxpoCiMFWYm1vrU66X9TuaeFi1w6lrq3um8WIA2OPIay18CgtkYvPSzP+4L0ykX6wf+7eJLqX0s/kX1FtgEJTi1Jx/rGTLZSDJIHARw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by DB9PR04MB8364.eurprd04.prod.outlook.com (2603:10a6:10:24c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 09:28:27 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb%4]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 09:28:26 +0000
From: carlos.song@nxp.com
To: aisheng.dong@nxp.com,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] i2c: imx-lpi2c: add target mode support
Date: Thu, 29 Aug 2024 17:37:18 +0800
Message-Id: <20240829093722.2714921-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR10CA0023.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::15) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|DB9PR04MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: acf33faf-184e-4221-29bb-08dcc80cef87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IT8tLIQH1tyMdxB5I6jNl+M71VHz+bN84f1/xUxiMDZJla2nLN7FGchFmKDk?=
 =?us-ascii?Q?HRpJjoW0CUOyDfcUH+0wa7CDY+qojg0p8zUbd1cD+ShADQjMAdKM6Pb7qN4E?=
 =?us-ascii?Q?JA8Z4iH9whKzU84RQzCkiuXSXsauGDjT3K9/2NqH3XGCsZ4h89yTtFF44TDf?=
 =?us-ascii?Q?zh92ExGctVokb24OD4erCSrfbGIFbz2iTVn50Vuj2+sPSUSDgvbrfVTVCapA?=
 =?us-ascii?Q?OQV+QWhU4upNAp6HJWZDHzC0Hx+wis+EHydgW/RsQLrESNd6L/UJCpYe9/SZ?=
 =?us-ascii?Q?ISrfNeifSYHHet6xA2GkUELveYKI+/6w+l9eYAlCqTrIREmacfZpALm8fNNf?=
 =?us-ascii?Q?S2jouHIehYkkzHS080b1qb4DzU6FO0wU6i2tyv0hkGc+SOgC1TYtQlj+wqYF?=
 =?us-ascii?Q?G7/NPym2JHjj1ugjLyCNLZaoOV4nloKHTvafKS3n0SDL92bViz7lTdc8cSGX?=
 =?us-ascii?Q?1IaGFVDaFivk7VWlZ7xULwXKhDnNqqtmPinG3pXILbsjcmG9augVwMivE2OP?=
 =?us-ascii?Q?e6Nfj4EAX3i87cu9l2Hy9HLQB4kAZB8uRJk78WlDO8rUw2PnezQdznU2TP51?=
 =?us-ascii?Q?6WjN/2U4LvgTxVFM8f+sUeYMXh9jMO6oyK1phy+yEuJIHQMmKDHr2MKXArHP?=
 =?us-ascii?Q?giTyZ2d3Dm357IGV9RQeAoT6rAeDGAh8jrYM9GkCwtUhyeGVzGMistql2SUV?=
 =?us-ascii?Q?NeUVVvgP3kPWuX/xJ5Gu4twF3oO9VMiWYHZvydph2VleJbPyt35vYpfLPDmR?=
 =?us-ascii?Q?LmXcSl19FYTKWhtnWkfVb4aI/Yp56mIhO7qpUEgHuB6ezBwDI8CSqMLVMsO1?=
 =?us-ascii?Q?gAm94xucM9bz9IQ8vgKmzpfyoOmCkcG0ZQjNa52d64PM1UKrnAE6lCBuC+C/?=
 =?us-ascii?Q?NYSwdflob4BRweDiTFBGgxCARLGMZG1o8ZorLi2pImsGFNOlWR2Tg4zD/IOp?=
 =?us-ascii?Q?8M/+FAmSfQM9vN5C/A9zPSvZMGqzcBWT1rnQydlr2khD89LOuSDmaPI/mjbG?=
 =?us-ascii?Q?mhC1W2WjGVAVDWyAs5IsEDAhgkG0NHwQtlbS5aFU8pPu7DRjBeBwX7Znu6vq?=
 =?us-ascii?Q?OmM6LeUv34BUHgWemT8AoCV0KBsEq3OOdA428vjoCFVO53aNTY1AtAMK71Lk?=
 =?us-ascii?Q?SEBhcxnopbEEVA9Y5kgrjPFC1Mfas17wz0OjJLSu4uvBzswV9V+UdAp+SljI?=
 =?us-ascii?Q?6B++wNHIT+1jYju09cDOvSrA8Csi4MaVMNf3D9bJlSMklBXKYRU8hQ91zUe9?=
 =?us-ascii?Q?8+XcZZXXJHt4JWHrccQ2uYHttZDKQC6ZIw1/Dlbet1Sg4ZQI7cS5g9ylN5tE?=
 =?us-ascii?Q?vxa8ua4mXOVWvp7w/OZ7A2Zkq64LtVlLFHbj0CvQxK+I59h8JJLgIpMLBw0M?=
 =?us-ascii?Q?2x0m68XaBT0v60mP5nNAVOwq84xfzIp35bDqdi+9Ch93HCjtkw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eS8vEmFLQmsyF0nzP7gP5+62t2ZKD1VNCXyrJs0LFqhgO41vT93FtG5NfVgS?=
 =?us-ascii?Q?hlWtN549ZQgOeHcg9GdEnrA15VfNLW3l46zUKwLrKXg8EFC/X7gVJtMQkNGV?=
 =?us-ascii?Q?6gg2q9UKo47nBqFk/+edYNlVumhEPCB9o6/HL+emF5fXkaDGkgmx7JhgJIyL?=
 =?us-ascii?Q?pzJexytpW5VE+pFfNsR5/UGAX4bQfte90oOkpp0WM7oR8ovJQE9UNWaUby4U?=
 =?us-ascii?Q?pP9sLTnWP8O2wKOJnIaEgeulsVUaIFeGJWxY/8UReV4+PuMk2pIOxmVNy61L?=
 =?us-ascii?Q?vsF4vNeXAwqI7TWTwHCcfEjUjqEIcPNlvoH9zlpsal9E0g4BlsLIXkEMFTGW?=
 =?us-ascii?Q?V4f4um3Egzq/2+GJrIV3MSyUJXt0ziXc5OQlYFlrKsMBKor3FCczv1RfmIN2?=
 =?us-ascii?Q?9BMmu5QEaIw0AA3PUvtZiA0uy4jk3rjWXZhSMSS1g7PvfKfzkxVSicy7w3/g?=
 =?us-ascii?Q?Y6ooEoM1dWJagg0xRtdCqSF3ZVnmtVpOG5vaeHqhOuRyxnu8SzQ5cEDzrOyc?=
 =?us-ascii?Q?2cDIDS30HVaBXEVZcqRGdYXiuvF+4lki0qZ6KUZjcpQGE5p4C1h9wzdMSMtl?=
 =?us-ascii?Q?9jdujpEcXYVmt+MAlwowyAXXb2DYY4LhJVpKGMC2QuoqsIo3gdO2yEEVB5vj?=
 =?us-ascii?Q?BfkA3r0hsx/i8v3AAFnrRIW8RRSGMpkIJ5l7mZHrIVJVgmyXjRG26C6GVlDe?=
 =?us-ascii?Q?TZgwTyrTSIQFfORcBn8YBlo1sokzizqQ44+4VNtnvtc9TECrvkDveaQMiKN9?=
 =?us-ascii?Q?pnLEuspLKRB1AetRMnvUWYtiItweY3LAdjDl3q8RhjJc3FXbEz9ACsqzEs63?=
 =?us-ascii?Q?2YdyY92smjpcH1boviULIWWsYI8G3+d75TQ/EyrGeDEz0uQ6Se4/3JkZ8df4?=
 =?us-ascii?Q?TI3qBkYIPouqwYdxRK0IdZsJeS/vE3L1xHH04fee9XwII7EDjlqOeNfOLfGt?=
 =?us-ascii?Q?WlpiXRbe0SiJAIc+/2LJzJIoARIXZGEfOlsclGMlQeEF/MS7lDY8nGkubcY4?=
 =?us-ascii?Q?XzofC/ZQoVtdym4z3Y8mE0gQXbunf/3f/DtNc+mdT8s8mm1OFqY8kmP8C0ye?=
 =?us-ascii?Q?RfPo0t4bwwouS9Af3ijNIho/5ZOPe8M9C4HQJ19RARR7rxSmXDjVZXKX9nYt?=
 =?us-ascii?Q?o90YKErJF0fk8LyiUao8xU4U8z95YWBZY61rQVPCegtl6XCbikmoD5nblBZU?=
 =?us-ascii?Q?uDCO/2RsQM/mEN+JjdE8xWHg+EfkAtLmF3t7jafFDwD7LuSa1rgYK5Swq6JD?=
 =?us-ascii?Q?3cO+UM7RD3gE/uLr3onZJRkpKYWCjazZ+59UZrcIznbX+Za4xRNlhLvgRQTM?=
 =?us-ascii?Q?5qQxhLLD55i/2zgGlVx5gB0G6xXuZL1qG1DWXKfs3mydCePEzuqHo2nJCDC3?=
 =?us-ascii?Q?T/5i3Vmkhh8KkE/SRIU5Zw0RngkWYkMyUxlbGulQXQeRZEAloaE3FtMR2nAf?=
 =?us-ascii?Q?F9YaUZW3c4yOe0wMn20Zu1oSrbKv9Rjy2adGBQDIz0PiEO9q122w/Xp2qDG3?=
 =?us-ascii?Q?cjA0umbCJ6ixkjS4t4IL8eB7c7ijmFf/Ko0BGL6vLEN6Y5llv/7qDcJWbACN?=
 =?us-ascii?Q?NBGtNB2m/BhzH5VinlPvu/5PepBAaKaX8pHWQHRy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf33faf-184e-4221-29bb-08dcc80cef87
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 09:28:26.9180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICtqpYR+yPPmOjlUORXaiep8OL6341G0ISIWKtX/9IWZHiifm98nynLYRQSc/e7bXmGTx4nsW1IePhEJVSZJCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8364

From: Carlos Song <carlos.song@nxp.com>

Add target mode support for LPI2C.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 253 ++++++++++++++++++++++++++++-
 1 file changed, 249 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 530ca5d76403..c8f3dadfb36e 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -43,6 +43,20 @@
 #define LPI2C_MTDR	0x60	/* i2c master TX data register */
 #define LPI2C_MRDR	0x70	/* i2c master RX data register */
 
+#define LPI2C_SCR	0x110	/* i2c target contrl register */
+#define LPI2C_SSR	0x114	/* i2c target status register */
+#define LPI2C_SIER	0x118	/* i2c target interrupt enable */
+#define LPI2C_SDER	0x11C	/* i2c target DMA enable */
+#define LPI2C_SCFGR0	0x120	/* i2c target configuration */
+#define LPI2C_SCFGR1	0x124	/* i2c target configuration */
+#define LPI2C_SCFGR2	0x128	/* i2c target configuration */
+#define LPI2C_SAMR	0x140	/* i2c target address match */
+#define LPI2C_SASR	0x150	/* i2c target address status */
+#define LPI2C_STAR	0x154	/* i2c target transmit ACK */
+#define LPI2C_STDR	0x160	/* i2c target transmit data */
+#define LPI2C_SRDR	0x170	/* i2c target receive data */
+#define LPI2C_SRDROR	0x178	/* i2c target receive data read only */
+
 /* i2c command */
 #define TRAN_DATA	0X00
 #define RECV_DATA	0X01
@@ -76,6 +90,42 @@
 #define MDER_TDDE	BIT(0)
 #define MDER_RDDE	BIT(1)
 
+#define SCR_SEN		BIT(0)
+#define SCR_RST		BIT(1)
+#define SCR_FILTEN	BIT(4)
+#define SCR_RTF		BIT(8)
+#define SCR_RRF		BIT(9)
+#define SCFGR1_RXSTALL	BIT(1)
+#define SCFGR1_TXDSTALL	BIT(2)
+#define SCFGR2_FILTSDA_SHIFT	24
+#define SCFGR2_FILTSCL_SHIFT	16
+#define SCFGR2_CLKHOLD(x)	(x)
+#define SCFGR2_FILTSDA(x)	((x) << SCFGR2_FILTSDA_SHIFT)
+#define SCFGR2_FILTSCL(x)	((x) << SCFGR2_FILTSCL_SHIFT)
+#define SSR_TDF		BIT(0)
+#define SSR_RDF		BIT(1)
+#define SSR_AVF		BIT(2)
+#define SSR_TAF		BIT(3)
+#define SSR_RSF		BIT(8)
+#define SSR_SDF		BIT(9)
+#define SSR_BEF		BIT(10)
+#define SSR_FEF		BIT(11)
+#define SSR_SBF		BIT(24)
+#define SSR_BBF		BIT(25)
+#define SSR_CLEAR_BITS	(SSR_RSF | SSR_SDF | SSR_BEF | SSR_FEF)
+#define SIER_TDIE	BIT(0)
+#define SIER_RDIE	BIT(1)
+#define SIER_AVIE	BIT(2)
+#define SIER_TAIE	BIT(3)
+#define SIER_RSIE	BIT(8)
+#define SIER_SDIE	BIT(9)
+#define SIER_BEIE	BIT(10)
+#define SIER_FEIE	BIT(11)
+#define SIER_AM0F	BIT(12)
+#define SASR_READ_REQ	0x1
+#define SLAVE_INT_FLAG	(SIER_TDIE | SIER_RDIE | SIER_AVIE | \
+						SIER_SDIE | SIER_BEIE)
+
 #define I2C_CLK_RATIO	2
 #define CHUNK_DATA	256
 
@@ -133,6 +183,7 @@ struct lpi2c_imx_struct {
 	struct i2c_bus_recovery_info rinfo;
 	bool			can_use_dma;
 	struct lpi2c_imx_dma	*dma;
+	struct i2c_client	*target;
 };
 
 static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx,
@@ -952,9 +1003,57 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 	return (result < 0) ? result : num;
 }
 
-static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
+static irqreturn_t lpi2c_imx_target_isr(struct lpi2c_imx_struct *lpi2c_imx,
+					   u32 ssr, u32 sier_filter)
+{
+	u8 value;
+	u32 sasr;
+
+	/* Arbitration lost */
+	if (sier_filter & SSR_BEF) {
+		writel(0, lpi2c_imx->base + LPI2C_SIER);
+		return IRQ_HANDLED;
+	}
+
+	/* Address detected */
+	if (sier_filter & SSR_AVF) {
+		sasr = readl(lpi2c_imx->base + LPI2C_SASR);
+		if (SASR_READ_REQ & sasr) {
+			/* Read request */
+			i2c_slave_event(lpi2c_imx->target, I2C_SLAVE_READ_REQUESTED, &value);
+			writel(value, lpi2c_imx->base + LPI2C_STDR);
+			goto ret;
+		} else {
+			/* Write request */
+			i2c_slave_event(lpi2c_imx->target, I2C_SLAVE_WRITE_REQUESTED, &value);
+		}
+	}
+
+	if (sier_filter & SSR_SDF) {
+		/* STOP */
+		i2c_slave_event(lpi2c_imx->target, I2C_SLAVE_STOP, &value);
+	}
+
+	if (sier_filter & SSR_TDF) {
+		/* Target send data */
+		i2c_slave_event(lpi2c_imx->target, I2C_SLAVE_READ_PROCESSED, &value);
+		writel(value, lpi2c_imx->base + LPI2C_STDR);
+	}
+
+	if (sier_filter & SSR_RDF) {
+		/* Target receive data */
+		value = readl(lpi2c_imx->base + LPI2C_SRDR);
+		i2c_slave_event(lpi2c_imx->target, I2C_SLAVE_WRITE_RECEIVED, &value);
+	}
+
+ret:
+	/* Clear SSR */
+	writel(ssr & SSR_CLEAR_BITS, lpi2c_imx->base + LPI2C_SSR);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t lpi2c_imx_master_isr(struct lpi2c_imx_struct *lpi2c_imx)
 {
-	struct lpi2c_imx_struct *lpi2c_imx = dev_id;
 	unsigned int enabled;
 	unsigned int temp;
 
@@ -974,6 +1073,119 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = dev_id;
+	u32 ssr, sier_filter;
+	unsigned int scr;
+
+	if (lpi2c_imx->target) {
+		scr = readl(lpi2c_imx->base + LPI2C_SCR);
+		ssr = readl(lpi2c_imx->base + LPI2C_SSR);
+		sier_filter = ssr & readl(lpi2c_imx->base + LPI2C_SIER);
+		if ((scr & SCR_SEN) && sier_filter)
+			return lpi2c_imx_target_isr(lpi2c_imx, ssr, sier_filter);
+		else
+			return lpi2c_imx_master_isr(lpi2c_imx);
+	} else {
+		return lpi2c_imx_master_isr(lpi2c_imx);
+	}
+}
+
+static void lpi2c_imx_target_init(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	int temp;
+
+	/* reset target module */
+	writel(SCR_RST, lpi2c_imx->base + LPI2C_SCR);
+	writel(0, lpi2c_imx->base + LPI2C_SCR);
+
+	/* Set target addr */
+	writel((lpi2c_imx->target->addr << 1), lpi2c_imx->base + LPI2C_SAMR);
+
+	writel(SCFGR1_RXSTALL | SCFGR1_TXDSTALL, lpi2c_imx->base + LPI2C_SCFGR1);
+
+	/*
+	 * set SCFGR2: FILTSDA, FILTSCL and CLKHOLD
+	 *
+	 * FILTSCL/FILTSDA can eliminate signal skew. It should generally be
+	 * set to the same value and should be set >= 50ns.
+	 *
+	 * CLKHOLD is only used when clock stretching is enabled, but it will
+	 * extend the clock stretching to ensure there is an additional delay
+	 * between the target driving SDA and the target releasing the SCL pin.
+	 *
+	 * CLKHOLD setting is crucial for lpi2c target. When master read data
+	 * from target, if there is a delay caused by cpu idle, excessive load,
+	 * or other delays between two bytes in one message transmission. so it
+	 * will cause a short interval time between the driving SDA signal and
+	 * releasing SCL signal. Lpi2c master will mistakenly think it is a stop
+	 * signal resulting in an arbitration failure. This issue can be avoided
+	 * by setting CLKHOLD.
+	 *
+	 * In order to ensure lpi2c function normally when the lpi2c speed is as
+	 * low as 100kHz, CLKHOLD should be set 3 and it is also compatible with
+	 * higher clock frequency like 400kHz and 1MHz.
+	 */
+	temp = SCFGR2_FILTSDA(2) | SCFGR2_FILTSCL(2) | SCFGR2_CLKHOLD(3);
+	writel(temp, lpi2c_imx->base + LPI2C_SCFGR2);
+
+	/*
+	 * Enable module:
+	 * SCR_FILTEN can enable digital filter and output delay counter for LPI2C
+	 * target mode. So SCR_FILTEN need be asserted when enable SDA/SCL FILTER
+	 * and CLKHOLD.
+	 */
+	writel(SCR_SEN | SCR_FILTEN, lpi2c_imx->base + LPI2C_SCR);
+
+	/* Enable interrupt from i2c module */
+	writel(SLAVE_INT_FLAG, lpi2c_imx->base + LPI2C_SIER);
+}
+
+static int lpi2c_imx_reg_target(struct i2c_client *client)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = i2c_get_adapdata(client->adapter);
+	int ret;
+
+	if (lpi2c_imx->target)
+		return -EBUSY;
+
+	lpi2c_imx->target = client;
+
+	ret = pm_runtime_resume_and_get(lpi2c_imx->adapter.dev.parent);
+	if (ret < 0) {
+		dev_err(&lpi2c_imx->adapter.dev, "failed to resume i2c controller");
+		return ret;
+	}
+
+	lpi2c_imx_target_init(lpi2c_imx);
+
+	return 0;
+}
+
+static int lpi2c_imx_unreg_target(struct i2c_client *client)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = i2c_get_adapdata(client->adapter);
+	int ret;
+
+	if (!lpi2c_imx->target)
+		return -EINVAL;
+
+	/* Reset target address. */
+	writel(0, lpi2c_imx->base + LPI2C_SAMR);
+
+	writel(SCR_RST, lpi2c_imx->base + LPI2C_SCR);
+	writel(0, lpi2c_imx->base + LPI2C_SCR);
+
+	lpi2c_imx->target = NULL;
+
+	ret = pm_runtime_put_sync(lpi2c_imx->adapter.dev.parent);
+	if (ret < 0)
+		dev_err(&lpi2c_imx->adapter.dev, "failed to suspend i2c controller");
+
+	return ret;
+}
+
 static int lpi2c_imx_init_recovery_info(struct lpi2c_imx_struct *lpi2c_imx,
 				  struct platform_device *pdev)
 {
@@ -1049,6 +1261,8 @@ static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
 static const struct i2c_algorithm lpi2c_imx_algo = {
 	.master_xfer	= lpi2c_imx_xfer,
 	.functionality	= lpi2c_imx_func,
+	.reg_slave		= lpi2c_imx_reg_target,
+	.unreg_slave	= lpi2c_imx_unreg_target,
 };
 
 static const struct of_device_id lpi2c_imx_of_match[] = {
@@ -1199,9 +1413,40 @@ static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int lpi2c_suspend_noirq(struct device *dev)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int lpi2c_resume_noirq(struct device *dev)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	/*
+	 * If i2c module powered down in system suspend, register
+	 * value will lose. So reinit target when system resume.
+	 */
+	if (lpi2c_imx->target)
+		lpi2c_imx_target_init(lpi2c_imx);
+
+	return 0;
+}
+
 static const struct dev_pm_ops lpi2c_pm_ops = {
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				      pm_runtime_force_resume)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(lpi2c_suspend_noirq,
+				      lpi2c_resume_noirq)
 	SET_RUNTIME_PM_OPS(lpi2c_runtime_suspend,
 			   lpi2c_runtime_resume, NULL)
 };
-- 
2.34.1


