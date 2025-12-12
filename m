Return-Path: <linux-i2c+bounces-14522-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC3ECB9516
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 17:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2C10304A590
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 16:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36762D3EDC;
	Fri, 12 Dec 2025 16:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b="RCnRKQv1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023098.outbound.protection.outlook.com [40.107.44.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FEE2D3724;
	Fri, 12 Dec 2025 16:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765557723; cv=fail; b=XNnTudz9eDjdGujTj/JvczEMn4YTS8D4pXbBOtsJee3Gh4BPJYZqpgI9hW4SD85hbJTXuzVSXfLnV1f56Zat+D0nS3Ia28/i1OUPYPOfL/tKbN5N4VG5oA7612RYGZ9FM1YA8qm3mTJhnVucSHRdMou6lACrlVzB1AUtGr5WnJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765557723; c=relaxed/simple;
	bh=s2UIJ7vhMpF4qfu3LEzaEKI+74S2F2KpdlxCIAWFEHY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lvo4b6N2B5E/gzZMLe1IfA41XsZw8D5s8gfCeVy9WyLNZ1aOt4lOuHnIxlaxLSHY3BEWsEIVoomV4e4DYCWNUWs9q4uEIy7Qyg4MgS4Izg8paISpqVWd0OnDXCICiwlr5Ack4qczvPtl8Bj/knSPQeQIvGPU9yGYAL0/Ojnbojo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com; spf=pass smtp.mailfrom=advantech.de; dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b=RCnRKQv1; arc=fail smtp.client-ip=40.107.44.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=advantech.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acjDnKgpRw8Ausi0VzTjC43yyD030IAXRC7cbJAzbSvuHQM8ebVxmRdt5ayl5IipiScojArpFZpb2R3KVGM5HiH9Yi3LTdXcrnoOJCpaZGGTETD8pNWStKwTe/OFPJbbaJQv8ItQTjPfzCdAARqylgnZhVy32c6f5lGhT2RGB/M0zdoPxIjz3G0dVxsUN4DbM6PBclhitVT71Ib0pCYqt9Kh1R0mbr4qfZAWODj/rR81PVr80+OdCK9dq/SJmv9DeVsIssOMREYq2R/WuerRd+f8f7pdrhyi/xpf/gKfqPJuXQHKZUUX1qmURDgWcYEZ73ULcdpgkZpdHl91rQX4eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSuHPe15ou/gs6r7qUgitmcEPQDcyG3wtCT7sFq9SgI=;
 b=uw4AC86Y1mPEX4/h2nYhDWnBk6nL3ZAascMRflLkBnGTvLyElCXT0ABRs9ImxtbaiUkdv1VdcqvyNf3xThqho4B2A3w0+B/2FrjpEle2eyapbyPdrLLLYHV0iRw6tIdd1xqj5evFohmiQo6zHaM1FxxEfZkk9OpfYV0qhPmx8hBJj3UBUKR6vx/7Y0zl+d0pRSUNxe4dFXE6UUmq1LEvB2PKAHfew+cJZ2NIZ01g0FGZmgQ+iG16hdfQneMDrG/GL0YoMRlMJ1+3GnktxXHDulYh98xDt9e8tfp+IoJeigAl+2T/tJnjho/YCoCJATopr/RievOvCWeskUSJzBKxMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.de; dmarc=pass action=none header.from=advantech.com;
 dkim=pass header.d=advantech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSuHPe15ou/gs6r7qUgitmcEPQDcyG3wtCT7sFq9SgI=;
 b=RCnRKQv1LnoCw8+Pelld6OvQa3/Z6Yfq28KfL7OhXd9qFkKna/woUrbUCCiaRgpg8JgF4zp9yZv1WOOqENrvvYzujLvexqKTY6MpmZGAbKt6T8HzOm2FF7fRRWLvt8kG9/0h0FUAChhCNVL1M0iO74cZXkGMIi63i6UpV+ClSIelQv2Qh+jKNM0yCJoRvXuk/yMqq1FvuLZfKchicsZanpBInvCkPC+MOe5ZFc7RpVm77jUWk7dNOQfZMP7YjOzq2dIn6wjQka5ox/up6zSh6reW15zgQ3Gcg6/LlmCxdKN3S3CTGjQ745B06sMwVEvwdqkm6raI9WFYMnz0bmynQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.com;
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com (2603:1096:301:21::6)
 by JH0PR02MB6564.apcprd02.prod.outlook.com (2603:1096:990:3f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 16:41:54 +0000
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::59c9:fe0:25f6:702b]) by PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::59c9:fe0:25f6:702b%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:41:54 +0000
From: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Date: Fri, 12 Dec 2025 17:40:57 +0100
Subject: [PATCH 6/8] Add Advantech EIO Watchdog driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-upstream-v1-v1-6-d50d40ec8d8a@advantech.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18326;
 i=ramiro.oliveira@advantech.com; h=from:subject:message-id;
 bh=s2UIJ7vhMpF4qfu3LEzaEKI+74S2F2KpdlxCIAWFEHY=;
 b=owEB7QES/pANAwAKAc7t0Ke8vbAJAcsmYgBpPEWhT0eioszro0oA7czmwIA6zwc29gQFQgvFc
 RdmEqM8LXWJAbMEAAEKAB0WIQS1Nkng0ZvJmBKh6GLO7dCnvL2wCQUCaTxFoQAKCRDO7dCnvL2w
 CQ2FDACfzLQTM4TPgJV1m7iYMkzFu/bG//SX4fxikx4BFJhDhDzgeg3C3uaKXoYcQe+ZrkrbhPA
 lNOoMg9I2efte+6l+iRMWfBRif1R1rN7g6ywdnk9ssDX0mZKM0P2UGlQTG4HAkT3WNillosikxs
 9C/1tYnkGcQO8qvqKyqzS8q0SPimK76fJhy06ioJ927yZ+vEA2FR02B+dnItNnV/C/psTekA1k7
 L3RVlelK7RcPKEBAm+/1MHdYyPvHxJUBMfeWGrjTdnPWROu8pnUFKRPAhlw1DjNcING5ydTv41D
 UkT0nQZSAglVPmbnmhYi3cXPB6E3X+51U8l9CEYEAGRun1NdWL8ELRZGO3NzDKpvqhUoiysUI0b
 xchkFgl9SK6UVARCInyEyVXXxDh5P5wz8mj9GOqw1gI90mFaqclxQ7zKk6DIghyBbPxPPFjDm+n
 KPvq18J1gB/b6vad0xBk6cAX2h2VtN+w2YowBTbqSL/5s7eyx9uDeUtY3UbvGlVZYomgQ=
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
X-MS-Office365-Filtering-Correlation-Id: 0b44a3c2-96da-4645-ac7a-08de399d5bc9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0VoZUFEdkY3NzVPbitmaklsR1dPL0FkVEhmTWYzTlR5OGk4eGFzOWEvbklY?=
 =?utf-8?B?Y3NSUHd6K0N0bTdUcE1sMytwRUxHVWFUcklRTHduWWxKeFJZRitjYUg2Y2NI?=
 =?utf-8?B?bkdnQ3VRNEZ0eVhpSGwxcmlhMjM4eklXZVRtbXJmYkxEdTg2UXZwZW1XTHlt?=
 =?utf-8?B?WXcrbjRrTFdjRmQ0elJvMkdyZkErTnMvUUdoQ0hEM3U2b2J2YXRtVGhrdnNO?=
 =?utf-8?B?TVJxK0tMb294NE1rVmE5TzNrR0FrVXRaTG9hSVplVjJRMHR6Y0JrRWNWTzRo?=
 =?utf-8?B?L0ZPbDZ3L1dBWW8zL0JtL0ZhMHNHcC96aTNKcG9SN09RMDVmSnlDYVBoN2Ni?=
 =?utf-8?B?RS9hVWFObEFBV2FvNVI4U1N2cmIwQU8rcTVnYkF1SmlpQzZrQWFTQ3kzeldn?=
 =?utf-8?B?K1ZBZjR0OG1BUGpFQVhXMytQTm1HTnhJVnFPT21RSFd6clhUOG1aNTlxaVF3?=
 =?utf-8?B?alQ2N2ZEUlJ0c0czbVFPQXRzUmZQN2VDM0RoTjh2aXgzT1ZwR3A0K0ZuY3E0?=
 =?utf-8?B?cEowNzJzNUtrNjRKNkthNWxwS2piVGVTMWd3cTdMMGJHcGFONXRCUVRRY1Jh?=
 =?utf-8?B?RGlSNVp0bWFmczF3NkRXUmVTU3RuOFArSU9CWDhmTjhvMFlzcGFFVWE1ZERz?=
 =?utf-8?B?SWk4QWdLNUZOZVlzMStzdEsxelNJbURsNWNCMHhXU2Zmc0c1RWZTVzlVazMw?=
 =?utf-8?B?UzJOcmZDVnJiRjBVaVBlVFVFa01PL2NXN3NpTmtzeUVtZFRJZFQ5TnFrQTIr?=
 =?utf-8?B?UFBUMlVjWENqSUU4VWU3YmczNEROWVBnQ2RmQmlqbkRmU05zWVkwcy9pWlla?=
 =?utf-8?B?TEZIWnFIZ3B3SUFFbTNwcjI2WmpORDNTbVBxbnVDYkQ5UTE4OFVsM3cvS085?=
 =?utf-8?B?RTZTbldPRUJiVURJcEFvMWJHTWkwaWQxbDV3T2Q4SS9KUFNpYXZNNCt1Q0VD?=
 =?utf-8?B?VUVEdjVjSmhaS1pENTBRUEVYdGxVWU01WDg2U1NvbmFod1JsbWhUbXJMM2li?=
 =?utf-8?B?NDgwQzZmUytSazh5QnEvYzhoTkVsU1l0VDZqTThTcmdxR0hNeXpEbHNhKzJL?=
 =?utf-8?B?V05xT0dWMFJYdEIxayt2aGJYV0NBZGoya3hIU1kwSFI3UlE0Y2JnRDBXM2Nx?=
 =?utf-8?B?SG1WWk1NblJrRFZseUFXajRreFV1M2gwMnR0dGc5Yk96WVcraWxvTUJIc2tX?=
 =?utf-8?B?UkhCbnI3aWMzTklRaHptUE0rdVNnWnNmVHd5TTBTTXE0aVZGc0RMMXlYZTUy?=
 =?utf-8?B?ZVRwbm1VUFFWSHMxb01aQ3hmaTBla1BoM054L0p3Mm1obWpsNzFkTU9OVlY3?=
 =?utf-8?B?K2VoNm5wUkl5enZUWTlueFBwSlNKRVJzWStrZjJjZjFQY3UyUHdoc3lXR0VY?=
 =?utf-8?B?UzlUSHcxb0tMUEtKT1VkUEFTbzQrdVhNY0NvUnN2VFFXekZvOWNzQ1pCWnhj?=
 =?utf-8?B?cDRKM1lFelRzMnVaMlEyVHBzeW0vZ1JQRUNITGVrRGpHbzRmY2NoRjNkY2Y2?=
 =?utf-8?B?ajlsdjQ3eVh5MjRYKzg3eU05TzF5SjJUdGI4TkVoVTUrV1Z6UlN2Q0ZrVThE?=
 =?utf-8?B?bzNUQmRrMjZoRzdCWEJnYnh0SWVzdlUrVmpteFRHcVpRTVhiY0RYQkFkRmFa?=
 =?utf-8?B?R3M4ZExXQ3FZSU1pK3lMMzRwYWo1MndsL04zUzlXdDR2MElnR1RNYXZOSlNN?=
 =?utf-8?B?K21UOTc4OHpxUzcyK2g1dVFoOUNkdVhjVEFMbWpENE50QkhuYTVKa21SeWEw?=
 =?utf-8?B?T1BJN3dGbXZXcVhKZ3JzWFEzd1ZhNVJRNG1nUGhlMDFUN1UzZTdsSWZQREFv?=
 =?utf-8?B?L05ka3FBeDlOblhKUXNFakZFeElWM2RYWXIvZjlwZ0RqY1pMaFpENU96ZTRE?=
 =?utf-8?B?Z1EwVGdFbUNUTXR6S3ZYc2pLRE1uRG9yRmlUcWE3ejZGL3ZzZ2RtN2QwTTJQ?=
 =?utf-8?B?WE9TbjlvVEN1dkRNaGZrMGkwVUU1bDNuYXdtYXJTeEZ6WmJlaWhWeDRHNldM?=
 =?utf-8?B?OElxTU85bmhkRGhNS0V3SmdRcEx1Z21BRFllMnVpWWN5am9BMmlaMTJHam9j?=
 =?utf-8?B?RlBJRk1ENEVDWTNVUmNnUlJQYm5aU0FlYndVQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR02MB4502.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFRmSXBKWmVNTTZBZzM2RVlNcHdsa0I3Z1BVdzlERHN5dVdkdGswY0UrblY4?=
 =?utf-8?B?QjBKMnpid3h0SnZJYzVpMkxmL2ViWWhxcEhwMm9PYWhuQWYzWXNidyttSFFN?=
 =?utf-8?B?bG5TZzNOeC9zN2RPZ2xBbWNvbmNVMzBCY0NicS9QVm42NmtTTG92a0drR2k0?=
 =?utf-8?B?bEJQUXY0QkhSaU1LeUU0b1Bld3hRbGdCVWlCbDUzd0VTY2QzK0Z3MVJXUmQx?=
 =?utf-8?B?S2NXTDMyeW44Tkx4bTUvUXdWalBtQXFKckJKZXpiWk5Id0pWckNyWTVHUWpI?=
 =?utf-8?B?STFLVWxLclFlUnFKUXVNZ3ExYmN0U2RqbGZYV2o1cVFJRVcvcWsrdU93dGRC?=
 =?utf-8?B?ZEpybXNPS0Y5aGNrbE9BRVNIUHpuRTVQV2ltdWprUmhvWVRFZHBYQXpCMith?=
 =?utf-8?B?VzdEQzRZeTI2SGJta2FrTmt4dUFzVG5TRmdJbHNxNEIvV2dwRlg4T0JmeU1z?=
 =?utf-8?B?NkhhOVZWSEMwZXlmbDVubTJIWkdXRlJVaEN3SmtwRGJFRitHUE9zcGprNjJ3?=
 =?utf-8?B?UVlyb01SZVhGb2lvYXFMbXBVU09WeHVNYzR6YVFZUmVJT2JlRW9kaksxRXYz?=
 =?utf-8?B?SzM5dFdseDJEeEhsOE9QYXhvVWZNVU1ZS3YxUVRrNEFZUHd2TU5wSVBYOEg3?=
 =?utf-8?B?aXpYeWpxRE5Na0hBT2k4OG81WFMxU2hLSnBYSXNNdXZDRUdFanBKREhUd0NH?=
 =?utf-8?B?dHlNVEhuc1NLVUQ0eE80dFltT1MzZDhSTmU1MTFjb3pXVWJzSGZ6bXZoZVFF?=
 =?utf-8?B?WlNiL1FvWWp0cGVtSi9KeXkxTFk5ZlNRQlhRSWpOcTRXRWVPMnBpWGR0NHhZ?=
 =?utf-8?B?MXZHRG5MenBmekcvNlRsRDNKZGNHcHhJL21SZUVaMEs3V3NDUlNBZzgwbTJ5?=
 =?utf-8?B?OTd0eURHNkdoamNyU2ltRzZpcTE3THlDT0hQNFJDWFBSWXRNSHdtamczR3lx?=
 =?utf-8?B?ZW4vOGptVTJ2NVpSV2RSTzNpM2NUV2pwbE9sRDc3UmMxbmRleW9CdUVBYTU1?=
 =?utf-8?B?UjlpaURNS3RzV1R3eHJzOE9xNklCNFQxQnBvOWFYbklaSXZkRFc5VUNzVzFW?=
 =?utf-8?B?em5DZTVoOExGc2VnSjlhK1dGTDIxWXdrL0JFNFQ2K3ZreDJjUmVhTWZnZnky?=
 =?utf-8?B?bVgrSmdVbG5HZFdDWUJrc21RRnpZU2VSampKUnF2eU5JNzU3OEhnblBNdzRF?=
 =?utf-8?B?Zm95SFpDdm83QkRTcHpZZlY0V1JEVkdWTVFrZXlaUkZBVmIzK1d4Tm9qTVFE?=
 =?utf-8?B?dWh6dUh6aHB5NmUrVndxTldhMjhTalJXRm43SG5PNDVEQ1p2WnBvUnFwQWF1?=
 =?utf-8?B?RVk1cWFjdVFHZWtCOXQ5L0FqRzgwcHBzTVdmWGtJZTZITnR0eDl5eW5wWmRk?=
 =?utf-8?B?S2pWbENwcHcvZGZIakRSYW9kamN5UzVNYnlaT0JLeitPT0poWlk1OWJBUnFq?=
 =?utf-8?B?bzRQYWFUeTRFUkhLS2g1b0NJSWZrOXJIMGJneFA4WVRXTlNSdXVJKy9Hb2t4?=
 =?utf-8?B?WVVDcW8yZWpDNGpwSDBhdmh2N1ovQmQ1VTNYaWczTGYyeElMeHNYMllHQmR0?=
 =?utf-8?B?NXpOUmlHRUJuU0wvSXlKazZtK0lIMWFGOEN4Mzh3SnZZVHFFWk5JSlpMakV5?=
 =?utf-8?B?Rk1sTjd0b1o2OEpSTnQ3RFhyQVgwaC8vdEpCNzVyQkIzN0tIWHBubUVBLyt4?=
 =?utf-8?B?RjZjS3pya0J6VWNuK04wSjJPTy8xYmExYWhNZmRlT0FLSG1vSjFabUp5ckV1?=
 =?utf-8?B?OUIwZHhwTG5qbGNTZCtVQWlJdUN0dGtidWp0L08wVHJFZ1VZMEczcFo0Tmlk?=
 =?utf-8?B?RXNYdHk3aTJRTHpOM0ZkN2F5eTd1OWRsVjhMSDdDYlBIZ3hyL2VwYjUxdEs1?=
 =?utf-8?B?Nlp1Vm1peFJ6RDNxd3ZuOXNpOGZONG56d1gzY0ozYzN2RG1pR3FFYXY1M3d4?=
 =?utf-8?B?OWdkRmZyVW5ha3pLUm1ZbzdTN2gvSDlkZG5EdUJoQ2k2M0dLYlg2NDNrVHFY?=
 =?utf-8?B?dHhhS25EVlB6M21FVTRPa3c0N20wNnFXeWNOUWpZcjQ3Y0dyZkdDbDZnVlR4?=
 =?utf-8?B?RU9hVWNGV2hLY0dvTlF2Y1RuRmVMRXFDdVMySlBmNWZXb0dRZGIvNmFXeTB1?=
 =?utf-8?B?TjFPcnpvNS9LT2k2QXpucUZFZmZ2aGVEY2lIelozZzlBWk1lRndtM0FqdGk4?=
 =?utf-8?Q?wV+XWix3XGCp4t6lJ9k5+xQ=3D?=
