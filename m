Return-Path: <linux-i2c+bounces-14204-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EB0C76F2F
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Nov 2025 03:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 8782F2A76A
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Nov 2025 02:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C8326FA77;
	Fri, 21 Nov 2025 02:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dB7vyNPr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013064.outbound.protection.outlook.com [52.101.83.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED78D254B18;
	Fri, 21 Nov 2025 02:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763690557; cv=fail; b=I8eoT6RQjjN750s84s0ZHvxh4hqFKsMz2w7H5jpv5JNlBzq1Hy8ABsPg3TmbptDR7Wo65CydghaVSD/00pyEXAnBKY6ElqD3nSN5IdFtapXNhO59o+Z/N00xJUS+xSg7svOHohWWJ9Sg2H08e5RFUAolGSU8t8j+V0poH1kKc3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763690557; c=relaxed/simple;
	bh=/yOwK+jNAGrihBewmXSEL8UmIHr4YzoLfcpvl+sbmn0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j9tgN0yg8rOzUUHJi+G/tf+CcsVbvSzQzPu3mlwwL9HTgwFZVav11inCBuuzQS8NcL3WYu1YfD1B7BOdgqB0MLOzsSV3jnq4bbEu5eiadUURGMEEAJU1r/aEoM3LkKYwR+R879fugA1N3kCeAJXzSjVr+aN+GdN9xSBRZxDx3Jw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dB7vyNPr; arc=fail smtp.client-ip=52.101.83.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wW3qY+HfSdzYFduTwxe87H0l4RJ11qI5NKGsWb0DmBaO1uFglxKEwrNWe3LyQQQEt7mfHeaS2t2r5TbppBFEVsPMSdx1LyPrJIp94S/z/HQD8b1dk/7zpZXMM8UwRHQTLkL9WjFzAO2mgD4XUWzVQrVk8mmMfbUZU9TVSZQ6LryP0ICMIuw4w9fJdwZtw7La2OVoUJRpmhJ72AQaz4q0Famd/HxpsRBnQzy+y2E2AYsmOIkmRgy0fkDvZn9mIIAYDfyG0FlEz4KQE5rkDphyldAeGwYU3sQJsR9iRgMS79k6i30sLrg08AJWbOlku2gJJhXj+HLB05oD0D4TjBOPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+kt2XB2+zZdUhbx/1ZWCozM8d3xM5b5/gX+XxDJSWs=;
 b=mG4FER4ZqUC54mRAb7nAT5eJ1EXwa+ORmhfbEomalXv4ns78nKeja7cX54VMyvPZl5K4C4KnRRkt5hisJ9u8BuT/87z+sD1kcEeNkJPDX5UWjoTVPhSH0oWmrliqMRJgYIVWc0WxtNsK0mR5eKNGIUOMrhf0EX9zT03dw2lZvd/GR6f8mKbXnMjjgSnkJD0+tXIK8IWEmJvYnb+yux+Mw4kHPY5j62BPpQxka+H0JTrSk//vT3qKkPjUFPSbzL19QcrHbKhhpYIFEOPhGWzMT9tfm4C6u8OKryhSsW2BuHtVzzhhPLhO1GsWl5hkz1w26S4NGo1/Y5ECFLqGp3kSuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+kt2XB2+zZdUhbx/1ZWCozM8d3xM5b5/gX+XxDJSWs=;
 b=dB7vyNPrs9TCe+qgIN56WKs+XgSfgJQ0Oydj1aDLxpiUSuYmb5gBqrblBA6HOlk8xNquPXNS+pfAAwWUxXf02o6K2sf0QTkZUI1NYcwePZ3g2uqbnshuCfAmnhYZljFAynL+pULTnbfDNrik20gqR6OzRDydSNEUtHLQDbahZLqMWnFknDtn7WRlNOZfnp63ij+lUyBeevERNVBytA+4fBWTdaK0IiKPpbd8+YFxpkrEhcVwm+TTFCwnDbDz/Yv0qCFZQDwdVdPEokwvhrTKcfLFTqDOcwsOw4o7PGEzWWZyhHojG7DI1gnYGIpdqRshudJknXHcGZIkrEqKSM1wtA==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by GV2PR04MB12140.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 02:02:30 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 02:02:30 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: Aisheng Dong <aisheng.dong@nxp.com>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] i2c: imx-lpi2c: change to PIO mode in system-wide
 suspend/resume progress
Thread-Topic: [PATCH v2] i2c: imx-lpi2c: change to PIO mode in system-wide
 suspend/resume progress
