Return-Path: <linux-i2c+bounces-8358-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B767A9E69D8
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Dec 2024 10:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72F51281D64
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Dec 2024 09:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6DE81B412D;
	Fri,  6 Dec 2024 09:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C6TSIAbJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F1A1DED74;
	Fri,  6 Dec 2024 09:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733476403; cv=fail; b=THNHTZqhsWZ/31TOJ5AWYQd1psiA5Mu4f59drKBdl/L03hYWW5a8UxEUI1oTESB4+wCoWzEp0nv9RyiEOTMQUAnmhMjhNumbTJuw3+B38DH6g46Yy5P5RXTs5gVZKSShdMhwtYc9wVHqvZOy6mAnBdoIpW/u6QEIUQ9CT5G3LyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733476403; c=relaxed/simple;
	bh=vmvmb1KCc6WKhJhOFnFzvKwlWma3NemmM6z1rzn7yL0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JvDIlkmGtikmnAVPiMGywPS+9ZCI+TKxGbF7hduoDokpsIathHHXkA5eKF3ZPJmAb6s8MzCtAclowWwYpkWePbI0Pga7pL2Q9ZHMVMGJUuk4wddFEQqXot0+6bk2VVCTKg8bgCUqWtNS/HKS+CgznmXOqb6u3RM5GIUZ25yT31I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C6TSIAbJ; arc=fail smtp.client-ip=40.107.21.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TB0+1UuhHUoYgV+xs8eEMQPSeageUuAY/vd5Y6+nMhbpkgt1IE0CAPzBhzzsvy+LnLkPUfI6cCGnp1NleWxZA2s+o1SHL+Y3MpeYYe3tDEI6xuSCcB1f3h18wNfVDWzu2Ubp5p52l85sKCPr3ieKMfbyLFwIAvLrB8aOd9WRKGIB3jhdailYb7LgMDa4ozvn33Pq/S6/jBJzypoUwi/BP9Sbpajt1ZkveanwJO9Qp5StjjzJdCEfGdaf0KFBpHOqKGxHDetC6iKrKjZZTbWgitQYSIJeSe9Druklj5FfCTxTmJM7Nh5tWrHgAjNMWYnI8ZN9ll9RXjUFCSJyU/r+mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIqd6cICLcDtgVU8TjeLaWc6sKaVVwdmQxgOHtChvG4=;
 b=T/s1SOlpKMYgDkYSoWTQDqCveXkaU8yfBEULrZQwWkLEgrrseYyVHi9XW72HEganz38rQjmuV7MGwkuo8oz/N66dzwJmRB5bmDLz5fD3uYa1ILjUMHiZsmAzkK9L94gofITZw8AwZHJRwOzCdpOHM61PFI2nFHNR8NMbniWjjQ3aIqbRhsbNfxuzhvwX2ioaG56CzO6xcXOOU0SRT+e5jHrRgxD93NbOWQb5h/t2lypSyjQIZ5e2Ymn4EAoJdpP2u7XUNTHbqyqqAXNaezsTWg1FIQQvtNIGVubSXUVGQiUDylKOEDrpWdHCuEowMHkpV+gB7/FnQZWwzkItNtoPnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIqd6cICLcDtgVU8TjeLaWc6sKaVVwdmQxgOHtChvG4=;
 b=C6TSIAbJ5M6OUIhhf2/wegU53YAhyLFHluSUY/gCsQ5AFDSPCRXtvFA93LTFF3sU36dcoxvKzmDmntkESostjGhHtnsUN0Id+Yvo9GKfjkKuBOUV1WE3NVuOwUE5nxLUKI0o6NRFJRH7ZjJsqNgFI5Zgi+MlObCZ6IOLZwv0+7vyyj2GlOpvCQCIHMB5hxylsMUzx7J//baP4vit8MV7ZWV3wVD5X/GOfbYzUml4wJ20KzuWdCxkVh8yxQCG+hDXoJ0m7/lAeGQwRmM4eI3mFBGrUskor9zul1CJmFcc8SbQUJ4XmRXBX7wx286vhOXBAbE2qV52bTClLZl9YBMR3g==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by PAXPR04MB9644.eurprd04.prod.outlook.com (2603:10a6:102:242::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Fri, 6 Dec
 2024 09:13:16 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%5]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 09:13:16 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: imx: make controller available until system
 suspend_noirq() and from resume_noirq()
