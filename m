Return-Path: <linux-i2c+bounces-14017-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B43C42629
	for <lists+linux-i2c@lfdr.de>; Sat, 08 Nov 2025 04:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5368A3B26A5
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Nov 2025 03:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DE5279DA6;
	Sat,  8 Nov 2025 03:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="cSEOen9Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023094.outbound.protection.outlook.com [40.107.44.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B1B1E49F;
	Sat,  8 Nov 2025 03:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762573658; cv=fail; b=MC99ji+m/ly73kMdswIB9KTK4FuYUMxQcW6d3SDVpIRxz+QE3OY4+3+Xjm2AYprSZV05S0xdzCXyyC08HTv0d17bNf7MVtEfUsxdmdOccRz0DMfO6gOj/BidKYjSu8OCvPVYVZeT01aW7nwxJ9eyZYyaN97yCVLUma5sxVI23MQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762573658; c=relaxed/simple;
	bh=8Hl8NQQvqyG0TfXa4rU30iVoWbfi9mk4jEugPjtok0I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PiSEJVKq8snbI/qoI14mgMuJCe8HH7fMovT0+tlr0ad48NS/CGQMpt70p7z76xJVU52W+WwPxII0QG+FS1KpEkw82xJ/dvc9x18nelbnb9DnXyTNCW/W1g+UVu+iK2mNTQk9+wlOiyO51nn5yPkAyqid3csA9z2T/BUBzgoGubU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=cSEOen9Z; arc=fail smtp.client-ip=40.107.44.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OneHZ9KSMyFyjlp8GMvOJhxR9upAZgGrA4DuWYw01Ize2bLgWumHNeDXYvXwnVCq9SFg8JL/ZMkAgu+Fr5UwC9bsu6DilvehpUPxw4D4sh4iwS///dlXE5hav0oIBnZFNonoiTpTLxTlJgFoybhpTyS1EXRXXZrDLE+rWlRoLNPp6jvIoeWwM1IGlW9HuuEON1SnsUC4JyH9INWYygsv/J3+8aAHZuMAu4Ce6OMgIdyVwVEKjFd/sHCIlBbJRoWJsUR0OO+7jdbIHwRN7A8tAANyUiRquJfxjVtd52MtR8GNE/rIA30XbKc131lskNXrH7QP0ykKcaBjRYmVvRjrcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhoN+xy44sAwoZVICwUOZbM4+lzMfNhyouoaSK+C8RQ=;
 b=DGaBim7oG0/vQdhsf/eeeMDAUST4Ly96tWR34D3UHFgCpf+iPN/g61SaJAD6Px8pAcP8zKG33Csx66xsCmyaiZbJOEMES53Ud24Rwr183EgI35UW66p/WBW2sAmqHkVbghjnsHsobcT4n3QSz0Ttosp9vtQen8aJh0oEmxCw/GMC1nC9LWqF0NNCfX8x5CotDTNt08RXitqByBCZDjX/GMtGHG7BNijUQiYcNnHGF/gSb0/k9pd0Dz1nGkXxagRL/SVT8O4Hclvs5lP8Lbu9JvlGY6KMyAP0e3KY6VNvJE6ex+5E3Livjc4KFIsT/z/9513hqpvFlWl2ln1PoQIWpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhoN+xy44sAwoZVICwUOZbM4+lzMfNhyouoaSK+C8RQ=;
 b=cSEOen9Z85X41NyQm34h2aj2W4I5cWRpV7UBT/uNMW788e5TqhLZAzj8/DpHdD3DLwezi8HCnXcM7U+Irmbmu/IzdFvJWcGImbVyq5oZ59kmJLdw5G+iX4jpA+DwXRYWsgziDamfXCNN3IGrOIDoSqdMQCEJ9YqmuspAP70aBaZ4rNNM9cJE+GtlJswy8FDmXQ2dnM/NCQM/PCWyc9k/6cxoIJm+olOEr8emIaIeOLYKZSzHCXYQX353eiLU140Xfb7U3uDn77BsLUnHVOJApK/vuIS5Unfehc8Cjyyep8HgVt17HcE9AWgiBc0bm78VVGR1eZiv6aKH1PvM+H/cUQ==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by TYZPR06MB6048.apcprd06.prod.outlook.com (2603:1096:400:343::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Sat, 8 Nov
 2025 03:47:31 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80%7]) with mapi id 15.20.9298.010; Sat, 8 Nov 2025
 03:47:31 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"jk@codeconstruct.com.au" <jk@codeconstruct.com.au>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "naresh.solanki@9elements.com"
	<naresh.solanki@9elements.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v21 3/4] i2c: ast2600: Add controller driver for new
 register layout
