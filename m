Return-Path: <linux-i2c+bounces-4822-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C4192CC75
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 10:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE2872857E3
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B85885956;
	Wed, 10 Jul 2024 08:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="aHT4/sla"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2095.outbound.protection.outlook.com [40.107.21.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E2584E18;
	Wed, 10 Jul 2024 08:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720598692; cv=fail; b=Ew5DPowHUW7UfwoJYPFr2Tpb87hNXLHMbrrkIGqujtfA5gggqeCv6fNr110XwjJt7pI1mXHMo63BkVvsXAhziXdj/271S86cj0u21Cz4g9rvYdGEezFzHEc43Y0YuOefoUcWT2CsHy5AblHsTRguZgFJFUAQ9LRnEtYuSVN4Nzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720598692; c=relaxed/simple;
	bh=Ey8hW7gL9mk8jFigD7FIxZR47rnu1Q7NhRgd8mncwSc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AIvtBI3FnkNjHydr2KCGA3KN71HIVaeooDvrJPdKgRjaOuul53Zv+02yFS1U+cIWLy9VBcn9nUNHCO0q9H8D7HlFBjza2jtXqis4qxxj1bQr1S0iVaLOb5egDppAefVtD4mjrg7W179GlaTo6oL02XSPFgPQC4/92NjIZFMjErA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=aHT4/sla; arc=fail smtp.client-ip=40.107.21.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pkbr9xzeMipejY9GtwsrBZ9Ga8fEhazjlaCIjpTNR0tLQH6ahaHvrvysWV2fMK/2igtp9DpmwMY24HHuId41o+HEbvgc0ns1ORCNHjlhUIc0vYSAuazZhCpVByN1pFTF5ANgteDOC6TJDkk39AZuzAhnzaobU74COi7FCQ6SnYP2LNduXSXiucfpKP/42LU5DnzjtavBC3GweUs3frojHtU4wJneqvFEhaTcE0DH3hibUa2tTzjlHiKff7QvivHpeOBioWe5b6SCaT+S3l+5jDvHWkDAxRMevJftDQoyRMe3l3CTSGKISdEO9Jjr+8qziOkKHBN2vOmID6D9IVd03w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+aGhZcAKD/wqiRzSSR+IriIuo2dqX5/peteabKPxPI=;
 b=GKhVTg9y8MJ1op/dTWTArQ8e379prJKwxi6Ivibt4Aero+/ez8PSgyONictCnGD2p1o5Ownj7YMcslJ+ZdxV/Q+ndnyi/aSQRasUCRtckIS67YVNMPVBgAZcNK7rbWuHbrQcXe2XN0WX/EY3rjIXQCNRhqtx0CVXhKWMuleLMIcnWx4sxGuUQZuMLjGhj40uaOtTSUsLlS1Ds0viMmRJjeaRUobFlGyhyvzj00qBDrKQgbPOHiadUbX+9yqjxj9ateP8jE6HNnnre3cMAPKjMr8vFlqey2K+L5jw99mirufyoVVWyMCx3RW2FtrBV1Y3nGHskSzJElYJcbVNi+Aqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+aGhZcAKD/wqiRzSSR+IriIuo2dqX5/peteabKPxPI=;
 b=aHT4/slaQhJO8x3Islz9bBElTt9xcofbkqKI1+7jQSbqy9TzlRZ9YXSTboGoIAcXOzzMSrdbPzWjxY2HwF6eh2ukq6hxAFZyfmpCzm5JCEPGzG4bPq9nCiJAFzhRE48AE4152pAsqaxuEUmk5C5WylprXuXO6tVZ5jKNzoSdI1Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by PA4PR02MB6750.eurprd02.prod.outlook.com (2603:10a6:102:f9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Wed, 10 Jul
 2024 08:04:46 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%6]) with mapi id 15.20.7741.030; Wed, 10 Jul 2024
 08:04:46 +0000
