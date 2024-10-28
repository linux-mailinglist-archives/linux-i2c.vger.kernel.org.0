Return-Path: <linux-i2c+bounces-7609-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 799869B2419
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 06:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D62EE1F21526
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 05:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA7E18C35F;
	Mon, 28 Oct 2024 05:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="hALHf10m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2108.outbound.protection.outlook.com [40.107.92.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECABB18C03A;
	Mon, 28 Oct 2024 05:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730093094; cv=fail; b=jT7nHl1VWZSSKLHjbKWUQPlNNT6txNAfhT40yN6sTkWqH5PfYjazs32VRXnj/xlMiL0S3HxbUZ3ahkTC78RFPPXgs4hlyKed1G1u5cLjCXeYWcIEFoJu11JNiP29bWLcyDPeYuhytzy6Brgf94Bo0QKd9cpZzGXE6zJLZF2+2l4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730093094; c=relaxed/simple;
	bh=y4IkoernwXpH9W4ZlKOzYeLH07AyGbo8s2jAIImL8Cw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I1WBN1ICoWYfcKGUQrmK9DcGlQFQbx5SMY6savTLCtgvYnIl4EQeaPodEZvNd8YioJBt+EnGmX/w1cs4HZM9NopYilu4B5/aMc6HBFo14N3Num9xJbUHGmVEcmXCGP55jOJKLAQfjxCrnFZan+XZpWE6mVdbAFxiZyrMdTjn0hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=hALHf10m; arc=fail smtp.client-ip=40.107.92.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ka813k9SYkwTDRwogtWSJAxFn2ByTcPDoLS0cl/N0wLYR8Rhv24PkeMtPIfYTOgbWqg9lZ7+F/AFuoLnuP2yxwes0Uaz+Z2gywz1uuuBV9rzFjc/Xi1Ra5oOVSBoy/1aO47kr2QMmj0jXZijPEdoL3sRUFBqcerdNzRg/2ZUNditYIDax3DoZrUfqNlLXMFBhdYMcepCXu1ch0IanDvh1+E5DzqDM1j8t2mylTkqM+lxEPpOxC6R/WJLSTREY/tceKwKLQVKyBmPgt5dAgenU6AYF5pXX8xO3LsGewilqhzCyXZdLFulrnC3ThEF34kGv+uH8yRfXbWSExdx0fkr5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLLgVXH5F17d9GKW/jXK5aeDb49lzGDLdZ5tcqlk8sw=;
 b=YuRH9Euo1M6PQbLbBn/kZ4tSz+/AOkyGAxApYq5GYS9S+DcdaKSBkadB7SSZ5EhX2zUuB8PLqNxcvIbxgK93KhCLv5Ni/QK7wob+xGL9X2F0uBZ36AxqTujtGbqApcvBDZB3PZaz4aOiLDgh+xPIdndsaAXE5ubAmmBF0ovm9y7sz4fiID+VvslGz6lu3nQPQHHodNK8zbrAkiM+zQjMKzZgULy8OozY2bSWef0m6Dv3SkKlHWbYIZiihMwQHWCuOT0SiYzIsbLChp8X8TddE7k9SIOHO8ZdBv531A/72BwxzRO9uUKy16iRQiB4cdjCc7XYAk6HiT550GLu9kNU4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLLgVXH5F17d9GKW/jXK5aeDb49lzGDLdZ5tcqlk8sw=;
 b=hALHf10mUW7LQKLkpFrPjLYKUsmZZGamVaXUSxJMgYz3KZoU/cPT3PVKsYnA9ez+rOPs+zy7MxFDNCBExClaari3WDOJAs1Z4ZvznJPcDIXqjot2UNFdIrO36uB9OhXKci7xn26HkPbiLaLYkva+/VDeUvOC3OzQC03Pe8Fc0tA=
Received: from IA1PR14MB6224.namprd14.prod.outlook.com (2603:10b6:208:42b::6)
 by MN6PR14MB7268.namprd14.prod.outlook.com (2603:10b6:208:46c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 05:24:49 +0000
Received: from IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94]) by IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94%3]) with mapi id 15.20.8093.023; Mon, 28 Oct 2024
 05:24:48 +0000
From: Michael Wu <Michael.Wu@kneron.us>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: morgan chang <morgan.chang@kneron.us>, "mvp.kutali@gmail.com"
	<mvp.kutali@gmail.com>
