Return-Path: <linux-i2c+bounces-12065-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E885B14AF7
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 11:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 057E61AA3D05
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 09:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9740421A426;
	Tue, 29 Jul 2025 09:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W+FOfmRV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D188B7260D;
	Tue, 29 Jul 2025 09:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753780530; cv=fail; b=CKMCaGdjUpURPS+SqkCdEEEC5kiZ82WixZwbCSdS496cwApdcNE8mbrQvVgsZYXa0fs92a3VWiSxFTDFlR9oXjboGYbU+WH2tg/34HJLLkJcA4wMJCtsapF8U8EDpklR1UnxMKw3iQ6Q9M6Ss0NkaB8dGICxWLbsiAnkAohm+Bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753780530; c=relaxed/simple;
	bh=XAAwSA0DnpTkAMFDmBus3434bYEpj4cU1r/CxZ1Uams=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FOQRzx2A+YWRb77uaZB9Z0wU2Ae6yaGYOf/oIxDNE9oWsNNlUBq4R3dwMxq5gvygDWKHIY75krHCddrT8eDNcuCWEnbCt7rxwpisrnxGG3Pf5qGfRynFwgIigdSIT7QdRI+xeB3hBAmH/Hsp95EYLK4fylZo437nj2DCyb8/UiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W+FOfmRV; arc=fail smtp.client-ip=40.107.244.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qo20529YPxdP6MAeMJhcVgOe7h70YVXWik2UAkb2YJk4gB+uzHew92Kw/C5fTZUDCzFH+zeAoOS/lwNw4USa1Vk9M7kMvKbJiq7kEuG5Sx2fwshBMrkTxWJ/TumGq0yygz278nZ7REX4FCJ/fAqmJ6Wrz9b6u4KumUnl+hHbJsqkXjm0ZXk+DgJHVAOWu4CoWeCWa0nmAGdf4Iy0Ov6NSfEr5fjxmYRdRxrqMXnOSJesRCidJhdLhM6DzSDDIGz37ZFkbI78iqTv4ujC0SEzablFIpEks3Ak2f6yWzdeZP6xO9EJ8Y5fkYK+7al1JU9LRIMDzHzIF4bUQPtZWWcTWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mM6R6kU1pZzLg1FYvYE0iFfQEZI5UefNZe37qVteHdg=;
 b=odicFvSGZOEGQ/IChiO0/pzjJ6qsfoQp0mqHHjrRzW8R0qHM/MiXb8LuwYExpelv9qdhEBObyB+fUQ/xu3iVVl3dSe2hqCOYq2aOkAaFw5Sju4lEQTMmfKIGGbHPeVipWgjRJ3nbmV3TNpejOT/jpDpA1QJeWLgfsnh50kw3gG10X8tMSBviQkyKbqKsrV8xEDGJKCJIhvVztsCQQJcyAteJoEXwn6FpKih7FYXLFVYL4EuT7tMgOxGB25mgcIJthf+lY+egAJgUOBHTpPY5SWRcWCO/B3FOq9pynayjlmu/EU1t+2TODqI/fHYogAHYGCywHsk5c0wwYH5sT/KNog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mM6R6kU1pZzLg1FYvYE0iFfQEZI5UefNZe37qVteHdg=;
 b=W+FOfmRVQ4srXPvfcf9bT+B7kl2Xig6jrlYLN7seXSVszNTcv+eBftIoMrDQLatKXFGMm2tjikZ0btzKauywTAMlceWwRZve+9mhvBIlZcFCTO/xth6AR9Csub44lBGm/IPZ+ezPj801TeKaba3M3UXz09qQWt4taG6ROcqZSKWCt/R989cugHVXgMLiv9xoXmifyY5JFEx2B8JqapmMqLU1fI2ydbKZEo1kjK4KXIUg3+PKEIC8bMaLP6KsPDUH2IBHSDQbytkhon7PfdZSMUttALViKOBnIKPV9DJqOv1qRfwKOEo97V2c+Bcksfn4gJa6Yjy/Zqlf25HNmU5GdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS0PR12MB7509.namprd12.prod.outlook.com (2603:10b6:8:137::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 09:15:25 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 09:15:24 +0000
Message-ID: <dc4ed9fd-2da1-4d9b-b8f1-446ea0697385@nvidia.com>
Date: Tue, 29 Jul 2025 10:15:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/3] dt-binding: Add register-settings binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Rajesh Gumasta <rgumasta@nvidia.com>, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, andi.shyti@kernel.org, ulf.hansson@linaro.org,
 thierry.reding@gmail.com, kyarlagadda@nvidia.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, andersson@kernel.org,
 sjg@chromium.org, nm@ti.com
