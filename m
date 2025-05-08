Return-Path: <linux-i2c+bounces-10899-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70775AAFBAA
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 15:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3E944C553F
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 13:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2318C22A4CA;
	Thu,  8 May 2025 13:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uiPM4vcd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618C44B1E6D
	for <linux-i2c@vger.kernel.org>; Thu,  8 May 2025 13:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711652; cv=fail; b=tHsjMp4O1h7TEC1W7Pe7XaTJ49CMBvYbuCfOPZFMpmK9wmvNSmnxoWOqsMsh5KZYgGi+IbuSl20FMlFLJcopowUZITa6746fq/fTGTq/+WCFon7rRZ04p2yXdVkDOCRXnCYAhktfKWp5yTy2UVjJp7gduZ4klR1xmHdAoTdQkd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711652; c=relaxed/simple;
	bh=9WH28hugjt+7zB6nfcGYdRpRgzh9oPJY8OcrWZOLbAE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iYr1SGYPFmjYTDBNHHccP/C5paqDqIgknpDuTASjQ7ygJOSmoDOjDWHWuFEZW6mTKQxxy+z9gAgoVbfVmkKGsoKkF3rhx+VIoWLm+aJ9BYeu5DtbhsWRxdgczTZqUO85siEqzBI5E1dc+9BO+uL2+w6YMcVb/ZDZ9HiTaTLV+FE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uiPM4vcd; arc=fail smtp.client-ip=40.107.92.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJ7ebes5MCYdm7Ukbfqh8V8kDjiG3a7txlHjDwHwWrtRjLRNyMDJ7bpIrDk/Tnnnrql/y+V+t8RtOT7z6qwD27KROEdoPhGK/8r6w0bXDPK8Vy9dKJ+aeSCYiywol5EJuGYky40yxkTUFJ/1jEU8FRAL5gH78Xv3Oy4o2eMy3zxr7Ki8f4SViw8n0XWRq+cO9HJjsCjR64EJXYCXgvfVWc7af1IWIUavZXzBxhhNK7pzgvku7tYaPkE1TsE3LQjSGwF8tAaRLAemxOq0iCBqUIbUJOREepPb8GZ/s4ZMkxbW49GDNheMiQM9q53FDRZhyBU1jcvckABIf4h+OyW6Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WH28hugjt+7zB6nfcGYdRpRgzh9oPJY8OcrWZOLbAE=;
 b=OYNKQZde+shSdmZKh526TUzI3gfsMGGRizqC3JrsW0ulgRplo+c0ArVqOEwfX5OAmutfEeqmCPwFC1ifVt+Lt4qvtq+lsjHXHfez11Q5TbfpIQHrn3Ohfy6Exbirv7RIZT/mSKm67worDXmwwxervmZQAbbTKKkWvt5KuHgZe+/GsalBrDj6DPxXfYzjBkdfwrdam4DuZQ0u17jjFAkNj5o8qbTaMx3G+hEFOvptQbHXL7WcjGya9MjROqWRhXZMpkY8EifTImyrFUSR8Rlhr6+svP7cgj1tCIx0HOCVfQ8SodMmBuztZ/frnsd6ptSYR/85zafwzIjkHjbOiuaXUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WH28hugjt+7zB6nfcGYdRpRgzh9oPJY8OcrWZOLbAE=;
 b=uiPM4vcdiL0bTXf3jT+UjMwLO3PHQc3WVIGAYiL5NSpslubgNdUBcqqDtb7nbSJDAYJBRRZ49b15LveA1hiD+KE/odw9B2Igt3o2L/9LY4yz9GV4Y61oTx/cpmeeyV7WGHYMQBtzBCkRN0hEqJLlh4T7VGh1uuFjf4NurxwMBFpc/0HZmeBXw75A3fE/fzZj97Dg9ccqtHl5yY/NtLwEBEdBSjA/XDKAiBsilhUCnDqrVX+phNhu2h6q1BGOfXct+wQYNLVtQN3dQb/t6Tj4D/ONDGT1jPFwfDEwHMh9TDHXmK7s9YCbZZTiyOIhslX8MMli2KjjEIAeeSdDqNYTWQ==
