Return-Path: <linux-i2c+bounces-11238-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A17F5ACD59F
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 04:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61C133A7CC9
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 02:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCFF8528E;
	Wed,  4 Jun 2025 02:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BGsvhbrC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339D78632E;
	Wed,  4 Jun 2025 02:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749003981; cv=fail; b=cwDrH/r9iRzU3xw94yV+z2Y+w4c1qgTHCxxU/vDCE/LRq0MQTX9BnpEaJtvXaAzJ3h3Q4sFnW4ZgI9K/rk42bGONfd9VNA53u7jlvnzfoXZOEAKG5t5stE3CSdjUYwm2yRpV67xlgeJnCkDlnjZZeIui48a1YHfqjJlpixbCGjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749003981; c=relaxed/simple;
	bh=opm2cHmF4qNHBR5swPzXueGJo4RfRml5gkJ++U8PTJY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z1wVFArFwUumtmRLg4gz/1A815/248QvvCDXes3Hk9ndS5mchIZA0qQzRHsN3ZEYqn1ngURxYEBJIFcm7hh37AnTA1i/Ar59IpgZUfgDdah5SN7audM1ZR3XW4CSB3rHcdPYwAPX4AWDFw4YVvyT7CVCsBQ07L4ptUeIwsGrjp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BGsvhbrC; arc=fail smtp.client-ip=40.107.220.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IgZmmQn3VYttAHLVtsWbAchxECtlYol/nmazvblJw4sNWRP4y9WNI+baRTKmjSMsJMuE5cZg6Hic/Mogu1/5cuJefFXgJFycgEtWE0f9Fi43PqMKnbHqBZrbqmnrIlF0y2InMLInSQIPyCyqZLVBAAbasSfxWGG51N1EZJGlAvUxxwVC4y0kM7YQS4Jl7f/jNIm8IIXBlS+8OtLnSZwSyAT4xep7cZ0uSKS5lRxbeGAavGAu14EtUPpfcnv67tE3XXic97SRsA6axCzlHg2m9b3MC4r3nMuocsCrN9HXAnN0Bnt0AUuvdD0N4l6RupEPwElhsmOG71u3LuvNetQguA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8c6Z9ibM/ts+QTK73x5xP+tV1u07ThOenWpM3TyyoXc=;
 b=VBbEo/Kva/xESpcFGKr+RmmSMRtwWIMOtWYwDBWL9JQl5Yxpegz3Gv6+28KvTpIN574B60wDUWXmBgAZLtUmEJj8qT3696pdCjnOpqDjll98GdFzN+Wp2D5nM6Y0p3XlrflsBa8ShaTlnE7EQemhc3EGzMSCyc2Zs+teY47RM5sNiFt3dOwQTSQeuJFeVFkSp3xdeU0gpVbvqbN1minqSBrU1qeFK1+RrqlKnbZ74INmA/Sw/yhmYL4ZLABF7O2iWnEKjJVIuGhhbi6HqqHrsHTy8+xtbEFVdNESKQBZhC1q2627uu5wLzVp/sr7d88gytJPCWaJDlzFaM3mrvitCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8c6Z9ibM/ts+QTK73x5xP+tV1u07ThOenWpM3TyyoXc=;
 b=BGsvhbrCfjmSpocOqX258WSJ/G/UIzNQFda8XXQsciVb4caQ0Txcxmae10fO1a3cPQEWz6Oygsi92fAdVkUnSbz/pBlkJW+kapeGjVHesxCO63oxr8lZugZk4dgZ8PtvwxACsQqcsp7JheZxfu5mxmuvSH1NfIF6+7c55Spq0Co=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) by
 SA3PR12MB8023.namprd12.prod.outlook.com (2603:10b6:806:320::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.37; Wed, 4 Jun 2025 02:26:17 +0000
Received: from DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620]) by DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620%5]) with mapi id 15.20.8792.033; Wed, 4 Jun 2025
 02:26:17 +0000
Message-ID: <b707362f-728b-4a07-9ea0-6c18f69f851c@amd.com>
Date: Tue, 3 Jun 2025 22:26:14 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] platform/x86: Use i2c adapter name to fix build
 errors
Content-Language: en-GB
To: Randy Dunlap <rdunlap@infradead.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, andi.shyti@kernel.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
 gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
