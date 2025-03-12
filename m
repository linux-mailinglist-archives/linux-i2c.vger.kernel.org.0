Return-Path: <linux-i2c+bounces-9804-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B864A5E367
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 19:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 836B43B76CF
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 18:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034542566FA;
	Wed, 12 Mar 2025 18:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b="jx2wtSiQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2135.outbound.protection.outlook.com [40.107.220.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1510A22DF8F;
	Wed, 12 Mar 2025 18:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741802700; cv=fail; b=a8OG6pOEY9ypC0wqGi7sT0bmIQQc7Kco+UcZtfPMxlVl5oHC3wsw9WSHVG81xi77QvlJsE8uFsVzvRmHc4n++T1UluHHZho/fFbG4NdVpQ6We9RTHg7/1OYMOw2T3cAYmnYrEbURLae4/PtLwqE7Qadw/KSDn2N1JbqF/vw1cKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741802700; c=relaxed/simple;
	bh=Qet7NoN+bJ1WGoDWAvfWnleWpu3C2K+nXWQ4UoxqkI0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kYBuKUMx2cu0dBkfB2YcUcUeRrdIAqIPJOnO45omT9vs2buPTdjPU9FWSPPNyY1sbIkYCyqCxD1f5sYgrX6si9+j15fXytobJuR8kirkzIxnf+nWnpec2eXHRLmh45iNecJrS9Nt4rNTf/9daLE7H8Nviqv9XE8cUqhiJk6Qa2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=fail (0-bit key) header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.b=jx2wtSiQ reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.220.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UD1AaxU5rB0WafUDctq/12fX1kNdQOipoFtjHHsg6VDtCT1pKoDjbCxujG6w8WJxN0cnYzlM/p72kyzHiosLyMqdoc5AE6WXCVUEH7SQkWHWJ+u0lqA3qNLq7RIJZeMbdoy7TP9UbFgCiiBHPTtD19iIRmnCGtMwKhXlNnMszo9P1vAmL275PvUVYAiqLEvUoAgxzHaR7j6qQEAjwfmJrtiLNXn8MBIHQy/qKSgXbsZg8YtmwRPDesMM/5LVdQIJE4yE2kBToXtl5wgaXWG5UkwQBoOI0FRFVaC39wKMFK2E6u4xP3tsA8IIpiRqs7gkp0uTi5InHoRoOinp8iw2UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K61FGefTE92xnrrRDxEs741RivV0Y0eICWxaajPT/B4=;
 b=kvnO8HdGazI5Uc9auKmXkcvxAxhVbI2h+UwBICcY6jkQd4jKS7f+Ww+zpqeQ9MUnkFHir63DBAHndl12NH/9ZxvOiQqbDOWtIr3HZkK/Jvkt8/4mA2H6wm1NfXAtzXFz85s+oHoTx5Lv2OkDVbyB4s1ZW0frLvD5GM7Z8pMdbc25TluYzMo+2ydRAop8/cFSlj79HwXCQeJSI65spy5H++AWp3lZYMQ1vs0hwwvmlhHHMQiVsV1er9I23HQawOeMCd4RZ91WBo+vu1Gc5a7/RRm5/WYISI7vmTUj1t4R3iZKX54+pQAV/gJMpJu3A6276Ee6k2eYS1jpagVDRtjlSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K61FGefTE92xnrrRDxEs741RivV0Y0eICWxaajPT/B4=;
 b=jx2wtSiQG6xb3ocFx7SSD0hxpPfQOtFBFY8t9BrWO8R6qFuzdhzzrRyvTc/wrsZ510rwEg0DpNxZLm8s/XawoAzqu2AiU+8ElV4tDe7FQlpbkZXlw+SXOyspVAUNUtr9KL9A6VhHr1CImWC3wVZUAsYxXzDTV+wreBVmJ6VH1hs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SA0PR01MB6171.prod.exchangelabs.com (2603:10b6:806:e5::16) by
 BN5PR01MB9154.prod.exchangelabs.com (2603:10b6:408:2aa::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.28; Wed, 12 Mar 2025 18:04:55 +0000
Received: from SA0PR01MB6171.prod.exchangelabs.com
 ([fe80::b0e5:c494:81a3:5e1d]) by SA0PR01MB6171.prod.exchangelabs.com
 ([fe80::b0e5:c494:81a3:5e1d%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 18:04:55 +0000
Message-ID: <17a7ca5a-31f5-47fc-ab67-348df20b31ec@amperemail.onmicrosoft.com>
Date: Wed, 12 Mar 2025 14:04:51 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] mailbox: pcc: Fixes and cleanup/refactoring
To: Sudeep Holla <sudeep.holla@arm.com>, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Adam Young <admiyo@os.amperecomputing.com>,
 Huisong Li <lihuisong@huawei.com>, Robbie King <robbiek@xsightlabs.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Andi Shyti
 <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-hwmon@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>
References: <20250305-pcc_fixes_updates-v2-0-1b1822bc8746@arm.com>
 <Z9AoOg-cx6xVW_Cu@bogus>
Content-Language: en-US
From: Adam Young <admiyo@amperemail.onmicrosoft.com>
In-Reply-To: <Z9AoOg-cx6xVW_Cu@bogus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::27) To SA0PR01MB6171.prod.exchangelabs.com
 (2603:10b6:806:e5::16)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR01MB6171:EE_|BN5PR01MB9154:EE_
X-MS-Office365-Filtering-Correlation-Id: 4988e42e-2f41-4c8b-b976-08dd61906518
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2k3cU0ybGo4bGZuRzJyVW5JbUw5eG13SG90Z1JqQ3ZFbGh5WWlPRThjSE9t?=
 =?utf-8?B?YklYVUNFb0owbFhzcFpuL1VFdkxXcE4rbm56OG9uUXk3S0xDajRnMjFzRHJ1?=
 =?utf-8?B?eU44dk5OM2hFMERlTDVBL01vaThjZ1o2NXFXNWxwbEI1Ui9mYkp5dWNIc0pX?=
 =?utf-8?B?bXJWZS9sMi9qQ2NPQVhlT056L3R5MUROczNrV0wxZUN0S281SHRnWXVVL0dD?=
 =?utf-8?B?eEpKU21Dd2Qxa3BudWx1dWxMYjJNTC9KVHhZUFVwY3pnUitaSUp3SGtOdnh0?=
 =?utf-8?B?NGRIcU5kVkZZYzVYV3VuUVNVWTcrL29vcm5qTFpBSFVXdG8xdU9Hb2ZrSzN6?=
 =?utf-8?B?MlptcFJYcG1tNnEvdklVYnRLWEFUZHA1NW5yZlA4NzdvYkpEZ3JwTUUxWGk3?=
 =?utf-8?B?ZHRRRFVtZnBNRzZtRHJya2huR1BCSzlMU3Y4SWZJYUU2ajR2Qjl1QlVTaFZa?=
 =?utf-8?B?SE50ZjY0Z2xDdEFnNHNicGJqQWxVL2JWWDhlVVVKVjRYTDdMOGdWYkN3WC93?=
 =?utf-8?B?NTJzWDMxUGxMcXdaNDIzYklueHZrY20zMUc3QmxSN0tlay94a1ZWU2g1MjB5?=
 =?utf-8?B?NHY1K1BXRjBTVWRHaXJRNXh3NjFQMFB4MHh6bzk1NlFnRmdCVUNOUU04Wnhk?=
 =?utf-8?B?Rk5mNVZxSkNCMnAzV0x4aWZJTUN1cmI3bDNMbUN0MEdGNXdoaWRrVkZlbUdC?=
 =?utf-8?B?OE1kS1pqcTU5OTArN1BOdGxKNnM0N0RTL3Q0c3VNc29TKzJuUm5XVVM2NVJw?=
 =?utf-8?B?SGJFaXVmYVU5M0VFWGErOUtyVEtiNnlpTUxmREZNbS9BR0lLMlpHZElGSWpZ?=
 =?utf-8?B?ZnhOY1hYMTMwTTFsUzB5bzdPVXI2M1l3bFZwL3VLOXRIckpCN1MvRWxwbCts?=
 =?utf-8?B?NnNvcGt2cUgxZWk0Vk1hamhVOWNZN2cwV2pRb2NNeGZEUW9kK3RINWZrbE9S?=
 =?utf-8?B?OTNwTk1aMEpjZ29sNCszdU1xZHkyVjNzWnBRajZMOHk1VGZwWUZYWkx4cXI5?=
 =?utf-8?B?UGV3bUhWRnh3djdEaHR5UU82cnA1TnArNHYyZ3M5aGhKdHhpWUlzWmNSTXJo?=
 =?utf-8?B?ZzBEbnhOUHJ2NUlDRHRFeXF1Qnk5UGltZk15UkphVndtckFUR1E3emRGNFZ0?=
 =?utf-8?B?eWE2cmdBb2hOaEFwZHpkNlpoby9FYzhuTmJpZE43bVZTTTdvUHNLRlJoM29q?=
 =?utf-8?B?VGs4OGlCdzlkV2pCY2ZWRUpwVktTdGk5eGwyUHljU0FoRk1EeHMwZU5WQ0xa?=
 =?utf-8?B?RWN2TXYzSVNnbEdDalFVWXR6TEJWcG8vTGJsSUFFZW9TRGFkelFaN3dMdWp3?=
 =?utf-8?B?YnhLWXVseWtnS3IwcGRMTENHaU1wcXdFdnpQZ2IzN1RkbzJOVFpyZ3FtQW5s?=
 =?utf-8?B?UTVqbERaZGFMcHhVWHd3Mm0vNWhSL1d0RFkvUkZHRDRqSjdpQ0JOcjZxWElv?=
 =?utf-8?B?YnpUc0tiOTcxOXU1N1BxN21yUUhpQ2dyS2xqcWhpdThEQjIrenFpYmpRWTV2?=
 =?utf-8?B?SU9ST1FGR3AyTmIwQ1pFdldkOGNmdjkrVm82L1NvNE15dTN3UEtQQytZSkJw?=
 =?utf-8?B?bGFzODdPUDROYjZVckhGSHcxRXBhM2xPeEhlVEdEdmo1bnp0OFJoWktaRGV6?=
 =?utf-8?B?bGdhM0FGVDNEcklqWHdicGlmSnJReUVKL0NmQXdEMEV4N05HVHRjUkhTYXQ5?=
 =?utf-8?B?blZpVmdpRzRiUVNLZTRxSlNKa3RiVFZFSktWMjdoNTVjQmQvMktUb05FdmY4?=
 =?utf-8?B?cW5DMUtpUHIxWEpqWWNnSFcybnMwMDhLdStENlo2Si8vUnZ0N1JtTW04cGpk?=
 =?utf-8?B?Q3Bub2N4UEs1Mk9vVUhLS3ZEaFZCOHhMb1ZzVVNPSHBhbkt1M0hZZGQvR0dX?=
 =?utf-8?Q?FMiDa+w8oqwcE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR01MB6171.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mzh1TkoxdzBFMUtpY3JqbjBQd2RiTVVrV2Flanh1TFlPSkZTZmp6dVl2WkU0?=
 =?utf-8?B?bmtnMndPT0E0Y3hBbTBmZzkvVXhHZWE0RjVHZmJobXN6L0xZckwzWXpNbFFo?=
 =?utf-8?B?RnhBeHM1cnUvQzF3UFBpdDVzaFVjcXhJNG4wZUJKeHdrVG1vTFQ0T3VkUzZp?=
 =?utf-8?B?NmYwcmU2cGZDdUpNSjdWUmpjcnpTMC9BajA2M2gvS0VmWjVrL2hOenhFaUkx?=
 =?utf-8?B?ek9qRGpkL05FV0s5QkJwU2F2RDhzSEh4endPRjNhbFpBaFh1MnpyRGRUcjBE?=
 =?utf-8?B?dFNvaU5YcG5yNHNNdlcxd1JCV2l5SXpRbGQ4c2xObVJWdS9xTXZCK0tBdHE3?=
 =?utf-8?B?T3RFbnBsTHlyVFRzVEJCMzdnNFpicUJuY0ltVHhpc2NGMVdTRUhmUlJDbXJh?=
 =?utf-8?B?bExqSkx5WFFORDBJaTZwN1VXdW9lZlJjUDQzdkQ3MnF0Y2I4YkpQL0lad3Iw?=
 =?utf-8?B?WUNZb0ttNUlHTEJmZlEzVkZIVktibGxLTEpkQXJsRzlQM2tIY0JINXdHMG5M?=
 =?utf-8?B?QkdSNW5KcmtZVmJLTHlUYlVQajJzVERmS0xHY2VXazhEbTVwVGVKdllZMnNG?=
 =?utf-8?B?c3YwQWR1a0l0STF2WFJ5MHp6YTEwQUdDem4xd3hYZVlqb3F6S0xyVm5qck5N?=
 =?utf-8?B?KysrWFo4bFlDaUNYNTI1K3FqVGtSYXBVSmVxY3VQRmhoNUwvZld3Q21PNUlG?=
 =?utf-8?B?WVVqTVcvK1VGZmZ2akRVRHNsUm11TXVSMlNwVTlGb3ByYTlxZjFNSzdaS2RU?=
 =?utf-8?B?THBTTTdKU1o2aWxEOUx1K2JldjZTZFMxMmtEaTN5S3h6R3dvbUNzc21HOENq?=
 =?utf-8?B?ODBuUERRdkJpR1h3RGRiazZtYzBrdkR3eVNGeHdmSmxDTi80YUdxcjZ5ZFo1?=
 =?utf-8?B?L2tYcUJGUis0cTI3YVhFcmpRODRtaUIxUjFUSU5JT0cvaDFIUmR4OEJRNUdO?=
 =?utf-8?B?OEhQSk9qajZyL0g1QlVxbFlQNzRHZGo1cmM3TFpPQ0dJeUFqWmJkQ3YvS1A1?=
 =?utf-8?B?dk9DWFhXZERxanJvWHNKL3pIWWVwUktDZCtPL3k4cGdYYlR2N2wxd1FkU2l5?=
 =?utf-8?B?N0M3RENVbmJueUI2dDVGUWVJT25NWkhQaHk4cUFBY3M0VHc5cCthNFp1QjBU?=
 =?utf-8?B?NEQvaUNkR3dDWWNXcmlGc3hnUzAwdHd4aFJhOThlRmsrUUFxakh0OEdpby9G?=
 =?utf-8?B?aGNnWEVaaXIxaUlEMTFDb3lndGxrVFRqOVlrS0dMZHVGaWJaMkZqMW4xdGFJ?=
 =?utf-8?B?aFdjS3dydXhzN29ZWnZVcEtTcjkvRTBqZzBTbjhqOE1Bb0k1MU14VDM3SGto?=
 =?utf-8?B?Q29vZ2NUNkxlNWEwWkdjNWN2SENVb01CakdKQkhNWmNFTG5WQkJaa2ZMdFE5?=
 =?utf-8?B?VlFuY3Mwd2Z6S1liWEVIT094V2g1d1lNZjEzRkFQS3dvZGdkNTJuZkR4a1Zq?=
 =?utf-8?B?VlhBZGhxM3hmUkYzVHlGODFNYmgwMkx0L3VhWktYcHhUSllkV25WQnRLK2Ns?=
 =?utf-8?B?MStRWmhZWU5NUEZZVXFaZDFWelVreUtKMUpkaTI5bFJuRTZSV29UVzdLVm9K?=
 =?utf-8?B?M09EdVhTNkpYMngxUjVHbytBUTI1eitSa2FJVGI3YWhrekdlSVJEN3k5Uzd3?=
 =?utf-8?B?V05wZndKKzRlOUFQL3l5N3d0dmdSZjJ1Rlg0NDhCVWRLSnZSQnFNVnJqNW5B?=
 =?utf-8?B?SG5ycTJrckF1Z0plSUY0Rkd3cjRWeUJmeXF5ZHV6WGVtM1ZUaU5ocDBhWG9i?=
 =?utf-8?B?QllJRENDQzZ6UVpJdzl0elQwWGU0eFg4ZDBDTHdlK2hlcXc3UXZzemxpN1No?=
 =?utf-8?B?MUFmUlkvOFZJSXdUYjBGVUFMOU1XSlgzUHg0eE1qZGYyRStkeHVOaCtqS3BZ?=
 =?utf-8?B?anpEZ2l4cWZJMXExcEFKSUFCV2dLU1NWMWRySlNVSnBmTXhKbHlqTW1tU1VQ?=
 =?utf-8?B?TnU1bEhvSDM4MXJXWmp3T1Uvb0V6QWVzYmJRY2dsaE55eWFFRjdmWEU2Qytu?=
 =?utf-8?B?a3oxRFFqZjFFVjJrVGZBTGV0dmRpbG9ySE9BQ1YyRXh2dGRHdmQ4WWYxTC9o?=
 =?utf-8?B?UURUK2gvK2hqbFcwVm9FazBWWnd5LzBzcDFhODdjeGpJZEthd1AwQW4yNnRB?=
 =?utf-8?B?emlGVStXZ1oySnp3cmpOenlCQkJKRzc2QXNWRkcwWDRvWE5XSVkxbWkrRzhk?=
 =?utf-8?B?OEVWbmxLRW1WdEhMQnJVREsyOVVSSGV2OVdBS0ZNcDhmWmRiUkVWMlhKeFhJ?=
 =?utf-8?Q?KH6jOlbDQ5jLSgqbgRyX6/a2BL7IHvXqxfPYKpZ+mo=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4988e42e-2f41-4c8b-b976-08dd61906518
X-MS-Exchange-CrossTenant-AuthSource: SA0PR01MB6171.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 18:04:55.7521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: En4rvBR1UGZiGFHF9NFls/dqfaQcc5BAO6FpFiIis6S1RCRs4ns6L8GDf0YTYQO7XXjjkKoy65KjpCUiVCevNniKqjAQNuCbUDHUMcnlw4f6mN1vPwzXXaxBNoqROJJQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR01MB9154

The XGene patch did not apply on top of Linus's current tree. The other 
patches applied OK.


I only had to make one modification to my patch to remove the call to 
‘pcc_mbox_ioremap’,  as it is performed in the pcc_mbox_request_channel 
call instead. With that change, my driver continues to work. I will 
submit another version here shortly.

I like the direction that this change is pushing, making the mailbox 
layer the owner for other drivers.


On 3/11/25 08:10, Sudeep Holla wrote:
> On Wed, Mar 05, 2025 at 04:38:04PM +0000, Sudeep Holla wrote:
>> Adam, Robbie, Huisong,
>>
>> Please test this in your setup as you are the ones reporting/fixing the
>> issues or last modified the code that I am changing here.
>>
> Huisong,
>
> Thanks a lot for all the testing and review.
>
> Adam, Robbie,
>
> Can you please help me with the testing on your platforms ?
>

