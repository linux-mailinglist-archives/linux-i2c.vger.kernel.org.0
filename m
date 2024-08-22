Return-Path: <linux-i2c+bounces-5681-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A55395B83A
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 16:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B3F01C229B7
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 14:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DAA1CB15D;
	Thu, 22 Aug 2024 14:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="heKZXqwi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91A416D4EF;
	Thu, 22 Aug 2024 14:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724336533; cv=fail; b=QF5k6DBXID9qmyqFHKol+eABLfsd/94C6obwrmSdJjMyje6kTyxWKtyG1sZz9AAjjJYMHUQQmSfZXvbCoxTqgLnk7lnidFdxCT1ZB5r3coequrvHHx5QM6oAkzG3VSfbAR7gxj3jHXDkwPr2Wrq0oA+k02JXBlkp9DR3ibT5Qa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724336533; c=relaxed/simple;
	bh=fymczKMoSza7DqiO7SBjXL1jfydGiUs2ZY+3S9PtkRQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MyEKoXlf4MW0bLCfCrINsK8jj6nScNTqiC0zBKmOLgzoAPMiwJ8oa5OWA25q0pT5leZaDfGz7QcktNfn+JeBmGEJ9IJVbzkTlVQCEoTooV6ouevl7vbfdM5RHbr0I8tcu+CSM8j8YcLAmYKkOg9IsKJHVKlHXA0tOQl1q7JNXLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=heKZXqwi; arc=fail smtp.client-ip=52.101.125.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w64YNnlSVT9K9/5cv0mv+Jz2KiI+hRRzrz9YsPNuRo3Dqm0MoprYNsi/LIGZKrlZXujylS9ER0xodZ6EJBTxbvLk+EyyB7pIQAZg9zxX3Ep8HEOezY9C2dz2DCcP81QsTi5RjjqUHEExiKtNCQp/NJ+t+VGlrFeFkpdl7kCb6C6p76u67sW0+wwB3PMIDCcZSrcih49nFBgShevXgyeotViCBeOiZjNRPyWklbxgtdQgIhxHawW9/iBweeVsK57WsXsHm/Vo3XTcgqn7R70rcr/k/cCVl+xGnAfwnsTmL2kQPa5uSUQgYJxsL+YNyFcIqCGsuY/EZ28prFVbW1UcCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3Ys80YmsbqUK914TPph9Bb6pY6j4CnnfIxzCZmFdnA=;
 b=hSuoqBRv45axGmSksrspWwH09XjNi7MOsJtbcSRi+Zf+8gRU1++1WmuGuu3voeI2akjmY8k34ROgqqHTCvvxXAd0X1+M5Kx4ZsirvlA8jlpt0GemJSHxCPiIZDKX/WDqLQkJsv60dZAyq2F0Wtif6tMb5XsGvq+WUbZxnkrsmkv4Jxkz3UiaP5yHM1/cgkZwGVYxn2PtQMZbRHSxb9t9sUtTHj7UDaXX5qZ5KH9PBsl/rk/t2oevhAgFeZFXHjPzr4rUBznaAfuRPOJ1riS/4bbEYU0ZeU2ImNA6z8tJJpwxNcI7+Y3ckWZ8kZLx5dLjpb5LDSs4oQ6PZ2uZvMqVwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3Ys80YmsbqUK914TPph9Bb6pY6j4CnnfIxzCZmFdnA=;
 b=heKZXqwi2UT0la7uY/8AGAcNOnsrPinU1QwRNsHmFSRhRF+gveokm5OJ/NkoRAGvWdudfC+yJWQR2kIAEap2VbakwkRY1/9cstEzLdAPj0zBB/kVO+P6L3RQBRKyDSrhWCZXssogor8g5lf6E6M0oR5mFWYeiAurA6+ClY6rR2I=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11706.jpnprd01.prod.outlook.com (2603:1096:400:400::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Thu, 22 Aug
 2024 14:22:08 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 14:22:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rong Qianfeng <rongqianfeng@vivo.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>, Paul
 Cercueil <paul@crapouillou.net>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v2 2/3] i2c: emev2: Drop sclk from struct em_i2c_device
