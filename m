Return-Path: <linux-i2c+bounces-9318-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F2CA2A3D8
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Feb 2025 10:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C273160E41
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Feb 2025 09:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376FD225A3A;
	Thu,  6 Feb 2025 09:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="ywVI1nzz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4052F22577D;
	Thu,  6 Feb 2025 09:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738832798; cv=fail; b=BLGax6i5UXbypHAKi+pr2c4n8eMadhnKCL5A7CMNOohnUKYgLrtevDXxXFPhVvxpf+sk/Szdx6cALK/Ql8gct1pL9X3uzi8TnGUcsUdWSJcKiHF0zShjtoIoidTkjr+XAoHQuSmAI05I/RD1eAPRvsHBJpyKo/GWyHJKJYaW2aE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738832798; c=relaxed/simple;
	bh=p1MCGLHqdGxEOTI0HqiVdW+n8XauR1Cu4AE5KWM2rJw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t2wuHhX/sf0s119HntuuPJHL68Wal0HdK6l037vmAL/HjC3HKaCClhL7TVHVQCvR3hqAcK/WcVDZetu6xYvnsPvEE2jlYEcH/V/G9OYPXlC+6aeclLyZ6HaWuAH73oErd4pbmngEg+am8MDVMykffGN/Wq+IP2+HHESVEcFNdlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=ywVI1nzz; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5167Mgq5030012;
	Thu, 6 Feb 2025 04:06:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=p1MCG
	LHqdGxEOTI0HqiVdW+n8XauR1Cu4AE5KWM2rJw=; b=ywVI1nzzUHrkntVP50Dcq
	9xtz7d3fdaubI0C2igWg2QbjXm9K8ykmPB3xwmRZZKqGRktadngM0BE2qWd/jZ0w
	f0xUgYNM/aepLmlLAOeDcFtY5ivWOl4xQWBqJwYAkiylP5LP5ssN0tPXVuggrf90
	2hE6B0q86uxPl0y6c3tFUwtSjgKjuh2u14ewuOLDFmDmutyTqdK4spkaNwNxV8vB
	FHGbh5n7u8VCri5ABeEqZhIup5zXgn8inNmpKNn1210UaVh07VLqXiiQLVGIZfqr
	v2b5n89R3zQHWwKMWP9wOSJHSpEDN+S3KVz0D6J7nLyGdx7sC8YwvNsUzYuLAqGF
	Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazlp17010007.outbound.protection.outlook.com [40.93.11.7])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 44mrmygcjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 04:06:21 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfZV7pTZ2jZeaPmuDrn16c+vr656JuqJqptc0qwa1UMRuAu3kt7kzgkNs66xAycQEIv9wle7Y+EHdD9Pd6nO6fNPWm/M00RKoygKZgePtFitctZfqz2ylqPzLw0Zd18//20SRrYNjcNwS4ve4ih7JUCtjMumhbPluIynTlxPWmy46kslZRU5mBiUhXplhduxlBPdySIs4p1Gf8ebWIZ38nZ68J2X6gl0zHEONWlxFygMRqs+jzzKCSgi0iQ84MXJm+N9mI9zjIHi/S1x0t8mIspLtnYi6amf1+5KCg//ZlxklpVH9nWKHNWWpwNIvNfbjZs5+pBwFwJ9auwhg0jrLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1MCGLHqdGxEOTI0HqiVdW+n8XauR1Cu4AE5KWM2rJw=;
 b=r3CaKTblihXt9mcn51ysnLkOQ0IRn05RVyJ9PQni2MSp5TRTcLOKfuqY4L37CiJeLT6DptmYvPCPN27ykW+McCDxN3f1RDznLzr01v/3bilU2m/w6sBPb5k8vCb+iLT7TU0ioNSHct/psA5QozwXavDdXiJvr61rzhBwdTk0FTypoMi/mys4YzANdo/z2xs+MTYCXE2EoNImgJuQjtJH44LJQ6RPEIOzGkeLKtkcCB5vNlEsSE8QenUqiJIi0VnVTlmQn+opZJBxUCYeYzeWS8u01y8OwKgXiOHWOlsE2KFeHmpw0YfR+okho4LLXvIjthp7BDp7a72m0tsXbdEJJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6938.namprd03.prod.outlook.com (2603:10b6:510:16c::9)
 by BN5PR03MB8079.namprd03.prod.outlook.com (2603:10b6:408:2aa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 09:06:19 +0000
Received: from PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446]) by PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446%5]) with mapi id 15.20.8422.011; Thu, 6 Feb 2025
 09:06:19 +0000
