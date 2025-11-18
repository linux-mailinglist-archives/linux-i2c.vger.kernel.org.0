Return-Path: <linux-i2c+bounces-14136-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA0AC6903C
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 12:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4242F4EF140
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 11:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBA834E760;
	Tue, 18 Nov 2025 11:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Psje1YrR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011069.outbound.protection.outlook.com [52.101.70.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E720B17D2;
	Tue, 18 Nov 2025 11:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464435; cv=fail; b=sU+xn0TY4qsHnSb2D+gOuxPzswDdlrtq6XbojchxoZZnWi25QZUrxWMEGCRn1+ytWxKcT38ofssb/61p06+OQcSGVwgKl3GjIl+TishZnBGTVxT4yohJIb5/4wqHSoNp75qEfStgnV+6XAkZ9EYR00QVOzWj6BxA3aJo/S8kawM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464435; c=relaxed/simple;
	bh=SBUUyS3R6YJgZcMUZYP6O+PNtXrlRO+kq6woWWncgms=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=o+9pfJR08Kp47dv1C7ZHdRCbPiyDGBXFs5dlGQcuijLEbt7oOg4td/NjUX2uThb8mn+4U8T/8Yg/zrU+QXJG7PaFtqU9bDCsKWyioI9O1Da3OjNidobOMJV8SfILkEpgBgv+/s1nPNcKR2kgmG+gYsW4PQMt1NW7v5OfbpCBm54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Psje1YrR; arc=fail smtp.client-ip=52.101.70.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylbIDsHRGWHbEF4RL0USMRvJYSubZcO6JF/nnxUfKkcyqMkatkKY0ccz5J4VFevrJX+HG2QZ5gcYwMobF5pN62HbBx+EVZIsC5iOMRRQwBhcCVa9QokUxoHrsaXwlbGDuzlO8R3fqn82qjxaXUkpwLMzEWKkv5zWTDxhTlDjuSAKk3DWxG+MC9nVcqNrwy3+GNv0ElVcH46ir+LuQ4RNhYjNC3Zo2w7hFyOvx7oxAAo5kgDfzSVXFBziwhpJxkl2L4mWO4p2oD+ZRFhj9eHnu32KIatM+OnXNiVJe1z9NuEo9r6VF/VH0pofGwGqL+vP4tUj+cOqAts4b6X0mjZDWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQVpu4SjuLS771oRygta/h7fUMMlW9Je3t45nvDHyX8=;
 b=Nc8y8XUyId7nyPoNZnuHCQ+XiKm/tTqWu15gCx82EP7FrUNqEQxceZtmWAFI1l8kKKyCAYTNvGRLdIZsV8sCakBBi9wvsLmqaUPte6L+V5hscAY68VJKChqbxvy6OGXgraZcm3FWopJs/qYamhqIPX5s3niaiCW2CmhZkzEjVb5qf80EiarORh/PVPJY6kVXw1NORFbIMhWyjPssiat6cxMr3Hg0mF1bl1wFa5qlh+qPBEN77OPDthDGaD/YBAuBjm2ZSIUTLetlX7ROE4SgzRKKsjmsG+vlZQ2EHqSk3dHRbbPsVK49ZXA1Rro5yhDL35+t2ogDKYDESWBaWIkVtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQVpu4SjuLS771oRygta/h7fUMMlW9Je3t45nvDHyX8=;
 b=Psje1YrR6hY0jTxlHcIWLlSx2CxFj2bISgFK8fLFdR90iEHqGoKZHO6qqhItQlLcVFJ4hp/ftVzgwahzF4I8NVYM0aGi2n4PF38spXmJF48Xfd34Snb1cxuf4ENx2EFTlQNXh8lXBIOz8iqGXZaw3Ul29i/2pU8SWV97TIcY8hyoqLU1uPTWaR/6qQZv0YLOh2Bmt0BvcEOjuMqiEe98AfdXWKP5Fux3UrsWqzCf4Y2mqjAm1lh/IGruu7mEDdQzqjjdAKtmPikQ0yQjipMKhGVjC599zpAhPiP8xyV78eC0UQOsh//ze6qIHUs2BO0gEtzY1/sSRukYqR5KxZZmLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by GVXPR04MB10708.eurprd04.prod.outlook.com
 (2603:10a6:150:225::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 11:13:49 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 11:13:49 +0000
From: Carlos Song <carlos.song@nxp.com>
To: aisheng.dong@nxp.com,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	pandy.gao@nxp.com,
	wsa@kernel.org,
	vz@mleia.com,
	B38611@freescale.com,
	frank.li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Carlos Song <carlos.song@nxp.com>
Subject: [PATCH] i2c: imx-lpi2c: support smbus block read feature
Date: Tue, 18 Nov 2025 19:13:23 +0800
Message-Id: <20251118111323.1452329-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0016.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::8) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|GVXPR04MB10708:EE_
X-MS-Office365-Filtering-Correlation-Id: cb6372bc-ed25-4224-38d9-08de26938c54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n0ThtFX7db9dalCN9TiJVnm9/2Nu6D7EKsAHrGrRIGq/HQbeLev2YZc6Atcm?=
 =?us-ascii?Q?Q1Kt/aiKkg+BYSJ5n3C6uetWC/g3k3hRW/lYXFpy6BupmDWHKueFSXmMY886?=
 =?us-ascii?Q?WmZw7i7qhpYq5mcZaZ8ng5c4WSVr37iwDfXB6pihQKs0lVIz0X7h/RGTFOJ5?=
 =?us-ascii?Q?qmu96RLFYTk2WlzT0XVV+NO0vd3RaEhoXq1ub45qbksWYvxR2aCl6aFWQNMd?=
 =?us-ascii?Q?VDrfjn1HH9UC/K44swf5jtoajTg4CqApWf5ASFOMq1CeSWiQ6q93P19603S1?=
 =?us-ascii?Q?r9p0AOMlfzT4od4/iUVLAVa5/r4mEPnoXaBznfF/sf7+izEifDvfMHRwSCtv?=
 =?us-ascii?Q?RCoTBIBaQvF4+seH8seEDkyooMlPQy2BUPQY/TGwvNMjYFtKnZ1J9jtnMvfG?=
 =?us-ascii?Q?Yk1vp26lFwXz4ATFldqx50NaMH8jVgK+IS35UguCPWVrcnlmInVEWmLo/uh3?=
 =?us-ascii?Q?Hm8GAoLfWXg+zw70p8rOMai+wY/W8Se2CBv/AjyV/shNDiAzw9jhFO7TOyrp?=
 =?us-ascii?Q?OexHJ+TNNpm2400KjtKAjw8STAdA/HC1lRLA/KAZFfzd7344LGWRpMXWefJi?=
 =?us-ascii?Q?5mlDb7Gm0JBXngEdj+ashUeBQkYS/vVSbG6q02A1vi1Q48bA0dFpM0ChQ7hy?=
 =?us-ascii?Q?4iLyehZaUf9ksqjYq2okzhtFfKe/VurDLFHOJyn6GZG9xGv3Qps5lT9wbkH8?=
 =?us-ascii?Q?Bjs2Kxt5jJdiovf3+L0RrV+EcDiqQsme0fs41F/eIpJ9YBvUsjFt1QmBw1+C?=
 =?us-ascii?Q?ETsBi8y946CtppzMEvoC7riwesEvxBPAH9nahAvHx9h/pWvseELcO7hGx+Pp?=
 =?us-ascii?Q?3hux7YJ5FLD6Otj+Qp1ZJoZha8M8XqmlMCYavpu7M1jL73HjRDoTvGXSl0of?=
 =?us-ascii?Q?pkagtpBUAswwDIwl5EPub5g/nOZzaXMvWsF+VNwhnxnbOeZwgaZGI7d9onGd?=
 =?us-ascii?Q?pDHA2H8/l53Imj5NbYS+5TIBfd0z3xAvyZBW+nHDmCWn7RYqVdgVFJI3U9ew?=
 =?us-ascii?Q?dLvl9DgihWZHIeuD3DswsDy+uX42ttYmvHcWJpcG/cmuNtle6w70n+3RgeNd?=
 =?us-ascii?Q?LMHnBrpSSB7sTInarQiFct9KLpcv3hePuSzR8wYAC98WFfgF0djDO0PDU81P?=
 =?us-ascii?Q?HtDNsHgxbs5Dha6SeirKEOR3Wm7L1ZLzrWO1/hi2oxhb9F2pULb/pxR8MQwv?=
 =?us-ascii?Q?1413c+Uh3gQBHqkTgj3Qc6NqCN2lbK0QWNj1qKyRS9L9+ENIe1MCjHdCA45q?=
 =?us-ascii?Q?qTRA6zVfKHcArlnLlw3wF7+h0YLpZ6T3IOvfFXYiddTIOPMJpT1fbAdO7Tbr?=
 =?us-ascii?Q?mjSt0xyam/tzfItT0vfZv182z7jHfv7PelpaIRJBlEf76918UfvxN0dYwNph?=
 =?us-ascii?Q?FnitJJvjZsGfdviwSwgtrFvdyKnQ/rUMNQRqMKIxi30bjAYCshEjnfyquVkE?=
 =?us-ascii?Q?ERn2T1UaAR0kssQhVMbvdADrs16azZx47ua/h3iuUSzdQvn2nXWuBkBYue7H?=
 =?us-ascii?Q?ktDe8ZiesYXer5sMKG9JjUU10y+JP5Mz804lCnnHpteHADSXDRMP016vGg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6GeKpXepFgv2NY2OLuo0VUvUzuIBk+zXc26VMs54YB/WH2jzbqwV2hqPDaLc?=
 =?us-ascii?Q?7yPJvpP/RAKm28lMHVYt9T0xEb34aAVYGYULtWS5X7uUB/zUuDNcYs5ytMWs?=
 =?us-ascii?Q?7I6/+k+WTgmfkElAp916fLFKDtd1KDU0GtRHbxuLqsEPBYqym7PNerIkktqA?=
 =?us-ascii?Q?ZyEiw3MBCG65ZY19N6kdOW1OjEbAJ/nDuYyTcqXpRoK8avbcau5KgHYOJpj2?=
 =?us-ascii?Q?6ySaA+X4QIkilIC10IMuyI5nlA3Qz3NOO1hTmqq5oKlhvuSXvNhH74hRMhNJ?=
 =?us-ascii?Q?QCoZ29blJs/4xSbJLsTJgBIBjhetjSPtuQVrGi0KtIqfmZZus0BN347Jdgxb?=
 =?us-ascii?Q?VkcLCg9Pu2LY6h+2hI6WJXwzrscpybDhRWWeA6Tpo0An8wTZ0QzW1AraoSVe?=
 =?us-ascii?Q?+E7ZOAqeKg8OEcK2DN8ayOQcfzIeuXWtX0SrG7l6eplZKztoX+lZMZE6w6LF?=
 =?us-ascii?Q?MFfA0TL6MmzT3B7B2XLDZLD6f7em3NVGvyrt5d7aeeQYBfSvvl3MxW2xnVeG?=
 =?us-ascii?Q?aeckVyyreeq1Z/ZrqggPLqQ6Rgw7W9ZqKL+3c31RMADMDvmw6jWJivn3SFkM?=
 =?us-ascii?Q?5Dw/l2nRDk/BUEI+iuJqcBY7ohWlvgUUUE7Hh4aPtJtUiIDcr2lFvQKOuWNw?=
 =?us-ascii?Q?yrarPBbXd6Kz5AE/KwnLVtt3nyGOJp78lWrCjAzT37Xcw8UUnTTar+y8oAQL?=
 =?us-ascii?Q?QQ3UGjWiQjKPCazawo6mQ+wk3o4pGMS3UHP8TTV8Y0oa8fhvXNaGShD24bx4?=
 =?us-ascii?Q?inLgLs6jeNu/3EWl0Rprl7yX9kI3FdUuw0D3c5LtMD0JRoSGyhJtD0VYRT6s?=
 =?us-ascii?Q?LyN0DkUXSeao8CJN/HTliV+SFst340FvgkgR3WppAgbZbGmIbLWiKlv2jCKM?=
 =?us-ascii?Q?7kAJWFNyBYygxjCdHbORH2FkD6JvIsSQeZVdRaYxfrgxxX51AmpUYYE2+m9F?=
 =?us-ascii?Q?hBdaUv6rwk5CaxpamgQHH1uV1RXncpN9kaRtYCJoFOPnzKHAc4RQf4IEGWCS?=
 =?us-ascii?Q?2rJl7ytXLCboVOL++NQIynepG8trUzy5kpPJnZGKgqvoB70XOy2o73GDnZJ3?=
 =?us-ascii?Q?lg1aj8CBteW/bEEeu2pJOR2DIqGdVn2hdds7XF4jSMJbRDXIZBztQ7hNmZ/m?=
 =?us-ascii?Q?ocivwj9fzM/V1vR9YbzuPi0Zsg+8tQNkA3yGYgeLx+DdsAFWdvKD1ZdIfhGc?=
 =?us-ascii?Q?zHrKlKuj0kIVq3kT5oYLw4j5emT3tVWAOKKj9wjbu+RWGti58gj918MN96U0?=
 =?us-ascii?Q?q1RtArumUXhsrNiapkWmifR2znD1BZSpjNwUHaW4KEdahW2svLDzBhbahTPq?=
 =?us-ascii?Q?GPnwVjDzysEA6ltbK9ePviUE/ffVqJ/V7tuzQ79mYJRNRd1IlgNyBumr3NtY?=
 =?us-ascii?Q?IjZ5FTcwDm+3HCmKddCQ5eyX6uMUR7cyVk/4dJ1b0Yd5n48+Nco6aRuw25KX?=
 =?us-ascii?Q?zQJ4uvHuB9fOA1KL/FYdGpjtmUFrzPw8E8LlLHl+tBQnjwRLX69rpCveKk/3?=
 =?us-ascii?Q?Vobq+iI3vqEWLoVulKd+fwc9SpQkcWEN38U5omiKuzsinzjPs4m8g7nBdqGq?=
 =?us-ascii?Q?4ypbX/P8E0JVIQaFU649sL6lJjc5xdrQrMF0AXZ+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb6372bc-ed25-4224-38d9-08de26938c54
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 11:13:49.4743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jpW9aAp4y70FdnrDvvVZhgyoXWpVpmoBGV8X9TAhYXq/eWOzkN1Boc99T2GQOkocNBWpN1tZAnc1NviJ4pfIvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10708

The LPI2C controller automatically transmits a NACK on the last byte
of a receive data command. It transmits the NACK unless the next
command in the TXFIFO is also a receive data command. If the transmit
FIFO is empty when a receive data command completes, a NACK is also
automatically transmitted.

Specially set read 2 bytes command initially. When the RXFIFO receives
count data, controller should immediately read out this value and update
MTDR register to keep the TXFIFO not empty. Set new receive data command
to read other data before the 2nd byte is returned.

Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
Signed-off-by: Carlos Song <carlos.song@nxp.com>

---
I setup an env to test this feature change:

On I.MX93-EVK:
LPI2C5 as slave device and use i2ctool to redesign the slave-eeprom mem:

hexdump -C /sys/bus/i2c/devices/5-1064/slave-eeprom

root@imx93evk:~# hexdump -C /sys/bus/i2c/devices/5-1064/slave-eeprom
00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000010  20 00 01 02 03 04 05 06  07 08 09 0a 0b 0c 0d 0e  | ...............|
00000020  0f 10 11 12 13 14 15 16  17 18 19 1a 1b 1c 1d 1e  |................|
00000030  1f ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000040  08 00 01 02 03 04 05 06  07 ff ff ff ff ff ff ff  |................|
00000050  00 ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000060  40 ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |@...............|
00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|

case1: SMBus block read 0x10 register. SMBus len = 32 bytes.
case2: SMBus block read 0x40 register. SMBus len = 8 bytes.
case3: SMBus block read 0x50 register. SMBus len = 0 bytes. It break the
SMBus spec(len = 0).
case4: SMBus block read 0x60 register. SMBus len = 64 bytes. It break
the SMBus spec(len >= 32bytes).

LPI2C3 as master controller to smbus block tead the slave device at 0x64.
Not apply this fix:
root@imx93evk:~# i2cget -f -y 3 0x64 0x10 s
Error: Read failed
root@imx93evk:~# i2cget -f -y 3 0x64 0x40 s
Error: Read failed
root@imx93evk:~# i2cget -f -y 3 0x64 0x50 s
Error: Read failed
root@imx93evk:~# i2cget -f -y 3 0x64 0x60 s
0x00

After apply this fix:
root@imx93evk:~# i2cget -f -y 3 0x64 0x10 s
0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0a 0x0b 0x0c 0x0d 0x0e 0x0f
0x10 0x11 0x12 0x13 0x14 0x15 0x16 0x17 0x18 0x19 0x1a 0x1b 0x1c 0x1d 0x1e 0x1f
root@imx93evk:~# i2cget -f -y 3 0x64 0x40 s
0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07
root@imx93evk:~# i2cget -f -y 3 0x64 0x50 s
[  184.098094] i2c i2c-3: Invalid SMBus block read length
Error: Read failed
root@imx93evk:~# i2cget -f -y 3 0x64 0x60 s
[  179.722105] i2c i2c-3: Invalid SMBus block read length
Error: Read failed

---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 93 +++++++++++++++++++++++-------
 1 file changed, 73 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index d882126c1778..39088567db59 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -90,6 +90,7 @@
 #define MRDR_RXEMPTY	BIT(14)
 #define MDER_TDDE	BIT(0)
 #define MDER_RDDE	BIT(1)
+#define MSR_RDF_ASSERT(x) FIELD_GET(MSR_RDF, (x))
 
 #define SCR_SEN		BIT(0)
 #define SCR_RST		BIT(1)
@@ -461,7 +462,7 @@ static bool lpi2c_imx_write_txfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atom
 
 static bool lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
 {
-	unsigned int blocklen, remaining;
+	unsigned int remaining;
 	unsigned int temp, data;
 
 	do {
@@ -472,15 +473,6 @@ static bool lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomi
 		lpi2c_imx->rx_buf[lpi2c_imx->delivered++] = data & 0xff;
 	} while (1);
 
-	/*
-	 * First byte is the length of remaining packet in the SMBus block
-	 * data read. Add it to msgs->len.
-	 */
-	if (lpi2c_imx->block_data) {
-		blocklen = lpi2c_imx->rx_buf[0];
-		lpi2c_imx->msglen += blocklen;
-	}
-
 	remaining = lpi2c_imx->msglen - lpi2c_imx->delivered;
 
 	if (!remaining) {
@@ -493,12 +485,7 @@ static bool lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomi
 	lpi2c_imx_set_rx_watermark(lpi2c_imx);
 
 	/* multiple receive commands */
-	if (lpi2c_imx->block_data) {
-		lpi2c_imx->block_data = 0;
-		temp = remaining;
-		temp |= (RECV_DATA << 8);
-		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
-	} else if (!(lpi2c_imx->delivered & 0xff)) {
+	if (!(lpi2c_imx->delivered & 0xff)) {
 		temp = (remaining > CHUNK_DATA ? CHUNK_DATA : remaining) - 1;
 		temp |= (RECV_DATA << 8);
 		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
@@ -536,18 +523,80 @@ static int lpi2c_imx_write_atomic(struct lpi2c_imx_struct *lpi2c_imx,
 	return err;
 }
 
+static unsigned int lpi2c_SMBus_block_read_single_byte(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	unsigned int val, data;
+	int ret;
+
+	ret = readl_poll_timeout(lpi2c_imx->base + LPI2C_MSR, val,
+				 MSR_RDF_ASSERT(val), 1, 1000);
+	if (ret) {
+		dev_err(&lpi2c_imx->adapter.dev, "SMBus read count timeout %d\n", ret);
+		return ret;
+	}
+
+	data = readl(lpi2c_imx->base + LPI2C_MRDR);
+	lpi2c_imx->rx_buf[lpi2c_imx->delivered++] = data & 0xff;
+
+	return data;
+}
+
 static void lpi2c_imx_read_init(struct lpi2c_imx_struct *lpi2c_imx,
 				struct i2c_msg *msgs)
 {
-	unsigned int temp;
+	unsigned int temp, ret, block_len;
 
 	lpi2c_imx->rx_buf = msgs->buf;
 	lpi2c_imx->block_data = msgs->flags & I2C_M_RECV_LEN;
 
 	lpi2c_imx_set_rx_watermark(lpi2c_imx);
-	temp = msgs->len > CHUNK_DATA ? CHUNK_DATA - 1 : msgs->len - 1;
-	temp |= (RECV_DATA << 8);
-	writel(temp, lpi2c_imx->base + LPI2C_MTDR);
+
+	if (!lpi2c_imx->block_data) {
+		temp = msgs->len > CHUNK_DATA ? CHUNK_DATA - 1 : msgs->len - 1;
+		temp |= (RECV_DATA << 8);
+		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
+	} else {
+		/*
+		 * The LPI2C controller automatically transmits a NACK on the last byte
+		 * of a receive data command. It transmits the NACK unless the next
+		 * command in the TXFIFO is also a receive data command. If the transmit
+		 * FIFO is empty when a receive data command completes, a NACK is also
+		 * automatically transmitted.
+		 * So specially set read 2 bytes read command initially. First byte in
+		 * RXFIFO is SMBus block data length, when the data enter the RXFIFO,
+		 * controller should immediately read out and update MTDR register to keep
+		 * the TXFIFO not empty. Second byte is the first byte of block data.
+		 * So the data length of the subsequent block data read command should be
+		 * block_len - 1, because in the first read command, the first byte of block
+		 * data has already been stored in RXFIFO.
+		 */
+		writel((RECV_DATA << 8) | 0x01, lpi2c_imx->base + LPI2C_MTDR);
+
+		/* Read the first byte as block len */
+		block_len = lpi2c_SMBus_block_read_single_byte(lpi2c_imx);
+		if (block_len < 0) {
+			dev_err(&lpi2c_imx->adapter.dev, "SMBus read data length timeout\n");
+			return;
+		}
+
+		/* Confirm SMBus transfer meets protocol */
+		if (block_len == 0 || block_len > I2C_SMBUS_BLOCK_MAX) {
+			dev_err(&lpi2c_imx->adapter.dev, "Invalid SMBus block read length\n");
+			return;
+		}
+
+		/* If just read 1 byte then read out from fifo. No need new command update */
+		if (block_len == 1) {
+			ret = lpi2c_SMBus_block_read_single_byte(lpi2c_imx);
+			if (ret < 0)
+				dev_err(&lpi2c_imx->adapter.dev, "SMBus read data timeout\n");
+			return;
+		}
+
+		/* Block read other length data need to update command again*/
+		writel((RECV_DATA << 8) | (block_len - 2), lpi2c_imx->base + LPI2C_MTDR);
+		lpi2c_imx->msglen += block_len;
+	}
 }
 
 static bool lpi2c_imx_read_chunk_atomic(struct lpi2c_imx_struct *lpi2c_imx)
@@ -599,6 +648,10 @@ static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
 	if (pm_suspend_in_progress())
 		return false;
 
+	/* DMA is not suitable for SMBus block read */
+	if (msg->flags & I2C_M_RECV_LEN)
+		return false;
+
 	/*
 	 * When the length of data is less than I2C_DMA_THRESHOLD,
 	 * cpu mode is used directly to avoid low performance.
-- 
2.34.1


