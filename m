Return-Path: <linux-i2c+bounces-13483-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3750BD9FFA
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 16:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB3D83A7F21
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 14:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816B2289367;
	Tue, 14 Oct 2025 14:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HChGS+Wp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012025.outbound.protection.outlook.com [40.93.195.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A212030A;
	Tue, 14 Oct 2025 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760452242; cv=fail; b=FI+P+2G4cmHUAcYFD3uYf0lRNEG7jo5J3MDv2Xw/PKqNDF3A9ZMHhGQPyAAOTCSjaANiPLUNHcCWWsbsEwtOMoSC5oadgHbnc3Speh9nEgtcWjA5/fhvD/nBznUMGnXsSOR31zeG6HztGDUyHdoqYNCkfE5LKxjkWvvR3l20z74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760452242; c=relaxed/simple;
	bh=jL9X1MhSkYJUSTZHxtGORF/CPuav/KXcLD1qsnwOU5M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A4uTi1vbp7+UzfA3WYwB5lwF0RteSYpnFggA95gefTZ9BqRxKufGI+AOrvW380OajzGuiOZNi0zdfzb9ZeFoXwhg+3WANgUm+5uY0cXK0OVOVaLtUI7BozOdD1OP8RXL9dl/icaHFIjsvEYf/JkCxk2MQTyvPp32DbU4hnKsRA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HChGS+Wp; arc=fail smtp.client-ip=40.93.195.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxGD2LqWJr+7Le697qzln7+6KwOGYxID7PW8UhVmQeOJwcvS1rcHw3UuXYedx0cKlVToWAREPSPWKbR02DcWBkXkq1/bIrFO+7IDbWr2j0EyLqUd8Bh10KrIdy5omvT3yWVVHnUr92bmHRz7G+zNYFBRMlc2p+Qm66+W4cH7Q4CpsYkT9IOmuEuI5wUsPexEM6CmOD2MPwzfFq5aie18iSnYopfShzt5NPPIPtGZm/tnxpBYcFUeOChEuWPtao6EyLtwzV7pVVG9+VwRgA+/7peaD7NfmXa2HzuCIUAJqbZTWOC5JYYToNbHUNOHk3m3uLPz8u4FeTTG62Hj39ASqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWDa+Im2MMDmQq+FLjT6to84HkFp2B0j7Wyy5F1f1GA=;
 b=xP9VMw9VqcLqzrSqFFJjGNBYQDHGUnADPBuCRYJK68emWJvk6CajoxYUkh7lbRPYEn5ag0vIP7LwE8Uz/26xzW7n9Ix2RyLwleSEdlmeRxZYieEH/Sr8zi4fHnB8r1UMI46UVUEqlBA51yuccOaZ/Q6r9VhBjCtb7tD8+S3BMaoStUcRXB4s7FJbEkIO4rkaoacGI7/jPq/0ExSdAZ7rvBmX3Y3d0gXuiExxPf+wG/sy7hm+0Be9bJHmhKdDB3irnUWBEEX7Ta6NFXaT6DSQI6HsmU3j3Tanz3GHiDXGmrpdoKZRcBZs1tjsT49vlf+w4b4IzREY+GJIC/z95tFnnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWDa+Im2MMDmQq+FLjT6to84HkFp2B0j7Wyy5F1f1GA=;
 b=HChGS+WpqfxYyzN3sZOmQ8NVxhdUM8+xuvuStdy1Iz2+Pw9xnx71xk+qYSawBV8FJKQ20QzA8R9AAkF4Xrhys0YUUviN9MJIp40thGgX2Hvit6QJexClxC7mk8llj6eqCxWN5zS2P8SlIWAnZ5H+c/UInDp5rKArs0Nsd9vHFBvecMaSM30WSvbZ4xRZ1oNvZ37ll39pGQfheSxciYk3KUt6ZPVlH088Bm4vaz0eVjLzKdufup3Nc8YB/WrFPrL18+7HeH0kp1el1PxueN+9tHaNdu0U+k5xDMN+nplQyvMQeetiSe7K1DU7cOnZ9Zn/Jd3LAU6KP8HbREGdVhoFbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DM4PR12MB5913.namprd12.prod.outlook.com (2603:10b6:8:66::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 14:30:35 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 14:30:35 +0000
Message-ID: <7581aace-fe72-4c3c-ac12-2d80bc4a277e@nvidia.com>
Date: Tue, 14 Oct 2025 15:30:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/3] dt-binding: Add register-settings binding
To: Rob Herring <robh@kernel.org>
Cc: Chintan Vankar <c-vankar@ti.com>, Rajesh Gumasta <rgumasta@nvidia.com>,
 krzk+dt@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 ulf.hansson@linaro.org, thierry.reding@gmail.com, kyarlagadda@nvidia.com,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, andersson@kernel.org,
 sjg@chromium.org, nm@ti.com
References: <20250725052225.23510-1-rgumasta@nvidia.com>
 <20250725052225.23510-2-rgumasta@nvidia.com>
 <0784441c-9859-4418-a4a7-85ffe3ecf860@ti.com>
 <d619df1f-813d-4be5-8d24-295455f956de@nvidia.com>
 <20251009163333.GA2452939-robh@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251009163333.GA2452939-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0609.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::11) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DM4PR12MB5913:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ab28ea-f4e8-4add-f993-08de0b2e3cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2VBTk9KNUlGMnVwYVlITlBoM3paRm1NY21OTnRBU2MxT0dsVkthTXVrUmI2?=
 =?utf-8?B?RkdpN2ErbVJNREo0RDg5NjlDM2hFU1RmZW9QUFltUGorZWgxYjVzNHhlazd6?=
 =?utf-8?B?QXpQYmRJdFJDZDNyVGJiVmJaRnM3cnd3K0M0cm1JWVRvMCtqOHZUalFJYnJO?=
 =?utf-8?B?SjJnNFhXTVl2aWZITEc4cG9lTTRxU2RCOWxKNUZIVHdTTk9weDhwK1pEVTJL?=
 =?utf-8?B?MTVhNi9HdTlpR0cvSzd2d1ZKYnA1b3dkVzA5WHcvRnZCZlpsaWhmcC9RcXVR?=
 =?utf-8?B?c2VNL1hVWXp6MGYyVzNRelhHQ2ZQbURoSCttTjNqQVE3NXJtR0d3MFEvSzBH?=
 =?utf-8?B?em1sRHBvSWRLNmNOMHNKUE9XVmFod3dYWU1QOHFvT0s4SlRYZGI2SXJFZXkz?=
 =?utf-8?B?Wi8yU1pUQWdEUGpyOGJKZ2NHS0FkeUFmcWNPVmhpRDl2aWlmdXBiN0ZqdTdv?=
 =?utf-8?B?SllZOVhtZDlxRHJCRU03R3BCbjR4ZFNKTWpESng1MWhubDZGSVdwUGZuVWRo?=
 =?utf-8?B?dUhwaUY3T25hYk5RbHE2c24wcFdRSEdLNHVDYk1pOUpnMnhFWU1qTUlnUG5M?=
 =?utf-8?B?VjdJRmFWMUNVRStobWRhWnRVdjFDa3hkdmJCQ0F6YmZ2QmpIa0RuazlYR0JO?=
 =?utf-8?B?YlhYemN6OUlra0xPYk12SnNJais5YTdkVEVFb0ZJd2E1TFRZVjgxMHFDSzF0?=
 =?utf-8?B?aU5aYzRGOW1WK1ovOHlIVFowanZNVEx3czEvK2x3WWttK3F6bXNSZnIrR1RQ?=
 =?utf-8?B?VFBPWlExT01qREVneExNYzJmUm1OalBVOVYzSDRiWGZKS3p3Ri90V0I1dW5H?=
 =?utf-8?B?d0ZQVWxQdjRQeWIvTGRuTGRjb3BkdllQdjZFdUFOV1RuS2NSYitHd1RNeFFk?=
 =?utf-8?B?RjM2c05SbXMxaE9GaGVKZzI0ZS9tak1oV2EwcDFteW9VeWZ1YzFXN2h4OFlo?=
 =?utf-8?B?NVhsWlBLZ2VQU250NXFnV1dDUUNRK21Cd3pxYUkyaXhBbkhLbGphNko0aTNI?=
 =?utf-8?B?VlVwTm9PMWhkdTVaVGx1V1NoaDhjRVZGejNybkdtU2oza29XNmhTRzdkOXdw?=
 =?utf-8?B?VG9FV3VkZDdzN2MxUVVxTUhQelBHb2p4L3pkZXltb1JGWm12SnpFeWdVNkcv?=
 =?utf-8?B?cTJCZ25aNUJsdklIcTNWRDRXdGZwMTRkN2NpMTNRZ0pCNmlUWk1OV3E3UlRu?=
 =?utf-8?B?SjVCeFBpWlpob3FUVWVJYVZVelkzcGZNM3ZtYis2WUJuNDBlSWhnSDZIVlVT?=
 =?utf-8?B?TC9Ec0RVcWNHK01VN242UVdGWDA0RGdZOWQwR2tISGF5ZzlmdWJzcTRJU1pI?=
 =?utf-8?B?OXFlL3VCc0tkeTdROW1NWWtyeTdxSnVrNURnUEFJa3MyQTFNdGo2RDl1aVhW?=
 =?utf-8?B?cUYxR1RvZEpSeTFwMWJPV2EyS3k3SC80TWlFbjFQTmt5QWwxWjl1NitoZUZI?=
 =?utf-8?B?WXNZY3NIV2RNNjY3enkyZkxITzZrajhyUGsvSVp1d2FPd096NmlEcXZReUdw?=
 =?utf-8?B?c1VZYndNV3V4a1pMQTNSTGZVOEExWW0rNFd4KzR1cnBoUUhLcUMyckd2Q3pI?=
 =?utf-8?B?SnoyQjhjaFlyTGZ4RlB4amxWVGdvd3UyN1JIMnpnTkxhR1kyYitSSlc5Y0VW?=
 =?utf-8?B?WkE1dXFlanhTajFWOGNLMWVSSGxFQ0xucUZ6TVpKRmV5U0ZsQlF5dmtRQmxj?=
 =?utf-8?B?VkM1Tld3d0JnZlFSZlUrNzZEQzFFcWdjZ2hFK0tZY3ZhNCtPMHk5VDFNbUhO?=
 =?utf-8?B?QkRpUGRTbWUvSkVScjJWODdrQVZIcm5WSDY5NkdrUWtvZExhNU43VUErSksy?=
 =?utf-8?B?UkVxM203c3JuOU9rTjM0RGRwZnluL0FXN28xM1EwRWdJQlhsL0RxOWljeVBk?=
 =?utf-8?B?alZSWkVpMVg0QWhLV1ZkUk5qdk1LcnY4ZnIxdk1ORDZ0dE5LNUVhekVZUnVD?=
 =?utf-8?B?ZkpnME81dS9JcjNmakRDWWV1NUNHMVNoajMxT0lsc1hUTHVxYW9OelQ0Z202?=
 =?utf-8?B?eVplaTFraEZRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU1ieWl2QWdvY2p2RWY2cDg3MytoejI0QUtDYkhKazBVcmwyY0JoN3ptaURX?=
 =?utf-8?B?VHNZM0ZweUVCSDFKc2xaNnFqenRHTGlsWUtiQ3hsbEt6NDlNZm5RNGxxUXhU?=
 =?utf-8?B?eGlNTG01L1dKQmNKQ252b0Npb29rOFIrMEVDVXdZdUwvcFpzemMwcUIycnRy?=
 =?utf-8?B?aXhLSHJxWndEbjB1YUlVa1NTUWVkU3ZGdTl5MklkcFpNZUxtMUNMSUsrVDVN?=
 =?utf-8?B?WDBJOGp6azBpbWkzajhDbDExN0lMSlRLbXN0TGJhc2lqOGd1YU9YMmVJZmww?=
 =?utf-8?B?T2xDY1JFSmFyUStYQzJxaVgrZTNSMkQ3QmxEZ2ZjYlNJYXQyeVhINXh1M1hS?=
 =?utf-8?B?b21KYjdlRGZZWWN2enhiSS84M25DeGZHTkhtaDZPeXJOTEZCSm9XWjYzcFRZ?=
 =?utf-8?B?ekRyWU9FVjUxYW91cHhZWmcwZ0tVeDBDWjc1WGlOWkpHYWNNeDE1U2lRWmFz?=
 =?utf-8?B?L1NFUkQ1RHA5YnlZWGJsOCtkK2dVMDZJcys4K2pRVXdMRDQ3N1NZYTNyY0Iy?=
 =?utf-8?B?V1A0Z1RiMTBScVhvd2VIbUkxa3FPTFROZURsZU1WY3d2U1hWQ0VvbDBxYmFF?=
 =?utf-8?B?b3BJNVNkanlqQWJyZHVMakcvMHNoN3BBS0ZYZTg5VVhORk12Wnp0ODB2dXdT?=
 =?utf-8?B?TkxXYmh5T3M2c1RHKzAwS3RmLzhablRxL1FWL3FxUGxUdGw1YzFsOGVYN2FT?=
 =?utf-8?B?S1V0WHJXelBtai82NnZCSC85bkg0ZEM1Z0xtN3lOZUhGRURoNXhsMzg1Q1hl?=
 =?utf-8?B?aXNlSUJTSDZ0VU1yZk5FZTFNZTNxbXpIZ1JRUko3VVY2ZTRBaFh6OEpuVG9n?=
 =?utf-8?B?WnN5VzhNcDUvWGQ0WEhUSHgvTmVSNUc2a2JkeCtHTnp1RUNuaGxydFd2dEpu?=
 =?utf-8?B?Q0Z2SEJtZS9reS9tQ2FVc3hoNU9rMDBqdDRGc01mYjV6WFQyejIrQzduVTFE?=
 =?utf-8?B?eElrQ1YvMHJ4RmZsa002OUlTNU5JNis1b1RITkw1VmRoKzU0YnBZU0lrUEoy?=
 =?utf-8?B?QUtpQm4zU1JVcXNZMkdkdkdILy9yUjVRazJJWE5BcXpLV0RXcGZUSWFFS0I0?=
 =?utf-8?B?S1FKR1FGSTVWUTFlUG9DOUdUNXhYYnZ3RXJtVEZuV290bGFJLzFTcEFHRTl0?=
 =?utf-8?B?ZTREazdlbkIreXgxb3M3Zjk4MG5nMSt5RzFuRnYyY3h5TzZ4VENCRGlCU0Iw?=
 =?utf-8?B?ampwUzZNU1J3a0xKeUZMRmdTbmo3U1hQZS9KS09LWWxYT0lRaE8wNzEzeWRi?=
 =?utf-8?B?bEhnaHo2L3dTUnhzY0pIN0R6NStVTk5tWXBRYzg2QTNRL1QrWUtsd0Zoak94?=
 =?utf-8?B?NXkwT1pHd1ZZUkdsaldFQXdwMFh0dFB0aEpsdDIwOUVHeGZCWXpodjBmTTc5?=
 =?utf-8?B?MFgvRkZrYk83bzVQNkpWaWZWMjI0WE9HZDJyOGp6OWtUUitiT2xzRGp4dlN3?=
 =?utf-8?B?Yjh5ajhqMGo2T2VHdnRZMzRVemN2NjNWYTUvR3VBaFNvOHY5ZDJHVDdtK3M1?=
 =?utf-8?B?ZmxxRkdTd0JDM2M2VkV3a3oxdWVIZDdwVmJzVFlpbmFldGNLRWQ1MWVlNXht?=
 =?utf-8?B?K3U1Z2d2YUtwdkp0Q2J2QmowS0Y3NzJTTDRnQ0pmaE1rSTh4dURBK1lEVmQr?=
 =?utf-8?B?KzIyL3d5MzY5VHgzQk50bE1nYjdGWGdLaWpRblI4UWtscjc5SWpDWUE3c0oy?=
 =?utf-8?B?VnIrNXRPaUZnN0FWeUVJczBMY09rQ1huUEQ0S2dpTjJZV3hxaUxHWEFpbGNC?=
 =?utf-8?B?UGpCdmpDK0RnSG42dW40TzlQWHRIdWE1dUF2VEpJTjR5a0FpSm5IRmRnZXVy?=
 =?utf-8?B?N2Q2ZEp4U2dnS29EOUgvRkJxZWtSZ1VRakZNZ0tqQjVwT1Q4T0wzV280OWR3?=
 =?utf-8?B?M2ZNOWJ3VjFETmU0Z01KY1l5Tnp5LzNXV1hFNXh0NDVtdlN3VkJ0cGRacmsz?=
 =?utf-8?B?NzBodXB4UVNKU1FYc0NXVmhFL25HUjMwd1dsNzdkQXo4RmIwSFBRRHFuRDEr?=
 =?utf-8?B?aHlGNU40cUUrd1ordUtxSnVMOXFUa2ZMRTZVOXVBelVBYzFMU2U2ZXNRejJn?=
 =?utf-8?B?S3BuT05FNS80VnpPZ1ZvRFpMeVNjcE0yclQ5Y1EwRTVqMStnQlhWWFNiNEpI?=
 =?utf-8?Q?c/psdiuztoDeQQG9y/sSMhDcS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ab28ea-f4e8-4add-f993-08de0b2e3cbb
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:30:35.0291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MRxJ2ozj41Nbwve5ElY9aaoTPW4s96aih+9cV/+6XgcgH1w/YyJxzhHG7fsMKMtJ9zsNIR1xcuTl63bID6yCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5913

