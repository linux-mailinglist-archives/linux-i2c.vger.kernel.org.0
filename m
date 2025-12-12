Return-Path: <linux-i2c+bounces-14524-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E3BCB956D
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 17:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F071C30D871E
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 16:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374492D3233;
	Fri, 12 Dec 2025 16:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b="qCE/Oxdb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023084.outbound.protection.outlook.com [40.107.44.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C6C2D63FF;
	Fri, 12 Dec 2025 16:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765557733; cv=fail; b=XGbQvrpXDtV1SfEOZ45vuUB+OKMNlxhBxTZXcs+mMK4l7kvQjUvUu5n4J3tjm0aL1Qlxo4cTrXXiKB81rQ7zEcv28clEn9vvqCT6ghxgA6wq3+gVrdaXtN6eYsNNvFPYTNgWwSiZPyxzY9Ooz3MhVa/cRF0At/kmfLl/r6Wg4mY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765557733; c=relaxed/simple;
	bh=51WajgEbvqgEKRA7RH5RVOmoSeCUuZhN+95x5loIgvM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lUKQVpLj3ZWOclKRfWFHJ89nk8TYS9H2sTo9pNU1SjK2eeEHJzniFETgd9PJV4wl1EW8GOX5qerppI7yGfaPKhYUHl0HhRvf9L/CVvpc6wHu0qPYcGM/3wybaEAIhlZyHSf48xExd+2SaXQTUYxF0UJxWvovZiJqNmdWrBIiFHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com; spf=pass smtp.mailfrom=advantech.de; dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b=qCE/Oxdb; arc=fail smtp.client-ip=40.107.44.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=advantech.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqtISj+e6XS4/DYgwWo7vfg1YgQg00mFZl/lclaX09NftgjfLeM481Uu0zMnfyOIe0vfvWzRoXuQw0UkRMCmE/cTil84ipgV726UisHoymAC2tbydEU13/z7TQ/tupGc5rI3iptFQNozsZmJkXd+xOeIXkwMbjr1rLOW6wnaCil37Bw3KsSdaJGltaYEDIHQ1yMbcNnR+DkkxADUVfdGoRDqlWjSw8VwcKvlNmmO+ZLQR/wgLz/NrrMI18P9pUI6WQF0WrWxIlAetNRQSj3TESHbWKHKpGuA72rQpmudiTZXSx+LKiPHajjXMXO/+o3I0P1bb//VKptpQVYx/3oTtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqUN7pptFhqfCYONenv7vxAeHgv1MtZwOFVyEjl+bHw=;
 b=je2i8779o50Mk3XAk4c2NbsYFFpwfvx2bOdtBxYi5zVbNzlma7Ba1PnoVajYK1LoxgutM/AMm4qdDwSY5dEkMBErnFny4Vn6SJuCWSvqd7z8QLyaqqLS268jesE7YzLoIOL21fXDzp9FZFexv+ObbQMHx/TRjzwmaSDa5wA287wI6Nq7N9efsM4uKCSAhvQYiDSERMsF0mwUfukCr0rH9jJ6xKuuxb+l2Qi9VaMEvLh8wiCMq/+US95yi1yVTpUa13rKHkQEJTHsPKUpd7QqluaMt48/N4fAZ/w1BwNtpeFXaWVNfngVQtNyXEwsHKG+DO4Kw7pc0r5dR7U8wQN5HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.de; dmarc=pass action=none header.from=advantech.com;
 dkim=pass header.d=advantech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqUN7pptFhqfCYONenv7vxAeHgv1MtZwOFVyEjl+bHw=;
 b=qCE/OxdbWc0F9LGZgEm6Y+goJ4bRIgAj/z7a0sae2rquuiveugiJFov3TQhqyrOsz9GopHuBTFRy3uXCaiJ9VoVWbkCcKS/0wu1bHkFLkx0TqbsCKu4nis7FVIHWjVMgCfB4mcfi4fJZ2p1a5agkthjCmJH4Girn09UOVOWW9qXHeQuh+BvkStO5R/rXnrGiaBez5xHCvKTeX/NlRoCxQf9sPF3RRLE9XQEGAGZwSSXilTn0oK74tCAmTuvecFFi7bHXYotfhAKDKLVPZ8/bbboceQKY32Jr+6IADZr2hRcueldEg51yqBiL1Kgg8wAm3OLoTrk7V0PumZsQSpsEDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.com;
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com (2603:1096:301:21::6)
 by JH0PR02MB6564.apcprd02.prod.outlook.com (2603:1096:990:3f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 16:42:08 +0000
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::59c9:fe0:25f6:702b]) by PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::59c9:fe0:25f6:702b%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:42:08 +0000
From: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Date: Fri, 12 Dec 2025 17:40:59 +0100
Subject: [PATCH 8/8] Add Advantech EIO Fan driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-upstream-v1-v1-8-d50d40ec8d8a@advantech.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15819;
 i=ramiro.oliveira@advantech.com; h=from:subject:message-id;
 bh=51WajgEbvqgEKRA7RH5RVOmoSeCUuZhN+95x5loIgvM=;
 b=owEB7QES/pANAwAKAc7t0Ke8vbAJAcsmYgBpPEWhfKRACF01ila+8eGN3kwcftzUzGOqanEwl
 QQ3waIjsCeJAbMEAAEKAB0WIQS1Nkng0ZvJmBKh6GLO7dCnvL2wCQUCaTxFoQAKCRDO7dCnvL2w
 CbGCDADD/LewB6FT+KGC0hVpUy8uIvHVcyhhscDZ2EP5xHd/VWhdRX/SM+RTbQBGxERWuzR92JP
 sC5vUWkNp7sIlsAFp9hWhMS/TggAmmWWyLgdaQSGsM6LHjcN9+XkTDCVO+85Ph+sTG7ifpEk9wV
 iKOOSFTkm3uyWQBWMcF5zEvHODSVEe3INiy94PD328yL7BMLcJvSr+R1Sc0v+EmcRXg5MRNibh2
 zL3qqxYkLBAn6IW3WMgh8Lp0vrDCMc50zWSJOU75jTfdGaXcBmyj59T7Y5ul0+18ZDHTZL9z0BT
 Z+W4/ZSBUFmhHRNzXBdsg8ll6ay+9azR6SgzAjLbID1rbM5LMH2gtuFV8ogf1W5Tjnr6y9T5X+w
 lAejA5sdE1ilWeiGr/h1V5lW/YUVCEcIGG3KrRJyUcMegD2Y+GFsj8vKtmKqdfbAlX+4rTDx/yw
 Tn4VoCQ0KLfGLkOKS+dLJ3JpGmi9c+mULw6S+uh3UGSRSszpp7+3Cu1HyFQDchgi+H0ao=
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
X-MS-Office365-Filtering-Correlation-Id: db491152-3f02-4021-5de5-08de399d640d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0NaekpJU3g0cUlJenUwdW5qQ0Fld2E3TVIrTC9iYk0vZXVOeG9NM3duREJ5?=
 =?utf-8?B?UkxtR0ErN05pU1ZVKzBsTm40cFplVDI3b3RjOUhNbjJHcFRvVEhhb05iTmZG?=
 =?utf-8?B?ZWZvZ0E3TlNxVnJ1OVBKK0ZKb2tTbjkzSWhicnRMM0JOMkNrZEtkT01rbzFP?=
 =?utf-8?B?OTRxNW05UFJiL3RYMUszVWZJcWt6bkFrbHNEbGRtTzZ2MlZVakN4NVplOG93?=
 =?utf-8?B?QS9rWXlxSDdhTE8ycExMUnNGVGRTK3haRTFjVUNobEhla0tVVkFzV0N1ZFFk?=
 =?utf-8?B?RXVRS2VBUFQ5S0tIMFJEVUluc2ZQc3FMRDBuWHNPTUowM0NKY0pwZlppcm1N?=
 =?utf-8?B?OW5ydlUyV3A2RmJsbUcwamlNcWFlNThFMXYwd3VTWFZUenFEaWxsMG1tTEJK?=
 =?utf-8?B?OUxVM0c0VEdRckJJZWEzSGNrWHJUMHErZTErMWhRUW1KcTFIZnRBdUF4a2lP?=
 =?utf-8?B?eVk4RmpFZzltcm4xOG0vdlNTcDcvMTlZK2dqWENoamRTNTFWYjQ1U2p0Qkw1?=
 =?utf-8?B?c0Zpc044RmNINHUxRnlKdVQ0UVJtM2VpNGg5RENEMk5uRVpPd2dQUHkrd2Ex?=
 =?utf-8?B?SThicWQ1KzNqUmsxVnhQcnU5UW1UblJoQ1NwdjlCN2FpWU56OUpiWWZ0bysz?=
 =?utf-8?B?aVVTREs4Qk5tSC82UDV6Tno2VmZlZjN4Q2FhYngvTERpdUVCbjh0NjZFZDNl?=
 =?utf-8?B?ZjdKUk56dGJ3eWMzWUpqRWo2Wk4wSmZydXNnaGhtQVRsa0U1YzB1NjZjeFdZ?=
 =?utf-8?B?L2twcHFUYlp6WDU5dER1emVtWDJZcDI5WmdqVnd1Qmwweks3ODdYZFFJVWpK?=
 =?utf-8?B?RStPcFBFM2R3QlNYbjdMNGR3amlnNnY1NXJSaFFsNVFSajNBZVJOWjczVkNq?=
 =?utf-8?B?MFZpK0ZWaEQyalNXd2owZjdJNHIxcXZHTkdLRjdmS0xYdER0OHliVXBsSmlY?=
 =?utf-8?B?MFArME05eStncDU2SGE0c3g5QjVGMXpxRlFqRU04UFJtcmRweGhNTExOU1VD?=
 =?utf-8?B?NUZkQk9NRjB1OGlkRWg5RmtQSkZETWlXUFRRNHJSb3VJZXUvL216ejM5SmMx?=
 =?utf-8?B?VVJPQjFMRncvSzFzaFlFL0FpMUJjR2FhYzlPeGV0anJncjRRWk5vQkcwc3Bt?=
 =?utf-8?B?Yi9yekYxUWdTS0VudUpRM1lhRlFzZ3BpeDBqU05uV3Q3R2IwL1VjTk55L0Fk?=
 =?utf-8?B?elFsVFkvbm54MWhXK0V2c2hJYjh3NDlpOVRjNnBhc0c2ZlNUUXBFM3hqYlVP?=
 =?utf-8?B?eUlLWHc5KzhuTnpzNDJkWm00anJZd2VjRkNsZGtKUFBkS2pZbVZBbTRCeVd0?=
 =?utf-8?B?YlRWVWdqN05tMFMwTWdIM21PUTFad1A4czB5RUNlT25MTmduMFBxQmFYZXRK?=
 =?utf-8?B?a0RCczVGZXM3NVdwc2NTWkE0OTNMOFJXM0FkL2wvcHNia3Y5Yk9FSW4wT3FX?=
 =?utf-8?B?cWFtM3lHSzhJU1dzQWwrSFp0QkdFYzh5ZlQ5aFgxRkpCYmVCTk1NNGUxOFVS?=
 =?utf-8?B?SHlXMXBMcWdGanp0NExhQlBHUGkrYW80TkJxRm9FcHQ2YUE2dllyZmpxc09N?=
 =?utf-8?B?cVZraVI0UE5KaVV3dnpzR0Fpc3RFengxdTBZdXQrZDVyUzFURVIxV2MxalY5?=
 =?utf-8?B?TmNaQUcrekdSU0REODNwQnVIV0pFZ2xXa1FLNXdiOVFKVW5uYkVOazZlL05M?=
 =?utf-8?B?VFI5MnVWbHJPdXhGV1A4WkpIM2ZSSGgxTVpiWnhMMkM0VW8wOGIyYlpPZ2l6?=
 =?utf-8?B?akdLK2tnOGR3d05JN0FhcVA0dTlhOWxSRXlEYXgrWThJUlRpNmkrOElJYkJo?=
 =?utf-8?B?eDZGYWdZdmpMUjVmTFBKanFwbUU3QXY3c1dlZDBGZGZBQktaSEh5blBJUHNY?=
 =?utf-8?B?TTloS3N4TEUxTy9teTh3aUJhQnBsRXhsOGxCQlRBV0t3Slp4L0lXOXlhUFVK?=
 =?utf-8?B?RU90MUhXaER0Njg5VUZobFlyN01jeEgxQUVDeEMxeGFCUkZZdk14OENCVW83?=
 =?utf-8?B?Snk5L1ArWnpHcGVsM1E3aWY1R1pEd1pEUk1KTUNkaTkxQ3I4eXpES3dIVDJY?=
 =?utf-8?B?VHJ0OFoydHpmV0pWT2I1aW5HTkxQMXYrUnk5UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR02MB4502.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFJHYi93R25NdXpDbDVVL0prR280WW9VSGpXQnJIc0FPWEsrRVlwY1ZaeUpJ?=
 =?utf-8?B?UWxpSFl0ZGh1V3RTMWJCaFhrNUNTTHovaS9zWjFKVnVURVNWZSt1TlBRcGo4?=
 =?utf-8?B?S0dqK1hrdnhLL3VOUjFEcG1kVUdyY2VKR29wR2xaN2cwNkhtOFJxNis4TXpr?=
 =?utf-8?B?WEUxVEhReTdPSWJEelo5ZmFpSGQ3S2tBQThlZSt2elBKMHpKaVQxOUdJTHFO?=
 =?utf-8?B?RG5hZTBSNzJzdnJsbGl3T3ROeTVHaEZUSWFCOWp4cUZ5QTY2clJsL0VaRXhN?=
 =?utf-8?B?QlROak1FYytiaHRDb2dOKzk3SGthaE9Pd0RTOHVoY0RDTHB1Y0hvOVExaEVz?=
 =?utf-8?B?VWtTQ1VjaWlZSFpubkw3OXlCcFZ1bm1sSDJZR1pOZ0dLaVYxZ0tlTTVjd2sv?=
 =?utf-8?B?UlBKSFlxNk1Kd3NKcGZsQTFKVTJsR3Z4VWdvckFJY2kvL0F2OHorSzJnYVdB?=
 =?utf-8?B?cGIwYUtlNlN2YjZqd0VmR0thZG9aRTBseUsyaTBpVGhJVE5scWZrWjRHTW1V?=
 =?utf-8?B?cFFRSTNIYVdKSXdrL2tmczRaazhndjV5bHNRR3d6SStJYU1mTktlT2NuTnM1?=
 =?utf-8?B?WHZDUjduM3hnZktMYThhYjdpNkx6c0Z3azZ5cVAwUzNIM25OVzFHdHRiL3FX?=
 =?utf-8?B?ampCc3dLSFZQY1hidm5EK04rNURTbUs5MjVtMUpQRnhQekhGYk12YTN1SWtw?=
 =?utf-8?B?Nk5KOUlpZzVXYmtFTlI0RnQxOWxXZ0xnLzNPMDdQL1NZYW5jYnhpcWQ4Znli?=
 =?utf-8?B?ZFZKYis4WDF3TXY5UW5lWEp4VTQwM0krajJOQklIcHpUR0YwdmR2SW5WVWg0?=
 =?utf-8?B?aFY5Z0hDeGc4WVczSXF1SE5WVXQxL3JRUXNMNmpnaWlCcWJEVVRUVkZwREs0?=
 =?utf-8?B?V1JKQjhqRittWGdSa1hXVXUxMlAvUUdCRFJxNEdzSXpPZXdTclRGL0w2YzI3?=
 =?utf-8?B?dmE4VDNsZm9SZXhLWnN6YStadGVTeUNhY282cmVjR0I4ejJha3dmNHlUaWV2?=
 =?utf-8?B?L20waExwZ1ZBUkNOdlg5UFd2THluV1QzakZtb2g0RCt0cllJR2RRWk5HVlN1?=
 =?utf-8?B?SjJ6OHY4MkxGQWlZUW9sRFZuZFlpT05nTlVsS1c1NTYrd0dkT0ZQQndVUDlQ?=
 =?utf-8?B?MlFmc3gyVjNxei9tNXJzYlFkUkNGdXA5b2ZJNjlHeUkyUmdJR0xJbWZWaWw3?=
 =?utf-8?B?RDVha0QzSHRxL2RQbTA5a1JWdFVMUDhHRnlsQkZvcDNlS2Y4anNTQkNJdGRL?=
 =?utf-8?B?bGYxVzlZRi85TmhXSnhDM0xuZklScFhyRFpNeS94dERtRDFidGtNSWVsWTZ0?=
 =?utf-8?B?ZzZXekQ2bnZUK0VYRnRzbldqbGZpdHpWcXlwckZveXZncEVPdFgxY3drbzlM?=
 =?utf-8?B?MHlBOHNweWRJWWttYW1EQWVhRmxSSmZhdDRqZkJEaDQrd0p4TnV2ZUQwaTNp?=
 =?utf-8?B?R2xoTkFPRjFld2lLQjhaZFQ1cUZ2ck9iUVV1bjJmV2tBeVpSQzhOWmxNTmJ3?=
 =?utf-8?B?UlRUNE5WZHF5TWhkTUxaQW1Cc25CZE1kRGs2STlRd21HbzQ2OU1NczVHV3Z2?=
 =?utf-8?B?RmhOcFR3Y3pFT1ZBdHVreTBrdS9xdzNCVkQraC83VUw3T0tyazdScGY3T1BS?=
 =?utf-8?B?eXRuQlhLbkFUcFVJTlNJeXVkdUw5bHRTa0xVTFFtWlRhaWVRaW95OG41dDM5?=
 =?utf-8?B?UTJZMHY3QTJJM0lWbE41NW1xL1NXVGFURVdvNXo2VUhheTRhV1FxMzZwNDVs?=
 =?utf-8?B?MWJGQ0NDd05ZRlk5Y0FKdGZHM3VaM1ovcUhCYXBXSEx1S2dNVXh6c2YyZ0FU?=
 =?utf-8?B?cjZSeEM3eDFOLy9QOVFLSVc4NUhLSGY1R3hCVGZOQWtMQ2ZhYzRHNk9FYWNY?=
 =?utf-8?B?ZTVISU5GeGtBaFBwZnF2cW9mMlozYS9QVXgwTVJ4bk9uTnBwZUZpd3JJVytl?=
 =?utf-8?B?MUczV1pHRFptMkQwZ21XWHM3YThxL2piN3VWdkxOSUkrNU56Z3RoMlJIRWVT?=
 =?utf-8?B?TDE5bDZFK3RiV0lTVjZxbFlPR2drdzIxTzJMZlpneER2TjFSZG1QbzJvd1g3?=
 =?utf-8?B?THBCZmprRGRRSTVTcnB0LzhGQ0Z1MlNtSUlJeXBLSkpRQUozVkdqZm9DVUtH?=
 =?utf-8?B?SlJrZUpKNWFRWmhPRmNUMnFNVDJXRk81cEw3WHk5YlNQMDlQYnZZT2NUd1Rp?=
 =?utf-8?Q?+J6z8aIll8HmvB56YBPieFg=3D?=
