Return-Path: <linux-i2c+bounces-10671-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A592FAA0167
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 06:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 106CF1B6042F
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 04:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023584409;
	Tue, 29 Apr 2025 04:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MLyMPqzi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F951078F;
	Tue, 29 Apr 2025 04:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745901459; cv=fail; b=lkSa7WmtZ21sVgBifItoa5XhoKsorto1Akzf6Lrp0+TpojIXKryb1v0AI8ITxYL0aRjm5jKFXffnAibF+ky5GluvEIWmQK3eQRgzVVgjJl3BfnqeuY4/xOA2JgCdMj7CBKrgIruMh3Dr/RtEXBXJrqNoXCIFzL8Kb3M2vK3oPuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745901459; c=relaxed/simple;
	bh=EeTyrc8j/GTqh/56npCaQoZmtHrS2mMi5Y/LWnQcK5M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j+0oJY4A69okLgs7lTHof/7yBiw/QsQ3McwyHvrdeTe59DhzPNQsHmDn+PcUYAO1PJdwdbw9KPYiZhbE/0JcF8lh6Y79XK55eYulQO6U+UXXY2BndvsOaU+2cJRQqe7WX6p4+nqhOJ+Y5LVBCugkKk+k6xZO/pjne3ecwXiuLhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MLyMPqzi; arc=fail smtp.client-ip=40.107.93.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2hwcXu93bTgpGnlZPSvAhJb0EpGAVa3CANbaEnSoRmhQcHc9S0xCOK5rd5VowBSOiyRRdn2T1yPf0FSJOxnfqfq9ptDnkgsPQPqCmtLAv4VBQaIbdp21OpxHXggDeAxYSMfYzfHTPzyVa1R4j+oH7iI0JSKtJHH0FvyuLdaTV3lMi/ijWar4rQPTpP5B2rmSegyhOOY8hICCgt24tBabI7cWSUIed0vRo3XmK0+NdGGPHii21nEmZdJPfwzTh8tSyw9ywIH8yIF8663M/QowSQrbKbh/E4ly4+hnEpeZqvAWq+N1dscFkHU2wF6TogIZUZ95ptJc4JI4f9cW7NAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeTyrc8j/GTqh/56npCaQoZmtHrS2mMi5Y/LWnQcK5M=;
 b=Lf4ixO7WL0kjSjr6uioQVSQKwixKzVhV/pHo/vceVOubQV0wGKWXvFc9fERiypHiPuacSvu/WzZlkceeIhT0vXT5JTYogwX3b8iB07p0seUzddgP2tU3mWjGjJCgxTIt1kYPhdhth8PieZV7WOCSvYxodEcFhQc0lB47i3cfxfdfdfFTHUPt6NgVmJSB1+7c5mq/i8XAQeNZaBiQSgUjg1eUUwixR6EQstTtVYxRMFy76vwtavmU732dk6Bt3zgawKXnrfs3XFcNZNdYL0Lf2RYlGZTzDdgJj6gNEHEACXPRdGddybcnyIiPoRAmh9pFGp6ihcP/6F/oCZcuHE8SOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeTyrc8j/GTqh/56npCaQoZmtHrS2mMi5Y/LWnQcK5M=;
 b=MLyMPqzinV2szB4jWBvuAUwzt3ccFiRn88V+IO4J1E6IEZJRGQMiB3x7bfofv7Nl2Q6FeooqBZS2oxdhg6SV0bqCCM61R9mGz0ou4JzmJAGpVSbQ1CAciRbQtBpgvBstGKS2Z6mrjRa3vkF7rA8Y+mjjp/DuCYVDMUfmtS25jHzIKbsBmeqCJPSsJfhobtRW9EV7bZXPylbs2/OQg9QWkAgmfcnDfT8eaGQtWpxOKjv2E+QlKVv8IPwUr2eOIz+W4M5IbR8uVSUzlzamg0am+n0jYodaP8EzI2AiIn5R/sdPrTaLn6WvPlirzcuOC229XcyUTSKukzRljqKgXnCpYA==
