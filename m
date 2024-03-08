Return-Path: <linux-i2c+bounces-2297-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ABC876A0C
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 18:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 030111C2130C
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 17:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B530340873;
	Fri,  8 Mar 2024 17:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="f8hRn8W1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C29568A;
	Fri,  8 Mar 2024 17:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709919409; cv=fail; b=eABZPGnC/Mc9mXotDBtns9E17jF4WPFUfeKBMQEFWDoT1Hli01j6BS5ky0AGs+2XMmaIQVKwgVhVZbmrZY3UprEZt3M8CafAnV5vOyAu/Pg9MsQPpo0OHUNFczvD4EImWMX7wjSFAzSuiNwC5mGhq9uBp0U83gOEbnbV1eB7cJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709919409; c=relaxed/simple;
	bh=zx6tIALMf10UtvePPGLTJEsJZPJXeTOTknl63MYvWPQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NEuQZIPglvBFsB55hVZU9D0tfRLEdtb/kVyXM30otGYAly3uo1vMQMwICDlyNAuas5UifyeV/jQuMkJ8KP8hxOn1RwNzQuTsE436z/76Biyys0KWsMFWWsdlEAsHa8EkH4Eg52X18JfrZc7gMXC7v9jO/5SuN/YDC3o+214pZP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=f8hRn8W1; arc=fail smtp.client-ip=52.101.229.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToNNOVzdmth225oY5yIe5Fceoq+znDFFysNMYorZReRCQu6zGkBI4ULZXh+wqkrX0MdaJoAH6fWzeWCmKCniPJw00PhDTuxP8wL0D6gyMWbsdLEP/2KAqtY0W3sTyMdLWxYjyGW25KtX9Esufq3ooHT3Xj+Zug9gxnUMYrOMjjZssDpBLm/FxSyjdI4h3w/4QnNXHh4Id0PeZEuIqP1JbA4bhnMko4P2TtNoRTtsGaXE9aMniZtsVQvtKenKQd89OlARyO34KFJ+Vumaltx6BjabqJXqDzqWKomVKGbx4eWuzalp0Kkkp6zwn/g4vdH+W3zWdHFa0xzwEo2NQ0Ekqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MLo2gvnWifgTmm4HevldVU/SMBLcGmyUaQtJkx7BEM=;
 b=mRauAl1cgKyuV43KtW9v0j4U5ksAaErXg7Sj1Vt6Z9WlbttyP5k3x4IqyKuV+FtoAx/E83Jl+5HKkKhiQvFcP8ZDLRIBVirCffQke2okmkLTSR8rmHl9Gz4IYk0y+fgXYwl/an1hlBI550pbf8Qe7edMA468NaCQiqz5APSTjfSWhzTpRufqlXIQR01JdO0Dzw84mnRkFkSfkmEcwucBJb8b4M6zP+yfLtXUUR3xbbYTwWM/UZjgY4yhWEqUlhCGvLhG4cuae3ICXUTlD9hDCYpLD4QEEUHRXo4mXOw8UnpXRRaR+OP+J3pEyUsTZvZYPpO2LOA6OR6zgJ6gc0Zm8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4MLo2gvnWifgTmm4HevldVU/SMBLcGmyUaQtJkx7BEM=;
 b=f8hRn8W1xuulsJqKAJ8ZeYx5Ww9s9GUABZ3pDL1x+juaTTmIZEA+Iof0LHP4SLuEF8Y+0nNkCJXwDgvwKBDpEyRqOwYcVC2TERo6ZpG9FUB2J1r4+aMMjk1CIA1NjQ5T5nycGj0VpJl4g8KE7Rkfv6mZ7rZAe3XTndpEWbwOLEo=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by OS3PR01MB6167.jpnprd01.prod.outlook.com (2603:1096:604:d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.31; Fri, 8 Mar
 2024 17:36:41 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b%7]) with mapi id 15.20.7362.024; Fri, 8 Mar 2024
 17:36:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Chris Brandt <Chris.Brandt@renesas.com>, Andi
 Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 4/5] i2c: riic: Pass register offsets and chip details as
 OF data
Thread-Topic: [PATCH 4/5] i2c: riic: Pass register offsets and chip details as
 OF data
