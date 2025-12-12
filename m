Return-Path: <linux-i2c+bounces-14523-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EE8CB9507
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 17:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 83FC3303B479
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 16:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DFE02D5436;
	Fri, 12 Dec 2025 16:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b="YUSmd7w8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023098.outbound.protection.outlook.com [40.107.44.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF252D3EDE;
	Fri, 12 Dec 2025 16:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765557726; cv=fail; b=sv4aBtyJZCznJ2bPZEUTBkrim3lZqCJsQOOdcU/GK88xiy9qwQm6cgyetha8hJqNcGYD8lxlQJPrH8jgsiEWeHxbZqgg0h5DbO1pZYshO971aXgGeT0uy821L4tS6yzbtSfKlpuj0Dl1f2BccF3K7RioduMP2VmZY6yIEtfa2PQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765557726; c=relaxed/simple;
	bh=+mf1e1/Qgjxx4qRc+xcsH1LZBaYAaDUMV9iPWaI+pUM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cBAliwARUG1mkKP2MpqRuTWLhApSffR67wsHQ4Vt8Y6/OR734JG6HICfY8vX7m51yAvKGdyjQgyXE9RzSdko6WObTSLZzLG2sIEYZxZIIxWimmnZYyqaW5yv6xxiv5Wb76d7c+CHjpbcNb3/vC1q4fkO9foPHu2TLTxDeTN0Lp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com; spf=pass smtp.mailfrom=advantech.de; dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b=YUSmd7w8; arc=fail smtp.client-ip=40.107.44.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=advantech.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3Kqa+0F0F/9f7Wsl1Uo43gqn66UAFuc7CuwqUstM5t3VVhsB5fZpEP2juDsorQw2gT6zTv+5GzHm8qljgb66Ge425LyI/x293pMfehEZIzyAKheYFtG0JA+0WHP9S8dmEPcAoyE9P7rvByhkSpx80IHpNe00+rlzog4/mVIZD5cVvE7j/UHkDcto4B9mrWTHKlD7ffngTjpEF4SSdwVOE/HQfdZ0GnoG7CpnkLEiNqriA0cdVSHYRdHvRm74WoQIQuujp9g6cDqcVvsqic5p6QL/Iqv0GaDA5Wm7Ut792HMrFUEEVbGwES4UQ0d1fZthgU5jTt9ya/QOlIIsQVPCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7SbUrJTLMWqLniZKK8rb7xUwVoI8860SWHs36/sMyo=;
 b=qEcxTXZE8vTbAGcLYSn3HBCqnXAzXdWN+j0Cq4toM0hf2vbx5egyC4UpF1moY9aM0oKkOoJ5VRcKvsISFoBXb1BBvSrv9yEzzQjwMaqMjyW3zFSaosglM6i2Fm5gtaMOUHkqCMwJ1BYwg70eFGe2JZTZcDRm8Afspi9G/QkP5e6RGdz7jA+qY/s/K/5Kyufuoq732vfkrm5chPPDrkx6KzfO6pG9o6SmkKnuv/b25HNLS1Ksup+8/FQ6lFnGFOlQmqe7rO38cwUIavp+twW4U3yPPksWhRZvCzsTBKX/Uo3L9Rs8bPqAa6SfHWIX63hGW0BYZfZuqQafJaZP/3jGLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.de; dmarc=pass action=none header.from=advantech.com;
 dkim=pass header.d=advantech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7SbUrJTLMWqLniZKK8rb7xUwVoI8860SWHs36/sMyo=;
 b=YUSmd7w8Nh5Zruu2ukZM8S0WgxoR5nXmAtMfOppDNQdQ6SOSbrDv873HIEvfZ1xgWC/DbFiom+q01kjqEDL8RhIneWcpYgb2TW9E7wWf2CibYyQEJtGALkwtwzRmP5XzVGCr87WijKWH0OspiYCtJhMXXLN/mgpHNSMvJo6+KPlLYoHT/4mSooZH0F9IWs/m13HLzXLFf760rECVBv9AAcSi1PScxgxfckveBo8tKTiTK73JCs6B0F2kRPev7JZvOe7g9O7so7/FrUud+vbuOIkEfpzwghEZo5t40KOs6UHc3aCb/kWyoXjM3eDYg5tZsYyzUj/He/vYgrJsoScN1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.com;
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com (2603:1096:301:21::6)
 by JH0PR02MB6564.apcprd02.prod.outlook.com (2603:1096:990:3f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 16:42:01 +0000
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::59c9:fe0:25f6:702b]) by PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::59c9:fe0:25f6:702b%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:42:01 +0000
From: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Date: Fri, 12 Dec 2025 17:40:58 +0100
Subject: [PATCH 7/8] Add Advantech EIO Thermal driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-upstream-v1-v1-7-d50d40ec8d8a@advantech.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13005;
 i=ramiro.oliveira@advantech.com; h=from:subject:message-id;
 bh=+mf1e1/Qgjxx4qRc+xcsH1LZBaYAaDUMV9iPWaI+pUM=;
 b=owEB7QES/pANAwAKAc7t0Ke8vbAJAcsmYgBpPEWhgA/7ELK0PHu90Za6FQEniN27XlsnvalFp
 4oogzZggLqJAbMEAAEKAB0WIQS1Nkng0ZvJmBKh6GLO7dCnvL2wCQUCaTxFoQAKCRDO7dCnvL2w
 CRJzC/9FdOBS39jN7XlxbEb3VdvSWHLW1SwTmvIB/tdhzvY0TDawWy0R0oQZt7wSBFQvzuzqMuL
 JapylBMLyXc3sn+Tmwxf2Ugm0QR7+L47PDxOV2dTEov9awuYJ6RilBRKLl2LFEExG83pS+Rcd48
 6GYDboripJw1qk70igQ4EdwBgKQsh/lrgUG8RGk6bB/5ggzxTXtlpkM2A0fzJ9wcDWcGebKyoy4
 c7hg8IGjB+fjhd4TK1XLdcrQOdfXhfVmGhF8kJKM945ASBvL7zUZ0Z85Q/T5Lvj3i926XQJph3M
 WQAXsg9Jh7vwMcK4vo9GuLUzMpcJOLz+T/Ji2FZoBokKd3ZZYvlsu4z6I7Gz0heZPpSUY05JRGW
 RRJu4vGICovYbXRcWVxrSkTIvuSY8egel9YVOfBiRocVBAJEn6wTfwCkPyJ69UgT6IYWP8QVGL5
 OXpw/FS9K7nt64sl5wAXu14fYzWzpgkUQjdw+5sp+m5ZBUKhY/q24INwOLcYSLUfyDLBY=
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
X-MS-Office365-Filtering-Correlation-Id: 7b237e26-f301-4c95-4dc3-08de399d5fee
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGJpMEJvVHZqcEVwV3RMMHVXcVQ2WjJLL0J0ZFlhQUtRaXF6d1pjSjQrWHB4?=
 =?utf-8?B?ZmN1bW82OU0xWnU1eVdkdjAvcmI2QTJDdDV4NUh5TWpVY1lIY3hiMUZEdEhS?=
 =?utf-8?B?bEdmei9HU3RubGF5NVcvOUxmSHhIYUwvbFRFTmFrZWxwb2hndGl4WGNLNmNr?=
 =?utf-8?B?WEdUUjFHYzRMeFlHNEpYR0FBS2I1RzR4MXNzb08zeEl5elUyczBNL2FnSGFK?=
 =?utf-8?B?YWxIVndJVWRLTGNyM2lSNXV6Rk4vMVVPY254KzhIek1MOElaQ1g0WGwrZ2tm?=
 =?utf-8?B?MlFpeFVmTVJmTmNlWnExalRtV3pSUzV5Yk92aEZ2REhkc1hBM0M1THRkRHdB?=
 =?utf-8?B?RDliYUZURVhlUGVGZFV4YzY2cEhXbFNrcG1hdy9EQ0JDY3VjYmJ0Z0ZScWhP?=
 =?utf-8?B?ZEQrL1k1cm1GOUJkZzZPRzJYWUV5VDM0VmJGY2JhSk01U2F3M1kvcWs1WElk?=
 =?utf-8?B?YzFtL0tRRzVJM2ZGenFhZ0dRYmtuZXJhdGRIMmJKc0lOc3FaMzNhd3NJNWhC?=
 =?utf-8?B?V0lnU2taZ1o2UnBQWUVSUkNpU2ZVSTQxWXU1WE1TYlB3aXdzcm5YaWhiOExR?=
 =?utf-8?B?N2hva1I0SHpEZ1hXSDNuMlVsTVUxNXFQUWEyNFRNRHhEd3JCbkdsUFB0Q3pG?=
 =?utf-8?B?bktSL3NEcEYrbTd5YW14Q3J1eTVYYWZUd0YvcTJYVW9kSUpYNHVVc3c4U3d2?=
 =?utf-8?B?SkVZMXgxbDhqWjN4eEZPdG01VjNXSVROeEl3NFNuV3BaU09nTEFidkt0Znl6?=
 =?utf-8?B?S1BaZ1JUYkVheFozRExrVFJMdDdjN244NWl5Y0pCMVdlYXM4SVkzZnhuR09z?=
 =?utf-8?B?MCtpaXVvVVlkOFJpZnBhaFhqdlUxcW1JQS9EOC91L1pMaVNMTURyMDBsZnBB?=
 =?utf-8?B?enVtaExqWXNiVk5SZnJyckpPTWNzS0RBZG9QMXpGbXJQaThQNldubDhZRXNu?=
 =?utf-8?B?MEJwbEdQcG9hZXlLYkVZRGRkTDhJWitnMWhxSUo2WWRFWFJxbGEzOTdXaWUx?=
 =?utf-8?B?VHhHdFRxRWxTVHhSOGZGM3BMU0pmaFhQWTBmWTNYRm9RRnNrSUV0d2R3RkhR?=
 =?utf-8?B?R1VsSWpwMG9Fem9FSU03YU1MMTBkK2JBMGEyWDR2QWp2UU0vYUp5WmxsV2lM?=
 =?utf-8?B?QzVCY1prM2Q4NFlNV2dhMGoza05yUDVsRUR6OVVSM1l5eitUaXlzYVZMSXpO?=
 =?utf-8?B?Y2RYRUwwTkkxdU43ZmRORjFaSnNhV3p0cW5CTmRLLzRDZklaYTFBNjdldzJ3?=
 =?utf-8?B?Y080ZFZkS1RUZDF6SHhCL3ZKdTBjZGdOc2hLaTU0c3Q4UDVYZDZoMEtBeVk4?=
 =?utf-8?B?Z2d1cFZVOGlNcHBPSHo3WnhneHNlQ2crZWZPOXlIQW54VEpkZmR3TGxkcklz?=
 =?utf-8?B?ZWlmK3d0S0lGNC9QN2VYa1FSdG43elV0T2xxdHdIVmgvNGk5eVdybUdCQ1Bi?=
 =?utf-8?B?Q25MVWljbkcwL0xram5nZ0NURGxBTTNadG9Cc1pXNEpaZlM4ZHR2TDZNdTN0?=
 =?utf-8?B?aVlsd0phcExPS3dkemk4REFyTnNEK0FKUTkzY3pxdWNzeXJsRWsrbzh6bW43?=
 =?utf-8?B?Y3RzWXkrZ0JranZYS1h3UVl3K0I0TkNhRWNRUmJLNUhNb2h2OXhCTGFZcitF?=
 =?utf-8?B?LzljaWUxT05qRk1QR1l2RVBhTk5wdTVkTUdxNDRkWVlpT0RnZ29aNmZkU0dX?=
 =?utf-8?B?RFUzOER0d1hmM1dlVFNLT2Yvc2pJa1hVTmdmRDRiQVp3a2FFZE0xMHdsd0Vr?=
 =?utf-8?B?c1JXRGE4KzFwZzVVNk5iWTNmUThjVGl5Qzk0Ykt0bXZjeFNzdnkvRmpKSzY2?=
 =?utf-8?B?ODFzM1IxVTM5KzVpTU1jemVzR0IxZEpCTXlCbU9TeHNGZlE4T1U1N2xZWVZ2?=
 =?utf-8?B?a1dXczRtQjRuTGFBbTlnUHlBN1p2SUt3THh3d2pCUEYySUowMDNiTWVXM1Nv?=
 =?utf-8?B?SWk3YTJ6N1YzM3NKd2Q4eUpVUjEwYVBLRzQ4TXJOeWZzc1pLWnhUc0NnaXJN?=
 =?utf-8?B?QXpUeTI1c0ZOcExMSkhjTkh3K1JVSCtPYmN5MWtVcHhSMWVvc1ZhOWlDYXdu?=
 =?utf-8?B?QU9BNnZpcmpwQ0pKeWZmNUd3bFRxTjZHaVpVZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR02MB4502.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG1xM2wxYjNJL21NOW9KS29MQ1lhc1VyQ2FTUlRyTXVUSE56b1diT3MzYTMv?=
 =?utf-8?B?dU5oTzZjWFZOTDdHYUdFZ3lYT0wwMUdoS1UvUkJIVlloYnozSW5ESFdqWERI?=
 =?utf-8?B?TlN0TFliVlhtZDRnTFkwTTdNQUVzOUJyWW44b0RIRlg4R3pRekVIcXpkTW5W?=
 =?utf-8?B?WmwyQ0kwbkd6eWhXTjRseVFnK3ZOMnRrR05lZ25QaVhmK1BjRlloVW1QQnRx?=
 =?utf-8?B?cUpQaVQwUUFSOCs2b1NjN2R0YmN3UVg0VVZIcTE3bFR2RTFNRCtOZlFzK3pR?=
 =?utf-8?B?VWFCMkVYTFN6cmxUZ0FGS01ZUVMrWTVaUlhDaXhuR3lUVE1zOVRjeCs0Tk1k?=
 =?utf-8?B?aFRHZjVQSTNkbkJKc2hFc1lYL1RFdkJzbTlTOGhOVDZQRXFxREtRTXYrY2Fz?=
 =?utf-8?B?SStiOURSamx0bnQ1SHdWcmhYS204UFh6cTc2OUttQVZIbE9TUmdaS1huU3Qy?=
 =?utf-8?B?bkt1N01CSEpwUzVjUTlVMHpwWHNQVTJkSytyU3hBVjhnVGQ5NXZ5djdSMWhh?=
 =?utf-8?B?dnRlSkZCTlJXRFVSaFh4UGlzRWtrKzZRRFhrcEtRQmFMVmc5anFSUjJTME9z?=
 =?utf-8?B?Sm41RUs5VUZ5V2E5WXVKc20yckg4VThYd0lDbnJTdk9oVjhFdDhLRFBaOWdB?=
 =?utf-8?B?NjR2YXVVT1ZZSVhMckZCUUN3ZVk3dE5ZRWlGZk4xM003QjloYmdjdnIvcGln?=
 =?utf-8?B?K1FTVElIRGU3c0ozNklKazZUNVJBeXJKby9PV0ZFZXlPU1dCM0F5WmVWMWp4?=
 =?utf-8?B?TTZRV2RVOEMwMUNpbS8xSXFGdll0T0pjM1lJb3BVQm1PUDlVcVdBMW8xemNC?=
 =?utf-8?B?QWxCUVo4bDYvT2g5V0JzdXN1d04rVlJyYXVpcTBEOWJiSHBLU2Judjg1Qlkx?=
 =?utf-8?B?UXBIS2VKRFJSazJ1TnU2S3dyYTJ4czREbTF3b1NTbDUxZzA2MGJCN2MrRFBF?=
 =?utf-8?B?UTBhNmwvb0g4T1dqYzQzU1EzeWhKSTBXS1R6RjdFaTBzZHpobEJ4UjB2UkpT?=
 =?utf-8?B?aGtYMmgzcFVYL0lIeDc3YzJJbW1oRFNzVnFqM3lLanNvT3ZQdVRWWis3Mkxp?=
 =?utf-8?B?cU8xdW9nbkNCMktNakZxZnhXejBoVGpTd2kwWDFFaWdNMjZSM3RCZVlwMFdR?=
 =?utf-8?B?aTBwbExEZmNWNkVkU0wrUStkOXlXcGpjVXMwTlpSRC9oTlk5aEpOTmZCMmdC?=
 =?utf-8?B?TDVqVlRNK3Q1OFBwMkV2Sm5xQ2VCbnJjUVpseCtkbkRVSEI5UklUbkFjd2NR?=
 =?utf-8?B?T0x5b1dweEJ6V2FsckRPalpCSjBGSUE5dVVUOEtLQkRPVzhkZHdrQmppeTR0?=
 =?utf-8?B?cGNvRmloc3Q5ODVXaW1RaWhPVWNjUSt0VktwSEZsRFh0dHgrUm1JNWdld0NH?=
 =?utf-8?B?dXc1NkdMU2FLeXdTdFo0bnMxUUhPK0lBeEZycVk1K0xkdlBVZTdzc1QyN1pr?=
 =?utf-8?B?Y3VHZStUVm8zaSs3VHBNZC9STENYTDVsSE83QlA2bUJnNXJwN2d1WnViTnhm?=
 =?utf-8?B?S3RneUxoMW9HSTRJZDZTR3htcGdNR1p2NUFyaUllQlFUaCtxckRSMUZ0ZUNq?=
 =?utf-8?B?eDlKdE1EL2FXQTFRenF6dVl2M2hveHpnUFV5anVCdE9CdWdxc1lXVFozZG53?=
 =?utf-8?B?blU0TUVXTGZGOEhkRWlGcnB4SnZuTzBSZ2YvbW5LYjVEck95MmMwNndXSXgz?=
 =?utf-8?B?QnYzTkVZa1lQSmtaRStCUFM1anQxNGZkbWtFVUZnRG56Y292WjUvREl4aEk3?=
 =?utf-8?B?aUZ2RkFlc0l0MFR1SUNsRjNoaWRIYlRYblV1QXVHZGJKd0h4THZUNFlpUnNF?=
 =?utf-8?B?a2FYcDhWQTNCbWdaZzJqa1RHZTBoYXRhT2tXeFF6Zkl2czgwbXVXNklwNklh?=
 =?utf-8?B?b3hERkpCYnNmUmNkaDVwMnNObHh3bEdXQzdrSi9SY2lEeUxna3E4LzVWOVdL?=
 =?utf-8?B?YlFSZHVBUVhCSC9mNFRZVHhZZURzcEcrWWxCMm14ZUJHS0FXSGVKcUZlZmZK?=
 =?utf-8?B?WnQvS25xdHN6aVl4T3lnZUJ3d0hEYVB5OUF1TE8zOWZnS1lteHNEMFpQdkZq?=
 =?utf-8?B?OE9yRUJJU1dwU2dJQVVxTzZlT1JFQ25jVzBlSFNTUnhldC9jR2JCK1AxdlRl?=
 =?utf-8?B?TlpqNVJOTnZSeHBKYkhpZEZ2Ykt1MWFoSVhJQWtOaGs1ZHJ4NUxWYWVyQ3pY?=
 =?utf-8?Q?qhDf5hQGPYuIQkBPqvtxZtg=3D?=