Message-ID: <eb3014a5-3806-a094-24c9-e1343f9e3a25@axentia.se>
Date: Wed, 10 Jul 2024 10:04:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/3] i2c: mux: gpio: Add 'settle-time-us' property
Content-Language: sv-SE, en-US
To: Andi Shyti <andi.shyti@kernel.org>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter Korsgaard <peter.korsgaard@barco.com>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>
References: <20240617120818.81237-1-bastien.curutchet@bootlin.com>
 <oupp5mr6llnt43e6bbw2hbzlbru54wyqjxvfrwidfg6rojzdaj@v5ldbpldldpw>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <oupp5mr6llnt43e6bbw2hbzlbru54wyqjxvfrwidfg6rojzdaj@v5ldbpldldpw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0022.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::32) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|PA4PR02MB6750:EE_
X-MS-Office365-Filtering-Correlation-Id: 69d71b35-8c7b-4b42-275e-08dca0b6f6ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZERCQVRFc2c4T2hNYWl3aWRteGdKaFljb0MrZ1RYTVJobDFENWxtamYzVTEr?=
 =?utf-8?B?QzlDejA2MEEyS1lPbm5xNGcwMjFmRDlEWnhKUzB3bSttdWpUcERaMHhYMXEz?=
 =?utf-8?B?NXhFWkluLy9mSVc5bnp5b2dic2xLTHlqaXNiOHN0STlONEp0QlVpanEzK0tP?=
 =?utf-8?B?QVV2elNEcmFZNW9lR1JXdkM1ZitjOE10N0lLZ2hTOWFTMW9VbXd6OFJMNEcy?=
 =?utf-8?B?bys2ekpqTk1ORmRjL2s0WlhrdXBDUnFyYmtmbWx3Ykh0czllSFhwV2I2dVYz?=
 =?utf-8?B?bllsSndBb1RNSkpPeERRZ09VL0hqMkw5Ukc0SWhtNGJpRmRrYXRJR0ptRlZB?=
 =?utf-8?B?clNwa3dRTi9Ld0ZiQzBBRzNLWUdENWdrVWlqUjU5bGUzYWFLcENVUC9sVUtt?=
 =?utf-8?B?Vk51Ni81VldZZmFSL2dVdmlMeTF5SXltN2s3WHg5Q2Y0WlZDbVVPMGVEVDdT?=
 =?utf-8?B?L0FyQlRyTkpyYkdqVWU5Z1lFVjNpMTE4eWRRZk9WdHRCSHhJOGFmNE0wZ05l?=
 =?utf-8?B?OEF0cWpraWZPTmhoY2hKV2JYdlBOenVwUHNUSDdmaTUrdU1Gd3RtSGdHNUxE?=
 =?utf-8?B?MTBpWnFFNUt3eFR2dVp1YnBLeUZHa01qR0U0SnhoNUxJMWVIRFE2cVJnSnlr?=
 =?utf-8?B?aGd3VzRVaFdacnJHL0lnTkROUFViVUZVaDd1K3NnakdaOWwzY3dOSElTcWVB?=
 =?utf-8?B?TkprRmhJVXRycmdzS1lzMDhwenU3MlpCSkExa2U5Z3VoSll0blJkRXhHNXNs?=
 =?utf-8?B?VXdrd0QwK3A1dWcwdWpCTHlkcW0zbUxuQ3lLWUpkU0hPWHBTU0dzWnhsWkow?=
 =?utf-8?B?VmJGZitMa0ZtNURqaHh2UXFySDFVaEJOa29kYU9tNzRSZDJPSWFmK1hHR0pJ?=
 =?utf-8?B?R0FYNkJXQml6LzV0Z1Y0dGdSOHRybi9KL2Q0WTZoZ1pVQlA2dVBZSzBuLzRH?=
 =?utf-8?B?c1JQbHVVL2dwRHQ5N1F1bWJKcXpNcS9zdnR4UkV5V0F4ZzJoZ2wxZVJDZG55?=
 =?utf-8?B?QnpxQ0trTXhFRU5WZndGV3FiN0xjODlZdEFPYVFrZHFZRHI2SGRBRlNBc1Vz?=
 =?utf-8?B?dHhvN1dlY3NwaGtRaTgwa1c4ekk5K3hianFyMmp1UXFyb2xMNGhXcFlVMUtZ?=
 =?utf-8?B?NU0xY29KekNVZ3lmdDFsb1FmUkxOUkxTbmF5R1RwanIrZE5MTFE5dEg1Uy96?=
 =?utf-8?B?YW8vY0orTFJ1ZFVmZ1V1TFg2Mis5V3l1RkxydmpkMEU5S0d3aGN5UnlMcnNW?=
 =?utf-8?B?Z1duczRvbHYwN2xsK2FBOGJ6MHlEUFpGRnVQRlVMSmFNeW9XbTNVWFJzWFdn?=
 =?utf-8?B?eVZ3SlcySW52cjliUndKY0NuUW1wL1lDelVpb01va3lNcC81TlorTU01Zzl0?=
 =?utf-8?B?cFFsanZydG82TXZQV041ZkowbyswQ2NVNDM5Znc1M3ovQzJoQ1MrdVM2cm9i?=
 =?utf-8?B?dUVDbEdpMkxVY2NHVmY2RkpTWkwycmRwTlpxaDlPbGxIVlc5RXpLUHpRY0NS?=
 =?utf-8?B?ekdMRVFlaVQycjZwTTYwaWM2VnRRUVpvRHozZjFqMGQ1NExTM3dvUXhGSHJD?=
 =?utf-8?B?dWcrdzVWWHo5VkYvbFRwVk1iS2Q4dnFEM29iZE9rYkh1bnNYU3ZPWU12M2RU?=
 =?utf-8?B?VlowNHc1KzZiT200OGV0WmdndVltQkxlVHpaSzNieHpSYitrcVA2MVpqWElL?=
 =?utf-8?B?WDdXV2VjZlA1aDFHMFM4cWxpbzFCcnJCdGpFbjFya2FLaHNUdGZGMStuTkg5?=
 =?utf-8?B?TTdVR01kR2RHZXhLaXd3Z0hJTFMyY29velk3aHRvOHAyR1o5cVhuVHBJSEhC?=
 =?utf-8?B?UVVxazU4TXdRRzYySlhvdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWhGcm1FSnVrMnh4Q21FTGEwVHBybmZ0N08xcXBKMkpGUER1WGV1cTFkMjN2?=
 =?utf-8?B?TFNZZnhjQ0xqRHNLMmdKazdielVqNEk5UElYS3ZMZGhMdEhJV1RZVEhraEty?=
 =?utf-8?B?TVlaSEJ2bm02QjNkR3BiUHFnSG81V1BFbVlsNUFhWWFNTVFDdHNPL1JnWSt0?=
 =?utf-8?B?SHBzWGJoaWRLbEN0VzFJSlpZTXhsc3dMNk5wOG9pNHkzVFdsNHc2VkRDMVh3?=
 =?utf-8?B?bm5OMXZXb1A3MUkvZWNySmRkempJQUx6cWh3M1JOWVNxQm4wRWQ3ZHBub3BF?=
 =?utf-8?B?Z29Nc21UTys3dHAxVXZTYUdrUDdjZnJ0QUdYUWJrTUFUSmtTZUhYelUvbk1a?=
 =?utf-8?B?RTdEcXg1SGdrbDMwMVl6eDByVGhDQW14L1RDOFZjWENLcFpEQzZUTzB2Mnk5?=
 =?utf-8?B?cjFmUHcyWmVOUi8xNWhiUENva2htY3VkOE5nVFpvNkJWZXhnZXQzaEtGeVFV?=
 =?utf-8?B?bTVvNkxNb3RQdWd6NDVqZyt1NExGVUpCQ21samRCTzZVTE1lQ1Jxek9nNStD?=
 =?utf-8?B?ZmxRS09MTmJhMURRcFd3NFE1U25Cb21aTnhMeFJJaW9hcUxIc3c0cHF4Q1Jp?=
 =?utf-8?B?SHdTQXF2NisvRC8rL1RPZytzNmFBOWNlaUowdnFhRG54UjJJdkpRbThhazVi?=
 =?utf-8?B?aGRRQm4wbW95Z1MwN1JYeVRwSWVEK09NNmpQUjlWay9TamdMTzJGdWNUS3BO?=
 =?utf-8?B?dlc0aE9wZElLRWxFQ1F1bjRycUVTM0wrRHFzOGZ2QzNzdFV5NjYybUsrSUlp?=
 =?utf-8?B?NCtSdEl2VVJHRGxBV3JsVUdzUUt4Z0FWbEJBZG13cmp1ODRRNWJ4bXp6dGg3?=
 =?utf-8?B?ZHltMDNGcnE0N1ozbUhhK1lwSWNIdXkyRVoxUTRoVTEyY1V6RzZremlNSnlL?=
 =?utf-8?B?R2krdzllN0wyWHgwUGNUZitCdW90bThZNXlMWFNmS0FaZi9TRkJYZlZmSURx?=
 =?utf-8?B?Wjl5dU1XUCt2dlQyNXNJYXBjMU8vbllud3lwMXhhaXJ6TzIra1JHTG9KTXFQ?=
 =?utf-8?B?R0h4OVJwZlJkTHdKRnNOM1FHUGtQRkt3OXNkRlV5d1VFOEkyNTQ0LzR6N3pE?=
 =?utf-8?B?QnhPSGpFazVJVzRXQlJLU0xYUFR3MVpFcmU5WlhCOU04ZVVLNVFHeXdSalRC?=
 =?utf-8?B?MWxVRUp3UUVGU2phZ3ZKMUY3NHNOVzBpdytHMGF6WFJGZHQ1NzFTaGpTcHMx?=
 =?utf-8?B?UU56em5WUkpmdC82ODdCdmpzNVRnV0kzVDRmVUtkVVBpREFPMmxWT3lYZjBY?=
 =?utf-8?B?UFpoMnpRK0lDeStld3AxWGhIV1IzSU14TGcyTDE5cW1CdGVrbmVkVE1BL0lo?=
 =?utf-8?B?dlVOZ0tRdWgzQTkrbFE1N2hvektLVEJMb1dTZXFwRkxmejB1eUVsZE9GbEEz?=
 =?utf-8?B?RFpFVjdPeDVHVlc4ZXYwTkxWejdYNXRyOUsvQmErR1BnT1pJL3REVUlaazlz?=
 =?utf-8?B?QzVmMVFKQmxuenVMR01iZ2xTa0F5NEpVcXNQWldJU3V3dWEwTDFPdUF2Vmsr?=
 =?utf-8?B?b0FxdEt6M2dPNlF5MjFrRTdnNUsxay82SzRFWnNjY0NHZm1VUDhodFpzazBS?=
 =?utf-8?B?U1N1T3hoSDN6Z2g5L2JIcTkxT2J3SUVvdlEya3dzWCtJYXNpYnRrZzRoU0tU?=
 =?utf-8?B?ZVR3OWFLNHhZcFJUc0FZN2dSNzcySDdjL2NQTVJjQ0ViQSthdHhOdVU5TDI5?=
 =?utf-8?B?Z0ptY21BWDVpQVBFQWZzUFF5Ukdmaml6SUc5MjlJY1IvNjAwTE51U0ZmQWtk?=
 =?utf-8?B?MVpBYzZTclhIaHZCU29ZcUdNVDJ6WEVLRVpQV2xCU3Y4SVNsYnduaFVIV0I1?=
 =?utf-8?B?b05ueG53UDYwdGQ0YXBRM0VlS1AyRjN6WjVqRTVzVTV1TGpGWTE2YUU5K3VE?=
 =?utf-8?B?YWk3RmJJckl3c1AzU2JuNm84ZVlEVFFGZ2M3RnJJQ3dvcjk2TEtiUjdxbTNR?=
 =?utf-8?B?NGpYTklySjVIb3hJb1hnY24vK2JXVi9ad0RMa0JSak5PTFhLQUFXTFNlZ3Iw?=
 =?utf-8?B?VWNqOGQ1VVNxOHcrZlBLMmF5d0FXMlpjVEhWZWhRSDBldzd2NnkvMS8wMUZP?=
 =?utf-8?B?L2lrVnJkOHNpcG9kd3l5dW40eHFFY1pTTW5QT0t0L09LWFIycjRQbFFaYWNy?=
 =?utf-8?Q?8ss0=3D?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d71b35-8c7b-4b42-275e-08dca0b6f6ae
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 08:04:46.4064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DkeG8WV6I7kq6id3dFFYmCSYhdFqJH+5kSr2jLL9cY7V5kr1vRijxeJ9PHzezQzY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6750

Hi Andi!

2024-07-09 at 23:45, Andi Shyti wrote:
> Hi Peter,
> 
> any thoughts on this. Do you want me to go ahead and pick this

Looks mighty fine to me, please pick it up. And sorry to all for
being unresponsive.

Cheers,
Peter

