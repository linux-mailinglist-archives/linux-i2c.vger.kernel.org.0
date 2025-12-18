Return-Path: <linux-i2c+bounces-14640-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEB6CCC342
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Dec 2025 15:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BDE530672E8
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Dec 2025 14:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94486349B12;
	Thu, 18 Dec 2025 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YPVyBEBA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FD432A3C8;
	Thu, 18 Dec 2025 14:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766066633; cv=fail; b=ZNM31Hy4MJpNcg/X6szxSvROFxTsfHbzFgKlGCOHY6xN4IAlQD4q1RrlkYglfM8OvIv7up5tnRYWlsrHpTVECRb7UFnRhvLdlb0d1BgFKhkUdclXuPgamtgA4iEvUxBb20IF3nWbSlmYTj55f2kUSa9pQl7cmTf55TjgJQkwzag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766066633; c=relaxed/simple;
	bh=bQzLv/Zos2/ILT1ZUiI3BnkrcUGICs+vIG3P6TUtpXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XKIbvgJhNw98MrCktvVqg91RU4kGIRyPSDkpJF4jclPCcrgowKCjaleKdFHiSI6fLh1y6MSpZ9V2OVrm402iBbVvv1YYNOWHjAX1ejiI21gz2CD+AFyn6dcQ7kViUiOFmo+rzrOTID5lfxwaWGOOeiYh1XI3y85mxYlW28U71Fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YPVyBEBA; arc=fail smtp.client-ip=52.101.125.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFAluOGS8F8pGIKQ7bN+L+gd/0AnqOQ2UkVgFVSQ1VqOGQgeRxxqEE2sFP+UrnIxavci2zbZLRhpMLrZH73hUQl+Z8QQT6o82R/vluKhAVi7/ISscS9rA0ZNoAQi0xigXD2Tp2OJJG3ZP4nvfRMwC3oPj8wfh1OJQCl+zsi56RSyry5qNxaSf9OrcqmJ8yRWmVU49ZrrfzssW/43D46tsj2E1MzJWGIZsYaGZpmQCpinIf6kEimT4Kq/KoxRphdhph1ec9//TL+jO6c7NJtugsrMbg0WYJXTc6Z2Q9jLRt06Z6bLZ3i2NBPTCoh6IHMugulE4qxhLdRvhH+j89/hYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnLuWSYKXyb9V6udkfVyE48b1s8APTRJaE8imCE/XRM=;
 b=Z7qY+UHaC1lh+La2PTzMecrYChryH8TInVpIqZESjHqehYvXOijB54FFeILyt0bg83FKVWkjXlYPg4+NElNX6IdLNVtKzpKe0G8MOIID1OeHZmec10M51w2NUqvuYRmTWUT76J08ChzD2NY/KAb9DsYdF7mmdTFc9suM9/6RM6PnBodFZNnAxj/rlwaY62Lg+Yec3X7TTt6A4eTXxmsNbknNesyehqGlXFy4GthVpMYxNTFPfV+6p65sUatS29zsXepJz9HAWMAVGEiN+2a2tNR8h7mYlyKBY2xrHuI45n1FDs5Gbz6pTFuocX+tp8M9xgAFQ++QPOZ9CitfJqXJ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnLuWSYKXyb9V6udkfVyE48b1s8APTRJaE8imCE/XRM=;
 b=YPVyBEBAUOZ4seNFvaqE1gq9Ud7ibBZ/FqxDZ070KT64YFyQtv3BdHMAEaIUrq6YGFRWSEvA9IhJFh/qvIdkzkkRFMj61Ur3tR7a+mCohx/aU0tQMGNzp6zMd63169t/o2Jq7Qkp9gJrvhQFlnC/MTj7csV0AEkBeTz4/NtE8q4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYYPR01MB12779.jpnprd01.prod.outlook.com (2603:1096:405:159::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 14:03:10 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 14:03:10 +0000
Date: Thu, 18 Dec 2025 15:02:54 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Chris Brandt <Chris.Brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] i2c: riic: Move suspend handling to NOIRQ phase
Message-ID: <aUQJjqO2TuTPdo4W@tom-desktop>
References: <05a31af3d6caba51e8237a49853281aa49bed916.1765540678.git.tommaso.merciai.xr@bp.renesas.com>
 <TYCPR01MB11332073ADC4063F21591554386A8A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCPR01MB11332073ADC4063F21591554386A8A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: FR4P281CA0352.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::6) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYYPR01MB12779:EE_
