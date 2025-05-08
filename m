Return-Path: <linux-i2c+bounces-10884-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0784CAAF148
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 04:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6198D4E052F
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 02:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30CFE1DFE0B;
	Thu,  8 May 2025 02:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OOCtg+I7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012016.outbound.protection.outlook.com [52.101.71.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3BD1B0402
	for <linux-i2c@vger.kernel.org>; Thu,  8 May 2025 02:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746672715; cv=fail; b=pZsDQyUaFadkpOw9QOy46rWrI4Oa7X/GAC26XYBONfurOU2FloVxyDTHCzxrEHP/ypce0Sb1VtC2m+AyutmK/zfqPMSPNQa0MYQENcizB4d5nAOJ64u2331gVmJm0LMYeSt8uqJgzFISa+v6SFwkY75RoO2JOddSm3j87mu8flU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746672715; c=relaxed/simple;
	bh=Z/VC6Ne3EP1+g+cvZ1rKXIhQdAOukTzBQ+5e11mUNAs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MWe4OLZqidxw8r4dAiJ9Igc3yVOGGc0eKYpOgHTewM68T9NmQ5M4AEtp8wOtnPnlzZydQLjWZbk6YW+qi1UurS0pnOulFK16YGMxncxpVxjrZUZ1bXSDaODDXv2djNh47BDP1sq3lVelfiAhzFJuqirmbxtZlUSBFJrq7JFsDcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OOCtg+I7; arc=fail smtp.client-ip=52.101.71.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7dWkYyjtUGgoJMIG7VK0zS24BgG2R0oLY1xCIaL1QfbxDevvShnjFMAlbA+V8583iBDlJ7iNo9HpJEbYXW0cyP6xB0tI3jFvRMUm4lA/CXBB/7zzrrqVd6tV7v1TX2MNVp4nEg839E272t7tPmUEKR3NXaWO1945df8vkLvCA/X9XaGw4RX1COQ7Jz2HFg27l306XWYoxqlhcW9oMcTUWBfIXHKzcguspJhSoRTm4R/tzgipGxH9nrk7Il30YbBiJeXJYdvBZxPEPNQs7qDtLLOJyt3qkScIXq+SPGaUVs4rsn0NGh55m4bkfzrQrAc/46CghlFlvWM/yqCvgWTjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avS6iJGpxNVJ0TCIwX8j0ufYneWsDobLx4jP8+FasHI=;
 b=fnHWg89eNge35IOyP814CIoqumL4Mbh5/+KE3O4GSnLna4cCGYGGFt1ZS2vKIgT36zE//8N0Do7aahMgd20D/Kfe7oDqnB2n0oAOTxHoucVBAvpezl3AaBqIVoWI9LjpeCL+TAuh7Mz4dl5/aBIUpy+ARgHPW5zGdLi/AqbxJy6pgUaK8Qk3+rjQVwpPdVKsIzKulAtC0WULz6045PKED7mNV49zokHR4i5pVuqnZhZfaFtQkrBX/IN75WNP2Bol/7MhJ1A54m2Ma17B+lGT9MuIWX113bUjKlXTInYh7y+25qYWKKz/+sn+FZmbQ0BjEI0SSaSw+KYa+ME7T7oVXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avS6iJGpxNVJ0TCIwX8j0ufYneWsDobLx4jP8+FasHI=;
 b=OOCtg+I7lJ0FaKi1xRCARMm0qAAVFfqPWC2MBK0WcVilXUh2D/JBGlzWg5Vk4GTzSxL9cnhyN74/gktHwKJ71grv1OUhLN/4CxZu7NyVJoZ6XWV//EhiAcK+4B/Nddf9eTYRy7kyaadA39P74lmlBIqb/6RX4PzVdhnIUfuvKS6lpVeFNxJ73ce6t+UU4ZU0Xg6ppm0wVQm2VR2pKPcXFS8EObFpdbcsM1YmZmnDoUt+3vcywWswj3Zm4B1TfNPcNoIjRVBIo3+UfQTmr9UHSkSz7AeBcPYWEkxKtKv6HPdnft2cvJTlCJYL2HudNSzT31mfTg+8t8W95/7beAY/8g==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by AS4PR04MB9652.eurprd04.prod.outlook.com
 (2603:10a6:20b:4cf::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 02:51:50 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%5]) with mapi id 15.20.8699.035; Thu, 8 May 2025
 02:51:50 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>, "wsa+renesas@sang-engineering.com"
	<wsa+renesas@sang-engineering.com>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH] i2c: core: add useful info when defer probe