X-OriginatorOrg: advantech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b44a3c2-96da-4645-ac7a-08de399d5bc9
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4502.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:41:54.6803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJvMuV71o9HJmdeS6eJlHwCvIOezaq7BcjM8JXnVltl2DlPHBIVUBKnl+AsJK/3lfA8oV/HInW/RvSvrpq+l/JabmDlmnmMipQmmNiJpjl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB6564

This commit adds the driver to control the Advantech EIO Watchdog block,
this block is included in the Advantech EIO Embedded Controller.

Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>
---
 MAINTAINERS                |   1 +
 drivers/watchdog/Kconfig   |   7 +
 drivers/watchdog/Makefile  |   1 +
 drivers/watchdog/eio_wdt.c | 672 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 681 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index df4b4cc31257..dfdf4f39c14b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -624,6 +624,7 @@ F:	drivers/hwmon/eio-hwmon.c
 F:	drivers/i2c/busses/i2c-eio.c
 F:	drivers/mfd/eio_core.c
 F:	drivers/video/backlight/eio_bl.c
+F:	drivers/watchdog/eio_wdt.c
 F:	include/linux/mfd/eio.h
 
 ADXL313 THREE-AXIS DIGITAL ACCELEROMETER DRIVER
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index d3b9df7d466b..2f8508e51634 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -248,6 +248,13 @@ config DA9062_WATCHDOG
 
 	  This driver can be built as a module. The module name is da9062_wdt.
 
