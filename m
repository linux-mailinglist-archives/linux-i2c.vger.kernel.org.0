Return-Path: <linux-i2c+bounces-10950-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F8CAB4A76
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 06:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 664B33A9CFF
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 04:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271C11DFD8B;
	Tue, 13 May 2025 04:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lZjhbRoh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D211DE89A;
	Tue, 13 May 2025 04:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747110305; cv=fail; b=jtril/5iljmz81dMN9u+jX3ZA9st6/hs4U/yO34sR1FhCokqCqzN4OJ7l8qVh7lcbysU0RXxPDQY8twehwwJLM5HSuGx09t5sYlo1o2YrtFCioeoI1czOohv0jc29rl3oRYnakN+aY7TvyQPoXVHgxp09kJaCe0+kzzo+YLN/OA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747110305; c=relaxed/simple;
	bh=n35kPL0d/qHMOYBh4oK+pqWIpEDbcd8YXGRxkOeD67M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mVCa8ZkN8tRxjvYCSNZmbntFgFseFrzl0YswbmOsl++Blq2hsJEShm7fHFqothrS/ege0iatm0LkE88xSL+NSpgQpvCVXrlbXECa4IaeLP1rPnifXYemIjOoSpJf9vKJK86MfWDv+JMssRyxaCuB3S5u1Zxs9Oma1J1EtG1kagY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lZjhbRoh; arc=fail smtp.client-ip=40.107.93.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hoAuIXd457PtJUr2Z78WxHLQPT2qcbXzrZnVORAJeCPLUwwNEQhNsrIfhM2hZAhWw7ZufQI9UnjT2oK8lv5kJ7UH+QoRFU+5lBz+k34APGt+r4lW9Zo/NaePoJNEXpBRPt4hB8b/vr5CW6Dl5ZaE6S3OWj0R/Icu5IdwtgW8MN8fFdUezZZ5I1iUs42+NyK1L8LaIapBMe+8EE6SyObxrG4cYvt3iYrS/bUyKtsTjhkAgd85Sz8EYGGUJZm9UiyOc6jy6sHavLs0vqd3F0jOH5+A3b8GccIpUbzNbd64/LRMX6syuDM7lzSoK5QVTuxLCu8COu4JCvO1yqgg16aGdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n35kPL0d/qHMOYBh4oK+pqWIpEDbcd8YXGRxkOeD67M=;
 b=ZEA2i68v17GYB45oSZUZuz+4aBRNMc8bH2M4PVTEWoLUsq7fPYaVZMmjtugLu/A+Tvaz0YIWjFJnVQn2jtHrxCQhqBq3OLi9seSM5LTNi88a9oC8MqysUx7jAMycvzfULjo9ZyxCKVPYs/eFOp3fTM6N+TusR0y6yrHDgZ8yqFFt2/OIb0n9eLohyFo1TRV83TW7wJV7dPrUSL0+zQoiR5KfsjFRAdjdx5PgWIBCxMyLoZnGbVpsgtcEPrEU2J672OfOxsJNXh3+INefVFF9chSK8C/QgrH2VF+JX9dgtkXlg+HFCFfOaWIUzqYWDJq8APPKaEHA+qWPsIpvSZqsWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n35kPL0d/qHMOYBh4oK+pqWIpEDbcd8YXGRxkOeD67M=;
 b=lZjhbRoh8VnJ4jaFed89uYOYN3BJWX6/MPo4HvcVCXp6laP9N1aew24HO+nJYa8knGYT4fOGB5uSucB8dZRfXrUWMJrcd/1hQYrpcIJDLPVFt0TzIo+bngKpd2gp/aW7xi9It0/prNiImLksk90AY5OEZYNYtBTzYoRHHDcPGBaCwRJYcersUnb57qzLwlUu9d+MW6dYDw3xXnIGseWiB0rB5C8V+YBWuG2HG+bv4K59+kDmTo7bepUWxxZcnyrKieOgZzV0lYDqWTj6b2f/he3Rf0pCbGydM9gSus5BhCO1St3Yy4E5Q/eqedt2L6hS1Rcc/wmIRkmIhsdDO9ehaA==
