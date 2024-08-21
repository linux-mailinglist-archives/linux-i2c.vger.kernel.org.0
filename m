Return-Path: <linux-i2c+bounces-5617-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 02273959645
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 10:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FA3FB2313E
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 08:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81BF1B81CD;
	Wed, 21 Aug 2024 07:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="sgarqeOp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73191B81CB
	for <linux-i2c@vger.kernel.org>; Wed, 21 Aug 2024 07:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724226158; cv=fail; b=edP84/v+A0AlGqFL6vtn4gLnajmSRbyvIrL4svS7dTqJ7pA9ToFtiqH9UJKjpci9RZFRUee+voJ7/XvP4S0D4g8CJqQUc3exTzApBVusYcTnhpGhLMOYrzbydobLTE6AWYB8UjCio5O9FjJQ12Kpk3GleS7rel+nqM6gnbBLJdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724226158; c=relaxed/simple;
	bh=FlPWiW573pM/9vagL4NG4KjLyT8jr9UuVeMyyxFhAFw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U9TXjope/cbHrMEdE0SSUVIm9rokleULzbm+oRcfhEQwjtZI2srvy9lblwDmyBLHNi93qcpwrUsko6Rg8TVhH994P4HlXZkE4RrHI3h6Ck/Y4YbSHT0xy962IPWkJw9/iE+uRb0oVXuZoSaG20qSIVE6xwNgqYONKCV/thRyYBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=sgarqeOp; arc=fail smtp.client-ip=40.107.20.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qic55Nt1pm5cZQUdAJ3nY+Ad/Az4BMZkiNCXzx0kcDBtDhImgUpXKbxbpLluoJ5Obdj97xwjyzwldC8AA5eubZKW9N/L9N2JvRcbenC567gj00WOiqVYvPSkOS1WbOI2OUs7bTKQIZZ0Qt9NgUNAKmq9kQvRKgEskBvNU3ywoqtjVAMZwG6rWRH9WZSXApXSnvZik+Jozzz2SsygNnq5oR/ESuLAldjvFY9VoOKJE2eUi7Yrn53sDbApnYjq2JPO4EDAUJ3o2MdBxqSi8hJtua4qDh1tqb7Vx2TqWa2BwKWzs/G0RNJDXtlWVgzy2eouXi2bw6AbfFWUCikKWjodkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlPWiW573pM/9vagL4NG4KjLyT8jr9UuVeMyyxFhAFw=;
 b=pkbiSqPdFuC/94KGHAWpGVklm277avoRJxUyMzdphMptC4e9SxIo6E1xSmk3ArAbXqkEN0t9n98JEqM1oO1BsPd6LHyn/DzHqMvwmPkHhmagUWPaNOYeXdusg5lVLtV7/SE1pVfnQUly4ddamFRvqzswD73Gw6R1DV1qyehmvWdWx6B1rxC7jGKGwmLyiyHJWcSDRUbZVp5nkTyckLBseQsTylYP5i7q5Ntb+SZlJfYPf323/u8d1hLsCUqiLQVR5VqvOmhb6gnNFGJ5JhfkQApZlI54FL/X3WjaMTr74qUlwlFhsGeX9Yr4WHXU9+ml7obS5bOCceQ6yhwVFuN2KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlPWiW573pM/9vagL4NG4KjLyT8jr9UuVeMyyxFhAFw=;
 b=sgarqeOp7gVY6wH3fXFqLP6Q+fQGPNBugXuBflbwg/aqm4HAR+E2UgIdogezLO7d4DHY3E1BLp8vJh15uo86TVZX/5ZuK7ULKLtJXGgrxv4uuouO7FYickeEq8S5i8l3hRyWgK8pTbudnmCfHmjzCxe6GVFTWc6UwOn5gZkWsCEkv/uTsAiFMmMMd9h68++rl3uZeC7nZ0wgVohFJunyN7xEs4qOmhKU9m+IvcUI2dUJHDdnZHA41J5pyFs2WKHhy3zjYUNCMgm9R/u9zFN89/e7jdk/Bd78zjuKGoRasYRu9zR9mWyNFMwUhyZ1lomVyk/8qEeLAKd0uK4eVewfHw==
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com (2603:10a6:6:21::16) by
 AS4PR07MB8683.eurprd07.prod.outlook.com (2603:10a6:20b:4f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Wed, 21 Aug
 2024 07:42:33 +0000
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b]) by DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b%6]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 07:42:33 +0000
From: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
To: Peter Rosin <peda@axentia.se>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
CC: Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2] pca954x: Reset if channel select fails
Thread-Topic: [PATCH v2] pca954x: Reset if channel select fails
Thread-Index: AQHa79MbyYnkGBOn7E2e85VmQT3fT7IuNhcAgAL+JQ8=
Date: Wed, 21 Aug 2024 07:42:33 +0000
Message-ID:
 <DB6PR07MB3509CF232310CBFEEAB0A3639D8E2@DB6PR07MB3509.eurprd07.prod.outlook.com>
