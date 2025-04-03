Return-Path: <linux-i2c+bounces-10098-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15114A7A786
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 18:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B386A188F86C
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 16:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B23250C05;
	Thu,  3 Apr 2025 16:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HZYbW394"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A78250BF7;
	Thu,  3 Apr 2025 16:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696357; cv=fail; b=bamHj6jDOES/FJQ7xIOMrVsqvHgb2pQ4/74WCq3v9UuNyUDcZPgVxUuRjUuqxqEMf2jFIFYj4J0EB8v/cndrtrDnX8/ZCJcERKFvwH0SYjlbIsajftvUAbvnvXETwDAoJq04UhEaP1YP3lo1ngk0N5Oi0IZ9QaLcbwepiYCWHvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696357; c=relaxed/simple;
	bh=yGbSX2N4ExIZoSqCGr7bsDOh61Hme7JlXwRCAyvwyxQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iRSLghdgGUTigGEdIOXycH2mUny/hC4IPbFue/WAyzhHSu5EkPqSe9KD221LRWLGb+vvoAw7YX6s/Ztkf26V3t4p7k8JUTr7syKehFE/zGKfqHomdagqFeit8BqFAk68n7SX6YX2DCqsx+C2jBwRVYISSRM7trvG/xQj1QxVT7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HZYbW394; arc=fail smtp.client-ip=40.107.93.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCZUZD/BWbYMqGxU4hiJs9gQ69VHkphOGwxuWpxIc2GE9TND9QjOJ0blirt7/dnz/7sidrNH8pz0yybtoBGCKieifAV+Owf6S0EIpBMCcm7xPNBDdNZrYl59L9Yi8WDVc2XXSWRszD7/2pPlWibHxU03fi6s0E2A6ReYzCw610yD0i+31+3JsdrB9EpI95vJlvrVhbtyy+V+5BxV81mynl20kArkMGvUrqSUKbOeJDYho0/yQk3bxWj2EMsMRSfX+H6WTLWATA4wpe9bzWszr7Q2ygXDJjTKSaL18KyEArPAVI/THj27+Wcv37D6AEZlPI28NfDF+3Hbjma5eldfWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGbSX2N4ExIZoSqCGr7bsDOh61Hme7JlXwRCAyvwyxQ=;
 b=H8reZnOT2hhFqKd8bzZmmatXFzJeBOnvlPJOj5iPidUWOe7kmvj9XMceSv2Hgp8HHIAmBWhNGcqizcbXyGLtsh5lOsURBUERNgvS9iB679+WbFsIWUa/vzReRabJA2tbF73KwbbWxVywZLYU562+N6JdGO7Q5FbGQdL+jwGAtXY+vc7gNXEUETgfOU+nhKJC15K0cux1o6n1K0MA1kcmwbZYrBHqSQbV0j5CicMuTYmw0z2lZOpFRHUA+mk4Vi3l3oy1fSb4g4nSP5tq/ytNWs/V/rhcxhX1hYMXyq/J3W7gOwPNxD6SeCKr9xhzFHRJEqQAFMAU3SxLefNXMN1Mhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGbSX2N4ExIZoSqCGr7bsDOh61Hme7JlXwRCAyvwyxQ=;
 b=HZYbW394TyEQukkKjyCo7RZNwDS3eWiwfQDfYiZcK+hlDHyzw5n/cxoogsav9YXZaSi8XJ/fMGXTzHcRreTWeIKhUOCOnqY9MkweZmVHK/Yrw9NQXbyFfcNsnS0UlsWDVsUeRB7fLqJbfadoule3hmnF5l4/pqmjvsBkL07Wxdt8YES2BDpmhgjRc4bTa4YHiZDGTKIsUwRtNrhn3D6CBD2GIqDlOPSxAY1xYuzbq/w/xqleWn7xhSEPEyuSVf7t3dBAOD6Fg/j8708xetW3RhPa/85BakvSs/oUK+pm4Ujm+1lfqY/0dSSEJdGGso1McykRb6ryBz2mHO5fbYM0HA==
