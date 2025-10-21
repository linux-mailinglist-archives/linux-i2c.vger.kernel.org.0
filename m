Return-Path: <linux-i2c+bounces-13702-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A8ABF535C
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 10:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1E90E4ED731
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 08:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B424302144;
	Tue, 21 Oct 2025 08:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YqLr2UE3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011062.outbound.protection.outlook.com [52.101.57.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917A4301495;
	Tue, 21 Oct 2025 08:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761034765; cv=fail; b=Jq1ZYrvI8+jv88LT2jAun4zn2lec4due0MYmlhmxFY9+sNy0N+alKNPIbi7QSaL2Y7Nxlfb/FXkHdnSqFhLwQep900BQuumKAUv5gyRMyHsloVodzl1um0yfkbjDCHefUsjToqokdtYW2tgxetlHPDZ+V7NRel0kNPjRC7RyLKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761034765; c=relaxed/simple;
	bh=vEFyxu5j6L49aVSAhVF4tN6LzwL1NMJDWglK3mu3MW4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=n1NzchaxnK3EfD1kZ42+sg4QGb9tp9MQtdCmu2aZ7rIPElWd3YqseMW0Z6dFpHDks+a+3UEtdCS2523qEy3wM+FrU4tbvo5FNi14K+rgOUfkjO2C32IJ5z6twIwtC2aYUf6S57bpiswYKPytAapBRNmVyP5DOini81Ly2XUYY/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YqLr2UE3; arc=fail smtp.client-ip=52.101.57.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vp8A/mwD5jEv4I8FbmXJw6CvO37sC/oBud9KK6epolHpf7fcILabviYP6o7lu4UPt0N2HalNlldJrqC562Z/xwT0IsXe5OOLKcicUMJbIpC3KBXrDHlU+uu4Sd007aSYe8Y233PvfenLKzxCwNELWsmGapjHRvoTVz3y2suE3ifV/ieVZqPCRkEwIfcf0n10O4RHkGXNgjl4LrlANxJv7GfJw57LHbP6fcawH8H6vJK7Y9dpVhBBxValxGK0eOCJH57NJyJdKP0vzSmQZC9KxRVNFpfdPnfM+R9mFTQq1Uj0ex07jGuk7V4iwWRL6NO0UHZ11+AxfY/3UeWOE3/9Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4m9PjimqpVEpyRybw9nN+7h+XBPIDnhHuZWBNcxHgEM=;
 b=Zza+LO2Qn/pdvZXVz++pSNm3kK5q05XlJM6/UizL3RCs+jDU7Pvnk19Y5QyxxEzjiVbm/6/unJkNiLuHDraDzjKiD5TF/uOfOdvJWulhld2gAGE1JGKiuN1CUXDV7cXG5RnKNBicNnEDXp0inDO3pkXnbr0+m0LDPcl/W3pQbU1rQPhqRSKQg0MhkLNeiU7cDorCm/pQv5Ae5CIsP3kKOCyHHnJFoj3z5iHAs9xaVXpPDbJWb0MzQJYUgLF6+usgr0rXOWw54YGPsh2M/DGfkL+7WX7xwOfCNL94DtzhXIEC5Xa5A13vcIQqZmYu6O6JZG1yG7NDtyMXEGcTminUeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4m9PjimqpVEpyRybw9nN+7h+XBPIDnhHuZWBNcxHgEM=;
 b=YqLr2UE3y1csc/wypE09NiDCchygd1jmPIWRj2uNSFHxtg4OyRAU7p3GtCyVwtVOFOup1oY+VKIAIfcLrcu7i3tP02B9v04I9AFr3SXWEG5Wbp67jvC3ZCfXq3Urm+f2q6SJ9q/93xiX4yU+uz3UmV9dfOKrZy6dA/uIpMhUcF6WfYuoFnmMujF97xyCOACv9aZ3YlUFlY35iupOcu+fxu70xdkPqPM4mEB8BAX0xjedSJX/5j8GmB1EDli4lvp0HfCZMxc+Gn/eCjrIPMZkfT+3++IM9IgH6dbeoCBdQv6sE6MPm4I1lSMAbxXhVOmnjjD3E6kqRC3XoTzIWejyEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by SJ2PR12MB8782.namprd12.prod.outlook.com (2603:10b6:a03:4d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 08:19:19 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%3]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 08:19:19 +0000
Message-ID: <ab7eedaa-5539-4cee-aad9-422db9480038@nvidia.com>
Date: Tue, 21 Oct 2025 13:47:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/4] Add I2C support for Tegra264
To: akhilrajeev@nvidia.com, andi.shyti@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, thierry.reding@gmail.com,
 jonathanh@nvidia.com, ldewangan@nvidia.com, digetx@gmail.com,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251001064759.664630-1-kkartik@nvidia.com>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <20251001064759.664630-1-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::19) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|SJ2PR12MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: e71a0ee4-d4cd-4add-034c-08de107a8805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkRSbnlNVThSdGM0ZlpBeDg1UWdlZm1Ma0hKMk1QK3NWbjNHMURUdnZ6czlT?=
 =?utf-8?B?SnpBU2dlaTFxRVo4NDh3YTZ2QlhIR3dORGora0F5Ly85cGpoT3oxenA5Z2Vn?=
 =?utf-8?B?a0tRa0hOWnZXUXJocHV0WXNNbyswTkNUM1dzMUlwcGszalZzaDFNbHdsY1NH?=
 =?utf-8?B?c2EzeklTU2JSUUxtbmx0UGQwdVNXTVBzTGZKd0NneTJnY2NiSHdmakhKc0dD?=
 =?utf-8?B?M1ZoVGo3Nmp2SU1tYm9DTWxFdkd2bHdETUZBUVFKZXMvcXR0L0F4NlNBRVpo?=
 =?utf-8?B?Z2tWVU5Nb2pzSURUdmVDUktiT3pZZVZaWXNlMVlwS0Z0YXRpZFNNUml3OE9l?=
 =?utf-8?B?ZlptNGNIY3cwZjRoekJYcjBsdFlVb1N5RGFXak9rdTlKc1o0ZUxFNlRhdk9C?=
 =?utf-8?B?UWhiNXdsdkc4bTd6eFF1T1BnbTlJWlVoS0tiVU5sS01WUDNXYlBhTWppWC9M?=
 =?utf-8?B?U0tNV2dzaXZpWWZRNC9NRVpLVWNDMnBNNmZhTGgzVDBhRmFZVkZkZTlRblFE?=
 =?utf-8?B?aWpRbGVER0lIMVNFeE5xeVZYRjdUTWJPRlVnUm15YzFzZlF5QzZDbTk3SnZq?=
 =?utf-8?B?TS9MbUxQNlFMV0tNYXFNVjRIZExQMUpQT3VybjFyMHFsVFVMckNTOGlCaDVG?=
 =?utf-8?B?ODA2K21iaHoyMEZETUo4U2pIOXdndkZTaFQ5YTZMM0p5Wkx3TTFwcmR3anN2?=
 =?utf-8?B?aEd3RGhoNWlNUDlDenkyN2t0SWJ6UlV4Z0hRSVhHemtUUlUwL3p3QUNpUUZh?=
 =?utf-8?B?aVdnemtmcm5LdE9yaUFpNGMzVzRDT2p1R1ZGNTk1REJic0Uvc3VaOGtZRG9C?=
 =?utf-8?B?SHNIUlRYQUlha2ZmSWxGNFpFZEpWQSs2aUwxMUd3blM0MTVOZlJtRy94dkpn?=
 =?utf-8?B?SERmeVFPeGU5RXU1VTNlaWhKeWZQNTdCV2M5YmxDaEdtcG82a1dLZlkzcXBT?=
 =?utf-8?B?bTFNV3pHcWpPUjBQdHcrZ2pBaWhPY0YwVHdHM1ZHKzdrejJmbUVwcFpJRVdG?=
 =?utf-8?B?c0VMUTNyRmFXckxSazhMdGNmM0ZmWDQ1dUJQUEE3TEhmTklZYnIyaUxBMTMz?=
 =?utf-8?B?MG4raENXZmo1bUo2NElla3FrL3pYZlZPZHhEVGZ2WTNoVnFDQzVIMWRhbzkz?=
 =?utf-8?B?bUR2M29aUVJiWHp0SytaQ1NmZHFYZktCMC9Rdlo4eTl3OUF2dDhkMkl2MFBO?=
 =?utf-8?B?UWVNUXVQY0praTV3TTVXWklCN0lnaUUrejRZQWhkM2lMK3BLRW1qS1J6T3Bn?=
 =?utf-8?B?dmVJY3BTVStTMkt2bTBDQTF3NGxpNkZTSEVzZWkrNlg3V1ZEc25rK3BRQmJ4?=
 =?utf-8?B?Mm9XLzAyelRzSDVmb3ErTjYrYW9rL2xKdFJEd0NvRmNZSldibUl5THpqalQ4?=
 =?utf-8?B?bTkySlFZUkRsS0JKYTdXNk1YRFl2b0ZjZEdwdWx2OUMyQjJ4S0VPNFRKcmJp?=
 =?utf-8?B?TXpHdGVBMXVOaXdTWWhmMmplQnpoV014bW5PMFgvYkJuZm9xanVERGx3clNz?=
 =?utf-8?B?WTN5THRCY3RzTTE4QlE3TXlmYVB6bmowZE1qVGRsR1RGcTBldTF3bUt0cS8y?=
 =?utf-8?B?K3pEaDFEVlVnYmVpL1NkY1FHU3c1S0N1RGNTUFdLTHhIdEhqYjNYWUMzc2Fv?=
 =?utf-8?B?cEgvT1J4b1VEbGRVeFlKQ3BrV0gyd0ZEK0JEUU1pdW51VmNUVVh6WWxLcmJF?=
 =?utf-8?B?MEtJeEJXbXRZOWpBNUVwMCs0MTlWd2EvUGJWSHRvdThGbDFKL2ZkbERQL25m?=
 =?utf-8?B?N2ZlclY0aTAwbEhCeTJUU2xaTU9wdHp4ZFhveEx0clpWbWZqV2hGRE44M1JJ?=
 =?utf-8?B?bEZYMFNvdGZ4ZWpCNTNCNnRvd3NTNjhZMStGSVlRUGRpSzc2OHZPN2IwOXMr?=
 =?utf-8?B?dTJVOGp6YWxkaDgyZjRZdllFM0lINGJyZmI1ZE81TVoyRE11dGZqdGRJSmdV?=
 =?utf-8?B?ZUMrVHpCVkNCVU9qMDNmRGZ4Z0c4UVc2Y2pwWXd1cjF0c0ROdUFWQTZJOTBk?=
 =?utf-8?Q?os32uHIYnLkqLi0fL0S4tl/nfDS3ZM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0dSVEhQanN0MHA3cVNLbG9IaGk5ZTUzSnFreVhzeDBiSW5mK3dzdDhmNnNU?=
 =?utf-8?B?eU5OUUtCejhkMTZkTmR5eXRqVk1XZkRTMksxUC9uNVV5b3NscHp0VlpIdkMv?=
 =?utf-8?B?YStaZHJSc1haak00UkRJdVJNOUFLbjM1S2lta3pVNzE5bVNtRmJwVFh6WldP?=
 =?utf-8?B?WGJjTmV0OFlBTmVMUDk3T01XNkRaSTBhc1lOaEZ3amhweWsvajhGWGFqdm54?=
 =?utf-8?B?ejFiTkt5Rjc2RFlKanNOSnozeS9DcjFKQW9GVml2Y21FWWx6NWtYWFFIRUk5?=
 =?utf-8?B?UThPeW45c0VLNDBheDZ0Y25tTGpFNGhQM1AvSE5RamtnQWIrNWxoMDVWMDZ3?=
 =?utf-8?B?QXNVMlJWNDVFS2lycnRiUW9SOENMaGprYkNiZ0g1TFZ3T3FvMFpNQm9EVHNo?=
 =?utf-8?B?L20vUTRXN3BTYkpXWnZ5VllHREx6VERnVWlOUjR1R0l5RSsrclNFVnpFYlpy?=
 =?utf-8?B?UU92YUR2UG0zM1QxMmtqcWdhUUgrUW9iOTUwa3ZWbngzUTBnM2ZxSENDNDlC?=
 =?utf-8?B?ZHVVQXVGeCtxS2MrTDVuZUZldWxvRy9SK2l1THY2aUFOSkFya1E5ZUg1Rk1C?=
 =?utf-8?B?T0Q4YzFIdlQ3dkxSSXdGQ1RiYmFSaTN2ajhDWlR6U0huNFl1UlB4a29KVXdY?=
 =?utf-8?B?RlpCNWtvaStJdlBTdU1uZlovQndaVC9BLzJ2blRoTDlNTDRzY0M1NkcvLytO?=
 =?utf-8?B?dXdJS3BmRENma0ZiTjg0SUJPOG5tWE5EaXhlTFBWWEFWeEtjeDVSTi9wTms3?=
 =?utf-8?B?a05kNTFjKzJsUm1NdmwxYllxandJSHIybUV4ZHpkTXRMQWx6RVBUVnZJYUFt?=
 =?utf-8?B?WTJ1elF2WEI5b1p0Q0lSeG9BSi9saXhIM2NPWGlTdGthK3dvbXNtM2tvVHZ4?=
 =?utf-8?B?STNDQnFtTUpTM0NmYm5Tb3dzRVM4TjVPR0p3ejJYaDhkV003b2cyMldlVDB4?=
 =?utf-8?B?TlZBSWFnZEM5dmJFWGoxb3FiL0pyU2VNbjBIKzNFS3BoZHhveEJOSm5aZTJM?=
 =?utf-8?B?RUlRR204bXBUVlBnVzY3d2xYWVpxZDlHL1hkZEZqdmRCNERDNHNNM3h2Tjc0?=
 =?utf-8?B?ZDhTdDl2S0c2SEJzNGF4eHBlYTdtKzEwZDYvU0dTQ2QvdkRFWHNYTTh1bjh5?=
 =?utf-8?B?bUFqdXh1Qjhrc1l6WG4yaGlYUWloMDUxQXlBY0oyVmVJUWRtQlpBNUJOR0dJ?=
 =?utf-8?B?R2hER08rbVhkL2Z3aWRRWlZtR3JJNmJyditlRXFMcFB2Ty9iWGtSTjRJOUVD?=
 =?utf-8?B?WFRqZjRnTWVDVnJObVptYXI2WlBXYmd3WnZvRkdjY3VpelRiRnlSZkZSWTVG?=
 =?utf-8?B?ZDRVdjdXWXB3MWV5MGorRVdhR200L3I3Rm1iQjhxNzQrczV5QW1ZMlVLT0Va?=
 =?utf-8?B?MWl6M25NS3ZHYUlKTCtnVUFZbTJ0d3dhV0NiL0RBendGbmtCQ2tBN0x2MU1I?=
 =?utf-8?B?anNxT2krbTJHQVd4UHlDUWdNS3pyWFhxZktzSGdxWm1VZCtuQkQ4L2ExeWox?=
 =?utf-8?B?bVV3U2hSYkduMDlkRXVBUlp3TTAyWGFaSUErUmJ4QnI1bk9LcWZDN1FsTUdG?=
 =?utf-8?B?ckhGRkFzUG1jbkFObWpjb0dVNTF0VEdqWTFta1BCdzFxTUpoWEZEdVpRN1Aw?=
 =?utf-8?B?b2gvWCtocUhzVVVKdERZN3lqV016MFlsVjRuUXNBbVEzbXE1eVhhbExPaHY4?=
 =?utf-8?B?TnZPa2lvZEMrZnBLTFJMVUIvU0NkZGRsMnAyc2ozbVFaRHdBK1VFVnhvQkcw?=
 =?utf-8?B?VzNlWEp4UXV6a2lyb0FzQ3ppQmtjbU9XNFZIdUJSQTh4WkhGOWxaSE9Qbnoz?=
 =?utf-8?B?RGc5bWlnWnZzc1FMUjFWdnFBMk83WmxNT2tObjB6RGlKZWRGeDVTSGNqYnpm?=
 =?utf-8?B?eDh5dHBmMks2NjNrRzVrR1dWWlQwd1g3TWtMWnZVNzREa0ZOaWhVdDN1dlpZ?=
 =?utf-8?B?TG95eU9MckVRVUh2TjJVOVk3SUhuVWJGSkdhMFNZaEZsU2VjL2JhbEJkZnFG?=
 =?utf-8?B?bTY5QXF4cFBwRi9LcEtnNUFSaitkYTJsVnVZUTh6SW5aeCt2RDI0WmF6SlJK?=
 =?utf-8?B?WU1BQVFpSVhzMmlaelZlbUg0YVJ6Z00vYmp0NEt1YWgza2RLZXVjYTQyOURM?=
 =?utf-8?Q?MgsNt223gXeiP8e5/BOyX8PGd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e71a0ee4-d4cd-4add-034c-08de107a8805
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 08:19:19.1782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KDwc+Vqphj0Lux2IqSgqPM+0WdJjC/u+Bo1NlhJ4d7PG9KEWZq1sgU6VBgDDw+2p3aws27yRXmZVjfFrWs74Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8782

On 01/10/25 12:17, Kartik Rajput wrote:
> From: Kartik Rajput <akhilrajeev@nvidia.com>
> 
> Following series of patches add support for Tegra264 and High Speed (HS)
> Mode in i2c-tegra.c driver.
> 
> Akhil R (2):
>    i2c: tegra: Add HS mode support
>    i2c: tegra: Add Tegra264 support
> 
> Kartik Rajput (2):
>    i2c: tegra: Do not configure DMA if not supported
>    i2c: tegra: Add support for SW mutex register
> 
>   drivers/i2c/busses/i2c-tegra.c | 175 ++++++++++++++++++++++++++++++++-
>   1 file changed, 172 insertions(+), 3 deletions(-)
> 

Hi all,

Just sending a gentle reminder to review the "[PATCH v9 0/4] Add I2C support for Tegra264" series.

Thanks,
Kartik