Subject: RE: [PATCH v4 0/2] Compute HS HCNT and LCNT based on HW parameters
Thread-Topic: [PATCH v4 0/2] Compute HS HCNT and LCNT based on HW parameters
Thread-Index: AQHbFYWcUhFVNJPraEuZIGBYaKLDl7KbxOZg
Date: Mon, 28 Oct 2024 05:24:48 +0000
Message-ID:
 <IA1PR14MB6224565C9303101927293A768A4A2@IA1PR14MB6224.namprd14.prod.outlook.com>
References: <20241003111525.779410-1-michael.wu@kneron.us>
In-Reply-To: <20241003111525.779410-1-michael.wu@kneron.us>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR14MB6224:EE_|MN6PR14MB7268:EE_
x-ms-office365-filtering-correlation-id: 1027e240-e30d-436f-81a3-08dcf710d77b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|80162021|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?dvBUxt4v7P/mNXenaBLY/rzIRpWU6C+ovO8bT4P8isPS7fi3Bz2AsCQyJjO6?=
 =?us-ascii?Q?RSQzPVDsv8uZ8FZ5lAuMz6ldsAZvCu0Djr+IbVrRDQXH7tsE4LqSHCOtrp6o?=
 =?us-ascii?Q?DUDB5j4RURZxJ0MVhrotEe1T20mt/Em21TBlIeV1f6F1rgN0eV3npDzsAluM?=
 =?us-ascii?Q?O7G5nNB0rwCeHq+st7sWdUZiHdhUJO57Srf0E/MXqdY0Xd/VsO2lDMSUvSZe?=
 =?us-ascii?Q?leH//JpMZmsQ1w5TAZYra9BCzuYjHyHo8NTUfR9l64To3/2LfZSFFNd8LEMk?=
 =?us-ascii?Q?D8Y5jnzoqChcudvN+SPTd83vYvcx51VYyg47HXrF0FyB5qwXTCxf0L3yQYQD?=
 =?us-ascii?Q?XDSum3l0NSj1JN6UOLSxa7uTRF6v+y+QsGK2zHLWdDw3sQUVcS+GR39FUdA9?=
 =?us-ascii?Q?dCDWDdXJgZA4Mrx1ZCo2uKJx/vIX0u5Mw3WRZ0iE1Q7aNhDOSL/NHZLM0qko?=
 =?us-ascii?Q?8WsPRG+jysb0Jm7UvGaWx9rtadAaIaMeKRUVDm9kECNTRAjONopE8DFvqPZj?=
 =?us-ascii?Q?Dyk1ko2lyfW5NDv/30UUkiG0yUro3C7UngbYWiA1GHyHtLE7JZ3Uo7vV4Y+k?=
 =?us-ascii?Q?EShkhi0X5Bx1W5hKT3v6kcOLqeNFWkimvBls1Xp/opFrUSTDowl4m9PGAXbg?=
 =?us-ascii?Q?OSXag40V0uhrwKweX7izM/SsdsyIPhUEMB0E2oLCtMKBxS7XsNexM1DXGpLp?=
 =?us-ascii?Q?iPH+nXR12NkIJ/etTDh8z/EUHShymACXpckz1FQxIC/YyKTNZx4fReP7SNUI?=
 =?us-ascii?Q?WF9RQXG2jtUEo5iFvljddpzCz5X1IFRE9pm1n5AdM69lVyc9tvQK75UEYxMO?=
 =?us-ascii?Q?3YQ/Q27PHaoBxNvsOcgX/4fVL1CJB8IBe5q6b3Lo85uvDgRifM7z4GwwSuId?=
 =?us-ascii?Q?yZ4/SOIprHZhRtGivfeVAJ/pyFByRi/5tJpbRuZrGk64V6AtZB+h2qLKc6/e?=
 =?us-ascii?Q?3Dwf2/nPqzK13rBBsnInWZKhFJ5f/s+AywepVLOp9iXbiAtGDWJBQT+fyKbp?=
 =?us-ascii?Q?ts93Hya7vuHFkUXcOD3oq0K9wTc7wtbj1Fr1rw0ZCwdgUarFX9QdcsKyOg1K?=
 =?us-ascii?Q?hAFA6CXk9PvCJTwmTBRPxLhdgOWC0OGq9I5cM8Ah9lCMmV6HAuUgxo6AHpCg?=
 =?us-ascii?Q?lu3vY7KyVvFEGVr3K3x4KAtYL8g43IzYNqu8TDiVjKR5CaYvLCv8y9Y9Oy4X?=
 =?us-ascii?Q?mccVpeBCn0o+TQKUsJTqMBcMcVi5fjElj6vxF8S8XKa4OsBQGJu3yor2os3b?=
 =?us-ascii?Q?75JfZ4XlmFvtPuc3ygn3D0S4pBDZ6sRPvp5KxMrL8/wloHm/s6FjV0LzZINJ?=
 =?us-ascii?Q?7ZH76iwiLYKmaCz/l7VSdFCXUX2Phh3DlI76fkzqZrDSJw8Y1Ptkre/HTBif?=
 =?us-ascii?Q?p6QAwbkepZ2rc+5NVrlC94R9Y+xzWp3e/H3TU2zxIoMOTKHa2g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR14MB6224.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(80162021)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?L8rw5Jfw0L0At1tw/MChDBLKW+O+wIGQa/93Yg+Fx/UhsAEBgo71HZdmXy/W?=
 =?us-ascii?Q?v5AFMoP5HZ1LcdXmDw/jSKxK89hvCS/HDbzmg+4BZdVtgcs3zRlTMcD22DNB?=
 =?us-ascii?Q?JGnmkRqISQYyNZQHe6oH+wY62wy0IveoZMyF0Rw+v2djwUcroB6lYSSGGZX5?=
 =?us-ascii?Q?R7L909mR9mj262MdsSRXrvLJZEKqQW9jpb0Kc+bZtVPSREYh0gF64p4CtHnr?=
 =?us-ascii?Q?9mwb86IZ/cpLP+IPyiJ5KZ5BLebjcdfMgT/O1iNFcMVEvQJ4bGgcfry0zfyd?=
 =?us-ascii?Q?X/f9tvtpRO+Jz/wUo2mR72CEX+SGvLOlvtpnBzMEp85YSaeey7rMoiHRzBie?=
 =?us-ascii?Q?icU3PAWsagGfaA3wKcsTyAZI/KwpUDQnGlGZnVHZeOXESrLBHH1chpwIkVTe?=
 =?us-ascii?Q?cSwfGoUDso2GbdzPmsBNsD5vJm6jW3FayKhsH0pWOJ4EK3wSSH6XgD0t4LTX?=
 =?us-ascii?Q?eTvEWIusneQ5/a3TaZ57TolIcFxheYNzyA6GphkCIokRU3/c0Ej6st53HkQQ?=
 =?us-ascii?Q?lWJKXN3YSX54j+MLoDO8Bt0mQntlhGD+egKL6XYbE4n1XCF8e/W5Gvv2OntZ?=
 =?us-ascii?Q?Pk1Ug8NWx9GZx8FBIXCE3asebB5qjKvYpaOtzfPomHkurJ95w5H0uZpRgm72?=
 =?us-ascii?Q?sqT9Cf+aPjZg+JORoya17/ZE5kbEOGgZUa/+CM0EXwdBK+mea28T1nJ2WPel?=
 =?us-ascii?Q?MTtbjfQzBokdweMqlWUvZcpQKGHVXbNvdBA0UQE2WomKT2PR9Q4EEOdn7hJY?=
 =?us-ascii?Q?z964p9RrjGRom63Y+y6WTbN2Rf6BDOsiDu4perb1MN2T9iOeK/ZYx7q6dc2O?=
 =?us-ascii?Q?9fdaL3hvORymIvJmamn4JHRUSnCeJNg1S9du2R0GmrPD2xUpA/x9f4oXru4m?=
 =?us-ascii?Q?slFNhpP0k4ei5M07TtbNk35ci+nDgP9VonMZ4cmfYPHQ0ecDF1e8QsGSpik0?=
 =?us-ascii?Q?mUeAnsAi/1385Kff6I9dlYK/csB1Ws9Rzyfya7OmNzswl6wJw2DSanHUUALv?=
 =?us-ascii?Q?iPCCuwBjVheJ6WOOohy89Ux0QMzA5yzYkRa8TGaw7E6y52lmYqz/KWZ2y7J8?=
 =?us-ascii?Q?6Qg5wNHR+kzS6oUFPWREvzOIEtMYSWMTwCVe4LEgLrRYo/WozxqXKl8ZpE+0?=
 =?us-ascii?Q?c4AVhfDpWC7GGOItm9zaEFg2sZz11Eg+V7IenflFfMsIdNG67Qh536ok1tbA?=
 =?us-ascii?Q?1oaha3viiq2GJ7ZqLqQHW5rty7C9mbUk2spne/krKFpnqt3pHXdlLishio/D?=
 =?us-ascii?Q?9cFlY0nd4hlJGsL90VQgMBVn1O/sKtW/UUyUj8PeVxWsQl54lGRjQ4k3OQ/U?=
 =?us-ascii?Q?OoobX34QibHySW99RPckZ96lwL3koxzPHz8ylflUBmXZJ/iu5A0tTq8WLCh3?=
 =?us-ascii?Q?wDoIYU52SZgdRzVSkcezylSg2beLlZAGAnQJKF4wRfqGOj/exOQpT1hTnVuv?=
 =?us-ascii?Q?TlLuElakrIgZXb4UwHRCviXGCdw/muIa1pmSjiW6/243AmUxgFImb/zlU7am?=
 =?us-ascii?Q?FGGrVznY231V+Z///jjMcqROcpJG52x4kylTs3eerlMBwa+nQN4tQpyjp3zG?=
 =?us-ascii?Q?LvK7CAmwOvkChyxZbZg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR14MB6224.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1027e240-e30d-436f-81a3-08dcf710d77b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 05:24:48.6059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kSvkus5Zo0DObDx8jd52BKLCnZFtrPFy+iXv1osQmcpvkzMvSVA/xfuVzrsr0jGOPLMdfs0vDUKNvnP45LeuHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR14MB7268