Thread-Topic: [PATCH v2 2/3] i2c: emev2: Drop sclk from struct em_i2c_device
Thread-Index: AQHa9JxxcdZhLj8Dzk+kIaF4BBSGPLIzU/HQ
Date: Thu, 22 Aug 2024 14:22:08 +0000
Message-ID:
 <TY3PR01MB113466D4073CF89035234B02F868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240822140413.65369-1-rongqianfeng@vivo.com>
 <20240822140413.65369-3-rongqianfeng@vivo.com>
In-Reply-To: <20240822140413.65369-3-rongqianfeng@vivo.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11706:EE_
x-ms-office365-filtering-correlation-id: 63e98e73-c9ce-43b4-fc43-08dcc2b5ce58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?d4GG/SLpSVYJv0LW9WLTZrxD+krpsCjN6rhcH6oGQUuAoIdvXNE1PCbmKkYG?=
 =?us-ascii?Q?mZvFTUZ7o1CEadBx6sjjJHW7gMKiqdNit3jfu5rJp05hqbSmafOklu5MA7QZ?=
 =?us-ascii?Q?mlcPZXbchJqzkwRJ+b6B5YfNIjhLETi76RaIcN3J+g+sOBHdYKSJQmBUTscZ?=
 =?us-ascii?Q?W+O0CGnNDXN5Y0HOeZ8ytKJaSO9wZav7R7mzliN9HqZmfdK8zTdtDSb0F+jo?=
 =?us-ascii?Q?j3YSarOhpj1COJFvSL9ah6XXTHoVwfKlQdHxWdg5ZkOe89a6nKEHv2QXByRB?=
 =?us-ascii?Q?KOblCrP2ZjiAvJe39anDRFDEm3oS+eIe+JT2tmMU/ZVs+/8mpY0QtFYTATpC?=
 =?us-ascii?Q?bihUabMPthb+WiMD5Z3K3ZMmCy3XYSRWfVaTV9YwygOA54gy/0/Nr+oFkLHx?=
 =?us-ascii?Q?3E3drxLIbL4Vx9R4+cx4EqAAz8gFdJQCj+KljjH3OuFmfEnbsnLPahxV/mlZ?=
 =?us-ascii?Q?5RM0C+1CZONh5nMyBunFCp3ZPIzh6pCUdC3Zsk2yBA2XOID9aXQr8GHlElo7?=
 =?us-ascii?Q?va0JjWSl873pF5dX40yd2TG8g6kw4VECwwliCmyll/rewZ0Pz57yfZ+z3xsd?=
 =?us-ascii?Q?o3zHmqKpCt2v7mBt7l7kxMvAHsCDqiuLd7v2ysWJLTFIA1mCqzdSzVKN+Dma?=
 =?us-ascii?Q?oIDn2jimk45YlMzcpnUhf2WnhXnM5D7SfohncvR7H/P1ntEbCsWO2v1yiSVj?=
 =?us-ascii?Q?GIlOduRmNgzgXRfoYgeVuZ9ZWZy8U628r1ksPutG5dkk1wabJ52YwCw9f9vT?=
 =?us-ascii?Q?CtvjQpgw4ELOyFYJliquJ3k4gx/+S96F8axQdmQt65AoegS3JOaYiwcTW8zk?=
 =?us-ascii?Q?/x2mrH9NHfG345jGBqJ3kTYemJ2pXJ4z2yoYUMDqUCSvqAC7A3ptC14LXTVi?=
 =?us-ascii?Q?RnN3h0+6OddTCFXmfbfDrTyKPxiVmDBBhlWlA4osCiGaFuPcxEbPwkTrcg/K?=
 =?us-ascii?Q?3zXcsOn3nSvEN4uI0KElMxJcMfr+8foaAKbblfzHwmTCw6qzXcIx7RbvXphX?=
 =?us-ascii?Q?q534oypGqTuNAG8wqGPzrylh9Enr8UMVWimm5MFxWnl9CjC9k+odVw+1gFHM?=
 =?us-ascii?Q?TqRrpEUo4cy9P2nqbglozYNOKyekjtb98+aAo7i2qN0CAch/bhLvUuG2YTHi?=
 =?us-ascii?Q?UB5h3MNx4/ZRuIdfRV8UMaESCR/4AaCNbgASeJ5CQbmNQpe2sfcSZdmiD0cG?=
 =?us-ascii?Q?jHnIKZrS40gXvurIDLB6co7T1le2rbBu1z1O/XmABqcuszXvwIVJEZ5Qt4w9?=
 =?us-ascii?Q?oMXFzv78Ka9Q/6dZrLGGryUWRCAtATaZ9lQ32wJs7g33N1glOnFxCxGg6ulg?=
 =?us-ascii?Q?wUBZVCPaUrbxnSXIHLAhi7JKG+4PRF6N8DrbtODHLEJFCO20JeLdUVo4onh1?=
 =?us-ascii?Q?wOQ6ZVlHTD/DsAsGOZQIlQ2PzY43O5eX5aYvep/kaOH0EbtGiw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?voG0VX9tX2Z7B6AlB9lM3E9NPB/8+6B93R+RqOjxC0E7oSWwxn4QvzpuCtqV?=
 =?us-ascii?Q?4HrqtpY5zvGhAjdpkjwXJp7IT5zu1Qh+pytqn0NXa3qyLraBpGpcZnKMoUDm?=
 =?us-ascii?Q?NdjX53mGo5Mw11XqqtCbTB5s7e6jZGtc5HbVYVhUrOfmcsWB2tIAKZlRVMlJ?=
 =?us-ascii?Q?2PI0WUbICKRCDkmLkVhNnA1/zd6yPMzIuOjG7s51LOjclOdF2f96SimfvMZG?=
 =?us-ascii?Q?37/olbkBOSEYDzaaq5jVEpkCDYL+cj2kJj4d0QOx2WsHPO7m1k+zvmCjhzHk?=
 =?us-ascii?Q?aF6CoUcJrXI5THVZVetpQtPVuX+Pbkk3w1EOJHjZYj8JWKcInKDTuNlAk8Tz?=
 =?us-ascii?Q?JMLvfMyslbNXtkI9WagrRVQDVl6x7eUuAwj8Y3lrJ2DC/6HKN3QntsThdnDY?=
 =?us-ascii?Q?OQyKTuIcV2KpcHbqMTfllvEi0E7d8FMVjz+Vn4W3mSBEzFTKx0uEHEv4wV1q?=
 =?us-ascii?Q?Yy04Dex72y0KvpB2ecoxcQgv0O9DdiZ09o7BG1g5cLzhty3q8dKBvmX0ABAU?=
 =?us-ascii?Q?/llVWEuttHRmJwoyEVcfyWalwLdm6zXY0y/RKYVifSFbL3PsvvFgGNhqTtvB?=
 =?us-ascii?Q?w0BcXMuzQK+/4gir3I97mUIdGm2JeWMBLmtPYDt69FSPjAUn7Hfm63as4oRS?=
 =?us-ascii?Q?sg4RK9tBVJX0F9gGeJWZ109Ib9w+byNlBDjNCU42J4nu9siWaxzU1sR4zBGM?=
 =?us-ascii?Q?IAli+WklZuPil5wzFY1lcT05vSG6Qd5Pa2fxwFF9eUuo2wzv4mI+RXCb14/R?=
 =?us-ascii?Q?DEmMaFjV7EEGfbqt/Tqe96BcVHxrtirSOs0q3CgDSX0uSmYYa1bU8ZsMhZUK?=
 =?us-ascii?Q?/ZRVMJb8LjbpD5LncUyiNooIBWk3yprp6Z3vo+0akpWNX4LkM+L5BVw49BIC?=
 =?us-ascii?Q?iYYHakTUUc9Ajmkzm3ALYux99b57NjEvydWtcsCQhwy7qVvpv1d9IKyn10cw?=
 =?us-ascii?Q?U/1qvb920+4SJG+ux24Bh019YpBKKOUWxqEIb8PYW9B2uXOGo268Su82U/qi?=
 =?us-ascii?Q?MBAHk4UMaWtFZoUiI1OpRNG3Z1yup2vlE+4tC/3Kf+Foai8+BnK/QMZNFY+o?=
 =?us-ascii?Q?PNemwIgKFuX5VH0jGLtpBwzuN3jA1QWz6+NiLKrhkn+3p8nyztCwy2rOgsO5?=
 =?us-ascii?Q?CvEd9tNQvvNViBqXZlt/ZKiNJ9WHd4lZniB1WVqX4Dja03VnD98f6Jc5ze1O?=
 =?us-ascii?Q?k4zhZMW1pUDNkQMccsBtbzl6gVm2L98tPFQOrpbdsnoz2iyv1xqmViCZqvI5?=
 =?us-ascii?Q?MA5fapOoyoMASyR/vGp5RpW9k3aXcW1nUCfxr6gHNhYahjTYPpTscbxLi6By?=
 =?us-ascii?Q?wUN6YLSi8z/7iX4b9izXBUYk/+F/wp0Z9+X4RX1oX/CH4PXlFZuTpAejDzWJ?=
 =?us-ascii?Q?kZwrOHD1PM7N6T0l4Y88WPf/cvFvMCn3WhdvvXAvkuYizDCnnhO/gNxwirxq?=
 =?us-ascii?Q?wFDUEHf/E4FkY+PPwAb5il0fVABZNKFKpsxL2T74yxfy4rWrAYTKhqfBdc2e?=
 =?us-ascii?Q?oWSDdX61/AXW+e2HUGtIj3BxNHUGEBz3c23vjGtse7r6UPM4pfSM4PIX2qCY?=
 =?us-ascii?Q?2Cwn7VJBPlmh6a2XnmB6elLFfbpkgKLxoKhcfoYDbV0F9EJMcQmwURhVIUWC?=
 =?us-ascii?Q?uA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e98e73-c9ce-43b4-fc43-08dcc2b5ce58
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 14:22:08.5996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1VHHoT1unpPA78Ca14HyHlOFGRA7xqCWY+QcC60O/1sXz2jRxD9Li7miq4tOXgj3dsZ9hBDU7IRQ81nMc0AJnM6YKA+SMYpZrhAb5Q62TR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11706

