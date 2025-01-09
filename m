Return-Path: <linux-i2c+bounces-9014-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29723A07CBB
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 17:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDAA5188C2C9
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 16:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7609621D5B0;
	Thu,  9 Jan 2025 16:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tJdNjvLh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93210218EA2;
	Thu,  9 Jan 2025 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736438433; cv=fail; b=HxvOl8KneGrlWBtg/0/XDNeMQllvphPlQLo8SO/nyrEVFl7krCEur+P9pB+hJ4DB2XpoWBQutxxPFX+pHe38+zuJaVIJNvC5RBSg+SdOlNTafh970870Gk7Ba52BLSOHJYyRHyb/JyznxtWpJAeNBPcJ0y8nVsFiUJcEJnnwjJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736438433; c=relaxed/simple;
	bh=JV9V8XqqnmLJ2PzHAlU+762O6uMaPC7EXEKQdvK8u4Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NYTYl29hvFRpernndinghldLiBxMqzIX7hvk8wx6cs/2vKexz4mLFzNyVzMLoXJWx8b0T7kFIUgE8X93DUeQBFGcHm7KCNa2U4dQqlfHV6HGsBTE9iOSxVVNQ5dIc+xiLUb3uPz5PeoWW2ADlPNuJALkc9/bMWEgYPAAtjO4udQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tJdNjvLh; arc=fail smtp.client-ip=40.107.244.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYl0YX+llZgE5m+BLPNPDu3f4TOQXJGc0y/q+usN4WMyqr0a0pW94IqmkPQd/F8nBMD3tMUwkVptUsUR+XrVjwAfeuGCSjct48l38bpMp74WWAkbQ5edmgx82Csx9DlP/Zl1mFg1QSojfuZ8HwUotYMWSZrpWk0rbn2lS2xUcAS2Av+Hmma6BQEp6Q7pPA79I04Lx01ak0J7LsdqVvQMRDobYILK2pgRaQBvSIgI3t0fkt8H252UyWHRTso5tDouMZplGb+jrFQVnHs8lDSPcuyMeEZJiAUB3yqf7zdE8uZPxYkCSjiUKykvxJryTsGWTKfw7GZDYRQKJl8dAr1XKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JV9V8XqqnmLJ2PzHAlU+762O6uMaPC7EXEKQdvK8u4Y=;
 b=PNK5nfMm9NSdxfUWaBWVMCu7YECr6FaKqBr5LCG3c8yLNEG2mIyEyrF0x8zfokL/E4GTNMutoadPd4q/YzjQ109SxzzEUe6loEnjINCQpioDYivtwCh7WaVWCRiMaUUyT0JrhLiTR8kx7WKlAg3vHcuJ1f2yUyhZRg7pEjRMXP0h18YHA+brmenW9P3S6ypuAoX8xNvnxh6v26O5V8YoB3TdQwf+0czBfJI7qepFFCGy74j2yaOcM06MsBZQPrR7Z9gGtigCUJ3xrXIXclCpaKaH092AuyznZhyix+UtN5lurIj3Svgpph9lYrLUeyrmpWPk2+Vm+5Z6qKIb8opSSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JV9V8XqqnmLJ2PzHAlU+762O6uMaPC7EXEKQdvK8u4Y=;
 b=tJdNjvLh6g/mSJi4OMvY22rGLOvXXdte+XrBuX6DB3cappMUfiUmdIxhAS1A47X08PCSNrTib8ecWHO8oXS7fuAWLaM931IkIEdaDHCbRAKyAGY3KY0bri89Hmy7D+mVJjg+/fD5keYDfEWqu/uEgAPCSOYtIVS/62nVtp0HV5rRLnq5ztStA8N4Pvdhi5MbQvs2dESkBtQO1IZRGq7LGayqIgnJBtbJB6LGAT4Q2MO6xHqr/K/rI24LkY/Ab78cW/sgC8C9qwtKafzH/3UaTrCjtVK7e73YrIMVTFaTP9RuHK8DudPkQkqa4susqfoZIdy3G1UfVkYoEiKAb2dmbw==
