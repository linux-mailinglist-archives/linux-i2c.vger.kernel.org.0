Return-Path: <linux-i2c+bounces-5903-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBFD963FD8
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 11:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EFD71C21249
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6C018CC16;
	Thu, 29 Aug 2024 09:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BbVYjGMv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEB0189F5C;
	Thu, 29 Aug 2024 09:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923378; cv=fail; b=WdPEHKXhWdTDL9cHq2/9+GCPG/OkhjXAEW6BR5lz6D9VEv+TlCLG+d6JljcBoWfqS1lUnZCikmM4Cwpe+B1jEuvLIuUIUIahc2dgmlc11L1b27sOl8kS7LOLpxD0fmqVUdpOegTlcuZIHbT5SNCKE7etgtwSKXcKZVUhpcSbQ14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923378; c=relaxed/simple;
	bh=LQq+C8j37KVTRnSKe3p76knRPH5BY3X9qMIC9j9tb0c=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=feH3arK8i6vCNEsNHojCNY0naKcgx46GewiT2jCyyZ/gieb/CdPkXA0vMxh46qG0PtDfL3jBpfvtAcLhStsfErElyRlKR5RrPq7rwjUjvE9UlgUbHaC5yh5Apws5Oq7kbVSPg/+NfQZ0MEK5XME646ColwLVwj+nCVfbErjUz+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BbVYjGMv; arc=fail smtp.client-ip=40.107.22.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJEI4LSiCx1xtlzGziwvjOknjxnHg0CY+NM2h+aVASP54nk9Af6/eUafVvxtnx7hXuAN3mNN7a6q/vgM6l1nI+1ivNWJsv/6DvkQbzdErtBvcvWOuC8Kfl66vjeNoq2mZfI54refWenPda73bk2Z2x/FquAFJuvGiJBaZcqfuVtmJluAqkOYlfEyoPfQRM06R/z+Zw6QXpYKtjNl4YUpLQA6SN8axNH7t04O5wFKljzxuCG1atJWoMkYzaryLoOhcygS9PFr3wtVbmLpmI7NIVCCOIw9vY529Y9IspqbBoEnN71eU1lzq/Bir+ZbuMifcaJYHgFr8l675w8VQEb0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcN7TTfY7iQQI2h+/1W+RySg64mC/hQ8II+4u8/4dxk=;
 b=OIOWyZtpfRkZbqddDRsZkcFmsqzeQiJTBjolhlbsPpIXkFj1J9+iQ4xps2sbQgD7GM+EQO3eY8Cn7jSSdTdujWh1y4FNaRXK4F3TRAcBIReWJBXSA6/TvVBsY8HTwmIcnaO/ktQbzNGQ6D/tnqeIowMqZhljOJ4AC5RjVgEvVH3HK80AnREHynW2OZ4DAbMbi84mD+qXqQHU41ronLRuVsryOdQLLK8IBw1ebOvJDkIQfi0ffIjuiQHamHu3lzH8WJTmim+Y72M1wXZZ8RhFwm1ne0zc1v59UDgNf51NAvPxo4DsBkzYY7ypoJnVvQBqS7LKtzwBG2B2lDjLNdnD8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcN7TTfY7iQQI2h+/1W+RySg64mC/hQ8II+4u8/4dxk=;
 b=BbVYjGMvWeT7CLielatmXdM+PApLp8jKVaxD+BtaEkp7mLgS/Dcir+L2eXFbRtuEReoVP59nnGjgL5khWs1qR+sgkooRpHV0fDvQI4ynYaFDP0a7VdxVUJFhUYie5B5BC1Ctyy7gAMYq62W6iQzcf94Yvj44bT2PbIieulb02UwzgNLgH2a8sQGR+YgBc60lccoz4pVWeB/1xrk3R4KDtubj9VeRey5xWcicHvj/CirUcsMJ4fXtXEwPTU7h+geLsU4gomiwjk9/KksoOLa6lnf6jv2vlljFYwgSO3gz1YMNLROZnIns0FDdJsjsQSTLQfY0NBGdsPNSYqDE2pJsqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by DBBPR04MB7625.eurprd04.prod.outlook.com (2603:10a6:10:202::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 09:22:50 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb%4]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 09:22:50 +0000
From: Carlos Song <carlos.song@nxp.com>
To: aisheng.dong@nxp.com,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Carlos Song <carlos.song@nxp.com>,
	Frank Li <frank.li@nxp.com>
