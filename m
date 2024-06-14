Return-Path: <linux-i2c+bounces-4020-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B675890817B
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 04:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1065A1F22BF7
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 02:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3424B18307F;
	Fri, 14 Jun 2024 02:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="nJLr+U7v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2056.outbound.protection.outlook.com [40.107.20.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F112137914;
	Fri, 14 Jun 2024 02:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718331483; cv=fail; b=HnMxrMPlaxE0EwzkdOm2dMCA/mbI1EFn7qgC/Xqbn2Xes8D9ItHxPpgbc6iVQUIhhJJJR4HB/dtV1qLolhktYHOojinwZ7DQMDoLfh41G6cnrmtHWYr80l41tKxQ5mMTrup3kZfYkNHR/Wka20M3EkUkSDl/VvCvHDVt91Pelks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718331483; c=relaxed/simple;
	bh=hfrD2BOzNjl3HSlBVrOIONpW39Cj4N5Lk79TVsGDS2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=sCZIeHEmMltbToLa9dAsXjMt8+rpRMV/1f5r9FQO7pakdTkCrqwt8W2diC1UtQeDx5C5YfgY3fG/jReNg9UvJth4CwJxlrXrEjODGq+XVMeNzkMZyOckP2ESDKOObaJprl+KjF01OuPUBbmi0qaQhGH5RGVAJoGGY/7N36zQl/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=nJLr+U7v; arc=fail smtp.client-ip=40.107.20.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKwa3vJbJDd8esxAE2/ch4nFzg0Y04PMSscu+0sk0DIcFe3FYERR2NSGigoEn+UGRI2ySO3Bxd2td4g1+JM2dAnoYg2UjJhGsBhtqzKFI8MZouxIvdDjayLqtOwN+EnRL3pvTk+nI72dmG5SwJbKQDjr9fd+MZ7LHxxLXra1xnRXlX2t7X5n47JPS/8T/4wFCMdaiIUDmViB/BqF9ss8Ot0NxP26fm0vsihI7x44x89Mhu3vc7/cfrfb0unTAdjGhHn6dirQGXCqAr2ukgZRP7OMUSH3xJ+OzzCn1XcZ5YhGEvIR/q+HJE94Iy4WMrE7j00y/WUiB/Mo2+J6y0ZwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQ5p1gJsMice5RYX68eZRcgBKFoU6CptLVxmzleLXmw=;
 b=fI/HePsDStM2hHunjjlRLxAr7Lzno1HaPQLHKiigXp/ZdGNMetYRIOuTLmQ+UyLXeXnpIFql0p7ZrIYortoVae2p3stzokKPqgXUY89nAnyzWMKoPz+OEQbOF9tJ5dJ4ZoI2XObAuBhYSVAJYCemQjBr/+kmzQIKcpDbU/GDgT0e4IA9OU4mMVLfvyftN0YNq7XHGAc8PfRhhun1EB1/7I/AZtIOF+QDkswEKXdpBO0kDbn7bjiPJ5XRiSzwNYWt6TAbsvewAK3kgVYgrWYZ1Bsz0kqqk8T3rMpN5+iPFlds14QBhTSEVXWa8jsAL96cE1l3vQ4uU3HaUSVs4A+UoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQ5p1gJsMice5RYX68eZRcgBKFoU6CptLVxmzleLXmw=;
 b=nJLr+U7vdu+3Y/dYG++whpNe+xPLudNbFC/+HYN4BSjVGltsGriSH423teF0SllPeEoETwK3QLKDhkduEE6Hmdro0y8JnzmBdT9LOVOSQSt+M3ntZAfZ94fQ8y549zDGgJVf3m6fItZhTWTwpK2aegYA0YmPp5nCeZeGdgpnAkU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by VI2PR04MB10546.eurprd04.prod.outlook.com (2603:10a6:800:274::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Fri, 14 Jun
 2024 02:17:56 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb%6]) with mapi id 15.20.7633.036; Fri, 14 Jun 2024
 02:17:56 +0000
From: carlos.song@nxp.com
To: aisheng.dong@nxp.com,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: carlos.song@nxp.com,
	frank.li@nxp.com,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH V2] i2c: imx-lpi2c: add eDMA mode support for LPI2C