Received: from BL3PR12MB6617.namprd12.prod.outlook.com (2603:10b6:208:38c::22)
 by PH8PR12MB6843.namprd12.prod.outlook.com (2603:10b6:510:1ca::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Thu, 9 Jan
 2025 16:00:25 +0000
Received: from BL3PR12MB6617.namprd12.prod.outlook.com
 ([fe80::eb70:81ff:741a:7ebe]) by BL3PR12MB6617.namprd12.prod.outlook.com
 ([fe80::eb70:81ff:741a:7ebe%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 16:00:24 +0000
From: Khalil Blaiech <kblaiech@nvidia.com>
To: Andi Shyti <andi.shyti@kernel.org>, Chris Babroski <cbabroski@nvidia.com>
CC: Asmaa Mnebhi <asmaa@nvidia.com>, David Thompson <davthompson@nvidia.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] i2c-mlxbf: Add repeated start condition support
Thread-Topic: [PATCH v2] i2c-mlxbf: Add repeated start condition support
Thread-Index: AQHbOsfFABnjW89+Nk6hAYK3FJ6YC7MO23oAgAANAYCAAAC8cA==
Date: Thu, 9 Jan 2025 16:00:24 +0000
Message-ID:
 <BL3PR12MB6617CB02D6014B6A2FF77E3AAB132@BL3PR12MB6617.namprd12.prod.outlook.com>
References: <20241119211215.352797-1-cbabroski@nvidia.com>
 <db3daq7guy52ywmgslnmphx4mxyp2l7swq2y6erezokolg3v6u@p7ufvbi3tarc>
 <xmm226aebgwmpjzekxlvhcgstzss4uq42vpj3zjp23ffhv76ma@y7hqbw5a56md>
In-Reply-To: <xmm226aebgwmpjzekxlvhcgstzss4uq42vpj3zjp23ffhv76ma@y7hqbw5a56md>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR12MB6617:EE_|PH8PR12MB6843:EE_
x-ms-office365-filtering-correlation-id: c22ef850-22c3-421f-0cb8-08dd30c6ba61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?X3tF+RYOoKzHz+93AfetXGQn7TGtIlWYkKk6MjCaEH3UBZ6x8KdjSSSfChuP?=
 =?us-ascii?Q?utTKg2J1qJO9zTEroP0NtaK5mvwI+YmknobZDCAIc8H6xnUORzcmzeOI5hO4?=
 =?us-ascii?Q?vPi6DBSxsfFcyh4K7Ch6wQNoJcnTWfHzhVVIIv3Z6PquZ3UT61b6jzYrt0jC?=
 =?us-ascii?Q?7qv94FiVFIuI3VS60VelNsFt1nXNmfQgMh42XwfI5vXYRrWyaqYI2t3IjfE1?=
 =?us-ascii?Q?53tDCHq3KDp9DUao1lPrUvADceHhDUh0grzIB5jMfqs8DlSjGeSzFcVTaQgM?=
 =?us-ascii?Q?ubRlVBPw+q0V4uJS/fCTbPRqcOgjUNxO/O8sYUaopFTS6Cpzxd/GlKanDhAh?=
 =?us-ascii?Q?Vg73FCKXIegf5xVx46BfmHlgLHKpLK0BTbzYbBIuPThxEj4o5/fYrzZwNxIC?=
 =?us-ascii?Q?NoIJZ/YSaxfFNHJCP3GGTM5AbqkeOC+KpAmFHLUs+fFkW1KC3tdUHOn6M9q5?=
 =?us-ascii?Q?vfGmkkxJiwiYZV2oBBx6RelHAlYJ0mZQ3mbitkY6anhBZeC/+EedKriz0ZGp?=
 =?us-ascii?Q?bIRiNa+ypuQRIfiCI7oGSEX3yQ9Xxh29lGJZeBhs8CqjBFwhowzg1VYVnpw9?=
 =?us-ascii?Q?V//Bve0Mg0gd34Uiy99D1zdb+MsleFoJLMswZSQl443RRJCNuXeD+5sjVcn8?=
 =?us-ascii?Q?jg5RDuZd/+w0Cd8Gs0znDwLXSZoEylsVwbonHDYhrM+0+dF0jnEfwn0WKcqt?=
 =?us-ascii?Q?LRsESNoO+WoGz0PwQjuGVvYSQbcg/F2dPqfcw/zX/qqfRiqDSXop7s4lspn6?=
 =?us-ascii?Q?9J2Kj2tgcVMn+mOoNIoI1+0Yd0PWR2mBtub4I5A5IP1pVN7YD0LDBISVJkG8?=
 =?us-ascii?Q?YehvTCyyg0FdA+qSAqK3fPSwf5kCL93h9Bf5FuzF01wYp2sw9wU1wJORzYbc?=
 =?us-ascii?Q?vLPYQiMrkf0Nmi/uxEZ/JBkrlvdFNt3KuiHkHWxba7mdeXWc1EQQ9S21UXMU?=
 =?us-ascii?Q?kVlUdOxkIBcsKsVf5VoEP6/TeVDKNAPNRGFTVCpOKNHhcdcEXvLuVc2TyBOh?=
 =?us-ascii?Q?ckWKciQRAa1nD44CxJe3TFL43M+bBAunP1LjJ6GulidrpGzlnF2nW+jbSyei?=
 =?us-ascii?Q?kC02a59221jq7gwLRg1dBOaCnQBODG09O+JTrADdKk3BvWMFoYINJDtrrWH2?=
 =?us-ascii?Q?Fk4qM0Kn8rlx987XS8gegNnMD7X6Hls+9B2AQQhLBTF2FYffO+zX1N/ftk2g?=
 =?us-ascii?Q?PDi9Q1sgh2Sg4xsO874dzhzTE0uTj14l4H/NziALQr2AssbHskvQ+dNrqF/6?=
 =?us-ascii?Q?FX/stCoLWcIflMmFvMfTuGRodjd40wXWCv7fHtmupjQpJ/dImLV75k3jLDId?=
 =?us-ascii?Q?RH8sDGkztb9LEB49vMF99FliZ1++mKIpoBnOvgrvG1L77QsWu0nihJDDq35c?=
 =?us-ascii?Q?oMJYeiP+yrY2Hs393po35PfgWL0FnxqZOzhKxuVBYX9a4y2rlDWknNaVREE6?=
 =?us-ascii?Q?WDuwHiP9V3DwNVC1O6YC/dvnbBXtiXr0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6617.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aP1x715INmU6hG1lGJjflimTwe18PM0GoNiD2fTUKjWQ23IaJDcy1fyUo+zT?=
 =?us-ascii?Q?2wzyCvh3LeYsGkwe22/7A8Yr+uYYR6pcuIoYu6VENdN4rwTw0GOv+pCXQtkJ?=
 =?us-ascii?Q?4agtnoT4i9LGmBb3qSKyVhMq6ALp6j8yfiQK9+b1G+6JtWIGc2WlHPM7/BUZ?=
 =?us-ascii?Q?CiQ1d0WQkuRkYESyVBng1yDgDRfHCHDdXL4YDsLDmA1reMEFQOsN8QReCvbA?=
 =?us-ascii?Q?awGMyLXhS0pD0i7WeDRilAjPpWI23XzFdYd99NCQZbuXYZYhafnTdYNCZbfV?=
 =?us-ascii?Q?lt1k/zRe4n2Ac6bDT2kZ0y1KK63Ea70hWqwDcJ1clc8scd9f+SJZzEOmXMQ8?=
 =?us-ascii?Q?MnaB0oW3Fbq4Cw17u1L8ceWBhtYgfi/L382Upw22q8WmTVln016UlosfohW9?=
 =?us-ascii?Q?B8tuy9e8umpqwt0dcpY0zg2u/KdWqu3XYJD6thcSAyiLg7fIZlyawuIvSFnI?=
 =?us-ascii?Q?fauR6C+P5uLbY5MEwp9g3mC2MHnKCSM0DNurrl5HBPPaqSa21Y7klx4rg0Wf?=
 =?us-ascii?Q?rlIQa9Gqc3GAEAtXaA+qnBDzXRr+wjkuqw7PM1P8p2eMXuOLWJTwd0hSXOBd?=
 =?us-ascii?Q?Bsw6LtSVoTfQe1xTh6nlb8CXmfDxgVVSTyTDRripBsYB4+knRiBDkppV0xpF?=
 =?us-ascii?Q?KCO8VWdH5qka+VSMSU+47CBvWT0YVG8mU7TD5jXEAGqZfzoLJc2Evsjt1JvO?=
 =?us-ascii?Q?6QSm59IlDMrVDDiADBZ9gY67+8e/J6lPhYzDTUZLmlrWCzPuUUdPhYqAhgt/?=
 =?us-ascii?Q?/rh0rble5DQhz9VTc3VAUAPJunUwe9dAVNwNDvE7SMYHGdJ3eMAGOmghwe6x?=
 =?us-ascii?Q?46Qp+fytOhcUQavVZJbfZkVzfxmodQtDGXWBHIRIOMEoveXq08YIppx8Zpjc?=
 =?us-ascii?Q?jbJIWsl1YqHk6/sa4tUhza7DJvQEIcdWHa1sIJ7Yc+fd11inLSLHQYf630OP?=
 =?us-ascii?Q?35VdU6ih8/sWzSyyIL92CrwDarOgCSveqLxQ7xOV89G5XmvMhXYQVPfefj+u?=
 =?us-ascii?Q?5WOB1LuQGItoC4QTcbli60RBptHACvHH00rjQgi8bjKsue1sTFLWVpO6uwC5?=
 =?us-ascii?Q?+VZeATveBA5f9XNy+D3sVcNWwi/Zzoit+yPDTs2aFCLlH4y6UoNC9Gs118fm?=
 =?us-ascii?Q?Bck1R8LpADloXAbbXtBxvJfGGvejq4BndffO++GrMF2ZfvEOUN7+hfKxefFd?=
 =?us-ascii?Q?2X+55LmrOk+Nf1VUGMsaez5gLT+W4M725pB11EXkyep9bPjOt9ppwUIAfJjt?=
 =?us-ascii?Q?oHUnr/GWM9evtjTqKKZXCtuaOVcvL3QokiZRZw/OUKfK9xsAXfkGkzEnBb9J?=
 =?us-ascii?Q?xickH/up4V58tGWEjj1Da3RY/a9RAPf0nqprlThmpE9BNzN0Qw0kkHZMKbi8?=
 =?us-ascii?Q?DJ+Ph2vL1Mt6y51MYix4boLgFLLytq2oW/Exce+MvT997k4aHi1eS0JtXSvI?=
 =?us-ascii?Q?kHzdalRWHYJhfShv5Pz1wu8aeMOybYgWIVR0Givq09MGsvxmx/cf/IE6GKNG?=
 =?us-ascii?Q?6z9+fErR/gWMP93tiycxAtOC0/KJjzC2EkJ31o/bCS/d0rRMbQhA0Dn39XB9?=
 =?us-ascii?Q?cfXZek7sP6WyCGqNAn4VdXes/gqjRleMcL+QpnvQ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c22ef850-22c3-421f-0cb8-08dd30c6ba61
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 16:00:24.4674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TTHZU3NO/C0nO5DxdllEU7uG2aGuL0TiNS9yZl+fU3T6m2ZR7Ntr0/CN5KcIubmS5lJ3sPGaj5k4U8A7d2EuMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6843

Acked-by: Khalil Blaiech <kblaiech@nvidia.com>

-----Original Message-----
From: Andi Shyti <andi.shyti@kernel.org>=20
Sent: Thursday, January 9, 2025 10:56 AM
To: Chris Babroski <cbabroski@nvidia.com>
Cc: Khalil Blaiech <kblaiech@nvidia.com>; Asmaa Mnebhi <asmaa@nvidia.com>; =
David Thompson <davthompson@nvidia.com>; linux-i2c@vger.kernel.org; linux-k=
ernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c-mlxbf: Add repeated start condition support

> Can I have an ack from the other nvidia guys, please? Khalil and=20
> Asmaa?

I know that they have been reviewing this offline, but I need this to happe=
n in the list.

Thanks,
Andi

