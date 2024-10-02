Return-Path: <linux-i2c+bounces-7170-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB48398CFF5
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 11:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 633291F22CAC
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 09:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DBA198857;
	Wed,  2 Oct 2024 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="iB+zUTqd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2136.outbound.protection.outlook.com [40.107.95.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABC51946A4;
	Wed,  2 Oct 2024 09:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727860845; cv=fail; b=jPttdhGhJOGBp8cVgbwm/1ZPp6PoZUnGHcBSEiqxsI7aE6fW7eMv5Ac3nGGRz2aJdluXiihDH6XjJMWddiHCVV+jHHD7JTMOnyAy3mfhcvJxL8UaX3IBiGCcK612symsN7mWN8F0UhU6PPx/Pcb1fU2C/cAPoVpIqOqnGGrtUCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727860845; c=relaxed/simple;
	bh=mdFftbd1aiYjOXq31tQaC8CvxUXY+g7rZWnclgfIqII=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=re1z3GnLYUtZfIt+ueVfu/S4RSuPTCpt7EzUT451L8wUGdOjoy67oDtf7MXTsNN/ItUQaqfAVI9vCiMW75JXLnJGa+P17LpfhKf2k5oXftEAuSCOD/1I7JG/XDQLM1DSrlHWst8lO3eXhNoWVZRuulPwgj2/ZX0ud5o+Bcr0v5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=iB+zUTqd; arc=fail smtp.client-ip=40.107.95.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgmavAwfcEmDnwm5FwiwQy1DLSE2JxhBiVougBtN3/wz00e8UMHtbc/BLrM5aeNPKt0rJyytBB31ui7RqYuLYVZIUhispa/C8M5Ty3AGNwIMxnvH0/LuI/VZMskoiTCy+3I0C90zpD8dCF+LBdRZh5CyhDPtdnjFwoQKoH5O4Uol7KlD3ssc/w6KciDFyn/6s41dLPhfuLj8tnrhROCIeqziszxJ9YAX+XW1FXAm9pNPhu+7TQ/1BGDklFTO75C3lkDEtV4psp/2vJiLgTANGehgD/WOpjMGxxeC+8SU+EvqDTxR+FuAC8rjDq+nJxs+9ANduA92QHWHU6LtCexHPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdFftbd1aiYjOXq31tQaC8CvxUXY+g7rZWnclgfIqII=;
 b=pxVYnA5EnhNh0HcUn/iS4z0XmonEkHgJ15WCG/YUC66a5iabRnt9Rsvttx/XJCOTqCVFSulf00VCZbB/usgZ8LCl7c1XM0fLgJcoKEf4J2K/CuLyA2h7ZSDVo5swdddsUzDGAQGduEUW1YJFhvcBJGm6NC0+uopNcgah/57cLun19psBKOAbgB1X87TuigojKB/UmEkYawVf1FerGlr5aCaQYQLMd9e80A31Q45CLqBfwMkM5rzQ/CvoLP3clDV5mzk5COPcnmdcmydTFsbq3ab928a0v1ingOVGnTypNAQTu9+U0n5GQ+R5u0GsoUbm80+ob4PLcsaGt1loIiFLuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdFftbd1aiYjOXq31tQaC8CvxUXY+g7rZWnclgfIqII=;
 b=iB+zUTqda43bx2XGTlvUuwpVKh3qyB9pva6L9ZFU/GWXknl7xW5fjoO5Ptmo2xcSQcsruvyix5vDahMkC8kjWY1Y7gu3SmAvKhrJsTpdFpch/5AWLlFKjGO+Q7O7bp84fcOWdZoW3AXiZBq8pWWVtx+idAdAULqajNHF1kHOsHU=
Received: from IA1PR14MB6224.namprd14.prod.outlook.com (2603:10b6:208:42b::6)
 by CY8PR14MB5932.namprd14.prod.outlook.com (2603:10b6:930:51::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 09:20:40 +0000
Received: from IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94]) by IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94%3]) with mapi id 15.20.8026.016; Wed, 2 Oct 2024
 09:20:40 +0000