Received: from PH7PR12MB8178.namprd12.prod.outlook.com (2603:10b6:510:2b3::19)
 by CY8PR12MB7611.namprd12.prod.outlook.com (2603:10b6:930:9b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 04:24:59 +0000
Received: from PH7PR12MB8178.namprd12.prod.outlook.com
 ([fe80::77bb:a9fb:c75b:f530]) by PH7PR12MB8178.namprd12.prod.outlook.com
 ([fe80::77bb:a9fb:c75b:f530%7]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 04:24:59 +0000
From: Akhil R <akhilrajeev@nvidia.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter
	<jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>,
	"digetx@gmail.com" <digetx@gmail.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/4] dt-bindings: i2c: Specify reset as optional
Thread-Topic: [PATCH 1/4] dt-bindings: i2c: Specify reset as optional
Thread-Index: AQHbvm2lNB6Xz/FaYEKlBmAGw7qaWLPPrCgAgABUKWA=
Date: Tue, 13 May 2025 04:24:59 +0000
Message-ID:
 <PH7PR12MB8178DD12E45197204A80507EC096A@PH7PR12MB8178.namprd12.prod.outlook.com>
References: <20250506095936.10687-1-akhilrajeev@nvidia.com>
 <vua7cq4nu5piz67as7asrfklimflpj2hznnd6oadcy36bglunt@ljhzegmt2jry>
In-Reply-To: <vua7cq4nu5piz67as7asrfklimflpj2hznnd6oadcy36bglunt@ljhzegmt2jry>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8178:EE_|CY8PR12MB7611:EE_
x-ms-office365-filtering-correlation-id: 3a92afae-cb34-4c9b-3fcb-08dd91d61fab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?+nvsvHkxfgKeI4a+9BeYp6Pz0ZyDiB33emaUaJbpFVtfifv/Hmiff7nedWJP?=
 =?us-ascii?Q?4Mm3YMGFMiz+OWkIGUcDWEK3XYvRdEqwVqmqwaIGI8dpFQBvHuxAV5keemaC?=
 =?us-ascii?Q?jhEHgrdbaOhMC56n08mKtvX7mDrSTki93wcNHRwRU6Vlq+q6eNytWJVi8SzV?=
 =?us-ascii?Q?77Gspwp5PxpXYfg/reYUAlij9aDnjQqsuq6Ev5Dzakw410u7y9wdacAim4rF?=
 =?us-ascii?Q?GHApcuGXbH4Yt7GqHocd/hKHb/GfqFhNqYxDUMhhWublFUh0jxKMurds7+mr?=
 =?us-ascii?Q?NlZgh5TBjVZjlDmRdqVl5/+eA60cyYXa5+qjCz5rtpyGmHXXZu7AF9j3A2fi?=
 =?us-ascii?Q?8yhBEinSt3ijhgU2IGOMuFFDpRMNpT6l/+Qa60S6KSOSC+r9+fj0o4Y/A76q?=
 =?us-ascii?Q?XCU41SNGYQkEgpNAeJ7LVJekliBLK/dbD0nAE1tbcfEHFwAr767anlXlTDWH?=
 =?us-ascii?Q?Lzz9ULMrVwn70qPd4Kku20qO5GUSCn9Yoq1FwFLM3LzC0C3+IjkolIuibWQK?=
 =?us-ascii?Q?jxdd0FwFkDJKYu1t+Ljv9A8czA1QE/QDhflrF59U3R+3Elf0BYTcG8AQko5a?=
 =?us-ascii?Q?rK/CUV1A2aeNp+3a7BmHHJqfmBd+8zUf5Xv3aVQUSJx21MmCjlKDUpxfob1/?=
 =?us-ascii?Q?GNHrZjNbrig3JS9hxh2CeZp7yyx5gsIyTni5HY+oGOJouLXGo3Y2yY3lIpUO?=
 =?us-ascii?Q?aF1GikYdQh8Qfx94//DR3MmN0eP+JZNPFNJnjUyVIOueeEIxc4p7mXGym8UV?=
 =?us-ascii?Q?vcL8bzcbpCoRvMDjxD3PXJSwJ6RqIoYf7D6USSFBNHRRjoYYl6qtwNdXJPxo?=
 =?us-ascii?Q?VyQVmi5UWstJgVMJAJ8TIFAgyftPC1rtxX03aqhMkTYP4rV+NQ0LfLGlWYV5?=
 =?us-ascii?Q?iTQHHQiEEJIItxn+hHq+9Pm06gSTV56TGB69bZablA+J0N1S20nUNp7Fg85i?=
 =?us-ascii?Q?UX32R9WT4UGdcR5AUvcjI2QR4fpXqGUDTEJM62pG0j9hwSn7bOrN+nA35tuu?=
 =?us-ascii?Q?8q5is8yHp/5KByKF3oRL0t+TUvFcm7AVkZkiAbALKQUnFe8Aem9chzn1rHb8?=
 =?us-ascii?Q?Y4i1iPAsVT8FMnZirxsUZmAdySgUiGjLXMOLyO/JSPmT6YcXiKHbC7YGfkxr?=
 =?us-ascii?Q?F/7OigH8+BHNNoKdkr5xmM5CLm5JOWuJZ6VqmyxwbWEllNtUkoL1pPpqD+7u?=
 =?us-ascii?Q?SDiSvoBACksoKuZyMvJ0rAw11fygL72nYjanUJBMJzTB7Jz2ynj2Y0mH/d6a?=
 =?us-ascii?Q?B1pxvhHPc4sCaUzL+J+gELiku3whhMX9RbgydWIr5tXrVfiAcURVJRtSOEd/?=
 =?us-ascii?Q?+bg8P3H4cIEOYy3E54UnUzflRSTSEpyxs+bN5KEzRkx4SN8sFTB+mNQgS0Y1?=
 =?us-ascii?Q?7rjde1pqOU/cIaBTyTX1V8CJfJNi20z7lFPOiOmwTFCfMQcrxSlGwU8VIYcE?=
 =?us-ascii?Q?qplojBrDqjvWNCMnpS13DPEfSe4EZFKgHDW54fVq3Ee9sTBXu276QcTK6wkK?=
 =?us-ascii?Q?JyE4NUddVm0FcYw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8178.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?eFEuVwdLsI9wRjWT4+Tg7BBJjIOu/VZ4WXmVvXpTaRUlXNvMZScPUDW8CZ6k?=
 =?us-ascii?Q?ZxJajBkhZjNtwvrOCWp4aWDtt53OE1F6AHjU6EhtVtSo2tbyTlwUGe1NLSpA?=
 =?us-ascii?Q?Y70y17uSDj1AKsSZxPmRBXwfRlpZyeNGa2v1sJSP3WcpzAd0WbUL25rmHo2G?=
 =?us-ascii?Q?VTnXe+2SGqBk8HdjsuoMyOewt8cVYpe770yc8nT0tDta1fPZJTl3kIWfp9GE?=
 =?us-ascii?Q?3eVBLDaHADWW+nDTCETPst5UmOankliZ6RqTNqQB74aiRJ2kYIPQQIAYZbxx?=
 =?us-ascii?Q?WIKLifsjrYWWU0OuDFTb2AhuBACVbHn+ujpr8I/GYikDZRAiibCV5r0a/arj?=
 =?us-ascii?Q?sA0Goj7SbOW6aIeX7lx5QoSv3HysvrvFdc631WYMfc+MgBEh8DAL5yPeXC1a?=
 =?us-ascii?Q?fx7M80z6T+e6cPT+uEHOnVM2bUpWhUhJ/UTfPrcLTXU09cPsfoHRuaguE7dB?=
 =?us-ascii?Q?CG+UjCBXIIeSBTSBhn+FVzQpgKnJ9IZHIOViAFk8fqJNVoTnSMqTXGWGadzI?=
 =?us-ascii?Q?hhxUJMNECymhwp3XD5FCK6yNOy3vrEvCt+Ona68NncLefWW9NvaQNgwtLAPU?=
 =?us-ascii?Q?keHhzZCvSKlG2CsuvvKvQySGipCr9FJ0q+Nbd+lBdRn5GsNVvbdgAx6JNVv8?=
 =?us-ascii?Q?VODdbRQ5v58Ylq9Zqi4iH1QbrPRhTZ3hD64U4BGrEEcCJ2hDWq7jdXkfgBTF?=
 =?us-ascii?Q?Lpx99W3HOFCiK8QGG5pcJWSKV5eBDEhgzJDx63E+YsmH7zvc6WqCye5ywN+x?=
 =?us-ascii?Q?pCCVruF8QP/lezOXNRiho5ws5s0NlurIPNzev/W3v4eub2EDFTTP/9u9Gc9+?=
 =?us-ascii?Q?w6fKCiFOGCUJP+gV5qkDHcQg1xd7TWzYj6WUux1puRQfOx7TKXzJfuoeIg/S?=
 =?us-ascii?Q?yrt/m9xvprAp9SEhjQx32K/YelG93PxWRAwXPsquPMOctdSk+JNtvFmbESig?=
 =?us-ascii?Q?RR1pYj2qOol9u76u1TdNrAlUG7ZSscz5OyEJPGvoahb3eTzO1sEE9QyYB2mN?=
 =?us-ascii?Q?YJNQNbdlwhQo2hxe8vJGyzkIhe6pqPHu8q0590o/KAWS5WSOdm7aPv2+K24i?=
 =?us-ascii?Q?Fgos9Mo0Ok/bQCFavt9BKngyG+p+6b5tJbaU0RorHcuGlKaD59XAm4RlhwLi?=
 =?us-ascii?Q?xaOn6bWnhKlmk0n+FrfBGqydIxwPS124p9MmVOyK72cqIfMV6XSWVl5YDCc7?=
 =?us-ascii?Q?X0YcIuqgZEguP8Av0ySb71NR/XCf8KPc9bFbQbZ1DeuD7hXzQz7TETHZFaYw?=
 =?us-ascii?Q?1HRCSZJCucGODdu+ZX5/AQ+9KEBgo7lI6pjq9ns/TV4cFDQMacyK8G0Dy/4H?=
 =?us-ascii?Q?y/gJfopMZAYo47bBSUQzN3G95yrZ4+5oj4E3kZe8ivwTyPPluNsY48ZfJPop?=
 =?us-ascii?Q?YOos35ddnJvv3kE1fuCprYf5mitTqmaHmjEy5g1c8X6pbDV0f7a8ZRROVGF2?=
 =?us-ascii?Q?Yv9iKz0rNFaDTRzOuHMRmc4GiNc/ZplwJ7loOcl5TS4qhstugZOqkPCaI9a6?=
 =?us-ascii?Q?O3uaPwrNzVW3l87i2aHfx8riED0iOYXby/Rj2F71/Ln9nPAzb0mrZ2R3k/Oo?=
 =?us-ascii?Q?FkX30PLp2Vzv5Jh9Byf+TVsHYc8ZC2dr3+tZTZCp?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a92afae-cb34-4c9b-3fcb-08dd91d61fab
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 04:24:59.6726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Maozbp6SWr8kzot2frpvRvgmmHQ0cUqxqjRwIM9qRO4gExbD2ce9EVaEZasLGF2pUTYU+3zTXxOd8heXhR/yMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7611

> Hi Akhil,
>=20
> I am assuming you are going to send a v2 for patches 1 to 3 with the prop=
osed
> changes?

Hi Andi, Yes, I will send out a new version.

Thanks Philipp and Conor for the reviews. Will send an updated patch making
'reset' required for the appropriate compatible.

Regards,
Akhil

