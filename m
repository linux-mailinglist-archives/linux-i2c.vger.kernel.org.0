Return-Path: <linux-i2c+bounces-5788-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2079595EB28
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 10:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 968741F24C3C
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 08:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB5113C3CF;
	Mon, 26 Aug 2024 07:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="j47G0o/K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2131.outbound.protection.outlook.com [40.107.117.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5D413B587;
	Mon, 26 Aug 2024 07:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724658633; cv=fail; b=T5UDBQOTcr5erbyTcsMQ+1Y8U6u0mZ4j5Qkb8DDjzTOsQh8XHJPzrASr9NMtOk33laN/5hBc34txgKFdK+OG5hMFbkJ8tVY6WNo6Vb7XbzxcmgVr8qjvVefW5CV1Es+tuNJIbvPZdIVLKLYRRGMYDmva03dHYHJYbxOhJWIBXls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724658633; c=relaxed/simple;
	bh=qT+ZkdxnpvBe53JSdSzMzK2z6Crh7fo1AMkSYhy0+cU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CsC5a1hw3hLORed/PPZKs++Yz/OGwz8ilHTXkD9nI43KGz+812GiPLyLU3XRp8yukzdazBK23WaNr3gfv/oA86aZsjgvxJm15Ry556xSDIgUJVn5pXQ1WeDxERmKIb08bQm+DbFHy5e2MOr1Llgm8n42nxNJvNmyYE2eN+wskig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=j47G0o/K; arc=fail smtp.client-ip=40.107.117.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGyyHa6KntV4HeJ3XKntsuhdmfBCrVOEtSURqQsgVte27FcGyzBLXh4K7t9MANQIRzj4JiMwRhiArUc1HoyS93bAcMdjRZfn9nIWkA4An6TIsHz5FCndQVvuDcSXacngiz2yJyne3EzglW7IRDKVN54L5Vf4eIXzHYMjVBqvU/juaA0wmQCenpHfLxiB1LRzkT8tEd6ZwHQv7Jq/PtnH/5vMAbzPw7PKM+2plY2h8y58Lze8w2iUOVsVB3PlUb0CtG5k5MYF5y8XJ6V3U8KqkOSdHkpyOEbL3UflW7Ifcz7zZYo1g5AzBn4jP9u72F0IShCoFNyLkRPMwr34JCwCxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArMdb11gM1IpnTa4bEEyTLdX+8ubS92moGd1CLqAEuQ=;
 b=uTik9atGibjZhyzSfrBADZ4eJppxu4AJ3v4mu5IT81Fek8OdCuc0txVOXWzQRZpOPs0Mgki46yD8LqkNK5TcaxIZiu5PxdTWYGoe1aHd7VCd2uWldfx6kZSwlWmdPFW0nTuA3pvO6iu65lWtPgfvwy2qRRAQWnIH51EPxRsFkEKPhhb4bXnJs8seHFwqk71OEJedcJbYrVkB+7rp44w3VQsg+hVyqF2CuJfEq1faDVytTlwgbLEt+5XKIQMVieJn/B4dHwo29Z4KbMa+PblN0Oo1NsAqr0UMUv9a4xKPnmRdi1HyItds47gHKRx1nbCGFK+c+CYBp+qh8Gl6sT59zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArMdb11gM1IpnTa4bEEyTLdX+8ubS92moGd1CLqAEuQ=;
 b=j47G0o/KWPsdXUkgjZPrI2iaVooW8CLjMSruQN/u0tW4UVKmewUyGS5yCo4h+mV0W1XXM8LVjObF5WY870sZABlkXRnhdqAYod3ZsXMorLw9i2ZNByxV2ieSnQdzdfyhWWmAm8S/P8qTv6p4FlO7nSbs+r/EqHRQGgel8cx/VL5cdztgc8gBgmoo4MRzeWXwTFLIAb47zXGXWiJvg5thNEGFhM0iSZvquBV0l5HySuyveOcJG64XcDZY3NztWXPsMdFoh9zrF1ImVVl2N1bp2FBTFgU/pjf2q8X7zmedtRY0sItIZwnqePKlV1PX/678fYGoCptEzVCn975KjIa1eg==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by SEYPR06MB5866.apcprd06.prod.outlook.com (2603:1096:101:c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Mon, 26 Aug
 2024 07:50:24 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%6]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 07:50:24 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Thread-Topic: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Thread-Index:
 AQHa8ho4oLFWUX2yC0qHT9Kfp3UIaLIuoMcAgAJo7hCAAJOvgIAA5YcAgADIa4CAARTpgIAAhfaAgARNnHA=
