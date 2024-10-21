Return-Path: <linux-i2c+bounces-7491-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3F99A5CC3
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 09:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAC1C1F2131F
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 07:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC14C1D1736;
	Mon, 21 Oct 2024 07:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="SAPA7lCO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa15.fujitsucc.c3s2.iphmx.com (esa15.fujitsucc.c3s2.iphmx.com [68.232.156.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA511D14FD;
	Mon, 21 Oct 2024 07:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.156.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495391; cv=fail; b=l4BDj9CRkmuWv2NtCNB0fzcxNdN8wiy5bqiwnfCSraxOKk06kCj2HXWzCvZHKV+dyZCflsvL9Yj82MWgN+bmufVNCtsCi6EfHSrWG1k0wSN2W+4A66zT4Zt9CdJzdGFuNJcope8hh9rQiAIQFaPLITQNRqcFlbkRQU73rIkGNPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495391; c=relaxed/simple;
	bh=6Ea1lfapOOj0KMVbesKYhrWCBZ3adfV36VtRkb2JWT8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q/U49Ue+yS+HHYeQMsn67LCxXGktRVmXgmPPFgjjbyurzK/4uG4h/jauQKpld7Rl7Ot6SceEyjAqYEMJg+bAW12zVpJ+qalJxNZSAnG/ehP/+hnmyksCsgqpm88SWGW962rOMZ2Pj/ZQtaBzPz/owmOUJfSTthS/YF2s3zHoDzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=SAPA7lCO; arc=fail smtp.client-ip=68.232.156.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1729495390; x=1761031390;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6Ea1lfapOOj0KMVbesKYhrWCBZ3adfV36VtRkb2JWT8=;
  b=SAPA7lCOy4WcF6TeGbW6kmXajOnhygIGSjnkTm5EKD/06+KiqHTw98AX
   i8BzWnm20D3/GtK9nb5gCBgbdcz6OiAiEwOCZy2/W61WVlmJdEamofPHn
   4h/yl5u3NnHwYgmYxCIJTsJRcwuZtcYOHX+kn4f6WACEwQO1NeIZPW7b4
   6GWwQ2gkTTer+DHEIq6MzZy5b7MX4NabRz9LzCa/daJ16WUumdzf66wib
   wNmn/LdKvdw9Ek0GZtkbrRbmdRsCInXjhXqUg0Gq7Lr8YtofrisMg4djQ
   WftZEp8yy+TxVpPD1LvCRkN31uQ/dfjf+gNDMHFhm6V3ZO9n8SC/0mPpl
   w==;
X-CSE-ConnectionGUID: dIvDR7KDRZmKj+vn+W21YQ==
X-CSE-MsgGUID: PLxGBKMoTcOCJueBaKmi8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="134729989"
X-IronPort-AV: E=Sophos;i="6.11,220,1725289200"; 
   d="scan'208";a="134729989"
