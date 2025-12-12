Return-Path: <linux-i2c+bounces-14518-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6934FCB94A5
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 17:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F16A3003BF6
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 16:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4727A296BDA;
	Fri, 12 Dec 2025 16:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b="Q2cZcvgZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023122.outbound.protection.outlook.com [52.101.127.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984FF25C821;
	Fri, 12 Dec 2025 16:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765557692; cv=fail; b=gMgrAC7+ng7eU16dt59BBVUyaAxCO69kjhezQBLSXwmAEGeQuGsAAdDJ8d5zAlWKuu3Ul0508N1fzweBbCQhAwUa5F9baO2tHhSbMz/0I9sAQOYXjQnevVZyS01lI0e3LF5TExm4MZgp2nSkBNMyR/SKFDMs6HCiODWHfcnVdHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765557692; c=relaxed/simple;
	bh=q6wa7ZjhA7DO7xNYwNG50IKMS8562P6Qm3UwUjgwYrQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dsGkgTwApsZqImxQpKxAXNxAkkwlFuB6CpQFQuTE873971Z/P0lyDv3l0uYv8e45K5iIhw6m3kgKtJDlajX6Fj5zfXzYi/exNExNxG2m16wVjNwaww7jKA+VNZ6H5JpDeyYIePMVgGjxyF/PNcgoSbh20aZfC0OfYFtOfagl9ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com; spf=pass smtp.mailfrom=advantech.de; dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b=Q2cZcvgZ; arc=fail smtp.client-ip=52.101.127.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=advantech.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7jtCS19bMFDVvJ3VpggTMCNtycWveE6aCz2oqEvaCZvjy+5ok19v9de145Ea6m/RlnY4TN9lVsWRwpBm+YiJMb1cVGz8CY2iR11oNPhvOoqOATWsmacWzFZlzq5OMW0ZaWf2DazY6RcaZ2VGelkBKYS3Bhzotu52/7rDBzwngG4w7y3MVDRPRdeHIOIoMOC3vqne2h1W9HbXdEqmBTuUGQC2qJ1pa8a/ZrzbFfmy9D4a4EaAox7ZJ8EOLMXXBgppPPedOc4ZopyKOnlXeSdW7haOGU/aRkV5LDl+zEuiSE03kZBwrFdnm6w5ygRrhM91zg5syeuyVYIrPqAtFr6SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slJgHHGMHOS4Qi9U7h5cbySlj/f2icD044PV+7i7KvA=;
 b=megg39Fc9dFY4+nKjHmd+BhpGB3DDu7gR0aKgq/KndxheBsp87/3wk4FZAVcEJLgm35Bnk+pm+4P48jRJKZ8YypMZVDOmHOGo9JVUy0ifq3Gt+uezXjjLzmHCYKwFYprIF97a3+rG11f5g5JRBdTdH9ynoa74ZfRtT8LVAaWyvq1i7Q73q5F8flilsyCMVJx6wBf+ooCktsrbkNmgHInKMvTdsf+iyCE1t35B8UOMXbZdH29PgfB1lsbIn6TcbEzMihFoytERPf6OvVWJSqpIrtkhuBbRV/+WYl5X1IwNl1wEwgyFJkrg1c+u9mPdY54pGbOlaQMBizrDluAiHffPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.de; dmarc=pass action=none header.from=advantech.com;
 dkim=pass header.d=advantech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slJgHHGMHOS4Qi9U7h5cbySlj/f2icD044PV+7i7KvA=;
 b=Q2cZcvgZ1jqci+9oseadv2IRg3IGKdY9QdqpaU8QRmvuTZFEsFkuYOhKeqJFdH008pd7zmGBql4OHMbl26hNXOpxINm4jO//jaW3LiF27ey3zPaE4kGtaS4+/es8DsGNkFAD0IB1dhLdV7pxjc53yC0RBakomz1spq6Ktnk7S+v73LpSM8K3ji4yU1+YfACu163l+hb+e4KtN8bhTjJw5MBDlQMPJ9psJ/5NS2tET/WMlNJgw3gCWRIOF0+fcyPNinwLo4EWJb/nHD0+ry61k636G/7TMX/j/EKgEEz6Yc0dHr5K1POSEQvoT8ROOf2bra+Fd6jOQKqxD26f8HHpXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.com;
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com (2603:1096:301:21::6)
 by JH0PR02MB6564.apcprd02.prod.outlook.com (2603:1096:990:3f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 16:41:26 +0000
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::59c9:fe0:25f6:702b]) by PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::59c9:fe0:25f6:702b%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:41:26 +0000
From: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Date: Fri, 12 Dec 2025 17:40:53 +0100
Subject: [PATCH 2/8] Add Advantech EIO GPIO driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-upstream-v1-v1-2-d50d40ec8d8a@advantech.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8215;
 i=ramiro.oliveira@advantech.com; h=from:subject:message-id;
 bh=q6wa7ZjhA7DO7xNYwNG50IKMS8562P6Qm3UwUjgwYrQ=;
 b=owEB7QES/pANAwAKAc7t0Ke8vbAJAcsmYgBpPEWggb/tK8mBEyTV/JmgJmq6JhdHCUTe/LhdQ
 QRRaQ2DbI+JAbMEAAEKAB0WIQS1Nkng0ZvJmBKh6GLO7dCnvL2wCQUCaTxFoAAKCRDO7dCnvL2w
 CZReC/4y6qkdnWeQ5ze9BOXE6+E8/fWQ21Mk5Emm55k29muLzc+cVEMuhA4jtmBmh8XVEaK6yMT
 8Fa4WiwYBJhR04803SAWAcqtL0BQpIEyXSs0E3om3KEhHDP5reCIsePUKkpRojC+VjKHzPIj2yS
 CbhHNaGJhGlHmphouO/mVjAZW6oe69pzc67rt1mT/FjaNd1XocjBbplOIo0IECIhYDt1/v+1l7S
 gCnuzJ0awsq5dvSECX9o9+Vqm3MmvQ4NxIbGxTbSqX4N5juLU2omA29IQwEOeUE4XVLiNALITaq
 9XWx57q4txiA88uJ+TNwamLF/lJvCC56mCb+6li05yzeIJAY4TDRQ7ng8hk6+zhQLDLZNlzucrt
 m302GfTUUCcqczpgKL5xFfIPbDqcagEcvaleUD7VAfplJ6J13U95RM+jODJ7i0CiKTcrl47lfh0
 RVYwvIqPkwJtOMQM7m8Nx26qG7M4jX3fWwkgsVHgPD6uF2EaKAHSni2Za2RhNoCqDeN8k=
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
X-MS-Office365-Filtering-Correlation-Id: 15b65323-0eff-4b48-38bb-08de399d4b1d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVRGcjN2VUVsOFhIamhxajhDOWl0dXU2NU1yQlFXa0UvVGE2RUNUMFgxVUl4?=
 =?utf-8?B?Q25xVUFrMW9CZGc2MGVjc3BSQm9YWEZ1THRZYWRkVkU3TkRxSy8rWWpyY0lI?=
 =?utf-8?B?Qmx4dFJUNVpWUkNyN2pldUVMaWhFN3o2eHFKcmhpZ3pNeWRsN0FwaWhYd0NW?=
 =?utf-8?B?TU8yNy80aTFSYThQKzlEZnFWTkxua0lJKy9mcTVJQVN5TkpWdmY3dGs3YjFP?=
 =?utf-8?B?a3JJZzBXSS9jMlpLVGNOUUZSdVEyVlY0ZFF4RG0ybXlXeWszaExiaUZqdFNo?=
 =?utf-8?B?blV0eWxrREUwT3ltTXRHcGY1NEEycFdiUDNOVnVoSEpyTmxtNzRhWjEzYWQv?=
 =?utf-8?B?eEVncDhORng2WDkzeUoxL3Fzc0JsQnEvbGNlR2didzhBZXJtMGd2cU5JNUh5?=
 =?utf-8?B?SnJTTGNJTlpzMVgyTXZJWDFNdGYrZnpnbHpGeDVKcFdxVjV6RnVpd2hRbUtr?=
 =?utf-8?B?dGduRGRuQnFSTVVuMlRnZmVZcE9DUVM0bG42ZWYrZXE1cmRtVjY2NVFpcGxE?=
 =?utf-8?B?cVhXZDBKMnRyNjROaDZUbXZCeUdkRDZIWHQ2cU1JYys2TDhaNGl4eXhBd2lW?=
 =?utf-8?B?KzdYcDNlVFBLTjBwcHJ3bWF3akdxWXNLM2hnSzJ3TS9jS1QxQktlS1FuRmJo?=
 =?utf-8?B?SnhJeFRIWXVlS1dGUDhWaS9KdFZJcjI2R2hKT1JwTHE2S2paV3B3NUlOWEp1?=
 =?utf-8?B?azF1dDRNWlpWcFk5SElzVGNuc0l4NWJDOTNDV3hNbEpLT1ZXSEZkbjFxN1d1?=
 =?utf-8?B?aDRWVnJzVkxESElKbXRrSEVtYUhydDBIaW82bkdlREVWRjI2ZDgzdGx6bUg2?=
 =?utf-8?B?OHJDSmhKNHRSUHVVK0xwUktmVzRSTytJOHRBYmFHTFRLeDRvVU15bjR3aWl3?=
 =?utf-8?B?Y0xEbmhRNi9temRHc3A5dFRoTzZocW9GYmpRa0w3S214bVlzS1lvWXlIbE5r?=
 =?utf-8?B?SjdRVytGTy8yKzVkUGtlRUhneDZkRzhCRHhTWE9QaFNOOEVZZDFZSjNsK3ZG?=
 =?utf-8?B?Z2hDWXdLdTdLTSthalZBSnR5SDYvdy9QSUlMdEFXVGxXSlY4aTVqQVI3ZEp5?=
 =?utf-8?B?bTNwakVlL25oZHB4MW9rZS8walp4VmpKblYwbnN0K3FmWjg5N05xU0FKb3Rj?=
 =?utf-8?B?WjltanY0RE5WMmplRmp5a3Q1WjNNcUlveHozYlJpc0VPNzJXYzh6SUFTajdw?=
 =?utf-8?B?bXpnaytrS1FjTWRZNXFoYllLRGZFQzFGVXRQcWxoRTBDNzZZc01VNTFyZWhG?=
 =?utf-8?B?d08rSThEbm5Yb0ZhUW1yT0c4cFQwS3NYR09XRzFtZkc2azhtajNwOVFKckJ3?=
 =?utf-8?B?b1BZRkxHMlcvMVRXQ0RrNXo1cjE4djVNYXJzK2JtbjRkeGVram1DU0xzdnpF?=
 =?utf-8?B?cE1KRHEwNHpzNFdpUFNTUVZTV1QweStVYlRGV1Q5dWZ2L3g5UW9URkxuaUk5?=
 =?utf-8?B?OFlidU5kTGlrTG5iUlNCV0Y1NVpPMGV5MXNKS2g3MC9NMGEwUFN6K3RXQ0RM?=
 =?utf-8?B?enN0RHBPcEZXWlppR1pLSC9jajA1NDdkQndQUWlsWklBT0luSXd5Z0pnQWxx?=
 =?utf-8?B?bFZLOC84RmhwY1VlYWpBcXJLV0dSQnBoNkpMd25xRlpObWNBUXBFcFkwc0hY?=
 =?utf-8?B?THZMR3VuclVGRk5jSlRGeEs5ZXZta2dtbXhTaHdPUTc2YWtWRitUZ3grcTdE?=
 =?utf-8?B?V1pJYStUYlpQL0ZpUHFWdmozZTlNblpUUU51SXd3MzFQaCtRUGQyemhneThH?=
 =?utf-8?B?WTcvVDhPYXJxU2R4ZkpvTmV6eGZJQllpVHpBa3dIeERId2ppYWg2L0Z6akd4?=
 =?utf-8?B?bFVjZm5UcUpYcTlUZHRkL2J4OE1hYytoQkQzWTJFOG55alE2QkpWQUNMWi9Y?=
 =?utf-8?B?WEZLMWIvbkI0b1ZkVmhnSFBkUU5idHNFR1gwbHcySm1FRnM1NFdSeSsreEJv?=
 =?utf-8?B?Q1FhRkQ3NnJGYWJybEZHcVdQUC9YYzBoY3dHVjEvcG9jWEgvN1dTZ2cxWE1D?=
 =?utf-8?B?MUNlY0pWK2laQzFIUEFMc2xRdjNldk10TGx5cS9MRVJJUWlxSTk2SFgvRSts?=
 =?utf-8?B?UzRhOUVYaUpqZWFpbXFwRkFGakh1S1JySkJMUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR02MB4502.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0hUNTBaczF6VTVnUThUQ2x5eXM2OGRqem5IQ3B6RFVpVEMrcVFBNGpSUE1I?=
 =?utf-8?B?YzNWcTFuV25qUk5FaTZwTTg0TWduZXViUDlGNTE4NUxEZFNqaHBaaDc5ZVI5?=
 =?utf-8?B?VTR1ZzhSTW9EZ24vaU9VZWc1NFAyc25NNE9wb09tZ2N6amtyUFh1eEJkdUNY?=
 =?utf-8?B?dVBTUDJsRUNqSHpEWHoweW9BODBRSW5OYXU0RlJYdldsUllXVUVCRE0vTWFT?=
 =?utf-8?B?OXlDWFNxb3BnYzhTVS8ydWNSbDhxNDVFVlBmTnRIR3gxWU1mcHAxV2E0aEVN?=
 =?utf-8?B?RUZzd3pMemlIOFRCaFkrZVI4Y05RQkJDU3hEUDBDbWVhdG51Lzh4VFAwU2Zq?=
 =?utf-8?B?SU9IMEhCTk10eEpyQ3FlQkxIK0d5dHJEMGNoRnBrNDdWZmU2T0tCTmNWNmJ6?=
 =?utf-8?B?L0x1RlFUZW9Vc3NDcnR1NWJieVZ0eVcwZ1NnTFhIa25jckIzVEJZWWJ6Q0xv?=
 =?utf-8?B?RENTNXNQOGNIeTZYN2xlRFhKZFhZS01zcDhVUXBBdUxOZG1uc0FUak5yakpF?=
 =?utf-8?B?RmlvRDNyRllKWm9POGUrYVRqb1dIZWUzWVN4d3krcFE3cUNtOGFUZUJZc2dn?=
 =?utf-8?B?NGNrVGxNSWJFZGFFN3ZTdHFYellBRFNPRlhYcUZTWEJtLzZRaHNKWEZldTNN?=
 =?utf-8?B?aFV2VmxSMXRoWFZxWnpHRmUvSnUzUHc0Wk5VL3g0S1NJV0ZIMFRGVTNUb2NL?=
 =?utf-8?B?OEs1VnUvNGEybGxkZFRPYit0TWxZbnNha0NsRVVuRjFQR21NeXFPOHp3ZTdD?=
 =?utf-8?B?b0paRkZRVXJZbmJKTGZvemYvb3hBcG1tTFRXUGlYZ1cwQTNzbnpIcUhGUFRB?=
 =?utf-8?B?T1ZlQUx3TWFaSXRIUCtLdzVMSWVGNFFmeGV1UEpSZkM2ZUZITnEvQXNzdlFt?=
 =?utf-8?B?WWtUdnhVbFZmeDhVWHVhK0xZQ05ZU1k5ZW1BeWRrbDByY1ZncUhYaFBHYi8v?=
 =?utf-8?B?N3A5SFhvUk4wUyt0U2dNUVlYbStQVjdOYVlMdDJCcDJ2SjJsMnNZTUVLbERk?=
 =?utf-8?B?anRaaGFpNWJJZnI3dEVBa3BhRHJYS08xeHY3K25iK0ZjdFRYNmh6ZHVqNmN3?=
 =?utf-8?B?eDFlL1AzYjRIL2VIRnRRMlhFRkd5RlVFNTc3ZVFHR3JBbDNZZ3VhTURWQkFF?=
 =?utf-8?B?Vm5ZcmpCRFY1Q3B4SnZpSWFmdzNLMndCMmpYbnRvMjJwRFF1YkpyczQxSG92?=
 =?utf-8?B?OW45bUYxSk1SaVl4N0w2UGo2S21rbHRaTlZvNVdPZk1qRmQrV1Vtdkd0YWk1?=
 =?utf-8?B?cFQ3RHI1ZEtOckVDYitnVlVsRTd4NzlKbGJERkFBcllydEVnK1ZpQVl6UEJM?=
 =?utf-8?B?VEtmeUttLzVQNDIzQjFrdzdVaEZtbDRuTi9WdUhlTVYvZWJNcHpLL0t6TUxF?=
 =?utf-8?B?R2pkS1BHQ3RYaDlFTFB3VGkxOUFPeG1kd3VBTVU3VHNyUHAyd3JtMnZwZmRV?=
 =?utf-8?B?cUJqQlA2Q1hMdHRVeHErUUhSdXk3YjVkelNuM05FRHFndElWK1VLSmFhdzk5?=
 =?utf-8?B?b3BiazZWWVNsWmNmUnlFSEZmQTJFU1hiZXhKd01oSVNQS3dicldXdy9JM3lU?=
 =?utf-8?B?YUxhUkVjM0YzeEZUOWxtdmZtZk0yTkZrbTlwbVdxUjBlUkI5dHlUUzBDUEhU?=
 =?utf-8?B?elBJOUhydjBqV3llMFJQUGNKQ3dPblEwSTNGL1BBS21Ec1lrbVdwRE0ycWxq?=
 =?utf-8?B?TXBqRE8zRVVHYkJLQ3NEc2pKMnNjSFBJMVV3OTgvOHRiQlJLdjhkaU9NRHBB?=
 =?utf-8?B?NTQ4ZkNUNFdwQzlKVGpkdjc4R2ptbWdqMHlvcldQNnYyNGJSZGdCY0VyVmVz?=
 =?utf-8?B?TFhZTTN4UjN6N0x5V01xU2VNZHNWeWhUVUZ1dFcxbmxhVFZ6TnBlWUFGSkpk?=
 =?utf-8?B?cnNvelhqSEJRZFdsTTA0Vkl5eHdFMGFML280dTVNZkorYTJnNmJlVnBJNE1V?=
 =?utf-8?B?anc5eVVlMVFXS2hEbWs4K0dMaUs2SWZUcEJubTc2UzVZOThPcXdyTXBsN01a?=
 =?utf-8?B?ajBIU3NXd296dDlrQnFxOTgxU3VOT1dwT0tCZlpuTWNaZzFuazRCb1ZUTEJR?=
 =?utf-8?B?MisxTm1kcUJZTFQ4V0xGQStEcWQvYW5rTTRMSnEwMGg0N3NUQ3Y0VjVuWFJx?=
 =?utf-8?B?eGM5UEZnQzJ5MjlxcGwxeVlzZTBpbUFsREhqb1dqb2syaDNaanBNMU9mZytm?=
 =?utf-8?Q?zm3Dhn40b8lvD+HdK18dpaU=3D?=
