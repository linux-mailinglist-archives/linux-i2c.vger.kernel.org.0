Return-Path: <linux-i2c+bounces-8233-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D6B9DA32D
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 08:36:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AB1A284BF1
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 07:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08EA9153812;
	Wed, 27 Nov 2024 07:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N/smPCD3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2076.outbound.protection.outlook.com [40.107.247.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905881553A7;
	Wed, 27 Nov 2024 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732692981; cv=fail; b=E2BxXuYR7hhXk71mbpeE8fYeoXC15+AgoItgqjJIBBZ0xzfJd+3gfxZtR83AbjvroOTyZLcLd+QB8fMCSE59warQVb0LlrLbMjeGS/9tY5vrQ+QxIqjlvdo21kXR+M7B2mD7vsRGXJNe1dL9Wl6BSRwtL6kRvSBE4VPXDnupWUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732692981; c=relaxed/simple;
	bh=/GkmxgN2x2HcmdV2eRxBTGuz2CiQElI86pATXvEXASY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YtlwFMDmI7rZMLf2MmOnjfO2E0TUynqFTEfKccojQvQJMakJb/wknrCgKKPNngmy53JbilxZ39FXFSd+Gs6teGni2Xd1A4rmVrvjcYqkAbIuTL5fFd7yfbkDqs6N1fS+z2vzjcluWNErRD+R3E6798ArS2U/q9JUErvLM3e4cKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N/smPCD3; arc=fail smtp.client-ip=40.107.247.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwCBzss6qvtEIZPQIDx7EMw4x/Sl7khbIuepZmeVrEfbnjtGD0nKwLQen8HUezTXiY6TYqilbSRvmInhSrjCAIY3eA4JQ9DtD9k9MdabaJ3uLJ864OBhq4gczFmWaDQOeZYqnP4ntAPCpMItvacO82BLqq+1J/rjB0+sZbsO4kyODo0CLflwGCuO+LgkdVCxHIVbe/JZPa75wTS22uVBkXU/AI5NLDyg+RbWvQ8mRp8RAqqNI1NIUzINYAp0QcZG01/ejtseajkXIPhRWrdxqL1I0XGJ7Nri/6fM/KhE9h+p+7IvnvqGBlubPZsLXzh9wDXtoK0HxRIFvT02Uh5EiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByBN8BrOkPzMFGJ3n4z/y6uvKLhJ0B/TDBa89ZBhtGM=;
 b=aP/LATGrauvE66B926OJNQLxccf6ztDo03U/7Nl9+skLBrSetWtCVRzKPQ76IF36qawG587n2F+N8Zo3Q+pEq//dCfoX8LQ0s+3zdqKYTQl3FaObqm9lLmtRxrGPuRu/8DlmCt6gvm5Z5n+soRcZSYMeyqu68JwIRNSvjcZr1EFx39wLg5cV0IQwDWHKWuFEstPR/fhLvzb9qRhQx9CzXPsoGQ9woEiG157J18rYqWr5BT9qNwknYJ96o+8YD/foDMBPkWtm39njKPoUp1Ozo3UQW+TeTanxaliClEr6Vd+5jMY2/nEO8V3YP8sJfL670WSo9dKRTTZRWct7ZeEELQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByBN8BrOkPzMFGJ3n4z/y6uvKLhJ0B/TDBa89ZBhtGM=;
 b=N/smPCD3dZaUVHSCDIhOc/ZYj+RLamtoQSEfbKU/y6S6cUtfJLVNweVO0uZNVNcHV/LXAukFtBrRr3etlXRuX4sfdggDNLSzdBTEkfq4YsgrVV9WirEu65nec0Hi+QxNcds+2SKtVeqfD69wr7FPEqkft9+1LcRSBQPR0nv1i4am/4F3FbeVFeQsX5xX8lIihLMkbn1MtTzznN9fxsiGQN89qqfasx0Ku3XXnO+gT/LIsSDBEffz7WPOmXWcvBmf9y+HbZBEOo9NtlXE/+5VT4J8UxPfNJwYqyZyaGHPGP+GnrAmtoXuY4aUqntQidNqCIencjXVS4roKJ5lOgqwSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Wed, 27 Nov
 2024 07:36:15 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Wed, 27 Nov 2024
 07:36:15 +0000
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
Subject: [PATCH v3] i2c: imx: support DMA defer probing
Date: Wed, 27 Nov 2024 15:44:58 +0800
Message-Id: <20241127074458.2102112-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:196::19) To AM0PR0402MB3937.eurprd04.prod.outlook.com
 (2603:10a6:208:5::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|DU2PR04MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2f76f9-a9ca-43f1-deaa-08dd0eb62c4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nYipz2uSaufNSfFIu0ZykatBT9HCpAEHUVKrRLuaUhFfriSgbe8diJCRDb/O?=
 =?us-ascii?Q?LxLRhXwFI2nWkY/fgTuzXHmDp43Oh5hWSTWBWAXwkC3usEnoRyQfJwIzCDAx?=
 =?us-ascii?Q?1Hrrx/C6z75Hzbkx9/SpSDW/OdtQOTpsNfeWJ551BMp5njKDntmEUlfPNScz?=
 =?us-ascii?Q?va7y+5X1WbRuo1oyCBWKuNV+gqHobkLLjuaKgegDIA7dZ+qz0UtSqrwUHQxB?=
 =?us-ascii?Q?yoEZaniO/9edRjoNWrjS8Qtp6Bk+77OoiOFTHzysyRNqgnGceOz2yTESdpgD?=
 =?us-ascii?Q?Xki7rEZDz+gnohSPPhLYlyniJA2GTSJhRR6Wot8y6nfwpr22Yr94vceJVXou?=
 =?us-ascii?Q?SgJaI13aozUmNg98em+SO5GSLsCBI4eV1ERFJbvGxGvAGlELYysLDLWoFIX+?=
 =?us-ascii?Q?TVMEoBvL1heMUDsxEpc+SFmfVX9Zp55Z8CgI7zFzaXeRph3v4r3a145ih8jn?=
 =?us-ascii?Q?2QVzp7w+6Ys1498wyoWPhzeFniERwcDbvlLqaF7PrREzwramqyVNOc3dulvf?=
 =?us-ascii?Q?9xx95POoyNA5y9Q+kU+BIFlQuUb85vyDfNAaLEQfgih/pmmSZjn8L15cxipn?=
 =?us-ascii?Q?VcueKd/2GpmDHJorqFbOc5tNPAWw4hZ6i17oS0pBKKYX1A2Ug7f3pXLdh8nG?=
 =?us-ascii?Q?nN5Z/FEZEnvy4daAM5Z++31XnvODW+dcsKo+p537R4ljLK619/Dx9FYgDIcF?=
 =?us-ascii?Q?c0CkWPArT0SXXShici6aOFU6KPu7RGoeFaB+2LST5uUdHPWrdxxTceOx7VWV?=
 =?us-ascii?Q?monbLC+9jvWvACxkSqolcM9RKa8rvifPGZ4kSfVRJgyHjA/wUq1JfCry/AaM?=
 =?us-ascii?Q?4QlaGNjhtemsAd1YWl5fKk6JSkObD269ffH93q2qahLfp7KsA07+V8SPciwJ?=
 =?us-ascii?Q?xq5Lsnw2uHWMw397StH/RGOtg3j+vmslWUrIhC2e9/JZi3YAsPF3wREUYLOu?=
 =?us-ascii?Q?esvWJiYOiS9U90PshjQl9VX24W234PYWvTo2cOtAh7ZtjutRvAEc9M4U8m6q?=
 =?us-ascii?Q?xmJ2QaxT5vWzBuc67mrhUwAa9XLB474dQjE+iM20m3TvOrSUpTGXjs/R9+jc?=
 =?us-ascii?Q?0D1RbkDB6wq3LJQ72Wj/6mNBc2W/MbosMZvFK8j435qXd8hsq8t5MJvgZTar?=
 =?us-ascii?Q?/8GybK2I/2eEIzVcGgBreJDTkDu3XVM0uEGJUFv8jUAcHQJEHZ4c52jrQFPZ?=
 =?us-ascii?Q?vzXkmpBEaNwdnZxjQfKtvT7lvPGwJHR3AoD/p1CADL+XgfRKIsDfb0JLf248?=
 =?us-ascii?Q?Bngvw/p/KQ4GrdmieyEVx1WzaF0RT9TaCyniP/3pRJ3f31I63f3cakTIgR+G?=
 =?us-ascii?Q?261M1xGMeLgC3E7ARcEiYeKuaKH4SA1jHgIT6LMvzmGnnAg8V6PW2+hi3Psh?=
 =?us-ascii?Q?8bMREizfM5WTaeI3XIyFApX12hVvX/LvqQwIlyOvQ1ilp79fMQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?emSZ5bnQD1cHdC3F6jruviFD3Fh7lCbjqFUyLyNoSeHX0BNgQ4HS/CAD5pn+?=
 =?us-ascii?Q?4oII/fYUCLiEk3UNc1iIPrdH2ZtlAHXIxTIMnYNkl0VyPb8AVAJzoWq9KtjD?=
 =?us-ascii?Q?ydb4AZ2WOdM5QRTzLrW7P4jJgehRQbDOsXmxgw4Ij1KH/NC+ZELG2OHc0jqc?=
 =?us-ascii?Q?E6lc5z4YFpEOHnaMUb5dnlLsTY8AKVmtSGZzUMklojhPVodbn94o5pjeVoXp?=
 =?us-ascii?Q?atlNs60M1lCPFBfH3VKU2t/X9ku0q8pSbUTzv42A9NA0uYXRDxkO4ZddDON+?=
 =?us-ascii?Q?eiLtN1eiBUElmvFUMk/jPJs6L8OGOn0aGzQHINywKwTfMM4OcfpBp6Jd4to6?=
 =?us-ascii?Q?9x45JeEKKXmZjtI54EFXlrvXAiTpdag91DreQ5Lbf4FxMsG5WQPIOTFpYdyU?=
 =?us-ascii?Q?dBmLtEP52ii44IO8w7941rqBmyFBZVN6psqb7MTsbY7jNLXPzW99CZ0/fjv4?=
 =?us-ascii?Q?N1piMebFi2uXtyFUyLUtsm4r2SnrlGyhCjTLn+EgAWVnNzl4FOA/Om06uy/a?=
 =?us-ascii?Q?VtN2EevCiQAMUrMVdrvBpuOwyloFOtT2CVUjOfWpljzAZ9R5oSDFGkhIXl8o?=
 =?us-ascii?Q?7dLAImJ4q4A8IFBZKsyq7+ydKREMsNC9fSevo6+cgRwmrqfbKj4Uz5CV4VlT?=
 =?us-ascii?Q?zU/E0psFwVHKRF/SacoMpfVLqcPHUZ8baEQHUHi32OTr7z9lRHFSXqT4rlwU?=
 =?us-ascii?Q?m5TVsCEwTHG76KBmVaWr0wyFwUQkxH7jvz1zADN3XINwrKKVeECCGyfVzXFq?=
 =?us-ascii?Q?UhBAZp23qkQyoFVX3Cey+l3dw9zw7StSRTB3esz3uc+sA0h3R0CLH81LSSCr?=
 =?us-ascii?Q?ltC86kpXewxgNWwZpx3gfEa8oeNSJB/Sjn6iheWWgti9kagGTivaURsaF/hN?=
 =?us-ascii?Q?lbjDx2aF0/95+KdNjwVqCsq3IFmO2CFf57YuF+2g8xbJu0e2r6QPxEGpir3Z?=
 =?us-ascii?Q?oVzNUzLSA+q0fDM/OS2uMBMP3d/ihtAffR7gR67BxDB5+qv0Ju1QWcEfgtxD?=
 =?us-ascii?Q?7j2+Yoqk+QjEH6cMp2/ir8x5Fa/uS57rjdK+JqvG3pN/YYxZ201QRu0BCxCB?=
 =?us-ascii?Q?kjzttqP1Sh963WLqvyx7xN5bXfeiq5irlixAdOI0xj18BqfJ8i+1RosrZfuC?=
 =?us-ascii?Q?RHr3YJ4Wxt6FkwnrLEfZDw6pY//AXoc8lnLtqiqoX67kk0eLc6ZBoHhvQA7u?=
 =?us-ascii?Q?LNcuTQBn7M8FV7dfXlbwetg2NKIbQB+241edv1geY3CQKIg2n0QmK+PvD+RO?=
 =?us-ascii?Q?PPKQ7itB5QASGISznw/+QsUJ1p5OOv3/qqHAwxFYGEIzfXjZ4JE/Gj+1Db75?=
 =?us-ascii?Q?euxYoWBf1f6i6GNenY9ojUeu09+lLE7sqQS3511KwKXhEeLnO6TOxDg+nHkP?=
 =?us-ascii?Q?qNgdVX6QBAekIN+1yt963soAwwoO2teENeajzWnjjLWPdfERD1HPkB5jTINU?=
 =?us-ascii?Q?aYaV9Aunrye75lBxwy2fCP4AUe1ktlLprLxu6gePZC6XAN8sVnL83dVqYKHo?=
 =?us-ascii?Q?vUBap9EoaG131+BIPX9RcGLVzlgIf05BKcIbb+hX++LNDIWyNhM3AqmPI5hA?=
 =?us-ascii?Q?hKMxVjgtGilXxgkLP8lSWos9bLcY+Ws1ZQzNxjFG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2f76f9-a9ca-43f1-deaa-08dd0eb62c4f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 07:36:14.9381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6tk9N+KEhphhEjWoxNaxiBqm+nf85IJ/q74SAhfY6FPwcnt8KZBs5n9ROJL0w1ZJoxY4uYT4UJU8qdEXHfgUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9081

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
index 5ed4cb61e262..47112a38d034 100644
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
+			dev_info(&pdev->dev, "Only use PIO mode\n");
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


