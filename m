Return-Path: <linux-i2c+bounces-4748-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 544AC929BB7
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 07:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CC66B20B89
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 05:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC6CBA5E;
	Mon,  8 Jul 2024 05:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="iLaYWBTi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010036.outbound.protection.outlook.com [52.101.229.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E640E6FC7;
	Mon,  8 Jul 2024 05:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720417018; cv=fail; b=FjSCtxRVrC15XK1d11JtB0uc5iepmCbz8Pwc0oGXnre1DDHu4nmaq8zSsZx92JmKgMBoUurIh1c1tTVWt+dsqmtECbupgSartWlo4FyLcFi2ldVuSihMEPx2pKYqBrgEaDZFdWFxyaB04bT2M9XM3MavECTrbnffaOzDxqDVqaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720417018; c=relaxed/simple;
	bh=dcGb6kDIuPnbdlnlvjlCeRZ7XWacccrDNvOgs4X+xRI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FniksqC+GEUs4p7HPS2jeNwc+kTTvxupqLYud0YmS14Kdl5qtAMV9EJ96ycfDK/vXtK6Ysgj1ZheOQ5+3aet5FoE1Z0XMFuUE0zsPm57Hu5RWM3qmn4sHQ0KrQ2EobnwuBl0AL6JZC32hT1BZUVXiVUqjqUDY/Obfe9hmjXzkPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=iLaYWBTi; arc=fail smtp.client-ip=52.101.229.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZ9y4XCkG9x3KAg69HMP/EN/uq8zMxPFmgqbY3DuBPf9QIiSm11Or55JAP2abhLpkmgvrArWxlBFVJcrUUXdmh5d7qXwmCu2bg6vdkEz2WWWNj079iOmzsBdZZ4+8M61WH6HAJWVaKHiOThXL4bwObhYwwM+8rUsT+7+RtvBNd4HM10IWGY7iKGXVzyJJW83iSpUdhrKxN6y6QbHiFeXOG35OTVsO3uCQYYt73Q0BOGx0Xh1RlAFZx9WWkNjuEU8Xd2Qgkcxjt8QYSPGXHerhS/gLbUIeFFZz3jJTbRM5TXKjj83ThJFpMJOTGQFElL0ntE4yWIRJysR2UjBnzrjpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Uzr/BGHwKQYxyLKBGF9M88RPBgH+xVNb9QzQV7CNRA=;
 b=HawitOVZCFDy3DXDxmjIczRIE8CsJJFW0zV/KidKjivCHmhgTbLpgZm3h/R7PU1ekRdxbpHajwVGsaCaC2+SMBRcjZ0TXVC7vEX9CkxxcEzIt0EJ70VNC9c/sOksaXKlDdXOttAPKVavVrJtQCrDMLMvXKax/Dz9woLTdz4EiM0JzF67x4UvqS1Z74Ghi+QcFCP48tYqcXtwU2uCXYy0ytNjDMsH+9sGKJItWnCtEtI4XCCWM4CDAxdz/oIlOYvDBavoPpE6SI9Go8mOdF2/X0aOx1seWnyq3j5NkTytqRM/STXpTQgu+9ecKPrOA4xOcht5NTuUkFQpzUbVVL9MqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Uzr/BGHwKQYxyLKBGF9M88RPBgH+xVNb9QzQV7CNRA=;
 b=iLaYWBTilqxUFQ8Jk8LV5v47LYn9+bQSR3QdcC0fOXY+D+45p7xaUAkRPEWz5IAIqL/CFS66hDsJy1y5dwcIR+3gq6eRwgr6Sxb6QhJ88Fr6RKECedlYJpxbFyNumgw05206jPQs+G2oz+AVnOmDUqp9KdWJQPmWS1noyJOzANM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB8273.jpnprd01.prod.outlook.com (2603:1096:604:187::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 05:36:51 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 05:36:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andi Shyti <andi.shyti@kernel.org>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>
CC: Chris Brandt <Chris.Brandt@renesas.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
Thread-Topic: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
Thread-Index: AQHaxvlYh4jiRKyfj0yWu87XUamtbLHnOQGAgAUoq/A=
Date: Mon, 8 Jul 2024 05:36:50 +0000
Message-ID:
 <TY3PR01MB1134643285CAA6D02292037FC86DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-5-claudiu.beznea.uj@bp.renesas.com>
 <2wm6vd4dib7tqpdq2eusjhyvfl3sofyvy65w6axvdjbkmgm5cn@bjltpbwwilc2>
In-Reply-To: <2wm6vd4dib7tqpdq2eusjhyvfl3sofyvy65w6axvdjbkmgm5cn@bjltpbwwilc2>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB8273:EE_
x-ms-office365-filtering-correlation-id: fc3e01ae-0df9-41c2-8c9a-08dc9f0ff7ba
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?80eZoMfg4sTm8rzzYJgiZe3+lvY8ug9X/c/1MHY0UlmMRAkdB945nOvHYOoR?=
 =?us-ascii?Q?OmS9g5EJrYxK17Xx7Z4w+cpxaS4hgTjjWsWMZS7glxGHNwNO6CSt4SbhLt49?=
 =?us-ascii?Q?XnfIb78TMYpLYVpi6eMxnjtMZhkZHSWJhvrGgXYIKKE+yrI/XLCoGrunUtLL?=
 =?us-ascii?Q?6J20udnf9fReBRioQIPWxxNA0w10vvk9muo5BA4/YeARNiVHPGjU1gvRCmup?=
 =?us-ascii?Q?5lTCnBK6WGlxYzfJLAv9NrilLa6V4u+jr/z5Kg0nPcZtJjcnyQJbuW2xVRGq?=
 =?us-ascii?Q?255veS2e9nMRST10l0a6XE7VznilkxcJEHC2neufaRMSd3l68S1uVjaDlI0i?=
 =?us-ascii?Q?6/sx3ljvFT//KKpVNitjt3RHdjFock8khdGAjUisV+ILDNvtVWVKHqFgzkYV?=
 =?us-ascii?Q?FwKsPsj4/X6yD9r4O4tPraTxpxB6VtVsmH0VCYuHXo0QfGxTzYqt2LD1R86h?=
 =?us-ascii?Q?KO6YGkgADdzMD83Z3kk2y4tapsTX32arPuY67U7ZBAZU4YaOx3tu0/mkDm2C?=
 =?us-ascii?Q?APMl19g+xoRveIMtJQl+vs98zvGmmSsys/+MAFR7PG9jmu6+fmHWe0cmbmLP?=
 =?us-ascii?Q?6Ju+26tSE4ob71+RxgrXtlJzi/OXFzxPh86rulf3kwKOKbnEw/Kto49YE52E?=
 =?us-ascii?Q?KmZbp1dHOsLZA+OE2iw6ixN3G6YknBB+xd6wR/LiOVR5Ej/TCStBvUqTl5Oq?=
 =?us-ascii?Q?aFAzaNu/iDjtf8wWxDwubffLPLsrbvRgWq1g3ehZxlIgjHTU68nIplk9dX6F?=
 =?us-ascii?Q?QeW3YF2iWarIxgTVGbRtq+HPnznHQAAWMUYg4HzNbft/cFK/NXn3gpeID6+a?=
 =?us-ascii?Q?kQdvcY2hGvVJdA2EvxEe2X0/ZkDh4DOJtbX7QO0IlnwNU5dFlP0j42j1ajqK?=
 =?us-ascii?Q?QaWCzV55dyJYgoIXEY2IZHwkPnAUr5BDftxj19RUl8mjDmkfdJQ6kaf9Vm6r?=
 =?us-ascii?Q?hHDstNLW/raQjSGai6QW89wbyKrskL4t3V0qMiLdHxlUhLpXlGDCcasc4hx0?=
 =?us-ascii?Q?tcg14upP0JxQpsyffqvLQcpex5KXRAUlLO+w+nG/Huy8ujQr4RJTPeSO3aiV?=
 =?us-ascii?Q?jzUAYe2g0V16cp7RjD6CZzpQCvJSDWOtlePOrqdjZ0XcVQ4X3ibQpBrKuhFH?=
 =?us-ascii?Q?pCCq76tCLwgi4ZBhjGLrttqXhBn3emehtSJREXmaeRMmpkW2gjo4gBiB4Yy1?=
 =?us-ascii?Q?wbsn5ezQtjzAv8uE7sCRRBGNch2CZ7JA1agaHkNkdCr1VUGfqf9RGXJYnDLl?=
 =?us-ascii?Q?0B6TOZpzYVRogE9sN7NtYa2bGpcVQ5CWyxFAi/8FJRBWEK31ayAeIVl5SKro?=
 =?us-ascii?Q?fJJppbktvfNDbchkL1NN1w+gq1XvgOUjdrbzUL3GE7PcjggGRTsuq4chRyMH?=
 =?us-ascii?Q?aCob0Cw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dEokEz/a09khAEXfwMiaap6bmUmMhGRMxl86SSo/+r2XQSuet9kyCiKGMruV?=
 =?us-ascii?Q?u1JyX2is+NDxyeFdeqgEG+0+aHpVqD20i5zD2xTS1gaRGb4GOcB0sIR8qlD5?=
 =?us-ascii?Q?OiUsyZ5K1EquTUvwEaCPVdvwbYBbWB8cgeR+L2uj4xLW0istNA0i6F2AEJtW?=
 =?us-ascii?Q?c7hGDhbjZMDkuWA4bBysR5uKrZ76aI1DJOBL2Ek7s5nwiJZT4EwHFSTTf9JS?=
 =?us-ascii?Q?OOTPAW1W2L6Jm+Ip/jyz46Wi360HfpxpTiXgVHFcvIxM6wzItBxOqQ5yMPjt?=
 =?us-ascii?Q?tzdL3HvNDetnJ8I7CimfR17KBwfpmHToLs2MbiSfdna3bf70z+DOUBQPPl2O?=
 =?us-ascii?Q?r8VFPmAQwu6BIFLEZzyjXuqyQ+JPI7LxMQBlq1dSuQQxvX2YM/3gX4vw45/Z?=
 =?us-ascii?Q?LZ4qgzTEtidb/2SLBdBZL5EuR+7KmY6uUGSUyQLJbri+WuIuxZdH5rwbfjFn?=
 =?us-ascii?Q?p6r7WGj6GoV5K0vW7yKCA3+kuCjHP3QZeQp/WksWoXCgYQvEf9VZwlg6w0Q7?=
 =?us-ascii?Q?06xzwkNGqE47uasFeSjZ5I1O6G5HdqF6Xp9vxBTp0RM+SJFBCiuQjYW7mjL4?=
 =?us-ascii?Q?RFSCsUZ/5Fu+3SGTb0E/0er4mGRcETg7w3mK2FL7bK2rB6qpH2MoDUh9i2uC?=
 =?us-ascii?Q?GGyeOJ6PFerLF9V5eI9ru5dBtGIs1P+FIg7j90b97Gjpe4jb4dtzgtXw89v8?=
 =?us-ascii?Q?p7Xl0PT5ncgzY5iFjGX6cXbq7N0sIamETre/lESPEXRdzYO1HQUvVHtQVr7m?=
 =?us-ascii?Q?sgcR2738cmkGjpKXBUZQxJp1vYsP1ZP562HSddjt1HmbbwVgSV2d+u8r0zqO?=
 =?us-ascii?Q?OVHR2X1LXC9Z4TkWQN5LLoons7vjTkit1mDWfRrIMFeDY8EFml+bZRJLzOaR?=
 =?us-ascii?Q?WsHDlA6qbc6zwQCsiFvnxo3rCpSAMdvBaCjrgJGyKW7f16QpKMR16LSNzQtQ?=
 =?us-ascii?Q?d373XIr9L/ox4ft7nm8NpvYoFd4viZLD0g+PYGxmLH4BolEvt2dWjBTrlIOC?=
 =?us-ascii?Q?dKKvcGIKJQ8hqbppXoJ3zThhQjZhDozzhrbiwOTVh3quZhCoB8SqX8VxsSBQ?=
 =?us-ascii?Q?9DSn0rxofTOJY/TSRMQ2FeV4Z4yioojjexXq8iEScSoB4PtoEqPvAmYGzIIR?=
 =?us-ascii?Q?Tp6L1NF9iB7gGyY57kQoQmvMaDf5aeUwG491i8o7ZnuFwbcazsHePgunrKfU?=
 =?us-ascii?Q?5dIoEg1uAg05ZT61ZBXw2lXIRt6g0GbglnRAX1dJAwauZHUc/n5j273ZdaoU?=
 =?us-ascii?Q?le9tqzfcUsKXDXQqwffJ6Q6Z5ZrD03tzfzcwn1nBvfgro/Sg4qtCbmmJ+/Po?=
 =?us-ascii?Q?6nqdDfbgk+n6BCcj64G0tJ7eZts9ivTq7pZutGfBg6hUEvKD91Pl/4GQfwN+?=
 =?us-ascii?Q?ble/nnYgMNS62g3y7AUYIXKoytBlANiYNRjKzpVlnapIoAWVWh/BCKCT5c3r?=
 =?us-ascii?Q?asRtHmXFBhfs6k9sUSXbcGyafbDuxoGoGHQ1ZE5TId0YIQiGSpVmFHAWtN1E?=
 =?us-ascii?Q?HsmSipOCeKSeOisqS5rxeTyag7y0RE0IxzYszRcxH1ZkYFoc0CkNlSimYzky?=
 =?us-ascii?Q?NeEP5qWqAoJcOF/4ki+2yz+yyhQ+B5coT2U1vA6yCXx3umF/vZt9tlXikAKL?=
 =?us-ascii?Q?AQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3e01ae-0df9-41c2-8c9a-08dc9f0ff7ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2024 05:36:50.9252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XeYgQKvYHvADEulrC0MsAYH1ML/QBGejdc9vl1bfqhdsWShH4OQTQlfh+l3kL4SYUiYHfUS+44ZG1g2L775E/6tVrw+YmMTDsoxE2539kFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8273

Hi Andi and Claudiu,

> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Thursday, July 4, 2024 11:43 PM
> Subject: Re: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
>=20
> Hi Claudiu,
>=20
> > diff --git a/drivers/i2c/busses/i2c-riic.c
> > b/drivers/i2c/busses/i2c-riic.c index 83e4d5e14ab6..002b11b020fa
> > 100644
> > --- a/drivers/i2c/busses/i2c-riic.c
> > +++ b/drivers/i2c/busses/i2c-riic.c
> > @@ -113,6 +113,8 @@ struct riic_irq_desc {
> >  	char *name;
> >  };
> >
> > +static const char * const riic_rpm_err_msg =3D "Failed to runtime
> > +resume";
>=20
> Please, don't do this. Much clearer to write the message explicitly.
>=20
> > +
> >  static inline void riic_writeb(struct riic_dev *riic, u8 val, u8
> > offset)  {
> >  	writeb(val, riic->base + riic->info->regs[offset]); @@ -133,10
> > +135,14 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_ms=
g msgs[], int num)
> >  	struct riic_dev *riic =3D i2c_get_adapdata(adap);
> >  	struct device *dev =3D adap->dev.parent;
> >  	unsigned long time_left;
> > -	int i;
> > +	int i, ret;
> >  	u8 start_bit;
> >
> > -	pm_runtime_get_sync(dev);
> > +	ret =3D pm_runtime_resume_and_get(dev);
>=20
> In principle I like the error message to be always checked and I will alw=
ays approve it. Whenever
> there is a return value, even when we are sure it's always '0', it needs =
to be checked.
>=20
> I had lots of discussions in the past about this topic but I haven't alwa=
ys found support. I'd love
> to have the ack from a renesas maintainer here.
>=20
> > +	if (ret) {

Checking ret will lead to imbalance. It should be ret < 0 as ret =3D 1 corr=
esponds to RPM_ACTIVE
and the API does not call put() when ret =3D 1; see [1] and [2]

[1] https://elixir.bootlin.com/linux/v6.10-rc6/source/drivers/base/power/ru=
ntime.c#L778

[2] https://elixir.bootlin.com/linux/v6.10-rc6/source/include/linux/pm_runt=
ime.h#L431


Another question, pm_runtime_put [3] can also return error, don't we need t=
o propagate that as well to caller??

[3] https://elixir.bootlin.com/linux/v6.10-rc6/source/drivers/base/power/ru=
ntime.c#L1086

Cheers,
Biju


