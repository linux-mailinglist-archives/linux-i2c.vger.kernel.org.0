Return-Path: <linux-i2c+bounces-5665-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5C495B564
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 14:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2360D285857
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 12:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C340D1C9EC0;
	Thu, 22 Aug 2024 12:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="k6GEzy5s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2088.outbound.protection.outlook.com [40.107.215.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975F81C9DD8;
	Thu, 22 Aug 2024 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724330815; cv=fail; b=L5IO8GS2hyNMTaZpGjoLbZPTlaqKF6ddX6qCS5VxmSN5szqBrd9JTPlodR2Us6cUx4WoRSrGqzJJhZ3Q+qWU+PoRxarJVO9r/5YandULh3dBdIsAPe4O0A5E7CpJ0Fpe8IprGrCGu+dx/q9+DftdFCU/MFnSGGm1Z4NEJMHWND0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724330815; c=relaxed/simple;
	bh=TWj91TwdJ+JT1vFdo8My1Xz48c4SnM+8Z0wvCqf2rp8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z6B5vy8Hcw0kGkDkaPz0AfKa2JEUuR/CStbutWJb3+x8Gn824fdqb4nOFxEQJYs7hi1cguFW3e+1N4aOjD3jUbIda20W6JC4DGexwC81xh07dJXuHvbL7Yxu7l1XpbD0X6xeWOL1+leQ5U+97nA+9r46aTuKMAqVmyWlI/a1fVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=k6GEzy5s; arc=fail smtp.client-ip=40.107.215.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHR7yMBjmUalryIKdUnqtSEtJdoGPPoO4B2CnRrL4wuaDtpHJ7DHm0lIfu/B64aslbBxOX9JmbKYv39OAiltbwDT97ncAeLrOSf1CUgGiNRY4pqHitVBse80pvNOCPCM3FsYdAhUlGVYGnHwaw4Iy5xCIIeJFfG5w/uvuC/2UyyZdBPOyF+YSsXNUKiKRbRXXqyfAigLgYDqW6goz5GUpZ7iy6WsOB8yL+Va7zpctaLyBXDHAevmlhkUu4DahPKziWGp3J6BgwXrqeDHDYL70WWLSsbv1i28I9asjNPDPIco66YCPeUkVW+4hryA400tKbF+w3wnLrv5POHrDtUyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohwWYH1EE1AGMEAhWk5E9x7N8or14yowUCmgLp4N5tU=;
 b=ZJoMCb2BkkFmTMXg8t10/NCaHrQMv1gFUxjooKcsbnUKtjojyrQekpYd8g/5n3FWUg/zzbzrUS+UXGXSCv2IFSBYF86G/cccbZGFXr68Fsfkngi1XmengPePf4SRBHTSmx+obg+poMA6Eyo3cuuPoU1Q+q0Eaato91kQWFaKzCcDRjzoVbBRH5Nj0mbqFR7zxK5S+GMlTLZbQX7aKSwcaWIYKzcnqrOfKkDO/M+Cn5gFgc54qQgmx61FE+hMcKNuhDHl79V2VvRBTHsb1dEaQGxGwfYpIidiThNoyPgD+et57f9aX3oVy9UbaaTxyfv/gbrQXSYJb3he0CHOZ3Cu1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohwWYH1EE1AGMEAhWk5E9x7N8or14yowUCmgLp4N5tU=;
 b=k6GEzy5sRDh7BIPp5+b0+sxJygJw37UVjKYGe6K85R7m9RKRGXFmYmOSTKHIWnS3UQQ/UsWP62rpRJPF/95rqXyn6cjzNEggcZTQ8A2jovk8krHDWw+/5L6sP+cXUt+MswywtzJxZLsMwcmOQ2d/7ybsrZxGBFxjtHySCzEiTm2L5yYWqbaUREujQChVlAimixfffPoaAPtqC0ANazJLE2mGUSfOiS3qVzOu3EqnJFUBoqdlEu97J0rOPdWkyNGBM4CjkFYW1cI/nLPozd1Ll4UCW874ktS/z9GlRiqEdbQD9OwsxdRx7ZVyxaZxER/Zv/ZZl166PgszWjlo8R54Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEYPR06MB6182.apcprd06.prod.outlook.com (2603:1096:101:df::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.17; Thu, 22 Aug 2024 12:46:47 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 12:46:47 +0000
Message-ID: <e9a73895-aade-43bc-9a9f-d29b390ee100@vivo.com>
Date: Thu, 22 Aug 2024 20:46:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: jz4780: Use devm_clk_get_enabled() helpers
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 Rong Qianfeng <rongqianfeng@vivo.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240822025258.53263-1-rongqianfeng@vivo.com>
 <20240822025258.53263-3-rongqianfeng@vivo.com>
 <1473866ced990d435f31e541e03d1676aa04b4ae.camel@crapouillou.net>
From: Rong Qianfeng <11065417@vivo.com>
In-Reply-To: <1473866ced990d435f31e541e03d1676aa04b4ae.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY2PR01CA0002.jpnprd01.prod.outlook.com
 (2603:1096:404:a::14) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEYPR06MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: cef4246a-810f-4095-ee42-08dcc2a87c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|81742002;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVRid1VmdUNRc2ZpYkhBVzNQMUdWbUZVVVlHQUlsQnBieVJLeTRpWkM5VUp4?=
 =?utf-8?B?REdhTFdLRTNDZlBrZkxONmVzczd3TWRJM3hGSU5Pc3ozc2VWVVhnYVZnUE5K?=
 =?utf-8?B?c1JTL0NNNFdRRzNPYU1LcForSGJMQXRnVkcxb0lpZUdJei8rZGdOS2xkamky?=
 =?utf-8?B?ZWJHTzkrTzdKOXNPUjA2Z0FHWVloQkdpNm94TC9UTnF5VXNOMW9KeFNySU41?=
 =?utf-8?B?ZTRTbjRoTmJKYm45SWhFU2ttalYyU1RxVy8vNTR6S21WODYyNWlCSVkxdFBU?=
 =?utf-8?B?M0FUOFlGeWdWQmZUMzcrVmRtUVBqaWh5WkZudFdYOFdseTRrYm1zNFBMejNX?=
 =?utf-8?B?NXk5MUN0cTNRNUZCRFdzaGNJcXY4M0NiUUZna0k4RVhqSWZjMkFsMlJ3UTEr?=
 =?utf-8?B?ZmhUZG4wTjRPaGJReTFTc2tjK1Vqc0s1ZXAxZ043SzQ2N0pBbk9RQWVpTE8w?=
 =?utf-8?B?WHM4dDNGNG5oVit6eTVZQXI2ZFVHMnhIS2gzUDVUZmpvK2p3c0ovZ3BtSGNR?=
 =?utf-8?B?QmZ2Q0dYSTgzZjR5a3ltMitSKy9xcjNkUk1LWG1zK00xQmxndWR1ZG9EQ0Nj?=
 =?utf-8?B?TzhjNXoxR0hQUnJRUFVxcmtaZ2wwalJRMlRuQzI0em1UMGhJbm53K2Qwell5?=
 =?utf-8?B?aU03eXBrNTB3ZHNQdG15WmFJV1FEaXFoRmNHSkR5L2xSdkxtc2c5NUlZWSs0?=
 =?utf-8?B?RG8wWXRnL0VtdzFubFdoUmNVZEVPSks1QU9zUlhZdStpRjdBbkFFbTlwbTNQ?=
 =?utf-8?B?VG5Pc01oT0tMQ1NpVGNsam5FWWpFODk4d0dCWWxobEtPWDZtMkFaeUx1KzAz?=
 =?utf-8?B?Zy81aU5YRlZWbVJSdUVadXRiWVE3MlpyUGY1dTRIdVJMUENEbnEray9TY0R1?=
 =?utf-8?B?ODVZbk1ISWFZamVCbXdjSmZzUTFsRXJkSEl5NE52YUhubXFMdjV2ZmdaWFFD?=
 =?utf-8?B?cFJRRDdzM0t2YkJxZlRaU2FVb2pVWHF2V1lhUHNMUTJNeERCOHluK000ZUhW?=
 =?utf-8?B?QkY5cmVYQTVCSDVsUlB6clg3OC9IN0w3UkowQnNmWTZVUUNjM3hZa0d4T2NR?=
 =?utf-8?B?aHprTHhLdjRQUTNFaDVlV3JIUGRZYlZKRjNNTVY5eDNMWXUzWFpPSWxwSzJZ?=
 =?utf-8?B?ZUdON0tDYlZKcFBBdEcwVHBGTGVwdWorTklGcUZ1V2RsWStvSG9SM2pjWlVE?=
 =?utf-8?B?akw1cFpYdHoxczB1WEoxR1Rkei9YVGhldEhOdEpxYUpzcTlCVFk5STVyQks4?=
 =?utf-8?B?cnNuZVYwSDRjdWdvMUZKTnV1VWJOZytpY25IdHpQcExONlhUUzBrbEZjY05K?=
 =?utf-8?B?RjNqbFdndm1vZ0hmWFExSDFmUURHZTdWNnhSaCsvSmdDc05rZlptSkZNa0JM?=
 =?utf-8?B?OEhmUWd2YjdNeS9BcHdpRldKVmZLTFZNWWRFV082bkh3anM5UWo1NnFlNzVo?=
 =?utf-8?B?N3dxeFJVa1FwcTNTQ2VSdFRHTjl5aklRdXo3aUIwRGRkanJ5M3BCUFN4a0Vz?=
 =?utf-8?B?S3pJNWZQZjZObHBZUTlSNTZMNnZKQ2s3cmZsVTFBWXl0RlZvUW0wTVFEM3hl?=
 =?utf-8?B?ZDZkMittR3NoUWRISW1Sa1NPV0ZCVThBanJLWVVzVDlBaDZjUnZ3NmNUNjBP?=
 =?utf-8?B?RFY4a0hsRTdjSlFTR2FYMmZUR2ZLQThlWTZHeWJSRTJwUENCM2o5SjljTW1E?=
 =?utf-8?B?aldTdkZJc2o4eTVJYWd4NFJOdWZ3VktXTFpaTnV1NWhEdGNOVkxJOUZ1aEds?=
 =?utf-8?B?MjhiNjFCL0MrUlI5RU1Jb3BjN3dzQXFtMXd1QmdDVExMZlREMVRlMyttTC90?=
 =?utf-8?B?aG1JL0xtanZpdzdDby91bEtWRnVDeVhPOFRzNWNSU29yd2h4UWZyYmpSQkpQ?=
 =?utf-8?B?WGVBYTRWazY0VVlMNUwrWk9oUDVBaTZqdHNUNXZ3cnBlTXNHMG5rdFVobWVq?=
 =?utf-8?Q?2bdQs4H0CUw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(81742002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXhSVkRTVSsvV2kvTWlDNURjRm9PRVM2ek5LTkgxdm1oWm5vdlRhSlQ5ZmFM?=
 =?utf-8?B?SUZ3S3BkQ1lIQmZqM0NNMVFIWFNTQzAvQ1hiK3pnZmoydDJzYTRweGZ5WUdt?=
 =?utf-8?B?UlA2SnY0czNFKzZYK3E4c3YrcEEyWC9UZzlrZkxQdHlEc0twUTNta1hjek0v?=
 =?utf-8?B?WkV5MzZLNWdpbk9qWkd6bDcydjV1MGJZbmU1WXFQQzM2YjZ6bTJEaXN3ejFu?=
 =?utf-8?B?dlo4OVlsdGQvYXVsTklaUXFUQTJDUStpTVd2QWpCU3BUZHBnTjhhNy9yL0NJ?=
 =?utf-8?B?eXFEMXlXenpOcFF6MHZaU1dJZHowaCtSNVVjcDN3ZUxqSzBOTnI0ZEllMEhq?=
 =?utf-8?B?UEZRYjZocnNxdzRSb0VaUlRjZmJZZEsyd3RMaklyK085b1I5VGk4WFl6Qk13?=
 =?utf-8?B?TnhZa2w0VzJNWExYSWNQZGovZmVJUENkalNKRHFSOHh6MjVmN1kwTVNXUmpr?=
 =?utf-8?B?M0NiR0FFbnc3V0d5cEUyb0hyUVQyOFYwTFNrUFhzaVorb3pHTHM2cFd4ZWZN?=
 =?utf-8?B?dkg0dFhQUzZWUGJkYjBSUFZzam50S3djT0dFcUNjTjNFSnhYeDYxUlhRYm0v?=
 =?utf-8?B?U2J5b1BISTNteGtPak8xeWRUdDdMQzY2ck51Y2FZcGcyV2NYQWxZWDFsK1g0?=
 =?utf-8?B?R3h1MkJQM1VRMTZubmhMZFdtcGZKYTR6WHFldkZmRWord3Y2R2ttM2N6R0Nl?=
 =?utf-8?B?UGltQlVNRlIvc0dZMjZRb280U3E1N3ZndkdNWG9RL29iKzVIcGVWM0tIMTcz?=
 =?utf-8?B?MTVFUGNmalM3TExYWXV3NWpqWXI2QVJSZlNFT2xNRzh6ZXBjK2x0R1RHQi9Q?=
 =?utf-8?B?NElETXI4aTZ0MU1mRFY1czduWDI3U0VkVGpQUFJIUk5FMmMxK3U3SXhvcURn?=
 =?utf-8?B?YWdIQTV0NDFzeWVaREhZRlN3V0RyZjRkUTRacFVXSHRBaUc3MU1EOG1vVkpj?=
 =?utf-8?B?L0hiaDZMUW5ScUlISUlzV2ZpWjV5cC9OWHBKd1h1RWZDZlVpelFpVFpWdytq?=
 =?utf-8?B?UkhxNkdmRWxHY1FaT0N6Uk5HVitwNEI0WVA0TEFZZ3o0emJZNFB2cmxieU1z?=
 =?utf-8?B?alRmcVRsMTVIc1dRN0VjV3BQcUxzekNCcHhuSUZ2VjlaSHQ3VXo4TklPc1ZV?=
 =?utf-8?B?dmdjclJGWlVtc0IyZHBnalJQZU1oaEZkbERuaERSV0Z5WHNaWFpURG0yU3Jx?=
 =?utf-8?B?aGJvUUlGaVgyZTdDaDdudklIbDFKT3UxN2pWc29tRXRJQ1BTbFh2dTdLS1FP?=
 =?utf-8?B?TmJ5R3NPQjd1emFQakZJV3pzN2ExMlowRkdTdW1jcFVoSWtzVUR5MDMzTWRG?=
 =?utf-8?B?WnlCSkpmbkZHRWFzelB0b2s4MG95ZWUremxOVW9uMWtJYmxML2g1Ym9JdSto?=
 =?utf-8?B?c0tKMnJZV3ZSQ2NtNk53S1BVTGtSUVpxVUw0RGlJbXlXOGt3T1RZUFJ2OWZ0?=
 =?utf-8?B?YjZ2Y1RaYlhNU1EzZzlnWVFmWk82eE8zMUNRdGV1cTI0cXFCenBTMGxHekUy?=
 =?utf-8?B?eEsrWDBxazZQZDEwRUtGSkp1Zzc5SEFrYlJsdnVJU1pBSGJnRWJHV1FtOUlu?=
 =?utf-8?B?bTFHRU1iSHl1K0VYTWJOOXQxUWcwRVRPQ3NmRXFERkFCQ2dHbXRIRjd1WW9p?=
 =?utf-8?B?R0tUQjNQUjRjUUUxMEdXTWtLVFpIMlBlbllSbVhwdm5KWVYzVmg3blJpOXE5?=
 =?utf-8?B?L3hYTWRuMU12Y1hRL1JTTm9xbW51THBMTWxJTWNtdmpEZzFHam5OK1FqOGVO?=
 =?utf-8?B?VFdBYk9WY29hUzc1ZDlLZkpTTDJibmsweDVzVzVvb2NlazN1N1Y0OUVpR2ty?=
 =?utf-8?B?cHpISVE4bHpMQVpJa05ucnZpWG4rWjQwWU5Tdk1NOEh4bGg0Nm5Mc1dBWXYy?=
 =?utf-8?B?QWZkRmc2dUxaM3o0T0pXQklWL2VYNlZGWUNGK3RNa0FteDY0RVlxRkJwdFZh?=
 =?utf-8?B?d2VWZlM2eCs2aWRmY2xPL3RYemhRVDZxKzVLVE5qN295c2l6cHdpTHFjRkNn?=
 =?utf-8?B?TE80WkNJbkpjWWdOenZubHNhdTlQRVdWLzg4Qk1mVVNxY0xSeGdQOGt0cDRY?=
 =?utf-8?B?WnpEM0ovQkRZWTdiaGRtLzRPdFN5NEZpSFF5WHhaRThwdmpLdVkzbnI0MzBt?=
 =?utf-8?Q?8CIcqzfe0o+gDbESYr/3wG9JT?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef4246a-810f-4095-ee42-08dcc2a87c19
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 12:46:47.3920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m91xSQmzMHugPf3aDBMuoe6R/GeUpkIjsjAShrZxILabR/QqMR2IO2SAoFjs5hIZjbyqHCnaoSWisdbZbibndw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6182


在 2024/8/22 17:35, Paul Cercueil 写道:
> Hi Rong,
>
> Le jeudi 22 août 2024 à 10:52 +0800, Rong Qianfeng a écrit :
>> The devm_clk_get_enabled() helpers:
>>      - call devm_clk_get()
>>      - call clk_prepare_enable() and register what is needed in order
>> to
>>       call clk_disable_unprepare() when needed, as a managed resource.
>>
>> This simplifies the code and avoids the calls to
>> clk_disable_unprepare().
>>
>> While at it, remove the goto label "err:", and use its return value
>> to
>> return the error code.
>>
>> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
> Acked-by: Paul Cercueil <paul@crapouillou.net>
>
> With a small suggestion below.
>
>> ---
>>   drivers/i2c/busses/i2c-jz4780.c | 21 ++++++---------------
>>   1 file changed, 6 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-jz4780.c
>> b/drivers/i2c/busses/i2c-jz4780.c
>> index 4aafdfab6305..f5362c5dfb50 100644
>> --- a/drivers/i2c/busses/i2c-jz4780.c
>> +++ b/drivers/i2c/busses/i2c-jz4780.c
>> @@ -792,26 +792,22 @@ static int jz4780_i2c_probe(struct
>> platform_device *pdev)
>>   
>>   	platform_set_drvdata(pdev, i2c);
>>   
>> -	i2c->clk = devm_clk_get(&pdev->dev, NULL);
>> +	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>>   	if (IS_ERR(i2c->clk))
>>   		return PTR_ERR(i2c->clk);
>>   
>> -	ret = clk_prepare_enable(i2c->clk);
>> -	if (ret)
>> -		return ret;
>> -
>>   	ret = of_property_read_u32(pdev->dev.of_node, "clock-
>> frequency",
>>   				   &clk_freq);
>>   	if (ret) {
>>   		dev_err(&pdev->dev, "clock-frequency not specified
>> in DT\n");
>> -		goto err;
>> +		return ret;
>>   	}
> Since there is no more special handling needed here, you could just:
> if (ret)
>      return dev_err_probe(&pdev->dev, ret, "clock-frequency...\n");
>
> And the same for the other error handling paths that you changed.
>
> I wouldn't request a V2 just for that though.

Thanks for taking the time Paul,highly appreciated.

Cheers,
-Qianfeng
>
> Cheers,
> -Paul
>
>>   
>>   	i2c->speed = clk_freq / 1000;
>>   	if (i2c->speed == 0) {
>>   		ret = -EINVAL;
>>   		dev_err(&pdev->dev, "clock-frequency minimum is
>> 1000\n");
>> -		goto err;
>> +		return ret;
>>   	}
>>   	jz4780_i2c_set_speed(i2c);
>>   
>> @@ -827,29 +823,24 @@ static int jz4780_i2c_probe(struct
>> platform_device *pdev)
>>   
>>   	ret = platform_get_irq(pdev, 0);
>>   	if (ret < 0)
>> -		goto err;
>> +		return ret;
>>   	i2c->irq = ret;
>>   	ret = devm_request_irq(&pdev->dev, i2c->irq, jz4780_i2c_irq,
>> 0,
>>   			       dev_name(&pdev->dev), i2c);
>>   	if (ret)
>> -		goto err;
>> +		return ret;
>>   
>>   	ret = i2c_add_adapter(&i2c->adap);
>>   	if (ret < 0)
>> -		goto err;
>> +		return ret;
>>   
>>   	return 0;
>> -
>> -err:
>> -	clk_disable_unprepare(i2c->clk);
>> -	return ret;
>>   }
>>   
>>   static void jz4780_i2c_remove(struct platform_device *pdev)
>>   {
>>   	struct jz4780_i2c *i2c = platform_get_drvdata(pdev);
>>   
>> -	clk_disable_unprepare(i2c->clk);
>>   	i2c_del_adapter(&i2c->adap);
>>   }
>>   