From: "Encarnacion, Cedric justine" <Cedricjustine.Encarnacion@analog.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@wiwynn.com>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: RE: [PATCH 2/2] hwmon: (pmbus/lt3074): add support for lt3074
Thread-Topic: [PATCH 2/2] hwmon: (pmbus/lt3074): add support for lt3074
Thread-Index: AQHbbnY2QF8QT5pltEqgNJmmqLN0LLMt9NgAgAwZj9A=
Date: Thu, 6 Feb 2025 09:06:18 +0000
Message-ID:
 <PH0PR03MB6938B6A5F9C08718F2AB07DA8EF62@PH0PR03MB6938.namprd03.prod.outlook.com>
References: <20250124-upstream-lt3074-v1-0-7603f346433e@analog.com>
 <20250124-upstream-lt3074-v1-2-7603f346433e@analog.com>
 <893b4574-ac3a-422f-a46a-f995c551ad86@roeck-us.net>
In-Reply-To: <893b4574-ac3a-422f-a46a-f995c551ad86@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-ref:
 =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2VuY2FybmFc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy05ZWYxY2RlOS1lNDY5LTExZWYtOTM3Yy0wNGU4?=
 =?us-ascii?Q?Yjk3MDc1MzdcYW1lLXRlc3RcOWVmMWNkZWItZTQ2OS0xMWVmLTkzN2MtMDRl?=
 =?us-ascii?Q?OGI5NzA3NTM3Ym9keS50eHQiIHN6PSIzMTYyIiB0PSIxMzM4MzMwNjM3NzEy?=
 =?us-ascii?Q?MzY3NjUiIGg9InlFUlEyenlISEZPSlI3dVZLZmcwWmNITXNPUT0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQU9nQ0FB?=
 =?us-ascii?Q?Q2RhVWxoZG5qYkFlem80Z0dPWERiMjdPamlBWTVjTnZZRUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQUI0QWdBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBUGdGM0JRQUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFh?=
 =?us-ascii?Q?UUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QUc4QWFnQmxBR01BZEFCekFG?=
 =?us-ascii?Q?OEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFhUUIwQUdrQWRnQmxBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRR?=
 =?us-ascii?Q?QnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURF?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVlRQmtBR2tBWHdCekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dC?=
 =?us-ascii?Q?dkFHb0FaUUJqQUhRQWN3QmZBSFFBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJoQUdR?=
 =?us-ascii?Q?QWFRQmZBSE1BWlFCdUFITUFhUUIwQUdrQWRnQmxBRjhBY0FCeUFHOEFhZ0Js?=
 =?us-ascii?Q?QUdNQWRBQnpBRjhBZEFCcEFHVUFjZ0F4QUFB?=
