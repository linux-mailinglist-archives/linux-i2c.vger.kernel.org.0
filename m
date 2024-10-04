Return-Path: <linux-i2c+bounces-7215-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BF298FD99
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 08:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7C191C2122A
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 06:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE347132117;
	Fri,  4 Oct 2024 06:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="Y1eUiT6J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2099.outbound.protection.outlook.com [40.107.255.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72146F305;
	Fri,  4 Oct 2024 06:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728025117; cv=fail; b=ee9y5oixzDx+bgTDb8+9YOzrqmzcF+9RstkGtlRJO045+UWg6wIAMaffIXAtWUP45dWo6D+4ivxP6TjDKc668SvhjS9j4zMeS6PkXxPkH4gAqNvagx77mSTMhQvlBTR46kAE86e0ISqVHrQ9deE+OR+jPxieu55lcu8cPvKd4p4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728025117; c=relaxed/simple;
	bh=7JOBVYl5FlOg/TBSAQ0TD4ovo4pNiv6Cqa/HMUT3DhI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UKpJrQhRJWlbA/OD2PRJuFKnVM2tchJuve8kW5bATc2ObA/0VP0Lxb+oDRzVs+72nYgcV5srzar8rNQBHe4hgorHRM193yPKRmB3RIa3hJTkXOWCVt8VSD8agXxqlWjkAbr1/cRalaZE5QIFQZIsHzcvGBkXBI1/+LSwQlWb/E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=Y1eUiT6J; arc=fail smtp.client-ip=40.107.255.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0gCyn4HzcStdSwaupAE9ViKr0UZK/dLU/AS4/vQC81MGYWKXtd46htMndhmrEjiVpINMbOW6pvbAfUYp/17e/9IlA2iKcTWwoptfyFiJP50eolCltJMw/k7lguDBOTPRKDtx1DXR8Qm6FPBG8Cv/eIzuQUCfuM7gqsOY0FETdMltpKKCTVqgVrPz7m3K+lWW6bHhOK26wEln9XvrABm58Bvu9EuvwSvq7EVUt8fF0z0sZwDuXy+2i5DR8M+cxCFbf7OfDQxyHlAEbxLCwanELQnvqMZlEgoRsdyy3AtejkgNvB7cSy1cNQQUe6D2Hws3nX3+ae0JvSQwWQEzSXpmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JOBVYl5FlOg/TBSAQ0TD4ovo4pNiv6Cqa/HMUT3DhI=;
 b=BuOyMNWw6uwEc1tfLsZDHDXvQmK/VygPVBZ4SGcmej7oA03Xg50wwLPArJMoUKnb8LZa4WD4o7fdwQ6DwBkL7NJ1eyrInTiEm1zQyc0P7J+ACqAeOfQkigBvRwOO/r1y6EZcXJOAflsX6r+LDgx2s8cDizD/tRbpZoFgPeyWbOrcy5EDI50DG7Cp72plQ+q+pz/9En4xAgrcwsRtbvFVaQS2EposLXRUtW0WrlYa+k++Sd+xuCU5Op4aPeYSLQPHxZDNtNGZGI+YF3O1S+6K1rvdAsNdv3FJQi6CrCkaOHAcfij9dcvk9PsxIt6mhsS/QjAawaelu1UnF3PnBqD3DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JOBVYl5FlOg/TBSAQ0TD4ovo4pNiv6Cqa/HMUT3DhI=;
 b=Y1eUiT6JFY+3I4mnTV6qgU9Xl0WipcB5+ndV/ekt8AwF49UBelEJPmKjbBdWXEABYgDh65NOI7nhdoojdhUoUflgvs9O/52qbe91G6RIkMY0lefV0kOtlDq80BAQH+KmsHq/LORZoD0yrdMaW9rMF7PtYPu02/uN9aZow9uTogruDF54cSrCcUot7s0cJHObfKeIl0GdehgGBZl7uefekefGD4vHS8TIuBk1AL2VL0DqTJXxeCPz6XeGqmavwfZiYkrMX32BvFuhirb6YY3pFEW0DvaZ3BzuCbBCZ1UqgokboxzC/6d5NKt/1RnEXFBCtq5c+pR/cZcIX1PnKgyWOg==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by KL1PR06MB6396.apcprd06.prod.outlook.com (2603:1096:820:e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Fri, 4 Oct
 2024 06:58:27 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%4]) with mapi id 15.20.8048.007; Fri, 4 Oct 2024
 06:58:27 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andi Shyti
	<andi.shyti@kernel.org>
