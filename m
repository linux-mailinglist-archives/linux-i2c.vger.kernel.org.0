Return-Path: <linux-i2c+bounces-9945-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E61ABA6A522
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 12:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57221460D61
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 11:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D2E21D5B8;
	Thu, 20 Mar 2025 11:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1WoVpSxe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DCA21D5B0
	for <linux-i2c@vger.kernel.org>; Thu, 20 Mar 2025 11:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742470966; cv=fail; b=mAxKvXijroRaPG16wUHjgT/Y7/O32aSwclMe5z6MUQJCVNYtC7c4bglfmTLHNeZjfia/4kLzpeX+6/cRZ5CGsfpOnvkJr4jTjfTFcNeFK5M4VA8TqKZKnRCYwHYG++CgvQ7V1yvw8AqPXPlA9qgD93Wdtk+MhgyeHcVX9dqK2W4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742470966; c=relaxed/simple;
	bh=5lrfwZwcuVYaEJEQPLzwlE9SopnlIHefOLMQmm1sOKs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qAhby3xl+Ao1/8metuX/X+xmpCs52kboDtogw1Z1VcJa/0QrG5NbJIUpRJV40jt+uE7Eud3wIChVRqRUg9TAgQWP1FwMCPBDmqw3IR/MimoSQqdldlYvPAfTZNhm4umwLaTNMmDwWrBrvNzrxuthvJ6KPHTuRa8JituAxilbu1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1WoVpSxe; arc=fail smtp.client-ip=40.107.244.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1x9pQ/Jbvg6jMczcsKcvG9klawoM8V4cic+wEbjwMuluzNQ3mKx7x0LfMfg525n/rfWKPIlIdHaPC/uUNVtFi8nXKQcpj5H86jdoAZAwPrQnOH6q8Ivl6SuZxxyJzHuLhqPPzfj3fQBvcWpBPp8xsoVMe/SyWwadDZkVhBClzoZjeFj7LEqJxZY0UGNX3oEiO6XZhqS4j9MKd4wYdG4s7ngh1oX5hYkDWD9/U+J1RaZ+ZS7RQMrdcmkHMT/DDOU4OSxTJKX3qDzD/rf4xPHWiLu7xrll+b3gRxt36JIBToQBNz3zPrn/0LWle70kqu7naQiqJ76XOX+9KUPX9mRiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0JPv6N78uB3DqHH9UQdrKY/fsXpOXFdaFCBbTBWpYY=;
 b=okKBda05HaRt31zHjUphzllHT4iHPFX+2ZPzXlrXfuvxgZp1eW7zGBW8/DtrUjOgxk1aicNtyEZfl2C0YsTFfaYCs5KNNc4IBJHKUTn/OfxZabZdBaj7Xak36OV9nQ7+rVxS6d+Q2cAemzAu0gYLGpG0WbZAmv6lAwHz1h112oauIqWsBNv+sjvO0ksHHJOOdVTozTj+VtjFDF5O+4a/O2f9VLR9gKMzctJyWlTiPyiko9q8scIS2gNjVANS3KCI3ifK4FQo1jjXHGpJfvREzmGZpGYFbTR4mG1vfyB605QhfO45y+uJsBPIdGvCEp8YkCcv5OaNZwEdHwM6S0ydDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0JPv6N78uB3DqHH9UQdrKY/fsXpOXFdaFCBbTBWpYY=;
 b=1WoVpSxeRFuJDDwqtJAfMvUWgW4puBua9bLkRTih31sBhakYuG5ifmkOLSGpaK4Afj49ZvX1fYJOzGaL4BTj7XqM6jU4JAnL9GnJAvty49805R/PqLluE1y+QH79NFkldnbE8abHw1PPP+yTvcBX6Ibmsiai6+GUEZYDdjFDjA4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MW4PR12MB7239.namprd12.prod.outlook.com (2603:10b6:303:228::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 11:42:42 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 11:42:42 +0000
Message-ID: <301f186b-a558-4242-b2f6-164b56fef56c@amd.com>
Date: Thu, 20 Mar 2025 17:12:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] i2c: amd-mp2: drop free_irq() of devm_request_irq()
 allocated irq
To: Andi Shyti <andi.shyti@kernel.org>,
 Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-i2c@vger.kernel.org, syniurge@gmail.com, Raju.Rangoju@amd.com,
 basavaraj.natikar@amd.com, wsa@kernel.org
