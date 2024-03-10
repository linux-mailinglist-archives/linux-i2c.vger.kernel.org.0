Return-Path: <linux-i2c+bounces-2312-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB968775B4
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Mar 2024 09:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04C4D1F21BE4
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Mar 2024 08:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBF713AF2;
	Sun, 10 Mar 2024 08:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Z19R8jgR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2053.outbound.protection.outlook.com [40.107.114.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E9A2566;
	Sun, 10 Mar 2024 08:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710057948; cv=fail; b=DpVP+C+Pcx9TZiXtP+RSt7W/MCx0BZHT69qCmY4qr1iuKIFAz3gOW5pp7j9Aec1IRrZH8dcR10/bE8OLnGGBOrQ2N7tzFlqp6EWZOhOuqT27TO/wIdsvKgUY5zK4qYu885sE2nHhNHmyQaZ0dfX06Zc+ZeKq0xArfaoeRNi+kyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710057948; c=relaxed/simple;
	bh=4YRJQAMspKQ02p9rF/KbwKf4jAmYZqkfdGE+8VI3Aqs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X7/HMo0zqDh9GNwWER8GfOIA4FTH4ECyG3f5FrkT7gDMH90ZG0LP8nzzZhCTHKxJkhNo/g/h6e73r6ELRA1N7QNWkht/ZqbAVuPTqABJy0TP3XqxN1GfNAZyQu9FyJ05PmVmkre64OBf19cRSYlfJIMajD5yTzHHVLrBlZCFuT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Z19R8jgR; arc=fail smtp.client-ip=40.107.114.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExwP58mn8RnOwQzn95Y7fpecsidnukjRadva2HxLvPUhU3oCGrRBLAsuAJCVCUSP8YBIAvsaPE5gq/upqrf7iDY+/tQSzQ+1oViw/pQPq1u8he3Xp/qEdERfmJJCtlqjuE9zK6su+VGlbFiFoJ6feKWF7ezuUAtWKD5/C6Oh0cWEjUUkNhEaclH1Q4AlPVjdZstQpx11rwQ7UejDcLdZdl+bxvnk54gix3DMr7+GbwN/7nhCut3HTX/+p2c2Ijl5iETomIPGtTj1rIaVzalPSzM3lvku2qwtfPP3RLMHJpPHHvXAxX4MMjc8EqeNaqQutUa7dGve1km7ds2XRCwanA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xaJL8Gxvm90axLGWD82gxr8DBHcVVvFi2pGg+NNp0c=;
 b=TvDzUOBs/+4l7RKDIqHua382gBloHAF9UzvO/dArNP0E5nR4CYujs6bpiM0JNHJ7Spow2k5p3F94a6FS/lE5CmSqui8PSzgNzQ1WH+v2P6NlLfC9VNZkkeoB05R0k0BjExTn0nJUjPYKzBukdKddsNMWxoL0MoVNxP8hDllevj4c8pi+UXES+RJTuI7XUtjnPcy5TsXKaUXk2pVMZ1Aq7dIbgyiAW4TL5Y7Br07UIqmrS/l/rrygWVNerrpQXZl7hDGPq0Z7mokqDMbYGvgE4Ms1OHSXqJsMDtD+nNtdnc2MWOAlQnMkdeou7ZrrotPU/LhZP81OrN0CepKIsTLZxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xaJL8Gxvm90axLGWD82gxr8DBHcVVvFi2pGg+NNp0c=;
 b=Z19R8jgRaEVqlO7ismL/tcb7Oz97PhaQ1xvlG6AScP2/OJxVVCteGmCt487+LBHDB1sBGEUWdxIDLpfVn9HOXe5QUSE3MDlIxX+zflQdwoK81GRpiCmfV7u7xr9dGoLu6XyGeeYOKq1BZEj73JRqJKI9IAQtaT/8sqCJMfsjGt8=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by OSZPR01MB6751.jpnprd01.prod.outlook.com (2603:1096:604:134::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.33; Sun, 10 Mar
 2024 08:05:42 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b%7]) with mapi id 15.20.7362.024; Sun, 10 Mar 2024
 08:05:42 +0000
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
Subject: RE: [PATCH 2/5] dt-bindings: i2c: renesas,riic: Document R9A09G057
 support
Thread-Topic: [PATCH 2/5] dt-bindings: i2c: renesas,riic: Document R9A09G057
 support
Thread-Index: AQHacX4Zb8wso7HBDUySovcI5D4CyrEwnzWQ
Date: Sun, 10 Mar 2024 08:05:42 +0000
Message-ID:
 <OSAPR01MB1587939FE07E5EE78A7ED95586252@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240308172726.225357-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240308172726.225357-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|OSZPR01MB6751:EE_
