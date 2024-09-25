Return-Path: <linux-i2c+bounces-6972-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAE7985506
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 10:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CD591F2128B
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 08:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F4315B149;
	Wed, 25 Sep 2024 08:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="jA0LTNTD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2138.outbound.protection.outlook.com [40.107.236.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D251591FC;
	Wed, 25 Sep 2024 08:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727251492; cv=fail; b=GqQyTVSEHHx1p4birmYnSfBrcCCLqkLehbDe00N106TFvEvicTY5sTbOiEZy5lmDn72QmfdkEOnHPiwtiXle/32AQU9N5euNoW0qYys7qqTYndrP/JRdqslYEaDYuHVSjAYvx70MECyJHfJ7/mhJeNdXmKLmXWmhn4xdOvbVrnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727251492; c=relaxed/simple;
	bh=zW3gtNjDIcCy+Tf4YFtK9ecb3yvkYQBe/SaXhUFwtu0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KvOL8K5L3Y365uxm9SJ51JNhHXAX+OQGpDuILcEq+B4jcdhhJVaWk47OQ+k3lD/7Lkq49qXkf4wdq5bwAc7Qmx7kKt8qoqDZyhJ1L67+yVvJmB2rDYlSXsLZTwBTu22Sc0yGufRLvXmrfxvMh6FsGON0nnsy/D0AZRq+/xiJx7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=jA0LTNTD; arc=fail smtp.client-ip=40.107.236.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CdQK09dkQg9xDg3QulKQi2U0WDy+ilVVR43fnAuodLnit7dSU5FafKSVIBb4KRVAtGpt3Tyi4HbuATX2+xKWYWHFjCKKBVYrdmO0gfysFrmXn9r4YH1sUzAL9YXVR1eCFHHvu+ez6PlW7i7v594yuONaYC4efr6jL4VD0SySCvl7vsKzTxZCs/hEz5Gj01Ts0WLHV/dXW9GuMbVQg8Z5NXPIfjTa+cfvQnoon7Kv5B8QHHTIL70BdmdarpZKGcdiMgxNwIMvYoMsg5PwYI7Ht4DQIDU8htPx0daqCzqDdP9qC/LdHwL+9VruHf/aKdK8oxWFZSBgZ04yqpKRR7Gvew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZQ6WefrxFy6WppcKc3G0k9DCHenAWzt8s4c1yrCE+8=;
 b=qsjY/vh+P7sy0YogjTmtSAvnQsM1CVW9g/uIMksQylIyndmYJMi6i8DKmUeq+F+2g4GGagpc5HhifOKevDXnzjCHsxW+A5spfZ0qAUrjyMBOERIzgMsyU2ftqzcuOid9H6ME+QQ/NZQienCUXJcwmQ8Oc02VI4WE0bIPTXSmCYepGE2PzNGnonW2Jp+Sm2tFiwfYN+7MU6I0hE+4gzIvqR1uZHkN7zbUrVJ4mPKEg+7EVaEITLZeVIv5PQ1dS0wchhF3sJGogCxWdG7G6PDzl24R9tMbOOlmXjKtuGkFK/wCAt9+Kp5RTrT251kjHVwzU24qpK1e8UGTeuyloohrZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZQ6WefrxFy6WppcKc3G0k9DCHenAWzt8s4c1yrCE+8=;
 b=jA0LTNTDei3/OXLYMRw5jqKH8r+jdAhrwDWO3j2RVWPYUXKtcL5LPKb8pifzGTljAQmcoHfg2D5slJ1E5prafQtY7MPPba+Z7yA87brI9UpLrP9vcctzTjNvG/7fIgj41ya2YZU6Q4HEnq49Np7dIFRyVdTHG8gT2oHZLOD00Lo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
Received: from IA1PR14MB6224.namprd14.prod.outlook.com (2603:10b6:208:42b::6)
 by PH8PR14MB7109.namprd14.prod.outlook.com (2603:10b6:510:254::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Wed, 25 Sep
 2024 08:04:48 +0000
Received: from IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94]) by IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94%3]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 08:04:48 +0000
From: Michael Wu <michael.wu@kneron.us>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Morgan Chang <morgan.chang@kneron.us>,
	linux-kernel@vger.kernel.org,
	Michael Wu <michael.wu@kneron.us>
