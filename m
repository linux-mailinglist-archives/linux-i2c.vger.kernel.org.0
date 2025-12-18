Return-Path: <linux-i2c+bounces-14638-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F85CCAF11
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Dec 2025 09:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 745A6307DC73
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Dec 2025 08:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B0B2DF3CC;
	Thu, 18 Dec 2025 08:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BcXPKTsM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010062.outbound.protection.outlook.com [52.101.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387982E22BE;
	Thu, 18 Dec 2025 08:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046858; cv=fail; b=Pyj1p2LeeonFin7fpHaS6TrzyFWT02Gwm1zRgYUTQ3AQKkDaPRhS3iHXlvf2nuew6hSXEaO4yHmCa2hw7hN8QbMMNVuZZ55QOyJAj61WStXejmSvZGk7/WIS+W0huKsG/bRgQm01qaUwzS7q8zWTdSfzVmZXMIwpFJb+qtom968=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046858; c=relaxed/simple;
	bh=yLifq5ZeQmSQvx3zfbMb96V+8FlKs/ZSELRV6VVun/g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Oul/06dykRLbWBku7nsuRZzuJ2ZR6Zzfj4q7D/8SWCWV3bEI2fMHOpCbcWAm6RRzR79fxzriWWyozM8ofBsCl78V+sDhXq2N5jY7VUBdOJSKu24SZC/QS0SwdI9U/lA/Wd8h09jL4Pec2nRvFX1VoELYQfKSC5YcgaSNK6lcKLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BcXPKTsM; arc=fail smtp.client-ip=52.101.228.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+oRB7ydd8eIn2eoKAXQ1iQ36W1c7cd54TMOVYhuj5jdHvLUj1scMps7bUVWWfHajV2s7bTLjX/Erj9+U7iYeg3GMMFxy46TQ2Dx/jn25Ski59vmKGQMx1uQvS5NXpKATXjJsyVtCIJ8VFGg51raRzvNhyez6bdR0e7lb0LiKiof5YLHa05llT7CFXd9VZs8xOMyeZTuNnmfhG3eOMTDfIA0WdyKhRdWksbxJQUOW34KxrawekJFq4XCX4EMRZ7x1jC94YhvyoDLIZfDRMtoItT3hEPJ1LheW/89DXh3jglodK/96lsxycUFJ0hOn14DPaIVQQK7M2ulSVX+DLiZfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOd6Ex4a6ILY4retpvfMeTP2C2Z95N/6qNVBJA3SO8o=;
 b=O2hDwG6vmBm6Yiu7CKPA/5LANkuGyfKfKYAQGanSLowkVAi72IWfE7sMqAFcfBY8wxzvqP9FUEJXclVdmlGuy5JHI7/+ICJt2Khr1CGZBhj6iov72MhsjNVipjfJAFgYYsI1h2rCkz4KxprTSZ5vmFUxrYv7WzGfIOo4AD//ohWcgLtzsUXK2+n+CecmswOg8yeGrlTvHCVj3FnY7smTPWPJYfkxJmmZvP3tpqXPJAv7mGrnHFqV9y4Ryr++ZXOY2hkfQbmmrW6I+nQBNF1TlbEhpq9s3beU4SENxxWBzPmu3FhB4NQqzxKVUv0VD1IxRcRZ4ik12JGmJAXPFZh51w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOd6Ex4a6ILY4retpvfMeTP2C2Z95N/6qNVBJA3SO8o=;
 b=BcXPKTsM4Of6sphVrjWhGLLtLWPJC00Gm0JJfWz1Z7ecFkgQiKAjfWWhpTTVmc+PK06Z9rF8FzdFabNio+++xISByx0V+S2Z4Yhh5S4YQx7kM/UnoAeB8vMtf7QU8AMLlO/oaxHL1ncJ28rKUwi0JbegAs0cnUruRqaUI67AaLI=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYWPR01MB11397.jpnprd01.prod.outlook.com (2603:1096:400:402::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 08:34:07 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%2]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 08:34:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>
CC: Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Chris Brandt <Chris.Brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] i2c: riic: Move suspend handling to NOIRQ phase
Thread-Topic: [PATCH] i2c: riic: Move suspend handling to NOIRQ phase
Thread-Index: AQHca17DsfRhAp0qr0GEOfw/pzuNj7Ulm/aAgAF4bQCAAAZbcA==
Date: Thu, 18 Dec 2025 08:34:07 +0000
Message-ID:
 <TYCPR01MB11332BE48C9501DFC331D296886A8A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References:
 <05a31af3d6caba51e8237a49853281aa49bed916.1765540678.git.tommaso.merciai.xr@bp.renesas.com>
 <74a801d3-8653-404f-8531-cb99108eac33@tuxon.dev>
 <aUO2nEPdSHSAP8lp@tom-desktop>
