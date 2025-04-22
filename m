Return-Path: <linux-i2c+bounces-10518-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF2AA966C1
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 13:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8204919E008C
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 11:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F45826136C;
	Tue, 22 Apr 2025 11:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="BDfZc8Qv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D637238C16;
	Tue, 22 Apr 2025 11:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319641; cv=fail; b=qwQPe8xE05SRBB3vNIUWlODvNM3Cct0goyWuhqDUMgYCfriDBoTLVPln44v617M8iRD8EBgR3HDsEQx2SjwT1y52bvtm6BkAZE2EXYf3lsPA9KE1KIca9sFICai6ivA0eHvEqF/f2DAlrkmQ3HIFYORG9TxyOhoSA9WC6OVX6+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319641; c=relaxed/simple;
	bh=hHAXQVFqPL5FbZmffuFVP71mdE9bSYVMmIFYCSVt5iU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nsYyoWNSepuZZjzXh6PcGKIXYRmMet6CmWpv8BiA1HE95rfL3r1dwqZazaD24Bd/rqSwFLEwAGYa68t2yWed46FrEEW7o1Z2RaX+HL6lj8WY/CL5qsUhErB60cgZ69epYYPkt9YTup13e9SeDtZHMYvMCo0kyfVjGaDxMXB5bwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=BDfZc8Qv; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M80mjL030181;
	Tue, 22 Apr 2025 06:09:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=hHAXQ
	VFqPL5FbZmffuFVP71mdE9bSYVMmIFYCSVt5iU=; b=BDfZc8QvqRd4A/z/ipxYf
	lEetUyLgSuv5sipOjENrfhIk4GL8fph11rFKK0aKuYeYYuyL1W8HeSIDmAwD1juz
	ND9hSdHEILuTtFafj4/LVOSo5hFHRJHWVWysVbAdf0rdcctjAPNjM6WzV9DB3SM1
	1wpHlnuSckqeQeePi/9cEQdA1K+mHJTsYMtYb1dkmYZvhCjsWSpdjHiD7KDeXAPZ
	M4b3aXv9gscFpUM2450jno/6bVcUb2Y+hfg/L9+ZhRFA9kTseOPC8kj4/7e6IG1q
	zKEEMdos+1Gi4AfzbqHQeRoHHC2oxTBKO7K0lGKFq4+Yu3Khe7eZ0wP6jWx4o20R
	g==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazlp17011027.outbound.protection.outlook.com [40.93.14.27])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 464wvh9rf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 06:09:45 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjfZsMECgmgpQc0UUqqrDNaR4IJx2ChHhjY/K6/e0ncnyboz67Q6hB5WErFgp/n964WKLRZs3CHDh9q0QxytJcNQa/mpIY2Wbezg8mjWZNthqb+7nIk93oMmdr31wF18f5/8ZOMMF2yQ0Hv3eEV9T6yPE35t3lOxi5TY097k7wBkvafa5VKtyLGlc7sPETLXYmqWdMMeH4+jxwnOl/QvHejmtEQ54CPj73yfsojwYxxTbZxBjhisB7n/DOo+PWv4zaLqyBlMvMRnS8N3Uec+BN0v9sWpD+NMoGhPtgOnGwGetyDRAAj01CtZPfms1VmXmBLZ2TV7pwlmVeD9emuLmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHAXQVFqPL5FbZmffuFVP71mdE9bSYVMmIFYCSVt5iU=;
 b=TkDaITZiucCGBucrXZz6QxVE72Etnqqh7Sj3KdldbbBO+hv4zoyt462iPhjH/iYw+w9ERYbrNTozJ6pyRfjisrQpXfdPP6vIJQnR0Hr4/wh/CNGoW5cTSoVZqvkiNKdIsBsIoaWZnIMJd9xV++gLw2FCFNrSOWBIKBoaC9+QVgQJM+L/OVzkuRtTRKdsSXzK8KIH/CNOCGHABo99hIsArsvHzHWykTJzIBAadlDw/Mf0QyWJ5hdgjdwr92n6yrdO9iePqwP8+TbIFoxXPwBzFYa/KnO//81So0oOxtjmPGAIuMXTTpywvcIU6YHQrE8RxA8+A+PGryc44Sxdeh6NWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6938.namprd03.prod.outlook.com (2603:10b6:510:16c::9)
 by SA1PR03MB6498.namprd03.prod.outlook.com (2603:10b6:806:1c5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 10:09:40 +0000
Received: from PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446]) by PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 10:09:40 +0000
From: "Encarnacion, Cedric justine" <Cedricjustine.Encarnacion@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Delphine
 CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v3 0/2] Add support for LT3074 low voltage linear
 regulator
