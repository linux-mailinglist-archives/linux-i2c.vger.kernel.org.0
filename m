Return-Path: <linux-i2c+bounces-6606-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AD197616D
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 08:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A5EE1F2128D
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 06:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4856F1891D9;
	Thu, 12 Sep 2024 06:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VxJ6u466"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741A012D20D
	for <linux-i2c@vger.kernel.org>; Thu, 12 Sep 2024 06:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726122179; cv=fail; b=GigpJUiEGw4SQZBrnjzAyAX/P4EweXbYbRFkRaiG4WDyjnImuO8GHuKTOlSdd7wg8eVO5IU0M3wvuqbZo0NLXprJ7+JhvDnTVv9LLdEAiKzdMNWxatzZXJOvCiOKN0+oYktrLVxY0pfPLRz18sirr84N11pTauy+yhe0B4AuNSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726122179; c=relaxed/simple;
	bh=n9cD1ILieQj2CNLAUV2uk+UqtlD/IxQb5XfBEuDh1WU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DWF2pSxRShIcJ9/jWA0Xz7gPukxPjQq50TjqvJiftl51Tbjg9SI2Mb7UsnL7U6tP6qmtDWizZWdQT7nvw1P9V91nDvHEkmL3eAg6nihFsVJRg7r0PXoQa4F8PTc+SJk0OsIUimu5JS8pzggozOwhGrJ01oCvrttQSP/dtSo6B0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VxJ6u466; arc=fail smtp.client-ip=40.107.244.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjScD4PZPIGmvDVuNSAcQ41Tkom/xioIJlGiZmKPgPHdZ2W9d0+6zpEaAM+CWoPdb7lZcl7Pgc25AqBnxivfpXPNDpn+slW9Bvc5NnYzcyRUutSwxaWdtsGA1LslUw29Cqlgdmb0o/Hq1mzXTXfqz/oMNt/Ls9E00mHhFjX1QJEhnFDD5jgehc9CvwPFQ6XTgs+6q6pnBmpBHS1tscbvc1N3PCi0Ela8Tj357wDPoHnoTLZcHliF6vGcpDccrSkm2IIxs2ChA5Zb8y80c9fJZCA3ZlY9Jvfro9lVMyJzdrQSn6PSO1VFqPjMMCtgN5/T468C2Jw2tJifnKP/Dbg+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEob/5MulghhGTTCENlsCuxzksLqpRwsmGVvJtY1pLs=;
 b=gulQUaohCpvfAsRpa8H/cbjYpRBQxwbSGlhzfen3JWE8hpRvEhCW1/pwzZBYqoxXD3QPYch2PS7Lyjq1Z+SXnkp+ZKKxOAKEspQ33GsRNz1TZXVsOMR31FPsf6TKq0G6zg/ILzxOJbkJdCfK85Suv/K+q0PyCWbkWdhsWfFYs7C+27a8qr5s70+g9KGYy1G47I3ZfRkmAFf6s5SqKNos6M0DTnFGNJQFc0JccERKhH/bbNWg5YIZK2Bxs3aZ/Lsubich7f4WSzW0BebXXA38iBGNF+0qyRQKG91VeJRZXcWORFazPIy8V/0XK+osb9wb73O6NW5FnX3GyDPDcC/vrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEob/5MulghhGTTCENlsCuxzksLqpRwsmGVvJtY1pLs=;
 b=VxJ6u466BF7trY98LpL5rNJpJfu1ku1D0aMsPtAHwBWtDtqdx5GGlsiLtRBgCK4Q2i1rrk/zuCHHmrqP37l4XjzyYYNzwY6x+ETeEbMSOJC7576bHC6S0QdHASxaEbCdYIWpIT7LfLScSbX2CorWFmcgrajzxw7H89pG+gLow2M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CY5PR12MB6480.namprd12.prod.outlook.com (2603:10b6:930:33::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Thu, 12 Sep
 2024 06:22:55 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%7]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 06:22:54 +0000
Message-ID: <b77c4100-55a6-472d-9ea8-b9d4ef4c8f01@amd.com>
Date: Thu, 12 Sep 2024 11:52:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] i2c: piix4: Change the signature of
 piix4_transaction function
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
 Sanket.Goswami@amd.com
