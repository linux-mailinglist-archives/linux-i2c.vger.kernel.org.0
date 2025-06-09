Return-Path: <linux-i2c+bounces-11301-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A7BAD2259
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 17:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1442B1661AD
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 15:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4211D63C2;
	Mon,  9 Jun 2025 15:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BXhxtn1r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2065.outbound.protection.outlook.com [40.107.96.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88D51DA5F;
	Mon,  9 Jun 2025 15:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749482707; cv=fail; b=S0f1+IrGTujM92s8Y1dquEj5NYTYitZKz5TQAUAr3Q3GJFvFEhNLShvWchlbgLRy0l7mRb6L7S1wc6JZ6FinEsFLYLO0i2xzlqejp6mdUrCXXr0ZxwnvHSHXPMBpPpHwejFP7vOSzj9JcA5zc1heEK3s+CMNE5j6CxEewF+Plh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749482707; c=relaxed/simple;
	bh=anvgaNQ/fY2ZMVChraTk3U2z2X3OZsylUeXWKNnvNkQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uUnU7H0SEi8quCEqhqazKBAoySPJY8gyALT53cui70UMqmBpxxaRkPOujHYesOnRTcRAxDcgP0XHkjCVcctRINvUAQSsMEzmRZw7c9nzEaF++wHpSxaQ/Ze+rUdVdE1RKZzB3MQdAjIKv/EZXrmGYkEY+iHf/aEZmg1MPMeA6mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BXhxtn1r; arc=fail smtp.client-ip=40.107.96.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBKesu3HHk2S7Jn3m0VDaV+MB/GdCEwp7/FQOGa6IAOc4J+5SPVgu8S7T3bfNLOFLSVf4f+gtAtfMVJ4HESzkVHopil9bMSJNhKsimm4Mp7lxbFH5vcXeK9nxf/F1LB81XwrDYhkqXLuoulOuIQ58xaU0yC9m7Jek54e2efC6OQtDJwTleUBIAiUK/LeexXKa5NEFmUrgztHQLdBfvdv4Zs1uH+YNcD5taZlb3TGL2tCGQT+yOW8MaGVMvQhdyfvfkiR8gTCi+KHw6sCqyXcN5HlX9LOlxKvRpNSavsxhrP6HVH+rhd3ewtw/vZHBHL3a8FP+J0ePe68cnESpYfy3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkcxxUwCLf/I9hgJTNgw6s/KZf58MQ6e05olVGaTCiw=;
 b=FFJL6xxfzQxjbzXDUOnB66kflaSOLbXhMzpUjhn39W/isTu8SLvSWz6Nd+qrCAz52JY/WjflTRpwTXld5s/szzpVrL0494CXJO3fIL0vqt+AEF1m9rlqxEKElKRkieK1UPdLOTfhb+aHCNgQ+JZOFWtwjjBnCdd3uBUqDmcaDoC/vS50jGDvrFuMkjXfOsWBpBJnF6urHXv8CDdxWl4CWIbliRtTwaTqoIYYIKn4/x0McRfzGbiUUbbgxXdooOth8+qq5jwD7HMWspRDIzbsDRYVrxVHQJNMKzez70GsH8XmzMlter09c3gPFVNT8ER16joGkb8HrwhWRCjq4KzM+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkcxxUwCLf/I9hgJTNgw6s/KZf58MQ6e05olVGaTCiw=;
 b=BXhxtn1rqUTjSYKDa1vxQCSnTtJ6aaSLjAPwyf4b4oXTEJMJEupZc2V+ONvwZtMha6sbAPT0YYhkHxN4LEevV1DpLnYPVt1f4pSQjvClej7TUV/aaIcfGKzADbU/U7SUptbACOgZdzVmNIdweWvEGFEvHjJsJztBwFuWgkbGVQQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) by
 MW3PR12MB4426.namprd12.prod.outlook.com (2603:10b6:303:58::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.38; Mon, 9 Jun 2025 15:25:02 +0000
Received: from DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620]) by DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620%5]) with mapi id 15.20.8792.033; Mon, 9 Jun 2025
 15:25:02 +0000