Subject: [PATCH 0/2] Compute HS HCNT and LCNT based on HW parameters
Date: Wed, 25 Sep 2024 16:04:29 +0800
Message-ID: <20240925080432.186408-1-michael.wu@kneron.us>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0161.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::6) To IA1PR14MB6224.namprd14.prod.outlook.com
 (2603:10b6:208:42b::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR14MB6224:EE_|PH8PR14MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b4d290-947c-46c9-25e6-08dcdd38b99e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|80162021|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TlE1aFN2b2J2ZXBlTE14UE4vUlJsZ1Z1VkU4MHVoR2VqdVd2K3daR01oR0VM?=
 =?utf-8?B?TVNwalpCV2xWOENGM0hueXRDbWpSNUFnakgyZCsvYWRQNlpBS1Fhc25qV2ZX?=
 =?utf-8?B?YXUwa0ExdU5weVpsQTdST3dHdVpyMExxeEZVdWVHQjZCdGV6RmNFZHBLU0lB?=
 =?utf-8?B?REhGYjdEV1FyR0FjVDBEZzdXbHE3WldIck1JcEpJazhoTWlrWHNtWVBJTkEr?=
 =?utf-8?B?d0hKelM1LzNWclN4aUxXUlBlNnc2SjhML2l1U2pmbDdtclVqdVVkd0RQci9u?=
 =?utf-8?B?TmZPbG5WdVkyMUlqY1d2ZHpLTkZZTlMyRmpMTzkySUdwaXhJc1dGWVorVG9K?=
 =?utf-8?B?ODE3S21LdFlZb3Y2WDVZMFZjZDAzcWVFdWt5ZUVLejVFelJWWVVJVmtnYjlJ?=
 =?utf-8?B?MlFwZ1NNV2x5dHlRb2s5c2ZZZWJlRjJRUUFsNExlS0RFTlNHQWJmUnU1WUh6?=
 =?utf-8?B?Y3dSKzA2NHgvZzlEcFNsc01Vd2FOUUtteGU5WTFRY2xIQnRPU2NYN2pKL1hi?=
 =?utf-8?B?NUdSdld4bnNhSVY4bTJ6ZWdEbC9qQWZKcFZxLzYrNnBycmNBeDg4RG0va25O?=
 =?utf-8?B?L0tsTVc0a25BaGt3MURrN0lZVDJoUFNBUjlrR2xXRllLNGRhUTBJNDZvcGRJ?=
 =?utf-8?B?SlNiNW5kK3JYL3VCZkxUVERiWEZla0tRV0xRU0VQeTFFUU9EU0k0UTFxT1Bw?=
 =?utf-8?B?eW9DQjZrU3lmbXpHNTJiYUQvSGNqdnVBYjR2RU8rZWJMNEluR3ZWd2c4SnRK?=
 =?utf-8?B?T05ramhRM1RqbXFsS29vcHR6cGNWT29HQjUvcEsrcEhuSHlXT2NSQS9WdG44?=
 =?utf-8?B?ZGVuNHg2VTEvWmoxNnQ1bEkrbFdpeS9zRUdhUWFvL1Rjc0dZejdLK1hITE9l?=
 =?utf-8?B?U3kyd2E1WktBTHJiRjQ1TEVGSUZhRnZHK0F5U0dXWmFBbk9DRTJlWU5GVTF4?=
 =?utf-8?B?aS9LM1N4VDJpcnZ5ZnVQZS93dU5OOFd4MGhBVWdLRXMxZmlIQmNsNG1CaXYr?=
 =?utf-8?B?cjIvUmE2THRjdUJNcXRzNG1WL216Tm9EK0RFbXFFTTJjR05EZkllU1krRE1a?=
 =?utf-8?B?UXNpYjFXc1pZNXpsSCs0NjhyN29MTmJCL3NIWjJZVFFRV1h2UFc5OHFRTWNK?=
 =?utf-8?B?cTE3eFNJVFRJOVkrWDFwbmtnUFQ3QXJxYkhqaFBoYllvdk0veUlwK2UrWlo4?=
 =?utf-8?B?MXp2N29OYWlCc050TVZCTTJsZjQ5akZyK3RJTDlTY1Z5dmo1b09MdjZkQmRW?=
 =?utf-8?B?TlBGandjNmV4aWdPMjgrMjAydXBqNGtmanFFZDFYTmd3Q1RjMlJxck1RZmI0?=
 =?utf-8?B?cTV0Z2JYaldQbFJtVUkrbGlLWHpJT3d6b3JJT1BFUUJXYU9IOG43Nm83RndL?=
 =?utf-8?B?ak5EbHRNWFdwRjUycXRockg2eW9mY2s5OXhleGdZa21ZYTBxWWoxbHFjY0hy?=
 =?utf-8?B?aUhLcERYOHpjS3VPWEQ5RlROSXNjMkowWXQzbjlud3lLODlEdzBhTTBjcG44?=
 =?utf-8?B?Qm40TStBd0lObkgvbWppcFBjdjlsUFFjUHVHOU5EbjNoa1NySGFveGd2T1RC?=
 =?utf-8?B?M0IvbTRRaWxFL3pnQ0VXb2RuclVLdWd2NVRZUThSdUF1MGdoNVhLVG93QWcy?=
 =?utf-8?B?dzNUdk96QUJJREx4QlFxQjNGTDdDbzlZR01rYUdXY3JVRFZDN3F6S01RN0Fa?=
 =?utf-8?B?NzY5c2JZL0NON2tBa25qM3BheWZXMU1OTnVxdjFjdk43L3dIZVI2OXRJay8w?=
 =?utf-8?B?RHEvcEZINnhEK2tueEdjYUZySGRYcDhuVVdrUWhIeVpKMHUxdWhYUFNUY3Q2?=
 =?utf-8?B?N0dZc0krM1ZYRDM1V3F6NFlRbmx0UnBLYzVKTjF3QVBnSXhDL29ZT2tiMUt6?=
 =?utf-8?B?bGdvei9iWWJLUXFSN0RrOHBENFk0dEdlV1NsRHp2NXFWOHFreWN3QXpBdnVI?=
 =?utf-8?Q?ub2osmHz7D4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR14MB6224.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(80162021)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFJVMjJpTDVaSkFLS25HblE0eDV2UzEybllGMXVRdTVXT2lSbi8vZ3RqME1o?=
 =?utf-8?B?WFFSQ3RQYlpVdXY3QXFobVpGQ3IybHlyM09OYWhtejVnVFlzajF2MTRaSWJj?=
 =?utf-8?B?QUJwbXFYaXRoYTR6UERRWVNwTC9NNTRCVVVVK2N6R2x2K0R1NHpHdGx5aVp6?=
 =?utf-8?B?VXBQa1lPT0xnQVRGSFJyRm05TWlLQzRGeFBWYkJocXZuSmRmOVdJRkJ6QVBo?=
 =?utf-8?B?dGNMWCtpdE92RHVYbnJOWFhwc3pHSEV4aFpKUkFJcGp5UUFCbndwRmwvYWdT?=
 =?utf-8?B?NXp3eGE1SDZsaTJZdnIxaXQ5cFlrYWhDd2VXRzlYME04N0FLR3QvZmZSUy84?=
 =?utf-8?B?U1pzU2VTQ0lSNEp4Y3Q4WFBiY2p5RngxT2l2Y252TVp4aFBlL0NHK3piQ2o1?=
 =?utf-8?B?RnVmV2pUNEJYbnQvN29LTXFKZVRRbE9JNm5Obit4b2NsY3YyWDh6WmF5U2py?=
 =?utf-8?B?NGJMc095bXpzckdUR2RqKzRJL21LckZTaE1WeGU5bmlqelJab1JEYTBsbjhE?=
 =?utf-8?B?bVM5RVRXMC84aEVmS0pHZzc3ZDRTRVBMN3FOYWoxVy9KMnFPRVBNdEN2V1Bm?=
 =?utf-8?B?YWFSRmFRNWtBS3Vnb2E0ZGRZa05LQVFwcUVPb0V0SG8vZzhSd3B0aXFkcXNV?=
 =?utf-8?B?eVR5Q1h3WFAxYUNlSHp5MWlqSDBzczZXZjRDNndXaHdENjE0WWxGV0x4SWNH?=
 =?utf-8?B?Y3MxTnI1VVZaVVJvWEJ5c3B0NndReitwd1JpV3Z0UEJGbHNyMGxJOEhzQTdy?=
 =?utf-8?B?VWlwRjdZekRXK1V6b0VwcXp1eVN6bXdlK1Jaa0tJUU8ySTBoVEpwSlBnQy94?=
 =?utf-8?B?VUMvdUpDWXJGanp4K2lRa0NpZnJncnA5djIrZ1R3V2R5Zmh0b25SQUVQRlRz?=
 =?utf-8?B?ZGlKYy8yWXJyL3QybkNZaldXTjZwRFlESFZYL000UGVpQWxtdVMzbVo5Yi9Q?=
 =?utf-8?B?MVcyZmRnT0dZMi81U0JqTlAzQzdZb0RORW9ETnFRbXg2eHBJZ2pPbmVuNGs0?=
 =?utf-8?B?VVUyd1ViQWZLV3g1UnpOdGNjYzhRcDNQYTVDeWVlZUxOZXA5YUE4QkF3VHJo?=
 =?utf-8?B?azZ1TkJHYXlRZlJXSFZUSzZId0JLczBkTEtrZm40Z0xQam50QU15R3hoRThs?=
 =?utf-8?B?d2dFMTgzbTdpcnJVSlQvaTFkRGJ6b0lscDVvUlZ5YnZUeGV5djNSQ1hIOGJq?=
 =?utf-8?B?dXZkWW9jQURlNjJ1aUR5blVyL3Y5aW1jclVMQld6OVJTeFVRa1MyZFJZR3cv?=
 =?utf-8?B?VmdXNU94VW55YWRpbjVTL05UbmRtOEYwdHBNUTdLQnVtc0ZFZElDNVFhSmNM?=
 =?utf-8?B?K2lvZnBYeEplM2IyR25wK0k5bjlqM0NucEQwT0YxMXB1dDVVRXV1WkFRVUhp?=
 =?utf-8?B?Y2dVQ0xzK090TE5uWWUyTnQzY2lSbzFMa2R6SS84bHRsTkhsQk16YnZrcGIy?=
 =?utf-8?B?SmJRcGhwN3RuSmlnSGxCcFBxL1RlbDNEL3l2OEtybmtxRzF2bThVRUs3OW83?=
 =?utf-8?B?TUlKTmlWUzlCMWRacWN4RmFMbkZTbnNnZlhKcElzNlh6clVXaTJWOG9TMkEz?=
 =?utf-8?B?UURBRkVyOHNuUzFsUTRaVDlqUVdsTFRBR0djMHQ1R1VjbVZRVmkra2h5L2JD?=
 =?utf-8?B?Z3BzcVYvQnJLeDcyS0hIVmdpZDlnNU1QRmtLMTJXUjMwYTEwd0h2QlRBNHVF?=
 =?utf-8?B?STlDbmdsb2JnU3ZxUWRpWWgwaVlkV1krZ1lydkpWQzdjdUNzU0ZrdUUwdXpP?=
 =?utf-8?B?a2RYR3hyYmt3RFVRWGM4SXlrYW1WeGVCaERDemtLMTJ5a1FKMjhRMm5OTmcv?=
 =?utf-8?B?RjZBQk5ZY2RJcUkzVHdQczgwK3g2WDQ1OFhPblNBU3R6YTdRK0Zjakc3MXI0?=
 =?utf-8?B?RG9aWGNQOVhLZTkzcmMxWW41eGJoRHZQOFVBQTFrKzJNU3FsTE1hcEZzTW8v?=
 =?utf-8?B?Sm9vQnRBWXM2am10Qi9wNWF0bDdycWExRjUyc2Z4c1FlTWYyVG5rUFpNQUJz?=
 =?utf-8?B?M1BNRGhyeGpZRG1lbDlTMEpmbW9nU2lvZ1puMXRkRForNDNYM053SXpXNnZz?=
 =?utf-8?B?QXE2RDVsSm83eWNNSnYybHFDWFlXY3FoNVBvZm8xVlI3OHN6bDAwd1Bjb1B5?=
 =?utf-8?Q?38m+InhVqf1XCPJuM1WLJGQvd?=
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b4d290-947c-46c9-25e6-08dcdd38b99e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR14MB6224.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 08:04:48.4797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6jeez/8StFPb3Pg5n7vHeHfVRCwqxyCa03d6KhDW24KD4l+pUO74wYusC3Y12hs8C9nHkXC4uLU4MHVSSycDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR14MB7109

In commit 35eba185fd1a ("i2c: designware: Calculate SCL timing
parameters for High Speed Mode") hs_hcnt and hs_lcnt are computed based
on fixed tHIGH = 160 and tLOW = 320. However, this fixed values only
applies to the combination of hardware parameters "IC_CAP_LOADING = 400pF"
and "IC_FREQ_OPTIMIZATION = 1". Outside of this combination, SCL frequency
may not reach 3.4 MHz if hs_hcnt and hs_lcnt are both computed using these
two fixed values.

Since there are no any registers controlling these two hardware
parameters, their values ​​can only be noted through the device tree.

Michael Wu (2):
  i2c: designware: determine HS tHIGH and tLOW based on HW paramters
  dt-bindings: i2c: snps,designware-i2c: add bus-loading and
    clk-freq-optimized

 .../bindings/i2c/snps,designware-i2c.yaml     | 19 +++++++++++++++
 drivers/i2c/busses/i2c-designware-common.c    | 16 +++++++++++++
 drivers/i2c/busses/i2c-designware-core.h      |  8 +++++++
 drivers/i2c/busses/i2c-designware-master.c    | 24 +++++++++++++++++--
 drivers/i2c/busses/i2c-designware-platdrv.c   |  2 ++
 5 files changed, 67 insertions(+), 2 deletions(-)

-- 
2.43.0