Thread-Topic: [PATCH] i2c: core: add useful info when defer probe
Thread-Index: AQHbv8QlXZXc/Mrj5kK6qVuuLfsYnQ==
Date: Thu, 8 May 2025 02:51:50 +0000
Message-ID:
 <VI2PR04MB1114786C768E0CA887BA5EF83E88BA@VI2PR04MB11147.eurprd04.prod.outlook.com>
References: <20250507102714.3535412-1-xu.yang_2@nxp.com>
In-Reply-To: <20250507102714.3535412-1-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|AS4PR04MB9652:EE_
x-ms-office365-filtering-correlation-id: 46dd70cb-9007-440a-f343-08dd8ddb4818
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?lmrIeem8yYNBtB2RzZIs1hp1WZhCCvE1yhqEOnSnRWrpvtoJEWNFxEb7KtOJ?=
 =?us-ascii?Q?v4MbcnIwUGmyGEcVeD+zutqVrE0Oh3tEzyt9epVbSLZNEbNlR1Uuc4w5XhBL?=
 =?us-ascii?Q?/FoMK2Q7cTSNEd92WPG6Ok+6ubJgbwxgTztcRHGfuevb4xmKCdaE5nCbv/DO?=
 =?us-ascii?Q?7rtqBNSx5ys0rm0ZoIh6e8nenc5SBIrSIHx4RQoJYQo11LpvxydQ9xk611aQ?=
 =?us-ascii?Q?qg2KSeXAfAFkuyxpUUf9UUmoMjYSVH978Tb/62MI4psa/b5ZhJm6C3RYkPx6?=
 =?us-ascii?Q?fCyHCgx7r28rA+Tax9O556MESAJIrV9e+622oJYJM1xPFe6Ia124imMuP08n?=
 =?us-ascii?Q?aLFdG36ZU3QBbQ/eJVImKgttlQ5TjoVQyN6vop3DW2MAwWnKbA1doVhjVX/e?=
 =?us-ascii?Q?XV04QMHzZLkLiZ0H+svsTtT08mptqMJyRYMxFHITM2pQjeScC9i4Qc0UPJJX?=
 =?us-ascii?Q?ZK9TSVMoiaJnpbeFkSTNSZLL2f0zGnJYYBPplobTg1503fBng8EkzNWmpQIG?=
 =?us-ascii?Q?Fn8A0Rl7ISfYOpejh8sGaXn5pOUAqwxMlROfXVc0ubR89VUDasuqnlSFe4BU?=
 =?us-ascii?Q?ppmKTVac7tqbtFJaVL/RCElNcGZ9LUoCdcoZ9AvQfrokS4MfojDtPXyoTDri?=
 =?us-ascii?Q?MMGks7LxAegwppxqQBhRqZejzVTqvJXwXJd1IGYvzn937Z9czIx5WQbgzXDH?=
 =?us-ascii?Q?m3U3dCcYIldArBPfJ4wOaJLhm1ilgrww+PlQGq55UzJ0mKq/Roh3VLPNdIoF?=
 =?us-ascii?Q?auborKxhCObFwzBG++QaYvfU7p9qNky6+35HOR1jnTu+z/rh3NFeHjAylqJP?=
 =?us-ascii?Q?siAY0lx2qPxqebYeZXL4xY2t4BRtTnSnZZpZTiBJ4bqEukLJkx1RMVx3dtKV?=
 =?us-ascii?Q?OJksc8rJN12c8s0SORpRQ7VftQ47o/hum5KsoPn3ZZoOhNB4PTDkduT5YpVL?=
 =?us-ascii?Q?Y7bagDANjaF580LxjbxOAR8j0EeXSU/JTVUOv9p/HZwiiJ9a/BqR4HHDZCG0?=
 =?us-ascii?Q?tnjg3OHUUj9MG0fS58Wwl0Ixs6guBl2jE2NQj6bcOBUVRhPyM8yrNGpdPE2O?=
 =?us-ascii?Q?KizR4uXzyW65W8Z332EMGvLn0PQI4HV8hupoZae+HZnkU7y+EQe4j/ZImVkL?=
 =?us-ascii?Q?38dNoZhTWLQq71ETzdJSqp/shmN3DsZHHSXO/GO2SbetaMUgpsmpQSbrtuC7?=
 =?us-ascii?Q?T9/eM0fo2CHlRRpEr497wSDNAhqXN4iFB74B5vhfxr98Zr+qtCaYpMENC3Fg?=
 =?us-ascii?Q?351RvLxwkghni/n1QdBf8LOUetZh7zHIbmo+kGROrmV0YcIO1N6UHzt6McPl?=
 =?us-ascii?Q?op7Iy4Ga1ufVkQhShX5eYInfhBFZIGhMNgMbNkWSyYd3XHzfnUy2k2COMIid?=
 =?us-ascii?Q?wk7qlzYtLGKsnKH4i59NGGP0PqUt5fLeHHzOM8deG82pAW/32E174pVzkp6N?=
 =?us-ascii?Q?v4raXoOEcweNVkWVQM1DWT802DTQTy/PHVNR46x8ahqr4csl2Juuni/xddPz?=
 =?us-ascii?Q?9Gaby8D3mzvepjo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/HxUCaUEHLJ1BwwyTOnEIjMqkzVtEhD9kJ39jqpx8FTU7yNN56vdqnotsW/o?=
 =?us-ascii?Q?PV99edUXgt5qJPCAffilYZUMF6cxEz5lqShiAmE8iyvs1LbuiptTiMhunUMJ?=
 =?us-ascii?Q?eBXgz/q51d6nwbvMxSLh81dpNWDNuDniAGHyeXP3X6ir8atR59CY0jglz2Tx?=
 =?us-ascii?Q?emeXP7FEiL6PqCRhR4BlDK8mh3FZYsgnGHv0snctCf3d1EHRbf+IBpvc7pb2?=
 =?us-ascii?Q?jKPf+/HsjoHKIg9JAxS2DgRJVDBaowhYWobSSlvLZFM8f9sn+GUxS66u4BKG?=
 =?us-ascii?Q?8Hx9ME49U5pY9SLJGPM+YnML/aN2gFxIAF26t7v+NypoJEwl+EoNiOAXGzNR?=
 =?us-ascii?Q?yOaQhd2J8NxDwQAKyk9vgF+tAkfICx1nnmiUuEwxiz4z1FjYJ9kEEYnfJsr9?=
 =?us-ascii?Q?h0uDjm5Y77qzEPjsNaRPES+RN51WZxaTeTCPLh02jOOBK/0WI0unp8zHmD7L?=
 =?us-ascii?Q?fGioDJzsevRdZgSu8zsRRx2j+PO50plTKb1TBWPK2Dx87sYFAD7sHAMNOHGL?=
 =?us-ascii?Q?tEehsqPMFUiCdt3XmKjlHdAWIuC3cXkKjBoYuFjX+Z7TLvLb7Ge4E/rQ8tuu?=
 =?us-ascii?Q?fApr5Ro7MlZZkbWIUGkh5p0L9o9+9VpzsNVHQ2duWcuBlwfEfgF5d5EbpbP0?=
 =?us-ascii?Q?NVzpEXOWtL8f4+3qbO5pmDMwKBLbB/kPlrexOOvbug8VdpyOoHwyeCKWM7aN?=
 =?us-ascii?Q?NeNoW6/AIEDh1q5tOvzVbtFQN2BO82sdw15Trlnu4RirkgOvmYKgXM+BqVDK?=
 =?us-ascii?Q?Avky1rXxEnYRWOExKJewhmrT6d0GIb3GZglJrB/d/P0bkQeg9DjcmUWwWewP?=
 =?us-ascii?Q?gj2pfgdqVjFMlMOEpipfP9/vDw3UdBMjplA49r62MpOKV7vJFOh9x+6hcrs7?=
 =?us-ascii?Q?nuU1qXvQyVB3zaEAZXsYhVkjcp3GNSWoBIOjTDTKxXKLAx8hk6dczcGruDpx?=
 =?us-ascii?Q?qklgPsIv0D8t8Kc3ZkL4PrCUIL0I7tU/Zb0WOgL9rDuHtvnJzwb9wk6cX2Va?=
 =?us-ascii?Q?tsZGMIgtkTeHGlUbb9qQEZmifNs8CI5Eg9CNIJ8yZ+tgYXOSuTdUAQz2GKuY?=
 =?us-ascii?Q?wDzQjXClQmwFra5uVdq5zJkOnaBBvVi9QM38yPsYTLGa+/gkdcuxitu7DqxS?=
 =?us-ascii?Q?1jzQ5Z0aaZOnDB9UfEcFXsgHeWE6RV9SiJWkLHquZUO8kvWIzBgOcq9Qm/fO?=
 =?us-ascii?Q?bCRtqU1c/0dV0ag2Bg3sWkl2I/sPuFb43s/oomUUVA+gMRCctk0JUUxuaPww?=
 =?us-ascii?Q?P5OKaJ9mes5soamo18y/5bkd1jPSbVsue0SJaEOEdEcfWyYQ99P7bL3+GeTq?=
 =?us-ascii?Q?UWDFWDWoq+7i0XVoF5Rz4lPP9tpWlPyzA/ik4qaONp3N4tQavgSSY7TQA4aZ?=
 =?us-ascii?Q?5DOweYTvH7wHln0cPLtQaLmKG5GADrYIuDunljL3lHULT55D4JNtWuuT4n/D?=
 =?us-ascii?Q?6SkBTuG5WIgLPSJN64OVzMJwdNy2TYxXQY8vkG9JlJguMVANu7t34ZSzYNuU?=
 =?us-ascii?Q?Yiw8anzZmQKtUtCj/uSq6bNccy9UxQNABvjaQDVYHf8UKjl9U/b41LL83jWp?=
 =?us-ascii?Q?jrwLcNwb+mLYuRR/h4JRs5OLJ/fmAC4eEv4Wo8f0?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 46dd70cb-9007-440a-f343-08dd8ddb4818
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 02:51:50.2825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Oaa+bsuvhgJXME7khEHZxsYIujLm/nK5M/IrDp+BrD3uhfo1S7OX2ZrIA0pPNCXCdItZ9BYlQ+BvobmjsQgMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9652