Thread-Topic: [PATCH v21 3/4] i2c: ast2600: Add controller driver for new
 register layout
Thread-Index: AQHcRwi5PyFo05/UVU+zKir4RznKX7TWYJ2AgBBvTECAADe7gIABLuQA
Date: Sat, 8 Nov 2025 03:47:31 +0000
Message-ID:
 <TY2PPF5CB9A1BE6B128FE8388B5152B5752F2C0A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
 <20251027061240.3427875-4-ryan_chen@aspeedtech.com>
 <f08b1078-fc8c-4834-984c-813e01291033@kernel.org>
 <TY2PPF5CB9A1BE64FEBCCCDC7631B355135F2C3A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <aQ2_D6vs4m1brNk0@smile.fi.intel.com>
In-Reply-To: <aQ2_D6vs4m1brNk0@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|TYZPR06MB6048:EE_
x-ms-office365-filtering-correlation-id: caa1343d-6fa3-4619-03cb-08de1e798b8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ZZugjxEsoNDXotgYEBRrnb9GRmqiiEKE+uhXeJnKvEULcKXM6/09nOHMB1s2?=
 =?us-ascii?Q?FkgwhrxDgdVPXn6cqWaxYLb4zzDXyTLwlx3T43yaFFTmgMi4+7eE2dIpYkbN?=
 =?us-ascii?Q?aeEjj4MM4Pb0GlD9xhG/jpzUheC/jNsTRx3uVFMbwAC6OUOi2fgrjCFQVcMn?=
 =?us-ascii?Q?XHfyhSFeIfheZYy1Y2XK5UroKtd89SUHIUw+CH87WVV1qFVTiwYl2D7oElDA?=
 =?us-ascii?Q?bNDt6XwQntqQshZyE73qg8JY1hKPNu3M0qyUy4GFeGZmW5WfjD508N8FSpT+?=
 =?us-ascii?Q?4EKrd2tLQ7TrO8PoLCERrCClNhFgXExlKjqdpIEXuoI/XTR3YDGHmEqrvV0Z?=
 =?us-ascii?Q?slJyYIifJCUqB3ZwCWKB9ZhW0D35BwjXinlX3ziVgFfDAgDwykA23aY0e6ui?=
 =?us-ascii?Q?s79VMIlCbVWtms8vyazD5P3TnttVaREoqtyYAwbCbXqdmb+mI3aOqldHkd9q?=
 =?us-ascii?Q?J07/dsJGQqBBIzIeAMJnYcinxRblubC2HTedVded6gDiaF6ZkfRNXK7SMifU?=
 =?us-ascii?Q?rUaw8ir2FIJtKOqgeyLeJR5eq2uc2QceUY7Jwmkm3bzg8ez4rV5Bg3hCiLWZ?=
 =?us-ascii?Q?uZBxmpfYVvw0RHLMIWUGtUHTqPkMx8v7RpLlHr8QMmTR/lqDYKKk170tlMR+?=
 =?us-ascii?Q?lh/P6zFrnSS659yY5JsDSsn8ygsoRjnZn6Z3X1mh2X5xqSa21Bm8tOFOorMC?=
 =?us-ascii?Q?gNp0U+DNcx3sy0oLmzVK7sdpf1u0yZibYHeu8vlFTucQcTVX2EQLGWCK389a?=
 =?us-ascii?Q?dN2Xjj3jYOXtMGEPuJqHu49wnNqnaUJzBsCgCwG7xmvEeiL1zgMsj2HYmBU5?=
 =?us-ascii?Q?1zvUMB8ZOMg1rhs/T4jETDlOVaNq0Tvmt1YfHrSQAcH9RO7Z8GHP8/hmr0p6?=
 =?us-ascii?Q?oEPQ5CM7ZapSpizvSlIJFY8YXVBYdrWjB3je66egLJAe+jgQ4foxgGvM+0Kt?=
 =?us-ascii?Q?3tHzCblz2LP78yWtrAZwsYjUUVb3LKMPzGHBNTtTEOP0p/aRkjFbLMWcSwSO?=
 =?us-ascii?Q?p8R4X9gFBX3QQEHyDJiOo6ni8RJqfPdfc1MgdeuUSEhlSdUgl37h3cfpPGjS?=
 =?us-ascii?Q?IpGFLPudoJBTRq3Vji/TBtfsvDNCRchDYMour/sa3AYyqlV0bq+WfHxkJhj0?=
 =?us-ascii?Q?WgEy7rbgz3ZP8kG+CWYVUI93e/xLrgfFp23tcfuPEZDqBD6VkDJsD6sqciyx?=
 =?us-ascii?Q?Kyfq1+9XKfYJ+MPnlbJ4j5yPp6pO4jt+lNxEFo8t9ZNvjEgF2obffTIrwyYI?=
 =?us-ascii?Q?2Q8+3b5AEggzTuuUEO29G+NZ7v+W6fKypyIBlo53RBmm8IxuHNYCwnwtQ3vT?=
 =?us-ascii?Q?leKH8Mdm0uM1dcksC5Ct/Yz/Ls++WlFYOGuF3ShaHplX0897wURlkC1zh4rv?=
 =?us-ascii?Q?98dXqEjhM5/iRNFLgQrTDiWSjEfh1lwpZsodTLMIWo9lZjfsw7n0bt8RXX1f?=
 =?us-ascii?Q?SycF25b+6dgNxbfOU9/YOTl0UVQZlCt1VYtQRXai9qAweZqW3XzU2jrf4YSO?=
 =?us-ascii?Q?VQtMVwmRdcJn8kW9bnZyEvuPts1cgUFxAh3R?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QrTgJrnDUgjWGonfB1mZdFw5DieM51QVm8eaOQLPndnVV9u7OBZVakvqIa6c?=
 =?us-ascii?Q?nqIIzQC5Hrw6Tr9dv04Z/Jvg62HuI4O+CgbITY6WSJuXyEzexUIfRmxMN1vb?=
 =?us-ascii?Q?8skLi78+eGmQn7pgCpDSgqH0bqAM4/EAXvC8K+mGCpwibpVYvI56ZCyaB+Bp?=
 =?us-ascii?Q?aiu50kZ5dPWyELeYRrKyJ/koGz0i6KMeHuooqExMtxKu3OQMDVBHCKyyduId?=
 =?us-ascii?Q?zrwBhp5Bvi0if2Qcwm5HvpAR5f2ccbYVdLE5QljgLyKKMoCakfIJ0ksVDMn2?=
 =?us-ascii?Q?grXcfKn6q3OiJ2gYW0xcQFR53jTqfHEt+QYPxq9w6xFesYrdN+ySHRkd+VBB?=
 =?us-ascii?Q?MLJjsE5RwmrvSieBqy8Mtk53dcUT7s6nynIPSt8jLYVVQs2xaWti/HmdDnHq?=
 =?us-ascii?Q?Jtdt+wCrQMXDbgpcuNNtvPweBYAtnOs4rU83mqgSKWXHQXlgLsOdHv4jsHiv?=
 =?us-ascii?Q?xreMIBp9tjZHWmLenkLkkOv1ZvYzip0By58ULTOToX9a2jSxXbrNiEg+ukuY?=
 =?us-ascii?Q?sXEtuCA8ziTTOQBZBcg4iC5fTnP8XvYktR0ES+oDlREjfDbePzLQJ/385Ng4?=
 =?us-ascii?Q?OtvERVcwHe2oJpDCyyArXA3HekcMCq6o57nwSVAsnCmcKePh6+4XjYo89EUg?=
 =?us-ascii?Q?8h4mUulTSyQSYvR4Ing25N23PD3enV9lx2tuxFmcfhCBxhgLhIlXtB3V/fpt?=
 =?us-ascii?Q?/DaCKhabyMi1OZcWsQknuaH56ItaPRAAiYYp7pIN6QyS6OzM3qB4C3npZEul?=
 =?us-ascii?Q?tXzG4vj7yIOWFZD0r4B4yEBDIXVFG0b/MO09cFJEG2TjWvqCHT/7d0y8CVqF?=
 =?us-ascii?Q?DmOldHa37JinlQbnV73GqtV0MYqAxZSqdUd+cchuX5UsYVeSkQ24/Esj2A5B?=
 =?us-ascii?Q?IAEpSYx72qTsDgbpJNXnv1kruGJwZC/QkODE7+8NHYvcirmqs8siLXZC3bOQ?=
 =?us-ascii?Q?TUJGPmU2TVFy6uFCGMBSvhWGZECRifSSmLsLHUqTiYkFs03GAHZI5oCrkAwG?=
 =?us-ascii?Q?duHtaX6wWFgE/q6W2lptFJ5n1q9mcWc+BqhPyd7DSGqNgeWAt3WZfkf3kpxI?=
 =?us-ascii?Q?rgs0MAjsbQUYnvKC4cOt0xL8eYs7ii01lyoKEU75CdlSO2TmtAo6tFut5+fe?=
 =?us-ascii?Q?P1W0sC0+K9n12p79llthXCYIZDDvcNKfz7Xcntr/cl19NHo21ETXisRpTXNs?=
 =?us-ascii?Q?pvRtdfCrGRabm0MMIbktm/BVgN7UxqJFnds/ZXQrkCYnDzMcpNRqVw00oi7B?=
 =?us-ascii?Q?zB/Z/uZELPUXAWCeHXgFZiPMcK8UGFSG6mNBBhO2OrHYjY18J4qrd2JkA8rl?=
 =?us-ascii?Q?RxqVwOTbmP7rTWS8zacYjLyzZuocCqsIc1+sVROFrDepXPPS2X0a6rfDlJ9F?=
 =?us-ascii?Q?27sxxysxz513k0z0d0r1nVaOQX36MITIARpvwqjECe/i/mHBWgxM/119JIDW?=
 =?us-ascii?Q?qcHwjqQgGFp59QqNV6FeGTfxIpyPa2ulxFsXyTI6/O3+ERjOvp2xVWjeAaE8?=
 =?us-ascii?Q?r3hzYgtenopfUyTtKcjrjytzfiKXUrFoYarrpV8oHIDi4guHRTe7Dkc28CVb?=
 =?us-ascii?Q?6OEVu1xNeT8VSgt4CCLDT9Qf6Qdh0RvxneW33CL4?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caa1343d-6fa3-4619-03cb-08de1e798b8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2025 03:47:31.4266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZTsxzxDBFLR3732qa5fXYlAOzBRE1L5Zh3v1YZXqlBniXpsWgvogCN16pc9zhNZJSNPD06aSftJmwv1wp+ZM5i66Q+2/iBgV02SzwzEmMYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6048

