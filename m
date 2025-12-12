Return-Path: <linux-i2c+bounces-14520-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 836D2CB94CF
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 17:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F2493038264
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 16:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087E22BEC2D;
	Fri, 12 Dec 2025 16:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b="HJ3BPKyW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022133.outbound.protection.outlook.com [40.107.75.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422152D238D;
	Fri, 12 Dec 2025 16:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765557707; cv=fail; b=TPY1XDxtMv6ljr0MeqaNO63r52Hf/er4c5ntzLSZjoWaMrtdOZeQIQvrYtt+c5TvMO7L9kNv61PU9ZlWNIszp3FWnHGUrsLhpzRE1LwgPeFJfWIBkD/Wr9GwNM13XriXrAyqdGruf11c5tMBhUFyNhH53kbXlDHPmfoWHLB1JJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765557707; c=relaxed/simple;
	bh=glViC9RP31OLgtx/NwTcSX4pjWfi958TcTl+PaOdfUw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ogF4alryt1g95mNf5bUu+11WCNbiedw++Po2Z8cGu7QvRnZiLNSKXhGlW5pG85nim+C5UcEEMIkGS6BRKyVKzxUy9RBQIEcWXt3SW6QSOPaem793ipEomuJDSdC6QF0uWOTvft7OsXqLMCbOVLq8b2FiIk7QFRlftbuyvGBYhaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com; spf=pass smtp.mailfrom=advantech.de; dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b=HJ3BPKyW; arc=fail smtp.client-ip=40.107.75.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=advantech.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RE2/zjSAbQPpCga8bq9CCueZaXx+oG1zainlfD10IZfde6F48Zr/dqT5QtA0nRw3SDm8rQrdy9kdJtHPEGU9b987zp8FE6x3sITK2rN/M0HZ2PG34fg6+XXx0vTpdTR0S8hqNLJ4ulaJwmZu6NYr/N/z7WkGtVKr8th9WYHq84yISeUR6MmwkqNeD6VjbsPRT5FcZE0Ihi7CsynPno/LuAlFWwgsaLRh9LuBqBPzGYi3Ir5dctziTCLCglQiuV7sjhotEGwzzgay4JPjwWjlMMeqWZxq9H75rgbgqLpr4WmOo0n4GZ1GyHpMWOER6PAPp6C0uIqAWy3oJMLydWwb3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dGBG0bHBvLRU866UNd/QFI3P/aIY1C4T8QLLlTXmOI=;
 b=P5fCIqmYWTW5j6bKFsVINUSHO62AFkYxFm/XVkBiseoE/21jAsQ1tbI7mWldewXDPNW1Jxlvetqgiv39b0KfhJKEGbycRDYQnX1HKm36LMLoA9g/5Ahd0tpzRagEMOZUTE8e4+vOjvDjh+NCdbxKvCF8GP8/iCbBZnVerirk7XpmaJZ/AlbcecD5dku4HAbAElfp6u8leg+/aMM8uH06HTCqb7ahUTyDGdQC8ppcuwOepZqUOWBOUQAeG85GMgz1yxLusja52EJc8AXwkRp46Yc/6RPFg7UM8+VgOHikdYfO0vllRu9QJLdexWjjwKp0vUuKBwBy+4KGJpxsdcGRbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.de; dmarc=pass action=none header.from=advantech.com;
 dkim=pass header.d=advantech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dGBG0bHBvLRU866UNd/QFI3P/aIY1C4T8QLLlTXmOI=;
 b=HJ3BPKyWrrR5RdrKRlVT4+Px0smxUc7eB2AZcQUMt0GOXWvQKMCrXU7Jbv6sbXk/fq6nZo48GSKj8w4+GZ23Bz9CjJ2wGw4svVxfKdfhfG/5IZrAV7FooQnCU7Ffu69sjiyAFEzFfwGUAQWNJn7+t7IHwoWrFtnz9hXYOMUE40bx0xhJadTv+zHZbLc98s9ubIQT5uraWPG2n+A4s4bZKvEf9T983I5as+qZWTP3hatSiT2aH9GqilMmMLqALqdN6p0aN+ZwfRe0a75dq2xOIRthdsIrHKa5p0QVc1ZeXj6x5qPlRgcbQk6KUrkUFyFtyRTb29EjeyJCp5rDGBG+zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.com;
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com (2603:1096:301:21::6)
 by JH0PR02MB6564.apcprd02.prod.outlook.com (2603:1096:990:3f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 16:41:41 +0000
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::59c9:fe0:25f6:702b]) by PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::59c9:fe0:25f6:702b%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:41:40 +0000
From: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Date: Fri, 12 Dec 2025 17:40:55 +0100
Subject: [PATCH 4/8] Add Advantech EIO I2C driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-upstream-v1-v1-4-d50d40ec8d8a@advantech.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=33269;
 i=ramiro.oliveira@advantech.com; h=from:subject:message-id;
 bh=glViC9RP31OLgtx/NwTcSX4pjWfi958TcTl+PaOdfUw=;
 b=owEB7QES/pANAwAKAc7t0Ke8vbAJAcsmYgBpPEWge/2aKaxGTRPfSpM4DwypZRCsAxKWPGxDw
 KTqiNLT8tOJAbMEAAEKAB0WIQS1Nkng0ZvJmBKh6GLO7dCnvL2wCQUCaTxFoAAKCRDO7dCnvL2w
 CaG1C/wIo0ng52kBd1RCW2272FrYaV7QJhVGbqC++NxQHH0yDOtxqV1V2WTw3y2CiahchqAOxbt
 31tBIIZv3lm5W4oXQIU9xPHRK1w3UpMejtioqYlk4LNgrrXQ3szsoy0i+2RksDEnITVkM6EStBW
 16vi12k4Jo7Lxgw/llaGopLYSytnXpbaGrSjx8NZOija2q4TXbyocUlAsi42UC+JWBXwqcr+Bs5
 uYNNvPlnEWhOx2Mg9o1Z07bF3b8pSxibOgdOGZp/l1h5rx88Ner/YzaowlNbRI4+YkpFPckEhX2
 8Kwau0cBjny6XxOcMVpng+XFP70w40rf/Tg+zQps2YflkGvxvDtTR11uG3kPaSrc22i6TiDwy7q
 C5/X8mn6PCbhOihHsEpUYjeScP6HRe3GL4jyGhwFl3HNJJ+Q1DE6/T2TTMaZQWWzLyWswHPAu0F
 yNyi3826FW2mZb9f+DU3Ii/6AJw924d66qJszZ3bx/szMQBPslhBFhkuSDDVvNf7oV6P0=
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
X-MS-Office365-Filtering-Correlation-Id: 8673f184-bea3-4c90-29e2-08de399d5386
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzdYdFhVREhVUFpCMnZuRkxhRUF0b01CeE0vYWFneXRlVXpVeWViOFFQZllx?=
 =?utf-8?B?RXFnZVZKenFwaDVEdjdFbWFzeDR5YVo4amZ4N0dDWGNrYVRib2xWaTMzZXJV?=
 =?utf-8?B?UjdBNTBqN2RYWDdka1NHdW5YOXZlRzYzbStmWGdzMGRVU3ZRQllXM3pCOVBj?=
 =?utf-8?B?U2ZYaTlUOVhzTTRCRmhQQTRLWDE5dzYzeENoUjlrQzZrV01kSEd6NkJyNmZZ?=
 =?utf-8?B?ZUJzblRvc0c5V0JrNC9QTVR3cnMzZFhmdldnR1Y2OCtoa2Jic1VETFVnT0Jw?=
 =?utf-8?B?SjJYQ1lYMmNzZEpRbUtraTRWb25QbGw1TmMxcTdib3hXNnU0YmJOSFY0MVNW?=
 =?utf-8?B?Y1kwdytEWVBwRGdDdVV6Yk80YnY5bG8zZ1UvWUJxZkFzQU51QTVyeU1ObVIr?=
 =?utf-8?B?ZnVxcVF1c2F2b2J4bGtRVlptNG5uT3RjOElIL0U4KzJRTzN1a3hHdHU5RlA2?=
 =?utf-8?B?WDhiN0RyUmVhYlMyendlR1ZXWUZ4WmQwdnNTUy8wU0hWRnkxTmxJTVBNaFpn?=
 =?utf-8?B?MFNuV1ZJaGkxZmh2NEdsZHdPNEVEcmVSZ0J5VkdhVEFHbWJuYy9pTTZ2a1lC?=
 =?utf-8?B?UnljdWxZMGs1WnhTRU9uQUx1eHA1VHk1TFV5WTF5b052RDVLV1lrakJ4S2Vp?=
 =?utf-8?B?dVIrWFcwNmsxcjZpL0tGeXdUYXJJZjU4YXFBSDl1L0tIaEZZYTZDMFQxRWpP?=
 =?utf-8?B?T1pTdHYwcXNxUWZ6TUZ3aWJYTGdqMCt6dGVnczVqa0Rvc1AxeFA4c2JQbnpr?=
 =?utf-8?B?YWx3NE5aeHowa2dxNHhRNEJLQ0ptUndvMHZUdUY3UkFWSmJhQWpQRElwb1Zj?=
 =?utf-8?B?UTByNVYxRzdZL0FXaTY1T3kwVzgyT3JZWTlLdU1mSi9uMzJ6cDhOcndBZjM2?=
 =?utf-8?B?NktFeWZhQ3J0bWdQMlZTYm1kREwwN1FzcmQvOEhjNVVhck9od1RkUEQ4TThP?=
 =?utf-8?B?YTllbzE1eU1zanFxUEVsTVJrVTY2VHQwSVNRWmtCcHVWakNmT3NjSTZkWUlW?=
 =?utf-8?B?Rm1SYnY2d0ZNb1VGanNrNnA5Ti9mOTNKTmFDTFNzcFlUNTE0NzNqNXQ2czBw?=
 =?utf-8?B?OHJlWWNPdUhCMmYyQ1lkNGpjNmNJNkN1WWhuSllrVXE2ZlhWQjNtd2VWYmRN?=
 =?utf-8?B?TXFHUHIzejAwQzFMS3YrR2xOLzdEblU0ZzFjUFA0aWxKWUxRU2M1ZkpUbGRH?=
 =?utf-8?B?bk5kcWowYnBqQTRhaE52ZTMwZG16YWpuYnlnVEhMT0JybCtSOUxObmhtRkc5?=
 =?utf-8?B?aytMTWJhamJZMWJXdkZGQXhFMUV1TjVwY3dmNlY5Ky9Oc3Q4Ujl3ODIrVTFk?=
 =?utf-8?B?VXVKbCtyc3VQQU5KNTVHNGhCNXNWbjVYOTZZc0xVNjg2MEtSV3hwaEIzVXFl?=
 =?utf-8?B?WXRId3VpV3JmdG9mUm9Ld0Z0VitrUWpsZEpSZmNYdm5BVmM4OFZGRllaMFJX?=
 =?utf-8?B?OTJmenZGdVVyRmZTb2NGUzltRS81dkUzUnRIY1I0MTBaQ01BT0FTbjdrSTZV?=
 =?utf-8?B?Zm9CbmVpa2R0aUN1SENSTmxReUxBMjZkalZGTmV5NWtQRlQxZXVUK3p3VG1I?=
 =?utf-8?B?Q3NSRWRScXlOZ2xSSGc5ZUY3M2Yzb1Y2MHRDaEp2c3ExNHR4TjRVUlQvSDF1?=
 =?utf-8?B?RTc1anduVDZXclJvOVNhRXcwRFBUUXU5eGJ5Qk1jVldGOGs2YVIySTdrWWdG?=
 =?utf-8?B?S3VieXRFaXR5ZThWQlVkSVhKUktIWm80emFVaVhCSHVYZVd5bjlZQm9yYnRX?=
 =?utf-8?B?YTZSOGhIa1JpbmVzT1ovL1VNZklEZ081OXJvRkZoZWt1RlZRTG5hanlCMm94?=
 =?utf-8?B?bE1RZCtBQm43NTFUeEwyV09SWXA0ZEVucURHSEl1SmMvdnVWb0t0RTlYNzRZ?=
 =?utf-8?B?Qy80S25mNTc2ZUt5U0Rha1EwQWZiSU9pQ1NuZ0tibG5yMkFFOGRtWW9JRi9F?=
 =?utf-8?B?TFR6ek5Sb1hBZkFLMWpvYnlDZUZQV0wwOEpocllBaFFFQkJiYjFPNWh6MHhj?=
 =?utf-8?B?QkduQ0R1NXFQQ0hEdVhQMVRwbEVLRTZvK0hyNVBqRStpNTNTcW1CSnZ4NmZt?=
 =?utf-8?B?enJ3aXN4RlcvZk9NUGg0ZGNDb2ZjMkNkQXpjZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR02MB4502.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUNTV1JVNzRQSXB2eDVtVTdxaXFUcWw1aGQvdjR4NktrMFUxVnA1dDFDcWhP?=
 =?utf-8?B?K0xxUHI0QWZuQXdjeUhXckt3c2NwWkg3eXpPK3oyekViSXRLdFhoK1o0M0Nn?=
 =?utf-8?B?eU03TkdUb2wxcUxaYWJpTU5tT0NQV0RTaTJ6M3BJcm1JTUE0b2FXYzlIOVBi?=
 =?utf-8?B?M3ZoWHhjT2RqVGdpTXpxaUFvZ0R5dXF4NWt5VVZ3bzJOaGxzUzlFRmNsZ3Nh?=
 =?utf-8?B?M01HWi84SWp0OUdETklsd3JOQkNuUlNkZDlzTk5CckpHSXdQK21jbGlsa0Vt?=
 =?utf-8?B?REw0Qjc4WXRSZ3BTN3dWT0cwMUUvVnprelIvZ2cvMmtPcld6V0ZIUUFyb0Ni?=
 =?utf-8?B?S0tuNStzSVM0aVFnTzYwaXFCcExOY29rQU9nT3l5L3BuK2doeWtEOUwzSHdE?=
 =?utf-8?B?S0gxNndxOVVSUGdIaG5Vam9rZ2QySlZlNG9mdndPMXY1QVlJV09LMXB0Y09L?=
 =?utf-8?B?aU9iMHArc2EwVG5QSGNCNEJKeVlxNEtNdWo5eE1BR0VkYmhJczVPV3V5Rkgr?=
 =?utf-8?B?cXNHZWw4Q0VDSnJwWkpJY1poVUNhVVI4SXJqNXdJc0xUcW1lQTByZDUxMG9Z?=
 =?utf-8?B?OEY4Y3V3UC9GZzRldmo2Zklqc044T3pFeFo0Z3NvQWlTcnE5NDllMGRieWRV?=
 =?utf-8?B?YTUvWGFlcXhLNVFuRkhubWxKc0tRb2ZPNDEyQ0tROTRzYTducWQxNFlDUDdo?=
 =?utf-8?B?eEpEQ280U1lEZzdvTmoySkRCZjRQOXlKeUNkbkVteHR0OUdvcFc4VE0ydkVv?=
 =?utf-8?B?b1VOeU5PeWZ2QUNWUUhrVVBZbytuekVoejAwZzdBcDBYMFFzUW0yRENoSDR2?=
 =?utf-8?B?MVkyMDVYL0Z3UkxwaVkvaWhicjlvN3Z0UXZPOVNwcVJzVkNCWnZKZkNHUjhp?=
 =?utf-8?B?a1JMSjdNQ0JBWnRoUFVRbTNrQWxNSGcxOGZTd1FUY05DTmJhVytmOXp2aTZz?=
 =?utf-8?B?OGI0bDNNVXJPKzh3bEVDWnpNNWN4R3k4MHFxMWNsUnM2S2FnaTNqQ2xZTUdy?=
 =?utf-8?B?S3ZLalMxcUdxdkVQY0kxV1AwZnhkbDVZUjJ4cUE3VXp0ZGtVeDRlUEZyaGR1?=
 =?utf-8?B?MlhXbFB2OXVnWjl6dXVmOTJMZ0g4ZUZjZWRwZnptSEFWSFQ4czFCTEgyZmVq?=
 =?utf-8?B?WEs0VzJOenpuMkFzam9WZlduKzRBYTZIT0FncjhvbkptaGM5S0VxaWN1OWlL?=
 =?utf-8?B?K01nenA1VS9ybERBMTdUNWxnSTlrWklNYXFmSndMd1lOaStZWklLVlo1cE8x?=
 =?utf-8?B?WDZpZno3V1BSd0RHWUxHS1podEtxV0xWUHpGUmM4ZUEvZUxTbWowa3ZEWDNG?=
 =?utf-8?B?RTZSQ292RlVrRldkK1NyOXNhRU1XM2NlNGdNQXhKdTJKR3ZCaTVSdXRHczJB?=
 =?utf-8?B?SStFbVU2ME1ZNUlMNjAvNEdtenRGc3ZtWmFna1c0cjJIdU85UUxUdjJFWXZi?=
 =?utf-8?B?YzQ4OW9TMWM0MDl4cTgyOThqMGdJekFhbXZ2MXBZaW13U1ptemhnY0p1eXFV?=
 =?utf-8?B?RW1OSW5SRzRSSUp5V1lBVGQzSkhNTGJXR0FCa0Yxc2p3REhKcDRKQzdSbCs1?=
 =?utf-8?B?VGgxK0tUYmZqbGdUd0pJR2ZILzI1WkhRNExLa0E0Z0FZRVFUYnVlSTdpaXFZ?=
 =?utf-8?B?OGFZZ2FkRjVMOGQ5RFlEOWxWQ1laQlRZYS8xRnhBRzVmM1hRcXo0Nkg5SkhV?=
 =?utf-8?B?bnVKQlQ2aVBnbUlwZnBRMUk3d29BekFIZ0x3bit4YzdGbEFzbnl3a3ErWVl6?=
 =?utf-8?B?N3V6c2RoY3B0MEdrdEZURWJBSW9LVHltNmRTQmo2YUlMajhNb0d1TkV3TlFz?=
 =?utf-8?B?K3FwZVo3NVIvalRsS3NUOXZka0VvYUxxUGVFeGpUMHMxNm5RUkRtUlpYMmZn?=
 =?utf-8?B?d3FqVmQ1ek5NYnNRTi9nb3N3SVFXMTdnRUpYSHIrVzRkeEMzdjY5S0QxazR0?=
 =?utf-8?B?elpqNWR2aEVWcHF0cVQzVlhpS3UxNWMyQ0tMNHpKY2NWYVoxUlVxUXBRYjVR?=
 =?utf-8?B?NTRjVFA0b1JCeUU0b1hEdzNVTXRJZnZwL1BVdGt3S0tBRVNaNURGNmdYS2ZK?=
 =?utf-8?B?MUswbXhmM1pROUcvb3dSR3l5cXQ5Rk9iWFBrVmtBN3F2VnpxaHZ3dkJ0aFBE?=
 =?utf-8?B?WTdCMWhwNUJSblhHaU1MY2hQRndtRk1iU2UvYzJDOFdWZXJjaG5NallhYThY?=
 =?utf-8?Q?8B0NQwkNFhTsALm8ZQuBNlM=3D?=