X-OriginatorOrg: advantech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db491152-3f02-4021-5de5-08de399d640d
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4502.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:42:08.5609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EYglerHuhbCiuJqTykCDb9EmBur234FsFi/x4ej3Hf4nIx+nb7VEt+X/S7wdKKEiGvYu+4D9eNVE0AaQGJtOlZIoVKmxwCxzf2k7c9Ehdc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB6564

This commit adds the driver to control the Advantech EIO Fan block,
which is included in the Advantech EIO Embedded Controller.

Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>
---
 MAINTAINERS               |   1 +
 drivers/thermal/Kconfig   |   8 +
 drivers/thermal/Makefile  |   1 +
 drivers/thermal/eio_fan.c | 490 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 500 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 770b2f82d01a..b227a9d28191 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -623,6 +623,7 @@ F:	drivers/gpio/gpio-eio.c
 F:	drivers/hwmon/eio-hwmon.c
 F:	drivers/i2c/busses/i2c-eio.c
 F:	drivers/mfd/eio_core.c
+F:	drivers/thermal/eio_fan.c
 F:	drivers/thermal/eio_thermal.c
 F:	drivers/video/backlight/eio_bl.c
 F:	drivers/watchdog/eio_wdt.c
diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index 7309f7e7a1c1..ba4958ff0962 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -436,6 +436,14 @@ config EIO_THERMAL
 	  the Linux thermal framework. It communicates with the EC through the
 	  EIO MFD core.
 
