Return-Path: <linux-i2c+bounces-11146-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 882C3AC4C63
	for <lists+linux-i2c@lfdr.de>; Tue, 27 May 2025 12:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 369563BD44A
	for <lists+linux-i2c@lfdr.de>; Tue, 27 May 2025 10:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77010255F3B;
	Tue, 27 May 2025 10:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AjlJRF6t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011010.outbound.protection.outlook.com [40.107.130.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BA24315C;
	Tue, 27 May 2025 10:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748342768; cv=fail; b=kYWSpeuATr5hBYfK6WYRhEtI0baEg3nrOI58HMDo/2RwMVUJWGlWzuHG0eF607xlQqOPeMJMF2C9NfLGBSWkGwKPYrHyPH4xodR6gdXmUu/H60Yzh+hqjhp8yaNhDKBe/U7kMbJCF+dkuVWMSmvIFmvU1ZgWyuBY66nWp7alH6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748342768; c=relaxed/simple;
	bh=JIEPM0quUX+T6mi2KWCuVwSrOlniCDAJSj3l8g2mCt8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gwFl8i0onkxCm3Dp2jJoOX3ZdmEdX8XjPgbHE80PXzwKiKnEX0v/JmTWzW2sjyN7hHK+tgcRRxfRH9mMI2CJPmWXfQGMyz0k9mziprzDp/MDTzguoumVhHJpyFSrWQYutv8bawI9+ZvytAtke16uLpZMX+IQn0BHXBODq7GGv5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AjlJRF6t; arc=fail smtp.client-ip=40.107.130.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPPorWICj4evJDFCWeHglNXuZw5C7ofw2XlfaCiRjRJTjbmOuCGok5wRndM6UnpFNWNC0gMoXWpLs81a8vrLWd4liq+bOCEVUW6qC6H+XSo+V9n98beXcvwQDGZO1b8wMem2l04JHTxp/2hovOkmy+MNxaowY0IYNXbyrgChYvU5MYW1VQ/6xVUFNwfo87oWG+oYBHWQFTOouHODHJwgEo1MDOR53pwk6pJH7GVu1OyfSwNXyvPAoVNQVFdp+yFKPzikBSnc5GnF2/bdUsnuKqTGeKVCBrDCTerEaH1Q3eLD47jFyt+D//8cgsdhU8o6/HMDU15wtu/ZbjEbyM5PIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2F6CksKvRJwMP672IaAHLfL2NOGGE+D5stjRz1CfVc=;
 b=R2MUywAg56HUYU9jX90tqmo4Z0C1jkuLEA+HW/Kik4T+YxwXZooeByWxLT0p+ZdXpfScqM6gioXSjRqIYTt3zt8GrbsxgdowgtrDLNjzNNQx273S+ttgmYi+3zBV+Y8MByhOyFl5rFT61SlbaFKytx+mtJxoJmFT+WVP861Er77/2gmjblKiLGCiLBw0e04EYipHUCq7rSgoCecwfoptUYx1G1s6yZJJYB1ESUj2johpGxFr9dymr9pqEIl0VEe+RVMAQWgxJ0Tudnzs15ZPj1Om+cDmiYDyauUxP5CROD1SHvV2Rsh6OUASL7EK5dhJFKXyIPxBKkKdOV4h0xzOEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2F6CksKvRJwMP672IaAHLfL2NOGGE+D5stjRz1CfVc=;
 b=AjlJRF6tj9DqsZw7fByIuMCJMXWTfB6R3mOy5giXRWApqNY2nMev5J5E8eAjjInU7YWAwBcpwkmd1ymqODvD+M5736R9nue28461W745iHLckJ6OqKyFhB8rZ3tovl5WwlNO9rpgFSGFxdpG2fovUSfRd+htfRqz8V+OKNyTknnPzUV3IbHwjQQ6HCTKTbxISxKL3InNsgsZ18Dm1ljwWHrmr7Rs77kY4vmF3cVJNf9r7irEdJ3N8gUmAH/Z6uaF1ypKG3ofTT5TOxo5rRjrHiFHQTlcD3l6HoDtN+g9grmSharunreSEaY+0D50F9AZ5GN6gYzboqgGXWwS9sScVA==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by AM8PR04MB7954.eurprd04.prod.outlook.com
 (2603:10a6:20b:237::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 10:45:59 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.8769.019; Tue, 27 May 2025
 10:45:57 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>, Oleksij Rempel
	<o.rempel@pengutronix.de>, "stefan.eichenberger@toradex.com"
	<stefan.eichenberger@toradex.com>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Andi Shyti <andi.shyti@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: "open list:FREESCALE IMX I2C DRIVER" <linux-i2c@vger.kernel.org>, "open
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, open list
	<linux-kernel@vger.kernel.org>, "bsp-development.geo@leica-geosystems.com"
	<bsp-development.geo@leica-geosystems.com>,
	"customers.leicageo@pengutronix.de" <customers.leicageo@pengutronix.de>
Subject: RE: [PATCH] i2c: imx: fix emulated smbus block read
Thread-Topic: [PATCH] i2c: imx: fix emulated smbus block read
Thread-Index: AQHbzvSHYtl59UwoREC38OW9/FszFA==
Date: Tue, 27 May 2025 10:45:57 +0000
Message-ID:
 <VI2PR04MB11147245BA69A4C19B0DD037EE864A@VI2PR04MB11147.eurprd04.prod.outlook.com>
References: <20250520122252.1475403-1-lukasz.kucharczyk@leica-geosystems.com>
In-Reply-To: <20250520122252.1475403-1-lukasz.kucharczyk@leica-geosystems.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|AM8PR04MB7954:EE_
x-ms-office365-filtering-correlation-id: 49c797a5-06c0-4974-37b7-08dd9d0ba991
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ty6oPZlF0rZ+0xuE+fCyPiz/8GQRbF0wwEYz9imeLRSoShwz4MQ2ttTqqzuQ?=
 =?us-ascii?Q?JJYGWvs4ucRuxC+KusxakTLIH2/XDpNakz9oImCl2u49oXrJyYJf15xPiVXe?=
 =?us-ascii?Q?GLRcfB3MyQzx94uMrZ1W+yOciFTtbSw1d8NEbza5j/8JPlIKrIDA1hKI3O6B?=
 =?us-ascii?Q?spUbpb21eRAW143Snd3LIUB4Idiok70W80GrGe9TcKdfhJl3jzI2IbsnpvId?=
 =?us-ascii?Q?rh9irw2/OzHdqRGG09SfNOMvKHxl9EUn+zSR+UGYqS+ZnaZvs3GfJ0wVk7gg?=
 =?us-ascii?Q?XM8H56JNcg+w1Bz7SCemLD4cQIy996Yr+t+APMzHMx39iOQNLeR6RAuObLvc?=
 =?us-ascii?Q?ZLS1Dpp31vFhUSz+aefahd615NcLE6/HYLUHPVYPB9NLrGhteNlKxiwk6GBU?=
 =?us-ascii?Q?mcQKxD8d1P2aFS6x8/kFpjUms6nvO4x3PG1zdUQFdx8LTb6kBbF3jYlHzHhv?=
 =?us-ascii?Q?DLfT1eiuFu+H/e1u8ao6KC0aTa++Js8kKZCsUv6Bq6LbjSU/+sJ3hayBRPIJ?=
 =?us-ascii?Q?S2RBtRi/cV0B98J/q5Q1owMeoD6HtGx6bg21MhCX2iq+14ZoA3FuvvhFu8v2?=
 =?us-ascii?Q?girsjdqWQ8ZGrL0DshJDGSdu4cHHcTsx9rmT/u0535uWyq3PcKkMyI/RZmsf?=
 =?us-ascii?Q?dOLqH7VeQpfEvqab5tkTM7/0Rl4gyGCAXAUP2CGqTeYIPQo0+7Y6H0LGJVY3?=
 =?us-ascii?Q?mCjYemlgRblZwmFzdQ6NXHV7B0eYJ2OaJUNg+8rCpV/1lNmIzfePRLY6hL90?=
 =?us-ascii?Q?9xNtvsPyZiTkYKYAweJy4++3UsPnQq25gFHeBqBYO4Y4aITjqN3sToUpI+S1?=
 =?us-ascii?Q?3emVEc60rJqMNf7vwn9vWCNTkrCztH5SDxH7GbNNJptDCMiFan+HZG9fFXGk?=
 =?us-ascii?Q?512Mus2o0KJA1H46WVUGhSTa3dcKIWuCpXhP2a2QGhBthZZeJv5haNMkTdPf?=
 =?us-ascii?Q?95kqA5PIUt0hpkqv6/r77UG4kg4VJB3rvLbfZ0o7UKbcVqTRhOaRnX/Gml4I?=
 =?us-ascii?Q?GfeNhTS5fkH5f0W1ypuulhDHFFCGavFIJpxx8750W6H0eaMQvbLpqwN8OyAk?=
 =?us-ascii?Q?ciVjk28gT3tdJxDj0RzZdrAaN1acmqrSjyAAYLJOA8R3/qu3ctbPX+eHILYF?=
 =?us-ascii?Q?Ik9gGz2u8/52bf6OZIneig33b2NyrvvaM6TNaQq5xMQzefCzAZdvMzjuGNE0?=
 =?us-ascii?Q?VEKDzfIOhu8NRv0IwF4uQ2ICMS/loxPc6yzcgHMJR2nvMdQ0V2RSgZR8g63D?=
 =?us-ascii?Q?mgUjHK4TPsNo/zv+bTntGiR5+2259NcufhKtjbyGUJx0xxVZLIadUuZ/rqsV?=
 =?us-ascii?Q?w9Xgrxi4i/Uedos2iamA3AtE408aMQTFkduHBMaLFNSwwCYGIanaDyBmBWbi?=
 =?us-ascii?Q?YHrvy4vX0VU2OQPmKjfpYm4jxsFOb53/jUfOUo8w0fISPcrn8wSjdnyBU7Ll?=
 =?us-ascii?Q?lVke+uFbXFcYtR7d5Dw4wjHmt4onJuq3E8Xym2unvHCgKl8PHkjG6A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hC7DUOX8ua8GMsvdbv7+AWS4GZCDkn4ydL4QSfL2cR2J7JnI58RZ5YmLIFy5?=
 =?us-ascii?Q?J++CZBAQ6asLeh02OyQZNygTisJKr3bRCsxaNTDBgYcFKVqRrCUrBlD2jAQs?=
 =?us-ascii?Q?ArKN+JnivdGgXT7btqIKtVaXwQm/DOtmDQtpSUoGaLsz6xSrtacp4/8ocgfA?=
 =?us-ascii?Q?rxjpmovhmSrbr+9bPXH4pCIAZMb6eTS7vyih7STPxPxydk+qOWIDAbd0NTCu?=
 =?us-ascii?Q?DRYdIy8XdAPLs+w0Qb59ghceIoPKcdPq+TAaSIGYkK424v3J9z/2GII3GgX4?=
 =?us-ascii?Q?ntm3+toy94sS8nhyH61cJ4DPHuTTeOvm+FD0fuAyJOMEymSX1Ejb0J1XVEPs?=
 =?us-ascii?Q?lqI9ZU2cwoty++gJtoLMQJErZB1o6r2dZz4Wui2zzj/3dTSVjZ73qIaMmx0H?=
 =?us-ascii?Q?o3mNaaZSv2eVIqlSvaEqcChq1lppJgQKA5wcBSgqsAS1uF1juVUodg1k461Q?=
 =?us-ascii?Q?k7wac2skfE9mo/S7cK4GzDpd472D4kGoIXGsdcuy7UQeM9NE1Of4lMMEAmH4?=
 =?us-ascii?Q?mN9T7B6uxPMcQ2Auygfiq53c2rdE+uFHN4qltpWqVnC9cT9oxDdKjXBESTwK?=
 =?us-ascii?Q?UcYPPs98TWPSgIhKYhcPrIU+KdEbLSYLA8hpOPS8l9CzpGIur8LJPmxFbGcn?=
 =?us-ascii?Q?NOyQTCvmcCVwvk1N39LT0+kfSdSdqOlaVQR4ZGkUnlrqSQDi7c2N40iRMDJ9?=
 =?us-ascii?Q?91ObhmB+IUPWGnE6dRc4F1vLV+SeoGf3yQ9qvFXc2Y+FhkVlGOL2n6qlxQQw?=
 =?us-ascii?Q?8xGqVUrzGtYr+lc7gwq9Mws3RXOBzkhAc5sFQz6mNA/YHSll4zXgZwceO6Qy?=
 =?us-ascii?Q?51AayeoPyV+Xy/yKucu+0dGOs0AErmtSwfbp0TeFLhZIDyWmIEBstunlasnM?=
 =?us-ascii?Q?k63/zK8TXHIuY5I1Dw1uPJ60P5yLXxTWgMLme/cQZH1S34srpqU4DlScY4AX?=
 =?us-ascii?Q?QtOOFRzb17eO1hZLzlK6BmzPQnMyyabmQmEmK3bBS/GEtokRWVXDUHnRke4E?=
 =?us-ascii?Q?BSfmrVnQQ0bHg0gmofrI7fzmMcfEUB/PbfYUW5Go1U19+cRgebID04NMzbXC?=
 =?us-ascii?Q?EysARnwz6J8nEwkVK0lMV1h++rSYzWW6V5p8HRlycbjBHQNAdS3X8EVkovne?=
 =?us-ascii?Q?fnpcHySyfwx3d6M4ogDGQrWp59yzzXFNByYJJYKiWcAmMZA1sOYEJp/sL8kD?=
 =?us-ascii?Q?vLEV/+xZtnoGAWGQGY1l1uLoCLN7IQ70TfV2zCIDn2YzCDvExborYshz4npM?=
 =?us-ascii?Q?KmGTujuRP0CcpGuwfkDMb2vQQopYiz9kelHUYhdQsrfqjBHJRr8pzGv2QZEp?=
 =?us-ascii?Q?j4JRc+damgUK+htAEyU5jMAX+T9kDZeNetmhZXriFVGA1/i6vF8y1MUOyx3X?=
 =?us-ascii?Q?fZsu6yv4xSO4Txe2tA9kgH2UmZ0NKKLKw5c9cPTUlXIteEWfP0T2yib/z+h/?=
 =?us-ascii?Q?mzMvVkpcXjjEAlm+3CL6vxWLwbRL977gQSzlLdos/h39wT9BXNeDJwahQ/zz?=
 =?us-ascii?Q?sKvSI6HZPJ4Md3zmLRhZZmW820+GraAVllrMsX8HGbDc9s2hp4qS+MtmDVA0?=
 =?us-ascii?Q?fUcAHWpnDD0d6IxIdNpw81I1QpfTuuPTnd+AjW38?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c797a5-06c0-4974-37b7-08dd9d0ba991
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 10:45:57.1516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s7w6m3l50tdtslEEdL6Qw/sTLODO/FV2vTm5Pwp+YKyZ1ztlixodEkaV4grlLkng/FPYeFN8napLBDPN5V+LiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7954



> -----Original Message-----
> From: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>
> Sent: Tuesday, May 20, 2025 8:23 PM
> To: Oleksij Rempel <o.rempel@pengutronix.de>;
> stefan.eichenberger@toradex.com; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Andi Shyti <andi.shyti@kernel.org>; Shawn Guo
> <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>; Fabio
> Estevam <festevam@gmail.com>
> Cc: open list:FREESCALE IMX I2C DRIVER <linux-i2c@vger.kernel.org>; open
> list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE <imx@lists.linux.dev>;
> moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
> <linux-arm-kernel@lists.infradead.org>; open list
> <linux-kernel@vger.kernel.org>; bsp-development.geo@leica-geosystems.com;
> customers.leicageo@pengutronix.de; Lukasz Kucharczyk
> <lukasz.kucharczyk@leica-geosystems.com>
> Subject: [EXT] [PATCH] i2c: imx: fix emulated smbus block read
>=20
> [You don't often get email from lukasz.kucharczyk@leica-geosystems.com.
> Learn why this is important at
> https://aka.ms/LearnAboutSenderIdentification ]
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report
> this email' button
>=20
>=20
> Acknowledge the byte count submitted by the target.
> When I2C_SMBUS_BLOCK_DATA read operation is executed by
> i2c_smbus_xfer_emulated(), the length of the second (read) message is set=
 to 1.
> Length of the block is supposed to be obtained from the target by the
> underlying bus driver.
> The i2c_imx_isr_read() function should emit the acknowledge on i2c bus af=
ter
> reading the first byte (i.e., byte count) while processing such message (=
as
> defined in Section 6.5.7 of System Management Bus Specification [1]). Wit=
hout
> this acknowledge, the target does not submit subsequent bytes and the
> controller only reads 0xff's.
>=20
> In addition, store the length of block data obtained from the target in t=
he
> buffer provided by i2c_smbus_xfer_emulated() - otherwise the first byte o=
f
> actual data is erroneously interpreted as length of the data block.
>=20
> [1]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsmbus=
.
> org%2Fspecs%2FSMBus_3_3_20240512.pdf&data=3D05%7C02%7Ccarlos.song%
> 40nxp.com%7Cd05bf48873224466159808dd97991d7d%7C686ea1d3bc2b4c
> 6fa92cd99c5c301635%7C0%7C1%7C638833406066875925%7CUnknown%7C
> TWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXa
> W4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DdmTE
> obQKzUzw03sEd%2BDtUo3se7kJ9ZTS4atfs0lGLC8%3D&reserved=3D0
>=20
> Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
> Signed-off-by: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>

Hi,

Looks this is a nice fix.

I2C SMBUS block read need first read one byte from data length offset then =
I2C will know how many bytes
need to continue read. For this issue you can meet " Error: Read failed " w=
hen using i2cget -f -y bus address offset s to test.

So you apply this change to make i2c-imx controller can behavior like this:

S Addr Wr [A] Comm [A] Sr Addr Rd [A] [Count] A [Data] A [Data] A ... A [Da=
ta] NA P

Do I understand this right?

Carlos
> ---
>  drivers/i2c/busses/i2c-imx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c =
index
> ee0d25b498cb..4bf550a3b98d 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1008,7 +1008,7 @@ static inline int i2c_imx_isr_read(struct
> imx_i2c_struct *i2c_imx)
>         /* setup bus to read data */
>         temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>         temp &=3D ~I2CR_MTX;
> -       if (i2c_imx->msg->len - 1)
> +       if ((i2c_imx->msg->len - 1) || (i2c_imx->msg->flags &
> + I2C_M_RECV_LEN))
>                 temp &=3D ~I2CR_TXAK;
>=20
>         imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR); @@ -1063,6
> +1063,7 @@ static inline void i2c_imx_isr_read_block_data_len(struct
> imx_i2c_struct *i2c_im
>                 wake_up(&i2c_imx->queue);
>         }
>         i2c_imx->msg->len +=3D len;
> +       i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] =3D len;
>  }
>=20
>  static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx,
> unsigned int status)
> --
> 2.34.1
>=20

