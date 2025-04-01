Return-Path: <linux-i2c+bounces-10080-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 332CDA77F74
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Apr 2025 17:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C81D61891AD3
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Apr 2025 15:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA01020C477;
	Tue,  1 Apr 2025 15:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Vc56S7NH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011046.outbound.protection.outlook.com [40.107.74.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A1B20B1E6;
	Tue,  1 Apr 2025 15:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522518; cv=fail; b=Nd8QkJyonXlRsUnJCs6vD/xh6HGhVdaGt5XEJHtYsdmrR1rhBPG4UT3dgX6ErfPACNHvHYyQucyKUOjyCxz/1gS4f147gq00ZdmHUix7BSdJE7AAH6F6p4fyu0zOqY1l3iwQtj5Q1jd5hFDW3m/sHQ3U2mqHwMbVM6Y2WgJGePU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522518; c=relaxed/simple;
	bh=NYJorftXppmU28FDH88ORpKoO6CtN1DWJBKvBmMSDbA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XyLuHiCqtZlbaYRc3O73JXkLzGYr3JXA4OhbsArxWzd6PGjQIAfnautUbFsrLeokjWcaLtSeXZto2BG/OwtSzhlq7VmJ+aJJGGiMk1pNEafbBLyyPXrFwtNBNG9jtr3h1WVapIcuNBcRzUhg6pPI4VOJ+K8M5CiMHIuK60elXkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Vc56S7NH; arc=fail smtp.client-ip=40.107.74.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdFpttx3yPZd59Q1gR4FhWve4XncylJPoOsFSCBL/uqXRV0zCCBJJzkXGL7xea9fGOj8GzanrECGuI4pmzs59wglnAfv033QvnXz9IWTOxpTGYP3R+IHZ9+SWcTdPNsqx5deRnzusfTFfQmvJsvbu9/78p3Kyrd2l12Lg0UHiuqwUlw+69Eaw6YE7pz//HUz606AfKiLUBjQqFE5vDa13rjQefBCmRIVzYnQPue5M/rY75HInMdveM6Pmf5b1juG4wHht3ktOumB0W8HfammrsUR2akb/WQF5DAACxKm+gui6MewHvwreKVsNIx1OC+OoUm7Pw4vjoyy72jy85yc8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFk1d6Cfg/oJlxLlrKT4aszLRe08I8yerbpUmudcx3I=;
 b=I3Exs3Br2wWEhvdydJIM0NcWfmlfm0t1SpiVJgZqKeoFCMl3eqQyNAxOXM6z2/3j8qwkSOZp4zUdyQYF4XWzznOqvGACFy7cGbSymOsmYbkeS2B27RK+/oVhTuilsddeAOJGdDaDwoooSShCUjM7nDxxaDdgAnV4Ac7fi8l6aRq1D5BExFHSO9Wo2CBm1gWu+pWIywimqnc3VBZC73YkdXhQiFoM1x57pLszgPgUQNrOSZuhUOs3mBR6GkmPWuCMTVb7O+XEF1W1jBNSbEydNyVK7LnP/ONtsJ6Gp37hgDMWf9x/U6SMAqsGuU++gD7aq7803C/EaDTFT/QEkkc1eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFk1d6Cfg/oJlxLlrKT4aszLRe08I8yerbpUmudcx3I=;
 b=Vc56S7NH0ocxkBJ7UL/5SmPLxGWDynEg8VisLJ+UBfk9rcsiBql4XJrU0d1kIZ94xvVUryuVJDCwaN/2421SlzL52D7622JKwaYx3YEWqQpa0qswYFwnugTjxMvo+ZigD6y1n5R66X6ArAiFtc5VraK5fnAk26k7i4fvHdDcyvE=
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com (2603:1096:400:3cf::5)
 by TYTPR01MB11045.jpnprd01.prod.outlook.com (2603:1096:400:39e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.37; Tue, 1 Apr
 2025 15:48:28 +0000
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772]) by TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772%4]) with mapi id 15.20.8583.038; Tue, 1 Apr 2025
 15:48:28 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Andi Shyti
	<andi.shyti@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] i2c: rzv2m: Constify struct i2c_algorithm