Date: Mon, 26 Aug 2024 07:50:24 +0000
Message-ID:
 <OS8PR06MB7541A23130F469357B7FE5F4F28B2@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20240819092850.1590758-1-ryan_chen@aspeedtech.com>
 <20240819092850.1590758-3-ryan_chen@aspeedtech.com>
 <ZsNT7LPZ7-szrgBJ@smile.fi.intel.com>
 <OS8PR06MB7541EE5BA5B400445FE0295EF28E2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsXVU2qy0GIANFrc@smile.fi.intel.com>
 <OS8PR06MB7541945591A62B956DA28AD9F28F2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <Zsc9_UddBybdnM1Z@smile.fi.intel.com>
 <OS8PR06MB75419F3E3A222AE941DE3007F2882@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsiWp5ENQ0BeBjMn@smile.fi.intel.com>
In-Reply-To: <ZsiWp5ENQ0BeBjMn@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|SEYPR06MB5866:EE_
x-ms-office365-filtering-correlation-id: 66ddfc32-0723-4390-0688-08dcc5a3be3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Tb4i0h66Oi7GHtmibAIzxpdnAQzqoc6I913qR4F42pQ15HIUhknvu/NjTHDz?=
 =?us-ascii?Q?4RFu2uGMfd494F377azlOS2ufS7qlO9qpDREKBr9DwTggB1R/0KS/3Jz2/7w?=
 =?us-ascii?Q?dOJEhKByPc+B1VpfJijiJaaqKZ5uOyf9HVBDZYeKfoCIbGk/f/TXhPuM0cVq?=
 =?us-ascii?Q?1YtdnaE9T6/O5camTOiUyEI2SNSgPfFrlfaZDqRoRTnVMm7U//7tnJTBkU+X?=
 =?us-ascii?Q?brJ67FZButROj94tXrJ4hUohP9jCFn+XWmIAE2lMfCzYrf8ne7mGxFmeeHNZ?=
 =?us-ascii?Q?JMBsiV/kQdh149IcXj2gDedrKfF+ulnCUfSGW7N/R6LwD/VPS4KdC8FfFU+C?=
 =?us-ascii?Q?peDNiLF7tGQbjS26LwuDptG6fJp70l16Z6/EqA+prnD+jFZW/svunB0nq74Y?=
 =?us-ascii?Q?ikjLBUIVKKcAp+qyenlnHJ3vob8POxTkQ79E/uAu3tHNMBS7SxOBrN7WxsQQ?=
 =?us-ascii?Q?RfyYUrFwT8sQtbqiUMb9cgi0yWWL3LaV1bvMAh9tpPyX2QrL7fKY+vy4p1mw?=
 =?us-ascii?Q?gBnvH1zpXhfGrf2JAIJq1qcIoIt6X5mnBTlB99Bya0ZXg71NskbbbuUqq35o?=
 =?us-ascii?Q?yBsgg1LHpglGwb7epurLcLXKq4WvTq4akyxf7LI5DN1d2/bmZEOVxHyhWfGy?=
 =?us-ascii?Q?1KXlQbHmpBMnW5KRgmV7KYQvhJzDUMKAN8SHwn+zwgqO2HbModShDTN2HYiR?=
 =?us-ascii?Q?1GaSpD+CyxY5P+5p9ZsopdqS5NnmrKaXaqVsp9gIzFyCOSrECFarN8dmeJz7?=
 =?us-ascii?Q?USRznrqxJ/reXfq8RgOitC+j/NLLUmC/Otvwf9OKHlthDFID8XDEe/xU7LpP?=
 =?us-ascii?Q?bPKpwt2CUGZRlb8PTAWguqF/1T0PrDUQlmUaSAlaBcHcuH4kOjxxOxbitdcY?=
 =?us-ascii?Q?ks1JYLbA0OObGnDy1qWydm+jZKillA0r0oYbsqMCRFbm6rwry03uBt/llAwY?=
 =?us-ascii?Q?o0qFChZkUK352bYVwA9trXg9k7ujXJtj4aHsjA19H4WGq79TM3MVuZBu2Ng9?=
 =?us-ascii?Q?58J2gPWkrolUNU1uN7CoU/byFkP9JZSMW8HwPVuzagC4bussrlV7MTneFNXN?=
 =?us-ascii?Q?ZCWNbmZRG9bcCiLjxhZ/KotovpIaGkdAZHa5tQhwfryrZCUdBrdaQ7ZWBZt1?=
 =?us-ascii?Q?jqKUyjPYpqgg6/NnO2zR2CHcnhMZPC7eh0wHN62xiAHfDtbSAk1f0/I2daZl?=
 =?us-ascii?Q?f8nEGWBmNAjPWTwDhhjy/chJg70fDBkVWy16TlWKJ/bkafpkwNmVS90D7NCf?=
 =?us-ascii?Q?4gfhayIQAJr5JTjRRiQnT70Axl6+Naf8Y6sH5pneG26adK58X9T04ACdqVga?=
 =?us-ascii?Q?zJUPZdllfrTimZk/OW6wL90o5o2YEt7vQvTQ8fsgCLuJE4wpltTfXehcoF/r?=
 =?us-ascii?Q?O7TJ4E8UyMrWa0FF8Vsx7hYnapAH4ShVCbarOG8LYT99m92GpQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fbUVmYU50z9YTkEVapSBkgjTv+Y8/29G8ZoN2smCqcdB3DttuhJHEkfM8wW6?=
 =?us-ascii?Q?qg3AsrnZ6LsUdELZGTh7rVHYvWHV43z4X8CbXELK2laYr0TMJvS+loxbMRam?=
 =?us-ascii?Q?/OZ4y68FCaHCzi3+0KLJPwMt5RyBMSHJ5Wo5Gs+n9nDt12TVR5/o0WUd5Jl6?=
 =?us-ascii?Q?BsunQR8tt+sj3KLSYR7+ZxE33bBeZ0k2bk21CQrF2uAd4TqOwVmfqOOSpFi+?=
 =?us-ascii?Q?iHnmgCMcW3uEby8mHonm3T6vNXcr3jD76fYoxADvsCDFGu942e5SCMnROR8i?=
 =?us-ascii?Q?NDc9UGtHmbWgFedcfKt0HDrhv1G4lBZkBJTqrRgSTjfl7sNcCs5QBVBNtoX9?=
 =?us-ascii?Q?AOfsKBDz++0fCHs7r7m5HlTkjtrrtzyLbw2WmcxaLKS4WUYtBjbYmW61z93v?=
 =?us-ascii?Q?wjA0DyKABRubKTmqSKenbnYYKSFFwJF3do5uFjuV9WPsWaaxKaBUMwd0ulOJ?=
 =?us-ascii?Q?DWUCLVksG6xVOeB+I9cqEz6kvf+llWQyvh9XZgKwqjGWlMoSegqizZarKzgO?=
 =?us-ascii?Q?iU89dws6LU5fnY350zm2eyHwK4kT3YgNHFtXqQ5/haD6etgQIIyGP8wng1EC?=
 =?us-ascii?Q?LbmhLkRsfwx+Fqn3RvthPIRKdJKiiPTwJB+AbHiQvB0beHvMCdOEIcnN4mzD?=
 =?us-ascii?Q?GH3AY9+NkhULo6Nvx/Xj0e2UJROk1epKXVOHataaKFczZ+fukboNFRqnHHHk?=
 =?us-ascii?Q?3H2/VwsZZzSEXwc3V+06RkvKS+suBNuSGXtI+Ect65NmN0q/h9rD6HxejqpL?=
 =?us-ascii?Q?kQs6k2WkS1v94qNqL3Ou103uX0nysxR9rhdqp9esQjsNL4Bze7n70DicTd95?=
 =?us-ascii?Q?jNZ1D7yvuVWiDgvZaftxRnzIjtCDSVOQNJ6gRVIZ5rXQAyfcBLdHZcxnOIc+?=
 =?us-ascii?Q?zayl8nxLi+TPAIpgVliLyE9ad963huzNWpPZZJFPpbHcZrTTg6Zwn+p7+3iC?=
 =?us-ascii?Q?av0ZcPq4N7ZKStaE5qaOgqsofb/FpAhMHo67LvwmuFU8NSx+8kbAU9KU4Mgg?=
 =?us-ascii?Q?naDgoPmm1Yk5kXrB6/HL2m7puWfDVMo6/ZVmwt1OfjsdxBZseqhBnDh9aiMR?=
 =?us-ascii?Q?t08ElaIzv9hsm4AVPkWIBvVApIso2Q67DebmxVv1Ac9FyyKjs1Qthvje1tLY?=
 =?us-ascii?Q?KOZSGlolmRh42e6yU1+PWIYLe3KdLZcvd3OFf/b2ggel1AQ7sF3Cz9Yuyy4B?=
 =?us-ascii?Q?EBTKlRU3K9RQecsdQItZgHIhZaIa/uzM4slnrbJyXWXHWl2cm0tM/F0zMfc9?=
 =?us-ascii?Q?/f26Tg7nmFGddG1eDHXyJY/Izgt2zbYSx4BYC/qmIkgr5FnVMGyQgNn07TK2?=
 =?us-ascii?Q?643Fq29Hwx7c1eUYGOAY6/kgYMl6820UYR9rcy7c6NrAlnCIHM5rG1s1FUgp?=
 =?us-ascii?Q?KVWJoeBRyWA0gEy937rUaLlR4TSDASS2tO6vJIYMQWaNuT6lWaIz2iqCpcsx?=
 =?us-ascii?Q?ZVzWYJPDJlAW+f7tQW6Ffrhw2tKW+LXb7cpoyAP85kio3tMrSFk+Q5k6t8Hd?=
 =?us-ascii?Q?BkaVV6UdM8Y9D189/SxQ8e26z3YGo3QZSHisTakwiwuk5oBah9JzobEbevk9?=
 =?us-ascii?Q?7kmyW/Edmgp9L25k9LVi78M5RW/3qKejWWQQF0Oa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ddfc32-0723-4390-0688-08dcc5a3be3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 07:50:24.1879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qq0MeqNVbigML/1h2aTu5WT6eeRpDZEMwTKZ6Qi5iJdazx5vlYKYuqzWKFqHSEd3MdwTk3muH14mXdBIXfJf/l/kpC2tE9wPcc4puzQWrrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5866

