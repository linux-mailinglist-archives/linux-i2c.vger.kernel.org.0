Return-Path: <linux-i2c+bounces-13844-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA11C1305F
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 06:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32CC74224A0
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 05:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F1C29293D;
	Tue, 28 Oct 2025 05:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JggJ9dy/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012063.outbound.protection.outlook.com [40.107.209.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046F61F418F;
	Tue, 28 Oct 2025 05:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761630469; cv=fail; b=Hlvjk0zVCAp7vctWSnHBhgenV8Y/weTMzXn0s2W88U28R+tRc0yofLqAM6FQBlo6SVbPYgsDCVYjG6JqfhrX9p4r+7j74dHeKq9ctL9Aaz4yK6G4ihgZlSTjwDISUac6y+7oOUdRvgL3bTCMQCkSRp8jHQ5djneaY7/At38w2Jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761630469; c=relaxed/simple;
	bh=VAmRTn3Kgcx6rwzXlrdjdUrChIn+j0Ncg6nJHkQ+75o=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OdnmnkUsjlE/w9iCdIiPirD9EV8VI7fa7C3hDUbUCfdU0+vAlZ8GFHtcT2VqNAwcHkNycn1iAZvKr7RHoyGogzXAzV3DsND5B9i4rE6eXE+uGQpcmFiLWG7YJHchf8Zb4xGwjVe9TiSFrDUPyo6Bi0zp6IMQMpeobm40EAr6Yyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JggJ9dy/; arc=fail smtp.client-ip=40.107.209.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLW7Gs6f2H+p5dYt5jWi1bYonvKZMT6D0z63T1enX0Dc25nRvBqDB9KsJXP01YsotJp/3357ftmxKYegDvp1wbK8IHT+qGiXrmARXg+qroc+M28VUEpD1YU4NhbeMuTNwDDI49VNQWuJt2oacnI7Rj6j25lM2pZ33OuquskoNxwKsiWRk2Er4i0N9Nx4pPVqMo7nvk4/bko9xsnswON0C6QM5E0iJvi1JDQ/Yyo8Q0gQSI+JDizcM9D7SQZMqyFQwyJc4p2rGTqU3f1ISznw9NcZ6MAY1qm2vmxnnvCS/W+gEUwhgbKX2MRGdJQfGBW0rPhs6pMJwYI0cFMOnYlMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cdytUL1RGiV7jI4rMMlo5Yt6wn6fz0jT5EwYFO6i7Y=;
 b=cfkogVTRD7l/gmgeIPDiIOPK5Kok/E4gawXqP8wMgNdkepe6uZSgkMQklMKxf46fy0KhoTsF5mYz7M06+piFhd0i2yulHxNa3o5s8i5sONwb8U7BnCrNfKtgiRrIZXeZAmxrKIOfYyIhOdV2ZIYZvuZjAlu4OTRhT+Lf4d8VTeIiutaqW+YA9PGAaSc/5IAer6oJnnSahEIt5ozKa+TFhbT6fhTVeHAe+Q4i/VWxGjTiwL4cJPszhIg3MoCKUr1vDTmDCw1vJOJ5QjscMcpqeCYW6CxUr84+XNy/aoToanQ/kh7YuvIiW6iiyKW/3oEaG9Ug6rZyDvrdFzciGLQt8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cdytUL1RGiV7jI4rMMlo5Yt6wn6fz0jT5EwYFO6i7Y=;
 b=JggJ9dy/FBn2d72EY7jFChpkBCx935/pECdA3nYBQW8UKnkTuuv1zWd1MNkg3L7mCfnKpA4jovpm8KJC1bHVwQEAXRtOTrIHtvJ2f6U/p7SP1/EzvYw0zozx8Oqi7IdWaRmyzfE6SX2/NufnAR+qyd02xhCS7NAM1xC6JUT8hAPUC7RTsRpEIsXWdL/j9luLX9tFGVCucW5Z4D20pSvrNpaCdJ+M3BC+MxkkyrZ6vif+omFBe9SOHYpOkP6w5M/pOBSwrbpOd87tz4bsgzrpyQrRHYNj8IMququC/PO5yfBau+42cvvGiBKX+KlNVbSiu0kXwixt5Yk+nbkP5730Qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by SA3PR12MB9228.namprd12.prod.outlook.com (2603:10b6:806:39c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 05:47:45 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%3]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 05:47:45 +0000
Message-ID: <b1ad93cb-fee0-4b29-af10-a6668624dfbe@nvidia.com>
Date: Tue, 28 Oct 2025 11:17:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: tegra: Add logic to support different register
 offsets
To: Jon Hunter <jonathanh@nvidia.com>, akhilrajeev@nvidia.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, ldewangan@nvidia.com,
 digetx@gmail.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251001153648.667036-1-kkartik@nvidia.com>
 <20251001153648.667036-2-kkartik@nvidia.com>
 <ab204023-1c45-4c67-9a90-d854da937ee8@nvidia.com>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <ab204023-1c45-4c67-9a90-d854da937ee8@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0110.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2ad::11) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|SA3PR12MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: 6acc3370-5165-403e-b988-08de15e5846d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkNWMmtQVU0xY1djbmZuWlFTS2pXcUdDL1hFNGJjdmRrd0x5clRTbHVXZzRt?=
 =?utf-8?B?dnkvTkhUdHVLNncxV3pSMlBHWTZJK0lORUtmbFZPTkk3OXd5dVJkZ3g0a1pJ?=
 =?utf-8?B?bm5zRmVlUGVOL29SVlVFSGo5MDlCUGdwRFZiSGQzcWhhT3A4NmdFeS9uNXdj?=
 =?utf-8?B?SEp1a0EzSGlOUHFwUDhiTC9EM0RkemxFVGp0R3pHUXZ1VFVuUjZtb1JFeG40?=
 =?utf-8?B?blpNVEVDVjI3V1BTcU5CRmxzMHY2SDJxMTNzY2wwZ1U3SytRY1ltei8wL1N3?=
 =?utf-8?B?V2toNDBla3BTMVZnNnJvWmYvTElqWmQ4NzdDRCtSNWRKcTF6NFFvRHQ1YTQ2?=
 =?utf-8?B?ckdUbDY4Rk9uVU9MVW9FcDFYR1NwdlhJTzJKeVpPWXJXYXFHQmNQWEl4Ti82?=
 =?utf-8?B?MC85QWpuS2VqaUtGUmxtTnZqa3c4WTFLWTFHRmlYZml5c2I1TU9Oam1ZWDNG?=
 =?utf-8?B?STlPK1JoVjJvWUVwL3FIbURBN2Q3NTlrUWdYSXJrc2w3cy9YR3RPUDRnMk96?=
 =?utf-8?B?a1FhQWF0ejdQQTVYUStOaGptaDZwMkVjbk8wTnB1TE9pU1lyMlIrSnNydmF2?=
 =?utf-8?B?RGphNnhZeTNnaU93SXF4VHpoWFBDV0VHYjdmN1pZK3dGVWlPY2tqUFR6RU9O?=
 =?utf-8?B?M0NjSVd4ZkxzNUFkT3BzMFRCcVE4QVdZUkdUUzVtWktvQ2N4a3dqYnJuR0VQ?=
 =?utf-8?B?SHNtOC8rK25zQTJoNGNsaUNDeExzVDlLRkNscFMyZXVpVThnVnUrSXUrazk2?=
 =?utf-8?B?TW5WMkhpeElBOFZjNzhGZ1FjdjVEaDJGcm02ck9La1BxVjhKdkpqWWZwNlZn?=
 =?utf-8?B?R3pWYi93OGdhVmhHS1hxZjBubXNlOThSQktudWhtSnNNazNTYW42cDkzSFcw?=
 =?utf-8?B?VlpBQUxIUy85ek5FWFk4aHNpVldMaTNYMUM1TFhBVmIxcDFyN290Yk4vdDBW?=
 =?utf-8?B?LzFLRHM4VXc0bVBpOEk4elFQUjNiNkhueDYyaDlldzUyQmlIUFVRVFJtb2Y5?=
 =?utf-8?B?ZExJNzA4THBPWmx2M05HVTNObzBWdVJzVGQ4cnZERTQzUEt2bnBJR1I1bWRD?=
 =?utf-8?B?eUVOQTZKNDBjTXRoMjZPN2lBTXMxL1dRaEZaQVNtcm8zYU1QYjEremhKaFpa?=
 =?utf-8?B?dU8vdUYzWUN4ZFBKbFo2RXNBUjdXSFd1eXNIQzl0eVdrZzdkNmp5akdiV1Bo?=
 =?utf-8?B?QnpCNnFaRk41bmx2TXMzaVhENWM3VUpoS09aa1JFZzVld2hMdFJzMGFFN3B3?=
 =?utf-8?B?bVRMM2ZNUkh2SS9mOWRvWTlRZkozVENtOUE2bUlTc3NzdzVGbGZiTDl3R2tO?=
 =?utf-8?B?RzE1ZDdsOTM3QjV6dlhWQTNXWmwxRmpCOTdrQVhTZE1JTStNUmNJbVJzeUdV?=
 =?utf-8?B?TldZUy9hOXhmOTB4OStzR3dtM2hFQ0JwMEFESjdpV0hrVzNtVitmRWlTUlhI?=
 =?utf-8?B?MEl0Z3dZSTlCc3hyUHM5djE5OXg0bHozTVhncTVKdEE3OFZGdURGV2lwLytr?=
 =?utf-8?B?alhqTEhNbThxMXowcjEwRHZJQko3eHF4Vjlla21YTUQ2MVo2RXZ2Z25QRG0z?=
 =?utf-8?B?UjRxaU5WeERNUUZZVm12YmF6enRpUWRQeXFQY3lYTFJJVzg2RXBVYVh6ZTRr?=
 =?utf-8?B?Mlp4Uzl2QzJRT0FPeFVNemRtRGZHWktubmVvZGRka3hQMTBSUzczS1d1UmFl?=
 =?utf-8?B?S0UrODI5RXBmUTlWNHczaERUZWlWbm4yYUEvMWI3M3VvL1p4WTBPZVM3NTRI?=
 =?utf-8?B?VjF2M2s2eW0xanlaWk1RVzlpaXhVOEsxSnFUTWdaRHkyV2hhc3hPN1pWVTBW?=
 =?utf-8?B?eVJkRU42cERlaTVXY1pvRzBHNEhTNkpqVWFWaTl3N2Z6VDRPWUZQaVdqcUZv?=
 =?utf-8?B?cWlCZWpITGs0OFBjOGNsdVRrNGJOc1FWK1VxVlYwc1JjN2JiUTRZZ24rSEla?=
 =?utf-8?B?YVVtTjZQb2ZSb1hmb3JwZzNSYTV0d2ZqY2E5NWkycC9HK090VlFMaFlKTHla?=
 =?utf-8?Q?yTAREGsVxUmBOLKgvXfvJTPIbqJ32Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUM3MkJTWDI2S0I1QkVpb1haelRUSWJTNXB3bzd4c0YwV1BwWEo3UVFwZ1Rr?=
 =?utf-8?B?WGNZTDJvN3FLdlRFbU9INS9YWTJ3ZUpsYTZlbU1GTitGR3BGOVlYL2dlQUg0?=
 =?utf-8?B?cmVFQm02QjFhcjN4RjZzNU1FRjdmU3A1dGtINzFsSEpMb2ppMnZPc0lmOUQv?=
 =?utf-8?B?QkYzSGRwZk1xNWdWUlhpdDhxSUtwM2Q3QUVlTytsN0hsZmNBL3VwaUs2elNu?=
 =?utf-8?B?Z0xUZkdSZzhsUnN6d2lsMjRaRXk3dDkrd1NFNHoxbnUyTTIrR01uZnZYSnNN?=
 =?utf-8?B?TWFETFBQQmJFaHl2SzkrNWx4VVE5SVFiR1p5TUFaL3gvbUdxZWxpcERWM2Z2?=
 =?utf-8?B?ZTdubHR1SmJ0dldHNnpMMU1TVlkvNkY5N0NCd3M1OEZuYzBsSmhWWm1RUjYx?=
 =?utf-8?B?ZHgraW53bXBBNFZnMytqUXpBWmVpblgxTDFLaDR2bks0UVgyTkprMHVEb1gw?=
 =?utf-8?B?MDFzQ01GbDgzNXVuZ092YmdJZ0VtWWN3OVZWaDlqZUpjWWtBTHE5RWQ2TVZN?=
 =?utf-8?B?V3V6UmYvMURNV3J0SkV2Z2tSNW8vb3kzMEFIOXhuZEJuNnNpOFB5bVpsTGZm?=
 =?utf-8?B?ZFBhSUw1S1labGJHTzc3SmJ3MVgrQVkrV1NST2NOdXZkN2NoREV2Ukp5cWEx?=
 =?utf-8?B?djM5MEhQd3g3dU1NT3AvV09LR1k5OGJ6YXl3UlBNN0FlVXpVVklUOUlRcFN3?=
 =?utf-8?B?Y21jdXkzMjV6eUxLRWprNE9NU2IwN255UnR2cXd1emJjOE1MOFFVc29saTNr?=
 =?utf-8?B?U2hacGFWcjN5NExobDZ4RkVnNHl0SjdXOVhEOWlkcFJBQkVOdHVHaUc1d0xx?=
 =?utf-8?B?V01LOE9iR3FEMWx5OWI2ekU0ZVYvUW5KY1JhWkl6eFNXSnRjT2lYd0toSWE4?=
 =?utf-8?B?NWxqMmNHWWpaeEdibXR3c3RxYlZrUFlOL0cyZ3lkK1Z5WXZ4S3A2eFovRjgy?=
 =?utf-8?B?dEwwNER5dEhSMS9CY3FlaTE2aTRvNHpnUlc0YmVMdm5QMHAyb1Q5RHY0c2Ji?=
 =?utf-8?B?MTJpVFJDN0Z6L2JIUXNvSXh2UkJJY01iMlhTUG5iTUhoaU9qN295Q3BTUW1Z?=
 =?utf-8?B?alRydTllN3AvYW1QeldCL3ZGUjhaVnEveDM3d0ZpZjB5TVoxSGx5N2wrOUJL?=
 =?utf-8?B?RG5IcEFjOTM3TTd1dkJjbTBRZVJoc1JFVXlHOGpKdWxOcEptRU1GaG4xc01o?=
 =?utf-8?B?YVEyQWxVcVRKR3VhbmxXLzZlR3RpczVkQTZZSTR0Y0lIQkpyT0EyT0tJQ0VT?=
 =?utf-8?B?LzdNS0t0QmVGMkdjYWd3TmlZdDVPNzFJVFFpbHNSQUYyb1RrNmtPUnFVZ2E5?=
 =?utf-8?B?SENLdWtKdXJmQ3ZRbWM0NkVNNUlJc2Z5K3Z3Q1J0VG9iWFZHdGRoRlpsd2U0?=
 =?utf-8?B?cnNRYXFYMi9CMXZSeFJWdDFsMUtEVGZPUXFwNTNnL1p2aE9WRWhYNDFCRmh3?=
 =?utf-8?B?OWlEZGxVQkdaTDdpTnYxbStYbWtCdUFXb2pBVnBpWnRkdDNscjZLN21VcW84?=
 =?utf-8?B?eTB1V2FpUkVtTXR3d0RoTnloNDd5WldiaS9BSFJ3MzdCSDc2NHFlMXUrSGV1?=
 =?utf-8?B?NzZvQ1R4bW5sOXBXZXV4dUo5M1NTbFh2OUNRbjlpNlppRTMvak8wU0RhVGZ6?=
 =?utf-8?B?eEozZmJ5SXFhK3JLTVdtYi9BMmZ6RnkxV0NlcDZIaklrWEhobWlIRkh1cjg5?=
 =?utf-8?B?WEs4UTNvZHFiVmNpMzZaeWVCOXlxc0xtNUhLM0FuT0JyYlR1RUppemh3bzda?=
 =?utf-8?B?b2VRSFE3UXRvWGhpMXprK01ERGZ6U21hakxuRlF4Q1J5OHNyM0tWZHA2OXRC?=
 =?utf-8?B?ZVBLWGpoZEpVQ281SUQ1YWN0Nmx0RnA0VHYzOG9aOWRGY2M4YkZ3SWxXZ0pF?=
 =?utf-8?B?dWkrWE5QRktaOHI4RlVKS3lXaGNkcTY1NWNlZmxCaVVLWFlvTEV6RHJvT05N?=
 =?utf-8?B?YW1hQkhkbUkzaXFnbkxhWUx2U09kcHIwa2QwWXdlV3dlTUtRcDdmdE5MT2Jv?=
 =?utf-8?B?aXNTZEhlY1VjZmRxd3l5V1R4WU5hd0g3cTBHR3JRZFgyOHVuOU8vYmNBWEpV?=
 =?utf-8?B?L21ReDRHYTJBVHB6b05HZ2FmR0ZOV1NhQUFFeCtCdkZIYlFFa3p1NldLVEdq?=
 =?utf-8?Q?qVIx0mmlho+DJRA1rBTxdZ/xQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acc3370-5165-403e-b988-08de15e5846d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 05:47:45.0037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LyK9QWIweRkMmvtx7bje5fU/4s5yT3H+Gu0HzWlJekQZL2LxnHeNJyn/f8tB4zIbaQI/M3nx3bBUKlNfeYb9jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9228