From: Michael Wu <Michael.Wu@kneron.us>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, morgan chang
	<morgan.chang@kneron.us>, "mvp.kutali@gmail.com" <mvp.kutali@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: snps,designware-i2c: declare bus
 capacitance and clk freq optimized
Thread-Topic: [PATCH v3 1/2] dt-bindings: i2c: snps,designware-i2c: declare
 bus capacitance and clk freq optimized
Thread-Index: AQHbE9wxXfKM7AAKiEqktckGg1ftXLJy+1cAgAAiTyA=
Date: Wed, 2 Oct 2024 09:20:40 +0000
Message-ID:
 <IA1PR14MB6224944B2294577212DB26508A702@IA1PR14MB6224.namprd14.prod.outlook.com>
References: <20241001082937.680372-1-michael.wu@kneron.us>
 <20241001082937.680372-2-michael.wu@kneron.us>
 <cmm7l2kxu2wl55rmcoi3q43ieejnivi5rvjdy6j3wvj6qahse7@ocgi7nyju4je>
In-Reply-To: <cmm7l2kxu2wl55rmcoi3q43ieejnivi5rvjdy6j3wvj6qahse7@ocgi7nyju4je>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR14MB6224:EE_|CY8PR14MB5932:EE_
x-ms-office365-filtering-correlation-id: 3209e7c2-ae58-448b-845a-08dce2c37bd3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|80162021|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c2IwUnlvdXVhc3FyZ3laSWhkWGtQTjhNODZzTm1mc2pmWURqY0xTMzU1UFd0?=
 =?utf-8?B?bDdsMXBGR0l3bkp6ek9KVWdZbVdRK3Z6RlFZdEhRU0YvNmZ1bUJOOGZPZ3Vy?=
 =?utf-8?B?eVhKbHE2TGxiM1hsWFc2SWM4NnplWVpvNitpRFVrYUtDSW1md0U0cjlZdlpW?=
 =?utf-8?B?WG01blhrYmZWRU5MeGtLTER4OXRGNXlRUnByTkM2cTZjekdQSnYwZzFzSjJ3?=
 =?utf-8?B?UitaRTY4ZGo5ZTF4RDhuL3BlWHpmRG9lc2N1NzJ6cFdtc2FxUzlIL2RiVGMv?=
 =?utf-8?B?TTFrRExXU25FcURydWlQZ29ybE44a2ROeVNrc1RaQ2pXUEtvcGtwWXpPVko2?=
 =?utf-8?B?ODFuaS95amFjTkROMFNTRnJCQk9YbE9CVmQ5Wkt0OC81SDlPTzBsRTllQzkr?=
 =?utf-8?B?cFNFVDZyTzJ5TG82M3IwVlVkRzlvVVM5RnhpbitSNVhKVE9kM1Q4Wncxb1dN?=
 =?utf-8?B?VnNOU0czRGlFWTBYeGxBeDlkMndnNkVPSjdDbEFvODNoNDlxemlUckFHQndS?=
 =?utf-8?B?cHJGSUdjUUZaSFZhLzAzSWxjSVh6OUF0bDNxdVFqRmtpNUFucDhqOFBTbWor?=
 =?utf-8?B?TGNKRmwxbG9SRTUzM1lSeFVaMENvWmhNcWp4WUxyOUxZQmZvbTlrckF2SkNq?=
 =?utf-8?B?U0FZQ3FNa2xGaytzNHFUUjBPbUVMaDFVVjg1a3ZjS3hoNVBCbHdGUWFnbnVS?=
 =?utf-8?B?bnFoRi9aMWNvaW1DaUxCMDBDY0p4MW9GdENmb0JFSWQzTUhJcTNBaldLNGZp?=
 =?utf-8?B?YkxMRjA4dFJHczdUZ1Zqc3M3aXBrdmc4VGFkUUk5VDhMUklHcW1scG1QZUhh?=
 =?utf-8?B?cjc5T0VIcHpLVWtJZUhnMy92Rzh6QWZXZ2lJNlljMGN4QjNWWncyMlNHM0xM?=
 =?utf-8?B?NFNmV09OUTdPcndReU1Jd0ZVK0swOUxQVnNQNXdpUzFhamo3eXhvbm5ocUgw?=
 =?utf-8?B?a2xLZnlNSy9VTGp5dXFNR1RGa2dVV09WcVRPWThHMklmQm1pU05VWDVRUmZD?=
 =?utf-8?B?QWZaOWg0elVualhObmhmZ090K1RBVXBvd2xCNVIzcDI0NVhFYmJTUkxxWFZK?=
 =?utf-8?B?ajNzVDFkYWJNcmlGazk1dmRHQ29vZ0IyQklOUkwvN1gvV3dyNndKUngzbXhk?=
 =?utf-8?B?cFVuY2tkMGZRNTVMNjlTdHBqRmd5OFRLTC9FeERRODFvN2Z3Uy9vbnJsdXk3?=
 =?utf-8?B?Nm54bHlyVUdaTjNGY0NOcGp0Y2hsdnVwUzIzSEpNM1MzM1Q5dktQdExBMGtq?=
 =?utf-8?B?QUhJaVhQSHJRbDY1NDUxcmRnRGV6MGNaMExIUEEvUUwwOHNVS1lEbW1RSUl5?=
 =?utf-8?B?azBGVmozTlM3SEhiU0lPVlVKaXhCUmZ0dU9OYVc3anltRGVNeUZPQWRLMU1Y?=
 =?utf-8?B?OUlURTFsLzR5M3RxMC85VWtwQWkyN0RhcFlpOHUvUGZISk5GV1BOUTRDTWJ2?=
 =?utf-8?B?MXF1Y3VtLzRyQlc5N3I5akNwK0JxVTJ3UFhyOEhpR2lkTGlNN1pFakdVZ2pn?=
 =?utf-8?B?TTBNU3A3SU5kNEdDRXVmSWVGc1BFTkpzajRBdldCVWxKTHdQTnYyaXVmYURM?=
 =?utf-8?B?WXp2Ti93amlvd3NOOVNjNzZERktabnNmaGRxY2tQQjd3RFl5Q2c2SnRnNm12?=
 =?utf-8?B?dERUZjBrYkp2d2dFdk55c0RyNHNjakF1TFlXdi9hc0hVaWFYYzdrcTMxUE9O?=
 =?utf-8?B?cEVjMHd3SHUwQk9pUFVaYXBGNUdlQldqbmxja2ZnbGpkL1ZtZXp1ZFRtOWdT?=
 =?utf-8?B?RlhTdWkwSmRzK3ZaUVFZbmFQbDBnVTU0bUNkZWFWUWxnNGs4U3VTZ29RSlZO?=
 =?utf-8?Q?Y9RzFTiOX8cvhVimxXGdVz1zoFBT66/YRyRPk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR14MB6224.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(80162021)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MGgvcDdCRmhreS9qOFk0TTdkUVRINzBuRHhzM1dKK2pSMFRJcDFUVjdqT1V0?=
 =?utf-8?B?U0syQUgzRVhUem9MeWk5d0w4ZVYzSm9SMXJnNk9JSE9ycnVjMU41MlRWZnMv?=
 =?utf-8?B?NGJuNnRRcGlGa3ZBSnFNcE1odG11VS90VkZKMXRDdUhuWjVoUFJBWjl2Y041?=
 =?utf-8?B?c2tHblJTSXc4dmpjQjF4OEp6ZHh0NlR1YXphYkdSMmRLbkZYYXUyRmRzZUo5?=
 =?utf-8?B?NU1vWHdVcnhyQzlGYjdRMDhCTXlhaHNiWFlhK0RMSy9oNDVKeFpENC9XdEth?=
 =?utf-8?B?M0hCTGRZcndwOW1UdG5hWktKaC9tbnBSNVNhMWUxTWU2cGlWZktxTk03REFh?=
 =?utf-8?B?V2NGSy9SVEhwalI5WW5nbWNqcWYrS2owaFFpK1N5QXgwTlpxYWp3R0ZoaU8z?=
 =?utf-8?B?YnZNV1lyeDZtUXdkb3l4OU81d2hXT1RhVVI2ZUtHWklLTEhHdXMrdHpEdDJW?=
 =?utf-8?B?UTYxTDY2TmNwRStJWS91eG55ajZIbDVYeEFGcEdZaUdKeUJwUzBZdEsvY3B3?=
 =?utf-8?B?WG5iMTY4MXhsS3pkaVBDUDB3VEtXaVZ6dUsvTUtyL3RSU1hDZGFER1JLNmw2?=
 =?utf-8?B?eU9qc2h0VFJVZks1eXo1SnQ0TkFzQTYxdzA4NkJmNXRBWXdVVW0rVnlMZWFx?=
 =?utf-8?B?b0w5TFFYL2h4enhzVlE4VWFuODEyMXR5R2pkem1NUDEvWW5nRjNqN3daMUZu?=
 =?utf-8?B?WHVUMG4wUVJqb2FOTlA5aHBReHUwQ1hud1FJVWh0SVhpTUppSit2MGVzZmEy?=
 =?utf-8?B?dVVRdThXSkd0QUhpSmRJQ3lFT2ZDODNkWFZTS1gvaVVURGh2UUx2REQyQnpk?=
 =?utf-8?B?MEd5S0J4NSt0OHQxd0JpdzgxQ3BLczJlYiswN1k5SXA4cUEzQWZuZTlJSGpt?=
 =?utf-8?B?cExFUXVPRTJwSXBUYnZpdnRaRmloZ1NCbVNhTC96MWVpdkNvU2F2T0NFNkc1?=
 =?utf-8?B?LzZOeVlHdnFuREQwdlQrRG8zSlorV1NvakdubGJEWFgxeWxpR0VQSEd3K2Zm?=
 =?utf-8?B?d2trZDE0VnVUWmMxeW11bml3OHhZcy94SHZJODBWNkk1bnZ3bEJDRWpQSEFP?=
 =?utf-8?B?bWk1UisyeU9vU3FoVVltNEowY3B1K0JTNEdLVHBaa25CSEhPOG9lU2NIZlB3?=
 =?utf-8?B?bGJQV2ZiWGNJamtBWTlSZ09VWEowa2lvN0ZBQWNYYjh5L0hyOWxrRldjOWxC?=
 =?utf-8?B?L3ljSGw4UElMWnRUOHptSGtqTjJoVXNTbTR2eURVMHdzNEM1d1JpWXAwNTNX?=
 =?utf-8?B?TTY0LzhDVlN0RGJuMmFBUEc5TGd4czB1V0RGTmdlRzJTSnR5UVBHMUFwa29U?=
 =?utf-8?B?aVNoSUtOeG9Kc0NycXlmU0xWMjVmU0dTRDBzLzUxVkt3ZHQvS0FrUWxQbFp1?=
 =?utf-8?B?cC9rQm9EYUxuaWhtT2Z3S1ZTRENmSHVIeUlwdWNnZFd0SXA3S1k4ZGNWMDVp?=
 =?utf-8?B?RldQZVYyWHJpaWVpcUhjTW9OMS9Zb2UrTVNPUmd3Um9kOXpCeWNHOTJHa09V?=
 =?utf-8?B?TTBjWkRqazdZVXNzaWZxTFNISmdRdkxIUklDT1B5MzhlOVlFYkZNTkVVSHMy?=
 =?utf-8?B?bVk1S1NZRTI1czdEZUNLRVFKaklOL3NIUjk0TmppU1lEVnVOZkRYRXVMV291?=
 =?utf-8?B?VHhPZUJqT0llZjQvTjNqcm9ZN0tnZ3lnR25pRnRzTXJUc0pRRVN6dm9FTE05?=
 =?utf-8?B?cVVOeWowVkdqNDUrZzNSc3dQUUxjdC85ZEF0V05sMkJQaFAvQ1g0NGlPWjhv?=
 =?utf-8?B?dnYwK0tUOUpSMW1NZU9udlFGYXdrd0h3Q0wvT0V2KzRRVDNreVA3ODk4YXBq?=
 =?utf-8?B?S0NkUDQ3OU5aK1pPMWJwS1dzWHkydU9BTTFTcGd0SHdlaVBXT0ZXa2RWNHhj?=
 =?utf-8?B?ZFRUVEd0aEVSSGNMcGNMamovb3RzVkpLTUNLejVFeXdPQUd1RnRBV1pZM3kz?=
 =?utf-8?B?VGVRQTlKZ1UyeDdXNnVOQlFOcXpUSU12Z3hQZVUzTTZIUXZUZmVadU1CQmVC?=
 =?utf-8?B?S3JrNVgvRGlHTWtjQkd0UlBJWnAyd3Z5U1ZlV3hLV2pjaFkvRjRLZXpGQ29K?=
 =?utf-8?B?eDh0RWVFZVFoNGVsa3VpeWJEOTNiL3JoRTV2a2xhaFNBRE1kM2V6UU1Kak9u?=
 =?utf-8?Q?skbQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR14MB6224.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3209e7c2-ae58-448b-845a-08dce2c37bd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2024 09:20:40.3364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A6e3xhJm6isKm8c/CXRTS9itcZwUVogtCoN6fp5QVj/dz/mOHqHMZ8MeTiNZFdc7vLAKcXJVmstBlbCqEzhSwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR14MB5932