Message-ID: <89e12865-3871-4274-b6e6-9ca7e0e12b5f@amd.com>
Date: Mon, 9 Jun 2025 11:24:59 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] i2c: amd-isp: Initialize unique adpater name
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: andi.shyti@kernel.org, rdunlap@infradead.org,
 Hans de Goede <hdegoede@redhat.com>, sfr@canb.auug.org.au,
 linux-next@vger.kernel.org, linux-i2c@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250606213446.1145099-1-pratap.nirujogi@amd.com>
 <20250606213446.1145099-3-pratap.nirujogi@amd.com>
 <6136cfca-45ca-5832-cf5b-f49e16f6ed5e@linux.intel.com>
 <69495068-fbee-f123-27f2-226eda8684b8@linux.intel.com>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <69495068-fbee-f123-27f2-226eda8684b8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0273.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::22) To DS0PR12MB6440.namprd12.prod.outlook.com
 (2603:10b6:8:c8::18)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6440:EE_|MW3PR12MB4426:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed5eb70-ba58-4ec0-ec62-08dda769cda1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0Uvb05ySnNubEZTYmUvdFdtR1lnK0lRR1ZiWDVMSFQyYjZ2MDNtVUZTOGVa?=
 =?utf-8?B?Q253ZnVDZjQ0UmFWS2RlWk1hWVFDT0R2ZXg1SlZTcnIzRGU2OFNQOXZmNm1N?=
 =?utf-8?B?dGZxdUZqdWRDM2Jvb0Qrb2dUaGM5aE5MWEVMc0lwUnBVaDRjcHBEUTdNcGdy?=
 =?utf-8?B?dURGQW5rb3Fqamp0TFVBT3IzUXRBeTB0a2s1Umd6ejRoZmxNc0hud0RGSDBz?=
 =?utf-8?B?eWtQM2VML2Y4enRCaHJxNk5HTVZKZmo5ekRRUytOQTU1S0tCcnY3UisvOWR0?=
 =?utf-8?B?Qzg4cFRyalp5YmpPMTJ2RGZkajVQZTI2L0xNSk5tNVUybVQ1UmlNeTgyZGNa?=
 =?utf-8?B?am9hK1dJa1JMWCtIOVdPWGt1NXZWYlJ6NWVDNnIzNjBjU1QrS0xYMlpESlNx?=
 =?utf-8?B?ZXBocDdPVVhwU3Bhc25ZUlpKRFEwSFREREg2ZS9HWCtweldFaFRXaE0rUVBS?=
 =?utf-8?B?YnZKY2NGZEhxRWJzdGh6MXJzeGRvbk9INkZaU09yVEY4VUxJMHZvNW9uQVds?=
 =?utf-8?B?bGNIREorN1ZJWGsveGZGdG5IYTl6b2NNWTZLcXlGNHU0RnFTTmE4MVZ5SVlw?=
 =?utf-8?B?TFNRNmpBNWFIRmIvUkQwWUxMOTgzUWUyOGtyd3JzQ0hwakVwaUlUWFU1ZjBh?=
 =?utf-8?B?NTdvdXZQNHh1Y3l4ejZMSEZJbGQ3TWp3K3FQUXg3ekFMelBwMklxeG02K1l2?=
 =?utf-8?B?OGhjR1RSdVJ3cCt5Z1JjL2RZTEhjeTNYUkZab3BuNTl0dWFld0FBSUFwZmlr?=
 =?utf-8?B?MTl5aEpGRVZqeHM5b0l6Z0oxcEdQM1NiV2ltemhXWkhsVmtWM1Myem85MUdL?=
 =?utf-8?B?YzIvMXNZUUQvL05EbzVwbExLRStRUkVrSUZpVk1hK0ZlUXZTNHJIdHRVS1VJ?=
 =?utf-8?B?U1NHZWVFL294dWU4OGZnbzBld2dvQVhmTmFoUmRzZmlaYU5yN1FCQm04VEdx?=
 =?utf-8?B?cEhIVituL2ZsejFhQTNwSzR3NUk0Yk5QOUFMUFNXWHR0N0tHNjFyaEpTbGdr?=
 =?utf-8?B?YWNDVVVCOUd2ZDBnUEhyS0ppZjlJSzNsY0ZqZEFoeFVGK0JOcElRVVErN0pj?=
 =?utf-8?B?eWQyZGY4cUNHRiszZVRDRDVsbzJJTG5pdTF4aGtHS3hFVzU3S1BmV2ZyWGVP?=
 =?utf-8?B?NktrMG9qcUxqQUxvQkRMZ2RiazVqdU5aTTVDMWdxc1RCL2NkU0Q2R1VJUDZU?=
 =?utf-8?B?bGRIcFlvby9uNXdjbGZLREV3SmozV1JoclB1cHUrbjdGZWxNN1hRNm54RXV0?=
 =?utf-8?B?aXFyMzY1UUI5ZnpEeS9OQXJ2aTFPVDhBNlIzNmxYQ0hQYTJOSjZlTXpEc0R5?=
 =?utf-8?B?OS8zVElHa014cWFYODVlRGZYWFpQWEMvUGpXbHVNUWgrOUhMTTJBOFJvU3lE?=
 =?utf-8?B?aWxZK3lMSktZYmV5LzNjRkVpaVJTRzM1d3B2YkNlUUNLWGNEV2l2c0pVT0dr?=
 =?utf-8?B?bnhKdDRiem1MM2NtWE5RcmlSdmZtOHFmQjNobWpxWGhlRWJZc0Q5SVFDaytX?=
 =?utf-8?B?TFRMb1lELzRGODhOUFM5NkIzVDNheW9rdFdqeG10V25tbnBpMGM5bWNzVUZ3?=
 =?utf-8?B?TzBublhWU1A5Nml6YTEyT0QrWGNBVTVBdnpKRmp0KzlKbjV1Q3RsRzM4ZHZy?=
 =?utf-8?B?VUJtVWlWdVhvWm5KRS9BbDRFSWRhQlY4eHFsOUQ5cjNTais3UERxeHpzaTFp?=
 =?utf-8?B?a0s0OWxCQ3ZZNXg3K1NkVmd1dTNyM2lpMFNBalN3dVYvTHFVWjZWd2hMcEd4?=
 =?utf-8?B?V05OTmh3cDJFSEtnTllnRnpMWlhzZnZkcmRCYzBNYUhRRWdpRTRFTnZWN1NN?=
 =?utf-8?B?ejNlTTMrQ0tIMDVGUVIvWllMM1RaRXA2Qko1UDBBamkxVDh5TC82Z3ZmTTdj?=
 =?utf-8?B?b0RsdWx5c2NFZmhZbVV4U3R0ZXVYbCtXMzJIU3FId1F1RU5wMXZEVSt4Wnhu?=
 =?utf-8?Q?+sTLd4gZuis=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6440.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDJUcWRQdWpYM2VkOWxuWHpBNHhYOHRCWCtuWkFtQ0dGTVdEZ1VweGZ1b0N4?=
 =?utf-8?B?V3ZqdlVTejUwSDJwZWVVQ1BkSzBJMUVYZWwzcTVYeUdBdkl3VjNLZ2hDN0ti?=
 =?utf-8?B?akg5emxUcEFiVmp3cXc1dDBPc0VyL3labWRZbUs5d09jMGVyZ2V4MEhqL0Fu?=
 =?utf-8?B?QXlyN0xSQXY2elIxUWF5SFh1bkVvdUcwMUFaV1A5UnVvTWJOQTFva2ZMRXNY?=
 =?utf-8?B?QWVtVE5meXA0L0lDZGxmaWFJdHZiWm5UUGV0Vjh6QUQ3ZUVzTnF0SFVmdFdJ?=
 =?utf-8?B?M3F4VlB0Tms5YUJ4RjA5MnlCbHZJMlRIVkNveVB3Vk1BWXU2dzVPb20zQXNx?=
 =?utf-8?B?TWpjQ3prU0RYYjZtcnR0VXpJeFA0d2dQdis4bEVwdWhzSWxEbmNRMUdSSExO?=
 =?utf-8?B?MVFnYlZqdUtwMmw0NFJ6NHFtNVZiaEV3RE1TRDllU2o4RDhQQjFOOUNaNmlJ?=
 =?utf-8?B?MkZzL0FUdzMwOFJCU0RuWHhXWGlZejFaYXd2ZFpObU1OdkZYOEpBNVRxK2ht?=
 =?utf-8?B?OXNrTFhSMDFtTitWZytaM2tSR290S1k2cjBhNzVHam5VdmpzZWZkbVRXYjdD?=
 =?utf-8?B?U25Bem9zNEdFbEJPRUFJdTZhZkVtT1g0ZVpoZHgyWGtiSEtZM0N6UGFWR0k4?=
 =?utf-8?B?dkVrb283L2t2ekZzT2t5TjFaK2FKay92d2pVRDR0L1dpQ3dvRHNMcjFyVng2?=
 =?utf-8?B?bkxnQ0NXYUV5eVhsTUlNNXRvMmI1VmphSUQ5cU4wRkF5d1J1c2YwM0grZTZt?=
 =?utf-8?B?RWh3Qnkzc1dTYmFwb1ZCUFNzSnhuZTk1VTdUTE1rbEM5MDhKNUl6dDJmdGI3?=
 =?utf-8?B?d2Urb0NhcHQxczNxVmVLZUFQY1FKLy9Nci9POUVFU05sQ1pxZXBERGNGQ013?=
 =?utf-8?B?TlJDNlRQQ3gxMUNTWDFHRmRpS3RIV25NMEhqYXc3ZndHM2NtT2lPQ3dFdEtY?=
 =?utf-8?B?STlNc0s2SHdmS0h4dGpYTlpmdGt0L05HQnRNVVFtSlQxOUlTbnkxMFBUQmZS?=
 =?utf-8?B?N29aTUlFN1l2R0VySlRCbW5CWjJhVjhzQUI5SDhCL0tCOE5VTEdlSDFvWUJW?=
 =?utf-8?B?K00wc0VjU1I5R3BsZ1pvYk5zVk8zK0hVY1hVUm03L2xDMW51QmhIeWhTNGI0?=
 =?utf-8?B?dHJUbkt1UUZ2bDc1azI4YVk1Mm5zbUpRek5aUHJWblhVTlRGSDIyR041R29E?=
 =?utf-8?B?cEI3QWhaRFp1dUNjQXBud0xBK0Y3LzhjVEpRSkhWbUFzWEZyaGF3R2w3dVNY?=
 =?utf-8?B?SGZUN0tVdXByTHdmaGI3UmFOalQ5bjJYeVVJOXh1QXVtMUJSRkNKTGZIUEJX?=
 =?utf-8?B?QUdmeVZMZU4yWTQ5cXZ0UTY0SXZjQkl2aVZrNnVRSnB3Y0JKSy80TWdrQlRx?=
 =?utf-8?B?b2xwV0VEV1FDb2lpUHd6TXBkSk4xQ2d2UVNudG1ydCt4U0dHUWYxZ09mTjU4?=
 =?utf-8?B?bmZ3Y0dvcGtSVSs4dEpjeFVsWkI4UENDMzNXVEdTWm9jbFFubERlV0wyR0NW?=
 =?utf-8?B?K1lIWStqdUI2Uy9KbGowOWhReDkvcHNrTGZTdWVnMkFUdXdNenhDOFZxZEVF?=
 =?utf-8?B?VVIzdVc1Wnl2OTBaTldaYzlDbUxpbWdGMG5jaWE1MXdvc0M1SUFrVjB6RW40?=
 =?utf-8?B?K1VJZUFyakx4WmdoQ24weDR4WW9GVFhRMEJWUmJIdFY2RU1nWHVGZS9HdVdu?=
 =?utf-8?B?Tk16elltNnAzMzdkQTczd05VZkp1M0FyUFlNZ29VamhOVGk5M0JrVU1JU1JL?=
 =?utf-8?B?a2ZQT1hIcWRhejNQSDFxM2NmRFVxZFNwWHFITUpUQnVSK2hZRDZOVEdBSXk1?=
 =?utf-8?B?dFQ0MDNiRmZRTDVxY1ZQRXJjVzV0ay9qbDd6SFNPQkVNendtaXd0bzRwb2Fr?=
 =?utf-8?B?WmkwTjZwM1pvWUhLMytGTDdySEU1T05RVnJ2aHo5b3VrUWhnRTVFTi9KcmVH?=
 =?utf-8?B?Q3ArN05oL1lvQW1RdEMvKzd6eEJMOUo0WHFwSXZUdWtkbDlpbDlXR29RSExW?=
 =?utf-8?B?Qk56ZlFXMlBCVFRQcHhkZ3RITFhBbGhSazFqVnl3NHlNTDY5ZlBDWHd6d292?=
 =?utf-8?B?YmdiQXVSRUN5WmNWdjROTVdrc2l4VnlvbnRoMW1IQlJ4a1pvVEZOTUJta281?=
 =?utf-8?Q?8ku+IK9k1EKtBx8EfRGbeE5rv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed5eb70-ba58-4ec0-ec62-08dda769cda1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6440.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:25:02.2267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zKaVwlLCzEFpedXP1sa6qeJLQP/iJtg920TZ+pg2NDgN5CXmQ8afuLy0KKPmcu5M/PGtYCSx6VRunxQF2Gc2xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4426