Thread-Index: AQHacX4tmFc1CI8ipE+h03wpRb2Q9LEuGoKg
Date: Fri, 8 Mar 2024 17:36:32 +0000
Message-ID:
 <OSAPR01MB1587CFE774834B31820E7D5486272@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240308172726.225357-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240308172726.225357-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|OS3PR01MB6167:EE_
x-ms-office365-filtering-correlation-id: f16e81a0-5e3d-49fb-3837-08dc3f964b9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 WAHZqhOFxK4qV12Nb58gnANhgldOWifpl1Mv4f3KMSihoQ3BHkSRESTNYrYirs2qHZYPjB2sE8YTNgH9GwM4iWIopXTDbg+6Rpe8J5uq4qJfb9y60yfEJVBHLczxE7ZQpwW5uOwuvkxrqi/8kUEDcXOuL14QIWRLLGV/y7h7LKv5xe7c7IcwrsM3+/YHx9dioBqxtSm0siWf4vbytd9fEW3eVEBHaMHOdzfeifWjQpWn+1Rh4fyF7TxwSHyc//fykzbTOOZ285JOYQDqY9Tk/JGiLpeuz1NucGxw1zvraWZfRRI66l7IquGFdstcM7yD4wYiVmTPumF2oNVddAS0PntHdb3Yij+3VoJgPhAdlDS2GP3DkEF7yQMm5Ni4quRTVSi8TpRtJABe+fC7+N6smbpL0RvNvLy3ZejRIS9gFGUIU7rOz2VFT8C9l9NMRP8ESAV0kQQM/uvqaqJe5FuLRPWODHH5JcLleJAmDL0kpC/vvbXK0ASYb7HyQe8EO9onSjdLXvkAa7W0Ofn90lKpBzuN1qKNE86seA22zKKDTY0iULPrbX3o+xRP9ZGleDyIMwRNQZ4rpKzRYM+kSgcm0UbLfOv6rjr9rKs537Eehiniz0DiT3Oroo0J2m1n7YHQbm4fo/tRArLwzzWMNNTyUgVaCpasj77y6WksKwBNoYJVUNpeP+i6I8dbvmGn2YF2rkWXCxo53DLBZsK05PD2PfoPFRdKPsMqNW563iHCx6Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tuBDkR2bH1/jcdac4j77ZrP/SvMY6g4KpqrACXXxHO14Wdsv817j5+bOYNm6?=
 =?us-ascii?Q?mZw7D2gqkrAMZsGKzlmTtFbzrf58ss7KUsJnDzr1TBE8O1E9APve+yjCtCyK?=
 =?us-ascii?Q?Zb2ztttdBPGCcWaJcILFWItOQHiFi2jAaVxk7g8LK87Bu99UZ4gwFKh9qFzQ?=
 =?us-ascii?Q?0kylAxFYjNruPq3a3JC7lbbuUQY8OpxYNzUytHRcwTBWjd33xzL8g35fl49R?=
 =?us-ascii?Q?c59fc396red+NtGdloq7plZjB6+7XSssr/5yMkTMym4PEyLsdXjg9D+t1aKd?=
 =?us-ascii?Q?b0CuW/qrrIrDPSdOXjK2aqLlA7H98CZgEj5ot6IdpuZnX29OYgAeAmgqwViR?=
 =?us-ascii?Q?ET2hF7A2uNS9lkf3JnTMww7V2WIUSSbzzyBXvJFrOAHJT2ZLcC4339YF99De?=
 =?us-ascii?Q?4EQWXotoIVxRIVCTDH/l/WhAEwKxlstByXbyuZ19/Ez7azQgfZCg30266zLp?=
 =?us-ascii?Q?MWRWU+pwbEl2TjFbMrQZcQa9iavjJYE5vpFDxQ5SyhTLVpvG0bmoJAeE2UXR?=
 =?us-ascii?Q?4r/H+ey9CUqcSTW+cj8Ghp9BMzaX8GmgEqWcw7WebH2y+JSJ8gm7RJWxrW3c?=
 =?us-ascii?Q?Y/JQRaBM+2UntIpBum5uNWjkelzHzL3k9PnMcCiL7r5euuGieqvps+h8BdBc?=
 =?us-ascii?Q?Jp3EuYH2GayVKV/G7rqNi2m4FVxMxlvFO2VcL3+312YcV1m584xhjcAGoF4p?=
 =?us-ascii?Q?BtmaBku/XBpoguK4ZOQz77DiBwaWKl1QeQ3k25Va2bWwoQCu3YxxLHQX6rip?=
 =?us-ascii?Q?97MOXo+zYQc7XEXZy9MABhQDyNnX/i+DT7G8lz4Wbwm9hATKg91PNrVbuTQm?=
 =?us-ascii?Q?iboEQ2tMj+ha7CiDC9BnsNJybgyspZeuFLryLxOu6Cj6pz2U/fj0/OwZkQ5r?=
 =?us-ascii?Q?GQ7CNZu134kZ6WFshlC/D5pctsFkxEupJZ5TY/K3klL3B16NbBEh83F9weAA?=
 =?us-ascii?Q?jj50Uj0dgOcUWEN7LtCb+oNDdEOEI+S5U8/D5z9YpV3P9TfU04+SVjyV6ZRW?=
 =?us-ascii?Q?0SzM2Ydw//HZ/mAj9sU4pUReZPdhZBDtaz/dYYQ0LFOdKt+bdPRhk9XMk2/D?=
 =?us-ascii?Q?WKaMptUSSp4UXm58BRYfDpIY6pbL2YyfA1U+CoPZjUBRrQXFkSISzDTcjCEC?=
 =?us-ascii?Q?BcYsS12qH+2hNb1N2rrzNQAq7x7anEDn4w43k0/OIznEbzoYI9EJhnEFA9d2?=
 =?us-ascii?Q?NRccsrCgOwNNTtNSiLnLZaROaIuwHsLt5K9V5V0i1XAnC/Zt0avf3gTuSK3p?=
 =?us-ascii?Q?Z88tnqsRozXB7FCEvHlwBn+hHhB3DfXqwZCQ+UNjSxrHMxo3QlE3g480io4x?=
 =?us-ascii?Q?DsfE19+BSchaJ8wbp62gVokWzZTS80ivwwHlHb3GVthfBm4XFRS9zqHyKWl+?=
 =?us-ascii?Q?qQGq+Jwm7eIzluxmc77Ujj6YXcvBNx/rnOLdTNhzWc7J5Y3W6NvUlRRBPoxy?=
 =?us-ascii?Q?3NYV/zeqoY2La1tD2AkEHqdYUFCWaX7LDxkKXyKCThL0/ZyhhwTzGx7cpEyi?=
 =?us-ascii?Q?+U03Y3G/2EUUl7tkCc0gzWfmDwhuGvD7iNzH/0Td15OXige1LkIaHR5UIg26?=
 =?us-ascii?Q?FQBig0AQgWyNBUi8e1r2kF8ZlFz9oJpxCPnwyDNlFG6u+RNnY747Di+Mnvyl?=
 =?us-ascii?Q?5A=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB1587.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f16e81a0-5e3d-49fb-3837-08dc3f964b9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 17:36:32.5504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gc6WWXUQNubB4HGZDdbTbPrjFUM8Qso2T9RKPXk5Punbsv+ivh0s3nsF9kvyFuCYo2abW4b4SWt8vb6fR5VW/Vsi8G/K2XJdNYizrdke4vo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6167