Received: from PH7PR12MB8178.namprd12.prod.outlook.com (2603:10b6:510:2b3::19)
 by SJ2PR12MB8927.namprd12.prod.outlook.com (2603:10b6:a03:547::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 04:37:31 +0000
Received: from PH7PR12MB8178.namprd12.prod.outlook.com
 ([fe80::77bb:a9fb:c75b:f530]) by PH7PR12MB8178.namprd12.prod.outlook.com
 ([fe80::77bb:a9fb:c75b:f530%7]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 04:37:31 +0000
From: Akhil R <akhilrajeev@nvidia.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Andi Shyti
	<andi.shyti@kernel.org>
CC: Laxman Dewangan <ldewangan@nvidia.com>, "digetx@gmail.com"
	<digetx@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>, "wsa@kernel.org" <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thierry Reding
	<treding@nvidia.com>
Subject: RE: [PATCH v2 RESEND] i2c: tegra: check msg length in SMBUS block
 read
Thread-Topic: [PATCH v2 RESEND] i2c: tegra: check msg length in SMBUS block
 read
Thread-Index: AQHbtNp7s1SLK4Twwk6tSesUZmRNhrO5wm+AgAA+eACAAAJCIA==
Date: Tue, 29 Apr 2025 04:37:31 +0000
Message-ID:
 <PH7PR12MB8178416B09D217B77CC43C04C0802@PH7PR12MB8178.namprd12.prod.outlook.com>
References: <20250424053320.19211-1-akhilrajeev@nvidia.com>
 <j3jxuuwu2joyn6jsfa63lkkuwqazd2mpeki6gamdpktllhpkhv@tfoqnztsa7zw>
 <aBBE5mgqGk0yXQWN@shikoro>
In-Reply-To: <aBBE5mgqGk0yXQWN@shikoro>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8178:EE_|SJ2PR12MB8927:EE_
x-ms-office365-filtering-correlation-id: 9668f19c-1299-4811-f1c6-08dd86d78e29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?CUNE2CHPHvHNeFsyU8PVXC+rCUg8Y/mLW2xaDkJHN5iPl/6HBZRtmdFdHtEG?=
 =?us-ascii?Q?PmXOc6Bm6Jy7kTJGpgUOLmikXgMi5mVlfM4kZoc/gnAncM7dSvrZDQRcKVmL?=
 =?us-ascii?Q?SV/47UMc6doSDzhKNu89Rgldc4ho+CEb/sOU+tRp7uCS+/REFY2wICDgbvJf?=
 =?us-ascii?Q?Mf/lAKMaAdthHkDQWOkT8owy2/bDA9a2sPWCokYTx3TDN+GtvfxryH2eiO4F?=
 =?us-ascii?Q?i9ch2G5eCg35gj6esjnQF7mhobkjK/G3VcRuAflzpIDcBiS1/rEifr9a8s/u?=
 =?us-ascii?Q?Z9YFI8QqWxcjmaFCC6E2Sncpk7LoKlZwO6wRHzyBQ8u/egVCZHz9Ni3sFRni?=
 =?us-ascii?Q?ZuXfmSOEsFQc/waVYikvL6EUAhU7oa0kPoYxo+clDzx9Gl5VgnwIV4767X6G?=
 =?us-ascii?Q?caKy6FlEwKeE7Udqyc3C6KRUGJ6RXs7qWx3BDB4QMzhloX+AGdqU+SPKoPWX?=
 =?us-ascii?Q?YbTA/fBKuqf8Y5dRYT/EiaReG4L4ral1oea06HHldsBlwcnT37FuT3/eZVzD?=
 =?us-ascii?Q?1iGgjBUIDfGqTsWWBIVTOHa2uMnXVKIkw5KwMeYyA8+EkczYtBEkLwQxsH29?=
 =?us-ascii?Q?duAGwOXHdRtQDbzViplYobXis7LEhKjQKmhtiesV+sjey/+cXFIetdcfdVTS?=
 =?us-ascii?Q?IpWqfi0BgYjVwmFNEnDQ6/2l1GdcpJnZwG1y7yt+lQG2hbi8H6VIq5tZbSBc?=
 =?us-ascii?Q?DSTl61eZFMsQ8np9qOS0xY9jjKTgRL5WjhZxIHkZ9DTxLTVbvxIVghIWfQI/?=
 =?us-ascii?Q?n13FFZftuS7I30tW0Kd/GN/o5F6QiLflTm6zBoNb/o8UNYz9uJhbi1iKIP44?=
 =?us-ascii?Q?ZEiHloX6GCd6YjqUH26HHFfSfEhk0IAJQvpz7kG660JCklN6sTPDMfzMbU8J?=
 =?us-ascii?Q?A8E9v+hY9X8OOf5BdFZp2iedDdhilVFvNdh5FHutrJQPj279wM+L/DIVpqkk?=
 =?us-ascii?Q?Iu0iwdyw7LYFoAYGtAfjDedDpWCBwglgP/G96zJ+4xq6AG1En2pmzZlDhQHs?=
 =?us-ascii?Q?112w3guqXoD9sXJfDlMUih+5K0YzyAezfz4y+batjsnKPdh8cKxidyjDZNIU?=
 =?us-ascii?Q?gCgCb/J5jEErrMuBJO1ZTZR9qsVRb74fpW2mWo+RpmoRzkTeXtxx6A5Lj1W1?=
 =?us-ascii?Q?hNWh8ueR+AlVMtCCrthOX6MvYJsqvtACKOc26kana6q9ad9UDzbRohhLyGVD?=
 =?us-ascii?Q?cO2TzFZVJw+Xh1dIoLuJdOosG7m81jdo6pVqyPZeanzFhmANWEr0SKeh5TkY?=
 =?us-ascii?Q?mujN3XaTtayynMc3FRhwDR66EJTQCo8Pi+m52K7MyvqEHxn2yoh4h7HHEO/s?=
 =?us-ascii?Q?/OAXaQ7+kiT5R5tuUuqCNWHGFthBcw1BWp6o6z+g3Gtp1kXBjKj+KdfR7rxP?=
 =?us-ascii?Q?6quGB1scYVU9OHg91+1yo3grfg/6P+8+MIL6jd6uZedP5fjDprmUh4Xr8bnc?=
 =?us-ascii?Q?eOBJmnPSEneWws0E2rFcheN5p42jmy/Zliq5nJ/EIDO/DoO9lMX29iZPcjbW?=
 =?us-ascii?Q?XhFqaR1/6jygdL4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8178.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sypLTM9Q8f3ljHkj/QOZIIEo+SEvTEdH3NfsMXdwOGeP8mW6t62KRxc66Q0O?=
 =?us-ascii?Q?zNnlhQn5zwjW48P06Q35COrzEyoaRCCXIJyU9ZZZGMsCMLJXOLo8UyArSJrZ?=
 =?us-ascii?Q?jixSJhVxty142Q57J6nIPuyThCR/4W2I/aX1MN44e5lc83jeN62qxtVIiVCC?=
 =?us-ascii?Q?UPd8Nu5bZwZIhfdavamCFTFD1Y+0QW3n+qhsD7PmcSvfUNNFfQryPUXRPrx7?=
 =?us-ascii?Q?+rutruE7k/fmSfI718I3cjg+AnOiK3DA1DgNzinvQ+jGbeuFZcWI0TLqGV7v?=
 =?us-ascii?Q?iBXFc5OnITew6ozTZMfjXLSL9OvkEdDL7a4NEt9qpUCIkHdZRHaWGeXfCN1w?=
 =?us-ascii?Q?FM21RgdJxOChxdRSzcSZS9AUEpft/w1Z4nawUwYPKt7UIvOf5sK6EUDNI11W?=
 =?us-ascii?Q?xonFwNdXE78Gii+TUqZ9RjTLxmUxwFlz/iaX5ioPDCQw9csQgf+vyWoDrxyL?=
 =?us-ascii?Q?wSpQEK44uDxvpxBtDVX86yrI0chTPNbJyIZakVkpnAr7aFf7ULqEehaEWuhF?=
 =?us-ascii?Q?0VY+Fv0xcXrug+yhvJCSk3ExC4tpEi/N99s+QEsnUsvyNA4gXxTOUwEOAbuS?=
 =?us-ascii?Q?Jj1u24/ASlJmYtjmyyYrACiJkmUrO8QgDrR+SWkpBCepKS3R492SfrAOD3GX?=
 =?us-ascii?Q?5657fxC/p/GWel750aGOSKtZ9sgUNnFBXbKvQKHGxNPVmfvZtsLHrvyZ4CUB?=
 =?us-ascii?Q?gUhGMMmHiPasRrQaCEkc3vacq50zBaLrqMTNkC6ENQxxJajgb7e4h1kGDiEO?=
 =?us-ascii?Q?4n7e+RIZrmgFmHowsPcvmsj32CBdygpiAIOWsxd/MgKz0vWjOAfXGnZzcl0S?=
 =?us-ascii?Q?GnY0DSJdW4/7NH96cNPCl1/j04uKiDuOvMYccgIo2EqCw4cC9w6yTI4us2mq?=
 =?us-ascii?Q?njUCW0qQr2w8hkU5m6xdfnbjg1sD5fGTvTrPvEnySIcALmm/TXMBRxVUF0Ax?=
 =?us-ascii?Q?fu94UJ/OVQjg/wMwjndSYypooNOTshKvMf1YiphvZQPo/tqrA8DtkxJ94Amn?=
 =?us-ascii?Q?aEMI/hPpcXH/SlsItvUP9OyzfEH/J6xc/tIptcHxEVt5cmO1k/AxlUPlZ4I9?=
 =?us-ascii?Q?arf3WtgogWEF9K87wb+BvJwDiI99ktr0yG/6Tvja0yHZXTpJwxpGumubkEqu?=
 =?us-ascii?Q?9DB+R2Li7imb8r8ScxJLR6mn6kedtyP+LrSaX+4Gy71IcUbsrhrAnXqKoU7T?=
 =?us-ascii?Q?KklKKzNX+O7s3FmQX0XObnOobYOMruIS3LRa6gbPrGCfTOfDxw4uyz326KUy?=
 =?us-ascii?Q?3t7Gz3ODG0DgrECISpKNdOH0JRHuJ/VgkGPujsEubTAo+YDnkyh8sZJsWzd8?=
 =?us-ascii?Q?31Xo5jlXlIUNOHitkKqG/uRVhiLb50cd9ftnbwmXcJtmkFz5XL5k7iLXxewb?=
 =?us-ascii?Q?//rAzj8oi2r8gkxD231pK35RQcRqUKyXwD9CCGqGfCX6VIxxLlS34SFtyP+D?=
 =?us-ascii?Q?iXwfLhAS7El5h0YBilfEstepmiF16JT1dmnCxgm1UtrEKs1y4N4vqKxyhIrt?=
 =?us-ascii?Q?X3rxWVaPjFgm6iT/82+Gjt2J0OtweFPOB8hYg7hS/2fYNyd2nJXfHQBA6Mh8?=
 =?us-ascii?Q?yGkB+KjjDEW4CaoIUN4=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8178.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9668f19c-1299-4811-f1c6-08dd86d78e29
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 04:37:31.7604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tCpbyq/MyFbTeVVTD1WrJgNpaWAwx8SEn4hjr1eZTb96ofMfnrKmWsLs4TkIwvePCNkdvgSkaffWx+bX+yyyMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8927

> > I agree with Thierry, this check is driver independent and it
> > should be done in the library. Anyway, for now, I'm going to take
> > this as this check is now left to the drivers and it would be
> > huge to shift it somewhere else.
>=20
> The big picture is to support SMBUS3 somewhen which allows for 255 byte
> transfers. Besides that, it usually is not possible to check the value
> outside the driver because it has to act on the value right away. That
> is, the length comes in and exactly this number of bytes has to be read
> in the same message,
>=20
> > Before I merge, I want to know if you have you seen any failure
> > here? What is the reason you are sending it?
>=20
> Usually some devices just send more bytes because they can. A value of 0
> would be interesting in deed.

Yes. We have had issues where the client device sends '0' as length if the
transfer is terminated abruptly at the client's side. The actual fix is in =
the client's
driver, but this check here would ensure that the master does not run into
trouble either.

Regards,
Akhil

