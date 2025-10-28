Return-Path: <linux-i2c+bounces-13842-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D27B0C12FFC
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 06:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8DF594EAB42
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 05:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03FEC285CBC;
	Tue, 28 Oct 2025 05:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pKYNvuwA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012041.outbound.protection.outlook.com [52.101.43.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A01627707;
	Tue, 28 Oct 2025 05:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761630170; cv=fail; b=RkhCQ/MnnaQItxgrOL94xWIeGCf5VwnmDRX9iWeuRyDhlYEfMooGRQn7QnLjVmqPgeXmcFDGhoDB33yaaoaULzMZWg6hjlEJt9j7R1KmQ3/m1DREJItjAW5fjdJz/Mgj6fN7vjPa4iIAQsV8UVBLP8bE2sDforPJDrzGLBjAUiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761630170; c=relaxed/simple;
	bh=Kc1RR8k4ThWkliOulGd60RmH5eS0idalj23XUKamDsY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HT85IdkCtemgBCFpIomLp+eXiv07aO56ODFP2gLIXTtkqRUJyzUgxgaiXdIi/wOdPB6xrxyXq0vSpX1SLVc/Lpipv27rgcjsmnicTke6SgSLq7C1uoYwhKLrZoyJcnIO+JjrcUqrBht6EZ4L5J1DX2XLGhRSYSlGa5Qte05cAuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pKYNvuwA; arc=fail smtp.client-ip=52.101.43.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7TNze/dTrLsgkWMRda/WO33Od+p1zt4LNLmVMpy9kcvWJYjuOto4ZYQ4ldX00HO9krJoR8oCrblmuKeZNyq/lpyq0DuQnoa+P99AKJb4D6tgArCTvmnmuu+V8XocxGBEpbuXCiex3cDkt6WWTtS4iqeN8SmMgi9fiy+BjxIybk7+au8WU2+guXfjgQZaKHcLHUyBu+JYzv/rE1kwx47M96/CiFMoSq9trVwxug9t7XIrsPIEVzBEjsup7gO2BHSGbgtcFzrDKkyKasPmLJxJUJpEP4be+1QpIujeL1wLT/eRdf0BfEO9CM+wWsAz4MXCTanNICAyyaTFhexJH5o/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHnJWPw8Go43RUo+m7KKt0ZXGPE4FseszeoGi4HneWQ=;
 b=KcvGC3zcDlyzOR2gNWrudGFSuw5rmC+nxPFkL3vjciO+vfLcDXPu+K2UMOWUb1t/TNcpOk6Jj/4U1ODF62oLpy8jscEaMJaEEg7M0uGqh/O+deoMgWfaOGnmyefAB0KFC3DEXIck2BSe1VVQtRK6nBL2b7Vl78GgbJXcoyw8s3XcdZ1a7xrDCKeg9sVynOgkV2wwMLQL2ahBKduWiITp/e/fEiw2tRxo06qasaJIDjc/SrrBeuDbLZsnCa4hlmfbWksHU8W7NeLxobXo6iMG56X1wEt7jUOR1f52kUmhpDjHzVjhjkwmkepozRTiQjG/OEvYTSu3KNJFiVQD/OJdEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHnJWPw8Go43RUo+m7KKt0ZXGPE4FseszeoGi4HneWQ=;
 b=pKYNvuwAlGd0SQcucYfFPDiID8+i1ir+8dk/RQL97JCyGcRJrNTuCu+BZx9EG7CFjfSKWKMvfRX1hhw8qc0aRMb43PEX7VjNgq4gn4uviGHvSHu/yfNW2VtkiHbyODvp2c2x7W9GaFD2b99zQebld47Du/V+2xJXYS117Efa+d4l9ed9Zm7Zx1kp38YZcQOjbk3wxiYxONlRdajacUUnkrj7I8qmCNHRO0V8QsxAuxc/2uPiYp+kcFxqMPPZu5sBE1aylIu4wnFedRQSpfa0x0N/xEOPu0vjWojeZa9U3Q7M/v81sy8YNUuon18uBrzdZJtrtYvjZs936DNT5F/Hlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by CY5PR12MB6600.namprd12.prod.outlook.com (2603:10b6:930:40::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 05:42:44 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%3]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 05:42:44 +0000
Message-ID: <bf65d60a-347f-4810-bf76-71f2fd6920bc@nvidia.com>
Date: Tue, 28 Oct 2025 11:12:30 +0530
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
 <fba594d0-09f1-48d7-9d1c-127fd5e8c095@nvidia.com>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <fba594d0-09f1-48d7-9d1c-127fd5e8c095@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0113.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2ad::9) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|CY5PR12MB6600:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f89cb99-26a6-40fc-e0ea-08de15e4d119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THdMdVhJYmJLWWE3VjNKMGlnWVVPT2VlZUJuUnhCQmE2ZWI4WjhNMzlqODdU?=
 =?utf-8?B?V0tNOXVYbFY2WDI4bU1EOXFGQkcxT1lXeGVTOEZTQi9uaEdSTDFYelRIWHNW?=
 =?utf-8?B?bnNjRkhtZ3NLSmo0dnIyc3BkcnFMNmtCbVFQczZvNlBoUnQxZEd1Q003YStF?=
 =?utf-8?B?SGJkYkk2VURLbkRmakh6a3FDTG1ISFlYNnlHaHZGOHJXamZsK2hTVUEvSktT?=
 =?utf-8?B?ZTdXTEJ2ZGt6aHJQdk9TYmhrTmZUbnM0RTNlTHBPbXI0VmUwM2t6WmRiVDNs?=
 =?utf-8?B?akZHa1hMdmdGZ1JGcVp6ZVFRYU5SWWhLL0ZXVjdxS1E2ZTV2NkNDY3daTnN5?=
 =?utf-8?B?WW5JNUx2aUZET1N0S21FS2FjVVFmdG9tZUtheElCeWpNQk4yYXVvUVdWQ0cv?=
 =?utf-8?B?ODhYS1FRZHR3c2JYTHlsWFFOQUsrV0JEWjNCcUg2UmRzeXBxUXo0Wk1FcUQv?=
 =?utf-8?B?dEtnM0R0Q0plUzN6Y3VQVEd0ZUcvY0JReWs0Z1lGanVlcGJZOXNQTE41ZTM5?=
 =?utf-8?B?SUpDUmp0MHV1QzBNQkNTeVdDQ0FQUHpwRXlwbFFTUllselIrTldQMlRKYWRy?=
 =?utf-8?B?Sm53STVvaE55aFpzRG9YYkJsRnF0R1pHYzE4bTZRL2dBYTZ3a0Rhc0RDNldD?=
 =?utf-8?B?S0NENmJZVzU5bXNPYzdVaXJwK2dpY2gyTk9wNko5M29JOEV1WEJlTVZnR1h2?=
 =?utf-8?B?VElMaGNyM2pYdFIwd29MNURXZTJ3dDdmK1VRdXplM3oxR3d4c0h6MUdBM25m?=
 =?utf-8?B?V2Z1L0RlMXhhRFczN0VOVWhzdUx0ZnFseGRxMlgwWk9LSmk3THA3Q3lja0Jm?=
 =?utf-8?B?cEw3dExETHBPSWNVNXFnZXUwSGwxN2dpMFpSUkZteWpReEhGYXJEb3BSaDBH?=
 =?utf-8?B?b242SkVHSkZsN1RzY1hvZjJCaUdYKy80MTkvL3BXQkJCT3Vob2VDWHdFcDNu?=
 =?utf-8?B?TWR4cEtaTVhIZHdJRHFpK0pSTVRaK3orRThSV3VVVWE1d215TVREekdkWVVX?=
 =?utf-8?B?NG1CZnEvZUJUN3ZOYTZka3pMbWoxdndSK3hHdnpNRGhERUlQZks2eUtFb0hB?=
 =?utf-8?B?ZnJsdVlXYmtHMG1GMmFSMHBCOVBrbHZxcnRzd0VVR1FSUFo3dEJwaU83SXJE?=
 =?utf-8?B?cDJxRzRJelBlUzBCQTVwWmQzV2gzRkltVVJBcDE5MEhEeVBPNDdWdUFyZFh5?=
 =?utf-8?B?VkdMdlgzWTM3Qm0xSGltQStEWVdHUEQvTUhxUVY3dVdXUWJsNWxTK3RURE0z?=
 =?utf-8?B?aW1MWTF5WWVaSDIrNzIySWNQT3dWa01FdUpLVSs3d1IxZG1kckxpZVZlV2pv?=
 =?utf-8?B?MGpPcDRpSVlDMmVOOS8vM01MYWorM0Y2VlVObVNOMi9QdEhiM2kzRGVCK0VF?=
 =?utf-8?B?U2NkUkFXdlZVR3ByeVcwaDVFUFdTRHg5NmhwRVVjZ2YwajlNVjdLQ0dYVTNo?=
 =?utf-8?B?YzVhOUloOHFkN0Y2a3poWjhwTUpqRG5LTXp1dU1xS2R4ZWNRckgzUVA3WXhK?=
 =?utf-8?B?dWFDeE93VFVleDEzU1BsQXEyclBuZUJyMVhpNDBncmRNVVJqQUJvajRFR003?=
 =?utf-8?B?aHFBZTA3eTFUOWtud0NOZjhuT09QaXVrZmxmcFd1ckNWanU3Umc5RHMzKzBp?=
 =?utf-8?B?L2lsb2VxaWpyWlZmZEwxS29NclBqVnhlTFR2MExMakFGelB1RWFXbnZwUkh0?=
 =?utf-8?B?UG8yRTNhVXQ1Mkp6SXZWOEhtcndVcnR4NFUxNkFtYzcxRWNjSDdQbEg1NWYr?=
 =?utf-8?B?T1RNTHV4MVBFUisyQVdLSW1BUm8xcC90UERXczNtMFpoNUV3Z1daeU50dzQ1?=
 =?utf-8?B?Y040U0ZrdkR0V3R5amFLVGllNFByZEFMeUhobFUzSzUwS1MvOEQ5QldPMFNr?=
 =?utf-8?B?U0ZJQ01HZFlLbFRiTzYxeEZYM09SeEN2RFNHY1M3bHdVN0Y0ZUowcTVMYjNq?=
 =?utf-8?B?R0dCSEg3ZTBoN2NoUjU1Z0ZXYnZCcUQrRjFYdk5FK1JxaHpoWHlRRmRrVkx3?=
 =?utf-8?Q?zURPVnXnjbCqfwTzE8XBxplBCpBtqs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjRPdndvaTRSYlZnRFJJVXlKMFFXT2gwMHFUamFrUjRNTXFzV0xXREpxQ1pt?=
 =?utf-8?B?S0JuTVk0Nlg4czc2YmJiYWFWdXVKRk9iTGpxaGlpa2hBMDRUYklvUTRnTXcx?=
 =?utf-8?B?QTl2WTRpSHlkajFXY0pGZFMxSWVRam02OFFwMFNuU3NxVnBVZmZzd1paWitY?=
 =?utf-8?B?R0tOdm1DTWo0UDJvNDlmSUtCSzhXckxNa2tDZERUdTNrV2dMV0twWnhhWWlK?=
 =?utf-8?B?VlhuRXN5WWNRY2VJRUM3b3VkL1dCWHBrMSt0Y1UwcTV2NlVKYmJIWjBYaEhu?=
 =?utf-8?B?REpxMWxXT1dpcmxoTm1KZVdUbTkwb3Z2ZmVUdENqL2Y0dlpZNmJ3UENRbTRG?=
 =?utf-8?B?QVQvSm95UTBvaHYwczRkYjNMaUlSaE9ZdFdqdDBUL05JUHFVTzBSRGt1UFY4?=
 =?utf-8?B?a0EveHhCU1M0OFYzc01ENmFkbGl6Q1RjNzdKQ2VMMFJWeVdYWnkvMXkyRVNJ?=
 =?utf-8?B?YVVLUW93ZDBQSXlBUGVBWmNiKy9BR3ZCbURSak1aYUtkZ21KUk1Ud0JTZTJv?=
 =?utf-8?B?dlJCQ0ZHZjVmdFNIMHBoUjBsRm05QkxOYUE4czVHdHZSVmlGZGc0aHNCaG9U?=
 =?utf-8?B?Nkh6c2d3YlNtWnM0elZtNm1sNnprcVpnNDVkWTRnWm1kOEdiVXo3MXdtdGhL?=
 =?utf-8?B?emQ2YjBmR05CaGxCN0F1SU5MRkIxcEhZOUVHSVoyaVRRdUh3TkREUWRwU3lC?=
 =?utf-8?B?NUZzYVhBLzF0Q0N4b1NMOXNBSm5jR2RXWE1sVnFVSnc4OXdtN3lCeGFLU1lO?=
 =?utf-8?B?TDhtT0JrRGxRS0VMbHl6NEdKWERwSy9kaDduMDJVUjJrcXBNNlZNT0ViUHVo?=
 =?utf-8?B?QTA3Z2tleTZHV3Q4WlQxQ0h6emhmUlc4bU82dEZrdlZEaERBWXh5VHl3UjZZ?=
 =?utf-8?B?NXpVeXVUaVFGTTMxUDRxSEZlYVBPQ2ZlYkt3bnZlUVU4ZzN0aTNsMFRzWlQ1?=
 =?utf-8?B?VmFpdzJTc0FwVUhpaXpKS3hodm1YZjJXQjNPMVdhNzVXZUUwRWpZZUxiVE5p?=
 =?utf-8?B?QTM0eVpqZTRlYzdBRXJ6STluQXRmZ2U5VFAyeG9JYlVMcUVzbjVYNmI0S2xW?=
 =?utf-8?B?UTZET21pR1NtTUZoQzlDSlZxYi9Qa3RYRFlDcHRnQkV2akRxK1d1UXNtSlZj?=
 =?utf-8?B?eVY3ZlJoSmNCS2MrcTNaTWdHUk5sdWlWRzUyQUVvQlRYK0hEbXdNSkMyc1pn?=
 =?utf-8?B?dmlSc1RFdnllMEJGcHNBeEljSmlPVmlrdURML3BncWJ0RmwvOTBraXkzRnNt?=
 =?utf-8?B?QlFUNlhRR2wwajI1NmlMLzVRMS84MnpyRzRseFFpY21WaG1tbWZqMUhXUkZT?=
 =?utf-8?B?SlBNQnNVMEw4RmJ6SVZpRVBqUFk4Vy9NWkpOSWlsWU9VSlZneVovSklabDdG?=
 =?utf-8?B?YlBWY2YxdTBLVXhoc2xqUXJNc2R6b2FxS0VYUDFORW1ybUplTHV0U2pseG0r?=
 =?utf-8?B?RENuRW1hNmVva1A4OXQrcVBpZ0EzTjc0M3BjZUc1emlKN3VlSklnYkhYeFJR?=
 =?utf-8?B?QnFibmM3RjJDMzJBOFI1V3E4ZG52a3prT1h1czZoUzM5T29uRGJmVGd5VkFu?=
 =?utf-8?B?Ynd4dDYwcWFJbVB6Uit0OWJuNDQ0MUQzQllodXQ1eWkrQTFDYUNmOFBzNFc3?=
 =?utf-8?B?cmZLOUd4Mk8vcUpKNEN3Mis0U3VhQ1h4Y0NWU3g2YTZnRlh3VmZISmFOS1VB?=
 =?utf-8?B?OVljVTQzZU91TmdsazJpWmFjbnVDZnlYU2VxNkJoQzJwbTZHMi9PN0VVZDRS?=
 =?utf-8?B?UnRTYUtTK0NiaXgreDlWb2tMS3pMNDRha3lhYlhkZmZLclpOVmprR0d5NFNW?=
 =?utf-8?B?bGlvU2tKS3hHRVZ2QStZTDcwR0V5d0RwNTEwbi9IOGZHNHNKZS9tMCtJSHJj?=
 =?utf-8?B?YlBKQzlMTXpjc3hnczgzd25MOWdJa05wYkNyRWMzaHdZWmxtVEt5N2Z4aUJM?=
 =?utf-8?B?a2UxVXdmSHNpY2F1eUlvTzVGWVEvaXJSd0RzSU16ZjJTallLa0ZpeFNGbngr?=
 =?utf-8?B?OC9NdjBRRE9FcWt1KzNHeklHb3VvL05wTEp6N0F4RjlZdVE1cGo3VERreDZ1?=
 =?utf-8?B?dDVURDc0OUhuSTEzdFM0VEpudHBOS1BISDdCbXdlY3MzY3FuRGhBMndoeTBV?=
 =?utf-8?Q?pAq5FS7qgJOaxkK9U1owHyYCu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f89cb99-26a6-40fc-e0ea-08de15e4d119
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 05:42:44.2761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3HoLhy9YFkveeipsM9JlVxIai29fJojeIEVipPMHrOxy/4NbW274SclrJIWCobELi2pC6rqDgsSjTQaA/UCPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6600