In-Reply-To: <aUO2nEPdSHSAP8lp@tom-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYWPR01MB11397:EE_
x-ms-office365-filtering-correlation-id: 227c5c60-e5f2-4eee-b738-08de3e1035c7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?CthRDuulBRiQX5TOjrIlN108Y5YNorUDrxtU+ELIWpc1ME79AdVBv2JbxSC5?=
 =?us-ascii?Q?oYXyN1yI3MPgAWe4yinq+8TZFkIjECX7HX62iGbKi+KN4/X6q6P0LoXXHGHP?=
 =?us-ascii?Q?5zmnfoGI585YFg8pJbi3sYL+AW5D2jFAxipiOoSenXG/HtpnrxA3PIAH2LW7?=
 =?us-ascii?Q?5Xco+Eh71PkIJpKQcqnwDA75nvZvm33s/hLFVjUaKp72KvngIYJ2Y46OoP3E?=
 =?us-ascii?Q?+5wL6lWpL7Kijyq5oh/CxNqeIipiPP0tKbsLWDV/HyfDop+07gl0VaQm0odF?=
 =?us-ascii?Q?By1iPjh2Tyqk4jONP0CqURqQFxL6Ua5dHVBViBNzx0NeO78h3B8nqqrm8/om?=
 =?us-ascii?Q?iqQwCfsgssNAn4OReztxNpfp3xHKV8AaJBCuOGGmdoNsDSCanYtv4sGZgdiu?=
 =?us-ascii?Q?GuSExk/47RnR2LGQ32FxulsHsyWpjxAF84xlGTBYrtrL7MiVAg4zuZXNUTyj?=
 =?us-ascii?Q?GlxB8uvk3WQ4XLIUnNi+8EX9Dn2ke8fVHZD04caLrIGfJQbceADYO0jR4VhG?=
 =?us-ascii?Q?as5Rr4aROxUckLlmgxuf/4BHK+F5Zg1wEvsaGnKACdCZsQoMSYv/qKVyWEHb?=
 =?us-ascii?Q?HXDGr+fTxI8eR59/Nqczso8nvNwT7Jp83bKgvRJH2KYw0dDiZMLVr4axMQNa?=
 =?us-ascii?Q?mm98kaj5n+GQyRVdNRyvR3fuFdBOxSpIS8kpRb3vBCnuDxZh/4fbFvWeDaoE?=
 =?us-ascii?Q?lCjWZn980yqTckXsps5J7Q7zCuG6PQnhOxap+I74TIweXGyUOBzcecOZBMRj?=
 =?us-ascii?Q?FKbDWNDGbnYhM2XW9PhmTgRm0TxWHNwwbmKvVz9JMWudQYy6rL8/bds9uiOf?=
 =?us-ascii?Q?Isqlz021HO3YB/Q7ac59VbW6tyv5jWoLbM1uvIuFvcLakKQh9ttBUtQrv99A?=
 =?us-ascii?Q?ZQlw+2UAd78DRKJFhutHF+tn2cOWYe1sNFqhbKyxvi6jbsvULFMkZc4z9L+X?=
 =?us-ascii?Q?Yc0+F5GGGPsDi07QwDKO2SVKRKXkdmHiYquVLHV6iJLjm31I/zO1MTi+YGVe?=
 =?us-ascii?Q?ax8Ds72Rx2B+n201TAwEF3J55ekcgdEWJufMuLYDV7R755x+pDeKUob73H9H?=
 =?us-ascii?Q?6uj/4bOYuSd55B8mO7wmsrQWMPyN1zH9lk5TOWdUxk2Wy5ajuVvCk3/Hzm2a?=
 =?us-ascii?Q?4khz6BjmnbZMvIuayz+0qgdsbJfNSsCwuwgVZi5xivH+X1YU7fI8YGDjlNWb?=
 =?us-ascii?Q?YmOLCqtgFpchOe6ebH23VViyMMZAp5c1s9Zz949zNVNTsH7jmMokrWAShOf8?=
 =?us-ascii?Q?7xNto5UElzkeFyt3MKoXsNJ4upU0j/CGz7PJ+vEFgfecoMUAJUpFOvm0xoDM?=
 =?us-ascii?Q?YZk9H8ethJW1Vzg5MrbG50B1NMn3dj9HhqWqm9fI1yina+In80OdleuaI5DQ?=
 =?us-ascii?Q?e/91zn+RvnuLuS7SkmkhSqF6dqNU6qCGzW1rcS16LzlHzmB7Nm2PwoOA2jpB?=
 =?us-ascii?Q?dHPwov/9t8iFZbJT1ds731fIas3CKrvhua4EoEfqaTLHDGn6TjkqRRucJkHb?=
 =?us-ascii?Q?PRFd7MluB8fh2DxxaLGizHnKuzZ8uIyhyqnd?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XuuH2kwgohlr22DVniw+l/DcQE8X6Bl2+/w7YbDHU54kn02RFzxAo/mZTjbn?=
 =?us-ascii?Q?0cB0t8FTVWoEy1Y7T+kjnzP55ror5JN3NJN1YzsDEl1Su6BrKYYMDYlfdCXK?=
 =?us-ascii?Q?DJjKRVgi225NuHr7AKhGuGHDblfJIZ/RER3x1B5KuI2A3v17dx5fV8K6L2KL?=
 =?us-ascii?Q?NrB0wWJTIfr4gRzYykENyvn8BQXMm2zBHe6yJQY7ZCcLrrqUc9X6EcgW23E8?=
 =?us-ascii?Q?IIdxC1pVJxAtdx+6iUtaZqp3kv6UvRq/StDhorS2gmLBUsQltkvLPQ4f4BUQ?=
 =?us-ascii?Q?TU2kF/X0TIxw+QoVTm6Sy5L7eQHx3U7WMBLeYj0wqoKIbE/4Weg+w8nshOTL?=
 =?us-ascii?Q?U6ygKNQIoXaG8RI7HCEGv7HxROgxTDDXmYpR8MhupzCygHtE0u+OixiXZgK8?=
 =?us-ascii?Q?wj0tOHbPzM2LTRjdwtEpd3PBIlceG4oAH1UoROKhMxxSk8X1oSA11G7eAVoy?=
 =?us-ascii?Q?s3udPDlPsGIPNnyCwFdCNRRFBsNX0W07chuYsewJ6/iK+t5B5WnijoSVAbgt?=
 =?us-ascii?Q?ZvBBUyIqcOG5LguDzkP7J6vBHPliK3xVTQHhw7XgfTVcnKT+ixKv2dEqbsw6?=
 =?us-ascii?Q?2KL9mB/9EM7+v1z9rRHgFOAiG2xNyHvuIyj5aFwlvJ9SNMcAbZkpaIqLzwte?=
 =?us-ascii?Q?Is/V1w7ARDdxIGsleEjcozkqel8RloQ+g2VzcgpCfRX4gyipRjfAq/uJ2zlt?=
 =?us-ascii?Q?Q3B54dvBJb9V4mjfoZjjOOEsmyaiMIriw25BVbjeamhncqDzafGJ6fk9+QW+?=
 =?us-ascii?Q?zyg5QwunLM7OHt5QhCfcIJh4Uxhxmi3L17RttEmXkFiCmg9vlI7eJ0lCajE6?=
 =?us-ascii?Q?Ba0nmoYWvLhaN/uPUvJkwGfacWzWJjC1WfVB1xRLx2RVRBR/hXbhYYdiVRZo?=
 =?us-ascii?Q?afDaakInOqVr/dTsijb6K9qtdKdy7rLTb0O2f3aocP/f70MmEfhsodksvdgC?=
 =?us-ascii?Q?xWGMSD+35fqMGaZnMtEuWtMt0057T6LzxCpx2MeHizIpC0fgMa3Mc9VDmCiG?=
 =?us-ascii?Q?LGEzmAMHNObRHFkiLz/vljbF2+EGH2zpYDNkL6pUloSBDFnjEKk3ovW3mDIl?=
 =?us-ascii?Q?82qKBghBpaJybRWdSlvzA5OWNpSxhGQS/bBvk3/e3vnEd48YKaSBfzq8xlKp?=
 =?us-ascii?Q?pmPM4anXiHIoLeCDwy/eppb6ffcixJk7X+LgbzoO7ipYmPQ0frNVZqtTKTE5?=
 =?us-ascii?Q?hPDlAaWtXP10HFZwHaqU0NREdKOC5R1e6q/Ug0ln27EvscLjtK4R5yID0Lna?=
 =?us-ascii?Q?eqtiKNl68k3e36NBE/9mzCxeoY50ZSXrEm7/wUVRHSbN+L9FFC7HPGDQfoxA?=
 =?us-ascii?Q?LMcAgAINZam7V7fmcRZR4LQZswu/QGA3oyQWpBXItdOsMTGCgC1sSiU9hmKE?=
 =?us-ascii?Q?14dt61FR8adkazsD/ay+gveSVBYpivYt7qRjA0T6JPnkDj/F3o5TimozuCNt?=
 =?us-ascii?Q?zGnAhCb4gMjOTi83eRh6WRUeK7OIK/BXiFylzGLhyuxeYSIGaqfYMxtuocDm?=
 =?us-ascii?Q?rzSfBpL/MqWeQ635Z7XxTrKmGo6x64A+5XRDU1925sRPrwtPEr3o61xaZW3Z?=
 =?us-ascii?Q?I3dUjfdRfTwAY4uXkohq+cMGjiJxjBfRpIJfP3TTT2ybB7um+Fu8M1BQytyB?=
 =?us-ascii?Q?XQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 227c5c60-e5f2-4eee-b738-08de3e1035c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 08:34:07.5820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ylg7eLq+uvOFpj/I9kbDioc+KVPB/9SCtWwKRAg1iE8BLlgVjkEkK3uO/3/lG9f/lxRyAA/ufhSmHlq4K7zpzZj59KcSgIzviEKpSgLIdY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11397

