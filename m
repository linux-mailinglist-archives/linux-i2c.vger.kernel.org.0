Return-Path: <linux-i2c+bounces-10531-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A9BA9724A
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 18:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 628961B653BF
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 16:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3235E2900B5;
	Tue, 22 Apr 2025 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mXdxlBxS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37766293456;
	Tue, 22 Apr 2025 16:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338447; cv=fail; b=kuHHFDku1aT28eNtYbFF/PHiuoxT2FILUTzFN97z/hILIrBJwyRL7DfS4Ynj2hDijdlObwIGp+WXvVQxdyPe1iCIYUSNs1OBNSj5pX2M1ZD6KM2tLIbqSHANgtDysGMtKoJFimBOMNmzPkpwE+/ciWiKTO3KX+QSA8aUqnCaJLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338447; c=relaxed/simple;
	bh=Mzj6I8rZ47bNWHvhsdhWypUPmirjz19CrN2GY8D9E4U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ttLZRk0I4vnSAAi4mjCJ57igjbzOyJXzLky4jP+nGD4/+r12HxFGksj9wN+whm8gvFWpJQuLujM7HJTengOWR9DRFlHlsBKexm7e9hswvVY+qpOYOeUXwmoXZGQ5FIQy4i/MfmGRJOrOlP5fyHfmM78BwgBhzpeP17PnWnxgqkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mXdxlBxS; arc=fail smtp.client-ip=40.107.243.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTdV+Y5oJ+f0s+ucButDJomtu8JQXbsUaBU8ah+MkHr1BW3JyPRIifCWqa0nJbPjdkY2wyDzE9XS/WEG49VxigQyc9SrYhxdrfXSMiV9aS7IMjjTe5QDwZWbRLD5oxWrt7qUN5g8e3gn9RQayEE4LxKEs0O12baWfRESFxfYY9mtPGiPfRZVRyeWnvsq3037YoVaN/o3nRd36KBJAFRZq6j3q41iqhXlGX61KxfWsrbBg+ybVttMQLmwkSIjI5H7Ghnp2+TnpXWThSpKgoJ2Q8+ndGryjB7IRT8mRbnw1h2S+3DreFZws5dyHNwwi/gFkYF30xWmd3EoW3W2WVKvdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2d2pWO2BHQ6rkorjw4pY7xY+MOzDh081pkTVcuwlh0=;
 b=x/0He2T2LCropbR5Ctmb4uYzPGp3Ll6CPDWZjZcK3V/t9eBfTn/YDMALO5G+QW5GrMvkNu2WkD82Iig2HFOnIbnlx8Mr5zizcZWSNEg6jmgTmsixFgcaUD5w+iV1MTppUdqOJpAxhzYXyd4Qb6ytDyw2zZBPY3WBVFaUwh37edRTT9ssUzXbRvK5JCVNCKO4+4JHsogjNFlKSnwaCFIq2Rt71h9EJyV3BxXSqhBDvoz8XmcKcUiOuI1iqp5RBwlEVOR2BVJTFM1h9eTDLuGQknDmUE6VB+bABqxQHDcPejjyvqQM29JvcM1piYbmXqh1ZVXhbplIK0ZT/APjvvZmDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2d2pWO2BHQ6rkorjw4pY7xY+MOzDh081pkTVcuwlh0=;
 b=mXdxlBxSs6qfQMok/XSuRvKrwMVmOkjizsxcmhmWeI1B31dnSvx35Ii48I5VuFtJZQYud+p2jrOROp2dfVimdY4Wr/I4L0bE5m+bda4zQfbtQ2DSVhTwSAgqwrbDP9QI9YywA6/0Q1/3Ds7pt39SewgW5W7aVNGMN2tgf8cd1k8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by MW6PR12MB8868.namprd12.prod.outlook.com (2603:10b6:303:242::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Tue, 22 Apr
 2025 16:14:02 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 16:14:02 +0000
Message-ID: <9262332f-ab4e-4d43-a01b-c5aa5fd60310@amd.com>
Date: Tue, 22 Apr 2025 12:14:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: amd-isp: Add ISP i2c-designware driver
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dominic.antony@amd.com
References: <20250228164519.3453927-1-pratap.nirujogi@amd.com>
 <d5666c26-164b-4b20-ad9e-0e1e5b0d4ebe@kernel.org>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <d5666c26-164b-4b20-ad9e-0e1e5b0d4ebe@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0328.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::20) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|MW6PR12MB8868:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d96db2-997f-4cbb-9f71-08dd81b8b270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlJ1emtmWlNoQlhmTlhlR1JHRTJudnp0aGo2ZjY4UjFMcW0xcWpZR0h5ZU5K?=
 =?utf-8?B?MzFxVExXeGU3enVlaU1kVTYvcFNvUURNa1praCtCeHFMZGtEdHZacTJqVkll?=
 =?utf-8?B?S1VZeTgzQjdqMFpyb0hZU3A3eHJVQ1hLQ0p3QVlvVmV5UDVhZ1pYMzExUW5N?=
 =?utf-8?B?WnNlMWUwV0NoK0x4bEFZMk1oWW5BVXFBeW9nZHdZaTVDWE9xalpyVmUwM05P?=
 =?utf-8?B?cEVUR0pZdms1RGdCcUhKNDFqbXZ1NEFIYTVWZGFCV25Bb2ozRStrdUtLVXBR?=
 =?utf-8?B?TmNSWHEzcllBdk04eTk0S0JWbDFoTWdoZHlUR0Z4UUtycFIvNVhRTmFOVm4y?=
 =?utf-8?B?Y2IvWXVPeG5FNzVubitzUmF0UVFFQ2g0dTF5UjZEaFhtM2taY2RVMnVEUE53?=
 =?utf-8?B?YXNvRGsxb0N0QW9QQ3dZbTlMMm44czVBanU0d1BVSHdqRjQrUlNIKzMzQ0RC?=
 =?utf-8?B?QUlCT2dJTmN3VzBTc2RFMFp2Q0ZLRG9CZXlseFZYck9sSVNiTHhCcFNFeEFx?=
 =?utf-8?B?MGpLdzBqYkZPdytNdVZTcERWSUJVU3ByZlpubXovNWZ2dUN5TFVtNDY0TUF3?=
 =?utf-8?B?MTBLUDVjc3FRWHVwUGNuOFloMElYTlNPUzl4YmJWUjEyeis1eDU1WVNkL0ts?=
 =?utf-8?B?NUxTZFNYa2VLQXowTGRBcUFYR2xXQm1PQUVhSjlNdlBMamJDNXI4RjN2UDg1?=
 =?utf-8?B?YmZrMUpLb05JUzFzcEFLbjNJRy8rM2dCQStQcG1tajJONnFuQ0lDTmg2cWds?=
 =?utf-8?B?RTUwYzU1Q0R3ZkZiWU1jNWNMS3lFV3lwYUNrQjBLWUlKUkovUDdXYnVOTUJS?=
 =?utf-8?B?TjNlQ2F2c1J0eUtDMmVHNU9hWlY2Zkxxa2V2aGJtL3RHT2VNcHZRN29tZ21R?=
 =?utf-8?B?ZmxxWmpSMCs1UTdtWXRaWFpuQ0ZETTFOb2JRbTczeWN1cytuRGUxZTFBWm1J?=
 =?utf-8?B?SFpSZzRydk1wbjF3bkE5N3B1TVpod0NKQldvZTcvNDFaQy8yMG1kWW5FYW1X?=
 =?utf-8?B?TzhTbExRZWEwQTkvNHVkYnlQbGU1bTdpVmN3c3dkT2VnMWE2RmpGcXM1RUFz?=
 =?utf-8?B?WHdVeW5Rc2xzYjBUWVpBRCs1eFhUTFhpTy9SNGZOc01JN3VYY2t4Y2ZSOG8v?=
 =?utf-8?B?clJyMStQOXdBWUpQN3g3eE5yRktIUCtobllGcUpoZG1XTmpEMk9kZGlieEtN?=
 =?utf-8?B?Z1hsT29Na1FSZ3BhYkxtdyt3TGtLdHBqY2hjZXdjM2dpMGVjODhOTGZ3SStm?=
 =?utf-8?B?cWdYU3d4ZWdRWmp3QzZRY05JQXA0RnljcEd0K0VhUUpNUVNHZkY2U1E5Z1Bn?=
 =?utf-8?B?ZWJKcWxnaVdUcGtOVXg2ZjUyMXRWSzloSFhQMGRqbEtncnUyTnlCZ1RqYWVh?=
 =?utf-8?B?Y3dSZTU0cEV0ZGxwd2RUZWQ4dmNabERMK2hBWFpxelE3dmVLcHd2S3B4ck9N?=
 =?utf-8?B?Y1JvS3o2TzRjOFZENUJ1Skp2VW1QbTVVVUk3YjVxZmQxMjU4QjkweFpFYzkz?=
 =?utf-8?B?SlBPL1EvdGcvb0x5cHdhMnFCdU1MZzJBN0gxUXBtdGFlKzR6d2syUEV0S252?=
 =?utf-8?B?dWc5ZmptMXh6d0hsUWtLU3l2ZmkvcGdKbkZXOUs2dy9DTERrTFB4OVZFbmto?=
 =?utf-8?B?dndMYllVZFJ5bGRpTVkrTXFCaTFtWEdlUnMyQUFKUjh2bHA0QlZHWDZWU1Vj?=
 =?utf-8?B?eERaeWtDanpmU2xIazZ5UlJ1WHlnd0t3MC9kVVl5a2FFcnpCelliY3hWalZQ?=
 =?utf-8?B?L3ltdksxODFSbUlGYWlRWGoxRC94VjRGZHpkcGlpbWVQU2dHWHBsRjQwUStk?=
 =?utf-8?B?azcvamVPR2MyZUR5cEpZUzRvekhsQm9HdFZvNG4xekRDVkw5Z2pFaDBUK3Zl?=
 =?utf-8?B?eTRuRElyS3VISUZ2N3poVFJyNTk2WjYrWEswS0c2S3Q5S1h1OXVXTHNkRnds?=
 =?utf-8?Q?wUNjff1x9mA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGhGc1VsT2xsQzBiVW43Z3RBOC9nQkRoVGJ6WFp4dzVIODI5SFFaZ1RmbFdP?=
 =?utf-8?B?bmVLeDlIbjdVYXZYeG1oTU1mcUU3VWhwVUo2VkhSdDFReUM1NUY1MHNLZUZN?=
 =?utf-8?B?TE9CTDZla0ZQemJ3b1Vwa0pGWko5L0xBakFmbXNDaExxdEpqTGlMYS92Ri9F?=
 =?utf-8?B?QkhFWFMyQi8yVGtFV0szSk94MGdVSWl4SEd2a05oWkVoaW96RzM4Yk4yamNT?=
 =?utf-8?B?eHkrYU5aYWtXenVINllacjRGQjhHTGtxZVhIZ1RvTlZjSDB5RjdSRUdOUzkr?=
 =?utf-8?B?TjZsT3IwQWlMaXd4Mi9oMVVPTE5hdVM5amw3VlJzdS92eDJDMjRCV2swcTJB?=
 =?utf-8?B?ZkVQbGkzaDdOTlh6eEh5dm9ZTHY1QURHSlVKMnQxR3dMQ3RJNkpTTVdzYW4w?=
 =?utf-8?B?b2JVcVZJV0lwZDlZUEcxZTZNcmlTdlVsQkgrMXFmU1M5K054aGJSb2tITUdk?=
 =?utf-8?B?VHk5ZitVTjhQKzdiMnpja3BqQ285MmJXbzR6VVBMRUY1em5CTllIWHdWVFEx?=
 =?utf-8?B?TVo2bmg5dnp3eDJuY01FOXVLcHZUem5nbHVzWlg1Sk5RSE1yNE5WNmJIRmwz?=
 =?utf-8?B?UTB4Z3QwYlFKb2Z4R25WZEZ6eDR4WnVQV1ZXNVhlYmFFSU9UbmpNL2cvTXYw?=
 =?utf-8?B?VjQzSm5FZEJtdmZlVmtXT0l3YkdwZU11ZTVFOFJlRHNXSkdhcUl3WTFoZE5x?=
 =?utf-8?B?U3pMc0RsVzl1dDBZbnJwM212MkRnRWlrVlcrZTczNVlFT0ZHNDlNTnVMdFBE?=
 =?utf-8?B?RWxsUjN4ckVVN2hzQmwrQ05acFQ0aXhQM3gvT2g3Vi9Db3pqSldVQllXMXdD?=
 =?utf-8?B?Mkh4Z2ZrSkdyY0FuT0pSWmtvT1d4ZWhvbW9SSVhuNk1HdHFGbFZlY3VWR0pS?=
 =?utf-8?B?TDVTT3o2L2syQXBQd0xkdTFIcU8xQis3bnp1N1FZTkdyNlRhY1FHSlRqYW1x?=
 =?utf-8?B?c0ZhbUYyTDFDTzlrR3FZS0kyekJXbi82U3JJbnNHZGVuSXlJKy9aby9wTERU?=
 =?utf-8?B?REdPRThKM3J4YVV0Z0IrRkJ2dE01blAvTUxpN0Z2QW15L0pkSC9KQk94QktZ?=
 =?utf-8?B?Z3M3L1V0VjFQT3EvZUcwZUw0RUdOT0NxY2FxZmlTTk1hQ0daaXE4Qkd2QTBZ?=
 =?utf-8?B?Tzg0NWcxcTc3c3IzZnhCS2t0VS9iRm4rLzhsczlQMkU0R3V3WXNmS1JuZmVu?=
 =?utf-8?B?NFc3elJjQVBFbGptcXdXTEJNQ242dU0wWVBhUDBINU55OTFXWWFNZFhaVFJL?=
 =?utf-8?B?Z2ptUnY2QUFYdThRQWRvSUZVSmNjYi8yNlAvMjd6RWRsVW5qZ1B0UGFHQnRp?=
 =?utf-8?B?b21acTYxMnROZUd0aHArWjQ2MC9KQWlGbi9xWTUrSHVxc1FpQTgzeDVBcjg5?=
 =?utf-8?B?NGdxZGM5bEorWURZSFU0b004WnR3a2U2V0pQNlIrVHpFalZpS1U2VFB5dTYv?=
 =?utf-8?B?Zm1UUVIwc0lONmdHYklKU0N6V3E3Q2VLS252SWw1MlEvKzhvQTFzNklGOXZH?=
 =?utf-8?B?SFpJQWpwaGVpaWxyNEJRVXhhY0p1VlMyeEh1QTMrVGNjMWdVTHdjVkxEdFZz?=
 =?utf-8?B?N2UvWUFUUW95Qm1LM2VHYUQzbFF6KzljRDFLM3JvUkRaSTNkMlB4cXd5bGpH?=
 =?utf-8?B?YXRleUNyZDZtVG5EYi9rT3JDWEhMMHNQaHRMQk1BUWRHUURZOU5KaHlxSi9F?=
 =?utf-8?B?RitHenlKSnZSRHFzZnh3R3hzQXdxNHFGdnh2QVcrOWpUOFFwbUkzTXp4eGFM?=
 =?utf-8?B?eDd2dXRHSnBSK2k3SW9CVWlzVk11YUtScnNvWjJTbmJTcnkwWWc5bytBWDcz?=
 =?utf-8?B?UjJqcEN6NE1yeE1naEFmWlRYNVB6YU1pU0psYTdWMFoyYWVRV2RvZVkzOExF?=
 =?utf-8?B?UkNQRnNpTjVWWk5IMTlPK2hpQXlaMVNmVDhVZjdHbTFQWHZRUFFxUFJKOUFV?=
 =?utf-8?B?UUVyUURpZlV4R3Exa1BBNkJwL1owUlZCQWloQmNQSDlLTjBQbmR2bWQyN2Vl?=
 =?utf-8?B?SE4rU0FyQWZ5MVBXQkVqdWlTM2NCY2FBQStUWFJZTHFSNXlTODk5UENWakI3?=
 =?utf-8?B?ZU9uN2NtaFpsYXFzaXlCSFZRS3pFQVFYeENaYlZiNUIyQ2pGSXEzcG43L3B2?=
 =?utf-8?Q?O7bxDj5cVaECzK0qlyCSZzmQF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d96db2-997f-4cbb-9f71-08dd81b8b270
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 16:14:02.5865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nm2OYpT/J3/jbTVsg0DhtL80YlOkZimfobn4rJEucMIF5xdZF5s+aPEAyvdJwJgd8A2OPGjqURETRC6YpVOIgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8868