Thread-Topic: [PATCH] i2c: rzv2m: Constify struct i2c_algorithm
Thread-Index: AQHboLgU7WCeDLLJ7U2SPExWI5D3XLOO+Wxw
Date: Tue, 1 Apr 2025 15:48:27 +0000
Message-ID:
 <TY3PR01MB12089EC8451B0701770BCAA72C2AC2@TY3PR01MB12089.jpnprd01.prod.outlook.com>
References:
 <537d93441ced53bffa6553b8ec93d007e64cb9a5.1743258995.git.christophe.jaillet@wanadoo.fr>
In-Reply-To:
 <537d93441ced53bffa6553b8ec93d007e64cb9a5.1743258995.git.christophe.jaillet@wanadoo.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB12089:EE_|TYTPR01MB11045:EE_
x-ms-office365-filtering-correlation-id: 63ecc832-ddcb-4193-acd0-08dd7134a531
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?//0kCRnLQkr6sj3k/bqhwOpsatUnE2RdVtQnnKbs07SFrsxctCf2C1b4aHce?=
 =?us-ascii?Q?G7GBXK6PgT4+hU2Bm7lqEKs5zW5tMEDvxI1bJeklUX5b+k3FS6t1C92UScqx?=
 =?us-ascii?Q?kmHCj3FWX7+vDBO/DK/GZ+TcHZF1ua91Pv4T8In5BGmpvX38E57kJvwfY/xv?=
 =?us-ascii?Q?vBhmy6Iug6NcCH2g23Rqv6ot6ET7RosvYYnmgEe5tZi4r4Xcdj0pBN75Idok?=
 =?us-ascii?Q?DftWl6mpDZ0Rux1gB2wkI3aSjyyV6JWgBIubLbLsyEPiyzsOMDh+h5vZmqPd?=
 =?us-ascii?Q?hENne3PtjobmlneE9Misy5HqFa4mXm0FyhhFCbob3Dl50NKwxQR+vTR2Eq9N?=
 =?us-ascii?Q?EBVhboTHLnmz6zexpDb7wNZ0Tf484aeNVxkLGUUJ64LTRQaLNDAr4ZU17QE+?=
 =?us-ascii?Q?zS2ElDvH2cXTV2Tq7r1q0nZOy5ZhrmtZCUqnsBVUxqI05wD2J7ljSQ9UdDBU?=
 =?us-ascii?Q?KYuM7O6oTOt6gxUUHG+973Fc2E2BB/fuXVBqsD4K90PZhXUYvX1ygoZ9JV3O?=
 =?us-ascii?Q?5/msKSgtjV07fI+EhwBDrRwV+VaKUwifPk/wdPNyVKXRR628nLbgXEQSfpZS?=
 =?us-ascii?Q?YSDm93I6fvh/DpLf6rCYgwtVZUksoG1PYrXiMwH97Ba+xCT/KdQqyPPZj48E?=
 =?us-ascii?Q?6tlnnkqXo5rOIiLO9rHm42/vB6Jbmmp4/JLugdbExDZz6l72E8/CNcVXk2Qg?=
 =?us-ascii?Q?0kp4AqMxQY974ekbQBsZkIOZw4HfiwoFa2g3jsH4Bf79z26NsSEp9/JGkOGT?=
 =?us-ascii?Q?qWB0gyU3pwgzZ3JXvXSIpmQygWu47f6A2VJzkR/416+jpORq0jbMEVKY4VfF?=
 =?us-ascii?Q?PqZqHGuUHVAywsllRGbrKQnuk2uE1MDibPgQRzPAXb05R9dXz6pr1Zm2i7V+?=
 =?us-ascii?Q?bbpTEuWs/4Z5gRiBSrBwLzcUvFT/haNp3iFP+meEGof/N7hO6G1/q7722mfb?=
 =?us-ascii?Q?wLQPmCZ8LZ+rbPw3Y3p5IqvQKUpDQFCOX9/Bv741hWqRLJsygp+nuHkH20AP?=
 =?us-ascii?Q?ejer9IERLpRE4bdOWb4jB2oOJzJwKSgH7L+S1S6DlB4nXD1To4mvzQ8u+6tV?=
 =?us-ascii?Q?YFhX8IGL/KZ9lAjTKWd+IwOcXYvVGyJViOSrVVb8W5Bb3MAxxX0rEUWtts9J?=
 =?us-ascii?Q?I4uj/hZ9rymVMOfH6bQ7w7cHdN7UuGZALbwlZmWkc0GgguovHbWOrsdvwrby?=
 =?us-ascii?Q?MCDJMAJN2KDZcS52kVDBuL3Mf/1s1IQ5u2fJhXvFB5iSg6IhD5bWuNjePbJ+?=
 =?us-ascii?Q?JR0x8aq9DdsBzrlMWlNhaHdSfFTB6JOKtIJ8D9pofIL/SeRdplg65cxdZYCE?=
 =?us-ascii?Q?1Z5+oU2E+Je9PMc7mKyOXdo/1VBZOumR+OIaVxJ2rDt8uYyK/b18R9xaWv5B?=
 =?us-ascii?Q?tbset9QZZbHp6l+FJLKSl0nOeO8G1zxdYqvKyvB55TekfinJdBH3i0io19nh?=
 =?us-ascii?Q?KaB0zO6vxZp8uIhCgSSPfz+zXUmCosT8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB12089.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?c0gEbyeMN32Vzk/a58DLMsjsdfPhJb6iOE3SqjnTJ5nLsbiq3h1mQpPo/fxN?=
 =?us-ascii?Q?LtLKGhvCQrRQ4uegUkO2HjwKyTuOiisf40wL3JFETh6zYr2AHvC5sQ/J1Rfj?=
 =?us-ascii?Q?4Whpmj6US97xj3Yg1oEkBM5gXcyzW7S7xwBrjK+0dIAxaT6RASClpEk1LKDE?=
 =?us-ascii?Q?QgYaEfTjYaslC4F7CF9Mb4FGPxUmXQ4QOxdaj7B+ZicL8CE7cCWxNhTLFmYY?=
 =?us-ascii?Q?D6Vi+aCipRcG92jNRHGHasQFbtaMXEgnwQnCfvxRUSkacEaTiLHwcWfV1tP3?=
 =?us-ascii?Q?L139FF1h0a+KjHzys912jVCdgbsitwbXx3ZOJrr3atiSJQO1S/1J14SeVxJh?=
 =?us-ascii?Q?wEdPO3i7K3baaYlQcO/e4A+HV4uTC0I8dXAgidhvdFwRoys8cKs8hlIThIEv?=
 =?us-ascii?Q?bGsnBN7QjzQdlwvTvGuoN9T5G4WV2r3d2Ay7qZrJmD6dqLCQ8I3JY6pZp3IG?=
 =?us-ascii?Q?gYX2a9Vl6AkyAtIW2fvyinI/hHMke2VFxx2nLBA9ToKJfArg8gFkLqwHL5Gp?=
 =?us-ascii?Q?2xRsvq9/benUuTc8JVx0iALOIk6vjrN1NXarBVz/y09UXW0HJCGa0BIRmDum?=
 =?us-ascii?Q?N4KAiSxN0EXJdxjFhez8nKRFHK1Q3H222FUcJXC33bI4SgGlP6ToGaY7tw0C?=
 =?us-ascii?Q?5W5kuX+IMiH8kxnv59K+CaeCNMTNG0IkXSqzZbPgqFKs5WV9gqXr7bAyKZcC?=
 =?us-ascii?Q?6DAzZqg25uirdLtGDhrE5eY4JscY3nbHb+9RsisepDG7i/tZ3PcXk3yqXNOU?=
 =?us-ascii?Q?GT0beogudyCagA2EfgNySJE17JI3QO5l538m2ERRmsue6sV9IptnyARG/Q+d?=
 =?us-ascii?Q?STRZAQ1kPBDa0tDzSHoiAw8H8OGVbRgXma3zmOPnbFAvs+5ftTCPnBQY0eyy?=
 =?us-ascii?Q?MU4p1PpPRpwi4gUe1Zg8sdfFIvHQS+ELrh5B/ucPs6Ncww1qaJseTATC+PAm?=
 =?us-ascii?Q?12FdDfqmYQ9JeaiJCFW1tgIc0WFHseHAajeqxjX3+8BGL3kyPdzBSqmZT6Q9?=
 =?us-ascii?Q?NAY9IqnqvY+Apm3J1+uu0B1vAwQFknrBbzrpTTstTlqXufb+3mxQNdIu1gdI?=
 =?us-ascii?Q?3yXv7H1ehK1npx3/ozo73yHxXpX+wIYzD/yTbScJg6St+58hD/kvj7lL4c1d?=
 =?us-ascii?Q?pU+wTFvVeR0/io6t2mfOolK/8rb/7P076buIHwt71DXBBCx6Gtxc4Yvgmyaz?=
 =?us-ascii?Q?VyPIx0iToZlNNPTk7rFjI46vI3SREeWfkGyRw+9SVNThkDixFlwoKKaOaxfh?=
 =?us-ascii?Q?Hb9NBpN88nJeciOamd9SZRHyRaE+QLXA8pkDWbg1juQqmxWcDwSYsfy6lhJ3?=
 =?us-ascii?Q?XEjuGxNeTEUc2cBdm4a5yeD+nB/1jbOfw3/7W5vhDMowPp4bqn6chs39YY5d?=
 =?us-ascii?Q?su/4xU0D9+RDGFkwhHhK9eDq51/MsZx0ym+8ax53Di0LvwWDBOHbGO1I5isU?=
 =?us-ascii?Q?I46FEPD1jmjWUgup8wKs8z4A5TSbgdbiHPDQz1trEvVI7DyU44JTDmIOHjMz?=
 =?us-ascii?Q?gclcHDA/gqiJyIDtzpcoHIDUIoYVqripTAQbL8Wpr9P/HIW27lX/BoT8I00J?=
 =?us-ascii?Q?junpZa3fYHFkg95207YBDA5HrhSB5bj+IyJYDh9OYIvRLKwzNb5PAjPmzfgn?=
 =?us-ascii?Q?vg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB12089.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ecc832-ddcb-4193-acd0-08dd7134a531
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 15:48:27.9903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9n6GrKNJ1M4Bu1Nna056i3IyOzdmXwiQGt7t9W51dL2rm7mjGPvb165dnLiQ2MODtkFTJoKkmLYPRkTPGKLZ+P1FLBWOzGu9UkhQsWuqtyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11045

> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Sent: 29 March 2025 14:37
> Subject: [PATCH] i2c: rzv2m: Constify struct i2c_algorithm
>=20
> 'struct i2c_algorithm' is not modified in this driver.
>=20
> Constifying this structure moves some data to a read-only section, so
> increase overall security, especially when the structure holds some
> function pointers.
>=20
> On a x86_64, with allmodconfig, as an example:
> Before:
> =3D=3D=3D=3D=3D=3D
>    text	   data	    bss	    dec	    hex	filename
>   11027	    646	     16	  11689	   2da9	drivers/i2c/busses/i2c-rzv2m.o
>=20
> After:
> =3D=3D=3D=3D=3D
>    text	   data	    bss	    dec	    hex	filename
>   11107	    566	     16	  11689	   2da9	drivers/i2c/busses/i2c-rzv2m.o
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
> Compile tested-only.
> ---
>  drivers/i2c/busses/i2c-rzv2m.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-rzv2m.c b/drivers/i2c/busses/i2c-rzv2=
m.c
> index 53762cc56d28..b0e9c0b62429 100644
> --- a/drivers/i2c/busses/i2c-rzv2m.c
> +++ b/drivers/i2c/busses/i2c-rzv2m.c
> @@ -402,7 +402,7 @@ static const struct i2c_adapter_quirks rzv2m_i2c_quir=
ks =3D {
>  	.flags =3D I2C_AQ_NO_ZERO_LEN,
>  };
>=20
> -static struct i2c_algorithm rzv2m_i2c_algo =3D {
> +static const struct i2c_algorithm rzv2m_i2c_algo =3D {
>  	.xfer =3D rzv2m_i2c_xfer,
>  	.functionality =3D rzv2m_i2c_func,
>  };
> --
> 2.49.0


