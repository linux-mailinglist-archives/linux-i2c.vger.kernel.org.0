Return-Path: <linux-i2c+bounces-14149-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1054AC6ABD0
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 17:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ADCBB4F906F
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 16:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B352F36999C;
	Tue, 18 Nov 2025 16:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C82cM+6b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011064.outbound.protection.outlook.com [40.107.130.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8FA36A016;
	Tue, 18 Nov 2025 16:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763484296; cv=fail; b=jrQjkIWGozEh8I86P1nnUm9kuN+KdrcX7f3TCN4rZ42kDcVv4/hDHgy8WC2rJEVnWspFyYTKPgjuJRkhBQ+cbnTs8i5nv7BTkcucKJ0AM9hTl3Hgrbn/W06HOJgvxCLZlTXvz8+M0Zj5WUT1m21R9Vl4N1BAurnLNWSVr8uMOPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763484296; c=relaxed/simple;
	bh=YDyfiQsu0l6aLWnCX1QTjOD7kgC3T2+tTLGgJ77QJNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fmx78we2uXrXsXjbz02CDYXRTp+KPrX72A/U5E4t1Gak+ltsEbMLONGZUVZmIp14BydiJJ4PdzlK5uVdkYy+nCC+avdL4mkUZUnYK0foRhB6mOVBzOG5/4HQ0X0ME1tDv9wEKMzvVvkuw5P5u4maggaKl8RbwxC1bNWVPn5+bKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C82cM+6b; arc=fail smtp.client-ip=40.107.130.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BrFRqNEuUwzCw0KoQN9t5WAArfc8yD/O7fO+5bS7PhMPk4FpWf8nx4rLE48ouTAguWrwWSZHGF9NxpiNgalXMe9e201/pSsmj85OVED5aOWEn0u2HcNamEEB2h4n2BX+yfsE7W2UQz4/fbTZbdcGYS3zZer05oW6zJxRt2HL7WbvV6GcbZQIj4aviDni7g8vmfgMEjskeiuGGw0hF/OkSOvNQ4wUii0fI0Sf6if9CagPWkf9u2rao6UTrQOHUcCgQDDovL6Ke8CJ957q/8tIF0oYmL+vmen/KHtyHhWMv8flZlzWVyFSrPlyMdQInXWWhWKDudmZQZ+L9tFYJh9s9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3F7vcB/GVSDHYw31fTYkjgtDygus9EuicIHw+YPT8Jw=;
 b=mcnjQvt0hU1rHiE5xxMC+WIbKLrEjJ9qMkCkUCXhKLSOZXzomr4gnUm+09Ii31pghU66Qnlmu15QVbYWcXBSspugnMVnNlKR8J59i6Iqg1imPwisunvVXawO5v718BqyrEUMVVo7rOGveO5KrV+zJnGJi99MWPqps9OPLAf8GLjYrIojQM0k5wUu+JbQiHw2JnSG14xWTXiBuNt35nqE6cgXSJDGg3edrG/Z3PLDbj8xq2tcj8LeWlnzjqZ3NMnC6G6B4El4JDxmCuUMI7eHejPc5EHRnrux2lDw7gHp0DOLyfLjt5MK51zS5oT08/lDTLgxdfWMkv+oZ2GmoWRrJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3F7vcB/GVSDHYw31fTYkjgtDygus9EuicIHw+YPT8Jw=;
 b=C82cM+6bunFNBF6emH4jWg8O9YhvBrPCOZiOMpuiQ3JBzc/FY1NgxEKF1syNQDzvl+NhWHwVtjxpYfjgmCb44LeXcivxudqtkgCYFnP46Rl1pjaUr0Hqr3Ke6HOWhG5E+mctOvxn5eDqNijndrt3q7l6kygWCdfvzVti53Ew7UiXq6hgGhO3uQ2yN9Ko5UN4Tf8o1z1zOUPnfo/A+RCyxI3FkGUzS9RuUUDPb0h/+ATWFBsgrAXW1RoUqNhxs15xZiN/VDXuXKoDvP9727JqjZNoq/S/itteYZFkwMtm4hS4tPI3Mxfgqx0KQbMlLkHenUVVlh4sqhliyRl7Dr7ajw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AMBPR04MB11811.eurprd04.prod.outlook.com (2603:10a6:20b:6f4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Tue, 18 Nov
 2025 16:44:49 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 16:44:49 +0000
Date: Tue, 18 Nov 2025 11:44:41 -0500
From: Frank Li <Frank.li@nxp.com>
To: Carlos Song <carlos.song@nxp.com>
Cc: aisheng.dong@nxp.com, andi.shyti@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	pandy.gao@nxp.com, wsa@kernel.org, vz@mleia.com,
	B38611@freescale.com, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: support smbus block read feature
Message-ID: <aRyieUbSqofjEm3a@lizhi-Precision-Tower-5810>
References: <20251118111323.1452329-1-carlos.song@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118111323.1452329-1-carlos.song@nxp.com>
X-ClientProxiedBy: PH7P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::25) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AMBPR04MB11811:EE_
X-MS-Office365-Filtering-Correlation-Id: 7843c00b-a9cc-4921-a456-08de26c1c9c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SF1LI5OgvXkwAofdiHCCprBCOApf6W/1u5g87lVYianiCD2joAKbMczzjdgs?=
 =?us-ascii?Q?ty4z9S5gqjaXlxgCw8KMm3BSvwqYetMYVw5oiRLJZouJFVFDV8H2cqhCPmQs?=
 =?us-ascii?Q?Sdp9DvjXAUmrOPcWr6yLmJ8PDHrW3Q0gGCEwzx1jVuMBxzkFrK5cS63AhAte?=
 =?us-ascii?Q?Q+M6o3xviTYibmC4d08bxDVQjfw9JNP/omvy2gCgHLgTf0PndB1rmHdZKu5G?=
 =?us-ascii?Q?pdn+h93zDgaz//1i+OKTwE8qNoH25SM6riQsPQELnCYwjjgcBDX0c/A2y3AY?=
 =?us-ascii?Q?AQvJ94g90+S2JFMg1RBBXVEkYTjWsBC9YsE5aDm3TNFFW5rDC0YTztMOkiO5?=
 =?us-ascii?Q?ChofbW90NY5QjWlG+w9DQHZNyKSWMw8GdBRPtXeD/E4ZFpbwc5z5UJ3GxFcr?=
 =?us-ascii?Q?R61QA+PpGncOcs8a79ktTAv/73JXNe9J0HsWdBoLDmGhfI6EexI5ymCVN/+F?=
 =?us-ascii?Q?BVbT7quS7zjcaqn+kspkSxTScxC5J1aizZ3//bZ4zlkIe3WHro/K4oBozCZU?=
 =?us-ascii?Q?QtcWmP7wI243nOpUppM2oxjzlZXld0BGw3crIhefiZSZr02z4u/bHr8G+IVx?=
 =?us-ascii?Q?iABT+gLex6BEcwtFaWRY3q45MaSg3zppHRe73t3szSkMT7iIxPUVdesuawJT?=
 =?us-ascii?Q?gRUCnzgTFizBIhayEKLpPhGDeoUzT68cPFd7aOxOAO0M3/bSCzelMR7RRmY6?=
 =?us-ascii?Q?RdjCDkmtc3LgNhSbCPzhu6SMBn3jaDHdav/QrHNCglwBrm6DOkUk6Dm5Q0R6?=
 =?us-ascii?Q?BChffSN/33Y2VWFbXgHh2ZBTivN0UZmZ8E2cRvS2sIlqDrrvWXHiLw9qCrbH?=
 =?us-ascii?Q?tpaxou/PEmiYsMNvzoGuSRxpytI8m5kNa9EIw27HeCWC6oYVl/R4lOsYXdo2?=
 =?us-ascii?Q?zlc/mnk2kaBqpJnoqgfdOb1M7FSa04/yBXpl4XB1zQdwI31HEU+VlLB0cnKP?=
 =?us-ascii?Q?kM2nfNCl4Pb5CBMZfz9STpmWqGEysMrsYWH85TkhnBS4Cxxwn3w1nKMv02KH?=
 =?us-ascii?Q?DoZWDhzgbM0s1wL82/1B2eQ/8tH7vJ44lLbJTA+8KsL3TNoOt9gM5ZkEFsen?=
 =?us-ascii?Q?66axU19yN5y1OgwtbpnHGUfrSqqLIIrCqN9VTZRUjbXtTcLCnaQ6+cFZ3qJv?=
 =?us-ascii?Q?DNhNoG/rHRYbghjTdVtofg9HQsRNqP9pf/JIq2M9jWgsQ+xY5K6XqaI+kQZP?=
 =?us-ascii?Q?AlWRud5KlzgVJQ6jqdrfVT4ErtbLcfuxZMCMHjoKwajsRgBGTEjJziGRtLPj?=
 =?us-ascii?Q?8xrb7O09xTRex0IV7luiw6G1IkKv/cm8BFC081gk1A6v0AnNvURcsoltQfHq?=
 =?us-ascii?Q?Vp3+Q2pcN/6FbgirObQ8qypAgrtJmY5sSA39ncHnY21kX8V10nQUSNCvP+VM?=
 =?us-ascii?Q?Vwg1XTyfDxWteJAcWdSL9a5bsZp5P0cV+SdRywCmxnbcvTGMARczoo/4bPSs?=
 =?us-ascii?Q?0bYrZlwPyvXU3nhHvCy3fUYOimFUyUGzKA/PoCd4iQm6TfidbXFkUb7homkh?=
 =?us-ascii?Q?bLpfaHd5Dw+hKkEGgq7gj0ot2laWLJziMImC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6FRRQ5B7vZLjmHTNR+ZeK6YflVMQSo5ELVgNEEQtqY3MCaZE56Ng5MiYYS6M?=
 =?us-ascii?Q?5NgDruZy2nZ9HlB4KKtwaHp1yANezMEDmzY3sBfU2CtIhYlW1K58ehY3fwc0?=
 =?us-ascii?Q?vFh5/9LhRxmMyS1Kzu34RX4zW2QpGTajcn/EYxCX6jNv7m9YqZ/D7dE6SMh1?=
 =?us-ascii?Q?ylrVPJjYcfeLIJyY4cDpp2gDgFEo5cpyNrQJjfkQ2/KnoNxBbQNIYvRdtx/w?=
 =?us-ascii?Q?eCCn55ISYJyLb7Q4KeR8bLssO7ynYyPBXbASJJVGeQ6Cc+SRITJPkFpxJuA1?=
 =?us-ascii?Q?oB2UwK7uCvdmlSqA4nCWZ77xzmKcasn+N3GooD2cN9+l8OjtNTprekMXWj0+?=
 =?us-ascii?Q?u5oAkXBDGim+vqI8wLGuK+lNb0ojGCX1r4T5DJFAc4hG6ZoF7Hy1zWTSH75S?=
 =?us-ascii?Q?q7tyRgblCQueBN7504ikaDb4x4bEnOrY3hKcfDtGdLDKPh50IAm97KIlqXxo?=
 =?us-ascii?Q?QkW9tCUqzAseFQl8Et3b1qhaKAzJ4r3XWHduH+UtUZ63YKF66S57uDI5cjps?=
 =?us-ascii?Q?Fe2zQ1yRsoL7Ux2PN/Z3Pdz6FZ9P2hlaNzMP5I5V1whK7TwPCRC/Hku5ic1z?=
 =?us-ascii?Q?08UbMJ1Y0IKWar/G9ymaCpKEv7xpZTwBNYJ24QwEhc8AynvSTo2v2V7c+wVf?=
 =?us-ascii?Q?G1L6a2Nh9Z/c6eKizK7CpMuTq0Q/mw7sbOLsfRu0AasjiOVfjLxQgFQjb8op?=
 =?us-ascii?Q?P3glpxQRFiz9KJLyAzeJuLHJyjI1Z5s0NHAmHhQ+vQoHW/b5yD52qiAWBJlg?=
 =?us-ascii?Q?eEzw5LaInt2uD7zjTWno1Ttqk8Ay/tSAnPxCQ1N8hvJJMVsLegDeFAMyYtsO?=
 =?us-ascii?Q?hHt3sPbJdQjW5jLJsjlw+C4x5bX4otYIkpA5UQKjYgrbW+rmMF3u/YhEFZdk?=
 =?us-ascii?Q?fM+dpigslFTz8JIIplTMjxedO3nfF8Dc8G4h6qMj5WwdAmLkdDmI2oesTHFX?=
 =?us-ascii?Q?DprCtUvQ+atmAhcw7N20e1RYb8neLZL2rbqng+06rEJtvfSB6jYJvdC5a7ju?=
 =?us-ascii?Q?eKln44JwO4tIW+RyZ+z7XRRYtydAKt3OOk4xNSKNo+QjDb8h6WR9kdCuNw2j?=
 =?us-ascii?Q?hFNPw677Ie47sgy0Krp8IsachTGXogl+slkOgxyGXhG3g9nLNScjhvxe0Mh9?=
 =?us-ascii?Q?7dyCUdQIXDhKPKpuNU7Ks0R3mf7djSK9sbuAf7MYddR3mTzA1NHcuSLxpKy9?=
 =?us-ascii?Q?jSpA0f4yuYLDKvXlQ5h7vivGVdSDSsQbItpuOR+Wyawg86yNX/11lU8zSyt9?=
 =?us-ascii?Q?wh9F1mTEsqg5jpUPb9DrfDEZVlnzEDSYPbylgSG+wxQSECkgQDy+IN2i89qy?=
 =?us-ascii?Q?bjdLNcwvxt5+mRhK2ZjeztSZ6PqgLi4cDXXtBEX2s7Ejl1b+y8OK982wu0x7?=
 =?us-ascii?Q?4h4t3EF5Hofv63J+Uf5dj+E2N/M034SmEEDKrS3vB4S2kuzOTesxBVbLEszo?=
 =?us-ascii?Q?13qb5gTvRKUfAnV/mGkphb2/3DL+06MIOQ2MlcPWExjoDzX8LK9LDNih5azc?=
 =?us-ascii?Q?Rprwk3rYp3SdEImHqhDFuyWU8tUzOIWP2/34prM77xRgJ1hjjmUzgVyKJbVK?=
 =?us-ascii?Q?WOd0smIQ4nVYf+OYsmWdB02wU6a7z222084OdgFr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7843c00b-a9cc-4921-a456-08de26c1c9c4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:44:49.0591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvmkRSUy09AethKn0f3slTPeyjQj+WCNFeo4IbyqVMrQoZwuAavDnFWOtc6VU8uJwUfTYqLZSHYH7m1pixYSBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11811

On Tue, Nov 18, 2025 at 07:13:23PM +0800, Carlos Song wrote:
> The LPI2C controller automatically transmits a NACK on the last byte
> of a receive data command. It transmits the NACK unless the next
> command in the TXFIFO is also a receive data command. If the transmit
> FIFO is empty when a receive data command completes, a NACK is also
> automatically transmitted.
>
> Specially set read 2 bytes command initially. When the RXFIFO receives
> count data, controller should immediately read out this value and update
> MTDR register to keep the TXFIFO not empty. Set new receive data command
> to read other data before the 2nd byte is returned.
>
> Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
>
> ---
> I setup an env to test this feature change:
>
> On I.MX93-EVK:
> LPI2C5 as slave device and use i2ctool to redesign the slave-eeprom mem:
>
> hexdump -C /sys/bus/i2c/devices/5-1064/slave-eeprom
>
> root@imx93evk:~# hexdump -C /sys/bus/i2c/devices/5-1064/slave-eeprom
> 00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
> 00000010  20 00 01 02 03 04 05 06  07 08 09 0a 0b 0c 0d 0e  | ...............|
> 00000020  0f 10 11 12 13 14 15 16  17 18 19 1a 1b 1c 1d 1e  |................|
> 00000030  1f ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
> 00000040  08 00 01 02 03 04 05 06  07 ff ff ff ff ff ff ff  |................|
> 00000050  00 ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
> 00000060  40 ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |@...............|
> 00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
>
> case1: SMBus block read 0x10 register. SMBus len = 32 bytes.
> case2: SMBus block read 0x40 register. SMBus len = 8 bytes.
> case3: SMBus block read 0x50 register. SMBus len = 0 bytes. It break the
> SMBus spec(len = 0).
> case4: SMBus block read 0x60 register. SMBus len = 64 bytes. It break
> the SMBus spec(len >= 32bytes).
>
> LPI2C3 as master controller to smbus block tead the slave device at 0x64.
> Not apply this fix:
> root@imx93evk:~# i2cget -f -y 3 0x64 0x10 s
> Error: Read failed
> root@imx93evk:~# i2cget -f -y 3 0x64 0x40 s
> Error: Read failed
> root@imx93evk:~# i2cget -f -y 3 0x64 0x50 s
> Error: Read failed
> root@imx93evk:~# i2cget -f -y 3 0x64 0x60 s
> 0x00
>
> After apply this fix:
> root@imx93evk:~# i2cget -f -y 3 0x64 0x10 s

where show your read 32 byte, do you means "i2cget -f -y 3 0x64 0x10 s 0x20"?

> 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0a 0x0b 0x0c 0x0d 0x0e 0x0f
> 0x10 0x11 0x12 0x13 0x14 0x15 0x16 0x17 0x18 0x19 0x1a 0x1b 0x1c 0x1d 0x1e 0x1f

according to above dump, the data from 0x11, not 0x10.

Frank

> root@imx93evk:~# i2cget -f -y 3 0x64 0x40 s
> 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07
> root@imx93evk:~# i2cget -f -y 3 0x64 0x50 s
> [  184.098094] i2c i2c-3: Invalid SMBus block read length
> Error: Read failed
> root@imx93evk:~# i2cget -f -y 3 0x64 0x60 s
> [  179.722105] i2c i2c-3: Invalid SMBus block read length
> Error: Read failed
>
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 93 +++++++++++++++++++++++-------
>  1 file changed, 73 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index d882126c1778..39088567db59 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -90,6 +90,7 @@
>  #define MRDR_RXEMPTY	BIT(14)
>  #define MDER_TDDE	BIT(0)
>  #define MDER_RDDE	BIT(1)
> +#define MSR_RDF_ASSERT(x) FIELD_GET(MSR_RDF, (x))
>
>  #define SCR_SEN		BIT(0)
>  #define SCR_RST		BIT(1)
> @@ -461,7 +462,7 @@ static bool lpi2c_imx_write_txfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atom
>
>  static bool lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
>  {
> -	unsigned int blocklen, remaining;
> +	unsigned int remaining;
>  	unsigned int temp, data;
>
>  	do {
> @@ -472,15 +473,6 @@ static bool lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomi
>  		lpi2c_imx->rx_buf[lpi2c_imx->delivered++] = data & 0xff;
>  	} while (1);
>
> -	/*
> -	 * First byte is the length of remaining packet in the SMBus block
> -	 * data read. Add it to msgs->len.
> -	 */
> -	if (lpi2c_imx->block_data) {
> -		blocklen = lpi2c_imx->rx_buf[0];
> -		lpi2c_imx->msglen += blocklen;
> -	}
> -
>  	remaining = lpi2c_imx->msglen - lpi2c_imx->delivered;
>
>  	if (!remaining) {
> @@ -493,12 +485,7 @@ static bool lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomi
>  	lpi2c_imx_set_rx_watermark(lpi2c_imx);
>
>  	/* multiple receive commands */
> -	if (lpi2c_imx->block_data) {
> -		lpi2c_imx->block_data = 0;
> -		temp = remaining;
> -		temp |= (RECV_DATA << 8);
> -		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
> -	} else if (!(lpi2c_imx->delivered & 0xff)) {
> +	if (!(lpi2c_imx->delivered & 0xff)) {
>  		temp = (remaining > CHUNK_DATA ? CHUNK_DATA : remaining) - 1;
>  		temp |= (RECV_DATA << 8);
>  		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
> @@ -536,18 +523,80 @@ static int lpi2c_imx_write_atomic(struct lpi2c_imx_struct *lpi2c_imx,
>  	return err;
>  }
>
> +static unsigned int lpi2c_SMBus_block_read_single_byte(struct lpi2c_imx_struct *lpi2c_imx)
> +{
> +	unsigned int val, data;
> +	int ret;
> +
> +	ret = readl_poll_timeout(lpi2c_imx->base + LPI2C_MSR, val,
> +				 MSR_RDF_ASSERT(val), 1, 1000);
> +	if (ret) {
> +		dev_err(&lpi2c_imx->adapter.dev, "SMBus read count timeout %d\n", ret);
> +		return ret;
> +	}
> +
> +	data = readl(lpi2c_imx->base + LPI2C_MRDR);
> +	lpi2c_imx->rx_buf[lpi2c_imx->delivered++] = data & 0xff;
> +
> +	return data;
> +}
> +
>  static void lpi2c_imx_read_init(struct lpi2c_imx_struct *lpi2c_imx,
>  				struct i2c_msg *msgs)
>  {
> -	unsigned int temp;
> +	unsigned int temp, ret, block_len;
>
>  	lpi2c_imx->rx_buf = msgs->buf;
>  	lpi2c_imx->block_data = msgs->flags & I2C_M_RECV_LEN;
>
>  	lpi2c_imx_set_rx_watermark(lpi2c_imx);
> -	temp = msgs->len > CHUNK_DATA ? CHUNK_DATA - 1 : msgs->len - 1;
> -	temp |= (RECV_DATA << 8);
> -	writel(temp, lpi2c_imx->base + LPI2C_MTDR);
> +
> +	if (!lpi2c_imx->block_data) {
> +		temp = msgs->len > CHUNK_DATA ? CHUNK_DATA - 1 : msgs->len - 1;
> +		temp |= (RECV_DATA << 8);
> +		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
> +	} else {
> +		/*
> +		 * The LPI2C controller automatically transmits a NACK on the last byte
> +		 * of a receive data command. It transmits the NACK unless the next
> +		 * command in the TXFIFO is also a receive data command. If the transmit
> +		 * FIFO is empty when a receive data command completes, a NACK is also
> +		 * automatically transmitted.
> +		 * So specially set read 2 bytes read command initially. First byte in
> +		 * RXFIFO is SMBus block data length, when the data enter the RXFIFO,
> +		 * controller should immediately read out and update MTDR register to keep
> +		 * the TXFIFO not empty. Second byte is the first byte of block data.
> +		 * So the data length of the subsequent block data read command should be
> +		 * block_len - 1, because in the first read command, the first byte of block
> +		 * data has already been stored in RXFIFO.
> +		 */
> +		writel((RECV_DATA << 8) | 0x01, lpi2c_imx->base + LPI2C_MTDR);
> +
> +		/* Read the first byte as block len */
> +		block_len = lpi2c_SMBus_block_read_single_byte(lpi2c_imx);
> +		if (block_len < 0) {
> +			dev_err(&lpi2c_imx->adapter.dev, "SMBus read data length timeout\n");
> +			return;
> +		}
> +
> +		/* Confirm SMBus transfer meets protocol */
> +		if (block_len == 0 || block_len > I2C_SMBUS_BLOCK_MAX) {
> +			dev_err(&lpi2c_imx->adapter.dev, "Invalid SMBus block read length\n");
> +			return;
> +		}
> +
> +		/* If just read 1 byte then read out from fifo. No need new command update */
> +		if (block_len == 1) {
> +			ret = lpi2c_SMBus_block_read_single_byte(lpi2c_imx);
> +			if (ret < 0)
> +				dev_err(&lpi2c_imx->adapter.dev, "SMBus read data timeout\n");
> +			return;
> +		}
> +
> +		/* Block read other length data need to update command again*/
> +		writel((RECV_DATA << 8) | (block_len - 2), lpi2c_imx->base + LPI2C_MTDR);
> +		lpi2c_imx->msglen += block_len;
> +	}
>  }
>
>  static bool lpi2c_imx_read_chunk_atomic(struct lpi2c_imx_struct *lpi2c_imx)
> @@ -599,6 +648,10 @@ static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
>  	if (pm_suspend_in_progress())
>  		return false;
>
> +	/* DMA is not suitable for SMBus block read */
> +	if (msg->flags & I2C_M_RECV_LEN)
> +		return false;
> +
>  	/*
>  	 * When the length of data is less than I2C_DMA_THRESHOLD,
>  	 * cpu mode is used directly to avoid low performance.
> --
> 2.34.1
>

