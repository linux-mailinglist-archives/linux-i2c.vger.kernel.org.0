Return-Path: <linux-i2c+bounces-9852-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8539CA64641
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 09:51:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FACF188F922
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 08:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71B1221DA4;
	Mon, 17 Mar 2025 08:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="kw7wa/1j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2099.outbound.protection.outlook.com [40.107.255.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BF51B412B;
	Mon, 17 Mar 2025 08:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742201497; cv=fail; b=pSyzyZIT9cVatgyfMpfQXHv0zVP2IFLUU/Y8Zy1NP+VM3vf7h++VMGWiQ4q6ih37dh1BR2MJO3ZLpazfZPA6+a2ckm8ziecVp5LwIQz5dOYbYiwtuOqhCN9Mg+0tMP1w/vdZfaAAcDuDYxuaMdkkSs4PKpJVFSPOHkSpiEnlHdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742201497; c=relaxed/simple;
	bh=cBYSThe7296QzMi0AnDhRqy9tK9xfSAGZHe2PvQo6Ms=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qX/9GFItvmS3h4+b5E+aBucuRKm3GUQe+jqvXZBYVq4NMY4HHB3/NV8RN9n4Ag8008AWX1NeFTEE66E4DxPJAvVY8trY5LBXI/7iXX+pVBbdomTZTybPp+gCEvtqm2gtWKVcd8pkcVFzxM7ZluffQKPzvd+lzc1TJWGRKFanesE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=kw7wa/1j; arc=fail smtp.client-ip=40.107.255.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rfV2uN4LjwrWBk3nlXNf4RAn0aiiS+AKIaMeVAgK/loHE1sx3uEF79W6lV83OCZSv1spKOmFrie6GVSi1Scgq/dh2l7xTyiN0dXDZ4jihSXk5UWnBJjxTvVHzgng9uDzs3HbdihHeOlvFEpBH+37GJ+THbIoqj6NDB8UHYk+/z9oiWEltcZALZ15obhtHCYpoZRdO8RuwJoHNIMqXWxuzRtyRmsAuEWc7udAHTsKxAdB2a2xD/xdueHiV1soAqJT5MdYRCRFBjxdnDp7VnYsWbzP8j9LoeQ90e7UplBgvmlzcXC9lmNmvu6M1bjj7OZ6NOMlT5WYAi9D/+euUNNfBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBYSThe7296QzMi0AnDhRqy9tK9xfSAGZHe2PvQo6Ms=;
 b=UjvNI/wup9Mvm48BZqdoQaQIJ4AIFHnXKfo5AYTuOAYghGb40Sb6ZCXkQp68rzf0WqmRndLZfmx5qiOcq9p1GUyBQ1J2rZs796HfZKGVfL1sSXPbprNI6X6CkRYcfi387BYNoIZf3cbvw3ebZ2pbkCz9JeTZZ50h7Z2HY1hOHJFQSztQf3Sjg1pWRzTDt4aA3BbA5559ZBZBFp1qIU06JyUVb6yXVVwbljUVTGpXwTX4leKuaoroekKc7TcA1iGoL/F5qUESm8NSdkfXOgBdgc0cPo17XPPBeWSrPtqhzIEcPnMP0sFQck4Y73z65ngTvZSLvztNbpYzkFoDEa0Quw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBYSThe7296QzMi0AnDhRqy9tK9xfSAGZHe2PvQo6Ms=;
 b=kw7wa/1jJMBFZOyujQ/QervVw+hDEUdakK7N3KSCY8cig2bfmUIKBPcPieQIpHcCR0DU6jo9222RddECaFTVLwAXpzLEqNVbQCnN/nRf+6rLsox8BL1vhuI5Nq6VjrFrLAzJccb22O2UgzaT8Qx86IdR0elxjDfkGYZdmkwwwi+I9E5bLD63BU9ERwEK08alEqkaxuI4ZLyRK0pCU9yswdxptb2UBkgyZMVj6miu8xvYN864W3tLh41q6XpamalkLYfPF0RY/4MRriMuwbpBq+SN3NXfj3Az1iG+aIJcX++7CEfZdm9tEWrji5+aCm5rbvuPBGDGcfpZ7hqzroNMwA==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by KL1PR06MB6475.apcprd06.prod.outlook.com (2603:1096:820:f0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 17 Mar
 2025 08:51:30 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%7]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 08:51:30 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Krzysztof Kozlowski
	<krzk@kernel.org>