Date: Fri, 14 Jun 2024 10:26:03 +0800
Message-Id: <20240614022603.1651342-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:4:186::13) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|VI2PR04MB10546:EE_
X-MS-Office365-Filtering-Correlation-Id: 19177cd3-2c7d-4449-02f9-08dc8c18342f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230035|1800799019|366011|7416009|376009|52116009|38350700009;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SF+Hoctw5s5O2MzrjwO5X60uYhQNZsguuVkV87NaiijPtMGFqwHjdrgUfzK/?=
 =?us-ascii?Q?kdEphV+0aP5dWenTVbO08VrKnPacpNOPo+ojQqKNMOEqx4MVRDx27bZgGqNE?=
 =?us-ascii?Q?iak7CKnAf8F7UyFhFDW9cvwBvitblpxd4cH1uP87GOsFs2AdWzJbhWbs0oNo?=
 =?us-ascii?Q?8sLPHMMn/oYxkd7hsmsvsUzH+rtKE0APHP8OcgQpiEXaqhQMX0x1sHwF4QrL?=
 =?us-ascii?Q?3jt6El5HiI4FEW79jxB9xJhveSErn1HmsrSZlrf/pYqBO3L0rcFowWZPhNsw?=
 =?us-ascii?Q?Rmvfa9WhpDS9z/TumqkJEjnARtBPZhoUBU5QNEMKpRoCeBLiHJzwnjbWP9zg?=
 =?us-ascii?Q?WfxBsFLKdR0sybAW7Y96ZggXSvIZP8DkV0HlwuJbBaqG3aifV8jPKE/isf2y?=
 =?us-ascii?Q?H/HZz99fNFOyyPX2F/6QrUBzTjbYdWrg0EtaPPFaxeabu5y6uoiWwB+c04aK?=
 =?us-ascii?Q?V+NwaWR/FTzBgUf9JlwRLEGIb1xzfIuv0O1pFWUUGy/ggvnRvEGbmhE5iYyS?=
 =?us-ascii?Q?Boi1hJdLf85aVQh6tlr0qE9LOFjTprD3zFeU4tWV99ezAhGyf21tlrLk8Bx8?=
 =?us-ascii?Q?3RdXIIZgC3TL6lTGuTHGFccQTr+4YjXHGkPQ7D7CLGwh2cMbOUKjFsnvVvQS?=
 =?us-ascii?Q?tAt9RO792KGdl9E7JYGx3nvx7yTF7ZCLN9GFKkJNia7YALHguKYLUN1IdcXX?=
 =?us-ascii?Q?lej+nEINlTZsBPB4goCwK5XVSjDWzCEHVtFZzIKICedLDQhhHcN+gVKXNqzQ?=
 =?us-ascii?Q?CUeVhk5O6aP50XFzuSeziDfylHCCeimMkpK+NMYzCGQAPx+FE+b2iltlxMSA?=
 =?us-ascii?Q?XBcgc+sI2teqEdAQCOT0vEtfozdSovEdr3j1gLA1WqSbfKtZ7zrV0Yy0Cgzg?=
 =?us-ascii?Q?XoMOq0g1UFfsueXABr99OsZ8gKDen2qAKMf0nw8Qqs7b/JbYOlmcZFrpXRdN?=
 =?us-ascii?Q?wls+i3n6RizSErnXfQ8e9KTy0c2ml9kn05r3UrAQ05c/P9WkzeTtMPtfEi2E?=
 =?us-ascii?Q?ROXVPtFV6uwlNrfF4/STWAIYbjszT+0Z/iiEQOSJ0gJlBUzCtiyd7JEUs4Hw?=
 =?us-ascii?Q?Div/ReAtgkivm5Dpijr1Nfwvof/pJMwczhzB+PHay3QMV9F/jz8+R4F+OLjZ?=
 =?us-ascii?Q?KzMUtv3kE3FgSU/zrmFLs9Z2HAFVlhqMCBoPvU7mmP5ywDBvTn2RBAECIizQ?=
 =?us-ascii?Q?sIM8+C7ZxmsmoN8nConterxVomSE5KvV6LSpk7cvZB7kcHcrtV6MA2yYBKgI?=
 =?us-ascii?Q?P08qoHX+IvL21ij20BYK+ddOMeIWtfRRGdmOB1YRuZsGW7WtDUcF5lgdxoh1?=
 =?us-ascii?Q?px6w1e9+vRW2DZXHEcKUYsou0cvi8H0ns4kOg3RCFcGsB4OkXAFOPID5r/9p?=
 =?us-ascii?Q?jYo42cw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(7416009)(376009)(52116009)(38350700009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d8EaztE962wuovaaChWoHfZOcinjRu/wUGgUPTEuA4UD+mKBFEcckUXRPiO+?=
 =?us-ascii?Q?xLhHJRpaqCrUyAViDmmDIcIA32arXLZjinBj+1fnJ+jNpd8PwGgDn/E4oLsN?=
 =?us-ascii?Q?dHaj9CXITZ8gom9zVMeUflIQmEau2Xsj1LqNlge8G3ltwBhXR5/YeL7WJ58D?=
 =?us-ascii?Q?kEN7n2I1jm13x3HKbxjkfXV1M8qJTjy1L7JhNMtS9Adf+5k0Gwz18HD5FQoo?=
 =?us-ascii?Q?kVTOFYrGP/lg/F9e6YN5/M9J+L7/VpfnLu6UD2KURnZ87i4XiNWcVQa8rF7R?=
 =?us-ascii?Q?lt4AiImEBSPhfz6GTPGSEfY/pqgnTNOshGxPyf9up08cftnTS0mrV+LNX1n7?=
 =?us-ascii?Q?yWcLDCAM+r5Q6zm+BudLh0g4yoplwIds8sz6Jmx0hGRzFOib/V5GX5cvo1wt?=
 =?us-ascii?Q?zdx3G4Boka7lLohgtQr6qAq4pdQnm/rUniwzszjCwk1Jp7UOAas/CU9AZNUT?=
 =?us-ascii?Q?OaLHC3OMb4dT8/A7HpkfLkeUKFq4c1B4TH85exRb/vDnxONe87hvjyaw5A8b?=
 =?us-ascii?Q?igpVYMWyyaoQyGJrtho8bp9ZapryG7JGD59ThFkPSNWbb+ASO/ZBXLlZoqEw?=
 =?us-ascii?Q?pxyOJMyZ//t7W92AJiIMDGXKKjG5R4v4pRsAEXfBSdS9eQrcVFjWhhib8P1e?=
 =?us-ascii?Q?DBscIoQfbDiVCz7UCjO+DpN/MSOZoUfgS0vbP+6UuPlqgIiDtKxejjlmFRpK?=
 =?us-ascii?Q?cNysMFlIfEQCp35rnrGWITee3Z1VBWzRW7LwfwHwljKP998ZlHISvDrOC0o+?=
 =?us-ascii?Q?UNvgffgDkp8ee9L9WUgE4omtE1T4x2H3zkfd8SrdfGPBF3c1G4n/fHDbJ9QZ?=
 =?us-ascii?Q?afoZkJRSK6bsyMBTWvmy+w/j221UO1ZqKyuvSbih9gWP2fPUejFSKg4NWikZ?=
 =?us-ascii?Q?XDF+GCXU3TWXikGdHNrs+Y6A5jSsk5HSoS46zawrYdE3PPargoe1qQ+YdIZ/?=
 =?us-ascii?Q?1LEWnLpzNtFtaQKaGmeWytAOBGY4AWWI951UGl40zJlIpER4WdAiGvhRR8Od?=
 =?us-ascii?Q?mJdUrhfy71St2gm4Ppbo6Idk8yUAghNijD2hJg+1byUvCZ1QJgXVHr1zNJg4?=
 =?us-ascii?Q?XPswQoigW7q9YkkG1CsphmySy8suwWqPn14YVSj8Ij/j5VYyYXJ/lco/GeJi?=
 =?us-ascii?Q?v0AsDADQ51S2Zz/qdk4afl/fgU0bhw+45k3D1rp8fJX+1oo1rQQjOlY+/t7A?=
 =?us-ascii?Q?l5aV7XGpao3s4AQ7DYbezi74OXDwj8QuLawm+XuYvOJ+TesX6v1EmBP4acnq?=
 =?us-ascii?Q?d4CwVy5E8EZCHjtdqk23tYAqFF5N/hkNsVjzm+MsN8NJy9NSRAYpHsNgOIz9?=
 =?us-ascii?Q?HCAQIezEBB8X4oqscz8MlN9B5sSXUcYwfhSMUjP3ZtAOBB6VB34qdQ46K8ht?=
 =?us-ascii?Q?uokyNwzrvfLOkoOtzHvEp6eAnuvxuzIBtHJWdoCbuOmh3ENtBgz/9eD/60IQ?=
 =?us-ascii?Q?Wkjend4aJSRfJ9D4liDoCk3X8La6d3rZ9005YFlaYjLYP+hqJZKhIjvHF/8Z?=
 =?us-ascii?Q?W7LkqEWtisdWDpBuNMNp/ULef37gSfO4pCITKHuWEUJ4B5m26/bJ84DJX3q7?=
 =?us-ascii?Q?qT0nfMi2XYzfPpVkc6kN70LJIxiTrSmn0ytvxWnY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19177cd3-2c7d-4449-02f9-08dc8c18342f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 02:17:56.7027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oGqczuRQbnIuBesYla/0wkNWOJh9aeSDd2w3n4+css0xmpWmtig7BRKVEqBEi10miwXxcp0/j6Hn3VYCdiX4Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10546

From: Carlos Song <carlos.song@nxp.com>

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
Reviewed-by: Frank Li <frank.li@nxp.com>
---
Change for V2:
Optimized eDMA rx cmd buf free function to improve code readability
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 531 ++++++++++++++++++++++++++++-
 1 file changed, 523 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 6d72e4e126dd..d73a7d299c03 100644
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
@@ -107,6 +113,22 @@ struct lpi2c_imx_struct {
 	unsigned int		rxfifosize;
 	enum lpi2c_imx_mode	mode;
 	struct i2c_bus_recovery_info rinfo;
+
+	bool			can_use_dma;
+	bool			using_pio_mode;
+	u8			rx_cmd_buf_len;
+	u16			*rx_cmd_buf;
+	u8			*dma_buf;
+	unsigned int	dma_len;
+	unsigned int	tx_burst_num;
+	unsigned int	rx_burst_num;
+	resource_size_t		phy_addr;
+	dma_addr_t		dma_tx_addr;
+	dma_addr_t		dma_addr;
+	enum dma_data_direction dma_direction;
+	struct dma_chan		*chan_tx;
+	struct dma_chan		*chan_rx;
+	struct i2c_msg		*msg;
 };
 
 static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx,
@@ -306,7 +328,7 @@ static int lpi2c_imx_master_disable(struct lpi2c_imx_struct *lpi2c_imx)
 	return 0;
 }
 
