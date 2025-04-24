Return-Path: <linux-i2c+bounces-10621-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A668DA9B6E3
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 20:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A665C1BA2F04
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 18:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05FE628FFE4;
	Thu, 24 Apr 2025 18:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MIfff0NU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B8A2820DD;
	Thu, 24 Apr 2025 18:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745521146; cv=fail; b=L/NSmqtsGCFFzfRPt/fIFAX06FPnlbYX6C2qGiKV1kNa1axTDnF47uxhCROBIejJp3gua9P7hjsoZvY//LRGihN1ZC1AZuEEtngtqPzHPkyYWJtRFE5FC37xzKArQbO2Bs/0j9XtScJxVGom53OCzEzIvszYEPe7U5k2vd7HloU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745521146; c=relaxed/simple;
	bh=9E6oFTU/CP9unHmHBP85PVJpPZ3eUuoi4W8wcbVvudo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AovNCTNBWIHkElaIrJRCl1lsfqLHCGjbeqUexvoraMy6A9HmwgWR2yjI9+f99qUVwW04USYEWJM8RkatAMWnD53Ax8lCQCe3ulna5EF+gCk52xodZjxJaChwKsfI1YW9wcuEgIr6c01k+Nyp/1ywyvvrAdiBj8LyqyyByM0ZVss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MIfff0NU; arc=fail smtp.client-ip=40.107.237.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7geUhV5sRQZha3mJWlpWLbtGjzF+idqRZGSLFC4MJov27xaxK8I7T1Y1Hf3sXDLRMsImlmNFUwaihd6y0q0nzqvx0RAyO8sKhH4uoXr7raOy1eloNT0WyZEPpBSFwKHkmCnnn53szAByyHfbwyoq9zLzGciWRiX/zQ77aIxITbOoLnwSAjjOlAUN/rIi484CVHM5x7j3bsZOhsawe1Ogh9wb+W2EcYkqmFGLyZ8j+ZKVAAYvvOPjnwbq/CjX1y5LTALKg2FhSjL4KaiceWy1wZGsObUEnAxcVNIiQo4lTtgIuPBUNNXffLOV6YOFenR5BHlvKNGcyfUiVfgxw4zAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eq+4eYz0WkpkfASYv1euieg22fJxOJzdH2OzUAhsMM=;
 b=g+OyNfs7kHwHaiw0VxjU2mwKJBwGJfhxCu++8Uz2Gh9Nw/rmtesR+GbkisQZhkNARei5JGof7UmunLr6J592F2NYF6vCEcO78ij1HW0vN96MmcgW6DMzLry948qDeCQKdgePC60pWMhReLUAOk1jKfdiP6pzg0ygpIn2jLgX/C1KUmyvggTsg7GyPKP2OegL7zm2dkp9s54UFH8ZW7i6OOFL63pWh/L+kzdCy94B+2ZB1I/1JjcOHSe5Mx/cTfHidfeJzE1fXsYCnWCrlJSXGtphfFMc1qOmFhcZ/Bx56epxnaCMQog8Dw3KrlNIKsNIe9tIJEmWIR/y+CkSmHbt3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eq+4eYz0WkpkfASYv1euieg22fJxOJzdH2OzUAhsMM=;
 b=MIfff0NUQGtKlNYO1gdEYXKAIdBWz7hT3rOiFJgSZnCwmlxvsfCtzPekYsboPrl5GqrOvFT4pF1EZDLyJ7GH7LLf5kv70Vzx3b9hBczcKHYEFWBt0//VAReROeu+C1fVvPtS54b0+9Px8PZmHPGuRJQCADcnJj0yU1bNpWKw4Sw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB7201.namprd12.prod.outlook.com (2603:10b6:806:2a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Thu, 24 Apr
 2025 18:59:01 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 18:59:01 +0000
