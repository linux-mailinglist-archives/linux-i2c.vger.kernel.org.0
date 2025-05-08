Return-Path: <linux-i2c+bounces-10883-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20282AAF0F1
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 04:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E0644E66EB
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 02:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6B119C542;
	Thu,  8 May 2025 02:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M80MIXHK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2057.outbound.protection.outlook.com [40.107.104.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8621533FD;
	Thu,  8 May 2025 02:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746669810; cv=fail; b=I9lNJS7/VlmqLRYF4XmPzuCSMxdEQ10ba11HfWpXyM0M+8BZ7JIS76/KUzsAPw9WDoOcepEaJQT0YOkkHxEwf37NB4rfBEqsv0z42ADNBfJrZMuQ6BPUAhknCeGUGY9bGivM/AA9DNleiAZWrue6IK7V6pu4uHt2sjtyeXDbggk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746669810; c=relaxed/simple;
	bh=zXb2XQGCxhRQFghDlA35KmeXALOWygxJGL4xU1uoqO0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QzKF4/GjNowqzpN5J0i3LYq5kmh7SzQz8pWsVkrEhq789laWi7KLMbxJkB5uKMsciqD3W8UI8r0lO7JjwBydYbn4U8LcrElCa3bfIOk3+xhETu3X9bOfGy6h/uz6v34nzVwJCeepiKb2O2D/Ptu9421bZQdM5WWD1rYNoeqDMLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M80MIXHK; arc=fail smtp.client-ip=40.107.104.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BeBiSv32Mh+GtLLU9tp88lLUa6kumBfi2jPKiXouibzMJB4wnNism67ad6zOU0eNyM7wUAZLCygvy5QrSzxleb8Y7ymID/fKb4KtAk1t8ODDJYVY7q6okm4zO0i+0qS23zb0pBOf2BzcAOQsEXILLqSvvMn3HvAdMBl2jKodhJPAKClh5ZgL1KRZDsuuyvvsL2cEerlUbUHZvicLVeLPbL6YdYtQfgQqkaDC0Z3G5yLiNsHphzM5EVVKthrqcWSx7SsxZbAHEKNQFWsEoKimgPUwhE+y46jB4+8dSDwTslC0iZaXlAbeLNg+2TiW3ATGjbs+dOg3YxjaOaCTGM/E1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xk7tWWO9PLdWtOJGAEqLVSyPWxLEndUSpmavfp/Aiaw=;
 b=hWyEes6F2q1CQWKYtagmKfzV5YFw1y7gNmQxOPn7xq7FRi6lODSHpM5r0FzITDCHm2LAA+H5ehZKqWq0/Lc68ByLrk2bN110oP3EqLq8tAkNaWWx3K79jIKeRcS1nadEynDdm3WRIBkqnPFlo/6NdWAXIlaMOiZovJycqE34YDIg3a+UFS5aTTSZm10ouTuCm3jFpm7ZBTfbVuxGM2EbB589UJbgk5CO04IPwyzgXQPzGRuYGk66F8mTl7bO7ou5yo5nN4lyNtSglnGl9vbC54JCB78W4cdORJw2THN49+rEnHnXPzwcYfxyepXc0W7dV+3DPLHQTVeX31bdoQdW4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xk7tWWO9PLdWtOJGAEqLVSyPWxLEndUSpmavfp/Aiaw=;
 b=M80MIXHKebr0nWUIg88xYGhb3YfQR67gIiBIXJl5QCf5j6/x1GuTbjWkrl1+scbxshNvXYbb1XB2mW799NO06kgNpp3wVIdhmA5Ji5wawYVjr7kskVwjvK13bpz0aZMTx6eCvBG/JjeP6e4C5DjHBEzsvGlBFEh2wBAaWQJKZv23LckNibQ5Ioc7E3fdJERlLsJtWxeUZeDf00UVQqRlC1bk6tHBYQuOJPZeFlihDt8mfYeCuNVPqWcDpeCpuj2nwFwqPCOylaZdw42GBiod34E5s1iBs6nE9aUZ0gWPpUrS5TDBWlwrjg8c1/6IHoBs3eWYP4OMN/n33mOhHPs2TA==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by GVXPR04MB10405.eurprd04.prod.outlook.com
 (2603:10a6:150:1d8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Thu, 8 May
 2025 02:03:21 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%5]) with mapi id 15.20.8699.035; Thu, 8 May 2025
 02:03:21 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Andi Shyti <andi.shyti@kernel.org>, Francesco Dolcini
	<francesco@dolcini.it>