X-OriginatorOrg: advantech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b237e26-f301-4c95-4dc3-08de399d5fee
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4502.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:42:01.6281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwkQ9R6sxE0jQlWQNg8ANKC0sXvRhEBNv31usJU3hbJOpgmGsa4R2Tz2NIJkAhhuvNeg/EJ0aQMRp+DaETM4vh9PTJ7bkJepB+CkJGLqiy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB6564

This commit adds the driver to control the Advantech EIO Thermal block,
this block is included in the Advantech EIO Embedded Controller.

Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>
---
 MAINTAINERS                   |   1 +
 drivers/thermal/Kconfig       |   9 ++
 drivers/thermal/Makefile      |   1 +
 drivers/thermal/eio_thermal.c | 352 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 363 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dfdf4f39c14b..770b2f82d01a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -623,6 +623,7 @@ F:	drivers/gpio/gpio-eio.c
 F:	drivers/hwmon/eio-hwmon.c
 F:	drivers/i2c/busses/i2c-eio.c
 F:	drivers/mfd/eio_core.c
+F:	drivers/thermal/eio_thermal.c
 F:	drivers/video/backlight/eio_bl.c
 F:	drivers/watchdog/eio_wdt.c
 F:	include/linux/mfd/eio.h
diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index b10080d61860..7309f7e7a1c1 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -427,6 +427,15 @@ config DA9062_THERMAL
 	  zone.
 	  Compatible with the DA9062 and DA9061 PMICs.
 