Message-ID: <5b4ca7d6-0771-4f84-9a8b-c850faf7a879@amd.com>
Date: Thu, 24 Apr 2025 13:58:59 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: amd-isp: Add ISP i2c-designware driver
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, andi.shyti@kernel.org,
 mlimonci@amd.com, christophe.jaillet@wanadoo.fr, krzk@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com,
 Venkata Narendra Kumar Gutta <vengutta@amd.com>
References: <20250424184952.1290019-1-pratap.nirujogi@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250424184952.1290019-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0215.namprd04.prod.outlook.com
 (2603:10b6:806:127::10) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SN7PR12MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a5c3c5-83a7-446a-3580-08dd83621363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFBuSElZZDhtT1dRRXNhZEoyYzdEWThJYkNGRG9TOEwwNWtFUUZpWWRJUXVM?=
 =?utf-8?B?M0Flc3VTMVNYOE5XWXNPdDdQRm1BUFZZSVlwR0lQTGcvQXdxTXhmdXpTU3Rk?=
 =?utf-8?B?dzVEeUhnaGFDZFc3cGlOV2o3dDFMcVJDd0FLSEJlVUo0VG5jc29CUjVLcG1L?=
 =?utf-8?B?ejlMdXR3WHl0bGJzZllmSlhhR3NIc2NuOU9IZVplSVdtTXMvbmtKU0hMNjEr?=
 =?utf-8?B?V0dlcGZzTzR2Qm44VzI5WFcza0ROcTU1K0xKRVUwUjFiM1E5ckM3NXFxRkM4?=
 =?utf-8?B?OTJzZHlXd3JzZFM3T2U0SkxuQlB1SkY1QVlwa3BOWjlWaHVLTDhZQTNoS0tj?=
 =?utf-8?B?NVJFMWJpaFpMV2ltNlJidGprUFluZWNzMzJZSXZFaWpPRmpKNUhxaXpjMkNL?=
 =?utf-8?B?QUpvYXZ2d0h5TCtqV3JLYktkWVNMUFl1Z1JzNHRIenAxaFFIYlBadXRqVE9n?=
 =?utf-8?B?SEp1dmRyekljRGxwTzZUUTdTZDI4U3psaWFxN21Rbm53ZmJnYlBKTzN1cEhP?=
 =?utf-8?B?TkxMTE1jOS9BR0RwS1p2OWtpdmNWa3VHMG82TlMra29EZk1tdFlaYUFOZmJk?=
 =?utf-8?B?bVpQWXk5a0FpSVBtQll2Ri9PaHdqK01yTVp5RDN1QmxsdE1IQkdkeThLTmly?=
 =?utf-8?B?djlUY29mS1czSmQxRzdHNWRCWFFReWpTNXgxeEd3WWhYR2ZxWkRPOEhwSTdE?=
 =?utf-8?B?RkJhOEsrNVQyM2lHclQ2K1lldm5yb0dNYWlRZFlteCtrSy9USk5qcUlLSVhq?=
 =?utf-8?B?ZEUzVW5zM2xuWVZSWWpLNVVUN2JaUGh0eng0cEZic0FEbXpGckhPRm15K1Nu?=
 =?utf-8?B?L1Nxc2J0UmNYcy9JRlMyS01zOFUrYXcxMkhGMXpQMm5BSnA5UHl2UHN4WnlD?=
 =?utf-8?B?d0Rkcm16bVpqUFRXb2FSdHdkbWhxMjRBajNmNUJQYi93c2ROVWpqVnNaKzlY?=
 =?utf-8?B?UkFwTjhWczdjQ29pWDJXRkt0cDlpeklwQkVMZzM5bXg0cHhON1I5UXBNRW1j?=
 =?utf-8?B?TVdlS2F0bWphOTc0azdDTHppRmoyci9CRWUzaUxXRllLMU4rOWxVR0VxN0dp?=
 =?utf-8?B?b005U01hckRsdVlsaytoaElYNWxHWWo0aUxiSGU0UVhudXN6bzl0WE16cVdG?=
 =?utf-8?B?bys0VU9GTitaSHMzbUlrbGFwMWh6a3BJN29TU3g1bzN1YmRxdlFUdjNqYTZr?=
 =?utf-8?B?eFhlMDlhdmRiaVZCQi9WNHFkbnUvMWdsTlhjQjV6eDF3NlpHbWpndVhrVlIr?=
 =?utf-8?B?Q0QreGFjd0NTSlU5ME9lZkduTTRBQmV0SjJDclNPOEZ6YnNBWnEwdk83TS94?=
 =?utf-8?B?ZFA0MEhVUWF3NUpKRy9KWW5oeGpsY1ZWOUhFMXRtTzQ1NG14ZVR5c0wyVXBI?=
 =?utf-8?B?czZscllSZTR4c1hkeVk5WWh4M3lGUm0zU0lYc2cyN3M0dEIyWmtVcFErdWZM?=
 =?utf-8?B?cCtsZUdZT0o4TS9WLyt0YS9IZXB3ektRRzVnZWdTckxCQkRyS2EzdksyTk40?=
 =?utf-8?B?ZmJtV05aZC9Gb29uVHpkNlAvQWhTSkpnN0NrSW1ia3VVdmJqVHk0TTVwTTgy?=
 =?utf-8?B?UGFUQjk4K1o0Z05HODVEbnF2MEpOdDNiZjYzTFlMWDhjL2dSSmFhMXdLR2Y3?=
 =?utf-8?B?SmZQQ2JIUGNob3pFRGJpT0g3QjJuZExOVVcrUFhlMUIxN0RSZmZBdjBUQ0lO?=
 =?utf-8?B?QWlValp3QkU5Y1dWRUZrM2dkTUczR285TGpxMytTYjdRMVAwS1JhNUdtM1dG?=
 =?utf-8?B?ZXkwRXA0STQ0dlkxbU5teWN3YlltQUhwcEpLeHk5Z1pQQlpGZmJVai9qbHVu?=
 =?utf-8?B?Zmpqd09kNDNvM3RqUFFnakh6cWpvUmN1bnNPU3BwdXJxTDJWZTBLVzdKcXVN?=
 =?utf-8?B?akNzVXg5cG80MkZJS1lvVGxQZzk4MlVLSUNzenA2L1VIQWdzTFBuam9CWWw1?=
 =?utf-8?Q?hlL5mCjN3Jo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXY2R2Z1ZkNvUnlzeXhOd20wSWNGTy9hRCs5eFZPMFliMmk3Tm03RlRLWVk1?=
 =?utf-8?B?UmVoUFZoUE5mWE1obFpCSW1HY2U4cHIvM3lMYm1jNTJSdU1GbGd1VHRNam9z?=
 =?utf-8?B?TFJYS0JGU0NlUW10dytjT25hMHdPRzZuZUg5QkFvOWxhU25GcHZtelRkK0d3?=
 =?utf-8?B?dytIV21JVmZVTXpaNGJDamJualpHYXNJdFdNLzdqUHJSSWZvbWFLSUZkd3hm?=
 =?utf-8?B?czZha3VBSFdLWDZoL0xQQkcxZkRHSUVYQzRuSXJzR0dhQUFPQWRkZEZDS1Z5?=
 =?utf-8?B?dWRBNmRES1YyK3FKSkZLUEF5YmJvcFlTa3BmUGpOMTE3cFNTK0ZaZFRVdTh3?=
 =?utf-8?B?bnh5L3BNU1FJcnhISUQzMzRBeExoQ2p6bzlJU1JMeHBYM0hhTXREZENReEpq?=
 =?utf-8?B?eEthc045V3YzOFRST2JER0JtQjJDVWlueDUxR0E0dlQzNjl5MUEvWTFoaThn?=
 =?utf-8?B?OXYxRW1iVnpreW5LaEx5R3J3MzJUY3cxdnhOa1hRSWNybmUraEwrRGNTaXcz?=
 =?utf-8?B?NDBtWEowTjU1bzhBMG9DK3Z1SWNJN0x1SU9FcmN4ZStsM3VBTkJaMUhJY1hm?=
 =?utf-8?B?Ync2YU1MSUdCVDRRb0RUdHRBSXBiTzJITkVqd2NMc1RsdUg2cG1UMGlKako0?=
 =?utf-8?B?cXhCMlU3bXBheUR3UW1HRDROaFo2TlBEYWtmUkdKcEhUMGZ2Z2J3TjgzY3RY?=
 =?utf-8?B?SzdqamU0K3ljbU00TE5DNDdGVmNiRkh5eEdCVno3NmxRUzNZT0VHMkwwMng2?=
 =?utf-8?B?TGduYXJQU3ZyMWJXWnczWjBScjlUeWw3a0tTWUdxSndpSGZxRkNtUm00Y1N2?=
 =?utf-8?B?dm5XQlQ2VTQxWlRZUUFiSS9WcEgvZjYyK0JXelE2SHpBZHlKWmRadnFVREhU?=
 =?utf-8?B?Q08zU1ByVGJqR2l0NUh5SEtYYjh4SEdRT2Zhd0xrRFovSDN6N1FWUmRncGNV?=
 =?utf-8?B?OG52SFJ5Q1VYRUFWYjNKQ1oyNFI1TVBNeFlZWHN2SllmQUZuRm9SQTQrdGgw?=
 =?utf-8?B?RlBQWEZOcUlnK2xoTFdBa2RmYXM1akRkWExmQTFSdVVkTStlVkc5KzB2YlQ0?=
 =?utf-8?B?cVZqUS8vekhnUk5NTWxjZDh1NG8zQzFwY2dQazNZNTFJUjZrY0RmZWJwQTl3?=
 =?utf-8?B?OFVSQVBMKzBINkdoWER5UmZiSDVsNXFtZGZtRjcvRU1CWWl1cmkvaS9CaFlk?=
 =?utf-8?B?aEFobjYzaWgweXI2Y1orb2NJVjhwaDd2Sm51ZXlNNWduSFowb0gwV3Flb3VW?=
 =?utf-8?B?L3c1d0M3WEhXRytMYUp6bmpwaXNIUDlyRURTZzZkcXlGTHEvMDFwbGkzNlVh?=
 =?utf-8?B?WWR0K3JTZWlmNXBSTGhUTWxCUEZZSVdmL2YwVmRmWW9zV1hCSFVSN3g3YXEv?=
 =?utf-8?B?dHRtbjZHdHo5SjZXNG0rbW01R3pSSTN1NisvQXZ3QzFKajR4ZnFYUWlxNXZQ?=
 =?utf-8?B?eTd0dUhFT2dEMGZrV0tWUVdmK2l4RXVEYU1uSlYva1hDZGJtTlVVSldKYmRD?=
 =?utf-8?B?YjY4UW1Eb0ZFTlV5WWc5RVJWeEVITWx1TnZiZlYrNHZ3bUVFZ2RLc2RHRUR6?=
 =?utf-8?B?WHZ1NXpwNi9UNkFqMlBMMWpUbmNpMDJTRHVIYklNUnJHSXJWUTk3Z2djZ3dC?=
 =?utf-8?B?YldDTDF2L3RSM0pTM0ZqNzhPY2RpczdwbmVqQUFwZFBtZ3J0UExydHd4YUp6?=
 =?utf-8?B?WWlZb1Z3S2dzaHFlamVjY081aDJic2ZjZk5TK3UyRmlDT1c0MWM2enFTbkFI?=
 =?utf-8?B?a1VTcjg0T0QrWlV4SGFJRm84dFB5RW5WUFZXZjdINWNyWDVrVDZ2L1lpbDRE?=
 =?utf-8?B?NC9oVlJKMmt0YXVmMUV0WjRjOC9nSkdEcFF2a1lKN0FXUzNta3o0c2lUZVVS?=
 =?utf-8?B?cm1GMCtabWxYNjVWM20zTE5VRGFONGtuR1NHb2pLWDR4dmpLNTROUkkrQzVq?=
 =?utf-8?B?b0pvamdnd2VRaGl6YXMxa2gvSjRFeU14TGJDcVlrRWlPSEluamN1Y1Zxb21s?=
 =?utf-8?B?M2NRcjE4RkdxRkFWS0NpbDJVTTEvQjdkL1RKWkdxS3BGRWlDeGQwbmxGbjVm?=
 =?utf-8?B?L3U4eU9kWHEwaXhFOHozTEdtejR5aFF3VmlhMHZJb2l2Y2xuVTNqSG85VTdS?=
 =?utf-8?Q?0pEqF9Xjxii+1Py/S1CG7kMSD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a5c3c5-83a7-446a-3580-08dd83621363
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 18:59:01.3922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifJbcegTFTsq3AefLMaDIwE3xDxaVo7PwAJ3HfTfD1iTaZrYED0RLc6C0i2NePSqZrHicfJc2x6r3Zyf/aLsSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7201