Hi Prabhakar,

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: Friday, March 8, 2024 5:27 PM
> Subject: [PATCH 4/5] i2c: riic: Pass register offsets and chip details as=
 OF data
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> With an increasing number of SoCs reusing this driver, each with slight v=
ariations in the RIIC IP, it
> becomes necessary to support passing these details as OF data. This appro=
ach simplifies the extension
> of the driver for other SoCs.
>=20
> This patch lays the groundwork for adding support for the Renesas RZ/V2H =
SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  drivers/i2c/busses/i2c-riic.c | 59 ++++++++++++++++++++++++++---------
>  1 file changed, 44 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.=
c index
> 49a12f1ecdf9..3398d639b754 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -46,18 +46,6 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>=20
> -#define RIIC_ICCR1	0x00
> -#define RIIC_ICCR2	0x04
> -#define RIIC_ICMR1	0x08
> -#define RIIC_ICMR3	0x10
> -#define RIIC_ICSER	0x18
> -#define RIIC_ICIER	0x1c
> -#define RIIC_ICSR2	0x24
> -#define RIIC_ICBRL	0x34
> -#define RIIC_ICBRH	0x38
> -#define RIIC_ICDRT	0x3c
> -#define RIIC_ICDRR	0x40
> -
>  #define ICCR1_ICE	0x80
>  #define ICCR1_IICRST	0x40
>  #define ICCR1_SOWP	0x10
> @@ -87,6 +75,13 @@
>=20
>  #define RIIC_INIT_MSG	-1
>=20
> +#define RIIC_RZ_A_TYPE	0

