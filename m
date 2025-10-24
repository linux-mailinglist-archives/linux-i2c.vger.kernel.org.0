Return-Path: <linux-i2c+bounces-13792-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E7DC06E21
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 17:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CAED401A90
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 15:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9272E322C99;
	Fri, 24 Oct 2025 15:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b0p/A1Rx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010030.outbound.protection.outlook.com [52.101.201.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3C7322753;
	Fri, 24 Oct 2025 15:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761318680; cv=fail; b=GizDu9JaSoNAYFzB+so+yFigr4HPeJrrBj2zgGRCviBC+vFrmB8Wd6LOQn4IG3gVsFB9NKAr8FqwrmmnkwcMbPOCCnUYouauKUy8qVDmmlyZvZlhGUffuobbve+B6z+dPKp1S8+oraHZ6mjNc628/hqzS4lX8lSStDkyHhlSpPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761318680; c=relaxed/simple;
	bh=bP0urKXuTKRQlfwLbzoH9MqvLjuaqWnjjjPb/cYxQ4U=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ihx40ag8GQwOK7NrEXOYEELgf84suY8BCNYXvuSBEaR2p66vJGf1s7c8FbViL9eCGqRHaA8rvdhoxmKKEgxAbn5hX2hqALNAZuMdNe/ZKwj8cYDjykXTQpIG1kegyF6YEzJX0fk+uHuOm5i50QvD4uZ25SdEaTNQxa+O+2bG35Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b0p/A1Rx; arc=fail smtp.client-ip=52.101.201.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OF4XvtUnzEha7nswSFJDI8expRu5u/1AZAQ7Y9HFFeMcLrvGCQKecZn6ZB5wOfUMtmNJsxUeYGALUVa2uAqavp347WhfLhBXd0WJkAKl5E/UKoqT1bGFvznyt8hOyQYQSHGUnjvrrny8mAqG7szdiqrxuFF0srqB2KY5X0+SzZfJXtRZw0TXFtJt8yFzlK4iyXgLre9LGfAyJmvV7oT7WZrIt4Uq2ZGAheMiRLPaMzdhUQSk460+vOHiwFjsNeQW26tkdO0fU5r+PEcOndt5ux8/Hx5mXUbK6p2r2wxgpgupGaUSG92pIGL63vF4WljJDQU3m84VCGmSHqjC4LHhGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hebPo02c8pbt4JVPk9QKdbKipbv8whkX5UigsYBF1g=;
 b=nSxti4bRguMaF+rCKfPgvkH5/l7rTcJfl4PE+AI6MHIyrPGJ8gMYJ/NpdwtIDNgib0wSHiebO+dzYxV0MK2/QYLGfQ+CbCNCZl6v8S9oAb1GpGk/ekK6hhH5GaQNL9k81aEDPNMt1kgtVWmK9lotY1kea/9c4SisT3XSG6dL5xOvqQIVsWq83qKHCBmCpJ8wRtSa3Bs/R1ROgaV/J9FQHKw2CxKj0MXVM7RVg8YtRCqbVje4o2ouyHe6SJt/MiFZCnEO0vJAU9n8caXj8MrUXapoYWIktVN9bMEDgSI0Y9WLsU/E8zQcqKpuNIy2o2kPyYVsNmzmjAzsJRhJSScIIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hebPo02c8pbt4JVPk9QKdbKipbv8whkX5UigsYBF1g=;
 b=b0p/A1Rx7jpy/Q3jkG172d/ej3h6AteIlixFVCbsYYZySw7q3Xxfb1g4AFYehngfNpwuowoHpc95A1O3kBMGZSwkhMIlTxRfyWNa86k4odpD5xHOOTVNLoHsu3nyg2+Khuy1n9Sb2L+Rc3FqKKe4hUG2J1ggMc0+Sgk6spiDdFb3lghN02lnaH+Rtpi36guSoEfGCCe3aKw5/ElfHVHTMPWW+hFLHetg6cqV3YOSrpOqyY6zbiU9bXxicLIImDH47dqg33k72AI8JOHn9pGbgLXe0cFJT5G6duJnD+9+2LZzsRGK2LG6RZMmfuxeeJQeWT6AJi6zV+c25cvMsv51/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by MW3PR12MB4394.namprd12.prod.outlook.com (2603:10b6:303:54::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:11:13 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:11:13 +0000
Message-ID: <8cf72af2-8a0c-4a0b-b5d1-77038ce804b3@nvidia.com>
Date: Fri, 24 Oct 2025 16:11:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: tegra: Add logic to support different register
 offsets
To: Kartik Rajput <kkartik@nvidia.com>, akhilrajeev@nvidia.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, ldewangan@nvidia.com,
 digetx@gmail.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251001153648.667036-1-kkartik@nvidia.com>
 <20251001153648.667036-2-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251001153648.667036-2-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO0P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::9) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|MW3PR12MB4394:EE_
X-MS-Office365-Filtering-Correlation-Id: 3baf35ae-3680-4d53-e593-08de130f924d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnZhSUdxb0hBdGtKYTQ1ZFFVNlkxeFRYd3g2d2ppdFU5ZVpzTjhuSzBvbFZL?=
 =?utf-8?B?R2k2cEFrSk1nZEtBNjQ2SVpkZEREOEJueEc0ZjM0M21xRTNMUzJqL2E1NXh0?=
 =?utf-8?B?S3NMOVV4cVZkSGM3enQ1VlpRdHRUYjVZYjlsbVhXU1A3dDJNeXVNLzBKVDRi?=
 =?utf-8?B?UStjTXF1NnkwYytSaEk5SHVyK09abFNrQ0xWUDMzU3pOb1FYRVVqMVJseGZR?=
 =?utf-8?B?RjFBL1d1Y0xkUTArKzhXQ2lQNHM1bE0vV1diVVJ1bUxCdXcrY3JnTlVjeEVv?=
 =?utf-8?B?L1FNTCtDNUl2WG9FNXE3NlFIZnFUQVpMTFNBUXdJY1g2dDNrSzRRZ1g3aE5D?=
 =?utf-8?B?dmd1MVBTaXpkNWxVczRxTExYU2RaVEZQdWZzdXNjbndsWmR6TkNGM2svYk5p?=
 =?utf-8?B?R2NzNVJPeFFyNG5xTnFXLzQ5c2xPTjZvZ3dPRUxJK3NVVmJxNTNmY3FsUWVQ?=
 =?utf-8?B?TnpjZnNXOEliYTF3dmc1Rlp4ZXFPdnVSbXFXbGxxeGFCR09BSFJyTXZmRUIy?=
 =?utf-8?B?dncxTzllY01qVHlWSUQvbFMzVmZoczluY1pUcWhZQ0V6Z3AvOHNyTHJaZGhx?=
 =?utf-8?B?Rzgra2lPUDlNMTBXL2c4amUyMkJlL0tFYWw5NXdHN1V6WXVhMzRqZGRTNFVC?=
 =?utf-8?B?L3RvdmRSdW9oUDczUGZ4YmV6ZjZVbVh3cXU2eFd4KzcvZHpUenpjMHBFUlBF?=
 =?utf-8?B?M2ZWbk1RL0VrdnR5RGhSTXhWV3luWkhxaTRCKzU5RlZUdThUL1pHWHh5M2ZL?=
 =?utf-8?B?VnFYRzQwRHBXeUJ2UENxaDlKSEdaWVFMS05PbkR2YjN0dXhqZEp4UVlKSnRi?=
 =?utf-8?B?RmFQU0xCYjdHOTArOXNWblhhM2Zhek1GcW5QUGpPd1dvbXpmMjFZeEFlZ1gw?=
 =?utf-8?B?OTlZL0Rwb0J3QTRNbWsrRW9zNUJHUWtkU3J6WGlvYmllYVg3WkIraHNrS1oz?=
 =?utf-8?B?WHg0TENNU0RIL2tZT3IxVU0wTEg2TUhCWEsySVkvQ0tTazNTVmt0YURGSzU5?=
 =?utf-8?B?TzNzbWg1Y1ZLczBiSFRFNm5hZnNCZFBPbFRxaDgyV29Wdk9QN3pMbnc3NDYv?=
 =?utf-8?B?akxheTZ3eWF3ZEU1VGhLZGxveGpsK1RZVmVGanp3eG0vMFRKZ0E4R3JncGRO?=
 =?utf-8?B?QXljakl6bVRYdm1EaVZkekJVK2Y3R1Jid3h6T2grVFdoandlRG9CZmxvRDZz?=
 =?utf-8?B?RmhaMEpBazF5S0ZlbVpGU0FFNVJIRDhoSHdrUW0xRUFpZkpHcWR3ZFhEQjRH?=
 =?utf-8?B?MktnWlRId0tqWUI0cFM2cXdEdWE3U2xUdU5FL29GeXY0d2pZWFRxT05ieW85?=
 =?utf-8?B?UmJic2lEUllDK2hadDhydWhZZHk5Q21CUnNIQWhYNXhiQ3Y3UE5FZjkrMnRk?=
 =?utf-8?B?YVp4M1poS3hsK0FRU1dlU3kydzgramYxbWp2TkJGMWUyYTV3b3UycTlsYTh6?=
 =?utf-8?B?QUlsS3BGdHVhWDlHMzFFWFZudk50ZzhxZG9LSFhBdngxT1Z5MDM3V0ZUNW1w?=
 =?utf-8?B?QlBvN1RTdXllUjBqdDduVzBFbUxsUTJXZThiVFhkQXQzTTZiajg2VDhrdEtx?=
 =?utf-8?B?cndmZUtOZmtwbnRNa1JNc3RhMWlZL0ttbElYLzkwaFpSY053TnBMWlByN0R1?=
 =?utf-8?B?OVh5MTNISTBOOTdOekptb0tDQWJyU1gxQk5MSlB5bENGNmhmNGcrbUxWSnZ0?=
 =?utf-8?B?RXR6dTE5ZGlyTzE2MUUzZEt1dWdmRWVFVU4zdzBtZlozQ25Ed0FZWTNtRHVa?=
 =?utf-8?B?K3VRaW03SEk1VWl1MTlmdWlSY3ExSmtxS0x3Znp1RUFJaGhUZGl2UURnVFpo?=
 =?utf-8?B?SGRaN2VzN2NNMnRSK1pTQVpVSWlKZTVFTm1sdzg5WHNIdWNySzBDRW9NTXJv?=
 =?utf-8?B?dVQ3NmNXdGtOUE1IdVNDMDl4cUNOTXJRdWpYQlhrQlFIU21XeWg3YU1QN3pm?=
 =?utf-8?B?OFpCT2RtejVVZXFYOWZQSm9VM1lPT1JYd2VmNnA5TXNZRE9yT2tDYWdxdm5x?=
 =?utf-8?Q?+sq51t9KBISF+JSglwN3utJMdMnxyw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXVHM1o1VUZMTVhqcW9WSFhMNW9sWXIwZW4rbG1tRjJmVEVDdDRQRzJMMkJ4?=
 =?utf-8?B?b01tWGZQY1R3cEpISUZ6YVhOQTExWFJUSSs5Y0VvN2xZUXRJTHFNSEtRTnFm?=
 =?utf-8?B?NUtoSmxoZ2J1YW9qaVpQcVl1eElzSkpuVHBqNmlKNHRyMkFsOTJjK2c5Um5S?=
 =?utf-8?B?cnpneXVOcmpEU1ZFMFp5UGhmM244azdESFNXTS9OZHFsc0xXalg3dVZjYlAx?=
 =?utf-8?B?ZWpJQXhJRkVCM1N4ZGtZOUNKWFNXbHJ3aG1HNGIyb0ZKUVpkTU9YdjErTk9Y?=
 =?utf-8?B?ZFcxcjN3MVJMQ080dUlvakdTb3ppdXlrbVVvQjloL0NkbHR2ZlQyRDcrSmtW?=
 =?utf-8?B?UmhtaWk0OTBucUswVzVyS3IxeHU2MVRSWWEyUkdtYU4rMGFENUJtb2J1UGls?=
 =?utf-8?B?aFhVSUdNNnNFL1REMnRObEw5cHBMZ1RtdUxtcUVra3RGUjRtUkpuQTFtZmVN?=
 =?utf-8?B?NmUzbThON2p0QmdNK01hTTBUK2J5d2dCeHBaNnFQT2xTMjZmUitZZkQram5v?=
 =?utf-8?B?cmt3NFQvU3FKWHFaV0pRRFpkTi83SW5XWFcrMXVZdkYzMVNZbnJpTmd0UENa?=
 =?utf-8?B?QzY1dTdSN2FEdzVpVG5FeFF4aDVQK0lXUmJoZmF0b0hLNHVtV1FGSEhabkJu?=
 =?utf-8?B?c2JWaWp6NHJEWkNUZm8wTlRLeSt3NjdrRnVyNVhRVjJWVHdGVWJIS2xIQWlC?=
 =?utf-8?B?U1VPdkdQcEQ5WDdJQ1dXTnBTeWtITGVBZUJ1VXoxSDhTN3F6RU5lQ3VvUEVZ?=
 =?utf-8?B?Y1dvcC9NOFhRVXhoMVNNVnByYlpyRy93UzVIN0FPU0JhV3NKcE5yN2ZvU09U?=
 =?utf-8?B?M1VrZUV2ck5LdE52aUU4UlY2RGVJK0lkOEhJdlV2U2pRTE50Wit1NU5RRGtj?=
 =?utf-8?B?VXN4SnU4aUpaeTdpZXVpc1J1VGpiY04vZnBxNmZxR2RxRlpnOURseWs5N1FT?=
 =?utf-8?B?OW5LcHc4TnNQZy9LM3BsV3ZpNXNXRFVvVnBVb1pqUC9GTzlheEhKWlZvajRy?=
 =?utf-8?B?bXlPR0g1ckRjdjk5QVEwQk5KbWwxRmx5clBZbFMyUkFtYThTSHZ3ZDhyUkVa?=
 =?utf-8?B?azBra3hjNEpPb2liN01aWDlVUlI4RUdZc0gwb2xzL2tHR0czTFJQOENrL0RM?=
 =?utf-8?B?RDl4VU9HQ0l0VFNaVGRCcTZYN29kMkN2M2gweW1hMVUxODFBRWxqb0dqTEhL?=
 =?utf-8?B?aTkwWjZJZ1lrVXJTakN2cURXNFp1c2ltZXloZnRLTnhyWW81cG0zUnpKZEF4?=
 =?utf-8?B?eUVlaS9ablR0VEhHQm9STzdRWXd3R2R0SEZ2VlhHaDQzdkVCbE0zeDU4S3FV?=
 =?utf-8?B?aHE4VUY1NmhKWGc2UGtKcGtlM1N5VDZZQjdNTzAxVGJ0OFQ3dGdHZUJvRWMx?=
 =?utf-8?B?bHlwRkpRN1JyMGZKbm04ejUxSUtYcC9pajRJcFZXeVRmZ0l1SDkwam5heTJE?=
 =?utf-8?B?MW5BTTU5RmZnc0NkeExzby9IV1dtOTRnc1RINEE5OW5MeXdLVmJUb0VjZDNm?=
 =?utf-8?B?ZEVTaXZPM3JsSkQzbytNNVUwRjROUGh1bk5EMExOeG4xUjRseGlMZi81T1NQ?=
 =?utf-8?B?eU96aThDSG1DU2s1VkJjRGZ0UnVlL0ttQ3VtZHZBRHhDTWtWNmJIT05oNFM2?=
 =?utf-8?B?Mi9JWit1NndIV3hUcUNudXpaTlZMbWExeTlvTjhYZGNrTEJ3b1B6ZEtoKytS?=
 =?utf-8?B?YWpFNWVEQ3lMbU9SQjNJQmFoZ2lES2c5bzV6N0dZSm83N2xrTCtVcXVLdHlW?=
 =?utf-8?B?UmJ0am12Z2NZbC84cWNwSnJyNmFWWTdWNjdteml1N0d3NEdrMmhnUmNNQyti?=
 =?utf-8?B?ZnQ4c3ZnRTU0U2hKRVNCN2Nua2ZHTjNVcnA1anM5VE1ncVc0M3ZrOTkyajhk?=
 =?utf-8?B?SGJrNjRNMnJOZ0VFN1NkMjJIMjdLSWhnc3pWTnVSanFTaGxKY1RLWDlpOWZr?=
 =?utf-8?B?N0FPVWpLdU94Z1RlTmwwWTVYYVlCbmJ1K1NUZytlOUhvaWUyM3d0eGpIbjky?=
 =?utf-8?B?Y29qRkQ4S0NYd0lLU01DSnhMcTZ2S044MVRnQW9vSGVWYzJWa1B2YTJQaFht?=
 =?utf-8?B?TVFJcDF0YXF3RmwvM3p1THRhQ0VnVWp0ZS9mcDduQVJQeXJXT0JHRk1tRHRr?=
 =?utf-8?B?dksxYXhVZ3RWM2V4c2xrd3plZDZiY0pVSTdQdktCaXFKbWdtVlB5ZGt5b2RP?=
 =?utf-8?Q?XSbSncjAjWBgexyPllAH0jXLHTbAnh/MpqB4fd43JqMu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3baf35ae-3680-4d53-e593-08de130f924d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:11:13.6087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkVXj6Sc4AvZcX97sVeQjsubxWmkpC3E/sjPq/NCZuKTrsLLZAQY8MKNha2EpoR5X8BXpwzlprVJmr+1JuwrKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4394



On 01/10/2025 16:36, Kartik Rajput wrote:
> Tegra410 use different offsets for existing I2C registers, update
> the logic to use appropriate offsets per SoC.
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>   drivers/i2c/busses/i2c-tegra.c | 499 ++++++++++++++++++++++-----------
>   1 file changed, 334 insertions(+), 165 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 038809264526..1e26d67cbd30 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c

...

> @@ -428,8 +519,8 @@ static int tegra_i2c_mutex_lock(struct tegra_i2c_dev *i2c_dev)
>   
>   	if (i2c_dev->atomic_mode)
>   		ret = read_poll_timeout_atomic(tegra_i2c_mutex_trylock, locked, locked,
> -					       USEC_PER_MSEC, I2C_SW_MUTEX_TIMEOUT_US,
> -					       false, i2c_dev);
> +				       USEC_PER_MSEC, I2C_SW_MUTEX_TIMEOUT_US,
> +				       false, i2c_dev);

