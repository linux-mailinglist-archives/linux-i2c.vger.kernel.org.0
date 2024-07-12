Return-Path: <linux-i2c+bounces-4955-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4CF92F609
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 09:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A81B1C228CE
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 07:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15BAC13D606;
	Fri, 12 Jul 2024 07:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="MTcmh01m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9452212B71;
	Fri, 12 Jul 2024 07:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720768550; cv=fail; b=R0+QgC+zkJXyP31K03QyzMMor/KcmXnv4D1uuMVAHsAJgwIRWooshw1WgGc3GlvWQ2h5zVnBrgRldhLh4bpbmhw64roQ4yS8crt7Z0gPUvvov6sR07oHkcI6EkQYsEzUA6zMIj3+WxGVz0ws2mFwJpNs/mVRiW6Qo8zhTEf4wlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720768550; c=relaxed/simple;
	bh=oGp2s1AHRxSRztQnFVnKMi+Nvrzl21s9paKwcDYzIYo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u17QuwKANWegvirMnpdOHiMp7Ekip4LcOjbMd9XZsxPDCjilT7mdn4wuAOPSG7/BSFJF0hRAZh2WMyoSBkRR76sFVuh68SAVgGn+xKcC78EDpQNWxrBsDmVEb7IqMjiTo3fmeUZq34IWfc16/XLZT+H1W+rKAv7AxjYEH2GpZZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=MTcmh01m; arc=fail smtp.client-ip=52.101.229.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dR2BGIYjnXtaA4gOubycpdOqJYRdDx/jwoPpdxoY40peS2Iv2nuMoiPTZoALlaOsVL8SU3vwxz/YIjjTwuREZJqpr0imNN68XCXChOIWt00SEa0V7ieEqw+I7XvAo4bYq5NeCB/PuvynXKDSoV9t1pFFZkV+QXLbm2scbvbQdKc7uPO9MoEVcQWPN7OGz404oxM2sxlExeyiWVbv1oFR7rnMvguX5roLpmfCXK5EOYChGAfvOyRz0Hw8uDVURmB+IQrA0pqIgG6KweqytySATI1at5wX4e1NV443U6oYC+uE1anXISi+87YaVRy0gTLlIPxMeVDlLEL5f9jWpkgRPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGp2s1AHRxSRztQnFVnKMi+Nvrzl21s9paKwcDYzIYo=;
 b=BYuHr7Ao6s0IxXxYxTvjf4m1N9w3jScws7cQ9x188u23X0j+390kdtC2nX452DrwZztsfUTgZrimB2y0451iOIBKUnbdLiYSCuRjKGwB8Lz6Cf9v2LAk2HWsakVTkZIV7LPoNow5ycu75vxXt0THbiVzHpp/HWru+ay1tFP+3hDjmRuyH9PpT5fWagDokEX+zDayn4ObK8yVOXgKyEzVFnlWTjrqS01IH1bbuaQYPmJYqJIVYjJbPaEEK1C9Nf+s02nDQr2BZAU8f7Yty7uG+Ozc+TfCIZGCXvAR3CPmOQMdKq05dJdLjpa94dyW+KdKN4Q3R9Tv/Kr157oPRkOn+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGp2s1AHRxSRztQnFVnKMi+Nvrzl21s9paKwcDYzIYo=;
 b=MTcmh01mghFmmSTyFytx97Ye8YFaUbIBRzfpgCQZtGMCadaXZ/puv7fbfDYm0EHc7hIeP1j4oQTaOBhLg24Spl3qKLvfPr7sgLUWpN0PZ36Ubmde4TZH7e4QUQyiC1j7k3uzRpS5cxzjnmXj/ViGCPTjhNme4iiC7MudJjrLmb8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSOPR01MB12219.jpnprd01.prod.outlook.com (2603:1096:604:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Fri, 12 Jul
 2024 07:15:43 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 07:15:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Chris Brandt
	<Chris.Brandt@renesas.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v3 04/11] i2c: riic: Enable runtime PM autosuspend support
Thread-Topic: [PATCH v3 04/11] i2c: riic: Enable runtime PM autosuspend
 support
Thread-Index: AQHa04j2mz4Dz3PEykickJkh+EMpYrHyrpZQ
Date: Fri, 12 Jul 2024 07:15:43 +0000
Message-ID:
 <TY3PR01MB1134615117603F62796558D1486A62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
 <20240711115207.2843133-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240711115207.2843133-5-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSOPR01MB12219:EE_
