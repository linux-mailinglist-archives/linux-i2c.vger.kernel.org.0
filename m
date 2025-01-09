Return-Path: <linux-i2c+bounces-9015-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1177FA0801B
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 19:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC0553A7084
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 18:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D647C19CC14;
	Thu,  9 Jan 2025 18:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zn7Ziu8S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E687718DF64;
	Thu,  9 Jan 2025 18:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736448481; cv=fail; b=LqorYjPNwovq1Rs3z1NJWi1u9sWsAcwHjPz0hKy/yQXdTQCWKxwvv/smNx4pioO9MZNgfB2c3ocil/mbNU8JTD4xdELLc04s7klTStS9O01CdufkykPetFFZ1h3iBSrKHTtaFJ9aEJM4YJGzE6yl/NjC+UV5ABEd+V7fenJ9iy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736448481; c=relaxed/simple;
	bh=3KbNx7FbHbOTQECO4/nGMupwPcNR0OOCAXOlQ1fkueE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BAFX9KhUS4r49efzuX7cZeevfr5BNgXIrdXvPKxB2qQkxZnpL2XGfD/eEP9WvDZ7t1Yjdtgm61IRiuUNXqB5DpFR2Yb6cZcQdo6cgz9dRCX2QqzgamsXxSKn59mVYY6FbnppZRgvEN0xPM+uERRL8aXR1YhaJs+2zLsMs0NS6Jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zn7Ziu8S; arc=fail smtp.client-ip=40.107.243.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOIZ8PkEv5ut0P2KK44ZhyoQ8C8QsGAxVpVrQGBTnDuyZXtyaYyAxCKs/GfZ1EuzZ5uNHeAD/x4Aejpj1U+zzJIWy3OSyuFdLFZ4c4TQo8R99dW0bdJWccYVCkz0rTwDjLY2izT4VaSuYJD7dYicWqg3Uw068dEmDCQU9XjpIUDwYHL+Jp9nN1bfaOPMRXTRU4zD/QxK/nbzudvXu+MVVntyxs97E6L1EDy9ho0YqwxMha6sukQyaxOCdyMlZo72f5XfjiE8q+Gl793Jvnh2IiQwYt7KJ7kvLCvOemHqKXuVYMXzkhML2lIPv/FpG3oHwaHBYJvxc0ylEv7Is7+gOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KbNx7FbHbOTQECO4/nGMupwPcNR0OOCAXOlQ1fkueE=;
 b=AMKAqVeJ5zhG+FHujWEylRRl59ofGTjcauUAhqzUB6QJBr++eWFuSfRqow1XQOIfaS9TTsaN4PvfrDin8rQWAod5ZE3KtLu3weG3pnaD/P63HWjAdkPyi4VuQQSUm9oBG5oKonJN4fwxo0nnNJcsRfqprFmnDLX2x1SMvigr91G/FPf/GBss8/0tR7VdRVeb3zBSDbRzR2aE2AspiDEhSYtaI0ea8HpbdCvvzP4KowMTbzKdRfJ2TkezT0YK7CdyrGfhtIOcDyw3oL/RxE3H1jJitHds4MQLGt5FhIImWwMpViUIN4JFWU6cvbL3OKrh9D7vrVdCNZZ1vsOOshc8Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KbNx7FbHbOTQECO4/nGMupwPcNR0OOCAXOlQ1fkueE=;
 b=Zn7Ziu8Sh5+x/maisVANOSUSVoGL7nmGldM2finqUqpdqNyCorc2hfATBANa5kh/CTVUaZVx2tupJhVXEXrMWidcuVIiZHrUvLYFq2SM27GfYC4nhOOXbXWtfOjVmumd5Mbz7/DxhXmfeZhcxG+0/nYSFQdlV5LpsleDna9xHWU83Q4HycC2dXkLrbA7QBtl/+/z9VWeO/x8d7Z6WRA2HDIdEXpyQ8wZ7zmsqyLAng+gVFReiWSInUGMv7+2ug0WfU7I69mSQda4kUClXLx+XIKo6cfJT6/9PpSB6UxigWB3Cs2nEkZD+ntMAqh+3oRg7jLy2FoVa2OncuW/V0CbtQ==
