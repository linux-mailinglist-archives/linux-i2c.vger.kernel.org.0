Return-Path: <linux-i2c+bounces-6005-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD11968C3A
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 18:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F8671F22811
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 16:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F482101AD;
	Mon,  2 Sep 2024 16:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="EM60eOWM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43561C62D0;
	Mon,  2 Sep 2024 16:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725295129; cv=fail; b=AO5Iuh3/dkBnf7U73IoG1qqR6MMZyVgS5V7FkGkipyXv9YO1S07UTfM25BpFaQO4/b9WaApESxCFQQFbzrUlyVNnxLRnqjvXlRBni9JLOdlv0yfAxoIKx0M/F4tnLtSUi5sj/Yaa4uQ5/tji/AbbgYdPJCMJ5AT0pRCfUAuIm2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725295129; c=relaxed/simple;
	bh=VyWkcMH1vIMrAshFDYbhv33bvEhtmogMG2bNAFhK2u4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=u/rTeWHyYN/xNx2mT7JPfhGsul3GjYWeu3xWSlHnDKduUZj+hGw/WVBFPTEQihEfgEDxxQSDxzXSQuzAEbgqbm+XC/oHFBEZPsj7255Q9qjqB/HfUXSL1qIU/j2Gx2RjsnrbpSctCMaFst6GqnrHaDw7+psxBTi940Y8v7SmP80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=EM60eOWM; arc=fail smtp.client-ip=40.107.21.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mK+9l/7VGmb7PfL5cg6Mn679IUxnHrFM8/7Do63IwtaZspcnzhUXJZfy0wGKwk8nkcfRk+N7dL6XWBlaCrsW7CrydZ7hDaDHyUf5WLaFIISx+L0zXPaJ+nq4S7sjMV2pZ2umdkExx0//1Apkoxi76Ro52DMw6QRsolRGhfwvjXIYOrUW/9XcBEd0v97jZ+PQCVJVqsRfhEUpi9DD2ATdqa2POTmz6TvpYukvLrTwcLfQsjw57YXhoEsIG7Acs5d/y5+HrAp7g9hjsqX44M6XvyCs/zzGpTfRFBrN7et3X2Bz4uGN0+2lIVbf+Al3BlE7R2snNMD6FY4Xr4+a0BJhhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGwa/A4vBTysDmSS40p/93vepDiajPAWaGAkELG3XwM=;
 b=rYl64PqyCU3uF8whslEpWAW8HD2bAgKLUeqhD1cMR91L3T23ZN6M8NnqGi6NhQsJcnbxEOM/mjKmHsBp7N+JbzhyV5ZwqfhSN7SK1Zwq46hq190R74Mm6cX9mL3FcIFllKYq+Ja3lNMH1tQlKXY9Y9R/Yhv8wiLxdQ39Mxd1wwECxORM0MyA6gBBI1YU1vGBZmvRmISz1xOiEGcJ0b/U9xbBsYyo1plnWmP6Td1yHB5ZkE1w1Ic9ohoUYYBvM2K+furOazdNwp4kE4zlzxI29O9X9v72oLCW/TZ7sqb2tX3EWe3Qao+tC13fK2Pi4WGecUchfHL/fwL9JbSmRAWM8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGwa/A4vBTysDmSS40p/93vepDiajPAWaGAkELG3XwM=;
 b=EM60eOWMWxqkMYpqhtSE/yC/c/iXCNDOzu3vh4wPwTDm8Fm0lK60/U0xk4J5bj/ifPLFJEvWmSjwyQChiAzCZSDUdkgWsjB+c3xCK70w8wxqhI22wrNfforjN2LAqNJjONKWmCSz0mjO/GnZjFCfBagH3u3hpxSzH83qbb/Wx/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by DB9PR04MB9645.eurprd04.prod.outlook.com (2603:10a6:10:309::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 16:38:38 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%6]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 16:38:38 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 02 Sep 2024 18:38:19 +0200
Subject: [PATCH v7 6/8] arm64: dts: rockchip: add tsd,mule-i2c-mux on
 rk3399-puma
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-dev-mule-i2c-mux-v7-6-bf7b8f5385ed@cherry.de>
References: <20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de>
In-Reply-To: <20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de>
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
X-Mailer: b4 0.15-dev-99b12
X-ClientProxiedBy: VI1PR0502CA0001.eurprd05.prod.outlook.com
 (2603:10a6:803:1::14) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|DB9PR04MB9645:EE_