> +
> +struct riic_of_data {
> +	u8 family;

Do you need family as compatible have this information?

> +	u8 regs[];
> +};
> +
>  struct riic_dev {
>  	void __iomem *base;
>  	u8 *buf;
> @@ -94,6 +89,7 @@ struct riic_dev {
>  	int bytes_left;
>  	int err;
>  	int is_last;
> +	const struct riic_of_data *info;
>  	struct completion msg_done;
>  	struct i2c_adapter adapter;
>  	struct clk *clk;
> @@ -105,14 +101,28 @@ struct riic_irq_desc {
>  	char *name;
>  };
>=20
> +enum riic_reg_list {
> +	RIIC_ICCR1 =3D 0,
> +	RIIC_ICCR2,
> +	RIIC_ICMR1,
> +	RIIC_ICMR3,
> +	RIIC_ICSER,
> +	RIIC_ICIER,
> +	RIIC_ICSR2,
> +	RIIC_ICBRL,
> +	RIIC_ICBRH,
> +	RIIC_ICDRT,
> +	RIIC_ICDRR,
> +};
> +
>  static inline void riic_writeb_reg(u8 val, struct riic_dev *riic, u8 off=
set)  {
> -	writeb(val, riic->base + offset);
> +	writeb(val, riic->base + riic->info->regs[offset]);
>  }
>=20
>  static inline u8 riic_readb_reg(struct riic_dev *riic, u8 offset)  {
> -	return readb(riic->base + offset);
> +	return readb(riic->base + riic->info->regs[offset]);
>  }
>=20
>  static inline void riic_clear_set_bit(struct riic_dev *riic, u8 clear, u=
8 set, u8 reg) @@ -453,6
> +463,8 @@ static int riic_i2c_probe(struct platform_device *pdev)
>  		}
>  	}
>=20
> +	riic->info =3D of_device_get_match_data(&pdev->dev);
> +
>  	adap =3D &riic->adapter;
>  	i2c_set_adapdata(adap, riic);
>  	strscpy(adap->name, "Renesas RIIC adapter", sizeof(adap->name)); @@ -49=
7,8 +509,25 @@ static void
> riic_i2c_remove(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
>=20
> +static const struct riic_of_data riic_rz_a_info =3D {
> +	.family =3D RIIC_RZ_A_TYPE,
> +	.regs =3D {
> +		[RIIC_ICCR1] =3D 0x00,
> +		[RIIC_ICCR2] =3D 0x04,
> +		[RIIC_ICMR1] =3D 0x08,
> +		[RIIC_ICMR3] =3D 0x10,
> +		[RIIC_ICSER] =3D 0x18,
> +		[RIIC_ICIER] =3D 0x1c,
> +		[RIIC_ICSR2] =3D 0x24,
> +		[RIIC_ICBRL] =3D 0x34,
> +		[RIIC_ICBRH] =3D 0x38,
> +		[RIIC_ICDRT] =3D 0x3c,
> +		[RIIC_ICDRR] =3D 0x40,
> +	},
> +};
> +
>  static const struct of_device_id riic_i2c_dt_ids[] =3D {
> -	{ .compatible =3D "renesas,riic-rz", },
> +	{ .compatible =3D "renesas,riic-rz", .data =3D &riic_rz_a_info },
>  	{ /* Sentinel */ },
>  };
>=20
> --
> 2.34.1
>=20