X-OriginatorOrg: advantech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8673f184-bea3-4c90-29e2-08de399d5386
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4502.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:41:40.8770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABvz0k1t+Reu6eD4Ksbvn0z1na/7CMZdS7okft7Pf9oYyuOlbYueW39lVFEwtMOAPwtOgVRb9pp99gUajkaq6ORWJhBaa4F+dPKeYGUxhgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB6564

This commit adds the driver to control the Advantech EIO I2C block, this
block is included in the Advantech EIO MFD.

Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>
---
 MAINTAINERS                  |    1 +
 drivers/i2c/busses/Kconfig   |    6 +
 drivers/i2c/busses/Makefile  |    1 +
 drivers/i2c/busses/i2c-eio.c | 1142 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1150 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fdd39b152f41..be9d3c4e1ce1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -621,6 +621,7 @@ M:	Ramiro Oliveira <ramiro.oliveira@advantech.com>
 S:	Maintained
 F:	drivers/gpio/gpio-eio.c
 F:	drivers/hwmon/eio-hwmon.c
+F:	drivers/i2c/busses/i2c-eio.c
 F:	drivers/mfd/eio_core.c
 F:	include/linux/mfd/eio.h
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 09ba55bae1fa..e597c08414e4 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -656,6 +656,12 @@ config I2C_DIGICOLOR
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-digicolor.
 
