Return-Path: <linux-i2c+bounces-8240-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6409DA3ED
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 09:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21324B226C7
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 08:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F44E186E46;
	Wed, 27 Nov 2024 08:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jv7xoii6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C197A1865E9;
	Wed, 27 Nov 2024 08:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732696180; cv=fail; b=rBNk2dpEgbVKmhinO7PZSkeX18vhCJ0yJZkc8CoemkzJ6O3Nb/i9SCFFqa1fFaToJpM61MqOaZZKScY2ASvTBU8+ee2YJjYahBU7pndZwj0XtDLHWzJdfEQxothUXsyfRqYuJEWEHVD4eH1RtEwAdGGS93irh11nzWtdKmlsReA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732696180; c=relaxed/simple;
	bh=+wtVIAvBGHIHyeWX2GGZRxSm1ge5TeaUP6+hXEsG/fg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=u1+3PQJnZ+gC/3yLEixu15/kI3u4pcC9ycCVlnyJiQITWfpn4H4Xu6UEj66fyjPzB8h9k0rr+4NqUra5aqCtFE4Lyo+SyUEFieLO1lahl+vUnWSGkM+zmPz96Ihob3HVnz12OxqsAf7Tvj8OJGnF9wEt2pgRaEuR7js28s32cZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jv7xoii6; arc=fail smtp.client-ip=40.107.21.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJbjsLw0cKfbuaqEbABtncSl+4pEK6w5GyU2eI26PcK05fa+k3G6cDOUpptRoGC67m2lVVegIP+cEInubXG5G2HAhGCLuv4hVkq3NSu5MOCdsBMRNbqHPExcs3DS1LLmamQ3264OHFGEEEjY3D6o5vWnOcEzatXrJdHGYQWfDDLGyNx3UFZnBGJcnttzWGjONMuDruwt5NHC7E8m8SkMZCAmsnMBDvv/GQqyq5KubOWZbwf5cEk/9a4fdcmddcP1NhL2veLZ1PqixLmwFIRIy+rbnLRI4pbFZmYi4vcswhFOdLwngebNyNI3i50ivZiCEYZhg4ulaZ1LEehZudzO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2klUdBFSAfSWXI7qfPvmxcGEhG1BdT3HM1jmzBV5hs=;
 b=owJRkbR+e/NRHA13euLqFwTq7xNPUTupYZ08QTu/PrW4ybMD2o1jp1Vkh4CRHibbuXPzdUJH/GNezcNN4oCNRQOUKsCcUe0gt0eosOvaj4tCh1Lu+DfCOwDbPM8PKV8M8YPT+AL9EsHphIKRoujTtAl0NVY/7FLG4Qkxwufk5x7Yu+r9zpngRuSM8H54AlgVc9sUhS62FCtvLp7TbvzE5XYiAKIDITf63UWw9MS6AQTzTuTJQE/ctsQt4VpjpE1fOi75OJoFTVBzG6GFAa56gLF/6qzfPBY3rzSXbBis8qs6IIOlHEbj4AgMpbWPb0g9/OM+MqJP7gO8eTZOU4vw6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2klUdBFSAfSWXI7qfPvmxcGEhG1BdT3HM1jmzBV5hs=;
 b=jv7xoii6bdmO6j4GWaEdeXGfo4Pa41QuH6+hLwMspjV3VAkwG4I1fdxkdb78sU5fR6t+AI8DfzH5tWJnkL2g8xUfsx0iqaKTM2LnUeh9Pi8QAx08HI81nlXdOMotTAHAJ5RPI4AjsNOHPKnMwu/BCzIkhtQfS7Heo030WBcL5uZVsUxvJekGmTVnY2r/zPhu0hPAOuMXEAe0njb+pO7pjFK1E+536Gm7mD4D0ZBtaLcerBW65HqupeA4scEfwTR93sC6TlwbQa0FAbJhUKgeBGeVuhZ/FBvkFIwEo2VUP/fHaAt/tpeyIAEXa098KFR6GTLuIUF4KGlIDnxelYkhnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by PR3PR04MB7227.eurprd04.prod.outlook.com (2603:10a6:102:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Wed, 27 Nov
 2024 08:29:34 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Wed, 27 Nov 2024
 08:29:34 +0000
From: carlos.song@nxp.com
To: mkl@pengutronix.de,
	frank.li@nxp.com,
	o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] i2c: imx: support DMA defer probing
