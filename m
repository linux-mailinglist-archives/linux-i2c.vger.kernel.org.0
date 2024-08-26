Return-Path: <linux-i2c+bounces-5781-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 830A595E67D
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 03:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2E69B20D2D
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 01:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35DA79CF;
	Mon, 26 Aug 2024 01:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="mAwP4aAg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2072.outbound.protection.outlook.com [40.107.215.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BE823C9;
	Mon, 26 Aug 2024 01:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724637315; cv=fail; b=fOyIkdY57mJLwHfCbxtafI/CQc3OUEKayBhGJPb8FpUVx/a/lp1oR1K4yCpEr7Tm6FJWm6FJ0ik1grTLePnTQ4rjFERIZy0kyljeDkXg5JjewYDQe4D1JdpwxVvHtY+LZyftJbYhOV/V5fqBukkfyuX3SzwnnJtiqRgeq+HsoN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724637315; c=relaxed/simple;
	bh=dmNJ8V2qlQp/vmqY614YDUJyyTeN6xaNoR3SRkjpcs0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ki5h+xKs85+kKVSgUISnC6y4bqb49cLqRKQ9K7V2SCWozPziD/ioQUfsDIWv1tEDMV0erLiG1MR08V/aXIvwzowRVDAsFRGJxj3FNN4OJnjaJyGEiLWUbrzQ11CV6ERcWrxkiH/tcjFul4MG31kEchjpONQRGF9/8p/3LgzFPME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=mAwP4aAg; arc=fail smtp.client-ip=40.107.215.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ya4v3oV9HAmANlx02Tacop98m3FGvK7appsyz2p50B+qf4UWcIMVvVfDO2gBwViWQEWz8P7SY8++/MvYbDyCjfi+tGeqbUVyhDxXViSl6koy0P555Qmk4sCf55+0geTAbfiqCnz7PrDO0yfXZHCAo671rkwaOUlWOpkA8jaD5M5OxLd+gpewQlStbtpPuAKB+o6JWRomC9YXCSqxh6MapKWgp+d7+PA3BfXmvu/r8XTD84Ac7wQZSEZuE9i2KMgL3Q+f9z/D6YkkOGSlkiUYTC1HmMNnnyn8nCh23e5Xt5ErEeZmKYAhOZURAYirZuXZB1EgnSHsGz4FkQXvBlmOcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+icTO7l4uOv+VLklqU00V9KPhZoOFgWGr7G2EIfjKF4=;
 b=Ucu9kF6TxuGeZdaJL5rLF1PltsXydpqMtfKj5EjfukCrFksoSXD0XVXjdHH+DyVBhtnysM5jb9MegEm3rCiEiI9XdBugHDTv/azQ/QIXBC4pl2INXyh7tyeo07HFZviDqjZpqvYd0Zvrp+U7q2bTyVEsZf5WMOyjkuywjlmPxN+qx6jCnEVhOl0y4CBxCJU8t5cOKqu3oLVk8wx7/lBVm7oyzIsh9/Lsa1DFpc7AmwP9jxXEjke95CTqqABBlpIAUZa02Gdyy8lq3Bj0O0m3Si6KPwaoaUajIjqyampilfOsJncbchfnS0e1Ii46dXXUrKNGezKRKUw6lwqcqA9m7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+icTO7l4uOv+VLklqU00V9KPhZoOFgWGr7G2EIfjKF4=;
 b=mAwP4aAgq3st/mKt0y9ejpWN1RIebhj0olzReZPki6KPtfWs4eEz2BPWKDXma48BQuMx/DUxTtsDLnNarKDGEC1SziWC/iz1OArFUZFgcdeB6Y4UA35zXInu2YwHzYEXO6R+sA49NrLYAczceTlx8QtfGtn2/WYMnSERZuZlaysDm26u/dXb8M5ym9NKHvp/npjAxWMmIjyDBH7BZkuRbucxWMaouJq2Y6LR5Hru5mpQyWdMMibF9LSKfteyBiP6ReK6TBlCdD20LyHva+qtgR8n5YTs17coRg7Cmztula411K8OumejDVcEVCoG/OMqkxuWAV4YAWYj5VmG4xq1dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB6488.apcprd06.prod.outlook.com (2603:1096:101:18a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Mon, 26 Aug
 2024 01:55:08 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 01:55:07 +0000
Message-ID: <7a0f0452-aa0e-4c2b-889e-312720d6f527@vivo.com>
Date: Mon, 26 Aug 2024 09:55:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] i2c: jz4780: Use dev_err_probe()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: biju.das.jz@bp.renesas.com,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 opensource.kernel@vivo.com, Rong Qianfeng <rongqianfeng@vivo.com>
References: <20240823035116.21590-1-rongqianfeng@vivo.com>
 <20240823035116.21590-5-rongqianfeng@vivo.com>
 <ZsisYOLVdVxOxz70@black.fi.intel.com>