X-OriginatorOrg: advantech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b65323-0eff-4b48-38bb-08de399d4b1d
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4502.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:41:26.7458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGL25qnqpfYID+hMYoDrPNqNAXWem03s6nTlKfws+dyIXjNbLXQpiiWTwmnBp5QqUIGIjmfFirlz6UDFI1SrX8xT4bgYQZehfHSTalP0YD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB6564

This driver controls the GPIO component of the Advantech EIO chip.

Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>
---
 MAINTAINERS             |   1 +
 drivers/gpio/Kconfig    |   6 ++
 drivers/gpio/Makefile   |   1 +
 drivers/gpio/gpio-eio.c | 273 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 281 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd9279796c2f..359d4a13f212 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -619,6 +619,7 @@ F:	drivers/platform/x86/adv_swbutton.c
 ADVANTECH EIO DRIVER
 M:	Ramiro Oliveira <ramiro.oliveira@advantech.com>
 S:	Maintained
+F:	drivers/gpio/gpio-eio.c
 F:	drivers/mfd/eio_core.c
 F:	include/linux/mfd/eio.h
 
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bd185482a7fd..628a914842bd 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -277,6 +277,12 @@ config GPIO_DWAPB
 	  Say Y or M here to build support for the Synopsys DesignWare APB
 	  GPIO block.
 
