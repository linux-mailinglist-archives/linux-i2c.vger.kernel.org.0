Return-Path: <linux-i2c+bounces-4492-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0001D91CB48
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 07:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CF2B1F232FB
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 05:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472C227451;
	Sat, 29 Jun 2024 05:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HKGluAIk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2052.outbound.protection.outlook.com [40.107.114.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C627964B;
	Sat, 29 Jun 2024 05:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719639541; cv=fail; b=iR5j6R6v6gias+0Kt/Lu9kAj7uBCQ106N2VaSZoIDtDDzUDnX6eZjC6IesfKL5c6WDcrzGoritnIDOoikf+Cxpm2Xo7Ysb9GyLybTOq3ZzzbR992tNHtjh+LCSMUdGlNuUAd4OlsFR9W9GWGRH2yNVIh1pzAfKBmEwFPFuyFudE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719639541; c=relaxed/simple;
	bh=syUE/206IJ5kcXr93Hj9HuFh85eb6l/UHenyQe2zbnA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jNOe7yrxrDl3LgE3TjHBkyQxe7D1fXViHUHJ14zqLQfT2LyLK2of5Nog4BTiFd83xj5f883XbeJjUyAfooXA+7kuXlpRrEo8KnVEFtEjUzJbUyO9z4UcvPPUVD0BwIQhHxH1GfkOtKfLHOcZhjzxNf2Hp6dA2bd/ia1Q1Uie7F4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HKGluAIk; arc=fail smtp.client-ip=40.107.114.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLA73kOPg2iZYjY4lz3AG9uAxi9WZqkfJCsIMna6HdyEXr7bQX1mtczHupOwzqyAt8zXUnbgFgA3Iz97Jb3GGj4c3t7erqYW5GUzCQm/qXUZGz4KHIpjMwcG8dtkmS2ZBcV9w+rR4b2kDg4Nrme/IlFWXb0rCaVpXSDNmPxtYJFS6/hVLT2HkRLp+hqjJh/KEmLYZU4VlFhpU5Y+KsH4UERL10+i/92BCiSQZT0PMhbj4G4GS16XDuBfPEi1LbcA7oa8ZdTpxr18LYdYLA6VbeEKmylW+HyWbrDQ7PWtvjzfADvmHHUw+J4EH7c+pYT/AV8V00VsIO355Eb7TrtI5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrIS8CSlO1aAaXC1UMvCP9gxymqRKD+g22GxrtotSSA=;
 b=L+0ADaiuiMnOHFr9af35brjjp6Uwy6OMr1YPUDHm8mDK0oyMD25xGoDHGYVxKK+YMAcLKxI0FaH5oUQa+R/xYj1picVQIc3a8y2mxzMZrZeTJisVbtro6Zq6uCHufQ5zY9wmyLTdl+1cYXYHioB44dFCEY7Y8cungKlAHnV2lmMLXKXMM4bNCeqqeg9VpxzrDigAd7fTgJcWvxQG8OrTDEnI1UMqp7DfdNaSoY5cKsWsmmKtk/muIP18kEgSq/SY9/zNUDWDXQTxzQ9SknBNeDsbXLOxjHsz+OnZucz8z18hX5qc6hbAc9lwZM1OEqIOgKgFoc2U4hL975YLk5FDNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrIS8CSlO1aAaXC1UMvCP9gxymqRKD+g22GxrtotSSA=;
 b=HKGluAIkGMp6Q0uYHyP93Ap2LBPiwwgxlHPhOnjj2f2jHdFBA07GMTotOiBNCzOa88CrOnPNn8yci6EDVp8IbTFJSfnSxjuMDf7RidoKgk+J/M+uEMIZkhTL7QFM0U0LsDu9PIndH+XLOhkAinudkxBt0C9E+NqDjL+GflPSu8s=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10772.jpnprd01.prod.outlook.com (2603:1096:400:2a4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.28; Sat, 29 Jun
 2024 05:38:50 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7719.022; Sat, 29 Jun 2024
 05:38:50 +0000
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
Subject: RE: [PATCH v2 09/12] i2c: riic: Add support for fast mode plus
Thread-Topic: [PATCH v2 09/12] i2c: riic: Add support for fast mode plus
Thread-Index: AQHaxvmKg0kBHu/DGEyRo3HVs69iELHePUMw
Date: Sat, 29 Jun 2024 05:38:50 +0000
Message-ID:
 <TY3PR01MB113465270C36ED9A2F2C8DFEE86D12@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-10-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240625121358.590547-10-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10772:EE_
x-ms-office365-filtering-correlation-id: dfe0325b-350f-4127-6416-08dc97fdc168
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?XQmUzzdPSR1hVMvysrz5VAGS6s/Q8XpwQoGgwblLLo9cKN3N4G/h5T8Q5SJw?=
 =?us-ascii?Q?Xmk/uYYwQLJ5xEU/pcaDhRgPdIsae9qF/YcS2ymkgAHE9AphqktlrJzJqVMn?=
 =?us-ascii?Q?fizlcASkalJdarSXh//jw+69OMscws6KthDX2sqtnDQOPeK2gGiBOUkU67tO?=
 =?us-ascii?Q?L5+g03GGTcYBh6NT1qPLxeWuj5i009L/mNUNztjqrmTf5fT5NGia1aYjQP7L?=
 =?us-ascii?Q?hHGLxjc6pulSHMnhrOmJCEGfrpQYTAaEmH9mq0eqpit4Js2oRYkZC3XEFhG7?=
 =?us-ascii?Q?00xWrJzOHvVfSPvT7fCbVbcW9V4OO/atOTyjT58AFjmuLJuKm49OTruEAHg1?=
 =?us-ascii?Q?rdt/sB7zxVoTSMdvmLp3KRf4fbaQV9jYJFHVU93FiSwynLIiuXYmW8nIAS3r?=
 =?us-ascii?Q?gRbXT6riDNSBJZ1Lvu/1ujyUdNDY32ufy695UZCMsHKTBpQBYuSc/ofnRiyT?=
 =?us-ascii?Q?5asXa/1fJ5pnpgiFifpu0vQgqdlU2VEssjbubRx5G1T8WiDM9dygGxHjY/0n?=
 =?us-ascii?Q?Xumk3bXIrJecQ5SSUiMae+pFKiuDXzKQeVwkpjWjmT5pM9gOsJKiHlqosODK?=
 =?us-ascii?Q?vD/Z9fvfrlfj0nLLUe8h1jdU48PwQkMCc5HSzdpJ/1gysdtaU/fTw8pHmPog?=
 =?us-ascii?Q?4MwbOLipg5UOf+D6CQIx/cj6a9/bKyxVb/sgLLPlgOL7PpVHSddTSMsU9r5m?=
 =?us-ascii?Q?9MiVew741QgUSjBKwkYKTkdFPcyCP1/vInhb17aq6hezHsl8cyb2X1m86dSg?=
 =?us-ascii?Q?0hC3Jn+so/1cH4itmGHfgPGa9+YnQB/QHiuVEcnsY7pbFoOvYAN0TntAqNOc?=
 =?us-ascii?Q?E59bVx/99EgKiuXlRbYXQanEjeczdkEehig6UrARNPM9fVG2HmgoKep7zERI?=
 =?us-ascii?Q?uROkSeYsn/zeuyw8bt0p6dZiWS/v8ZmvbUnWR4hwEOrlAH28gyECJBnosswM?=
 =?us-ascii?Q?DmFmS0bxFpHwBe42cgH/n2Mx8xF5LlHsXxCikvjepCm+zQy8kgTZS7nUICSG?=
 =?us-ascii?Q?4ADMjLv6zTXYdluJFsqI14IqahGsXAP+FaSIwTeYZVkHe6znxOIiclcmdA1u?=
 =?us-ascii?Q?K3AlSsYRyiTYgXQzhS74m7j3L/uXtT7VPW9Smxo02vlAzeTVyMAmzQV2c6Pj?=
 =?us-ascii?Q?OG2nytSGTrQbBfZtgmbqAxTKiwiraZbp7n5Gb5ZRUTEHEMvanb9fjxE8n4bC?=
 =?us-ascii?Q?+yT3bRTo5cZ28rxXNCj4Sw0zNkWGk0+0C4pZboFV6JKltV6BSdzx77dfNU7N?=
 =?us-ascii?Q?HYkdFksu2DG2OvdPGlxZuDmLuG3EvlNbaRKo5E2zTVU/IarfURhS7qI9LoNC?=
 =?us-ascii?Q?RUgJh24hIZUDnalGChtNW7UK+M4QXsj9CSMxuTMbC/HMjWxGplKjVoRV/FPI?=
 =?us-ascii?Q?MHc5VVVbL/+EANUDO2jQ4OJ2CupK5Wpw4450GgsvLN4o5gxVku5dc5jDie/G?=
 =?us-ascii?Q?b7t766i38tA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?x6ED3r2C+q4SIvjEcy4w1iwVaLe+yv5RfqrMqhJ9mj/Tv0Vi2OODdchuqw2Y?=
 =?us-ascii?Q?iKDQrRHHrXmknflyFaul1vNyjUO55pIT2TrgJQnK7byURANTSHipIeLMdQ3z?=
 =?us-ascii?Q?+UstV6y4wwAk1RA1mqnnhJ+49t6ham6y7Zd0d1rU9bLkdZOPd+6rzfQaCPIr?=
 =?us-ascii?Q?STXr++4NFb7e1SBi6axnmFVPOVL3J0c5V9ot83CP1BZwJT+Xvh101nW5v9/j?=
 =?us-ascii?Q?lldhyeWaGtVhvezaBpxiWu8s1YI/gMls3HdRToGDDlU+0TFfQZQkb6b5nRhu?=
 =?us-ascii?Q?MZoyaygpQAu8J9v+NiApKGb54rUqeylYfMAFe57ZqKwkxN9Nuvutpyb9gEsB?=
 =?us-ascii?Q?s0JBDa8R2Kaup3MH1/D1HBjTiX2+HF9JLCIQW7vO/6Catdx7QxMdwkKEYnC2?=
 =?us-ascii?Q?lKOgb4t1LejizwAiXqPxfYloR2slhpugvqAeojBhEMwfcnb/BkFqQm7PB6tL?=
 =?us-ascii?Q?IfYk+MBCKYOyU3C+paGr2E2NeBQwGdByvBMcWT7Lbz0KopaODMdM+VDNd9HZ?=
 =?us-ascii?Q?irx2xhtZQdeo6kIOplLlKpYtvNb+rimVUhpwH2FXGI0pgkunpDsCVvYvm/4S?=
 =?us-ascii?Q?fGqWI0JSi8XDcdTC7DlGl3sClKhlvK4jj0eB5ZsL2Z+LGA/SkoesexKBt//i?=
 =?us-ascii?Q?Je8yuaO9MaMRPlf2dQoylM5766FlNPWLDhGmr1NN1ZvhCR+0qxiMPss/Vfb/?=
 =?us-ascii?Q?um094ul5qlIOSrbovBWBLm9TkQa5CXTCBdF2ObtS2thjbuSjw4ddfxlccmpV?=
 =?us-ascii?Q?+v4hroLuPzrddM0xizsM8z6OBs9ShQPnp2ioJr2ETvEnEuh1QO7hj0XPxoxd?=
 =?us-ascii?Q?F62t7nRKBZOHniH31OfRw+bWfBoPkCO4Cg+T56LysaWQS5HlhK8ca/Z7QKsx?=
 =?us-ascii?Q?Xetu0iOJ82JGOfAX3xjfyOXPMVQ8F8pvI8f4w+QPtPKEkDn85sNkv21ItuGc?=
 =?us-ascii?Q?85IPzJ87D17EzHG8fT6dhSKVfFTmgkZhH7pyMQXwGO8APOutgXLGBQvTiOM+?=
 =?us-ascii?Q?cOtrX6GajG5xQmT40uxsM8/42nAK4ZiSc2ATHGRlbgORmt6JXyYOkuJwRwzk?=
 =?us-ascii?Q?JJ3bOJP7D4KOL8qGh9FqOm/pkxPhYzlgQ6vshLkpkkgHqRmOiek2XWVZEhW0?=
 =?us-ascii?Q?EK9FXYgDz9xj4cRUMu4a98ArLDM5uI82mIuw75Llyg3lFDddKOCPyI+QWgSE?=
 =?us-ascii?Q?CyQJuZ3TZm0Gme3zmGxi9bIOc+rH/Mw3T7MNeL4+XzYG/s687gm+TSLisev9?=
 =?us-ascii?Q?LBHbFfebeRtGHILGZ8ijfiXUtMB5CkL2dIOx11+O88tt51BW2Iqg1rhIyptO?=
 =?us-ascii?Q?bHsVCfnQvvX0A3arekLsjRvLiGeu76TCNqCBh8Ig8BVnNwZ3afMuSZV+SNuW?=
 =?us-ascii?Q?7BDIrR3RB+BHF8cQkaC/U1f7mGSSoZp3kGF/r0E4uiSz1ArPXKNs8FbZGGHc?=
 =?us-ascii?Q?XU9n6m0mTyTnnz/GStB+S4odLpsmSqqmc9CzZNgChBb9K7vYKo9b5qBM/ZEB?=
 =?us-ascii?Q?LYWaSD/iI1deFoYhfAJZcudwJvCWvyVemITbfmbSoo7lsVn9reQP5LG8DqL1?=
 =?us-ascii?Q?gWkKdpEpO0UXiMjOmk6UvCh9SeRP4pvUTH4zWnnr?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe0325b-350f-4127-6416-08dc97fdc168
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2024 05:38:50.6832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uSy55FOkIsUq740e8S7+2nrggUOy3Xdw0mZMRIo5WDHDTRHZjc52vjBdonHsHKtO14fwrsx9DQPVtulk7K6/G+7ypci5sQ2Be9Ak1o+i3EM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10772

Hi Claudiu,

Thanks for the patch.

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: Tuesday, June 25, 2024 1:14 PM
> Subject: [PATCH v2 09/12] i2c: riic: Add support for fast mode plus
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Fast mode plus is available on most of the IP variants that RIIC driver i=
s working with. The
> exception is (according to HW manuals of the SoCs where this IP is availa=
ble) the Renesas RZ/A1H.
> For this, patch introduces the struct riic_of_data::fast_mode_plus.
>=20
> Fast mode plus was tested on RZ/G3S, RZ/G2{L,UL,LC}, RZ/Five by instantia=
ting the RIIC frequency to
> 1MHz and issuing i2c reads on the fast mode plus capable devices (and the=
 i2c clock frequency was
> checked on RZ/G3S).
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>=20
> Changes in v2:
> - dropped code that handles the renesas,riic-no-fast-mode-plus
> - updated commit description
>=20
>  drivers/i2c/busses/i2c-riic.c | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.=
c index
> 8ffbead95492..c07317f95e82 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -63,6 +63,8 @@
>  #define ICMR3_ACKWP	0x10
>  #define ICMR3_ACKBT	0x08
>=20
> +#define ICFER_FMPE	0x80
> +
>  #define ICIER_TIE	0x80
>  #define ICIER_TEIE	0x40
>  #define ICIER_RIE	0x20
> @@ -80,6 +82,7 @@ enum riic_reg_list {
>  	RIIC_ICCR2,
>  	RIIC_ICMR1,
>  	RIIC_ICMR3,
> +	RIIC_ICFER,
>  	RIIC_ICSER,
>  	RIIC_ICIER,
>  	RIIC_ICSR2,
> @@ -92,6 +95,7 @@ enum riic_reg_list {
>=20
>  struct riic_of_data {
>  	const u8 *regs;
> +	bool fast_mode_plus;
>  };
>=20
>  struct riic_dev {
> @@ -315,11 +319,13 @@ static int riic_init_hw(struct riic_dev *riic)
>  	int total_ticks, cks, brl, brh;
>  	struct i2c_timings *t =3D &riic->i2c_t;
>  	struct device *dev =3D riic->adapter.dev.parent;
> +	const struct riic_of_data *info =3D riic->info;
>=20
> -	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
> -		dev_err(dev,
> -			"unsupported bus speed (%dHz). %d max\n",
> -			t->bus_freq_hz, I2C_MAX_FAST_MODE_FREQ);
> +	if ((!info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) =
||
> +	    (info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FR=
EQ)) {
> +		dev_err(dev, "unsupported bus speed (%dHz). %d max\n", t->bus_freq_hz,
> +			info->fast_mode_plus ? I2C_MAX_FAST_MODE_PLUS_FREQ :
> +			I2C_MAX_FAST_MODE_FREQ);
>  		return -EINVAL;
>  	}
>=20
> @@ -407,6 +413,9 @@ static int riic_init_hw(struct riic_dev *riic)
>  	riic_writeb(riic, 0, RIIC_ICSER);
>  	riic_writeb(riic, ICMR3_ACKWP | ICMR3_RDRFS, RIIC_ICMR3);
>=20
> +	if (info->fast_mode_plus && t->bus_freq_hz =3D=3D I2C_MAX_FAST_MODE_PLU=
S_FREQ)
> +		riic_clear_set_bit(riic, 0, ICFER_FMPE, RIIC_ICFER);
> +
>  	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
>=20
>  	pm_runtime_mark_last_busy(dev);
> @@ -536,6 +545,7 @@ static const u8 riic_rz_a_regs[RIIC_REG_END] =3D {
>  	[RIIC_ICCR2] =3D 0x04,
>  	[RIIC_ICMR1] =3D 0x08,
>  	[RIIC_ICMR3] =3D 0x10,
> +	[RIIC_ICFER] =3D 0x14,
>  	[RIIC_ICSER] =3D 0x18,
>  	[RIIC_ICIER] =3D 0x1c,
>  	[RIIC_ICSR2] =3D 0x24,
> @@ -549,11 +559,17 @@ static const struct riic_of_data riic_rz_a_info =3D=
 {
>  	.regs =3D riic_rz_a_regs,
>  };
>=20
> +static const struct riic_of_data riic_rz_g2_info =3D {
> +	.regs =3D riic_rz_a_regs,
> +	.fast_mode_plus =3D true,
> +};
> +
>  static const u8 riic_rz_v2h_regs[RIIC_REG_END] =3D {
>  	[RIIC_ICCR1] =3D 0x00,
>  	[RIIC_ICCR2] =3D 0x01,
>  	[RIIC_ICMR1] =3D 0x02,
>  	[RIIC_ICMR3] =3D 0x04,
> +	[RIIC_ICFER] =3D 0x05,
>  	[RIIC_ICSER] =3D 0x06,
>  	[RIIC_ICIER] =3D 0x07,
>  	[RIIC_ICSR2] =3D 0x09,
> @@ -565,6 +581,7 @@ static const u8 riic_rz_v2h_regs[RIIC_REG_END] =3D {
>=20
>  static const struct riic_of_data riic_rz_v2h_info =3D {
>  	.regs =3D riic_rz_v2h_regs,
> +	.fast_mode_plus =3D true,
>  };
>=20
>  static int riic_i2c_suspend(struct device *dev) @@ -613,6 +630,9 @@ stat=
ic const struct dev_pm_ops
> riic_i2c_pm_ops =3D {
>=20
>  static const struct of_device_id riic_i2c_dt_ids[] =3D {
>  	{ .compatible =3D "renesas,riic-rz", .data =3D &riic_rz_a_info },
> +	{ .compatible =3D "renesas,riic-r9a07g043", .data =3D  &riic_rz_g2_info=
, },
> +	{ .compatible =3D "renesas,riic-r9a07g044", .data =3D  &riic_rz_g2_info=
, },
> +	{ .compatible =3D "renesas,riic-r9a07g054", .data =3D  &riic_rz_g2_info=
,
> +},

I feel, the better way is=20

{ .compatible =3D "renesas, renesas,r7s72100", .data =3D &riic_rz_a_info },=
--> As this SoC does not support FMP
{ .compatible =3D "renesas,riic-rz", .data =3D  &riic_rz_g2_info, },--> As =
this SoCs has FMP+ support
{ .compatible =3D "renesas,riic-r9a09g057", .data =3D &riic_rz_v2h_info },-=
-> As this SoCs has different register layout and FMP+

With this the number of compatible entries in the device tables reduced fro=
m 5 to 3.

Cheers,
Biju