Thread-Index: AQHcWgjDQMuVHMkgJ02wkgZ//qr+H7T7s6+AgACt15A=
Date: Fri, 21 Nov 2025 02:02:30 +0000
Message-ID:
 <VI2PR04MB111472C34041D6C5E825C8CD6E8D5A@VI2PR04MB11147.eurprd04.prod.outlook.com>
References: <20251120103039.1824209-1-carlos.song@nxp.com>
 <aR82OaSHDEl+87+/@lizhi-Precision-Tower-5810>
In-Reply-To: <aR82OaSHDEl+87+/@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|GV2PR04MB12140:EE_
x-ms-office365-filtering-correlation-id: c9b73d52-89ff-45a2-8573-08de28a2071a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|19092799006|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?23F+q1nBm5lEwdjE5LWCDyn8qpRc2Yy4nrtKebyc6qYaohmra8257idMX2Xx?=
 =?us-ascii?Q?t5WMJJ8SH1hqo+6m/G7UT9yKsg1YzdgKYszV3ItYsHnDSGBdfM9qJ2ni7G4z?=
 =?us-ascii?Q?TttCZzIynhq76ZptqvY8McCmXaP7wZADadLB5DGRrh2T2iP8fzpB4luc2QN6?=
 =?us-ascii?Q?qWtP/QnSyW4ybGp43a+y1PEN72qt6cPtMkCAsJ3xhsM31j/nsEg2KgSYBWZw?=
 =?us-ascii?Q?qtJOzQD1y/6o3BWgwzHPC6unsGbWMxkeYsGAPyhpUhlffwkOy1QTe0mGxOMh?=
 =?us-ascii?Q?DGdu2g+KE7S9yeN7MTrxDneuMltPAAX50J5mWeAHS97UuAqXL9k99mrxiv6F?=
 =?us-ascii?Q?auJzRHYBrpgzTzZ7BsHgLC4L5w+gDV0sqvLjdB9zyqtoWLo35fRCBRdb2e30?=
 =?us-ascii?Q?YW18B4mC1JHoM0jk76Xxl09Y09UNkljRuv/NL6eSaO+IarFNyb/n0cC7vaaV?=
 =?us-ascii?Q?NgAMym2bNUoJkFXNzKnRbcPcJlljpl4NEvsTuBN9oIxZv9eJDHbudf2+mDwK?=
 =?us-ascii?Q?BN0v71Pa2pnLtKpkAzpbOvadsp3xczDIXW++sg0PNAdBM4THAISU9Ebta++N?=
 =?us-ascii?Q?uEd84WN2Ua2/oJQpd33RpC7RLXilAKa3FXjZWq21+q4bzgl/ANFFhwVGQwve?=
 =?us-ascii?Q?/7UqcTaawSoqMjIyVfTeMANElH+ByMLLS5LIQF7LM4zP/vWN6xtZO1Lj2eIa?=
 =?us-ascii?Q?rPqaD87gV/wLCD1tfz9XXqiygaF1V/qr3z91iO3KMBe3zGIZBdQD+cUAEw7A?=
 =?us-ascii?Q?WF0srB+veRc/m1bfcxeTtyfidkveoAlbklX5ADDxvK9XZMq+v0UXW+J4zANE?=
 =?us-ascii?Q?1ZYTQNwqYDCefySjmNirYGAlCdOEXlUwuE7sV5+MBttdOAUkvvd7BM3Ozz8j?=
 =?us-ascii?Q?LrE39X4Of6DFdamQuim2TO6flVSyWbTkKHo8y/nVBZt+G5SeBCzfTH+BKFqp?=
 =?us-ascii?Q?SglhhSweFrf2zUZ1SqrrxrpttFSQ7CJ2v2VTC3IPCzLsN6fCgkWjX/KJb5h6?=
 =?us-ascii?Q?vKD1iQI4K20WkXnmsWqNq9rKehIHsYoemE0gWiDRSmW5qOLEaIoWzJ6AERDY?=
 =?us-ascii?Q?MFZ+CbYWSrAyT2IQ+c5GGISSal9zG/7PCWNNxiSJa01Gf0lmTPtHkdSM3nei?=
 =?us-ascii?Q?emh2gJ5srqdgDc22s/C0kEWe60UG3pTXkUA8MfSDAFo97zHm6aXP8vvC8EfI?=
 =?us-ascii?Q?3USaFCZ2T0vw7AqfjIIKuCLoaZzmsTfQI0HoUQfuomTVd6hoDLqh20qUHK1c?=
 =?us-ascii?Q?TeThrJ9Mq6OjlOHVyZG+eVkHyBr3u1De374nYVIwjvycCzpUJbztnox3Lu+Q?=
 =?us-ascii?Q?4SgYLbethdLsVr6EbnWCAvU6g25/9XtDp8gj5CwKFfidpybo2npaBiZbcwBJ?=
 =?us-ascii?Q?3mtzcsCj8kalC7AtWuKlBsLuqztTi50PQm+Aq7GmXf8/MxljunznjAHDKzUk?=
 =?us-ascii?Q?fWvlZ36JTDdk+qlgIbN/w+vWoVLEIOdV0AgDFNHflioB7XAb8c0pn+FypbOm?=
 =?us-ascii?Q?2+vLXPo3Q9V0i9SiTjvMc5j8dhzuZxW3pfzh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wPGsdK8cT6KAG13T7f8A3c24cchtiJ0CgnxRYEZYOFB+bLZUdwQ2O20lvTpq?=
 =?us-ascii?Q?0eKUx7PA5e31BL3jJc53O+9BOqXpQhVe0ylxPO3mDYC4U9HJwtNfxoKNXSXU?=
 =?us-ascii?Q?0CkpZ+Bcb83/pTAcX8DLdQOZ54wFQ1OqQmyfmEhP/uHQuZnga9rlxIpqVjDk?=
 =?us-ascii?Q?kbQeLyXm5DIH1q0sBEk6j3GrXv0kzAfE2YD2rTO6hmnVHXo56z4syIwRJaJj?=
 =?us-ascii?Q?01NjTk7J2t2ZsA5FIr/EWT9yyXL/0eSMYozaiE3i+2/woywYY96IfH5vc7Mh?=
 =?us-ascii?Q?cPJQ4C6uu8Doq3373PIFyOZZCjrgVPRsM5jAQCy32Ec89D6CqJXOyEqZzmBD?=
 =?us-ascii?Q?iXWDmbJfEVFYWxc1Gycl1fNaJhhxjxwznshuWBO1YS7t0yr7lh2jFdXhYnmQ?=
 =?us-ascii?Q?qDQN9CohN05aoRcFQ8WqOlIACfp4ZDFLiN/OmAd/vlqinDdKh62iB+W/kGuY?=
 =?us-ascii?Q?vjEcap507SowrHgBvBSJ1c4E7wnzKAemiFV4el7igUdzLdyp/h9AVZS17p91?=
 =?us-ascii?Q?EBMghtkTY4YAU8BcWq3Ddgui0aoCldzh/rKxUhV2Dp+T+ZkhWgQHqkybfMA1?=
 =?us-ascii?Q?b5Ztb79LvVu2mjfCXud88Ly/6uOKgCqwnOVkLmzSzT/01IDFh4XpI32PKl58?=
 =?us-ascii?Q?/TPScS5dWUVogWOEcwMwI/Z3j7+AQNS+2q7vkUgfBOvSgI33GoXYCcfOIItb?=
 =?us-ascii?Q?MaSTcXBdwtAre+y/57QgKq1r3xEgCinNqWON8LLscDFEK76gAptCKZZmSA6V?=
 =?us-ascii?Q?pLnCizEmzT4YAqDBLAeByGHu/jRn/ILIf9CxNkO/6M5uBm/HgSd+pGy9p0jV?=
 =?us-ascii?Q?s3F7Z4UbvFYsztdoXlsaonmCWRLSgX3SQNh0aRPEvazp131HYOWzorNjuyEm?=
 =?us-ascii?Q?SN55YAC4dscMmxe86867TaQ845RJTDUs6VvgfN979qDiePjgHUnJXRc+X2LI?=
 =?us-ascii?Q?M2ltahj78c6FuMW+BN9zeur9eUOnx5RPOgIzLOXqdCYZ+9rN59K9jLJx2m1D?=
 =?us-ascii?Q?jB7UvfvwtGCXPKRzBmi9TkaLIBnBSJ9hJB93KPYcszpShBXuTSsulo1RfYwQ?=
 =?us-ascii?Q?AGzBlHikKtDFMyC5gNhMk5CAzKLZjQz8sSJVOfsZvPHY734TrmTRFAiju608?=
 =?us-ascii?Q?p2w361CqpXkeVcAAsytorSG+V6qo4Nm/lJjEZrkzW54GLIchihISJAO9x1Pm?=
 =?us-ascii?Q?RctehhKaTGaiXqtRfuhxu1kTr7QgTmaWhiFUsPoL4lmozOvxP7+qdtPP8HP/?=
 =?us-ascii?Q?sXFJYrYeZSxKMMN3o8yILTLskT8bjkJZd8s3W8khPbktyV5LELec3fF4OOiE?=
 =?us-ascii?Q?YClO3g/1Cmk5QQJad/DAVqtOtygwRqdVCdRN/KspsAcbmbjUJVGF8jUVnUfp?=
 =?us-ascii?Q?Cpwlz2V1708ZNOqM9ctJW3rNG7FqZudSzZNNinGpMM2dZ1I0FMZ7W1Kl3aB6?=
 =?us-ascii?Q?uVZZAvw5EuOKXeAqW1hlIRgz9cpkkUPa/8+PxxSOobZMG+Ahh5JbTkATKh+r?=
 =?us-ascii?Q?20JbOVFp3F4PXJxDKfCyZNHIkv/MZ51otrhkUOYd0uJEH/MCH8Om+CmscLsr?=
 =?us-ascii?Q?YkGReco2IQk5OgiwaiGJRxKoXCZkKoFfZYd/dRr4?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b73d52-89ff-45a2-8573-08de28a2071a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 02:02:30.1939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zlNz01tlVziCKL5TtJQGUkmhZryksXZtwsqDbNeO5C12uZth+kLqn+H/f96fclNeKBl+mTseI7fgi4RFLfDtgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12140