CC: "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
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
Subject: RE: [PATCH v14 0/3] Add ASPEED AST2600 I2Cv2 controller driver
Thread-Topic: [PATCH v14 0/3] Add ASPEED AST2600 I2Cv2 controller driver
Thread-Index:
 AQHbFJkFQwNKPZEeEUm4WxILxLvNH7Jzh3+AgADa1uCAAG7pAIAAIvIAgAAFI4CAATK9MA==
Date: Fri, 4 Oct 2024 06:58:27 +0000
Message-ID:
 <OS8PR06MB75411555216E89213DA0933EF2722@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20241002070213.1165263-1-ryan_chen@aspeedtech.com>
 <Zv1aOedi9xl2mg9b@smile.fi.intel.com>
 <SI6PR06MB75359904E108D7D0CC89A329F2712@SI6PR06MB7535.apcprd06.prod.outlook.com>
 <Zv5u1gTK9yug7rbK@smile.fi.intel.com>
 <dun5dterlkikft4p2yuuebb2e4nyzed7xeofmeivzldeardhmf@kzv3iokk6cxn>
 <Zv6QdUuiUFvXjcd4@smile.fi.intel.com>
In-Reply-To: <Zv6QdUuiUFvXjcd4@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|KL1PR06MB6396:EE_
x-ms-office365-filtering-correlation-id: 55206563-baaa-4b9a-395a-08dce441f2d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?2Q4a3TnBNwl+U+hFCVAHLe8ZtmA4t5RPug/hlbNhVIOcTzrhOJxPYQH0Uixi?=
 =?us-ascii?Q?Sa6kFxWleD4/6PZaVfTqbHpWSsJbQrDeCxwMXCDwrxfzWEoXHWDhJf4QsZkT?=
 =?us-ascii?Q?VKmG+LBCT1JfLpd6NuxD48VHmiaQlGwn+Xjfn68wVxyj9zy2FlL4f/6a9Xeg?=
 =?us-ascii?Q?Xz4bBRtfXvnhOF70OfYsdWLF5zgeTMoATMah1qlHVOxXjPA/PQJK/g2Pk9Vh?=
 =?us-ascii?Q?Ydb7iJdZ8oYc/wxf2To7j9IPtGFgo3yVFxBStbsEl40XS4lwGvAW3Es8Lmjr?=
 =?us-ascii?Q?5jYFVSPqrI/IMLkJ2zhGCUZ5Aa7T8j5xDu/TbEsD34TPTX2rYTj2HZbb82k5?=
 =?us-ascii?Q?KOW7Gi4WzPXxduccLwy5+qxANdG65ZyZM1jxsLYKj+APhInCLb1nm3THP6yR?=
 =?us-ascii?Q?kQQ2DZ5c8jvIqz/ZQpVRjWZ6lTs0as8KtrMrcTzY14EM8CD+oKP4wKC9eK7p?=
 =?us-ascii?Q?Bfu31AdhWDibeLz+jLMi7ad1PBPlz0NJPbRFBLhdSObpv9jny3TpQoL+yMdh?=
 =?us-ascii?Q?fheJpC1BldZX3ctLDTQP8cxZnWqZmN+yAvmMZyzdD3Ndrex+EqML2HcNa9Te?=
 =?us-ascii?Q?HjN7N5TspA6EhZNsE4dtmrmB2xlhdbxSXs4SKIzemBnoCKQKTOWD/bUsApBn?=
 =?us-ascii?Q?8yNX0sbbzyvdxdMmCSfsWKjboBp6igPSyEHxMpbWz8DO78EnohwGcSSlbEQp?=
 =?us-ascii?Q?3ANacXDSZITFRj41/p0JMdz44zQ2qGWoaFkq3ptVRLiW0XH5xX4tafILc50Z?=
 =?us-ascii?Q?idhy6XPw1onJ8C+vwiBuTWlIDqIH95SgdKe18hKSj3275x0HNqzO+Mx7YVw3?=
 =?us-ascii?Q?gFalkg/atkcb8bmQ3kr/deYMRgsgtUe+33sqe9RX6P8QHoUdnROi91oUGCVj?=
 =?us-ascii?Q?6ZpZCQCxWumnTvvGxFQPuOBo4B/BAtDaI8zIHYsOc5S2vyjrozwaI9m0FogH?=
 =?us-ascii?Q?KMDl9HEQ0pV6gnA+B0iItSrGE9FWaJNr8LFOwF3q69cj5/B64yosizTnVo94?=
 =?us-ascii?Q?64BdgvI3RqHuZoMNaebY8c1iay8OT7eJWQ2VXJe7w7bPQpqAaSohoAZwbtZf?=
 =?us-ascii?Q?hBXjSI1kYlYxhUXMIxTryMZsoESml9OFmhDvxq1GTVHosflrCqp53p0gW8cj?=
 =?us-ascii?Q?tSn/UxzQ8q9urGgeC3UaOzPO92c6DP16nHL7ejB5sIVTEF+UCMrwShw1tjEC?=
 =?us-ascii?Q?kl4mGKwzzIcBH1cXRFUQhOkmyju32C64mOz0fQviETtAyLEIXKo4Zb8UlNNl?=
 =?us-ascii?Q?D2SwC4TCtZZvPfG8b4dfvBxsSHgLsUUrWQyUdE4AyDb11hf1SqiawPIwFQe/?=
 =?us-ascii?Q?cEvk+Aq9RGshvvxjWg715q+5kRLaSbRehJlN3k3kRqXGsw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SGDpGdc9+jQeZ5wklaR++p2wkKVkK8LfnQ2CKpKNBbFC+aEmCmopWJRtlPmk?=
 =?us-ascii?Q?jlJZ9qzGDZM58jihSXw688S/RVW9/5C5G5n9wp8hLbtKO1T128CSWln+dv35?=
 =?us-ascii?Q?tzJ69DlAlIT3V6KkCxuF1qhikBsRWiKAFZx4q6QWupkTj7wRrc4+V6SEe03n?=
 =?us-ascii?Q?avKdkT/L4XLNswtVgiJYzHdqDeZm9jrzI8E31Tz+B0XdC+2qwasOdFO7K5Fs?=
 =?us-ascii?Q?q3xHHzsWTEpZpjwPbsiR3OAagn9NXn0hUaJQSesnRfRoJRF/aBG6o+rY5y7e?=
 =?us-ascii?Q?ryn0lwqa0ge/0VKXDUrH1Si1n566sNpH1L/JvCUDdGnv6SymURa5Y9ch4ZIK?=
 =?us-ascii?Q?dPiciDckoG9np+/Gs3myfyue9LcAagXXm7q5Iw3WhsoKh1T+4pZJwkA4RPGM?=
 =?us-ascii?Q?vKl474rNIc+zRuimhqTySvBdaSphBcSewxEkaX+utO5qFsmCYE/tzkJ0Cbog?=
 =?us-ascii?Q?BK7d9edpoTZJ78FDpcza2sQAWLRu2bLishHgEiNKEz5gFioBwDmUauRvWynb?=
 =?us-ascii?Q?YtgsnD+iEqoT0qVUjhOBXPEFQkPJnrKeM/2n3fngRxfdR31cleq03c7Y96gE?=
 =?us-ascii?Q?kd5l6MID/b1lZJSaJ0/tx/n0gwDSsUy4Fp2xjztrM8DLWBqARHlY3m9Q7pIr?=
 =?us-ascii?Q?7NRn1IXL421SKBck834efwdS0rvACQLgEn16o9W4fdsyEe2hq5zwIANi05M7?=
 =?us-ascii?Q?nlnwTmm1y10ed3HKNlmcjgcLZtUb0ork+CXWhfn4X2VfACLHrJAHCX0NCquE?=
 =?us-ascii?Q?0xzKIOmuP2GreyDB12WrQDnqcwU3Csmo0AohbBwtreoKmZ+gTt8N4uvWlJXH?=
 =?us-ascii?Q?SguFjjzvvzlqcbKcO83lNkv5JN0ApywRF61CMvzR/SsHNxRJNguF/x6MQZAI?=
 =?us-ascii?Q?b7bKVtyy21p42RY9fFitMhlWwl/i/llpVihmnqMIUinS8K5YLANbsH2HIX5B?=
 =?us-ascii?Q?8C0GKwcTkxxeLeW3yjNbJQPbXYsdVu87TIJZP45YbNM45LVKw+1sANk/K+sO?=
 =?us-ascii?Q?mfBMkpi62YORpGqe54oxWUbzJt8oLAGzKuKuiXUGvV3s3l8iVwKNuUBZbNLq?=
 =?us-ascii?Q?7feixRwnU54GSoas9Rzx7Ne3BcgrUZjUYNgFxZTjJPxotUWvEnq8KPEWJVkg?=
 =?us-ascii?Q?gn8Qs5AL27ukX6cq61YnN9JHAEe32/VqneaIzUNkpAsoDDtHd9+HHUwDP48H?=
 =?us-ascii?Q?nZY25p92bRfpeGDafLqqX1l03MQ7kd8Vo4e0U9HpWcdnLpdOmrWsO/G5bsSp?=
 =?us-ascii?Q?dIKvRP5rjCrT0z/8Z28fNbtu+5JoL3VTcCWHr4V57EkTNXaWLEpXspgdjroo?=
 =?us-ascii?Q?dmf1sW9Ri/WAxqmAgdYL+aSRhZLRAsxnO75l9U9IAAYzCQzWg1HTJ5wMxif+?=
 =?us-ascii?Q?pXQEVW8Q8kHsaWMcJIToDt7Lk2gnUG6vMdBlAJja4L8C4ZYu25kAkORCbSjH?=
 =?us-ascii?Q?NaYh3WrXWBGvCK1/j9ghLLskpH+47zdzAPkxkXDLVFh//fniyy0mDG/t7t9Z?=
 =?us-ascii?Q?0nuyJl0ltrnCQM7KJ1Y78lOByO6Mu+cXL5pS401Yx0tMYYRTFdXKmNlKRJ30?=
 =?us-ascii?Q?erie9V7OOTbiaW7fCT0aGZxhOmNWtTb8oiwUSvRI?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 55206563-baaa-4b9a-395a-08dce441f2d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2024 06:58:27.7484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ayUOovFX6oCFQ506JOUIrdTYtTX4HRhm/3YHwB/KF2E73U9NpN9gtcHceKhO5ZlJEmT/x7ySeCVuNaDLk7xwLNNukkkMQndv79k7Tevfm9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6396