The above appears to be changed accidently?

> @@ -1062,13 +1151,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>   				tegra_i2c_fill_tx_fifo(i2c_dev);
>   			else
>   				tegra_i2c_mask_irq(i2c_dev,
> -						   I2C_INT_TX_FIFO_DATA_REQ);
> +					   I2C_INT_TX_FIFO_DATA_REQ);

Same here.

>   		}
>   	}
>   
> -	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
> +	i2c_writel(i2c_dev, status, i2c_dev->hw->regs->int_status);
>   	if (IS_DVC(i2c_dev))
> -		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
> +		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, i2c_dev->hw->regs->dvc_status);
>   
>   	/*
>   	 * During message read XFER_COMPLETE interrupt is triggered prior to
> @@ -1104,10 +1193,10 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>   	if (i2c_dev->hw->supports_bus_clear)
>   		tegra_i2c_mask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
>   
> -	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
> +	i2c_writel(i2c_dev, status, i2c_dev->hw->regs->int_status);
>   
>   	if (IS_DVC(i2c_dev))
> -		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
> +		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, i2c_dev->hw->regs->dvc_status);
>   
>   	if (i2c_dev->dma_mode) {
>   		dmaengine_terminate_async(i2c_dev->dma_chan);
> @@ -1120,16 +1209,16 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>   }
>   
>   static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
> -				       size_t len)
> +			       size_t len)

And here.

>   {
>   	struct dma_slave_config slv_config = {0};
>   	u32 val, reg, dma_burst, reg_offset;
>   	int err;
>   
>   	if (i2c_dev->hw->has_mst_fifo)
> -		reg = I2C_MST_FIFO_CONTROL;
> +		reg = i2c_dev->hw->regs->mst_fifo_control;
>   	else
> -		reg = I2C_FIFO_CONTROL;
> +		reg = i2c_dev->hw->regs->fifo_control;
>   
>   	if (i2c_dev->dma_mode) {
>   		if (len & 0xF)
> @@ -1140,7 +1229,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
>   			dma_burst = 8;
>   
>   		if (i2c_dev->msg_read) {
> -			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_RX_FIFO);
> +			reg_offset = i2c_dev->hw->regs->rx_fifo;
>   
>   			slv_config.src_addr = i2c_dev->base_phys + reg_offset;
>   			slv_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> @@ -1151,7 +1240,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
>   			else
>   				val = I2C_FIFO_CONTROL_RX_TRIG(dma_burst);
>   		} else {
> -			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_TX_FIFO);
> +			reg_offset = i2c_dev->hw->regs->tx_fifo;
>   
>   			slv_config.dst_addr = i2c_dev->base_phys + reg_offset;
>   			slv_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> @@ -1187,14 +1276,14 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
>   }
>   
>   static unsigned long tegra_i2c_poll_completion(struct tegra_i2c_dev *i2c_dev,
> -					       struct completion *complete,
> -					       unsigned int timeout_ms)
> +			       struct completion *complete,
> +			       unsigned int timeout_ms)

And here.

>   {
>   	ktime_t ktime = ktime_get();
>   	ktime_t ktimeout = ktime_add_ms(ktime, timeout_ms);
>   
>   	do {
> -		u32 status = i2c_readl(i2c_dev, I2C_INT_STATUS);
> +		u32 status = i2c_readl(i2c_dev, i2c_dev->hw->regs->int_status);
>   
>   		if (status)
>   			tegra_i2c_isr(i2c_dev->irq, i2c_dev);
> @@ -1253,14 +1342,14 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
>   
>   	val = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
>   	      I2C_BC_TERMINATE;
> -	i2c_writel(i2c_dev, val, I2C_BUS_CLEAR_CNFG);
> +	i2c_writel(i2c_dev, val, i2c_dev->hw->regs->bus_clear_cnfg);
>   
>   	err = tegra_i2c_wait_for_config_load(i2c_dev);
>   	if (err)
>   		return err;
>   
>   	val |= I2C_BC_ENABLE;
> -	i2c_writel(i2c_dev, val, I2C_BUS_CLEAR_CNFG);
> +	i2c_writel(i2c_dev, val, i2c_dev->hw->regs->bus_clear_cnfg);
>   	tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
>   
>   	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete, 50);
> @@ -1271,7 +1360,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
>   		return -ETIMEDOUT;
>   	}
>   
> -	val = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
> +	val = i2c_readl(i2c_dev, i2c_dev->hw->regs->bus_clear_status);
>   	if (!(val & I2C_BC_STATUS)) {
>   		dev_err(i2c_dev->dev, "un-recovered arbitration lost\n");
>   		return -EIO;
> @@ -1281,29 +1370,29 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
>   }
>   
>   static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
> -					 struct i2c_msg *msg,
> -					 enum msg_end_type end_state)
> +				 struct i2c_msg *msg,
> +				 enum msg_end_type end_state)

And here.

>   {
>   	u32 *dma_buf = i2c_dev->dma_buf;
>   	u32 packet_header;
>   
>   	packet_header = FIELD_PREP(PACKET_HEADER0_HEADER_SIZE, 0) |
>   			FIELD_PREP(PACKET_HEADER0_PROTOCOL,
> -				   PACKET_HEADER0_PROTOCOL_I2C) |
> +			   PACKET_HEADER0_PROTOCOL_I2C) |

And here.

>   			FIELD_PREP(PACKET_HEADER0_CONT_ID, i2c_dev->cont_id) |
>   			FIELD_PREP(PACKET_HEADER0_PACKET_ID, 1);
>   
>   	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
>   		*dma_buf++ = packet_header;
>   	else
> -		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
> +		i2c_writel(i2c_dev, packet_header, i2c_dev->hw->regs->tx_fifo);
>   
>   	packet_header = i2c_dev->msg_len - 1;
>   
>   	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
>   		*dma_buf++ = packet_header;
>   	else
> -		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
> +		i2c_writel(i2c_dev, packet_header, i2c_dev->hw->regs->tx_fifo);
>   
>   	packet_header = I2C_HEADER_IE_ENABLE;
>   
> @@ -1331,7 +1420,7 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
>   	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
>   		*dma_buf++ = packet_header;
>   	else
> -		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
> +		i2c_writel(i2c_dev, packet_header, i2c_dev->hw->regs->tx_fifo);
>   }
>   
>   static int tegra_i2c_error_recover(struct tegra_i2c_dev *i2c_dev,
> @@ -1361,8 +1450,8 @@ static int tegra_i2c_error_recover(struct tegra_i2c_dev *i2c_dev,
>   }
>   
>   static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
> -			      struct i2c_msg *msg,
> -			      enum msg_end_type end_state)
> +		      struct i2c_msg *msg,
> +		      enum msg_end_type end_state)

And here.

>   {
>   	unsigned long time_left, xfer_time = 100;
>   	size_t xfer_size;
> @@ -1413,7 +1502,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>   	 * Total bits = 9 bits per byte (including ACK bit) + Start & stop bits
>   	 */
>   	xfer_time += DIV_ROUND_CLOSEST(((xfer_size * 9) + 2) * MSEC_PER_SEC,
> -				       i2c_dev->timings.bus_freq_hz);
> +			       i2c_dev->timings.bus_freq_hz);