+config GPIO_EIO
+	tristate "Advantech EIO GPIO"
+	depends on MFD_EIO
+	help
+	  Say Y or M to build support for Advantech EIO GPIO block.
+
 config GPIO_EIC_SPRD
 	tristate "Spreadtrum EIC support"
 	depends on ARCH_SPRD || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 2421a8fd3733..ba3883d5e4a0 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -64,6 +64,7 @@ obj-$(CONFIG_GPIO_DLN2)			+= gpio-dln2.o
 obj-$(CONFIG_GPIO_DS4520)		+= gpio-ds4520.o
 obj-$(CONFIG_GPIO_DWAPB)		+= gpio-dwapb.o
 obj-$(CONFIG_GPIO_EIC_SPRD)		+= gpio-eic-sprd.o
+obj-$(CONFIG_GPIO_EIO)			+= gpio-eio.o
 obj-$(CONFIG_GPIO_ELKHARTLAKE)		+= gpio-elkhartlake.o
 obj-$(CONFIG_GPIO_EM)			+= gpio-em.o
 obj-$(CONFIG_GPIO_EN7523)		+= gpio-en7523.o
diff --git a/drivers/gpio/gpio-eio.c b/drivers/gpio/gpio-eio.c
new file mode 100644
index 000000000000..50f66a325e8f
--- /dev/null
+++ b/drivers/gpio/gpio-eio.c
@@ -0,0 +1,273 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * GPIO driver for Advantech EIO Embedded controller.
+ *
+ * Copyright (C) 2025 Advantech Corporation. All rights reserved.
+ */
+
+#include <linux/errno.h>
+#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/eio.h>
+#include <linux/module.h>
+
+#define GPIO_MAX_PINS	48
+#define GPIO_WRITE	0x18
+#define GPIO_READ	0x19
+
+struct eio_gpio_dev {
+	u64 avail;
+	int max;
+	struct gpio_chip chip;
+	struct device *dev;
+};
+
+struct {
+	int size;
+	bool write;
+} ctrl_para[] = {
+	{ 0x01, false }, { 0x00, false }, { 0x00, false }, { 0x02, false },
+	{ 0x01, false }, { 0x00, false }, { 0x00, false }, { 0x00, false },
+	{ 0x00, false }, { 0x00, false }, { 0x00, false }, { 0x00, false },
+	{ 0x00, false }, { 0x00, false }, { 0x00, false }, { 0x00, false },
+	{ 0x01, true  }, { 0x01, true  }, { 0x02, true  }, { 0x02, true  },
+	{ 0x02, false }, { 0x10, false }
+};
+
+enum {
+	GPIO_STATUS	 = 0,
+	GPIO_GROUP_AVAIL = 3,
+	GPIO_ERROR	 = 0x04,
+	GPIO_PIN_DIR	 = 0x10,
+	GPIO_PIN_LEVEL	 = 0x11,
+	GPIO_GROUP_DIR	 = 0x12,
+	GPIO_GROUP_LEVEL = 0x13,
+	GPIO_MAPPING	 = 0x14,
+	GPIO_NAME	 = 0x15
+} gpio_ctrl;
+
+struct {
+	int group;
+	int port;
+} group_map[] = {
+	{ 0, 0 }, { 0, 1 },
+	{ 1, 0 }, { 1, 1 },
+	{ 2, 0 }, { 2, 1 },
+	{ 3, 0 }, { 3, 1 },
+	{ 3, 2 }, { 3, 3 },
+	{ 3, 4 }, { 3, 5 },
+	{ 3, 6 }, { 3, 7 }
+};
+
+static int timeout;
+module_param(timeout, int, 0444);
+MODULE_PARM_DESC(timeout, "Set PMC command timeout value.\n");
+
+static int pmc_write(struct device *mfd_dev, u8 ctrl, u8 dev_id, void *data)
+{
+	struct pmc_op op = {
+		 .cmd       = GPIO_WRITE,
+		 .control   = ctrl,
+		 .device_id = dev_id,
+		 .payload   = (u8 *)data,
+		 .timeout   = timeout,
+	};
+
+	if (ctrl > ARRAY_SIZE(ctrl_para))
+		return -ENOMEM;
+
+	if (!ctrl_para[ctrl].write)
+		return -EINVAL;
+
+	op.size = ctrl_para[ctrl].size;
+
+	return eio_core_pmc_operation(mfd_dev, &op);
+}
+
+static int pmc_read(struct device *mfd_dev, u8 ctrl, u8 dev_id, void *data)
+{
+	struct pmc_op op = {
+		 .cmd       = GPIO_READ,
+		 .control   = ctrl,
+		 .device_id = dev_id,
+		 .payload   = (u8 *)data,
+		 .timeout   = timeout,
+	};
+
+	if (ctrl > ARRAY_SIZE(ctrl_para))
+		return -ENOMEM;
+
+	op.size = ctrl_para[ctrl].size;
+
+	return eio_core_pmc_operation(mfd_dev, &op);
+}
+
+static int get_dir(struct gpio_chip *chip, unsigned int offset)
+{
+	u8 dir;
+	int ret;
+
+	ret = pmc_read(chip->parent, GPIO_PIN_DIR, offset, &dir);
+	if (ret)
+		return ret;
+
+	return dir ? 0 : 1;
+}
+
+static int dir_input(struct gpio_chip *chip, unsigned int offset)
+{
+	u8 dir = 0;
+
+	return pmc_write(chip->parent, GPIO_PIN_DIR, offset, &dir);
+}
+
+static int dir_output(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	u8 dir = 1;
+	u8 val = value;
+
+	pmc_write(chip->parent, GPIO_PIN_DIR, offset, &dir);
+
+	return pmc_write(chip->parent, GPIO_PIN_LEVEL, offset, &val);
+}
+
+static int gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	u8 level;
+	int ret;
+
+	ret = pmc_read(chip->parent, GPIO_PIN_LEVEL, offset, &level);
+	if (ret)
+		return ret;
+
+	return level;
+}
+
+static int gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	u8 val = value;
+
+	pmc_write(chip->parent, GPIO_PIN_LEVEL, offset, &val);
+
+	return 0;
+}
+
+static int check_support(struct device *dev)
+{
+	u8  data;
+	int ret;
+
+	ret = pmc_read(dev, GPIO_STATUS, 0, &data);
+	if (!ret)
+		return ret;
+
+	if ((data & 0x01) == 0)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static int check_pin(struct device *dev, int pin)
+{
+	int ret;
+	int group, bit;
+	u16 data;
+
+	/* Get pin mapping */
+	ret = pmc_read(dev, GPIO_MAPPING, pin, &data);
+	if (ret)
+		return ret;
+
+	if ((data & 0xFF) > ARRAY_SIZE(group_map))
+		return -EINVAL;
+
+	group = group_map[data & 0xFF].group;
+	bit   = data >> 8;
+
+	/* Check mapped pin */
+	ret = pmc_read(dev, GPIO_GROUP_AVAIL, group, &data);
+	if (ret)
+		return ret;
+
+	return data & BIT(bit) ? 0 : -EOPNOTSUPP;
+}
+
+static int gpio_init(struct device *mfd, struct eio_gpio_dev *eio_gpio)
+{
+	int ret;
+	int i;
+	char str[GPIO_MAX_PINS + 1];
+
+	memset(str, 0x30, sizeof(str));
+
+	ret = check_support(mfd);
+	if (ret) {
+		dev_err(eio_gpio->dev, "GPIO not supported (%d)\n", ret);
+		return ret;
+	}
+
+	eio_gpio->avail = 0;
+
+	for (i = 0 ; i <  GPIO_MAX_PINS ; i++) {
+		ret = check_pin(mfd, i);
+		if (ret)
+			continue;
+
+		eio_gpio->avail |= BIT(i);
+		eio_gpio->max = i + 1;
+		str[GPIO_MAX_PINS - i] = '1';
+	}
+
+	dev_info(eio_gpio->dev, "GPIO pins=%s\n", str);
+
+	return eio_gpio->max ? 0 : -EOPNOTSUPP;
+}
+
+static const struct gpio_chip eio_gpio_chip = {
+	.label		  = KBUILD_MODNAME,
+	.owner		  = THIS_MODULE,
+	.direction_input  = dir_input,
+	.get		  = gpio_get,
+	.direction_output = dir_output,
+	.set		  = gpio_set,
+	.get_direction	  = get_dir,
+	.base		  = -1,
+	.can_sleep	  = true,
+};
+
+static int gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev =  &pdev->dev;
+	struct eio_gpio_dev *eio_gpio;
+	struct eio_dev *eio_dev = dev_get_drvdata(dev->parent);
+
+	if (!eio_dev) {
+		dev_err(dev, "Error contact eio_core\n");
+		return -ENODEV;
+	}
+
+	eio_gpio = devm_kzalloc(dev, sizeof(*eio_gpio), GFP_KERNEL);
+	eio_gpio->dev = dev;
+
+	if (gpio_init(dev->parent, eio_gpio))
+		return -EIO;
+
+	eio_gpio->chip	   = eio_gpio_chip;
+	eio_gpio->chip.parent = dev->parent;
+	eio_gpio->chip.ngpio  = eio_gpio->max;
+
+	return devm_gpiochip_add_data(dev, &eio_gpio->chip, eio_gpio);
+}
+
+static struct platform_driver gpio_driver = {
+	.probe  = gpio_probe,
+	.driver = { .name = KBUILD_MODNAME, },
+};
+
+module_platform_driver(gpio_driver);
+
+MODULE_AUTHOR("Wenkai Chung <wenkai.chung@advantech.com.tw>");
+MODULE_AUTHOR("Ramiro Oliveira <ramiro.oliveira@advantech.com>");
+MODULE_DESCRIPTION("GPIO driver for Advantech EIO embedded controller");
+MODULE_LICENSE("GPL");

-- 
2.43.0