> -----Original Message-----
> From: Xu Yang <xu.yang_2@nxp.com>
> Sent: Wednesday, May 7, 2025 6:27 PM
> To: wsa+renesas@sang-engineering.com
> Cc: linux-i2c@vger.kernel.org; imx@lists.linux.dev
> Subject: [EXT] [PATCH] i2c: core: add useful info when defer probe
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> Add an useful info when failed to get irq/wakeirq due to -EPROBE_DEFER.
>=20
> Before:
> [   15.737361] i2c 2-0050: deferred probe pending: (reason unknown)
>=20
> After:
> [   15.816295] i2c 2-0050: deferred probe pending: tcpci: can't get irq
>=20

It is triggered when I2C devices are connected one GPIO IRQ controller but =
the controller deferred probe.
No function change and clear the defer probe pending reason.

Reviewed-by: Carlos Song <carlos.song@nxp.com>

> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/i2c/i2c-core-base.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c in=
dex
> dc3c60a7d382..32ffd12bff9f 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -520,7 +520,7 @@ static int i2c_device_probe(struct device *dev)
>                                 client->flags |=3D I2C_CLIENT_WAKE;
>                 }
>                 if (irq =3D=3D -EPROBE_DEFER) {
> -                       status =3D irq;
> +                       status =3D dev_err_probe(dev, irq, "can't get
> + irq\n");
>                         goto put_sync_adapter;
>                 }
>=20
> @@ -548,7 +548,7 @@ static int i2c_device_probe(struct device *dev)
>=20
>                 wakeirq =3D fwnode_irq_get_byname(fwnode, "wakeup");
>                 if (wakeirq =3D=3D -EPROBE_DEFER) {
> -                       status =3D wakeirq;
> +                       status =3D dev_err_probe(dev, wakeirq, "can't get
> + wakeirq\n");
>                         goto put_sync_adapter;
>                 }
>=20
> --
> 2.34.1
>=20


