Return-Path: <linux-i2c+bounces-14639-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EB3CCB278
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Dec 2025 10:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A253301E9AD
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Dec 2025 09:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B245A1E7C18;
	Thu, 18 Dec 2025 09:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kJs49k9Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010042.outbound.protection.outlook.com [52.101.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D081221FBA;
	Thu, 18 Dec 2025 09:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766049807; cv=fail; b=rqPS8wpNg5nqav9fXpFD1prr3n3uHd1QB4I2kg6LqH1DfTbEGy3q5l5P9GohpmkQhiGPR4Gbdq2QV5dOcfFL/K/ClyFwqqz3926kXnr5O3hap79lk9in2OAq8OQdpy+7LmZgjKiP/ir3r4XcF8IoKcgFOfBDZcz87ppTMyXql/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766049807; c=relaxed/simple;
	bh=SP24DmNFcnVIF7oUXSZa8ndht8nIhdHO2wQGGDh9DWY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iyFmq9TOnMHfaqvFdfdYz22KAI9U8OhRYs6+6FmIFaSqzK3NlunNMwlzk3rAisFghiGOiHESqYRLWB4f5HzBQ68/WKpYCFx7snZQb2RKKHEAVPD6DthW9yrs51Kbe31HpEpHWe/tLBkJZ2XfgvkHgHk9hAy7MVhwXmhV7eommpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kJs49k9Q; arc=fail smtp.client-ip=52.101.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXqyqktAYC7mn8NxL4RF1bwa6aPlYgUwkO6Lw8QYZ5bL+ta6gWK9wdjsDm5WwgbhB+TbH2jXeYEGHnq/HWZlsJF1ApqxH37iHINyKZBWSkmi2hsOtRKWKz6QzBSwORT00bsWb/0j77aDzlXL0g6qVpzkCSGTm4h7p92ZlRfOR0e+kIjSc2/E5fpRpZKo9IMe0tAgZlPTtmZae7rDIP+h1jrgrzWSVPQ9N7F+Y2c3EInRpKulnYEyEAW2fX4l9zfNOki0T8d8pInBG0dpW99cOfuecAmtwmimUt4fUmjXCyEj7eXR/th+mZl3vFVr/VmkJ390YBnZZBv9fPDaUIhX7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwdvpcGGl3uxpcpNgLs+QIOmyBmoMLqWSTohkJfeMNs=;
 b=C0qlcmT+IvgZZaXWO4M+bKfNc5Q9AuzzFGk3pxz/+ficC8xo5iPGaBWllWSK76EOLbwa9keUX4muou47ESKxCaWrH6/r9Ax1cHe6zEr2pa964lRPhKUQo6taandFzK8d/1Sfx1jMRHyJUSI1WHJ5OcruwmOD7VOpjxSrdqWGizC6VaIZKoQ2c2YeabVft1/5SXvSoUTf+Syy59UOp8WTHySMqY9LYxpGJd9ccA88weEcqQvZvzm/Aj9TfxbacN2HnOs9d7iERZBw7yOoc5cey3vaNUcjTbBAxEjxHh5f6jVoyHl0+SKlroeqVbSRikpzbwvI1GqsZTqaXEjINztXHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwdvpcGGl3uxpcpNgLs+QIOmyBmoMLqWSTohkJfeMNs=;
 b=kJs49k9Qjd5lnRQRgUI4WqiF4oGN/VYHnJiTn8RlG8hR8N/BbRmPZfIwJDAI8h6HI7MNyZaUgbalufva0M6bRV0auZemZE6huJ4W1oc0z/PLacF6zQPD/5XpqH47kqawZ0CW6ckwyFSBP0LJdpJKUJYrgT3K8Ew+Ql5Ra8jAsvM=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYYPR01MB6843.jpnprd01.prod.outlook.com (2603:1096:400:d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 09:23:19 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%2]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 09:23:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Chris Brandt <Chris.Brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] i2c: riic: Move suspend handling to NOIRQ phase