PiBPbiBUdWUsIE9jdCAwMSwgMjAyNCBhdCAwNDoyOTozM1BNICswODAwLCBNaWNoYWVsIFd1IHdy
b3RlOg0KPiA+IFNpbmNlIHRoZXJlIGFyZSBubyByZWdpc3RlcnMgY29udHJvbGxpbmcgdGhlIGhh
cmR3YXJlIHBhcmFtZXRlcnMNCj4gPiBJQ19DQVBfTE9BRElORyBhbmQgSUNfQ0xLX0ZSRVFfT1BU
SU1JWkFUSU9OLCB0aGVpciB2YWx1ZXMgY2FuIG9ubHkgYmUNCj4gPiBkZWNsYXJlZCBpbiB0aGUg
ZGV2aWNlIHRyZWUuDQo+ID4NCj4gPiBzbnBzLGJ1cy1jYXBhY2l0YW5jZS1wZiBpbmRpY2F0ZXMg
dGhlIGJ1cyBjYXBhY2l0YW5jZSBpbiBwaWNvZmFyYWRzIChwRikuDQo+ID4gSXQgYWZmZWN0cyB0
aGUgaGlnaCBhbmQgbG93IHB1bHNlIHdpZHRoIG9mIFNDTCBsaW5lIGluIGhpZ2ggc3BlZWQgbW9k
ZS4NCj4gPiBUaGUgbGVnYWwgdmFsdWVzIGZvciB0aGlzIHByb3BlcnR5IGFyZSAxMDAgYW5kIDQw
MCBvbmx5LCBhbmQgZGVmYXVsdA0KPiA+IHZhbHVlIGlzIDEwMC4gVGhpcyBwcm9wZXJ0eSBjb3Jy
ZXNwb25kcyB0byBJQ19DQVBfTE9BRElORy4NCj4gPg0KPiA+IHNucHMsY2xrLWZyZXEtb3B0aW1p
emVkIGluZGljYXRlcyB3aGV0aGVyIHRoZSBoYXJkd2FyZSBpbnB1dCBjbG9jaw0KPiA+IGZyZXF1
ZW5jeSBpcyByZWR1Y2VkIGJ5IHJlZHVjaW5nIHRoZSBpbnRlcm5hbCBsYXRlbmN5LiBUaGlzIHBy
b3BlcnR5DQo+ID4gY29ycmVzcG9uZHMgdG8gSUNfQ0xLX0ZSRVFfT1BUSU1JWkFUSU9OLg0KPiA+
DQo+ID4gVGhlIGRyaXZlciBjYW4gY2FsY3VsYXRlIGhzX2hjbnQgYW5kIGhzX2xjbnQgYXBwcm9w
cmlhdGUgZm9yIHRoZSBoYXJkd2FyZQ0KPiA+IGJhc2VkIG9uIHRoZXNlIHR3byBwcm9wZXJ0aWVz
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBXdSA8bWljaGFlbC53dUBrbmVyb24u
dXM+DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9pMmMvc25wcyxkZXNpZ253YXJlLWkyYy55
YW1sICAgICB8IDI0DQo+ICsrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDI0IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaTJjL3NucHMsZGVzaWdud2FyZS1pMmMueWFtbA0KPiBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvc25wcyxkZXNpZ253YXJlLWkyYy55
YW1sDQo+ID4gaW5kZXggNjAwMzVhNzg3ZTVjLi5jMzczZjNhY2QzNGIgMTAwNjQ0DQo+ID4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9zbnBzLGRlc2lnbndhcmUt
aTJjLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJj
L3NucHMsZGVzaWdud2FyZS1pMmMueWFtbA0KLi4uDQo+ID4gKyAgICAgIFRoaXMgcHJvcGVydHkg
aW5kaWNhdGVzIHRoZSBidXMgY2FwYWNpdGFuY2UgaW4gcGljb2ZhcmFkcyAocEYpLg0KPiA+ICsg
ICAgICBUaGlzIHZhbHVlIGlzIHVzZWQgdG8gY29tcHV0ZSB0aGUgdEhJR0ggYW5kIHRMT1cgcGVy
aW9kcyBmb3IgaGlnaA0KPiBzcGVlZA0KPiA+ICsgICAgICBtb2RlLg0KPiA+ICsgICAgZGVmYXVs
dDogMTAwDQo+IA0KPiBJIGFza2VkIGZvciBzb21lIGNvbnN0cmFpbnRzIGhlcmUuIG1pbi9tYXhp
bXVtLiBJIHRoaW5rIHlvdSBuZXZlcg0KPiByZXBsaWVkIHRvIHRoaXMuDQo+IA0KDQpJbiBJMkMg
RGVzaWduV2FyZSBEYXRhYm9vayB2Mi4wM2EgdGhlIG1hbmRhdG9yeSBvcHRpb24gaXMgcHJvdmlk
ZWQgdG8NCnNlbGVjdCB3aGV0aGVyIHRoZSBidXMgY2FwYWNpdGFuY2UgaXMgNDAwcEYgb3IgMTAw
cEYuIEl0IHByZXNlbnRzIHRoZQ0KZGVzY3JpcHRpb24gbGlrZSB0aGF0Og0KDQogIERlc2NyaXB0
aW9uOg0KICAgIEZvciBoaWdoIHNwZWVkIG1vZGUsIHRoZSBidXMgbG9hZGluZyAocEYpIGFmZmVj
dHMgdGhlIGhpZ2ggYW5kIGxvdw0KICAgIHB1bHNlIHdpZHRoIG9mIFNDTC4NCiAgVmFsdWVzOiAx
MDAsIDQwMA0KICBEZWZhdWx0IFZhbHVlOiAxMDANCiAgUGFyYW1ldGVyIE5hbWU6IElDX0NBUF9M
T0FESU5HDQoNClRoZXJlIGlzIG5vIGZ1cnRoZXIgaW5mb3JtYXRpb24gZGVzY3JpYmluZyB0aGlz
IG9wdGlvbiBleGNlcHQgdG8gdGhlDQpkZWNsYXJhdGlvbiBvZiBsZWdhbCB2YWx1ZXMg4oCL4oCL
YWJvdmUsIGxldCBhbG9uZSBtaW5pbXVtIGFuZCBtYXhpbXVtIGxpbWl0cy4NCkFzIGEgdXNlciBJ
IGRvbid0IHRoaW5rIEkgaGF2ZSB0aGUgcmlnaHQgdG8gZGVmaW5lIGEgdmFsdWUgcmFuZ2UgZm9y
IHRoZQ0KdmVuZG9yLg0KDQpGcm9tIHRoZSBpbmZvcm1hdGlvbiBwcm92aWRlZCBpbiB0aGUgZGF0
YSBzaGVldCwgSSBwcmVmZXIgdG8gbGlzdCB0aGUNCmxlZ2FsIHZhbHVlcyBsaWtlIHRoZSBmb2xs
b3dpbmc6DQoNCiAgZW51bTogWzEwMCwgNDAwXQ0KICBkZWZhdWx0OiAxMDANCg0K4oCL4oCLaW5z
dGVhZCBvZiBkZWNsYXJpbmcgaXRzIHJhbmdlLiBXaGF0IGRvIHlvdSB0aGluaz8NCg0KSW4gcGF0
Y2hlcyB2MiBJIHVzZWQgaWYgKGRldi0+YnVzX2NhcGFjaXRhbmNlX3BmID09IDQwMCkgey4uLiB9
IGVsc2Ugey4uLn0NCmFuZCBvdGhlciBzdGF0ZW1lbnRzIGluIHRoZSBkcml2ZXIgY29kZSB0byBp
bmRpY2F0ZSB0aGF0IHRoZSBjYXBhY2l0YW5jZQ0KY2FuIG9ubHkgYmUgNDAwcGYgb3Igbm90LiBN
YXliZSB0aGlzIGlzIGEgbWV0YXBob3IuIEknbSBzb3JyeSB0aGF0IEkNCndhc24ndCBtb3JlIGV4
cGxpY2l0IGFib3V0IHRoZSBjb25zdHJhaW50cy4NCg0KPiA+ICsNCj4gPiArICBzbnBzLGNsay1m
cmVxLW9wdGltaXplZDoNCj4gPiArICAgIGRlc2NyaXB0aW9uOiA+DQo+ID4gKyAgICAgIFRoaXMg
cHJvcGVydHkgaW5kaWNhdGVzIHdoZXRoZXIgdGhlIGhhcmR3YXJlIGlucHV0IGNsb2NrIGZyZXF1
ZW5jeQ0KPiBpcw0KPiA+ICsgICAgICByZWR1Y2VkIGJ5IHJlZHVjaW5nIHRoZSBpbnRlcm5hbCBs
YXRlbmN5LiBUaGlzIHZhbHVlIGlzIHVzZWQgdG8NCj4gY29tcHV0ZQ0KPiA+ICsgICAgICB0aGUg
dEhJR0ggYW5kIHRMT1cgcGVyaW9kcyBmb3IgaGlnaCBzcGVlZCBtb2RlLg0KPiA+ICsgICAgdHlw
ZTogYm9vbGVhbg0KPiA+ICsNCj4gPiAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+
DQo+ID4gIHJlcXVpcmVkOg0KPiA+IEBAIC0xNDYsNCArMTYxLDEzIEBAIGV4YW1wbGVzOg0KPiA+
ICAgICAgICBpbnRlcnJ1cHRzID0gPDg+Ow0KPiA+ICAgICAgICBjbG9ja3MgPSA8JmFoYl9jbGs+
Ow0KPiA+ICAgICAgfTsNCj4gPiArICAtIHwNCj4gPiArICAgIGkyY0BjNTAwMDAwMCB7DQo+ID4g
KyAgICAgIGNvbXBhdGlibGUgPSAic25wcyxkZXNpZ253YXJlLWkyYyI7DQo+IA0KPiBFeHRlbmQg
RVhJU1RJTkcgZXhhbXBsZS4gTm90IGFkZCBuZXcgZXhhbXBsZS4NCg0KU2hvdWxkIEkgaW5zZXJ0
IHRoZXNlIHR3byBwcm9wZXJ0aWVzIGludG8gb25lIG9yIGFsbCBleGlzdGluZyBleGFtcGxlcz8N
Cg0KVGhhbmtzICYgUmVnYXJkcw0KTWljaGFlbA0KDQo=

