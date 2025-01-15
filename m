Return-Path: <linux-i2c+bounces-9111-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3613A122EE
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 12:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6D7F3ABB2F
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 11:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC3D241685;
	Wed, 15 Jan 2025 11:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O++g3MyA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4901E9907;
	Wed, 15 Jan 2025 11:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736941364; cv=fail; b=DA4wkz9AkRKTIwhi6CQbOtSR2kv3RusWwKHnGFzg5S4IU3OqFQu4uPXiYzBnlYbsYh4ustG/DL3V8a613B+5XdvFbhz6Y1j/1KFbqSdDauQU8H89dQSDNavdkVIk+vLwUiIxJC9qbwsT1yiLs8jbghZkgwy0H5XkFACvj6fxttw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736941364; c=relaxed/simple;
	bh=mWKFKpodZwVJbllTMvuMmtz7pHeMcXI2MXf85ErNvfo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IEbJNLvsG+soZ3wSJLcR+OFEwMOqUZQNTPJNxloU7pU8IxjSBNdpkd/+SttrpRLssqNk63jRGKCx1YlGr4DvEtYm1OND9BSlfOdbJELj3oQZzAN55JTuQBMwC3GMyzKdkuE7hAFLRlt5sWlqFSllYXRsHJyWlIRbPeCUAK6K13k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O++g3MyA; arc=fail smtp.client-ip=40.107.94.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWjgN9DP+5YSVQkED4npVELjCczQlIoG49jZZrGrPlp/EMQHBSe5Xh2elfjZfCaD4BDauoksqwNHFUwTBX8+75F/z7IupQc4fh1DJk0fj1WLRKkfd6NR3aBy8j5UFsVfODhV5k5UTrYUFLcLcJGa49qTmEWDMP+Pf8rIxQ3lqZyTGFVd5CQ651jGFgG0KqFlSMb+PNrpqh5zWP25jdizWlPz/PNVuRMumcAaKCNbGNJm8FkRmXkrU8jxX9edVPjja2etz6RYb2ICWVWESe9O9Qhhp9fojStn4zCwvY9JkNPfPVH+9SbS7hTJTqDyFUlsRCr4Wj5kF715uWce2q4cbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWKFKpodZwVJbllTMvuMmtz7pHeMcXI2MXf85ErNvfo=;
 b=X4WnCKg/DsTm+hN6UxZAaXgEmj8DBXRqO0zMPuFjSRrRarzRq+3tl3RMNEUGL+NVY+SZqZNCM/4fYy7f4prvEPuukzYZEA4zCRvti8ujMzyuH76CQrKyMry+2bsQH/OwL6OeNNO8KFo6Cch3fkZzzz6yFgmEAUTodjT5vpHIFFHcoEyjeyouVyHWIJ5MntOa2QAUKi3kIu8BKNzzlta+W4VO+NDRFveFisDyhLxQ5QG3Z2BUYAkqp4QCgdO3QqUgmgSSOrD3EmhZUzrcDsEuveqJUItTtMTVtMbd9rz9+1aYD0U4dI2ZnCT6c318ccZRU1cQMEy7YwIyZKUBI7qRjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWKFKpodZwVJbllTMvuMmtz7pHeMcXI2MXf85ErNvfo=;
 b=O++g3MyAA2sSb4O56BCbJH0wEVg5gOU8JXjgjPWLAW4NiqHaIRDhhu/eOZeGK6vFvYgdiQrd9WA93Ixe7KIlDL93ChcBEASPwo/LXCoWhr/bF2IlMU6J3NBb5IzQVG2qKzdouf9Nlp898yIDKFLQU5golWYkaoJsWZzL+OJSDC0qj3PpiTEbnukbAjuk+wSNywkTWLAt7HbtBbJ83EGfraaocb75xFgm72qUu+d4iYv6j34JqQzs7LV5g5F+C2fxNeL66W/aUF2RrycRa3+cKTT3gUH5rMo3uUvLVIDoJs0EvMczUj6HtpyjgY0a9JNi0jw4sjKqMcgVXXIHkdcX1A==
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by DS7PR12MB8249.namprd12.prod.outlook.com (2603:10b6:8:ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 11:42:41 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%6]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 11:42:41 +0000
From: Kartik Rajput <kkartik@nvidia.com>
To: "thierry.reding@gmail.com" <thierry.reding@gmail.com>
CC: Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
	Akhil R <akhilrajeev@nvidia.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "digetx@gmail.com"
	<digetx@gmail.com>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5/5] i2c: tegra: Do not configure DMA if not supported