Hi Jon,

Thanks for reviewing the patch!

On 24/10/25 21:03, Jon Hunter wrote:
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
>> +static const struct tegra_i2c_regs tegra20_i2c_regs_dvc = {
>> +    .cnfg = 0x000 + 0x40,
>> +    .status = 0x01c + 0x40,
>> +    .sl_cnfg = 0x020 + 0x40,
>> +    .sl_addr1 = 0x02c + 0x40,
>> +    .sl_addr2 = 0x030 + 0x40,
>> +    .tlow_sext = 0x034 + 0x40,
>> +    .tx_fifo = 0x050 + 0x10,
>> +    .rx_fifo = 0x054 + 0x10,
>> +    .packet_transfer_status = 0x058 + 0x10,
>> +    .fifo_control = 0x05c + 0x10,
>> +    .fifo_status = 0x060 + 0x10,
>> +    .int_mask = 0x064 + 0x10,
>> +    .int_status = 0x068 + 0x10,
>> +    .clk_divisor = 0x06c + 0x10,
>> +    .bus_clear_cnfg = 0x084 + 0x40,
>> +    .bus_clear_status = 0x088 + 0x40,
>> +    .config_load = 0x08c + 0x40,
>> +    .clken_override = 0x090 + 0x40,
>> +    .interface_timing_0 = 0x094 + 0x40,
>> +    .interface_timing_1 = 0x098 + 0x40,
>> +    .hs_interface_timing_0 = 0x09c + 0x40,
>> +    .hs_interface_timing_1 = 0x0a0 + 0x40,
>> +    .master_reset_cntrl = 0x0a8 + 0x40,
>> +    .mst_fifo_control = 0x0b4 + 0x10,
>> +    .mst_fifo_status = 0x0b8 + 0x10,
>> +    .sw_mutex = 0x0ec + 0x40,
> 
> sw_mutex is not supported for Tegra20 or anything before Tegra264.
> 
> Jon
>

Ack.

Thanks,
Kartik


  