x-dg-rorf: true
x-dg-refone:
 QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBIi8+PC9tZXRhPg==
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6938:EE_|BN5PR03MB8079:EE_
x-ms-office365-filtering-correlation-id: 9e0cdbc1-aa41-4207-e68e-08dd468d84df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?qdBxGBDm6rBOmVonHWB9w4nG6lv9303itgOcFTrpML1oXrjg/257KgptQjF/?=
 =?us-ascii?Q?DfhtgEfBwYzD8aHh/aXxZOmtHiV626e3jvH/AGQ509xpsqobYClhiJuipkzs?=
 =?us-ascii?Q?EEPA5oZTP3SZpnTtpdBVTj3TbjgKUk6VTuH0RICOV2Nq7a8hy/S7hXbpiDxu?=
 =?us-ascii?Q?yrIW2TmvKELT2MGn25TMl2P8PigyRT+94aJLxOXp3sZz5nO8FblDey+r7CPO?=
 =?us-ascii?Q?RLKRshsZONyhhQ3xiPvJYjOgxSrSWDduHQPWsk9qQPtve1nK/WekZY0wctdW?=
 =?us-ascii?Q?v1nyh5yfAK4UNrtP5ZY2Ogqzzb1vawxP7OkNIBKwA1D4HlTbcKAyHDrsmA8H?=
 =?us-ascii?Q?hewfcBVX3X5eZsqpLL0Seu1j90FVWPWoSOBbFA9KNy6iNPViwZA6eArEYq7g?=
 =?us-ascii?Q?MIgV6TpUJtTP19isrBiv43b+WTLiVwO3tKOqfd+2Oxf9xYywVI4+DSlRHjZ0?=
 =?us-ascii?Q?Y+jXL1eGhDzFZ7/gFYqHjWjWFHLU+FuTohk7RTMml8rTqJz8VWJS3IDRMbiW?=
 =?us-ascii?Q?lJYZAXnPxW1YqLxb33gafdm7TwfkGpVndzA3KxB/20Jletd7i/ALP0+aZKFv?=
 =?us-ascii?Q?o1gX5SSO6QOAsTI2zrj8MxBj+SMiaJCs6WVZpLIlGwKl4Zrrfm9zalDX/Fbr?=
 =?us-ascii?Q?zatGfRcMl0mKSmRhqzY7jQgIxW85DrNAvsQDzBOV3saC9xlJa85iJ33NHQDo?=
 =?us-ascii?Q?WCPiq/nmKrSTU6upDArJdHYW5axlNe4UE+AWAOksuNRk1qUa0l2xNfheDr76?=
 =?us-ascii?Q?M0kaDkwt1cAuZD4bWIsFBKqrlFgniAUHkg1gT9/u+Pv0WrGElRsRIRTPHu4V?=
 =?us-ascii?Q?r40nCguXgdWoIJU00fmLo119V/2QEvBa8Dzqi4PSdAaEgD0Av51lvylTDOyC?=
 =?us-ascii?Q?S+ZFLISBIXep4Vb0XAPhgK51T80O+Ft+dAjYnfht+L3WxaJlFRc3Dskb6Noa?=
 =?us-ascii?Q?uBYw86GAQC1MgFxPDrb0exX1mcR6TwCfr3GPJEApkZAAXWvEkHQv4yAkEk2H?=
 =?us-ascii?Q?T7Wu7aPRRZcsr5FIF3rZVT5SpZg4JepQem1QueEfYWKA980uk5iNFcOpUPZN?=
 =?us-ascii?Q?Rx3HKhWmFMc9Nn1aAVzDCxvSwg37D+JTZM02W68BPIed0ndwjWBNJMM9n0PN?=
 =?us-ascii?Q?6EfxCvYvFxOPWsnvLomCJ8x4w+uCoiPNc9Z49fIy4LCMPTXH0WFKFpZwSUJk?=
 =?us-ascii?Q?5FpfF33mCAq4R7+qUKLM+WOqmbZVNEmHVB+p8YahL0M+ZK2ke4aR6X6Adprc?=
 =?us-ascii?Q?MdqgJ0Pm4+V2Jv17dSHx5C3v4QOBwx06BmYRIqctPuOzgQwsaSWNTehr3qth?=
 =?us-ascii?Q?BZMuA1dIX517kGuwti/cNjysTQ0/mpmvgL1dbSzpAlpDAHrCp8eNHQqnuZ3S?=
 =?us-ascii?Q?uTtyVA735Y3aOuJW6yQqTQxM4cdNnZ7UGSGhzHL4DXopbuWTYzy24CgL8dCh?=
 =?us-ascii?Q?frOX1RU75br5CGt4HWf9khIYATRbOYCc?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6938.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mlssPzO28jDPfZe4sT0lKvlES3IC58cbRPoCkdASu2SZTWAh8Fl+FfTN3ouQ?=
 =?us-ascii?Q?G0yBGSM1nfcXRFsTx6lkLFcM/Gcma8Qlg7l0lQRRt8zFaKRKyEvIiPMAfAEA?=
 =?us-ascii?Q?KOzAe173gKBU7H81cMbc/OuJWJo4JDyGMwzqyD10hJH28D19AT6Iy/KOJD+l?=
 =?us-ascii?Q?QXAWBzIqGqob4tQ7lBYi6Ha+YlNp4dHqe+K4ofjJhgKtH3941fMIxXH3nXPL?=
 =?us-ascii?Q?oo1zyHxXIihiMv+DIh77S0TdJqZYkozklpIWq/Gcbh3WnfbGk6sgA+lAUIb1?=
 =?us-ascii?Q?aXRPB3tTOcC6WGRbdkHvdHIbvZ+udrDX3YJff7B1Ihr69V8HOaF6ATeHU0Vr?=
 =?us-ascii?Q?9XLY2cqLKn/e1Tjsl9GScjjnYnt9qg6GoCVI4rFhTJP/o3tTHim2Svl4rV+d?=
 =?us-ascii?Q?BXtRK0TBqFX7SmIwNf+kmyQMbY9HKHm1h1QAh2H/Qp/KkNOws6xAvXTGXDUg?=
 =?us-ascii?Q?IowbC0UWk/W21ki4GN04/4SiZ72DbtmEhZDZ00RBIrDBu6eu4uIAQssiGEXQ?=
 =?us-ascii?Q?gNRJkcSc3uIQaxn3KfI7V5N/3wbrUlH0UXnHJS2cv32GrCllIIfkaMPizmLU?=
 =?us-ascii?Q?JubN0uJB80ic+4SyACpWZvxnSX+veiqlBlPwYdS+EVet0waxJIDaK0ozlxae?=
 =?us-ascii?Q?JNDS4yYf/hjWT3bCgjS9Npg19uFhNo0ttzbxw6U9ZFd4Ixf0iX6opdlVcibi?=
 =?us-ascii?Q?G5tCW9WueMcsJm4Tz2oaQBDHOgfuHpf/G/kp22tIv2DXwOAJhSJKxn+IJpXE?=
 =?us-ascii?Q?SEFPF9G70/DjBbdALO02V+6CN6F6J+0pIl2g4JSzt68EwQqatWWQNcPKW/Px?=
 =?us-ascii?Q?0mE0/PIWi2vLnj0kG2fj3qLDV5LvNqhsTe+nflXOpGCc2wPKrw14Rznq57rX?=
 =?us-ascii?Q?aV25tNJhpz8y9FY1ULZX6veqmcm85uigIirVcUmJm2wqFzP8oOEMrOG55dZV?=
 =?us-ascii?Q?/e5iBNAdXhZnDA9BFFuKeGxM431CFpImoOG6/f+7+iaWM1xlmZlRvAdvDTFA?=
 =?us-ascii?Q?dXLj50PGFN4TJcqgaOpHtiwAThbkROEofw5YH3OhaX1bETF5XOFUXUstLbxR?=
 =?us-ascii?Q?+xgV6dZX2zs/A41l3nS55woz5bTSnDqmzSgEA5WArFhHLGubI0slfNykuPYz?=
 =?us-ascii?Q?PsLhoYYNhl8U/3GQQCJXuPzbqdw8PB2o4Xi8zguo9J2XhWT1xTORoOzxtW3L?=
 =?us-ascii?Q?IDcqQ5jpQVirPsc2uBcJHhu8sVmP4r9yn/Rokvg+BRg/DTqh/IqVELjsSs/F?=
 =?us-ascii?Q?dnMjZergmy+RmbSVxTM2l0IKKxSmKEsbL6/NTTNmZSlfh57g+wC88Aa294Gr?=
 =?us-ascii?Q?bMO/awhfSse7Nv0m0s0exx39TzNe1nz1QJkGa6Enst1TN8qd1ktNoW2cJPnG?=
 =?us-ascii?Q?LO5bKgnHYXUp1DVH6q+uXH9XeZBQSkr5FY7VA4u/6zZg3FYHKnZ6vbPyOnZN?=
 =?us-ascii?Q?M8nFHvHmJHEldhrq2zJlg+rdPqQfH3qCDqX7FqH+UaOlCUVCn8jab6X9HjxM?=
 =?us-ascii?Q?jcvlijcH2BwltRtmdj++BvaSOsa6M2XjhaU3LYYLyD7Ns98gXOdFEcW++o5o?=
 =?us-ascii?Q?9bbQvkt50nNb2mZkk9uu7v1koUQBoT0SOxyIY0HhdhVvWm18nWjKWxxo3aUx?=
 =?us-ascii?Q?sp+ACRjkXt/6NaFmz59SnzA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6938.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0cdbc1-aa41-4207-e68e-08dd468d84df
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 09:06:18.9781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1BZ2Eq74Fe9EDOPhhwFLcelEByLEMphJgFsViNM7Fcc8zqMpmx1HgT5kIvhknWJWJj3XMv0dUEQoztYW9ajeFEK3fNeJy7lXhnwPUF+2q2x35Cy1YSUDG9/1tUxG1Gbq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR03MB8079
X-Proofpoint-GUID: tmuklEONpz7cbLoHleUNtsCP8XSAHh3m
X-Authority-Analysis: v=2.4 cv=D9q9KuRj c=1 sm=1 tr=0 ts=67a47b8d cx=c_pps a=kylQlKNaLH8A8Uw3zR316Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=T2h4t0Lz3GQA:10 a=udXclQch7WkA:10
 a=pGLkceISAAAA:8 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8 a=07d9gI8wAAAA:8 a=cPYzWk29AAAA:8 a=YQcLiv00sGH5GoDQuDYA:9 a=CjuIK1q_8ugA:10 a=oVHKYsEdi7-vN-J5QA_j:22 a=WzC6qhA0u3u7Ye7llzcV:22 a=e2CUPOnPG4QKp8I52DXD:22 a=oSR2DF9YFqZEN4IGatwP:22
