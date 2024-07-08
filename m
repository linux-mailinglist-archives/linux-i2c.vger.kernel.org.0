Return-Path: <linux-i2c+bounces-4765-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A3792A711
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 18:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65A451C20D96
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 16:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B2814B092;
	Mon,  8 Jul 2024 16:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="dWzl2WoQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2130.outbound.protection.outlook.com [40.107.20.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EEA14A619;
	Mon,  8 Jul 2024 16:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720455209; cv=fail; b=tk2/bznoDIyjycr6Dg2MjIvsZSWULWcrUTMv8NITvun+vOOjXeBtSqNIxbS7wRwpWEDrM0hvJ+HLzTBNv7BKlVkxXCGn3cQU8W7ldDy+DnuHaRtIR2IhbSES25A4EyjFXdF670U9L6z04o4BiZqZD3kLmVj2zan6PLoPTst0czE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720455209; c=relaxed/simple;
	bh=ZqLxvdbON4HGIDwXyHoLXPvWlZD6EQcsY3ekUxJ7maw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RvjgA5KvPD05Pagx4GcOqFNSEauAYGLAkeaMZaBcGL425xaBZhErcmXH7CSFXp9/jk/A8fTQIXfWgLlC50M7LUyYd6Wg3TUt3zcKbx6OY0FCULRMfQ1bhacbX8uaE3401k8DsGQIlhjxfU6uOAoGyWu3VkF2ERu8AS/oqpdmfjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=dWzl2WoQ; arc=fail smtp.client-ip=40.107.20.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DILS2hHwavnDJM8fgxnwZaFdr9oyqK24Vt+TLYMiT9zeRk2PiDrWXKHijj1lTvVXF5ohCsio2I+HVVxWtkHIsUB3+AYdEWyS/Td6YU+fy/BBbCe4RQRstEFRA/UrlaaucV9W9cH4Wly8SY+czqI+yWr6n3qDw62H92iTCnAx3o2svoZPqxQ9z4prFeHrRt0IAe2JUmRB23oP1/OOJiPghA9CUcDZJdWYTfrZDloG4LDnxWdVGF2zIe1Qe/6QOJEU9RR2dGNajn9uj/T2XPJDvty4x+eTG2HNS5ihife/+RQio0yQN+b7QlGKOwMucuXkRIlVZnpzB2OVhFJw9kyAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpOnVJ2Fq9UBRXgKUtAdUe3ZeBAX+dIsb/Jnqh7FOQ0=;
 b=d2hrX1uJyXHDmE7Q1+qitwUOCZqUVy+vE1iQ2TBszbS2Y1nFSE8r8Y3G5P/n48CH0fh77mdlVuaHOsi6v9ZDElAkkN15aXrcBBJ5sJB1nc4a50Psw1LTRadzc41G0Omxa9jLQligj0PVdySx1ehpmWlsvrcZzlGM+bAZS4vQ6UzqqmpTLF56vcpCotQHhTRchXpxkv2t83UsYTfL4038sGNf5XDAfSSsrqWbV9gwyBzZ5Y/c0BOg/9pf6tbpzZe26Y6rQcXm3QEsRvIrboWgiNZYSbNzY8EqWBtDgQZLmGpLjDAmiPyqhUJRqtfyQh7s4B5xjH+FGoS1izbvSCec6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpOnVJ2Fq9UBRXgKUtAdUe3ZeBAX+dIsb/Jnqh7FOQ0=;
 b=dWzl2WoQxnyK5MCGzU1jtLefTeNQ2J/jMsgzlnI97iYHTslR9FHNGZ469MpFsWs7IsDax/8SdHkLjthlDF6mRbAPEOT3zZ/MHD1cjeaz/YPjOkm9f8KbpfL6aK5hNCmvpa5Y1n2yp3P3R8ZguvJrlvnwpxrO0KYjCuid1h7Vj8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by GV1PR04MB9055.eurprd04.prod.outlook.com (2603:10a6:150:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 16:13:17 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 16:13:17 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 08 Jul 2024 18:12:19 +0200
Subject: [PATCH v5 8/8] arm64: dts: rockchip: add tsd,mule-i2c-mux on
 px30-ringneck
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240708-dev-mule-i2c-mux-v5-8-71446d3f0b8d@cherry.de>
References: <20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de>
In-Reply-To: <20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.0
X-ClientProxiedBy: VE1PR03CA0057.eurprd03.prod.outlook.com
 (2603:10a6:803:118::46) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|GV1PR04MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a3594ba-b66e-40f9-5138-08dc9f68e062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDZHNjAzeEJrbkZkUHFTeHY4ZWVsZWc0bERYc0RLSHJuci90YWVJUC9kMGRX?=
 =?utf-8?B?YW5JbkhtdWNZSDcyNXpzc2FJZTZUU3FRSGhpWXUzdTZQNmJHakh4UVlTQ1po?=
 =?utf-8?B?MnNib1lwWTZYMElKUGFYNnl0cWlJRGxoWjMyKzgyQTFnb2FYQjhBaE50KzVt?=
 =?utf-8?B?VFdHUUZkTENGK3RxMGVQYmVoSDZXa2kzeGtycFF4bE02T3pJaCtlcDVmamtk?=
 =?utf-8?B?T0Z4NDdZWHJaRUg5TWF0VjlHQnZkdGhTR0xqNFFUWWx4OWZCQUxCMHo5dzNJ?=
 =?utf-8?B?MlU5VW5veHFQRlVjTFg4bThnK1Y5eE9xY21GSEcwOTZLVjUyTlVYelI2bnZQ?=
 =?utf-8?B?UXpSTXhXVm1sSzVseHpUMW5sQlFBaWRvU2M1d2loQ3AxazdZVFpVZ0c3Tml5?=
 =?utf-8?B?T1BQeEw4V2RjREp4OEY4VTFtbWNXYVA4b3ZTNXZtWUlMVUVhendNZWMyL1Yv?=
 =?utf-8?B?U3J2dGlsbEloWTk1VjlyMm5DVnpwVG5UUFhxcXJPTFJKMUhrN2M3N0U5WSts?=
 =?utf-8?B?WXhUbmtsandDWHNnaEVkTGJ5bzc2UTJVcFp5T2QzcW5mYzJ3WGJ4NUJ6V2dL?=
 =?utf-8?B?MTJPQm5CWkNkbFd0NDVYRDBzcGhIcDZ3R0hqL05iRE5rZitObUovTlJ4WnY1?=
 =?utf-8?B?NVV3UGVwZlV2czdIeERiRGtUKzNwcXVNUXJuTjhTa2liVzd4aW5qVjF4Z2Vv?=
 =?utf-8?B?Zi9QcllPK3AvTUt0d2pMdklud3lONjYyWXBGdVJ2R25XQjJmTzNqK0diTmg5?=
 =?utf-8?B?SzBGRDNSZVVQRFV3TkVZS1FyMTZ0d1Iyb1JndlpXay9xNzRVVDYxYUlPSFhJ?=
 =?utf-8?B?dGUrQTNnbTlQeXk0eDBwZklNMnRUUGdNaWdxaXR6RlEwN2JJSHJnTUtFMDN0?=
 =?utf-8?B?SXluSktUNEFab0FnSEMxL2ovMlhDWndjbmtNK0RNQm5pa1JTVi9TakMwL1Ru?=
 =?utf-8?B?dmlkM0ZMY1NVVlU0YUpYMFdEdkZ0UEwycEl3NU5ISWZRTnBVL1U5QTFhOGlz?=
 =?utf-8?B?L2d1c3FOZ2k4blBjbUVNZVlJQnVVU095aUJVendGaTRtdVhYdnR0RXJKL0Vo?=
 =?utf-8?B?aWlHeDM1UmtTRmRaWFZ1ZjE5K3BRTkR5RnROSWxFbXZCVlllUUhkYVlPaXBv?=
 =?utf-8?B?dWZGSnBIeWVCbnRkSFcwV2tMbXZtbXRBbThyeENaWU8rdkRYT3ZlSnNISmlY?=
 =?utf-8?B?UnBicndObVk3ODFPSkFYNm5Jb2c2dS9vWGRxVGRIWXJuU3ZPVkFsejV6TThN?=
 =?utf-8?B?elhoM1ZPcjJZSHBVT2dETHRRVlZKYmtyeXBRYWw1em9ibHBldk91UXZzVEJp?=
 =?utf-8?B?akxjTUJuQVI3OHJqVmNveUlTVk9XVHdNTXRJS3J5UGJxVTdlNUF1bDZLbkpM?=
 =?utf-8?B?akxGdFhkWC9qSWtxeUh6UmRqVnRzaTd6dk9pbHdMM3VLVHNvL3FZeFBtZi9J?=
 =?utf-8?B?Q1dlTG10a3E2WjYrZ09OdFpUS3ZOelpTTHNTSjZqV0MwMlVVc3FoaWZCTEwr?=
 =?utf-8?B?czY4Z2YvOEZIdHREa3ROOFhBTkJOaGkxdlhrRGpLMnh3a0xibkhrdzhObWF3?=
 =?utf-8?B?cnk5clVrbWJ2MGt1U0lMcHF5M1V0UzA3TEJqZE03RVlDM2dQRWF5VUJlWFNv?=
 =?utf-8?B?dzFoN0dWV0svYjE1b05Nd3ZiZXhWVU94dWZPcU03LzZqaDh0N29HZGQ1Z1M3?=
 =?utf-8?B?aXdZc2hRV1R1S2FucWY3ZzB4c1dwc2RCdFp3U2xyQ0JINjZCeTBXd0xmampY?=
 =?utf-8?B?UWRxNVZqZkVDL2pmNFNWOGk5WDNtc0pacFNSSTk1eEVXRzRKUFM5NDgxK1Bl?=
 =?utf-8?B?ZlZIQ0FXRm9ZVFlIeGgvK3dKZ2ptYjhDdGlTVzdXR2ZWZEFvWnRlRkVRcUd4?=
 =?utf-8?B?Z29pTFB1YW91S05hRlhWVjFWYzQ3SGxMQkF6ekErRXZNWks3SVF5VnBzOUMv?=
 =?utf-8?Q?15DdR8qhT6U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUVwanh4a3MyTEk2VUF0L1ZRUy9xeGpjWWJ6amtIU3FDSE5pYkRXenVENUpX?=
 =?utf-8?B?eHZKUWhYNWthS1RLS1F3a1pmVlRwTjZ6RWlEUG81RG1ncTBrdkdwb25Oczds?=
 =?utf-8?B?S0RtN1pYdnJRc1RMSFFOTldSWWxxT01YYjFiaXRISlJiaC9ZdHd0a1JHQTJI?=
 =?utf-8?B?bHk0K1FXYUFteFhFTytWRFphMFF0RU4vWElsdzJWTEQ1T3pXVnVyb3Iydmw4?=
 =?utf-8?B?d05sZlc5UytickxSRHhyVWorWmROeTJWaFFIblFqeFhSZ0c5QmZKTDlQRVR6?=
 =?utf-8?B?YmxHZGxnYkpXVVlUUHozY3J4SHlGL0VmRGhxWTMvR2Z1RDd4Q0kxTlRQNjdH?=
 =?utf-8?B?LzBZTENjQk5GdVNteTRNdENnazgzSEpkR2JRaDBZeThYUTM0TzZmKzVCU2s2?=
 =?utf-8?B?WXFDajNmeGhud2RRQmZIQzFsNjVZQmRpaDNnWVZlay9icTZ1MFhISWNibEtJ?=
 =?utf-8?B?cHpubGI1Z1JtYklEQXNmVWwwMHo0ajJNMzJtMEJHcEo1dE9lZ09oT0ZkQkFp?=
 =?utf-8?B?OTRPMWlIbmVhL2krSjMvUWRLL0R5YTNCMVlJUlhYOHVvcDdwL1FKamtuYW1N?=
 =?utf-8?B?eklLQ3ZTZUhaZGdxTWcyTnlGY3IvT2tuVHphZkUwQ0piZXk0b1MzQUVSTzAw?=
 =?utf-8?B?V0xkMlBNTVN0SEY4WFcxcFJRSFh3ekNLZXFFblcrbVQvb2x6OWdwQW9vanBJ?=
 =?utf-8?B?U2k4bkZSZUE2L1ZySjBkRjRaajJaSTFtZm4xekVUUXZBTVNKUGNOZUwzVUM5?=
 =?utf-8?B?TENMTmF0V0FudEFEZzFUK292T3JObjBESlN3VExnQ0lucXFIeHhlQU54bzF1?=
 =?utf-8?B?c1V4bkFnZUk3ME5SN1J1SnFCTDhJZVNYdzdoOEVOaWpmUGtLQm02dWRaMkcz?=
 =?utf-8?B?UXV0ZFZuWGVybkF0cm93UUVMdEQwQ3ZNRTgwQnJZRENOaFlLc2VxQzVCeE1I?=
 =?utf-8?B?OG03OFk2RmE1S29OVC9pUG1JRmFSN0tVdGVqcmlCRFFvMERDYkEzQWxoQkkx?=
 =?utf-8?B?eVUycG5ZTFhKM1hzZXcyeitIUFJTNVcwR1ZqL05OMFRxeWZXSGVBanlDUjYv?=
 =?utf-8?B?cEZoWER3WHJ6RFB4MWhsQmV4RXR0M3psVTFLZTFsRGszaGVDWm4zMTJiUmNK?=
 =?utf-8?B?SW9kUFZ2dnFJeGJuWVIrUnlkcVBCWFBmUlIvNm1rdG02UlNSWFN0dnc5bndY?=
 =?utf-8?B?U3ZhQjJiQjc2YVhyQnNablc2TEJrYmpWZ1VSTjg3WDhpamJPUjlNeHpua0Y1?=
 =?utf-8?B?RHZNQ0FlUXdWRFVlaTNaUFd0dGpyd0ZrNnYxWWtFSDFLTTVpNXRBbWZjSlVh?=
 =?utf-8?B?T2ZIanFreUxyZ1YwZkJUdC91YXpXbFNMTmlkcUc2RGdnZytWcG1DUWFocEha?=
 =?utf-8?B?M2pWck1Fd3NPWWNjSDJXazVJZTB3ckhvbDlZUTJhQXE3MWRNN0IvemNIQkxN?=
 =?utf-8?B?UzRxTXZGVGZjeFpkTnowdUV6Y2Vnanl4L3RVMVpGTng0R3dIV0tRd25RSGhn?=
 =?utf-8?B?dFFhN0NOa3oxaWd0eGN1c09TN2FFT0VPT1dEZUE5OGJJSEgrbmliSTNEZ2xT?=
 =?utf-8?B?Y0lqcFIvTU1UVjdmc3g3Z04yREtDM0YvOWpzSElDMDNMR29WL09RZnRLSk1w?=
 =?utf-8?B?aE1ybzdkcDN3R1BJYTRsa0JwSEFzaUdzaGVHTjJ2OFZKZHRpNHNDY0liUktW?=
 =?utf-8?B?aWxyemhUTmgzV3B1SmNseHBOK0p2bzZKL2dTeUg0QlNoSThKNlM2bm1aV00v?=
 =?utf-8?B?VVJWMkl3bWd5N1Y0QUNJUHBEV1MyZzFTS1BQYlc4VVF1UjF6aDBRcEk5eDBr?=
 =?utf-8?B?R1ZMZFBPcHhyeEFqck1jcEdLcHpUQlY5ZjJ6K2FtOU9zSC9pWWc0MENHUSt5?=
 =?utf-8?B?aDBxeUlkMXVuTU9pRHR1RUtFeHRFZ3hBWG4rRjJFOGx3TEFIVVNpRHJlSU1l?=
 =?utf-8?B?MTdKdDVUekE2Vi9iS0dLYVlxSEZ6bEVvR3YzcWZCR09HOVNXRlR4VlpJMjZu?=
 =?utf-8?B?R3d5OW5tQi9xQVVBSmlGdlNaVmRlbVVYM29CVG85S1JHVUhxVWsySDAvazlW?=
 =?utf-8?B?YlpTdFJrNjB6N000a0JqSE5jN2Q5VXUwT1dVUUNkNmg2NVhiRDZtN1pUc0lF?=
 =?utf-8?B?dWRZdWJjT1R4VzJkOStGa25mUVJrejUzS0ttZ3R3RUdaWWxibG9pMHMxNXJ1?=
 =?utf-8?B?cVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3594ba-b66e-40f9-5138-08dc9f68e062
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 16:13:17.0607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VAjHBOq8y2sZSz7ZjNAJNg6uKqNTRXZq6WYV0LL8wmEpPKp39xme/NLjpfEF5pxVf5DDdqS0qsdQQkkp3Ra3Fxzp8kfoHwboh6ZGL3BKEjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9055

Add the tsd,mule-i2c-mux alongside with the amc6821 (tsd,mule) and isl1208
as a default device on the mux.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
index bb1aea82e666..a683ed3e2fce 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
@@ -9,6 +9,7 @@
 
 / {
 	aliases {
+		i2c10 = &i2c10;
 		mmc0 = &emmc;
 		mmc1 = &sdio;
 		rtc0 = &rtc_twi;
@@ -292,14 +293,25 @@ &i2c1 {
 	clock-frequency = <400000>;
 
 	fan: fan@18 {
-		compatible = "ti,amc6821";
+		compatible = "tsd,mule", "ti,amc6821";
 		reg = <0x18>;
-		#cooling-cells = <2>;
-	};
 
-	rtc_twi: rtc@6f {
-		compatible = "isil,isl1208";
-		reg = <0x6f>;
+		i2c-mux {
+			compatible = "tsd,mule-i2c-mux";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c10: i2c@0 {
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rtc_twi: rtc@6f {
+					compatible = "isil,isl1208";
+					reg = <0x6f>;
+				};
+			};
+		};
 	};
 };
 

-- 
2.34.1