Subject: [PATCH V4] i2c: imx-lpi2c: add eDMA mode support for LPI2C
Date: Thu, 29 Aug 2024 17:31:57 +0800
Message-Id: <20240829093157.2714736-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P195CA0005.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::10) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|DBBPR04MB7625:EE_
X-MS-Office365-Filtering-Correlation-Id: 004aed5e-f43a-408f-c108-08dcc80c2698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ico4zhJbZ9mGDTpJhg/a/l0i8tqxxvGA6Eqf+jyNrp6hPPF7MpC4YY4IP8Lz?=
 =?us-ascii?Q?nLGH79ZNP8kuWfySVyQgl6YTdQQnibSQvUtpQorIEl8q4Pqurr3CKzfsTACn?=
 =?us-ascii?Q?BM7BsJdlPjUauE52RB2peMjF1mpqd8aekU/RPaXqwYsoq+4TB2NO/krxnJat?=
 =?us-ascii?Q?4cNtB8DrsI5AMbXLytDiJPflxjS5oBnFPv8NGsdjnOP/2Nj8n1cFUGkY5/gY?=
 =?us-ascii?Q?UI4RcCJLPdipwRd5LHFwWfstIgXQujc/G8gNPW58pXLuy5B/jHibODy1zqmH?=
 =?us-ascii?Q?AUF7cnMd8jWykngz3dDi4YruxAGoHOnk9qK7AGi7UDeyRpR/cslr0EzbhyL2?=
 =?us-ascii?Q?s1NW1UHSjqBC03iTbyuDb6/8wpAdrdJDpVPwQd01k/OIxuExNMPOCGT7JZjO?=
 =?us-ascii?Q?qlPasTJ/68WgGR1WWN7l5yb3qb5CRmac2OjZ0+TgemmBf45ARk/P9S/vh3LA?=
 =?us-ascii?Q?aCuBDH9kMUEbSHiN/KxzXt+1IATBn+fbv0o7ET74k2zT6j9wY3r5dQHK0pdU?=
 =?us-ascii?Q?l4gIBb3CfqLVYSo5HzDr63yws3qEjDIqf+6eCrhzdClvDA61vZ6xcfia2zEK?=
 =?us-ascii?Q?T9bfrxgRv+0m/bNhIv8DYQnS0PMPXFCs0fy3+qLfRW1fwYBdrsKYp9UXzvdf?=
 =?us-ascii?Q?X8k6FQrq8AFP/X9ZYh/ZrWKGOG5tbaauqttMWDIjG7whlzAjr86r8Uh0ZJqq?=
 =?us-ascii?Q?sp2KEYaQY2VK7bIRw86y5xaKrhks+tqYXd8mcILWvsKObYK7GQN8PcIkH8LH?=
 =?us-ascii?Q?NxYa0ACy/NuYVjkD9tfXhCp4gl9kkO+aWfnhicjI0W7AfWiDjyHeSxKUZnc5?=
 =?us-ascii?Q?PPc35tB40UU3k9R/g6u55hpy+vYOTsF/8zLqXrpRoa33nE6ysAABd2yRuHCh?=
 =?us-ascii?Q?+6g44ptSa/QY5joutLnfOV1u6VhqKYwqCCcDofsY5BNnZhoIa4uhB0dqhUmC?=
 =?us-ascii?Q?mwjQ8rOBqBwMlEToAcB49+oo5YpETkFV3YIU49d8AixScyn4Qu1+VImza3Nd?=
 =?us-ascii?Q?JE/Uozf9utTtbKXxxILbhkkV7BXNfI+2HbgFss1T/09UZ5x4A158VPF549iU?=
 =?us-ascii?Q?F/POFrCZQ56HnUgtHaqIIEMIYU/AUTF7wkGRa6tDP/S7Yr/Ewpv1wxFszQqO?=
 =?us-ascii?Q?uvffXrU3OQuBFD89vvPwZmKCu6eDhjNaABq8hC3+ILDdPm9+TVax2VMBldX2?=
 =?us-ascii?Q?HNJUH6yHSAqs/NYooi8WYgaGSuZunHNtDpXDVNCbJQQEpbsefB8HWy36LKeW?=
 =?us-ascii?Q?nMCpxeFHv3IWwYuGQX8vOdPNJs31k5bn4Cv6I3dGTxaPPEZO/oFagFtkP7Py?=
 =?us-ascii?Q?mFkoeYHvwVGY4noykBJ+2ofkhKHi2w2iTe1XvRvS/b6vHvvBRCx09QL5OqUF?=
 =?us-ascii?Q?P0oQG0aghwYEIQpsCBGkFuiazbacvsiVvSzqT8Cd2GF+4BzqmQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u+NkECrJGxhuhTdPNsfNKLzrOEf0BX/HrDbX4D5v8MtfqtD7X67q8PF5CzqW?=
 =?us-ascii?Q?7PkD8J/EHYLGbTvJlpEjXSp57q5AAcuxR6W2f7yy0BEemD3p4cP6O8SWx4jR?=
 =?us-ascii?Q?Ni58qk/YkapzEnnGwpT5/7GdFYqhyCD/6wAat4+E66QYgTyycE2tq3Erwy1y?=
 =?us-ascii?Q?B8K/Hb2lMbg1cezegG/W+jjn6veYxkG+0mgIKHdMqgAOuao1RUV/qndB0+po?=
 =?us-ascii?Q?x3eG/QLg/M0gbRNA2ZgngOQgrnhKv8yjkeLcHc7DjN2uNnaf1bbiQlu9dZ4+?=
 =?us-ascii?Q?AvM0x9QDmFBQTst6O6J91nysavStzGidfuhuZvKhyHNyZmtHTk4iZpF1bT81?=
 =?us-ascii?Q?HJ/7A9ZmmgF+iLcq4aXAtihfcxs22EdxjW878nJmvNHS8cClJ0ATMHoXYyiZ?=
 =?us-ascii?Q?jZPCBUe1fsVSnYGi7qUsKDWukjEy9Wxh25C+x6YDtn+ZN6m2IuwCFBlORdMM?=
 =?us-ascii?Q?BCAoZdh5STTBlQh+1m4halK3ghsXide6OBrUQhyzcuyQeqh0XxJPvFojD2iv?=
 =?us-ascii?Q?Ijf4tMcSGatih4mQ3GZsPeb+6mr9d4L69+bVvcaxR3Pg8/2N8Gv/ZDxlIjPp?=
 =?us-ascii?Q?wc5w3LH2Qsu3w2jCn3Cuv3R9pF1BtjuXxMb/UdxuDoDn3KwIKm8xNBJny6SE?=
 =?us-ascii?Q?k8qnrY4pHAuAS3Qwa5W3oX8wipKMu/sez05zKZsFI33WOtBKLnz2B4u+mc4G?=
 =?us-ascii?Q?UmslnuIOixrcMw2t5sxOos/08On6jbxIHl0GS4JQ2GPY/aohSc3w2KVNlvLy?=
 =?us-ascii?Q?VOXzvPoNiVNsHsgdQxz5a2VV9jFrh35yORAhQa4yE5JMbyKah3DrPzDxvwsB?=
 =?us-ascii?Q?iDT/YwrZmoRz1rBAqHEC2y/EQpHnzuvbGasSqXdeFhEcvqnJEjCPgF9O0/Os?=
 =?us-ascii?Q?QSX8xysaqGfEBVuV+i+AkKxoGm1TeEaiTxmndKkK/v5HF5if1lSPGBtA0EwJ?=
 =?us-ascii?Q?gIHiUYVWJky65361ByWVXYui6HSF/USBDiA1PRly89vJyZ2/320sZ2ePSH8z?=
 =?us-ascii?Q?EBXaXC20GoPUrZGCMrtbFE+1cN6jXIyF1gm+0y9fXO1LodDoBPAxYcQmTC7Q?=
 =?us-ascii?Q?8AdHwwOksp5EH9gtAbT+dgc9nQkW2w6HDNuI+pmwb7qBoizMw+2deXX1TJgN?=
 =?us-ascii?Q?3i+qJ/+avRKCZHp6Bq8SFS3Rlw9bULYacAVObu1jVe8j29p4+SJphtWltKKN?=
 =?us-ascii?Q?0pAb63rb3K1eHaRC0lvuVMQ3kVrXndlnHR83KV+qSfKZ0+6NAvf3fpmnFRrN?=
 =?us-ascii?Q?zLbRyYWdbE8ZexNs5nIfWFwA2tWMScBvD8JX2ZhJNtO1BKJyZnRd4BCVgrxw?=
 =?us-ascii?Q?E08WrbpmQD1Gboq2jRF2S3esAJxFLUNwezUAUKuT1nJHra/TzvlQV4ME0ouU?=
 =?us-ascii?Q?wwJ/YE3lpkIxmwfqSVM6C6CXQ7pZAwzuDqmLQRnK7pzUu4NNQwSw6ew/yrn8?=
 =?us-ascii?Q?mmLgFboJ0cDfDg+sVz10iuGTjnrQpxW0HvSg4L0MXJviXA4GHGincxIp13SB?=
 =?us-ascii?Q?+dbA+HOyljS3T13aUC0X84bck/cNgZnafCkZSjIVbEaBMzWeUzxcItFkk1l5?=
 =?us-ascii?Q?XcSsSyzrnD+CwX1Meb8rJFe2mReYE/G3jSmLDp7b?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 004aed5e-f43a-408f-c108-08dcc80c2698
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 09:22:50.6151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARBs9CDpuLa5EAX0PWYddt19DfBdKhLuB3KcN6ZVp9RvRiRYKFf7S5TscSEdUt7VreQHB2tVGN6i34Ha23XL0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7625

