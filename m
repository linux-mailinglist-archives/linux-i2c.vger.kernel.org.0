Return-Path: <linux-i2c+bounces-10722-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FB5AA5FBD
	for <lists+linux-i2c@lfdr.de>; Thu,  1 May 2025 16:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFEB47B72E0
	for <lists+linux-i2c@lfdr.de>; Thu,  1 May 2025 14:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D001EF37A;
	Thu,  1 May 2025 14:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YuBYfIib"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011023.outbound.protection.outlook.com [40.107.74.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96D11EF36B;
	Thu,  1 May 2025 14:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746109011; cv=fail; b=MwoVvhqbMa8sEHWmav4AlQXavW4wPUY7YYwXpqlkXo4EPdlBXRCaiSA1zAwzElQlTP9OoWtUp56aA2IkfD73Jno8zLWEND5qF6y5Va+5pYkJK5s8lVy66T/4md/nafgZhRshAIaVhB9yddCPr2XzEykHpIg+9Bkn0byEZL64JNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746109011; c=relaxed/simple;
	bh=+b+j9i9DCTmL4QxMvkDDQVeLXheXFUwE7PyILosgA6s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CMzelL/LluxZkEAut46/QjNxm/j+iDsvo5WOgJNxDhhKpC1QMo2NtHXXmtvaX2ShMPSonmiAI7i2uuBeI99Mi3VzAKZe3MbiLHxCEC0sKEsc5Rm6vGQzZrVDh/AXG7QKrHM4vvLCJLRPJkPzloGRhxFv3keArJFZL3IboRQUia0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YuBYfIib; arc=fail smtp.client-ip=40.107.74.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/+mNwTHN/eyd3EKnCigQtDEpOtpwONaJlR9H+wTLx+5zre42YcohTOXxQt2hyql6zV5xLrcDeq6B9Xr+dm8K/fewrDBQQFnwx1ER2vML9pmFKODwTseTDKKfMe37fDUMHCxK/RSWMHzyU6O9JfXrdiwDdkZseb9TYrAFwkasgGSaNvg/stbiB1SEF3hDSzjllzlVP+6ZvjYxw4Jh0lkfCRJOhx2fd9aRzdu85E+A6wjekq255gvzWlJ+dqePk7DTqxkat8VqhyynD+UKObuvDP3xiXOdwNNVsrcXMENdxrDSvQ9Gj8nIbDIQOtXF4QAI8+2urfqDzcL+eILulHLwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2yAkDzy7Jc9GESHoltYUc+0YeP9cvJ+agYu6K3tmdo=;
 b=AfMKNwt0j0gw/2K2fhoVth7JQXn5EoBmncFxghM7XahTyp5HUXxKzZiD85NZxb7iYbgFWQrNAhDmdIfcINJlhvbPeeUgZslTriu2ShDgR9jt/ntNdn253O1ar+CAXl/qSZBj9pbp7OdpK7OqT++YNaAY7U3F3Lq5nszhR9mCSxA+5YQCO8gQX+c3BYyTGSPwYz/yBiZoxTwzXrOhxOsBn71OX0Jx7aSoopixvsBGHBYS0v9XtXPniymk3ZqaUVVp6f0w94nZXK5E8l17h7i0z8ciXaB+U5X6BAO29ibb7V3GX3TJCSkvr2OeQfxdemsRoHxvoIF8frzmGU+j51U3tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2yAkDzy7Jc9GESHoltYUc+0YeP9cvJ+agYu6K3tmdo=;
 b=YuBYfIibtlLOoE7nVCyNS9Z1rXAt8Il9fFOcpNADGO5rvp39NOAfMYPI3Bs1w8kGQRZzTIhHc/0Y99IPh8xOdUehkR0bq+T03NzPi0kyM3m/IKctucPQxsrJ8+9S5GSN+pB0Wpjnp5XTAbtjq05vPVmI/ygPXUoZ+SMs3sT/oFE=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYAPR01MB5452.jpnprd01.prod.outlook.com (2603:1096:404:803d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 14:16:44 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.8678.033; Thu, 1 May 2025
 14:16:44 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Chris Brandt
	<Chris.Brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Andy Shevchenko <andy@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v9 1/2] i2c: riic: Implement bus recovery