-static int lpi2c_imx_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
+static int lpi2c_imx_pio_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
 {
 	unsigned long timeout;
 
@@ -452,6 +474,439 @@ static void lpi2c_imx_read(struct lpi2c_imx_struct *lpi2c_imx,
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
+			   struct i2c_msg *msg)
+{
+	int result;
+
+	reinit_completion(&lpi2c_imx->complete);
+
+	if (msg->flags & I2C_M_RD)
+		lpi2c_imx_read(lpi2c_imx, msg);
+	else
+		lpi2c_imx_write(lpi2c_imx, msg);
+
+	result = lpi2c_imx_pio_msg_complete(lpi2c_imx);
+	if (result)
+		return result;
+
+	return 0;
+}
+
+static int lpi2c_imx_dma_calculate_timeout(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	unsigned long timeout = 0;
+
+	timeout = 8 * lpi2c_imx->msglen * 1000 / lpi2c_imx->bitrate;
+
+	/* Add extra second for scheduler related activities */
+	timeout += 1;
+
+	/* Double calculated timeout */
+	return msecs_to_jiffies(timeout * MSEC_PER_SEC);
+}
+
+static int lpi2c_imx_alloc_rx_cmd_buf(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	u16 rx_remain = lpi2c_imx->msg->len;
+	u16 temp;
+	int cmd_num;
+
+	/*
+	 * Calculate the number of rx command words via the DMA TX channel
+	 * writing into command register based on the i2c msg len, and build
+	 * the rx command words buffer.
+	 */
+	cmd_num = DIV_ROUND_UP(rx_remain, CHUNK_DATA);
+	lpi2c_imx->rx_cmd_buf = kcalloc(cmd_num, sizeof(u16), GFP_KERNEL);
+	lpi2c_imx->rx_cmd_buf_len = cmd_num * sizeof(u16);
+
+	if (!lpi2c_imx->rx_cmd_buf) {
+		dev_err(&lpi2c_imx->adapter.dev, "Alloc RX cmd buffer failed\n");
+		return -ENOMEM;
+	}
+
+	for (int i = 0; i < cmd_num ; i++) {
+		temp = rx_remain > CHUNK_DATA ? CHUNK_DATA - 1 : rx_remain - 1;
+		temp |= (RECV_DATA << 8);
+		rx_remain -= CHUNK_DATA;
+		lpi2c_imx->rx_cmd_buf[i] = temp;
+	}
+
+	return 0;
+}
+
+static int lpi2c_imx_dma_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	unsigned long time_left, timeout;
+
+	timeout = lpi2c_imx_dma_calculate_timeout(lpi2c_imx);
+	time_left = wait_for_completion_timeout(&lpi2c_imx->complete, timeout);
+	if (time_left == 0) {
+		dev_err(&lpi2c_imx->adapter.dev, "I/O Error in DMA Data Transfer\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static void lpi2c_dma_unmap(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct dma_chan *chan = lpi2c_imx->dma_direction == DMA_FROM_DEVICE
+				? lpi2c_imx->chan_rx : lpi2c_imx->chan_tx;
+
+	dma_unmap_single(chan->device->dev, lpi2c_imx->dma_addr,
+			 lpi2c_imx->dma_len, lpi2c_imx->dma_direction);
+
+	lpi2c_imx->dma_direction = DMA_NONE;
+}
+
+static void lpi2c_cleanup_rx_cmd_dma(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	dmaengine_terminate_sync(lpi2c_imx->chan_tx);
+	dma_unmap_single(lpi2c_imx->chan_tx->device->dev, lpi2c_imx->dma_tx_addr,
+				lpi2c_imx->rx_cmd_buf_len, DMA_TO_DEVICE);
+}
+
+static void lpi2c_cleanup_dma(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	if (lpi2c_imx->dma_direction == DMA_NONE)
+		return;
+	else if (lpi2c_imx->dma_direction == DMA_FROM_DEVICE)
+		dmaengine_terminate_sync(lpi2c_imx->chan_rx);
+	else if (lpi2c_imx->dma_direction == DMA_TO_DEVICE)
+		dmaengine_terminate_sync(lpi2c_imx->chan_tx);
+
+	lpi2c_dma_unmap(lpi2c_imx);
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
+	struct dma_chan *txchan = lpi2c_imx->chan_tx;
+	struct dma_async_tx_descriptor *rx_cmd_desc;
+	dma_cookie_t cookie;
+
+	lpi2c_imx->dma_tx_addr = dma_map_single(txchan->device->dev,
+						 lpi2c_imx->rx_cmd_buf,
+						 lpi2c_imx->rx_cmd_buf_len, DMA_TO_DEVICE);
+	if (dma_mapping_error(txchan->device->dev, lpi2c_imx->dma_tx_addr)) {
+		dev_err(&lpi2c_imx->adapter.dev, "dma map failed, use pio\n");
+		return -EINVAL;
+	}
+
+	rx_cmd_desc = dmaengine_prep_slave_single(txchan, lpi2c_imx->dma_tx_addr,
+				lpi2c_imx->rx_cmd_buf_len, DMA_MEM_TO_DEV,
+				DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!rx_cmd_desc) {
+		dma_unmap_single(txchan->device->dev, lpi2c_imx->dma_tx_addr,
+				lpi2c_imx->rx_cmd_buf_len, DMA_TO_DEVICE);
+		dev_err(&lpi2c_imx->adapter.dev, "dma prep slave sg failed, use pio\n");
+		return -EINVAL;
+	}
+
+
+	cookie = dmaengine_submit(rx_cmd_desc);
+	if (dma_submit_error(cookie)) {
+		dma_unmap_single(txchan->device->dev, lpi2c_imx->dma_tx_addr,
+				lpi2c_imx->rx_cmd_buf_len, DMA_TO_DEVICE);
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
+	bool read = lpi2c_imx->msg->flags & I2C_M_RD;
+	enum dma_data_direction dir = read ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+	struct dma_chan *chan = read ? lpi2c_imx->chan_rx : lpi2c_imx->chan_tx;
+	struct dma_async_tx_descriptor *desc;
+	dma_cookie_t cookie;
+
+	lpi2c_imx->dma_direction = dir;
+
+	lpi2c_imx->dma_addr = dma_map_single(chan->device->dev,
+					     lpi2c_imx->dma_buf,
+					     lpi2c_imx->dma_len, dir);
+	if (dma_mapping_error(chan->device->dev, lpi2c_imx->dma_addr)) {
+		dev_err(&lpi2c_imx->adapter.dev, "dma map failed, use pio\n");
+		return -EINVAL;
+	}
+
+	desc = dmaengine_prep_slave_single(chan, lpi2c_imx->dma_addr,
+					lpi2c_imx->dma_len, read ?
+					DMA_DEV_TO_MEM : DMA_MEM_TO_DEV,
+					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!desc) {
+		dev_err(&lpi2c_imx->adapter.dev, "dma prep slave sg failed, use pio\n");
+		lpi2c_dma_unmap(lpi2c_imx);
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
+		lpi2c_dma_unmap(lpi2c_imx);
+		dmaengine_desc_free(desc);
+		return -EINVAL;
+	}
+
+	/* Can't switch to PIO mode when DMA have started transferred */
+	lpi2c_imx->using_pio_mode = false;
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
+/*
+ * For a highest DMA efficiency, tx/rx burst number should be calculated according to
+ * the FIFO depth.
+ */
+static void lpi2c_imx_dma_burst_num_calculate(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	unsigned int cmd_num;
+
+	if (lpi2c_imx->msg->flags & I2C_M_RD) {
+		/*
+		 * One RX cmd word can trigger DMA receive no more than 256 bytes.
+		 * The number of RX cmd words should be calculated based on the data
+		 * length.
+		 */
+		cmd_num = DIV_ROUND_UP(lpi2c_imx->dma_len, CHUNK_DATA);
+		lpi2c_imx->tx_burst_num = lpi2c_imx_find_max_burst_num(lpi2c_imx->txfifosize,
+				   cmd_num);
+		lpi2c_imx->rx_burst_num = lpi2c_imx_find_max_burst_num(lpi2c_imx->rxfifosize,
+				   lpi2c_imx->dma_len);
+	} else
+		lpi2c_imx->tx_burst_num = lpi2c_imx_find_max_burst_num(lpi2c_imx->txfifosize,
+				   lpi2c_imx->dma_len);
+}
+
+static int lpi2c_dma_config(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	int ret;
+	struct dma_slave_config rx = {}, tx = {};
+
+	lpi2c_imx_dma_burst_num_calculate(lpi2c_imx);
+
+	if (lpi2c_imx->msg->flags & I2C_M_RD) {
+		if (IS_ERR(lpi2c_imx->chan_tx)) {
+			ret =  PTR_ERR(lpi2c_imx->chan_tx);
+			dev_err(&lpi2c_imx->adapter.dev, "can't get RX channel %d\n", ret);
+			return ret;
+		}
+
+		if (IS_ERR(lpi2c_imx->chan_rx)) {
+			ret =  PTR_ERR(lpi2c_imx->chan_rx);
+			dev_err(&lpi2c_imx->adapter.dev, "can't get TX channel %d\n", ret);
+			return ret;
+		}
+
+		tx.dst_addr = lpi2c_imx->phy_addr + LPI2C_MTDR;
+		tx.dst_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
+		tx.dst_maxburst = lpi2c_imx->tx_burst_num;
+		tx.direction = DMA_MEM_TO_DEV;
+		ret = dmaengine_slave_config(lpi2c_imx->chan_tx, &tx);
+		if (ret < 0) {
+			dev_err(&lpi2c_imx->adapter.dev, "can't configure TX channel %d\n", ret);
+			return ret;
+		}
+
+		rx.src_addr = lpi2c_imx->phy_addr + LPI2C_MRDR;
+		rx.src_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+		rx.src_maxburst = lpi2c_imx->rx_burst_num;
+		rx.direction = DMA_DEV_TO_MEM;
+		ret = dmaengine_slave_config(lpi2c_imx->chan_rx, &rx);
+		if (ret < 0) {
+			dev_err(&lpi2c_imx->adapter.dev, "can't configure RX channel %d\n", ret);
+			return ret;
+		}
+	} else {
+		if (IS_ERR(lpi2c_imx->chan_tx)) {
+			ret =  PTR_ERR(lpi2c_imx->chan_tx);
+			dev_err(&lpi2c_imx->adapter.dev, "can't get TX channel %d\n", ret);
+			return ret;
+		}
+
+		tx.dst_addr = lpi2c_imx->phy_addr + LPI2C_MTDR;
+		tx.dst_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+		tx.dst_maxburst = lpi2c_imx->tx_burst_num;
+		tx.direction = DMA_MEM_TO_DEV;
+		ret = dmaengine_slave_config(lpi2c_imx->chan_tx, &tx);
+		if (ret < 0) {
+			dev_err(&lpi2c_imx->adapter.dev, "can't configure TX channel %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void lpi2c_dma_enable(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	/*
+	 * TX interrupt will be triggerred when the number of words in the transmit FIFO is equal
+	 * or less than TX watermark. RX interrupt will be triggerred when the number of words
+	 * in the receive FIFO is greater than RX watermark. In order to trigger the DMA interrupt,
+	 * TX watermark should be set equal to the DMA TX burst number but RX watermark should be
+	 * set less than the DMA RX burst number.
+	 */
+	if (lpi2c_imx->msg->flags & I2C_M_RD) {
+		/* Set I2C TX/RX watermark */
+		writel(lpi2c_imx->tx_burst_num | (lpi2c_imx->rx_burst_num - 1) << 16,
+				lpi2c_imx->base + LPI2C_MFCR);
+		/* Enable I2C DMA TX/RX function */
+		writel(MDER_TDDE | MDER_RDDE, lpi2c_imx->base + LPI2C_MDER);
+	} else {
+		/* Set I2C TX watermark */
+		writel(lpi2c_imx->tx_burst_num, lpi2c_imx->base + LPI2C_MFCR);
+		/* Enable I2C DMA TX function */
+		writel(MDER_TDDE, lpi2c_imx->base + LPI2C_MDER);
+	}
+
+	/* Enable NACK detected */
+	lpi2c_imx_intctrl(lpi2c_imx, MIER_NDIE);
+};
+
+/*
+ * When lpi2c in TX DMA mode we can use one DMA TX channel to write data word
+ * into TXFIFO, but in RX DMA mode it is different.
+ *
+ * LPI2C MTDR register is a command data and transmit data register.
+ * Bit 8-10 is a command data field and Bit 0-7 is a transmit data
+ * field. When the LPI2C master needs to read data, the data number
+ * to read should be set in transmit data field and RECV_DATA should
+ * be set into the command data field to receive (DATA[7:0] + 1) bytes.
+ * The recv data command word is made by RECV_DATA in command data field
+ * and the data number to read in transmit data field. when the length
+ * of the data that needs to be read exceeds 256 bytes, recv data command
+ * word needs to be written to TXFIFO multiple times.
+ *
+ * So when in RX DMA mode, the TX channel also needs to be configured additionally
+ * to send RX command words and the RX command word need be set in advance before
+ * transmitting.
+ */
+static int lpi2c_imx_dma_xfer(struct lpi2c_imx_struct *lpi2c_imx,
+			   struct i2c_msg *msg)
+{
+	int result;
+
+	lpi2c_imx->msg = msg;
+	lpi2c_imx->dma_len = msg->len;
+	lpi2c_imx->dma_buf = i2c_get_dma_safe_msg_buf(msg,
+						I2C_DMA_THRESHOLD);
+
+	if (!lpi2c_imx->dma_buf)
+		return -ENOMEM;
+
+	result = lpi2c_dma_config(lpi2c_imx);
+	if (result) {
+		dev_err(&lpi2c_imx->adapter.dev, "DMA Config Fail, error %d\n", result);
+		goto disable_dma;
+	}
+
+	lpi2c_dma_enable(lpi2c_imx);
+
+	result = lpi2c_dma_submit(lpi2c_imx);
+	if (result) {
+		dev_err(&lpi2c_imx->adapter.dev, "DMA submit Fail, error %d\n", result);
+		goto disable_dma;
+	}
+
+	if (msg->flags & I2C_M_RD) {
+		result = lpi2c_imx_alloc_rx_cmd_buf(lpi2c_imx);
+		if (result) {
+			lpi2c_cleanup_dma(lpi2c_imx);
+			goto disable_dma;
+		}
+
+		result = lpi2c_dma_rx_cmd_submit(lpi2c_imx);
+		if (result) {
+			lpi2c_cleanup_dma(lpi2c_imx);
+			goto disable_dma;
+		}
+	}
+
+	result = lpi2c_imx_dma_msg_complete(lpi2c_imx);
+	if (result) {
+		if (msg->flags & I2C_M_RD)
+			lpi2c_cleanup_rx_cmd_dma(lpi2c_imx);
+		lpi2c_cleanup_dma(lpi2c_imx);
+		goto disable_dma;
+	}
+
+	/* When meet NACK in transfer, cleanup all DMA transfer */
+	if ((readl(lpi2c_imx->base + LPI2C_MSR) & MSR_NDF) && !result) {
+		if (msg->flags & I2C_M_RD)
+			lpi2c_cleanup_rx_cmd_dma(lpi2c_imx);
+		lpi2c_cleanup_dma(lpi2c_imx);
+		result = -EIO;
+		goto disable_dma;
+	}
+
+	if (msg->flags & I2C_M_RD)
+		dma_unmap_single(lpi2c_imx->chan_tx->device->dev, lpi2c_imx->dma_tx_addr,
+					lpi2c_imx->rx_cmd_buf_len, DMA_TO_DEVICE);
+	lpi2c_dma_unmap(lpi2c_imx);
+
+disable_dma:
+	/* Disable I2C DMA function */
+	writel(0, lpi2c_imx->base + LPI2C_MDER);
+
+	if (lpi2c_imx->msg->flags & I2C_M_RD)
+		kfree(lpi2c_imx->rx_cmd_buf);
+
+	if (result)
+		i2c_put_dma_safe_msg_buf(lpi2c_imx->dma_buf,
+					lpi2c_imx->msg, false);
+	else
+		i2c_put_dma_safe_msg_buf(lpi2c_imx->dma_buf,
+					lpi2c_imx->msg, true);
+	return result;
+}
+
 static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 			  struct i2c_msg *msgs, int num)
 {
@@ -476,14 +931,17 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 		lpi2c_imx->tx_buf = NULL;
 		lpi2c_imx->delivered = 0;
 		lpi2c_imx->msglen = msgs[i].len;
-		init_completion(&lpi2c_imx->complete);
 
-		if (msgs[i].flags & I2C_M_RD)
-			lpi2c_imx_read(lpi2c_imx, &msgs[i]);
-		else
-			lpi2c_imx_write(lpi2c_imx, &msgs[i]);
+		/* When DMA mode failed before transferring, CPU mode can be used. */
+		lpi2c_imx->using_pio_mode = true;
+
+		if (is_use_dma(lpi2c_imx, &msgs[i])) {
+			result = lpi2c_imx_dma_xfer(lpi2c_imx, &msgs[i]);
+			if (result && lpi2c_imx->using_pio_mode)
+				result = lpi2c_imx_pio_xfer(lpi2c_imx, &msgs[i]);
+		} else
+			result = lpi2c_imx_pio_xfer(lpi2c_imx, &msgs[i]);
 
-		result = lpi2c_imx_msg_complete(lpi2c_imx);
 		if (result)
 			goto stop;
 
@@ -547,6 +1005,49 @@ static int lpi2c_imx_init_recovery_info(struct lpi2c_imx_struct *lpi2c_imx,
 	return 0;
 }
 
+static void lpi2c_dma_exit(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	if (lpi2c_imx->chan_rx) {
+		dma_release_channel(lpi2c_imx->chan_rx);
+		lpi2c_imx->chan_rx = NULL;
+	}
+
+	if (lpi2c_imx->chan_tx) {
+		dma_release_channel(lpi2c_imx->chan_tx);
+		lpi2c_imx->chan_tx = NULL;
+	}
+}
+
+static int lpi2c_dma_init(struct device *dev,
+			  struct lpi2c_imx_struct *lpi2c_imx)
+{
+	int ret;
+
+	lpi2c_imx->chan_rx = lpi2c_imx->chan_tx = NULL;
+	lpi2c_imx->can_use_dma = false;
+
+	/* Prepare for TX DMA: */
+	lpi2c_imx->chan_tx = dma_request_chan(dev, "tx");
+	if (IS_ERR(lpi2c_imx->chan_tx)) {
+		ret = PTR_ERR(lpi2c_imx->chan_tx);
+		lpi2c_imx->chan_tx = NULL;
+		dev_dbg(dev, "can't get TX channel %d\n", ret);
+		return ret;
+	}
+
+	/* Prepare for RX DMA: */
+	lpi2c_imx->chan_rx = dma_request_chan(dev, "rx");
+	if (IS_ERR(lpi2c_imx->chan_rx)) {
+		ret = PTR_ERR(lpi2c_imx->chan_rx);
+		lpi2c_imx->chan_rx = NULL;
+		dev_dbg(dev, "can't get RX channel %d\n", ret);
+		return ret;
+	}
+
+	lpi2c_imx->can_use_dma = true;
+	return 0;
+}
+
 static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL |
@@ -569,12 +1070,13 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	struct lpi2c_imx_struct *lpi2c_imx;
 	unsigned int temp;
 	int irq, ret;
+	struct resource *res;
 
 	lpi2c_imx = devm_kzalloc(&pdev->dev, sizeof(*lpi2c_imx), GFP_KERNEL);
 	if (!lpi2c_imx)
 		return -ENOMEM;
 
-	lpi2c_imx->base = devm_platform_ioremap_resource(pdev, 0);
+	lpi2c_imx->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(lpi2c_imx->base))
 		return PTR_ERR(lpi2c_imx->base);
 
@@ -588,6 +1090,7 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	lpi2c_imx->adapter.dev.of_node	= pdev->dev.of_node;
 	strscpy(lpi2c_imx->adapter.name, pdev->name,
 		sizeof(lpi2c_imx->adapter.name));
+	lpi2c_imx->phy_addr = (dma_addr_t)res->start;
 
 	ret = devm_clk_bulk_get_all(&pdev->dev, &lpi2c_imx->clks);
 	if (ret < 0)
@@ -627,6 +1130,18 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret == -EPROBE_DEFER)
 		goto rpm_disable;
 
+	/* Init DMA */
+	ret = lpi2c_dma_init(&pdev->dev, lpi2c_imx);
+	if (ret) {
+		lpi2c_dma_exit(lpi2c_imx);
+		if (ret == -EPROBE_DEFER)
+			goto rpm_disable;
+		dev_info(&pdev->dev, "LPI2C use pio mode\n");
+	} else
+		dev_info(&pdev->dev, " LPI2C eDMA enabled\n");
+
+	init_completion(&lpi2c_imx->complete);
+
 	ret = i2c_add_adapter(&lpi2c_imx->adapter);
 	if (ret)
 		goto rpm_disable;
-- 
2.34.1


