Return-Path: <linux-i2c+bounces-10879-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC42AAED24
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 22:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 663243B8BC8
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 20:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC1228F94A;
	Wed,  7 May 2025 20:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="f1QW0EPj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9397228F943;
	Wed,  7 May 2025 20:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746650285; cv=fail; b=oR8uQKQXfsdTPipQiTq+nkzugOJl6/VkRFt4a20fTnaVlqKFI0bC0sX8nxq0tL8/g5mH8JBPftcGBHs/XU620t5wSQSKE7L0rptcgCr4Z/BQ43qzcEdHZAIdOAvqzwu5zurrL9E/vQZgCbmnVczZtCpTM8DZ95MMuh3kMOUMyrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746650285; c=relaxed/simple;
	bh=H3AT0eRc8x5fOsQggRHIbhStIcS/+qXWNdgxRdjaews=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bX/hNo/9dWxZ0iVUybf6vAcFL9O2k+u2Zkd+TweaMbj4TwTWs8qJuu75VAxHRwUp/Z0E+lCD6ilmwed9jeV6Qo25SMByDT7e0O3CMNk+RA+P0jaYndeB+xshjPMiwynDuoAhvZDjb20zsmRZXVNb46gNV3ALFDX3XUNk8i8XQ24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=f1QW0EPj; arc=fail smtp.client-ip=40.107.244.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ck3vK23TctVTxc7dzvDD/vvusaIXBZJjCJuOCAwJ8FjifvruiTXIf2Hx+7syYwjig3unb0nboCH8LUtwisrIladTvoO+H/34obeDOEG0x3uOxuIFX2cARShF24N0E0WqcJZNHnTRVVv1TacuZ+jepcGbj8WxpfOdpvozVT8attrLYmyVWvI7iSYR0r7a1kJRasiCH9tRe2XjFnAq+ewTvx3VsmkweJIhzy3socSbrxT+C3ofHQSxhD6q/325dW8p9wY1AWj6yfY6r+Hi5XrijD5kMxag3sPh8dQuM1rTmJDaCd2kdXW2w6PRx6Lr0WjSezLTi/oLxmyd4XqjQ8AlHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhztEmbB/LRMJkGIsmxRHHR1BFcBOow+AD0znQIXEps=;
 b=Wgye+fJOtsOMo6p/pytHwyq9ToAeCF+QNqAfhQxdP1O9MLG2A0sIa2rz6Nsccq218sio2Zj81Hjv4HmqcxeteiUAy74QTyfdqPLteV9+LN6/5t4vJcQKZU+LQ3sBwwV/7VsqMdN8bN91+E9e3vfGWENSmFEp0CirwaBTb0RxN7w3wRI0vKJ98ETxTad3qyyLmNIT1PLUrFgdb9Q0InJTR5k2wv8Pw6x0iG+T6o4oOoKrOQDp6rEhJzeGbyIJQa0CHs2zVy8W9x0+yvgmidvygybVMhWI2/RNav4ixHon9s4MrKaD2BqT0MH/ZsyQeAIiWrpt/oXnWWNMmwhpSBq61g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhztEmbB/LRMJkGIsmxRHHR1BFcBOow+AD0znQIXEps=;
 b=f1QW0EPj8rRokSVjtBEeKglwKo6YP9ciOvRG1y9S6FJ6fubxKv7Ixqs7zZ+04hfuwuZj6fdLBVFeuy8jFX8FTJUeSGoIitTNy8ZGYm7AsaWaZ7xoEMYq+iULDDUCOR8u4EC3ENKlWAwYQqKhVFeMHiYkCNh13ssIkfdYG2QLT/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) by
 SA1PR12MB6726.namprd12.prod.outlook.com (2603:10b6:806:255::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.35; Wed, 7 May
 2025 20:38:01 +0000
Received: from DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620]) by DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620%5]) with mapi id 15.20.8678.028; Wed, 7 May 2025
 20:38:01 +0000