X-MS-Office365-Filtering-Correlation-Id: d29bed12-bdaf-4cb3-1d55-08dccb6db21f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TU9YS2RWNFNWcFN1Z0Y3TXE3ME1KY3JpMWRkdVk5TVpzQ1k1c003MU5qb3pE?=
 =?utf-8?B?YzhxZzRnMm9ubGVPMWtTd0c3bEtSQ29xSXVvMUdMa1B2d3VEMVZETXBCVm53?=
 =?utf-8?B?Q3dMYmpBTERYUUlvNEc5cm1UODFDNmR6dHN4blJwVFRJWGlOZDczeER6Mzcv?=
 =?utf-8?B?TkRFanhteElyL3pVUzVOby96ZDVwdkFvT1U4eW5HMktRUVUvVDREdlpWYi9Z?=
 =?utf-8?B?SjFTOCs4RmpKTEQ2b2t3THJCaHgxSy9yWTJCWXQrNlBiVTJTK24zdzlnT29W?=
 =?utf-8?B?dzQ0d0ExWUFuV0U3eFRKc0t0TEhqcmJ3a1dxYW45eTFCUHBaMVl4TmlFVW9n?=
 =?utf-8?B?VEFaQkJaUVNTeDM1Z0IraEd3cUZEaG9RcmFtc04rbmZnSXlhcFpLQ2M5OWov?=
 =?utf-8?B?L3NOR2wrUDZRSU91bHpPZG8vclFVL3M5d3lpN2RRdElPQUJteTIrMW1oRVU0?=
 =?utf-8?B?emZ0dTRsS3F1ZG95UjRmeCt0YlUwb1dJdjExK3lSTm81bkNDMmZWdURkM01q?=
 =?utf-8?B?UE5kQ3lNNnBkY2lWRURwUHl5aUlJOFUzc1RURkJ3SHEvVFB5Nkt0UFk5Rk1I?=
 =?utf-8?B?MDgyeXQxT1JTZWR2VmFCb004QmpiU2E4dFB4V003MjVPOFBYNUgwbnNtQUVL?=
 =?utf-8?B?cEU0LzBOaUM5REpEdzgwZWNCcmw2WFhzUm9nM1llLytNWC9Mc1dpWWVpbWF1?=
 =?utf-8?B?MmZDc21vOVh0MXBsaVhUQXZRRWxSQjBWV3Q1eGhld1hXZzVpeHhScG41WHU4?=
 =?utf-8?B?MmdsVWp2dno2M29aU1lCMzh5TGMyVzdvRDh3amVqVnpCb0VGU0tianZrRHov?=
 =?utf-8?B?MmR5MDJsbEFsdnZzcU5JQm9lczNuSDV4WkJuUnp5TkdBSURNT0N3ZXplOEhz?=
 =?utf-8?B?WmxRdXViMHZFTGVxWE9PQ1dpbVFhK0pHbkZrcnpXaG9CdW5kWDdwdlpFcC9a?=
 =?utf-8?B?anVWZFo2VEZJRm13cGhJSHMrU1Fwa2NLMW8vcVQxZlNWWWpEMVJaUzV4Um16?=
 =?utf-8?B?clVGNUFOR0xKL2dpRkh0dFRRQ3FSMzI2emY4c0VKUUxYckk2YXJMdkorU0sx?=
 =?utf-8?B?K3hoSXU4NW8zVUNWczdQM0xOcyttNzhsUTkvVUlPdVFxbTU1RzhnTFNJbDY2?=
 =?utf-8?B?eXVvdTEvQVp1VzA4SnZkeUhTNm8zUDlrZ1Ewb3JqYXVFT01kaSszZlRBSlJK?=
 =?utf-8?B?a3JVZ3dIM0FMclhIdEE3NUVPaUY4VjRBTWd4aW10NXVWZlYyRitjMWZvWGpD?=
 =?utf-8?B?L21PR1ZjWnBjYnQzbExkejdBb2Jreml3bTI4YWRlR1JoQitXS1VRNGoranRi?=
 =?utf-8?B?OFRLZ0dVSjl6d3RuTmVoSCtPQ1RVL1BYUFZiejdhVEZsZUlOdDhmL213bHY2?=
 =?utf-8?B?ZHlXQkcrMDYzNmtyeE9tSVZFeE5IMVdKOU11MmhjY3o0WUt0VVFPejVxdWRR?=
 =?utf-8?B?V3phTVlpREVrclJXTXJxbUgyWkdmSDMzZW9Hb1RhV1FuRXVKVlk2ZEtrM3Jp?=
 =?utf-8?B?aU85a3VFMWtTNnBNbFR5NGlsUnNUZmxZbmwxV2RaTFBMcTh4WlZHM0h1M3F0?=
 =?utf-8?B?QzhMdzMwcUswYld0Q3pTZVk5WXh6WTlaS2ZnN2h6YnN1SWJSVEpFeGY1OVNZ?=
 =?utf-8?B?T3Q5WkxTRUxXa3NTQWZmMi95blE2MUJSaU52cEhKanNrOWNXbHFmUmgzSkgy?=
 =?utf-8?B?RGo5dk8zMFhuYUNkNlNOM3l3V1N2dmJoV1A5cVd0WjJQTStVZXpyeE52ckdY?=
 =?utf-8?B?S3pLVjVRZE5MNDZZKzJTRDdaOXREdzNHbVFyL3d3a3R0ZTFUZWhNSEdYRTlU?=
 =?utf-8?B?Z0tIMUhJeHh5a1NIZmlaWUd1VVVKRmdLOGc1RWFNdWpHMjM1NlQ0RzkwREV4?=
 =?utf-8?B?WldNVVAvL1hKWlNQRGhNRVJrSFhWZGR5MUljTG44b3RzTlAzY0MzYVFwcW91?=
 =?utf-8?Q?2KrTPGoMwuY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTZicEZPUGpsMC8zNG5KSmpwMnF6WDNhYzV1bW5iWWxOcVRBZlVEV2ZoajVW?=
 =?utf-8?B?bVY3WHg0R2x2Z0NNSWpJNVZsTXJKbWx4YkNUb1pNSTVUWldpdmlLOUJiU3Bp?=
 =?utf-8?B?dmYrOTh2UTFYb3IzZTlXV0pEY05ZbDUyTGc3L1J3QTJiWmtUV25SM1QyMzNt?=
 =?utf-8?B?Wm9oMmJxU2xiSXlEdm45a0tDeDBFdE5NWEpoVW1MRnBMUHhMazRPazVtd1Zi?=
 =?utf-8?B?TGY2cDBYTERrTkhTSEtMR1Z6UlE1VXlmc1Uva2VhUHFpbG90WFdPM3lxbUlF?=
 =?utf-8?B?QlJyNkU3MHpPRU11NTl0aCs2WTNaRCtnUHVQRzhEN0FhYVZXSUVqTzE4VTh4?=
 =?utf-8?B?M01nV3F4d1VWTmJaOXlZenB4d21qY014MUZHSkY3S0NsdXdtWWk0VThsUGdv?=
 =?utf-8?B?MGhoU2czRThTQ0hXdnI0dFAxRXhUV0YyWnFMbUlKV3U5MXduSlZPaXRtajJm?=
 =?utf-8?B?c0N5Y0kwWGlQdUFXZGUrTTFvQXMxZ1JSbUV6SFNBRXQ4RjdRWDFFc0x1SGFr?=
 =?utf-8?B?TytCUGlHVjdkd1NTR0txVVoydVo3M1ZmUmswckhUU2ppLzZHeG14bXZBQUpu?=
 =?utf-8?B?cEljTmhUcGdtNUR0dG83aWl3dnREakNVMUxKRHk5cStRZlQxRUN6U21kVURJ?=
 =?utf-8?B?TmtqSUhyNzFiNndLUnZpOGdoRDlWa1FLSW9rdDNrQXg3Zk44WHUvT3YwNFJE?=
 =?utf-8?B?ME1maStTYVJtZ3hZVnR6WmQrdGtYS0hlS3BjK1JnMGJDaUh3bzlpV0lQWGdn?=
 =?utf-8?B?UUlqM1hZQnJNQjM1QnJIVjY0dE81N3NlUjVUVXdmRjhlckx2WUVPc0dVbC9S?=
 =?utf-8?B?Zk81YWJ3RjBKcnNMWVRlNldIaGlvR1B2VEoxRVl3YzllNjVoQndPOUJtamRI?=
 =?utf-8?B?UnZGSGh4NTk5UzJrREkxdzR4SDltSVp6a1RUbUE0b0tvam5za0grWW1qNDhj?=
 =?utf-8?B?d2VvbTdBUTNla2dXcnVXV1AzZUtqS3ZqRUROa1JHVE1vTlJBOTJmYW1TWG5x?=
 =?utf-8?B?MjlKeTVNb2FnZExsTjRHdmlveitpQkdPalpPMmVWR2ZMR2E2SzFGRVlLK0o5?=
 =?utf-8?B?bkFxNmlxcTdxdGRieDkrYW15NWorZi9sN25SRVJQdWFlYlFOb05zZFhFenpo?=
 =?utf-8?B?clNlZlZIcnlPclRXY0dpSGhXVjBnU05pOHVPZnVJT2FaK1NwRFlHMlZCRTBt?=
 =?utf-8?B?dHBvUWQrREJFdW9XQkc2K0U2QTFOUGJLeVY5MG5iUEJITHpzakUyVytVSEM2?=
 =?utf-8?B?cDAvVUFjeEp1eHN3YTRTd2Z1QlN5eHJnVTh3dU1jNll2dWh4TEM4ejQrWGRW?=
 =?utf-8?B?Mm85VjJzTEJZVHBDV0Noa2FRRUpmNGJQbGFFOEQ1b29NQ3pNNGJPcUFDc2hW?=
 =?utf-8?B?MHlLSXFRZUdrZDNySERpN0h3WjJJMzQzZDJHbkt5RWdLbktwZ2NjbUJVeXZB?=
 =?utf-8?B?Q05hMFJtZ1VhajhNSExoTXQ2dTdQOTk3NXdESTVjRFdVNXBDc3o4eWtXd0p4?=
 =?utf-8?B?ZzVEc0JpczRweUtIV0hUazdBSzQ4YlFSTit5VFA0UVNRL3hESk8zR1I2SXZU?=
 =?utf-8?B?WitZcXVyQUdpU2lqQTZhOFVHMzQ0eGVlaXJMbkV3MnRxNGRxcFN4UnY0bFdK?=
 =?utf-8?B?dEFXNTNmS3U4NmpuY0xnZHRoQUh1bUU2K1J3UDlFODRtdEtOM3QxajVqdkVm?=
 =?utf-8?B?MHRoQkNmQ0IrOXZiZnB1bXZRTXhxaFZSVUxUWFlGekhHWmVyS1BpTDg1NTk2?=
 =?utf-8?B?VVpJWGI4aWpWbzM5aTF2bXZoZGFWeUNBbTNqc0tkOG5NMmQ5dGJoNUVUM3JI?=
 =?utf-8?B?MlFwOTFQdnA1dTZpV2s3TUxKMzdvZnc1ckFGN1RwZUQvS25zc0dkUjV0b1B5?=
 =?utf-8?B?empleFViRUJrMHRhSVNjcmFNZUdwanFZQk80N1U2YjErQmxrRjdpUTJvaG4y?=
 =?utf-8?B?eThCcWR6U210SG1IbVA5ZjlINmhZZHFBek9SMWFoWFNzUHg5RjUxbUkvdHg2?=
 =?utf-8?B?SlNhbjE4RGUxOE1qcVpwMzFWN3diSVplTk1KaW5DYWw3dWR1R3N2SmMyYnRG?=
 =?utf-8?B?cThYSjZIN05tWXkxZG9ZS1lvN09ycGFma3g0TkdHWnhvK2xXbU1CNy9hdEQ2?=
 =?utf-8?B?MEV0c2tuNTRCeDR6aTNjOWZ1dG5QSEw0WlA1YXZPM3lFVjkzSkJaQXBBWW5R?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d29bed12-bdaf-4cb3-1d55-08dccb6db21f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 16:38:38.0703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZHFxZiuqenWCzowmADPfSiuc55r7jV/fv9ymlE0e3qYqrnyxs+35S8mzJeUWpQqesaIM4Ygm2tQgaZD83M8Cex1UFrZ0GSg2DxGW9B7SOTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9645

Add the tsd,mule-i2c-mux alongside with the amc6821 (tsd,mule) and isl1208
as a default device on the mux.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---

Notes:
    Merge after patches 1,2,3,4

 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index ccbe3a7a1d2c..72a0bca57385 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -10,6 +10,7 @@
 / {
 	aliases {
 		ethernet0 = &gmac;
+		i2c10 = &i2c10;
 		mmc0 = &sdhci;
 	};
 
@@ -378,14 +379,25 @@ &i2c7 {
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