Received: from mail-japanwestazlp17011027.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.93.130.27])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 16:22:59 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GI4P+Goz1Xec210G8TLfTlNrH2pm9ZghWhsoKqQyHWT0/7f/1vfjBkBdIIyfyWc1DXRhw0YjBmw5w9AG7EyPM/HL8jlQljZI88m45hEqa8jF3KpwounZqfblhBLNWHMDshecyl9YDNguCZnCnuxes8OtbFP57XyIr22NpQdTitk42wmX2w/XgdEcAgP7MJlFSiveVbDeoSrrGcnoO6F29Hj4Wbr1FBRGqbEYTDFS10xa2m+qy8k/LeyQYg7BmroSA7C/TS0c/F8OyexcMRRkWIlKrGFhqRbPuQVkN2mhvq6qJ6pqmeON1X6JGp/fjs1bA7P/6ZIffT+qqbuy1+7PVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKzWSOlNYhSauWkHI/4cX9Q81P6Ma24VLAgEnX4bLno=;
 b=s329OY0V23cBCqwTYTXNXRZmFhvNPyTmDAIP1B9S6AWJig5/oLMd6pM96L9WApYYhPVjTsyCB3F91VB/RwZ3LtSa9la/CPS3W/R8sIl6vyR6fix/lodAnHeioJZjULCgRRId2EQ/2Ak8sOPuvwIiAn04+C9s/L3cSRGawubZDh9nQeKnINOqzDgDd/1o6iW2lDV6JcznSyFbag2kNi2Q9s97M0TESvptHI+uifkMwu7ywIYWxntu5+m/ownovpQa6JJGZKxIjD0hZU3A8DQKBhrN8yk5BhEFrtZlQKYOXppwwCTbBAE3nz15Q0V6wF9RmVQGgyOClGVGvbDRMDkP7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB6903.jpnprd01.prod.outlook.com (2603:1096:604:12c::9)
 by OSRPR01MB12030.jpnprd01.prod.outlook.com (2603:1096:604:234::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 07:22:55 +0000
Received: from OS3PR01MB6903.jpnprd01.prod.outlook.com
 ([fe80::df96:5745:d1b5:cafe]) by OS3PR01MB6903.jpnprd01.prod.outlook.com
 ([fe80::df96:5745:d1b5:cafe%3]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 07:22:55 +0000
From: "Yoshihiro Furudera (Fujitsu)" <fj5100bi@fujitsu.com>
To: 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>
CC: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi Shyti
	<andi.shyti@kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: designware: Add ACPI HID for DWAPB I2C controller on
 Fujitsu MONAKA
Thread-Topic: [PATCH] i2c: designware: Add ACPI HID for DWAPB I2C controller
 on Fujitsu MONAKA
Thread-Index: AQHbIQE+jLx5nBqtt06FYSQ4k1MgtLKMdDKAgARb1sA=
Date: Mon, 21 Oct 2024 07:22:55 +0000
Message-ID:
 <OS3PR01MB6903FEFE0404D809D62D4628D4432@OS3PR01MB6903.jpnprd01.prod.outlook.com>
References: <20241018015826.2925075-1-fj5100bi@fujitsu.com>
 <ZxJXj3holsMIdnC2@smile.fi.intel.com>
In-Reply-To: <ZxJXj3holsMIdnC2@smile.fi.intel.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ActionId=84217457-e5e2-4f1d-aac2-a6d0517b558c;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ContentBits=0;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Enabled=true;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Method=Privileged;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Name=FUJITSU-PUBLIC?;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SetDate=2024-10-21T07:18:13Z;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB6903:EE_|OSRPR01MB12030:EE_
x-ms-office365-filtering-correlation-id: 5d041a5d-f35b-46a4-ffc3-08dcf1a12e98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|1580799027;
x-microsoft-antispam-message-info:
 =?iso-2022-jp?B?TXdJb0xDeHNFOVY5SzlobmtIZWlvaTdmaWVwSWlkYXUya0toSkZvMGUz?=
 =?iso-2022-jp?B?QXJ4ZjBZSHBGaSs4V2JseHhhdStxSFF5UEt4M1VXV0greDR2dThGcS9H?=
 =?iso-2022-jp?B?THhpNTJVcUxaWnR3WXlFRzBhQUQweUVGNHY3SWtlbytyS3BqdlFiREpB?=
 =?iso-2022-jp?B?N2N0akdEQktnUWJaOThPWE5pM25Lc3Q5ZmhxMkIxeWhlckprU3htT1FJ?=
 =?iso-2022-jp?B?YkdvMnFJc2xwdWFzMUpoaGRVZC9SRTdNWGVNQzFxQzhxSHQ0dm5YRFRu?=
 =?iso-2022-jp?B?M0orT25qYUtUOG9USG1nNG1XWnBwMDhjb3ora2VNS08wbHhjSCtVbFFT?=
 =?iso-2022-jp?B?ZU02ZXQweVU3M1hrSzdjc2RDUXd2VUc3RzBRNGt5d09jcVhHbUxoUUhR?=
 =?iso-2022-jp?B?VU95N3NwRlB6azB4YmtXUStPdHYvSCszTFIwbG5NM1pqVEZqMTNsMUFH?=
 =?iso-2022-jp?B?dnNKUTY1aXE0cnpFRDJaTlJiOTdFSXRRdmljVDFVNGhvMGpZQVlaaDRr?=
 =?iso-2022-jp?B?d1NSTXdWTlcrNjREWjlDRWFrbU9tL1NHK1FWWVgyTjg3YU90VjBLZHkr?=
 =?iso-2022-jp?B?K2wxSWFZMjRJWVp4M1BsYVpwWFUra3VGOGs5YUs5aTY5YjJZVWgzMXpy?=
 =?iso-2022-jp?B?OFQzdHNjdFpqMUw3T2RPY29obkFDRnhicUtNQzhHdnk5bFlJTlFNTzRt?=
 =?iso-2022-jp?B?NC94TTB6TTdwYmE2ZjM2MmVoUVlibmNCaEJOQ3p0S0xBTXgxa1ZTYnNz?=
 =?iso-2022-jp?B?OG1EVHBER0N2alBVWGVMQTFXSHFOcnFRL1NmV3NmOGltQjJTVG1ZbUJi?=
 =?iso-2022-jp?B?aUl0OFhFYXZxUk1DL3pjaFRCN2RzRVNjVXRGbVgyUExTOXZJZkpwK0FC?=
 =?iso-2022-jp?B?Y1ZwLy9wcXU3Z2RrbTRkOEwydGloUlZJV3JwMWRueGpZTTBWYXRLTWl5?=
 =?iso-2022-jp?B?OUl6RHNuTmdIb3JqRWQrcThtUWgwclFSSWk5bGNETElVQTlRUk5UZ0g4?=
 =?iso-2022-jp?B?clorSlBIdWtIUy9ST2p2ZWdzSWdUUUtEQUY0NTNRbVp3Zzk3Si9Ga0dJ?=
 =?iso-2022-jp?B?aU1ZanFxTVBCS2hGSTdacVY4cTF6UDQ1UGpPZEtJRFBYRzhGTnNYTSsx?=
 =?iso-2022-jp?B?M21RbFZBODJlSjhUdEdxa1BkNTRpdFI0STJaaVRXSzErWEZaOGIwSFhV?=
 =?iso-2022-jp?B?R3NiZG01bk12b05SMDgzZndCSTVDQzBlTmRsTTNFN1JiTEx5bkUvOFFR?=
 =?iso-2022-jp?B?K1pkVnBPTGVwZWtHVWFpL3F1K1lzVlFORlh0ZExDUnk4c3d0NG1jcjF4?=
 =?iso-2022-jp?B?K0d3cUliSG9Od0lSOVp4ZmhTTjdkWFBBdXJYRTNYdkpkYlBLa1NuOXdE?=
 =?iso-2022-jp?B?bzFIbDYrREc4RXM3d2JJVGdzTFNWUWR6SHRRVmRQbUJvbUxmVWc0MWVM?=
 =?iso-2022-jp?B?eWt6aWdyUGxWOU9CRmpUbkhCQmd3a3g3V0FRdnZmK24rbmZTQnVwanc2?=
 =?iso-2022-jp?B?TXhNeEd3ZW9vWnBvb1p5aFJnSjFRaU8wZVZqNmVMNWJNQVRIbVYwelBH?=
 =?iso-2022-jp?B?ZTY4ZUM1TWhsZkZJbnFiQmVEZjZHRXd2QzJVMkQ4ajBqdW5zMDRBRHpJ?=
 =?iso-2022-jp?B?WGVtZmJuSWdGZ2gya0pnSFlQSWtENDdXa0FMNGJZL29JQVVqYmw0cjNK?=
 =?iso-2022-jp?B?d0xHMk1oTWtyVHVlQVhXUHprdzB2dExXRklHbTRvOHAvQVRCQ25kakxQ?=
 =?iso-2022-jp?B?eGNiYU82RHRaNTEyNkV0SW52eXc2UThCNW9kK0tpWW5BckVZSW52N3FM?=
 =?iso-2022-jp?B?T1gzTGJVaXhRUVBuYU9PNm9jNjRJek1YOE9ObHo0SSt1aGg3ZlNpcjdH?=
 =?iso-2022-jp?B?S3VSeTZJbFF1WVo4bDNDbms3TithbWRqV3RDRUl2Yjh0T2RJMXRVUXlY?=
 =?iso-2022-jp?B?aHR0UnNzbFNvK1ozSC82U054SlhycjlaOWlYckt3QnpLSTVGMnV1RlpB?=
 =?iso-2022-jp?B?allqaUMyR0lXT2JMZnQwTXJhVU0zVWJSL3lZOTU3TzlXa0UvdWduQjZT?=
 =?iso-2022-jp?B?QVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6903.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?a2d5NEJVSnlGazZvZUNncnpIS3ROT3NLcHR5Yi9Ba0tuQjhvZmtyUkVk?=
 =?iso-2022-jp?B?S0tLcThtVU92ZC9kQXJ5UDhWSCs1eVZCOHNLVUtyN3B2cVBHQThkbERi?=
 =?iso-2022-jp?B?T2NjdXpuZFNHcUJ6NXFCMjkxY09rOUpxNTZOOUhnd3M0dm1heXlhV3Ar?=
 =?iso-2022-jp?B?emNRb3JVbzdzdUVRM2RWZEhiY3RpdEdpc0pEZU1XMUM2K2JEOHhTSVBj?=
 =?iso-2022-jp?B?UFY4N21zNXpsaUU1OHpKcTZ2UTk0VmJNK2JWa3AwY3VmQk9rVW9ORVU1?=
 =?iso-2022-jp?B?MmZleGpEcHo2TjlnckRXbTQ1N3drNmdueEpQSUVMUWo1M0ZIallQOUtN?=
 =?iso-2022-jp?B?dklXMzNBUnJtN1QweVl5Wkl3SVdqd0VXUlQ2V1QwdXFxU00rOFQ1TmJv?=
 =?iso-2022-jp?B?WGQwQ2dSVlZsY2Z6YmM4ZnYyd1JocTJhVmp5b3J2Y2tNSjBkdFhuYmhU?=
 =?iso-2022-jp?B?c0dkdnNGdWJHRk9iTmJzWVcwWmwxWDlLc2d2QTd3UlN3UW5tUGQraHFM?=
 =?iso-2022-jp?B?a0s2TmVxMkl4UWxtdENkeUNULzdjR0dzQU1kMDhxQ1B1b2VzNDJNWG5T?=
 =?iso-2022-jp?B?NkxKSmp1bWpHQ3ljZzhDRnQ2M3dieDllUjlQQy85OEl4eDdrZkJraEtR?=
 =?iso-2022-jp?B?bTRVRjlHOHpJaTZwYVFocGRVYnZSb0lPM1JseVh4dEw0cWd5NVc4bU5X?=
 =?iso-2022-jp?B?emdxQVUzY3I1eDBVQzNIM3d5SHNDRktxdXF4NVlnSDNWNStEM0lQajlG?=
 =?iso-2022-jp?B?ZlBWbzFjUUExcWlZZC9PM0ZhT3Z1MG4ybE41N2g3WXJoOCsxM2V3eVJt?=
 =?iso-2022-jp?B?ZkQ2Z0xGaERmQzZ5ZU5xMWpkaWJlbDMwN25ZR2RwcEsxYUpQSUVKRUIr?=
 =?iso-2022-jp?B?U0FVUFNHNG44MWRKK3JjN1RqTHcyYU5HcW16bDhwMlEvNmxTWlAxa3lm?=
 =?iso-2022-jp?B?cFJ3ZHYwd0c4TzE4TVZjeFh0MmluR3RCczRtYWxRbi9ZaVkyelFJUHVL?=
 =?iso-2022-jp?B?Um16TERONDZyajYyN0dEd2RUSjV1TlFzYXdqQ2QrQ1AwOGZVd2VYbmZx?=
 =?iso-2022-jp?B?MzRpeld4aHY3QmVQN01JcVM0R1FsZFpkS2JpbDB2cmJrbWdrYkQ2TmxD?=
 =?iso-2022-jp?B?Z1dlVS80eVhZV3lDaExqRjY5YjBjNWg0NkRkTUNvT1hDQjRWbCtSc3Z5?=
 =?iso-2022-jp?B?dTl2L2dVbXhxMEdIZFdZa1lUU0kwRzlTelh5ZVUzNEdzRVlTWjNKaVQ5?=
 =?iso-2022-jp?B?ajF0RUhSSjBhK0VnOVBIOG9Ja05TNlVoRE16RUVRRVoxSlhqNUE5U1Qv?=
 =?iso-2022-jp?B?WnRoMlhINjVnNlNMNVNmc09nV2R5clNvN3k1dXlpTTgwbFZTUS91UERa?=
 =?iso-2022-jp?B?YnRqalhBVWVuSzN0WlMxd1c1Y1BJRmNkdFp5ZnQrYTdkQjU1Z1dnL2NP?=
 =?iso-2022-jp?B?OEI1QXdwQkJzL3BMT0VTN2RGT05Wa0IvMko3V3YxQWMyc09NeUNxSDU5?=
 =?iso-2022-jp?B?Q2lYVmYzOWo4UnkvSmsyWjhUSUVISTR2Skt5dkNuWjVJbGJGTTl3Wnh3?=
 =?iso-2022-jp?B?Y3dCa3dCNCtzcy80eUl3MU1ESUN2QklSZ3lSMEhEVXFNUUFMWFlDS1JS?=
 =?iso-2022-jp?B?UDlwQlYwbi9PL1RTMmVmMzZNUmJlSEdDVVFCVitPSmRtckRNOTBqYnhI?=
 =?iso-2022-jp?B?cTloaFUzZTYrQ2w4YlV6RjBjWEQweUpJZklEVVd2NUp4VFBSS0lkSVNk?=
 =?iso-2022-jp?B?anJyYVpPOE1UOHJ0L3Vwd2F6TXk5TndHczRORFpBNGtoQ0pJR3k3Um5i?=
 =?iso-2022-jp?B?OVlkbGlBbDY4VUM4Wmk4Wml2UDlueHY2alhOOW1Kc3ZCQ3diOGIxSlVC?=
 =?iso-2022-jp?B?a1dNcTFjOVlDYTF0aG5ncWU2QzFPNWhuL2h4WnFWRkVvT1NUOWlScWk1?=
 =?iso-2022-jp?B?Myt2aVNCYjFkbHN1bXBFWTBLUzBDWU9SekswUERwVit0Q3AzTXJTWFhR?=
 =?iso-2022-jp?B?OFA1eDFDSTRZOFNOSitURjIxNXNTZk9JUUhvZS9CYTRzUklmdm1ieG9n?=
 =?iso-2022-jp?B?RXZYd0lTam1ZTzZNRHM3c1RZMTlVWTkwUkJFanp0eU9oRDM5M0pMZHlz?=
 =?iso-2022-jp?B?WGFOOWlLQVhYVTYxT1hzTnpOZFN0eHBzRjEzbHFOV3dkaHhRRGVUVGp5?=
 =?iso-2022-jp?B?cGZvRmNmM0d0d3JEemVpZmkraDhqeG5SbzdtUzFKbHQzZGZqTDYvQVUx?=
 =?iso-2022-jp?B?QyszOWxldkJhUTg4VGlqcFdOQU1sUTlFSGtuaXU3SWcxbzMwVlJ4MVNI?=
 =?iso-2022-jp?B?STBiamZKYmp4aVE5WXFBeWlERHpJOTQvc0E9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2himrLCvmsD3lt4RMloBqlKLheIgepVE7391HZrJQ2W8XV9uwgC31g4fOlQ6wjKvNQ3ztbRZYfUWl4LxEsPR7NZo5m4pOA9YGlu2IbOcGMvKRaBjGw4/KKFn8sGuVf6O0z+ZBwstK73oYZtxmSwnr8zuBheE8NHsNFfdHh3r+0bfeS/13O7idOVpvX85G+68Xa3D4U0FX6opj4tLvre1rI5WH3uyIs2NW88EtVeU5xgysCezCzeRjyGhKcReZNAMopkezROj3/XIlc7bqEWil+lX9eFzVk+0S4WXgbwnp8DofGzsmaijOCK0d7/AheYEUfgX1XY8azljbBN1gengU8PupQ5dlkZu6l5Klo1LApNZcQgM76VbyIk0TuXmmzqFoTifWt1zPYelA7rBXD6scxEkBMcR51wUCrbZOvBPvAxGQ3woFbDjmlg+tKGnU1JSceCw8tAE76CO82XW7MGPzhb2ofegNsR3RWH0BQORGR9kSXjn2Bzuv8EF6pAds4H3ODQ+gokZuDM8+xeXmZGyTH0LhWPhYPacdJMX1wU1HsW2k1mv74LIHElPvLCHOekZ0HsZarNixHRKvmx2IYT2zIxW8Ks0ZHd53UBlVHWrZboEzBMaharpEq25nkWB0xkN
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6903.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d041a5d-f35b-46a4-ffc3-08dcf1a12e98
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2024 07:22:55.3379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mEFHtWH+vD1mU7BB6oy7jRiOTFmfai74Ssrf6xnujkuENzfSJA5rUQLl5eGJC6gz5ri/9ukIrIVO/AcnpTIjE4pKrdX6ttmNMc/0UtnGdTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB12030

Hi, Andy Shevchenko
Thanks for you review/comments.

> On Fri, Oct 18, 2024 at 01:58:26AM +0000, Yoshihiro Furudera wrote:
> > This patch enables DWAPB I2C controller support on Fujitsu MONAKA.
>=20
> s/This patch enables/Enable/

Understood.

>=20
> Also please give more details:
> 1) is this ID already present in the wild
>    (in the products that one may just go and buy)?
> if so, mention the example of the product.

Not available at this time.
It is planned to be implemented in the MONAKA server
scheduled for shipment in 2027.

>=20
> 2) provide an excerpt from DSDT for the Device object that uses this _HID=
.

