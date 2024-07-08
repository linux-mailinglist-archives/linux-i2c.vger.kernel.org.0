Return-Path: <linux-i2c+bounces-4752-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E940929F26
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 11:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 733A61C2306B
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 09:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7873307B;
	Mon,  8 Jul 2024 09:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cCocqBXH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010068.outbound.protection.outlook.com [52.101.228.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D1F849C;
	Mon,  8 Jul 2024 09:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720431236; cv=fail; b=KjRekPjYFRTCKn6pOCCx5wdt6CrRD9y8evl6xrUxkJagQWi2Q+X5MMqIvNFLlPpWNjMp9XdUvacAiWLwSOy+pM+a+KwatIMFx3mTz5iN/DggCFc2OImHvwC2/xeTzCgLQAIxpp+qNx817JIDzvc+bFS5W4INlqK7oPf7L9CiTQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720431236; c=relaxed/simple;
	bh=Xk/pXVvcJXFP8xvQb6ESKNrCRsx71eUcy5Y7W+rwRxc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HNF8lYXXnB2YOKr5VmdecXUkaKzlBIbXOT6iVNcyypK90yzcizp+6F6qZwCwpBNNE9HLfycwIEt9QvqmvOb744WTzXz0cPTMxyx0NndguMJHEbbDSvslVTyIKJLUmqhrYDEq0isMy9pRCPL5/L5GCTYa88UwAQvlmqy36ImYaag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cCocqBXH; arc=fail smtp.client-ip=52.101.228.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGB6LeUxEwVFXYWvHoekadFPWVF9Qykiv2xagIA4zOK2l2YJ2+vtcinMx2E/nHUg4WhfRXj3Os8zKldrnTFX5A+1TAmK/aVqXQaYB0OzPITiPPWXL0OUVEKlepq5G7i63aqi/s1w3DvWzfe6xzSPapQ9gwYLOIzSISAGicf7vcXeBXkrSQGdME3GseI8P9CySwDIJ4MP+5VOaYvtJ0SSTxWZ8RLmGwhzXGwOVw+UDVmFCQoZ45MSZUydR+VIhTQShCbtEhWGuA/Lr5CFcUEWAgOt04xSFdaYwtlz16dCvtcwhex9dFkrF8j0gApQUUprse/lPWZYVak2qnrA+BZsUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYQDkVMsq3H6gAGHkpNti217SgWR7zjpZHJLa6GFNDc=;
 b=EOPbX+pCn0QowZVZoeoJ7nBML6MBKGOFqe3Ye+Nqtim9V/Lj969hVOL4i03tGm5ryD28BQDF8hXcro97lsv1oJyKsiGIu/V9puPMvkNCicHB44oNLLdrPpkezNQcW6UTGL2sXaRCSAQXHxF86aKRIPCbNlpQQC4EG/JphhX1xLxqjtQTG3XKZZPnQ+deAiS2R6cVIlCFu5W0tSSOB3ed9bJAfGj5X+mqAI0OHbQMnMLndcNmRAxTfcqjOJYYnmhYUve0LUuZKBzsGzi2SrkXSo0Jv2j/WVrIQJKWAJF18wdzHs+LMBN+h3I/NvtY9V2uHqiNWj2YIQqRN42o7wBA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYQDkVMsq3H6gAGHkpNti217SgWR7zjpZHJLa6GFNDc=;
 b=cCocqBXHk2S4KSyEL4EBw5V8KGZU8tcl20nT8smQFwago9Z/KK3/85deGqOXZUVP0vzAZX7bmw3JfVW31WqN4PyFyqXcu9brbYjz6mf8VSeFBIcEGFEbW71q3JEs1jVnJECTkDnObhjBCxnuYb9YeRcVNZK+gNx0qTMDquU1Epw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB12017.jpnprd01.prod.outlook.com (2603:1096:400:408::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.33; Mon, 8 Jul
 2024 09:33:49 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 09:33:49 +0000
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
Thread-Index: AQHaxvlYh4jiRKyfj0yWu87XUamtbLHnOQGAgAUoq/CAAEPtoA==
Date: Mon, 8 Jul 2024 09:33:49 +0000
Message-ID:
 <TY3PR01MB113460F680BFDFC3A15763DC086DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-5-claudiu.beznea.uj@bp.renesas.com>
 <2wm6vd4dib7tqpdq2eusjhyvfl3sofyvy65w6axvdjbkmgm5cn@bjltpbwwilc2>
 <TY3PR01MB1134643285CAA6D02292037FC86DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB1134643285CAA6D02292037FC86DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB12017:EE_
x-ms-office365-filtering-correlation-id: 3ae452a3-772c-494a-a28b-08dc9f3112c9
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?yaTqVIMrikW4QfR5ejIZ94PcMd3l8MK5uFeLRi0ahiaIPiDyddBFxWIz/eRB?=
 =?us-ascii?Q?RrczJU4iFIC+rjxF02Beg5iwcGql0DojcoSaOlokFBAeo6JlTHRFPH7bxpYL?=
 =?us-ascii?Q?nS2ABrjyEQN8pZwtnlTBosTIFaQ+YBpmUXoo1dWOA/lqw1crsJRksmOxOWN5?=
 =?us-ascii?Q?T0nkpp4LBX2wo47ZD5f4LbpaVRn6nc3M8SOvgFyrsCYwo0WR8KBXgk1E9Sqn?=
 =?us-ascii?Q?0aWiT4h1j1yQMtfrv3DT0ursAVrGqtVN9ucjMhjDBGiSbw5qIvt5sBs5lpLR?=
 =?us-ascii?Q?oLsruyuRBFz4uZygNkVyOuQvWzc6VuUWRN+oRc05ha4Ww+3rjMgIZJ07LG3T?=
 =?us-ascii?Q?ZCO71761exayG5W3zblGELDE/fwHgi7QQUXZhALVwFjjEKJpRdz8aeo05d+Z?=
 =?us-ascii?Q?+Op5WWW105PZW+XQ0MKAC8XVnbdO8DZUJaCoyt3lFeF+8zRgQHvab99SLMsO?=
 =?us-ascii?Q?IaH4JBMO1Bbo6MofOk5nDr9K1UgJTxcfMPHFzAwpVbhJzwZHAWSu6dB7Y19V?=
 =?us-ascii?Q?XQqAi60Xe3yOWT9J9X7WOc3XGS49wYpiwX9HgDtDtHQYJDsALaLbgnRAkgOO?=
 =?us-ascii?Q?gTPEXY/bODWKM4C1L5FzakYCh8zeYef5lPC3RPLSyUzkN2fTwqavct6DD1o9?=
 =?us-ascii?Q?lsVDa+1WqMqFeWoHIEuvpty8Pi7AuVNiCabUrQJit+tohhJcrmY3qbqaTa03?=
 =?us-ascii?Q?PupLjKKoLuKdJ7tZ5hyZT7F8X1Tu+2fc4KJnKW41N5EwZaeLzkMMMpkbFmAQ?=
 =?us-ascii?Q?E2PeH8a/MKuaClPyvsDTrythfCUMcPkl/yyYysy1QeHH4SM/rTbpTYfV9q72?=
 =?us-ascii?Q?cWLGpCf+T5PttqZ8Ed9JSsKoNLmiyfbLfoarJwOglpQFe7h4dR5fT9vBflwH?=
 =?us-ascii?Q?MTcZgmCHKHAlsfN1Ncg8ik2L/70RFECzaYZQVmSairKH+UFyHBSXjSXfyC1t?=
 =?us-ascii?Q?qngcYBhCJ4Qo7WEoKWy3sQTB5wfXL3v77YIcbv6ru+ZFV5BU/3DiGa8SFE9/?=
 =?us-ascii?Q?u7/QSX5MXw0Gphp9zAlnL4a+LX8gLiHGpXZCVl5c1knb7cozYh/h/Vnt1aZR?=
 =?us-ascii?Q?s6cNXk/ExYllXlIACudalkNx4TsK418e7C7wfp9JA3+etLYiKwePOvxC2EHw?=
 =?us-ascii?Q?c7+70+Pxb3rgRy2Bk+8WVbsjWwa+/oZKecMm/hwRJSZljlVg3SsaxYcKLoMF?=
 =?us-ascii?Q?my+FmxmQ1l4Wq5Hnfk7H97XRbepYE3Vq5BvEshlcd0qrW3Ub9ekXqOxZsK9B?=
 =?us-ascii?Q?GmV80n759hCUSfBWGb9+VCKVTlyTbgBP6Wao508zRaXJpLgl7RvOm3y5s8Sj?=
 =?us-ascii?Q?oTo/u4LpFkaNYFloWoKuT43WKbTdbD9IyQJFnECSTQj/RbhWOal4zJx3fWxE?=
 =?us-ascii?Q?aMqs3s0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ja5GI+Hpqx1scwNQPNArl/KOlX+sMeIJlp6RM1a/r76JmVuhrx2VtY0JrtHS?=
 =?us-ascii?Q?1LCjHOt55vuqay8Cqd+Alf602KGoubFbFVoqN4Rze4F5h4FqFGkNAXZNzTgl?=
 =?us-ascii?Q?PDWXJ00vbZuVN4su9lE/fIEb9Zhpf0AwqtOyhVSNXODp4jg9Tq8ROa7MZIIO?=
 =?us-ascii?Q?WzdTxfBqbmE0A25wyDrbR+/JQeKVsswRpHcoccRtAzJ9yEJ5sccs6ZW06asn?=
 =?us-ascii?Q?bmYXRDzYPhS7km/OQjomTqOERXJ6wbT091hoA1WxgJd6B5MBp7MUbFRVeRW8?=
 =?us-ascii?Q?vHDoAWP13C25xUqQhVRcKK2D7knq+zQVwFb7oV3qYw1b1AEYd0Miv2qPGvP6?=
 =?us-ascii?Q?6W+YRYO3ToJk8YdQOeHU5E7LYkmkDD3uA9IhWbHbSoDqdwF+CdouDRuSe/SD?=
 =?us-ascii?Q?PZD9VxcgKJK0IY3CweCEFurgrXBe7X/+Sd52E07bC6wsENuJO0AzJbLfEtm3?=
 =?us-ascii?Q?edzxSvNnAWg+v755z/Q0y6ShSMUI/GKWhtEUkNSau8D6d9e4SOa/elmm4Tfb?=
 =?us-ascii?Q?UmCaHY8D6hakOv4q/rECB8oSzpcfzJvy9LP8HcL2BTXA3dYqENwIUKyeO+9i?=
 =?us-ascii?Q?nRrbEXHN/hImfEd19YHFSFB8V20eAx7empb8Hk4rcWOiQrZfj6fJKp+fFAWr?=
 =?us-ascii?Q?IgpkjNhLMMMZ3na980V36T1UFLaBrpxqQrkjhXC/kRc7YLIEs3ipKDzjjLMU?=
 =?us-ascii?Q?xvoOu5aPT046u4C6z4nVFlKPIJVtxAJL52JsBEQwoDUKfi/dt09oVTWJzzjh?=
 =?us-ascii?Q?BPTCEe2ett83f9iO7VyXHVa+3gl9GSmmuJ9t0EbSQoW66W++I9iOY7FLjJFi?=
 =?us-ascii?Q?ey3XtcGlFJ0qdDtGTUtN8FO6vjwuSM82qZjDUx4tJg07sy1l2+JMXAvv/eeI?=
 =?us-ascii?Q?NewfUu3l0th6gKqGAD1uMfzOevCD258KplHVv0t31gkxJiUoO4JNP7Hprtzm?=
 =?us-ascii?Q?xcQ/ZjmucgdIw7Xof2/YW0nfgJjFbdwTLrHXCCtaMg40euYOjkvVe6zb0V+J?=
 =?us-ascii?Q?sSocGO4sXrbHrAmUr3wwZA/ZSC6nO9r58Wxjc7PDGi1ni+8dTrDhC42KoQpE?=
 =?us-ascii?Q?Y0gf54X3EFLPy2dlksjPxKvkZBcezhwgDF5qLMsxL6DKDLTYtdgGIv95ypkD?=
 =?us-ascii?Q?yddB+fhpoqsqCruViz99pozuYrJYAhjBQYAwO9ULgeXsCdMaN6q3pwVW7VWF?=
 =?us-ascii?Q?Z8xDZtwgNWiR8yeFWHPyoEIfVhXNvtp1TJE/tBs4MeeqdEjz6iCzDHRLVeJF?=
 =?us-ascii?Q?5zYcTw3z9AHLwr/MSxJMXmAM0uKg3c7UXGKa9lVH9hxkC6QhKbYjBPteeB1p?=
 =?us-ascii?Q?Bs7uvTSZkuewJx/h8aNwR3c+Qy2NyKYlIx9lI88qGzKJuwRl7kpCOOxHSTMx?=
 =?us-ascii?Q?46DU2vlSBm0vLwiZWT9aZtX2xN9MyiiPX68mT5UNeS60gA4LeU31kaWIxF1B?=
 =?us-ascii?Q?iwVs8eTnYYrJN5VqIwN9w+nU6u/cHdWf36Lu7dP97JMBNgGeCjoc8yO857pE?=
 =?us-ascii?Q?XuyVvG3kIjqpZIzvMqCVK7/qQIBHdmPha34rEh0piuA59JPDab2n8JRXlKrd?=
 =?us-ascii?Q?kkqxa5MXVd8wow4nkNLaEjf5xN4Irem4ptytv20ChW7emfzsvYXoxa5J+2ym?=
 =?us-ascii?Q?zA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae452a3-772c-494a-a28b-08dc9f3112c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2024 09:33:49.6886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4SJI6PRRF8XkwKmoa3DSgAd1NwQlovwawkCN5ENFtwrj0EizAghx9STl5CiXsV65M6l1M7sQaKf88aYUR2yVvXTzO4PGXyo+z9mz6OGR65Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12017



> -----Original Message-----
> From: Biju Das
> Sent: Monday, July 8, 2024 6:37 AM
> Subject: RE: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
>=20
> Hi Andi and Claudiu,
>=20
> > -----Original Message-----
> > From: Andi Shyti <andi.shyti@kernel.org>
> > Sent: Thursday, July 4, 2024 11:43 PM
> > Subject: Re: [PATCH v2 04/12] i2c: riic: Use
> > pm_runtime_resume_and_get()
> >
> > Hi Claudiu,
> >
> > > diff --git a/drivers/i2c/busses/i2c-riic.c
> > > b/drivers/i2c/busses/i2c-riic.c index 83e4d5e14ab6..002b11b020fa
> > > 100644
> > > --- a/drivers/i2c/busses/i2c-riic.c
> > > +++ b/drivers/i2c/busses/i2c-riic.c
> > > @@ -113,6 +113,8 @@ struct riic_irq_desc {
> > >  	char *name;
> > >  };
> > >
> > > +static const char * const riic_rpm_err_msg =3D "Failed to runtime
> > > +resume";
> >
> > Please, don't do this. Much clearer to write the message explicitly.
> >
> > > +
> > >  static inline void riic_writeb(struct riic_dev *riic, u8 val, u8
> > > offset)  {
> > >  	writeb(val, riic->base + riic->info->regs[offset]); @@ -133,10
> > > +135,14 @@ static int riic_xfer(struct i2c_adapter *adap, struct
> > > +i2c_msg msgs[], int num)
> > >  	struct riic_dev *riic =3D i2c_get_adapdata(adap);
> > >  	struct device *dev =3D adap->dev.parent;
> > >  	unsigned long time_left;
> > > -	int i;
> > > +	int i, ret;
> > >  	u8 start_bit;
> > >
> > > -	pm_runtime_get_sync(dev);
> > > +	ret =3D pm_runtime_resume_and_get(dev);
> >
> > In principle I like the error message to be always checked and I will
> > always approve it. Whenever there is a return value, even when we are s=
ure it's always '0', it
> needs to be checked.
> >
> > I had lots of discussions in the past about this topic but I haven't
> > always found support. I'd love to have the ack from a renesas maintaine=
r here.
> >
> > > +	if (ret) {
>=20
> Checking ret will lead to imbalance. It should be ret < 0 as ret =3D 1 co=
rresponds to RPM_ACTIVE and
> the API does not call put() when ret =3D 1; see [1] and [2]
>=20
> [1] https://elixir.bootlin.com/linux/v6.10-rc6/source/drivers/base/power/=
runtime.c#L778
>=20
> [2] https://elixir.bootlin.com/linux/v6.10-rc6/source/include/linux/pm_ru=
ntime.h#L431

I got confused. the code for pm_runtime_resume_and_get() seems correct.
https://elixir.bootlin.com/linux/latest/source/include/linux/pm_runtime.h#L=
436

>=20
>=20
> Another question, pm_runtime_put [3] can also return error, don't we need=
 to propagate that as well
> to caller??
>=20
> [3] https://elixir.bootlin.com/linux/v6.10-rc6/source/drivers/base/power/=
runtime.c#L1086
>=20
> Cheers,
> Biju


