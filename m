Return-Path: <linux-i2c+bounces-13858-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB5CC15C20
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 17:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8392E421CEF
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 16:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092D5348898;
	Tue, 28 Oct 2025 16:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s/1gWepa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010027.outbound.protection.outlook.com [52.101.61.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C50A348473;
	Tue, 28 Oct 2025 16:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761668064; cv=fail; b=bFRU0WhY2FBbGHbeOQpSWRndLJKqil/WD4fkqU21HtIqWjhxooLHkTM+IIcWDdDxsFmfG04ef1xuji5MiDG8px6FgZY6CmqvJEy+LRluSDcDDOD/3D5epn9ZFVZmbFjwyL8jtzCpMrJSRCtVARamcbTFAztCpKHq1nnTAUHMxkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761668064; c=relaxed/simple;
	bh=pkGCpFOpTP/gwm8j1TT4+lVCHWw3eN4iMRXlcdLywDw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VpAFGRdwMdg6lg1dQQTHnsVzhSURD1OM+apbdxVV0go7IZTBL84Mu02Bke1no6HF6gTadjSG9O5WjPFUacze3aXC8wCtSHvq3HxQZ5lma546HWgLIBpp5wgcWeRfdqvCMZ42yWAGtYydGxnNEDeKN3AMPzNKCQDeZcQlPZ4vlqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s/1gWepa; arc=fail smtp.client-ip=52.101.61.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnPmRsyuuoJ545ioXXt+G0wSXQCONVqzkRuJTrsjZScLs9CnX0rExOPseaQtsFdXkP94ufgluBKW1E5Vjt8jp34rwZ1P865JzIA4GsfgLPno+WyNWzqTB61DG79J53RQ+oBErEjqwWWGuXYDRk0CXiqC0Hmbh4AMctyeCaeiwFXOsnFq4yK2HnzJERR/aM2Rr9UOai/Wo490Eclc3JUZenV4VLiudRPHjfMDgEUYnNLCSKJTtwwzw3okTe8tmAESj7y7SNPA1cXpCul4iJ3QJIsRQgDlLBy8GZk+JAQkpsCHDAPZNr9y5h3M5CvCT3IRgN/+guUH2hZKPOWk5kuvQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hya0tzdpykBnnJSql4lDymSAYo3s1YYArZdgHJ/itZs=;
 b=MzP9/Sepb2yC/JUFx9ACmf1fytxPvE6oql4oiL41ldCAjuqCk+OZlISOZAWXFDe0BWk7VsRNvwqUQId8eZNvWeEMBD2JtkLGhCtmAoGUJOAx4Z/nYyrSZVQmSUgcFwVuVklUzRgC6fSDnK2vzS2AFhw2VT23NH29cTzf/ANT+u9/gx/MtlF0s17lNl8Qjl+qGIHaP+O7boXpvHNA8etxStmZbhtJHAoOJpwRozlTccsxLBfkLvsdxmI4MQexVTNsMh/ExvhSh4gNIu9PgJtXUwOGgcLW0tUCnkuAGXEQWxLrS+5Z5S+3phGTl4Du4NqQSnct9hMhjmtCDuE/0XKnDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hya0tzdpykBnnJSql4lDymSAYo3s1YYArZdgHJ/itZs=;
 b=s/1gWepanm0yMEj3AUgkCC/D4LNcvZbl2EzDe+ch6EYjVV7OQonxr+1hF02v7kBYlqTMBohMMRkJDAnTq8EP9IdnplgrTuXwMALwT0oCfCHlFnEx6qHvwzfPWa4y41+zzvtUDgTFwqDsozYfSuJU2tDOtHL/pjbRpweqeTmc8idi2CSlSadX6m/vTaXEA0bA8GgdX16L928YURDBYWcJfQRrdpX/xxUasGqPKUwpP9nq90hgacdq4mamxqetuNph9ZpN6mJtBE4M0RCz1qcNIVepw0TVFJMN38XtOCtmN3x+qpdOad7ETejNefFe14eCQ8OMutKi/3kLAktGQ4nsXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by MW4PR12MB6732.namprd12.prod.outlook.com (2603:10b6:303:1ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 16:14:18 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 16:14:16 +0000
Message-ID: <3a161d2c-6d61-4ba4-99ea-5f8a376610bd@nvidia.com>
Date: Tue, 28 Oct 2025 16:14:10 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] i2c: tegra: Add support for SW mutex register
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 digetx@gmail.com, kkartik@nvidia.com, krzk+dt@kernel.org,
 ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, robh@kernel.org,
 thierry.reding@gmail.com
References: <96e9898f-e306-4b73-9d06-5515916cd769@nvidia.com>
 <20251028125449.46934-1-akhilrajeev@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20251028125449.46934-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0627.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::15) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|MW4PR12MB6732:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ed9b384-4889-4edd-571b-08de163d0aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wm9hM1RCK25vOG9UbndIQnNWMmFOUWdsblNLUFFXTGVBTnpKd3g5WEJlaWMz?=
 =?utf-8?B?cHZxeEVUV0dHU3NLMG9tWVQ5ZFRTTFhiRW9rUmNQd29JRjZIeW5YekhucGRZ?=
 =?utf-8?B?QWMramhjN3owSUxyUGgvbXhPaVd3VFNLSDFibkpLVjdYT1lBcmhyUk14UTZU?=
 =?utf-8?B?U2RqQlNWYUF4V1RjMk5vdzNnS3ZSOEp4b0NaaFlHeWMwVU1WVHk3VjdLMURy?=
 =?utf-8?B?RXp5YzM5KzNYT2J4TzNvQ3g0WWVLSCtYanpHR1B5SjM5Mk1Wdno5S1V2S2NB?=
 =?utf-8?B?TzRLQmlUbDRpdUFneGRqUzhLMlZ1MmpXbGUycE5QTVUvUExad0dIS1ZhNXAv?=
 =?utf-8?B?eE5STzFmeE1ld3ErSVlUdEpQV0lzUThPdnZmUXBEVy9ON3p3Q0E4S2EwT3Zu?=
 =?utf-8?B?bDFXVnRhZWpXZWZmdHFDYmN1a0dzQlZZMFFyY2E2V3V3aXYySEQvenAxaUFU?=
 =?utf-8?B?dksyMEM5a25QbnZ4MTdjYkpvQ28wUnI0Um5SVThXY3pabzY0Mlh6WjVrRDBZ?=
 =?utf-8?B?MDBnVGh5bU9SZHBIc0xYaHc1QUtyUXFvOG5EK3NLYkxaMTdWYzBHb3lNWmd4?=
 =?utf-8?B?bExicjNQUktDM1VKMkNaRUthWHg2eE1qaGhrQ1Z4TXhzSUJyUzFqOGNjSjh2?=
 =?utf-8?B?Q1djaFdLZWROOGRjSUYzajg3MW5sVEdleE9aZ1ZpQ1VwMUwvdUZUby9iQ29p?=
 =?utf-8?B?L1B3MVUxSzFxUjRjckZqNy9ybTI2U0xTSUtLc1VJMGpSUEFRT0xpdjMyZE84?=
 =?utf-8?B?eEtHcjZreWpRbHBZenBkOTVBZk43QjZRTndCMWIrR1hwdG5CRE5ESmpQbHZy?=
 =?utf-8?B?VTExcFFpbGs5SU9QS3NNV01DQUI5SjlFSnZ4NXJlbUpJTnFVd1ROdnpXU0Ry?=
 =?utf-8?B?TWdGM3pmNXdXR2I0YitwMDM2aDM3SXhFdE42OHcyeW1JSjF0bGpYK05yQkZT?=
 =?utf-8?B?L1NjbmFaZmdVeHNYQUU5REZVQWlLN0VrMGkrM2Nzald3Nk5GN3RiSUN3UW5V?=
 =?utf-8?B?NDFKOXJJeXJjWnFSUGdPZC93VDRRZWRpQWlZV2dxblU1Y1FLZmQzcU5yb25i?=
 =?utf-8?B?TmJLVk9nZDJCTDdvTTlxeWFncE1GaG1oNW5WanJhdm1jaDZCRmFUYmVTVTRN?=
 =?utf-8?B?NWZvOEE4Y2RvQnhxd2pFRjZnWHlkNkFQN1pMK1F4UU9pNk51alFtYXNxM096?=
 =?utf-8?B?L0x5MjBmcU85SjZxVkJ1M2N1Yk12K25ZWHlWV0NqWGdidVVGOTdSN2JRamtq?=
 =?utf-8?B?R1RjT1VkVk00M01RRis2Y2M5bzZaK3p2NmNEVlJRZnkxdzNOOHE2R0JRUXlF?=
 =?utf-8?B?dGxyWFJMcXFMNW94djdhRDJPOFdQbmF3QzF2dDEzN1RrZ0JTakNSVDNZY24w?=
 =?utf-8?B?Qm1neVcybm43b0tvbG4xaVhwOXlpN2c5S3RwUVBSR2F3UnN6S3Q2UnUxWnA3?=
 =?utf-8?B?bEpSWWpRUC90a2ZObTBWOC9SL2R6czFkUnNHU256TmQ0bGVmRjRqbllVZUEw?=
 =?utf-8?B?NWV0QnM2anFFTStyRWN0THFRK0MvS3dUSDJoK281UVlsYXZFaHV1RmhOQjB5?=
 =?utf-8?B?Vzhwdk5JTlR5QmFiMy9vbjRuaEZRaU53UWtmcFRvWWxKWENIa1I3bTJpNEdj?=
 =?utf-8?B?TElCYXhDZjZCeHBXeVIrNktka08rZlhuRFBVeVh5eEpnWjVHUnpEcXdmaEdo?=
 =?utf-8?B?c3JxbTRPTy9qdTRxVkpsbzRwSGk5OVRxajZ3VW1abjVKTFd2QWpKVEIxeFJ4?=
 =?utf-8?B?NW02ZzRJLy9NNVZLUkNCZEl0cXFzajhLYzlZN2JCaU43N1RTQi8vOG1nb0Vu?=
 =?utf-8?B?c2JTSmtQQVZYZVo1cmpWMmpJVTZqQkhqTlhZSFh6T2oxQTlqcVFUa0JDSndM?=
 =?utf-8?B?TitFSjg5RC9FK1I3T1N0N2psQ3JIdlV6VU1SZ05TZ1Y5eEVnNXZEWDNJMERl?=
 =?utf-8?Q?ftj2JGA9r2JQ8+QE7yLCCiUnDIEDYGAB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXJHWEs4anpra0pNZDloLzJqWlpZWWhHTjBRV0hOK25aYjBvamlXVVR3cDRx?=
 =?utf-8?B?NWdCOFl4WjFnTWJiUnY3TVdScFVzKzNLYVNYWHd1M2ZUZnFoZ0JBZE4xNERz?=
 =?utf-8?B?UEU5N1huMzhyYXVMUHVjV04vckJTT0cyem94NGtDK3kxZmkzTWlWRklxUjd0?=
 =?utf-8?B?RXd2bXhDeHkvdDZvVDQ5cnNLL1RheHA1TW01NS81Qm1jbWUrd0ZBMmZWOUdi?=
 =?utf-8?B?ZnE5SHUzdFFVS2RTbFRDQWMyTnJKNkY0ZU16eXpXZVRtYzdoYUdBK21hcC95?=
 =?utf-8?B?Zk9ySmZSTkYwZHlKdkRlNkMwRmJOellRVmg4RjhzR29rMnhvcmNZNnArRVMr?=
 =?utf-8?B?RkZYRzQ0Mms1bHpjSmZvZm5WZzRuVDNzSWJrNXo4SC9IMTdyRW5iWk9DNEVt?=
 =?utf-8?B?bHNMSDFZOTJMcXhMM3VPQWhKRkJUVW80UC8vM1RoODB2TTRsOGNMVzR6Tjhh?=
 =?utf-8?B?STU1aWQ2Z1BiV1BlZjNRcTkwMGNQVDJPUm1FL1M5NkhTYVJ3RlNFQWx4em9M?=
 =?utf-8?B?d1VINUkxNnFqQ2JhNWxZUWNyVWdFenJFU0dWUHFLVSs3NHBEWEJxV3JNaXBL?=
 =?utf-8?B?TGowUC9vZnE3VzBGUFBwRDhvVGRXeHEyd2JGVW9EME5lYlBzbGFBdWcxQjNN?=
 =?utf-8?B?RTViejZqd25YSHVZSVhISDN5amdTR3RhL3dTQ2RVa01WYi9kYzc4Zmd6MmRG?=
 =?utf-8?B?TWhIRURCbStRSVpFTmhuNGY0SXhFeVdLc3o2UHFVWjdLVUxrc0RpNlRQSjRK?=
 =?utf-8?B?ZUNIeVdSOXJ4M0grNEZyOEw5NGJtUGZBdTRwcUtTY1BCN3Jpem1yV1kxeURD?=
 =?utf-8?B?clZaOWFYN3gyZTY2bjU2eFdJdmY1N3BKUFdLR0FCdVJPWUc2YWUvemwyQXpm?=
 =?utf-8?B?R3hOVmxESWVpaDJTcVlFajc4MmZ3dkVDazh1STY0ajNhdFFLaTdHdU9TNkNu?=
 =?utf-8?B?UUU0ZTRvMUxWbmI0akdXWUE3V21uRk1JMDVsN1BzSTI5VTBidFMwdXZ6NitI?=
 =?utf-8?B?SkpRWFZob2ZQci9TRHNoRFZvUWtsSE5aeHdlR0Fod25DYTN3T0xZVWJLY0la?=
 =?utf-8?B?VWlYWHdxaloxRUtNdmRwWmhCc0w3bUs0ZGNXaGlzeThWV2Y2UGtiYVBMYmFB?=
 =?utf-8?B?eEhDMFBEOEpDSWRNM1YrL2o4YUQ4clArd3Y1cXhiRTZsQ2s5dXF6djdFSXcw?=
 =?utf-8?B?Zjh5bmMvdzBqbnZXYWhIRzJDUWRsTXVtWW1IVFkrRWJkdGdkY0VsTXh1bGRJ?=
 =?utf-8?B?QlNJKzZzS1lFT2VlYWJSY3dmRjNIcU85YmRyUHlsS2NUemw3dmFZTFpSVmEv?=
 =?utf-8?B?VTFOWUdneWFXU0s4L20za0J0K3BQOG1BeUoySWQzQWhYUjFoYnJ6bmEzVVBT?=
 =?utf-8?B?V1M5U0ZnUmxETktQaXY4OEM4R0IwdHcvcWV2dlNpbWlYd3d2RWNNZXUzZ1h2?=
 =?utf-8?B?L0NTZGxzdHQ3MFFtWVpFWmpJRnBXN2ZVVFlCTWREK3ltK2VEc2dGU2dEck91?=
 =?utf-8?B?RVpwbEJEY2RJc25hMDBObUpQV1ZBS3NkK2VrbUNObjhRWUVoL3dlZTlDbmRZ?=
 =?utf-8?B?RERKN29hZVhqY09hVzZiT1FJWGM3OVF4RWZEOUlDSGl0WC8wZkIyejdZc0lN?=
 =?utf-8?B?NGxpVktabWJ1YlJZR2ZtQkpWVE1JZUo1QkJzN290MUdEbDZ3S0Q5S3plbUJD?=
 =?utf-8?B?NEVJKzE1d0hMRjdlSXJhckplSTRyRG9pcCswWFFXY09ZVnVnRDNjTUFVVGZZ?=
 =?utf-8?B?VkhCQldFN0gwL3hhMS9UMWpMVWg3ZXpDaEt2bTYxMjdWU0trNjQzQ0pKMGlG?=
 =?utf-8?B?Z3ord2xvNjN5U01SRXBsNzlxQlR1ajNkK05jT3JRMlMycjQ1ZHBCTDdneW9v?=
 =?utf-8?B?Q09XdythSGFFQnVPMEpuUHZ5S2pPSlhNRDY4OU5PYzdMY1RxdmhPeXA3cnps?=
 =?utf-8?B?UkNBMjZLeDVqRU42ZEpQNzBTbGNQRTRBRkpqR2pOUmY0QmE3bitBSk55ZW5h?=
 =?utf-8?B?Mk5qMklXYlBqdWliUmZxVWpoQVhieEhNY3plSDV2eFNZSGRscXp6L1JuUURZ?=
 =?utf-8?B?VCtRQWxEcmtGYVNPZE9kN09CUDZ5M2ZqR01DZFBHZU5vaTk1Q0FidkRlMW1N?=
 =?utf-8?Q?0UZKmEFyzFSFDOCcwTUEa6lgk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed9b384-4889-4edd-571b-08de163d0aa7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 16:14:16.3825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZkssjCGoZv4k/xKwCIqBiuPNyf5ZO+0Y/3hXz+lhRIRForBN7uIte/+H0nKAvn2J5g672/7DJtKlXC+U5ENDAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6732


On 28/10/2025 12:54, Akhil R wrote:
> On Fri, 24 Oct 2025 16:42:06 +0100, Jon Hunter wrote:
>> On 01/10/2025 07:47, Kartik Rajput wrote:
>>>    static void tegra_i2c_mask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
>>>    {
>>>         u32 int_mask;
>>> @@ -1432,6 +1512,10 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>>>                 return ret;
>>>         }
>>>   
>>> +     ret = tegra_i2c_mutex_lock(i2c_dev);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>>
>>> I wonder if it would be better to have a wrapper function around
>>> tegra_i2c_xfer() called tegra264_i2c_xfer() that is only used for
>>> Tegra264 platforms and invokes these sw-mutex functions?
> 
> Wouldn't this only add another 'if' condition to tegra_i2c_xfer()?
> And probably making it more complex? Or am I missing something?

I was thinking we could define a tegra264_i2c_algo but I guess we need 
another if condition at some point some where. So let's leave as-is for now.

Jon

-- 
nvpublic