Add eDMA mode support for LPI2C.

There are some differences between TX DMA mode and RX DMA mode.
LPI2C MTDR register is Controller Transmit Data Register.
When lpi2c send data, it is tx cmd register and tx data fifo.
When lpi2c receive data, it is just a rx cmd register. LPI2C MRDR
register is Controller Receive Data Register, received data are
stored in this.

MTDR[8:10] is CMD field and MTDR[0:7] is DATA filed.
+-----------+-------------------------------+
|  C  M  D  |          D  A  T  A           |
+---+---+---+---+---+---+---+---+---+---+---+
| 10| 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
+---+---+---+---+---+---+---+---+---+---+---+

MRDR is Controller Receive Data Register.
MRDR[0:7] is DATA filed.
+-------------------------------+
|          D  A  T  A           |
+---+---+---+---+---+---+---+---+
| 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
+---+---+---+---+---+---+---+---+

When the LPI2C controller needs to send data, tx cmd and 8-bit data
should be written into MTDR:
CMD: 000b: Transmit the value in DATA[7:0].
DATA: 8-bit data.

If lpi2c controller needs to send N 8-bit data, just write N times
(CMD(W) + DATA(u8)) to MTDR.

When the LPI2C controller needs to receive data, rx cmd should be
written into MTDR, the received data will be stored in the MRDR.

