Return-Path: <linux-i2c+bounces-7024-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F43986F28
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 10:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CA2B1C21909
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 08:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DD314A4D4;
	Thu, 26 Sep 2024 08:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="fKYtS9sT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2138.outbound.protection.outlook.com [40.107.244.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C14522318;
	Thu, 26 Sep 2024 08:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727340352; cv=fail; b=XZ7z9xoCzYmU0a5/wRg5jH6BRCt+soqxkxEwdFEfKQ2H94o/Q2EEUCAvCKlhYZCJWof/vEh5CsunXt5Eo6lPPzMfqEGFhSQFjnIceA6FoHNtLqu4kDDWobK0vuI1uA3qGHqy6ORmYRRtlqdS1ZYGxSSdkqDVJLXbqNok3PiMQ9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727340352; c=relaxed/simple;
	bh=6Q4jfLPZ4CrZs7lqgUjhLdPZZVh3KOW9V4wrWgQGof8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aQek0mXEHAGckQwXB7peQV4uRpUiRUzlevGF10Rie6EU2k7RNgp4tFgJlGoMgztbOZMDUECjaeSjeHPgG44qktYx7/u5RQHxbUI05XHtCc30G92t0psARNevvw3U08K2/BBBS9Eh/HH9O0uvRDgcRIc2zP/C8hkiU6FzAhDBD/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=fKYtS9sT; arc=fail smtp.client-ip=40.107.244.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7Pc46uqPc4Kz4BQC/9t4BAmNWTjDrY4KaF1/A8+tNUBTAdXMwSAzuX0FxG6r7JvOIgAJZ4lS4uvElAO4LL4e936tHl0NwBuhgx8R1U74WBi4Wo+ByqYvUFcJ//1JIX/CQ79Lmg4zTFaJ9s0ZxpqynSoXhGWy7miJeGRUZh2Q64WIdzxTvL7xn4jYEGFGHne96GofUwTU8Wtdg3QOwFQLbwOz3JwQjGu7n2t2ZMUhXmRR8VUs2xwVNHiBxD/6ow59FNPeNXDrlz8yFiqMm2Xm1Stlgo7EOD2itMsnKFWz9w59FIX10lPSpJgEpg/MqqnGe04VbTOq+opxssM3LEGzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgLWuLQsCyOOMGAlLIHDWqkmDzLzBZLFmXOsnG2OBzM=;
 b=pU/NfCxS04V6c3VU2GkqkpeFVUtkWx4XtS4czk5Nl2yvKFwZN2ZoMW6+fU5jlm7jNkJUr+ORo+FaUjwAUSK0a5URJOQJ48hzdmJ1kdAFLGJ/8eaR3LP0PIGNBVR2RH7CNlWXOUMgvfm9kB/ZnBQuZg7Qf4cX9NuxuPqO/5ea912+zisS/GvU1lixkalJqtF+QRaQPxhGOvEuD+zQbRn7laLpOCyklNCYZ3ROH+3nLSu0hFkhuavPc4doD/YaYSSy7AFC96IhAqJayZculGRyckob0fdmFg9fZe8uCqb4HOEW91/kF5B8KexKphlqqolMl29LirwQjk2yihIP69lbPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgLWuLQsCyOOMGAlLIHDWqkmDzLzBZLFmXOsnG2OBzM=;
 b=fKYtS9sT5m9FWhrDcpvJb2tyEgsZ5zBrgHjQrb24YWN3OrOl5cLVzOUDe2k/k7exNVt9IIZAFlEfCjjfyF9hq/9OaWr31Rp2vM5OL2qRk6bWg4hKZ5xVO5YICgiRji/p2RD+IQ7SY4LpOJn9ogudtKNJO6WwXCDx2IgysvCyDNs=