Received: from CH3PR12MB7738.namprd12.prod.outlook.com (2603:10b6:610:14e::9)
 by LV3PR12MB9266.namprd12.prod.outlook.com (2603:10b6:408:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 18:47:55 +0000
Received: from CH3PR12MB7738.namprd12.prod.outlook.com
 ([fe80::fad1:1acb:f5eb:98ee]) by CH3PR12MB7738.namprd12.prod.outlook.com
 ([fe80::fad1:1acb:f5eb:98ee%4]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 18:47:55 +0000
From: Asmaa Mnebhi <asmaa@nvidia.com>
To: Khalil Blaiech <kblaiech@nvidia.com>, Andi Shyti <andi.shyti@kernel.org>,
	Chris Babroski <cbabroski@nvidia.com>
CC: David Thompson <davthompson@nvidia.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] i2c-mlxbf: Add repeated start condition support
Thread-Topic: [PATCH v2] i2c-mlxbf: Add repeated start condition support
Thread-Index: AQHbOsfFFpXZXDlZjUqzx8IZO9pm+rMO23oAgAANAYCAAAEkAIAALrYw
Date: Thu, 9 Jan 2025 18:47:55 +0000
Message-ID:
 <CH3PR12MB7738D030A080E3B3EE7AA536D7132@CH3PR12MB7738.namprd12.prod.outlook.com>
References: <20241119211215.352797-1-cbabroski@nvidia.com>
 <db3daq7guy52ywmgslnmphx4mxyp2l7swq2y6erezokolg3v6u@p7ufvbi3tarc>
 <xmm226aebgwmpjzekxlvhcgstzss4uq42vpj3zjp23ffhv76ma@y7hqbw5a56md>
 <BL3PR12MB6617CB02D6014B6A2FF77E3AAB132@BL3PR12MB6617.namprd12.prod.outlook.com>
In-Reply-To:
 <BL3PR12MB6617CB02D6014B6A2FF77E3AAB132@BL3PR12MB6617.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR12MB7738:EE_|LV3PR12MB9266:EE_
x-ms-office365-filtering-correlation-id: e79d76c0-312c-4503-899e-08dd30de2145
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?V0QTzQjxuTDJnkNuI7VGhEM/hJRdOibWvznwbQ2HlkCgf6Tmh5QEvjJC7AuH?=
 =?us-ascii?Q?mimWNVP+EOjpdY9VRsig6obSU8eMLZegLvViap4rpholtfQMv1uTrF4H/1SH?=
 =?us-ascii?Q?BbdzMueonABbpqxdlAnpVCCOb1jLmFmjqY5HRcRjcEYIR3WDPMaaN3wqMwQO?=
 =?us-ascii?Q?oYogbSi2zsCNG/JPcIiEoOSTxD1vK/FsI4qHV7oK3QVwyl8D0mn+8EV/PNvo?=
 =?us-ascii?Q?5n+5Hq8KkDnpyo3ncR62dSsgF6WRk667e+VpU5iAokhNUdLy+OC8Nu4lXFJ2?=
 =?us-ascii?Q?PdHgOr2JtdYruww2f1WzBJ0cPIBw9IMuzn32Yc+2IpSUfld+VYe7QkCDv8jn?=
 =?us-ascii?Q?zs1xGwoR7GtJ+b5BJL3rdRnvVvWITzfmJLbGNOcSQj/HPyTmTBDx1Xda2TgX?=
 =?us-ascii?Q?UNWbukMcOMkYrz2GKNF/D0wqeGPzDhfstq8MaShPH0ZJu4i847SKfZuvZtWg?=
 =?us-ascii?Q?3Y/7eD19Wa/5K3KvLmtjhK3A87Ym2SQhtE9gPtpKwCDGKsK4glfdKy2eKkcv?=
 =?us-ascii?Q?LRpNpL8m/KuxKLuJB/6z10KnJ24zIUEkQe5uYZ2dzHRkta8H6D7TEZeH2pUJ?=
 =?us-ascii?Q?lEf6CO5F0Fp1Cpe4SbA31hI6+JQSXpG4ENKBnKL197K6i6hBwWLTstBQvEdG?=
 =?us-ascii?Q?1Ol1VNWkAdX4p4PcbJjAL4AgPiMzK5B67MhZRBXtzJzinDU44TPB9A3gcQoH?=
 =?us-ascii?Q?utBQmVpsSRL3EGK6E1tpOfYLKRuzK5e0M7Vc2Gwckp5kDYlHQtooNX1DRZMu?=
 =?us-ascii?Q?KbBMq4ak+y6AdmP3buuSwBwL3L6SmKy2d5nVGfw2mDT20WTEfcEuwAhkUyO2?=
 =?us-ascii?Q?xDTmp0RxgdVsoQ9g1rJq4Fffg8GpJulLbH+QZ6L2FjLUrR5wUKrg0H/jQ4zV?=
 =?us-ascii?Q?PjG+KsSwJ716SGg746hZGm3SkEMKl8CLCAf2HvjUonba/KJ20+b6tdVq1y6u?=
 =?us-ascii?Q?Ta/hCRNlGFf2VAzEaNyYCQ2bZkZMoE3X9iIPLB+N5ssOSHUx7HtgKsRvZ2n/?=
 =?us-ascii?Q?QzD0Gff58jkjAC6ba2FT9Tzfn0J7THDr/UhfOWoIuPeru7eYldcv5N+D0cC+?=
 =?us-ascii?Q?UBf6+UKQGVZ9hLG2FOdA6y9h1iLj1mwQ0ul64OvVPEwYKuL6vhlTC59IrXVx?=
 =?us-ascii?Q?I+HDR6VHdqVfa+os0XPklv8+g6afdWO/t2b1vxgmbAANjclAW4mfLQF/bJqY?=
 =?us-ascii?Q?8CK26ODWUNR6sl3oynAGQgzD9MHPGHekCGxXpjzQPFSJBIbDNG0xME7PUoo5?=
 =?us-ascii?Q?M93ouTWaaGAwppeUqTrHTEhBqeNEQRYV9nLnXpWfQwTaFMIM8b4shhdoVZVY?=
 =?us-ascii?Q?0fhG5oBYqhRKpsExLHFq7UGr4h2lhXbERm4URJ/WyOTMWXT0+dYrV8jtmjk6?=
 =?us-ascii?Q?C8wF8MygozPmbbZ95OgcZQWtbH0mr8SU0VSVr1ZoTPW6Dn2+I9tbyYn1z24S?=
 =?us-ascii?Q?yv30dEm8glda1RQbIWzwpiEwKE9jhlPD?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB7738.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bDbj9RYnpNFykTgsXkxMgVXmhITL/wtdrfVY7+uT5zE0BR66zLoZeFZDu9Zl?=
 =?us-ascii?Q?DENZ1wcTup2LICiRjUzq6+4uxe6Ak/1yihp/mOuk/740EXP+O4a1Vwd15uDv?=
 =?us-ascii?Q?MXpYD6NGA+nReowC8yfcfG3BjTplyq1r2nNne//jjKg4+s+xeeicdnF4uDKo?=
 =?us-ascii?Q?eze9ahOItJdSB+j82nHwBmOpygAeuh07WXzKAuLnMv6BpLnRdY/fAZoLvoPX?=
 =?us-ascii?Q?cQomdrBwK6UAvMGHvDfrinYMN1KyUaOL9Faxf7Wl0Zhy3yQ8ne0xiIef61d7?=
 =?us-ascii?Q?HsPWSOnei3ItwJ+3FO0qWWQP3Q0vqYcGd8Gx9PSU8fcJxH4rqmCsB0CHqiXx?=
 =?us-ascii?Q?LziV0AokuXQ2wbsoygJGbVov9u1RL32ka6e5BsoZKI4ZbfoSIuvaZGosxycU?=
 =?us-ascii?Q?xHQvP/wHSKX8Oyy6RW0vKAPNSi6lThoB9Srw5bCuCnbVG2sNNXQrOsqSxO4t?=
 =?us-ascii?Q?iA/cQRTKrk2G2uaIlIrdgI9NRf/4oXB+2mhpaBhwd9WoPZPpVmPY975O3K4I?=
 =?us-ascii?Q?WsURiC3thCXfopmxSyLZ5gLe+cP4bDnWPiuygSwIaX4A9i3MLk3iv66nHrfF?=
 =?us-ascii?Q?ljKGVNNTItio/K+PofhLA+rJ99NNloMaClf++qnTSgytQz5R/Vre6MxKTC6A?=
 =?us-ascii?Q?OEAP3A1nOsdpg3RTg+kvl3vpwABZlGvLsg+b+3jLIdm0u0u66RczGUbfDB7U?=
 =?us-ascii?Q?oki444u+Rp80pS5eHY6O6jgOrvB0S4wZ7YP3BafvMVEsEs2jt9NXECmSUT2V?=
 =?us-ascii?Q?VHhHBlNlZKVna8e6qCK+I4yFikEITwJFkiwxb2ZPVdg1BGl4E/Im4+9xPcdz?=
 =?us-ascii?Q?QD1RdrPgikryES1yjm1bpKhhLD/lHkx4xBJbvGZrvKPqwXaRTbr4CmxVavzP?=
 =?us-ascii?Q?kRBBoUNEjsQRMc6ZJvvYypGIelEA+gXCIuzg6S3jKf2tLGkWAElHfZrJ/oCO?=
 =?us-ascii?Q?M9211K/KhUNGTpRkfk4xYxLOmsjM7gH+vJJ6TEtdbRcwHon5/8+ZVGO7QCEA?=
 =?us-ascii?Q?hHqmV54b1YtwZNAuu9BzTQ9ctTFBEIAq4/kmJWpftb6xal6xNqQmqwxv0EGZ?=
 =?us-ascii?Q?CjpN8jbp75J/YzCbTeiv2J0hd4yQD94qe/fKLaXCXVg/n1Q/xnA2VWtnLpjJ?=
 =?us-ascii?Q?UKbB4uj6nAeiWsaryLocnHzlJTnY/LW26B24Jjq46mDK2fekk884puaWf6BR?=
 =?us-ascii?Q?1I5iIHtTx2hvOF3GY6cqn4tBksKnDDlM2tMh+5ROJa4kyyZl+bu8DZl9/IH3?=
 =?us-ascii?Q?BhYEEId2F55gFZITLx858ewzIlcwBZELfwm+fDLTKdxGhBFmfRPLcLbX0btQ?=
 =?us-ascii?Q?P7UFjeGFNAp7X93FhRB3wT2xirwFSY2IFkb+Up5tx96BmYQ4k1FVLy1stOBH?=
 =?us-ascii?Q?3TPTercS+dZiELBxnJoecE7rVw8g87caLj101UtsUMEcy/rMsYQoLg/x7K0u?=
 =?us-ascii?Q?KECs2EPfpnCF9WHSRWLJvMy8Nb1cRw4foccarASIKEVX+DAMsd4sZlhgZJzQ?=
 =?us-ascii?Q?lJI44Lu6HFq1M8NU7nSYkoSJ38xg2fMWO6zMeZCBEMt+cUby70M67Zy+/q7F?=
 =?us-ascii?Q?EXmuy34s279MOdnDvfXW+CxK3ULBEDBgjSx0K12XgscKZiSzaOvMerHsvMiV?=
 =?us-ascii?Q?VytxnPWNza3xq9BCRX4haNo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB7738.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e79d76c0-312c-4503-899e-08dd30de2145
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 18:47:55.5496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xfj4V9mvIw9EyfQWdui52H/TLUwIswYcnki0F7DZdf/wtnvQS6WoLEuKbIudk4e2ULHXFQau68bTbDGhfo7Pdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9266

Acked-by: Asmaa Mnebhi <asmaa@nvidia.com>

> -----Original Message-----
> From: Khalil Blaiech <kblaiech@nvidia.com>
> Sent: Thursday, January 9, 2025 11:00 AM
> To: Andi Shyti <andi.shyti@kernel.org>; Chris Babroski
> <cbabroski@nvidia.com>
> Cc: Asmaa Mnebhi <asmaa@nvidia.com>; David Thompson
> <davthompson@nvidia.com>; linux-i2c@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: RE: [PATCH v2] i2c-mlxbf: Add repeated start condition support
>=20
> Acked-by: Khalil Blaiech <kblaiech@nvidia.com>
>=20
> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Thursday, January 9, 2025 10:56 AM
> To: Chris Babroski <cbabroski@nvidia.com>
> Cc: Khalil Blaiech <kblaiech@nvidia.com>; Asmaa Mnebhi
> <asmaa@nvidia.com>; David Thompson <davthompson@nvidia.com>; linux-
> i2c@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v2] i2c-mlxbf: Add repeated start condition support
>=20
> > Can I have an ack from the other nvidia guys, please? Khalil and
> > Asmaa?
>=20
> I know that they have been reviewing this offline, but I need this to hap=
pen in
> the list.
>=20
> Thanks,
> Andi