References: <20240911115407.1090046-1-Shyam-sundar.S-k@amd.com>
 <20240911115407.1090046-2-Shyam-sundar.S-k@amd.com>
 <gjtjzjana2yrgkcoxets4gtgovnldzd5tbytgzba7unqce7tlm@w6zqwkbbndhd>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <gjtjzjana2yrgkcoxets4gtgovnldzd5tbytgzba7unqce7tlm@w6zqwkbbndhd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::7) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CY5PR12MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: 36dd093f-5204-4421-0096-08dcd2f35601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFVGODJiYVV3emRudUJVUEg5dHBmNHhlbnh0cUJtK05OTTVrWVlaVjRvWks2?=
 =?utf-8?B?YkxTY1ZRMElKUHc0Ly93WktSY2RDZHZON0tiSkJjMVE3NjJpaHVjUzRXVVli?=
 =?utf-8?B?aElDZVNYY3FWdWpCRjByc0sxeEZPWk5LVE1Ld09JSU11am9nQTBXajJnVHlq?=
 =?utf-8?B?RGM5RVowYVVJTXNvamQwSG5IT01oRVVXb2RoYmE1RnhuOU9wcWgvUEdEck96?=
 =?utf-8?B?a1dnRk9CZnd0RitVR3k0NlJIRDh3cE9IQXliOTlWMlErb0ZXUUFKZDFrVVpR?=
 =?utf-8?B?Q25NODhKZkZDQlhXNmdlcTBhV1p0S1I1VmQwZkFTY1M5aW43YklPKzFsOEdH?=
 =?utf-8?B?NGo2bjJFZGc3R0FyOVR0c3R4QzVMZThMNlBBQ3hEejl5M2t0b0dMWTVQcmc5?=
 =?utf-8?B?azIwY1M5RnV3aXBlS3Y1aUhwamRRYnVLdXFnQVcxVThJTkNJME4zbURldk1S?=
 =?utf-8?B?TnprUEJsaTFENGFqUVliNkF5RWlTamF5cERETWhKUGo5ME8wRkZIOFFnUFNh?=
 =?utf-8?B?cTVVeFhlbCtkMDM1RHlpVlZoWnNXcDI0QjI3RnJPZTFkQjlCL1ZWYi96ZTNt?=
 =?utf-8?B?QjF0Uk8xdjdmU1Q2Tnh0aE1ETzYwbEFRWnpldjFsb1dLSktZb2h3Zko0VWxW?=
 =?utf-8?B?U0dVVkcyeUp3THAvQWZwZTVsYmN1VEZCNmg5ZW13SENraFhGNFZFYXNzMmZH?=
 =?utf-8?B?VzdRbHppbE1Sd2ZjNjhNVGROSmV2Y0EvYVltWUR4V0dnbmU1U25qQlJKS2gr?=
 =?utf-8?B?QjEwa2g5ZkJzN3lGVjF3c3Q2QVZxVmp2cElhZXNwYm1IbG5ONGVGMDVmd2R6?=
 =?utf-8?B?STZQaXd3Vzg4aVZXNjZBalBIbDQ0S2ZZcm5jQ2ZsRUFJNEJRc1BRSGxDbFF6?=
 =?utf-8?B?eUp6Qk9BcDBEbGNMd0RXRXNxbTI4R084MW8wSStHN1YwaTVDeFlWVFBCcDR1?=
 =?utf-8?B?RWxSZlhxaEpkeEdPcDdpc0pmUk5tTmFDeC9teE5oSVg4RnhhYXZOaVRJbzZB?=
 =?utf-8?B?SGhIOE9hcWw2STBBWk0zNm9XM0duSDdxNHk3eEpUK0dqdVF4MS9PMnFUOEFh?=
 =?utf-8?B?Y2pENGMrcVpQek03T2twOW5IMFB0UDlla2lIczM1VXJCd0RTN0wxZllyWGFH?=
 =?utf-8?B?UWF6Z290Q1dwT1VINkFSSzh5Qk5hR2poakQ4VlFieElpYmRvbXB0b1JqY0FU?=
 =?utf-8?B?YS9RNlVNbjBRZ2JNVjI2Nm9tOE5pWEFtVXhmNE52ekxweitlQ2hSWFZaQXVj?=
 =?utf-8?B?MUphQWpYL1hvWXE0L200RjQzaFB1YlQwRU83dTllcmNucHhKV0pqbTNHaVZJ?=
 =?utf-8?B?cko5UyswU2tLNG5wVm5TSzZhMUZGMUhSb3Yyck53NkxScTB6OWRKQ0VMOHhv?=
 =?utf-8?B?N0ZUYmNLVGozLzlLdG80SWpETVU1MzZZVmRyWDZpVTAwem5BTmFYMGY3dTQv?=
 =?utf-8?B?dHRZaGhWS0p0QXJQMFlDR0JUMjE4TkpLRy85dnlWRERYL25PZTZuUTlWYjl2?=
 =?utf-8?B?NTNKbEdUQ01xOU8zSmVjNWN2Y0M0WWZFaGt4K1BWekwwQVBsOVNObkgzc0x3?=
 =?utf-8?B?R3kralZQWDNndU1MU3pheUZ3WGdiNmk5UUtrdHhyOHNOekM4TU05YVgwbVJw?=
 =?utf-8?B?VmJyRTF3aXVaQWJSQWpxWVFNejJuM2VlRzZtd2Zxa0p0YUtPL3Q2bis0ekpE?=
 =?utf-8?B?N1lVN056bFJoVHdUUi80YjliWHU5ZFBKSWFOVkVtbDllM2tDUnUzZHgvbDhM?=
 =?utf-8?B?c09CVXZ4WTNHd3NrK0xaTUM2WTJKTHRjTXhEOGpTK0xRK0RYV1RxSTlJU2VG?=
 =?utf-8?B?RFc3T2MyM05mMVErYzJaQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qmo0TzEyK1Q2M2V3UlEycFVxWnBWSFhZTS9BVUVrSlVOZkM0N1FuV0hVa2V6?=
 =?utf-8?B?Q0o5Q1lROUNwMFp3WkxDeVdSa0wxZDdJbjhrUlhtOU0vRFJpSTJiT2phR1Fv?=
 =?utf-8?B?S0pINVZtTlU3aktlYTR6eWZLdlN5ZTZhQnpDZ1NxTDFpZlpQUWR5UEtCRHh2?=
 =?utf-8?B?eFp2OVVScUY5TkZVRmVuYzJoUDBUZi9EUEF0cFlOYjRUSGFWWUJMdk01MnIr?=
 =?utf-8?B?djlycmcvc2I3VHpkL25EUEdtTXBpYUNtU01nbUFhemdWOVdzcC9NemVCK2Ft?=
 =?utf-8?B?eURidFVJUWZueU9JcXdTYWFsUWZ6U0F5S1EyWkNSYmRFSjNXY1J5Ni9uczE4?=
 =?utf-8?B?QkpjZ0lwVURGVDNXMXNsOU1vZkljeUNZcFB2QTZmZWNRQTE0M1hsZ0V6L2pq?=
 =?utf-8?B?WWZwc3ZFS0wwUCt2NnRrRTFKajNDQlJXV1BzczErYk5LOEwzSmFLczNNallQ?=
 =?utf-8?B?TGZJaVcwQW1oa1JOcXpZcFhjMEwrVVFLYVNWY3JBQWZybFVOVWhZQkxkbVE3?=
 =?utf-8?B?T0NHMTh3NFdUWGJPd0FpaWhlVjFyRnBWSEx6ZExXNDlYN2Y0WTNXYXZnNXhO?=
 =?utf-8?B?RjQvNUpyOWhlRHhqNi90dm9tRVhYMjVNZzFUSy9tT2RiU3RqMFlDTFNwcmpz?=
 =?utf-8?B?TnFRQXA5amV3djNRR2hJQTZWWkQ0L3hEU0VycVRncFZZQ2RyTFRYUUpKWGZE?=
 =?utf-8?B?dDQ5V01WK1ZPU3JFY0JzUUYyVGtNWHVhOSthSUhoVXFVcTZZOSt1ZlBUUjJ3?=
 =?utf-8?B?bEpNWUdiSEFJMGp2K0lZWTFRdS9ZWUtyMnFsUytYZjhXUFpGMHJuNWg4NFZ1?=
 =?utf-8?B?Y2VXa3lEWjNYN3h2WFRuZUNCMXhxY1RzYlZQSHNJUjZYdkxjRjRlYXQ4TEFm?=
 =?utf-8?B?eUN5dTRDR1VEZ2p3V1luWU1DSUUzQmRUbmNCWWppdWF4QzBnTjJ1V0pkSXdt?=
 =?utf-8?B?VGFOWm1BeUJld0l6cTBha3A5VEk1U1RPTk1oUlhnRVFON3BJNENENFpUMWJ3?=
 =?utf-8?B?dmhrTW9VUEFrQlpmSHhYU2VqQkJMTkN6amQxZ2FNRkFES0ZaUjhtN291bldu?=
 =?utf-8?B?TXF0b05BSXdpQ012YXdicEswWlBsTjQvc0NUUzFkUnF0MHdmbktIQXBYMVdk?=
 =?utf-8?B?NEwxM1RXeHBJV0kycm9FUVB4THBMUTJDdVd1c0c0KzA1OVR5YVQrblJDWVk4?=
 =?utf-8?B?UE5nc3dsemdrN3RlRzN0WE43OFpvWmJkZTFIYkZYK2NBc01WNGtZMDVldThB?=
 =?utf-8?B?M25WTnBOUnVEVzBrNmRUdWlpUUR2UFlQek1LZHJYZ3YwVjFXQnpwZ3EvQjJD?=
 =?utf-8?B?N0hCRFBwcmVjVzMwSklEcWliWDdnSEhsd0E2UFF0ejlnYmg2TVh2VEJ0TlpW?=
 =?utf-8?B?K245UTJMQVl0Z1F0bml3SG9QcEhmeDZVdkJocE91cU9rVFEvRnV5d1I0cGNx?=
 =?utf-8?B?c293MTluLzlVTjFnT0NtTFAxb2RtSVVDUVhsQlJsZHRpRTNGUVdTOEtOejlR?=
 =?utf-8?B?UGk0cmthM29VRkxieXVHZjdZSmFjOXFpTmUrSXA1LzFDRjI1K3IrMnZkSmZY?=
 =?utf-8?B?UUE5OHkwMENJU0hzbi9SKzlIaFRoelBJZDR6OTFESk9md1I3NUFaeXY0SVhD?=
 =?utf-8?B?N1l5dUhyTG40L0lBZSs0b05hWU5OWkg1SFB5YVEzai9kTFA0NTRWYTNodVZ4?=
 =?utf-8?B?WFN5dkxHb2dvZlFXZjYramZUSXdTdmlZM1lhS1NONDJVRWhCd2RTei9RL1p5?=
 =?utf-8?B?MFpyMzRNOVdhNXZVbDhXUUVjalJ1cmFDZUFwZkg1YkRBY1JQSTNJeWxqaUMw?=
 =?utf-8?B?SzhnaHFjRk5oTmhZdDdndWdrcHpJWkZRTWFSa3k4UkY5TTRYZHlDU2srL1Fm?=
 =?utf-8?B?Z0taSVZpTHh6Q283WVdDMnFOVFhoVzlHeXlQYXo2QVRpcUkvTnBXbnU3cnVo?=
 =?utf-8?B?YW1rZWNFMENVRUpPZUZQSnc4WTJubmFLRG53aVVYeGRnU2x0UDFKb3p3OXp6?=
 =?utf-8?B?ZlhMMXgyd3NjWTZuc3BRdjlIVmd5cmVoYUpUc0hyOUEybFhMak1ZckVHd2do?=
 =?utf-8?B?NTBtQXg1RUV2RmZFSU5ic0xqYVR2dStUNW9wTDZla3lucklTUklJY2U5VkRy?=
 =?utf-8?Q?Mc1fNOt+hTnwvHeMNu2qbrQNH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36dd093f-5204-4421-0096-08dcd2f35601
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 06:22:54.4384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0FLymfPey0PcDs9dxGJFVU1hI/4GDf37onwtOHTRTPEzHQJqgyktv6w9TvUBge+gVmJpsB5FUbFuS9aKCpTo+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6480