Thread-Topic: [PATCH 5/5] i2c: tegra: Do not configure DMA if not supported
Thread-Index: AQHbYoHjvFupRgl1hk+Oc+lBRqDHTLMXwB2A
Date: Wed, 15 Jan 2025 11:42:40 +0000
Message-ID: <b8f1dcd2ef330bbaf5fe7c17658edc49cc7a7545.camel@nvidia.com>
References: <20250108110620.86900-1-kkartik@nvidia.com>
	 <20250108110620.86900-6-kkartik@nvidia.com>
	 <ty3ctkatywnq6ukrcgkqrzstch2k5qymjfgntnyi23riapytkg@7vzjyszmq3ml>
In-Reply-To: <ty3ctkatywnq6ukrcgkqrzstch2k5qymjfgntnyi23riapytkg@7vzjyszmq3ml>
Reply-To: Kartik Rajput <kkartik@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5716:EE_|DS7PR12MB8249:EE_
x-ms-office365-filtering-correlation-id: b5884ff7-f5f6-4d02-07c7-08dd3559b7e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZGNzVm9RYzlmNjBJcDZ0aE1UVWI5Yk9VaUk1UUFZYnQwSjJKNURWK25xUGQ1?=
 =?utf-8?B?bFZ6ZkpQMDhHSU04U0VLRTRiYzd6NUk3N2NZUFp3NE1yLzVIbGxVemlvSVJE?=
 =?utf-8?B?ZEYzYW9GOW9EcS9vRWgzT29JWmxYZ3NyL3NjSjVJME90cndMeTNLVG45ZThU?=
 =?utf-8?B?enFzcmNPVjZGQ1ZnNXIwNlF5SzZQeTAycHhNWGRIN01LbEVQMXZZNkRBVTRN?=
 =?utf-8?B?SzhxUnRxR2NhaTMwakthU0lHOUZRdzFabDhMbEVkekRKU0Z4WG1FOGNnRkFi?=
 =?utf-8?B?YXp1eWkwanByMnNDeHArZnNrbzlLanBZN01HS3lFeE5rb1l3c2ZOeWVuQWpr?=
 =?utf-8?B?a0d0MHM5SXYyeWRGQTNvQkNSYjdLV3FuNkd3WTdsNUgzVGN3MFJ5Y2JQZDY1?=
 =?utf-8?B?M1JZcFFEZDF1dHFvTFo3Sm1KZ2wrdnBMTWpNaUxLVTExVTM5d0xQVGhmMXBs?=
 =?utf-8?B?aFpnRkIxKytiRWYvV1VJK2xPRHZhVXdxVFM4cXM5UGhhVEl6QW9JSm50VEhw?=
 =?utf-8?B?R1IvNlppN1RKRDFCQTcxMm1TVUtZdWZOTjJGOWtiZnBFQm8vTjhmeEc0RUxw?=
 =?utf-8?B?T2FYSWtpZjNLVHpTeEhZZVZGbnBFRGd6OGs1cnlxalV6TzVQdytqSzZPcCtu?=
 =?utf-8?B?ck5tK3FPOVlSMTNiQnpOb3NDVjJzeWJVK1RYam41aDJXSWRiTkhRSTlOeTlp?=
 =?utf-8?B?VWxkcVVDb1hTaUpvOVhGczBxMFlIUm9lc21TMjVlU2U1cnJweGVmZHZ1QnBL?=
 =?utf-8?B?cTBSK1hGOTBMTDhBdmFHUStIeCs5OHV1dlNIU0pLMTdZUitQQ0xWOTlOOWZa?=
 =?utf-8?B?WmV5OUplUllaN1UvdnhWZGtuTDAvL3V5OWgzM3dpd1k0L0s0ODFiOEFpVmdD?=
 =?utf-8?B?dTZacmo3YWxWVTViRTJQR1lxYWptVmFVU3NmMGNyaUM5aVduaFphTER6ekNO?=
 =?utf-8?B?N2lTaklDRjFabU9Iek4zU0hqNS9LQ3l6L1hBOFZUYmd6MEFjbndWNkwyUW5L?=
 =?utf-8?B?MWVTQUk0c3c2bUgxNlFDdG9MWjBlZ0tQVnhnWExyWlBEdTRoRHhudXQ3WnVz?=
 =?utf-8?B?TzZKNnYvdzRmdzVQbUpvenVSR3JyN09ydFFUMTRQc1ZISUg0Rk5lYVZDdW5i?=
 =?utf-8?B?ZmQ0ZjJsT3lOYVFPdGtpc0xLUkJrYUhVd1NQZ3U0dHp3a2l6T3lNNDl1SnNk?=
 =?utf-8?B?NUU0a2VmZzFJSEpheEl1RWdCL0R3cEszdjVyQ2E0d1pETmFrWm93UEEyeklv?=
 =?utf-8?B?b1kxWk5iT29mVnVRdDJNZHBPV0JoRzd0YXBJUjNoOTNCM1FJRXBEZitwT3Nj?=
 =?utf-8?B?ZXY3RWpqSlMwck1TbmZMeGwrR3ZFSkhPdFVrYlBhTjVwZXdWSUJWMmp0TFhH?=
 =?utf-8?B?V0dVUDZrVEkzSnZKS3dLLzJaK3lYbm1pb1oybGw0UjRCaVpTVURzcXJxWWRK?=
 =?utf-8?B?cThtTmZhWnZwd25DTnJpN01sZTduS3ViWTJEaUxCMlVEd0QvWlhjNU9FOE1I?=
 =?utf-8?B?UldVWFFxbGNlL2xPeHZBUUQ3N2k1dHEwY09pbHh4UUtaT01aa1pSdzk5K2px?=
 =?utf-8?B?d0l2YzU1aGs0MllvSmptRlh2ZzVCOUVTV2hOdWhLUlJwbjBjMnBRemtZOTNB?=
 =?utf-8?B?bXNqbEc1bmVlWkdQSVJmdTIvU1NreXcraFozYWZzQ09ub0dOM0QyVjVJSFlw?=
 =?utf-8?B?dy9Cb1M4aGw5WmxrL09yWGx6Zzc5RWdmYzcwWTU4ZDFHTkhpSG8wdC80SitC?=
 =?utf-8?B?WFNmTktpeWw0S3Jra1pPQmtwRytzbWFtZGw1VDJUamw1cHc0NFNzTFEzT3hs?=
 =?utf-8?B?enpMSUdheHY2WXE3TEZ3UmxvSFhvS0dvL25rVWFLVGZIWVd4YkM3a3JzMjdz?=
 =?utf-8?B?RGd0d0NaMExwc05vSytyZW5WVVFJM1RtQWhtZXBKMEs0TnYvUzFRMUdRQklI?=
 =?utf-8?Q?wuVHtNFl8881gdhQu9ZBDEYSy0tTuC4w?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OHVvUk9DcDI3ZkVNSk51cUcwc0FzTk83OTlBVjArUEhDNWpBSGIycVYyVWlu?=
 =?utf-8?B?MWMzVDFMWnV1N1pvMUJrSko1U0tlNUxGcXNTbjB5b0lsdkcxUUhhY2xaR2Ru?=
 =?utf-8?B?cjNBd2txTXJvTWxLOHBLbERJejZFRnRseEoyMlNWNDVpQW5nVDVvN3c0Mnkx?=
 =?utf-8?B?M3R6WXdkd1ZRaVlHZ2hoY0Q2Yk83ZWN5M29kYlU3S0czV2JjeVhjQ2hQR3gw?=
 =?utf-8?B?dEU5TW9MYnNobllXM2F5elhYQ0sxeGZ2TWNTSzlqVTNBUnBqWjJvNUFlR3Bl?=
 =?utf-8?B?V2NtRHI0d3NlQkNxZm11R09reENkWE1kYUhYVXZTUjluN1hickdrR3BXT0V3?=
 =?utf-8?B?aUFLVnJHVWN3dFZXQjA3RWQwM0RxcnZEcGczaGF5UGE1UnJ5ZXFQZ3JiWnJH?=
 =?utf-8?B?d3RLVDVFelhubDRRVGJBMkpHdW5TQkVwMGU0Z1B2SDduZFZEUndZRmhGUDF4?=
 =?utf-8?B?b1NlNmRzT09UazU5UFRxZ0x3NFJLaTRCc3VrMU5MMWJqY0JxV0VEakF0Skgz?=
 =?utf-8?B?YlFhMjY2eWVtR1FORVhTT0hDOXZ6Z09zY0hjaXF5TFVnVDZWa3VYd0JiREFm?=
 =?utf-8?B?Z0FPZ2MvNlA0Ky94M2VLbjEwTnVBOUVad0Z1dDF5TGcramFnNUdFK1NuRzBn?=
 =?utf-8?B?SSt1aGZ6OHZxV1lSQXpnbm5WOFhwSG1LNHNnRXBQdVJXZjBjVG4vSXdNOGc2?=
 =?utf-8?B?STlBSHkxNFRVUCtmc2VXNC9jV1BJWTdvMGlnejR2VHFKQVZqRjlxaTVldThT?=
 =?utf-8?B?bzgrQXBDQXRabXU3MXc3bS9Dcnd6QVdPT29TcVcrVzJhZHNwMGNnZ0U5UmpL?=
 =?utf-8?B?U3dZUkRCY3oya3diUXoyenhrNGE0VzZOd3BvUTZBejg1K0EyNDRqK3FMWnlC?=
 =?utf-8?B?SVRYM1gvbnFUTHI5YXBMVWx5WnRzTHp4TWhNVHBNcGNSUDhMeWF0L0p5a2lw?=
 =?utf-8?B?VEs0d0YyV2Vvclh6QmFqRlByUG03YWlQTG1vZm9MRzdpZFZNRFo2eVdVdytX?=
 =?utf-8?B?TXdTWExWaXhlQXhJS1V2bkdINktrL0lOYjN0Y003eE55ZFNKdVVXbUh1NkxR?=
 =?utf-8?B?dHJEOFNVanlUZlpwK01YNlVvaGZOWm1HemxObHZpcm1qWnA2a0ZtdDREU0hk?=
 =?utf-8?B?WjBjU2lyMjhOQkhhVFBuUXB2QXlORkw5THNRQkQ5VDZTUE0rYmV3Y1c3Z0E1?=
 =?utf-8?B?SDNlZWFWbThjRk5tcWltYklDQXJrUHJUdlRXcnZPeXVyUW9LS3lZSkRiVVNK?=
 =?utf-8?B?Z3pscGZzb2toQmZQTmQycWJ0UkR3OENnb2pSS2dtTmtjLzBURStFcEp3WXJ4?=
 =?utf-8?B?UkgzOW00ZnE1cy9ydEkxWFQvTVBNN0Ntd3hwWjJKTDB3dkdUZnRVVHFKR1J6?=
 =?utf-8?B?S0pKcEQ4dEFnZHFqUW92M1dpOUJkaVZlRVVCSDZmMUtDRElJNDE0VFVMSTBu?=
 =?utf-8?B?bmd3OGdkRkFMWk5hTzYrWlIreDh1S1E5eVRtT1ZOa0xrcVQrZ0JNaDRVMFlZ?=
 =?utf-8?B?RjJjSzJkT1Q0WVRueFVWR3IzSzE2ZTVJeHJjcnNHTnRPYUhUWklrcjBFRk9Z?=
 =?utf-8?B?QWRISlpVbE15V3d6VXM0UC8xU3R2bG9vS2c2cXZBaG9aaFNqMlYrd2lSWVZW?=
 =?utf-8?B?SXZZdlBiNVZvMzU1M3RXUXhaLzBGbUZMWXYyRkh5MHlYaTd5cVlhQmN5eGhI?=
 =?utf-8?B?YmtyZk1UMGlYbGt1ZUd4Z09PSmRwT2JPUnBreC92OVhlc3FGb1ZCK3pFUW85?=
 =?utf-8?B?dGdwMTkrTE8wUlU5TmFkTWY0aTNSS2doZlo2QjZlZ0FBWWI5dkh1allSZHJr?=
 =?utf-8?B?VE53bmM0cHJyOVRYZ3NWVkZsUnkyL2VkTzFtNEgwd0VJaDZwYWNiMkFaNHB1?=
 =?utf-8?B?NjBuRXFPSDRoN2ROanNaU1hvdGFyQ3ZBVjhyVUN6OGFSdU9xQzZJZlBVaTFH?=
 =?utf-8?B?Y0tGWEorWTVJc3U5RFZWQ3MxQTRMYlBMUmdGMTdkNVF5RHBTN29SM0VTeits?=
 =?utf-8?B?RVhCSXo3dHJlMVhvRmRBbVlFYTBXUURVZkZ3RXVsemdNRmxUd0tpYVNlb3F3?=
 =?utf-8?B?anZiWTlqdHVRdjBFckdnSDdWdWIwNXJsQjNiZG16dEVHRkdsdCtoREIwNmhm?=
 =?utf-8?B?eXBIb3NPbkFKaGtKZ0JBeE8zTjg1eWhDbTRmeVVvQzJEUVRsQ2ppTEIrMGg1?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B7D907D791AFF4A88160FC389B248B0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5884ff7-f5f6-4d02-07c7-08dd3559b7e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 11:42:40.9471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8x/N8kB+HS9LXPFogpPccpsPwZIEVHZxogPoF4cIa2NE1JIhvJCO2x+uV7u4MQibSX/rTBlLz4r/15ad9xo40w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8249

