Return-Path: <linux-i2c+bounces-13041-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D95C9B83463
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 09:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43A953B0F2A
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 07:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6952E973A;
	Thu, 18 Sep 2025 07:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FKhgoygv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012053.outbound.protection.outlook.com [40.107.209.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E880A2E7651;
	Thu, 18 Sep 2025 07:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758179445; cv=fail; b=Ix6Rc18i1rojJ4vUs7D+GuY+N2NqP/FN8FqKhAoFO9j07X07M0QF9rOKgfvBULA3oHfafZNBiWMZYTpGVP/4paY24AsKRphICOjB9eiAv0WlitUadpl1xthRIiX3uoEjrY0Bw+KrPFsYoKqDJ1ec4S3bzTZ+UNreG4EuJ/H+hZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758179445; c=relaxed/simple;
	bh=L9kHUg/4FYSZMhNnu4hwx4DtyUL4l8ReMcUzYjIxO7k=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z9E9Cdm17UNagKrMNJMssceeuIjWyIrPIFoq6B3Vuwzm/P6rCcMrKFnalfcGC3VIBVDVgcLoHabKv4CgG8qopK/PAGLeJd9i4GBsouajUns5b4meo32Vel3GSRzTBGjginFYZ4Xu4N7eFRJ1Us8HsRhhAUlGTZWivXnBXw++jJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FKhgoygv; arc=fail smtp.client-ip=40.107.209.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gia5OliiDm60rxBUBu8zB8avc2sCuoOFJ/s/GD/aQDcxdAlBUCPaAGibQk8gUVUD78EjGNl2biDlCgT2tTvAlyBwlMVZ6gz4ycZxJcXOlScUVRTzd0sXiN4peXYkBouS7Yv80bXLrhFbAUMGhg4Pa8IUgPY/pVeH2OT4N8buq/pVITq3CQ6q3JJXUbiFWqr2ZKF02MSoddkojIQQq14Z4EnwlO9TAUFZ9fMMT32YRGhI1UI7aI6jC8eRBgvwtC4sOWLN/ORPEcptFNi+jaTvNM5sjVqZLL3TBhvwCo8/u/V24KAWQwz+bhwveveAIjcxrhuB7V8XTZ7ZHVWMlJ2jVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ih7s1ocYU/PoA4a8cFHBkJd0yMnk1drI5I6UmwtrXMc=;
 b=J4EoT8NKuXZ86b9pelMo+AiC5DRnvQuY7pWjCUq29dNXAL/qDR/cUNh1n9uhTNCnxOUxX3tH6zZiaUkBYL97VYkoCaBY18MQWaFLJQUoXMl3rXU5QrfKd6F/aJ5Jjczl/+Qh8NErSxhKDjypmOGNiURIMIFKqEKPHbQZm5IWdoMLxj29MbVEM0ZGhZUoml9Hg/8RpGYFW8v1HdsOPTl8vOGJtZVvF7IvWAmjN02E1TDVHQtwZu1yngVmhYZ9iaMGkXu0f6z7+rRX1Q+3IgYvqi929huQmpTSeOVo5LY5b1Z7NO4kX9zRgl5bkar8PdTAOPUd7e017Y58GRMIrkiFIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ih7s1ocYU/PoA4a8cFHBkJd0yMnk1drI5I6UmwtrXMc=;
 b=FKhgoygvr7jmdTQkuxAU3lXqLNZ11AXVgC0gcCmzF6pjvvh8VB9zezvHpqIwMdCXB8jtQpBgoi1XnNdlJKP6qDr8YhNjodRGIaHlpODESlnUk3gc9RIiX5XsdwZph5roniEexZlpqqa+UrGQITEdUY9fCQ68bhtwUeCKqDxx+WLipSnY4rakakDYsOR0H8RBFKR4FMAY106HXtrds+h0sskemFWKalsXRNSruh0Olf0Q1USWhB2ZveQhsnyXKKDOPGlXwG4fZNUePb9cgfYf8IPjan0i6XltBfigK4P0290NgniV2GwFQl/yRWWcEcsRCTJ3bMAFJhEISdhn7xZUGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by MW4PR12MB6777.namprd12.prod.outlook.com (2603:10b6:303:1e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 07:10:40 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 07:10:40 +0000
Message-ID: <21f71c22-8957-43cc-a99b-158366467654@nvidia.com>
Date: Thu, 18 Sep 2025 12:40:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/4] i2c: tegra: Do not configure DMA if not supported
To: Jon Hunter <jonathanh@nvidia.com>, akhilrajeev@nvidia.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, ldewangan@nvidia.com,
 digetx@gmail.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250917085650.594279-1-kkartik@nvidia.com>
 <20250917085650.594279-2-kkartik@nvidia.com>
 <d336ce08-4e35-4c14-9f5d-e777f7d91cc3@nvidia.com>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <d336ce08-4e35-4c14-9f5d-e777f7d91cc3@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0043.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:271::6) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|MW4PR12MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: ffae81f3-a554-4239-9fca-08ddf6827936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qm9CeFVobkZORUZDOWZRaU01ZjZ2MnZJVGpFNEZ4U2JKeWVMZ3h4Qk9Jc0lL?=
 =?utf-8?B?MVp6Nm5Nb2E4eTBNb0xCNTg4UzJiOEV2L3JoVEZVeW93SWZrSm81by9GT21w?=
 =?utf-8?B?VUdEaXVlUVBHR05hNkpmR0dMcFlycDgyUkxQbmh2ZnRUbmhTL1V1VUZOUVlU?=
 =?utf-8?B?VFRTZDZRQXRNMWEya2xlMGJmaUI0bEVDRnJjTkpXdFd3bHFmNFhjS3A3N1Zs?=
 =?utf-8?B?Z2d4WnBMTUJ6MWs3T1ZjNkRHRDZ3QXhIM1dXTFR2aVZiSStTR1Y5bTV0eDRF?=
 =?utf-8?B?SUR3a1JOcHpFTGRkMUhtNjFyK3YvWTVsNzh4MXRsSU5OeU1nSm5tU0t3emVt?=
 =?utf-8?B?UStnVGp4L1ZPRU9LWUcxcjAxd0gwQytUT1VwT21PalBSWTJVQkhUSEl3WlZM?=
 =?utf-8?B?TDJmZHNqQ3JLekFjbk9xODd0OC9zZEp2azhuTDhiMVQ2cTRPMzFDSU5QNklG?=
 =?utf-8?B?ZE5KZzVtQWVtUDUyTnVGMmVHWkUyb0FxMjQ4VEtyR21qanRxc3lFMk10TSt6?=
 =?utf-8?B?bzJtZEh3SVJoU3NGcWJpS25pamNvZXZNU3hFZk5CMmVRbmF6eFExbXZTRmpB?=
 =?utf-8?B?LzF6YW5QMGQrRHJZZmhZT1o0LzBOZkdIVkd6dCtOTEw4WktoZzAwQWF3ZlIy?=
 =?utf-8?B?blN1NnV5TTV1ZmZ4S2tVRUYzS0NwRXN3Ym0wSy9Lam9jWEJhS3h6NGEvTVNq?=
 =?utf-8?B?UEdIelEzUjE5SklQaW80dFpxcm9BVXdCdFFaV0NkamphNXRaVkVIa1VCNUJK?=
 =?utf-8?B?ejV1MHJTOXVtdFlhaTZaa0RUTkMyd2tzcHhCSmtnczl5ZmNoWXBrU0x6SFpL?=
 =?utf-8?B?dTU5V0ZHOENXZitRQ2xTSmVGL01oNGxaOGwvSzR6RzU4T1JRUkh1WGIwZnhF?=
 =?utf-8?B?c1o3d3M0bTFvYmNDdmZmekxZeXhyQktFcFpncEhCSUpNMHM2MUVXVkZMTDNP?=
 =?utf-8?B?Qk5MaFBsWUNlVDJiZzN4WVNVRXZuWHU5eHl6ZVhJOGRMcFdFOTVjdnNmWVQ2?=
 =?utf-8?B?RDJPUkhRYzdQMlZPZzRwUE5lbXVUampMS0ZkcDAzNTNVWEtUL2lJdmN1RDBD?=
 =?utf-8?B?MTM4b3F1SzZMVTI3N2MwdnVqb1RwREJkT0pSQndMQWdoRFRvRmoxT083WjBQ?=
 =?utf-8?B?Z2l3aEVjOXZzK05KWFh6SzNka05xKzJMekZuanh0TGFrQVNqTCtRSXlTZ2RB?=
 =?utf-8?B?akxEaCtlbFdsZXZvUWcveDhtV0RNVU4zTmpzL3RnKzJ1NkNhU3dyYVJpVlAx?=
 =?utf-8?B?QlFmUXlESUl1dmlOL3hpbXd4VVZEbXhZZEFTc1NtN0xZSk5uRExjYWJTWEEx?=
 =?utf-8?B?N2lpWWpmM0w0VExyeHZhVDBFTUE3YmpYRmJlOU5ac0pTTmQ5ODFmZFdUSENP?=
 =?utf-8?B?UEZWUlJ3OXUxai93YkNLakJyRis0a3U0bXFwQU9IU0JKSHk1bW1wTHZVOEJO?=
 =?utf-8?B?eXdTZXZRQ0YzRnBSWkVHMlVicml0ZlJrZzg4OG96N0xSbnc0NTdxdnpDbUZl?=
 =?utf-8?B?TDdLWEI4dEgxRm1SU2hNcS9lL3ExUFZHbFhYMjZYd1loVm95QWF5c1E2dmVC?=
 =?utf-8?B?ekFiS1FGc1JkTjArR0NUMmJOYTdVa0pZTUF3VjJzczZUZzRpY0hNbWZ6K3Ja?=
 =?utf-8?B?SFhucTVJSGxnQ0JoM0xrbW4rdHNuQkI1aFgxQmRoNHRRZG5KN3p6Zm5MTk93?=
 =?utf-8?B?Z29Fa1VEZDZRWkFsM0dxbk1heFpMWlRuT25NTG1Nbm50c3hXLytHOFN3TXZG?=
 =?utf-8?B?amVIaktaWHZ2Uy9McEdXbXM3THlhdnE3TVI3SDNnTmlYMUF4dDBwL2pHVERI?=
 =?utf-8?B?bXNxWEhlNURaWlJ3d0ZCaDZGK0RDb0htQ3JIdDF5MmJkOVJiYjUwNjFIck9N?=
 =?utf-8?B?ZXFraElHWkJrYmVjdFR2YlUzNnVjOUxYNVNvZ2xJTWtUTURGSjRQbGZPWTla?=
 =?utf-8?B?TFF5bHFzMnMwZ2pMT0tVSFJzTzVkVjFWKzVUSlZObS92T05WcEtoSnZlaDVv?=
 =?utf-8?B?R0w5RWhmSTV3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnJMYXpzUktLcCsxdnhBVWl1eUViZC93VXc5UWJVZFBieWNRT0tjZGx6UkVz?=
 =?utf-8?B?Y0RMQkw1alNlZFJicHRFS3RmQzVwdm9PTUtySDVZOEtSeXp0WU5LcmIyOElt?=
 =?utf-8?B?bldZM2ZESGtLQ0U1end3bVFmeDB5ZVpsaXpkVjdSMGFBK3Z6dkpUUzkrTlB0?=
 =?utf-8?B?RUdEVCtib1I4d09NMERKUEU0U2R5YWdRdnlQTTBDZlVNWGNkZ3M1T3BuZUtP?=
 =?utf-8?B?U1U1ak45MkpPSVMzcElpY1ZKV2hNb0U0T3lHcVpuUENwNzM5UHM1VGE4WEpp?=
 =?utf-8?B?ZnVTZURzZVJvdU43NUsvL0V5VzR2U2J1L21ESDFqQWRScHhTaUJ1R1BTUnFG?=
 =?utf-8?B?Mkx6UmovbWpUMHVTalY3ZWdEU2taQ21zVm1aN0o2ZEcvZjRjSUFaT0phaWhs?=
 =?utf-8?B?Tmg5ZFhCNVVDMk8zNmVzQnExdEJ6Sy9lSXlkNG1pSTlpNzgxeXNBM2lFZHJs?=
 =?utf-8?B?Mkw5YzFRcWcwNmoyUUl3M0lOZDRDZGF4b2d2OHV0OXZOaXlrY0RmVWZ6NHdQ?=
 =?utf-8?B?MG1UcGF0VDlYMHBGL05rcFZoSXR4aHpJQm5pZEEvZ05RTkdkRWpHaHY0NzhF?=
 =?utf-8?B?U2M0amVOZEo4Q09LZzlEOUlpYmdlTHBvRVdoSGhQZW9oR01WeDFoOHpxb1VH?=
 =?utf-8?B?WExmbGpsWXg0N1VvckNaSHN3RDJpZEVNeDRLekpVZFpvbUdwbzdlbWFqZU0x?=
 =?utf-8?B?MDVQQVZ6QXVDNG5yL0Q1Y25JQ0s0NnhJdkxnSGtYQUwvVFJ6M0VYRUtaTEh1?=
 =?utf-8?B?K1N4WFd3Vmw4NkpVRG9rUERacCtNZ3FpZmtaYndwZnd5MVYvMW9URW0rMzRi?=
 =?utf-8?B?Uk1QTHp3Mk5RelMraDI3SGhtRytLMWtrUW1KMWc4Nitvb21SbFVHdG4wTHE1?=
 =?utf-8?B?QlpvTGNnZkRGMXlGNUVURnBKZlBoRVh4ckJqaGJjWkkrbGZ2SGYvaGdYY1M4?=
 =?utf-8?B?ZjR6cG5KamY1UWlnaVI4eUkxK0Fsb094QkZXR09lUG1CeXJzTEFBY2FaMHFS?=
 =?utf-8?B?MW1Sa1gyK2ZrSHFDQjlkb3A3SmZZWnFaRmZTVWpQRERaa0FLbVFrODVGSGw3?=
 =?utf-8?B?Vytoa0F5R3cycVpRU2tsRXJTMkh3R1k2aFlzRG9xMWVBK0Q1dXUvNmIvQnFZ?=
 =?utf-8?B?cVZVTWpQb3o2Q1FUSzN4VzRjOExtbEwvUGlrWVJmcEVPdHlQUVJrS1dmczkw?=
 =?utf-8?B?cnR2NS9LWVp1VFBEQkJxQnBxZ29rbENMSHFoREkyMmorTlVBZjY3eGhFYm1J?=
 =?utf-8?B?VnZWaEp1ODl1SklZVm1GNGt0b0tZb0s5UE5UYnZMampSdEFtMVR0MDNTbHFY?=
 =?utf-8?B?cnlpMG5KZzlmM1RPZDBLTk45L291WjVtdmdsVmVYY01LQ2E4ZWlxcDFhbS9a?=
 =?utf-8?B?UTlFSTVFVWNFVXliQzhjOU9tYWJKVDI5R1JoaVNWNC9aSmJla1ZyWXBIKzQ4?=
 =?utf-8?B?MmdremFkZTRESWdTOUtqVzYxa09mL0Y3bE5XelNid0xGbDlHVXA5aGZ0L29G?=
 =?utf-8?B?WHdCdzZqVHpHMDBnbjF0ZndLUnZqZlZWMFg4RWRCcElzcmVheGhLSEZOVzlv?=
 =?utf-8?B?MkR3S1Aya24rblJ1bS96MnpSNFRUbUt5b0RvNDE0Q0RRcDVQZkZQak9odXU0?=
 =?utf-8?B?dmt2SllmTjFpejdJR3dHRXgrVTZYckxiYnNTSklLd1psTG50OW1lTWtWemdz?=
 =?utf-8?B?QVFqZ2p6TlR5L21wL2RnTFV2WmM0bEg4dnlWSGVFQXF0YjM4YkVJK1ExSDRF?=
 =?utf-8?B?by9KSnNQRkdHa0xnZ0pnQXgwVFhzclkyNW9OS3hGbTlhcjR5WTk0Mm82MGw1?=
 =?utf-8?B?RDFHU3ZZUEhMd1RYRU5ZVUdzWCtkajcxdWZxZlUzR2xYSm1zZy83cDg2TmRP?=
 =?utf-8?B?WFlxcCtsdG9kaWFUUCtwSGRJeWNXQnd1MVloQU5vM3hlL1IyR2JUT1ZWZmx3?=
 =?utf-8?B?NnliK2w5bitzRzhCSzExbzI0RzMrUjAyelk1Q3BnKzFuSUFnTjc4dE4zZUtR?=
 =?utf-8?B?YmNZOHdEMFlRREhFbEUrQXNxNm8zZkZ6NWtIeVRDb3FkTmRNOXFVaDh1d0NU?=
 =?utf-8?B?YzhSSU9JcTVDeXduVUdaeUpBU3Bwa0Z4S2E3MFlNR1RyMG1QR2xPdmN6d2xR?=
 =?utf-8?Q?QZzonxL/Um0rUYfIKKpt/+LGc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffae81f3-a554-4239-9fca-08ddf6827936
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 07:10:40.0187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bIpvyHM4Wmjp3+PszG1ZXCKMvBUOMsqkA6IUD6EJjSBcIu4D97RCPb3QJZkgzfvZAhZ7pROhgbzDu5nXErMykg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6777

On 17/09/25 19:38, Jon Hunter wrote:
> 
> On 17/09/2025 09:56, Kartik Rajput wrote:
>> On Tegra264, not all I2C controllers have the necessary interface to
>> GPC DMA, this causes failures when function tegra_i2c_init_dma()
>> is called.
>>
>> Ensure that "dmas" device-tree property is present before initializing
>> DMA in function tegra_i2c_init_dma().
>>
>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>> ---
>> v2 -> v4:
>>     * Add debug print if DMA is not supported by the I2C controller.
>> v1 -> v2:
>>     * Update commit message to clarify that some I2C controllers may
>>       not have the necessary interface to GPC DMA.
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index e533460bccc3..d908e5e3f0af 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -446,6 +446,11 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>>       u32 *dma_buf;
>>       int err;
>> +    if (!of_property_present(i2c_dev->dev->of_node, "dmas")) {
>> +        dev_dbg(i2c_dev->dev, "DMA not available, falling back to PIO\n");
>> +        return 0;
>> +    }
>> +
>>       if (IS_VI(i2c_dev))
>>           return 0;
> 
> No issue with this change, but we have a few checks for DMA support in this function and so it would be nice to have them altogether.
> 
> Jon
> 

Ack.

Thanks,
Kartik


