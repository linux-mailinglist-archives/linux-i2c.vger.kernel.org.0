Return-Path: <linux-i2c+bounces-15003-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F4BD048CB
	for <lists+linux-i2c@lfdr.de>; Thu, 08 Jan 2026 17:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73731305A20A
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jan 2026 16:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC102DB783;
	Thu,  8 Jan 2026 16:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="fZobly6R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCFB2DB78E;
	Thu,  8 Jan 2026 16:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767890466; cv=fail; b=ZgDuXlGMjkn0L4L+/rNl4TKjhalY11cEDGTuB/mQNolljoFtgJpikldHvJbAwnuPF7tKkMwFCLu584etWcLysDHTba5KQzrxl2WnYAVMOgObqzb9Bi/FxKAqunQ2lq32O6xxZYYFAgV5Y505/Sg4qRMJEkTCH5rchiP+WLWWSOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767890466; c=relaxed/simple;
	bh=YcmzBn2bNQ+ny8x9WzcUYexN9E4aiW1dAf7D4olib5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eqkr1ib9HVEHrm/HaSU4KJyDmrSaL2YKF2begiMjsaiX+auC2VTHQm5e1a0UJ02Wh1HJMuAiCg10Jcphh56SV0tl2lAJk0xsVI3t0k4eGeVnPhidkK8OIIlK63AqXhuj2o0IkEmpQNAra+eR+Z4oxaH2NPeMq1BA9Wgu2KXe1Kw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=fZobly6R; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608GZf4j3183476;
	Thu, 8 Jan 2026 17:40:45 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11010061.outbound.protection.outlook.com [52.101.84.61])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bhb7pg2b6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 17:40:45 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYvSkKjJjL9yaD31ggQHngnNxsA2aaidyWq5TMSXqGIr+VrXa9NO0oOJlS14BMgv0RRBb5wm0ZHGuhlBvgJ33x7sQ1l2yiOqOs3b/QEjO9OPk5RZEBSgmF2IyCI8ADXqsxnL75FNY9fgJM0npYGJ/Jwybvm1eLfcc03woMNAfXaGrnF9MMRHdD8Z/DmZpG6RSOKaeAL8Q1CgPXnBD3niuw/eJPZOo4W89xOOd2NIZuQFGRAnRXaXrU71RSTSJGI35IU2rMz1pVm0nS+WAzTe81txclOjIuTfMqQFWbIVDLQAi1Tv+QpQ3Mbis/TcA0x60splz72w2DrAl29ZiT/nkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WewhM1rYQ1KoHefw2PYBb6NSxRq3Ci+IbRbCTnZ+78A=;
 b=TKwN1oRJCfSQAHNtka5eN3TSfAHGx/x00wdymyDNxtCC3AWNNEDJLk6q1hameJLJJRE7UkvwnhG6nDLQIlD/23i+HzjHVGF4eO//k8c1qRhnk4enFFgARWj4qmLqRTnDZ0hedSXAy51vN84DUVuIa/aktd9+alUNzf9bGHdC32zLKjmaS1coB13NpTYciLjDJz42aox97ujK8ale5dT8S8ybCyKZzJVSnZLgMNsO1S9B+gxOa5Z1MFdTk7bjzga0y2HBIFCC+egnKf5BAcMhMCrZFWJ3gWm28crFDXwNPeLEliU7KBfYAYRyN04fs/gkSqkBm85o/9rVhIL3n5yWbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WewhM1rYQ1KoHefw2PYBb6NSxRq3Ci+IbRbCTnZ+78A=;
 b=fZobly6RYNG8UpHzdFUdyxYq8Axul1kLlwTDb6fXVnJO0Bu7+yVrs0iOvms5b+/H9Vk907VYporGA90gNjpvxQFna+FbqX4Zi8eqbMs2Lbu5WpdZmRm07/fuINbj2oNb/FcXfOFUMsShOLSpzS9yuGWNvws3lxsfnLtXfg4Zsuo4+6ke3tmvC5TDBBN4D0wI27S0IjzL2I24rKZoBetU00id0uz6PA7yxj/p2VYmMrF2AjT9opSu9JTy3hGFJVR946YfHRxllFKuue8B4PynV1yHv2YX3wclusmq2t6w9qUvl6EEW8KecOZtGAUhAY271PN0Dso9HxeH/5DlkGj7QQ==
Received: from DU7P250CA0016.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::24)
 by DB9PR10MB5258.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 8 Jan
 2026 16:40:40 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::ab) by DU7P250CA0016.outlook.office365.com
 (2603:10a6:10:54f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Thu, 8
 Jan 2026 16:40:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Thu, 8 Jan 2026 16:40:39 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 17:41:56 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 17:40:38 +0100
Message-ID: <369dbec0-5a15-40ce-a564-9cf8c58357fa@foss.st.com>
Date: Thu, 8 Jan 2026 17:40:38 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] i2c: st: add power-domains on stm32mp2x and enable
 i2c-analog-filter