Received: from IA1PR14MB6224.namprd14.prod.outlook.com (2603:10b6:208:42b::6)
 by MN6PR14MB7315.namprd14.prod.outlook.com (2603:10b6:208:476::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 26 Sep
 2024 08:45:48 +0000
Received: from IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94]) by IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94%3]) with mapi id 15.20.8005.021; Thu, 26 Sep 2024
 08:45:47 +0000
From: Michael Wu <Michael.Wu@kneron.us>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Andi Shyti
	<andi.shyti@kernel.org>, morgan chang <morgan.chang@kneron.us>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] i2c: designware: determine HS tHIGH and tLOW based on
 HW paramters
Thread-Topic: [PATCH 1/2] i2c: designware: determine HS tHIGH and tLOW based
 on HW paramters
Thread-Index: AQHbDyGZij9/nSd+SEOB2a6TVXZu/rJoONqAgAABcgCAAYQXIA==
Date: Thu, 26 Sep 2024 08:45:47 +0000
Message-ID:
 <IA1PR14MB6224EAAD5566CC5288CDC0838A6A2@IA1PR14MB6224.namprd14.prod.outlook.com>
References: <20240925080432.186408-1-michael.wu@kneron.us>
 <20240925080432.186408-2-michael.wu@kneron.us>
 <ZvPU2ZEG_8UV3FzF@smile.fi.intel.com> <ZvPWEFWk_MG5SsCg@smile.fi.intel.com>
