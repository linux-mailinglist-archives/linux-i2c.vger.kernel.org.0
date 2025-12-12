Return-Path: <linux-i2c+bounces-14521-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BACCB94E0
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 17:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A700130342E2
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 16:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949532D3EDE;
	Fri, 12 Dec 2025 16:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b="VljxvE45"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022124.outbound.protection.outlook.com [40.107.75.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC572D24A9;
	Fri, 12 Dec 2025 16:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765557714; cv=fail; b=T2+bkRaZib0Nrm9JUN2fckPCqVQVUtucmlfoNyRbAiEflG37bJxdDcB9DV4Z3J60nNM5AfcjuKN6QImZjaSvOgmhPckEW8yc/+74uvMR4B9mBMrFnhZse7mGByN5QbdVk7V4iyK/jlVH6iDExjIK5w7hWldAdWMNYEOzeSn7P94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765557714; c=relaxed/simple;
	bh=Dj3/rfHcj1zxsAAwNGEPn3FYt0XHU4vJvn4M7ol/Uik=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=REbLFGkKiUbCjt04aoW1QsQtzZbbr09HlMTy6OENImimJ24xp9XRs6TzI1tmCgIVK0AYfMdvOWZjMEm1UNiF0IJo1psOrvGF5Uy01gxY1RRhvbMNx1oh/9BSUJdk/zbzI4lJpvM8dH/nobisKLgtz2jtI3Tj+sTk9UL3egYo+Ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com; spf=pass smtp.mailfrom=advantech.de; dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b=VljxvE45; arc=fail smtp.client-ip=40.107.75.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=advantech.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iU3VHyZC/+4WPj9RIWoLXzdECUGfXcy3fNedqobpjeQxm1taqg/YOu4K7qBoeRQ0doVy1ykZoqIiuesikZ+UDNEcnOjH3AtUQCIzrUJcoykiae/sKD/ZXzqZMUx+cSaoLg9IUgLufjRJG6nWgkfzx+vB/N9APkdnzBRs1lH++Nir254PLBxjts/2rsLVtPhaIfnWX8BIzm37vlhdDmPG71//1IP/8RlPchsGt+BnvQVU5xD2ZwxzUmSn3FFgl062f2PBqN0XAMR0gFHargPsrrx2cYNCKC3b1JqnsFpUYSynIH+wx18viCVxk4eZ/p72UG2on7shmLifQoQnO5n93Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vCb2lfUdk7mogpvo75ax/bbGc2r6I6ltkhvum7E7o4=;
 b=tpb857hBIZqCvbmEPZd/h8TnucY6Y0f/d4eFrkAwgQC/eCvjkXMzcoTHEboLU5G4QmP7O3DSL6MxHaNY699IwzLOKLye4G6bp5mL68esR+1sNCRH+w5e6FhUNK19aOFZh/wAMd+yREMyzia/sYErCpTURNzzKw4B2NjOfO5a1JUk13qjEjzOja1Bg5gDfW6lZWJRGjaJrlMiEnpq5oCNN0jpDpJ0XxoTL/QLpcPOT+HsTu6KWBMU/xsiJE8MUj74qo9ZRmEZSPlVT4npVzHShVB8AIXUS/1YbaRTp0GMNJ2Oamg6worfIvFb+/wEqoO+CumqosckNSnEYd9viG9SWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.de; dmarc=pass action=none header.from=advantech.com;
 dkim=pass header.d=advantech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vCb2lfUdk7mogpvo75ax/bbGc2r6I6ltkhvum7E7o4=;
 b=VljxvE45cE5GlIZ8PHhUmfM298Xmo4tWUQPBbb+jHzi+rbCw+RV6K6dSmdjYXKo8kMha6S/R465k28ciu5RHtthm5NGPIOnc5RrkQhjAHSyAD4vp4tMurleC16j3udXw/JA+PC6yvGQaAWaciw8HnwVzTzbEny/ieY2aBsEKiCJ5C0UZtgkPMPwUH2b+KfEb7Gs4FWVwhwBZgo0l8dy3QrBaiAzN6CGnP6bU5gPBsP8vWj6EaArIOFvcouINhu0VfUiBshOEbAr+g7ohyRi1L6kKWlduULZqY7AvA3EyVI3aMccTgl8n+cdhzH+bxMV9aI9v3ULI9x2wJJ013aep7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.com;
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com (2603:1096:301:21::6)
 by JH0PR02MB6564.apcprd02.prod.outlook.com (2603:1096:990:3f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 16:41:47 +0000
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::59c9:fe0:25f6:702b]) by PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::59c9:fe0:25f6:702b%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:41:47 +0000
From: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Date: Fri, 12 Dec 2025 17:40:56 +0100
Subject: [PATCH 5/8] Add Advantech EIO Backlight driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-upstream-v1-v1-5-d50d40ec8d8a@advantech.com>
References: <20251212-upstream-v1-v1-0-d50d40ec8d8a@advantech.com>
In-Reply-To: <20251212-upstream-v1-v1-0-d50d40ec8d8a@advantech.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Andi Shyti <andi.shyti@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, 
 Wenkai Chung <wenkai.chung@advantech.com.tw>, 
 Francisco Aragon-Trivino <francisco.aragon-trivino@advantech.com>, 
 Hongzhi Wang <hongzhi.wang@advantech.com>, 
 Mikhail Tsukerman <mikhail.tsukerman@advantech.com>, 
 Thomas Kastner <thomas.kastner@advantech.com>, 
 Ramiro Oliveira <ramiro.oliveira@advantech.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8980;
 i=ramiro.oliveira@advantech.com; h=from:subject:message-id;
 bh=Dj3/rfHcj1zxsAAwNGEPn3FYt0XHU4vJvn4M7ol/Uik=;
 b=owEB7QES/pANAwAKAc7t0Ke8vbAJAcsmYgBpPEWhGTwBrjZtOW+Qsh43S9Lq/HZ0OQi6De16n
 uBGJs2zFaiJAbMEAAEKAB0WIQS1Nkng0ZvJmBKh6GLO7dCnvL2wCQUCaTxFoQAKCRDO7dCnvL2w
 CbG6C/96VDoxbBFNeZbXYetFgcNCq70/61FezIYfJ9kZ9OH7XfgZ69pdqd5Obf7880/qdai7byE
 1tJtSeDHJ7JlTvTF8+PIynGssBva+e3utPDKsrMW0MyHK8ShSMefD6H4v4Bb/kgQH755VAxDvZ9
 yA7M5448EY5mZv6dhZQ0anvyubaVtNK1RLCZZz2pTCLEbOaVXP1TwLRSAXhcWy1suQLDAEiIYqC
 +wqQ3uu1lGOj2rkD5EIxxhL1Jt9Y2X09V5C3YTz6bOXa/yYC2mH/Ao++/EUThNQ5tmxEr99/hKa
 uOrCRNufqkNoh3Pnz2wI+NpO933NjG28Fv2EsWUg4M9joTGz8oaR4dWoL26qpRuiV5f6174iqid
 IR56KO0BymZAJH+ZH+lkLpxpz5ZArGMILNPpHrEd1JE8oubwklC7n5FOFoXUR8CRQTXPx/LKPeZ
 6iQCFahmE44eU3l4nHvK6W8YnPOos23c+KW7dC92yjAgeD7CPXXFKBNOVxsPfzd+tJjHs=