Hi Tommaso,

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 18 December 2025 08:09
> Subject: Re: [PATCH] i2c: riic: Move suspend handling to NOIRQ phase
>=20
> Hi Claudiu,
> Thanks for your review!
>=20
>=20
> On Wed, Dec 17, 2025 at 11:41:43AM +0200, Claudiu Beznea wrote:
> > Hi, Tommaso,
> >
> > On 12/12/25 13:58, Tommaso Merciai wrote:
> > > Commit 53326135d0e0 ("i2c: riic: Add suspend/resume support") added
> > > suspend support for the Renesas I2C driver and following this change
> > > on RZ/G3E the following WARNING is seen on entering suspend ...
> > >
> > > [  134.275704] Freezing remaining freezable tasks completed (elapsed
> > > 0.001 seconds) [  134.285536] ------------[ cut here ]------------ [
> > > 134.290298] i2c i2c-2: Transfer while suspended [  134.295174]
> > > WARNING: drivers/i2c/i2c-core.h:56 at __i2c_smbus_xfer+0x1e4/0x214,
> > > CPU#0: systemd-sleep/388 [  134.365507] Tainted: [W]=3DWARN [
> > > 134.368485] Hardware name: Renesas SMARC EVK version 2 based on
> > > r9a09g047e57 (DT) [  134.375961] pstate: 60400005 (nZCv daif +PAN
> > > -UAO -TCO -DIT -SSBS BTYPE=3D--) [  134.382935] pc :
> > > __i2c_smbus_xfer+0x1e4/0x214 [  134.387329] lr :
> > > __i2c_smbus_xfer+0x1e4/0x214 [  134.391717] sp : ffff800083f23860 [
> > > 134.395040] x29: ffff800083f23860 x28: 0000000000000000 x27:
> > > ffff800082ed5d60 [  134.402226] x26: 0000001f4395fd74 x25:
> > > 0000000000000007 x24: 0000000000000001 [  134.409408] x23:
> > > 0000000000000000 x22: 000000000000006f x21: ffff800083f23936 [
> > > 134.416589] x20: ffff0000c090e140 x19: ffff0000c090e0d0 x18:
> > > 0000000000000006 [  134.423771] x17: 6f63657320313030 x16:
> > > 2e30206465737061 x15: ffff800083f23280 [  134.430953] x14:
> > > 0000000000000000 x13: ffff800082b16ce8 x12: 0000000000000f09 [
> > > 134.438134] x11: 0000000000000503 x10: ffff800082b6ece8 x9 :
> > > ffff800082b16ce8 [  134.445315] x8 : 00000000ffffefff x7 :
> > > ffff800082b6ece8 x6 : 80000000fffff000 [  134.452495] x5 : 0000000000=
000504 x4 : 0000000000000000
> x3 : 0000000000000000 [  134.459672] x2 : 0000000000000000 x1 : 000000000=
0000000 x0 : ffff0000c9ee9e80
> [  134.466851] Call trace:
> > > [  134.469311]  __i2c_smbus_xfer+0x1e4/0x214 (P) [  134.473715]
> > > i2c_smbus_xfer+0xbc/0x120 [  134.477507]
> > > i2c_smbus_read_byte_data+0x4c/0x84
> > > [  134.482077]  isl1208_i2c_read_time+0x44/0x178 [rtc_isl1208] [
> > > 134.487703]  isl1208_rtc_read_time+0x14/0x20 [rtc_isl1208] [
> > > 134.493226]  __rtc_read_time+0x44/0x88 [  134.497012]
> > > rtc_read_time+0x3c/0x68 [  134.500622]  rtc_suspend+0x9c/0x170
> > >
> > > The warning is triggered because I2C transfers can still be
> > > attempted while the controller is already suspended, due to
> > > inappropriate ordering of the system sleep callbacks.
> > >
> > > Fix this by moving the system sleep suspend/resume callbacks to the
> > > NOIRQ phase, ensuring the adapter is fully quiesced after late
> > > suspend and properly resumed before the early resume phase.
> > >
> > > To support NOIRQ resume, the hardware initialization path must not
> > > invoke runtime PM APIs. Split the init code so that the low-level
> > > hardware setup can be executed without pm_runtime_get/put(). This
> > > avoids violating the constraint introduced by commit 1e2ef05bb8cf
> > > ("PM: Limit race conditions between runtime PM and system sleep
> > > (v2)"), which forbids runtime PM calls during early resume.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: 53326135d0e0 ("i2c: riic: Add suspend/resume support")
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > ---
> > >  drivers/i2c/busses/i2c-riic.c | 65
> > > ++++++++++++++++++++++-------------
> > >  1 file changed, 41 insertions(+), 24 deletions(-)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-riic.c
> > > b/drivers/i2c/busses/i2c-riic.c index 3e8f126cb7f7..9acc8936cdf7
> > > 100644
> > > --- a/drivers/i2c/busses/i2c-riic.c
> > > +++ b/drivers/i2c/busses/i2c-riic.c
> > > @@ -349,9 +349,8 @@ static const struct i2c_algorithm riic_algo =3D {
> > >  	.functionality =3D riic_func,
> > >  };
> > >
> >
> > Moving reset assert/de-assert and controller deinit/re-initialization
> > on runtime suspend/resume may increase the runtime suspend/resume
> > latency. In case of consecutive requests this may translate into
> > controller performance downgrade. If you keep it like this, you may
> > want to increase the default autosuspend delay, at least, to avoid
> > controller reconfiguration after each individual struct i2c_algorithm::=
xfer() call.
>=20
>=20
> We can set autosuspend delay to 250 ms.

Just a question, What is the delay in current driver?=20

Cheers,
Biju