Received: from PH7PR12MB8178.namprd12.prod.outlook.com (2603:10b6:510:2b3::19)
 by CH2PR12MB4086.namprd12.prod.outlook.com (2603:10b6:610:7c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Thu, 3 Apr
 2025 16:05:51 +0000
Received: from PH7PR12MB8178.namprd12.prod.outlook.com
 ([fe80::77bb:a9fb:c75b:f530]) by PH7PR12MB8178.namprd12.prod.outlook.com
 ([fe80::77bb:a9fb:c75b:f530%7]) with mapi id 15.20.8534.048; Thu, 3 Apr 2025
 16:05:51 +0000
From: Akhil R <akhilrajeev@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>
CC: Laxman Dewangan <ldewangan@nvidia.com>, "digetx@gmail.com"
	<digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] i2c: tegra: check msg length in SMBUS block read
Thread-Topic: [PATCH v2] i2c: tegra: check msg length in SMBUS block read
Thread-Index: AQHbmZsSu5QL/Zn+WkqVduI32ERdILN9hiuAgAAIzUCABpCegIAOESOw
Date: Thu, 3 Apr 2025 16:05:32 +0000
Message-ID:
 <PH7PR12MB8178EA71ED8DA6DF97749375C0AE2@PH7PR12MB8178.namprd12.prod.outlook.com>
References: <20250320132144.34764-1-akhilrajeev@nvidia.com>
 <2rlnnjixgd65u6gbqxfuhzu5humehvjth7iysj23xvuv5fi2ft@i5su6kfrqnt5>
 <PH7PR12MB817882F6F4EEC820E22C092DC0DB2@PH7PR12MB8178.namprd12.prod.outlook.com>
 <cao4thtbeenv6b5rbp5icijr7knp3k25zmzg7u7vdxi62hfyrt@ymchhtpwskke>