+config EIO_WATCHDOG
+	tristate "Advantech EIO Watchdog"
+	depends on MFD_EIO
+	help
+	  Watchdog timer driver for the Advantech EIO.
+	  If unsure, say N.
+
 config GPIO_WATCHDOG
 	tristate "Watchdog device controlled through GPIO-line"
 	depends on OF_GPIO
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index ba52099b1253..59b5ec0246d6 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -230,6 +230,7 @@ obj-$(CONFIG_DA9052_WATCHDOG) += da9052_wdt.o
 obj-$(CONFIG_DA9055_WATCHDOG) += da9055_wdt.o
 obj-$(CONFIG_DA9062_WATCHDOG) += da9062_wdt.o
 obj-$(CONFIG_DA9063_WATCHDOG) += da9063_wdt.o
+obj-$(CONFIG_EIO_WATCHDOG) += eio_wdt.o
 obj-$(CONFIG_GPIO_WATCHDOG)	+= gpio_wdt.o
 obj-$(CONFIG_WDAT_WDT) += wdat_wdt.o
 obj-$(CONFIG_WM831X_WATCHDOG) += wm831x_wdt.o
diff --git a/drivers/watchdog/eio_wdt.c b/drivers/watchdog/eio_wdt.c
new file mode 100644
index 000000000000..a81f005d82d2
--- /dev/null
+++ b/drivers/watchdog/eio_wdt.c
@@ -0,0 +1,672 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Advantech EIO Watchdog Driver
+ *
+ * Copyright (C) 2025 Advantech Co., Ltd.
+ */
+
+#include <linux/interrupt.h>
+#include <linux/jiffies.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/reboot.h>
+#include <linux/uaccess.h>
+#include <linux/watchdog.h>
+#include <linux/mfd/eio.h>
+
+#define WATCHDOG_TIMEOUT	60
+#define WATCHDOG_PRETIMEOUT	10
+
+/* Support Flags */
+#define SUPPORT_AVAILABLE	BIT(0)
+#define SUPPORT_PWRBTN		BIT(3)
+#define SUPPORT_IRQ		BIT(4)
+#define SUPPORT_SCI		BIT(5)
+#define SUPPORT_PIN		BIT(6)
+#define SUPPORT_RESET		BIT(7)
+
+/* PMC registers */
+#define REG_STATUS		0x00
+#define REG_CONTROL		0x02
+#define REG_EVENT		0x10
+#define REG_PWR_EVENT_TIME	0x12
+#define REG_IRQ_EVENT_TIME	0x13
+#define REG_RESET_EVENT_TIME	0x14
+#define REG_PIN_EVENT_TIME	0x15
+#define REG_SCI_EVENT_TIME	0x16
+#define REG_IRQ_NUMBER		0x17
+
+/* PMC command and control */
+#define CMD_WDT_WRITE		0x2A
+#define CMD_WDT_READ		0x2B
+#define CTRL_STOP		0x00
+#define CTRL_START		0x01
+#define CTRL_TRIGGER		0x02
+
+/* I/O register and its flags */
+#define IOREG_UNLOCK		0x87
+#define IOREG_LOCK		0xAA
+#define IOREG_LDN		0x07
+#define IOREG_LDN_PMCIO		0x0F
+#define IOREG_IRQ		0x70
+#define IOREG_WDT_STATUS	0x30
+
+/* Flags */
+#define FLAG_WDT_ENABLED	0x01
+#define FLAG_TRIGGER_IRQ	BIT(4)
+
+/* Mapping event type to supported bit */
+#define EVENT_BIT(type)	BIT(type + 2)
+
+enum event_type {
+	EVENT_NONE,
+	EVENT_PWRBTN,
+	EVENT_IRQ,
+	EVENT_SCI,
+	EVENT_PIN
+};
+
+struct eio_wdt_dev {
+	u32 event_type;
+	u32 support;
+	int irq;
+	unsigned long last_time;
+	struct regmap *iomap;
+	struct device *mfd;
+	struct device *dev;
+	struct watchdog_device wdd;
+	struct eio_dev *core;
+};
+
+static char * const type_strs[] = {
+	"NONE",
+	"PWRBTN",
+	"IRQ",
+	"SCI",
+	"PIN",
+};
+
+static u32 type_regs[] = {
+	REG_RESET_EVENT_TIME,
+	REG_PWR_EVENT_TIME,
+	REG_IRQ_EVENT_TIME,
+	REG_SCI_EVENT_TIME,
+	REG_PIN_EVENT_TIME,
+};
+
+/* Specify the pin triggered on pretimeout or timeout */
+static char *event_type = "NONE";
+module_param(event_type, charp, 0);
+MODULE_PARM_DESC(event_type, "Watchdog timeout event type (NONE, PWRBTN, IRQ, SCI, PIN)");
+
+/* Specify the IRQ number when the IRQ event is triggered */
+static int irq;
+module_param(irq, int, 0);
+MODULE_PARM_DESC(irq, "The IRQ number for IRQ event");
+
+static int timeout;
+module_param(timeout, int, 0444);
+MODULE_PARM_DESC(timeout, "Set PMC command timeout value.\n");
+
+static int pmc_write(struct device *dev, u8 ctrl, void *data)
+{
+	struct pmc_op op = {
+		.cmd       = CMD_WDT_WRITE,
+		.control   = ctrl,
+		.payload   = data,
+		.size     = (ctrl <= REG_EVENT) ? 1 :
+			    (ctrl >= REG_IRQ_NUMBER) ? 1 : 4,
+		.timeout   = timeout,
+	};
+	return eio_core_pmc_operation(dev, &op);
+}
+
+static int pmc_read(struct device *dev, u8 ctrl, void *data)
+{
+	struct pmc_op op = {
+		.cmd       = CMD_WDT_READ,
+		.control   = ctrl,
+		.payload   = data,
+		.size     = (ctrl <= REG_EVENT) ? 1 :
+			    (ctrl >= REG_IRQ_NUMBER) ? 1 : 4,
+		.timeout   = timeout,
+	};
+	return eio_core_pmc_operation(dev, &op);
+}
+
+static int wdt_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
+{
+	struct eio_wdt_dev *eio_wdt = watchdog_get_drvdata(wdd);
+
+	wdd->timeout = timeout;
+	dev_info(eio_wdt->dev, "Set timeout: %u\n", timeout);
+
+	return 0;
+}
+
+static int wdt_set_pretimeout(struct watchdog_device *wdd, unsigned int pretimeout)
+{
+	struct eio_wdt_dev *eio_wdt = watchdog_get_drvdata(wdd);
+
+	wdd->pretimeout = pretimeout;
+	dev_info(eio_wdt->dev, "Set pretimeout: %u\n", pretimeout);
+
+	return 0;
+}
+
+static int wdt_get_type(struct eio_wdt_dev *eio_wdt)
+{
+	int i;
+
+	for (i = 1; i < ARRAY_SIZE(type_strs); i++) {
+		if (strcasecmp(event_type, type_strs[i]) == 0) {
+			if ((eio_wdt->support & EVENT_BIT(i)) == 0) {
+				dev_err(eio_wdt->dev,
+					"This board doesn't support %s trigger type\n",
+					event_type);
+				return -EINVAL;
+			}
+
+			dev_info(eio_wdt->dev, "Trigger type is %d:%s\n",
+				 i, type_strs[i]);
+			eio_wdt->event_type = i;
+			return 0;
+		}
+	}
+
+	dev_info(eio_wdt->dev, "Event type: %s\n",
+		 type_strs[eio_wdt->event_type]);
+	return 0;
+}
+
+static int get_time(struct eio_wdt_dev *eio_wdt, u8 ctrl, u32 *val)
+{
+	int ret;
+
+	ret = pmc_read(eio_wdt->mfd, ctrl, val);
+	if (ret)
+		return ret;
+
+	/* ms to sec */
+	*val /= 1000;
+
+	return 0;
+}
+
+static int set_time(struct eio_wdt_dev *eio_wdt, u8 ctrl, u32 time)
+{
+	/* sec to ms */
+	time *= 1000;
+
+	return pmc_write(eio_wdt->mfd, ctrl, &time);
+}
+
+static int wdt_set_config(struct eio_wdt_dev *eio_wdt)
+{
+	int ret, type;
+	u32 event_time = 0;
+	u32 reset_time = 0;
+
+	if (eio_wdt->event_type > EVENT_PIN)
+		return -EFAULT;
+
+	/* Calculate event time and reset time */
+	if (eio_wdt->wdd.pretimeout && eio_wdt->wdd.timeout) {
+		if (eio_wdt->wdd.timeout < eio_wdt->wdd.pretimeout)
+			return -EINVAL;
+
+		reset_time = eio_wdt->wdd.timeout;
+		event_time = eio_wdt->wdd.timeout - eio_wdt->wdd.pretimeout;
+
+	} else if (eio_wdt->wdd.timeout) {
+		reset_time = eio_wdt->event_type ?	0 : eio_wdt->wdd.timeout;
+		event_time = eio_wdt->event_type ? eio_wdt->wdd.timeout : 0;
+	}
+
+	/* Set reset time */
+	ret = set_time(eio_wdt, REG_RESET_EVENT_TIME, reset_time);
+	if (ret)
+		return ret;
+
+	/* Set every other times */
+	for (type = 1; type < ARRAY_SIZE(type_regs); type++) {
+		ret = set_time(eio_wdt, type_regs[type],
+			       (eio_wdt->event_type == type) ? event_time : 0);
+		if (ret)
+			return ret;
+	}
+
+	dev_dbg(eio_wdt->dev, "Config wdt reset time %u\n", reset_time);
+	dev_dbg(eio_wdt->dev, "Config wdt event time %u\n", event_time);
+	dev_dbg(eio_wdt->dev, "Config wdt event type %s\n",
+		type_strs[eio_wdt->event_type]);
+
+	return 0;
+}
+
+static int wdt_get_config(struct eio_wdt_dev *eio_wdt)
+{
+	int ret, type;
+	u32 event_time = 0, reset_time = 0;
+
+	/* Get Reset Time */
+	ret = get_time(eio_wdt, REG_RESET_EVENT_TIME, &reset_time);
+	if (ret)
+		return ret;
+
+	dev_dbg(eio_wdt->dev, "Timeout H/W default timeout: %u secs\n", reset_time);
+
+	/* Get every other times */
+	for (type = 1; type < ARRAY_SIZE(type_regs); type++) {
+		if ((eio_wdt->support & EVENT_BIT(type)) == 0)
+			continue;
+
+		ret = get_time(eio_wdt, type_regs[type], &event_time);
+		if (ret)
+			return ret;
+
+		if (event_time == 0)
+			continue;
+
+		if (reset_time) {
+			if (reset_time < event_time)
+				continue;
+
+			eio_wdt->wdd.timeout    = reset_time;
+			eio_wdt->wdd.pretimeout = reset_time - event_time;
+
+			dev_dbg(eio_wdt->dev,
+				"Pretimeout H/W enabled with event %s of %u secs\n",
+				type_strs[type], eio_wdt->wdd.pretimeout);
+		} else {
+			eio_wdt->wdd.timeout    = event_time;
+			eio_wdt->wdd.pretimeout = 0;
+		}
+
+		eio_wdt->event_type = type;
+
+		dev_dbg(eio_wdt->dev, "Timeout H/W enabled of %u secs\n",
+			eio_wdt->wdd.timeout);
+		return 0;
+	}
+
+	eio_wdt->event_type         = EVENT_NONE;
+	eio_wdt->wdd.pretimeout     = reset_time ? 0 : WATCHDOG_PRETIMEOUT;
+	eio_wdt->wdd.timeout        = reset_time ? reset_time : WATCHDOG_TIMEOUT;
+
+	dev_dbg(eio_wdt->dev, "Pretimeout H/W disabled\n");
+	return 0;
+}
+
+static int set_ctrl(struct eio_wdt_dev *eio_wdt, u8 ctrl)
+{
+	return pmc_write(eio_wdt->mfd, REG_CONTROL, &ctrl);
+}
+
+static int wdt_start(struct watchdog_device *wdd)
+{
+	struct eio_wdt_dev *eio_wdt = watchdog_get_drvdata(wdd);
+	int ret;
+
+	ret = wdt_set_config(eio_wdt);
+	if (ret)
+		return ret;
+
+	ret = set_ctrl(eio_wdt, CTRL_START);
+	if (!ret) {
+		eio_wdt->last_time = jiffies;
+		dev_dbg(eio_wdt->dev, "Watchdog started\n");
+	}
+
+	return ret;
+}
+
+static int wdt_stop(struct watchdog_device *wdd)
+{
+	struct eio_wdt_dev *eio_wdt = watchdog_get_drvdata(wdd);
+	int ret;
+
+	dev_dbg(eio_wdt->dev, "Watchdog stopped\n");
+	eio_wdt->last_time = 0;
+
+	ret = set_ctrl(eio_wdt, CTRL_STOP);
+	return ret;
+}
+
+static int wdt_ping(struct watchdog_device *wdd)
+{
+	struct eio_wdt_dev *eio_wdt = watchdog_get_drvdata(wdd);
+	int ret;
+
+	dev_dbg(eio_wdt->dev, "Watchdog ping\n");
+
+	ret = set_ctrl(eio_wdt, CTRL_TRIGGER);
+	if (!ret)
+		eio_wdt->last_time = jiffies;
+
+	return ret;
+}
+
+static unsigned int wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	struct eio_wdt_dev *eio_wdt = watchdog_get_drvdata(wdd);
+	unsigned int timeleft = 0;
+
+	if (eio_wdt->last_time && wdd->timeout) {
+		unsigned long delta   = jiffies - eio_wdt->last_time;
+		unsigned int  elapsed = (unsigned int)(delta / HZ);
+
+		if (elapsed < wdd->timeout)
+			timeleft = wdd->timeout - elapsed;
+	}
+	return timeleft;
+}
+
+static int wdt_support(struct eio_wdt_dev *eio_wdt)
+{
+	u8 support;
+
+	if (pmc_read(eio_wdt->mfd, REG_STATUS, &support))
+		return -EIO;
+
+	if (!(support & SUPPORT_AVAILABLE))
+		return -ENODEV;
+
+	if ((support & SUPPORT_RESET) != SUPPORT_RESET)
+		return -ENODEV;
+
+	eio_wdt->support = support;
+
+	return 0;
+}
+
+static int wdt_get_irq_io(struct eio_wdt_dev *eio_wdt)
+{
+	int ret  = 0;
+	int idx  = EIO_PNP_INDEX;
+	int data = EIO_PNP_DATA;
+	struct regmap *map = eio_wdt->iomap;
+
+	mutex_lock(&eio_wdt->core->mutex);
+
+	/* Unlock EC IO port */
+	ret |= regmap_write(map, idx, IOREG_UNLOCK);
+	ret |= regmap_write(map, idx, IOREG_UNLOCK);
+
+	/* Select logical device to PMC */
+	ret |= regmap_write(map, idx,  IOREG_LDN);
+	ret |= regmap_write(map, data, IOREG_LDN_PMCIO);
+
+	/* Get IRQ number */
+	ret |= regmap_write(map, idx,  IOREG_IRQ);
+	ret |= regmap_read(map, data, &eio_wdt->irq);
+
+	/* Lock back */
+	ret |= regmap_write(map, idx, IOREG_LOCK);
+
+	mutex_unlock(&eio_wdt->core->mutex);
+
+	return ret ? -EIO : 0;
+}
+
+static int wdt_get_irq_pmc(struct eio_wdt_dev *eio_wdt)
+{
+	return pmc_read(eio_wdt->mfd, REG_IRQ_NUMBER, &eio_wdt->irq);
+}
+
+static int wdt_get_irq(struct eio_wdt_dev *eio_wdt)
+{
+	int ret;
+
+	if (!(eio_wdt->support & BIT(EVENT_IRQ)))
+		return -ENODEV;
+
+	ret = wdt_get_irq_pmc(eio_wdt);
+	if (ret) {
+		dev_err(eio_wdt->dev, "Error get irq by pmc\n");
+		return ret;
+	}
+
+	if (eio_wdt->irq)
+		return 0;
+
+	/* Fallback: get IRQ number from EC IO space */
+	ret = wdt_get_irq_io(eio_wdt);
+	if (ret) {
+		dev_err(eio_wdt->dev, "Error get irq by io\n");
+		return ret;
+	}
+
+	if (!eio_wdt->irq) {
+		dev_err(eio_wdt->dev, "Error IRQ number = 0\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int wdt_set_irq_io(struct eio_wdt_dev *eio_wdt)
+{
+	int ret  = 0;
+	int idx  = EIO_PNP_INDEX;
+	int data = EIO_PNP_DATA;
+	struct regmap *map = eio_wdt->iomap;
+
+	mutex_lock(&eio_wdt->core->mutex);
+
+	/* Unlock EC IO port */
+	ret |= regmap_write(map, idx, IOREG_UNLOCK);
+	ret |= regmap_write(map, idx, IOREG_UNLOCK);
+
+	/* Select logical device to PMC */
+	ret |= regmap_write(map, idx,  IOREG_LDN);
+	ret |= regmap_write(map, data, IOREG_LDN_PMCIO);
+
+	/* Enable WDT */
+	ret |= regmap_write(map, idx,  IOREG_WDT_STATUS);
+	ret |= regmap_write(map, data, FLAG_WDT_ENABLED);
+
+	/* Set IRQ number */
+	ret |= regmap_write(map, idx,  IOREG_IRQ);
+	ret |= regmap_write(map, data, eio_wdt->irq);
+
+	/* Lock back */
+	ret |= regmap_write(map, idx, IOREG_LOCK);
+
+	mutex_unlock(&eio_wdt->core->mutex);
+
+	return ret ? -EIO : 0;
+}
+
+static int wdt_set_irq_pmc(struct eio_wdt_dev *eio_wdt)
+{
+	return pmc_write(eio_wdt->mfd, REG_IRQ_NUMBER, &eio_wdt->irq);
+}
+
+static int wdt_set_irq(struct eio_wdt_dev *eio_wdt)
+{
+	int ret;
+
+	if (!(eio_wdt->support & BIT(EVENT_IRQ)))
+		return -ENODEV;
+
+	ret = wdt_set_irq_io(eio_wdt);
+	if (ret) {
+		dev_err(eio_wdt->dev, "Error set irq by io\n");
+		return ret;
+	}
+
+	ret = wdt_set_irq_pmc(eio_wdt);
+	if (ret) {
+		dev_err(eio_wdt->dev, "Error set irq by pmc\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int wdt_get_irq_event(struct eio_wdt_dev *eio_wdt)
+{
+	u8 status;
+
+	if (pmc_read(eio_wdt->mfd, REG_EVENT, &status))
+		return 0;
+
+	return status;
+}
+
+static irqreturn_t wdt_isr(int irq, void *arg)
+{
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t wdt_threaded_isr(int irq, void *arg)
+{
+	struct eio_wdt_dev *eio_wdt = arg;
+	u8 status = wdt_get_irq_event(eio_wdt) & FLAG_TRIGGER_IRQ;
+
+	if (!status)
+		return IRQ_NONE;
+
+	if (eio_wdt->wdd.pretimeout) {
+		watchdog_notify_pretimeout(&eio_wdt->wdd);
+	} else {
+		dev_crit(eio_wdt->dev, "Watchdog expired, rebooting\n");
+		emergency_restart();
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int query_irq(struct eio_wdt_dev *eio_wdt)
+{
+	int ret = 0;
+
+	if (irq) {
+		eio_wdt->irq = irq;
+	} else {
+		ret = wdt_get_irq(eio_wdt);
+		if (ret)
+			return ret;
+	}
+
+	dev_dbg(eio_wdt->dev, "IRQ = %d\n", eio_wdt->irq);
+
+	return wdt_set_irq(eio_wdt);
+}
+
+static int wdt_init(struct eio_wdt_dev *eio_wdt)
+{
+	int ret;
+
+	ret = wdt_support(eio_wdt);
+	if (ret)
+		return ret;
+
+	ret = wdt_get_config(eio_wdt);
+	if (ret)
+		return ret;
+
+	ret = wdt_get_type(eio_wdt);
+	if (ret)
+		return ret;
+
+	if (eio_wdt->event_type == EVENT_IRQ)
+		ret = query_irq(eio_wdt);
+
+	return ret;
+}
+
+static const struct watchdog_ops wdt_ops = {
+	.owner		= THIS_MODULE,
+	.start		= wdt_start,
+	.stop		= wdt_stop,
+	.ping		= wdt_ping,
+	.set_timeout	= wdt_set_timeout,
+	.get_timeleft	= wdt_get_timeleft,
+	.set_pretimeout = wdt_set_pretimeout,
+};
+
+static struct watchdog_info wdinfo = {
+	.identity = KBUILD_MODNAME,
+	.options  = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
+		    WDIOF_PRETIMEOUT | WDIOF_MAGICCLOSE,
+};
+
+static int eio_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct eio_wdt_dev *eio_wdt;
+	struct watchdog_device *wdd;
+	int ret = 0;
+
+	eio_wdt = devm_kzalloc(dev, sizeof(*eio_wdt), GFP_KERNEL);
+	if (!eio_wdt)
+		return -ENOMEM;
+
+	eio_wdt->dev = dev;
+	eio_wdt->mfd = dev->parent;
+	eio_wdt->iomap = dev_get_regmap(dev->parent, NULL);
+	if (!eio_wdt->iomap)
+		return dev_err_probe(dev, -ENODEV, "parent regmap missing\n");
+
+	eio_wdt->core = dev_get_drvdata(dev->parent);
+	if (!eio_wdt->core)
+		return dev_err_probe(dev, -ENODEV, "eio_core not present\n");
+
+	ret = wdt_init(eio_wdt);
+	if (ret) {
+		dev_err(dev, "wdt_init fail\n");
+		return -EIO;
+	}
+
+	if (eio_wdt->event_type == EVENT_IRQ) {
+		ret = devm_request_threaded_irq(dev, eio_wdt->irq,
+						wdt_isr, wdt_threaded_isr,
+						IRQF_SHARED | IRQF_ONESHOT, pdev->name,
+						eio_wdt);
+		if (ret) {
+			dev_err(dev, "IRQ %d request fail:%d. Disabled.\n",
+				eio_wdt->irq, ret);
+			return ret;
+		}
+	}
+
+	wdd = &eio_wdt->wdd;
+	wdd->info        = &wdinfo;
+	wdd->ops         = &wdt_ops;
+	wdd->parent      = dev;
+	wdd->min_timeout = 1;
+	wdd->max_timeout = 0x7FFF;
+
+	ret = watchdog_init_timeout(wdd, wdd->timeout, dev);
+	if (ret) {
+		dev_err(dev, "Init timeout fail\n");
+		return ret;
+	}
+
+	watchdog_stop_on_reboot(&eio_wdt->wdd);
+	watchdog_stop_on_unregister(&eio_wdt->wdd);
+
+	watchdog_set_drvdata(&eio_wdt->wdd, eio_wdt);
+	platform_set_drvdata(pdev, eio_wdt);
+
+	ret = devm_watchdog_register_device(dev, &eio_wdt->wdd);
+	if (ret)
+		dev_err(dev, "Cannot register watchdog device (err: %d)\n", ret);
+
+	return ret;
+}
+
+static struct platform_driver eio_wdt_driver = {
+	.probe  = eio_wdt_probe,
+	.driver = {
+		.name = "eio_wdt",
+	},
+};
+module_platform_driver(eio_wdt_driver);
+
+MODULE_AUTHOR("Wenkai Chung <wenkai.chung@advantech.com.tw>");
+MODULE_AUTHOR("Ramiro Oliveira <ramiro.oliveira@advantech.com>");
+MODULE_DESCRIPTION("Watchdog interface for Advantech EIO embedded controller");
+MODULE_LICENSE("GPL");

-- 
2.43.0