References: <20250725052225.23510-1-rgumasta@nvidia.com>
 <20250725052225.23510-2-rgumasta@nvidia.com>
 <1a6f4194-de77-4dca-b2e8-2b51a106d770@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <1a6f4194-de77-4dca-b2e8-2b51a106d770@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0662.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::18) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS0PR12MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eb1e7b1-0491-4850-ea5e-08ddce807389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnZ4WUlvbWRQZC9SZUV6TW1XRFV0Z0M5Wk14aUVKcWpyLy9ZWDhadXFZQlhN?=
 =?utf-8?B?SEFheTBLaW54ZFAxdDhZMUFsRlNNck01c0p6Sm5HQksrTjlhdmo2RmpxTGhP?=
 =?utf-8?B?L3g4YXM4VldxMUpnR2xKblRINVFpdXNUaFVGcE1EQU05RW4rRHJXelF1RDBn?=
 =?utf-8?B?YzIzNW9wQnlHOWlzZWtnMUJqNGxESTlGU0pJSEdMR0V0TisyNHhSU1hYU3VV?=
 =?utf-8?B?b2pCdXRuZkd1M0luYVdFNkdxbnRROE5tUUhVbEdjblgzeTRXKzYycHgvWHMv?=
 =?utf-8?B?U2tqTXRoeElTQ0FLUmFIdXp1eG1SQ3dWL3IrZzB4UXhCZ2xjWGN0VDRqeXpI?=
 =?utf-8?B?THNQZ2ZVc0p0MGJxNEhXb2ExRmxpRXRwTkcvMGNrNXZtWjhpYkJmOGdzWjFU?=
 =?utf-8?B?M0ltRFRZM3FvUDVxczB2N3RPZWFqTktQUFZYRkt1L3M3cDE4T1R2eTdUMDNS?=
 =?utf-8?B?R1VsTjRRWGNOWGNmYTVBWXUvMFh1bHFid3NsR1VXRSsrVjVNTGw3SER6UUtE?=
 =?utf-8?B?Mnk4L2N3SCttbHBFc2pJU2dTTXJUVkVWNCtydW5ZLzZUclpEUlRKSnlRcFgr?=
 =?utf-8?B?UFBqaitaY3g3c1F1Nit1ckJDNjk3RUZJY05WaXJQTlRyVjg1eFA2OG1zd1Zj?=
 =?utf-8?B?V0dNNmduaXd1Mno3c2I0Tko4aGE3OEU4YlUrQzI4RXdxTWRHUjcvQlBTZUZS?=
 =?utf-8?B?OE5WWGVTQnhhL0o1NkdoM25UcG1CV2RGYWZNNW5FNWNyK3R1NkdXV3M2YkJy?=
 =?utf-8?B?WHMwU1hVT1FYN1Q0QzZGakNoNXMvYWlNb2Q0MHd0amx0c3IrNDhSUTFybzJx?=
 =?utf-8?B?ZGdwT1ZWT2MrTWNoOCtGYzJ0VVM4WFhwNDM4bmpjdEJHVVJtTXZ4TjllUXBL?=
 =?utf-8?B?dHVuYTUxMGFTY0Y5VXB4VXZxZERZeXA4UlhFaHRjRGRybnVyS0hwOWFBTTRr?=
 =?utf-8?B?Vm5pQUJLbTUwMlhvdUo2Z29YekNoMUl4MU9NOWpHcmpNUklOQjVsdlBXaWZR?=
 =?utf-8?B?Y1dwN1F1R0ZEOUtaeStkdkJ1UDErMklBYzFCQWF6Tk5QbWtLUzhnZDRyTURm?=
 =?utf-8?B?QU5LSlNMZUJpSFFENjY1L2M3alVLc21Pa1BmdnlYeERvaGNVQzMxK0dOeTdB?=
 =?utf-8?B?dUdFNkxXUWVNdk9hVERKZ0hWZlUxZVREelowdlRkY1Fpd1NqMFBJTzVBemhU?=
 =?utf-8?B?VThvUnhRSjVCZHpGOEtUTThvWTMvRUhUOE41QkZQcG5XK2s4eVJUdHdxcVBV?=
 =?utf-8?B?eFJ3R1VUcmNGcWIvRGlUd3daUEZOUngxN2RmT1MwRU82dUNnamdDcnRLcGtX?=
 =?utf-8?B?NHpXZDE4ckVHTlhpTUNyQjZSMHM2R3p6eXBubTJOVU5LQUlWZ29OVFB5Q3ZF?=
 =?utf-8?B?dXBZV0FRbFFVditqRlgyVmZJU2lrM2MxV1hVNmNTNWd4bFZQcU9iK2RBdWVr?=
 =?utf-8?B?YUwvb2hMSXR3SU5MbUVlQU4rV3N5dmxUWHpNL2pqN0ZoYTJVeTQySEIxbHkw?=
 =?utf-8?B?Skl4UnFWNVIwWFZ6UzhkalNBcDNDZ1V1MDF5MHRYU3F3bUZsenVocFo5QlV3?=
 =?utf-8?B?SVBkejI1eUpmRGkvallKZGFGb1ZJR0xlZkdoQ1N5RGRaaWlraU8rdUwxaWJp?=
 =?utf-8?B?d21VdkRLZWh1Zm9yMFExaXFXRW9weXBicGdzbktxYlI0OWlGODE4NTU2d2N5?=
 =?utf-8?B?S201d3RiWkVRdWRRRWx6c0dnOFRCVFZnb3ppbWZIYjZJMitsUE1qL09iS0di?=
 =?utf-8?B?Zm1lUS9KV2VIMTBGWkJnckNFM1k0eWs2ZDJLRGtxcFFGUUV4Wm1iRk1CcjRL?=
 =?utf-8?B?Y1FLNVhXVDJ6bzhONFRReG1JajFUWHRaN3lwcmZuQ1VUS2NMVHRVY1FJZU5j?=
 =?utf-8?B?dkNqZUphTFIyYlgybFA2TWM2WDVQZDZzdXI5SGNBVFJIeTkvOVNYbXdLdC9U?=
 =?utf-8?Q?eMo17W+q6jk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTkwVEozK1dkSWYybzlDa2FCR2lOTG5Bay92NHQvaHFIQTRiRGROTUMyUkJ5?=
 =?utf-8?B?ZGZhUDgrdGdtWTM4TFpBY2NzbjlBbkR4bkVtSnc3TWNJSGwzaDhKcklnMlg2?=
 =?utf-8?B?dU9nUkhoOVVOWjVqVzJLdUc5aTNOaisvZjkwcWZLOWN1RUJxelRjYVErUTRi?=
 =?utf-8?B?eFdzMnRDcVVPMmQ5SHBuTTJURW1YaHAxUGhlNnVucG1iQVdQVEVhblY3SE13?=
 =?utf-8?B?VjlTUzBRaXpVZjAwbytxME9qSmdScThPb3liL2VCbjBvbFhMTyt5SXJ1Qm9G?=
 =?utf-8?B?dlNqaUNFdi9LaXNmOVFUWnh3NVhnYVQ5NFlFOTZybGlma0ZZaklMcy80UVdm?=
 =?utf-8?B?RXFSenVXeHpiWk9zemRNbWlvQVhFek5qU3FiQmo0US93MU5pNlA0NWFYMFRV?=
 =?utf-8?B?cFNwMmFsN1dkUUhoTzc1Q1JadHJIbkpKS3lnQlNJVUNwZTJ4OWkxc05wam9R?=
 =?utf-8?B?V3BYcVZmdjArKzF0ZVRZTTJmVzdVeWVTTWxpa0JsMzAzb0FyTDRabXl1S3pM?=
 =?utf-8?B?MERVL1VDZFJGNitkSm1HeGpJa01jencxa2lkUVU3OGEvZUxHV1lmVWJtRWd0?=
 =?utf-8?B?d2VvcC82cVBud2FkcTlTOUp2QlRyaHQ4QVZaRGhRaVRmRkRKRmtYRTd6SHd4?=
 =?utf-8?B?dWhFK0tvWm1ETHBsSDZnUGwvZFRldTVhcmdXY2hGa3dzMmNnbVU3UG5qWGUv?=
 =?utf-8?B?UHlsYkh1S1ovMHhKcUtBT2Vjd1ppU2NkVVBza1JjT3had25tdTlnajVuVkEr?=
 =?utf-8?B?eS9NZ0VRL3pqbXRNRFlLSFc0YlZEam9sUTNQaWxpRnRvSkY5bGpzbDU2RGpq?=
 =?utf-8?B?SXVxWVZBMEd1eWlOU0JRanQ4ZjdzbXB4azFYUXg5VEp1ZTUydU5FSXZ5ZHRC?=
 =?utf-8?B?VUZIQnFvQ1hGYldFS3U1Q3owbWV0UUlKSzB6WlljcTBJT0J4WTVjWk05eWtV?=
 =?utf-8?B?MnNoaE1xK04yaU1hb3pCWnhZZmdBcnh4eXpERk5RaHJJMDlGZnVTbElrZStN?=
 =?utf-8?B?OHZFaVUxYVlMUU42RUMybWo1NXdsSDNyZWM1TUs5NmU5SmdMOCsyMTZmcVVI?=
 =?utf-8?B?N3hIcmNIbjVyd0l3V21TWG5Ncks2T1l0T3pHUlp2ZkZ2cGxVRm9TMUkzVWNR?=
 =?utf-8?B?S0diZzFPNE1uc1M4U1F4d1YrcDA1Y2lMUlRUSXh1RnBidDVremN6Y3QrNGJM?=
 =?utf-8?B?eklHblFkYVVOd1VEZHRwWTQ1YUoxOENILzZJeDZLWFY2VFZxNjQzMmpZN21H?=
 =?utf-8?B?UDRVZ3ArK0J3NEI0VHh3NXVyYVlua3pBdWlWdUhPTWVOQnlaTnVYQ0VsR0k2?=
 =?utf-8?B?SDBTL1h5R0hzZHlEeW11OUxOZ3RkbFFNREJQdHR6OUM4UG5nWnVrcm0rOE1H?=
 =?utf-8?B?L3VyTTVLT3ptbU1oV011NGNiZHRaQ2w3M3psaGVEbFpLTEFOVE54cnV6cGR0?=
 =?utf-8?B?YXlEcWlNK0V5cTA5Wk9kRlhTcG1TRWQvR0tNM0l3M1JSZUsrL0FuQy93dWtE?=
 =?utf-8?B?UTJTQUdLR2Y1dDJLaUdoTkJkL00zTUNrRCtGYVZZT2NjRmpMeUhTQkEzMU5B?=
 =?utf-8?B?YkIyN3IySS9iNVZHWTJFUWdld2hWZisrTk1YTTFDSGRLOTNpRVV3MHdIcG44?=
 =?utf-8?B?QUpiZ0UxNzF3ZUU3Zm9hMlp3S0NSOHFQZnc0dlI4cWFuaCtXYjM1bmVwdGJI?=
 =?utf-8?B?SzBtWVNtYksrRVV3bkREY2VRUU9sZmhtNUMrRU8rU2Y1RkJBMS9kaUhJRUJU?=
 =?utf-8?B?UFU3clpQVS9rQ2JCanhVbnY4UVkwK1poZXpybkFvaVZYS0R0U0tLV1NMRHRw?=
 =?utf-8?B?SFR5UnplWGt6c2Z2TVhQZ2FVdUZCaWp3V3NYN0xqQ29ZQW9VSWNKMHhkUU9Q?=
 =?utf-8?B?RXpkZnJQZHd1cmdjRzZ2WjhpRDc4aVhGYXQ3bUNUekJpWlJJU0dCcEpqelI2?=
 =?utf-8?B?dVRrSFZVY1ZlZlEvL0FYUXhnbXZpaVB5Ry9pRnNsVjNOS1VqWWlWVFQrSEg3?=
 =?utf-8?B?UGxabVROb0JoaUtMVVBadzJMNFJNSlRpRHd0bGpBM0lQRkVRZEtpRkIzQVBN?=
 =?utf-8?B?WHd2ODUvWktNSE43cGRMblUzWDJtUW1OZCt1WjZGVDkvdEZ3bzhNRUk2Mzlm?=
 =?utf-8?Q?dzHFJTD3rmx5kaWUuc30Si+5d?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb1e7b1-0491-4850-ea5e-08ddce807389
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 09:15:24.7063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0tbA7a6ChGPpHaUpU5MCjES+7lKt+D0HzE7YsJqlPmlNgoWlBTTMYROrT1PDVlQ7TgQPOVSFdogz68KjjMKfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7509


On 25/07/2025 07:47, Krzysztof Kozlowski wrote:
> On 25/07/2025 07:22, Rajesh Gumasta wrote:
>> +description: |
>> +  Register Settings provides a generic way to specify register configurations
>> +  for any hardware controllers. Settings are specified under a "reg-settings"
>> +  sub-node under the controller device tree node. It allows defining both
>> +  default and operating mode specific register settings in the device tree.
>> +
>> +properties:
>> +  reg-settings:
>> +    type: object
>> +    description: |
>> +      Container node for register settings configurations. Each child node
>> +      represents a specific configuration mode or operating condition.
>> +
>> +    additionalProperties:
>> +      type: object
> 
> I don't understand what does this binding bring. It is empty.


Yes this is very much similar to the pinctrl.yaml that defines a 
top-level object that can then be used by different devices and those 
devices can then define the properties they need. So the examples for 
I2C and MMC really demonstrate how this would be used in the subsequent 
patches. Obviously we are open to any ideas on how if there are better 
or preferred ways to do this.

Jon

-- 
nvpublic