+config EIO_THERMAL
+	tristate "Advantech EIO Thermal zone"
+	depends on MFD_EIO && THERMAL
+	help
+	  Thermal zone support for the Advantech EIO. This driver exposes
+	  temperature readings, trip points and protection enable/disable via
+	  the Linux thermal framework. It communicates with the EC through the
+	  EIO MFD core.
+
 menu "Mediatek thermal drivers"
 depends on ARCH_MEDIATEK || COMPILE_TEST
 source "drivers/thermal/mediatek/Kconfig"
diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
index bb21e7ea7fc6..3740540d8a18 100644
--- a/drivers/thermal/Makefile
+++ b/drivers/thermal/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_IMX91_THERMAL)	+= imx91_thermal.o
 obj-$(CONFIG_MAX77620_THERMAL)	+= max77620_thermal.o
 obj-$(CONFIG_QORIQ_THERMAL)	+= qoriq_thermal.o
 obj-$(CONFIG_DA9062_THERMAL)	+= da9062-thermal.o
+obj-$(CONFIG_EIO_THERMAL)	+= eio_thermal.o
 obj-y				+= intel/
 obj-$(CONFIG_TI_SOC_THERMAL)	+= ti-soc-thermal/
 obj-y				+= st/
diff --git a/drivers/thermal/eio_thermal.c b/drivers/thermal/eio_thermal.c
new file mode 100644
index 000000000000..2d82bd9d7855
--- /dev/null
+++ b/drivers/thermal/eio_thermal.c
@@ -0,0 +1,352 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * eio_thermal
+ * ================
+ * Thermal zone driver for Advantech EIO embedded controller's thermal
+ * protect mechanism.
+ *
+ * In EIO chip. The smart fan has 3 trips. While the temperature:
+ * - Touch Trip0: Shutdown --> Cut off the power.
+ * - Touch Trip1: Poweroff --> Send the power button signal.
+ * - between Trip2 and Trip1: Throttle --> Intermittently hold the CPU.
+ *
+ *			  PowerOff    Shutdown
+ *			      ^	         ^
+ *	      Throttle	      |		 |
+ *		 |	      |	         |
+ *	+--------+------------+----------+---------
+ *	0       trip2	     trip1      trip0  (Temp)
+ *
+ * Copyright (C) 2025 Advantech Corporation. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/eio.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+#include <linux/thermal.h>
+
+#define CMD_THERM_WRITE		 0x10
+#define CMD_THERM_READ		 0x11
+#define THERM_NUM		 0x04
+#define UNIT_PER_TEMP		 100
+
+#define CTRL_STATE		 0x00
+#define CTRL_TYPE		 0x01
+#define CTRL_ERROR		 0x04
+#define CTRL_VALUE		 0x10
+#define CTRL_MAX		 0x11
+#define CTRL_MIN		 0x12
+#define CTRL_THROTTLE		 0x20
+#define CTRL_THROTTLE_HI	 0x21
+#define CTRL_THROTTLE_LO	 0x22
+#define CTRL_THROTTLE_DEFAULT	 0x28
+#define CTRL_THROTTLE_HI_DEFAULT 0x29
+#define CTRL_THROTTLE_LO_DEFAULT 0x2A
+#define CTRL_POWEROFF		 0x30
+#define CTRL_POWEROFF_HI	 0x31
+#define CTRL_POWEROFF_LO	 0x32
+#define CTRL_POWEROFF_DEFAULT	 0x38
+#define CTRL_POWEROFF_HI_DEFAULT 0x39
+#define CTRL_POWEROFF_LO_DEFAULT 0x3A
+#define CTRL_SHUTDOWN		 0x40
+#define CTRL_SHUTDOWN_HI	 0x41
+#define CTRL_SHUTDOWN_LO	 0x42
+#define CTRL_SHUTDOWN_DEFAULT	 0x48
+#define CTRL_SHUTDOWN_HI_DEFAULT 0x49
+#define CTRL_SHUTDOWN_LO_DEFAULT 0x4A
+#define CTRL_SB_TSI_STATUS	 0x80
+#define CTRL_SB_TSI_ACCESS	 0x81
+#define CTRL_WARN_STATUS	 0x90
+#define CTRL_WARN_BEEP		 0x91
+#define CTRL_WARN_TEMP		 0x92
+
+#define THERM_ERR_NO		 0x00
+#define THERM_ERR_CHANNEL	 0x01
+#define THERM_ERR_HI		 0x02
+#define THERM_ERR_LO		 0x03
+
+#define NAME_SIZE		 5
+
+#define TRIP_NUM		 3
+#define TRIP_SHUTDOWN		 0
+#define TRIP_POWEROFF		 1
+#define TRIP_THROTTLE		 2
+/* Beep mechanism no stable. Not supported, yet. */
+#define TRIP_BEEP		 3
+
+#define THERMAL_POLLING_DELAY		2000 /* millisecond */
+#define THERMAL_PASSIVE_DELAY		1000
+
+#define DECI_KELVIN_TO_MILLI_CELSIUS(t) (((t) - 2731) * 100)
+#define MILLI_CELSIUS_TO_DECI_KELVIN(t) (((t) / 100) + 2731)
+
+#define THERM_STS_AVAIL           BIT(0)
+#define THERM_STS_THROTTLE_AVAIL  BIT(1)
+#define THERM_STS_POWEROFF_AVAIL  BIT(2)
+#define THERM_STS_SHUTDOWN_AVAIL  BIT(3)
+#define THERM_STS_THROTTLE_EVT    BIT(4)
+#define THERM_STS_POWEROFF_EVT    BIT(5)
+#define THERM_STS_SHUTDOWN_EVT    BIT(6)
+/* BIT(7) reserved */
+#define THERM_STS_THROTTLE_ON     BIT(8)
+#define THERM_STS_POWEROFF_ON     BIT(9)
+#define THERM_STS_SHUTDOWN_ON     BIT(10)
+/* BIT(11) reserved */
+#define THERM_STS_THROTTLE_LOG    BIT(12)
+#define THERM_STS_POWEROFF_LOG    BIT(13)
+#define THERM_STS_SHUTDOWN_LOG    BIT(14)
+
+static u8 pmc_len[] = {
+/*      0, 1, 2, 3, 4, 5, 6, 7, 8, 9, a, b, c, d, e, f */
+/* 0 */	2, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+/* 1 */	2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+/* 2 */	1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+/* 3 */	1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+/* 4 */	1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+/* 5 */	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+/* 6 */	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+/* 7 */	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+/* 8 */	1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+/* 9 */	2, 1, 2,
+};
+
+static char therm_name[0x20][NAME_SIZE + 1] = {
+	"CPU0", "CPU1", "CPU2", "CPU3", "SYS0", "SYS1", "SYS2", "SYS3",
+	"AUX0", "AUX1", "AUX2", "AUX3", "DIMM0", "DIMM1", "DIMM2", "DIMM3",
+	"PCH", "VGA", "", "", "", "", "", "",
+	"", "", "", "", "OEM0", "OEM1", "OEM2", "OEM3",
+};
+
+static const u8 ctrl_map[] = {
+	CTRL_SHUTDOWN, CTRL_POWEROFF, CTRL_THROTTLE
+};
+
+struct eio_thermal_dev {
+	struct device *mfd;
+	struct device *dev;
+	u8 ch;
+	u8 name;
+};
+
+struct eio_trip_dev {
+	struct device *mfd;
+	u8 ch;
+	u8 idx;
+};
+
+static int timeout;
+module_param(timeout, int, 0444);
+MODULE_PARM_DESC(timeout, "Set PMC command timeout value.\n");
+
+static int pmc_write(struct device *mfd, u8 ctrl, u8 dev_id, void *data)
+{
+	if (ctrl >= ARRAY_SIZE(pmc_len))
+		return -EINVAL;
+
+	struct pmc_op op = {
+		.cmd       = CMD_THERM_WRITE,
+		.control   = ctrl,
+		.device_id = dev_id,
+		.payload   = (u8 *)data,
+		.size      = pmc_len[ctrl],
+		.timeout   = timeout,
+	};
+
+	return eio_core_pmc_operation(mfd, &op);
+}
+
+static int pmc_read(struct device *mfd, u8 ctrl, u8 dev_id, void *data)
+{
+	if (ctrl >= ARRAY_SIZE(pmc_len))
+		return -EINVAL;
+
+	struct pmc_op op = {
+		.cmd       = CMD_THERM_READ,
+		.control   = ctrl,
+		.device_id = dev_id,
+		.payload   = (u8 *)data,
+		.size      = pmc_len[ctrl],
+		.timeout   = timeout,
+	};
+
+	return eio_core_pmc_operation(mfd, &op);
+}
+
+static int eio_tz_get_temp(struct thermal_zone_device *tzd, int *temp)
+{
+	struct eio_thermal_dev *eio_thermal = thermal_zone_device_priv(tzd);
+	u16 val = 0;
+	int ret;
+
+	ret = pmc_read(eio_thermal->mfd, CTRL_VALUE, eio_thermal->ch, &val);
+	if (ret)
+		return ret;
+
+	*temp = DECI_KELVIN_TO_MILLI_CELSIUS(val);
+	return 0;
+}
+
+static int eio_tz_set_trip_temp(struct thermal_zone_device *tzd,
+				const struct thermal_trip *trip, int temp)
+{
+	struct eio_thermal_dev *eio_thermal = thermal_zone_device_priv(tzd);
+	const u8 ctl = (uintptr_t)trip->priv;
+	u16 val;
+
+	if (temp < 1000)
+		return -EINVAL;
+
+	val = MILLI_CELSIUS_TO_DECI_KELVIN(temp);
+	return pmc_write(eio_thermal->mfd, ctl, eio_thermal->ch, &val);
+}
+
+static int eio_tz_change_mode(struct thermal_zone_device *tzd,
+			      enum thermal_device_mode mode)
+{
+	struct eio_thermal_dev *eio_thermal = thermal_zone_device_priv(tzd);
+	int trip;
+	int ret = 0;
+
+	for (trip = 0; trip < TRIP_NUM; trip++) {
+		ret = pmc_write(eio_thermal->mfd, ctrl_map[trip], eio_thermal->ch, &mode);
+		if (ret)
+			dev_err(eio_thermal->dev, "Error when %s trip num %d\n",
+				mode == THERMAL_DEVICE_ENABLED ? "enabling" : "disabling",
+				trip);
+	}
+
+	return ret;
+}
+
+static struct thermal_zone_device_ops zone_ops = {
+	.get_temp = eio_tz_get_temp,
+	.set_trip_temp = eio_tz_set_trip_temp,
+	.change_mode   = eio_tz_change_mode,
+};
+
+static struct thermal_zone_params zone_params = {
+	.no_hwmon      = true,
+};
+
+static int eio_thermal_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ch;
+
+	if (!dev_get_drvdata(dev->parent)) {
+		dev_err(dev, "eio_core not present\n");
+		return -ENODEV;
+	}
+
+	for (ch = 0; ch < THERM_NUM; ch++) {
+		u16 state = 0;
+		u8  name  = 0;
+		u16 hi_shutdown = 0, hi_poweroff = 0, hi_throttle = 0;
+		int t_shutdown = 0, t_poweroff = 0, t_throttle = 0;
+		struct thermal_trip trips[TRIP_NUM];
+		int ntrips = 0;
+		struct eio_thermal_dev *eio_th;
+		struct thermal_zone_device *tzd;
+
+		if (pmc_read(dev->parent, CTRL_STATE, (u8)ch, &state) ||
+		    pmc_read(dev->parent, CTRL_TYPE,  (u8)ch, &name)) {
+			dev_info(dev, "thermal%d: PMC read error\n", ch);
+			continue;
+		}
+
+		if (!(state & THERM_STS_AVAIL) ||
+		    !((state & THERM_STS_THROTTLE_AVAIL) ||
+		      (state & THERM_STS_POWEROFF_AVAIL) ||
+		      (state & THERM_STS_SHUTDOWN_AVAIL))) {
+			dev_info(dev, "thermal%d: firmware not activated\n", ch);
+			continue;
+		}
+
+		if (name >= ARRAY_SIZE(therm_name) || !therm_name[name][0]) {
+			dev_info(dev, "thermal%d: unknown sensor name idx=%u\n", ch, name);
+			continue;
+		}
+
+		/* Throttle starts a 1C increase it */
+		int throttle_temp = MILLI_CELSIUS_TO_DECI_KELVIN(60000);
+
+		pmc_write(dev->parent, CTRL_THROTTLE_HI, (u8)ch, &throttle_temp);
+
+		pmc_read(dev->parent, CTRL_SHUTDOWN_HI, (u8)ch, &hi_shutdown);
+		pmc_read(dev->parent, CTRL_POWEROFF_HI, (u8)ch, &hi_poweroff);
+		pmc_read(dev->parent, CTRL_THROTTLE_HI, (u8)ch, &hi_throttle);
+
+		t_shutdown = DECI_KELVIN_TO_MILLI_CELSIUS(hi_shutdown);
+		t_poweroff = DECI_KELVIN_TO_MILLI_CELSIUS(hi_poweroff);
+		t_throttle = DECI_KELVIN_TO_MILLI_CELSIUS(hi_throttle);
+
+		ntrips = 0;
+		if (hi_shutdown) {
+			trips[ntrips].type = THERMAL_TRIP_CRITICAL;
+			trips[ntrips].temperature = t_shutdown;
+			trips[ntrips].flags = THERMAL_TRIP_FLAG_RW_TEMP;
+			trips[ntrips].priv  = THERMAL_INT_TO_TRIP_PRIV(TRIP_SHUTDOWN),
+			ntrips++;
+		}
+		if (hi_poweroff) {
+			trips[ntrips].type = THERMAL_TRIP_HOT;
+			trips[ntrips].temperature = t_poweroff;
+			trips[ntrips].flags = THERMAL_TRIP_FLAG_RW_TEMP;
+			trips[ntrips].priv  = THERMAL_INT_TO_TRIP_PRIV(TRIP_POWEROFF),
+			ntrips++;
+		}
+		if (hi_throttle) {
+			trips[ntrips].type = THERMAL_TRIP_PASSIVE;
+			trips[ntrips].temperature = t_throttle;
+			trips[ntrips].flags = THERMAL_TRIP_FLAG_RW_TEMP;
+			trips[ntrips].priv  = THERMAL_INT_TO_TRIP_PRIV(TRIP_THROTTLE),
+			ntrips++;
+		}
+		if (!ntrips) {
+			dev_info(dev, "thermal%d: no valid trips\n", ch);
+			continue;
+		}
+
+		eio_th = devm_kzalloc(dev, sizeof(*eio_th), GFP_KERNEL);
+		if (!eio_th)
+			return -ENOMEM;
+		eio_th->ch = (u8)ch;
+		eio_th->mfd = dev->parent;
+		eio_th->dev = dev;
+
+		tzd = thermal_zone_device_register_with_trips(therm_name[name],
+							      trips,
+							      ntrips,
+							      eio_th,
+							      &zone_ops,
+							      &zone_params,
+							      THERMAL_PASSIVE_DELAY,
+							      THERMAL_POLLING_DELAY);
+		if (IS_ERR(tzd))
+			return PTR_ERR(tzd);
+		/* Make sure zones start disabled */
+		thermal_zone_device_disable(tzd);
+
+		dev_info(dev, "%s thermal up (ch=%d)\n", therm_name[name], ch);
+	}
+
+	return 0;
+}
+
+static struct platform_driver eio_thermal_driver = {
+	.probe  = eio_thermal_probe,
+	.driver = {
+		.name = "eio_thermal",
+	},
+};
+module_platform_driver(eio_thermal_driver);
+
+MODULE_AUTHOR("Wenkai Chung <wenkai.chung@advantech.com.tw>");
+MODULE_AUTHOR("Ramiro Oliveira <ramiro.oliveira@advantech.com>");
+MODULE_DESCRIPTION("Thermal driver for Advantech EIO embedded controller");
+MODULE_LICENSE("GPL");

-- 
2.43.0