On 24/10/25 20:43, Jon Hunter wrote:
> 
> On 01/10/2025 16:36, Kartik Rajput wrote:
>> Tegra410 use different offsets for existing I2C registers, update
>> the logic to use appropriate offsets per SoC.
>>
>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 499 ++++++++++++++++++++++-----------
>>   1 file changed, 334 insertions(+), 165 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 038809264526..1e26d67cbd30 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
> 
> ...
> 
>> +static const struct tegra_i2c_regs tegra20_i2c_regs_vi = {
>> +    .cnfg = 0x0c00 + (0x000 << 2),
>> +    .status = 0x0c00 + (0x01c << 2),
>> +    .sl_cnfg = 0x0c00 + (0x020 << 2),
>> +    .sl_addr1 = 0x0c00 + (0x02c << 2),
>> +    .sl_addr2 = 0x0c00 + (0x030 << 2),
>> +    .tlow_sext = 0x0c00 + (0x034 << 2),
>> +    .tx_fifo = 0x0c00 + (0x050 << 2),
>> +    .rx_fifo = 0x0c00 + (0x054 << 2),
>> +    .packet_transfer_status = 0x0c00 + (0x058 << 2),
>> +    .fifo_control = 0x0c00 + (0x05c << 2),
>> +    .fifo_status = 0x0c00 + (0x060 << 2),
>> +    .int_mask = 0x0c00 + (0x064 << 2),
>> +    .int_status = 0x0c00 + (0x068 << 2),
>> +    .clk_divisor = 0x0c00 + (0x06c << 2),
>> +    .bus_clear_cnfg = 0x0c00 + (0x084 << 2),
>> +    .bus_clear_status = 0x0c00 + (0x088 << 2),
>> +    .config_load = 0x0c00 + (0x08c << 2),
>> +    .clken_override = 0x0c00 + (0x090 << 2),
>> +    .interface_timing_0 = 0x0c00 + (0x094 << 2),
>> +    .interface_timing_1 = 0x0c00 + (0x098 << 2),
>> +    .hs_interface_timing_0 = 0x0c00 + (0x09c << 2),
>> +    .hs_interface_timing_1 = 0x0c00 + (0x0a0 << 2),
>> +    .master_reset_cntrl = 0x0c00 + (0x0a8 << 2),
>> +    .mst_fifo_control = 0x0c00 + (0x0b4 << 2),
>> +    .mst_fifo_status = 0x0c00 + (0x0b8 << 2),
>> +    .sw_mutex = 0x0c00 + (0x0ec << 2),
> 
> Why do we define all the above with '<< 2'? Seems odd.
> 
> Jon
> 

Ack. I will update this with the calculated values.

Thanks,
Kartik