T24gVGh1LCAyMDI1LTAxLTA5IGF0IDExOjMzICswMTAwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToN
Cj4gT24gV2VkLCBKYW4gMDgsIDIwMjUgYXQgMDQ6MzY6MjBQTSArMDUzMCwgS2FydGlrIFJhanB1
dCB3cm90ZToNCj4gPiBPbiBUZWdyYTI2NCwgbm90IGFsbCBJMkMgY29udHJvbGxlcnMgc3VwcG9y
dCBETUEsIHRoaXMgY2F1c2VzDQo+ID4gZmFpbHVyZXMNCj4gPiB3aGVuIGZ1bmN0aW9uIHRlZ3Jh
X2kyY19pbml0X2RtYSgpIGlzIGNhbGxlZC4NCj4gDQo+IFdoYXQgZXhhY3RseSBkb2VzIGl0IG1l
YW4gd2hlbiB5b3Ugc2F5ICJub3QgYWxsIEkyQyBjb250cm9sbGVycw0KPiBzdXBwb3J0DQo+IERN
QSI/IERvIHRoZXkgbm90IGhhdmUgdGhlIG5lY2Vzc2FyeSBpbnRlcmZhY2UgdG8gdGhlIEdQQyBE
TUEgb3IgYXJlDQo+IHRoZXJlIG5vdCBzdWZmaWNpZW50IERNQSBjaGFubmVscyB0byBzdXBwb3J0
IGFsbCBJMkMgY29udHJvbGxlcnM/DQo+IA0KPiBUaGllcnJ5DQoNClRoZXkgZG8gbm90IGhhdmUg
dGhlIG5lY2Nlc3NhcnkgaW50ZXJmYWNlIHRvIHRoZSBHUEMgRE1BLg0K