Thread-Topic: [PATCH v3 0/2] Add support for LT3074 low voltage linear
 regulator
Thread-Index: AQHbsreFwPubPKdwPkGHRtHLo9U/WLOuG3aAgAFUs9A=
Date: Tue, 22 Apr 2025 10:09:40 +0000
Message-ID:
 <PH0PR03MB69384B9ADED36F0E0EC5C73C8EBB2@PH0PR03MB6938.namprd03.prod.outlook.com>
References: <20250421-upstream-lt3074-v3-0-71636322f9fe@analog.com>
 <a10230ba-1ffd-4dc2-96ce-3aaee2e30015@roeck-us.net>
In-Reply-To: <a10230ba-1ffd-4dc2-96ce-3aaee2e30015@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6938:EE_|SA1PR03MB6498:EE_
x-ms-office365-filtering-correlation-id: 47c92987-6f09-40f6-055a-08dd8185cb75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MldEZGY0NlBRZG8xUTNmeUdvMy9pRWpocHhVcFdlN0Z1WTZhUU1CZzFqNW12?=
 =?utf-8?B?SGRrMkV6RklRcVZrbWYxVU0rbjYzb1hMM3QyL0RnY21TK2twdFlmWG5jUi9O?=
 =?utf-8?B?Rllrc1QraVBsUmNmYWJIM0hTVHlFakRST1lkek9ZSC9MQVo2ODVNek0rU0x3?=
 =?utf-8?B?MDJ2dUJYaHduVVpUWDRscVgrWklwNTZRRXlyZDZFak9WMkluZWI2dlBUWldz?=
 =?utf-8?B?NGxCK2hFVnFEeFhXNjNPUVJsRDV1QmlCS1M4L25VTTM1ZE1ITkJqZ1d1Wits?=
 =?utf-8?B?Tit0Rkx2L202Y1l6YzZNVFo2dWlwQVZwVlRIS2x1RmlHMlI0UmFhQXBhU1ln?=
 =?utf-8?B?aTFwRjB2cGF1R1JPdHRwR3poOUxpSHkvOUViUkJHV1l3TnNtU0NxWk9DN3d5?=
 =?utf-8?B?bzVxcFFld1NxRzBZUWJEV1M3Q0JKTTVUdXVrd2tlTXdwRXF5Y3ZyeUhTME14?=
 =?utf-8?B?SmhPQ2hVcHhyZ29HK3B0eFlzMkkrMGxiOVZYWHRWcEVwaEh0OHdOeUpiT1Zk?=
 =?utf-8?B?QVV2bVgxQnRqNkYvK1JKOWNtaHY5SHBtWUFvOXhzZ1lsZmhMalIzRlJ4SmlG?=
 =?utf-8?B?RjhYVmdsWDZvSTVTRDdVeWhZTEdzZHJxc3Q2bFlKU3Jpczd1RjVPQTRHZzdO?=
 =?utf-8?B?K0c1cVZCZTFEOXIyZkxjY0Y1M1FoSEpiWGdVMFVQR3IxR0JrL3FySG85ZHpM?=
 =?utf-8?B?ZFhKZDVkSUo3MGlSS2dUK24vTEZKSVAvcklIK2gra1I1MTQ5eWpjai9NRXZE?=
 =?utf-8?B?TVozSGxkVndFb2cyNzJ2S3ZZYk5McndteElicDRvNnNabUZzcllLTC9qWU1S?=
 =?utf-8?B?b3hpbDZSNmlaNnNqa0I2NXAzRzJTeElrYnF2TG9ZcXM5MFNnczRySWczQzdv?=
 =?utf-8?B?aVRoL0h2SFF4VTVlZ0J6T1VRa0lTU1FDMjBtOVFmRkx5VkkzL29UQ09SUVo3?=
 =?utf-8?B?WHJ2RHhOQkplZGJUQ3l2Rmo2aldNN2w1T3FPTjRJK1NUdkJRN08ya3NoK0hJ?=
 =?utf-8?B?RFR0VTB0REFNWnFGYlp2TU9ZekNEL2k1WjRrNzl1WVd0ZGNBS3RBcUlmR2JM?=
 =?utf-8?B?aG9PKzM3RktJQWtiQ2xkOWtxbFdpRUp3N1NGbTd5Ky8wS0xqM3BTRDlQYUph?=
 =?utf-8?B?NkFjSGtWRVUxekMxbHA1S3FLNWM3a2dsS3VwM082UXVQaVpDeWk5eWhIbHMz?=
 =?utf-8?B?dmJ2bHdSeWJZMit5K3FUeHdSY1ZvUE1CeEFvYlI2VmE0bXdhd016ZWprSG5x?=
 =?utf-8?B?amtQY0ptd2ZYZUdZYTdBZHUwR0IzTjcxSHRWbUl5Q3UxOFlOa0VhM2drQjVh?=
 =?utf-8?B?UkJHRHFGdmJBVE1vTGM3UDh6djUrSEpHSWNaOExZMGNWREc1bU1TYjNUR0Jk?=
 =?utf-8?B?M2pPMlZhK25NSG90ckk5WVZzZWpVN2k5WVphdUYwRmIxeWZXSi84R3ZxeHNu?=
 =?utf-8?B?cHJ2aEQ2RnY2NVNQZHBFa2xvOVh3TmRZK2xsSUFOS1JqQ0NOSTMrUWpoaFJX?=
 =?utf-8?B?Q25XeitvNFBqdGdYUzljMUdFNS91bWt0V1gwRTFhMVk2eFBPSENwQWcrdWo5?=
 =?utf-8?B?UVlsb05YcWJNekROVXhnRnRVL2F4eXpXZkxBSEE3OGtXWnhPSkZ3TjhuSGg2?=
 =?utf-8?B?YjJGc2hZQjE5TmJTN1c4amxzSWpVbnErRGE3ODhDNktwdkk5K3FRNHBnUFdT?=
 =?utf-8?B?WkFZR0J6eUJpb1BYbVNHVHJZNWFnN2hLQzk3bWJtL3ZkMnVnZG43UWFEVS91?=
 =?utf-8?B?N001Mm5sbXRmMXozZTY3dDFrMmYyZWxmYXRBaXRsRFlRTUJLUUFaSTA0dTc5?=
 =?utf-8?B?SlUrL0g2bXJtZC8yL2xmb2VCbmlRWHNpN2o0dWVsbEUrbmdJUDZsbDF3cjll?=
 =?utf-8?B?alAzbEY4S3pFMEV3aVdlZUJPQ2lCcHRXOVdtL0hFbWdWbSsxaWwxL3kzQnVk?=
 =?utf-8?Q?wNEjMVduFac=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6938.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WEpuWTRTVXJFSDJ1RXVZbWVscTlncXloWUFLaG1FUStKNG9lbXZvblFXU2Zl?=
 =?utf-8?B?QU5LS1hkaHk1K3hHWWF5ZlZnOVVJb0xhUDNEc2xvWXFnRmFTMnlvZC9lSTdJ?=
 =?utf-8?B?Tm1nZ2Q3dzJHd3hHeXRXMGtIVnY2b3FUdmpMK0VFT1JicTFVS21RMyt1eEJS?=
 =?utf-8?B?aElzVmtzT3dZTDBNRmpQcWRQZnFTYzdBVlp6V2YwTlgxUklJSWV6Q05zVWNq?=
 =?utf-8?B?MVpKNHNFOEl3QXZwSVVnWldPODQwN1VWSUQ3M3pUTHYvWFNHNE5IdzFvMlJs?=
 =?utf-8?B?WUhNeXNqY0YzNGZUOTN1dC9DNTdxSXZIVGxzK2RSMTdXQlNhNXFTd2hCSlBV?=
 =?utf-8?B?UW9MQ0pRWi94ek1SKzYxL1NVcDFiSUcyamttSGZpTm84NVRrVXhWUkdVLzdY?=
 =?utf-8?B?Z1pQKzdyZmwyakVrY1JVc1VMUEtaWDFSQkdCUXA2c01XOXpONVdxQ2xJVG41?=
 =?utf-8?B?d3JBS3duaG15UXpEeWdCbXJIT0RvZTE2YmNkeGZaMkRXOW1XaWQ3WDVEQklM?=
 =?utf-8?B?aGdqUm9GMVhVc0J1WGYrSGIxNStWbCtkUlJucGhqbWlReFBTTHhQc0k0a3Mx?=
 =?utf-8?B?bFF1Z3lpWjdSRVhseDk5cWVPRHQwN250czVyejhrb1VQd2JVQ01uYUlMZWgz?=
 =?utf-8?B?UEZHQmJ5dDExSHQxRDEyVGd3eDYvajdGRmNpUzhRRFZnZjQ0QXZRRkJMQ2M3?=
 =?utf-8?B?a2ppUWtpcjdEZEt1ekRSdytRbXFEZUtWWHlrUVFxMUN3OTY5UGpVUEZsdDV2?=
 =?utf-8?B?akZVZ2hqVW1GNXgyamhhY2pFYmgyOWU3OHgvUUxWYmhtZ1E5RUhPT1BOTkRz?=
 =?utf-8?B?K1d2UnBFVm5iaEVndjRXSTBWTmtLeEF3dmtCSTFneGpzQ2xSMFY1MGYvbFRT?=
 =?utf-8?B?T204SHdjaU8zSExnMmhhYmZncmplbHhNZFc0Yk14VG80cE9salhXeUNGUWZS?=
 =?utf-8?B?NlJDMGhtS1NiQ3F6MUNteVVMWkpHdGo3anlsM0lXSWZDNnhrd1BYRnNtZ2hB?=
 =?utf-8?B?bFFka3FhVCtmRzVRMGhmci8zMjRrQUJscER1Q3dhbnArc0NQTXhDNG03OWhD?=
 =?utf-8?B?ejYvQlNpNlp2M285TXZSUE1RT3JLWG5uUVg1WUdXaWNKUHNPb3hMYmgyaERj?=
 =?utf-8?B?cW54MW1aSk9uZmJBSU9EanZMZFRKTFhXZnU3a0F5OXJTZWhUQzlybi9WUWIw?=
 =?utf-8?B?RnFlV1AzOGUyYjFYYUJvckQ3MVQ0UnJrZTVFT2twMkdyZmJJaEk4YzNwSFBQ?=
 =?utf-8?B?TVZ6dHZ3dm5saVFkWGRqUGdDWWpxeDBBK1o0c3pucHpKS2ZReVZucFN1VnlU?=
 =?utf-8?B?UHpDSjV3bU4zUmpBdFcxRDFjblpNc1hVU2hXazRiQUo2NTlDMDBIeG93bUNE?=
 =?utf-8?B?ejhyQ3p0a0VWWGhZL1RYMWw5aW14REdmTmM5WUl0dWE1aXNzdWdtMStKM1No?=
 =?utf-8?B?eERkVHVHaWgxekxkTkYxU2wwc3RLcEdnTlpxeE5PNm1selVDdmN6L2NQdVRB?=
 =?utf-8?B?b3VyWkp6QW9aUkE4WHU0OUMzLzB4YlRiTXhRemFkcWxPeHZCNmFpaE1vaG42?=
 =?utf-8?B?RThKWENJUWNLMDVHbExMcG9OcUFIZm9wTzUyaXg4eG41YzZZK0RNNXZnUVhI?=
 =?utf-8?B?M0JTMk16RktzR0VITWxDZEFPdG05QWI5QzhKZUxsRVpHNk1qQ1VOYm85bmlP?=
 =?utf-8?B?dExnNjFGaTFBTUNKVW5uUnAyYTFKdS9oS0k3RkduSDZlZUhZbXlQcmRyOWY0?=
 =?utf-8?B?bTgxNWF3TlhZbTRsU0dObkVrWjk2L2RScE9ncWh6S2V3L0VUVE4rQmZXMDJN?=
 =?utf-8?B?eUg0cExyN0kwMTNBV3k1T1k4SFJ4RGE3R0t0MklUMVVDMzdZSXNqNzRlUCs0?=
 =?utf-8?B?SlZmaWxkK0hReVM0YnNHM2p4Q0xKVlVVSXdjcVhxVWVobm42UHUwOFNrcTRU?=
 =?utf-8?B?ck9xT2JGaHd1bUZoNUhwSWk4b1hrMExCOUxmS3praENSaHpsTTBwZEFzbjFD?=
 =?utf-8?B?Z2w5eStYd1RJRFh0TERvVkxqSkNNYW5HYTM2aWRYZGpFTXBRU1prNUtsUWpt?=
 =?utf-8?B?YVF2aUZSMmR3Y3dnSmRCYWJJbU5ZTTRYeVdJZ0l3dHdNcFNCdG9PSlJsZEg4?=
 =?utf-8?B?emFLbnI5NnVxdjRNQXJ5Y3RyYTRNempGWHdqMHVYeTB5bXJqaG4zWEwzWVJN?=
 =?utf-8?Q?SPxIRMA3Q9OCBLZaMACppkY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6938.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c92987-6f09-40f6-055a-08dd8185cb75
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 10:09:40.0416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tw+NPvzRlFPsMdq/ZULIeAZ8lUUI+OJF+F9HBD5DnsPIY4j1b82WrWWxDTqOpqDTpkldIjGZzv18u5zr18cN1yp6D/TwqVqhC5urXwvArIC1NkwfAOXa8THUrbdZf4Yo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6498
X-Proofpoint-GUID: YY5yYZMkr5r90N_ojIrXwapDOBABbNSW
X-Proofpoint-ORIG-GUID: YY5yYZMkr5r90N_ojIrXwapDOBABbNSW
X-Authority-Analysis: v=2.4 cv=FPIbx/os c=1 sm=1 tr=0 ts=68076ae9 cx=c_pps a=B/o3nIjBIeux7E2B8s4M4A==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=uherdBYGAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=gAnH3GRIAAAA:8 a=iox4zFpeAAAA:8 a=07d9gI8wAAAA:8 a=cPYzWk29AAAA:8 a=D0LpErylu6cNY1i-q8QA:9 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22 a=e2CUPOnPG4QKp8I52DXD:22
 a=oSR2DF9YFqZEN4IGatwP:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220076

