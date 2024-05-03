Return-Path: <linux-i2c+bounces-3386-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBFA8BA96F
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 11:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D3881F22F51
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 09:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5E814E2FD;
	Fri,  3 May 2024 09:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TfPJXFaK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2046.outbound.protection.outlook.com [40.107.212.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB1A1367;
	Fri,  3 May 2024 09:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714727147; cv=fail; b=fSOLihjnvlybJXOsdqxI13nV0sdJDuoZ+BoeIOBiYiJsOZ5SwuWi67ByARA3X8NVgnEciP9qOefJwrJQBNGDy12X4vcjEKsteg5BlTiot+G4RwVFIDJ9cSKANz/aU2YzKXFGAsxyIsd1AyuqBeplyLcHis4uvHBJg9z37OXALzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714727147; c=relaxed/simple;
	bh=eGanRzW2DpqC1ZPOQOBwlWHOzTec2dsds26uIFdQMCU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q3Ck64+PVwHcB4MK4cqxbhBFVD3dbp3WCp/K3p3Sm4L5Si3HqPf1y11iZsStzjmjJaH2NrLHuOcvHm7vfwb6rtPFpWsRnx9HGcZ7ylkjxQGWu3XzkadfslBqmWVEsW6KngKVcM+EEVo/9EjNJ3+UTJUMlVa/OfR+mxrr/MAlKE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TfPJXFaK; arc=fail smtp.client-ip=40.107.212.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTOHHAl8wTj00Gpac1koivtAX2A+VtTNycPTEOGmi0fEIauH9eRe7vQY3SlF73gZHn0rJWiOI2Ht0gqyhqsQobXMGl+pHzcn8uaZjH3z1sRF2gcNovuxhYBPe7bmyCDr9133GqSGYuhvTNLebyduPAgUpkNsI+o8KaV+ciBS/TgID9orqhk6O3XNfuI1vrPwXTiifqOCqoSeX9b51rIIro7JgzCfUPtbdKd/4YvyO/qamfXoljvlye6SRFlE/FaT8aJu5ku7N9P3vqVx3FOE5KSPB5DEE5R9/L4HiI889zC2U26K9mrrAqc+C8F1nhjDVoV6cTjCTRPPesvEIza8+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50+MNcL2qQZZrxw+84dMTJ22XJJCXR76gKq+nKjeLfg=;
 b=aX1KEhTo21cspbC9GhBik4YwiEFCzr9bWBS0Ha+B0IFeJW7CHLWPnpjFu6RWdp11M6vQdTedUl94eOCPcYtFcXJZHmytXg+IYowdb/HyJDtng9pOAUNiMyy5JQZznRaGsSFpRjLLyBR1dZa0wKicg3IlHT14GvCYtaH9FFQ8vRwB7kp0h1OtgjJq9s3FCJqOYKsRz+/vxTZ4Q31M4Q6XkziYZIJYDozxSHqJ/aKsxigwb047ZpVejNxFBqH4UF15g293X0V6f640N8jwUurF4S2lC6lUmg/lVQrCY/UxtT7WMS7VJEfpSiT34RS8U+hhnh7VAnug7LgWuGL1T+BYzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50+MNcL2qQZZrxw+84dMTJ22XJJCXR76gKq+nKjeLfg=;
 b=TfPJXFaKPoune73McTSvj2RKrE5GKFTlluDXTlrV6trQqHnOjCD8c2/djIxtQ8cj3XY1eC50nroT8wYyMKCyPUWZaGZNr1KeCsLg5xehV3blzqZX/lop3s4VUuuXus3Qtc6O74U07xP+3ztYfm4M2K+8E7vfVvW5HagSIEieaY0=
Received: from DS7PR12MB5741.namprd12.prod.outlook.com (2603:10b6:8:70::7) by
 PH0PR12MB8052.namprd12.prod.outlook.com (2603:10b6:510:28b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 3 May
 2024 09:05:38 +0000
Received: from DS7PR12MB5741.namprd12.prod.outlook.com
 ([fe80::4a06:1053:ead5:ef39]) by DS7PR12MB5741.namprd12.prod.outlook.com
 ([fe80::4a06:1053:ead5:ef39%5]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 09:05:37 +0000
From: "Boddu, Sai Pavan" <sai.pavan.boddu@amd.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Simek, Michal"
	<michal.simek@amd.com>, Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang
	<wsa@kernel.org>
Subject: RE: [PATCH] i2c: cadence: Avoid fifo clear after start
Thread-Topic: [PATCH] i2c: cadence: Avoid fifo clear after start
Thread-Index: AQHaSUfcsQJjTnMwH0iIfDUOatck5LDeSs0AgAA0hYCApibR8A==
Date: Fri, 3 May 2024 09:05:37 +0000
Message-ID:
 <DS7PR12MB5741674CE218A971F52F3604B61F2@DS7PR12MB5741.namprd12.prod.outlook.com>
References: <20240105125258.2470397-1-sai.pavan.boddu@amd.com>
 <lzvb6oyinlmdrbaat6ayxioca5r2qf7wi3kt63lzorbjytmmbn@wfuz63znrzbr>
 <DS7PR12MB5741FC0E92875C8DB7BFEEDFB6722@DS7PR12MB5741.namprd12.prod.outlook.com>
 <pi4mct77spgoef3mfth7qcha73qrzlmvxhjrqrdf5rjfcxzlb4@zwxbyxf3httv>
In-Reply-To: <pi4mct77spgoef3mfth7qcha73qrzlmvxhjrqrdf5rjfcxzlb4@zwxbyxf3httv>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5741:EE_|PH0PR12MB8052:EE_
x-ms-office365-filtering-correlation-id: 399d12ed-6c54-4ffb-53e3-08dc6b5032ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?LiIE4KMA4IGuqctaIJI3gqnxtxoYubHLVta+A3yKSHaQGWGFIZ3pcT2eCUDi?=
 =?us-ascii?Q?sYbMaWl2+AvXlYaWpix9KxgZdSH96E0UGZ6n1sfnFw45+1ylhMB66ktFuI8m?=
 =?us-ascii?Q?qBQ5MzUgYUg7xWmB5LA9y7E3sXVCRcuYnvd7qddbkfJ0cjXp6+glqSdWKoBX?=
 =?us-ascii?Q?WFiIUysrPTYUCJSSdteUidQNED6nGfluLyeQAjNMzFpH9i96juunhTJlmU/Z?=
 =?us-ascii?Q?CJ0o2M3d/QWzGho8tyFFcbEKTmcAx/U2EhjjP7ebIEOQ/irR6YFnqAr6d0za?=
 =?us-ascii?Q?dIgzdw+l8PfNFTShvsIQyLbRZUDIiAy01JCWEXOgA7xx8DevCa03yQHuWai3?=
 =?us-ascii?Q?XWTlgzUgtXo0yJ4iyRi9vFOR2nOdAHV1sBzR8yM377OLWop9375fa6iltr2n?=
 =?us-ascii?Q?Y+UndaslmjfRoCO+IKoP4tR883KvDjrR4zWKAsE3CPejrnwZ9ZX8+P26wbOW?=
 =?us-ascii?Q?1FfqNrhpFbIqrAajHyf/qBvTqb/vlJ8TQo/pJHco30P/tnN9rZG55a+rOxNX?=
 =?us-ascii?Q?8iWo8CC64WY1mG5feX9XVjcb+/KKXX3CcM6lfWdNDqWI+5zCly4jR/BRqCYJ?=
 =?us-ascii?Q?tJk6MF1EbxJvncwubxqlfje2jMPMjMEtsvyBqZ1RbZGqdQUGoq5Vd5n4Ox+z?=
 =?us-ascii?Q?lIUAiaGKpKhka9Xw5dNO9yD315aRgh5krz+uId5vjTyOGzIplo2ERBDqrhBe?=
 =?us-ascii?Q?j7JGMSpT6MvmzZ1809f3qxovH9CbTrd6e0SDjeSgpNl2pe7JsLgsTqwarcOH?=
 =?us-ascii?Q?HH2ga574ZPrEQnfdCiw2Qh2AJVCLY+8aV/ylsWbFbsg+7DvABboszVcGsf+b?=
 =?us-ascii?Q?8WG5mQPoITHBgiXutFnbaQdMAn86mbNNBxUeyn6touIx3GyzoW3V9qlIya12?=
 =?us-ascii?Q?cpG287O9pE0PK7K4+pfSaAk/Vuft37ISTYjB9SmsRzjdOlZ7Re2VFf9JyUZx?=
 =?us-ascii?Q?9btwRk5G9dLFsb7VTMkB4druq+Po3kP7pQ/BY1OXRavBoQ0Fw4UWFna1jXxZ?=
 =?us-ascii?Q?4uUR+jWQ5vYVpr1QGvX++WohW4YUhi3nUl95Uft35QDBgu7TdKUSx5HTIXfF?=
 =?us-ascii?Q?+MwFfhKi94GEJDBi88+36hvrQ4JOto0B7tck7mS7SvjMAbH2KbIc+ljxoo0o?=
 =?us-ascii?Q?J8stvVqHk4kDktvbBQWuNHtwuHfISxZBaWwvk86sRvE9bDO+vylNvmWFyDTP?=
 =?us-ascii?Q?jLvtz9PClDyRY6tuumWK6p5xeyJ/pXa3/Xc8JVI1qvZUN1s0Piy+BTCGazKr?=
 =?us-ascii?Q?ZKu1Myd0zAe5qMN3kM0X2x12Wum0zfaK9nrnRrK2lkwegmKyxpHlK6tiuwSj?=
 =?us-ascii?Q?zCUTUllZIil2tJVjEZPCiyy60jGHLdLnOBEGwwHD8dS1SQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5741.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Nh/C3pm4zMpvXyDH6DIKw13o1UUgVdxsTLTb+ZZJxx5I/LIDiAeoVc5h6FcP?=
 =?us-ascii?Q?XFX+v9mqFND/gWTStdFEof3P5Qg8jf2+iZe2tACVAGxuIf6j7K8NEUX4FHm9?=
 =?us-ascii?Q?U8hFbQ/T97T0SzouwVgz7Mv8M8eudmBqW1ckGtLPXmyqgrIBC/J/TaQkYb0O?=
 =?us-ascii?Q?2tfxOw9EU7TrRa1PoxfsnTC8G5sxy/ydp278+iI5CGhcZEbA0WD5ZOlx6IXz?=
 =?us-ascii?Q?IrW4ytKoVAK7/ZWfrmxBUY0gQnj+fjWdxXrxLhG7p0miBv/OWvK3HDSbIriI?=
 =?us-ascii?Q?S6Pkvyf7vujLf6FMAB1qC+O5Ja5/mvWgMITTvNmDiRxCyB6MD59G1XwsGDmN?=
 =?us-ascii?Q?217ix242Zt1BAduqJFFLzihM6YkEX8GzXXqfCWKX1Trv2Lon8TH7lGfOUMBe?=
 =?us-ascii?Q?+AxKxfGR9Y57P1r49IN+mPZm89haQ8co+kwMDCBvutalmjm0bxgMz4s6wBOb?=
 =?us-ascii?Q?p30/ehNkJgHOhAsviVmZ7xKxP8tlz9y3hZmyLpxB2TnUetCkzTY9iHy1b42Z?=
 =?us-ascii?Q?+RaX6I2UfFqAmvK9IBu8J95OCcjfT+ubzKE/Fec08ArX7GXgamibX4hvofr7?=
 =?us-ascii?Q?jEdlTHRbPozJjMbL6EWIAu8JFm3HymnFRy5EfcT/+MaJKaMJIFZNM9xg2B1c?=
 =?us-ascii?Q?Rtlpc2Ek8sNlMGMFmz9Qzg4f6bN8usWhIauwrJZyMNuUUjgWVTb2RKaexetk?=
 =?us-ascii?Q?mWfCTNBfLTEBUOSnVV6cv3iFgEk4ju5LsXvOV2L6Eil7TNgMiSGL3/Y8B8cU?=
 =?us-ascii?Q?1PuM6QF4TFjZM1oewmZ30ZAML3rPyuBRqXKNArCXPwqmOBtnLmLFHVQ0YPgY?=
 =?us-ascii?Q?t0svlK/JwLd9KsCHk+zt6bBoy3KaLxnsnfm0TTVqCFG2gizf1Wg/0ntBbesK?=
 =?us-ascii?Q?Tvr2PY2Wp2MsHQykIB1W/4CcOHqr8KmKRM1NP2VQw7WRKsxZH6k7wyzShqUK?=
 =?us-ascii?Q?E+4gqNijlfVPNvZw/0LXcc4Nubr76Pxi0PaOifpVYXyDfybwd24vxZedO+n7?=
 =?us-ascii?Q?Q2VQPcnNEyw0FawYt0Rb6b0U3vWW8irpZZHDiuTbvvFpmWoGPcro5AkXD4NS?=
 =?us-ascii?Q?/XkGnjhpJ8HV2KaYcWosMvfp78NutJ25KTrStx4Sp7MTcxbfMvyBTEdA60U7?=
 =?us-ascii?Q?spy9v7Ov1jp2scT9xT44Nc0Bdck9XqDcifrTFPKZwYTiEftEwmV8nSwBm0G2?=
 =?us-ascii?Q?W9IUoFJ79WvhCUCN6waLsmD3hnyVreFO4AUuHqgL77s+OojMCQyTA6F++Eow?=
 =?us-ascii?Q?QLv/73Ygy9GG1Ryk7qKSkF0O7IGEGBUlz+HU92tR+tKZ9jIZBlfFNSmIC6Ip?=
 =?us-ascii?Q?7fOHYpOJpvQz03OdYFRflX6Fu47CC6ZV6Xi9YeMBlL0Ppx3fBg8WuPAUAn1+?=
 =?us-ascii?Q?/LoIpBpZyL5hsPz0x3tScBdf/nqcb5KwVR027+EbhlnxH82/E63WVrxg+Z8u?=
 =?us-ascii?Q?c7hht2aaYR/6TA/IR8D0EWxXFNv8B8v38VaVahfYNF+REkIOrUCpa9JEV3mn?=
 =?us-ascii?Q?yOSXQ1+IeE8GdQ4vzPFP+LEbDftke4c0gmpGpyLrTD2JdlPA/b3sIzTpC6mI?=
 =?us-ascii?Q?mQ2gx1CB5zEXrHh3sVU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5741.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 399d12ed-6c54-4ffb-53e3-08dc6b5032ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 09:05:37.5249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zNIs7grajkecOSoFnlcDKaf4IxIS8PjxbxJoGNAvgO2klK8jtTOiLyFQJl1/H2oZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8052

Hi Andi,

Sorry, I did not close on this one.
Anyway I will re-spin fixing the commit message issues. More comments inlin=
e below.

>-----Original Message-----
>From: Andi Shyti <andi.shyti@kernel.org>
>Sent: Thursday, January 18, 2024 2:36 AM
>To: Boddu, Sai Pavan <sai.pavan.boddu@amd.com>
>Cc: linux-kernel@vger.kernel.org; linux-i2c@vger.kernel.org; linux-arm-
>kernel@lists.infradead.org; Simek, Michal <michal.simek@amd.com>; Lars-
>Peter Clausen <lars@metafoo.de>; Wolfram Sang <wsa@kernel.org>
>Subject: Re: [PATCH] i2c: cadence: Avoid fifo clear after start
>
>Hi,
>
>> >> b/drivers/i2c/busses/i2c-cadence.c
>> >> index de3f58b60dce..6f7d753a8197 100644
>> >> --- a/drivers/i2c/busses/i2c-cadence.c
>> >> +++ b/drivers/i2c/busses/i2c-cadence.c
>> >> @@ -633,6 +633,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
>> >>
>> >>  	if (hold_clear) {
>> >>  		ctrl_reg &=3D ~CDNS_I2C_CR_HOLD;
>> >> +		ctrl_reg &=3D ~CDNS_I2C_CR_CLR_FIFO;
>> >
>> >I'm wondering whether the whole ctrl_reg should be reset after the firs=
t
>write.
>
>> [Boddu, Sai Pavan] previous implementation of read-modify-write was good
>then ?
>
>I don't know, I'm just asking... because rather than read-modify-write, th=
is is
>read-modify-write-modify-write :-)
>
>I'm just wondering if after the first write ctrl_reg is still holding a va=
lid value.
[Boddu, Sai Pavan] Yes, all bits in ctrl_reg stay as configured except CLR_=
FIFO which is self-clearing.
None of the other bits would change state.

CLR_FIFO post start of transactions should not be allowed; this patch addre=
ss the same.

Regards,
Sai Pavan=20
>
>Andi