Date: Wed, 27 Nov 2024 16:38:18 +0800
Message-Id: <20241127083818.2108201-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::21)
 To AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|PR3PR04MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: 56169ea9-09ae-4ead-711c-08dd0ebd9ecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JwYUQUAUBIFAvbqMnF1eP+xZ4IqhiGim/ba+WQESlYGP/QMzMkku70e6qJiV?=
 =?us-ascii?Q?x23EC0dEU6lcyhgZ/GqE2yG56w5ghiUVorWYKUnkbEQNoUHjTdK1o8dv9lIx?=
 =?us-ascii?Q?c0uQF1hAruEsF1iUkjpWzPJV7KFH0d/r3zjuWk7WQhsD/DnhiCSLkPdRHgHd?=
 =?us-ascii?Q?506ZYMR7M6m5EXyB+WTu359iVOy5iuwFRgd0zlLDjnZlDogdth8sFK2R6Y1x?=
 =?us-ascii?Q?g+YyhEdhZXaG8c0MNJ3Y+ty8XnvERMAuzbh0Pd+XXhYRg4W6Y7Ny9DlAazhv?=
 =?us-ascii?Q?4n/GHtrrSde1yveFI01Vl4lMGoHNFPu6Jpit3KecskfdtdsaV6D4KXqXG7QV?=
 =?us-ascii?Q?VPtM3YkTlHt90+CMu36D+j9BdBd2SKwDril+aJTPzpoE3bWKoDQY5vpuNiFT?=
 =?us-ascii?Q?Kef9PHNLKzDcO928Xhk37aVq2NdDrr1UV2IjS1pwDeuAZQG6SpEOuqapCGGk?=
 =?us-ascii?Q?iqKgjQyRmKZrJiTG/EshhFJbObMHdV4hXkrwAvOqMiF6pPlqDIwP8QXo2H7a?=
 =?us-ascii?Q?kYDxIYSB1npEDzUg+fW17tVelnn1vlFLrXM8whZbRxUgnFLb/RYbb7Lwrf8V?=
 =?us-ascii?Q?6B1TX8h3br2wj0CAD2cNysN+Zt2OUVTBqkjiOwnqI4bIIclv2eK3AZ0dnAEX?=
 =?us-ascii?Q?QD1b/f6oY+ln6sbJ8tjOv7qsJYvrBvKb0wB3hBWcFq+FCus0Y45IJ4rtE0IF?=
 =?us-ascii?Q?5rzO2kCIyAVy+eQOfkAywMzBx+nMEe4cz3NCA37TXodxRX84LiE+8oX8Vl+5?=
 =?us-ascii?Q?XwiHxv5aXCuCSFNn24Zpx3zbehwdy6tgkgG9fx41yDPxrgDySw9eBvC++XCd?=
 =?us-ascii?Q?rbmJXoVZubfIgU7dNKIVlMCDFpdVsjfqD0GosyVOOCey3/lE/ao3pNoYeoJC?=
 =?us-ascii?Q?p2dpHvkGOy9pZBTnac+cn1jH8jP2yXe+E4u4ewoEYZ3wNjwteRyNkR8Errao?=
 =?us-ascii?Q?psTWbRnknEpwEkmoXW0L/Wud0JMXIg0UHUVVeT2jobiTGIHMK9OgpDHpFspI?=
 =?us-ascii?Q?OD54YP64jhtTd9cO3Ijcoj2LY7qTD1E4LUc5NN71QZ4S4QTThKEZu89hY7yV?=
 =?us-ascii?Q?lyJZwxleBnqwfMi6u65b71+YfH92qmXXVmuOgLQJREFMOxwg79iz3NO782br?=
 =?us-ascii?Q?Wbr4KZjr3XLpv2WQlbf6rMT1AkVJqfWmYAV1L4B8ARjtDeTTKRATEZb5UERp?=
 =?us-ascii?Q?LTVSLNkbnkPiqD4ddU9Pj2UZV2SlK3pceBNHdwIdKIay9ZYukm+2sU9JOB6P?=
 =?us-ascii?Q?CQvhApwQ3cCgo84um9Zel77bzEqSUSTIz9uKXPlL3puMznBj7XzWorRCvQby?=
 =?us-ascii?Q?pF95qP6LmXyRNoFGy8RtxRPpwdAKbVeAEy7RBqUIxDtswZJ6q/9Z3mz5GnaO?=
 =?us-ascii?Q?T17QBF3vfyIoKgY3HwzqIpz9fmXjUcaCksP5M1FNG2E9ZBmvIQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JNOdaxHBM3jWIwPBWBV1tQxu2THnVMVXS0hCrejrJ11XzhuNowUUy5gNdlnT?=
 =?us-ascii?Q?xKp3NDklrj1QYUTmw2yPveHBMil9ky0eRlgtr3LfPD/AE2vaiYWk/iCZKVBN?=
 =?us-ascii?Q?4c13y3lhKJzjRbMiA1kjLcaWDhsdWdpP0/NUpWbgAV0BoTBZMMPzVmeioazq?=
 =?us-ascii?Q?c1EfyL4uNc7+XSaH+K4xa6sOZd0TGrlW8CrWGTNVwZpZzuXXKJK0oycM+mDo?=
 =?us-ascii?Q?VfuJmKS7ZuUpQPaAXO9a16r5qCVKhuFbo9oSbQ567aw0ygel/WHB854XeG2E?=
 =?us-ascii?Q?/7aTgabECxMvv8qEhtgDVUos/2DBek5B7lLbw6yGAM40Vf9HAdF6NJ42R3vz?=
 =?us-ascii?Q?6/qIzIgIZgWvXZ9YOv28D77t5suPFO8UQAGx10VD8pDIz34hpOZbdavSDlXd?=
 =?us-ascii?Q?Hkn/kGbVWCYkjoMpesM+7GoFEsctgGcvQQ9UxaN3uUtzYysHpE20UcwZBfXm?=
 =?us-ascii?Q?wr3Azpz9oWJkNPV2IfTlLfBBtSU5XWmT2cshWC+TPz9R6g9fHJAVNenqxXNf?=
 =?us-ascii?Q?vIwOUW1futS8kX1GxBLww8aure3BTkG5OBeByCnNNK5xdGLqWJ8DTXZM82vG?=
 =?us-ascii?Q?cIbZp5ugvLMUv6xGaOxmRXUzsKKwXDgYEyp0cgw0BtAaUCnRaq59up3C6Bi5?=
 =?us-ascii?Q?exhsy4apNqZlU3PAJvhwBmSY6/RXveLHYjMlH6a3NpTqKX+WTB30WaXqLXsA?=
 =?us-ascii?Q?3Ulbb1rczYqyNMwz36Ksc8Gzl9RHKC1o2qqrBVAzbPj6kw5KxgeZy3d5ncJs?=
 =?us-ascii?Q?XjO6GG1z1+Kb/zIG3UDBwMpDyZh3bKznKaGqXJq29tiyczW5tQrILr/dIEju?=
 =?us-ascii?Q?Ko7Mgxlo1pA1InZqu+wzbrPTBvv3ubDsSWJvm4UVTB1y5D5btggGP22tCtWx?=
 =?us-ascii?Q?qnTsJmpxILfOcaDuhZjI8eG7owxNx1SKVZJcvVnD/ZIWYaxJiMl+tNQvK7kY?=
 =?us-ascii?Q?0+u7mmc7IzecUYFWPjpsfQ1skAbU8WAa6BlnJHMgCJPgIP7AGkjpfdMd+G2h?=
 =?us-ascii?Q?RUTNCyABbxPgnIrOLFV+ml3glGLxkH4sXBqaSk0Y46s4+m7SZdOdW4gtK7ll?=
 =?us-ascii?Q?+li4FDWIEfDAaDS7j85wvyRJzL+UMucQQJ7ZQawciCXCXUFS4OhZ8ZrPJCtM?=
 =?us-ascii?Q?q3BY3phBSYehkq2wnkUkM1YFFAR3zco3odOzMUd9AkiruZE1AWv6grxGnVWF?=
 =?us-ascii?Q?PLCbvEPXB8rtaRtlRhlfSHxeP6ZpZtNSbu+rrkWpBll3hSBgc/cxvtJIDuXA?=
 =?us-ascii?Q?KGtNNWDhJk3jtgQABIShV3W5O6nyJgHnFkYnRxFUjZ6bXoKaJunqkh3rBwO+?=
 =?us-ascii?Q?knZrl8x8vVRO5ska4MJ1sxe4R/aiKJzxD8KjXx/8OIcRwz10nCtr06kV7WH3?=
 =?us-ascii?Q?KrJriOZJEZJPr/weajCN3ACnxzj9ah5SD7avP2TLKqxA3XAh8KiIaJ5W+bQD?=
 =?us-ascii?Q?WA5B1ly0n7e7x8kCjn/f7KwgPEHYdnv9g1ZxxaXiwt5rudGSXjk5Ab3NjZ56?=
 =?us-ascii?Q?ZaGjZGQfBZofUo5hhz6P+z7a8knVU3eVLQdBGzwRDNStfPZg+ALY5GkNBMV0?=
 =?us-ascii?Q?w6Yv/1O+xiggbMikpir8MamUCKAqAQlK5g+uDWNU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56169ea9-09ae-4ead-711c-08dd0ebd9ecf
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 08:29:34.4392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IyrB9XpM4iJVwnDKpUFZFfTiHmxJPt9SHawFkIYV8ZQ0gALvgceilQcb+jEyQfPqEJy4TrlSUVBnhoXXsOD+pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7227