Message-ID: <336cb41c-a33a-4e8c-be4c-b032a4a1e4b7@amd.com>
Date: Wed, 7 May 2025 16:37:59 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: I2C_DESIGNWARE_AMDISP should depend on DRM_AMD_ISP
Content-Language: en-GB
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andi Shyti <andi.shyti@kernel.org>, Pratap Nirujogi
 <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Venkata Narendra Kumar Gutta <vengutta@amd.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <3888f892b8c4d8c8acd17e56581e726ace7f7092.1746536495.git.geert+renesas@glider.be>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <3888f892b8c4d8c8acd17e56581e726ace7f7092.1746536495.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::37) To DS0PR12MB6440.namprd12.prod.outlook.com
 (2603:10b6:8:c8::18)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6440:EE_|SA1PR12MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: f5c30d8b-af31-4658-929e-08dd8da70f0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmIzc1RjbmhidHNtK2tlZkpRVFpaY2FwcXgyTEVqQ2IyVlUxMUtSOFNXc2Ry?=
 =?utf-8?B?ckhyekt3WFovOWJYRzN0b0lhV0oyRlVLU2d1ck5laVFPdmdQS1p0a1ZRdjNP?=
 =?utf-8?B?RkZWUXN3cFJDV1kwblZvYnZ6ZDIwbGhhNWtjamhNTUwxN0VNYjNFVEdkZVpq?=
 =?utf-8?B?Zm5JUHZ3czNHM3BtMTE2cTRuNnJXN3ptNE1MN2RDd3ZGTEcrQmMzcUVyQ0pB?=
 =?utf-8?B?VmlwQzdFUWUwSU1kQUdaNHVZUnZEbHVPOFROL0tETXhDTGZveHhLVzZtVyt2?=
 =?utf-8?B?ZStWbkRDYjFnKzlQY0xZRTE1dDVSWGsyNVRzdlhZSGEzSjBvVk1EY0ZNckhG?=
 =?utf-8?B?dUJBVUZ2TDBlbm0yV3FIdDBJNGloSnZ3alVjdDgzcmRPV3ZOdWRyQ0RYREkv?=
 =?utf-8?B?M1JLanZ5UXVRbkR4cFBpcTR4TDd0eTdhTEVhdWtDb0JnOVVXeHdXZDlhMnFu?=
 =?utf-8?B?MFZzQkYwaTJtYy9mcjQxQW80dHZRU2ZXN3ZMUmlwYkJqbkRZMWM1bm1hK0Zm?=
 =?utf-8?B?ZmVCZGVxRlRXV3NyUWtTQ0FtRTJtcXpPcExDNTFWM3o5WDBGWUhadTU4MEZp?=
 =?utf-8?B?cUtlRzJQMzNFTmRISmk0MU5WWnR6SXhHWDBWRENjZnN0VjFyTDRBRnlkT3JU?=
 =?utf-8?B?ejBMTmpHWEVDU3VoY1d4UEt5dEhXTVp0b2tWYitxT0RUdTJlNkMvWjNINTVR?=
 =?utf-8?B?UmdBeDZoekpicnNLZVdKeUpoL3gzOHE2Y2ROVVQ2TnRlUEhkalF2a3VSSlMz?=
 =?utf-8?B?WlBhZ2RHODcvR1RLbmhKRVFSQ2ZVTFJHTmhRc2RPRDFGQUxTbFRvdlROcXBv?=
 =?utf-8?B?YnpxM2ppZHM4bFVka0M5N3JRV0VtQzVaV2lvSkQ3TCtzbythODR0b1NpTWND?=
 =?utf-8?B?aEUvWUZrck8zYnFrVFlialV3bnB4em5CWFZRb05RL0w3UzJNYnJlUnFNaGRh?=
 =?utf-8?B?cXFkZnhabU1YL2xLMURnZDdVUE1PL1ZtQ2R6OUEvQWhnRnBVejVDL2x0Qkcy?=
 =?utf-8?B?K2JLazdHclVEc1huemorQ1l0MHdIamxFamlLQU5scjdUeEdpa2lxWFNBL083?=
 =?utf-8?B?cEtaS3hkdE9SS1BJeFdVWk1FK1BPcy9LMEhHM21PQmpsamg4UDZyQTN6UUpS?=
 =?utf-8?B?SFB2Rkc4WDdYMzk3bk9GTW5rRERBRGo3dWZ5M2hDU2tpQ0FXZnhEN2ZuVnI4?=
 =?utf-8?B?M3MzMWRibmtXWkt6ZWcrKzZZWTNOaWYzQ0duUW1SNFB3V3cyV25jVGdaN3Q2?=
 =?utf-8?B?SWo0Mm5OeTBVd2dIaWNRSVUzYzVUZUl0NjJvU083OTJ6WHFHSXNEYVBlZHQ2?=
 =?utf-8?B?S285RjExYldCSUpPUWIrb1dDaFZCQ3hzY1ZnM0k2bnVLdjNkNTEzQlFLRHVm?=
 =?utf-8?B?SkhBQXU4Y0VGeXBGRUJhblhTTkE2dmJiRGtzVW56R1ZRZE1nbVNEa3ZVNUFV?=
 =?utf-8?B?MXYrM1B2NXRSK2krMG8xN2ZBYVRXdGpHTkp3SjZoenpJN1pzb0hGTHkvbEYx?=
 =?utf-8?B?bWIvbzFINHRDc1dhUmZxenphV1drTUIyYXBrZVJzbkF1T05TLzhaaVB4N2Rs?=
 =?utf-8?B?U1JvVS9NeEpLUVE1MXY0Z01KVHlwN2ZRKzdoWkVkNkVJNkhYMHBGU0xlUHY1?=
 =?utf-8?B?SXBwc2crMTdJeThpUHJyVjR5NzNEN21OaHlsemhzTk4yM1NTNEVVQVVBMDdR?=
 =?utf-8?B?anNhcmYrVmQ1cTdua3R0MHpMdEM4eE9NZ1NnbnNkZk4zSDdBZHBFNTd3STZF?=
 =?utf-8?B?U01vRzFyQ1dxVW5Sc0g5RVJSem5vVHQybTNrQktreXdCTnREOGdsMUJVb3Qv?=
 =?utf-8?B?cVBwYUYxcUNtWE5jK01VOWUvc1hha1RTSHljeFhodEJnZkJ1OTNQbytrWnli?=
 =?utf-8?B?YzJQVHFQczFJRTAyUy9nVFBFdHhPWmJMUWl6ZWJydXU1a0JXZkN4QkU4eE8r?=
 =?utf-8?Q?sLQN2XBdyBY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6440.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDNzeTFPcGVPOFpqRlZMeUp0dFE2MGh2STVTSFQxMHBiOE1Kekd1R3dOS1dS?=
 =?utf-8?B?c1plb1h5UXAvYXliaVNnQTRmamdVM1hvbElPc2RnUVN2eFh3b2ZxZXM5a2Jl?=
 =?utf-8?B?dlppYmlJZDF6dnJYWE8wa0ZmTDhxOXZiUGp5KzBZandsUkM1dVM1NnZveFl4?=
 =?utf-8?B?aGs4K3doK3RSWHRSNVNWSWNXQjdIcS9PSDZaeUlycHpnVHZuRG12ampyczl2?=
 =?utf-8?B?NXJHNUVEVkU4OUY0MHEzSS90aGtNWnk5OS9DTFdrS3hJUzd4WXkwK080SjZX?=
 =?utf-8?B?NWJ4ak9rSElZRDlxU2hrZHZ4RldKZ0dzS084TUl1Ujh3SjFQMW40d2NEL0N5?=
 =?utf-8?B?VjJ2c3NtTlNhR05ibHRub0NjYWFyMVhzVDVlNWFJUnQ5VVJrWERUU01UUTVH?=
 =?utf-8?B?OUJTenEwQWJUQkxZdUNwazNPbUJTVTlEcktYQWtQQXBVLzlVdkF0M3pTZWho?=
 =?utf-8?B?aCtpaDJaSEFsc1N6Sk1WRjNYOThYTHBSdDl5bDZyVUt4V0VtYk5jSElhN0FH?=
 =?utf-8?B?dExQWHR0Y2d1OHU4RXBPa0JMR2xrejFkTWFSVnoreHRLc0NTYmZQbW9BR0lG?=
 =?utf-8?B?Q1Jvb2JwRmJUUDlVbWRiVE5UY1pwYkJEb1cxcWUvVS8vZlpqR0xER08xNHA0?=
 =?utf-8?B?QXM0d1FGOTRyWEJ0d2JpM0xTWWZHMEJocUFPNHJkNWdFbTQ0MGJDdzlxZW90?=
 =?utf-8?B?Tjlib1plaGUwU3UzaXZVQ1p4VGRwcnZwanVSSDhrdGhnTTZkTzJhcFFHT2Nh?=
 =?utf-8?B?bVFUZnBNWElIZ1F1WE9kNDFqSzhTUjk1Q1EzQnlpVm1RaW9yVnYwWkkxTHpH?=
 =?utf-8?B?RTE2bmltdHZtZW9mbW0xclBVeE93ajJXaWhsTWVGb3hBeHgvRkxyclJYaXR6?=
 =?utf-8?B?eWNwTDhaOUhBZU90R0I4YmJWNG9nN0owQmJjZXFJenhWcHZxZXhidTR6T1ZV?=
 =?utf-8?B?SVhNY1IrNW1TTEtjeDRUclA2UkFZS3hUWHF3VkQ1WUJFbnp3YnFyVndWVFYy?=
 =?utf-8?B?SldCRHl4RzNDaTlCd3JlL0hBRTJ0L0FXZ1g2OXJxenA3anZ5SUYwZ0xKQjQv?=
 =?utf-8?B?cTZJTDlFeklIV1I3UytLaDlrY0hmdjdPRzQrK1ZWaHZDQ1k0Ly85STdlN3gv?=
 =?utf-8?B?ODE2QVVZaGZDeXBURisvZWhFRW11TFgwZHkyN2Rtb0Y3bE9nRUhjdm5zdUFR?=
 =?utf-8?B?dWoxSDVkbGx0aUNFU2NxSndtaVpoNS9OMkxQb2x3RlJTVDNpSjAzS2ZnZXpw?=
 =?utf-8?B?aUY5RUxGbU5jRm9RcHlLWmluQU92R0dHU08zRjVzODVRWkNMckdkdUh6OVBW?=
 =?utf-8?B?Y0FkZmhjck84ZGc2dW03eDlKd2EwT3F1U09xOHVtRU1taFUzZmNuenBaUjhJ?=
 =?utf-8?B?MHBiWWZjZ3RsK25OSDg5MC9Cc1ZSVHY3ekhZbndiUER0Nzh3blRHYXlVNndG?=
 =?utf-8?B?N1hZekFJMWZCUXE1Um53WXg5NlY3aDZ3K2ltbDRGckd3Ni9TeVhjU0EwV2Z5?=
 =?utf-8?B?UGU0bG5nd1dSd3ZCWmI5NzZMY3VYVHNhQVRubk92TmxWWDNVRnpSOWY0dS9h?=
 =?utf-8?B?c3NJVXdXREJFcUcyUHFFK1E0bTU1dVVVRlZQeHRhNDVYTlBFRDZTeVhuclFy?=
 =?utf-8?B?Y1pnK1c0Z2NSSFhLaStBL2xYMHRwd2N1Nll3RlB5bXgvb0NMaG56eGF5UzZN?=
 =?utf-8?B?S3JIbWhCSkJNQjF0UzZoYzN2Y3lUNkZuQ3I2R2M0VE9ITmM5VUFxbWMvVnBm?=
 =?utf-8?B?SllLTCtCeW84Zmg5SU1wN1QzcmFDNkV5R1JWME5Mdnp0RS9MNlh1TWNxVWI0?=
 =?utf-8?B?dkpNWmxaMzNyeEp3VTBjQXJPRWhiLzA2ZTV1VzBkVnJCVzdTWkFEUUZZM2dv?=
 =?utf-8?B?clVCU3NiY01ERHc5MzB3enpmQ2J6akZYbjZzck10b3FjVkdKYVJXeTZxTldV?=
 =?utf-8?B?dFk5MDVCc2NiOWNTdWx2eGlSOHdCdTkrdWdMeXp5VmhQTjIyeTkxTmFaMlhk?=
 =?utf-8?B?SUtJaE9QeUt6OUFOeDVVbWlZZTJ0WnEvbkNhN2V3aTd4RUFmU2hOZnA2ZjRI?=
 =?utf-8?B?MEp5MUtRU3JmRFJ3RjhxYnIzU29keTF3ZXkyQkdNU2FqNmRCUzJ4U1pkV2dT?=
 =?utf-8?Q?oCSM3Os1jYRCw0cInvjQ9ZgAm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c30d8b-af31-4658-929e-08dd8da70f0a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6440.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 20:38:00.9686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FT/Hf2OUrmMKxgeMMmBiUTLpykgEtFKpZ5GuYE/CQd2PrEghkAvHdNcUFdMHfJk1prIGvxhFhmNaKbB+zdGeIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6726

Hi Geert,

Thanks for your patch.

On 5/6/2025 9:02 AM, Geert Uytterhoeven wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> The AMD Image Signal Processor I2C functionality is only present on AMD
> platforms with ISP support, and its platform device is instantiated by
> the AMD ISP driver.  Hence add a dependency on DRM_AMD_ISP, to prevent
> asking the user about this driver when configuring a kernel that does
> not support the AMD ISP.
> 
> Fixes: 63f0545cb1bf0840 ("i2c: amd-isp: Add ISP i2c-designware driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/i2c/busses/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 865b760866ef42ba..7c348491e1bbac7c 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -594,6 +594,7 @@ config I2C_DESIGNWARE_PLATFORM
> 
>   config I2C_DESIGNWARE_AMDISP
>          tristate "Synopsys DesignWare Platform for AMDISP"
> +       depends on DRM_AMD_ISP || COMPILE_TEST
>          depends on I2C_DESIGNWARE_CORE
>          help
>            If you say yes to this option, support will be included for the
> --
> 2.43.0
> 
LGTM.

Reviewed-by: Pratap Nirujogi <pratap.nirujogi@amd.com>

Thanks,
Pratap