On 03.10.23, Michael Wu wrote:
> In commit 35eba185fd1a ("i2c: designware: Calculate SCL timing parameter
> for High Speed Mode") the SCL high period count and low period count for
> high speed mode are calculated based on fixed tHIGH =3D 160 and tLOW =3D =
120.
> However, the set of two fixed values is only applicable to the combinatio=
n
> of hardware parameters IC_CAP_LOADING is 400 and
> IC_CLK_FREQ_OPTIMIZATION
> is true. Outside of this combination, the SCL frequency may not reach
> 3.4 MHz because the fixed tHIGH and tLOW are not small enough.
>=20
> Since there are no any registers controlling these two hardware parameter=
s,
> their values can only be declared through the device tree.
>=20
> v4:
> - yaml: re-formatting two properties' description
> - yaml: enumeriate bus-capacitance-pf
> - yaml: extand an existing example
> - driver: modify the commit description
> - driver: rename "bus-capacitance-pf" to "bus-capacitance-pF"
>=20
> v3:
> - add vendor prefix on new property name
> - read new properties in i2c_dw_fw_parse_and_configure() directly
> - in i2c_dw_set_timings_master() check dev->bus_capacitance_pf and then
> decide
>   t_high and t_low
>=20
> v2:
> - provide more hardware information in dt-bindings
> - rename "bus-loading" to "bus-capacitance-pf"
> - call new i2c_dw_fw_parse_hw_params() in i2c_dw_fw_parse_and_configure()
> to
>   parse hardware parameters from the device tree.
>=20
> Michael Wu (2):
>   dt-bindings: i2c: snps,designware-i2c: declare bus capacitance and clk
>     freq optimized
>   i2c: dwsignware: determine HS tHIGH and tLOW based on HW parameters
>=20
>  .../bindings/i2c/snps,designware-i2c.yaml     | 18 +++++++++++++++
>  drivers/i2c/busses/i2c-designware-common.c    |  5 ++++
>  drivers/i2c/busses/i2c-designware-core.h      |  6 +++++
>  drivers/i2c/busses/i2c-designware-master.c    | 23 +++++++++++++++++--
>  4 files changed, 50 insertions(+), 2 deletions(-)
>=20
> --
> 2.43.0

Hi Andi,

Please forgive me for my presumption. Regarding this patch, will it be
merged? If not, please kindly provide any suggestions I can make to
improve it.

Sincerely yours,
Michael Wu