X-Proofpoint-ORIG-GUID: tmuklEONpz7cbLoHleUNtsCP8XSAHh3m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_02,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1015 spamscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502060075

> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Thursday, January 30, 2025 12:15 AM
> To: Encarnacion, Cedric justine <Cedricjustine.Encarnacion@analog.com>
> Cc: Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.or=
g>;
> Conor Dooley <conor+dt@kernel.org>; Jean Delvare <jdelvare@suse.com>;
> Jonathan Corbet <corbet@lwn.net>; Delphine CC Chiu
> <Delphine_CC_Chiu@wiwynn.com>; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-hwmon@vger.kernel.org; linux-
> doc@vger.kernel.org; linux-i2c@vger.kernel.org
> Subject: Re: [PATCH 2/2] hwmon: (pmbus/lt3074): add support for lt3074
>=20
> [External]
>=20
> On Fri, Jan 24, 2025 at 11:39:07PM +0800, Cedric Encarnacion wrote:
> > Add hardware monitoring and regulator support for LT3074. The LT3074 is=
 an
> > ultrafast, ultralow noise 3A, 5.5V dropout linear regulator. The PMBus
> > serial interface allows telemetry for input/output voltage, bias voltag=
e,
> > output current, and die temperature.
> >
> > Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com=
>
>=20
> Just in case it is not obvious: I do not apply or for the most part not
> even review patches if the kernel test robot reported a problem.
> This applies to all patches, not just this one.
>=20
> Thanks,
> Guenter

This is understood. I'll submit a new patch version soon to address the ker=
nel
test robot warning.

Best regards,
Cedric