To: Alain Volmat <alain.volmat@foss.st.com>,
        Andi Shyti
	<andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Pierre-Yves MORDRET
	<pierre-yves.mordret@foss.st.com>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20251215-stm32-i2c-mp2x-dt-updates-v1-0-2738a05a7af8@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20251215-stm32-i2c-mp2x-dt-updates-v1-0-2738a05a7af8@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F9:EE_|DB9PR10MB5258:EE_
X-MS-Office365-Filtering-Correlation-Id: 52018326-802e-4e20-9c15-08de4ed4a877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3VOZCtVRzdRZEI0TGpsWW9tZW5oemVaTXRWdFpLN3JQQ1d2aW1yQ2FEQ0NG?=
 =?utf-8?B?SUs1TTVBTXVrYTFYd1IwbXVZaVBkdmI4RW5sUUtvOWpwSDMrUnhRODRiSXJt?=
 =?utf-8?B?aWFRRE5XTzR3cUJnMXUrK3RpT2dra0JsR21wSUU3QXZ6RE9OM3RYK3hscHQz?=
 =?utf-8?B?V1Z0aklNRGNabktON1hGbUQxbFlWNTFKSG9jcnhrRytOMzVWeTFETnd0ZjFt?=
 =?utf-8?B?NUhoeE1peE9ZQzVtMjZhdzQzdE1YMUdNcjVCTDBBMXBKU29UL1JLczk5b2pI?=
 =?utf-8?B?ek5rYlZ4L0ZoWG1jaUsxQU9RbENsa3RwN2ExcEhLc0V6VUVNUEJ4NHZXZ2ov?=
 =?utf-8?B?VFZyaU9oOTVoTFY3NlFrb2VzL213VElXYjRlbFFyMTZTYTFZdHd1Mi9QS01Z?=
 =?utf-8?B?TGtlYWJRZ1pFZnhURXF4YjJlUE1rQ1RPcDZvdUZlSEhIbDBRZ0N0eE4xS0sz?=
 =?utf-8?B?amhPcHdpVHdiTDZjMFBLc21HRGtYMHlxMUpqamN2VkxoY2lmNG96cWdpZ0V5?=
 =?utf-8?B?TzVjVmVVVkRVTG1pZDhlTWkxd0hvVENYU0JYNUJuQmZ6NDNsbUxYdUhSYVhp?=
 =?utf-8?B?TkF1dEdGOEZTZmw2KzVQOGxoYVRCTllXRlhOMTd0WEdLR0NSZlFzVXhhNkNz?=
 =?utf-8?B?OSt1RHFGcGtWYVpYZjFwZ2RVSkFZNUprSE01SW8rc2ZIUkFTQjhnK2VRb1Yr?=
 =?utf-8?B?TVViMW5YdFIwRWhieG9iYTkzNUZuSHdmbXBPQVgxMkZ1SmpWd29tS3BaUlNj?=
 =?utf-8?B?VDExS3d4RUpJVFBCSndhYVl0WXk2VzZHU3ZleXJXS2M5dTBGRUJicWJ1SFdO?=
 =?utf-8?B?cXBCd3Y3QlVPcGZjWVZOVmdOWVFFS2Nzck5TaU9tdDI3dnV5bE9tR2hUT0o3?=
 =?utf-8?B?Q0dvSVRJNWI4NXBsTHJpWFpCTytMeWRBWXdNcTFwdFo5VkI0UkVoSXpqVUFa?=
 =?utf-8?B?YXhXSk1YTUNlWGdWT1ZxRFRqeERaOVpCYTNSbDVCRkFBVnJVTUNTVHdrSWNW?=
 =?utf-8?B?cWVxNUtEWUNFcXZxSG5yYTRzZUFZSnZHUktGZmRDb3M3RnVMejdpUEVJNHZU?=
 =?utf-8?B?TlloTTFUK0hFbUQ2S1J3STd3emprRVF0QnVIT0MzelFnV05ZZUV5NllpMnc5?=
 =?utf-8?B?aEtIUFd5ZGcxZmdoOUtHNHJtMmtvbE81azF5ejhnUHNtNFlOcE1mRHFtZ2lC?=
 =?utf-8?B?WFV0M0hDQkVKL2EwS2JIUkQrbG1jallvRWNvUmdGY1RkS1RGNFRyY3dheGhI?=
 =?utf-8?B?bWV5YjZsbVU1cHZ5M1BjN09NQUlSaHBVSHJwUFRyU0VQV2NObGw5TGJsdEky?=
 =?utf-8?B?TmlLVmllandTalFIcjJqbG5GR1UxOHFGNVIxeEI5QTQrbFJmWG5jbmpKYkpX?=
 =?utf-8?B?R0JGc1d5THZjSlBOOWFjeDBZS1k1dWNUL1d6TERnVUZ5SmR2SkwrR1hqajcx?=
 =?utf-8?B?NHVSY1l1V01oUnNUYzZCT3Z0bDNrL0hqcmFCNjhINzF1MCtjMzF6UHIwc1RU?=
 =?utf-8?B?OW0xNmdmWm1EdGNDblJNTXkyaDBrWFhHY1p4SWFYQklaYTg2eWhRUW9SbnlG?=
 =?utf-8?B?RHJJeVZQUkJoUFdlcXNKSDZKY3p5aHQrR2tVNnB4bnRlOVVMMzRXcDhMR3hl?=
 =?utf-8?B?QVhKVWY1M3g5YXRzT3BXWGl4ZElXL09SNm9DZVFiUmdCNmdGanI2d3R5aEI3?=
 =?utf-8?B?ZWxQUWRLOTRjKy9zTlUyZk5sdG93eVNqZEl3ZVArUHN4M2FjYk9heHYyMGJQ?=
 =?utf-8?B?cDZvajYrSU12Lzk2MW12bCtUbUFqS3hPZUJ0M2U5N0F0c29EQmdHLzR6RzAr?=
 =?utf-8?B?a1NCcjRVM0QvbERybHJ3b0tBQkpTSFRZdGVuRC9YM3RsUml5OXRGRS8yZEZD?=
 =?utf-8?B?cndoM3E3aEhNaUtpRWdGWDJ5eUJXL3BoamJqRGFobUdBUmxnT1BTQXQyb1dM?=
 =?utf-8?B?SWpqaUU1SkZlNk9LUDJ4VzVuNUZkRHpxSS83WEQrQnM3cmlnU2lFbGRheFB2?=
 =?utf-8?B?M0ttWm5FcTQ2Z1lVSmhNM3IzSFJibmdmVWRJdTlLWFlmWmVVRGdqQTNHTU1M?=
 =?utf-8?B?RUI2NFdOekJ0RHdrNENmWHRZblRQU21sL0Q4Qk1NNGZkTzFYLzFQZ3RQUitT?=
 =?utf-8?Q?u8WM=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:40:39.8441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52018326-802e-4e20-9c15-08de4ed4a877
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5258
X-Proofpoint-GUID: o4HifvEN3VXqq3PR3QdW27NAvCg7SdVx
X-Proofpoint-ORIG-GUID: o4HifvEN3VXqq3PR3QdW27NAvCg7SdVx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEyMiBTYWx0ZWRfX2jSyZ8eYzPUh
 IwPVbVvSW0aAtR2B4fwOqFsRRvLHgOvLTVxz7HqLUapNvcbgSyCdS0Bv0wBQj/IO4KnZY6wWVlo
 ByP2uSYgMn4Qzplcr4IOd0T7/xcwJcZm89mZaoPFn4YYnrk0i3Q8E/0Bz7yLhaZK0xY/77E1Mc3
 auA56f0hFbC09byVnPg+j4YLeiyvBxSUsai5h8KICxFVr7BHdkpkKVk1E1BQVL8E7yQt2cWgWsx
 Z1ISG4yYE1R23tMDTl1vWcIUyDPAtZjakL50gDUYzRYraOARMB2hrpkxbM2iNZx6mUs3mrTSGl1
 WGY6CTa8UdeMoQZSAm9KRkTBDZrDelpuNOjaQxD+frxgvumv74oReNssTB0Crj6SD+XPONUGNLD
 Ga2GOTqQ/x+k2L7iv2JI5kBDu+Tx8Y6fQu05NBLU4dZhroKDSW7hwIBCDSl9vFTe7J1wcuXhE/I
 Ol+buAJ3fe2bbiqzdJw==
