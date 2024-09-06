Return-Path: <linux-i2c+bounces-6334-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E629B96FB7E
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 20:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DD04281E76
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 18:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACF31B85D2;
	Fri,  6 Sep 2024 18:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="C6vUQoKv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C4D1B85C8
	for <linux-i2c@vger.kernel.org>; Fri,  6 Sep 2024 18:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725648698; cv=fail; b=o8b9vpd4Qkln1FF6xboV6NrYORAXObAXqek8ezuP22BUKcwNwTRHwUk58x8rqWt4F8DA6x+8K9iNCNG2sgCoEjCc3xf/Klu8EdbKuWo7vNZ4I3Isz59mRYgLKxB8J9qmnFhG6bbROYI7bzzq5+yo+JmfsgrmBuRZ5d2MHRsoC3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725648698; c=relaxed/simple;
	bh=mLYmDjdYAPWSuRkupK8ylqU1KnuE03SLe00VR4rmjUc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E+CUemagk/ObkL7j1Q8FRy9shE6I8+NmrymAYJWdikoHwyeVkcX4R/jtjbfO5L5lHXIsHSb/aOFy0Jmj+E+wohTlJuoi2/lo9glRkEG8ECPko0atwlD5wnu1seabLdjSnapgSML6DqZ/1HBrnBtoaCxhAg1BsbvSGDr4wMV/SIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=C6vUQoKv; arc=fail smtp.client-ip=40.107.237.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZAufxFuTDMKnUDx0NoY6kMluy9tYpevioN1p7MsNiA1iZD5wFD+bea5P/SXpooGTt4fNJLIABOVAFZcJJRuk3hr2lPB6BMTsMEDSPfIuJJJXygN0dBoleKVy1595XP3/j3U76qLWSII1Ol0Qv0Ifa1vZYlKqJ2v1WXBd/VUmR89B5hnp4PchqHVONQBkrb9nvbbA/VpW1z9x4BvVsPMpvmVNeGG/wr7OL1hakNTDC8ysIWym0UPQVHe/HEQA3vnIvfY95LBqrzec6nnr0tIoIMsjNBFUPriw49gRaGjLmV2fCl8FA5I1Q9PoyAXqdiTt5uYjDMF9h2nIR2GUq7HTxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6gbty14bF6eaY4JVH26bGFrbnlh3/lYFkn+g4V2W64=;
 b=DttvOGZ9FvEN7ZiFZ3N06clb4aMdWZHDKQDGNDQcdT37MFmajQ5UQHqZhJqdS4zX5copZ51YJ5R9U850BnM3mS+8KHXnVA0E7lNvPG0dGD0S7B8jn1fD6BP8ZZ0W4jK6v1yZtLayw5gtoAS/Ou3kMc1GMNeVNrkVU43dkb6ksq4vhbdluw9WuJsUIcwbD+PuS7h1r6USQVlKUocTdpU5Rn5zH6LXqlodtsYb5fpnW6/KpNKl7fC4AdDs7ElIYCiE5VN5gxu0ZhscykXEf+Q7UFL+Ta4QgGCpY8yZvNjDma72XzuglCIGf/n9WQI89J1cp6U9bQ/9KhZj9dcTz/y9JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6gbty14bF6eaY4JVH26bGFrbnlh3/lYFkn+g4V2W64=;
 b=C6vUQoKv6PvBnFSjhQy8nnWxxseZkqRweiCXpTHYy80TxPUDfZNrp9rNq93/bLBtT8Sxu2ETaDeofIE2K1c+U2StGAGpb1uulEUbPxTpyzK2qCzbgQFzMW8cafQYWkiMy/B4PBt+8tRVlbLuwIpi/OC/FAyuBNkF1x0ookfTJGs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MW4PR12MB5604.namprd12.prod.outlook.com (2603:10b6:303:18d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Fri, 6 Sep
 2024 18:51:33 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 18:51:33 +0000
Message-ID: <6a671a3b-d3fc-4a96-acf0-4c12a813fd1e@amd.com>
Date: Sat, 7 Sep 2024 00:21:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com
References: <20240906071201.2254354-1-Shyam-sundar.S-k@amd.com>
 <20240906071201.2254354-4-Shyam-sundar.S-k@amd.com>
 <Ztr0alsDWrBodtyv@smile.fi.intel.com>
 <cdc294e7-a78d-4a3e-a2fd-2122a8ea9660@amd.com>
 <ZtsUZfxeE8Tqf1OD@smile.fi.intel.com>
 <a4525896-8eba-4927-bb18-fcba1432f0e0@amd.com>
 <Ztsn8ZqWjY1P3qws@smile.fi.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <Ztsn8ZqWjY1P3qws@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MW4PR12MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: e93a552c-bb8c-4a1d-7832-08dccea4ed4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SG0zWnRWc2Q2U1V5N2FlOHZYL2lvajMrVm91VHdIUmN2MVludDVPeWdsK1Ns?=
 =?utf-8?B?ODFuY3FvV25KeDkvekhtUTZoZlJMaWJsVHNPU2ptL1dwMVB1OVRvNS9vbXgv?=
 =?utf-8?B?eGlIQ1A2eC8rSWlQREhJaUl1UWJMb0RkNmJlZ3lIbDEzdHI0SlRPS1VmV3lD?=
 =?utf-8?B?d1VrR0NJbUlERk0vbUt6bTdZQVcvWEFJam5jMy83eWhWdmJoMUxxamp5VDV2?=
 =?utf-8?B?RzJxd29lcnBVRGZCL1l3QkhqeUxaWmtkbFVKSWdnNmNPcnBPZTV3NFJWTFht?=
 =?utf-8?B?clZLSnlqclRESk9ZdVpCRnFFV3VEenJUUGR4VzVpTmVoaW5iY3FCdiszWlJq?=
 =?utf-8?B?TWhkbzhmOUdYQlJXMk5YcWFScldpYjhSRUlheFVxZFlNczNDOEFMbThLU1dm?=
 =?utf-8?B?RmZrOWNoOHZ3NWhMQTkra0VwQXVyd0lMRFBrakFOdGJxenRZWVd6cllHT2Mw?=
 =?utf-8?B?emVpclhHZmdrR2hZUDhIWmhlNjc2MmtXVm1HSytheWhLS1A0cXhSUGd4NGox?=
 =?utf-8?B?QitrZlU3VE9kUldLVVdmVW9ta1FiTzhld0FhTnp6eURUaUdiajNBVGlzUnVO?=
 =?utf-8?B?aXowcC9QQzlCRGJjNHZudml5MU4zNVZYRG1wcnlVMHZYbWlXR3VPWktLSWhm?=
 =?utf-8?B?QWJGM1o5WWhSNTBkWURzbk5xM3F4UG02SFN0aVZyMU1QcTlhNFNSVENXTnRW?=
 =?utf-8?B?MGtKL3pmM2F6RklPWmswaWY5bGlKWldsTjhXV2hsUGEwYjRyZ2U0ZGtLc3hK?=
 =?utf-8?B?YktwRTNac1BmbkdYUUJERjdKaGF5Ti8xMC9NbUQ2WmNhVUkvOUlNb0JBY3c1?=
 =?utf-8?B?b1REMG8vNDlXS29VSTllOCtMdEErOWIveGRCVUhWY1RSVTNTZjRlZWE3Vitk?=
 =?utf-8?B?alJMYlBVTVk0QVZSRnpOR25KcHE4S0FoVHEwMGhCZUtkTENrWGdyZWhVWkdv?=
 =?utf-8?B?c3EvdmtnamNMNk5PZlFvMU1aZTBPZXErV2JuUW0xTklIMnU4SGZCcENONkxH?=
 =?utf-8?B?TXdDVlFOZ0duaHNmRk9SWGFIazYzN1RjSXBIVUdPNlZuUEFlTFJoLytxWFhE?=
 =?utf-8?B?bDEvODMvMlhMYlVkTXI3ZCtOeEF1VllaVkNyNTBnOU80VzFrK0YzNEhRemow?=
 =?utf-8?B?Rm85V0JPc2J0d29Fa3FlZHlyeHpBYmZNUzRsV2g2ekJkbS9reDZxRGlVUWdK?=
 =?utf-8?B?WWJ5dE9tNHFwK1BvTEEwMjlKQ2k4dGlmcm50TnBnZk9yZDc4ZjdiQm9NS0tP?=
 =?utf-8?B?TEIwTkw4ZGdkSGpjcGpVOHRsQ1c4bkpBbkVCbG0xbzNFQVhqemErbDlTeWYv?=
 =?utf-8?B?cWZ3b3dKY1NXaktTNm5BUk5lUmd0NUI4b1NEeExPeGhPWE40WUgySEtaYjht?=
 =?utf-8?B?YkJITTlTVTIyMXlhSzBWbUhJb0pTOXlMQ0hLT2ZnZEVXWUdJK1FEb3lwWGRl?=
 =?utf-8?B?WWZoMFZLL3VMcGwvRGFiR1dyK0U0eE4yekVxVHpLOGczQ1d4QlcrSG1JY1h5?=
 =?utf-8?B?Yy9BdWF5aFhySGZWRjlZb2ptaGlJZjlqYzBoWGhUN0hWdXFwZU0rbW13Snli?=
 =?utf-8?B?Y3ZhNE1kdDBkb05qV1NzV0JMeUJHWFV0V0NpT28rVHNOMkFQUi85cjhLVDBU?=
 =?utf-8?B?cVkzcFhSNDVhSVM1VFBkT0JZWnZkd1FYbW8xTkNZWVNGbkNTWWFHbmk2aVQz?=
 =?utf-8?B?aEs3NFZFTHNnWlFqTEN2M3grVTlreGpDN3h0Ny9Gcm9STFc3bVk4Zmp1OHJB?=
 =?utf-8?B?dXBuMnlhQngvTlVDL1ZpeFlpTyt6c0ZFZUdHOWo4MVlOY1FFUTZmU0wxc1pa?=
 =?utf-8?B?bG42b3pOSXpaaHdFOHBxQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2U5cWpxbHNQSWtvR2t3NkFuclozVE9FNm9GMk44ckhVeW0wV2ZIM05hRXpj?=
 =?utf-8?B?S0dKMGM5NSs3UU5qRThiSTllRFJYSlNNM2dwOTRiSm9qMzRiSXRWdDdNY0Vo?=
 =?utf-8?B?TWlpdkJHMzhIRjZvWTUxLy92aWFGMU9INHpWK2t2Y3VJazVLb084R2NPeENq?=
 =?utf-8?B?ZFZsR0tWYWpNa3haeGJ2SWJGR1QxZi9PekRNY05oSUpiOExRWU4zK3B6cXJS?=
 =?utf-8?B?K2ltbTlxZ0xwRzByN1RtdTRmMlY4OU1NWjhyNXUrd1BXbVNXZ09ndmpuV2Ry?=
 =?utf-8?B?bU41WU42VjNRUGVxcE1aWHJKRFZHYUkxa1A1WmhpaWN2Y3NIdlpmYlNLSzBy?=
 =?utf-8?B?U0JVT3krL3NLbEFkcFNieGIwSjB0ZGhMaWQ4bDh3ay9oRkZhNEpZa05qZVRs?=
 =?utf-8?B?cnh2L2ZsRmhYa3o0Nk9iRDA3b291NERyNmc3emFoZXdjdVA2aUZmamdlV1pU?=
 =?utf-8?B?MnkvWi9wZnJHdjFBRVZOTER0ejRMRkwydm9hNUhUYVdrZjM5S2ljaUlvYWVy?=
 =?utf-8?B?VklHMXltSGtVWlF0N2JidDdNek96a053UCtyTU53ZktLdTRlZkl2SFdyT0Ev?=
 =?utf-8?B?TWsrN3ZsMTRWcmVFSkd4enU1TldzMFdHMXZqSzZFb3hZcjJWRzdFemlnZkdl?=
 =?utf-8?B?anVkdFJmN0MzTGRBMFFRWGNGa0hZWS93U0ZGK1lKWlJBMEZsdnZSaTdWMU9t?=
 =?utf-8?B?Z2dsaDFoMEJhKzQ4UDZEQWhFMFcwYmU4bi9PeHRBQW9iTGY2NExab2ZmdDZo?=
 =?utf-8?B?NlRoNmhOYTdwai9lWTlzc28rdk1icDNoN25jZnp2cVdCTjdsWjIybFJPVWlX?=
 =?utf-8?B?c3JTb2NZL0pITE9TdGxyUkp0VG84OTFUTFArUlVZenJZc3NtWkdVd2hYa1JT?=
 =?utf-8?B?ZTNLVUw1TjJEVnVYc2Z2NkFsNFErRllsNGwvcWlmdTQ5N1lyaUp1SWdJbUdx?=
 =?utf-8?B?cHRwY0JqeWhkb3czd1JYTFl4a2c5SmJ2a2VQS2tBUkpyRkxuMW9FZnpjVjRU?=
 =?utf-8?B?WmtWeVE3a0dtbFptWHBPRmY0M2V1NUdJcGlwbzFLZUYvYzZuYVRSb0E1Y2JL?=
 =?utf-8?B?R3ZrYjFwblRpaVZReXVZajBqamhoTDd5cy81VWRiUjlGbGNyNzBvTGVtWTVa?=
 =?utf-8?B?bjB6TmNMM3U0MHl1TXAyNmMweE5VZGo5cVpUcUxzUUpSZTBxVE1sZjNZd1Zr?=
 =?utf-8?B?L3Ixdy8zdGhWSW9oek9MUEx5Zno1T2pzUm1kN2NZVGRXRFBTYUdocVZsYW5w?=
 =?utf-8?B?c2xZM2dVNnF1ZVpVVDh1MTUwSEttYnpxVUQ0TVN4VjJsZ1pnc3lQc2hoNlhI?=
 =?utf-8?B?azFuYm01cG44YlYvMnltaktRUmIyWnNQd2loRzEzb2JQcWp4MnM3NFdJUDds?=
 =?utf-8?B?OW9iazRQR2pydHVWOTEyOUNTa3p0ekxGcStidEcvM0l6U1lZSkdVTTdNdEZD?=
 =?utf-8?B?UDZkZDVaOE8yU1d4aTZHYnRvOXpZV2hPbmlYWnh4YXBnYURhVFd2K0tnS2hM?=
 =?utf-8?B?dW84aEl1dGRnTGcwSXk2REQrR01CenZuQUNVZ1VXbkJIR3B5L3lqMThsM1lQ?=
 =?utf-8?B?MTh3YklrWHdJd1NxbGhvaFJ3RS9mbzA2REk4eUJ5WjZYd1IrWkRkVXdmbzRI?=
 =?utf-8?B?UUZGUmdnaUxzMVlscUs2MXBFVkhuSFl3SjJ3QkEyS3lCNTdMUlRFVzJYRXBE?=
 =?utf-8?B?d3RTcGRrZEdvZmM1RndaQVhQYVlpdk5Yd25tZ2NjM1dYTWw0MStuOUxnUXAy?=
 =?utf-8?B?TlE5VXNLSTZnRW40ek5yTEhCMi83V0cxM0tTWTVXeVpUcWhUVUI4R3ZUc0dT?=
 =?utf-8?B?Z0lHUE1aZ0RnRStsVGEyME9aS2ovRDNxTy9YRnBsa1lWMjRBTlQ2ODdqb25i?=
 =?utf-8?B?YUdCNkdlS2xMWktvSm5WelJNR2Z4VmtsQUl5d2RtbmVBcDYxZ1REelBZNjc4?=
 =?utf-8?B?UEJiZHVoNDJpVk96WTBNY2RwbVZFbXpBMDc3QkxkVDVPNVA0ZjRYY3VsOW8v?=
 =?utf-8?B?THRwTFRQRjcwY2JqanNWaHc4K0NKWHBsb1RtUnZNMmRrbFkxOHk5NHRlSTFB?=
 =?utf-8?B?RUUrM1BRd000ek5LbXhlcDY0em94U05PQ0RHaXRTMGQvTHNSTWFFM0ZLdUhQ?=
 =?utf-8?Q?iNFIzv0tXR+bMFlrUUSJm1suy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e93a552c-bb8c-4a1d-7832-08dccea4ed4e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 18:51:33.5415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TyHfOeDlp52Yc3niwmuLXXT55V10lT9yCi1pxu9lXtL7doaQHOgrpQRqrhhIyxWYn8MArlkepyFzz1dt3x+YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5604



On 9/6/2024 21:34, Andy Shevchenko wrote:
> On Fri, Sep 06, 2024 at 08:41:19PM +0530, Shyam Sundar S K wrote:
>> On 9/6/2024 20:10, Andy Shevchenko wrote:
>>> On Fri, Sep 06, 2024 at 06:50:48PM +0530, Shyam Sundar S K wrote:
>>>> On 9/6/2024 17:54, Andy Shevchenko wrote:
>>>>> On Fri, Sep 06, 2024 at 12:41:59PM +0530, Shyam Sundar S K wrote:
> 
> ...
> 
>>>>>> The AMD ASF controller is presented to the operating system as an ACPI
>>>>>> device. The piix4 driver can obtain the ASF handle through ACPI to
>>>>>> retrieve information about the ASF controller's attributes, such as the
>>>>>> ASF address space and interrupt number, and to handle ASF interrupts.
>>>>>
>>>>> Can you share an excerpt of DSDT to see how it looks like?
>>>>
>>>> Device (ASFC)
>>>> {
>>>> 	...
>>>
>>> Can you put the necessary bits for the enumeration (you may replace some IDs if
>>> they are not public yet to something like XX..XX or xx..xx)?
>>
>> Name (_HID, "AMDIXXXX")  // _HID: Hardware ID
>> Name (_UID, Zero)  // _UID: Unique ID
> 
> Thank you!
> 
> Now a question, why your case can't have a separate (platform) device driver?

I evaluated this approach before proposing the change, considering the
option of creating a separate platform driver, which is relatively
easier to implement.

However, there are a couple of important points to note:

- ASF is a subset of SMBus. If a system has 3 SMBus ports, this change
would allow one of the ports to handle ASF operations.

- In the current i2c_piix4 driver, the assumption is that the port
address 0xb20 is designated for auxiliary operations, but this same
port can also be used for ASF. This could lead to a scenario of port
collision. I tried to highlight this in the commit message, and you
can see some dance in piix4_probe().

- As a result, users might encounter an error on platforms that
support ASF: "SMBus region 0x%x already in use!"

This is why I believe it would be more meaningful to integrate the ASF
changes into the SMBus driver.

Thoughts..?

Thanks,
Shyam

> 
>>>>     Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
>>>>     {
>>>>         Name (ASBB, ResourceTemplate ()
>>>>         {
>>>>             Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
>>>>             {
>>>>                 0x00000014,
>>>>             }
>>>>             IO (Decode16,
>>>>                 0x0B20,             // Range Minimum
>>>>                 0x0B20,             // Range Maximum
>>>
>>> Typo in value? Shouldn't this be 0x0b3f?
>>
>> Its is 0xb20, that is meant for ASF.
> 
> Yes, I mixed up IO() vs. Memory*() resource. The IO() has two values for
> the start address and you fixed that to the above mentioned value.
> 
> TL;DR: this looks okay.
> 
>>>>                 0x00,               // Alignment
>>>>                 0x20,               // Length
>>>>                 )
>>>>             Memory32Fixed (ReadWrite,
>>>>                 0xFEC00040,         // Address Base
>>>>                 0x00000100,         // Address Length
>>>>                 )
>>>>         })
>>>>         Return (ASBB) /* \_SB_.ASFC._CRS.ASBB */
>>>>     }
>>>> 	...
>>>> }
> 
> ...
> 
>>>>>> +	status = acpi_get_handle(NULL, SB800_ASF_ACPI_PATH, &handle);
>>>>>> +	if (ACPI_FAILURE(status))
>>>>>> +		return -ENODEV;
>>>>>> +
>>>>>> +	adev = acpi_fetch_acpi_dev(handle);
>>>>>> +	if (!adev)
>>>>>> +		return -ENODEV;
>>>>>
>>>>> This approach I don't like. I would like to see DSDT for that
>>>>> as I mentioned above.
>>>>
>>>> I have posted the DSDT. Can you please elaborate your remarks?
>>>
>>> Not that parts that affect this...
>>
>> Alright, I have posted the _HID enumeration details above. Please let
>> me know if using acpi_fetch_acpi_dev() is acceptable or if there's a
>> better alternative.
> 
>> I am open to making changes based on these clarifications.
> 
> Since you have a proper Device object in ACPI, it seems to me that you should
> do other way around, i.e. having a platform device driver for this ACPI device
> (based on _HID) and use piix4 as a library for it.
> 