+config EIO_FAN
+        tristate "Advantech EIO Fan cooling device"
+        depends on MFD_EIO && THERMAL
+        help
+          Fan cooling device for the Advantech EIO. This driver exposes a
+          thermal cooling device with controllable states (e.g. Auto/Manual/PWM).
+          It communicates with the EC through the EIO MFD core.
+
 menu "Mediatek thermal drivers"
 depends on ARCH_MEDIATEK || COMPILE_TEST
 source "drivers/thermal/mediatek/Kconfig"
diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
index 3740540d8a18..2633e8ed9fdc 100644
--- a/drivers/thermal/Makefile
+++ b/drivers/thermal/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_IMX91_THERMAL)	+= imx91_thermal.o
 obj-$(CONFIG_MAX77620_THERMAL)	+= max77620_thermal.o
 obj-$(CONFIG_QORIQ_THERMAL)	+= qoriq_thermal.o
 obj-$(CONFIG_DA9062_THERMAL)	+= da9062-thermal.o
+obj-$(CONFIG_EIO_FAN)		+= eio_fan.o
 obj-$(CONFIG_EIO_THERMAL)	+= eio_thermal.o
 obj-y				+= intel/
 obj-$(CONFIG_TI_SOC_THERMAL)	+= ti-soc-thermal/