In-Reply-To: <cao4thtbeenv6b5rbp5icijr7knp3k25zmzg7u7vdxi62hfyrt@ymchhtpwskke>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8178:EE_|CH2PR12MB4086:EE_
x-ms-office365-filtering-correlation-id: b79b91c0-c71f-44ea-3d9e-08dd72c95c8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z1Q2NnduOEdYckE2TTRvUlhvSG5uNUtJOEo4UnJCWkx1ajlDeFdzY1VQOEt0?=
 =?utf-8?B?bzRya254ZTZQeW0wNmU0N252SzQ1dGcwMWZpd0gxOE9JRkxrendNSjFubk5p?=
 =?utf-8?B?SG9idDc1RGpTby9UZm9pdUtLZFNSb2VtKzk4VExPMlgxTWloT0EyYWxya3BI?=
 =?utf-8?B?YWlzb0E1VXhRWmdWVVIyWnNJRS9EOVBCVzAwYUVSTFBFcmdIdDRaNnNIUWI4?=
 =?utf-8?B?bjQxRWE4QjhYWExzRU55YTNzRnJHblJ0T0pWK2JTV1ZkVjQ3c3U2Rkk3dnVI?=
 =?utf-8?B?OVZWZjk2ZHdpSjVQa2JmdmJnM1pVbWR4cU5JS3NlTlZQdkN5d1lJT2hWNDh4?=
 =?utf-8?B?RTBQOVV0TVBYbG1mZW1mbmhHblRqQktoYjJFUHRsNmJYQitoYU9ON3pERG1P?=
 =?utf-8?B?SWVSQUJtT2FJb0ZIWUxVM2I4MEtKZXBtQzliL2FnWVpTa25EMzJDeWdYNGdh?=
 =?utf-8?B?cnpvSnYwdW5oam9ydXBFR3lNZ0Mzb3RVbzV1aGFmNWpOM3plcEU5dlV6YmJI?=
 =?utf-8?B?b3B0dk44Q2gyVmF1S1IyM2hhWTNTWW1WQmhZWFY1YlVSVzlYZlU3c0J0N013?=
 =?utf-8?B?SGkvSHJnSVJpQzZ6K21USzFpa25VVFZSbVVoMG1oVkNISUw0U1ZEdUI2ejdr?=
 =?utf-8?B?bFR0NDlJZmdhTUczdGxKakFtTmovc0VXVCsrQzVVRXZ1RDVDRHNKYWhCQlU5?=
 =?utf-8?B?OEJFL2o0V3c2KzJIYmZPcWptQjg3aXloeFVYbDdvZTFDYmcrcWdMTFk0d3JI?=
 =?utf-8?B?a3FoSE5xM0pjL0QwVVlOWTh3M055WUd3TFBialBhekZtMGhEQWdvVXMxcXRP?=
 =?utf-8?B?VlRPQ0F0cFNkd2h0UG9QYUVEbGFrNzNKeVY0bmE4M01YR2UvRlg3ZHp2bTBH?=
 =?utf-8?B?c1oxZm5aUlA3em1EdHFCTUw2a1B1WHV3aGRYV1dPYTV1ZHdrdGhJT2NpUVlZ?=
 =?utf-8?B?cW1yZWFseXBnb2NqMlIzbldkdDdDZGlkdXpHdTdPUDB5U0NOeEkrNjh5YTBh?=
 =?utf-8?B?OUdvTDF4bi9WWlRxMldjU1p0eWxFTG05WUVTNVlGZkRTNWZiMHU2VDlhSVcx?=
 =?utf-8?B?REtWSldEaFlxZGF5TTFTSU9VSGg0a2JOaC8ra1FqOE1uS0Z3NUhIbDU5UDdQ?=
 =?utf-8?B?R3J3QVNzRFdUWnRMTEtFaUtlMkdHUnFuNnZVeU0xaG05WGZXNTNHRGVLdHcr?=
 =?utf-8?B?OFJZYk93K2tRdFo5S1VoelpFYVduY0lxc1hnbnFqNXdBejdHM0NVdTBHUlA5?=
 =?utf-8?B?UExEdGxNcGM2c3VXdnVWZ3lJeXJReE9lQUt4V3d6Y3NZZ3QzeGs1ZGtYM0dy?=
 =?utf-8?B?THhJUTM0NnAvT1JwUnRtM0hHVGQ2RVN5UDc4LzZnank0eWZkbXhTdDFvOEdv?=
 =?utf-8?B?b1RrTlpVc3N0M0ZlZFdFWHlVUk9MZjFnSUpqZXpjdEdGK1h5KzhUUS9Da0Ru?=
 =?utf-8?B?KzVHQXBZOW5RTU13WENMNjVBZW44c0MxRTJxbG9QZnV0OVVIeS9WNHFwVjRS?=
 =?utf-8?B?aGtVaDZuUEdOYjByeGpVbVU5T1d3UmlnMStqL0JrUHl2YStVYWhlRHZKQ0p4?=
 =?utf-8?B?WURsdjVGeDhLQW5XL3kyUDlLSmduUEdaaDgrMXFMS0lMclYwSzlJUVJJUmxY?=
 =?utf-8?B?ZU1KSUN0M1VnR0JpSmpvVWRtZjZNaVZJYlhmR1VwSFhGUFF1Mkl5RjJhbFNZ?=
 =?utf-8?B?SGN4V2JBSC84Ym10NGZJOEg2ZlI5bDNWTHovaEdUTktjV0NXNnVWOEtHSUF6?=
 =?utf-8?B?WmtnK0p6VVRGS0p3cWlEamx2N3RwZUlTTEJld1lac3EvOU1oeUtzSEc1T21N?=
 =?utf-8?B?STF4T0w5L1dVYnhQUkFCK05ZRWZ3Qi9mMi9Ua3pqRVREeVBYUXN0TnJYZ3Vk?=
 =?utf-8?B?TXhHTTVHY3ExbEJuQSs4bWZqV2I1T0IyTFAvY0VzS2pOZkZmeWhYeUJmNHk0?=
 =?utf-8?B?OGMreEJmNkVjbE1jdy9CN0tURm5UenRzYk8rTzZWZEdySXVhSFR6SkRQcm9p?=
 =?utf-8?B?aUxiMERqUjRRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8178.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aHQzQ21UM2F0VnRrdDVmc20xTUc4ZkpwR0Qza0RpZVkzdlFpWGJXU2d6MUJh?=
 =?utf-8?B?SXdKRW5wTm1QR2pxdGkrK3hqK3RmT1VKSkZZWUpOeWZPVlltMHpKTUppMmdC?=
 =?utf-8?B?ZkpaampZVGRidnRCbndhcjNhZzFQSHpLcVh3Y3RmRFV1RUFYUU9mUkwweFRF?=
 =?utf-8?B?MlZxeDZ2WWVxZ0V5dyt2ZEpLV2lXbkJpakVnNkJiNWVVbmM2S2JBaldhdzFC?=
 =?utf-8?B?bFJBUjRrOVMvUXlIdWpEMXcxV3QrdUQrcWpDeXo0cll3UHNHaUlRZS9nblZD?=
 =?utf-8?B?NjVRTFJKeThyK1VtTFlHckZuSHJ3L0I3VDNEcHNNU3QzZVBFa0dsa25RRytw?=
 =?utf-8?B?TXZJZWFCM3VoUmZEUFB5NDlaSkRpd1c5dTJKMDZtQkl0QTFWdDNkR00vZUE2?=
 =?utf-8?B?dUpLd0pzbHdVcTFjM2ZYaEozMUhsREhuRURJSDQ0c3BJSmpUd0NIU3NZUnVR?=
 =?utf-8?B?ZjdXS1ZvVHNuZm1aYTU0elNtNXpFQVpEZUtTNWh6YS9QVG9QdGMweTJpZ1Ur?=
 =?utf-8?B?c3h0bUdvQ1RMZDkzRkdKREFGbW9LTVBSRk1CbXlHbXUvOGk1L241Zmd2NG9M?=
 =?utf-8?B?NnJYVTg2YzRoSlZVTG5FQWFyMExyeEJWUEg4Z2t2aGI1WlgrMVJhbWRqZ0Jl?=
 =?utf-8?B?ODI2MkI4dFZER1ZSRDVybXY2WldHbVNBK1RkYnJZYTBRVDdFc2hRK1pGVFFw?=
 =?utf-8?B?Ty9INlllNmdkM2l2RnpOYlFEMVRITVlZOTRsS25mTm9jc09VMGtsNEIyUWo5?=
 =?utf-8?B?RmxxOCs1aFk0UjFkODgzdWE5bm12NzNQQlpJS0k1ajJ3dE84ekMvUDVFYklN?=
 =?utf-8?B?SFFCMjlSdys4TUlxVm9vMDQ1M0tDbTBDT3I5ZDIvY2V4TWlmTlhmSUJ6RUNy?=
 =?utf-8?B?SWRrUE5kanJyVDNSN0lEaFAzaHJhb1FaQmg2T3JwVzZFOXRsc2dWdFhCUnYw?=
 =?utf-8?B?T3kvVllMQ0JpelE0ajkvdWx2bGwxbUdMMXpTakt2ZVZiQXRWaVIvWW5rdVh1?=
 =?utf-8?B?U0ROWEFwUEoxSjl1VDU4alpSVVlZQlNkWWdEbnhQaE5sT0tzRDdtdDFLUUlj?=
 =?utf-8?B?MHZKT0x4SkkzWjdDMW5xcXl3OFBHUmV0OHNnK0I4a1Y1SWZyc3NFNTgxaTVS?=
 =?utf-8?B?NERRTGtqOWxpU083T1FwRUFISHdqQ3FKRUlZQmJEMzBUSGhZcHo4aysyNSsx?=
 =?utf-8?B?NjEvQnluT1RZeEtjdVVKa1JMUGZzQ290NGtWTmNmK2V2TnZHK3hDM3NTUTJM?=
 =?utf-8?B?WVdEcHM4d3VMN0pYK2tjNmIxbnF4WGt0Z21LVW5QRWtLZ3RlSjRqbUhvSGt0?=
 =?utf-8?B?Z2NlVlYvNTNHejRxTVZ3QVBwUmdWUFFjV2NCM00xMWlWcEthd0VxUjNLaTZl?=
 =?utf-8?B?d2RpbEhKUm1ZazMvZ2dJckIwTjBGclJYMlFOdWtDUHRRcWpxam1vOEFYdzZT?=
 =?utf-8?B?ZFViRU92ZTV4VTBPL2pKdlRlenR5YnNMK0JSZDcwNDhQdHdYTzQ3R3MwRUFY?=
 =?utf-8?B?aDMxQXdTRkdIZkQwNkFMdllZV045WGk4MWpkenh4bldVYUlrc2dJdm1ISlJP?=
 =?utf-8?B?azBQVnZUMkJXVVlJamYwUjZWL0JnUGlpa3M3aGxrY3IyTUxkL1Q0Q05BVmZs?=
 =?utf-8?B?ditySDA4WUUvM2NhRENYL204ZUFENjdMZ21sLzZkSHpzeE84cUtaVjNsOUV6?=
 =?utf-8?B?SVJnRXFqVWFOL1dWRFByYUFQRXpiUnA4NGZsbjJ6S0xXbjllalhEdzRZMkdW?=
 =?utf-8?B?ZXl0T3U5VFB3RWhJODUvY0NTeU0vRXNpQkNhQithd29UKzd6RmdsYUZPL05B?=
 =?utf-8?B?WG5IMURXcklWdjYyVDZUY3RMaFdJZFlCWXhSRkUrUitYVVJlWUtnUkhRMi9x?=
 =?utf-8?B?OUpra0wweEF1NUVxRHYvdlBpZVdXaU9JL2xPQ0hJMGhvdDhMeXhqMlNLc3pG?=
 =?utf-8?B?cDJZWnIzTS9ibmpnTzZBeTdvUExmR0pveTh4N0tTbE1WR28zWXRqenhrdXdj?=
 =?utf-8?B?aEh5ZXFpMS9NOWMyQWU3WHVEUjY5SDFIcy9uaTFxdGRiZWtIb2VMWmJJSWR1?=
 =?utf-8?B?S1N3RmNYVVdBOHhUcHpFUkttTEVOYVB2VDIvWGZLZkI4MkxkMGNONCtPMGhx?=
 =?utf-8?Q?ENmMIpxlaUVC/eXDyWLwMDHim?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8178.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b79b91c0-c71f-44ea-3d9e-08dd72c95c8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 16:05:32.3132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0uladTz47WLmio7v5F6vIHFNmdcSKEB8sWEpQkObgpaSk/xxqxu5H9tjyKAoqBC/WYq87KFjB88wwhfRgIBMLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4086