x-ms-office365-filtering-correlation-id: 90eec293-3ca8-4738-19ca-08dca2427194
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?wQz6BqaLqeiuHGLFefXl6bgDVmTQIlRNzHshJ9uM/cW57cR0d8g6omy1eWtP?=
 =?us-ascii?Q?+Q2tofSDLu75+l77o87+NRVNM34KucEPAxv7zZPbBh+oJasPCa4aAITmT+dl?=
 =?us-ascii?Q?qsUtxmT35xniSuUnv2hDv6i30AsuQDPMPjVaNn9I4iIeKJBQgAxhlANLVSTa?=
 =?us-ascii?Q?dLPT5WTaVyA2w0lh6Y0QFxAD4N3RkpzLstf0NbNqGigYckVUObqZcAibE5Ur?=
 =?us-ascii?Q?qylSR9KuOujAp6cnLAZ6ujcrZcXbDyeCJtBq5fdoCnbfwmm9XdTOjzrUUhKE?=
 =?us-ascii?Q?HB89+1cqtuu0BBHvn95TgwC9aZ41Ovn+w/UWS6SaDqNT72YlmR3nO0V34RSw?=
 =?us-ascii?Q?ditTU6FZsrODN1oNkZ1Uxv5qIXv2rHx+DmDpCoKBKWPM7UXICELWk+7Lthfm?=
 =?us-ascii?Q?f0PJkydP16brQC4g01hXok3L972QgVvE3gkcG+f/p0EO1use+XUXnmYDXp6I?=
 =?us-ascii?Q?gGKcHzDt4TAnV/ANAW1e12qJLAfLYiv8flCv1ksz5JyUg2ET39ebGt5GWvcN?=
 =?us-ascii?Q?dVDlyUrNPoPmWUt+ai3bD6Xb5kI9rUqkHN8Vf1gRbLMDjfl3HPc3omXorxSv?=
 =?us-ascii?Q?3Rr10pk3gao9wXtP+nI1mOkk/gMlrjwr5jjDbEvWiGfMrCq8Qk/pGBYe35LI?=
 =?us-ascii?Q?KIOd/VC7FmbefdikNkX5NOCQqlX/QxWwTMjWq+02MX+U3MmnZcywjBSNnyw7?=
 =?us-ascii?Q?u1a5TgGa2GpbueJ6MPBfGlLhH3tWbA0ACZcVj1QM5gs/1RhxqNGq5dFPpr49?=
 =?us-ascii?Q?LMbcEmuImhRf2+IzFyfxGArrK1TOfNp/WDUCFf819IYPy+/+6WtujATrYrw/?=
 =?us-ascii?Q?EKSfiSL8jYLxrlWlKL9XGXgtMwOkrWs9XbMeyTPCm39/gXkm2uiPtoPtKVqz?=
 =?us-ascii?Q?Y6tufozCSSo01kw2HCOY4HHGBcyqcyDpdoN1ojpatIqHB78/os4FTKe9PTJ2?=
 =?us-ascii?Q?ZA4EAxyJCg35DS56wlzkh8ILOuX9mMVR38dMDs+Pcj1J9tSNTzmF7ECh2sbN?=
 =?us-ascii?Q?OFfxdElAhUCmOLBPKBshBY4WTuvmOfW90tC8NPvzonpVnv9qz0fQaJQe+a5d?=
 =?us-ascii?Q?HyBW52fwnYkmB6PzR9RuPP2rO0rCWg5O0ZcTavhgZdZPTcoEYzYzrQw/8dK4?=
 =?us-ascii?Q?7Cw6ZajGESDQL2+VeokPFnX/MgikBrokaDy2qLsQMwlzIvbuVzLBvW3LuSmE?=
 =?us-ascii?Q?wFCDbpY7RM1rmKRefFr1wf7CPo/TMjPDGNosEs8BTQdOTfwTUHj34633SA81?=
 =?us-ascii?Q?/uDkoN29pI1fvBP9DrOlh4RH7wZSVo0bvQpJz9yHT6YTO5Qhulhy18cGPNyG?=
 =?us-ascii?Q?3BU3i8c26yPOYK2nKj3Lbo092tvEg4XLk+JMClzQF1SdCsGPQ0uenyLM2x3O?=
 =?us-ascii?Q?Io0NYTCI1MuPEcP7yXDMDQFS1qzz1gjH7loyidcd8j0ScmqzrNXMOrfwxwTo?=
 =?us-ascii?Q?h64etwUP0FM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qkBLw18+hEQQDffbIOMqhXJyRAGRIMLWfILB7p/Z+Cv8WKo6sNpPYv/IeSh9?=
 =?us-ascii?Q?DbeggfkgXrlLi2EZWk12qM1UAxp0YuuclivURCUuHjINjtlqMt/D0wIjj+PJ?=
 =?us-ascii?Q?wRjGOaTBUD6ntX5p7EXV3vucwhwG8/ofrrWXUfUvtbfLJg5zhxovkgG5zgqZ?=
 =?us-ascii?Q?MJxwtnRwbNWIzpRXKfqvf+Cd9f+BuL4rSKvSyiBEh+cDqdJ/hiLFo7obTaid?=
 =?us-ascii?Q?NK9An1MVbAsl36UwqPFT865jrxDi0Wnmt9aLPdJ2XGtxHNXmXJVa2brUbM8X?=
 =?us-ascii?Q?rj31aw/Vx0HBulblA8sltazRw/vnu7b65p5paKrj2/+d72U4qzf44SdZhw+U?=
 =?us-ascii?Q?LhjA4rwIjMFqwkalBM1AHUlK3HFohkk6ZiGOEGhLzGDC84otwW9wGKnHsuUv?=
 =?us-ascii?Q?RCyeMi8y3hcuWshUS6FaMrKjxBpC5wbAKzjLckNX7ZM11+xKUHMWrUg2lh5F?=
 =?us-ascii?Q?kOxoj0QqoocyI13JGZURlR/c9RzFG9c2CkHR+7fdVwAVmwhK5/jEf++dhNt6?=
 =?us-ascii?Q?F3YT9CaM49uljAAU1kW0SELaI8MDasgMVL6v0GN3VeQVrYYedxweNKSrWAlF?=
 =?us-ascii?Q?3UAZUjtDXKVCPW/IPaHJALRx8U6OkonTCLPu9705We5a6I7AuVgItWk/6GLX?=
 =?us-ascii?Q?mOs+iYluQIpax7KQCDkaRdWjKQvsqIz5PoZqMOh5FCpHn7SRpbLeDv8nhkVl?=
 =?us-ascii?Q?odAidC/EC97bf5ocjABYzSLKaGP6rbi+JxMJ9E65iQHsQTtpzOUjDw3hdujn?=
 =?us-ascii?Q?z5yS5puuP8osIYHkARQfQzuTPDUMcgrJglJNq1WPmvlDeqaKpiF0Egm9zdYZ?=
 =?us-ascii?Q?SxoUhb94n05w5zb/UH08dJHYKzMJEWqoMI1U4clMgw0PGPHGQAUGLWcB9Uia?=
 =?us-ascii?Q?mout2ayoL+YJyB3nmKG2VJN7xgoq9wm68CZPuznnivUwySvDkBDpc5kG89dL?=
 =?us-ascii?Q?XsxgQq13DnBvgZ173J7l0xEYZPYRatioPvIN0TdeakaZ/29LnpxjOnoe7VKj?=
 =?us-ascii?Q?Yjh5otcWg6pCppgx6wnutygI48sgLD03rJ3V03dfV2h6APafC+hg3g6FgFkt?=
 =?us-ascii?Q?a/2iFAOyIozP3uvMRrLloCAkaEYwtA/ivWh3RsevvTj5FxTrA4ZG5wiZtcmT?=
 =?us-ascii?Q?HdRFwXpd6e+ZI5uIcsiU+laIMFGhwEF9bOoqHE5/mDXmQKVDZF036h7lO6ii?=
 =?us-ascii?Q?Cbu/KMWzK+RspOKaj7xiS6mtejNekVlTF7iGUJL0nPAFKSG+eSOCTkdXZIkv?=
 =?us-ascii?Q?I9WSNaLQk6GRs2hheGWalrTp5W13aHJeLr29JsQwJju/Ur5TOQBb8uAvo66Q?=
 =?us-ascii?Q?eNHkrQ0J/d2jMef4/ZdKQxzoAZLcry/zq4BCUf5sRTqajyot+Oq0GcSgQiik?=
 =?us-ascii?Q?Z4gE9UgjJUyZsSjA64DPpoVuDpOVGpJjd5QOIoAlfAN6qn8hUc46FzV5oTx+?=
 =?us-ascii?Q?VQqG2VYPFjJznbIOnhYDEdjDf0zGK6ndQCNNpxheDn86qvgGNd49o+dfNFEI?=
 =?us-ascii?Q?4Jx6RwQRWJFB8wTBjP6UFd6aL35lSA5UJrX/BXt8bT3kzywCQLe8e1KaB/GT?=
 =?us-ascii?Q?TAASJHftqK/zBg0JOOpRs+REZr4V1s4Ut8FmGmCr0qQzB0rqd06uwnzQiAUG?=
 =?us-ascii?Q?Ww=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 90eec293-3ca8-4738-19ca-08dca2427194
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 07:15:43.6753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q2YSP40Y3Mcft9nY4gaNH038KnKoe5rWL2hq3bkMoZBuYKgo92tx4DW2PMhD8AMzR2Vq98RsntNKtfjEIA90fQmTIBIptITmwUD9FFKdDzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12219

Hi Claudiu,

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: Thursday, July 11, 2024 12:52 PM
> Subject: [PATCH v3 04/11] i2c: riic: Enable runtime PM autosuspend suppor=
t
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Enable runtime PM autosuspend support for the RIIC driver. With this, in =
case there are consecutive
> xfer requests the device wouldn't be runtime enabled/disabled after each =
consecutive xfer but after
> the the delay configured by user. With this, we can avoid touching hardwa=
re registers involved in
> runtime PM suspend/resume saving in this way some cycles. The default cho=
sen autosuspend delay is
> zero to keep the previous driver behavior.

On the other hand, you are saving power. Currently the driver is highly opt=
imized for=20
Power usage.

Before transfer turn on the clock
After transfer turn off the clock, this is the optimal power usage correspo=
nd to suspend delay.

By adding suspend delay, you are consuming power corresponding to
that delay.

Cheers,
Biju