Hi Rob,

On 09/10/2025 17:33, Rob Herring wrote:
> On Tue, Sep 30, 2025 at 04:01:27PM +0100, Jon Hunter wrote:
>> Hi Chintan,
>>
>> On 29/09/2025 05:39, Chintan Vankar wrote:
>>
>> ...
>>
>>> Following your series, I would like to bring to your attention that
>>> Texas Instruments SoCs also have a component which requires similar kind
>>> of configuration, named Timesync Router(TSR). It enables the
>>> multiplexing of M inputs to N outputs, where inputs can be selectively
>>> driven based on N output configuration. A detailed explanation of the
>>> TSR and our attempts we tried to implement TSR can be found in following
>>> RFC series:
>>> https://lore.kernel.org/all/20250605063422.3813260-1-c-vankar@ti.com/
>>> https://lore.kernel.org/all/20250205160119.136639-1-c-vankar@ti.com/
> 
> I fail to see how that is related to this series. I'm not going to
> study these 2 implementations and imagine how it could be implemented
> using this series. If the amount of overlap is just 'reg-settings' node,
> then that's not really enough. More below.
> 
>>> To implement TSR, the relevant registers must be configured via the
>>> device tree. We initially assumed that the device could be handled as a
>>> mux-controller and could be extended in the same subsystem, but it was
>>> ineffective. Having explored both the approaches, we now plan to
>>> implement TSR within misc subsystem, which aligns with the dt-bindings
>>> that you have proposed in this series.
>>>
>>> The purpose to replying over this series is to inform you that we also
>>> have a component requiring configuration as outlined in this series. Let
>>> us know if you have any suggestions for this.
>>
>> That's great! Thanks for the feedback.
>>
>> Rob, Krzysztof, Conor, have you guys had chance to look at this series some
>> more? We are open to re-working it as necessary to address any
>> concerns/comments you have. However, this appears to be stalled at the
>> moment and I am not sure what we should do next to push this forward.
> 
> I fail to see what is generic here? There's a generic node name, but
> that has nothing else common. The 2 examples share nothing because it
> is all bus specific. But then the bus specific stuff is NVIDIA specific.
> It's the bus specific part that should be generic (to the bus type) IMO.

We are looking for a generic way to program values into hardware 
register fields for various different devices such as I2C, SPI, USB, 
PCIe, etc. Device-tree is a good candidate for this, because the values 
can be device or board specific. I know this was a year ago now, but at 
last years plumbers we did discuss with Krzysztof and other vendors at 
the device-tree session also indicated that they had a need to store 
register level data in device-tree to accomplish something similar.

So the idea behind this series is to define a generic binding for 
storing register values in device-tree that could be used for 
potentially any device. The aim of this RFC is to see if there is any 
interest for pursuing this still and if so, what would be a good way to 
describe this data in device-tree. The proposed binding is one idea that 
we had come up but we are not tied to it.

> A concrete second user would go a long way to help. Anything "common"
> from one vendor ends up needing something different from the 2nd user.
> Somehow that 2nd user always shows up a month later... So the rule is
> generally I want to see 2 users. Yeah, it's hard to get others to pay
> attention, but that's not really my problem.

Yes completely makes sense and no problem there. If this does not get 
any traction and is not acceptable, then we could just make all the 
properties we need vendor specific and have various 'nvidia' properties 
for each controller. It is not ideal either, but that could work.

Jon

-- 
nvpublic