X-MS-Office365-Filtering-Correlation-Id: feb89b23-e0ad-4acf-415f-08de3e3e2d36
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tzVKTf2g+HOh+eLPu1A55082jPBVF26BpiVgX9wYcBdwNvrXGSfCGfvOYdR+?=
 =?us-ascii?Q?OOfwX4Y5xuVdjb0i/wsSGYGe4Z/jmLshJ6DR8+Mctjl/QRuEZ+U6v+8a/B+/?=
 =?us-ascii?Q?cYp0gUctddgPuV/3Ryb8lhXJFOjd9RRl3zIrDy0QigJ5wKanMkPOa3hxS6hi?=
 =?us-ascii?Q?aOYa2hIUNHQuVllQuhJTCuUAPXDCMh9k3IZ+dh/MZv94FUCtACIgf7Le2sVf?=
 =?us-ascii?Q?EsS2LbybSApdTse2/l2lopeCkdnIZKYdV+mqcecjn5K9KPL0F8u9ScJK8GRS?=
 =?us-ascii?Q?2KJefIxEPTjgrUMYtw3LqZLU0ELq1qm22muSGB6LPL9y6wiNFoBj1MerPKKT?=
 =?us-ascii?Q?GQHTrxP8t+mvea/hTg4dZfiskVwjg7QBQd42g88rR0vqHza1Y8hOwkVnjfYg?=
 =?us-ascii?Q?Klszvc1uUEcVDEcAYrpjM3ug1jVOLUroEqrrLfz+pZV0/jo4iS30PaSf+rWL?=
 =?us-ascii?Q?kvI0Rqm3tTdpdJ+X8DCuLuMomDkE0Ez0GCHbKF6wOwvg/Q1f5rDhAR6cYTGh?=
 =?us-ascii?Q?NF2UxUJ0sbiLjyeRpZqXafo4Pepcwe9tdnF4Kjzgabi66IMwwxlF9WjrdR87?=
 =?us-ascii?Q?oj7fFtMN5MOCH6tefEiNhUW52tMPeSj4J7IjQepIsGO5cY2Sty0Pb7tyeFWp?=
 =?us-ascii?Q?LCbI/nXzDGOhmxMRDvtFKVB1SIYNG9P9auq5Hp/Gbj3ZuDqUTwiPNF0O8KXw?=
 =?us-ascii?Q?D2pEdLusuTER8aoCXuHkfl9zgDcvs8ksaQ5gSMBpbgoBqIk8vTb0fLinEb7A?=
 =?us-ascii?Q?hY0asAUhzd+foSg2AV5QQFabcZPs+lySixxvAA/fBBHpe/4vsA0JaZHOoyV/?=
 =?us-ascii?Q?YERVeUlur1LM3wiLGeIqzFWXiUKaufKYj3VkRJFzzlgsOX/LNeWiQqnPCB1l?=
 =?us-ascii?Q?vfBLezBrGZBO/c5Nlf734kXi2+1kmXW+qpDIKujHnOfPzw58IhIADnSFqNOX?=
 =?us-ascii?Q?WnTB8nanEA0NW6eAvGiRycQ86Az5P0aqVJSJT3SfYlLFzH124tLdINf0PNRE?=
 =?us-ascii?Q?91VYT1lqt4G2ysXKunh9goAlJyDxgB3vSJ8iP4IUhyEXXnk923gbyyIEgtwO?=
 =?us-ascii?Q?wHGpmBHDlN5y3R7VcpVgaI9eDKf8Zy/vMTjjUh5u+aBvnpId7f4gp0puU35m?=
 =?us-ascii?Q?34MxyH5fhjbTG0aI6lN5hOHC/tBQDhQioS2wKnkR/4+gXGmAuKCYzzOPuaTj?=
 =?us-ascii?Q?7ldwyTGrKrxcbayXmqKxV62opJYb1thI9B5CUoQybiYjntWFK2u44Eb9ABET?=
 =?us-ascii?Q?lfa7sy4z37dCEVNu8huPedLiXt93wpX7Q8JSu9wBfcgbb5M5voIXMSsoxf/l?=
 =?us-ascii?Q?NBPTyrEIjXlo6D+33NwJVFDRRWQrzBLFUqUYMj16DcwBSrjlvHqkxgBgmhdW?=
 =?us-ascii?Q?Cqhik6+hI6BSRgkrXuxlOIW/QFNU5asfSIuQJM9WyGdWa9/oZSJPFRk/kDuW?=
 =?us-ascii?Q?ktedaJBSZQm5NkiZ8dLvarB8OakzTk8GM6m3fHRn563A141V/XCQCA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MWz2+WANZzlkmvVTt4K8hK6NDb2yXK0VtRN1uDb07RSVCrTuoEIwoQzAEraA?=
 =?us-ascii?Q?G02BDM/advUgeuaNe1431Zeolju2HqGu/TO2Urj8cj5q410sp/IfuxtpgRgL?=
 =?us-ascii?Q?Cct320tEXkS0PTZutFI4ddcieJ/MUWgRPKcmsu1cWBH1q/ZuRer/ArGPgZew?=
 =?us-ascii?Q?CuI083oa/v/KeSjU519h76PXvduAmy4GnRZQHXHt5kMOsCOlp0+7DxyUU2wl?=
 =?us-ascii?Q?z4lCSHxMZIJrfKWRHS4efu3Vjbb3knk7fm7+/k0OZciLnewck0b5BXiAqeOC?=
 =?us-ascii?Q?8MIn22RHwFGpRa57ArIi/eZyKvPtKOjnaXDC+zGhU6IXwYVCxUNyypaEualq?=
 =?us-ascii?Q?RTSCSH8HnILdo9bLyWKtNvTy0PO2gb5VMXisuEio77VbZzJJtnjTxlwNlVUX?=
 =?us-ascii?Q?H8PRyAXr4zIlPQ4YSMwwDY/sxCEvyTDXKKU6zS2IfchGyv+K2CxzlMER2wFs?=
 =?us-ascii?Q?RqOCSGCeffp69pphJxMU5OHaLAc8/2Xy2TbeAJz8cAgPa7P+nwhkCXl3m3sP?=
 =?us-ascii?Q?tGbONfjS56njZAsZbDbTAuZ3LVyxHKiDHrtBkZR0qJ2F5OmJuZ6R8zRx8PcH?=
 =?us-ascii?Q?jGdyfeM7IMZHZwJRDmRvmREom1CbnQXVrtRxFOMv8Za/nTWp+EQuiPUgPj9z?=
 =?us-ascii?Q?mSzZOV+5vlNBcGDH6bcarkDaucL4Wa96rb2bNR6Vlb+y2dgpdrmxQzYyLBpo?=
 =?us-ascii?Q?kHNPOj86Z8Stg+rPLliMrAxZFC7FItIZBbHtCE3/qeGikBhVPKS6upbGFJfz?=
 =?us-ascii?Q?t31MP5LWNyns3/EzJAD5J+u/uZOxpDKpG4323JNgapWHKRuAfO3kTGPsAUtR?=
 =?us-ascii?Q?FmeMZPY1unNskrVIEx3a5Z+dt18BufH0jTw9URNXVa5sX7ebCzSSz2SOrxhM?=
 =?us-ascii?Q?/N9ae/jtaXGd3HTk/GnlFATpkEetlstDCGOXOEbTIb6F27I3QrUfCdnTQn10?=
 =?us-ascii?Q?Vp3tQA3F4RXElnfWGwG0LFT+mHDuYq3cnK8phimvfkmqwff2XwQCa/k0+BSc?=
 =?us-ascii?Q?MVtlZY18tQr9aT48zeVm6VgYS3UFe6/x41tw6iu+vlqs2AG+MBFMDx/obHdH?=
 =?us-ascii?Q?skE+QYh3/2gQjQl88avFngMB1EJeUBeeu+lpVvQLnLJNQb0OhvKXpFzFvFp1?=
 =?us-ascii?Q?qN650RttY9BsrY1yX25KIZOvfD+sJSescTTagbqM2m6AW/473i/qoF0Y0PMI?=
 =?us-ascii?Q?2JXJp86Kd0na9tyG33zIZwjMVSJoqfyezRovRl0/0aSgayCTltxde+gKbLmC?=
 =?us-ascii?Q?fz+oX/+KqpCqCOU0atdqB3IQ9Lc6brPTyog1C3CVnqbAepznxIptA2xxVTj/?=
 =?us-ascii?Q?cHeRb0si258m/VLMiW5bIaEzKRrjlH8e4xXQ/FjE+GUITIZWju2K9iOTHSsN?=
 =?us-ascii?Q?fniMblgaGRfefVtaoHcjGhypt2dKBKB2GVlwoed6L7it+dzN8vT85cnYOJmF?=
 =?us-ascii?Q?LjUKJz7HSe/LGqTo1EAirP7S/K0tlwQObbXnYemhzyho16k7xOiquBz3NMAx?=
 =?us-ascii?Q?csryRhGldy7Ll2MINCPZS3qwPNbtLBEHWNQW7ejgnOtt18fCOW0hL4G2wo6p?=
 =?us-ascii?Q?B8GUl3emMM+moitdY0c3khYAZiuz3+g0/q/zP1gVKjgxh8ZIcgh1iOtUIKNY?=
 =?us-ascii?Q?r5k+4p2mESReyqoz/Iq8VXE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb89b23-e0ad-4acf-415f-08de3e3e2d36
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 14:03:10.2285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdXNgV1LvX3YTPB1ik21henwiYETmSo8civo/GGX/8Ph8q0wlw3IWNFNn97i87JjwOG89ioci25B9o3BPgDQLc3w7O0k36kEWJbG4yPbvBJ5qPgpU42AFgGb4mXotH98
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12779