MTDR(CMD): 001b: Receive (DATA[7:0] + 1) 8-bit data.
MTDR(DATA): byte counter.
MRDR(DATA): 8-bit data.

So when lpi2c controller needs to receive N 8-bit data,
1. N <= 256:
Write 1 time (CMD(R) + BYTE COUNT(N-1)) into MTDR and receive data from
MRDR.
2. N > 256:
Write N/256 times (CMD(R) + BYTE COUNT(255)) + 1 time (CMD(R) + BYTE
COUNT(N%256)) into MTDR and receive data from MRDR.

Due to these differences, when lpi2c is in DMA TX mode, only enable TX
channel to send data. But when lpi2c is in DMA RX mode, TX and RX channel
are both enabled, TX channel is used to send RX cmd and RX channel is
used to receive data.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Frank Li <frank.li@nxp.com>
---
Change for V4:
- According Aisheng's suggestion, fix code for improving readability.
- Add dma struct, when dma resource not ready not alloc dma resources.
Change for V3:
- Optimize DMA timeout calculate function names and variables avoid confusing
Change for V2:
- Optimized eDMA rx cmd buf free function to improve code readability
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 519 ++++++++++++++++++++++++++++-
 1 file changed, 512 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 976d43f73f38..530ca5d76403 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -8,6 +8,8 @@
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
+#include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
@@ -29,6 +31,7 @@
 #define LPI2C_MCR	0x10	/* i2c contrl register */
 #define LPI2C_MSR	0x14	/* i2c status register */
 #define LPI2C_MIER	0x18	/* i2c interrupt enable */
+#define LPI2C_MDER	0x1C	/* i2c DMA enable */
 #define LPI2C_MCFGR0	0x20	/* i2c master configuration */
 #define LPI2C_MCFGR1	0x24	/* i2c master configuration */
 #define LPI2C_MCFGR2	0x28	/* i2c master configuration */
@@ -70,11 +73,14 @@
 #define MCFGR1_AUTOSTOP	BIT(8)
 #define MCFGR1_IGNACK	BIT(9)
 #define MRDR_RXEMPTY	BIT(14)
+#define MDER_TDDE	BIT(0)
+#define MDER_RDDE	BIT(1)
 
 #define I2C_CLK_RATIO	2
 #define CHUNK_DATA	256
 
 #define I2C_PM_TIMEOUT		10 /* ms */