x-ms-office365-filtering-correlation-id: b0b0826b-adf5-473a-e6ff-08dc40d8e1d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 CKPRHNh2H9TozU3b4Zjq8qXf0Gizr6p5ZWahWK0NT+fgmOVpeXGwJJVSoapCe2L2Fy+JX7AEOJFs1GHLe6pUqB0z7Iwn34vobD1dQWyNnydLwq/FZBDAdW0WwKhB/X5E1rt0tOORu3sIoCWNSuU9b0QPccRMgjqpoeqMKDFqkxN7kAZn3AyvTMG3TbkkEPsyH8Nfz13NjaICU0w9QlDWtMV3SSYxPfdAeXA9flzD3Zqm/pKX+Mjzm0ctRrHhDWIxbU9YfX64UZoNUHUh1ThGtZWA/XcanVV918fiUVOyMMcvRDexUTMvNZqBR347mVr8awPRakLO4mBWDmhswcZwUljOfCl/nFOTEsLlABch5+9LAZsCAfJ9hLFWXOzXk8x9JZt2yAekHuo7tnW6czn3vsLwHbfw3r2sDj5dvrAiCV9pCYWxUsE9xloyEd2vE9TIY4OlOwy6ZAzXWCW02pGhee+kB6QbEGSpWKRMWVLZ9HOxT5KXdTJTm++LHRdSixFtF+7xZ+b3Fmyu6Sp65bI5iJWUIRPnROu1YNajFFA/R4CJiDuvCgUyKb20gKS6WbtPIPelsKTvmFlwhrnzZzmqU4yrTEx1b00Xp8JFSIJVWbWJkcb+CO7HdrZVAmL1LkgNw3V8YUaQ+/ZY8c62AjZCc1pu+if5SxJoOluw+MlVZ+Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kNWJhOxnWk8IksvjFnIWw3qYFJct0bd6349fMSevRTzGwP19+nnCnJB8QA29?=
 =?us-ascii?Q?ib9+ALjUnAknQZ2Emyyf3fTo6UA6JnZgHiwFj+rzi16NCcV599AVf7Jh5l1l?=
 =?us-ascii?Q?pAXJOFGqqpOPyKUa0H2sLOtrdXtHx4/R+xp5oFPmIMeALJlTnfSN6QNRa1So?=
 =?us-ascii?Q?tdPa2QuVagloIUTyp5k8/9J3RokDuq4CK/la7tf/aBusvpSArUze5zXbnXQ6?=
 =?us-ascii?Q?nL0kd9U+h9zNNmVPC79JykjNgzHXYjV4QQDRsOPXOIeyS0eIV88UElfkBDxd?=
 =?us-ascii?Q?Ue+1DwZuOgIYOSrsKbxfh7KbW7aU/STvLL0uyUPENryA7dvbNm/LXMbcKUE0?=
 =?us-ascii?Q?09+7Ebir9m1qkfEiUPk1KoWhrMHINDYe2kmcu2M7IxSvTC8aPa6dnJbK5RrJ?=
 =?us-ascii?Q?1pitdCZUpzAUK7CeepWvh3o9b91EJhnkPARchwzMsfcR090bQFazagRiHELw?=
 =?us-ascii?Q?Fct4tY4N55CpaHPgwUoJsrGDKgOwty11g5AoeD3DmhoV/EEifTh+19zY9xJz?=
 =?us-ascii?Q?Ofl7frHvG5hoLa1bVeHUw/q5q0Hp3liudbsOUSODKCN0iiNH56NZgU/nl7G7?=
 =?us-ascii?Q?yG27IZtHvE8GFd+DNdWu7ITIVfgc0mlXUwXqZ0CofW9fx//L0BNxITh0KAyU?=
 =?us-ascii?Q?9Kgm1MDohkT0jtpv8uDPG7kMHkbTYgnvVdwonysZ4eHsm07JrHni+Xq/a6hO?=
 =?us-ascii?Q?YWMCuwRh7idnUYylO5T1Q9ck4/VghbKktK32Ax6iajCTgjEqzeuOhYh8cpTQ?=
 =?us-ascii?Q?dA0JbVLqZmGc3Mwrg+d/zdA3vZZqU1RB7q2FnM0c5ik7LYvRMzImqhBhlZCX?=
 =?us-ascii?Q?cCpFi/ULkvPaAMa10uMcKa3yr/vVyhN5RUVYi6OWqeZ32YuPIe6QQhg1SFD1?=
 =?us-ascii?Q?2+xjmVZfUluOxaTSbxqDxE5uSc1ZhcECiDkJanrTpF39jvKHUCNb/pwvANaP?=
 =?us-ascii?Q?J0FuSuyElhYBDme9AStvH8aiUErYrZJMg9Z/9LIOTgI5GLGTllE3xNJKjFXm?=
 =?us-ascii?Q?5eKzqrvJjXMlKuRZw7TqxAo4ztipjd5Jm61F0bMMxsFfbsrlTNatFeD2CeMu?=
 =?us-ascii?Q?3Eocxw0vrq3gqdAGXgGSgN9hMBCtADKI4K0mAHyJ/MnTAhUdssTnNS8Vei6m?=
 =?us-ascii?Q?Cv3RANjRs8q3Tv2kbu26m70tEwg6ivf91aXEgDcA5O23XdgjPU7WMgDflztI?=
 =?us-ascii?Q?Ezf89Zxsp6Z5xLp3bd5fABIAefQyXxFkA3RkAqaNgpzoClzMXedJ/rsGh7Wx?=
 =?us-ascii?Q?X5hYi3SBFSvRBVlb3K+AJcOQnf/Ja8+b4qRADpJgriRc6vAEF6qvWdYXIEoz?=
 =?us-ascii?Q?QWTUbxaMpIs466LpL5gOqg0COJgWnJ3m2k67Ir0hPhu8/ImvzygPqcCtAj77?=
 =?us-ascii?Q?+CfIWS+J4bz3P7qnjxLYHclCMZ4F3QW5MWATuv0Y6PnS5j9N3TeaNAkS2kR0?=
 =?us-ascii?Q?KJA+/R5q7APi9ry/T9fVO7QIBMQBDtPwRcxfXkjX/bwdROQq6eozyoeVrpGp?=
 =?us-ascii?Q?W0tl+ClGiVhd7ZYkOF18yOYtUJPf+M9pXzzziczq+XnM2kqODsathDaupKVA?=
 =?us-ascii?Q?uL6z0PVanEXp8iz5HTXxCfvINctWc0JpOXZyPFvRAVMXRSJRN3y9buKsQGVa?=
 =?us-ascii?Q?zA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b0826b-adf5-473a-e6ff-08dc40d8e1d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2024 08:05:42.4962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KF4O3EVgwn5TRMSHL7CXmceGEsX2asySt3z+b5l0Rwc3p+oP8+zPb0aMh2PXu2VF3k3HuDRck8JcOf/GrJG9bHtmhrueJ3zvcch6LE983lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6751