Thread-Topic: [PATCH] i2c: riic: Move suspend handling to NOIRQ phase
Thread-Index: AQHca17DsfRhAp0qr0GEOfw/pzuNj7UnJ/VA
Date: Thu, 18 Dec 2025 09:23:19 +0000
Message-ID:
 <TYCPR01MB11332073ADC4063F21591554386A8A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References:
 <05a31af3d6caba51e8237a49853281aa49bed916.1765540678.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To:
 <05a31af3d6caba51e8237a49853281aa49bed916.1765540678.git.tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYYPR01MB6843:EE_
x-ms-office365-filtering-correlation-id: 58e107e4-2879-4f28-9232-08de3e171557
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?k92Ytt3IO/5vkWm/d8JjwU6zxi6NbyEkzG6WZSrguo6fOaZBDjHSHVVTmxH4?=
 =?us-ascii?Q?ZVvwemOhG/q+X7ykB7a0PkVeQqQdH5tFtDORodhJWZ+pIBOwfDpjhOUgINNq?=
 =?us-ascii?Q?V7k+bpcCZ4+JedBjHcOsu4L1eM5X1JNkCmxeilGFvuao2pFTGknHZKm/45xL?=
 =?us-ascii?Q?r4u+zfoqG0P4CRkpCQWAbiC/zZIHRrK0oAWIXgS/sL24Rc11woW8wdPuOCv3?=
 =?us-ascii?Q?k3hCJd112C9fni4KqQOSrnncSDTb9nXHDJalr1FWXyAXgb2HJvOnWgJ6DLtZ?=
 =?us-ascii?Q?hdPq0kQubeiVv+O1CBYd/htZuOLPPCvDv9RsTVb1IuMSul5stTvOoZMcAw4w?=
 =?us-ascii?Q?UZO77SFMDhsedTYTXsEhkhlg8f7K7XQDVelNsdIx1jSEbcvn580u7B663sxj?=
 =?us-ascii?Q?nmGC7JY4D4YwtEQ+Ai4MRvAcrEpXEM9pRTTH8C6Ol775Ikhi4k+8pagpgf2J?=
 =?us-ascii?Q?FKZXbFYYkfpPCQ1DF5YntW0MOZ2z3B3uYrlxH1BNeD+A07pk8GAa4GNsOxXg?=
 =?us-ascii?Q?5oJ+Q27+9k7f+ZT14Pm3tKX4CBj0TLEPNUgXYHxtet+lXXFb3spDPPoC/95h?=
 =?us-ascii?Q?T0YxZ08nHJsK3eJVZrgdWV7ykmeMEAq1onyhFsvMoZEItdA7Z3Y6SBDFdSeW?=
 =?us-ascii?Q?qGQbma+AxLCEzhdVbE5gcZlOnHECzYLqCv/P9UG7OlS5KIpgerS+sRxFcqgv?=
 =?us-ascii?Q?aOmr1SUyvTJPqIznBuS9iHKjZxz6ZGH3hkPSj2MSthjuVY6D5cx/MYphv7zM?=
 =?us-ascii?Q?Hg7w4D+7I60+hvHVn1jjWxyBiYrzAPOzV/HsV6HZ4L3v/V4c0KPySWIZZz/g?=
 =?us-ascii?Q?6fDMV6AbiJx9dDAIcZ66seznW3bNcQcfN4/6DQR7wDXv+Ir7p+GJtzcpyRMN?=
 =?us-ascii?Q?/bgpuoUfnRCxhK/ZZA8VHzTarW58VeuR/V3MqEWXTdl7I42lcRnaMeh3lUEu?=
 =?us-ascii?Q?feiKS12yfSLYvUwDMJ8+Ip/T4tnntj6UjYE/cXojQbbp374GdrsoyD0jZbSm?=
 =?us-ascii?Q?B+44M1TFGWuOtzRE0SLnvPyfoy2NmwY1/QunggtXesKlCs8/Q7bGVVsev7We?=
 =?us-ascii?Q?YaAIUlhjbeH7303m0Hmf5IMAkLXt4LMIce+TaxjFeOeLfc+O0XVcXYSf3ouV?=
 =?us-ascii?Q?YtepPRp7s+G8pmvf6rQY+nrAjbk4GoVdfKwfcIpVxOCFcrah84OseSz1o4lV?=
 =?us-ascii?Q?Lyi+y/aWuK9p2/FR0IPp+Xw70Id06dIPCFm+oshTdURBE+V1suuhwzYWr8OO?=
 =?us-ascii?Q?S8TO8g+yYyTJGSS2iJIEfINelU9mLxJn/d6scplIg/NBt8NiHv+mDdjInZKo?=
 =?us-ascii?Q?886rjbVfn2a8a/C29D9Vk6gI/jxgf9EyCNpi01bJhTYAYWf39YyOa4CqfZh2?=
 =?us-ascii?Q?Pmg2hiG7or/iOLF48s34ohrVOQ46KzA0reavaCux7kzArKcsDZV5NeqYDPB5?=
 =?us-ascii?Q?LkniInoOrizg2dHMVjHa6iNoEnZH07cFhGpgOLJc0WgAjtTD83T7WQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XZfH0Q+o2AwVMRcvbZ4Vbh5DcGY/H39Hk3TQluL8c0S8FRI5CEq9dsiN3Jv5?=
 =?us-ascii?Q?ExNOrqU/h1fL5e1EH5klR2US3bjeIat/ADDNhCFezNfCeZqp4bwI+t9osDbR?=
 =?us-ascii?Q?PCj4TJcAYseLtaZktEzdl7Ipv/b5QzTWzZmdgJ7pn5W0GCsNdRoPwP5PDL+e?=
 =?us-ascii?Q?RQBrCm8STSj4JpHJfuRsyr3LiRKqPJVlpj1VZ23WYieUJf1TeeW6qz2ZH0or?=
 =?us-ascii?Q?2vaw7+8das6FARtGCmHgFWNdTkfmpPxLcXxtfgXsoY20tQWvn6ZCiXp22uU5?=
 =?us-ascii?Q?UFMOdmOgPiXUiV1s/HCk8RkCI+8BUNzjQCCj3U8xRZNyIwo+q+YqO7WIAHq6?=
 =?us-ascii?Q?B4Q6EpgzxUXnkRYLAbBIRwlgim1kuzzcjo8gUdLFB2SSMZFQxiYlMktAGtgH?=
 =?us-ascii?Q?5L+uby3PqaGxjv1d/8N8Ik8Bm6DoZHtj8dZqPuNqxB+XcmOuZqBiGS6ju0nh?=
 =?us-ascii?Q?WhdG+KkIGRGKEKgeBZ3vd8mlEWSLjAFeaDltRBZ/nzhoVlVkSeJZe78zmss9?=
 =?us-ascii?Q?zc7TKfp2NmikRBDBHmHXfGGD/RjiDoEnRrw8aV7WyEIvNrMApYde0eqPNWng?=
 =?us-ascii?Q?Js+S8dm/9Bs1PfK1D7J04FUxYy8w6vCwxQBKOAlPm12eaaihdmjXU6dCMxNR?=
 =?us-ascii?Q?4x5p2706ZeGpptFoYg70Ib5lxHhsUOYOEKc2gJqyqjLJD5SJv5Y1FqUglU6C?=
 =?us-ascii?Q?fT8AK+i6JG+tzycNx6uF+Ibg0D5DdApLw/PDKP77iNB1nKPqq+mkIHTf8N7H?=
 =?us-ascii?Q?ZJBeKo1mpty3gmx2LAVMFGEkLoSyTRdD0gUu7uiqWHihlgPdINYTKHfUez3e?=
 =?us-ascii?Q?bo8blPIYo53bTR/Sv/UYt4zZzoY8lQYtQ3hio8qvY9hr0XEVwdh3FIw08Va9?=
 =?us-ascii?Q?CGoe/1DA9M+lXK7HPjjquHVjWurUAofjLA/H1eAW2CylYJGTslhwdFIEfgKX?=
 =?us-ascii?Q?idNyiLEPcD64Eq86kErwHhnFmsQF7qOdBXjPjcreTq2z5cjMWBn0P1wmwKdd?=
 =?us-ascii?Q?nZkqTeIpTvcxBIEhJe4GgsbdoJCPj3yGa5NOdqztcIwCnYuA9gg8reXoort0?=
 =?us-ascii?Q?DT/V2BjNc1iNvJSkh1SefvyyI/HtZ02aP45bxxLKe4O46GIDlqwXk5y3UQ7E?=
 =?us-ascii?Q?TDtLQJCLxKcKDW1NdFmw61hpIB4KtQ/j1deEtga51pxM3njz6/Dv2U2w/iG8?=
 =?us-ascii?Q?GFHs77RcIAyvHuHMv07GBOPExbwcysRWLC1TOy8h1CGAm3geDQTf4SeTM9X9?=
 =?us-ascii?Q?aXc+6X9q2ohO7c4hQeQ6QHHnG/oviCrchtcs7VIdw5O8qqPp51qMOTRnaV9+?=
 =?us-ascii?Q?DVqVIQPEX7jdzzgx1qSnhGLRHoLP7GH3a4J+U35Zj+21e1a44u/ujgk9zZL7?=
 =?us-ascii?Q?zq2uTh/rsivZ/103+cROl9hL720f9jo+xK07HjQJmVqccSPc4o7of3mOym4W?=
 =?us-ascii?Q?Y7Wuv1ZpO1TTf1fddIqGzY1JJLwd7MYkJGrmQKTSoXeGb7ipUtxRzqbH1RG4?=
 =?us-ascii?Q?vcL5EAM4i8wdR0jmpnaiAgS69fmhjf6FevK+DPvYZL6pThTQgZE7RNRD5wf3?=
 =?us-ascii?Q?4yvL3leC4YTkyT7mogZc7mOA7AaZF0I2+BSnE+nCUdQFIIbQ0JE9cXEcbmUC?=
 =?us-ascii?Q?4w=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e107e4-2879-4f28-9232-08de3e171557
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 09:23:19.5848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /fstKIHBXC0K3cTH0yKJT6DfcStXMB//7RHORj98zqCdvnrjXaWqDoBUEOiDZkJFgxJiZ7rf1U2WNoFNrsQfsm4dGFgdTIzdm7L6pYHgnEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6843