Hi Ilpo,

On 6/9/2025 5:38 AM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Mon, 9 Jun 2025, Ilpo Järvinen wrote:
> 
>> On Fri, 6 Jun 2025, Pratap Nirujogi wrote:
> 
> You also have a typo in the subject, adpater -> adapter.
> 
Thanks for catching this typo, will fix it in the next patch.

>>> Initialize unique name for amdisp i2c adapter, which is used
>>> in the platform driver to detect the matching adapter for
>>> i2c_client creation.
>>>
>>> Add definition of amdisp i2c adapter name in a new header file
>>> (include/linux/soc/amd/isp4_misc.h) as it is referred in different
>>> driver modules.
>>>
>>> Tested-by: Randy Dunlap <rdunlap@infradead.org>
>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>> ---
>>>   drivers/i2c/busses/i2c-designware-amdisp.c |  2 ++
>>>   include/linux/soc/amd/isp4_misc.h          | 12 ++++++++++++
>>
>> You forgot to add this new file into MAINTAINERS file.
>>
Thanks, will take care of this too in the next v4 patch.

Thanks,
Pratap

>>>   2 files changed, 14 insertions(+)
>>>   create mode 100644 include/linux/soc/amd/isp4_misc.h
>>>
>>> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/busses/i2c-designware-amdisp.c
>>> index ad6f08338124..450793d5f839 100644
>>> --- a/drivers/i2c/busses/i2c-designware-amdisp.c
>>> +++ b/drivers/i2c/busses/i2c-designware-amdisp.c
>>> @@ -8,6 +8,7 @@
>>>   #include <linux/module.h>
>>>   #include <linux/platform_device.h>
>>>   #include <linux/pm_runtime.h>
>>> +#include <linux/soc/amd/isp4_misc.h>
>>>
>>>   #include "i2c-designware-core.h"
>>>
>>> @@ -62,6 +63,7 @@ static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
>>>
>>>      adap = &isp_i2c_dev->adapter;
>>>      adap->owner = THIS_MODULE;
>>> +   scnprintf(adap->name, sizeof(adap->name), AMDISP_I2C_ADAP_NAME);
>>>      ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
>>>      adap->dev.of_node = pdev->dev.of_node;
>>>      /* use dynamically allocated adapter id */
>>> diff --git a/include/linux/soc/amd/isp4_misc.h b/include/linux/soc/amd/isp4_misc.h
>>> new file mode 100644
>>> index 000000000000..6738796986a7
>>> --- /dev/null
>>> +++ b/include/linux/soc/amd/isp4_misc.h
>>> @@ -0,0 +1,12 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +
>>> +/*
>>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>>> + */
>>> +
>>> +#ifndef __SOC_ISP4_MISC_H
>>> +#define __SOC_ISP4_MISC_H
>>> +
>>> +#define AMDISP_I2C_ADAP_NAME "AMDISP DesignWare I2C adapter"
>>> +
>>> +#endif
>>>
>>
>>
> 
> --
>   i.