diff --git a/drivers/thermal/eio_fan.c b/drivers/thermal/eio_fan.c
new file mode 100644
index 000000000000..7f0529a1907e
--- /dev/null
+++ b/drivers/thermal/eio_fan.c
@@ -0,0 +1,490 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * eio_fan
+ * ============
+ * Thermal zone driver for Advantech EIO embedded controller's smart
+ * fan mechanism.
+ *
+ * We create a sysfs 'name' of the zone, point out where the fan is. Such as
+ * CPU0, SYS3, etc.
+ *
+ * The sysfs 'fan_mode' can be one of 'Stop', 'Full', 'Manual' or 'Auto'.
+ * If 'Manual'. You can control fan speed via sysfs 'PWM'.
+ * If it is 'Auto'. It enables the smart fan mechanism as below.
+ *
+ * In EIO chip. The smart fan has 3 trips. When the temperature is:
+ * - Over Temp High(trip0), the Fan runs at the fan PWM High.
+ * - Between Temp Low and Temp High(trip1 - trip0), the fan PWM value slopes
+ *   from PWM Low to PWM High.
+ * - Between Temp Stop and Temp Low(trip2 - trip1), the fan PWM is PWM low.
+ * - Below Temp Stop, the fan stopped.
+ *
+ * (PWM)|
+ *	|
+ * High |............................. ______________
+ * (Max)|			      /:
+ *	|			     / :
+ *	|			    /  :
+ *	|			   /   :
+ *	|			  /    :
+ *	|			 /     :
+ *	|			/      :
+ *	|		       /       :
+ *  Low	|.......... __________/	       :
+ *	|	    |	      :	       :
+ *	|	    |	      :	       :
+ *    0	+===========+---------+--------+-------------
+ *	0	   Stop	     Low      High	(Temp)
+ *
+ * Copyright (C) 2025 Advantech Corporation. All rights reserved.
+ */
+
+#include <linux/ctype.h>
+#include <linux/errno.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/eio.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/sysfs.h>
+#include <linux/thermal.h>
+
+#define CMD_FAN_WRITE		0x24
+#define CMD_FAN_READ		0x25
+#define FAN_MAX			0x04
+
+#define CMD_THERM_WRITE		0x10
+#define CMD_THERM_READ		0x11
+#define THERM_MAX		0x04
+#define THERM_MULTI		100
+
+#define CTRL_STATE		0x00
+#define CTRL_TYPE		0x01
+#define CTRL_CTRL		0x02
+#define CTRL_ERROR		0x04
+#define CTRL_VALUE		0x10
+#define CTRL_INVERT		0x11
+#define CTRL_FREQ		0x12
+#define CTRL_THERM_HIGH		0x13
+#define CTRL_THERM_LOW		0x14
+#define CTRL_THERM_STOP		0x15
+#define CTRL_PWM_HIGH		0x16
+#define CTRL_PWM_LOW		0x17
+#define CTRL_THERM_SRC		0x20
+
+#define CTRLMODE_STOP		0x00
+#define CTRLMODE_FULL		0x01
+#define CTRLMODE_MANUAL		0x02
+#define CTRLMODE_AUTO		0x03
+
+#define DUTY_MAX		100
+#define UNIT_PER_TEMP		10
+#define NAME_SIZE		4
+
+#define TRIP_HIGH		0
+#define TRIP_LOW		1
+#define TRIP_STOP		2
+#define TRIP_NUM		3
+
+/* Bitfields inside CTRL_CTRL */
+#define FAN_MODE_MASK           GENMASK(1, 0)
+#define FAN_SCM_BIT             BIT(2)
+#define FAN_FRAME_BIT           BIT(3)
+#define FAN_SRC_MASK            GENMASK(7, 4)
+
+#define FAN_SRC(val)            (((int)(val)) >> 4)
+
+#ifndef DECI_KELVIN_TO_MILLI_CELSIUS
+#define DECI_KELVIN_TO_MILLI_CELSIUS(t)  ((((t) - 2731) * 100))
+#endif
+
+#ifndef MILLI_CELSIUS_TO_DECI_KELVIN
+#define MILLI_CELSIUS_TO_DECI_KELVIN(t)  ((((t) / 100) + 2731))
+#endif
+
+static const u8 pmc_len[CTRL_THERM_SRC + 1] = {
+/*      0, 1, 2, 3, 4, 5, 6, 7, 8, 9, a, b, c, d, e, f */
+	1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	1, 1, 4, 2, 2, 2, 1, 1, 2, 2, 2, 0, 0, 0, 0, 0,
+	1,
+};
+
+static const char fan_name[0x20][NAME_SIZE + 1] = {
+	"CPU0", "CPU1", "CPU2", "CPU3", "SYS0", "SYS1", "SYS2", "SYS3",
+	"", "", "", "", "", "", "", "",
+	"", "", "", "", "", "", "", "",
+	"", "", "", "", "OEM0", "OEM1", "OEM2", "OEM3",
+};
+
+struct eio_fan_trip {
+	u8 trip_ctl;
+};
+
+struct eio_fan_dev {
+	struct device *mfd;
+	struct device *dev;
+	u8 id;
+	struct thermal_zone_device *tzd;
+	struct eio_fan_trip trip_priv[TRIP_NUM];
+};
+
+static int timeout;
+module_param(timeout, int, 0444);
+MODULE_PARM_DESC(timeout, "Set PMC command timeout value.\n");
+
+static int pmc_write(struct device *mfd, u8 ctrl, u8 id, void *data)
+{
+	if (ctrl >= ARRAY_SIZE(pmc_len))
+		return -EINVAL;
+
+	struct pmc_op op = {
+		.cmd       = CMD_FAN_WRITE,
+		.control   = ctrl,
+		.device_id = id,
+		.size	   = pmc_len[ctrl],
+		.payload   = (u8 *)data,
+		.timeout   = timeout,
+	};
+	return eio_core_pmc_operation(mfd, &op);
+}
+
+static int pmc_read(struct device *mfd, u8 ctrl, u8 id, void *data)
+{
+	struct pmc_op op = {
+		.cmd       = CMD_FAN_READ,
+		.control   = ctrl,
+		.device_id = id,
+		.size	   = pmc_len[ctrl],
+		.payload   = (u8 *)data,
+		.timeout   = timeout,
+	};
+	return eio_core_pmc_operation(mfd, &op);
+}
+
+static int pmc_read_therm(struct device *mfd, u8 ctrl, u8 id, void *data)
+{
+	struct pmc_op op = {
+		.cmd       = CMD_THERM_READ,
+		.control   = ctrl,
+		.device_id = id,
+		.size	   = 2,
+		.payload   = (u8 *)data,
+		.timeout   = timeout,
+	};
+	return eio_core_pmc_operation(mfd, &op);
+}
+
+static int eio_fan_get_temp(struct thermal_zone_device *tzd, int *temp)
+{
+	struct eio_fan_dev *fan = thermal_zone_device_priv(tzd);
+	struct device *mfd = fan->mfd;
+	u8 ch = fan->id;
+	int sensor = 0;
+	u16 val = 0;
+	int ret;
+
+	ret = pmc_read(mfd, CTRL_CTRL, ch, &sensor);
+	if (ret)
+		return ret;
+
+	ret = pmc_read_therm(mfd, CTRL_VALUE, (u8)FAN_SRC(sensor), &val);
+	if (ret)
+		return ret;
+
+	*temp = DECI_KELVIN_TO_MILLI_CELSIUS(val);
+	return 0;
+}
+
+static int eio_fan_set_trip_temp(struct thermal_zone_device *tzd,
+				 const struct thermal_trip *trip, int temp)
+{
+	struct eio_fan_dev *fan = thermal_zone_device_priv(tzd);
+	const struct eio_fan_trip *fan_trip = trip->priv;
+	u8 ctl = CTRL_THERM_HIGH + fan_trip->trip_ctl;
+	u16 val;
+
+	if (temp < 1000)
+		return -EINVAL;
+
+	val = MILLI_CELSIUS_TO_DECI_KELVIN(temp);
+	return pmc_write(fan->mfd, ctl, fan->id, &val);
+}
+
+static bool eio_fan_should_bind(struct thermal_zone_device *tzd,
+				const struct thermal_trip *trip,
+				struct thermal_cooling_device *cdev,
+				struct cooling_spec *spec)
+{
+	struct eio_fan_dev *tz_fan  = thermal_zone_device_priv(tzd);
+	struct eio_fan_dev *cd_fan  = cdev->devdata;
+
+	if (!tz_fan || !cd_fan)
+		return false;
+
+	if (tz_fan->mfd != cd_fan->mfd || tz_fan->id != cd_fan->id)
+		return false;
+
+	return true;
+}
+
+static const struct thermal_zone_device_ops zone_ops = {
+	.get_temp = eio_fan_get_temp,
+	.set_trip_temp = eio_fan_set_trip_temp,
+	.should_bind   = eio_fan_should_bind,
+};
+
+static int eio_fan_get_max_state(struct thermal_cooling_device *cdev,
+				 unsigned long *state)
+{
+	*state = 100;
+	return 0;
+}
+
+static int eio_fan_get_cur_state(struct thermal_cooling_device *cdev,
+				 unsigned long *state)
+{
+	struct eio_fan_dev *fan = cdev->devdata;
+	int fan_mode = 0;
+	u8 duty = 0;
+	int ret = 0;
+
+	*state = 0;
+	ret = pmc_read(fan->mfd, CTRL_CTRL, fan->id, &fan_mode);
+	if (ret)
+		return ret;
+
+	switch (fan_mode & FAN_MODE_MASK) {
+	case CTRLMODE_STOP:
+		*state = 0;
+		break;
+	case CTRLMODE_FULL:
+		*state = 100;
+		break;
+	case CTRLMODE_AUTO:
+		*state = 0;
+		ret = 0;
+		break;
+	case CTRLMODE_MANUAL:
+		ret = pmc_read(fan->mfd, CTRL_VALUE, fan->id, &duty);
+		if (ret)
+			return ret;
+		duty = (u8)clamp_val(duty, 0, 100);
+		*state = duty;
+		break;
+	default:
+		*state = 0;
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int eio_fan_set_cur_state(struct thermal_cooling_device *cdev,
+				 unsigned long state)
+{
+	struct eio_fan_dev *fan = cdev->devdata;
+	u8 ctrl = 0;
+	u8 duty;
+	int ret;
+
+	ret = pmc_read(fan->mfd, CTRL_CTRL, fan->id, &ctrl);
+	if (ret)
+		return ret;
+
+	if ((ctrl & FAN_MODE_MASK) != CTRLMODE_MANUAL)
+		return -EOPNOTSUPP;
+
+	duty = (u8)clamp_val(state, 0, 100);
+
+	ret = pmc_write(fan->mfd, CTRL_VALUE, fan->id, &duty);
+
+	return ret;
+}
+
+static const struct thermal_cooling_device_ops cooling_ops = {
+	.get_max_state = eio_fan_get_max_state,
+	.get_cur_state = eio_fan_get_cur_state,
+	.set_cur_state = eio_fan_set_cur_state,
+};
+
+static ssize_t fan_mode_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	static const char * const names[] = { "Stop", "Full", "Manual", "Auto" };
+	struct thermal_zone_device *tzd = dev_get_drvdata(dev);
+	struct eio_fan_dev *fan = thermal_zone_device_priv(tzd);
+	u8 mode = 0;
+
+	int ret = pmc_read(fan->mfd, CTRL_CTRL, fan->id, &mode);
+
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%s\n", names[mode & 0x03]);
+}
+
+static ssize_t fan_mode_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	static const char * const names[] = { "Stop", "Full", "Manual", "Auto" };
+	struct thermal_zone_device *tzd = dev_get_drvdata(dev);
+	struct eio_fan_dev *fan = thermal_zone_device_priv(tzd);
+	u8 ctrl, newc;
+	int mode_idx, ret;
+
+	for (mode_idx = 0; mode_idx < ARRAY_SIZE(names); mode_idx++) {
+		if (strncasecmp(buf, names[mode_idx], strlen(names[mode_idx])))
+			continue;
+
+		ret = pmc_read(fan->mfd, CTRL_CTRL, fan->id, &ctrl);
+		if (ret)
+			return -EIO;
+
+		newc  = ctrl & FAN_SRC_MASK;
+
+		switch (mode_idx) {
+		case CTRLMODE_AUTO:
+			newc |= FAN_FRAME_BIT;
+			newc &= ~FAN_SCM_BIT;
+			newc |= CTRLMODE_AUTO;
+			break;
+		case CTRLMODE_MANUAL:
+			newc &= ~FAN_FRAME_BIT;
+			newc &= ~FAN_SCM_BIT;
+			newc |= CTRLMODE_MANUAL;
+			break;
+		case CTRLMODE_FULL:
+			newc &= ~FAN_FRAME_BIT;
+			newc &= ~FAN_SCM_BIT;
+			newc |= CTRLMODE_FULL;
+			break;
+		case CTRLMODE_STOP:
+		default:
+			newc &= ~FAN_FRAME_BIT;
+			newc &= ~FAN_SCM_BIT;
+			newc |= CTRLMODE_STOP;
+			break;
+		}
+
+		ret = pmc_write(fan->mfd, CTRL_CTRL, fan->id, &newc);
+		return ret ? ret : count;
+	}
+
+	return -EINVAL;
+}
+
+static DEVICE_ATTR_RW(fan_mode);
+
+static int eio_fan_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	unsigned int fan_id;
+	int ret;
+
+	if (!dev_get_drvdata(dev->parent)) {
+		dev_err(dev, "eio_core not present\n");
+		return -ENODEV;
+	}
+
+	for (fan_id = 0; fan_id < FAN_MAX; fan_id++) {
+		u8 state = 0, name = 0;
+		int trip_hi = 0, trip_lo = 0, trip_stop = 0;
+		int pwm_hi = 0, pwm_lo = 0;
+		int temps_mc[TRIP_NUM];
+		struct eio_fan_dev *fan;
+		struct thermal_zone_device *tzd;
+		struct thermal_cooling_device *cdev;
+
+		if (pmc_read(dev->parent, CTRL_STATE, fan_id, &state) ||
+		    pmc_read(dev->parent, CTRL_TYPE, fan_id, &name) ||
+		    pmc_read(dev->parent, CTRL_THERM_HIGH, fan_id, &trip_hi) ||
+		    pmc_read(dev->parent, CTRL_THERM_LOW, fan_id, &trip_lo) ||
+		    pmc_read(dev->parent, CTRL_THERM_STOP, fan_id, &trip_stop) ||
+		    pmc_read(dev->parent, CTRL_PWM_HIGH, fan_id, &pwm_hi) ||
+		    pmc_read(dev->parent, CTRL_PWM_LOW, fan_id, &pwm_lo)) {
+			dev_info(dev, "fan%u: pmc read error, skipping\n", fan_id);
+			continue;
+		}
+
+		if (!(state & 0x1)) {
+			dev_info(dev, "fan%u: firmware reports disabled\n", fan_id);
+			continue;
+		}
+
+		if (!fan_name[name][0]) {
+			dev_info(dev, "fan%u: unknown name index %u\n", fan_id, name);
+			continue;
+		}
+
+		temps_mc[TRIP_HIGH] = DECI_KELVIN_TO_MILLI_CELSIUS(trip_hi);
+		temps_mc[TRIP_LOW]  = DECI_KELVIN_TO_MILLI_CELSIUS(trip_lo);
+		temps_mc[TRIP_STOP] = DECI_KELVIN_TO_MILLI_CELSIUS(trip_stop);
+
+		fan = devm_kzalloc(dev, sizeof(*fan), GFP_KERNEL);
+		if (!fan)
+			return -ENOMEM;
+
+		fan->mfd = dev->parent;
+		fan->id  = (u8)fan_id;
+
+		fan->trip_priv[TRIP_HIGH].trip_ctl = CTRL_THERM_HIGH;
+		fan->trip_priv[TRIP_LOW].trip_ctl  = CTRL_THERM_LOW;
+		fan->trip_priv[TRIP_STOP].trip_ctl = CTRL_THERM_STOP;
+
+		struct thermal_trip trips[TRIP_NUM] = {
+			[TRIP_HIGH] = {
+				.type = THERMAL_TRIP_ACTIVE,
+				.temperature = DECI_KELVIN_TO_MILLI_CELSIUS(trip_hi),
+				.flags = THERMAL_TRIP_FLAG_RW_TEMP,
+				.priv = &fan->trip_priv[TRIP_HIGH],
+			},
+			[TRIP_LOW] = {
+				.type = THERMAL_TRIP_ACTIVE,
+				.temperature = DECI_KELVIN_TO_MILLI_CELSIUS(trip_lo),
+				.flags = THERMAL_TRIP_FLAG_RW_TEMP,
+				.priv = &fan->trip_priv[TRIP_LOW],
+			},
+			[TRIP_STOP] = {
+				.type = THERMAL_TRIP_ACTIVE,
+				.temperature = DECI_KELVIN_TO_MILLI_CELSIUS(trip_stop),
+				.flags = THERMAL_TRIP_FLAG_RW_TEMP,
+				.priv = &fan->trip_priv[TRIP_STOP],
+			},
+		};
+
+		tzd = thermal_zone_device_register_with_trips(fan_name[name],
+							      trips, TRIP_NUM,
+							      fan,
+							      &zone_ops,
+							      NULL,
+							      0, 0);
+		if (IS_ERR(tzd))
+			return PTR_ERR(tzd);
+
+		cdev = thermal_cooling_device_register(fan_name[name], fan, &cooling_ops);
+		if (IS_ERR(cdev)) {
+			thermal_zone_device_unregister(tzd);
+			dev_err(dev, "fan%u: cdev register failed: %ld\n",
+				fan_id, PTR_ERR(cdev));
+			return PTR_ERR(cdev);
+		}
+
+		dev_set_drvdata(thermal_zone_device(tzd), tzd);
+		ret = device_create_file(thermal_zone_device(tzd), &dev_attr_fan_mode);
+		if (ret)
+			dev_warn(dev, "Error create thermal zone fan_mode sysfs\n");
+	}
+	return 0;
+}
+
+static struct platform_driver eio_fan_driver = {
+	.probe  = eio_fan_probe,
+	.driver = {
+		.name = "eio_fan",
+	},
+};
+
+module_platform_driver(eio_fan_driver);
+
+MODULE_AUTHOR("Wenkai Chung <wenkai.chung@advantech.com.tw>");
+MODULE_AUTHOR("Ramiro Oliveira <ramiro.oliveira@advantech.com>");
+MODULE_DESCRIPTION("Fan driver for Advantech EIO embedded controller");
+MODULE_LICENSE("GPL");

-- 
2.43.0