X-Authority-Analysis: v=2.4 cv=DZ8aa/tW c=1 sm=1 tr=0 ts=695fde0d cx=c_pps
 a=rEC1nn3bwXFCJLmtaBoKug==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=IGI1-IgJz0Pc51GdehsA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080122

Hi Alain

On 12/15/25 13:19, Alain Volmat wrote:
> This series add the possibility to indicate a power-domains for an i2c
> instance and set the related property for all i2c instances on
> stm32mp2x.
> It also enables by default the i2c-analog-filter on all instances on
> stm32mp2x.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
> Alain Volmat (5):
>        dt-bindings: i2c: st,stm32-i2c: add 'power-domains' property
>        arm64: dts: st: add power-domains in all i2c of stm32mp251.dtsi
>        arm64: dts: st: add power-domains in all i2c of stm32mp231.dtsi
>        arm64: dts: st: enable i2c analog-filter in stm32mp251.dtsi
>        arm64: dts: st: enable i2c analog-filter in stm32mp231.dtsi
> 
>   Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml |  3 +++
>   arch/arm64/boot/dts/st/stm32mp231.dtsi                  |  8 ++++++++
>   arch/arm64/boot/dts/st/stm32mp251.dtsi                  | 16 ++++++++++++++++
>   3 files changed, 27 insertions(+)
> ---
> base-commit: a6961e2ced5190c68acd78a7e372de07f565fcd6
> change-id: 20251214-stm32-i2c-mp2x-dt-updates-e3747a0ab68c
> 
> Best regards,

Series applied on stm32-next.

Thanks!
Alex