X-Developer-Key: i=ramiro.oliveira@advantech.com; a=openpgp;
 fpr=B53649E0D19BC99812A1E862CEEDD0A7BCBDB009
X-ClientProxiedBy: FR4P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::12) To PSAPR02MB4502.apcprd02.prod.outlook.com
 (2603:1096:301:21::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4502:EE_|JH0PR02MB6564:EE_
X-MS-Office365-Filtering-Correlation-Id: 329d28f7-fc78-4ddc-dd32-08de399d57ad
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGp2cW9wWjYrRGtJaDRRaHJxd3lPcU83cXdRVGt3YmduTDVNd04ydnN2bDNm?=
 =?utf-8?B?UTE5V1EvS1ZhWVRsZzQ0TkI0N3FsOHZBWXJCV0FkL2RuOVFoMms0SFVoSkRX?=
 =?utf-8?B?cVVtaXphMXN1bXFPSzFob3JHZE1WYXo3OEhqWFpwZXdLbmlQaEVYaUFsSTV5?=
 =?utf-8?B?aFRQdXcyWTRHS3Q5QmpkWlQwcGFYWWxxUHZzbHRXQ3BrODlMZXlHSGFlenli?=
 =?utf-8?B?dGhYT0E2bW10UHBiTHJPbkNtSnZWVit1MlhZTWFvUmd4WHo3bjFQWEtGKzQy?=
 =?utf-8?B?NXJHVzVraUJiZ3NMeGFTcG1IazB5NHRoQXZxVjZRUzBIdmo2NjVHZExxbm5h?=
 =?utf-8?B?dm9YbDJjRVpLU3YxMmVrdlNHZnR6UWJibHdodXFlYlpqVFY3VmZzSXR3cTd1?=
 =?utf-8?B?MmVIbDVMY0RZOEpIaFNzNmNZaTR0R3RqTHQyc2lUdHJ0ckw5ZHgzQU8vNitk?=
 =?utf-8?B?K0xicnlvanV1ZUxqM2g2UzdaL0g1TE9sWU5iejdqS0NnQUFmUkZJR1UzT0xP?=
 =?utf-8?B?cTd5N2FIOUR0ZGpiNVhTZE00Q0tGWERoVDRsNTlNUVVucjBTYzc2bG1lc0tV?=
 =?utf-8?B?cG03UjFNelg2YUY1b0hBUUFTcTBHVGlFcHg0dTJGeDFnQWRreXNqQVlIWUVn?=
 =?utf-8?B?SE1qak1paHVPZFpZU3RNUGp0WEVtMC9MWUVFKzZqTmZKTnB3MkZ6UlVFdTcw?=
 =?utf-8?B?MVZVTlQ3V3pOOUNRWVVRcUcyd0wwZEs2dXZWSFdsUm1hMWx3aXYwQzh2NVl6?=
 =?utf-8?B?ZjVIM1F6RGVUQVNicCtuTkdOaUUxdkVyWTI5VmlXRmVINXVUbFRZNHh6bUpZ?=
 =?utf-8?B?Rm9pVkd0UVNvWkVhU21oblVqSjN3cTJNcWx2amM1WmRtelQ3VUR4TUFuTWY4?=
 =?utf-8?B?QlFOUkVTV2NJS3hpL1dlY2RrZDVCQm1yZkI1Rk9SdXlTUlVGV0g5c2EwakNM?=
 =?utf-8?B?ejRqVWVEek9HMDRnRFVycXJ5ZHMyU1QvaE1nTm4zZEVhSVpzbyt2T2k0dlpP?=
 =?utf-8?B?a29RMDFQV1IrZmJpUGNkRFNPVGtGdG11ZlJ4eUl0a1d6VmdQcEV1eUE1VmI0?=
 =?utf-8?B?SUtqTkdtS3JEV2RNVzkyRGhDU1A0aGFYSkY4d1YvR084bzNMU0RqK2RWbStI?=
 =?utf-8?B?YUpYaURiU3ZZdWNWV2U2ZkZHVklHeWVOcGdaM05pOXA4WmhDR3Y1c3FUb1JW?=
 =?utf-8?B?dC9sVFF3WlhUTXlTMXRldDVCVlZWN1dpT25wQ2orVzB6NUFQMGJMTndlMG9P?=
 =?utf-8?B?blVMOXBvckFuQUtrU2tqaEhRVmFMRnhNd3lNNTgzR0FSUWRsdWxoalAvRHhL?=
 =?utf-8?B?d2czS2o1akZpL3dBNlI3ZlJkc1BMZk5mR0NVQkNwM1d3RlduQUMxb0VGdmwv?=
 =?utf-8?B?ci9EYkdORmpXb1RSZUNGOG1qem0vSE1Id3dNSFhVamJtU3J0UVNQbjdiNEZs?=
 =?utf-8?B?cmhqM2d2UXkvMzhMN29kais3Z2lyOUNMS1MxTmpBVXRJbTdRTnhabkVMUG45?=
 =?utf-8?B?MWVWak8zc2tsb3dpK3NiUHNGTStudTl2cFcwTjc5YWNwVnVxYmZsMVowS1lU?=
 =?utf-8?B?VjlndHpQUXhWSm9Ya09Ma09RdlRGYWI1SXVtTnJyYkFrUFNmcU1Ia0QrWFA3?=
 =?utf-8?B?UVBDK2JsVEFWeTkrNGI0bnZLdndRZXNIVWN5ODk5VW9GQXUrQ3hsUG1LT1ZT?=
 =?utf-8?B?NnYvMllPa0xVT1lrQ0txWkJodHplMWc5aWMyVWdwNVdtNGdoMys2Q2hmRGU5?=
 =?utf-8?B?R3FaS29hU3BFMGdqNlIxVUs3RzdIbkVZUDBqMGxaMW5seTBhMWdRNUdrZ1lx?=
 =?utf-8?B?dDJGQURyVUV1WmVnVUVQTm9WVTlPWkFZUjFQSGVPSjlGRjg0TGdTQk5ibkRm?=
 =?utf-8?B?WFZVUVpYL2NzMEk2TkRFMFFvWWZRN0hSWmRmbk5GQWM3ZjRZTVY3MFdIR0xU?=
 =?utf-8?B?YkVaVFI5TUxmbTNzd1FocEd2a21EVEhrNVIyZXhaTWw0T2JHTnEyLytEb3py?=
 =?utf-8?B?K2dTMDBXYmYvNG9xZVhUQWYydStvMzhKZXB6TDVJRVFwRG5pUzBtUlJXVmw0?=
 =?utf-8?B?aHE4T2JtSDNpUGRpeXhGKzdiMXV5dWV6RnljQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR02MB4502.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmJJckZXWUFFYkMzaTBlaFJjY3U1aEI5SnVhdmE5aHVqMjNPOVMzU2loNlZj?=
 =?utf-8?B?WmlReExveVpWQW1xVE1SeGZOajVFTmZrZ2dPM1hBeFdkdEF0ZWdGQkhZa3NZ?=
 =?utf-8?B?V0orMEdmTUVKV2YrTHk5MGhOa29iamtGQ003WTBmOVJrV2F5dnJIVWx3UWl3?=
 =?utf-8?B?eGlqVmJVMjM3cFkrVnh4VzlqQy9kNGUvVElzVHkxYlJ2YXVKbitZT0ZrWks5?=
 =?utf-8?B?alBTUVVWSEpOOWlVZUVwT0R1SXZBZnFWUVAyMDdxMTFoaU1peFNvUFRxanAr?=
 =?utf-8?B?dVdiWXdnRWt5Q1hmNVVHU3FINFF2NmhBdkxOdTJOQXFYWTYwZUUxSDFmZ2RE?=
 =?utf-8?B?dS9wM25Lcm9Yb0FDRmFtMW5mOXZJZHE4YkNRcDBTZTRickdLUGxlRFlxYnJa?=
 =?utf-8?B?TkU1ME9FMDA0RmYwSitITWJzK0hMeDh3VUlrM2NQY2RHeDZOcGZIRS9NQXlr?=
 =?utf-8?B?b0pMUFRERjRjMkFtWk11QVJEU0l1Y1pxTjlEZXBrRHh1cFBweFlZNExHYkNS?=
 =?utf-8?B?clJnbmgzTTlPUzhPU0hjREIrc2ZyT2NKS09CM1BjbmFuRnQzcmN3azU0d3Y4?=
 =?utf-8?B?TlEwV013LzlKSVJISFlXcVVVUjBnMkR6MUl4UTlJSUoyeU9VQlluZExMdUNL?=
 =?utf-8?B?MllFV2NvMUQrc1E5ZUZ1UWR0SmdrSjh3Q2d6L3A0T0RkbnVUTnVMbFlKZkYr?=
 =?utf-8?B?Tk5QaFVSd25pZW9EbmIrS0piTnFJR0xraCtaVHZCQndpZVBHdCs0Q1ZlK01a?=
 =?utf-8?B?bEw2eXZyM0RVbnpkWTM3RFpSS1BTQVhqcTM1VTBGNzZ4VkxFajRVTWEybUVK?=
 =?utf-8?B?NndFcHhsYnRpeDRtOTV0Ryt4NGlrRm5HeUJ2SUVlVTFSdmxON2xMbndOWm9L?=
 =?utf-8?B?MHVxM0ZHT3MzT3B0OGtEY2hHcjlYaUxTQk92TEg2cUlkeDZ4UytucVFuRjNy?=
 =?utf-8?B?YUJuM2MzYzFtUGxUaTg3cDdyNGIydUt1RDdLZEkxSVpnWTBmdW9IRHRWa2lt?=
 =?utf-8?B?TUFmRXUra0VPNWZPRUdWREVFTStjd0Z3RW01K2FONkdGWlBBZG1PY2prWTAr?=
 =?utf-8?B?aDJIZmtCeXJFdEV0Q2FHOE5hTzJBdkFvRllnV0RBdFI5NHJ3WldQUko5dXov?=
 =?utf-8?B?SVY4OWEvcjdGRDduRDIyNVZNMzVaL1RwWmFhelMwK3E1bmpZcHduWjZnRkpa?=
 =?utf-8?B?UUN3UmNTY1Y4cEZjRWZWZjJXVnAydE9FWkFuWEdHckxnazQvU0lFb3NnbHBK?=
 =?utf-8?B?Rm1zVmlsUFM5eEJlSDdncWNqdVJ3eG4xeHRVSS9uYnk5cWk5THVHQjk0MFBW?=
 =?utf-8?B?RFVZVnVwU3BVc1NwODgyQ2ZBSjZEODZIV013Qm9sTTB0aEh0MUpucWpGYzBa?=
 =?utf-8?B?d2NTcEZVYVpla3hvRm9naVhTZlBRU3JGcE9FN2pYbWZRR2c0L2I3QnJHRUIx?=
 =?utf-8?B?M2R6MEMvSm12RmZDZXAxcWtWQ3NWdmw1VlI1akdaTmRoZGFTdnVLY0dGVGFY?=
 =?utf-8?B?Tm5Cd0FhUmJLZW8zWmFVajZhRHhKN3pDYzNFcTI3RDBac011TGwrSGVqSzRJ?=
 =?utf-8?B?WHVabVhieDlzYkVBZFFpKzQwSnkwbWZ0VjlzOWZBVGs1SEp1VnEzc3VTRDFq?=
 =?utf-8?B?OGFIYjMvTDFYaUduVWJtQnhac0NISjlqeEgwcDlHaVhnSWtiajY1ZVZGbmE2?=
 =?utf-8?B?RFlldTJsM0xVcHFQdkV1eTBUN2JCY2VpR3ErNnBpeWJpdlIrNDF1V0FjTkpp?=
 =?utf-8?B?TlhWMHROZFk1ajRLRzhoTGcrZEVCR1kwdWd1LzNNalh0R0s3SFNZazZUSTVP?=
 =?utf-8?B?MDJCbndvdWZtcnlOaGpXTGowSlpJcHVxaUtxSW11aWFsbXFISmJseHlMS1Yv?=
 =?utf-8?B?Tm8wMHplK3BQOEFGbS9Za2Z4MDF0Yk9NMiszQnFOSVAwS1ZJSVV3QUROVHVF?=
 =?utf-8?B?M2szQjZRU2YxblpFSklBc0NyV2V2OTJUTFBUc2FiamhiVjdrTzc2SnpCZlB3?=
 =?utf-8?B?WStHNnRSUzF4Zm9USVZFWTVnY1BLbnlGeWwzMTUyY3B1R21tenNjUWtYWlVJ?=
 =?utf-8?B?Y3p0QmgyN0x4RzN4Y3doTnhDNVlIeEo2RTdqd3FkUVNNSVd2dnp6N1phK29U?=
 =?utf-8?B?d0d2RGN4ZXFrK21jMzVXNkxCWTdnc2piMDE4YU5HNjE0UFhlTEVSUnF1ZThW?=
 =?utf-8?Q?lKGxVav7SNM4Mbi9Vh8JcvI=3D?=
X-OriginatorOrg: advantech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 329d28f7-fc78-4ddc-dd32-08de399d57ad
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4502.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:41:47.8085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+Ds3j5tNjwZPsAkAxl8xEkUxRAUpO0g/DQ445k0CAZlcVWQMV8HG+nUOZm1e1CIAbAlkFYYQ3Bv/Ed3GiY2UebnL14hqcWivRtUY1G2+gY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB6564

This driver controls the Video Backlight block of the Advantech EIO chip.

Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>
---
 MAINTAINERS                      |   1 +
 drivers/video/backlight/Kconfig  |   6 +
 drivers/video/backlight/Makefile |   1 +
 drivers/video/backlight/eio_bl.c | 268 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 276 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index be9d3c4e1ce1..df4b4cc31257 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -623,6 +623,7 @@ F:	drivers/gpio/gpio-eio.c
 F:	drivers/hwmon/eio-hwmon.c
 F:	drivers/i2c/busses/i2c-eio.c
 F:	drivers/mfd/eio_core.c
+F:	drivers/video/backlight/eio_bl.c
 F:	include/linux/mfd/eio.h
 
 ADXL313 THREE-AXIS DIGITAL ACCELEROMETER DRIVER
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index a1422ddd1c22..ddd3d6922553 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -496,6 +496,12 @@ config BACKLIGHT_RAVE_SP
 	help
 	  Support for backlight control on RAVE SP device.
 
+config BACKLIGHT_EIO
+	tristate "Advantech EIO Backlight"
+	depends on MFD_EIO && BACKLIGHT_CLASS_DEVICE
+	help
+	  Backlight driver for Advantech EIO.
+
 config BACKLIGHT_LED
 	tristate "Generic LED based Backlight Driver"
 	depends on LEDS_CLASS && OF
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index a5d62b018102..4601b644b6d4 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
 obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
 obj-$(CONFIG_BACKLIGHT_DA903X)		+= da903x_bl.o
 obj-$(CONFIG_BACKLIGHT_DA9052)		+= da9052_bl.o
+obj-$(CONFIG_BACKLIGHT_EIO)		+= eio_bl.o
 obj-$(CONFIG_BACKLIGHT_EP93XX)		+= ep93xx_bl.o
 obj-$(CONFIG_BACKLIGHT_GPIO)		+= gpio_backlight.o
 obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
diff --git a/drivers/video/backlight/eio_bl.c b/drivers/video/backlight/eio_bl.c
new file mode 100644
index 000000000000..2b9fd4d48d30
--- /dev/null
+++ b/drivers/video/backlight/eio_bl.c
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Backlight driver for Advantech EIO Embedded controller.
+ *
+ * Copyright (C) 2025 Advantech Corporation. All rights reserved.
+ */
+
+#include <linux/backlight.h>
+#include <linux/errno.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/eio.h>
+#include <linux/module.h>
+#include <linux/uaccess.h>
+
+#define PMC_BL_WRITE		0x20
+#define PMC_BL_READ		0x21
+
+#define BL_CTRL_STATUS		0x00
+#define BL_CTRL_ENABLE		0x12
+#define BL_CTRL_ENABLE_INVERT	0x13
+#define BL_CTRL_DUTY		0x14
+#define BL_CTRL_INVERT		0x15
+#define BL_CTRL_FREQ		0x16
+
+#define BL_MAX			2
+
+#define BL_STATUS_AVAIL		0x01
+#define BL_ENABLE_OFF		0x00
+#define BL_ENABLE_ON		0x01
+#define BL_ENABLE_AUTO		BIT(1)
+
+#define USE_DEFAULT		-1
+#define THERMAL_MAX		100
+
+#define BL_AVAIL		BIT(0)
+#define BL_PWM_DC		BIT(1)
+#define BL_PWM_SRC		BIT(2)
+#define BL_BRI_INVERT		BIT(3)
+#define BL_ENABLE_PIN_SUPP	BIT(4)
+#define BL_POWER_INVERT		BIT(5)
+#define BL_ENABLE_PIN_EN	BIT(6)
+#define BL_FIRMWARE_ERROR	BIT(7)
+
+static uint bri_freq = USE_DEFAULT;
+module_param(bri_freq, uint, 0444);
+MODULE_PARM_DESC(bri_freq, "Setup backlight PWM frequency.\n");
+
+static int bri_invert = USE_DEFAULT;
+module_param(bri_invert, int, 0444);
+MODULE_PARM_DESC(bri_invert, "Setup backlight PWM polarity.\n");
+
+static int bl_power_invert = USE_DEFAULT;
+module_param(bl_power_invert, int, 0444);
+MODULE_PARM_DESC(bl_power_invert, "Setup backlight enable pin polarity.\n");
+
+static int timeout;
+module_param(timeout, int, 0444);
+MODULE_PARM_DESC(timeout, "Set PMC command timeout value.\n");
+
+struct eio_bl_dev {
+	struct device *mfd;
+	u8 id;
+	u8 max;
+};
+
+static int pmc_write(struct device *mfd, u8 ctrl, u8 dev_id, void *data)
+{
+	struct pmc_op op = {
+		.cmd       = PMC_BL_WRITE,
+		.control   = ctrl,
+		.device_id = dev_id,
+		.payload   = (u8 *)data,
+		.size      = (ctrl == BL_CTRL_FREQ) ? 4 : 1,
+		.timeout   = timeout,
+	};
+
+	return eio_core_pmc_operation(mfd, &op);
+}
+
+static int pmc_read(struct device *mfd, u8 ctrl, u8 dev_id, void *data)
+{
+	struct pmc_op op = {
+		.cmd       = PMC_BL_READ,
+		.control   = ctrl,
+		.device_id = dev_id,
+		.payload   = (u8 *)data,
+		.size      = (ctrl == BL_CTRL_FREQ) ? 4 : 1,
+		.timeout   = timeout,
+	};
+
+	return eio_core_pmc_operation(mfd, &op);
+}
+
+static int bl_update_status(struct backlight_device *bl)
+{
+	struct eio_bl_dev *eio_bl = bl_get_data(bl);
+	u32 max  = bl->props.max_brightness;
+	u8 duty = clamp_val(bl->props.brightness, 0, max);
+	u8 sw = bl->props.power == BACKLIGHT_POWER_OFF;
+	int ret;
+
+	/* Setup PWM duty */
+	ret = pmc_write(eio_bl->mfd, BL_CTRL_DUTY, eio_bl->id, &duty);
+	if (ret)
+		return ret;
+
+	/* Setup backlight enable pin */
+	return pmc_write(eio_bl->mfd, BL_CTRL_ENABLE, eio_bl->id, &sw);
+}
+
+static int bl_get_brightness(struct backlight_device *bl)
+{
+	struct eio_bl_dev *eio_bl = bl_get_data(bl);
+	u8 duty = 0;
+	int ret;
+
+	ret = pmc_read(eio_bl->mfd, BL_CTRL_DUTY, eio_bl->id, &duty);
+
+	if (ret)
+		return ret;
+
+	return duty;
+}
+
+static const struct backlight_ops bl_ops = {
+	.get_brightness = bl_get_brightness,
+	.update_status	= bl_update_status,
+	.options	= BL_CORE_SUSPENDRESUME,
+};
+
+static int bl_init(struct device *dev, int id,
+		   struct backlight_properties *props)
+{
+	int ret;
+	u8 enabled = 0;
+	u8 status = 0;
+
+	/* Check EC-supported backlight */
+	ret = pmc_read(dev, BL_CTRL_STATUS, id, &status);
+	if (ret)
+		return ret;
+
+	if (!(status & BL_STATUS_AVAIL)) {
+		dev_dbg(dev, "eio_bl%d hardware report disabled.\n", id);
+		return -ENXIO;
+	}
+
+	ret = pmc_read(dev, BL_CTRL_DUTY, id, &props->brightness);
+	if (ret)
+		return ret;
+
+	/* Invert PWM */
+	dev_dbg(dev, "bri_invert=%d\n", bri_invert);
+	if (bri_invert > USE_DEFAULT) {
+		ret = pmc_write(dev, BL_CTRL_INVERT, id, &bri_invert);
+		if (ret)
+			return ret;
+	}
+
+	bri_invert = 0;
+	ret = pmc_read(dev, BL_CTRL_INVERT, id, &bri_invert);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "bri_freq=%u\n", bri_freq);
+	if (bri_freq != USE_DEFAULT) {
+		ret = pmc_write(dev, BL_CTRL_FREQ, id, &bri_freq);
+		if (ret)
+			return ret;
+	}
+
+	ret = pmc_read(dev, BL_CTRL_FREQ, id, &bri_freq);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "bl_power_invert=%d\n", bl_power_invert);
+	if (bl_power_invert >= USE_DEFAULT) {
+		ret = pmc_write(dev, BL_CTRL_ENABLE_INVERT, id, &bl_power_invert);
+		if (ret)
+			return ret;
+	}
+
+	bl_power_invert = 0;
+	ret = pmc_read(dev, BL_CTRL_ENABLE_INVERT, id, &bl_power_invert);
+	if (ret)
+		return ret;
+
+	/* Read power state */
+	ret = pmc_read(dev, BL_CTRL_ENABLE, id, &enabled);
+	if (ret)
+		return ret;
+
+	props->power = enabled ? BACKLIGHT_POWER_OFF : BACKLIGHT_POWER_ON;
+
+	return 0;
+}
+
+static int bl_probe(struct platform_device *pdev)
+{
+	u8 id;
+	struct device *dev = &pdev->dev;
+	struct eio_dev *eio_dev = dev_get_drvdata(dev->parent);
+
+	if (!eio_dev) {
+		dev_err(dev, "eio_core not present\n");
+		return -ENODEV;
+	}
+
+	for (id = 0; id < BL_MAX; id++) {
+		char name[32];
+		struct backlight_properties props;
+		struct eio_bl_dev *eio_bl;
+		struct backlight_device *bl;
+		int ret;
+
+		memset(&props, 0, sizeof(props));
+		props.type           = BACKLIGHT_RAW;
+		props.max_brightness = THERMAL_MAX;
+		props.power          = BACKLIGHT_POWER_OFF;
+		props.brightness     = props.max_brightness;
+
+		eio_bl = devm_kzalloc(dev, sizeof(*eio_bl), GFP_KERNEL);
+		if (!eio_bl)
+			return -ENOMEM;
+
+		eio_bl->mfd = dev->parent;
+		eio_bl->id  = id;
+		eio_bl->max = props.max_brightness;
+
+		ret = bl_init(eio_bl->mfd, id, &props);
+		if (ret) {
+			dev_info(dev, "%d No Backlight %u enabled!\n", ret, id);
+			continue;
+		}
+
+		snprintf(name, sizeof(name), "%s%u", pdev->name, id);
+
+		bl = devm_backlight_device_register(dev, name, dev, eio_bl,
+						    &bl_ops, &props);
+
+		if (IS_ERR(bl)) {
+			ret = PTR_ERR(bl);
+			if (ret == -EPROBE_DEFER)
+				return ret;
+
+			dev_err(dev, "register %s failed: %d\n", name, ret);
+			continue;
+		}
+
+		dev_info(dev, "%s registered (max=%u)\n", name, props.max_brightness);
+	}
+
+	return 0;
+}
+
+static struct platform_driver bl_driver = {
+	.probe  = bl_probe,
+	.driver = {
+		.name = "eio_bl",
+	},
+};
+
+module_platform_driver(bl_driver);
+
+MODULE_AUTHOR("Wenkai Chung <wenkai.chung@advantech.com.tw>");
+MODULE_AUTHOR("Ramiro Oliveira <ramiro.oliveira@advantech.com>");
+MODULE_DESCRIPTION("Backlight driver for Advantech EIO embedded controller");
+MODULE_LICENSE("GPL");

-- 
2.43.0