On 4/24/2025 1:49 PM, Pratap Nirujogi wrote:
> The camera sensor is connected via ISP I2C bus in AMD SOC
> architectures. Add new I2C designware driver to support
> new camera sensors on AMD HW.
> 
> Co-developed-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
> Signed-off-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
> Co-developed-by: Bin Du <bin.du@amd.com>
> Signed-off-by: Bin Du <bin.du@amd.com>
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> ---
> Changes v1 -> v2:
> 
> * Remove dependency on exported symbol "isp_power_set()". Use pm_runtime ops to power on/off ISP controller.
> * Remove hardcoding adapter id to 99. Instead switched to use dynamically allocated adapter id.
> * Cleanup header files.
> * Replace subsys_initcall() with default module_init()
> * Update copyright header and license info.
> * Update MAINTAINERS details for i2c-designware-amdisp.c
> * Fix coding errors based on review feedback.

Thanks Pratap, LGTM now.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> 
>   MAINTAINERS                                |   7 +
>   drivers/i2c/busses/Kconfig                 |  10 +
>   drivers/i2c/busses/Makefile                |   1 +
>   drivers/i2c/busses/i2c-designware-amdisp.c | 205 +++++++++++++++++++++
>   4 files changed, 223 insertions(+)
>   create mode 100644 drivers/i2c/busses/i2c-designware-amdisp.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f31aeb6b452e..65b6d985e1ed 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23519,6 +23519,13 @@ L:	linux-i2c@vger.kernel.org
>   S:	Supported
>   F:	drivers/i2c/busses/i2c-designware-*
>   
> +SYNOPSYS DESIGNWARE I2C DRIVER - AMDISP
> +M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
> +M:	Bin Du <bin.du@amd.com>
> +L:	linux-i2c@vger.kernel.org
> +S:	Maintained
> +F:	drivers/i2c/busses/i2c-designware-amdisp.c
> +
>   SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER
>   M:	Jaehoon Chung <jh80.chung@samsung.com>
>   L:	linux-mmc@vger.kernel.org
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 83c88c79afe2..adb2910525b1 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -592,6 +592,16 @@ config I2C_DESIGNWARE_PLATFORM
>   	  This driver can also be built as a module.  If so, the module
>   	  will be called i2c-designware-platform.
>   
> +config I2C_DESIGNWARE_AMDISP
> +	tristate "Synopsys DesignWare Platform for AMDISP"
> +	depends on I2C_DESIGNWARE_CORE
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  AMDISP Synopsys DesignWare I2C adapter.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called amd_isp_i2c_designware.
> +
>   config I2C_DESIGNWARE_AMDPSP
>   	bool "AMD PSP I2C semaphore support"
>   	depends on ACPI
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index c1252e2b779e..04db855fdfd6 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -58,6 +58,7 @@ obj-$(CONFIG_I2C_DESIGNWARE_PLATFORM)			+= i2c-designware-platform.o
>   i2c-designware-platform-y 				:= i2c-designware-platdrv.o
>   i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_AMDPSP)	+= i2c-designware-amdpsp.o
>   i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_BAYTRAIL) += i2c-designware-baytrail.o
> +obj-$(CONFIG_I2C_DESIGNWARE_AMDISP) += i2c-designware-amdisp.o
>   obj-$(CONFIG_I2C_DESIGNWARE_PCI)			+= i2c-designware-pci.o
>   i2c-designware-pci-y					:= i2c-designware-pcidrv.o
>   obj-$(CONFIG_I2C_DIGICOLOR)	+= i2c-digicolor.o
> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/busses/i2c-designware-amdisp.c
> new file mode 100644
> index 000000000000..ad6f08338124
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-designware-amdisp.c
> @@ -0,0 +1,205 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Based on Synopsys DesignWare I2C adapter driver.
> + *
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "i2c-designware-core.h"
> +
> +#define DRV_NAME		"amd_isp_i2c_designware"
> +#define AMD_ISP_I2C_INPUT_CLK	100 /* Mhz */
> +
> +static void amd_isp_dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *i2c_dev)
> +{
> +	pm_runtime_disable(i2c_dev->dev);
> +
> +	if (i2c_dev->shared_with_punit)
> +		pm_runtime_put_noidle(i2c_dev->dev);
> +}
> +
> +static inline u32 amd_isp_dw_i2c_get_clk_rate(struct dw_i2c_dev *i2c_dev)
> +{
> +	return AMD_ISP_I2C_INPUT_CLK * 1000;
> +}
> +
> +static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
> +{
> +	struct dw_i2c_dev *isp_i2c_dev;
> +	struct i2c_adapter *adap;
> +	int ret;
> +
> +	isp_i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*isp_i2c_dev), GFP_KERNEL);
> +	if (!isp_i2c_dev)
> +		return -ENOMEM;
> +	isp_i2c_dev->dev = &pdev->dev;
> +
> +	pdev->dev.init_name = DRV_NAME;
> +
> +	/*
> +	 * Use the polling mode to send/receive the data, because
> +	 * no IRQ connection from ISP I2C
> +	 */
> +	isp_i2c_dev->flags |= ACCESS_POLLING;
> +	platform_set_drvdata(pdev, isp_i2c_dev);
> +
> +	isp_i2c_dev->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(isp_i2c_dev->base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(isp_i2c_dev->base),
> +				     "failed to get IOMEM resource\n");
> +
> +	isp_i2c_dev->get_clk_rate_khz = amd_isp_dw_i2c_get_clk_rate;
> +	ret = i2c_dw_fw_parse_and_configure(isp_i2c_dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to parse i2c dw fwnode and configure\n");
> +
> +	i2c_dw_configure(isp_i2c_dev);
> +
> +	adap = &isp_i2c_dev->adapter;
> +	adap->owner = THIS_MODULE;
> +	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
> +	adap->dev.of_node = pdev->dev.of_node;
> +	/* use dynamically allocated adapter id */
> +	adap->nr = -1;
> +
> +	if (isp_i2c_dev->flags & ACCESS_NO_IRQ_SUSPEND)
> +		dev_pm_set_driver_flags(&pdev->dev,
> +					DPM_FLAG_SMART_PREPARE);
> +	else
> +		dev_pm_set_driver_flags(&pdev->dev,
> +					DPM_FLAG_SMART_PREPARE |
> +					DPM_FLAG_SMART_SUSPEND);
> +
> +	device_enable_async_suspend(&pdev->dev);
> +
> +	if (isp_i2c_dev->shared_with_punit)
> +		pm_runtime_get_noresume(&pdev->dev);
> +
> +	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
> +
> +	ret = i2c_dw_probe(isp_i2c_dev);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "i2c_dw_probe failed\n");
> +		goto error_release_rpm;
> +	}
> +
> +	pm_runtime_put_sync(&pdev->dev);
> +
> +	return 0;
> +
> +error_release_rpm:
> +	amd_isp_dw_i2c_plat_pm_cleanup(isp_i2c_dev);
> +	pm_runtime_put_sync(&pdev->dev);
> +	return ret;
> +}
> +
> +static void amd_isp_dw_i2c_plat_remove(struct platform_device *pdev)
> +{
> +	struct dw_i2c_dev *isp_i2c_dev = platform_get_drvdata(pdev);
> +
> +	pm_runtime_get_sync(&pdev->dev);
> +
> +	i2c_del_adapter(&isp_i2c_dev->adapter);
> +
> +	i2c_dw_disable(isp_i2c_dev);
> +
> +	pm_runtime_put_sync(&pdev->dev);
> +	amd_isp_dw_i2c_plat_pm_cleanup(isp_i2c_dev);
> +}
> +
> +static int amd_isp_dw_i2c_plat_prepare(struct device *dev)
> +{
> +	/*
> +	 * If the ACPI companion device object is present for this device, it
> +	 * may be accessed during suspend and resume of other devices via I2C
> +	 * operation regions, so tell the PM core and middle layers to avoid
> +	 * skipping system suspend/resume callbacks for it in that case.
> +	 */
> +	return !has_acpi_companion(dev);
> +}
> +
> +static int amd_isp_dw_i2c_plat_runtime_suspend(struct device *dev)
> +{
> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> +
> +	if (i_dev->shared_with_punit)
> +		return 0;
> +
> +	i2c_dw_disable(i_dev);
> +	i2c_dw_prepare_clk(i_dev, false);
> +
> +	return 0;
> +}
> +
> +static int amd_isp_dw_i2c_plat_suspend(struct device *dev)
> +{
> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!i_dev)
> +		return -ENODEV;
> +
> +	ret = amd_isp_dw_i2c_plat_runtime_suspend(dev);
> +	if (!ret)
> +		i2c_mark_adapter_suspended(&i_dev->adapter);
> +
> +	return ret;
> +}
> +
> +static int amd_isp_dw_i2c_plat_runtime_resume(struct device *dev)
> +{
> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> +
> +	if (!i_dev)
> +		return -ENODEV;
> +
> +	if (!i_dev->shared_with_punit)
> +		i2c_dw_prepare_clk(i_dev, true);
> +	if (i_dev->init)
> +		i_dev->init(i_dev);
> +
> +	return 0;
> +}
> +
> +static int amd_isp_dw_i2c_plat_resume(struct device *dev)
> +{
> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> +
> +	amd_isp_dw_i2c_plat_runtime_resume(dev);
> +	i2c_mark_adapter_resumed(&i_dev->adapter);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops amd_isp_dw_i2c_dev_pm_ops = {
> +	.prepare = pm_sleep_ptr(amd_isp_dw_i2c_plat_prepare),
> +	LATE_SYSTEM_SLEEP_PM_OPS(amd_isp_dw_i2c_plat_suspend, amd_isp_dw_i2c_plat_resume)
> +	RUNTIME_PM_OPS(amd_isp_dw_i2c_plat_runtime_suspend, amd_isp_dw_i2c_plat_runtime_resume, NULL)
> +};
> +
> +/* Work with hotplug and coldplug */
> +MODULE_ALIAS("platform:amd_isp_i2c_designware");
> +
> +static struct platform_driver amd_isp_dw_i2c_driver = {
> +	.probe = amd_isp_dw_i2c_plat_probe,
> +	.remove = amd_isp_dw_i2c_plat_remove,
> +	.driver		= {
> +		.name	= DRV_NAME,
> +		.pm	= pm_ptr(&amd_isp_dw_i2c_dev_pm_ops),
> +	},
> +};
> +module_platform_driver(amd_isp_dw_i2c_driver);
> +
> +MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter in AMD ISP");
> +MODULE_IMPORT_NS("I2C_DW");
> +MODULE_IMPORT_NS("I2C_DW_COMMON");
> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
> +MODULE_LICENSE("GPL");