From: Carlos Song <carlos.song@nxp.com>

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
---
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
 drivers/i2c/busses/i2c-imx.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 5ed4cb61e262..b11d66d56c55 100644
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
@@ -1803,6 +1804,23 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	if (ret == -EPROBE_DEFER)
 		goto clk_notifier_unregister;
 
+	/*
+	 * Init DMA config if supported, -ENODEV means DMA not enabled at
+	 * this platform, that is not a real error, so just remind "only
+	 * PIO mode is used". If DMA is enabled, but meet error when request
+	 * DMA channel, error should be showed in probe error log. PIO mode
+	 * should be available regardless of DMA.
+	 */
+	ret = i2c_imx_dma_request(i2c_imx, phy_addr);
+	if (ret) {
+		if (ret == -EPROBE_DEFER)
+			goto clk_notifier_unregister;
+		else if (ret == -ENODEV)
+			dev_dbg(&pdev->dev, "Only use PIO mode\n");
+		else
+			dev_err_probe(&pdev->dev, ret, "Failed to setup DMA, only use PIO mode\n");
+	}
+
 	/* Add I2C adapter */
 	ret = i2c_add_numbered_adapter(&i2c_imx->adapter);
 	if (ret < 0)
@@ -1817,9 +1835,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		i2c_imx->adapter.name);
 	dev_info(&i2c_imx->adapter.dev, "IMX I2C adapter registered\n");
 
-	/* Init DMA config if supported */
-	i2c_imx_dma_request(i2c_imx, phy_addr);
-
 	return 0;   /* Return OK */
 
 clk_notifier_unregister:
-- 
2.34.1