Hi Rong Qianfeng,

> -----Original Message-----
> From: Rong Qianfeng <rongqianfeng@vivo.com>
> Sent: Thursday, August 22, 2024 3:04 PM
> Subject: [PATCH v2 2/3] i2c: emev2: Drop sclk from struct em_i2c_device
>=20
> For no need to save clk pointer, drop sclk from struct em_i2c_device.
>=20
> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju
> ---
>  drivers/i2c/busses/i2c-emev2.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-emev2.c b/drivers/i2c/busses/i2c-emev=
2.c index
> 20efe0b0cb85..2a5d9d658246 100644
> --- a/drivers/i2c/busses/i2c-emev2.c
> +++ b/drivers/i2c/busses/i2c-emev2.c
> @@ -67,7 +67,6 @@ struct em_i2c_device {
>  	void __iomem *base;
>  	struct i2c_adapter adap;
>  	struct completion msg_done;
> -	struct clk *sclk;
>  	struct i2c_client *slave;
>  	int irq;
>  };
> @@ -361,6 +360,7 @@ static const struct i2c_algorithm em_i2c_algo =3D {  =
static int em_i2c_probe(struct
> platform_device *pdev)  {
>  	struct em_i2c_device *priv;
> +	struct clk *sclk;
>  	int ret;
>=20
>  	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL); @@ -373,9=
 +373,9 @@ static int
> em_i2c_probe(struct platform_device *pdev)
>=20
>  	strscpy(priv->adap.name, "EMEV2 I2C", sizeof(priv->adap.name));
>=20
> -	priv->sclk =3D devm_clk_get_enabled(&pdev->dev, "sclk");
> -	if (IS_ERR(priv->sclk))
> -		return PTR_ERR(priv->sclk);
> +	sclk =3D devm_clk_get_enabled(&pdev->dev, "sclk");
> +	if (IS_ERR(sclk))
> +		return PTR_ERR(sclk);
>=20
>  	priv->adap.timeout =3D msecs_to_jiffies(100);
>  	priv->adap.retries =3D 5;
> --
> 2.39.0


