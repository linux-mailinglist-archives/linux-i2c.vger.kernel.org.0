Return-Path: <linux-i2c+bounces-5990-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA889681C4
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 10:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93B5E2828CA
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 08:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412851865F0;
	Mon,  2 Sep 2024 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2+b5gORX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EB11862BB;
	Mon,  2 Sep 2024 08:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725265671; cv=fail; b=EyAMJEGIaMWpcjkO52apqCRJd8zTJo4ptiGnm36iDHMmutnPgiZpOUorpeTY4PLclihY/Fn5vHpEdIRuxXCDcvcT/bBC4CKyFBMuEcilXx0bENJdJbdyM93+nbowIDq51317y7p/KLGJwzH42uxBQSVQJRdpvhym2FRwjPopH8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725265671; c=relaxed/simple;
	bh=PYoa+Ouua5hY5rqBJ9vnxJYplCILeXAWoFFZjaXZ8CI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rPUQ1g9mt3QXK7PEkr6ZQzXM5F35raxohvm8MVTKRiVaHbC0lE83la7IBlSZFKn1L7EW43TklnBMKBu+mYmwK/dMowpLx9sm1inC3qUrhqQKnfKOaE1PCzupJnQ6VrcJBcFEkRHlUp658BMQDN8UvT6pa6sc2rz9g83EmjBrNSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2+b5gORX; arc=fail smtp.client-ip=40.107.243.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRyGiu5MIggxh7e9yjY9cVA37ErcV7rjGpEfP7DUebig+07efdpyiZ9zCNErXGqSDwMFMEaVPG5ZmbV2A/ILPMzNKE94d7ZUr+1vdSpaCnFHPNcCu+yl9pORvDiE1zVawVtKnuop8V92gbJPB5XQVT3FPD/eU+zTSQbDkVkd8G0M3JImNsoMipwUzWUPf+N/N4WZkfZi0vTC18V/6ZjajjyxRO0UbTw+i7Udr0zoaQhlqkAjx+MZWPtZD+gZb6S3XWaUIxn9kMtpA6hIaBYdsvefyH+/uXOVojf0F/9AiloMEp0qrKRra4+F4PHVVcq/FDVev/uyooq1D9xKguBhFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwKODMM1ilgw0U332Y6J40DfyvXoiHCIlYhdE1I/EMM=;
 b=bWY+EKdXrcEGWYGan6zXvkHkVQWRlWQgO5YKs5hhtn0AZaxo4+AgQLEc8qnCK1qMaK+biu/HJLb8hCDIOAj9TiMAQywRgUBgRutXWQiJTujzHgBsbUVNpuR3mhHp9LySKXsk3/MXot4r9hPzaaBvqOATymaBFkAjyVkwervaaW0+gbZTuTZhH+LbwP8CvIeUYz/h/9H/H+K9V3i6iHCAyaEv4cYP9ZFssty7nK2xJENmQt/Cdnr5xv2beUMoaqbEUD5AeFh598gvNW8Hz/kDah6Do/csv/Q8t01WJ/7RGVaic9qjAdP1+9XKqIDT6NfQROlvbbn/0F5b5Pr6oyzvaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwKODMM1ilgw0U332Y6J40DfyvXoiHCIlYhdE1I/EMM=;
 b=2+b5gORX+KgUh5Rp1vKCJTAaSmpRSyZqxDziUH9utPmTHdoDHm8s3vCDyI5QtM+A2MyN2dr/aRTf+BTSVNhBPCuCGMPqfXfqIfsHplZQ/xB+B8yO9Ah5oV+lvRONEvpkEYjoI9O5uIyjLTRVK4EynINaFQH0uBMJQZPbRmb8ceQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by DS0PR12MB6655.namprd12.prod.outlook.com (2603:10b6:8:d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 2 Sep
 2024 08:27:46 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 08:27:45 +0000
Message-ID: <a35e115a-5822-40e0-bbc5-b56c0dfddcb9@amd.com>
Date: Mon, 2 Sep 2024 10:27:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add atomic transfer support to i2c-cadence
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>, git@amd.com,
 andi.shyti@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com, srinivas.goud@amd.com,
 shubhrajyoti.datta@amd.com, manion05gk@gmail.com
References: <20240801094408.2004460-1-manikanta.guntupalli@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20240801094408.2004460-1-manikanta.guntupalli@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0123.eurprd09.prod.outlook.com
 (2603:10a6:803:78::46) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|DS0PR12MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: 57794e74-d751-4ec7-d2b1-08dccb291f24
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlpVVzNVS21DM2U0KzRRVWFYY1hFOTZSZktKMHVjTy9OQXlCT2M4L2JWSW1m?=
 =?utf-8?B?WjdYR3FBellNTHVkZXoyR3FVL3plTk5Sa2xQaGZrelVJZ1ZXcDJSeklRQ0Ew?=
 =?utf-8?B?L1hicklKbXBRbDFwNU44NWhNeWpaMEhtOENRZWFhckFSMThBWGNGNEh3bkRz?=
 =?utf-8?B?L21qcncyZUs2SllWcWptV2xRbkpKcEVpRXpOVTdhZHBRMEVWYTZZQ3lvNGk1?=
 =?utf-8?B?VnBjS2hudURDYXU2bksvUzYrWndBZGlyb3Yyb2w0Z1pOd25ZclpaNzR3U2s3?=
 =?utf-8?B?YXE2VVROKzNjdHhibTVYczhCNHJUOGkvZXJTY2xWM3RScURzZFRTdUNpaFlw?=
 =?utf-8?B?a0N6KzE5cnErR0E3QjEwdXRZZVpkR1l2UUl2d3RDSWdCTytpQ1VKTTY1NjQ1?=
 =?utf-8?B?OEJoeG9FajBuajlHdTNZNFN2TXNzbkFtSkQvSGp6NXhzZmgxMzdmaUlUZVYx?=
 =?utf-8?B?RXYwRldSTjdQcHZOODBMQy95MVpEMzRnTi9TWUVmZUkzeGFLVk5WTDZQWDAy?=
 =?utf-8?B?d0ZadytzLytTbXpCUGFnaEJucWdQcmV6OVdNYWRsZDRRZjVMWVc5ck9zcDlY?=
 =?utf-8?B?QldRUzBwZUtFVUhRbWVaZytPMUx4WkRlUSttd1BmS0IvVUg1WUY3UHhKNjJm?=
 =?utf-8?B?U0lENDk0TXZLcUN0Q3YzNitsSG81MlRUL0phR3doeVJzNEhjNk5QNnlQYmJ3?=
 =?utf-8?B?c3N1WlNQc05oYnVyWm1QMkE5WHh6Qm4wcXYzallJTjhrbnVrV3daWVkyOVh0?=
 =?utf-8?B?cW1kYjFqcGU3YTNrVnlNdURrWFJIUW9qblIwMGRxd1E2U0orUWNZRDZXRGR5?=
 =?utf-8?B?S1ZncFNOaWErSHJjaU8rMkMwb1RIWVpBNXZ1bEQ5TSs0Z25XN2lDT1pwR2x6?=
 =?utf-8?B?dVBDUk9VK25QamF0SW9LQlp4T1VicEpkK2xPcVIzK2dUOG9haCs0d2pGRUt6?=
 =?utf-8?B?b09LSzJzRmJDWFZvK1ZJRk5LdXVwTXRUa0l5WEJ5TXZDSXZoOTJKWkN3aEtv?=
 =?utf-8?B?SUpwVEJBZS9xdGlwbzhzcEtBVk1BVndBbDZMOHphcm44bmZPVm9ZSWhLMFdu?=
 =?utf-8?B?bWtHcHJWMXJWUEZKUldZakhMTE15bmRYYVM0UFpIcDNtQzdaWXF3RDkxY2tj?=
 =?utf-8?B?QkpjYkM5TEFETUVLNmVTdmdBaFkrRE42ZlB3dDNWMTU2RjZiUHhrSTlVYTAz?=
 =?utf-8?B?L09jZVp3MkcrWFJoUHdnNVFUSGR1eW5Seitsek16cnNWcktZMDV6OWhpMlZS?=
 =?utf-8?B?UHRYMDZUb0RhRGNoN0JuQ1NoNzlKdm1zZ2ZTTVVNV2tEL3BkR3pPbGNEVGtV?=
 =?utf-8?B?RE5UTjhLNEo1akhzRHJJQmRKYlJVSExjUk9WekFCMEdpejU4dE1HUHgzWncx?=
 =?utf-8?B?Ym1pRUh4N3djS3U2SXg1ZkpPMVlhanZQTjA4b1owYVUvM2VXUEdzdm1KRDZz?=
 =?utf-8?B?Z1I5WjFJVHdFNjAyUnZPSzBaNitYSkJ6ZlpOWmhrVlNhelZPa1A4UnpJUEg0?=
 =?utf-8?B?S2NvZ2hkSWtFaE50YlVWa093WGhVaGdEVUV2Nnp2UHRRYW1odGEwbC9yNlBL?=
 =?utf-8?B?M05obEZXb2RvbGpTUXpvUm5pcVlVbzZFMDc4LzFuOU1vVGUvK0UySmlqUHVs?=
 =?utf-8?B?VGRCZ3JIc0RpTFRWWGpXVGZsN3Fzc2V1MHBDeXVaQXVIK2RCa2pSQW5VVXlU?=
 =?utf-8?B?OUg2RzAySWZtd2VzeGJ0UFp2WU9VeWFlZGhlV1RaQ2hMaVpzWHBBdFpRZEJr?=
 =?utf-8?B?MGZnQWlVRkRLRjBXSnJBdjdEMlE1S0FzSkRyNS9EWVJwZnNwSnA0SHhjTjJU?=
 =?utf-8?B?MVlMaWVnTVZsbnNQQ21PUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azkzLzN5QVZoM1pXVmpKTjlTdzg0NE5FbTV2ajJQeFJQbmhBSnV1RGN5NlZ4?=
 =?utf-8?B?b2VBSmRBQ3UyS1hzOGJEcEJJWXdJa2dPT2FDMkc3Vmd1bGRzMXQxUmV0M0Uw?=
 =?utf-8?B?WTZDeGdzR2huTS9MUTFra2lXRHI4NTZrYTBqa3Mxanl0RnVIWU9hM3JWNUc1?=
 =?utf-8?B?Q1pZeTRTa1oySmtFUHFLeVVmUGg0d0diKzBXSk5XUjBROXRETWlQblVzZ3g5?=
 =?utf-8?B?NTNobGRTUnBmZnowKzJIQkFiWS9UZzViR1cxZnV6dTBQWm9Od2c1SUMvRWtz?=
 =?utf-8?B?QnhWd0cxL0g4dWNOam1OL2ZTR1kzUXlIb1JQR2RYQXphVnVDNEc4WW1QeTdl?=
 =?utf-8?B?M0ZOMm9xVUsvb0RnUXE5N3EwWmsxSUpoZmpiR05VbVVkNkwrR3BYV1VPNGU3?=
 =?utf-8?B?TG1Wb3ZNbUV1dzE0bXJUMStkR2RabmlGMUlkKzBxZllzNjkwaWFJWTZ2Yzh5?=
 =?utf-8?B?aHMrc0txQWsybGxNT0o4VjdaYWFNTVRMajFQOG9uSjhVNCtNUWovSHd3RWpP?=
 =?utf-8?B?R0JWSEVySDNQL1JQdG5wMkFWNTIvNDBpUzU5OWFvMG01K0djamNtNjZHbTNU?=
 =?utf-8?B?L29SNVFIbDFKMGVteDFnbzVRRUxwQ0JWYlRYU3FPSFluUTgxNWxITThPeUFa?=
 =?utf-8?B?WHF6RDByUkdud0VOTU1ZVVIzbnVpOG81VHRYRmJOT2pZVVZSOWtGUmlBdjFB?=
 =?utf-8?B?VGVWOUdLRHEvNTRZVXFiSTZKR1dUN3A3cE9SUmVicmd6TXB1aXl6dEtCOUlo?=
 =?utf-8?B?UUpnWWpnMmxEODJpK2dFU09ITmVCSnF4T2ZiTjY4ektrZ0hqS0JUaXZuYWhR?=
 =?utf-8?B?QVNFOXRvR0RwVytjR0hHMHFlMVNMSHBEQjFGYzNhd2lvNlpCUy9ZWmxTcnFP?=
 =?utf-8?B?eEo2eDBzV3JsR0VKSVdqVi9vdHlJZ3hVd0VQb2RmMEFjNmQrQlIvaS9PL1Jm?=
 =?utf-8?B?VC9lcFV5SWNpVDQxWm5lZmZ0NjU5bUJSd1BsRVNQaENGVHQ3bEk2MG4wU1gr?=
 =?utf-8?B?UThQQ1B6TUZ6OXVhMlhQVW53VVlyMlduQUNRTFdqSGx0V2RMUUFhdCtIek5M?=
 =?utf-8?B?cW00Q3V6bzhGa0NpTUc4NCtYVGNuN0l5TWtUdkV1QUpaaldQWGRjcjJiTmJF?=
 =?utf-8?B?WGdwYXBJKy80OGYzSWI0V2lpUFlaNmYzNFlwMUxXU01rcnF6cFo4N3NLOTBk?=
 =?utf-8?B?c0pjQlpiL2hEVGlFZFhxZHpvVm5wS1JKajUxekpKQ2hWWjZmelkzTFI0VFpV?=
 =?utf-8?B?LzQ2VVlpbVZ0YnZCYUVNYmx6Q1o2eEhRK085M2h3dEVHR2R3dnJ4R1kwSjQ0?=
 =?utf-8?B?VlRUckdubFJoTzBIQWFkWlJ1TElpcmRPdG9MWTBULzAwTzZSME5IcFNWZTdU?=
 =?utf-8?B?ZWFiWUt0eVBoMVBLUTJXM2NvRkNjVFNSMi9uZEtjRHpBVS8vczhCMkYrS3dk?=
 =?utf-8?B?MTNkK2VQWHVuYTlYcUg0VzJzTEhhYXZzaDZYY0RDWTlpTDBXT1d6N0dUWnBv?=
 =?utf-8?B?SmtZd2V1bWZYVVBTMXRmRGZoVjJUbTBEcjhIVXZmV2duMWJkcUJIZ2F4Q2c0?=
 =?utf-8?B?WlJzQnFUZk1xOFE3WDFsQzFnZVpzQ0xtZUtZRWpTcUZDeGxMaTFOMDV1NDlQ?=
 =?utf-8?B?YnlkN0ZONWpwS2pSc25tcmx5Wi9sK2VHNytWWmxML2EzT1A3bGtxWkJYWkRp?=
 =?utf-8?B?cm0yT2hoUTlDakJiQ0ZLcnQrTVhtMGo2L2dTUmtXYTBPazBPMVFVdTV1cmZi?=
 =?utf-8?B?OHNNR1pLVGZwNzlkbzM0K2YxTUtZVmNBSW1od3pYQjRqcHphUm9lb0pzbS9Q?=
 =?utf-8?B?RUZDTmt1bG5CNVRpQTNhSzN5cGVhTGdvelJ5d2YvWXEzaHdncG1WZFBjbndw?=
 =?utf-8?B?eHM5dmFJajRCVjBvRFNKcUZwb2JqU05tTUNDdnFoZkRUNFo1WTR6VFdXbXFo?=
 =?utf-8?B?RGVzaGZYejlxcnJEcUdtZTRYSGYwVjNXTkpjSUcwTllhcERnZitGd0tPRG02?=
 =?utf-8?B?bDRLK0FNTENNUUliYkdvUEo5bjhIcytmd1pCTDduSGxWbE9DYXA3Y3M4UzZK?=
 =?utf-8?B?Z051ZE91QTN5cklyUG5paXcwQVRGTkxUaThocEhBWUE0WWZVYTNqcTVIMjA4?=
 =?utf-8?Q?JCO6PYeu2bw8Aa51NNshTUzTq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57794e74-d751-4ec7-d2b1-08dccb291f24
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 08:27:45.8819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCTiyZbPPSxLofxOfeyWB7+tQTHar6PI3NU1F5wz4v8wsEaLis7KvTCDaaeNGkwn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6655



On 8/1/24 11:44, Manikanta Guntupalli wrote:
> This patch series adds atomic transfer support to the i2c-cadence
> controller version 1.4.
> 
> Manikanta Guntupalli (3):
>    i2c: cadence: Relocate cdns_i2c_runtime_suspend and
>      cdns_i2c_runtime_resume to facilitate atomic mode
>    i2c: cadence: Split cdns_i2c_master_xfer for Atomic Mode
>    i2c: cadence: Add atomic transfer support for controller version 1.4
> 
>   drivers/i2c/busses/i2c-cadence.c | 418 ++++++++++++++++++++++---------
>   1 file changed, 299 insertions(+), 119 deletions(-)
> 

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