Hi Biju,
Thanks for your review!

On Thu, Dec 18, 2025 at 09:23:19AM +0000, Biju Das wrote:
> Hi Tommaso,
> 
> > -----Original Message-----
> > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > Sent: 12 December 2025 11:59
> > Subject: [PATCH] i2c: riic: Move suspend handling to NOIRQ phase
> > 
> > Commit 53326135d0e0 ("i2c: riic: Add suspend/resume support") added suspend support for the Renesas
> > I2C driver and following this change on RZ/G3E the following WARNING is seen on entering suspend ...
> > 
> > [  134.275704] Freezing remaining freezable tasks completed (elapsed 0.001 seconds) [  134.285536] ---
> > ---------[ cut here ]------------ [  134.290298] i2c i2c-2: Transfer while suspended [  134.295174]
> > WARNING: drivers/i2c/i2c-core.h:56 at __i2c_smbus_xfer+0x1e4/0x214, CPU#0: systemd-sleep/388
> > [  134.365507] Tainted: [W]=WARN [  134.368485] Hardware name: Renesas SMARC EVK version 2 based on
> > r9a09g047e57 (DT) [  134.375961] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [  134.382935] pc : __i2c_smbus_xfer+0x1e4/0x214 [  134.387329] lr : __i2c_smbus_xfer+0x1e4/0x214
> > [  134.391717] sp : ffff800083f23860 [  134.395040] x29: ffff800083f23860 x28: 0000000000000000 x27:
> > ffff800082ed5d60 [  134.402226] x26: 0000001f4395fd74 x25: 0000000000000007 x24: 0000000000000001
> > [  134.409408] x23: 0000000000000000 x22: 000000000000006f x21: ffff800083f23936 [  134.416589] x20:
> > ffff0000c090e140 x19: ffff0000c090e0d0 x18: 0000000000000006 [  134.423771] x17: 6f63657320313030 x16:
> > 2e30206465737061 x15: ffff800083f23280 [  134.430953] x14: 0000000000000000 x13: ffff800082b16ce8 x12:
> > 0000000000000f09 [  134.438134] x11: 0000000000000503 x10: ffff800082b6ece8 x9 : ffff800082b16ce8
> > [  134.445315] x8 : 00000000ffffefff x7 : ffff800082b6ece8 x6 : 80000000fffff000 [  134.452495] x5 :
> > 0000000000000504 x4 : 0000000000000000 x3 : 0000000000000000 [  134.459672] x2 : 0000000000000000 x1 :
> > 0000000000000000 x0 : ffff0000c9ee9e80 [  134.466851] Call trace:
> > [  134.469311]  __i2c_smbus_xfer+0x1e4/0x214 (P) [  134.473715]  i2c_smbus_xfer+0xbc/0x120
> > [  134.477507]  i2c_smbus_read_byte_data+0x4c/0x84
> > [  134.482077]  isl1208_i2c_read_time+0x44/0x178 [rtc_isl1208] [  134.487703]
> > isl1208_rtc_read_time+0x14/0x20 [rtc_isl1208] [  134.493226]  __rtc_read_time+0x44/0x88 [  134.497012]
> > rtc_read_time+0x3c/0x68 [  134.500622]  rtc_suspend+0x9c/0x170
> > 
> > The warning is triggered because I2C transfers can still be attempted while the controller is already
> > suspended, due to inappropriate ordering of the system sleep callbacks.
> > 
> > Fix this by moving the system sleep suspend/resume callbacks to the NOIRQ phase, ensuring the adapter
> > is fully quiesced after late suspend and properly resumed before the early resume phase.
> > 
> > To support NOIRQ resume, the hardware initialization path must not invoke runtime PM APIs. Split the
> > init code so that the low-level hardware setup can be executed without pm_runtime_get/put(). This
> > avoids violating the constraint introduced by commit 1e2ef05bb8cf ("PM: Limit race conditions between
> > runtime PM and system sleep (v2)"), which forbids runtime PM calls during early resume.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 53326135d0e0 ("i2c: riic: Add suspend/resume support")
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  drivers/i2c/busses/i2c-riic.c | 65 ++++++++++++++++++++++-------------
> >  1 file changed, 41 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c index
> > 3e8f126cb7f7..9acc8936cdf7 100644
> > --- a/drivers/i2c/busses/i2c-riic.c
> > +++ b/drivers/i2c/busses/i2c-riic.c
> > @@ -349,9 +349,8 @@ static const struct i2c_algorithm riic_algo = {
> >  	.functionality = riic_func,
> >  };
> > 
> > -static int riic_init_hw(struct riic_dev *riic)
> > +static int __riic_init_hw(struct riic_dev *riic)
> >  {
> > -	int ret;
> >  	unsigned long rate;
> >  	unsigned long ns_per_tick;
> >  	int total_ticks, cks, brl, brh;
> > @@ -431,10 +430,6 @@ static int riic_init_hw(struct riic_dev *riic)
> >  		 rate / total_ticks, ((brl + 3) * 100) / (brl + brh + 6),
> >  		 t->scl_fall_ns / ns_per_tick, t->scl_rise_ns / ns_per_tick, cks, brl, brh);
> > 
> > -	ret = pm_runtime_resume_and_get(dev);
> > -	if (ret)
> > -		return ret;
> > -
> >  	/* Changing the order of accessing IICRST and ICE may break things! */
> >  	riic_writeb(riic, ICCR1_IICRST | ICCR1_SOWP, RIIC_ICCR1);
> >  	riic_clear_set_bit(riic, 0, ICCR1_ICE, RIIC_ICCR1); @@ -451,10 +446,25 @@ static int
> > riic_init_hw(struct riic_dev *riic)
> > 
> >  	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
> > 
> > -	pm_runtime_put_autosuspend(dev);
> >  	return 0;
> >  }
> > 
> > +static int riic_init_hw(struct riic_dev *riic) {
> > +	struct device *dev = riic->adapter.dev.parent;
> > +	int ret;
> > +
> > +	ret = pm_runtime_resume_and_get(dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = __riic_init_hw(riic);
> > +
> > +	pm_runtime_put_autosuspend(dev);
> > +
> > +	return ret;
> > +}
> > +
> >  static int riic_get_scl(struct i2c_adapter *adap)  {
> >  	struct riic_dev *riic = i2c_get_adapdata(adap); @@ -572,6 +582,8 @@ static int
> > riic_i2c_probe(struct platform_device *pdev)
> > 
> >  	i2c_parse_fw_timings(dev, &riic->i2c_t, true);
> > 
> > +	platform_set_drvdata(pdev, riic);
> > +
> >  	/* Default 0 to save power. Can be overridden via sysfs for lower latency. */
> >  	pm_runtime_set_autosuspend_delay(dev, 0);
> >  	pm_runtime_use_autosuspend(dev);
> > @@ -585,8 +597,6 @@ static int riic_i2c_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		goto out;
> > 
> > -	platform_set_drvdata(pdev, riic);
> > -
> >  	dev_info(dev, "registered with %dHz bus speed\n", riic->i2c_t.bus_freq_hz);
> >  	return 0;
> > 
> > @@ -668,27 +678,17 @@ static const struct riic_of_data riic_rz_t2h_info = {
> >  	.num_irqs = ARRAY_SIZE(riic_rzt2h_irqs),  };
> > 
> > -static int riic_i2c_suspend(struct device *dev)
> > +static int riic_i2c_runtime_suspend(struct device *dev)
> >  {
> >  	struct riic_dev *riic = dev_get_drvdata(dev);
> > -	int ret;
> > -
> > -	ret = pm_runtime_resume_and_get(dev);
> > -	if (ret)
> > -		return ret;
> > -
> > -	i2c_mark_adapter_suspended(&riic->adapter);
> > 
> >  	/* Disable output on SDA, SCL pins. */
> >  	riic_clear_set_bit(riic, ICCR1_ICE, 0, RIIC_ICCR1);
> > 
> > -	pm_runtime_mark_last_busy(dev);
> > -	pm_runtime_put_sync(dev);
> > -
> >  	return reset_control_assert(riic->rstc);  }
> > 
> > -static int riic_i2c_resume(struct device *dev)
> > +static int riic_i2c_runtime_resume(struct device *dev)
> >  {
> >  	struct riic_dev *riic = dev_get_drvdata(dev);
> >  	int ret;
> > @@ -697,7 +697,7 @@ static int riic_i2c_resume(struct device *dev)
> >  	if (ret)
> >  		return ret;
> > 
> > -	ret = riic_init_hw(riic);
> > +	ret = __riic_init_hw(riic);
> >  	if (ret) {
> >  		/*
> >  		 * In case this happens there is no way to recover from this @@ -708,13 +708,30 @@ static
> > int riic_i2c_resume(struct device *dev)
> >  		return ret;
> >  	}
> > 
> > +	return 0;
> > +}
> > +
> > +static int riic_i2c_suspend(struct device *dev) {
> > +	struct riic_dev *riic = dev_get_drvdata(dev);
> > +
> > +	i2c_mark_adapter_suspended(&riic->adapter);
> > +
> > +	return pm_runtime_force_suspend(dev);
> > +}
> > +
> > +static int riic_i2c_resume(struct device *dev) {
> > +	struct riic_dev *riic = dev_get_drvdata(dev);
> > +
> >  	i2c_mark_adapter_resumed(&riic->adapter);
> 
> 
> Is it not possible reconfigure i2c controller here like [1]
> 
> So that we can avoid reinitializing the i2ccontroller after every transfer (ie, rpm)
> 
> [1]
> https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/i2c/busses/i2c-tegra.c#L1965

Thanks for sharing. On my side I found [2] that can be used as reference
also for riic_i2c using:

	NOIRQ_SYSTEM_SLEEP_PM_OPS(riic_i2c_suspend_noirq, riic_i2c_resume_noirq)
	SYSTEM_SLEEP_PM_OPS(riic_i2c_suspend, riic_i2c_resume)

I'm preparing v2 based on that commit:

   4262df2a69c3 ("i2c: imx-lpi2c: make controller available until the system
   enters suspend_noirq() and from resume_noirq().")

Kind Regards,
Tommaso

[2] https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/i2c/busses/i2c-imx-lpi2c.c#L1537

> 
> Cheers,
> Biju
> 