The DSDT information obtained when verified using
an in-house simulator is presented below.

DefinitionBlock ("", "SSDT", 2, "FUJ   ", "NGDC    ", 0x00000001)
{
    Scope (\_SB)
    {
        Device (SMB0)
        {
            Name (_HID, "FUJI200B")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
=20
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Sett=
ings
            {
                Memory32Fixed (ReadWrite,
                    0x2A4B0000,         // Address Base
                    0x00010000,         // Address Length
                    )
                Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, =
,, )
                {
                    0x00000159,
                }
            })
            Device (SSIF)
            {
                Name (_HID, EisaId ("IPI0001"))  // _HID: Hardware ID
                Name (_UID, Zero)  // _UID: Unique ID
                Name (_STR, Unicode ("IPMI_SSIF"))  // _STR: Description St=
ring
                Method (_IFT, 0, NotSerialized)  // _IFT: IPMI Interface Ty=
pe
                {
                    Return (0x04)
                }
=20
                Method (_ADR, 0, NotSerialized)  // _ADR: Address
                {
                    Return (0x20)
                }
=20
                Method (_SRV, 0, NotSerialized)  // _SRV: IPMI Spec Revisio=
n
                {
                    Return (0x0200)
                }
            }
        }
    }
}

>=20
> Otherwise the vendor ID is legit [1] and code wise patch is okay.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> [1]: https://uefi.org/ACPI_ID_List?acpi_search=3Dfuji
>=20
> --
> With Best Regards,
> Andy Shevchenko
>

Best Regards,
Yoshihiro Furudera