PiBGcm9tOiBHdWVudGVyIFJvZWNrIDxncm9lY2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1
ZW50ZXIgUm9lY2sNCj4gU2VudDogTW9uZGF5LCBBcHJpbCAyMSwgMjAyNSA5OjIzIFBNDQo+IFRv
OiBFbmNhcm5hY2lvbiwgQ2VkcmljIGp1c3RpbmUgPENlZHJpY2p1c3RpbmUuRW5jYXJuYWNpb25A
YW5hbG9nLmNvbT47IFJvYg0KPiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vcg0KPiBEb29sZXkgPGNvbm9yK2R0
QGtlcm5lbC5vcmc+OyBKZWFuIERlbHZhcmUgPGpkZWx2YXJlQHN1c2UuY29tPjsgSm9uYXRoYW4N
Cj4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD47IERlbHBoaW5lIENDIENoaXUgPERlbHBoaW5lX0ND
X0NoaXVAV2l3eW5uLmNvbT4NCj4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gaHdtb25Admdlci5rZXJuZWwub3Jn
OyBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnDQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMC8yXSBBZGQgc3VwcG9ydCBmb3IgTFQzMDc0IGxvdyB2
b2x0YWdlIGxpbmVhciByZWd1bGF0b3INCj4gDQo+IFtFeHRlcm5hbF0NCj4gDQo+IE9uIDQvMjEv
MjUgMDU6MTgsIENlZHJpYyBFbmNhcm5hY2lvbiB3cm90ZToNCj4gPiBJbnRyb2R1Y2UgaGFyZHdh
cmUgbW9uaXRvcmluZyBhbmQgcmVndWxhdG9yIHN1cHBvcnQgZm9yIExUMzA3NC4gVGhlDQo+ID4g
Y29tcG9uZW50IGlzIGFuIHVsdHJhZmFzdCwgdWx0cmFsb3cgbm9pc2UgM0EsIDUuNVYgZHJvcG91
dCBsaW5lYXINCj4gPiByZWd1bGF0b3Igd2l0aCBhIFBNQnVzIHNlcmlhbCBpbnRlcmZhY2UgdGhh
dCBhbGxvd3MgdGVsZW1ldHJ5IGZvcg0KPiA+IGlucHV0L291dHB1dCB2b2x0YWdlLCBvdXRwdXQg
Y3VycmVudCwgYW5kIGRpZSB0ZW1wZXJhdHVyZS4gSXQgaGFzIGENCj4gPiBzaW5nbGUgY2hhbm5l
bCBhbmQgcmVxdWlyZXMgYSBiaWFzIHZvbHRhZ2Ugd2hpY2ggY2FuIGJlIG1vbml0b3JlZCB2aWEN
Cj4gPiBtYW51ZmFjdHVyZXItc3BlY2lmaWMgcmVnaXN0ZXJzLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogQ2VkcmljIEVuY2FybmFjaW9uDQo+ID4gPGNlZHJpY2p1c3RpbmUuZW5jYXJuYWNpb25A
YW5hbG9nLmNvbT4NCj4gPiAtLS0NCj4gPiBDaGFuZ2VzIGluIHYzOg0KPiA+IC0NCj4gPiAgICog
Tm9uLW5lc3RlZCBkdC1iaW5kaW5nIHJlZ3VsYXRvciBzdXBwb3J0Lg0KPiA+ICAgKiBQTUJVU19S
RUdVTEFUT1JfT05FKCJ2b3V0IikgLT4NCj4gUE1CVVNfUkVHVUxBVE9SX09ORSgicmVndWxhdG9y
IikuDQo+ID4gICAgIE5ldyBtYWNybyBuZWVkcyBub2RlLW5hbWUgdG8gYmUgbWF0Y2hlZC4NCj4g
Pg0KPiANCj4gRG9lcyB0aGF0IG1lYW4gd2UgY2FuIChhbmQgbWF5YmUgc2hvdWxkKSBkcm9wIHRo
ZSBuYW1lIHBhcmFtZXRlciBvZiB0aGF0DQo+IG1hY3JvID8NCj4gDQo+IFRoaXMgaXNuJ3QgYWZm
ZWN0aW5nIHRoaXMgcGF0Y2guIElmIG5lZWRlZCBJJ2xsIGRvIHRoYXQgc2VwYXJhdGVseS4NCj4g
SnVzdCBhc2tpbmcuDQoNClRoaXMgaXMgdXNlZCBieSByZWd1bGF0b3JfZGVzYy0+b2ZfbWF0Y2gg
dG8gbWF0Y2ggYSBub2RlIG5hbWUgaW4gZHQuIEJ5DQpkcm9wcGluZyB0aGUgbmFtZSwgZG9lcyB0
aGlzIG1lYW4gdGhlIG9mX21hdGNoIHdvbid0IGJlIGFzc2lnbmVkLCBvcg0Kb2ZfbWF0Y2g9InNv
bWUtZGVmYXVsdC1yZWd1bGF0b3ItbmFtZSI/IEkgZGlkIHNvbWUgdGVzdHMsIGFuZCBpdCBhcHBl
YXJzDQp0aGUgcmVndWxhdG9ycyBkdCBwcm9wZXJ0aWVzIGNhbiBvbmx5IGJlIHBhcnNlZCB3aGVu
IHRoZSBuYW1lIHBhcmFtZXRlcg0KZXhpc3RzLCBhbmQgbmFtZSBwYXJhbWV0ZXIgPT0gbm9kZS1u
YW1lLiBJIGhhdmUgdHJpZWQgc2ltcGx5IHJlbW92aW5nIHRoZQ0Kb2ZfbWF0Y2ggYXNzaWdubWVu
dCBmcm9tIHRoZSByZWd1bGF0b3JfZGVzYyBtYWNybywgYnV0IGl0IGRvZXMgbm90IHdvcmsgaW4N
Cm15IGNhc2UuDQoNCkJlc3QgcmVnYXJkcywNCkNlZHJpYw0KDQo+ID4gLSBMaW5rIHRvIHYyOg0K
PiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjUwMjI1LXVwc3RyZWENCj4gPiBtLWx0MzA3NC12Mi0wLQ0KPiAxOGFkMTBiYTU0MmVAYW5h
bG9nLmNvbV9fOyEhQTNOaThDUzB5MlkhN2pYTkJPcXc3UDZkTm5qWg0KPiA+IFRLckRxZXprdjhC
U2daZjlaRWVPZlR2dmJYRVAzSWZqTDhVQ2R6SVdqQUlNRnktLVVKS3NFX2J6dGRBcnpwWDVqb1p0
MzUNCj4gPiBOc1BmMCQNCj4gPg0KPiA+IENoYW5nZXMgaW4gdjI6DQo+ID4gICAqIFNlcGFyYXRl
ZCBkdC1iaW5kaW5nIGZvciBMVDMwNzQuDQo+ID4gICAqIEFkZGVkIF9fbWF5YmVfdW51c2VkIGF0
dHJpYnV0ZSB0byBvZl9kZXZpY2VfaWQuIFRoaXMgYWRkcmVzc2VzIGtlcm5lbA0KPiA+ICAgICB0
ZXN0IHJvYm90IHdhcm5pbmcuDQo+ID4gICAqIEFkZGVkIGVudHJ5IHRvIE1BSU5UQUlORVJTLg0K
PiA+DQo+ID4gLSBMaW5rIHRvIHYxOg0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19o
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwMTI0LXVwc3RyZWENCj4gPiBtLWx0MzA3NC12
MS0wLQ0KPiA3NjAzZjM0NjQzM2VAYW5hbG9nLmNvbV9fOyEhQTNOaThDUzB5MlkhN2pYTkJPcXc3
UDZkTm5qWg0KPiA+IFRLckRxZXprdjhCU2daZjlaRWVPZlR2dmJYRVAzSWZqTDhVQ2R6SVdqQUlN
RnktLVVKS3NFX2J6dGRBcnpwWDVqb1p0MWgNCj4gPiBRX1Z1ayQNCj4gPg0KPiA+IC0tLQ0KPiA+
IENlZHJpYyBFbmNhcm5hY2lvbiAoMik6DQo+ID4gICAgICAgIGR0LWJpbmRpbmdzOiBod21vbjog
cG1idXM6IGFkZCBsdDMwNzQNCj4gPiAgICAgICAgaHdtb246IChwbWJ1cy9sdDMwNzQpOiBhZGQg
c3VwcG9ydCBmb3IgbHQzMDc0DQo+ID4NCj4gPiAgIC4uLi9iaW5kaW5ncy9od21vbi9wbWJ1cy9h
ZGksbHQzMDc0LnlhbWwgICAgICAgICAgIHwgIDUwICsrKysrKysrKw0KPiA+ICAgRG9jdW1lbnRh
dGlvbi9od21vbi9pbmRleC5yc3QgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiA+ICAg
RG9jdW1lbnRhdGlvbi9od21vbi9sdDMwNzQucnN0ICAgICAgICAgICAgICAgICAgICAgfCAgNzIg
KysrKysrKysrKysrDQo+ID4gICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgOSArKw0KPiA+ICAgZHJpdmVycy9od21vbi9wbWJ1cy9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTggKysrDQo+ID4gICBkcml2ZXJzL2h3bW9uL3Bt
YnVzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQo+ID4gICBkcml2ZXJz
L2h3bW9uL3BtYnVzL2x0MzA3NC5jICAgICAgICAgICAgICAgICAgICAgICB8IDEyMiArKysrKysr
KysrKysrKysrKysrKysNCj4gPiAgIDcgZmlsZXMgY2hhbmdlZCwgMjczIGluc2VydGlvbnMoKykN
Cj4gPiAtLS0NCj4gPiBiYXNlLWNvbW1pdDogODZkMjY0YjY4MzA5ZDlmOTgwNGRiNDA3OTY0MmI5
ODEwNGNhMTVkZg0KPiA+IGNoYW5nZS1pZDogMjAyNTAxMjQtdXBzdHJlYW0tbHQzMDc0LTEyMzM4
NDI0NmUwYg0KPiA+DQo+ID4gQmVzdCByZWdhcmRzLA0KDQo=