Hi Prabhakar,

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: Friday, March 8, 2024 5:27 PM
> Subject: [PATCH 2/5] dt-bindings: i2c: renesas,riic: Document R9A09G057 s=
upport
>=20
> Document support for the I2C Bus Interface (RIIC) available in the Renesa=
s RZ/V2H (R9A09G057) SoC.
>=20
> The RIIC interface in the Renesas RZ/V2H differs from RZ/A in a couple of=
 ways:
> - Register offsets for the RZ/V2H SoC differ from those of the RZ/A SoC.
> - RZ/V2H register access is 8-bit, whereas RZ/A supports 8/16/32-bit.
> - RZ/V2H has some bit differences in the slave address register.
>=20
> To accommodate these differences in the existing driver, a new compatible=
 string "renesas,riic-
> r9a09g057" is added.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  .../devicetree/bindings/i2c/renesas,riic.yaml | 21 ++++++++++++-------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> index 63ac5fe3208d..2a7125688647 100644
> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> @@ -15,14 +15,19 @@ allOf:
>=20
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - renesas,riic-r7s72100   # RZ/A1H
> -          - renesas,riic-r7s9210    # RZ/A2M
> -          - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
> -          - renesas,riic-r9a07g044  # RZ/G2{L,LC}
> -          - renesas,riic-r9a07g054  # RZ/V2L
> -      - const: renesas,riic-rz      # generic RIIC compatible
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,riic-r7s72100   # RZ/A1H
> +              - renesas,riic-r7s9210    # RZ/A2M
> +              - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
> +              - renesas,riic-r9a07g044  # RZ/G2{L,LC}
> +              - renesas,riic-r9a07g054  # RZ/V2L
> +          - const: renesas,riic-rz      # generic RIIC compatible
> +
> +      - items:
> +          - enum:
> +              - renesas,riic-r9a09g057  # RZ/V2H(P)


Based on [1], this will be

     oneOf:
	   - const: renesas,riic-r9a09g057   # RZ/V2H(P)
         - items:
             - enum:
                 - renesas,riic-r7s72100   # RZ/A1H
                 - renesas,riic-r7s9210    # RZ/A2M
                 - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
                 - renesas,riic-r9a07g044  # RZ/G2{L,LC}
                 - renesas,riic-r9a07g054  # RZ/V2L
             - const: renesas,riic-rz

[]1
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
?h=3Dnext-20240308&id=3Dfddee1e686de077c80ad9dd61f4a50fa1d8b6605

Cheers,
Biju