> -----Original Message-----
> From: Frank Li <frank.li@nxp.com>
> Sent: Thursday, November 20, 2025 11:40 PM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: Aisheng Dong <aisheng.dong@nxp.com>; andi.shyti@kernel.org;
> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v2] i2c: imx-lpi2c: change to PIO mode in system-wide
> suspend/resume progress
>=20
> On Thu, Nov 20, 2025 at 06:30:39PM +0800, Carlos Song wrote:
> > EDMA resume is in early stage and suspend is in late stage, but LPI2C
> > resume and suspend are in NOIRQ stage. So LPI2C resource become ready
> > earlier than EDMA. When IRQ enabled, immediately slave will trigger
> > LPI2C to read data and the length meets the requirements for DMA
> > usage, the DMA
>=20
> "the length meets the requirements for DMA usage" is condition to trigger=
 DMA,
> reader easily miss this and confuse.
>=20
> > will be needed at this time. Within a very small time window, EDMA is
> > still not resumed.
> >
> > If a system-wide suspend or resume transition is in progress. LPI2C
> > should use PIO to transfer data not DMA to avoid issue caused by not
> > ready DMA HW resource.
>=20
> You can use AI help rephrase.
>=20
> EDMA resume happens in the early stage and suspend in the late stage, whi=
le
> LPI2C resume and suspend run in the NOIRQ stage. This causes the LPI2C
> resources to become available earlier than EDMA. When IRQs are enabled, a
> slave device may immediately trigger LPI2C to read data. If the transfer =
length
> meets the DMA requirements, the driver will attempt to use EDMA even thou=
gh
> EDMA may not yet be resumed.
>=20
> Within this small timing window, EDMA is unavailable, leading to transfer
> failures. Force PIO mode for LPI2C during system suspend and resume
> transitions to reduce system dependency and avoid using an unready EDMA
> resource.
>=20

Thank you Frank, I will send V3 according to this.

> Frank
> >
> > Fixes: a09c8b3f9047 ("i2c: imx-lpi2c: add eDMA mode support for
> > LPI2C")
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > ---
> >  drivers/i2c/busses/i2c-imx-lpi2c.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > index 2a0962a0b441..d882126c1778 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -592,6 +592,13 @@ static bool is_use_dma(struct lpi2c_imx_struct
> *lpi2c_imx, struct i2c_msg *msg)
> >  	if (!lpi2c_imx->can_use_dma)
> >  		return false;
> >
> > +	/*
> > +	 * A system-wide suspend or resume transition is in progress. LPI2C s=
hould
> use PIO to
> > +	 * transfer data to avoid issue caused by no ready DMA HW resource.
> > +	 */
> > +	if (pm_suspend_in_progress())
> > +		return false;
> > +
> >  	/*
> >  	 * When the length of data is less than I2C_DMA_THRESHOLD,
> >  	 * cpu mode is used directly to avoid low performance.
> > --
> > 2.34.1
> >