References:
 <DB6PR07MB35090E8350CC105E00E0462C9D812@DB6PR07MB3509.eurprd07.prod.outlook.com>
 <7c2ca9a7-c328-6d88-eb16-9c940114ceb0@axentia.se>
In-Reply-To: <7c2ca9a7-c328-6d88-eb16-9c940114ceb0@axentia.se>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR07MB3509:EE_|AS4PR07MB8683:EE_
x-ms-office365-filtering-correlation-id: a1b7b1f1-dd60-4c8d-3221-08dcc1b4d168
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?8WUrGyJcGI3FnU/OG91PcKc/WY+cLmsep5En/fdQgRkCATL0gJSHGj2/0c?=
 =?iso-8859-2?Q?ba3MLKuyWuJnPV3rL7a/6+Tnj2mMZ+oxpZW8fDZTqn+KGWUCEA3/V4P6S3?=
 =?iso-8859-2?Q?snX/dVXHV3rJlVJDVZbulCWnQ9J11wM3ZbfQQ5UcTwzeSWIA4YIsXBL/Xv?=
 =?iso-8859-2?Q?Hm60iO9VW1AsNSxXAQDSmqzyRXEjYBCjYZ9NR5UOKICU5jK5x6N7+/yhQT?=
 =?iso-8859-2?Q?9CuWcx8Q0fGvjsr7rY5yf9SpNJEARensECLA7G/DEfjlj5OOwxSRhUWWHg?=
 =?iso-8859-2?Q?CmvMaITc9V0N8pT3v+QFyKZiSiRKMtMiiwDq3hdgW48EMojbmb97j5qF4T?=
 =?iso-8859-2?Q?Lhci6UoIO6MnDS/lYe806xoQf3FjypmnDk4aMiAJJmO3dWdrfxa4F+Qhfh?=
 =?iso-8859-2?Q?EdMkjHP2QIoZZ8ZW7G+97g7AlspA+9SQhevIcExCDhO26kdakFmq7hxSdp?=
 =?iso-8859-2?Q?jU5PgyBYO7PIHXU/mPrMAn8qpCXdbbUUMyAfKjOoUkC/FnL1nT91UaEfU0?=
 =?iso-8859-2?Q?u+oIjZXMtnt0KcGMu5hE/5qNl13HC6zyONtY8ndMSftVMm3cw954RYsMg9?=
 =?iso-8859-2?Q?55cRS9X5FFYvIwGfBH3J6jJXilDS83+XcawYUhI4yzXbU+4VretH7ggLlX?=
 =?iso-8859-2?Q?+/Krsv9ASeCxZ8TY6OusBqEpwN83znzCEZsfCnIipajFdSp8mGX9f2YvHf?=
 =?iso-8859-2?Q?3MK2192SqA+zTEALqYqA2gJZ6NQv5ymzThJF69mE+wZ0uOlwfDDCzPGH7O?=
 =?iso-8859-2?Q?EqfOYNR3P0xZVEFbungEZTg+42Ukh/9lPuc6aIHophtm+nfa9ftcJfy0Bk?=
 =?iso-8859-2?Q?3NBHTLTMIicBHm2muaK8dtfXnkd3Ks7cVhkikFNMocjSNdNKt6Mmpgv4aj?=
 =?iso-8859-2?Q?JtaMnNAVkyWuGPVXyB5Rz6u1pbF9VdQpXYeL5kH7nNaoR8oEPx1bapD3kw?=
 =?iso-8859-2?Q?I77L/MoVm3jMYCKMsWlALxa+2UyYxycOwg4YEHj23JnitbcTizZZZzZdFK?=
 =?iso-8859-2?Q?5c0vWzGvD9tmkpnn/dq02Vb+Vdl9kfMVvaHx1rZdLpmcNlkj/dNNeEcmSJ?=
 =?iso-8859-2?Q?2GI8618M4KvXsB2CvvSTPM3Cv8+Y0SxtI7qeKckl+Xx/TqvDznFPfSpmeq?=
 =?iso-8859-2?Q?DR6Fnx6kBIwMVsjiEKDmtrYMQn4xXfyWlz8IFnScYqXaYIcDwtGnDywKU4?=
 =?iso-8859-2?Q?un2572Y3Il6FOxq53d33dQnVn5ZT1xxpGu6nosi0FyzanuXrnDuRmdkBw3?=
 =?iso-8859-2?Q?Cb261LfV7/lc5V9A8QvRX9Yh/KlGlJmnBmyKX/IqhwRo11MiybkpQKOYgc?=
 =?iso-8859-2?Q?dfzBLPwSlBErPZrMIfjqP+x0OUXvutZ2jhV9qzlzu/1piFyCwiipircgh3?=
 =?iso-8859-2?Q?Fv3XKnxu1SPSbJ5wxk+B3Ei+ocAyZAVwPKGSJsInQRquiMdoM4gTz7ibfg?=
 =?iso-8859-2?Q?6UjVaZIAOwB2QhYENdC0lp4lMoj/M8Q5kecuyA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR07MB3509.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?gSn6c7Nh33FaKh58SyqU443C6tDqxXouhx5gymgsUBCtho9MJbG161j+m/?=
 =?iso-8859-2?Q?gmJVfWX60Jf1Y/w0CwXW6Aa6amFv26K6IZMZW5tZg0HDJuyIfdACgQ6Qs/?=
 =?iso-8859-2?Q?V/0UO2+wa7Onhc8QbglxoQYLxxqBZR6S+P/VyCmQMrSHRh6OX9BRZZ9Syv?=
 =?iso-8859-2?Q?Z0Vry+da1SbEldubj6QjiuThJLPjg2Dk+QBob8Nw2oI8o/m86BugIvI0fM?=
 =?iso-8859-2?Q?jn7cEFP5AWKKJ8/qQikIBXpuJaHvAmjK2GHpSLdGi1nyHvaIWUby+FZE0d?=
 =?iso-8859-2?Q?SXcJ0WK4gpmM/pyjDjlJvFAa7GMGFO8MzOd0zLwUXCURVYAobqwPTJR3Vi?=
 =?iso-8859-2?Q?eLWK3gqsfTqmRBY5jDHjLyRoaVO7PfMaXpcft9g7o28RbAJEWf1h2I3UJv?=
 =?iso-8859-2?Q?W8mXp4ijbR166DvVSNpAHeFpGh1SRiI6CaNQar2fdg/4FzRp6L3AbvqVz0?=
 =?iso-8859-2?Q?L0PqaV7q7F9xBD+pGjV/GLQgEXG5RWgsRG8Zgf+Sr4kJh9k6UPeYxVgp7G?=
 =?iso-8859-2?Q?mzFPyZcJFuVgJ3rBG6dguWi1dNUdsUjYdtvgBMHUtnHcaUgMGZ3ND69/wh?=
 =?iso-8859-2?Q?Jcph4tbxl0bzlM6uw96+dsBMVl53LMxL6+vaGEDP2ARpu+iZArYfDdeL9t?=
 =?iso-8859-2?Q?22OzOjIDCdLAubXjpBmmyJCZVSLNSVqgJuqf9p9StIg8aOpjPG6LywLPn3?=
 =?iso-8859-2?Q?Dx+jAYNoBCMtfIwTtLru4kkxjUHSGT3UG/N86YY2svqhhHbZGgROzqLtK7?=
 =?iso-8859-2?Q?nZvDVY2In3Lsi8iEIIPm8OUiApfRW01MR6K6afEytYRecCaieQ78q++Gl9?=
 =?iso-8859-2?Q?KoiqXyRazIpJYbdSKN3w211UheBnwHyreb2emrDAOt0QclAjexjSm55FBt?=
 =?iso-8859-2?Q?kyIAw1+Ng+eINpI1QzEW8NtAIFhLfC9JongGcSGmPoprsSToy9U21a+vbf?=
 =?iso-8859-2?Q?fma9YT1VeXsU6l6jNY1Ta5WgXZE242FDqzZLbOIzrBhlp2VbC6pLGauBG8?=
 =?iso-8859-2?Q?/v+taMiEuesr+ozF0t5Lb3MtRYr896EMi1dWeTiKvKLO4TyZL2pYSrQmpc?=
 =?iso-8859-2?Q?9QobjM1YZY6ofmtcf7H2/1frq/ygCgWgIl0i5TzfVtVp2aNEN074lmcqd8?=
 =?iso-8859-2?Q?dW498rb58Ad7de3wA6tbG9A9b/+AoBwtVjVanMbCbW7zV1djvGpuxesKTG?=
 =?iso-8859-2?Q?I9F1o34h/97dZB5F/MWEMSq2YpnTl/PfBbukqdhhCqe79iXVekaqDFHT4I?=
 =?iso-8859-2?Q?xhZC/Nv8aBdfQ4FeluGbeJg/ZQDZhg8OloHlM4d4Egsg/hJ4BuTdGTyY8b?=
 =?iso-8859-2?Q?SQ+p/29c3ARbt/zc/7Xtqi7cppSvrGX6ZeHBjOb4WTymlMdcFkp4yRfswc?=
 =?iso-8859-2?Q?dvhEoYwONlUz2aQn92T6ZyRLISsToJkDF8rwikW9I8Hd+aTSIo1C2M4ffL?=
 =?iso-8859-2?Q?qA9iNEYA11+bQIJSHZA4/SXTzSV8UMR3dK2og/aLyc5wvsjcIPWNNLBRdj?=
 =?iso-8859-2?Q?FtQQe3fzjgl6vKTdt1fdobPSPkrMGGhxlFGBX/G2JZwaO/ruAFvxev3Pgq?=
 =?iso-8859-2?Q?YBuld0AUSI05YthFFd48RnowM/84WJMrjhqhM2Ecl4OCuk+x8Z5tF+Hrtr?=
 =?iso-8859-2?Q?UswlVyoVzJa38iHYBWyfLia1vGVNAg+xZ4?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR07MB3509.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b7b1f1-dd60-4c8d-3221-08dcc1b4d168
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 07:42:33.1198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aIjUZblUUtRHQVQfws+XG/d1YHuUuRYQKqOjyYPv5fIY0B89K/c9kTPr9vKOgj91iR5LTnXMe/h4NA4secbLesNrudN5q9BS1NffIxSOoHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR07MB8683

Hi Peter!=0A=
=0A=
> But when you have more things (likely sibling pca954x chips?)=0A=
> connected to the same reset line=0A=
This is very good point, thank you for that. Let's make this procedure=0A=
enabled by appropriate property in device tree.=0A=
=0A=
> Also, if this timeout needs to be handled, it is likely needed if deselec=
t=0A=
> times out too=0A=
Timeout of deselect is the symptom of hang mux as well, so It is even bette=
r=0A=
to reset it inside this function as well, because if we have=0A=
i2c-mux-idle-disconnect set we will be able to recover without failing any=
=0A=
transaction on the bus.=0A=
=0A=
Regards,=0A=
Wojciech=0A=