+config I2C_EIO
+	tristate "Advantech EIO I2C bus"
+	depends on MFD_EIO
+	help
+	  Say Y or M to build support for Advantech EIO I2C block.
+
 config I2C_EG20T
 	tristate "Intel EG20T PCH/LAPIS Semicon IOH(ML7213/ML7223/ML7831) I2C"
 	depends on PCI && (X86_32 || MIPS || COMPILE_TEST)
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index fb985769f5ff..b65bb06b14c6 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_I2C_DESIGNWARE_AMDISP) += i2c-designware-amdisp.o
 obj-$(CONFIG_I2C_DESIGNWARE_PCI)			+= i2c-designware-pci.o
 i2c-designware-pci-y					:= i2c-designware-pcidrv.o
 obj-$(CONFIG_I2C_DIGICOLOR)	+= i2c-digicolor.o
+obj-$(CONFIG_I2C_EIO)		+= i2c-eio.o
 obj-$(CONFIG_I2C_EG20T)		+= i2c-eg20t.o
 obj-$(CONFIG_I2C_EMEV2)		+= i2c-emev2.o
 obj-$(CONFIG_I2C_EXYNOS5)	+= i2c-exynos5.o
diff --git a/drivers/i2c/busses/i2c-eio.c b/drivers/i2c/busses/i2c-eio.c
new file mode 100644
index 000000000000..a867f24a4809
--- /dev/null
+++ b/drivers/i2c/busses/i2c-eio.c
@@ -0,0 +1,1142 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * I2C and SMBus driver of EIO embedded driver
+ *
+ * Copyright (C) 2025 Advantech Co., Ltd.
+ */
+
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/eio.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#define SUPPORTED_COMMON (I2C_FUNC_I2C | \
+			  I2C_FUNC_SMBUS_QUICK | \
+			  I2C_FUNC_SMBUS_BYTE | \
+			  I2C_FUNC_SMBUS_BYTE_DATA | \
+			  I2C_FUNC_SMBUS_WORD_DATA | \
+			  I2C_FUNC_SMBUS_I2C_BLOCK)
+#define SUPPORTED_SMB	(SUPPORTED_COMMON | I2C_FUNC_SMBUS_BLOCK_DATA)
+#define SUPPORTED_I2C	(SUPPORTED_COMMON | I2C_FUNC_10BIT_ADDR)
+
+#define MAX_I2C_SMB		4
+
+#define REG_PNP_INDEX		0x299
+#define REG_PNP_DATA		0x29A
+#define REG_SUB_PNP_INDEX	0x499
+#define REG_SUB_PNP_DATA	0x49A
+#define REG_EXT_MODE_ENTER	0x87
+#define REG_EXT_MODE_EXIT	0xAA
+#define REG_LDN			0x07
+
+#define LDN_I2C0		0x20
+#define LDN_I2C1		0x21
+#define LDN_SMBUS0		0x22
+#define LDN_SMBUS1		0x23
+
+#define REG_BASE_HI		0x60
+#define REG_BASE_LO		0x61
+
+#define I2C_REG_CTRL		0x00
+#define I2C_CTRL_STOP		BIT(1)
+
+#define I2C_REG_STAT		0x01
+#define I2C_STAT_RXREADY	BIT(6)
+#define I2C_STAT_TXDONE		BIT(5)
+#define I2C_STAT_NAK_ERR	BIT(4)
+#define I2C_STAT_ARL_ERR	BIT(3)
+#define I2C_STAT_SLV_STP	BIT(2)
+#define I2C_STAT_BUSY		BIT(1)
+#define I2C_STAT_MST_SLV	BIT(0)
+
+#define I2C_REG_MYADDR		0x02
+#define I2C_REG_ADDR		0x03
+#define I2C_REG_DATA		0x04
+#define I2C_REG_PRESCALE1	0x05
+#define I2C_REG_PRESCALE2	0x06
+
+#define I2C_REG_ECTRL		0x07
+#define I2C_ECTRL_RST		BIT(7)
+
+#define I2C_REG_SEM		0x08
+#define I2C_SEM_INUSE		BIT(1)
+
+#define SMB_REG_HC2		0x0C
+
+#define SMB_REG_HS		0x00
+#define SMB_HS_BUSY		BIT(0)
+#define SMB_HS_FINISH		BIT(1)
+#define SMB_HS_ARL_ERR		BIT(3)
+#define SMB_HS_FAILED		BIT(4)
+#define SMB_HS_RX_READY		BIT(5)
+#define SMB_HS_INUSE		BIT(6)
+#define SMB_HS_TX_DONE		BIT(7)
+
+#define SMB_REG_HS2		0x01
+#define SMB_HS2_HNOTIFY		BIT(0)
+#define SMB_HS2_PEC_ERR		BIT(1)
+#define SMB_HS2_NACK_ERR	BIT(2)
+#define SMB_HS2_ALERT_STS	BIT(3)
+#define SMB_HS2_TO_ERR		BIT(4)
+#define SMB_HS2_SSTOP_STS	BIT(5)
+#define SMB_HS2_STX_REQ		BIT(6)
+#define SMB_HS2_SMODE		BIT(7)
+
+#define SMB_REG_HC		0x02
+#define SMB_HC_I2C_NACKEN	BIT(0)
+#define SMB_HC_KILL		BIT(1)
+#define SMB_HC_CMD_SHIFT	2
+#define SMB_HC_LAST_BYTE	BIT(5)
+#define SMB_HC_START		BIT(6)
+#define SMB_HC_PEC_EN		BIT(7)
+
+#define SMB_REG_HCMD		0x03
+#define SMB_REG_HADDR		0x04
+#define SMB_REG_HD0		0x05
+#define SMB_REG_HD1		0x06
+#define SMB_REG_HBLOCK		0x07
+#define SMB_REG_HPEC		0x08
+#define SMB_REG_SADDR		0x09
+#define SMB_REG_SD0		0x0A
+#define SMB_REG_SD1		0x0B
+
+#define SMB_REG_HC2		0x0C
+#define SMB_HC2_HNOTIFY_DIS	BIT(0)
+#define SMB_HC2_I2C_EN		BIT(1)
+#define SMB_HC2_AAPEC		BIT(2)
+#define SMB_HC2_E32B		BIT(3)
+#define SMB_HC2_SRESET		BIT(7)
+
+#define SMB_REG_HPIN		0x0D
+#define SMB_REG_HC3		0x0E
+#define SMB_REG_HC4		0x0F
+#define SMB_REG_NOTIFY_D0	0x11
+#define SMB_REG_NOTIFY_D1	0x12
+#define SMB_REG_HPRESCALE1	0x13
+#define SMB_REG_HPRESCALE2	0x14
+#define SMB_REG_HEXTRA		0x15
+
+#define I2C_TIMEOUT		(10 * USEC_PER_MSEC)
+#define USE_DEFAULT		-1
+
+#define CHIP_CLK		50000
+#define I2C_SCLH_HIGH		2500
+#define I2C_SCLH_LOW		1000
+#define I2C_SCL_FAST_MODE	0x80
+#define I2C_THRESHOLD_SPEED	100
+#define I2C_THRESHOLD_SCLH	30
+#define I2C_FREQ_MAX		400
+#define I2C_FREQ_MIN		8
+
+enum eio_chan_id {
+	EIO_I2C0 = 0,
+	EIO_I2C1,
+	EIO_SMB0,
+	EIO_SMB1,
+};
+
+struct eio_i2c_dev {
+	struct device *dev;
+	struct device *mfd;
+	struct regmap *regmap;
+	struct mutex pnp_mutex; /* Mutex for PNP acces */
+	struct eio_i2c_chan *chan[MAX_I2C_SMB];
+};
+
+struct eio_i2c_chan {
+	u16 base;
+	enum eio_chan_id id;
+	struct eio_i2c_dev *parent;
+	struct i2c_adapter adap;
+	struct mutex lock; /* Mutex for regmap writes */
+	int freq_override;                  /* kHz or USE_DEFAULT */
+};
+
+static int timeout = I2C_TIMEOUT;
+module_param(timeout, int, 0444);
+MODULE_PARM_DESC(timeout, "Set IO timeout value.\n");
+
+static int i2c0_freq = USE_DEFAULT;
+module_param(i2c0_freq, int, 0444);
+MODULE_PARM_DESC(i2c0_freq, "Set EIO's I2C0 freq.\n");
+
+static int i2c1_freq = USE_DEFAULT;
+module_param(i2c1_freq, int, 0444);
+MODULE_PARM_DESC(i2c1_freq, "Set EIO's I2C1 freq.\n");
+
+static int smb0_freq = USE_DEFAULT;
+module_param(smb0_freq, int, 0444);
+MODULE_PARM_DESC(smb0_freq, "Set EIO's SMB0 freq.\n");
+
+static int smb1_freq = USE_DEFAULT;
+module_param(smb1_freq, int, 0444);
+MODULE_PARM_DESC(smb1_freq, "Set EIO's SMB1 freq.\n");
+
+static inline u16 eio_enc_7bit_addr(u16 x)
+{
+	return ((x & 0x07F) << 1);
+}
+
+static inline u16 eio_enc_10bit_addr(u16 x)
+{
+	return ((x & 0xFF) | ((x & 0x0300) << 1) | 0xF000);
+}
+
+static inline bool is_i2c(const struct eio_i2c_chan *i2c_chan)
+{
+	return i2c_chan->id == EIO_I2C0 || i2c_chan->id == EIO_I2C1;
+}
+
+static inline struct device *eio_dev(const struct eio_i2c_chan *i2c_chan)
+{
+	return i2c_chan->parent->dev;
+}
+
+static inline struct regmap *eio_map(const struct eio_i2c_chan *i2c_chan)
+{
+	return i2c_chan->parent->regmap;
+}
+
+static inline int eio_reg_write(struct eio_i2c_chan *i2c_chan,
+				unsigned int reg_off, unsigned int val)
+{
+	return regmap_write(eio_map(i2c_chan), i2c_chan->base + reg_off, val);
+}
+
+static inline int eio_reg_read(const struct eio_i2c_chan *chan,
+			       unsigned int reg, unsigned int *val)
+{
+	int ret;
+
+	ret = regmap_read(chan->parent->regmap, chan->base + reg, val);
+	return ret;
+}
+
+static inline int eio_reg_set_bits(const struct eio_i2c_chan *chan,
+				   unsigned int reg, unsigned int mask)
+{
+	return regmap_update_bits(chan->parent->regmap, reg, mask, mask);
+}
+
+static inline int eio_reg_clear_bits(const struct eio_i2c_chan *chan,
+				     unsigned int reg, unsigned int mask)
+{
+	return regmap_update_bits(chan->parent->regmap, reg, mask, 0);
+}
+
+static inline int eio_reg_or(struct eio_i2c_chan *chan,
+			     unsigned int reg, unsigned int mask)
+{
+	return eio_reg_set_bits(chan, reg, mask);
+}
+
+static inline int eio_reg_and(struct eio_i2c_chan *chan,
+			      unsigned int reg, unsigned int mask)
+{
+	return eio_reg_clear_bits(chan, reg, ~mask);
+}
+
+static inline unsigned int eio_chan_reg(const struct eio_i2c_chan *i2c_chan,
+					unsigned int i2c_reg,
+					unsigned int smb_reg)
+{
+	return is_i2c(i2c_chan) ? i2c_reg : smb_reg;
+}
+
+static inline int eio_trigger_read(struct eio_i2c_chan *i2c_chan, u32 *data)
+{
+	unsigned int reg = eio_chan_reg(i2c_chan, I2C_REG_DATA, SMB_REG_HD0);
+
+	return eio_reg_read(i2c_chan, reg, data);
+}
+
+static int wait_busy(struct eio_i2c_chan *i2c_chan)
+{
+	ktime_t time_end = ktime_add_us(ktime_get(), timeout);
+	unsigned int reg = eio_chan_reg(i2c_chan, I2C_REG_STAT, SMB_REG_HS);
+	unsigned int target = eio_chan_reg(i2c_chan, I2C_STAT_BUSY, SMB_HS_BUSY);
+	unsigned int val;
+	int cnt = 0;
+
+	do {
+		fsleep(cnt++);
+
+		if (ktime_after(ktime_get(), time_end)) {
+			dev_err(eio_dev(i2c_chan), "Wait I2C bus busy timeout\n");
+			return -ETIME;
+		}
+
+		if (eio_reg_read(i2c_chan, reg, &val))
+			return -EIO;
+
+	} while (val & target);
+
+	return 0;
+}
+
+static void reset_bus(struct eio_i2c_chan *i2c_chan)
+{
+	ktime_t time_end = ktime_add_us(ktime_get(), timeout);
+	unsigned int reg = eio_chan_reg(i2c_chan, I2C_REG_ECTRL, SMB_REG_HC2);
+	unsigned int target = eio_chan_reg(i2c_chan, I2C_ECTRL_RST, SMB_HC2_SRESET);
+	unsigned int val = 0;
+	unsigned int cnt = 0;
+
+	dev_dbg(eio_dev(i2c_chan), "i2c[%d] bus reset\n", i2c_chan->id);
+
+	if (is_i2c(i2c_chan))
+		eio_reg_write(i2c_chan, I2C_REG_ECTRL, I2C_ECTRL_RST);
+	else
+		eio_reg_or(i2c_chan, SMB_REG_HC2, SMB_HC2_SRESET);
+
+	do {
+		fsleep(cnt++);
+
+		if (ktime_after(ktime_get(), time_end)) {
+			dev_err(eio_dev(i2c_chan), "bus reset timeout\n");
+			return;
+		}
+
+		if (eio_reg_read(i2c_chan, reg, &val))
+			return;
+
+	} while (val & target);
+
+	wait_busy(i2c_chan);
+}
+
+static int wait_bus_free(struct eio_i2c_chan *i2c_chan)
+{
+	ktime_t time_end = ktime_add_us(ktime_get(), timeout);
+	unsigned int val;
+	int cnt = 1;
+
+	/* Wait if channel is resetting */
+	do {
+		fsleep(cnt);
+
+		if (ktime_after(ktime_get(), time_end)) {
+			dev_err(eio_dev(i2c_chan), "Wait bus reset timeout\n");
+			return -ETIME;
+		}
+
+		if (eio_reg_read(i2c_chan,
+				 eio_chan_reg(i2c_chan, I2C_REG_ECTRL, SMB_REG_HC2),
+				 &val))
+			return -EIO;
+
+	} while (val & eio_chan_reg(i2c_chan, I2C_ECTRL_RST, SMB_HC2_SRESET));
+
+	/* Wait INUSE */
+	time_end = ktime_add_us(ktime_get(), timeout);
+
+	do {
+		fsleep(cnt);
+
+		if (ktime_after(ktime_get(), time_end)) {
+			dev_err(eio_dev(i2c_chan), "Timeout: I2C bus in use\n");
+			return -ETIME;
+		}
+
+		if (eio_reg_read(i2c_chan,
+				 eio_chan_reg(i2c_chan, I2C_REG_SEM, SMB_REG_HS),
+				 &val))
+			return -EIO;
+
+	} while (val & eio_chan_reg(i2c_chan, I2C_SEM_INUSE, SMB_HS_INUSE));
+
+	return 0;
+}
+
+static int let_stop(struct eio_i2c_chan *i2c_chan)
+{
+	unsigned int reg = eio_chan_reg(i2c_chan, I2C_REG_CTRL, SMB_REG_HC);
+	unsigned int target = eio_chan_reg(i2c_chan, I2C_CTRL_STOP, SMB_HC_LAST_BYTE);
+
+	return eio_reg_or(i2c_chan, reg, target);
+}
+
+static int clr_inuse(struct eio_i2c_chan *i2c_chan)
+{
+	if (is_i2c(i2c_chan))
+		return eio_reg_write(i2c_chan, I2C_REG_SEM, I2C_SEM_INUSE);
+
+	return eio_reg_or(i2c_chan, SMB_REG_HS, SMB_HS_INUSE);
+}
+
+static int bus_stop(struct eio_i2c_chan *i2c_chan)
+{
+	ktime_t time_end = ktime_add_us(ktime_get(), timeout);
+	unsigned int reg = eio_chan_reg(i2c_chan, I2C_REG_CTRL, SMB_REG_HC);
+	unsigned int target = eio_chan_reg(i2c_chan, I2C_CTRL_STOP, SMB_HC_LAST_BYTE);
+	unsigned int val = 0;
+	int cnt = 0;
+
+	/* Set STOP bit */
+	eio_reg_or(i2c_chan, reg, target);
+
+	/* Wait until STOP bit clears */
+	do {
+		fsleep(cnt++);
+
+		if (ktime_after(ktime_get(), time_end))
+			return -ETIME;
+
+		if (eio_reg_read(i2c_chan, reg, &val))
+			return -EIO;
+
+	} while (val & target);
+
+	return 0;
+}
+
+static void switch_i2c_mode(struct eio_i2c_chan *i2c_chan, bool on)
+{
+	u32 tmp;
+
+	if (is_i2c(i2c_chan))
+		return;
+
+	if (eio_reg_read(i2c_chan, SMB_REG_HC2, &tmp))
+		return;
+
+	eio_reg_write(i2c_chan, SMB_REG_HC2,
+		      on ? (tmp | SMB_HC2_I2C_EN | SMB_HC2_SRESET)
+		      : (tmp & ~SMB_HC2_I2C_EN));
+}
+
+static void i2c_clear(struct eio_i2c_chan *i2c_chan)
+{
+	if (is_i2c(i2c_chan)) {
+		eio_reg_write(i2c_chan, I2C_REG_STAT, 0xFF);
+	} else {
+		eio_reg_or(i2c_chan, SMB_REG_HS,  0xA9);
+		eio_reg_or(i2c_chan, SMB_REG_HS2, 0x4C);
+	}
+}
+
+static int wait_write_done(struct eio_i2c_chan *i2c_chan, bool no_ack)
+{
+	ktime_t time_end = ktime_add_us(ktime_get(), timeout);
+	unsigned int val = 0;
+	int cnt = 0;
+	unsigned int reg = eio_chan_reg(i2c_chan, I2C_REG_STAT, SMB_REG_HS);
+	unsigned int target = eio_chan_reg(i2c_chan, I2C_STAT_TXDONE, SMB_HS_TX_DONE);
+
+	do {
+		fsleep(cnt++);
+		if (ktime_after(ktime_get(), time_end)) {
+			if (is_i2c(i2c_chan)) {
+				eio_reg_or(i2c_chan, I2C_REG_STAT, 0);
+			} else {
+				eio_reg_or(i2c_chan, SMB_REG_HS,  0);
+				eio_reg_or(i2c_chan, SMB_REG_HS2, 0);
+			}
+			dev_err(eio_dev(i2c_chan), "wait write complete timeout %X %X\n",
+				val, target);
+			return -ETIME;
+		}
+		if (eio_reg_read(i2c_chan, reg, &val))
+			return -EIO;
+
+	} while ((val & target) == 0);
+
+	if (no_ack)
+		return 0;
+
+	if (is_i2c(i2c_chan)) {
+		eio_reg_or(i2c_chan, I2C_REG_STAT, 0);
+		return (val & I2C_STAT_NAK_ERR) ? -EIO : 0;
+	}
+
+	eio_reg_or(i2c_chan, SMB_REG_HS, 0);
+	if (eio_reg_read(i2c_chan, SMB_REG_HS2, &val))
+		return -EIO;
+	eio_reg_write(i2c_chan, SMB_REG_HS2, val);
+
+	return (val & SMB_HS2_NACK_ERR) ? -EIO : 0;
+}
+
+static int wait_ready(struct eio_i2c_chan *i2c_chan)
+{
+	int ret;
+
+	ret = wait_bus_free(i2c_chan);
+	if (ret)
+		return ret;
+
+	if (wait_busy(i2c_chan) == 0)
+		return 0;
+
+	reset_bus(i2c_chan);
+
+	return wait_busy(i2c_chan);
+}
+
+static int write_addr(struct eio_i2c_chan *i2c_chan, int addr, bool no_ack)
+{
+	eio_reg_write(i2c_chan, eio_chan_reg(i2c_chan, I2C_REG_ADDR, SMB_REG_HADDR),
+		      addr);
+
+	return wait_write_done(i2c_chan, no_ack);
+}
+
+static int write_data(struct eio_i2c_chan *i2c_chan, int data, bool no_ack)
+{
+	eio_reg_write(i2c_chan, eio_chan_reg(i2c_chan, I2C_REG_DATA, SMB_REG_HD0),
+		      data);
+
+	return wait_write_done(i2c_chan, no_ack);
+}
+
+static int read_data(struct eio_i2c_chan *i2c_chan, u8 *data)
+{
+	unsigned int val = 0, tmp;
+	int cnt = 0;
+	ktime_t time_end = ktime_add_us(ktime_get(), timeout);
+	unsigned int stat = eio_chan_reg(i2c_chan, I2C_REG_STAT, SMB_REG_HS);
+	unsigned int target = eio_chan_reg(i2c_chan, I2C_STAT_RXREADY, SMB_HS_RX_READY);
+	unsigned int reg = eio_chan_reg(i2c_chan, I2C_REG_DATA, SMB_REG_HD0);
+
+	do {
+		fsleep(cnt++);
+
+		if (ktime_after(ktime_get(), time_end)) {
+			eio_reg_or(i2c_chan, stat, 0);
+			dev_err(eio_dev(i2c_chan), "read data timeout\n");
+			return -ETIME;
+		}
+
+		if (eio_reg_read(i2c_chan, stat, &val))
+			return -EIO;
+
+	} while ((val & target) != target);
+
+	/* clear status */
+	eio_reg_write(i2c_chan, stat, val);
+
+	/* Must read data after clearing status */
+	if (eio_reg_read(i2c_chan, reg, &tmp))
+		return -EIO;
+	*data = (u8)tmp;
+
+	return 0;
+}
+
+static int set_freq(struct eio_i2c_chan *i2c_chan, int freq)
+{
+	u8 pre1, pre2;
+	u16 speed;
+	unsigned int reg1 = eio_chan_reg(i2c_chan, I2C_REG_PRESCALE1, SMB_REG_HPRESCALE1);
+	unsigned int reg2 = eio_chan_reg(i2c_chan, I2C_REG_PRESCALE2, SMB_REG_HPRESCALE2);
+
+	dev_dbg(eio_dev(i2c_chan), "set freq: %dkHz\n", freq);
+	if (freq > I2C_FREQ_MAX || freq < I2C_FREQ_MIN) {
+		dev_err(eio_dev(i2c_chan), "Invalid i2c freq: %d\n", freq);
+		return -EINVAL;
+	}
+
+	speed = (freq < I2C_THRESHOLD_SCLH) ? I2C_SCLH_LOW : I2C_SCLH_HIGH;
+
+	pre1 = (u8)(CHIP_CLK / speed);
+	pre2 = (u8)((speed / freq) - 1);
+
+	if (freq > I2C_THRESHOLD_SCLH)
+		pre2 |= I2C_SCL_FAST_MODE;
+
+	eio_reg_write(i2c_chan, reg1, pre1);
+	eio_reg_write(i2c_chan, reg2, pre2);
+
+	return 0;
+}
+
+static int get_freq(struct eio_i2c_chan *i2c_chan, int *freq)
+{
+	int clk;
+	unsigned int pre1 = 0, pre2 = 0;
+	unsigned int reg1 = eio_chan_reg(i2c_chan, I2C_REG_PRESCALE1, SMB_REG_HPRESCALE1);
+	unsigned int reg2 = eio_chan_reg(i2c_chan, I2C_REG_PRESCALE2, SMB_REG_HPRESCALE2);
+
+	if (eio_reg_read(i2c_chan, reg1, &pre1))
+		return -EIO;
+	if (eio_reg_read(i2c_chan, reg2, &pre2))
+		return -EIO;
+
+	clk = (pre2 & I2C_SCL_FAST_MODE) ? I2C_SCLH_HIGH : I2C_SCLH_LOW;
+	pre2 &= ~I2C_SCL_FAST_MODE;
+
+	*freq = clk / ((int)pre2 + 1);
+
+	return 0;
+}
+
+static int smb_access(struct eio_i2c_chan *i2c_chan, u8 addr, bool is_read, u8 cmd,
+		      int size, union i2c_smbus_data *data)
+{
+	int i, tmp, ret = 0;
+	unsigned int st1, st2;
+	int len = 0;
+
+	mutex_lock(&i2c_chan->lock);
+
+	ret = wait_ready(i2c_chan);
+	if (ret)
+		goto exit;
+
+	/* Force SMBus mode */
+	switch_i2c_mode(i2c_chan, false);
+
+	addr = eio_enc_7bit_addr(addr) | (is_read ? 1 : 0);
+	eio_reg_write(i2c_chan, SMB_REG_HADDR, addr);
+	eio_reg_write(i2c_chan, SMB_REG_HCMD,  cmd);
+
+	dev_dbg(eio_dev(i2c_chan), "SMB[%d], addr:0x%02X, cmd:0x%02X size=%d\n",
+		i2c_chan->id, addr, cmd, size);
+
+	switch (size) {
+	case I2C_SMBUS_QUICK:
+		dev_dbg(eio_dev(i2c_chan), "I2C_SMBUS_QUICK\n");
+		break;
+
+	case I2C_SMBUS_BYTE:
+		if (!is_read) {
+			dev_dbg(eio_dev(i2c_chan), "I2C_SMBUS_BYTE\n");
+			eio_reg_write(i2c_chan, SMB_REG_HCMD, cmd);
+		}
+		break;
+
+	case I2C_SMBUS_BYTE_DATA:
+		dev_dbg(eio_dev(i2c_chan), "I2C_SMBUS_BYTE_DATA\n");
+		if (!is_read) {
+			eio_reg_write(i2c_chan, SMB_REG_HD0, data->byte);
+			dev_dbg(eio_dev(i2c_chan), "write %X\n", data->byte);
+		}
+		break;
+
+	case I2C_SMBUS_WORD_DATA:
+		dev_dbg(eio_dev(i2c_chan), "I2C_SMBUS_WORD_DATA\n");
+		if (!is_read) {
+			eio_reg_write(i2c_chan, SMB_REG_HD0, data->block[0]);
+			eio_reg_write(i2c_chan, SMB_REG_HD1, data->block[1]);
+		}
+		break;
+
+	case I2C_SMBUS_PROC_CALL:
+		dev_dbg(eio_dev(i2c_chan), "I2C_SMBUS_PROC_CALL\n");
+		eio_reg_write(i2c_chan, SMB_REG_HD0, data->block[0]);
+		eio_reg_write(i2c_chan, SMB_REG_HD1, data->block[1]);
+		break;
+
+	case I2C_SMBUS_BLOCK_DATA:
+		dev_dbg(eio_dev(i2c_chan), "I2C_SMBUS_BLOCK_DATA\n");
+		if (is_read)
+			break;
+
+		/* Program command type */
+		eio_reg_read(i2c_chan, SMB_REG_HC, (unsigned int *)&tmp);
+		tmp &= ~(0x07 << SMB_HC_CMD_SHIFT);
+		tmp |=  (size << SMB_HC_CMD_SHIFT);
+		eio_reg_write(i2c_chan, SMB_REG_HC, tmp);
+
+		/* Force write for payload stage */
+		eio_reg_write(i2c_chan, SMB_REG_HADDR, addr & ~0x01);
+
+		/* Reset internal buffer index pointer */
+		eio_reg_and(i2c_chan, SMB_REG_HC2, (int)~SMB_HC2_E32B);
+		eio_reg_or(i2c_chan, SMB_REG_HC2, SMB_HC2_E32B);
+
+		/* Write length + data */
+		eio_reg_write(i2c_chan, SMB_REG_HD0, data->block[0]);
+		for (i = 1; i <= data->block[0]; i++)
+			eio_reg_write(i2c_chan, SMB_REG_HBLOCK, data->block[i]);
+		break;
+
+	case I2C_SMBUS_BLOCK_PROC_CALL:
+		/* Set command type field */
+		eio_reg_and(i2c_chan, SMB_REG_HC, (0x07 << SMB_HC_CMD_SHIFT));
+		eio_reg_write(i2c_chan, SMB_REG_HD0, data->block[0]);
+
+		/* Reset buffer index */
+		eio_reg_and(i2c_chan, SMB_REG_HC2, (int)~SMB_HC2_E32B);
+		eio_reg_or(i2c_chan, SMB_REG_HC2, SMB_HC2_E32B);
+
+		for (i = 1; i <= data->block[0]; i++)
+			eio_reg_write(i2c_chan, SMB_REG_HBLOCK, data->block[i]);
+		break;
+
+	default:
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	/* Launch transaction */
+	eio_reg_read(i2c_chan, SMB_REG_HC, (unsigned int *)&tmp);
+	tmp &= ~(0x07 << SMB_HC_CMD_SHIFT);
+	tmp |=  (size << SMB_HC_CMD_SHIFT) | SMB_HC_START;
+	tmp &= ~(SMB_HC_I2C_NACKEN | SMB_HC_KILL | SMB_HC_PEC_EN);
+	eio_reg_write(i2c_chan, SMB_REG_HC, tmp);
+
+	ret = wait_busy(i2c_chan);
+	if (ret)
+		goto exit;
+
+	eio_reg_read(i2c_chan, SMB_REG_HS,  &st1);
+	eio_reg_read(i2c_chan, SMB_REG_HS2, &st2);
+
+	if (st1 & SMB_HS_FAILED) {
+		dev_err(eio_dev(i2c_chan), "HS FAILED\n");
+		ret = -EIO;
+	} else if (st1 & SMB_HS_ARL_ERR) {
+		dev_err(eio_dev(i2c_chan), "ARL FAILED\n");
+		ret = -EIO;
+	} else if (st2 & SMB_HS2_TO_ERR) {
+		dev_err(eio_dev(i2c_chan), "timeout\n");
+		ret = -ETIME;
+	} else if (st2 & SMB_HS2_NACK_ERR) {
+		dev_err(eio_dev(i2c_chan), "NACK err\n");
+		ret = -EIO;
+	} else if (st2 & SMB_HS2_PEC_ERR) {
+		dev_err(eio_dev(i2c_chan), "PEC err\n");
+		ret = -EIO;
+	}
+	if (ret)
+		goto exit;
+
+	switch (size) {
+	case I2C_SMBUS_QUICK:
+		dev_dbg(eio_dev(i2c_chan), "I2C_SMBUS_QUICK\n");
+		break;
+
+	case I2C_SMBUS_BYTE:
+	case I2C_SMBUS_BYTE_DATA:
+		if (is_read) {
+			unsigned int v;
+
+			dev_dbg(eio_dev(i2c_chan), "I2C_SMBUS_BYTE/I2C_SMBUS_BYTE_DATA\n");
+			eio_reg_read(i2c_chan, SMB_REG_HD0, &v);
+			data->block[0] = (u8)v;
+			dev_dbg(eio_dev(i2c_chan), "read %X\n", data->block[0]);
+		}
+		break;
+
+	case I2C_SMBUS_WORD_DATA: {
+		unsigned int v0, v1;
+
+		if (is_read) {
+			dev_dbg(eio_dev(i2c_chan), "I2C_SMBUS_WORD_DATA\n");
+			eio_reg_read(i2c_chan, SMB_REG_HD0, &v0);
+			eio_reg_read(i2c_chan, SMB_REG_HD1, &v1);
+			data->block[0] = (u8)v0;
+			data->block[1] = (u8)v1;
+		}
+		break;
+	}
+
+	case I2C_SMBUS_PROC_CALL: {
+		unsigned int v0, v1;
+
+		dev_dbg(eio_dev(i2c_chan), "I2C_SMBUS_PROC_CALL\n");
+		eio_reg_read(i2c_chan, SMB_REG_HD0, &v0);
+		eio_reg_read(i2c_chan, SMB_REG_HD1, &v1);
+		data->block[0] = (u8)v0;
+		data->block[1] = (u8)v1;
+		break;
+	}
+
+	case I2C_SMBUS_BLOCK_DATA:
+		if (!is_read)
+			break;
+
+		dev_dbg(eio_dev(i2c_chan), "I2C_SMBUS_BLOCK_DATA\n");
+		eio_reg_read(i2c_chan, SMB_REG_HD0, (unsigned int *)&len);
+		len = min(len, I2C_SMBUS_BLOCK_MAX);
+		data->block[0] = len;
+
+		for (i = 1; i <= len; i++)
+			eio_reg_read(i2c_chan, SMB_REG_HBLOCK,
+				     (unsigned int *)&data->block[i]);
+		break;
+
+	default:
+		ret = -EINVAL;
+		goto exit;
+	}
+
+exit:
+	/* Clear latched status */
+	eio_reg_write(i2c_chan, SMB_REG_HS,  0xFF);
+	eio_reg_write(i2c_chan, SMB_REG_HS2, 0xFF);
+
+	mutex_unlock(&i2c_chan->lock);
+	return ret;
+}
+
+static int i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int nmsgs)
+{
+	int msg, data;
+	int addr = 0;
+	int dummy;
+	int ret = 0;
+	struct eio_i2c_chan *i2c_chan = i2c_get_adapdata(adap);
+
+	mutex_lock(&i2c_chan->lock);
+
+	ret = wait_ready(i2c_chan);
+	if (ret)
+		goto exit;
+
+	switch_i2c_mode(i2c_chan, true);
+
+	dev_dbg(eio_dev(i2c_chan), "Transmit %d I2C messages\n", nmsgs);
+	for (msg = 0; msg < nmsgs; msg++) {
+		int is_read = msgs[msg].flags & I2C_M_RD;
+		bool no_ack = msgs[msg].flags & I2C_M_IGNORE_NAK;
+
+		dev_dbg(eio_dev(i2c_chan), "message %d len=%d\n", msg, msgs[msg].len);
+
+		if (!msgs[msg].len)
+			let_stop(i2c_chan);
+
+		if (msgs[msg].flags & I2C_M_TEN) {
+			addr = eio_enc_10bit_addr(msgs[msg].addr);
+			addr |= is_read;
+			dev_dbg(eio_dev(i2c_chan), "10-bit addr: %X\n", addr);
+
+			ret = write_addr(i2c_chan, addr >> 8, no_ack);
+			if (!ret)
+				ret = write_data(i2c_chan, addr & 0x7F, no_ack);
+		} else {
+			addr = eio_enc_7bit_addr(msgs[msg].addr);
+			addr |= is_read;
+			dev_dbg(eio_dev(i2c_chan), "7-bit addr: %X\n", addr);
+
+			ret = write_addr(i2c_chan, addr, no_ack);
+		}
+
+		if (ret)
+			goto exit;
+
+		if (!msgs[msg].len)
+			goto exit;
+
+		if (is_read)
+			ret = eio_trigger_read(i2c_chan, (u32 *)&dummy);
+
+		/* Transmit all messages */
+		for (data = 0; data < msgs[msg].len; data++) {
+			if (msgs[msg].flags & I2C_M_RD) {
+				bool last = (msgs[msg].len == data + 1);
+
+				if (last)
+					let_stop(i2c_chan);
+
+				ret = read_data(i2c_chan, &msgs[msg].buf[data]);
+				dev_dbg(eio_dev(i2c_chan), "I2C read[%d] = %x\n",
+					data, msgs[msg].buf[data]);
+
+				/* Don't stop twice */
+				if (last && ret == 0)
+					goto exit;
+			} else {
+				ret = write_data(i2c_chan, msgs[msg].buf[data], no_ack);
+				dev_dbg(eio_dev(i2c_chan), "I2C write[%d] = %x\n",
+					data, msgs[msg].buf[data]);
+			}
+			if (ret)
+				goto exit;
+		}
+	}
+
+	if (!ret)
+		ret = bus_stop(i2c_chan);
+
+	if (!ret)
+		goto exit;
+
+exit:
+	if (ret)
+		reset_bus(i2c_chan);
+
+	i2c_clear(i2c_chan);
+	clr_inuse(i2c_chan);
+
+	mutex_unlock(&i2c_chan->lock);
+	return ret ? ret : nmsgs;
+}
+
+static int smbus_xfer(struct i2c_adapter *adap, u16 addr,
+		      u16 flags, char is_read, u8 cmd,
+		      int size, union i2c_smbus_data *data)
+{
+	int ret;
+	struct eio_i2c_chan *i2c_chan = i2c_get_adapdata(adap);
+	int nmsgs = is_read ? 2 : 1;
+	u8 buf[I2C_SMBUS_BLOCK_MAX + sizeof(u32)] = { cmd, };
+	struct i2c_msg msgs[2] = {
+		{ .addr = addr, .flags = flags & ~I2C_M_RD, .buf = buf + 0 },
+		{ .addr = addr, .flags = flags |  I2C_M_RD, .buf = buf + 1 },
+	};
+
+	/* Non-I2C channels use the SMB engine, except I2C block variants we emulate */
+	if (!is_i2c(i2c_chan) && size != I2C_SMBUS_I2C_BLOCK_DATA)
+		return smb_access(i2c_chan, addr, is_read, cmd, size, data);
+
+	if (data) {
+		buf[0] = cmd;
+		/* FIX: preserve other flags; only toggle I2C_M_RD */
+		msgs[0].flags = is_read ? (flags | I2C_M_RD) : (flags & ~I2C_M_RD);
+		msgs[1].buf   = data->block;
+	}
+
+	switch (size) {
+	case I2C_SMBUS_QUICK:
+		dev_dbg(eio_dev(i2c_chan), "I2C_SMBUS_QUICK on I2C\n");
+		nmsgs = 1;
+		break;
+
+	case I2C_SMBUS_BYTE:
+		dev_dbg(eio_dev(i2c_chan), "I2C_SMBUS_BYTE on I2C\n");
+		nmsgs = 1;
+		msgs[0].len   = 1;
+		msgs[0].buf   = is_read ? data->block : buf;
+		msgs[0].flags = is_read ? (flags | I2C_M_RD) : (flags & ~I2C_M_RD);
+		break;
+
+	case I2C_SMBUS_BYTE_DATA:
+		dev_dbg(eio_dev(i2c_chan), "I2C_SMBUS_BYTE_DATA on I2C\n");
+		if (!data)
+			return -EINVAL;
+		msgs[0].len = is_read ? 1 : 2;
+		buf[1]      = data->block[0];
+		msgs[1].len = 1;
+		break;
+
+	case I2C_SMBUS_WORD_DATA:
+		dev_dbg(eio_dev(i2c_chan), "I2C_SMBUS_WORD_DATA on I2C\n");
+		if (!data)
+			return -EINVAL;
+		msgs[0].len = is_read ? 1 : 3;
+		msgs[1].len = 2;
+		buf[1]      = data->block[0];
+		buf[2]      = data->block[1];
+		msgs[1].buf = data->block;
+		break;
+
+	case I2C_SMBUS_I2C_BLOCK_DATA:
+	case I2C_SMBUS_I2C_BLOCK_BROKEN:
+		dev_dbg(eio_dev(i2c_chan), "I2C_SMBUS_I2C_BLOCK_(DATA/BROKEN) on I2C len=%d\n",
+			data->block[0]);
+		if (!data)
+			return -EINVAL;
+		msgs[0].len = is_read ? 1 : data->block[0] + 1;
+		msgs[1].len = data->block[0];
+		msgs[1].buf = data->block + 1;
+		if (msgs[0].len >= I2C_SMBUS_BLOCK_MAX ||
+		    msgs[1].len >= I2C_SMBUS_BLOCK_MAX)
+			return -EINVAL;
+		if (!is_read)
+			memcpy(buf + 1, data->block + 1, msgs[0].len);
+		break;
+
+	case I2C_SMBUS_PROC_CALL:
+		dev_dbg(eio_dev(i2c_chan), "I2C_SMBUS_PROC_CALL on I2C\n");
+		if (!data)
+			return -EINVAL;
+		nmsgs = 2;
+		msgs[0].flags = flags & ~I2C_M_RD;
+		msgs[0].len   = 3;
+		buf[1]        = data->block[0];
+		buf[2]        = data->block[1];
+		msgs[1].len   = 2;
+		break;
+
+	case I2C_SMBUS_BLOCK_DATA:
+		dev_dbg(eio_dev(i2c_chan), "I2C_SMBUS_BLOCK_DATA on I2C not supported\n");
+		return -EINVAL;
+
+	case I2C_SMBUS_BLOCK_PROC_CALL:
+		dev_dbg(eio_dev(i2c_chan), "I2C_SMBUS_BLOCK_PROC_CALL on I2C not supported\n");
+		return -EINVAL;
+
+	default:
+		return -EINVAL;
+	}
+
+	ret = i2c_xfer(adap, msgs, nmsgs);
+	return ret < 0 ? ret : 0;
+}
+
+static int load_i2c(struct device *dev, enum eio_chan_id id,
+		    struct eio_i2c_chan *i2c_chan)
+{
+	u32 base_lo, base_hi, base;
+	int ldn = LDN_I2C0 + id;
+	struct eio_i2c_dev *eio_i2c = i2c_chan->parent;
+	struct regmap *map;
+
+	if (!eio_i2c || !eio_i2c->regmap)
+		return dev_err_probe(dev, -ENODEV, "missing parent/regmap\n");
+
+	map = eio_i2c->regmap;
+
+	/* Read channel I/O base via shared PNP window */
+	mutex_lock(&eio_i2c->pnp_mutex);
+	if (regmap_write(map, REG_PNP_INDEX, REG_EXT_MODE_ENTER) ||
+	    regmap_write(map, REG_PNP_INDEX, REG_EXT_MODE_ENTER) ||
+	    regmap_write(map, REG_PNP_INDEX, REG_LDN) ||
+	    regmap_write(map, REG_PNP_DATA,  ldn) ||
+	    regmap_write(map, REG_PNP_INDEX, REG_BASE_HI) ||
+	    regmap_read(map,  REG_PNP_DATA,  &base_hi) ||
+	    regmap_write(map, REG_PNP_INDEX, REG_BASE_LO) ||
+	    regmap_read(map,  REG_PNP_DATA,  &base_lo) ||
+	    regmap_write(map, REG_PNP_INDEX, REG_EXT_MODE_EXIT)) {
+		mutex_unlock(&eio_i2c->pnp_mutex);
+		dev_err(dev, "error read/write I2C[%d] IO port\n", id);
+		return -EIO;
+	}
+	mutex_unlock(&eio_i2c->pnp_mutex);
+
+	base = (base_hi << 8) | base_lo;
+	if (base == 0xFFFF || base == 0) {
+		dev_dbg(dev, "i2c[%d] base addr=%#x (not in-use)\n", id, base);
+		return -ENODEV;
+	}
+
+	dev_dbg(dev, "i2c[%d] base addr=%#x\n", id, base);
+
+	/* Bind channel (no per-chan dev) */
+	i2c_chan->base = (u16)base;
+	i2c_chan->id   = id;
+
+	/* Per-channel frequency policy */
+	if (i2c_chan->freq_override != USE_DEFAULT)
+		set_freq(i2c_chan, i2c_chan->freq_override);
+
+	get_freq(i2c_chan, &i2c_chan->freq_override);
+
+	return 0;
+}
+
+static u32 functionality(struct i2c_adapter *adap)
+{
+	struct eio_i2c_chan *i2c_chan = i2c_get_adapdata(adap);
+
+	return is_i2c(i2c_chan) ? SUPPORTED_I2C : SUPPORTED_SMB;
+}
+
+static const struct i2c_algorithm algo = {
+	.smbus_xfer	= smbus_xfer,
+	.master_xfer	= i2c_xfer,
+	.functionality	= functionality,
+};
+
+static int eio_i2c_probe(struct platform_device *pdev)
+{
+	static const char * const names[] = { "i2c0", "i2c1", "smb0", "smb1" };
+	struct device *dev = &pdev->dev;
+	struct eio_i2c_dev *eio_i2c;
+	struct eio_dev *eio_dev = dev_get_drvdata(dev->parent);
+	int ret = 0;
+	enum eio_chan_id ch;
+
+	if (!eio_dev) {
+		dev_err(dev, "Error contact eio_core\n");
+		return -ENODEV;
+	}
+
+	timeout = clamp_t(int, timeout, I2C_TIMEOUT / 100, I2C_TIMEOUT * 100);
+	dev_info(dev, "Timeout value %d\n", timeout);
+
+	eio_i2c = devm_kzalloc(dev, sizeof(*eio_i2c), GFP_KERNEL);
+	if (!eio_i2c)
+		return -ENOMEM;
+
+	eio_i2c->dev = dev;
+	eio_i2c->mfd = dev->parent;
+	eio_i2c->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!eio_i2c->regmap)
+		return dev_err_probe(dev, -ENODEV, "parent regmap not found\n");
+
+	mutex_init(&eio_i2c->pnp_mutex);
+	platform_set_drvdata(pdev, eio_i2c);
+
+	for (ch = EIO_I2C0; ch < MAX_I2C_SMB; ch++) {
+		struct eio_i2c_chan *i2c_chan;
+
+		i2c_chan = devm_kzalloc(dev, sizeof(*i2c_chan), GFP_KERNEL);
+		if (!i2c_chan) {
+			ret = -ENOMEM;
+			break;
+		}
+
+		i2c_chan->parent = eio_i2c;
+		i2c_chan->freq_override = USE_DEFAULT;
+		mutex_init(&i2c_chan->lock);
+
+		if (load_i2c(dev, ch, i2c_chan)) {
+			dev_info(dev, "No %s%d!\n", (ch < 2) ? "I2C" : "SMBus", ch & 1);
+			continue;
+		}
+
+		i2c_chan->adap.owner      = THIS_MODULE;
+		i2c_chan->adap.class      = I2C_CLASS_HWMON;
+		i2c_chan->adap.algo       = &algo;
+		i2c_chan->adap.dev.parent = dev;
+		snprintf(i2c_chan->adap.name, sizeof(i2c_chan->adap.name), "eio-%s",
+			 names[ch]);
+
+		i2c_set_adapdata(&i2c_chan->adap, i2c_chan);
+
+		ret = i2c_add_adapter(&i2c_chan->adap);
+		dev_info(dev, "Add %s%d %s. %d\n", (ch < 2) ? "I2C" : "SMBus",
+			 ch, ret ? "Error" : "Success", ret);
+		if (ret)
+			break;
+
+		eio_i2c->chan[ch] = i2c_chan;
+	}
+
+	if (ret) {
+		for (ch = EIO_I2C0; ch < MAX_I2C_SMB; ch++) {
+			if (eio_i2c->chan[ch]) {
+				i2c_del_adapter(&eio_i2c->chan[ch]->adap);
+				eio_i2c->chan[ch] = NULL;
+			}
+		}
+	}
+
+	return ret;
+}
+
+static void eio_i2c_remove(struct platform_device *pdev)
+{
+	struct eio_i2c_dev *eio_i2c = platform_get_drvdata(pdev);
+	enum eio_chan_id ch;
+
+	for (ch = EIO_I2C0; ch < MAX_I2C_SMB; ch++) {
+		if (eio_i2c->chan[ch]) {
+			i2c_del_adapter(&eio_i2c->chan[ch]->adap);
+			eio_i2c->chan[ch] = NULL;
+		}
+	}
+}
+
+static struct platform_driver eio_i2c_driver = {
+	.probe  = eio_i2c_probe,
+	.remove = eio_i2c_remove,
+	.driver = {
+		.name = "i2c_eio",
+	},
+};
+
+module_platform_driver(eio_i2c_driver);
+
+MODULE_AUTHOR("Wenkai Chung <wenkai.chung@advantech.com.tw>");
+MODULE_AUTHOR("Ramiro Oliveira <ramiro.oliveira@advantech.com>");
+MODULE_DESCRIPTION("I2C driver for Advantech EIO embedded controller");
+MODULE_LICENSE("GPL");
+MODULE_SOFTDEP("pre: eio_core");

-- 
2.43.0


