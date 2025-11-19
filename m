Return-Path: <linux-i2c+bounces-14175-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 942A0C70403
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 17:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C1DC13A873B
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 16:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4097C364030;
	Wed, 19 Nov 2025 16:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dwNjz6qw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013047.outbound.protection.outlook.com [40.107.159.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBDB349B1E;
	Wed, 19 Nov 2025 16:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763570671; cv=fail; b=UHwPVFEfKR3cEgiTRRHoXio8VgxpZS7Bbfq0tnltXc4pWRpivlWerNxrgQY1CEVY85Is4lrp87jGcDyoWFxbWxK3vqyEugRPgZezGPwMLPDUqgH4pUlxWLREi2ThBNBB1Gl6oncUWB1ZLIrKvB8CNbiTLM1NZMAyCW3LxibQqEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763570671; c=relaxed/simple;
	bh=uiq4nPifFC6K40lIqMf9mtFqR31jB+twXxPQ+uQ5ZUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OyRQj99EHmUQENQrjby7Q5ow3vytnMYT4Kx/zcIa/V/VDBUtZIDVHb99RnZazxFVvxFCpC6wz6zgLMX3zLxOFNjX905A4X4ZU6E2bczUdM4EYIpZmYZ4VbiCqZxZ9JaBeaSyCvZz3UQZOaCq+7/gUSY9R+Lw04eiRFXP6R85ESA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dwNjz6qw; arc=fail smtp.client-ip=40.107.159.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wU51jLx7K/SrK0RGt9C6LdRtrjimXE5E9JO1T97tUIZyJN8neYJcXwaqfo7yoAiPDoDFLbgxeMpblwisd4TwkwipwEfElSAdJhY4hqNYmXxHxek5g13nQdUKx/y90fz0nk2WWNdtgtORuupH1O2xA0U8W8mBeQet2tDQl+vp34wi9KAVKPby4Xjjz9cb/2+VyjFeBOTvFVQjzKhaQ0/MEKae7tLuHTgl5pNb5AVBnN+FokXADeyPhjzg7kosquPqZDoqPLZuSDW9GYB5dAhSYpSBCFww9+wAfu0/AukfJHiaJ0xwZblR4EC001V2YAH9NaBrQQ9mG5mvFv5HshUqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3gwSpEylsAqZSAn8Xj4SeSR58CeAWGloQUu8n+rrvg=;
 b=TuD+uaAZ6iPThjYu+QSSXrIjn/KyFfebCzSDbqtyfMiHg+h5BvHYDRv/crGWVo98M0pfMtUUl5eDZmcRQ6VE7DmK2SNhw0CEu4J7JQxFifjlHabtzKGHZxMH+d6h8ezf4VvVQpIxmTxNWOGw1AjJJhleMxcpWF4y6ZnqyicjR93KAuCSS00oV//n1eEgI+si4x0xzHfW8WVYTVNSEvs22kcsA/WOmaj3gZWV4Y1ymYcjH/trDTAh36ehNruHKYTlBQjHGntCJ8nx/cypamB0VZQ9XuRskBjWB2MT17bmcgDAecq9xwAyXEEHAwOwn6q/b5fjcGg1CoIxeaqMFVqoPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3gwSpEylsAqZSAn8Xj4SeSR58CeAWGloQUu8n+rrvg=;
 b=dwNjz6qwexpbwTqvRqaH7vwlXly952EV0g0P3Dom9fFACxj5vaTu+k7tQdgB/iwbIMea+kvS/hh/EETqUibNduyWHE8n46rHHY9sck0IazBN8YjcVbE0JN/izYVqxFlzZn9NQJzHk2Vs+j2uhYEDeUjaLWSb/Gwv9V+yXX6qs5RWhAZzeX+FA0/nwYyRYQ9wtcjUzMlhbloUadEtmYTyiCS+tk6bzmMcsL4VhH1V59aPH07YiQ1yqkF3v3as0JRcQ/fKpE8ox1rjCgm09dywfyw8YRSoJtV19ipnJf5WGplX2doqipE13DF27wunFwl2Mh+KRai86VsrQCv+51cEkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS4PR04MB9552.eurprd04.prod.outlook.com (2603:10a6:20b:4fb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 16:44:23 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 16:44:23 +0000
Date: Wed, 19 Nov 2025 11:44:16 -0500
From: Frank Li <Frank.li@nxp.com>
To: Carlos Song <carlos.song@nxp.com>
Cc: aisheng.dong@nxp.com, andi.shyti@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	pandy.gao@nxp.com, wsa@kernel.org, vz@mleia.com,
	B38611@freescale.com, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: support smbus block read feature
Message-ID: <aR3z4PBN0+0fKqz5@lizhi-Precision-Tower-5810>
References: <20251118111323.1452329-1-carlos.song@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118111323.1452329-1-carlos.song@nxp.com>
X-ClientProxiedBy: PH0P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::17) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS4PR04MB9552:EE_
X-MS-Office365-Filtering-Correlation-Id: 191d665d-6070-48d6-3d44-08de278ae4f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CS/IiXj58SBPnbYh6wLJAmSvNpDZPxG/puMQAL0/SNmZfq9Cg3Da6nYVDFLs?=
 =?us-ascii?Q?c1OHxchr+EtJ5t8+ruBOKKoXZmmBh/5uwzkMwVfhdEp3kiW2MHTqNsPLhuA/?=
 =?us-ascii?Q?HMwBq+7ASBWMHIZ2Uxp/UUGAavnEm3vkaRZRbQiJZagItcMB2knsUXzqpryO?=
 =?us-ascii?Q?gb1Ri9awudx9pO9kIivrScN95biM6rqqzt2q67AgGt107awl39bSNjetL3z0?=
 =?us-ascii?Q?FueGj28L+PFB8g3iEl8dtujYX8bS6oYS4rsEiywhSEfa3rpj2AtJlEk5N5Ra?=
 =?us-ascii?Q?Mdjm56RxMsSUjOvDFUNVJrSzn3QcNjp3FzgbT3IGg3Ve3jRUaD4R57uzuFEw?=
 =?us-ascii?Q?a7wIry4/bh+jKGU+MGbxU09peie+PaUV/A2hwqoeVaaNtvvxAsFp/nGppTr8?=
 =?us-ascii?Q?xwU5ugsCMNpuXh99tlsH7MpzWLP2Q5xsW/WRSBUmj9yVgmJNJTwc8fWSJzmF?=
 =?us-ascii?Q?2jMalzFUvoOEt/FM6niRXwe/hcg6MT+7xvw/vpyuZvP6zTYmocoZua+d3nID?=
 =?us-ascii?Q?UjVqmvOjA24DVDwn5sXnFvuGg1meJkSTeFU66G01nQouUQ0PRv2JkKTc4Pdg?=
 =?us-ascii?Q?t28MVTGikQ59ZJzWXfPrbGRvKzoaVN+cCQ4OZxdnjuhjVBMaTyuCtYjc95st?=
 =?us-ascii?Q?Kx4/VKxxr04Cwc2RuCA4a3B3T9vgSYDJe/xe6N+RDvk1Nzo3dwAKl4VsneKb?=
 =?us-ascii?Q?eLY4yFG8E4791YS+bQxGOJFm5NMrMIVd3ycWefcthDm8LP0XQKXTA477zR/j?=
 =?us-ascii?Q?yrTYVARtdi3cqjqXYH7DJ6LIVDUmH99Q09BHrWanmC+SYWgoZwY49Dg9BF7A?=
 =?us-ascii?Q?BCBAL2yE93jU/7f2UM8ekNozujCwNGI225twn7uK3BJBE8PhXnHZh9S2KXrO?=
 =?us-ascii?Q?72iieY4UTykqsXnccBCF26a5t4cTemcLB92E3m939quorl16f7MQB8Ol1g96?=
 =?us-ascii?Q?fewZvwWt9ncBRUFIh3m7rTX1Y1onALG+8Ia/ZENPiJuza0EA11GNUeyHH45v?=
 =?us-ascii?Q?ed+g8FoBTK2QJhheXC0YQ3RkVxeytnjHJK3TaZtCgW1hcruZBB2DzaeLVhTe?=
 =?us-ascii?Q?o/NPg5nk/hUMXZ3j2iXyYbQ5p1VOZMNsQVE/ZpgDBB27k9bsqkCtcFfX/JMV?=
 =?us-ascii?Q?VcFTRUqDQc1S8KDXjvDbRSvODzvZp4ldbzhzslZySRzMN3G/1QGaC1gEYCgz?=
 =?us-ascii?Q?X1lAIdw1fxE20W9tF5eznVq4xU5AnXU7OFjSqKhCNBZxo/MXmKTFQIMO9Ost?=
 =?us-ascii?Q?vxWJUp2uTWFbOlJOFWzGecF3BsfuGalsy2hUfNIPMfWjUSCm47b4lrdirFil?=
 =?us-ascii?Q?xy3kub13ph4DzjwX4qGL+QKpaR+1BioqqvKiiaG2n18jh0bZ2uVQHOWG5ede?=
 =?us-ascii?Q?IesCu/+e7pwTOv0v9ig+z9CINAWki/cQ4+15ClNHwokSGJNLSIWOsjOSNypL?=
 =?us-ascii?Q?hRDJBoLFzhaxFprYzwV4fP+jWLC39hgJqUK6kGjUqlxv1sbzHZELFV1eIeby?=
 =?us-ascii?Q?HaqXiNXvVcD7rQaP0amNjXQs7WSQXSjUIa5X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nyLF0qQLCJp0rr2Lf0530beSohyfBUruAV2Dj2q178xw5RSPxbqfwCbz499h?=
 =?us-ascii?Q?YX+2tuIAiXHEotWNntRIVn3r9cHWa9RlFU0hQ2ho+2XpMbg8Kt3Sg7qIAnZP?=
 =?us-ascii?Q?KtxxJNKoCMhMVI0MLJ3Iy4fuAUczI/tfRAln9sjmrxgdCljOION0hACLXtkd?=
 =?us-ascii?Q?AZ0Y8lUVqYIIEINf/hmRihVmYcuYeNkR2Ia3Mq1kxCZujhs5a+DqJ60M2EDg?=
 =?us-ascii?Q?gAefzl0QYipwDISz5G1pVLJ3xn6CIDnTLLG/e1U0RW3jmpof6nyq9mvh4xyI?=
 =?us-ascii?Q?Sfu1RFpwz+T+9sXnIkZkwtBH0Tf2fEB/eiCrIvKvCYDP+77NW5mUw2R5D+tA?=
 =?us-ascii?Q?6W5sCTN/xUU6tg6ZmSLeGHCbLfRuqxtbn41irYUlfeEdluG4uXPcjZLrNLT0?=
 =?us-ascii?Q?twVVbaWpGag4R/zqLYII/gahxeF4jwjvLp/M9mFUSwbwEnqIwh3fWbleMy7B?=
 =?us-ascii?Q?bsrDyHJkdTIkuxlZ1kbjvoEsdYc+mePAWTU/RMvXngqGvSUJsNIh34bB0UXq?=
 =?us-ascii?Q?C+Qmv9HEykEVTuvdtAA4h213RoaIpkL034iCnVi3OfF5g64Oa9wLgNS/BY9m?=
 =?us-ascii?Q?dQuUrjSJ2QnK5/WUceq2TaL7i+5VjJGFEw/HEEq3hqoKjGGNP7JdLO1jGJVT?=
 =?us-ascii?Q?09py4Vm7ObZz5Kdc1UgNZOdfXg18f9T8yMMv+v0BxUH1tnYg6VrXDoLV1KgR?=
 =?us-ascii?Q?EmmYtnF2KStqq5B1KhLwOz51r7AWeaIE6uoby5xaZPhdcPx8J4ZucPwdcTrq?=
 =?us-ascii?Q?ha7piaLBlgKf28x0iGd9uZNCre+9ejmyvza7rxW7ThHOA1ERFbPqYCU8hAku?=
 =?us-ascii?Q?JuZDIJORWpBf8lryCFuAM/58X5zT5zWm51UpU+o2wniKQL96oy/l2M/z01F7?=
 =?us-ascii?Q?J/4TblrGs8eT98VcjiKIoZqDNhOWDWBdCdh32fIEHaUcL7LatA9jco/vgB2+?=
 =?us-ascii?Q?arHXqO/WnNlxPP/sLf/lxqzIKPd/za8VIR0GIsIOxt3Nc6vcSvl2oLwFTZZ7?=
 =?us-ascii?Q?QagxCSRdjtt8YT4IGIXzH4Uu9wf72loOdARA7bikwljJb+0fW/xe79ORgX2Y?=
 =?us-ascii?Q?4i8ShBrofGFcCYhjdvgZXMvNYVZcpJRwju6gvea+Qoy0oiDxgRUEroIrO3ot?=
 =?us-ascii?Q?fTkFFmOjDdKUg659aaL6Djr1XnmRvwFaXPfbNJgcT2wz5os8XovAEfkV6/18?=
 =?us-ascii?Q?DHyt74fOipC4OaVGWT81HMa3WLHbSqK7ugKzD6LZ3lIblw5idndORGal60Z4?=
 =?us-ascii?Q?zIKXJJ+F2F9eu3dGqKSaAyUtsr9IbDMAk4SKrzMDhcLoDCsLfk0Vd7yyf24l?=
 =?us-ascii?Q?FAVSpwuOGic3T323KqowFSyziUxH/uQlEO9X258gdK6/TjmTxU5qow+MGMbt?=
 =?us-ascii?Q?6nK9rnpLf08FHWZS7nx8+0L3heVilv3LoB0AUdcOLYyruU+gNzQiVuzWyapk?=
 =?us-ascii?Q?00Duk5zseEmS50w7x4vYVPtbHxclLVEQsKfRjN/6wX+aD98JrkSeUvbc1cz6?=
 =?us-ascii?Q?1Qe9j26k3gl8SZGwKcGBDaWgWhualjw/YdhUqirkzbnWfimFlLNAuvAwogMs?=
 =?us-ascii?Q?htx8MtUCx45eugExrj9SZs62fumgUdy/r65FECI7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 191d665d-6070-48d6-3d44-08de278ae4f9
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:44:23.5685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRY8DmdmHkmNjSsa/KKWQogZnXuDhXE735jpif2kEejDVpzSvO2TlCqGjSNo4oWShOMH/90+GYeORIPIZizxDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9552

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
> 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0a 0x0b 0x0c 0x0d 0x0e 0x0f
> 0x10 0x11 0x12 0x13 0x14 0x15 0x16 0x17 0x18 0x19 0x1a 0x1b 0x1c 0x1d 0x1e 0x1f
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
> +		 * of a receive data command.

looks like transfer STOP? You get data, it should be ACK when received data.

> It transmits the NACK unless the next
> +		 * command in the TXFIFO is also a receive data command. If the transmit
> +		 * FIFO is empty when a receive data command completes, a NACK is also
> +		 * automatically transmitted.

Add empty line here.
> +		 * So specially set read 2 bytes read command initially. First byte in
> +		 * RXFIFO is SMBus block data length, when the data enter the RXFIFO,
> +		 * controller should immediately read out and update MTDR register to keep
> +		 * the TXFIFO not empty.

Remove "should",
why keep TXFIFO no empty here, data should be in RXFIFO.

Frank
> Second byte is the first byte of block data.
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