References: <20221103121146.99836-1-yangyingliang@huawei.com>
 <2mlgmmld4kih7fvt3bv2fzy2mgkbierbmtmzfbdy2cqweu7txh@tosw5go7mksd>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <2mlgmmld4kih7fvt3bv2fzy2mgkbierbmtmzfbdy2cqweu7txh@tosw5go7mksd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0198.apcprd04.prod.outlook.com
 (2603:1096:4:14::36) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MW4PR12MB7239:EE_
X-MS-Office365-Filtering-Correlation-Id: 5620b5cf-24bd-4be8-9bc1-08dd67a4529c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWtRMjZaekpIbXYxck1Sb2NUMGZhZDJKWlp6VWZlS3c5UVlmQlZZMi9XalpZ?=
 =?utf-8?B?MmdXbTBoanpGL3V0cEd5blZkM3NsbU5ZQnNCaDBrM3laLzYxRzhSUk9NSWo2?=
 =?utf-8?B?TllVTzE0VE9tVUc5dzdEQlBJdk0xRXNGenE1UXdGZUNveVdPN2NoQ295RlFh?=
 =?utf-8?B?YzVHbkx4RTF4N0FrVmNrbVo2UEhCSFM5aEtxU0w5aHpWL2I5T3diNU45VzBY?=
 =?utf-8?B?aTR2MlBPaXU4Zm5mdWpaY0l4clNIRDVJc2thMHFYSldzWUZuSWxub2lkekZ2?=
 =?utf-8?B?ZUZneU5haHlsWXNwYnFNSTRrUWY5dVZPUnNOMEI5djFuOVVySUt4a3BzbDk4?=
 =?utf-8?B?UUVhM2FKd3VuTkRWelJXZGJQOThXbXRFRW1qRVlwRHkvTHgrbUVVQVdTTTl1?=
 =?utf-8?B?RzVzY2ZNRjh0VDByMS9ySzYxK0FKOUVFNktNZ20rY1NuTk1Wakgvd001Z0xU?=
 =?utf-8?B?YTY2UDU2RVM0Y21OMDh6dnZXY3JMYy9KTjE1anhjc244NjhXQ2haajRFa3Uy?=
 =?utf-8?B?T1hZMS9XUWdobjdaV3lPMnoxemw5TTcyQTltSy9jL0wvVVlwVTcrTzNneFd4?=
 =?utf-8?B?aG1ZdWlzeitYeWpiQTU1OWgzejNlTTlZTklTZXplR01BNW1wN1Zhd1BvL1dJ?=
 =?utf-8?B?eXpFSTE5TWRFUnlGN1JsOVE4RzE3bW1TcWR1a1A1Nm1GTFBrYlFpSUt6b3dz?=
 =?utf-8?B?eEhkcGNtMUsyQVpqVVM1cnNPSUl4Wjg3Z3JyV3JuZ1Z2TkNHY0ZCSjFaaHZD?=
 =?utf-8?B?aE9icHdNd25TMERZYkdHYXFxRnJKdnVWNUJvMGhyc004U2tkSm5OYU9qeVpH?=
 =?utf-8?B?WmlzYXA3TGpaZnBDVGpGdGUwMDhHaVQ5L2pVcVgyVnZybmVzRjBteFlCRkFo?=
 =?utf-8?B?VU1YSUR4SHZXdEh3MDJhbHJGRTVDa0VTVjFxR3pqTGdzdGZ1K2hJck45NDVR?=
 =?utf-8?B?NFYydkVYanA4NXpKVGY4MTRnaHZWcDNXaHI4WVBSL0hjeW52eFhGRXlOOVpy?=
 =?utf-8?B?VVZURStpY0ZlVlpCUXlIbkNEQ241MEdDUHJBbFRHTXNFN1ZZOWNrazJWckZK?=
 =?utf-8?B?STJMc1czT3UwdHo1eEd1MkNSWUsrMGZjaDBHZFJFcW1SVXkwNWxobGlnOFlZ?=
 =?utf-8?B?d3JLRUpNOUJvMzZ2djk3RjM1L3dMNkpENFJGZHhFbnBqZWdTUDlPaUprcnpq?=
 =?utf-8?B?U0srS0pGbXdIRVJGZUpUdVVLQWFxUHF1cjExQ2pjL0FkVUF4YTh6dW5MQlNW?=
 =?utf-8?B?aUtmN2hYTkN6Y3hLb1MrR3A1QXQzd0ZQaUV3RStMNnRTUG9LTGpjZ3dobDFT?=
 =?utf-8?B?UmszZHdVOEUrMi9zck5reWE2ZmsycGtWOTNHL3JwWXdaK29Ha3hpUDlFY1ly?=
 =?utf-8?B?ckV6TjZiRmRVZ3hKZ09YOG01VkJZODFJbWRPZjZBa016bmlyOEcydHF5L0dY?=
 =?utf-8?B?cVd3YkZGN1ZKZ3o5dTA4aWowYkl2eW5Ra0RuSDdzUExndlkwS04vUTdUZUg1?=
 =?utf-8?B?b2ZWa1Z5aGNDcjVDTTNhMUd4RHZvUWwyL0c2Tll6ckpaOXdIalNGd0JLUlBI?=
 =?utf-8?B?MkoyWVJwUHE3TEs1c3lyajZEVEYwdmFYeGo0Ny8xUmQ2U2xkcFhaRE5wQkRq?=
 =?utf-8?B?THFCbXdxcUxOdTZQeTYyOHhxcnYzVmlBaEZqeXJlR01NZW0yd1hROEN5NjRY?=
 =?utf-8?B?Y3RtMnFOaTBHZFlsaG0yMTltSXFJZmhENHJBSENvQWF4amVDZDM0UjJ4YUZa?=
 =?utf-8?B?bCt4VzRVbndFR0wwUFo5ei8rYkdwczlWQlBGa29pU2hYSEw5cWxSdGk4YXhX?=
 =?utf-8?B?R3hhT1pxYml6VUhxdXg4NkVDdzZFMVJWL3luUjZhcXBYNkhTOEpURzNkdUZG?=
 =?utf-8?Q?lnOU03u9LMoy4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkpGTi84Z3VzV2Zud2MxdnVqTXRjaktsWHRSVWJwdDRsUEY2a0loMWpvV1NL?=
 =?utf-8?B?UVpvNmdnVWdvRDFVQ0dGMG54R0xYSGh0Z1JFQjlpTXBLVzRoekZpTWlVODNT?=
 =?utf-8?B?WkxXRUVTNGZIN3lQMkl0c1l4b2gva1lURjZZR2p4SFc5UStsN1R3TDcyNEJq?=
 =?utf-8?B?b0pDeDJnU2pYbjBJZURBSS90eE9KZVNwQVYxaloxQ05uZC83UHVRUjhzWjdY?=
 =?utf-8?B?Skt5SVlSTXlpWkFkNkRiWEpGekMrdk1QdTJoaGxjZWRZclFDK1F6RjkvZDBH?=
 =?utf-8?B?ZnRaZUliRGFvaFhuQkw2eEJuT0NnRDhqUTVIaDdZREcyZnR6bUo1MWJpSlFk?=
 =?utf-8?B?N1NuVWljMmt0OXBlcHcvOW9QcmJ6d3JWbUhUaVN0MnE1cHhhWXpkcGRBOU40?=
 =?utf-8?B?VzIyNmhHeHpaZEwzc1RoUGUzeVpoU1U2VVFtV090WjNjejBhZzVid25SWGZU?=
 =?utf-8?B?d3BSTzQ3YlVqMzVoWUFQOTZrb2RxZ3hRQkl2WWRKZmpvUFZ0elZOY1BFeG90?=
 =?utf-8?B?ejNMK2twekVFV0JNQmY3eTR5anVkcFBCeEN3czllSm94ak13UkR5Y3RqaXdU?=
 =?utf-8?B?M0dIK2F6WFk2Nkx2RFcvZXRYYjVoZi9meWNkTDJ3dFB6OHNmek5oL0ZCN2U5?=
 =?utf-8?B?ZE93Rjh2RGNCbm0zVXQvMUdGNDQvK1FreE9qTGpXOUJLaXNnYzhyalAvUCs3?=
 =?utf-8?B?Z2FaaCtkMzd1NTJCbEZlYTgyY0NROTJpTEIrR0V5RUVIbkgra3hwQU05dDV5?=
 =?utf-8?B?Y1drR3VqVktWd0FRR3JzZTg3QWkreElEdjc5bG5HaUhUQzhHY1g5cUFIOGxD?=
 =?utf-8?B?ellQcC9zYml6MW9BWENuWW5Jb3daVmcvcjBEWW5NMFRiKzdqKzdaNUNxMm5G?=
 =?utf-8?B?SXp1OXdVdXAvM2I2NUhMYW5yT1VmNkFGRlZZM2FFYTRuaEtMeTNFSWJ3OUZU?=
 =?utf-8?B?Y2VWZFh5WFJiS0ZTU2dtdEJiVzBWMjFMdGRLVFRZSzQyTWZpWXhydG5KbldO?=
 =?utf-8?B?UFIzTFB5QkNuMC9hdldrc3cybDhrb2FEUDJwa0FzR1o1RXZsWXp6QTVZTHZN?=
 =?utf-8?B?a0c0NCtVdTdZcTR1WmxibTFsQ2wydkR4SVhpdmg1TnNVMU9RL3phMkROdllB?=
 =?utf-8?B?SW9qV21zd0VESDlucnA5UkEvR1hiUWtzRjZCNjA0aFdwN1B4WWl3ZWtNclVL?=
 =?utf-8?B?eVBMeGdVUURJcDRaMTJ6SEh0cEQ1Z0cwQ2VrNDJvemROY1cwUlJMNWJDZlls?=
 =?utf-8?B?RjBpbm5XcEdWV1c4ZmVjTjc5NXZ5VFJZU0FUTmhhaytvQlRQZDAvOFFsWVRF?=
 =?utf-8?B?L2F2anliMHpBTGtmRmsyMVRCdm1zSHBOVFozclF5NXBrZGVlQjlaSXNUS2Nt?=
 =?utf-8?B?WjB6bnVMM0ZoRlJaM2V1bW9PQlAxTUF3VGQ3QVBnMDZsY0ZpZExWSFRxSkVt?=
 =?utf-8?B?Z01uWExPRG9OYXJkZk04SytOQjZZbm1iWDZwQ204MWJEVzBNTnllWDNIVnIy?=
 =?utf-8?B?Q0pjdnBjYzNSOWVpL2p3L0FSUUJzaGJRa2ZCRVdtdDh0d3lGU0tMZ09KUGZZ?=
 =?utf-8?B?aHNPOVBtUEVEVW1UdEJORklRQ0hyalA2VFkxU1NsUm5naVJobmI0YSs3R0NI?=
 =?utf-8?B?S1hleVkyZkVHdTAvSERmL0RjRXAzUHozaWg5Zk9raHdPdlF6L3NwcU01ejRw?=
 =?utf-8?B?Tm9pRnhqNnl6N3BlcHVROWpkdURBa2VSazJ3Z25rbW1ndmpWbVcyNlNYVTFj?=
 =?utf-8?B?dHRic09oT2ZIVFVNWGZZM3paZm9zazRJd3lzcDhsampLeG1LRExVQTdGc2V1?=
 =?utf-8?B?aU14R1FVM1dwKzNZMTl4QlFlMi80eG9TblFNaktadzZkeVpEamNNeWd1cFFY?=
 =?utf-8?B?QmtoRFBnYWZLeS9ISC9mY0l3L3BIaDRpQ0paT2huY0FGM2xocG1ZRlU0TG4v?=
 =?utf-8?B?ak9iRzZLdXNvb25WTkxXT2E5c3lmVmROYml2UE92Zlh2UVJLUVZoa0R1MFVu?=
 =?utf-8?B?SWNvc3lZZlJ3MUtHSmtia1liYWk0RWcwMFJMNS94QVdjVllLcHd3b0QzT1J1?=
 =?utf-8?B?cmg2d0FjNU1aZEppNGZWcTRVK1FiL2lnSUFha0F0UnVTbWJNdWJGUFZSMmxX?=
 =?utf-8?Q?4CVz7UOFD+gtgNBrOYxibDK4P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5620b5cf-24bd-4be8-9bc1-08dd67a4529c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 11:42:41.8511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3sJAc8zZwtzj/9T8Hxf/cSD2QPIahU9Px7nqk0Z2E4DLqF6uHtYEWK7s31xFdRmmjFeeovtaaiQJJjv7+6xPJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7239



On 3/20/2025 16:46, Andi Shyti wrote:
> Hi Yang,
> 
> On Thu, Nov 03, 2022 at 08:11:46PM +0800, Yang Yingliang wrote:
>> irq allocated with devm_request_irq() will be freed in devm_irq_release(),
>> using free_irq() in ->remove() will causes a dangling pointer, and a
>> subsequent double free. So remove the free_irq() in the error path and
>> remove path.
>>
>> Fixes: 969864efae78 ("i2c: amd-mp2: use msix/msi if the hardware supports")
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> 
> No ack from Ellie and Shyam have come for this patch in almost
> two years. It still applies and it still looks correct to me.
> 
> I'm merging it into i2c/i2c-host-fixes in order to have it in
> time for the tests before the pull requests. If Ellie and/or
> Shyam will have concerns, we are still in time to take it off.
> 

Sorry, I missed this.

Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks,
Shyam