Received: from BL3PR12MB6617.namprd12.prod.outlook.com (2603:10b6:208:38c::22)
 by DM6PR12MB4137.namprd12.prod.outlook.com (2603:10b6:5:218::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Thu, 8 May
 2025 13:40:43 +0000
Received: from BL3PR12MB6617.namprd12.prod.outlook.com
 ([fe80::eb70:81ff:741a:7ebe]) by BL3PR12MB6617.namprd12.prod.outlook.com
 ([fe80::eb70:81ff:741a:7ebe%7]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 13:40:43 +0000
From: Khalil Blaiech <kblaiech@nvidia.com>
To: Andi Shyti <andi.shyti@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>
CC: Asmaa Mnebhi <asmaa@nvidia.com>
Subject: RE: [PATCH] i2c: mlxbf: Allow build with COMPILE_TEST
Thread-Topic: [PATCH] i2c: mlxbf: Allow build with COMPILE_TEST
Thread-Index: AQHbvgjtHX+rIU8qL0Ot4unq30vdwbPIhtkAgAA6kNA=
Date: Thu, 8 May 2025 13:40:43 +0000
Message-ID:
 <BL3PR12MB6617ECB9E8DEDBEF11475BE7AB8BA@BL3PR12MB6617.namprd12.prod.outlook.com>
References: <20250505215854.2896383-1-andi.shyti@kernel.org>
 <tnduqon4gxxq62gsox734gzuzkw7eu5zk3chccfgl5q7ekzzi3@ncck2dswptmq>
In-Reply-To: <tnduqon4gxxq62gsox734gzuzkw7eu5zk3chccfgl5q7ekzzi3@ncck2dswptmq>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR12MB6617:EE_|DM6PR12MB4137:EE_
x-ms-office365-filtering-correlation-id: acdf9498-9991-4107-b120-08dd8e35ee32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?AW/U7X48KFeWggxRWEFIJHlhMRGCwVVkme03q74N4jybgG/HfxS+VSZ6HBtR?=
 =?us-ascii?Q?hmOHQvh4eXHAStd88PypBjVRrMhrgN/bgmSnv1mJfhcMIioJ0Bu4lyRUGs2J?=
 =?us-ascii?Q?D/YgoPIJIcbgkMu3Mif+gxtT8AHANdPxNogHdNuHj/E2nRwpnSqJFG1L08/s?=
 =?us-ascii?Q?aABbU4157ydsPUcl2+qp2c3WUzrxtekn6Q6J4GY+wpEnKMmxg6cAwg8VuxpI?=
 =?us-ascii?Q?SGSwKqvwuO15xwFfYHxbYJ0NgcvKUirANCT4MsgZ3QDzUvtal4D8Uq6sOSwK?=
 =?us-ascii?Q?JAP4qKi4bC1A6+NBJZXr4x9Ib4uXaMUYJLM/Yt24hMnErdXl3TNdzCP8p+18?=
 =?us-ascii?Q?ZLF87qnzWz/EolGHn6Ws65hj/pKnL1JHUUd1NcOXRiboRKLmlIQCHfbPW99X?=
 =?us-ascii?Q?Emj6kqXYNVEXZf5sISPyVj9ck+EtCNzocObukOjWEULcyMUmo2oBbod/co43?=
 =?us-ascii?Q?Fm93vYfMRXtkp0DheMErq8iFYQtqbpJcbhE+Kj6WLP+2wmv5d8hORfZg0aj8?=
 =?us-ascii?Q?RH4ieZ9bkjGFOyGwKhLcQF15Ckb9qXT/9m+Dnxbg3DIP219jxZwlFDoRw1S1?=
 =?us-ascii?Q?Ko1l1g3oXdNYsQlkEFuSVtLTj3rWDn9u3KOp0hy1eMJsYceP0Ow1SOKc/fG6?=
 =?us-ascii?Q?2OqZE6hdXOopCHpw+CtvvakRZD9xURz+ol7SzNL4KArevNacX2qwo/mGqXiY?=
 =?us-ascii?Q?BMzDiiz+xukYOyEjgrDYylGnt7BDswLDdXOoltn4hSHb1HH502d/6JLauVgo?=
 =?us-ascii?Q?opgI2PQ3VGeE1hlMzT+oO0fQERvbj+eBo7xXJ4aQTwOCZgqIwel27aD555zd?=
 =?us-ascii?Q?J0r+YzDpexHmGRhttUvIZ/o7Ek5V3FTSCWvF4oeHRRMSrwgA+Njcx3p5O3sB?=
 =?us-ascii?Q?5I6jyvosodftOxUjMEQW6K+hKSGbTOKZX9nRngmPLJbL7EZnLFxYm7HKiMe8?=
 =?us-ascii?Q?oFC5nuP9FcZSvA0yn1SfUWSvdMdUI5GusMEUFJOU9rCsJdHwa5D+fvSHuIRX?=
 =?us-ascii?Q?YX3DPdKBSAuq5k7gY5sOHXZGoiYQz1LPXGvm9tFrmBoqgLdglxjZn2Cbenr1?=
 =?us-ascii?Q?guKRf22tWD+ABa66mjyWz3rMeSXYzHOVgMkcXPrvfHhwl3CH95VzeYI5+4XV?=
 =?us-ascii?Q?evj/mRtW50Ots52mUhRuKtrYpbYTEsC++auPnaVrWkabJxKWFT2T7NeIsXgD?=
 =?us-ascii?Q?8GUMrFwIosyFErwQX8+kYR7SL+8T1OXmWp9YSDe9Ccv4DIQV96OoBcNxpirx?=
 =?us-ascii?Q?EyBpKM6NumwZjUoU83FdRjfJXTEiXXzHGjpnn1Qho46OPQrEdFX/Uf0fLFDW?=
 =?us-ascii?Q?mibD43LQiY41903b+TfLHoZRy9J+uOmm6jnRnQvbcWkUr+ZDFIsLtqnZ5/eB?=
 =?us-ascii?Q?zWucusOAzWbVB+Z2iHi5jU7LtGV4ekrnZmKSPOzHjELgY3sUDmftvqgNMn8t?=
 =?us-ascii?Q?+0wVsqvkfEbZ2DN7cgpN+JIJOAQaHpXpNuCwRff8IzjHkoLe0bdWz6N/ZvGe?=
 =?us-ascii?Q?bqIQLSFix2rU/lY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6617.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?P1AUwJBFLhEl2RPEbC94NlRjuWnlPjUTLavgcKcO1IMKmz/yCp/uv9Ad9F3N?=
 =?us-ascii?Q?D7gZ4Gb0OW5P3uh0kNdgTe1ebprztylzqv3GT8njOmuRwtdzRSQQLX8nafCw?=
 =?us-ascii?Q?dWNk3Bm51iSTqJNgvnibJ0WEm1ohpVtwS9ey5GVssLP/pmnyLmJeCe6eWu7j?=
 =?us-ascii?Q?N6XKaLIEKCiekhbUBxlQhyL7E4smi0ymzk4nAUlXPd2iQ00ltR7jU3f/mPvI?=
 =?us-ascii?Q?yDsoP5KQb3FlmlRRMRM6M5OqUpjG/itaQhmQfRI53tqa+mJoM9bYTmtQntZc?=
 =?us-ascii?Q?TGk6tjeTZcSL8l/NmGWElGKJGZKudB5yVC2+ctdr46TTKNxonOJWF+QjLngZ?=
 =?us-ascii?Q?b1U67kTmOCTGht4nIrS5P69v3qFuwqPkZQj7/rEaMu01Yz8Su0nn+VLB3zaH?=
 =?us-ascii?Q?QCdpAYKGMfNiVErT3ZkdtfOD8Ktu6RYu2x5Aw6ZlB+s6FYbEdS4Dtjf3WAmm?=
 =?us-ascii?Q?9HWPp/Wpfd7UEeBIKrSMfCiNgPiHDjlCfwJUOPwd3fCyOSCA4Y4wRbAlvbTG?=
 =?us-ascii?Q?H3zLffPlPbHszoEFofQBh5HYH4LDiaHxNd8O846NCq/H9abwXvK+1Fa6x9WP?=
 =?us-ascii?Q?WJLL+cnM6xFtF0CtPSm2U0k5liIrn7ygXMJMUKT9bLtLuX2PZHonVFOyzp2t?=
 =?us-ascii?Q?nwbUNL0CSXUDGSZ0uMwxRM2I15DUp5OWS+HagQQjNF1ZbdI6QJyG230pCgY/?=
 =?us-ascii?Q?b+NO+sQPXrCOm9aqurseZ41r9BXkIz62wIfni0BwFQwEpeQf1BoSJinZWMru?=
 =?us-ascii?Q?4BwWh5XhnMoHR1Y6fjNunVidbNuHZUl0ftVei9m+QR+wTx6W9VxW0l12tM4C?=
 =?us-ascii?Q?+7AfpPQAxNIvf31NbSlSmP29hFdeh94AXrwD1IeFfKJu6DJksRzZnpxP70jh?=
 =?us-ascii?Q?YkFJuJh+ga391SEaDG8ST9Yc/dpl4XZ/aDGnrBSCeXmXzFXv/K6TYWGVw3E+?=
 =?us-ascii?Q?//h71kQarWm09zJzkGpPA/4VKexoybNbj/BH2cf2FxyNS6ZDw3O3dLdKn7Z3?=
 =?us-ascii?Q?QtFw8AQiUXQxU3H4wLO/R3aX+gxasZg5zN/BUKDTye0taKVVbZ3d8TV/ShRt?=
 =?us-ascii?Q?kwU5wf/Zb0QTHV5FPKF9C4mx1QhS+5wjdTb7m7jrxWFjY766oQDDzUHONxaJ?=
 =?us-ascii?Q?Uuvbp8bu+hMHnw3Of3G5UllOCCPH3T7D7g6DSxUilOJKn5D4ynaen84q2rYY?=
 =?us-ascii?Q?MXDruUnNT9QaODBE9yHG7DL2IV+n581xDmXPvmQVctK9uo2jB3B9ImmymwHb?=
 =?us-ascii?Q?y4Jmf7wUr24+X72M3nraSrwR26AplqdqvxYnAmPg00y7C9XpnSUyk7ro8JJd?=
 =?us-ascii?Q?ePwYnlW7DavoXuyAjTFNXigHox5b8n9OI9B5x+A/1kJ7kZEuEtJnUyrYHrB8?=
 =?us-ascii?Q?iBowZcV3+bFdFYJqiJS9d78gED4C+Zd/VgVTErKQIohp6H12ue7+Gt8mb2OL?=
 =?us-ascii?Q?T0ErihmD52/Ljczp2bVHatvKJZDosdnLCiJS0jmAUXA4XQnezWSlAr0c8AJA?=
 =?us-ascii?Q?2NXrg7iPcE0X4HJVEfdqb7QDCpDTyBDp7k9RGDyGdyC7nXVf0IDVqx6WWFfp?=
 =?us-ascii?Q?N+UlwpG9mJkq+LFsiVpHJPxNY+NjCF5rsyYL+NJCQBBMUYmvVb6Bb9OYhHh+?=
 =?us-ascii?Q?xq1TFZyDukEtksmvkVojRfg2b5UDoT4/UD2wssPTkWLO?=
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
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6617.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acdf9498-9991-4107-b120-08dd8e35ee32
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 13:40:43.6701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BQdOBejKW5StRo/hktLDctx4SVzPXj5GhR+2HA4MyJKKIKK+bPbbWas1i5WsXJrDD39kOcEWLxyMvdgl79SCow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4137

Thanks Andi

-----Original Message-----
From: Andi Shyti <andi.shyti@kernel.org>=20
Sent: Thursday, May 8, 2025 6:11 AM
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Khalil Blaiech <kblaiech@nvidia.com>; Asmaa Mnebhi <asmaa@nvidia.com>
Subject: Re: [PATCH] i2c: mlxbf: Allow build with COMPILE_TEST

Hi,

On Mon, May 05, 2025 at 11:58:54PM +0200, Andi Shyti wrote:
> Extend the Kconfig dependency to include COMPILE_TEST so the Mellanox=20
> BlueField I2C driver can be built on non-ARM64 platforms for compile=20
> testing purposes.
>=20
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Khalil Blaiech <kblaiech@nvidia.com>
> Cc: Asmaa Mnebhi <asmaa@nvidia.com>

merged into i2c/i2c-host.

Andi