Thread-Topic: [PATCH] i2c: imx: make controller available until system
 suspend_noirq() and from resume_noirq()
Thread-Index: AQHbR78V5fUGsbCKp0i1DGjXUsVoLQ==
Date: Fri, 6 Dec 2024 09:13:16 +0000
Message-ID:
 <AM0PR0402MB3937ECA7D10662217F787AEBE8312@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241125142108.1613016-1-carlos.song@nxp.com>
 <6d6xgvuvu74hm5466xeovgr4qqkwxaxaoeemvfdty3dqnl4gjp@axlzm6mxnzkv>
In-Reply-To: <6d6xgvuvu74hm5466xeovgr4qqkwxaxaoeemvfdty3dqnl4gjp@axlzm6mxnzkv>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|PAXPR04MB9644:EE_
x-ms-office365-filtering-correlation-id: 874a092b-5936-4c9d-1a42-08dd15d637e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ECOafoj+FT2Ovnh876Id3hjXmnVxWN+jorD6BpxaiRm11lXIRzB6HdMgwf4m?=
 =?us-ascii?Q?Pbn1jrq0aaaeOsKAT4APuemya4U9q6ycIZNftZy3DMNS9j18oooOw3VJ1LRw?=
 =?us-ascii?Q?/hOl8konioazIbojmzWFZxmPqoa/tP1zgzIk+vYqMXwW18dcSh9PhR4ct461?=
 =?us-ascii?Q?XAA0O9LtzN2DW3QGuAqgw6JtWnXZb5bN2UT321voRUWaUYV8okci6ApLKtk4?=
 =?us-ascii?Q?bcDrWM478zflLlfbH6vTsSbrKPSgtfoACoGkkk01+zUaGvPmPp161xJzIg5f?=
 =?us-ascii?Q?zFqAv9U/Ht6+TfLfhrhBIziZ3L6JwMyd2bzqJSf52yYwkvCHK9bm7d9EmJXQ?=
 =?us-ascii?Q?L5wbb1hFHqUV2HlXP3jgNTLZWorngEYMr6GuM8scVuazVcCXR2k6o2mzHsBp?=
 =?us-ascii?Q?gOWlghBoDM0cvyutz/m2hmIB/K3OcAdNz3r67AICE1x6MWRk/Qx4dvyCMN+0?=
 =?us-ascii?Q?KdepIH/pcK+ksEAEU6Qc8/xqAxn5FjZ3PccY7y7fGX0F3MWjvrD4ZAt7yrB7?=
 =?us-ascii?Q?3nfoT5u2nDsAoW14IVqy58vKXNa6+FuL4AfQXG9xyjTRKSxd25zcs7D5cc36?=
 =?us-ascii?Q?KMG8ml3tcZj/Vj6hKfM5ryOR/2ORTcfPy4J/ZOHMzeM/TdmC/6z7Cvuf+OFr?=
 =?us-ascii?Q?xkoLwv5vpsHJh3oxh8Zcy7meWsxotHRTu74zga22I/dUbyfIuybwn2xWm3O+?=
 =?us-ascii?Q?ZPVfl+UacdqkGa8TQ+jAO8dwsRGoRMEnZugG2RdOz7AJJpbFpeVKYkTBY3CZ?=
 =?us-ascii?Q?V3ihnhxk7r81vrksfCerxPrMuLuHyN/qHMVgU4KPcKsUF3enSSB5kq3pEbTd?=
 =?us-ascii?Q?KjRrXALXZFDJ9RXSBNB5uvso1qPA4kISAnh+F/CDjOlvC1KwZU71+WzOAppq?=
 =?us-ascii?Q?jxPQHpFB32Hg6tXWkBIrDis4pKFpoerp6BvmGGORx6pbaOducO0OaY4KuYB4?=
 =?us-ascii?Q?j84gCQVKorKbe8ijEzi+6WA0w+Og1G76ChcxQ7xQMUWrGC6LkBnC0F9XGsYA?=
 =?us-ascii?Q?yy17TNobjtIZKFQYU5xwAIfha5Nd6xh5gxm/I6U743GTwhCNt2ZQWXWToImg?=
 =?us-ascii?Q?o+uRMZYWU0pFKtrZ/aW/1aXsXhcyQzdUJ6+JsrhDr51NIlpqgm1WD/upV58O?=
 =?us-ascii?Q?TiymPgS23XTFM4kJcCKWlrdXM6eu9JtODZcUxolLreC5Jofy8aLQ1+PULgRL?=
 =?us-ascii?Q?s+JekFheeH5mLRw7Ua3QmUrg9WSAQ+3BjMUcYU/qg+y0SrZymt4xphDCCg01?=
 =?us-ascii?Q?CPADN356TIhk5mSDNHgiGayJbRK7hMNwLpKHhM1PIecEkTibnObeOmOGmFnk?=
 =?us-ascii?Q?OXYBVuWSDoVheJOdJiayqON74fWTpcQsppVHFBzkaSSBm3bQAb2Uh0gwwuY8?=
 =?us-ascii?Q?q39KyCoqTfdsIGOWpDFn3ailQ/kQqjoZ4q7LxVnBWhEbWuicYw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lvEYMToRFvCzf2+rneDhXeRWP85xEibzeVBxtYKI4bcENXFaQERatdJAKs/s?=
 =?us-ascii?Q?5xTE/Oe9jl9/Idca0JOqZ7GqPMqOErGzenaA1/VseaoPAF1KW2H6AoioQsgR?=
 =?us-ascii?Q?/X45bhe1ZrN7TbjUZ3+hVW2wlrCuqumm1H1DKUJSvSSjF5CAkMEwzoXQlVkX?=
 =?us-ascii?Q?zjnuwOiekaIM2lemmXNV+WiBW+gz9Cja9NDiOkTFgMjE3PNgRvfYrRy9IQbE?=
 =?us-ascii?Q?j4BGwjLz2ezMUqcUpux8EQKsW6iTnKPIadJ21FfP3HSjGgLTCFlkr+MD2Jfv?=
 =?us-ascii?Q?jrGFrFmkBky7Ps0hL08lgYcR6IcFB7MSqoA7/W3+8iUdGlYJ9wTZYxzxTs2j?=
 =?us-ascii?Q?UVY18IQhaM0SMY3zqSvLGg/b4UNcr7fcNO2wjLz7XAybSTEXAJqNavdFfx8a?=
 =?us-ascii?Q?cwq6pDpoBsBwzX+I72ajXCr28RFMorgc6/UxQFhOccYD3zoEX/EX938TbS0B?=
 =?us-ascii?Q?T+SGORAMS4/7S3gNxNQXnSQk7nZu0gg2QxEnlh+W52qR3XCxRFXjTaCETnYa?=
 =?us-ascii?Q?N90Z3a2xVzLbjn/5pmFX03n7SS/xRht0P7X5JBW119eY05SaIYyJ79D5RDoh?=
 =?us-ascii?Q?c1zcMRoI++FlvSwaG6FvccZA2VBxJorQfdVd1AJryED6I0urk7YOKONcS5tu?=
 =?us-ascii?Q?TxZncG/XAOTsFab1VagfSb7jVhzcY2kwo2eyW7I0C3c4i3o8nc9LirvoOzhr?=
 =?us-ascii?Q?q5JDZpYa9BHN2S+9qAjD3OZN1z01qYahFLjqM5VUVa8rgr3sVX84roo6z4X1?=
 =?us-ascii?Q?WLL57XxiAVPzSyfIazAQabuo40HQJUxND6zLswbl2CRjhfL/U7zQtb5eBZ/R?=
 =?us-ascii?Q?ph9c38dfm8Ji5Cyc5sFraSN3fbbVSbaWeFrFUOy8VrBHVwTVSmBWhPvo7Cfm?=
 =?us-ascii?Q?SnH3S7EhE+rjk/jFbqaxBKsazGuugIQdUURx8SyYpBHTs9NxziZM/OTis3j5?=
 =?us-ascii?Q?THWG+dvGOEQGjNnZ2vKUjxwFzbZRSYZ7iYiNddivTEUOCbZBQBLREAzjHwaM?=
 =?us-ascii?Q?t0sim666P8RBNfgOKI908k1GhnOlgP/gcluKCd1M4d4checkOFCb4C4ARF3z?=
 =?us-ascii?Q?lGhst8NYJF/mcBSVMrbiAAbuRKFBhDQOM1LJ4xXJkjUiQ6lZhmmEJymTIyb/?=
 =?us-ascii?Q?oRImBqaKrDGIErg4P/7PTNPLq0pfoWqE6NHxMBSfqg56KD2oNSCAJhEbPef9?=
 =?us-ascii?Q?ibflB2jzY83Kb6SiEh0OpLbDLJFE4/z6fsf/uP5Qv6RqcpdzNtEp8nXwJ/Vi?=
 =?us-ascii?Q?0XUKhDmlJsQkHBAu6ZGijNxDzKJLelBh4j2jSmUWWoIoiB7SrhoiT4h+yu07?=
 =?us-ascii?Q?5wXw8azIJmdhs6ZmUGOWSmXcrI/PpOj+dJLexSScdN9jOPajS7QBdJKAf7ab?=
 =?us-ascii?Q?A5UpIC45FFXfT+OJwD6fSONLWyYeZu+XKo9ZgFzodFMaoS5iWJecsr8Cx7wD?=
 =?us-ascii?Q?UGr3ZG0kVN2+TVwYMbTcLgyGpVWSA9Z1aa9vgGRvIFfnyD2+gZMHDHPKwUKT?=
 =?us-ascii?Q?kt69zmqdgwv0o1Yi27uV/bqTUt3XqR5ts4wnuLXPdsh8hClYa51EcrvpA6ad?=
 =?us-ascii?Q?c7mCJsOJ0n4y07h32UevFZF8ovllLmIX9H7yUnqY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 874a092b-5936-4c9d-1a42-08dd15d637e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2024 09:13:16.1033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DCicVmq4e0I+KlkX4DJU6qhwNK923GfZ3QPjF3M+/0q86dhVg2gt17b0zZIXSFY22+LIHf49iMWR3xj4Xlpa1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9644



> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Thursday, December 5, 2024 7:54 PM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: o.rempel@pengutronix.de; kernel@pengutronix.de; shawnguo@kernel.org;
> s.hauer@pengutronix.de; festevam@gmail.com; Frank Li <frank.li@nxp.com>;
> linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH] i2c: imx: make controller available until syst=
em
> suspend_noirq() and from resume_noirq()
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> Hi Carlos,
>=20
> ...
>=20
> > +static int i2c_imx_suspend(struct device *dev) {
> > +     /*
> > +      * Some I2C devices may need I2C controller up during resume_noir=
q()
> > +      * or suspend_noirq(), if the controller is autosuspended, there =
is
> > +      * no way to wakeup it once runtime pm is disabled (in
> suspend_late()).
> > +      * When system resume, I2C controller will be available until run=
time
> pm
> > +      * is enabled(in_resume_early()). But it is too late for some dev=
ices.
> > +      * Wakeup the controller in suspend() callback while runtime pm i=
s
> enabled,
> > +      * I2C controller will be available until suspend_noirq() callbac=
k
> > +      * (pm_runtime_force_suspend()) is called. During the resume, I2C
> controller
> > +      * can be restored by resume_noirq() callback
> (pm_runtime_force_resume()).
> > +      * Then resume() callback enables autosuspend. It will make I2C
> controller
> > +      * available until system suspend_noirq() and from resume_noirq()=
.
> > +      */
>=20
> Just made some little adjustments to the comment above, please let me kno=
w if
> they are fine:
>=20
>         /*
>          * Some I2C devices may need the I2C controller to remain active
>          * during resume_noirq() or suspend_noirq(). If the controller is
>          * autosuspended, there is no way to wake it up once runtime PM i=
s
>          * disabled (in suspend_late()).
>          *
>          * During system resume, the I2C controller will be available onl=
y
>          * after runtime PM is re-enabled (in resume_early()). However, t=
his
>          * may be too late for some devices.
>          *
>          * Wake up the controller in the suspend() callback while runtime=
 PM
>          * is still enabled. The I2C controller will remain available unt=
il
>          * the suspend_noirq() callback (pm_runtime_force_suspend()) is
>          * called. During resume, the I2C controller can be restored by t=
he
>          * resume_noirq() callback (pm_runtime_force_resume()).
>          *
>          * Finally, the resume() callback re-enables autosuspend, ensurin=
g
>          * the I2C controller remains available until the system enters
>          * suspend_noirq() and from resume_noirq().
>          */
>=20
> If so, I will take it in.
>=20

Hi, Andi,

That is so nice!

> Andi
>=20
> > +     return pm_runtime_resume_and_get(dev); }