+#define I2C_DMA_THRESHOLD	8 /* bytes */
 
 enum lpi2c_imx_mode {
 	STANDARD,	/* 100+Kbps */
@@ -91,6 +97,23 @@ enum lpi2c_imx_pincfg {
 	FOUR_PIN_PP,
 };
 
+struct lpi2c_imx_dma {
+	bool			using_pio_mode;
+	u8			rx_cmd_buf_len;
+	u8			*dma_buf;
+	u16			*rx_cmd_buf;
+	unsigned int	dma_len;
+	unsigned int	tx_burst_num;
+	unsigned int	rx_burst_num;
+	unsigned long	dma_msg_flag;
+	resource_size_t		phy_addr;
+	dma_addr_t		dma_tx_addr;
+	dma_addr_t		dma_addr;
+	enum dma_data_direction dma_direction;
+	struct dma_chan		*chan_tx;
+	struct dma_chan		*chan_rx;
+};
+
 struct lpi2c_imx_struct {
 	struct i2c_adapter	adapter;
 	int			num_clks;
@@ -108,6 +131,8 @@ struct lpi2c_imx_struct {
 	unsigned int		rxfifosize;
 	enum lpi2c_imx_mode	mode;
 	struct i2c_bus_recovery_info rinfo;
+	bool			can_use_dma;
+	struct lpi2c_imx_dma	*dma;
 };
 
 static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx,
@@ -305,7 +330,7 @@ static int lpi2c_imx_master_disable(struct lpi2c_imx_struct *lpi2c_imx)
 	return 0;
 }
 
-static int lpi2c_imx_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
+static int lpi2c_imx_pio_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
 {
 	unsigned long time_left;
 
@@ -451,6 +476,421 @@ static void lpi2c_imx_read(struct lpi2c_imx_struct *lpi2c_imx,
 	lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE | MIER_NDIE);
 }
 
+static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
+{
+	if (!lpi2c_imx->can_use_dma)
+		return false;
+
+	/*
+	 * When the length of data is less than I2C_DMA_THRESHOLD,
+	 * cpu mode is used directly to avoid low performance.
+	 */
+	if (msg->len < I2C_DMA_THRESHOLD)
+		return false;
+
+	return true;
+}
+
+static int lpi2c_imx_pio_xfer(struct lpi2c_imx_struct *lpi2c_imx,
+				 struct i2c_msg *msg)
+{
+	int ret;
+
+	reinit_completion(&lpi2c_imx->complete);
+
+	if (msg->flags & I2C_M_RD)
+		lpi2c_imx_read(lpi2c_imx, msg);
+	else
+		lpi2c_imx_write(lpi2c_imx, msg);
+
+	ret = lpi2c_imx_pio_msg_complete(lpi2c_imx);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int lpi2c_imx_dma_timeout_calculate(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	unsigned long time = 0;
+
+	time = 8 * lpi2c_imx->dma->dma_len * 1000 / lpi2c_imx->bitrate;
+
+	/* Add extra second for scheduler related activities */
+	time += 1;
+
+	/* Double calculated time */
+	return msecs_to_jiffies(time * MSEC_PER_SEC);
+}
+
+static int lpi2c_imx_alloc_rx_cmd_buf(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	u16 rx_remain = dma->dma_len;
+	int cmd_num;
+	u16 temp;
+
+	/*
+	 * Calculate the number of rx command words via the DMA TX channel
+	 * writing into command register based on the i2c msg len, and build
+	 * the rx command words buffer.
+	 */
+	cmd_num = DIV_ROUND_UP(rx_remain, CHUNK_DATA);
+	dma->rx_cmd_buf = kcalloc(cmd_num, sizeof(u16), GFP_KERNEL);
+	dma->rx_cmd_buf_len = cmd_num * sizeof(u16);
+
+	if (!dma->rx_cmd_buf) {
+		dev_err(&lpi2c_imx->adapter.dev, "Alloc RX cmd buffer failed\n");
+		return -ENOMEM;
+	}
+
+	for (int i = 0; i < cmd_num ; i++) {
+		temp = rx_remain > CHUNK_DATA ? CHUNK_DATA - 1 : rx_remain - 1;
+		temp |= (RECV_DATA << 8);
+		rx_remain -= CHUNK_DATA;
+		dma->rx_cmd_buf[i] = temp;
+	}
+
+	return 0;
+}
+
+static int lpi2c_imx_dma_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	unsigned long time_left, time;
+
+	time = lpi2c_imx_dma_timeout_calculate(lpi2c_imx);
+	time_left = wait_for_completion_timeout(&lpi2c_imx->complete, time);
+	if (time_left == 0) {
+		dev_err(&lpi2c_imx->adapter.dev, "I/O Error in DMA Data Transfer\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static void lpi2c_dma_unmap(struct lpi2c_imx_dma *dma)
+{
+	struct dma_chan *chan = dma->dma_direction == DMA_FROM_DEVICE
+				? dma->chan_rx : dma->chan_tx;
+
+	dma_unmap_single(chan->device->dev, dma->dma_addr,
+			 dma->dma_len, dma->dma_direction);
+
+	dma->dma_direction = DMA_NONE;
+}
+
+static void lpi2c_cleanup_rx_cmd_dma(struct lpi2c_imx_dma *dma)
+{
+	dmaengine_terminate_sync(dma->chan_tx);
+	dma_unmap_single(dma->chan_tx->device->dev, dma->dma_tx_addr,
+				dma->rx_cmd_buf_len, DMA_TO_DEVICE);
+}
+
+static void lpi2c_cleanup_dma(struct lpi2c_imx_dma *dma)
+{
+	if (dma->dma_direction == DMA_FROM_DEVICE)
+		dmaengine_terminate_sync(dma->chan_rx);
+	else if (dma->dma_direction == DMA_TO_DEVICE)
+		dmaengine_terminate_sync(dma->chan_tx);
+
+	lpi2c_dma_unmap(dma);
+}
+
+static void lpi2c_dma_callback(void *data)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = (struct lpi2c_imx_struct *)data;
+
+	complete(&lpi2c_imx->complete);
+}
+
+static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	struct dma_chan *txchan = dma->chan_tx;
+	struct dma_async_tx_descriptor *rx_cmd_desc;
+	dma_cookie_t cookie;
+
+	dma->dma_tx_addr = dma_map_single(txchan->device->dev,
+						 dma->rx_cmd_buf,
+						 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
+	if (dma_mapping_error(txchan->device->dev, dma->dma_tx_addr)) {
+		dev_err(&lpi2c_imx->adapter.dev, "dma map failed, use pio\n");
+		return -EINVAL;
+	}
+
+	rx_cmd_desc = dmaengine_prep_slave_single(txchan, dma->dma_tx_addr,
+				 dma->rx_cmd_buf_len, DMA_MEM_TO_DEV,
+				 DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!rx_cmd_desc) {
+		dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
+				 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
+		dev_err(&lpi2c_imx->adapter.dev, "dma prep slave sg failed, use pio\n");
+		return -EINVAL;
+	}
+
+	cookie = dmaengine_submit(rx_cmd_desc);
+	if (dma_submit_error(cookie)) {
+		dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
+				 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
+		dmaengine_desc_free(rx_cmd_desc);
+		dev_err(&lpi2c_imx->adapter.dev, "submitting dma failed, use pio\n");
+		return -EINVAL;
+	}
+
+	dma_async_issue_pending(txchan);
+
+	return 0;
+}
+
+static int lpi2c_dma_submit(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	bool read = dma->dma_msg_flag & I2C_M_RD;
+	enum dma_data_direction dir = read ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+	struct dma_chan *chan = read ? dma->chan_rx : dma->chan_tx;
+	struct dma_async_tx_descriptor *desc;
+	dma_cookie_t cookie;
+
+	dma->dma_direction = dir;
+	dma->dma_addr = dma_map_single(chan->device->dev,
+					     dma->dma_buf,
+					     dma->dma_len, dir);
+	if (dma_mapping_error(chan->device->dev, dma->dma_addr)) {
+		dev_err(&lpi2c_imx->adapter.dev, "dma map failed, use pio\n");
+		return -EINVAL;
+	}
+
+	desc = dmaengine_prep_slave_single(chan, dma->dma_addr,
+					 dma->dma_len, read ?
+					 DMA_DEV_TO_MEM : DMA_MEM_TO_DEV,
+					 DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!desc) {
+		dev_err(&lpi2c_imx->adapter.dev, "dma prep slave sg failed, use pio\n");
+		lpi2c_dma_unmap(dma);
+		return -EINVAL;
+	}
+
+	reinit_completion(&lpi2c_imx->complete);
+	desc->callback = lpi2c_dma_callback;
+	desc->callback_param = (void *)lpi2c_imx;
+
+	cookie = dmaengine_submit(desc);
+	if (dma_submit_error(cookie)) {
+		dev_err(&lpi2c_imx->adapter.dev, "submitting dma failed, use pio\n");
+		lpi2c_dma_unmap(dma);
+		dmaengine_desc_free(desc);
+		return -EINVAL;
+	}
+
+	/* Can't switch to PIO mode when DMA have started transfer */
+	dma->using_pio_mode = false;
+
+	dma_async_issue_pending(chan);
+
+	return 0;
+}
+
+static int lpi2c_imx_find_max_burst_num(unsigned int fifosize, unsigned int len)
+{
+	unsigned int i;
+
+	for (i = fifosize / 2; i > 0; i--) {
+		if (!(len % i))
+			break;
+	}
+
+	return i;
+}
+
+/*
+ * For a highest DMA efficiency, tx/rx burst number should be calculated according
+ * to the FIFO depth.
+ */
+static void lpi2c_imx_dma_burst_num_calculate(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	unsigned int cmd_num;
+
+	if (dma->dma_msg_flag & I2C_M_RD) {
+		/*
+		 * One RX cmd word can trigger DMA receive no more than 256 bytes.
+		 * The number of RX cmd words should be calculated based on the data
+		 * length.
+		 */
+		cmd_num = DIV_ROUND_UP(dma->dma_len, CHUNK_DATA);
+		dma->tx_burst_num = lpi2c_imx_find_max_burst_num(lpi2c_imx->txfifosize,
+				 cmd_num);
+		dma->rx_burst_num = lpi2c_imx_find_max_burst_num(lpi2c_imx->rxfifosize,
+				 dma->dma_len);
+	} else {
+		dma->tx_burst_num = lpi2c_imx_find_max_burst_num(lpi2c_imx->txfifosize,
+				 dma->dma_len);
+	}
+}
+
+static int lpi2c_dma_config(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	struct dma_slave_config rx = {}, tx = {};
+	int ret;
+
+	lpi2c_imx_dma_burst_num_calculate(lpi2c_imx);
+
+	if (dma->dma_msg_flag & I2C_M_RD) {
+		tx.dst_addr = dma->phy_addr + LPI2C_MTDR;
+		tx.dst_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
+		tx.dst_maxburst = dma->tx_burst_num;
+		tx.direction = DMA_MEM_TO_DEV;
+		ret = dmaengine_slave_config(dma->chan_tx, &tx);
+		if (ret < 0)
+			return ret;
+
+		rx.src_addr = dma->phy_addr + LPI2C_MRDR;
+		rx.src_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+		rx.src_maxburst = dma->rx_burst_num;
+		rx.direction = DMA_DEV_TO_MEM;
+		ret = dmaengine_slave_config(dma->chan_rx, &rx);
+		if (ret < 0)
+			return ret;
+	} else {
+		tx.dst_addr = dma->phy_addr + LPI2C_MTDR;
+		tx.dst_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+		tx.dst_maxburst = dma->tx_burst_num;
+		tx.direction = DMA_MEM_TO_DEV;
+		ret = dmaengine_slave_config(dma->chan_tx, &tx);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void lpi2c_dma_enable(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	/*
+	 * TX interrupt will be triggerred when the number of words in
+	 * the transmit FIFO is equal or less than TX watermark.
+	 * RX interrupt will be triggerred when the number of words in
+	 * the receive FIFO is greater than RX watermark.
+	 * In order to trigger the DMA interrupt, TX watermark should be
+	 * set equal to the DMA TX burst number but RX watermark should
+	 * be set less than the DMA RX burst number.
+	 */
+	if (dma->dma_msg_flag & I2C_M_RD) {
+		/* Set I2C TX/RX watermark */
+		writel(dma->tx_burst_num | (dma->rx_burst_num - 1) << 16,
+				 lpi2c_imx->base + LPI2C_MFCR);
+		/* Enable I2C DMA TX/RX function */
+		writel(MDER_TDDE | MDER_RDDE, lpi2c_imx->base + LPI2C_MDER);
+	} else {
+		/* Set I2C TX watermark */
+		writel(dma->tx_burst_num, lpi2c_imx->base + LPI2C_MFCR);
+		/* Enable I2C DMA TX function */
+		writel(MDER_TDDE, lpi2c_imx->base + LPI2C_MDER);
+	}
+
+	/* Enable NACK detected */
+	lpi2c_imx_intctrl(lpi2c_imx, MIER_NDIE);
+};
+
+/*
+ * When lpi2c in TX DMA mode we can use one DMA TX channel to write
+ * data word into TXFIFO, but in RX DMA mode it is different.
+ *
+ * LPI2C MTDR register is a command data and transmit data register.
+ * Bit 8-10 is command data field and Bit 0-7 is transmit data field.
+ * When the LPI2C master needs to read data, the data number to read
+ * should be set in transmit data field and RECV_DATA should be set
+ * into the command data field to receive (DATA[7:0] + 1) bytes. The
+ * recv data command word is made of RECV_DATA in command data field
+ * and the data number to read in transmit data field. When the length
+ * of data that needs to be read exceeds 256 bytes, recv data command
+ * word needs to be written to TXFIFO multiple times.
+ *
+ * So when in RX DMA mode, the TX channel also needs to be configured
+ * additionally to send RX command words and the RX command word need
+ * be set in advance before transmitting.
+ */
+static int lpi2c_imx_dma_xfer(struct lpi2c_imx_struct *lpi2c_imx,
+			 struct i2c_msg *msg)
+{
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	int ret;
+
+	/* When DMA mode failed before transferring, CPU mode can be used. */
+	dma->using_pio_mode = true;
+
+	dma->dma_len = msg->len;
+	dma->dma_msg_flag = msg->flags;
+	dma->dma_buf = i2c_get_dma_safe_msg_buf(msg, I2C_DMA_THRESHOLD);
+	if (!dma->dma_buf)
+		return -ENOMEM;
+
+	ret = lpi2c_dma_config(lpi2c_imx);
+	if (ret) {
+		dev_err(&lpi2c_imx->adapter.dev, "DMA Config Fail, error %d\n", ret);
+		goto disable_dma;
+	}
+
+	lpi2c_dma_enable(lpi2c_imx);
+
+	ret = lpi2c_dma_submit(lpi2c_imx);
+	if (ret) {
+		dev_err(&lpi2c_imx->adapter.dev, "DMA submit Fail, error %d\n", ret);
+		goto disable_dma;
+	}
+
+	if (dma->dma_msg_flag & I2C_M_RD) {
+		ret = lpi2c_imx_alloc_rx_cmd_buf(lpi2c_imx);
+		if (ret) {
+			lpi2c_cleanup_dma(dma);
+			goto disable_dma;
+		}
+
+		ret = lpi2c_dma_rx_cmd_submit(lpi2c_imx);
+		if (ret) {
+			lpi2c_cleanup_dma(dma);
+			goto disable_dma;
+		}
+	}
+
+	ret = lpi2c_imx_dma_msg_complete(lpi2c_imx);
+	if (ret) {
+		if (dma->dma_msg_flag & I2C_M_RD)
+			lpi2c_cleanup_rx_cmd_dma(dma);
+		lpi2c_cleanup_dma(dma);
+		goto disable_dma;
+	}
+
+	/* When meet NACK in transfer, cleanup all DMA transfer */
+	if ((readl(lpi2c_imx->base + LPI2C_MSR) & MSR_NDF) && !ret) {
+		if (dma->dma_msg_flag & I2C_M_RD)
+			lpi2c_cleanup_rx_cmd_dma(dma);
+		lpi2c_cleanup_dma(dma);
+		ret = -EIO;
+		goto disable_dma;
+	}
+
+	if (dma->dma_msg_flag & I2C_M_RD)
+		dma_unmap_single(dma->chan_tx->device->dev, dma->dma_tx_addr,
+					 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
+	lpi2c_dma_unmap(dma);
+
+disable_dma:
+	/* Disable I2C DMA function */
+	writel(0, lpi2c_imx->base + LPI2C_MDER);
+
+	if (dma->dma_msg_flag & I2C_M_RD)
+		kfree(dma->rx_cmd_buf);
+
+	if (ret)
+		i2c_put_dma_safe_msg_buf(dma->dma_buf, msg, false);
+	else
+		i2c_put_dma_safe_msg_buf(dma->dma_buf, msg, true);
+	return ret;
+}
+
 static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 			  struct i2c_msg *msgs, int num)
 {
@@ -477,12 +917,14 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 		lpi2c_imx->msglen = msgs[i].len;
 		init_completion(&lpi2c_imx->complete);
 
-		if (msgs[i].flags & I2C_M_RD)
-			lpi2c_imx_read(lpi2c_imx, &msgs[i]);
-		else
-			lpi2c_imx_write(lpi2c_imx, &msgs[i]);
+		if (is_use_dma(lpi2c_imx, &msgs[i])) {
+			result = lpi2c_imx_dma_xfer(lpi2c_imx, &msgs[i]);
+			if (result && lpi2c_imx->dma->using_pio_mode)
+				result = lpi2c_imx_pio_xfer(lpi2c_imx, &msgs[i]);
+		} else {
+			result = lpi2c_imx_pio_xfer(lpi2c_imx, &msgs[i]);
+		}
 
-		result = lpi2c_imx_msg_complete(lpi2c_imx);
 		if (result)
 			goto stop;
 
@@ -546,6 +988,58 @@ static int lpi2c_imx_init_recovery_info(struct lpi2c_imx_struct *lpi2c_imx,
 	return 0;
 }
 
+static void dma_exit(struct device *dev, struct lpi2c_imx_dma *dma)
+{
+	if (dma->chan_rx)
+		dma_release_channel(dma->chan_rx);
+
+	if (dma->chan_tx)
+		dma_release_channel(dma->chan_tx);
+
+	devm_kfree(dev, dma);
+}
+
+static int lpi2c_dma_init(struct device *dev, dma_addr_t phy_addr)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
+	struct lpi2c_imx_dma *dma;
+	int ret;
+
+	dma = devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
+	if (!dma)
+		return -ENOMEM;
+
+	dma->phy_addr = phy_addr;
+
+	/* Prepare for TX DMA: */
+	dma->chan_tx = dma_request_chan(dev, "tx");
+	if (IS_ERR(dma->chan_tx)) {
+		ret = PTR_ERR(dma->chan_tx);
+		if (ret != -ENODEV && ret != -EPROBE_DEFER)
+			dev_err(dev, "can't request DMA tx channel (%d)\n", ret);
+		dma->chan_tx = NULL;
+		goto dma_exit;
+	}
+
+	/* Prepare for RX DMA: */
+	dma->chan_rx = dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->chan_rx)) {
+		ret = PTR_ERR(dma->chan_rx);
+		if (ret != -ENODEV && ret != -EPROBE_DEFER)
+			dev_err(dev, "can't request DMA rx channel (%d)\n", ret);
+		dma->chan_rx = NULL;
+		goto dma_exit;
+	}
+
+	lpi2c_imx->can_use_dma = true;
+	lpi2c_imx->dma = dma;
+	return 0;
+
+dma_exit:
+	dma_exit(dev, dma);
+	return ret;
+}
+
 static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL |
@@ -566,6 +1060,8 @@ MODULE_DEVICE_TABLE(of, lpi2c_imx_of_match);
 static int lpi2c_imx_probe(struct platform_device *pdev)
 {
 	struct lpi2c_imx_struct *lpi2c_imx;
+	struct resource *res;
+	dma_addr_t phy_addr;
 	unsigned int temp;
 	int irq, ret;
 
@@ -573,7 +1069,7 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (!lpi2c_imx)
 		return -ENOMEM;
 
-	lpi2c_imx->base = devm_platform_ioremap_resource(pdev, 0);
+	lpi2c_imx->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(lpi2c_imx->base))
 		return PTR_ERR(lpi2c_imx->base);
 
@@ -587,6 +1083,7 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	lpi2c_imx->adapter.dev.of_node	= pdev->dev.of_node;
 	strscpy(lpi2c_imx->adapter.name, pdev->name,
 		sizeof(lpi2c_imx->adapter.name));
+	phy_addr = (dma_addr_t)res->start;
 
 	ret = devm_clk_bulk_get_all(&pdev->dev, &lpi2c_imx->clks);
 	if (ret < 0)
@@ -640,6 +1137,14 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret == -EPROBE_DEFER)
 		goto rpm_disable;
 
+	/* Init DMA */
+	ret = lpi2c_dma_init(&pdev->dev, phy_addr);
+	if (ret) {
+		if (ret == -EPROBE_DEFER)
+			goto rpm_disable;
+		dev_info(&pdev->dev, "use pio mode\n");
+	}
+
 	ret = i2c_add_adapter(&lpi2c_imx->adapter);
 	if (ret)
 		goto rpm_disable;
-- 
2.34.1


