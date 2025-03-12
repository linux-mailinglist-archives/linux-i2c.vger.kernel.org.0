Return-Path: <linux-i2c+bounces-9816-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2840A5E57A
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 21:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35C543AF2F9
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 20:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F091A1EE02F;
	Wed, 12 Mar 2025 20:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b="hZXrUuRR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11020120.outbound.protection.outlook.com [52.101.46.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1405CFBF6;
	Wed, 12 Mar 2025 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741811863; cv=fail; b=NQu3DSFQJJEr/ghnoaOuRqEKCNSm0SgLnwjdkvTZdX4I+LYYEmsiM6v43KUfU65uvm0TxpiFe7rdlM/BlPGrnoWk5oomw7kDqY7KZqgJ73ghCltWvc6XUw9rrueaN2bDUDtFBgkRPiPvtQIKfRAK2Z1csRnaYDpPERw6omCLEyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741811863; c=relaxed/simple;
	bh=31XbcHks/Q4wSBwy+zYgQdLvytvKQfm0ITKs2vlcsKQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=k1x2+pxq6V7ru1fWY/Zg9vpldFumFUx+rzcTBBHcmHSJYcIjWkHaUooo96a1mIVKGsXgQrWgyQCB534sI/9DLrwJygQYWS9t2Uj/wkYnoUJVCL8BW/Jz4bEPmGWUs68CvspJnT9vsBbxpOk75908qTtteQaOeitWBv60rxQzNos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=fail (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b=hZXrUuRR reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.46.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s54kR3gbw7oVaRvxQlXjtocg6gpJHX75kDbDj06qTQb8c1s/gnxYQMVoO3az8HI1hiFan1UBKcgUnM1A6bJgOpKCH9kLdu7JSnDRS7fs2vjb8ahVcNO4TJXhQ1+Yn3abWILdUN+CLWSUOs4zvuuFhoI8tGdnAubueD/6vlkbpvEtmvkPHkYohS2Rw7Cn+jPdIs9ykTc8lOVYNzoEq7J0VibcOScwLOhZ+BY75CdCym/pUme/fSE/wtqJUnC0sukOXixlrAtIlFSva+MrHpHzgyrfJd73GydEwoDiz28n86hjFXNDESyAWTW+d46b1J6RZFkyms6qgSnlJq/6L49XRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQxY3RkhNMBon2PBqqyenSlaJ6ehjPKtKJHhZQDXacQ=;
 b=wZ4R/SOMumWqhe3yWxBQiWdvar7RvYdrxspIvKzz1peNqoBLr0G/i74BhNYwewXMTglKIpuytabuMd0FcWRnyJiVznuLz1fPkkQHyRh96ZorxeDu61IqfIOzn31rwHyUxgynxD/Oz7C9+xCGOuIL7H/vjmckoegQzKoMKbs0YoWsL3ZEKRwOeel+yZwefWIK8MiunZfef3A/QfNuFRhAHs7IM8+M0Zll4EUfaht2uEDl7kctpeGgSdCvK8KMP+Pi8WgLPbQULudjWvQF1cGSPNVoy5EyZf62jwXeGycRve370ZOQXHWDgtKiEhN+3CP2wvGCo+bzOHV9B8uoQF6ozQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQxY3RkhNMBon2PBqqyenSlaJ6ehjPKtKJHhZQDXacQ=;
 b=hZXrUuRRL+NVEu4HbSlBBphWrbeuZh3QBX/vrnwXMu+sUpEHQufpatn0wwfcxrv1JQa80fCnLXVChCS5e1v+NTqlT7tp+BDKaS/AIrZrQGKgmMWD0vQDFo68GrOn3fMQaDy2sgvbFwbWg6aaEPpaCEbreVwKb3JuZNngBZsjnEg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SA0PR01MB6171.prod.exchangelabs.com (2603:10b6:806:e5::16) by
 SA6PR01MB8998.prod.exchangelabs.com (2603:10b6:806:42c::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Wed, 12 Mar 2025 20:37:38 +0000
Received: from SA0PR01MB6171.prod.exchangelabs.com
 ([fe80::b0e5:c494:81a3:5e1d]) by SA0PR01MB6171.prod.exchangelabs.com
 ([fe80::b0e5:c494:81a3:5e1d%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 20:37:38 +0000
Message-ID: <7237deb3-ad30-457c-a1b2-c92db1c1e9f3@amperemail.onmicrosoft.com>
Date: Wed, 12 Mar 2025 16:37:35 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] mailbox: pcc: Fixes and cleanup/refactoring
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Adam Young <admiyo@os.amperecomputing.com>, Huisong Li
 <lihuisong@huawei.com>, Robbie King <robbiek@xsightlabs.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <20250305-pcc_fixes_updates-v2-0-1b1822bc8746@arm.com>
 <Z9AoOg-cx6xVW_Cu@bogus>
 <17a7ca5a-31f5-47fc-ab67-348df20b31ec@amperemail.onmicrosoft.com>
 <20250312200532.67xkag3joatel6m4@bogus>
Content-Language: en-US
From: Adam Young <admiyo@amperemail.onmicrosoft.com>
In-Reply-To: <20250312200532.67xkag3joatel6m4@bogus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR18CA0029.namprd18.prod.outlook.com
 (2603:10b6:930:5::14) To SA0PR01MB6171.prod.exchangelabs.com
 (2603:10b6:806:e5::16)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR01MB6171:EE_|SA6PR01MB8998:EE_
X-MS-Office365-Filtering-Correlation-Id: 0313426b-535d-4592-09e7-08dd61a5ba96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlY4bnlZK2xiU3FSNEtBOFl5bFZvNjVrRzAxT0NTTXdnMXJha3lSejRaQjds?=
 =?utf-8?B?RkFiUmNKY0dCMGhWVWs3TmJxSm5iZy9lMGR1eXBWWEl4YUlhMkpnSkoyYUtK?=
 =?utf-8?B?Z1IyTkZDWUVIdUZON1RlUmNtRmJNNEVqL0dXWG9tM1lHQzVEVE1mVVkyRjRo?=
 =?utf-8?B?RUpDM29XYmhVSWZENTNBSDJiRGJmeThOODgzdmpGZjBrdkdlSlRzR0J2OVYw?=
 =?utf-8?B?Ri9BVjkxV3dTRncvbzAreWxlcmhHS2t3OFRQYkxrMTdIQi9TenlUSm16RHdt?=
 =?utf-8?B?cjg5anM0dHFLbW12dXp0b3RJWk9IbFYxL2pVRWJFblg5RzRnd2ZMempnbWg0?=
 =?utf-8?B?QVdBYlNmMWdJcVU3ZEZHcUJtQzFzSDlZYVhjV0FKb1hIK3ZzUzUwN0Y2QU5B?=
 =?utf-8?B?RXZTemVUbDZiTTdkZjRJemFSVy9NZE40VjQzWHVSOGg4MGlGNVlTSlk0by9w?=
 =?utf-8?B?bTdhT1VCV0o4MEk3aGpTN3RzL0lndC9SeDVVd3dEa2FMM1JWZWpIdWV6ZVEx?=
 =?utf-8?B?V1RaTGk3MzZTY0ZHazVDcmFRR2Ftby9EcVViczdnVkJLenp6cXZ5Mk8wWFZK?=
 =?utf-8?B?SjlHMzVaM3JPRncyQld4V1VlWTFuRmhtNlNuVTc4aGcrWU10c202U3dEMHFs?=
 =?utf-8?B?NmhIYzhOekFFOEJraGxFcldVc2l6SHg0aTAvUlRpK1BtR2FXNmhKa3NpWUxM?=
 =?utf-8?B?dzZPT0hQZ2dtWmhMWjZXbmVlSG5qVnI3dWliTUk2b0RxS1RUNzVHRnEvbmxl?=
 =?utf-8?B?aTI4emNtS1BHOWlUSUdtMWNueVdBck4rK0JES0tVZG9vUFJPZnhlWXROWDhl?=
 =?utf-8?B?M3VHLy9BK2o5bmt2NlIzQVM5SGVzcEJnZ3poOHVWWmpCVVgyV2xQV1VUSkZM?=
 =?utf-8?B?K2VXYmE1cXNLay9EYjZad2tPOStwdStnSStwV2RnZXlMc0s5M0t1aWJ1ZlVX?=
 =?utf-8?B?SXhydWNROHN3bGhoZFplTU1CL0ljQVc2S2RyaFdWUzRESUd3b1BUWlpFZVFs?=
 =?utf-8?B?SDM1ZGdaZ25GQUU4WXIwcWxMOWJpcHBXWG5BQXRqRkFPa1Yvc0hodXlvVFlQ?=
 =?utf-8?B?NFJpY3pwREpNanI3N1lzcStPdUo2M25hcDhyU3dON3poOFVOSHBPUFQ3c2Vt?=
 =?utf-8?B?blhxWndGUTN6aXg5MlQ2MnNtT3A3M3RVcVM3ZVNvUUFSV0xpTmpNY2NOSnFK?=
 =?utf-8?B?NmlHMnNiZFY4cG1KM0pla2JuZHJ4TmppWm11ZTNFN3g0UXg1SjR0Y2dFdWhi?=
 =?utf-8?B?SDNlOGRjRWZUZkVLODcweHlWalJYcHovVmx6R3ErWnA3cDFIMnJjcHVNcGhC?=
 =?utf-8?B?Vm43dWtJM2dreXZINlFKc2ZmYW16SEc1b0t2cGNYeEw2b1g5UnFnYXd1Wnl4?=
 =?utf-8?B?RnlsanhnNCthTjRxaEpXRDQzNEIzc1hlTmZVQTdrUzBRVWhkUllReHBheUFF?=
 =?utf-8?B?ZWhzK0t3UmlNdEFRSHVVK1BWdnZibGx4NU5vNDRQek95SzVWOFNocFVPNTc3?=
 =?utf-8?B?NkNiTGkyR2EzQ1hZQitMNy90NDAzcFBCQm56cnFkbm5iSC9MRU9yWm45WW9q?=
 =?utf-8?B?YkdMNG83SC9iRXZQTWsxUDZNemsyUnk5NklaWnpGT3RMZnU2Y1pNOUNNTlcz?=
 =?utf-8?B?VHBQanZkSXpQclZhK253OXZ0ZjB6STlPMWJxckdaVkNpdE9GbXJ3UTNWbENV?=
 =?utf-8?B?YTZGMXFRcVhJWlFVOW13WENjeS9LOE82R1MxU29IcW53YWR2K1poVXFDeldM?=
 =?utf-8?B?SFcwRGw0L2dCaUYzbFFvM3hyOXFaSTZERkFGTmxMYTFMZlA5MjJidEdnNDhL?=
 =?utf-8?B?aXNCcStjM3I0ZzlpaHhnNDBmbUpVNFBXV3hSeHZvWTRJTElSWktaOEdERi9l?=
 =?utf-8?Q?p7mGnKfuPED5s?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR01MB6171.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXFuNmZqSlZ3ZWtTSHlwOGxCUjByRU92c1dNREJqVVZBMWFGVUxaRmFSQXFa?=
 =?utf-8?B?RjhPNTQ0eFJYcWFXT3Q1bGt3Tmh4S1pqRmtSQmZkZXVzUjNyeGQxQ2Q5VWdw?=
 =?utf-8?B?dVRid1czTUIyVFFJRkFnRkRheVhxSEptc0dEdU1nOFZZSHV2cEhraDlSVmVT?=
 =?utf-8?B?YkExN09HRWx6Tyt1dlo0N3dyRjA5cGhHbTd1WjlkZGo1YzV3bFpTMXk2c29n?=
 =?utf-8?B?dVN3WjNsY3N5Z0xCS285QkFjV3BGRVpjQml4U3BlTGFaYWowdFlhc3lldFBU?=
 =?utf-8?B?U2Z4bVpTSWVEZXZxQ3BrUVhTaUlnZmVucVRsTG1QMnJERG9yVWdOckNBb0RG?=
 =?utf-8?B?QjdWVzBGRkwxSTdNQ0h5c2RKelFIS244S1NkcmsrNUNNL2pNRzJrSnZmZ1hZ?=
 =?utf-8?B?b1lwclFEbkFlZ2pYbDJRVzlxZllJMUFLQ1pQZm1ycm9VMzQ4T2ExVEZMOXpZ?=
 =?utf-8?B?U1Y3V0Q2VXk1aWNKRzhybUtmS3lkTmdxckw4WXhjL3dZNnpQUWlZamRyVUhx?=
 =?utf-8?B?TjQ5SkxyalJXZjhrcHNESHFlb0VrUXlNd01mNEg4NEJoVFdHa0o5cHJLYmU4?=
 =?utf-8?B?RHAwbThVY2tDcnF6cVJLbHpjQURTM0ZVWU5LQjQ4dHRJSEhJQVFwU0FjNTlD?=
 =?utf-8?B?V0oyTUE4STArYUp6QWpLRjhMcG51ams5aUhIRFI0Z3NlcVJtbWVpT1pPc0Ex?=
 =?utf-8?B?d1ovdzJHZDE1UmhkUmdQcjBDRGk3MDViazlFLzlyWElaOFdIdldidXk1eksw?=
 =?utf-8?B?aFhsbTVlRXhQYWpvWkFZdzcwZ3RsRmtSa2ZuZmV4bjlacm9wcTlmUmVQL09D?=
 =?utf-8?B?M05LSUhiZVZaK1NrVWVyQ0xnbWVyQWlIUlhmRDhndDlWVmRrRkk2eDFwa2RW?=
 =?utf-8?B?aS9zQUtSQ3UwQjFlQ1ZIQm5VaStqUTBac2Qwak1TVjBjS1NiT0xCK1hNT09V?=
 =?utf-8?B?SGtNZ3R3ckNjWTNlNGpJZjFsVFB1LzVkeFhXcHUyL3huZEE4TmtzNHdhVmVN?=
 =?utf-8?B?ZFpXMGNHbGIwVmR2QnQ1QnppenJDVnhlMmNKODQxL1g1bG5JU1dCMXliejhV?=
 =?utf-8?B?elJBcVpLakhUZ1NaaFdWTnlXYnlMVGdndG9pem5KZWpuTFpZOENFZXVQYzlX?=
 =?utf-8?B?eStGcFhWOGNMSjFRazE3ckFiOE1RN2wwS1FIQ0ZRR284K29QUDhwZ29rTjQ1?=
 =?utf-8?B?OS9qOHdmUjNraVA2UDVNL0RQOEFWRS9tdndKcU12bUtZVmFkRS9mWFJQYjFB?=
 =?utf-8?B?MEhNdmJjZ0w0SGF6aDZ4dGpkcDJSQmg4czJLa25Zc0hybjJLVDhvNFV3eFpU?=
 =?utf-8?B?RGVKTWdUUjRqRUFZKzF5OCtzS0pXWlRlVnBhNGxTREZxNE9JQTFZaitZblpW?=
 =?utf-8?B?RWZQTDNTV2xBWHFTcGk3Uld4MnNObWxBWVlYOWsyLy94R05TeWMwS2RiTlBI?=
 =?utf-8?B?cEFWbFh4TnY5NkhJK0o2ZnE1TmhkNG15bllRb2hjTXcvK1pveWJwMlRjMW5Y?=
 =?utf-8?B?N0ZQR0daUVhzdllNMzAxWWtxa0pMZXF1VFhQZzlnTUxDTUVPa21YRklhTXJE?=
 =?utf-8?B?SHJWeFU0MngrS3FVT1BxN1c4eEJ2UmMwVmYrSmZCL1A0UUI3dzFUcFBDUTJy?=
 =?utf-8?B?a2VBSXBUNHJrUnBnd29XaTVHNTdXdEs5b2FEQ3ZSK2ZLZ2U0MElYaDFLWXU0?=
 =?utf-8?B?YmhHQjlORnRqWnREZlVJWDZPT1g2VU5TTXFhY0dGTmdmc1Z0Y2tiMlpZZ0dL?=
 =?utf-8?B?N1RUa2Y0Nm5WZE5FTFdRNm5KRm15ZWZyQ0RjV1RNZzQ3MWlTMmVsYW13bDRo?=
 =?utf-8?B?OHNDS3h2MnRlZGRhRG1SWFo0Zlk4OVFJcmEvWUNuNGNFNmFsNkVCek1zV2Ex?=
 =?utf-8?B?SXk2U0M1a0RBc0wzYVJCeTRvUDdxY1lwWDRFbks3Z25mWUR1TEVEaVhHTjJJ?=
 =?utf-8?B?R3RyWWFxaU5wQkhMRS9WS21VU2xza29mdWlPN2RRcE85NHlPTVlIWWJucXF6?=
 =?utf-8?B?a0Y1UlU0UFRySXYwM2NPbFpKcGdoMkhGaFhOc2tpNGdYRFlIQnFvQlFVYnhC?=
 =?utf-8?B?OEFybXdtM1YvRTgzVFIrdW14cTJ4dGpOZkFLWXFYcEpoQ2JSVkc1WWFjVE9u?=
 =?utf-8?B?cDlXMkwwUjJ3YU9Vblhnc1k1dlhYeENHSHM4TjFxbFZ4QnFGaGNxSUU0QjJC?=
 =?utf-8?B?VGd0aXc0T3Y2VEhoV0FKRGxvMjRkSHpyTVhPZi9icDczeldlNzE3NW5UTmJF?=
 =?utf-8?Q?Sz8K2hmK/87lfW7t28dtjF1sSAGO2CZKY8L2E6RiRI=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0313426b-535d-4592-09e7-08dd61a5ba96
X-MS-Exchange-CrossTenant-AuthSource: SA0PR01MB6171.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 20:37:38.5638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: arbotuwKXd6OGDKpYLvPkOzcgTEV2JOhmfImzb5w1pYBfWvESObGiME/Tj8ncFfcYoDBsdenRFFSJqXL6eq66B2tKpMo8Be8MrB3P5h2bn+XAvwXwDFem6UUlwxVjK4V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR01MB8998


On 3/12/25 16:05, Sudeep Holla wrote:
> On Wed, Mar 12, 2025 at 02:04:51PM -0400, Adam Young wrote:
>> The XGene patch did not apply on top of Linus's current tree. The other
>> patches applied OK.
>>
> Yes Guenter had mentioned it in his review. I have it rebased locally [1]
> but yet to push out v3 on the list.
>
>> I only had to make one modification to my patch to remove the call to
>> ‘pcc_mbox_ioremap’,  as it is performed in the pcc_mbox_request_channel call
>> instead. With that change, my driver continues to work. I will submit
>> another version here shortly.
>>
> Nice, I wasn't aware of the Ampere driver using ioremap. Is it posted on
> the list ? Or are you saying you will post it soon.

It is posted to net-next.

https://lore.kernel.org/lkml/20250224181117.21ad7ab1@kernel.org/T/

I will post an updated version once this series goes in.  I don't expect 
it to merge for this kernel due to the dependency, but the code will be 
better for this change.

>
> Thanks for testing. Please provide tested-by for patch 1-8 if you are
> happy with it.
Happy to do so.
>
>> I like the direction that this change is pushing, making the mailbox layer
>> the owner for other drivers.
>>
> Yes it was long due. I had changes in my WIP but was away when you changes
> got merged. Otherwise I would have asked you to do some of the changes in
> this series. My bad, couldn't review your patches unfortunately.
>