From: Rong Qianfeng <11065417@vivo.com>
In-Reply-To: <ZsisYOLVdVxOxz70@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYXPR01CA0059.jpnprd01.prod.outlook.com
 (2603:1096:403:a::29) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEZPR06MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: a9596523-75ab-4b83-b573-08dcc5721c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014|81742002;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmEzdEdiRWpEVk9mQWVZUlcyTTdCdzlwRUcwSHVnU2hQWkEyNWFWYlF5RlM1?=
 =?utf-8?B?ZnhTbENZZEdseWZ5RXN4QmRjOFNpOTNHMHVONktlS2ExajdtdDUxM0RSV2Qy?=
 =?utf-8?B?bHphcTFyWnJjTUdHSHp6NU95KzVINWFLZUJRc1VsUlA5U2VEU1FFcnJ5Ry81?=
 =?utf-8?B?aGhEZ1czUjUvUGg5L1B3cHZZMWtKWFZmSlIzcGt6Q1BnS2NUa1NFM0k2dzFF?=
 =?utf-8?B?M3BVVnMwOFhqTk85bUJ1Mm5ZZTN3dmJhL3lSMnNXMDNydGVaODlJTDBJNmJn?=
 =?utf-8?B?enFyRkJyR0JPOVA3dTZxWkpiWEJ5RFJadSt5MTNFN1h6eHUyWHk3a294ejBE?=
 =?utf-8?B?T0tsSkFYMmxKcmFIMHlQcUxhOGxPQ3p0dC9VTHVRZUFiUlF3eFY4U2ZlUTZ6?=
 =?utf-8?B?VmNlWDNKSUo0VUdDcFJmZlVNQXVMVWNaQUcyb2I5R3BZNFVCbGR3VFM0cUc4?=
 =?utf-8?B?WTQwMkQ4b0c5Z1NMTzV4Q0tRczdNM1R1ZVFzdlUrbGZFQkFpU1lPV1FHWEEw?=
 =?utf-8?B?YkhBeXFMRDlQSko0WFlNckNtcU9icDZ4ekp6amk1NG13WEt0NXZOZTlGODdD?=
 =?utf-8?B?dy8yMEhPMzZzYkcyS0dpMlhQbndCV3RoMlZDNUtxK0htR3RUa2J4dXV3eUVh?=
 =?utf-8?B?Vi9RRmE5SGI3d240Uld4K2d6RVdwbTdBTEZtRDdMaTZsekNWcUJjSkZsKzlt?=
 =?utf-8?B?NEN6anBoSVBTenhvZzNUT0FNdCs3ZVd6K0tWR0hkT2xIWEtvNGNyVWhEUDJ6?=
 =?utf-8?B?VnRpV2ZXZ0NPek1wVjllTmFsVThCa3AwNzcwcHlKRjNMVnhOWllKSkYxY2Jz?=
 =?utf-8?B?MG4zWm1aUm91bXQ3MmJqUjlhVmFKRWtsWkgvdkhHTFQreGZKZUpwazFHSDY4?=
 =?utf-8?B?SER0dlRoVitQWHo3NjRTVW1YMTZLRERzb1JnbVdDcVFzUTRqcHhrNi9ldVda?=
 =?utf-8?B?ME5iMkhWMHZWM0o4eW1sWjVlemo0UDlxTUNyWENZd003NzJmSUJHby95bzhq?=
 =?utf-8?B?bTVwK09IaktUeS9WRkhKbDAvWDBmVXBIRDczWjN6dEZBN1Vsb05jVFd3T2xD?=
 =?utf-8?B?YktMYVg4TVpnWkp2L1AzbkZqREVURTVTQldWNVlMdkNxNWEwV2h2NkY5by9s?=
 =?utf-8?B?MEhvUlNWSEpnN0RyaHUxb3VjZ0ZONjdBQ1RpL0YxZTFRMlFQNUJZTnBKaEVI?=
 =?utf-8?B?b2d6QkdWc1VLMUtMaVo5cmVwT1EvbTMyUFJzNGx0UXlOS0l3bWRKWi9WN1lT?=
 =?utf-8?B?SHlBSzh0K09kSnZtS24yMUZ6S2IxNktzM2JqZ3NiOEpxMXV3K09LNXdLbFdV?=
 =?utf-8?B?UndybFZOc2tqYU43eWpiY0ZlSWlHKzZrTkpoMnN1V2tnT3N4NXJTYndhYUVz?=
 =?utf-8?B?Q0VkVjVWZWVXN0xiSnVOc1BKUkVyekxCbmxjOGdDZmx3VXorZjZRdWpHcGlC?=
 =?utf-8?B?VWxRWjFwNXp2UjgwakV0Q3lVeGpVeVBVQm9zRXBJby80R1RFRFhBV09mUUND?=
 =?utf-8?B?V1ArMDU3c2tDaU1QY01Oa1JjbHpVVmpENWdjUE1JN2tZbCtsbUk0MTFva1Nh?=
 =?utf-8?B?aVRhckIxZDVmN1d3WDNaNkNzc2p2eVJpbCtNWUlNL1RWam4zSVRsenJ3bVA0?=
 =?utf-8?B?UjBHb3ZOTnNSNkYxTCtNa0pnWGhGaVphU1FIUExjSERKSk9tZkZuVGlTNmVq?=
 =?utf-8?B?Q3c3TUNtQ1hzUXRvZ2NISFRhenhDV3hhaWZrVEJaYU96TGFGbWxYMW9XL2dn?=
 =?utf-8?B?RGJNNHJJUlZ2bkh6ZjRIZllNVFZhZ0J2Q1pXNjBNQSs2czFHZzh2aHo0eGhk?=
 =?utf-8?B?UHY4S29aWS9rMkhWVitjQXR2cDFrWGs4SVROTmhpOW1pS1JDZm1hVERFZTU4?=
 =?utf-8?B?djJMdHhUMjFPNUU0a1c5RUxCU0l2NEV0czFsSUhDcUkrdzZOdlEycWU4S3hO?=
 =?utf-8?Q?LVKyrUKHejA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014)(81742002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHJoT2tSOU5HKzlVRTBadlRzbkJCelR5Um80UXJRVmZMWlhmeXFRZmxVUTBk?=
 =?utf-8?B?ejYvaVFEQWYveUE1eU9MN3NuK2svNWd4T0xMV293d1V3a3FmUmV1ZmkrMTlt?=
 =?utf-8?B?TlRjbElmbHB6STlWMC9EYzBTUUZCTm1HSGtlNVh3QmR5VVFMVG1YbkQ0ZjJo?=
 =?utf-8?B?QkN5YlVYbzdUNFluYTMwK3dCc0xpeXlheGJJZEJ5NEdNcDhmVVhZTzdEdDRv?=
 =?utf-8?B?OFl6SVdKOVdFWUFEcERHS1YveC9yN0s3aTBkVitZRGFodHFYc3RiSURYbEF0?=
 =?utf-8?B?RnRNWVBYbEZkK29Rd1c0dE0wdDVHbzB3ektpdUp6Zk01RDVUUTRjS1pveXVK?=
 =?utf-8?B?TUdCVDBLazJLRFRHeWx4M3BPcDgwZitOSHE5VUx0Uk1BdW4veVBRWEF5dWxM?=
 =?utf-8?B?TG83dndiejc5OUlTNEhyZktGanQyaHBrZTZPWnkvVUxqMWQ3aHlWOTVXaHVx?=
 =?utf-8?B?N1dMYlk0a2JFQjRtWStUL3FpeTFjNyt4U3lKNkoyZEhaRmhRejZvTjZBb2ZL?=
 =?utf-8?B?Rys4N1ZzQ3ViSDZPcWV2U2MrQXpycnh3YW5wOWVEWlEreE5rTWxYSlNQQzFI?=
 =?utf-8?B?MUI3K2FMVDlWKzVKeDhhaTFzdUVtUUhpN1BRdjlSeUVOUUdRS29sT0FHOWFx?=
 =?utf-8?B?SWtRRHM5VzVaWjQ1WmZNUjdHL29nZER2QkRZRGFKOEUzK3JSd1p6UlRjOFBR?=
 =?utf-8?B?WHp4NkJ1a011MWhGdlN6NDZiRVE4eWpsVDFpRWk4MVE0NnpLU09PblpOL3pB?=
 =?utf-8?B?QTl3U1lqSHhLNzM0VC9MWGpHUnI4Q2VGWXhnRTRpTGNoTFkxeTlnZUJ1SFBT?=
 =?utf-8?B?Q05IMjIwdHZRTmc2aUJjUlNSdDN4S1ZVWWRJeXEyeWtURVBIOXBhbXlFRGlE?=
 =?utf-8?B?ZEF3UWUxSW1lV2doaVB2UzBMc2k0d0w2b2RtOWM5Y0xvMHNucXdrOTIzT1Bo?=
 =?utf-8?B?SHVNandXV2duZTBLRml1WG5FVytjTW1QY05rZlpjTGJrY3JlZG1HVmlNTTE4?=
 =?utf-8?B?MENMT1h6ZU85ZzRTUmhhNzY2anJDTExWWnJkNUp2ZHJTalorWUFLeHJRc2w5?=
 =?utf-8?B?eWh3YnZLZndpbEZEaEVSR3B4ZUVrbW1TTjEybEw2bHY0emtneWtzelBYTE9R?=
 =?utf-8?B?NjNyVy9IZDFPZEh6UkRBT3hIL00vS1dvYWtmRHVLeGVLeG4rb2xhM3dOT1ZB?=
 =?utf-8?B?VTMrK2hSUUNaSUVWQ2RCQmxaSlZGOWcwc2VoMU1ydlp3YlAxRDBLaXQyOXBL?=
 =?utf-8?B?S0tPZzRUd3dpenJpeUQ2a3FIUmtydWVJU1d3NlhScVJXcmk2dUI1SEtYNmI2?=
 =?utf-8?B?WVJ5dVd2WVFieTBoNHFqNGpMb1YzWkNRUVdkU0Npb0diRFFjNWp3dlg0cTcr?=
 =?utf-8?B?OXNKRW5mTElSem5EclgydHIyT3pIbTFjai9TeEw2dGUzc0JtWGJEdldxTVY5?=
 =?utf-8?B?WktwcTlqUkRZQzBwUmx6eWpOSE4yUlZQcit4ZFR6eFEyNHEvOWI0SW90ZlpQ?=
 =?utf-8?B?Sng4UjRSRnBoeGZCSmdzKzBUS2RXZ2xlMTdnd3A4WGpNeGdhRjhuWmY4TUdk?=
 =?utf-8?B?QWpaaStnQWlRdzVLZ2xTTzVJTzdGM1B4S2x5bmtJMkd6MDhzR3RhQllTN2wz?=
 =?utf-8?B?bDR5bGh4MWpxWUViK2Iyak9kNlZqVTh4ZnNQb2dvVUE0OEE1SU5vWmpoR2E4?=
 =?utf-8?B?ekhCUWMzNFhNeFRFM2x4VXQzQ2UwaWZEMmNaOUlGNWhRRzNUQzI3YVZSWWhj?=
 =?utf-8?B?anJTNkJBOCtpV3V4Ri9paGNpeDN3cXQyS2hDR0V4RGg5K1MzSEFtekxOaVMw?=
 =?utf-8?B?L01VZ3Iyb3oycHVmM3VGS0Jybi9FVWlRam52QXBVdlpSaTg4QUhoR3NyWTNJ?=
 =?utf-8?B?cVVZd0I5SFdjcSt4UVlUMENONEVZNHJHSitlMTloVnpkQ3JvU1hVeVhwQks5?=
 =?utf-8?B?NEtYeG1QMmkwQ2JwNkVvRm4wTUo5WHBuWDVHbER3UEhBZEtvRHRqTzlvWXli?=
 =?utf-8?B?NU5qNndsL3F1aCtRUnVnMGQyenc3YzQ2WitvbGE5NHRrY2RxMzdMYlBqalJW?=
 =?utf-8?B?NFc2WlhQZ2dsZnRvcXVhcDg2bHRUaGovclFVcHJMTnlFRlp1Y1RiTG9RdjZz?=
 =?utf-8?Q?Xs1PEQ/NUtRC1QTJRv2pT5M+Y?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9596523-75ab-4b83-b573-08dcc5721c16
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 01:55:07.0123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1LGbcPty+n8D9FrrtDgYQsU6cRsfDDeKMQBurWU8+fzzQagrA8Ef4xmQZ3ti/0IMCeaSGMOZbJdMa+xTRJDTgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6488


在 2024/8/23 23:36, Andy Shevchenko 写道:
> [Some people who received this message don't often get email from andriy.shevchenko@intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On Fri, Aug 23, 2024 at 11:51:16AM +0800, Rong Qianfeng wrote:
>> No more special handling needed here, so use dev_err_probe()
>> to simplify the code.
> Ah, okay. But see below.
>
> ...
>
>>        ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
>>                                   &clk_freq);
>> -     if (ret) {
>> -             dev_err(&pdev->dev, "clock-frequency not specified in DT\n");
>> -             return ret;
>> -     }
>> +     if (ret)
>> +             return dev_err_probe(&pdev->dev, ret,
>> +                                     "clock-frequency not specified in DT\n");
> Besides converting to the i2c_timings and respective APIs...
>
>>        i2c->speed = clk_freq / 1000;
>> -     if (i2c->speed == 0) {
>> -             ret = -EINVAL;
>> -             dev_err(&pdev->dev, "clock-frequency minimum is 1000\n");
>> -             return ret;
>> -     }
>> +     if (i2c->speed == 0)
>> +             return dev_err_probe(&pdev->dev, -EINVAL,
>> +                                     "clock-frequency minimum is 1000\n");
> ...this makes sense to do with
>
>          struct device *dev = &pdev->dev;
>          ...
>                  return dev_err_probe(dev, ...);
>
> And continue with a patch to replace all those &pdev->dev with dev.

Thanks very much for the detailed comments, I will modify all your 
suggestions in the next version.

Best Regards,
Qianfeng
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