Hi Tommaso,

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 12 December 2025 11:59
> Subject: [PATCH] i2c: riic: Move suspend handling to NOIRQ phase
>=20
> Commit 53326135d0e0 ("i2c: riic: Add suspend/resume support") added suspe=
nd support for the Renesas
> I2C driver and following this change on RZ/G3E the following WARNING is s=
een on entering suspend ...
>=20
> [  134.275704] Freezing remaining freezable tasks completed (elapsed 0.00=
1 seconds) [  134.285536] ---
> ---------[ cut here ]------------ [  134.290298] i2c i2c-2: Transfer whil=
e suspended [  134.295174]
> WARNING: drivers/i2c/i2c-core.h:56 at __i2c_smbus_xfer+0x1e4/0x214, CPU#0=
: systemd-sleep/388
> [  134.365507] Tainted: [W]=3DWARN [  134.368485] Hardware name: Renesas =
SMARC EVK version 2 based on
> r9a09g047e57 (DT) [  134.375961] pstate: 60400005 (nZCv daif +PAN -UAO -T=
CO -DIT -SSBS BTYPE=3D--)
> [  134.382935] pc : __i2c_smbus_xfer+0x1e4/0x214 [  134.387329] lr : __i2=
c_smbus_xfer+0x1e4/0x214
> [  134.391717] sp : ffff800083f23860 [  134.395040] x29: ffff800083f23860=
 x28: 0000000000000000 x27:
> ffff800082ed5d60 [  134.402226] x26: 0000001f4395fd74 x25: 00000000000000=
07 x24: 0000000000000001
> [  134.409408] x23: 0000000000000000 x22: 000000000000006f x21: ffff80008=
3f23936 [  134.416589] x20:
> ffff0000c090e140 x19: ffff0000c090e0d0 x18: 0000000000000006 [  134.42377=
1] x17: 6f63657320313030 x16:
> 2e30206465737061 x15: ffff800083f23280 [  134.430953] x14: 00000000000000=
00 x13: ffff800082b16ce8 x12:
> 0000000000000f09 [  134.438134] x11: 0000000000000503 x10: ffff800082b6ec=
e8 x9 : ffff800082b16ce8
> [  134.445315] x8 : 00000000ffffefff x7 : ffff800082b6ece8 x6 : 80000000f=
ffff000 [  134.452495] x5 :
> 0000000000000504 x4 : 0000000000000000 x3 : 0000000000000000 [  134.45967=
2] x2 : 0000000000000000 x1 :
> 0000000000000000 x0 : ffff0000c9ee9e80 [  134.466851] Call trace:
> [  134.469311]  __i2c_smbus_xfer+0x1e4/0x214 (P) [  134.473715]  i2c_smbu=
s_xfer+0xbc/0x120
> [  134.477507]  i2c_smbus_read_byte_data+0x4c/0x84
> [  134.482077]  isl1208_i2c_read_time+0x44/0x178 [rtc_isl1208] [  134.487=
703]
> isl1208_rtc_read_time+0x14/0x20 [rtc_isl1208] [  134.493226]  __rtc_read_=
time+0x44/0x88 [  134.497012]
> rtc_read_time+0x3c/0x68 [  134.500622]  rtc_suspend+0x9c/0x170
>=20
> The warning is triggered because I2C transfers can still be attempted whi=
le the controller is already
> suspended, due to inappropriate ordering of the system sleep callbacks.
>=20
> Fix this by moving the system sleep suspend/resume callbacks to the NOIRQ=
 phase, ensuring the adapter