Thread-Topic: [PATCH v9 1/2] i2c: riic: Implement bus recovery
Thread-Index: AQHbugikd+rihQ1on0eZeeVcqiC2JLO90wYg
Date: Thu, 1 May 2025 14:16:44 +0000
Message-ID:
 <TYCPR01MB1209372C80BA19EA179383726C2822@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250430194647.332553-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430194647.332553-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250430194647.332553-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYAPR01MB5452:EE_
x-ms-office365-filtering-correlation-id: 669c9973-f0e7-49c5-dcb9-08dd88bacd68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?EtP2Yq8DdtarAKlsh5a/K+p1y+vDUzu61Svbvl3CUUnvVDEvytADuxSg/tUk?=
 =?us-ascii?Q?pNPN1VmTeexWem7eUPSh4/kHv0N6e58rcGaBuOL8xeLLtNODdWW3QU9iJunG?=
 =?us-ascii?Q?zgM6rih5j5tGq6eL10JKQdNs0jhmvLH4KEd95m6Wc6tryD0evAnELGpMuTRC?=
 =?us-ascii?Q?LXIUPC8WA6mqpiXdXowZBRsw+jQ2XyftuJkZ24CPKNitugTaWgbv4icCsNXJ?=
 =?us-ascii?Q?pmsRu/ypo3WXgWMkECvU7WDKc6jDn1hR1KrxN372wCwdqoAJ/QE+DpG3rjEf?=
 =?us-ascii?Q?hU1LXm0J6hqNV3H6QrQBAYxPD8ZB62ojl59t9D3gGW8jfHY7cyZQ6fvqiDbi?=
 =?us-ascii?Q?AkuXE8DUjdShNsTrnpi4IY4TReiOATRQrdMATk+P/2ypO4Qw/0lhAb3zfmbG?=
 =?us-ascii?Q?HSJv+fAPgcGWMKRHdI++rBlIordu1dVPs+rdCT2sIoxBOo/jLu9LFRKo0zG4?=
 =?us-ascii?Q?DA2FWCYhY8r+JZvBcr/FnMqYSCGtBd2+T0gZwjCSZZJqWJhF0ICzUOV7xJJr?=
 =?us-ascii?Q?tvroB3Sn+H8YiFRVR+LnoZU5Okr0ubEaehUI1rHEWz9X6znEesb5W1OQOXBs?=
 =?us-ascii?Q?DWUD77BtmbO+SAan18dDTd6bnOFu7ffEx51nlQJmLAPG5K9OgnqnJJFKvX/j?=
 =?us-ascii?Q?Vr7Ck37Vn4s7a0dV5ASh6GFJFHp7iRZVQVQkbN1dzh/ofcrWTpidljzzdfH1?=
 =?us-ascii?Q?yL3k7N4hBTAje/4Hu0GPDT0o8E32FFtVhue/U6qt4ky/LH7WH3GbYdib3FXS?=
 =?us-ascii?Q?R3urRJD5CkchQ/4FOeXIcdgSH2uFk4i7diGT/kpf0vmpLDN+hO3UJPIezmtA?=
 =?us-ascii?Q?wxoS0d8ibJogMGGN1EoGaQcEqKxh+TvkC+/O/uZLO3wAAWa6A42CLRqvOOyv?=
 =?us-ascii?Q?PumIKWotcwCvcOMtHv/bency9idu8f8qyz381B+G72lzCHibh7KhL0d5BYmw?=
 =?us-ascii?Q?0YLXSyiLLiOs3pVnm8NzRLYwU/OeU7sXSCCf3rejS59EKBzn5SgyygD6XWtl?=
 =?us-ascii?Q?5207j3NXi7zb5lUVKpmhzF9uTF31I02ZCzwoEzGJL3fuvXQd1bJnkXdJWLPi?=
 =?us-ascii?Q?lBwaZlhieA3gs9bSHzpAFTD0dddF9/7lRvDDFep9nhlAX1XAEDCnQ6r5YRMO?=
 =?us-ascii?Q?tVEmr+vjo+TBp3M30V9mCcQS8dK/E4ndD8GN0b/G/5dKgAYQen2rcdnDhMZ4?=
 =?us-ascii?Q?KuOaOUJDdeOqdmwhvVtrp/RwtwxBXzNa44/5QcWbzaySyS6aJHrLpOdeS76N?=
 =?us-ascii?Q?cLFL4Nf9G1C9mt2PzoRfhkJzTPoWQnTbQA4grBXnJzDfVPO72bg58u7TriVM?=
 =?us-ascii?Q?qw9UYZZF7gYdvzXqapplwb2MafhrBtZWSsjfPKP6hvW9kAPkDKDrlpeMxKsn?=
 =?us-ascii?Q?/1woZeUx5E0X3UJL6d12q8QhsQL4eX24kr5S39z3GN7DUJT7M72LvaJYet3j?=
 =?us-ascii?Q?r1fZmsBa7tuN2VIxLC7cXSE34szGfpzHV+GGeh69CmGhHwTjf76s8IxDnH/C?=
 =?us-ascii?Q?gQCCTlSmXKysfLE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KBdd8XxaOQI+4tRtKbcLTdBo9oWgXdZMZQElpO73P2yROkwZARXjpMpAEbg7?=
 =?us-ascii?Q?CovCYItArhUh3T/i6ztLpdOw2QuX7kh5e1Xet6xEmc9sEjUSwgACl/8FIQ50?=
 =?us-ascii?Q?i99254F5Ikug2OpbrT2J+njSoj6r59gVsManSzwnAklxYjUoI1K0Z2CgL8C9?=
 =?us-ascii?Q?esLk6A9CfrB9j7sK0arVwsJ4zDlvdITyu0wTSVPllGOHSn2tc8jXR9Cco81e?=
 =?us-ascii?Q?4u3B93KSrKQanxwTydCzKnuvfcrqqUrY6+pQmTHlQKsMfZUnyQmmxfsUr9nd?=
 =?us-ascii?Q?D1W4b74R5QonNH+wUs5oLHYj9bDnFApTFlhYhjv6B3m/KopDtMrovIN+dEJ4?=
 =?us-ascii?Q?v5tRNJB14dG41wiZhiy3zGosv6CJeAEFcwR6eg5I75XAJUs4X123M6Lv5l5H?=
 =?us-ascii?Q?sDo83OTy//EwMsY7bKsyHxYx0010lf3wqppNdeYnN04zPpTlBgqSF8oDw8Ew?=
 =?us-ascii?Q?LCskFflnBfrxdIJRaJhvWhenJZEFnHOBCN3f/IkI4s3N7kpoA8kBUu8FHCYa?=
 =?us-ascii?Q?Pn5wzNJkO/oC2c7m6rOUueaYLIyGgUrM/4oIKA4Y89Gof9fqjbSMB7PnnKem?=
 =?us-ascii?Q?dVPhD4yLzXzEYmm4ydI9ElL70CGcWfxTOLdr+0xnXTZnHXlgTeguyIHVCCQe?=
 =?us-ascii?Q?I0Ei4IiYPk2QsGb77t+/9PQszZMwgRGGnygP5zIZ+FGf1PzFxBVQjp9EpOzM?=
 =?us-ascii?Q?b0KH8IMFEOooyw6IZDrXIown/xrnzDZbW0UFx9At5XxdKZllpdeh8HPraM6L?=
 =?us-ascii?Q?we0jp3wx+sBOD/U/FWEs+8fPDYEFqxWsesgZ3JUA8TBj1GbWBGZWN6CxmaU0?=
 =?us-ascii?Q?NGM65++FHKMbm8Gg7LqqB9oycvjU0gl+90ukp2bOUWPDy1QBBJ2KfuFIOCXK?=
 =?us-ascii?Q?KrNbURulrzvs5hPD7hi1hHPXwVWvJ7ZydddEXWSFiCSGw6xBZls2h8Ymm1I0?=
 =?us-ascii?Q?+NmSg6nYCoYyW+xKXaWB+XG7MbBPuKItg8rgWLKvPWFBDPf7fySI8xFc23Br?=
 =?us-ascii?Q?+98IgF9C2ZOXz4yK4IyGfAkJz5VevDgwTEZJrIIH6FqJbtZGTm1utMANjXPr?=
 =?us-ascii?Q?O8LeOUIELVWUWlFo0Dlowg6WV1Ls6qbFvYeSfd6RA9dWYjdzqgYyPxLmJRDx?=
 =?us-ascii?Q?9GAlYXDZVb3XJpvV4aiNUb83SXm2YVtfCV/rl9f4RXfF+DCZ2jOOjcz+3wX+?=
 =?us-ascii?Q?6ezzzgCpohGWGCI6nyB2rlaRJIwJUZxjC54kF5dcXSAwwSMMSLGwd/47/d1L?=
 =?us-ascii?Q?yOeISIfnaPfIZFT1fsEwL0klPc1eqDjnmosu/VuhNEKKMiotXsJO0eY9VNdk?=
 =?us-ascii?Q?+tjIuWf3lCEhGpbjKdN5Z6r4lJGb8kQrkUB1CI/zc/LUYjqEv8up/OHsoGYa?=
 =?us-ascii?Q?lk6W1VXJw3a0xJko6E38qNsLCDvIbhOE9pF6AJTtAuwHo84a7Dthm627x8z9?=
 =?us-ascii?Q?fdFsArOrG4TZePg0A5TXoKMgvSy1UAWO0BhwDQdM2mmr5QrR9jq0rQ/EUg/H?=
 =?us-ascii?Q?6lSVzloj7baEjJXJJByXssgvfUpfs1MUvNw/gV2sTx155S/EJap7VbXfNvk7?=
 =?us-ascii?Q?S2ZgaMd2Z5a3vt2xo5zNb2IIKnzBTdMqH9Y11lkT2zefRhInHrLC0JRQu80u?=
 =?us-ascii?Q?rg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 669c9973-f0e7-49c5-dcb9-08dd88bacd68
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2025 14:16:44.7448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jdODCImBnIhqzQ19g1zIr2FM9gVtbQIj6TEf8VdNhP1OAg7A320EmmvUuDgfSqLt7K2tuAPgaYVV72FpRHeLIENVC6LERjMjDCeGtUh6rc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5452

> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 30 April 2025 20:47
> Subject: [PATCH v9 1/2] i2c: riic: Implement bus recovery
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Implement I2C bus recovery support for the RIIC controller by making use
> of software-controlled SCL and SDA line manipulation. The controller allo=
ws
> forcing SCL and SDA levels through control bits, which enables generation
> of manual clock pulses and a stop condition to free a stuck bus.
>=20
> This implementation wires up the bus recovery mechanism using
> i2c_generic_scl_recovery and provides get/set operations for SCL and SDA.
>=20
> This allows the RIIC driver to recover from bus hang scenarios where SDA
> is held low by a slave.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
>  drivers/i2c/busses/i2c-riic.c | 53 +++++++++++++++++++++++++++++++++--
>  1 file changed, 51 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.=
c
> index d7dddd6c296a..740e53bdb2a9 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -53,6 +53,8 @@
>  #define ICCR1_IICRST	BIT(6)
>  #define ICCR1_SOWP	BIT(4)
>  #define ICCR1_SCLI	BIT(1)
> +#define ICCR1_SCLO     BIT(3)
> +#define ICCR1_SDAO     BIT(2)
>  #define ICCR1_SDAI	BIT(0)
>=20
>  #define ICCR2_BBSY	BIT(7)
> @@ -151,11 +153,11 @@ static int riic_bus_barrier(struct riic_dev *riic)
>  	ret =3D readb_poll_timeout(riic->base + riic->info->regs[RIIC_ICCR2], v=
al,
>  				 !(val & ICCR2_BBSY), 10, riic->adapter.timeout);
>  	if (ret)
> -		return ret;
> +		return i2c_recover_bus(&riic->adapter);
>=20
>  	if ((riic_readb(riic, RIIC_ICCR1) & (ICCR1_SDAI | ICCR1_SCLI)) !=3D
>  	     (ICCR1_SDAI | ICCR1_SCLI))
> -		return -EBUSY;
> +		return i2c_recover_bus(&riic->adapter);
>=20
>  	return 0;
>  }
> @@ -439,6 +441,52 @@ static int riic_init_hw(struct riic_dev *riic)
>  	return 0;
>  }
>=20
> +static int riic_get_scl(struct i2c_adapter *adap)
> +{
> +	struct riic_dev *riic =3D i2c_get_adapdata(adap);
> +
> +	return !!(riic_readb(riic, RIIC_ICCR1) & ICCR1_SCLI);
> +}
> +
> +static int riic_get_sda(struct i2c_adapter *adap)
> +{
> +	struct riic_dev *riic =3D i2c_get_adapdata(adap);
> +
> +	return !!(riic_readb(riic, RIIC_ICCR1) & ICCR1_SDAI);
> +}
> +
> +static void riic_set_scl(struct i2c_adapter *adap, int val)
> +{
> +	struct riic_dev *riic =3D i2c_get_adapdata(adap);
> +
> +	if (val)
> +		riic_clear_set_bit(riic, ICCR1_SOWP, ICCR1_SCLO, RIIC_ICCR1);
> +	else
> +		riic_clear_set_bit(riic, ICCR1_SOWP | ICCR1_SCLO, 0, RIIC_ICCR1);
> +
> +	riic_clear_set_bit(riic, 0, ICCR1_SOWP, RIIC_ICCR1);
> +}
> +
> +static void riic_set_sda(struct i2c_adapter *adap, int val)
> +{
> +	struct riic_dev *riic =3D i2c_get_adapdata(adap);
> +
> +	if (val)
> +		riic_clear_set_bit(riic, ICCR1_SOWP, ICCR1_SDAO, RIIC_ICCR1);
> +	else
> +		riic_clear_set_bit(riic, ICCR1_SOWP | ICCR1_SDAO, 0, RIIC_ICCR1);
> +
> +	riic_clear_set_bit(riic, 0, ICCR1_SOWP, RIIC_ICCR1);
> +}
> +
> +static struct i2c_bus_recovery_info riic_bri =3D {
> +	.recover_bus =3D i2c_generic_scl_recovery,
> +	.get_scl =3D riic_get_scl,
> +	.set_scl =3D riic_set_scl,
> +	.get_sda =3D riic_get_sda,
> +	.set_sda =3D riic_set_sda,
> +};
> +
>  static const struct riic_irq_desc riic_irqs[] =3D {
>  	{ .res_num =3D 0, .isr =3D riic_tend_isr, .name =3D "riic-tend" },
>  	{ .res_num =3D 1, .isr =3D riic_rdrf_isr, .name =3D "riic-rdrf" },
> @@ -495,6 +543,7 @@ static int riic_i2c_probe(struct platform_device *pde=
v)
>  	adap->algo =3D &riic_algo;
>  	adap->dev.parent =3D dev;
>  	adap->dev.of_node =3D dev->of_node;
> +	adap->bus_recovery_info =3D &riic_bri;
>=20
>  	init_completion(&riic->msg_done);
>=20
> --
> 2.49.0