PiBPbiBGcmksIE1hciAyMSwgMjAyNSBhdCAwMTowOTozMlBNICswMDAwLCBBa2hpbCBSIHdyb3Rl
Og0KPiA+ID4gPiBGb3IgU01CVVMgYmxvY2sgcmVhZCwgZG8gbm90IGNvbnRpbnVlIHRvIHJlYWQg
aWYgdGhlIG1lc3NhZ2UgbGVuZ3RoDQo+ID4gPiA+IHBhc3NlZCBmcm9tIHRoZSBkZXZpY2UgaXMg
JzAnIG9yIGdyZWF0ZXIgdGhhbiB0aGUgbWF4aW11bSBhbGxvd2VkIGJ5dGVzLg0KPiA+ID4gPg0K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBa2hpbCBSIDxha2hpbHJhamVldkBudmlkaWEuY29tPg0K
PiA+ID4gPiAtLS0NCj4gPiA+ID4gdjEtPnYyOiBBZGQgY2hlY2sgZm9yIHRoZSBtYXhpbXVtIGRh
dGEgYXMgd2VsbC4NCj4gPiA+ID4NCj4gPiA+ID4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVn
cmEuYyB8IDUgKysrKysNCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykN
Cj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVn
cmEuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYw0KPiA+ID4gPiBpbmRleCA4Nzk3
NmU5OWU2ZDAuLjA0OWI0ZDE1NGMyMyAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy10ZWdyYS5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMt
dGVncmEuYw0KPiA+ID4gPiBAQCAtMTM5NSw2ICsxMzk1LDExIEBAIHN0YXRpYyBpbnQgdGVncmFf
aTJjX3hmZXIoc3RydWN0IGkyY19hZGFwdGVyDQo+ICphZGFwLA0KPiA+ID4gc3RydWN0IGkyY19t
c2cgbXNnc1tdLA0KPiA+ID4gPiAgCQkJcmV0ID0gdGVncmFfaTJjX3hmZXJfbXNnKGkyY19kZXYs
ICZtc2dzW2ldLA0KPiA+ID4gTVNHX0VORF9DT05USU5VRSk7DQo+ID4gPiA+ICAJCQlpZiAocmV0
KQ0KPiA+ID4gPiAgCQkJCWJyZWFrOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJCQkvKiBWYWxpZGF0
ZSBtZXNzYWdlIGxlbmd0aCBiZWZvcmUgcHJvY2VlZGluZyAqLw0KPiA+ID4gPiArCQkJaWYgKG1z
Z3NbaV0uYnVmWzBdID09IDAgfHwgbXNnc1tpXS5idWZbMF0gPg0KPiA+ID4gSTJDX1NNQlVTX0JM
T0NLX01BWCkNCj4gPiA+DQo+ID4gPiBJIHdvbmRlciBpZiB0aGlzIGNhbiBldmVyIGhhcHBlbi4g
TG9va2luZyBhdCB0aGUgaW1wbGVtZW50YXRpb24gb2YgdGhlDQo+ID4gPiBpMmNfc21idXNfe3Jl
YWQsd3JpdGV9X2kyY19ibG9ja19kYXRhKCkgZnVuY3Rpb25zLCB0aGV5IGFscmVhZHkgY2FwIHRo
ZQ0KPiA+ID4gbGVuZ3RoIGF0IEkyQ19TTUJVU19CTE9DS19NQVguDQo+ID4gPg0KPiA+ID4gSSBz
dXBwb3NlIHNvbWUgdXNlciBjb3VsZCBiZSBleHBsaWNpdGx5IHNlbmRpbmcgb2ZmIG1lc3NhZ2Vz
IHdpdGggYmFkDQo+ID4gPiBsZW5ndGhzLCBidXQgd291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIHJl
dHVybiBhbiBlcnJvciBpbiB0aGF0IGNhc2UNCj4gPiA+IGluc3RlYWQgb2YganVzdCBhYm9ydGlu
ZyBzaWxlbnRseT8NCj4gPg0KPiA+IEZvciBTTUJVUyByZWFkLCBpZiBJIHVuZGVyc3Rvb2QgaXQg
Y29ycmVjdGx5LCB0aGUgY2hlY2sgaGFwcGVucyBhZnRlciB0aGUgd2hvbGUNCj4gZGF0YQ0KPiA+
IGlzIHJlYWQuIFNvLCBJIGJlbGlldmUgaXQgbWFrZXMgc2Vuc2UgdG8gYWJvcnQgdGhlIG9wZXJh
dGlvbiBiZWZvcmUgYW4gZXJyb25lb3VzDQo+IHJlYWQuDQo+ID4NCj4gPiBJIGhhdmUgbm90IHZl
cmlmaWVkIHRoaXMgdmlvbGF0aW9uLCBidXQgSSB0aGluayB0aGUgZXJyb3IgZm9yDQo+IEkyQ19T
TUJVU19CTE9DS19NQVggd2lsbA0KPiA+IGFsc28gYmUgcHJpbnRlZCBhdCBpMmNfc21idXNfcmVh
ZF9pMmNfYmxvY2tfZGF0YSgpIGZ1bmN0aW9ucyBldmVuIHRob3VnaCB3ZQ0KPiByZXR1cm4NCj4g
PiBzaWxlbnRseSBmcm9tIHRoZSBkcml2ZXIuDQo+ID4NCj4gPiBUaGUgY2hlY2sgZm9yICcwJyBp
cyBub3QgcHJpbnRlZCBhbnl3aGVyZSwgYnV0IGl0IGlzIHByb2JhYmx5LCBva2F5PyBUaGVyZSBp
cyBubw0KPiBkYXRhIHRvDQo+ID4gYmUgcmVhZCBhbnl3YXkuIFBsZWFzZSBsZXQgbWUga25vdyB5
b3VyIHRob3VnaHRzLg0KPiANCj4gSSBkb24ndCBmZWVsIHN0cm9uZ2x5IGVpdGhlciB3YXkuIEkg
dGhpbmsgaXQncyB1bHRpbWF0ZWx5IHVwIHRvIFdvbGZyYW0NCj4gYW5kIEFuZGkgdG8gZGVjaWRl
IGhvdyB0aGV5IHdhbnQgaG9zdCBkcml2ZXJzIHRvIGhhbmRsZSB0aGlzLiBOYcOvdmVseSBJDQo+
IHdvdWxkIHNheSB0aGF0IGl0J3MgYmV0dGVyIGZvciB0aGUgY29yZSB0byBjaGVjayBmb3IgdmFs
aWRpdHksIGlmDQo+IHBvc3NpYmxlLCBhbmQgcmVmdXNlIGludmFsaWQgbWVzc2FnZXMgb3IgdHJh
bnNmZXJzLCBzbyB0aGF0IGhvc3QgZHJpdmVycw0KPiBkb24ndCBoYXZlIHRvIHJlcGVhdCB0aGVz
ZSBjaGVja3MuDQo+IA0KPiBJdCdzIGFsc28gbm90IGNsZWFyIHRvIG1lIGhvdyB0aGlzIHNob3Vs
ZCBiZSBoYW5kbGVkIGlmIG11bHRpcGxlDQo+IG1lc3NhZ2VzIGFyZSBzdWJtaXR0ZWQgYW5kIG9u
ZSBvZiB0aGVtIGVuZHMgdXAgYmVpbmcgaW52YWxpZC4gTXVsdGlwbGUNCj4gbWVzc2FnZXMgaW4g
b25lIG1lYW5zIHRoZXkgYXJlIHByb2JhYmx5IGEgbG9naWNhbGx5IGF0b21pYyBzZXQsIHNvIGFu
eQ0KPiBlcnJvciBzaG91bGQgaW1wYWN0IGFsbCBvZiB0aGVtLg0KPiANCj4gSG93ZXZlciwgdGhl
c2UgYXJlIGFsbCBpc3N1ZXMgdGhhdCBjYW4gYmUgcmVzb2x2ZWQgYXQgYSBsYXRlciBwb2ludCBv
cg0KPiBub3QsIGFuZCB0aGlzIHBhdGNoIGxvb2tzIGNvcnJlY3QgKHdvcnN0IGNhc2UgaXQncyBk
b2luZyB0b28gbXVjaA0KPiBjaGVja2luZyksIHNvOg0KPiANCj4gQWNrZWQtYnk6IFRoaWVycnkg
UmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+DQoNClRoYW5rcywgVGhpZXJyeSwgZm9yIHRoZSBB
Y2suDQoNCkhpIFdvbGZyYW0gYW5kIEFuZGksDQpDb3VsZCB5b3Ugc2hhcmUgeW91ciB0aG91Z2h0
cyBvbiB0aGlzIGNoYW5nZT8gRG9lcyBpdCBsb29rIGdvb2Qgb3IgbmVlZHMgc29tZSB1cGRhdGU/
DQoNClJlZ2FyZHMsDQpBa2hpbA0K