On 3/1/2025 8:33 AM, Krzysztof Kozlowski wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On 28/02/2025 17:45, Pratap Nirujogi wrote:
>> The camera sensor is connected via ISP I2C bus in AMD SOC
>> architectures. Add new I2C designware driver to support
>> new camera sensors on AMD HW.
>>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>> ---
>>   drivers/i2c/busses/Kconfig                 |  10 +
>>   drivers/i2c/busses/Makefile                |   1 +
>>   drivers/i2c/busses/i2c-designware-amdisp.c | 266 +++++++++++++++++++++
>>   drivers/i2c/busses/i2c-designware-amdisp.h |  24 ++
>>   4 files changed, 301 insertions(+)
>>   create mode 100644 drivers/i2c/busses/i2c-designware-amdisp.c
>>   create mode 100644 drivers/i2c/busses/i2c-designware-amdisp.h
>>
>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> index fc438f445771..79448211baae 100644
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -592,6 +592,16 @@ config I2C_DESIGNWARE_PLATFORM
>>          This driver can also be built as a module.  If so, the module
>>          will be called i2c-designware-platform.
>>
>> +config I2C_DESIGNWARE_AMDISP
>> +     tristate "Synopsys DesignWare Platform for AMDISP"
>> +     depends on I2C_DESIGNWARE_CORE
>> +     help
>> +       If you say yes to this option, support will be included for the
>> +       AMDISP Synopsys DesignWare I2C adapter.
>> +
>> +       This driver can also be built as a module.  If so, the module
>> +       will be called amd_isp_i2c_designware.
>> +
>>   config I2C_DESIGNWARE_AMDPSP
>>        bool "AMD PSP I2C semaphore support"
>>        depends on ACPI
>> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
>> index 1c2a4510abe4..cfe53038df69 100644
>> --- a/drivers/i2c/busses/Makefile
>> +++ b/drivers/i2c/busses/Makefile
>> @@ -58,6 +58,7 @@ obj-$(CONFIG_I2C_DESIGNWARE_PLATFORM)                       += i2c-designware-platform.o
>>   i2c-designware-platform-y                            := i2c-designware-platdrv.o
>>   i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_AMDPSP)      += i2c-designware-amdpsp.o
>>   i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_BAYTRAIL) += i2c-designware-baytrail.o
>> +obj-$(CONFIG_I2C_DESIGNWARE_AMDISP) += i2c-designware-amdisp.o
>>   obj-$(CONFIG_I2C_DESIGNWARE_PCI)                     += i2c-designware-pci.o
>>   i2c-designware-pci-y                                 := i2c-designware-pcidrv.o
>>   obj-$(CONFIG_I2C_DIGICOLOR)  += i2c-digicolor.o
>> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/busses/i2c-designware-amdisp.c
>> new file mode 100644
>> index 000000000000..dc90510a440b
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-designware-amdisp.c
>> @@ -0,0 +1,266 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright 2024-2025 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/dmi.h>
>> +#include <linux/err.h>
>> +#include <linux/errno.h>
> 
> Hm?
> 
>> +#include <linux/i2c.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
> 
> Drop... or you miss bindings.
> 
> Many more headers look not used or even wrong.
> 
Thanks. Will clean-up header files in V2.

> Best regards,
> Krzysztof