CC: Aisheng Dong <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Emanuele Ghidoli
	<emanuele.ghidoli@toradex.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Francesco Dolcini
	<francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic callback
Thread-Topic: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic callback
Thread-Index: AQHbv71fHIQWjH0UhUO1fvwg8UTdCw==
Date: Thu, 8 May 2025 02:03:21 +0000
Message-ID:
 <VI2PR04MB111474DEDC6FDC84DCFB11A06E88BA@VI2PR04MB11147.eurprd04.prod.outlook.com>
References: <20250319145114.50771-1-francesco@dolcini.it>
 <aotznndpptgl5qtmkavmeuqydzpkefncnovddzyqqst6ozsm5p@fewoclduusfz>
In-Reply-To: <aotznndpptgl5qtmkavmeuqydzpkefncnovddzyqqst6ozsm5p@fewoclduusfz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|GVXPR04MB10405:EE_
x-ms-office365-filtering-correlation-id: 76362fe7-d537-4736-5534-08dd8dd48212
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?jkbRSMYHePpShBKFWDyT/M5u3GwYA58+pGGbIOC83bZr+P0R/LcCcJ8hVTqj?=
 =?us-ascii?Q?2gBxWlHStRZzlTvHkCMs4EFyogE/pZWilu4KsuCWURvkUETdSuKst8pPCohK?=
 =?us-ascii?Q?EvwlsqiFAH3fpU+QnnnuJY7CM55+/+LM6C41gnh9wMMvDqamXVtetHRqKWoD?=
 =?us-ascii?Q?xT2mgeBS8TtD3wtUDuonSoYd4dShVS4y3eD/vuhdDY/FsHJ0RxaROkHJMQ7v?=
 =?us-ascii?Q?8xUsuiI8e0OJ5tYmrM8YwyyriEXlj42DQZ7Gw0XevwJ/tnDyphbeGsxD9b6E?=
 =?us-ascii?Q?guVUjHVPoy8UX/KLZ2J+TC5Q6q05i+BsIKJvOQWO8pJK1K/MbvLwDTjQdRS/?=
 =?us-ascii?Q?+regACdwUd9BwLy2d4K8DkqdI4fTi4G3fhTLi5GH9RZvOTPb91T29cS1BgQ9?=
 =?us-ascii?Q?ifZmfW2xxOlwOHZUI6jrctK5F2ZRSbfcXwPrCMtXHWYaIM08Y13F2M2MoG7Q?=
 =?us-ascii?Q?BEhvDzyz9QogHmF/3n6Ppgk5dh4+hPRuXu99Om5AWPEzSEz23eRANj+iTscy?=
 =?us-ascii?Q?Lrhsu6IDEaj1L4dVaarJGb1wBRPNqfaDK0Keu5DJhk8sFRVDont/IT46uXQO?=
 =?us-ascii?Q?9rshbNNXrQr7P6xkEu34kRJQnQZkvBkPfMie1Qu3l3OtpvgiMoIwTIFwHUqM?=
 =?us-ascii?Q?qrXFqTVuJBwm5ywwHkq4LudEhkCNHqNeJPfLJGOjbDOIodTzMZNVdHu7LELm?=
 =?us-ascii?Q?ntUmkZIumC7RI/2B8dTJcJLpNV8zswG/wPjRmjIenOMwLBKvNpijZepa9C3F?=
 =?us-ascii?Q?84sxJXQ/Rm+04I1mqGIQ3LET4JDgTqvAKEfzt8F1jiAuUPHyWyu/xtRAD/VY?=
 =?us-ascii?Q?wLCBsqwjtyGMGrV2nzvcs3p7WqAfWIoeeu+IPfXPumn0Zs1OXFs9mXIC3Oij?=
 =?us-ascii?Q?SiFvylMtZDH9BkK5HEn2PxppuiU+4GoVx6b6fZlMQh2VyLU3s+tPnQMUaOz6?=
 =?us-ascii?Q?xuByuYOZpsTrUTkHcMObNAdBx/K/j0zRECpmk87QrqlDbnkwXKLr/078hhET?=
 =?us-ascii?Q?HVcRorKAdGD7ymp4dh+yEnj59fVDFC7lQ2B8IfZJm9zB+dU5bzanSZ0wKfOB?=
 =?us-ascii?Q?k6guzaMvwMubeFZoPfFTOFRE5B0eg7VJ+2/MB2B1+e3TLSC0tc3cQ1zritpv?=
 =?us-ascii?Q?sfLSKvdMsh7yUblN5UxiehOS3nRzF23L8zEAJ82Mq/qMiUkoSrRAaJly4y+k?=
 =?us-ascii?Q?rGWZ46WeGjGBsUUov+VF33L9i57cgs48RMuZjmaL2s2s65xJEOh0pZEjBHsq?=
 =?us-ascii?Q?r7EZkKssLY2x/6NzDsk3VfPUMmI8H+Q42/+8SczPAdERCpRBySm6l1dtZKAX?=
 =?us-ascii?Q?L+0X8l5H5iGxy9TGSiT3SBg5UDcgChqWmpPSYYFBYzuzZ3jaRbImSrAiuQLf?=
 =?us-ascii?Q?cMfLx/Dhjjx+E7qCUMecDd3H+VageZ1TkhPd1/J/82+ZqCcdjJzRFYvSQxs0?=
 =?us-ascii?Q?Me+85wyN6Ol99FRmny26BG8LioNA7sb8wfBrCos11WHGQYSGLel5rAXHv1Is?=
 =?us-ascii?Q?+fJ3PukVWsjdLaM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+w4DwnmXnbOv3Un5CVOIrFIVGboiMkyIEJFaYhDZF726Dg4I9p5jy6TZtXHP?=
 =?us-ascii?Q?t2T1nHuc13iI68U7FruNrgqL+qspOt1aUtJwwKJaXUsusxW4xV01OWtXo2k9?=
 =?us-ascii?Q?yg0T8tnu/RZlyUMVMKQ6u6bTXZtyyfOhk+ImHGQIpeP1tCcHCsu4MeFWqT1Q?=
 =?us-ascii?Q?KSZvETPiwK0fjWPsGoiPfXPmtyCNbNhgLe0lMfoI1Yi4pqFXTtcqmJhHrpfq?=
 =?us-ascii?Q?NxIeu2vDNSSpYWh1YokbZDTTUnBlSAODE/rwgIuBQIGRnN8ivm5YXybhMoyu?=
 =?us-ascii?Q?c8pz+HcnXgZFDaAOsg3QQ9/gL3L7/bKOUARssEq4mxKx64HiSFl1gN7fOEcx?=
 =?us-ascii?Q?ONlBwXhLcM7m3aijUEPqSBsRRbTaJbVvtZcBSihRIFyx5F06fy1hFf2adAMn?=
 =?us-ascii?Q?YhQ1p0AIGsI9unWycNzK86VWCWn2s43XMz4Lqsx0u0yNMmOV08ZnaeHDSvyC?=
 =?us-ascii?Q?LZgO6oGvyYjbDUZKPX0uD8MwhNadvrl6lI6+dStWifw3RxR8dAPNOCQb1etr?=
 =?us-ascii?Q?hOxdd+BoqgY3HL4gYQvUsFc96n0j14qqoEj95pPbmuM3ONX5aunAEK4jKcfW?=
 =?us-ascii?Q?3gfAdH2JpqAnJg2ueCYvSMn1Svbxfi/omb6bp1Y/Ux3MPSDp5ae6KXnuCU1+?=
 =?us-ascii?Q?83rdewXd2c4ZEIiJ4fNhGPKFNT6mk2LFZW/O/cxH/86olH3JyrTRGJqheM2m?=
 =?us-ascii?Q?t1/qpetBuPNL+z/ViOfWaO5MS2ox4JrlZtlM4p1J2ByufC0XhmlPGlcchjHo?=
 =?us-ascii?Q?56vfR2ocPjxbsMBlIYntUo7UTMSM4KgMaIaPN9jjWvMu9tPWdpYHTAgUFnP6?=
 =?us-ascii?Q?0YqYn/JO/6KhMGMYC8wcXGaPKosBZ+ac6008jKFy/vEkOxT9FZTQQCBOXlyt?=
 =?us-ascii?Q?AqibNfBIAmkvBlsnK8PG+jHIMnmFPZUg0Npbw1WIcOCGiKTTJ8Ug52pAQoPu?=
 =?us-ascii?Q?yHaK7KjuaAX0AnDWQmdlpVMzCiLjjZDKFNW+9GXrRRLWvdpllgkEZQFdQR+5?=
 =?us-ascii?Q?3Ch0ewEyiM4Abhf8OgwSO5IGF7pk0s5YlRFaTfF4KgvFETv0Y4EqVPAjjk58?=
 =?us-ascii?Q?doeCQng6S5avJoic4L2xNegJ9n7DmUHeLzlFVNdUgxtKzujzg5EUaapU2/qp?=
 =?us-ascii?Q?SJUP/vyz4QtpYnc7bJTkEBExwldPilF2gNU3GaB9mTYYsI3X9bAGbfqQpVQq?=
 =?us-ascii?Q?j9NvcoQ17zTOKnP+tz5U19Cn4OuBpD7w8EfaQOEBvRIUEzr58d9jNT0yWZhH?=
 =?us-ascii?Q?qA9JmTuF1UpEs2PghdmNJeMiDysF3SFMmGNnEI5frKHujakBocHvdMzBUkIq?=
 =?us-ascii?Q?VODMEHEZoggAoosYRU3KV6/EP9S1tRiWC4+gYEypNaYt8nGw0u7yrHoYaUSv?=
 =?us-ascii?Q?3QtnIlBNEDG43ljWwdzLbDis4sStrJI/takpnM26y8ueRga44MdWzqHMs4m5?=
 =?us-ascii?Q?tCt4VC1WoS3FZgc+P9Nw5GJWXM9pIQxS1clIX+Sx4ZqmUraEkiLRCFAG/WPv?=
 =?us-ascii?Q?NYnGKZzzpV7CQhOaMoAxKN+0UT1QRyCbsoKZwrmr0WeiWBeVAOLzPAqZ6yQq?=
 =?us-ascii?Q?Mm/frw2CwJJ5cjL+gYI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 76362fe7-d537-4736-5534-08dd8dd48212
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 02:03:21.0958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f/FGco3HG8kj+uJSnkh7ck+HoyXYNFTjSy54qv9se47pKlCx9aiYEK9ZRXNCO1vqECJJ6ECeQiD3aHCP0zEvaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10405



> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Tuesday, May 6, 2025 7:02 AM
> To: Francesco Dolcini <francesco@dolcini.it>
> Cc: Aisheng Dong <aisheng.dong@nxp.com>; Shawn Guo
> <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; Emanuele Ghidoli <emanuele.ghidoli@toradex.com>;
> linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Franc=
esco
> Dolcini <francesco.dolcini@toradex.com>
> Subject: [EXT] Re: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic ca=
llback
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> Hi Francesco,
>=20
> I'm sorry for the late reply on this.
>=20
> Can someone from NXP help with the review? Carlos? Dong?
>=20

Hi,=20

Yes. I reviewed this. It is ok for me! Thank you.=20
Reviewed-by: Carlos Song <carlos.song@nxp.com>

> On Wed, Mar 19, 2025 at 03:51:14PM +0100, Francesco Dolcini wrote:
> > From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> >
> > Rework the read and write code paths in the driver to support
> > operation in atomic contexts. To achieve this, the driver must not
> > rely on IRQs or perform any scheduling, e.g., via a sleep or schedule
> > routine. Even jiffies do not advance in atomic contexts, so timeouts
> > based on them are substituted with delays.
> >
> > Implement atomic, sleep-free, and IRQ-less operation. This increases
> > complexity but is necessary for atomic I2C transfers required by some
> > hardware configurations, e.g., to trigger reboots on an external PMIC c=
hip.
> >
> > Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >  drivers/i2c/busses/i2c-imx-lpi2c.c | 258
> > +++++++++++++++++++----------
> >  1 file changed, 173 insertions(+), 85 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > index 0d4b3935e687..f34b6f07e9a4 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/init.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/io.h>
> > +#include <linux/iopoll.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > @@ -187,36 +188,35 @@ struct lpi2c_imx_struct {
> >       struct i2c_client       *target;
> >  };
> >
> > +#define READL_POLL_TIMEOUT(atomic, addr, val, cond, delay_us,
> > +timeout_us) \
>=20
> READ_POLL_TIMEOUT is not really a name that belongs to this driver. Could=
 we
> name it something like lpi2c_imx_read_poll_timeout()? I'd prefer lowercas=
e, but
> I won't object to capital letters.
>=20
> Additionally, the timeout_us value is always 500000, could we just drop i=
t from
> the parameter list? Same goes for LPI2C_MSR.
>=20
> Thanks,
> Andi


