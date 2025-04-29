Return-Path: <linux-i2c+bounces-10669-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76800A9FF91
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 04:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C6D99223E3
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 02:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A63253F2B;
	Tue, 29 Apr 2025 02:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ea9MDnpm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013050.outbound.protection.outlook.com [52.101.67.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10591A23A4;
	Tue, 29 Apr 2025 02:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745892943; cv=fail; b=FEMSwG1Z5pq3X8km6h8hEj7cDteZjVPGI3ibGVo8h+zPv2BV1FyhHgMmFHy2kdrYp0dNh6PMAmhSayerxL5nfDwh71YLQz7ajEbGBjfE8YPkatC8meMVJtj8NOGDcLWQewE5gGGOKFH8T/wl3Pfj6H6kze9jwzNjYWICn9R2Dxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745892943; c=relaxed/simple;
	bh=zswtUqKusC5HPiGYeE9mAE41q1jCNLVaqz6/vb3Dmhc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LG3tiJy/HjQUJ/fru7rZuNzgTNRoG3ZYvVQhVhEyOUk0PNiFX1yRFoDssoaIsIJGj6IcI1X2ZX/lElj7UwwoW4UFhtY1uKcyUG+w/eAmGizgI27c7agd27WDss12rXZgMr+s5vJ1zXgDHZRkIDk5PBWENywJxd2AvS8dBtMNkEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ea9MDnpm; arc=fail smtp.client-ip=52.101.67.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JhQwULE7V2g1Dyv9RqPvEA2Sesu72+o/qynkWbsYC6e5t9xlsO9AXjRZ6NwxHU7K3P6jSdyjj22l6vwkSmAErPRjwhsZexeAmu5FEXM33wg+KL5L+AOzoD9Y8lZtoXGo0PifiZNaNRgKqusxxmX9OZ3wUv05eJkYmS2xYQSI1+y47dZfYXb/bUOBuorEs1Db1sZ5HgXUwrA4KFHQ71t0UcT7z+fHJhghmCQEPPkGAhfwANzijzI2i5sbKZtZPBfZ4cSmAGuUQu/yFHYNFXcHtgDojBXv2Hn6rpL3h+qMVyNp99vI/32rRV5hfMmB90KMToWYsBu64JhftORozOoAEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4yI1kWuEHSuZAwcSO/hkTlDd8PeqGjlBWLOXJVAdqc=;
 b=ySYJHXxHMwz/FcHGV3ETJIIiHNAcpCD8KxpXhf2FtjZCpDFQ0H++XocerCidkceK+Xp07B5pqPzE8QLU46pepWMF8TUqd8m87oXdvFMe2cC48qGWQHFzWx1Rt+Rnbf4UUfoeCAZ4bf6qsE9n1ZTyNhdDruKFn8dzyV//jrLMfBalhKpb7HPLqWXG8wq0IWkEhf5xoSH3vV3xALSeLN4kOyRbWxnT3v0qvdNExrlwCZPA8qVRkNF1urnXMebZLnrM00xREvfztNPu3obeQ7lSwP3wYxMliT1ctZ9lRc5vMO53/NvsAOxl2xU+dF3C/k9JhyllpN8mVEL/D3Ac3gWifA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4yI1kWuEHSuZAwcSO/hkTlDd8PeqGjlBWLOXJVAdqc=;
 b=Ea9MDnpmuYaRcTRFqrMplu2NHGXe4f+1Z4gQrrOGQWnIkaX5pkVK/QTb7W5y+TWsuMxe8IHYgqJGE58Zw12VnonvXqAXbIOamiN8r1SiGBRdEaQDyOmaPz4UlmdmxjHrbprbRTpeqdHE70y6qXLIwbyMZU3SMuOZL1X5XVQWIAjv989du8gwVX7WQZ/A9p4JYkSEn//8H44K/3qSyRHdeAlUCXZDLFZqqnlUMaJ0b0pPWHEyOGTqLufaL+6ZKLsbzC9u6Tp74vPtlqvaEafOokUGW0kz3/l9oSEVGZVxM7HBy89mO7uFf8HgFdZKR716od1RkjuNMOaehwTGEZ4CrA==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by AM8PR04MB7732.eurprd04.prod.outlook.com
 (2603:10a6:20b:237::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 02:15:38 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 02:15:37 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Aisheng Dong <aisheng.dong@nxp.com>, Frank Li <frank.li@nxp.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: imx-lpi2c: Fix clock count when probe defers
Thread-Topic: [PATCH] i2c: imx-lpi2c: Fix clock count when probe defers
Thread-Index: AQHbuKyYLN4e5+LbPkCVGENqPVhLXQ==
Date: Tue, 29 Apr 2025 02:15:36 +0000
Message-ID:
 <VI2PR04MB11147FAC0E3941F672ACCA47CE8802@VI2PR04MB11147.eurprd04.prod.outlook.com>
References: <20250421062341.2471922-1-carlos.song@nxp.com>
 <34ally74jbpae6etevqskr4zmcv5xyac46n4hl2j5ybihwtezn@jd2gvr762gs7>
 <VI2PR04MB111474EAC1B4DB8EB6DD32628E8862@VI2PR04MB11147.eurprd04.prod.outlook.com>
 <l7meopd4ny4lbux64w5jgyugza3idt4sabwzojmvrafw67fhsw@uf4xbbajzfrj>
In-Reply-To: <l7meopd4ny4lbux64w5jgyugza3idt4sabwzojmvrafw67fhsw@uf4xbbajzfrj>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|AM8PR04MB7732:EE_
x-ms-office365-filtering-correlation-id: 8f6ec520-3125-45e7-03c4-08dd86c3baf0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?EKcRjjGVLw6VQDVK44Eo1h+UC37dcUWWMmOlc5mvDp4lfYe52iNeKuU9/shq?=
 =?us-ascii?Q?AoVWOw12H5ADIPEKvZrx7/I9OFk+xsF96i+jDsnKLMxxEq1rDf/PlLGEf07q?=
 =?us-ascii?Q?VE82EOWTYc9aWGAFv3UyD3OlLmJo8riZeqOTDbN9L6hvMjMLQlfPbTpnG++F?=
 =?us-ascii?Q?GuYhZj0FXIia1y0rX4YYqUH+GmT7dm26i49cC4iYKK1J9kRlA1vvUxc/BqcW?=
 =?us-ascii?Q?ejj7uTVmoEXMZIeBhcFHVUykDDCnPDbD98ysK07RuaS6qLCYWA8fiHJn0l8i?=
 =?us-ascii?Q?MV5OUy5hjBV9hwcbsApQ/XRDCbZ6F1/MdHrUhj+wq1PSxHdXujeWTYFcJfJY?=
 =?us-ascii?Q?UFIyjAfITfDUKluZSo3sGbfurvejcp+A7VrswRaN8pbTQgZQz6R+RhXgWB2J?=
 =?us-ascii?Q?XsijTb9rHFBiX5goY6vD5wkVGFEO+8rtsku7BjNGYhS37dyFDDor+39BYnC9?=
 =?us-ascii?Q?N29mvUIlNKrcJOFhc6GGN1Bh80/mjuc6baFJ4tQFhVkIrxo/a4BI9IrXEIpN?=
 =?us-ascii?Q?4lJhMU+0VmgOPzl+sORDVF45iWEWzFKrOZWM1ipa6/h9kj6bYVtEKy/YJ8HX?=
 =?us-ascii?Q?tretGGlN5RCqEVdloH4G212ZgAXZ5h2NWkiVV1QmmYIMpaFBGDtVDfAg7oNb?=
 =?us-ascii?Q?hY/bT+Uh7RDFif01hTPgMbh9PdwA7qmMNqKeMM/9NkDkVEODQZvCbUYzsaCs?=
 =?us-ascii?Q?0/p6wkcsNj8kgf9DtLMk837FlP7LG+po//hgC7K0JZWv5LYGnifhO9DrhyjM?=
 =?us-ascii?Q?8mOEC+vJu85Ljui37oPNUNJpn+e0FRkjQoIVtB5lB22RSo8UFCb/FoVhzY7w?=
 =?us-ascii?Q?Hb9fYGTNv0tMnvtFA+kWhPeBT0KkVn1L8lbnUppbpJI10AiPGWO7jD3oBz0b?=
 =?us-ascii?Q?VFYz3S3ZiaAZ9aaftuJ7s/3D+zQXOPY+IspYYB+bSnz8i49DZoKiFxdTFctn?=
 =?us-ascii?Q?5Ekrg8yqZqjU2LMAPIoT83E3v23AdptRJycNUKm/YiiOpEsKcy4xSjD+kjr3?=
 =?us-ascii?Q?pdEnpWOr/E35CNJqsDNeUKs7AnbiBRUZY0NUWyoefNUXbvWMYKQrrDZVwvRH?=
 =?us-ascii?Q?jokxg3VatWU581P63xPUT0YJG4sxv0olIyNXXtp8BlVJedLfdMtDSwpK1Pna?=
 =?us-ascii?Q?yj5Ik8oG83fAXiNrEvNbJCY6lOHSwI6xDzFZkKbwCDtmO+r0p+oJZnM9tHGB?=
 =?us-ascii?Q?vfMDf/Ov7mHO4A9yyxswC9IESXPrJNdJw/+Ng0z0FnL4ZPjbwcgqEAurn+os?=
 =?us-ascii?Q?kY1duxhQFb++toQpSMoQp59vJgdNHcnsHhm+s+oySWfuJ3KOQ7wOi5EWFKFT?=
 =?us-ascii?Q?whxLlgKhguriIup5BNMCjzpcTBclbNG63BAw1QKlnGhLLzI5JL1qYi/U95JR?=
 =?us-ascii?Q?U3KHPw+XjBnk7wU9vPeDd8zzZ7rVtScfJUowUELwAAuzyKcW7N/qSPAAAfdT?=
 =?us-ascii?Q?WU4M4MlzJDYF7vps1LkBswwwkn3pQifXS2OPaxuHTBLDZXwavcOXfA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XCrAhFTU8kFGRx6DVrGRDtsWxZjeNkXy7xGo+Q190bxtscpigs82zwvuNyuH?=
 =?us-ascii?Q?hQ0vaaiccREmlIfJqd3AdufUew4yT19+UamuhHLiUXR0l5xAovOjkXk+DEMH?=
 =?us-ascii?Q?ebgHffbF1jQn5SckAWerR8V9qIjGk8O3ZEH/qNDO8lnG9/DaJvj7+vGsqIac?=
 =?us-ascii?Q?+zC5GOAwtVm9Fgn5hF1phQSgJagRJ6/1aMkWOdo8tFNmMz5bUwGjoyb+4ES+?=
 =?us-ascii?Q?n7LNmxxlcYQYrlB/C8JzWAwGs1LUqYAfF1P8BygWedEfUJS3YOZNOQgDgiqi?=
 =?us-ascii?Q?jdKjQegp6G4q1ENvNaIKPaC8bNHNWWb5tJnixWPoYi1lKt8y6JjlpVNQQcvP?=
 =?us-ascii?Q?fDtoKUuvjdR8xsBA+rFOR0xghzdosBmTn47web8ADJr+5D4bCPnXa1LR4thE?=
 =?us-ascii?Q?b0H4FX/BqgViiCgF5FTixewznoJQScEajXF8CycENdeIQYCu3JyHbsOqC1Rx?=
 =?us-ascii?Q?2dmq/LxoFG3OsEiEPTAYnssNt6YcLIzRcOhGBBb2daKDGUsFonHL7dxiIAxK?=
 =?us-ascii?Q?jj1f1hIo9RfhBOryNMl2iNxh2ebU3KI6i7qKaC57UO6B1A0dm4yraXsKk171?=
 =?us-ascii?Q?iEMFmiMFxok2P5JCSQzNqsLcmFqJ3zQnch0NcC1R1NQ9Rn3HjjfEouC56EdN?=
 =?us-ascii?Q?/DSQ9AJgwObsdxP0CnxGuzTdhya3sGR6Ao0Qag51ezpZe8UkyBVn5ugFlmPb?=
 =?us-ascii?Q?HWJAZTRSuDQTo/o3RkJH4s/ImySHCq8ZQmx/k2jgzj419gQLCowkAfr6+hIN?=
 =?us-ascii?Q?XwqqzhTNmdELbiNL7wqFMjylaPKRJpm8HpIGvtneEmoXOtCE6RZqvWhRb2lB?=
 =?us-ascii?Q?DuJyOzVaxF5wPlm2OAWXTPd8PWqsTnOHfelp5L/viKyRUNubOQuf8hb0P7v2?=
 =?us-ascii?Q?A+1I/ffSzYVZTZhossqG8y6eA8ygOWlZW0IeteAixl0HZzrMbVyCOFN7/oSc?=
 =?us-ascii?Q?MkFUNgRJA9C4G4MiCUXRP2E/i1dafJwUl9iMsaaoOHrnjgLvFQsfgU0lg+np?=
 =?us-ascii?Q?6dGJpi4RUVgyt23uHOy7hqVJtdRwodhKQiLsh4AGuedd0Uv2bLcoh9qqLzWL?=
 =?us-ascii?Q?nyU0zvwIPKV7HL0sIjJHdQsTOXUqStRiKzxkeDHmZ4W98wnNv+aldt3ClVTf?=
 =?us-ascii?Q?1vs2h0jA8jfUf9MheOAoPYK95y2ohkLYz0PfUHfoGkWfqltnWkON4I0ZCk5G?=
 =?us-ascii?Q?KevzPzDDNKse4ZdJCp4u2gLuV8fK8dsNb3MozPHNU3zXTff8h4zgg6GJKCMf?=
 =?us-ascii?Q?asDDkl6Ww+hfx2wecZfp8bLqrcJKEsn6i5MzIp98BROhTGO5BF7nnCWjIs9l?=
 =?us-ascii?Q?Yp5pyINcZnO9s9In71u/kPsYUAKPMzKBCkMTnfid5nLosXwewoJlkKLiN1AP?=
 =?us-ascii?Q?1xmZV27M25DbXBLsLggoQhQcWsWYwKBpmfURq4PnONDVBp5zDybTRtBkDKQz?=
 =?us-ascii?Q?sD797oQ6YsNkgWeX3XXGRbIBJ8GQRRrEbXTGumjIXKxI4vN/lXkXpZRxvRf5?=
 =?us-ascii?Q?WOYCXEE0C2mi4IC9A579SYPH+V29/N1eVb3gghN+Pjx7XDsBrvDgcqcv1wTu?=
 =?us-ascii?Q?HjSZnqvMD4Nnj0T+fN8=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6ec520-3125-45e7-03c4-08dd86c3baf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 02:15:36.9113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GUg/Gh5+ukiFe/aZkfXKepEQ2glYg0OgUQJ1ka4/rMLEJh6EFT5FEBCtriZ7tZY/MqtuFZPXwd5YZCUC2Ia/kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7732



> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Tuesday, April 29, 2025 3:17 AM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: Aisheng Dong <aisheng.dong@nxp.com>; Frank Li <frank.li@nxp.com>;
> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH] i2c: imx-lpi2c: Fix clock count when probe def=
ers
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
> > rpm_disable:
> >       pm_runtime_put(&pdev->dev);
> >       pm_runtime_disable(&pdev->dev);
> >       pm_runtime_dont_use_autosuspend(&pdev->dev);
> >
> > pm_runtime_put() may not work really sometimes.
> >
> > [    3.203715] imx-lpi2c 42530000.i2c: defer probe
> > [    3.208324] imx-lpi2c 42530000.i2c: lpi2c_runtime_suspend
> > [    3.214801] imx-lpi2c 42540000.i2c: defer probe
> > ---> (No lpi2c_runtime_suspend callback(pm_runtime_put() is not really
> > ---> wrok))
> > [    3.220672] imx-lpi2c 426c0000.i2c: defer probe
> > [    3.225248] imx-lpi2c 426c0000.i2c: lpi2c_runtime_suspend
> >
> > After apply this change:
> > rpm_disable:
> >       pm_runtime_dont_use_autosuspend(&pdev->dev);
> >       pm_runtime_put_sync(&pdev->dev);
> >       pm_runtime_disable(&pdev->dev);
> >
> > all issues gone.
> > [    3.093025] imx-lpi2c 42530000.i2c: defer probe
> > [    3.097592] imx-lpi2c 42530000.i2c: lpi2c_runtime_suspend
> > [    3.104281] imx-lpi2c 42540000.i2c: defer probe
> > [    3.108858] imx-lpi2c 42540000.i2c: lpi2c_runtime_suspend
> > [    3.115278] imx-lpi2c 426c0000.i2c: defer probe
> > [    3.119818] imx-lpi2c 426c0000.i2c: lpi2c_runtime_suspend
>=20
> Thanks for the explanation. If we lose the count here, I think we also ne=
ed for
> the Fixes tag, do you agree? Should we add:
>=20
> Fixes: 13d6eb20fc79 ("i2c: imx-lpi2c: add runtime pm support")
> Cc: <stable@vger.kernel.org> # v4.16+
>=20
> as well?
>=20
> ...

Hi, Andi

Yes. You are right We should add it.

>=20
> > > > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > > > Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> > > > Signed-off-by: Jun Li <jun.li@nxp.com>
> > > > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> > >
> > > Carlo's SoB should be at the end of the chain. Should be nice to
> > > know what these are, though, are they co-developed-by? tested-by?
> > > Why so many SoB's?
> > >
> >
> > This patch author is not me and they meet similar issue at some
> > boards(Vague history), now I meet this issue at new SOC again. I think =
this local
> patch is helpful and looks reasonable.
> > So I send the patch to community adding my SoB.
>=20
> So Clark has authored the patch and you have sent it. And your SoB makes =
sense
> (even though, your SoB shoud be placed at the end, because you sent the
> patch).
>=20
> Juan and Haibo have tested it? Reported it?
>=20

They are local reviewer. So I change their Reviewed-by: to Signed-off-by:.
Simply you can remove Jun and Haibo tags only keep two tags:

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>

Thank you!

> A practical rule of thumb for tags is that they are placed in chronologic=
al order,
> e.g.:
>=20
>  Reported-by: <reporter of the bug>
>  Fixes: <commit that introduced the bug>
>  Closes: <link where the bug has been reported>
>  Co-developed-by: <co-developer>
>  Signed-off-by: <co-developer>
>  Signed-off-by: <developer>
>  Cc: <people who should be aware of the patch>
>  Tested-by: <tester>
>  Reviewed-by: <reviewer>
>  Acked-by: <someone who agrees>
>  Signed-off-by: <patch sender>
>  Link: <lore link>
>  Signed-off-by: <maintainer who applies the patch>
>=20
> If you notice, more or less things are in chronological order. I hope thi=
s makes it
> a bit clearer.
>=20
> Andi