> Subject: Re: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new registe=
r
> mode driver
>=20
> On Fri, Aug 23, 2024 at 06:23:54AM +0000, Ryan Chen wrote:
> > > On Thu, Aug 22, 2024 at 02:24:26AM +0000, Ryan Chen wrote:
> > > > > On Wed, Aug 21, 2024 at 06:43:01AM +0000, Ryan Chen wrote:
> > > > > > > On Mon, Aug 19, 2024 at 05:28:49PM +0800, Ryan Chen wrote:
>=20
> ...
>=20
> > > > > > > > +	if (i2c_bus->mode =3D=3D BUFF_MODE) {
> > > > > > > > +		i2c_bus->buf_base =3D
> > > > > > > devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> > > > > > > > +		if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> > > > > > > > +			i2c_bus->buf_size =3D resource_size(res) / 2;
> > > > > > > > +		else
> > > > > > > > +			i2c_bus->mode =3D BYTE_MODE;
> > > > > > >
> > > > > > > What's wrong with positive conditional? And is it even
> > > > > > > possible to have NULL here?
> > > > > > >
> > > > > > Yes, if dtsi fill not following yaml example have reg 1, that
> > > > > > will failure at buffer
> > > > > mode.
> > > > > > And I can swith to byte mode.
> > > > > >
> > > > > > reg =3D <0x80 0x80>, <0xc00 0x20>;
> > > > >
> > > > > I was asking about if (!IS_ERR_OR_NULL(...)) line:
> > > > > 1) Why 'if (!foo) {} else {}' instead of 'if (foo) {} else {}'?
> > > > I will update to following.
> > > > 		if (IS_ERR(i2c_bus->buf_base))
> > > > 			i2c_bus->mode =3D BYTE_MODE;
> > > > 		else
> > > > 			i2c_bus->buf_size =3D resource_size(res) / 2;
> > > >
> > > > > 2) Why _NULL?
> > > > 	If dtsi file is claim only 1 reg offset. reg =3D <0x80 0x80>; that
> > > > will goto byte
> > > mode.
> > > > 	reg =3D <0x80 0x80>, <0xc00 0x20>; can support buffer mode.
> > > > 	due to 2nd is buffer register offset.
> > >
> > > I have asked why IS_ERR_OR_NULL() and not IS_ERR().
> > >
> > OH, I will doing by this.
> > 		if (IS_ERR_OR_NULL(i2c_bus->buf_base))
>=20
> The question about _NULL remains unanswered...
Sorry, I may not catch your point.
So, Do you mean I should passive coding by following?

If (i2c_bus->buf_base > 0)
	i2c_bus->buf_size =3D resource_size(res) / 2;
else
    i2c_bus->mode =3D BYTE_MODE;

>=20
> > 			i2c_bus->mode =3D BYTE_MODE;
> > 		else
> > 			i2c_bus->buf_size =3D resource_size(res) / 2;
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20