CC: kernel test robot <lkp@intel.com>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>
Subject: RE: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Thread-Topic: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Thread-Index: AQHbhoFNsVARAeVOL0a52YXrKarMSbNb80WAgAC7AICAGmaLgIAAA1sAgAAOHyA=
Date: Mon, 17 Mar 2025 08:51:30 +0000
Message-ID:
 <OS8PR06MB7541B15342ED1C92579AE18DF2DF2@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
 <202502280902.U0gLDhve-lkp@intel.com> <Z8GuOT5bJL7CdXX6@smile.fi.intel.com>
 <fec0a1c8-251b-491e-893d-11a8186a2128@kernel.org>
 <Z9fWhGDrUbAmGRl0@smile.fi.intel.com>
In-Reply-To: <Z9fWhGDrUbAmGRl0@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|KL1PR06MB6475:EE_
x-ms-office365-filtering-correlation-id: ec13dfc8-302a-4800-c94b-08dd6530e957
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?r2VizlPc5oOGrDIUSuuybmvAaFV6gxRm40s1Fe95WA1f6Mm5gTaeNdMbqpxO?=
 =?us-ascii?Q?6BePQUxlh+TSjHTx7NX/n2J8uonmBbKx3rSKisWyIToFoEDLVnWvDFjOKn2c?=
 =?us-ascii?Q?tSnNAEbpBd4rgqsFaLkx59682M347zXuzhcqlr3U/Z8vfDLgKnhbBWV8JJAp?=
 =?us-ascii?Q?aHTCFSZKH5O8TO68OlLwjwQfEthEsetKjmUcFJeiEaNDnL+w459v6VKbOoVx?=
 =?us-ascii?Q?oFwRhj8q2vX9WHc6X+AhgU1BaPbos0/tcWaZP0kAcwDDRjcRX35XXc5UyESz?=
 =?us-ascii?Q?iByPjKX5IDw/QaqlumCaVsFepNGJvZt1qLY44iUakt6yjvMcnCOw7e3hkjLL?=
 =?us-ascii?Q?O+zAHT89xtiS6kXfTfvb//oZ5/AzenEBXPq/2B6aTyecyY+k43gGd5+JvJL9?=
 =?us-ascii?Q?2YNevoW15mEWU94Z6j9PQkpeQ71GWmvGQtxTE+xfiznHUdx0P/HybC3nymgO?=
 =?us-ascii?Q?jlgMMSNiUFZFMWS/JN10A0dXi+oesscZZoWlaqK9f6PGzMoOwHqx+B7lr5Vo?=
 =?us-ascii?Q?ire1WwzNVOd18RaDALmB+JwiH4vwFTvS2qUhAibpIojg0WmvAQBnImoC48ds?=
 =?us-ascii?Q?WbUqkwPEpWyn2cEebxV1vM1IWJwnq/D3SbaCI68/F9qPSACPRr+TmDSsjp+5?=
 =?us-ascii?Q?OIOfDpXzhfztyzO7qIBoqvZGJnayPZK/FJ/p19HN2edXiuPPDkP3QgebbbZB?=
 =?us-ascii?Q?it+kix22n7MahvH3S4jx27nhwHY1OKUFlzNnsXsRHVM6UeycmE27fo00lF5L?=
 =?us-ascii?Q?hbIOClr++fO3VHW0b12+Bi+E0XxEtoufBlFyjSzQtGxiq2VfEL7w8RhBPi+A?=
 =?us-ascii?Q?8gLmzmW7XlWnbXAMMiBRy+YqwhwTGy80CdVewEdwECGzZ5lfNG5rbthRNLDJ?=
 =?us-ascii?Q?pcW6o8kXgG2BCqTR8K9llhcLlQ0/VyrJpVGRHCncirmtBHSmCnJZ3BMd13oJ?=
 =?us-ascii?Q?5NdvK7+NAE8uJDjGsBoer7WVpVSDnGkyGC2wB3I4Xd8fM2fdSY3NTxr58hVr?=
 =?us-ascii?Q?e/qPKNz0Spxq5IC90xxybp7z8Fy7jr1dJmdS1HWZamTjFu57v4bvw+GvICaP?=
 =?us-ascii?Q?z0t5QRNQ799gfTKIzsAL8j0vyz7jWCTJS1zr87+O2+GHuKARAdR4L4BUPEIx?=
 =?us-ascii?Q?B2ATWWLPzOgFYw2dYw4ixpVjX98J3PeFyfapUtzwbytmBN0xiY3UTgWrVuj1?=
 =?us-ascii?Q?kWAgda5wcDqzRm7stbhp0eCHfvngPhUg37APH1T9gULiraWXZZWaej7u9TWf?=
 =?us-ascii?Q?49QGEVE697MxKhSpIOL9ZHpumvvCtBEwCWcTrIV9XqPXQzXXNZUQPbMnKskP?=
 =?us-ascii?Q?ku8de+3XhK4mZr9T98D/3wmscvfCGF5AYE/2OobDmoe5+7XskVUaaHoDDngA?=
 =?us-ascii?Q?nbPnuMr1j7S+7/9phdyM9lfk1k5p?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(13003099007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HZP3hyzCex3caeKvQbuRCM9IghxYQTmtxGsLobmGI3t/xer+jArkHNuN+YL6?=
 =?us-ascii?Q?AtRYy4Abl4dt/ufS4TCAXD9jSRps1v6rlna55hS25MYAswZt2Ig6bWCQRXy+?=
 =?us-ascii?Q?fI+Xfpe3cDV4Vq2WoIU3KQyOT2xZ6UMyRITuDQWaSI0ArP0Gi9lE0Ux/5B5v?=
 =?us-ascii?Q?MvxyXGWRxJNmIHuISiTJVDlD7p22uEd7/8tIfzQ9rMr9Z6KYcdlUGrKd6z8k?=
 =?us-ascii?Q?0MKkUW2qInV3Tkev/gLCZfi0Mza++rSOVdv80H87ipmsYkFCdpdVWCNnZU6d?=
 =?us-ascii?Q?t4sJe9cgCGEt3RLH7Ksz3h6n61BplritqfQ43owSTm70WAHhdEddLoB2LoUx?=
 =?us-ascii?Q?aAZYVv7IkUR5QeG+GBRlpTMzxeX7RLvMp4rK/xTa/wGOERS1N5jO3zrpMOF8?=
 =?us-ascii?Q?ihatpmkXLLT9t0SXQ3vsY21ksujGqoXXFBgDzC8G4UGGp9V6vJTpf5OHE5Sg?=
 =?us-ascii?Q?2G1R/0iUgRDlY/zS3EO6odbyJcYWoC9fmHRiTgwaRqI5oB7oE7lledQXIM20?=
 =?us-ascii?Q?NpCVnIb3rHAm97mg95DILKa2o2aoWZEMmSbaiRvfDhZ5OG39sTNrPf6ntW7H?=
 =?us-ascii?Q?BV4eh6Fit7NF4yUUKvbCRk65L0QkRHXcJ3EEgZBVe5SBDnQM8qM4EVhojhe5?=
 =?us-ascii?Q?GoG7hCLQLYd6E4CylfaqwvecSXop8k/IxApUGg+xX486eZzDDW5L7XuJVPFA?=
 =?us-ascii?Q?HtCtN6FgjIZe1hMEwdIPO16gWXrkzpfXuEaXebu4Afqz11B1oDP9DtCEgEBo?=
 =?us-ascii?Q?c4glREAsZkrh15swulFhZo0/wT85tE9TyPzcJCj4LI2RX8GQlpAmjKKUnyWh?=
 =?us-ascii?Q?dcBfwPluMtWKuENuzylEY/fh/Yd4ZMWZ5vtY28OFGFOg9m2ME81hqJ4tq8Z9?=
 =?us-ascii?Q?UMmLoPfFPG8WAR1Uh2LxqaSdrNmMBGxdMgfELCm+QdzOBj/0U4WZ79lI1zyI?=
 =?us-ascii?Q?fyEXk1SMsPZMif5EFwnRriMPR7BvsD0uGk66D+wcLameE0prfh0xOJq4gFuS?=
 =?us-ascii?Q?NvDxUuWXSSnZKzc86fivpHywWss6K+KaAUDr+p/57zFZPJZIFKs5QBmAm5q3?=
 =?us-ascii?Q?1rmD0nkSkDWOO53/HIlrqx5VTUmKnJXgcqH3pLAXKtJa6Ir+SDjJcRIOOdiT?=
 =?us-ascii?Q?cZG2aUEFQlw8zlJD8Jii03Aw1OVYvsvkVAeGYSTBXkG9GWJgasnCqDkY9gX5?=
 =?us-ascii?Q?hA+oLvRyJfV1FN+OgQo98/Q5QPUp2a2VuymKCp/0lyOP9ktJb/lZbqYKIfxp?=
 =?us-ascii?Q?6DIkpt18bPZAksxKe4HSH1t6REhU6dr0NWLJ4kh+wVyJdZUhjxOpBXpORTXp?=
 =?us-ascii?Q?T02pp1Si8lKupAZBAuVL7Cm9KEZKEz42YpVN0WnqAiqdW47q45viQg2+Uuwo?=
 =?us-ascii?Q?gHYqo2XDsGUCZ4gwuRVyDnY7Eb+1lqqN0X8EoDEBUQDLk1HlUXgk7EjtxOLp?=
 =?us-ascii?Q?tsFzTV8biAIeshv7du0yR2UVVS3eUO/fMsICGaBSWfRgt5/XaueKam3NwPG4?=
 =?us-ascii?Q?/ulH6QttYcfgJeGMFEvPdfCkdFyoPs2/tUrm8wiV2DAaOUjbFF94oFuGm31L?=
 =?us-ascii?Q?ddQLb8tl/I+NLrzg2LAD4H3YEuL2zG/ZP1HSNKnN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec13dfc8-302a-4800-c94b-08dd6530e957
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 08:51:30.3808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wJhAi3uVGph5xbeK+wNMc54GJWAYibtSvOxpJmx0CnmG715206XX3ZfhEhzSCKA+36s6cXpmzU3WWRWylwVY2jLd3qi+L1gpxvkpLjCfMnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6475

> Subject: Re: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new registe=
r
> mode driver
>=20
> On Mon, Mar 17, 2025 at 08:48:03AM +0100, Krzysztof Kozlowski wrote:
> > On 28/02/2025 13:38, Andy Shevchenko wrote:
> > > On Fri, Feb 28, 2025 at 09:28:59AM +0800, kernel test robot wrote:
> > >> Hi Ryan,
> > >>
> > >> kernel test robot noticed the following build warnings:
> > >>
> > >> [auto build test WARNING on andi-shyti/i2c/i2c-host] [also build
> > >> test WARNING on linus/master v6.14-rc4 next-20250227] [If your
> > >> patch is applied to the wrong git tree, kindly drop us a note.
> > >> And when submitting patch, we suggest to use '--base' as documented
> > >> in
> > >> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > >>
> > >> url:
> https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-=
asp
> eed-support-for-AST2600-i2cv2/20250224-140221
> > >> base:
> https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/=
i2c-host
> > >> patch link:
> https://lore.kernel.org/r/20250224055936.1804279-3-ryan_chen%40aspeedtec
> h.com
> > >> patch subject: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new
> > >> register mode driver
> > >> config: mips-allyesconfig
> > >> (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gL
> > >> Dhve-lkp@intel.com/config)
> > >> compiler: mips-linux-gcc (GCC) 14.2.0 reproduce (this is a W=3D1
> > >> build):
> > >> (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gL
> > >> Dhve-lkp@intel.com/reproduce)
> > >>
> > >> If you fix the issue in a separate patch/commit (i.e. not just a
> > >> new version of the same patch/commit), kindly add following tags
> > >> | Reported-by: kernel test robot <lkp@intel.com>
> > >> | Closes:
> > >> | https://lore.kernel.org/oe-kbuild-all/202502280902.U0gLDhve-lkp@i
> > >> | ntel.com/
> > >>
> > >> All warnings (new ones prefixed by >>):
> > >
> > > My gosh, this is valid report. But it looks like a preexisted issue.
> > > Can somebody fix this, please?
> >
> >
> > That was three weeks ago and still no responses from Aspeed or
> > contributors from here.
> >
> > I think this tells a lot about aspeedtech.com patchsets on the list.
>=20
Sorry, I don't aware this is my patches issue, could you tell me what build=
 instruction can reproduce this?

> Yeah...
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20