In-Reply-To: <ZvPWEFWk_MG5SsCg@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR14MB6224:EE_|MN6PR14MB7315:EE_
x-ms-office365-filtering-correlation-id: 8dc125e8-1c14-40b0-5608-08dcde079e10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|80162021|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?1U7yrJcvJmBAjfN5AN1NIImdvvgiOspfjwFtVHxn0r58/JT90en0ETt9mjLK?=
 =?us-ascii?Q?fsT8THypYrQRGa9dqEnwINummduFzBE7ondpcrKRxdZSRpxzV3IgFgI1PA2h?=
 =?us-ascii?Q?428XiwDMNCQlgNH3hdgLgsiQA9ckElsbZs0NNtA5QQrozSO59ynMuxCX/VD8?=
 =?us-ascii?Q?ezgjgL7RcGwmQrwrn5fVUaPkQICqvEvZ495E+ZHkkRMGVWq/aOaaX7ltqaE4?=
 =?us-ascii?Q?fsr+2YFpO0zIsjA+Q/LVDL4LVifYQdNaBLfO25p6ZHEIlCF9a7M5u0OTyEMs?=
 =?us-ascii?Q?O/3vCKhnn86eL+xdGaUw/qh0vX5OlRJ96ub8NLrQoB9bCm+WZEQv7GfsmLqf?=
 =?us-ascii?Q?DmrdxZPTc94vacy3zTiUcIzjU4doku7cslWXHXqm5x0bELzq3i9mfHAYnGQy?=
 =?us-ascii?Q?xLQ+4LUVIE33vDgMedbe6InyzEhnSpOAjDH06Y7BJVO6NhvuiwiGAG0C31yo?=
 =?us-ascii?Q?IEqR4JMlHu8uATfDhSPBItRLYldZij8LD8kUdINV0WnIr+UmA4VsgfWaD7dM?=
 =?us-ascii?Q?WL5dAB5yOHKny1xtRXI7pswZYC1qRPJjI/v6ot5yhR1K22ANO2RScw36rybg?=
 =?us-ascii?Q?aiCQp2BgJRMt4W22dS79OJZgBZGheOcI9AkZ5K1pVppYW2qWR2N7DZD1pKQN?=
 =?us-ascii?Q?Wr68T3SiAGD8RHfGNK707y/cSSHm15trKQ8HlPcCk79Iz4RQtPRit0gKXQn9?=
 =?us-ascii?Q?RLpSmlYQtvpvn6tEgjLiqXQ9mSBM4upzQkKQSL9Uw9TomPxHJ1F0vMWEqmA0?=
 =?us-ascii?Q?meTpZ7D2mPV4sdBZdwuAAy76uCvCUmv9Hy3+FSRlkbZ7u6gcOK1xZBgDOYZH?=
 =?us-ascii?Q?3UJwNny7l2ZJz2zqBXvUyCDORk7c5sDJiQzdThVYpalhd3oGVJ+ph1JGiBg6?=
 =?us-ascii?Q?Rb+94YE7V7VwIln/PseLlNnCAvc4lHE2HayV2QjTCynU1FMnhmAN6MkGcUOn?=
 =?us-ascii?Q?UY8Tkg3R9E0TL5Vdoh4ehGXAW4BpskFpG6ITrNoar3eRIUAljSClzaxIW6iM?=
 =?us-ascii?Q?5GvBvM9plqmCtmTO1WNb0zXz16gHCCoHUCN38QFaCnN5yToxCupk4/Q2hYRw?=
 =?us-ascii?Q?Upk/8KMQ9qP4UOyHSQyiuLQiyX4ukBGNDJwfG5487+fO5xiEwRH97rd0vbre?=
 =?us-ascii?Q?OgTg7y/HBrMShOWVbrCrnCX9a4O9cbvlA7orLkUr9e8ZgKJrl40qL9GbuIZZ?=
 =?us-ascii?Q?eSYoxlu5egm93pu0Ommna7E/bNBfZBUGa7RPurxYRUzpE0Bd4zB1LIinqVWS?=
 =?us-ascii?Q?QS9S1hSd+V90dCJLNODy3E70/ICrjezaKu4DrB141JAaxbVAl9JdncVrDhXP?=
 =?us-ascii?Q?8GagMEUjUr0LKTzjSGxWS0avygkNswFO5OIGvC8m4kMCLVAxDJBdyL1EvhKi?=
 =?us-ascii?Q?jW664Ig=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR14MB6224.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(80162021)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dI6tlQ6OswX7MU9yjodDudHMcbPyk1i7yO/8bxb7j+3gCbYC7zP4vgFCNsBq?=
 =?us-ascii?Q?4qlMo4Ny8NahOpfsMk7XE9k6WWkQQX7YRRgX2nq7ENenljBejfJ/Bf+uEBYu?=
 =?us-ascii?Q?43Qv1SNS+bAZkVeQc58eULPEYqdD1IUhRP9CweoqPMiwFwEJA6iSo52Cf/qM?=
 =?us-ascii?Q?mPg8wq4wpQRvAPTfPgjIYXXNPMrifIpQD9q6sAPlZTecke6mzVsEpfhcZ7h1?=
 =?us-ascii?Q?CTFbzJuVCGiKmWzAZLwNgrRp8ke/0jsPN9vIXglyTn4G3WZrzVkrrIj/KtXS?=
 =?us-ascii?Q?fRxcl01gqNMQ8Zn2FZGz3PFAzzTrzLV9TfrjEL5qy5pBeTkf1tKq1YOPYJ5m?=
 =?us-ascii?Q?kfyhKCqnBdcWZcqTq6wH4aLsKSd1SvUiOF7rKdL+PAVQvDPNWX9zmc2ApxP3?=
 =?us-ascii?Q?59F5azVe4K9E7n9DAYj2Uy0jH7UKOK5op1Mc1urK4BhXNBuB4MfT4gCu1svT?=
 =?us-ascii?Q?tOBoHXGmSaKDqaWxDE1q1xLkDi+z8QfaNT+mWTx+ddAMfNi6ulMIxXRqyejW?=
 =?us-ascii?Q?/pgok3EpqwYYVIXaZfmxEupF79cAnafa9Itig3c8w6RN2YExnuRFunFSINBj?=
 =?us-ascii?Q?gp1k/zNddQ4NHpmzuViXHb6IXUYLKJr9Uki5VwRzJrp36TTMQdGvI5N340Xh?=
 =?us-ascii?Q?6yGQHVUznOa6/TAC7eDEwcGbuFh7pidt/gOpe6oBgb8ZW2ndghEsTkFyhtUE?=
 =?us-ascii?Q?Ol1dWxav/FnqId0VSbHGz7tCJPhYOS8JbIT+NlkvTJ58P2fZ9lUdWEKprGp1?=
 =?us-ascii?Q?tp80X91GsfGyNtFn4ID7AaUTv8ZWffXzzNrUUCECHqCtURDYQHo/jt0ulMoR?=
 =?us-ascii?Q?hOeZNijZhZzDKW5+O6MrcXKE6p/gHmZEm8l0SBXaAWM6nqEeJzxDUklxJYb+?=
 =?us-ascii?Q?jPPChB4KmFxrqrlLjwdD2d8cEekodn3suvU6Uok8lgxfMpCvlMNHNX9BgSjy?=
 =?us-ascii?Q?bIhJqa5u1cowJ4YLyZ6Y1HYBuNT6o3QZ731zgrRu6Z9JeYnU6QnN0petJum8?=
 =?us-ascii?Q?0If0z4yvEtJTvKUfv8vkSPNY1UZmjovuJBavyuiuy5fIJWFJSCiPLyKd96rf?=
 =?us-ascii?Q?q7Y7tX5EX+Tek2aHZXkggLEEKqaoaL54x9emeryeXkKx6J754LVdjVkZ61UD?=
 =?us-ascii?Q?nPbmtXir2XedLvow3/JdftymTXGafsShB9eP1IldqTcOOYg0csVp8kgqwCa4?=
 =?us-ascii?Q?2rIQiZf616w28++9n9gQyBLTM7wclNJdGloqAbOoMP3nbAA6gT9dz/9Oq9I7?=
 =?us-ascii?Q?O/aHzrCrB/o4sQluf3oVB6rM3cEk95NjV0jkSzo2gQWaeuRVqmQfHLNjyO3a?=
 =?us-ascii?Q?hGcOjwJJVCGGN/zpQP09Lpr3yJNbDOhqcNFKXWmfiMVIB7rGGpiL9No6d9rk?=
 =?us-ascii?Q?F3j7XBaJbxeJWi2lLfm4meYAbXpi2ANjytvvRj6RGe4OWCQc1VzqQ6eyDENj?=
 =?us-ascii?Q?oEYhn7oVrSwohwo6zYWPofFLjxtfb1ObKV0QZH3xVeaspnKQM9V+JIaJ/l/S?=
 =?us-ascii?Q?i/f2PiOUqGFNBAMtZCUfODPVTlazSrVPbvtvdMVPzBftHmkTR69PxcrkjCHK?=
 =?us-ascii?Q?kghpBldnMUJTxQ5+v14=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc125e8-1c14-40b0-5608-08dcde079e10
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2024 08:45:47.7423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9DLvrNe21nEF5uCtQzSFcsxdWOREpSpIrvUehgQ5K1xIWYu3Xh9Xk9o9e2hnqpF6uEWSA5NKJ8Qymiplnauh/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR14MB7315

> On Wed, Sep 25, 2024 at 12:16:10PM +0300, Andy Shevchenko wrote:
> > On Wed, Sep 25, 2024 at 04:04:30PM +0800, Michael Wu wrote:
>=20
> ...
>=20
> > > + * @bus_loading: for high speed mode, the bus loading affects the hi=
gh
> and low
> > > + *	pulse width of SCL
> >
> > This is bad naming, better is bus_capacitance.
>=20
> Even more specific bus_capacitance_pf as we usually add physical units to=
 the
> variable names, so we immediately understand from the code the order of
> numbers and their physical meanings.=20

Sounds good. However, I think the length of "bus_capacitance_pf" is a bit
long, we may often encounter the limit of more than 80 characters in a
line when coding. I'll rename it to "bus_cap_pf".

Thanks & Regards,
Michael