And here.

>   
>   	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
>   	tegra_i2c_unmask_irq(i2c_dev, int_mask);
> @@ -1452,12 +1541,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>   
>   	tegra_i2c_unmask_irq(i2c_dev, int_mask);
>   	dev_dbg(i2c_dev->dev, "unmasked IRQ: %02x\n",
> -		i2c_readl(i2c_dev, I2C_INT_MASK));
> +		i2c_readl(i2c_dev, i2c_dev->hw->regs->int_mask));
>   
>   	if (i2c_dev->dma_mode) {
>   		time_left = tegra_i2c_wait_completion(i2c_dev,
> -						      &i2c_dev->dma_complete,
> -						      xfer_time);
> +				      &i2c_dev->dma_complete,
> +				      xfer_time);

And here.

>   
>   		/*
>   		 * Synchronize DMA first, since dmaengine_terminate_sync()
> @@ -1477,7 +1566,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>   	}
>   
>   	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete,
> -					      xfer_time);
> +				      xfer_time);

And here.

>   
>   	tegra_i2c_mask_irq(i2c_dev, int_mask);
>   
> @@ -1623,7 +1712,75 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
>   	.has_interface_timing_reg = false,
>   	.has_hs_mode_support = false,
>   	.has_mutex = false,
> +	.is_dvc = false,
> +	.is_vi = false,
> +	.regs = &tegra20_i2c_regs,
> +};
> +
> +#if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
> +static const struct tegra_i2c_hw_feature tegra20_dvc_i2c_hw = {
> +	.has_continue_xfer_support = false,
> +	.has_per_pkt_xfer_complete_irq = false,
> +	.clk_divisor_hs_mode = 3,
> +	.clk_divisor_std_mode = 0,
> +	.clk_divisor_fast_mode = 0,
> +	.clk_divisor_fast_plus_mode = 0,
> +	.has_config_load_reg = false,
> +	.has_multi_master_mode = false,
> +	.has_slcg_override_reg = false,
> +	.has_mst_fifo = false,
> +	.has_mst_reset = false,
> +	.quirks = &tegra_i2c_quirks,
> +	.supports_bus_clear = false,
> +	.has_apb_dma = true,
> +	.tlow_std_mode = 0x4,
> +	.thigh_std_mode = 0x2,
> +	.tlow_fast_fastplus_mode = 0x4,
> +	.thigh_fast_fastplus_mode = 0x2,
> +	.setup_hold_time_std_mode = 0x0,
> +	.setup_hold_time_fast_fast_plus_mode = 0x0,
> +	.setup_hold_time_hs_mode = 0x0,
> +	.has_interface_timing_reg = false,
> +	.has_hs_mode_support = false,
> +	.has_mutex = false,
> +	.is_dvc = true,
> +	.is_vi = false,
> +	.regs = &tegra20_i2c_regs_dvc,
> +};
> +#endif

Seems like we are duplicating a lot of the above. I am not sure if it 
would be better to have a higher level struct so that the common 
features bit is not duplicated? I guess that we are only adding two more 
of these structures so may be not a big deal?

Also, I would prefer this adding the above tegra20_dvc_i2c_hw was a 
separate patch to this because this is a large patch and it would be 
clear to add these in their own patch.

>   static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
>   {
> -	struct device_node *np = i2c_dev->dev->of_node;
>   	bool multi_mode;
>   
>   	i2c_parse_fw_timings(i2c_dev->dev, &i2c_dev->timings, true);
>   
>   	multi_mode = device_property_read_bool(i2c_dev->dev, "multi-master");
>   	i2c_dev->multimaster_mode = multi_mode;
> -
> -	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
> -	    of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
> -		i2c_dev->is_dvc = true;
> -
> -	if (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) &&
> -	    of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
> -		i2c_dev->is_vi = true;
>   }

Thinking about it, wouldn't it be simpler to keep the above? We could 
also populate the regs offset dynamically too. Would this save the 
duplication? May be we could only do this for Tegra20 and Tegra210 devices?

Jon

-- 
nvpublic