> Subject: Re: [PATCH v21 3/4] i2c: ast2600: Add controller driver for new
> register layout
>=20
> On Fri, Nov 07, 2025 at 06:26:39AM +0000, Ryan Chen wrote:
> > > On 27/10/2025 07:12, Ryan Chen wrote:
>=20
> ...
>=20
> > Add new file i2c-aspeed-core.c to do legacy probe and i2c-ast2600 probe=
.
> >
> > 	if (of_device_is_compatible(dev_of_node(dev), "aspeed,ast2600-i2c-bus"=
)
> &&
>=20
> 	if (device_is_compatible(dev, "aspeed,ast2600-i2c-bus") &&
>=20
> > 	    of_parse_phandle(dev_of_node(dev), "aspeed,global-regs", 0)) {
>=20
> Not sure why do you need this. Isn't it as simple as
>=20
> 	    device_property_present(dev, "aspeed,global-regs", 0)) {
>=20
> or something between these lines?

Thanks Andy.

I will update logic as:
if (device_is_compatible(dev, "aspeed,ast2600-i2c-bus") &&
    device_property_present(dev, "aspeed,global-regs"))
	ret =3D ast2600_i2c_probe(pdev);
else
	ret =3D aspeed_i2c_probe(pdev);

>=20
> > 		ret =3D ast2600_i2c_probe(pdev);
> > 	} else {
> > 		ret =3D aspeed_i2c_probe(pdev);
> > 	}
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20