> Subject: Re: [PATCH v14 0/3] Add ASPEED AST2600 I2Cv2 controller driver
>=20
> On Thu, Oct 03, 2024 at 02:20:54PM +0200, Andi Shyti wrote:
> > On Thu, Oct 03, 2024 at 01:15:50PM GMT, Andy Shevchenko wrote:
> > > On Thu, Oct 03, 2024 at 03:41:57AM +0000, Ryan Chen wrote:
> > > > > On Wed, Oct 02, 2024 at 03:02:10PM +0800, Ryan Chen wrote:
>=20
> ...
>=20
> > > > > Is it possible to switch to new terminology wherever it's possibl=
e?
> > > > > I.e. master --> controller, slave --> target. See, for example,
> > > > > f872d28500bd
> > > > > ("i2c: uniphier-f: reword according to newest specification").
> > > > >
> > > > Just for cover latter? Or I should modify for each patches commit
> message?
> > > > Or entire i2c driver statement need switch to target?
> > >
> > > I believe everywhere, where it applies: driver code, comments,
> > > documentation, commit messages...
> >
> > If the datasheet refers to a register, state, or any other hardware
> > property as master/slave, we should retain the master/slave
> > terminology. Otherwise, we should follow the i2c and smbus
> > specifications and use controller/target.
>=20
> Indeed, makes sense. Thank you, Andi, for the corrections!
>=20
Thanks, I will modify with controller/target in sw driver parts. Keep the h=
w datasheet statement.=20
> --
> With Best Regards,
> Andy Shevchenko
>=20