> is fully quiesced after late suspend and properly resumed before the earl=
y resume phase.
>=20
> To support NOIRQ resume, the hardware initialization path must not invoke=
 runtime PM APIs. Split the
> init code so that the low-level hardware setup can be executed without pm=
_runtime_get/put(). This
> avoids violating the constraint introduced by commit 1e2ef05bb8cf ("PM: L=
imit race conditions between
> runtime PM and system sleep (v2)"), which forbids runtime PM calls during=
 early resume.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 53326135d0e0 ("i2c: riic: Add suspend/resume support")
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/i2c/busses/i2c-riic.c | 65 ++++++++++++++++++++++-------------
>  1 file changed, 41 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.=
c index
> 3e8f126cb7f7..9acc8936cdf7 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -349,9 +349,8 @@ static const struct i2c_algorithm riic_algo =3D {
>  	.functionality =3D riic_func,
>  };
>=20
> -static int riic_init_hw(struct riic_dev *riic)
> +static int __riic_init_hw(struct riic_dev *riic)
>  {
> -	int ret;
>  	unsigned long rate;
>  	unsigned long ns_per_tick;
>  	int total_ticks, cks, brl, brh;
> @@ -431,10 +430,6 @@ static int riic_init_hw(struct riic_dev *riic)
>  		 rate / total_ticks, ((brl + 3) * 100) / (brl + brh + 6),
>  		 t->scl_fall_ns / ns_per_tick, t->scl_rise_ns / ns_per_tick, cks, brl,=
 brh);
>=20
> -	ret =3D pm_runtime_resume_and_get(dev);
> -	if (ret)
> -		return ret;
> -
>  	/* Changing the order of accessing IICRST and ICE may break things! */
>  	riic_writeb(riic, ICCR1_IICRST | ICCR1_SOWP, RIIC_ICCR1);
>  	riic_clear_set_bit(riic, 0, ICCR1_ICE, RIIC_ICCR1); @@ -451,10 +446,25 =
@@ static int
> riic_init_hw(struct riic_dev *riic)
>=20
>  	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
>=20
> -	pm_runtime_put_autosuspend(dev);
>  	return 0;
>  }
>=20
> +static int riic_init_hw(struct riic_dev *riic) {
> +	struct device *dev =3D riic->adapter.dev.parent;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D __riic_init_hw(riic);
> +
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return ret;
> +}
> +
>  static int riic_get_scl(struct i2c_adapter *adap)  {
>  	struct riic_dev *riic =3D i2c_get_adapdata(adap); @@ -572,6 +582,8 @@ s=
tatic int
> riic_i2c_probe(struct platform_device *pdev)
>=20
>  	i2c_parse_fw_timings(dev, &riic->i2c_t, true);
>=20
> +	platform_set_drvdata(pdev, riic);
> +
>  	/* Default 0 to save power. Can be overridden via sysfs for lower laten=
cy. */
>  	pm_runtime_set_autosuspend_delay(dev, 0);
>  	pm_runtime_use_autosuspend(dev);
> @@ -585,8 +597,6 @@ static int riic_i2c_probe(struct platform_device *pde=
v)
>  	if (ret)
>  		goto out;
>=20
> -	platform_set_drvdata(pdev, riic);
> -
>  	dev_info(dev, "registered with %dHz bus speed\n", riic->i2c_t.bus_freq_=
hz);
>  	return 0;
>=20
> @@ -668,27 +678,17 @@ static const struct riic_of_data riic_rz_t2h_info =
=3D {
>  	.num_irqs =3D ARRAY_SIZE(riic_rzt2h_irqs),  };
>=20
> -static int riic_i2c_suspend(struct device *dev)
> +static int riic_i2c_runtime_suspend(struct device *dev)
>  {
>  	struct riic_dev *riic =3D dev_get_drvdata(dev);
> -	int ret;
> -
> -	ret =3D pm_runtime_resume_and_get(dev);
> -	if (ret)
> -		return ret;
> -
> -	i2c_mark_adapter_suspended(&riic->adapter);
>=20
>  	/* Disable output on SDA, SCL pins. */
>  	riic_clear_set_bit(riic, ICCR1_ICE, 0, RIIC_ICCR1);
>=20
> -	pm_runtime_mark_last_busy(dev);
> -	pm_runtime_put_sync(dev);
> -
>  	return reset_control_assert(riic->rstc);  }
>=20
> -static int riic_i2c_resume(struct device *dev)
> +static int riic_i2c_runtime_resume(struct device *dev)
>  {
>  	struct riic_dev *riic =3D dev_get_drvdata(dev);
>  	int ret;
> @@ -697,7 +697,7 @@ static int riic_i2c_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>=20
> -	ret =3D riic_init_hw(riic);
> +	ret =3D __riic_init_hw(riic);
>  	if (ret) {
>  		/*
>  		 * In case this happens there is no way to recover from this @@ -708,1=
3 +708,30 @@ static
> int riic_i2c_resume(struct device *dev)
>  		return ret;
>  	}
>=20
> +	return 0;
> +}
> +
> +static int riic_i2c_suspend(struct device *dev) {
> +	struct riic_dev *riic =3D dev_get_drvdata(dev);
> +
> +	i2c_mark_adapter_suspended(&riic->adapter);
> +
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int riic_i2c_resume(struct device *dev) {
> +	struct riic_dev *riic =3D dev_get_drvdata(dev);
> +
>  	i2c_mark_adapter_resumed(&riic->adapter);


Is it not possible reconfigure i2c controller here like [1]

So that we can avoid reinitializing the i2ccontroller after every transfer =
(ie, rpm)

[1]
https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/i2c/busses/i2c-te=
gra.c#L1965

Cheers,
Biju