References: <20250603214611.3039787-1-pratap.nirujogi@amd.com>
 <20250603214611.3039787-4-pratap.nirujogi@amd.com>
 <9e21492a-96a3-4df1-9464-f572ced312df@infradead.org>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <9e21492a-96a3-4df1-9464-f572ced312df@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYXPR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:930:d0::25) To DS0PR12MB6440.namprd12.prod.outlook.com
 (2603:10b6:8:c8::18)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6440:EE_|SA3PR12MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: 56cad829-fd54-4e70-501e-08dda30f2f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWU3aDJxekJMT2habzdZaFpJZEw0dnp2REw4aUxsK2hISGNsU1JOaUNqZUdL?=
 =?utf-8?B?ZnJwWnIrT3hub2FSSTlmNGlFUVFrL1djU1oxWURlUVdoajVpbkdZU1d4RHZi?=
 =?utf-8?B?aXhyVHpqK1hDSVFPdSswTnMrdHRENnRyVmZHbWoyUkZydi9aTHdKcURmU3RC?=
 =?utf-8?B?MG5aWURkYi9LRG1ETks4Y1ZNNDNvUDMzaGYweHIyN0JET2FyRFB3dGpmellS?=
 =?utf-8?B?UDlaUm1wdy9oUllsSWZraCtvdHRJY1U1bE5EeTlGRy9XSGdaTjI1VzRzMGR1?=
 =?utf-8?B?aVk5RXRzWGtlQzdkOXgyekg3dCtaZXVOZGFCeXQySDEvUVZkUEMvdjl2aXd0?=
 =?utf-8?B?SWdzWnVMcHNKNUI0V09wUkEvOGNpeDdqaGo0RWR0UW9kYUhuTjg2bU9UVzZt?=
 =?utf-8?B?RUJTcmRma1NDSzNFMXUrcTdESUdBdzlaZWtuNTlQSXBlZXZTTHNvMjY4NHg5?=
 =?utf-8?B?cGtRS2ZyaCsrSW1EeTd3VkR4Qk9mQitSY0hyZ3VxYmNEQWlOSG5tM1pqZUx4?=
 =?utf-8?B?ekFHYVJ4cXliUThMeDUxNm1yc2l4eVNOYkV5cWZoSktQbnV6YUJsS2FtcXBB?=
 =?utf-8?B?dEV5cUw5VE84WThYMUZPbUd5eWtZZTNJQ2VxK3hNM1ZoY1hjR3NLRXR6dlBK?=
 =?utf-8?B?Qno2ODVZcVpNVjF0bUFZZlhSaUFSdnBjVmlSSTUrVXNZbWZubkFzNFl2UWVL?=
 =?utf-8?B?c0lEK2tDY3pJTm96NEZIbVYzRHoyS2NWOUYrenIvaXJBN1gwZ0p0Qnp2NFFH?=
 =?utf-8?B?d29KaHVJMFZOZzltWmx0Zlp3aUVQbi92bUtvN3B4VW44QTNxU1RyTHRYZFpi?=
 =?utf-8?B?R1M4RVBzN3pYb0N1TXAyVVVKYlJ5TGZEdk9KRWVJbTJldE5SWU56MjNIQ2VS?=
 =?utf-8?B?WElNQmRqRU44WkZlOGlkS2F6ajRTbjNoL0dmRGJRNjNCT2Z4V1pIaGpIbFc3?=
 =?utf-8?B?N21lMEFhNjc3Qm5PYnZMNi9OYVc5R0VxNytyZUkybXN3YkdlUGIvaHVaOGY4?=
 =?utf-8?B?a2JYMkpCNk9Qb3lGdGE0R3VxSlQxbjRkOHpJRFNSZlMxd25xWVI1UVAxbWJm?=
 =?utf-8?B?TW1zRFpIRDF0bER5NXM0cTZOcHQzdUhOajZHOWxjY2lNbjBJSUVEeU5UN3ly?=
 =?utf-8?B?U0hpcjkvb1RDbjRUTEpVdGoxcG81NFZ3ZEgvT1pIRCtxV3Bpak5Cd2xQUFBH?=
 =?utf-8?B?YS80ZlFnYm1LejZiVWNpT3RHcUxJOWtmN3NPM09sYXMvK0pqbTJ2d2plQjlJ?=
 =?utf-8?B?Z2hubTdWdGVubEFuMTZwL1hGQjZHaTFxZGhQWjlZREhjZDVYUFB6b1B0SDZx?=
 =?utf-8?B?TXVLT05TeHAwMFArQktLTml1TFMyYU1MRUk5YmVUODV5Vmp1NUJMV3JSWmFp?=
 =?utf-8?B?MFpMdFhnR0ZBR29WSWExaFQwNVlXSjg2OStLUWR2aFZiMFdjTVdBZ3l5d3Ay?=
 =?utf-8?B?My96d29jRkRZNE1DMVMvODA3YmdjNC9XdERybi9RSXdDanN2aDlCMHRuN28x?=
 =?utf-8?B?aFVKSXRWT05tK3ZYaTJnazhTd1RxTjVDMkdZaVU4dHk0NTRmOFlLcFQ1SFE4?=
 =?utf-8?B?TlA5NDV4b3pELzVpbkJjZVZMaVp2ajNJTENScmhQMjZVY3k3UFRhUnVQNzFB?=
 =?utf-8?B?LzBROEhxbjYxZEp3MUlZeWZzNmZiampESjNiaWN3OS9WQk8vMGdzSmQ0RGZs?=
 =?utf-8?B?cTc1dWdIYTdKWEZDUE9Db1dYRGoyc1BES0dZUHRaS29aU2xMbUs0bnBBR21G?=
 =?utf-8?B?dnd1NGxjRzV2RHdEZ1Y0Z3YwUlMyTzFveitHUTR1SFlIVXc4cms1SWpPM3Fx?=
 =?utf-8?B?N3BrVUUyOWlXTHk0cWUzbEtmeVViSi9yWmZrNjRQUFBHS0EvWUhpRXAyYTdG?=
 =?utf-8?B?WENHM2dOeU1mZHdEbEN1RlZkbUF0dFhmM2pUa1dwOWl0SDNrQk04SkYvUDRK?=
 =?utf-8?Q?E9pIjDQKwBc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6440.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEhrOFJGSlRHOGpDeHJESWMyMW5sRHZTN3MxSjJ0K29pOWpKY0R1cGJ0NXM5?=
 =?utf-8?B?RDlDemZKNUJqMlFUSHBnbEtPaUFNODRDT3huMDFtVHVoVjJxMk0vazRvSVgx?=
 =?utf-8?B?eWxsbHhUd3NMeTc0eEt2ZDBGYzk2MHM5YVZMcEhWbTRLc0huY05XamVTeUZL?=
 =?utf-8?B?eHBibU1LTHBpRmdQMGx3MWNaR0thVWx6T096b0tKYkp0RVNZSm1JMWhNbTZu?=
 =?utf-8?B?dUhOTVdMNy95dU84Q2Q0Ti9qazU2dG4rQzVEblVJbkwrOXJqZUc5cE16WEwx?=
 =?utf-8?B?T3p1cWNZQXFGdWhNM0ZQajF6SDN1V1UzZGNGMmw5QXJ0eDI1Z1VMRjkxSWhC?=
 =?utf-8?B?TUt1STZSbFk1RkN0N09GRXdUcWFZV1JqT1lOZW9tdE1PcDExNER5dGpmOFJn?=
 =?utf-8?B?ZlJFK2IveXRaYnZldTZZNFpCV0dtTWtqcURnU2M3cDN3ODRFN2tGR3FFdEVE?=
 =?utf-8?B?VkdWbk5lYk91SDRUYU13bHZBbDNwVnJzUDFpSFhnWlJmekxqcVhRMWRkTG9n?=
 =?utf-8?B?ZW5TWlZuVXBVOUxST2JWV0M2V0ZDaEE4ZnE2L3hUUUU5L3VWU25CUk5HTDR3?=
 =?utf-8?B?Y3FORmZ2V3ZjV0tmdG9MWmNQbW4yYWNjRDJ2Z09EcEE5d1M2YVZ2MjZCRGgy?=
 =?utf-8?B?clpwSU1YR1lYaWlsbG00SXlQTUhBaFoxVlVlN0VaNXYwVURJTVh1UEh6NUZl?=
 =?utf-8?B?YnlyR1BLL0RTZHJBdTlEdTJ4czlMcU5ybFZtZ2U1cWQyY3h3c2p0VitDcnJy?=
 =?utf-8?B?b1NlMkpOZE04azlNaEhoNDc4UkN1ZU5WZDZUOG5NQjBsekgwMk5KajZFbU94?=
 =?utf-8?B?cE1nSmkyKzZIVGNLYm54Tm5UdllrZnliR0dxUHhoMFA5UHJUN2pUaFJ0bFdQ?=
 =?utf-8?B?T1ZWRGNPVis3dWxkY2svSWFhSHdwb09TYVlaL1ZYeFRaay84UDdaYlNkcGhr?=
 =?utf-8?B?enBEQUdLaGNCYlBPaHRVNHhvOWFpZDN1WlM0WWNiVStxbkFWOExZSEVXTDB5?=
 =?utf-8?B?OXZTcldIcWl0WHMvdVNKVXUrNWswdjNCOFp4bmZGaVNxTUNTT2VKYnluN25N?=
 =?utf-8?B?RDc1ZG12WFpnUVBVTncxNFR0N3lONFhHUWk1VGtSSktHRi9Qa3hHYUk0TFZ5?=
 =?utf-8?B?UEpyVG9jS0VGZXB3c1NOR2tZTDJiVHhMeHF0U1YrdU9nVk1PM1R2UnB5eXhG?=
 =?utf-8?B?R1Q4b0liaW4vTDEyL0NXVWdPTGhvWWVONXpzdTVEV2J4cTBrbDBvbkUwWEVF?=
 =?utf-8?B?UGdRZXd5d3lTK01ZN0I1Q1hWYWdOclh5ZUI0S2hBWExOWE16TVZiVExlNHV0?=
 =?utf-8?B?RU9xL2owVEV3Q0NMeHA3ZWVSN3lld2Z2enQ0ZnM2UzRtekNwTFV4L1JoYlhP?=
 =?utf-8?B?WmRKMW9PNjl3bjJCM1RiM0RuLzNmVnpYVUJETjd2Yi9hVllzOWs1OGFKYlA3?=
 =?utf-8?B?QWdvQWtRYnQ3VVRQN1BpODNyMnNTMkQ0M2ZoSE5WT3JlS1JkNDc2QlY5Uy9r?=
 =?utf-8?B?NVo3eFl0TzFkRU5yZVhTbWExZ2pNU2owdW1lUmwxV2UwclgxOGg5LzVLbFJi?=
 =?utf-8?B?ZXdUdk1kd1ZabDNBMzlCV2JKZ1kzamF2VkRxR2ZoR1dySmZHWjhXd0lPbjNL?=
 =?utf-8?B?dUdBSXpiUzBHbFJtTjlsUUxXc09TMWs5L1RqanZsWUl5a0xCcmFhRWtaTkxN?=
 =?utf-8?B?TnJzU0dhWlNmREJwZFNxS3I2SGMxWUJxQVhZYUN5QzJGZ29vSm00dGhqelFz?=
 =?utf-8?B?bzdVTDJZS0phbzRreHR6WGZ0Sm80NTBMdXA4VmhiUXdhUkhVcVlTaXBmUWs2?=
 =?utf-8?B?elIxMXFzQUhzUzJ0eWN4ekFSLzVmL3BGaGFEZnpxeFV0cXVOVWxBMVE1OW5a?=
 =?utf-8?B?SU0rRS9lM01PUnEyUjBvOHVaZXVLK0lnN0QvbFNVMU05b1hSamtVYlRmQUt0?=
 =?utf-8?B?bkhnbmJsbEY1em5pTGUzZ0NGMTZpUmRCR083YnhyQmxKK3VvdzQ2Vk9ORkIy?=
 =?utf-8?B?K3YzRTF3VXduTm12RWxiQ3gxSXR2dlI4THhCUUJLK3pUNEVsWG1IRjFyTERX?=
 =?utf-8?B?Y2ZnRWJNQVFnMTQ3VHIraHg2dkJPVzdMcWxIaHZRR2ZNeVJmZ2V5ZERFSnho?=
 =?utf-8?Q?0yhd0lkB0GCSuQGpv62jfvzKK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56cad829-fd54-4e70-501e-08dda30f2f85
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6440.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 02:26:17.7477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56k/EsaIOk3YgTwIELaU2IN1+amSNHtcZ7ZYtSvL0FWCldpFHQclmTn2EvPTnETqgb2+TfcuL/82EfXs7m6y6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8023



