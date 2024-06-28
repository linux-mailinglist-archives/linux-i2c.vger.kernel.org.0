Return-Path: <linux-i2c+bounces-4435-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE02091B698
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 08:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36F631F24511
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 06:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7718447A60;
	Fri, 28 Jun 2024 05:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DcaqMxL1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2076.outbound.protection.outlook.com [40.107.114.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDA146544;
	Fri, 28 Jun 2024 05:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719554397; cv=fail; b=FhBVrJCpv5srb7ZWOz1jpEc/Pw4cE9GqAYp/i3+uMCyobNVotcGbBTo6botQE5RrLA/EUIPqDokg28ma0M0Y1u6U4km+jdwvd7Fm7nggFfMwFf54hfzafd/I4N7Fqe2tmxozuZkzAPEGLSySThFuYzBYge6xGbA4qFEPVaHc4G0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719554397; c=relaxed/simple;
	bh=rjomhyUmZ9xaTredfmkJONqTjzHfm4pLvALDsp9yZ/o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q+xbMwIoe59N4wkULIVXppPRUpeDN4Uv5F2HGY+l80yzZ+JtF75Q/4wy3bG+yZO0vzoRNhuF9kWcNFMuO3iI4oXgOXLeZR0pxaxwl49yISwe4j/6yQ4HGkMCwBoD4LoFB5i8wLwzD5C09qOIBpGXm88iCaYy0leysmu+ChU2bYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DcaqMxL1; arc=fail smtp.client-ip=40.107.114.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWfDXnKywLtzeH3XkVkpbw5dOB8PxaB2Xk7ZhMoirtKZhtMYOYVVcd5YjmtKKGVbxsVJynUDqZEMprtqouxMZjlUS8OgEswisCeuuXxssTv+r/nbxLXr86nxSC3S0rsoVcgnC/bQfbZ0g7dR0PJ2s7y6wyV1D+c4XosH2Gg0MYKrHFVhgjD/AoSA2cbgyKA/SGR+q44mPavxY+u/heANGiaUCS6yfFT+QLVXphQHfMaQmPm7fGog75WAXXs46pCZuP6GMzldProuf8ZZSA4zkV4gHJiI8cnuCXW6cozaIz7tJmP6RV5G6qFcEhErlkqx0XiHncOkCBVLqGbhmVJJZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1I1JH2XPdPXmvlSNlaCN2aqzPsz39w9f55mEpTsCGrM=;
 b=XgHvXBLgaJ5JL9V1dev2t4SJLRmq2J1cUTEAMEOGUb5UMwEzI0Y1rSmaV14RTr6D96kIpM9V2iq+RWJDoWtXcoVrKcDT/2tS2V6YCT9Kkxh5hZHw2+vfAjrFI0YOL9E4R4D5MDxQT8ustngbWOGyib6/fr5vkW9sMiZEmRch+4TOTuCh0k8MTdVsmwllVgzBJcB4gnQzwR3IlIt+pr7RXXSvWcBaoZFleVr9OwQOCWE39P9fEMGGOwvjPpdcTuIg+Oz8xCzJ5i0+VlUbGykKy+N2JIGAJiUJS+YwX1+WsTiQBe1VxRFoBf7JKVysdUCFC09AiiFxaZE89gfQvT32FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1I1JH2XPdPXmvlSNlaCN2aqzPsz39w9f55mEpTsCGrM=;
 b=DcaqMxL1rxmlFtV3zGaNLwedcpBtfJjl5qOWTy8Kz3K8R5qO/zsQQhjS4P2tyF7XiBy0JuQntHae9Ry3f2nkHDoe5vzBUZ8hZm7byzN3zp7KH5SxAGySfiKECdNWlmTHfSVL/sY++8plBr8NxaKM67AsTXzoDTQg/claWV3U3fw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB6842.jpnprd01.prod.outlook.com (2603:1096:400:d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 05:59:45 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 05:59:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Chris Brandt
	<Chris.Brandt@renesas.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "wsa+renesas@sang-engineering.com"
	<wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
Thread-Topic: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
Thread-Index: AQHaxvl1VmkioavocEOGYVCwgbbtfLHcsPSA
Date: Fri, 28 Jun 2024 05:59:45 +0000
Message-ID:
 <TY3PR01MB11346EF9A001F68162148B70F86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-8-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240625121358.590547-8-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB6842:EE_
x-ms-office365-filtering-correlation-id: 47f7e931-b840-41f8-504f-08dc973782c8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Ad0hc/wTTohz8BvqiwcaS3tXgIaab21scSPtEPSyXwU0/hDLOpPDQpD3maew?=
 =?us-ascii?Q?PGuOGfYbMleTueAJR+7RI7QZcOImn89qVKIcoKrKbVLYjRn9/QqSek3MU7CV?=
 =?us-ascii?Q?t4PFonC3leIUWXztC6BytNirbypI+ZweYtNWxTFcG0jnyvIB9HELvuURtNfP?=
 =?us-ascii?Q?EE9TIJbcNk1kvTYwVmc8xskPBuveYtvgsW76P6WmKo+ps08+SYP2kC0KIFHq?=
 =?us-ascii?Q?FrSrS6lBDzsnvm9eWZE0jlvHj9O3GnKUG8qMC/lOHww1pvWHSwNHcyRCi6O/?=
 =?us-ascii?Q?GBLTsq4HKSpIai6N7LPFGhMPVGpJoOSplkPxIjLbip2/Mp1K/Wyfe1gqPB3d?=
 =?us-ascii?Q?Lvl8JGPCntZPVq7+LrS+O5ao7kFXJC+3PP3vi9QFlzGwYmvF6UshYhbUBome?=
 =?us-ascii?Q?8nwW22kH+ZuJCxpQ/8UwOYBOSC+glcoSLV5McNL/KFDJeyOaCNq957Fihurx?=
 =?us-ascii?Q?BnEWmffpJ5lDl6U1uQqkXHUO+/tQqVSi+vCFEwfSGkl0wdsqgAdmYgNZeRpG?=
 =?us-ascii?Q?wKO2QRl5SDGOkZT6iPgU5tXXdNjDxv6myb1dn+0cLI82vXqcPVURIYS+CXO6?=
 =?us-ascii?Q?ST64uzud/5M1o3VeIUNo8Mi9vmpNDiVzYtcew0fO7oe8Pk+hrvM33Kc4H2R0?=
 =?us-ascii?Q?MDxAWwqA4XdHpYv7QljlUY97oVxzoAljX9HLXTv2AxPgg8zQFTl15a3D2QzV?=
 =?us-ascii?Q?Gu3Q3Bnb9tTQ6kmiFZU900oecAQ4aelzqEAqx3otDUM+d7rixlEF5+WBfhG/?=
 =?us-ascii?Q?HbFJLJ/APhGvqh29dZqTrvHs2b6BYQQysywWyJjgpDo09DF1cvsUeHKAjseZ?=
 =?us-ascii?Q?SCeHNhgGN6ssHXeD6OdPj/0EHcXRV6qIB63jZii+IiCXSp6p0Rxa2LzsDVwq?=
 =?us-ascii?Q?bwdWRqDAhevQAPpYsKKx3H7Nw3gksVnlMPY2H34S1RTv3UiHTb4SqGgN+aR9?=
 =?us-ascii?Q?GpZIg7wXMtl6/yprs8ufcm04mGqdLw0+CSFbuOyBTNF519PZyzktAM8vQOlb?=
 =?us-ascii?Q?XU5nxlS1yP9G3EXa3+KwPpp/5QyW3y76mjC0LrNg95bgpkA8wT8OrCGglrSM?=
 =?us-ascii?Q?ce2UIudBB76RQftuppaD4tnTScqC45chL0b/SI4O86DNOXVsB36YVeExy4FO?=
 =?us-ascii?Q?TbfGNTQ2RhuDVoPkJHo0iw9vn38Y/M4/wo+xXefKaa7lR6uj8F/UIUnRcVtC?=
 =?us-ascii?Q?hc+ybU5XwjjTD64HcVcMTgkKI/8LoO43+/p8zqMMzjC5zXnYNK2wIP4oWX/V?=
 =?us-ascii?Q?3EbQr8q6nEb0KkOKuth6Eqw/HeeMpKohxPRQTmbllv8PqZGTp4rW9qVs6MAE?=
 =?us-ascii?Q?ijZ0Hx5JyV/M++73CVCiuex/CTRhtOrFki1xaeAwW6VfqqOdoE8Du5lmRXLG?=
 =?us-ascii?Q?gHpeEynvbjknw9Zn+446LviNPv4C0jBjSM4G6P9YXxJkwI0TFiHjhCLi2q7Z?=
 =?us-ascii?Q?BfFjZB7/UpM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BOgG/LSnEoPfY3SNOP7eyHjJGEzPM+Dkh5xSs/7zLQBmuVaW2JLtQ58ZEepD?=
 =?us-ascii?Q?UF3Vj9xz8Zk+Vm7U9S4E6ZooCIlxvntEVsmS9eld1aJKFlKvUmG8dKtGzQMX?=
 =?us-ascii?Q?+kY98+U5ZY4kOVDuQBG6whAU5QJzDDtv1De/X1yTxFJnQ9PMj1TPVq5sGyE9?=
 =?us-ascii?Q?2CX5hs5NZiwEN0L7mZtX6N9wA/s/9JdKJ7wGs9NmI6lJ5xbFkif8ofZek8lN?=
 =?us-ascii?Q?COQ66oTs4mQuH28frSsLZbKOnvNU1UHK0nsGzbSyeJ/ycnxefsDYO0FSzCQh?=
 =?us-ascii?Q?gif0SDJDEAO4PbvmofJqjhd66aPIUIuFRCiaCBC2sHl2Igwi7Vh5f03DgU11?=
 =?us-ascii?Q?n1dJ0OfNnqtDqpEYecFt7YLJl+9CIRpEF0cgKtj0BKQlij/GO1ZlJS85rl3M?=
 =?us-ascii?Q?5vk7yzNaKO03TqnaHJBqZlS3kC40OMdlA6eH7U2QRDEe5aRqL5zLmEKz6yZp?=
 =?us-ascii?Q?TcblPTRv1gDWoJ2N7CHMFTA84OnRyWsal42hHJOyyd0CG05AQ1IFL7q0PNZU?=
 =?us-ascii?Q?1Kc5wu80pjN26HaCeuDfzmzTszP8q3q4HCv1c2ZkAHNIcdwEc1Jp/BfUPnJK?=
 =?us-ascii?Q?u8nEQikQG1OB4ZPdkp0ryR5n51ssECweyI8nhSqA/XXCHS7vQezw+xDPr3XU?=
 =?us-ascii?Q?Yc3fhHEH7vJGARkEAgNjhMxLK54hySqVa5wEQFX2x0hwm6lapI+PuBzmogNT?=
 =?us-ascii?Q?nXdZOTPlprvHgpn7T+gf8q56dZ6dMR3qle6QjfA0epir31jM61EWgLN0oz4t?=
 =?us-ascii?Q?tg1TW6VAaI6DXOuZi6IatWDQr24uLKfDwVzNEysGik6PtcVJpCZGwvawSgg/?=
 =?us-ascii?Q?6KKqIkTIY2C9302+qd8a0PZTmpBJwHaMOaFWZlEa1Ptzmhrw6CbNoWpTHpQr?=
 =?us-ascii?Q?tprdif1DjbZjxCaNeEsrqhR+O1Aj8NTgNkiA4h83CHdQEo1/jc4w0GLe+ibX?=
 =?us-ascii?Q?0QrTLinrgxvjJrehr6k6LUDtzCAwIKUjwhYkihRHrC3G4OtpMda3SyuKjAss?=
 =?us-ascii?Q?iLxvZSkpHsWP6wfrrHblaG+PEr+mBBnxUq+ihwdKlj0mtYCp98MlSXMCbl98?=
 =?us-ascii?Q?sP+0H2qBkzAAuuDcSQ99Pn2H3T8hxL81SAp9gaL8tSuk49lZ4rI1OIA6UQ6G?=
 =?us-ascii?Q?piK50CRWsb2gumQ6eEr4XGkfuJpN6VMTm86c9WvF+b2jiQxEVQrc+DvAR5G8?=
 =?us-ascii?Q?33yVh6TE2FtFeXKB4LbSDqL49UTr5XY3BM4TUYLyq24GF81EFePmFnMfApnf?=
 =?us-ascii?Q?UxN0TZMDKKI3NrR9wR/GaEzcty/+dqqyT/MZmdHi4i6ZaYDZV05F7MenI+j0?=
 =?us-ascii?Q?F+cuC0Ucw5knsCdPziF1QSpf6KXsX/cpfvXoZ8x+pi1h4QV1vhIqaaUh8JqS?=
 =?us-ascii?Q?aYoRu9K1sxndExejNAIQGdjgBiMtBuHJMKH+o6FWrTEqcbmKV4qGzSFz29uC?=
 =?us-ascii?Q?+rBjdDU3nKPzjK/Ksi6PcYyP/IrHYPv6PfmByQNp9kfxfUPQv9B9ocE8KYzC?=
 =?us-ascii?Q?uXF6pwGbS99XOHGC/bftKM+lhXEPviNstqd3py90EiHHkzRX68Ywcyqy4vvW?=
 =?us-ascii?Q?4aHpNifpbFOL1KKI2Glo8yQidiFcMHmVx+ep2AHC?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f7e931-b840-41f8-504f-08dc973782c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 05:59:45.2481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w6fZNG8gNnSxstCrBlJYemofvEPTKA5pZHW2RGkHEE8LrNLmmaqFc8tXQU6jRXu1sOk8ZhuBwveMJHwvtqYeVDgMBSGv8RD/J+vhrH8psbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6842

Hi Claudiu,

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: Tuesday, June 25, 2024 1:14 PM
> Subject: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe=
 the register offsets
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Define individual arrays to describe the register offsets. In this way we=
 can describe different IP
> variants that share the same register offsets but have differences in oth=
er characteristics. Commit
> prepares for the addition of fast mode plus.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>=20
> Changes in v2:
> - none
>=20
>  drivers/i2c/busses/i2c-riic.c | 58 +++++++++++++++++++----------------
>  1 file changed, 31 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.=
c index
> 9fe007609076..8ffbead95492 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -91,7 +91,7 @@ enum riic_reg_list {
>  };
>=20
>  struct riic_of_data {
> -	u8 regs[RIIC_REG_END];
> +	const u8 *regs;


Since you are touching this part, can we drop struct and
Use u8* as device_data instead?

ie, replace const struct riic_of_data *info->const u8 *regs in struct riic_=
dev
and use .data =3D riic_rz_xx_regs in of_match_table?

Cheers,
Biju
>  };
>=20
>  struct riic_dev {
> @@ -531,36 +531,40 @@ static void riic_i2c_remove(struct platform_device =
*pdev)
>  	pm_runtime_dont_use_autosuspend(dev);
>  }
>=20
> +static const u8 riic_rz_a_regs[RIIC_REG_END] =3D {
> +	[RIIC_ICCR1] =3D 0x00,
> +	[RIIC_ICCR2] =3D 0x04,
> +	[RIIC_ICMR1] =3D 0x08,
> +	[RIIC_ICMR3] =3D 0x10,
> +	[RIIC_ICSER] =3D 0x18,
> +	[RIIC_ICIER] =3D 0x1c,
> +	[RIIC_ICSR2] =3D 0x24,
> +	[RIIC_ICBRL] =3D 0x34,
> +	[RIIC_ICBRH] =3D 0x38,
> +	[RIIC_ICDRT] =3D 0x3c,
> +	[RIIC_ICDRR] =3D 0x40,
> +};
> +
>  static const struct riic_of_data riic_rz_a_info =3D {
> -	.regs =3D {
> -		[RIIC_ICCR1] =3D 0x00,
> -		[RIIC_ICCR2] =3D 0x04,
> -		[RIIC_ICMR1] =3D 0x08,
> -		[RIIC_ICMR3] =3D 0x10,
> -		[RIIC_ICSER] =3D 0x18,
> -		[RIIC_ICIER] =3D 0x1c,
> -		[RIIC_ICSR2] =3D 0x24,
> -		[RIIC_ICBRL] =3D 0x34,
> -		[RIIC_ICBRH] =3D 0x38,
> -		[RIIC_ICDRT] =3D 0x3c,
> -		[RIIC_ICDRR] =3D 0x40,
> -	},
> +	.regs =3D riic_rz_a_regs,
> +};
> +
> +static const u8 riic_rz_v2h_regs[RIIC_REG_END] =3D {
> +	[RIIC_ICCR1] =3D 0x00,
> +	[RIIC_ICCR2] =3D 0x01,
> +	[RIIC_ICMR1] =3D 0x02,
> +	[RIIC_ICMR3] =3D 0x04,
> +	[RIIC_ICSER] =3D 0x06,
> +	[RIIC_ICIER] =3D 0x07,
> +	[RIIC_ICSR2] =3D 0x09,
> +	[RIIC_ICBRL] =3D 0x10,
> +	[RIIC_ICBRH] =3D 0x11,
> +	[RIIC_ICDRT] =3D 0x12,
> +	[RIIC_ICDRR] =3D 0x13,
>  };
>=20
>  static const struct riic_of_data riic_rz_v2h_info =3D {
> -	.regs =3D {
> -		[RIIC_ICCR1] =3D 0x00,
> -		[RIIC_ICCR2] =3D 0x01,
> -		[RIIC_ICMR1] =3D 0x02,
> -		[RIIC_ICMR3] =3D 0x04,
> -		[RIIC_ICSER] =3D 0x06,
> -		[RIIC_ICIER] =3D 0x07,
> -		[RIIC_ICSR2] =3D 0x09,
> -		[RIIC_ICBRL] =3D 0x10,
> -		[RIIC_ICBRH] =3D 0x11,
> -		[RIIC_ICDRT] =3D 0x12,
> -		[RIIC_ICDRR] =3D 0x13,
> -	},
> +	.regs =3D riic_rz_v2h_regs,
>  };
>=20
>  static int riic_i2c_suspend(struct device *dev)
> --
> 2.39.2
>=20