Hi Andi

On 9/12/2024 11:45, Andi Shyti wrote:
> Hi Shyam,
> 
> what does it mean signature? Do you mean "parameter list"?

Yes. I mean "parameter list". I can amend it in the next version.

Thanks,
Shyam

> 
> Andi
> 
> On Wed, Sep 11, 2024 at 05:24:00PM GMT, Shyam Sundar S K wrote:
>> Currently, `piix4_transaction()` accepts only one parameter, which is the
>> `i2c_adapter` information. This approach works well as long as SB800 SMBus
>> port accesses are confined to the piix4 driver. However, with the
>> implementation of a separate ASF driver and the varying address spaces
>> across drivers, it is necessary to change the function signature of
>> `piix4_transaction()` to include the port address. This modification
>> allows other drivers that use piix4 to pass the specific port details they
>> need to operate on.
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/i2c/busses/i2c-piix4.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
>> index 4e32d57ae0bf..69b362db6d0c 100644
>> --- a/drivers/i2c/busses/i2c-piix4.c
>> +++ b/drivers/i2c/busses/i2c-piix4.c
>> @@ -536,10 +536,8 @@ static int piix4_setup_aux(struct pci_dev *PIIX4_dev,
>>  	return piix4_smba;
>>  }
>>  
>> -static int piix4_transaction(struct i2c_adapter *piix4_adapter)
>> +static int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short piix4_smba)
>>  {
>> -	struct i2c_piix4_adapdata *adapdata = i2c_get_adapdata(piix4_adapter);
>> -	unsigned short piix4_smba = adapdata->smba;
>>  	int temp;
>>  	int result = 0;
>>  	int timeout = 0;
>> @@ -675,7 +673,7 @@ static s32 piix4_access(struct i2c_adapter * adap, u16 addr,
>>  
>>  	outb_p((size & 0x1C) + (ENABLE_INT9 & 1), SMBHSTCNT);
>>  
>> -	status = piix4_transaction(adap);
>> +	status = piix4_transaction(adap, piix4_smba);
>>  	if (status)
>>  		return status;
>>  
>> -- 
>> 2.25.1
>>