On 6/3/2025 6:49 PM, Randy Dunlap wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On 6/3/25 2:40 PM, Pratap Nirujogi wrote:
>> Use adapater->name inplace of adapter->owner->name to fix
>> build issues when CONFIG_MODULES is not defined.
>>
>> Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for OV05C10")
>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>> Link: https://lore.kernel.org/all/04577a46-9add-420c-b181-29bad582026d@infradead.org
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> 
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Thanks.
> 
Thanks Randy!

> 
>> ---
>>   drivers/platform/x86/amd/amd_isp4.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
>> index 0cc01441bcbb..9f291aeb35f1 100644
>> --- a/drivers/platform/x86/amd/amd_isp4.c
>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>> @@ -11,6 +11,7 @@
>>   #include <linux/mutex.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/property.h>
>> +#include <linux/soc/amd/isp4_misc.h>
>>   #include <linux/string.h>
>>   #include <linux/types.h>
>>   #include <linux/units.h>
>> @@ -151,7 +152,7 @@ MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>>
>>   static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>>   {
>> -     return !strcmp(adap->owner->name, "i2c_designware_amdisp");
>> +     return !strcmp(adap->name, AMDISP_I2C_ADAP_NAME);
>>   }
>>
>>   static void instantiate_isp_i2c_client(struct amdisp_platform *isp4_platform,
> 
> --
> ~Randy


