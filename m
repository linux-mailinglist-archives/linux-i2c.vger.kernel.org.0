Return-Path: <linux-i2c+bounces-13120-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85875B9680A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 17:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7041B189AB03
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 15:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D616125782E;
	Tue, 23 Sep 2025 15:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="dq2PKrLN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021078.outbound.protection.outlook.com [40.107.130.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6442571DA;
	Tue, 23 Sep 2025 15:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758640225; cv=fail; b=PQXAsSmgCWZdo2Ta4bKwT6vL9mI1KqgyMkASlbUxtYUpHHnAdntMiGW8THmj6cNu79UowXzB1j/f2KSPR9CqFUDmQgW+xfS39I9Z1u/Iq71HWOmFe3mg4e2+iBAjSLyw2vceGh2cLWxEIcL2xk5uhNWHk5Q9IQU6FE4NujJwSN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758640225; c=relaxed/simple;
	bh=G1stlCtSrq9R9LGq5Dc6aVbCUNHv3+SqFKs3k/uNL50=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VcuOGz19KoA5ks2LfuBo938u0Ob0bQLDEr6Ys8Ync+SsSkElHn/2wPjnzKNL7O5CmOs1PnxLJ5h6Z/4gWUmLiHdae86dNHWwPeZFi82c1jzShlanLRLlR3+LZDRMoimpq3Hzc4VKvBxW4X5M44mQ0j0w75JN9eEWSK1mu60iOjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=dq2PKrLN; arc=fail smtp.client-ip=40.107.130.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0wMvBkq9CJp/7JDJqeRtxsDpEU2oFArV8OnF60sLdZxFzqi4SlZeOFrDL+U1JkvoP0uj4Vy0/9Zwy/kZ5hWjoww330mnalmldDpr+M+PKFX0ttBX18YrYkZVsrEgdQ7yL5wSPZt/TeEGpFcm5YdcYGh8TVBW2ihc1elBbKezs6cDE6iI6cAzTSsT51RDtdWuuZjRiarcNqO5CUOt5jTqRcn/SIDOD+EWAJ97e/APBO8qmq9/hbizQLKaKYRMgFIck+ZRi4an/91oIwQW3Ey32rFlAr9OeRu6dHjbJRWvfjr3o9BLln+GqgtigBBJ9fSXB/j+99AfVPJL9Ds3Of7MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtA6ocG/+QiYhbngbkgexk+cKPvNpi/OcXv4mF4AAtY=;
 b=EYTVPI8uBGExb7IU1Rqj+CHKBQc3G6xaSztn74AsWYAoj9JU0DcT6iKfN2r0iuQ4gYh1o7S4amIwTwEzgPwTkLeqXhw1S4usamV3/1O6A+jWXiTZ6vxuqOKgRGh8rBpZrn4c6POYHIRI/yoDWCZJLEooK8dbd3O2PivMzR87wQQSGDRQkL9Zj048g6I/IYVPVwvGQ21hj4JF7SdqdKrEMNeY+TEe6qRCgr91ZQzTQgNJR7ffD9KuKc8BsB6Kh8bKTSFmUXE7IMqAatPkyyxao6zYxsVb35Qu/LgtkFXm5CkZaT6S9fQksMApE0KvXw3aofCuyRQYBBLbU8tEHcM3zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtA6ocG/+QiYhbngbkgexk+cKPvNpi/OcXv4mF4AAtY=;
 b=dq2PKrLN0VKdDYBILPpBS+yMNWHjZJ7bvzNuPMV91+jSW20kxy9q7ZliGZDzAut09JFBvXjuyYsKjkPkicCvDoULXaNRmqyE+CmipSO++ZW4ONvNi4nxF8wA4ahaLxoyfTfoZjOPdHyzfkbtBCd5zhR7MjOhVfVUwcnxkwAJNQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AS8PR02MB9235.eurprd02.prod.outlook.com (2603:10a6:20b:5c1::5)
 by DU4PR02MB10956.eurprd02.prod.outlook.com (2603:10a6:10:592::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 15:10:18 +0000
Received: from AS8PR02MB9235.eurprd02.prod.outlook.com
 ([fe80::32a9:a9e6:ded:5714]) by AS8PR02MB9235.eurprd02.prod.outlook.com
 ([fe80::32a9:a9e6:ded:5714%5]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 15:10:18 +0000
Message-ID: <0186ebba-958b-8076-3706-1edc75b6c6d3@axentia.se>
Date: Tue, 23 Sep 2025 17:10:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH RFC 0/7] I2C Mux per channel bus speed
Content-Language: en-US
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0017.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::7) To AS8PR02MB9235.eurprd02.prod.outlook.com
 (2603:10a6:20b:5c1::5)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9235:EE_|DU4PR02MB10956:EE_
X-MS-Office365-Filtering-Correlation-Id: 1501a459-ca73-4b3b-68a3-08ddfab34e5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWlTcFBVYWZMZlltMitac3dHRTdwNlJhdmZEZnk4dkJGQjZibzE1Q2M3VWQ5?=
 =?utf-8?B?OW0vS0RNelMwbmMrbTNOT1BOeHlmSWdQUkh2eGhZWThqT3I0TW9QQTRQOUhX?=
 =?utf-8?B?T004OE9HMURaeU5oaUVIdnJSS0NYWU9QcmJXZk5mOVBTOVlUbHpaaG90bHFo?=
 =?utf-8?B?OWtha0VHOHZSNzFGaTl6b1hLUzRMZmUvWXA5Vm4xOVI5ZFVtSlNSOElseG1D?=
 =?utf-8?B?Z2tBWEJ6K2FLNDR3Q1dLUVJoMWozWGxSNkMrL3YvTmhhT2VqQVIyQzNGcHls?=
 =?utf-8?B?UzJ1blhPbjI4YkZpdEc2TVI3dDZBK3kydEd2N0oyaW52TzFscFgrSkJXOXgx?=
 =?utf-8?B?UGdiZ2JUak1tR2xWaEVObTd2ODhLMzd0WjBlTEZ6eDFBK1FsZWNKRUdlRkd1?=
 =?utf-8?B?QklsUE9wWmJFTXV1dSs0ZVFFTEV1YlA1Mk0vZ3Jickh6SE0zZU9BaXVHS1Z3?=
 =?utf-8?B?cEkzYXYvTkwzZ2VLRDB6bHVDNjA4YUxqYzRKbzQvY2VnQVcrTzkyZXkzbEFi?=
 =?utf-8?B?elZnV1BBNlI0cVVyZlA1QSs4N2JjWktqYXhpOTY5S1ZCbTJTOS94MjBiZldh?=
 =?utf-8?B?aG05V0JtWDhuYlpnSnRzKzlTTC94TVpmN2xxd0ZPeEJrZlJZQ2hwdGNQaTJ5?=
 =?utf-8?B?Q1hCZWttcjAwNGxIeDJJRFdyZUtENnRJTFQwUmg5TVFNcUVxOXlxY3BJTDJn?=
 =?utf-8?B?WGZEWlJMWVRTRlVJWWVaSmFkMzBnYS8yUVg4R2tQK2dRVVBJU2hqMmVSaVNi?=
 =?utf-8?B?a3ZuYTJMblRyNzdpaXh5bWgyWkpaV2JVTG96VXRFdkpHK3I5eGdyblJzQnQ5?=
 =?utf-8?B?aUdOdkNFTmliZTNCU2ZSU1pxMnhTbGRkUXRZOHFZOGhJN095d2ltdndKekw5?=
 =?utf-8?B?YkVwdDFhM05pMDRJbWxTZEZkMmtIOXYvMlhwQUlmMjQyL2cyRmFXTjRkS3Bo?=
 =?utf-8?B?b1JUdW93S2hPZ1RNaGJ4WnVxVkxnR0lnV3ZlUGQyZHVVeVBBaTMwbTJmMVhD?=
 =?utf-8?B?OVVBRm0vbDlmUUxuL2ZZZE5YVTNHNzdYMTBnbnIrM0xRQnRvOFJwcjBwOGJr?=
 =?utf-8?B?T2pteUtadzhtb2xDMHREY245ZmlyVGhlMzI1cXFpcE1CS2lMc2xmeENvMmJM?=
 =?utf-8?B?VlJrM2phcFBtMW5DR0hFbk9mQ2pkc2s1cm5lTXAvTVg4bzRaM2lpRlJIYXZ5?=
 =?utf-8?B?RlhHd1ovVUo3L0s5VmhFL2JXd2hNUFBDTTBkeWxhcTJ6alBrQ3djM0pXbklF?=
 =?utf-8?B?ZlVZdkpUUnVpWUZTVnJjeDdiMzlDajlPS3dRcHA3d0FyQUV2cmlGY1NIUEFu?=
 =?utf-8?B?UElKYVRZaFVTQ1hpNElWeG13K2FsaVJhMDdOWjh5V3lQb2hBYm5rM3NwNlZa?=
 =?utf-8?B?NDhia0E5c3FpN3FUMUFnVWttaVlOZWdjVm5ZV09qVEpmRzVPcW1NMTYveXdN?=
 =?utf-8?B?UktRSWV2Wkd4NnczZnBPT0RTRk9DZjIwWDFLRkJmL29jUFlRL1kyUWJ2Uk1x?=
 =?utf-8?B?WW5lbVVveVAwdG1kZjRCWEQ1bjlzeC9oWTNYbG5YaFErOURsa3RDUlZER0VO?=
 =?utf-8?B?TmZXZ2lMbmUxbFJzbWNXNE5jb1hvK2x4T2JNQUNBWGFNMmpOTkxwYm9EZWtu?=
 =?utf-8?B?KzNjTVlBejE5dUFYV0p5RlU0cXY4am0yWXN6Yit5cXo3QkpTVGZYcHRGMGFQ?=
 =?utf-8?B?SUI4a0pWWDRSOHRUUTlKSTU4OTRuemhvbjJKdGMxVWlqamJ1T2FBL2xkK1dm?=
 =?utf-8?B?WW10Wld3QU5IWjZ3L0ZBdzdpam1QRzhzdEJuSGJOYStRNkNraERoUWF1U2x6?=
 =?utf-8?B?Yk03eG5KSVhuTXBxc3lseC9oUnBMR051bFdEdmJZNnJkOUlOSUN1c0RIU3h2?=
 =?utf-8?B?K3MwZndqL1NDc0RqTTRFMElrWmp0end3QjV2OWJ4djNwcmNGOXVnSDJGdmtS?=
 =?utf-8?Q?DKk5KFO4SMc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9235.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3Uxck90QXZhYkhqemVDRm56K0hLK0dxUExTZDFnMllHMVd3c3VVK05NL1gr?=
 =?utf-8?B?VE5JaS9kbGQ4b1NGb0huaDFTU05tUVZrSFRPS2JIV3RmU1pkVmtyZHB5Sk5C?=
 =?utf-8?B?TjNzeHQrUUtaR2tYVGlHb3VmUDBBTmdSczlEY1UyQ3ZvMkFpczYvWW9mMzIz?=
 =?utf-8?B?ODZ5aGhIZTRQQ1orRk1YclM2b28zUTV6djhjOFBSeUVFN2JEN3lScEQ2VkR3?=
 =?utf-8?B?Q0FJN3Z1aWlRdjVmRUN0VUtFc05wWWtreXdBZng4bDdXYXR2OTJlWldxaFVx?=
 =?utf-8?B?cTFkaDZ1SjZmdkl6djZ2d25aclY0TnZLVk5FL3dOSnpWc3pqL1hCbzF3Nk5h?=
 =?utf-8?B?eE1jZWJldmIrMzl2WWhSQm03Vm9Wdmk5T1dBR2RGTlJqU3p3YzhYcndxR3hQ?=
 =?utf-8?B?WU54SmdkeWFCeUtXbjFkOUlKWUxJRTlMVC9JcmFUWEYwSVNZbHF4eGVkTHFj?=
 =?utf-8?B?MU55RllKR0R0NldpekRMM0Y4RVN1bC8vMDNndWxoekhPQlpJN3Y5dFNuNGE4?=
 =?utf-8?B?NlYxMm1HbUwrTlptallHT1RHeGxVcEhYNjZ1KzJEajl1bHF4T3BQVVZhRmpI?=
 =?utf-8?B?eU1RaDNRSXprcnkxcHJQa1JaTlR4VHJYa284TXJHQkxNZDFpdkZxNXd5U2lP?=
 =?utf-8?B?UnNlMEZNb29MeVJwdUR4Mmg3MlJJNlJnVFA5cW5yVFBzbHJlTkNkeTQxejlR?=
 =?utf-8?B?WnFMK2NFTEhzaGo4dUhVS1hna3lTZnZmQVg0VGtBMkg2azNwSXZUdDB4MlJm?=
 =?utf-8?B?MjFna2JpUUpuUTJWQngzbkZBRGV5a0xpQU5VY0tFbmNJVnBTdEl6M1BXVERM?=
 =?utf-8?B?VGsrUTZsK0RYWlBzTlhlL3VzL0Z2ZzR4UFBVTEsyVkZiWWFCRUdCRjNpaU9y?=
 =?utf-8?B?VW04YzQzMnBhazE4dE10N1FFUXc0ZXJZUllrb2tFQWhob3VBNzlwdi83UXlo?=
 =?utf-8?B?UmZRbWpDeXBiMTFPN3FUbkQ4YWhyeks0U1FwUlYrTXNBVEcrUytMVEliQzds?=
 =?utf-8?B?SCtMV2dUVHdabHNFMFFadStVRkJjYVlIcjBmSkxsejVtWVc3eUVwZGQ5djhF?=
 =?utf-8?B?d2w4MnBoTVU4eUlrd2lhdVBaaFJVaEpqcWJXSzJWRzJuTWszck9OUE9WQ012?=
 =?utf-8?B?VFpJSVMxWEZCbDNhT2VIdnBWWTlYcXhHY3RjSlI2M3NiK0xJTGhwZTYzSVRQ?=
 =?utf-8?B?NVJTL3NSSm5scytDOWFkZ2g1SVViSTNpWk1OSDlnR1Voa3RpYlBLSER5NExN?=
 =?utf-8?B?MmhlNjg5MG1Pa1UvbHduVEltdXljWUhjTk1JZjVpVmpMdDh0ZG1LT0g3U0Zz?=
 =?utf-8?B?NmdJbmhYb2sveW10U0JKSWIyYXBFanNyTjN3cmIycTR1K2NrZVBOZytUSXJs?=
 =?utf-8?B?YmhEU05QSlVtSmZsYmNDQXNSN3RLaWJydFQ0WTgvMFNmbXhlMldNYTUybXRl?=
 =?utf-8?B?RStJTUZVTzV4eEh2a0VSSWtCeUpzSUhZbVM1ZWROT3RqbEN2bzRtbDQxT2Z4?=
 =?utf-8?B?N1Zmd2dhUFhCZWJ2Rm5GTmczWWdKQ2FKbVRRTkxUOHVwOWZwRXpBekhXdFBm?=
 =?utf-8?B?OVZRL1JIWVc0TjFyV3l5TlhNVEhVSEJCUkwzNGZIZitEY21HQ0xaZEs3bWZj?=
 =?utf-8?B?by8xU25OQjBmbUFVTWlGSXhQd2lkM2U3YkV5czJ6VEV1Y1ZzOHU4Uys5QTFH?=
 =?utf-8?B?UXJWWUNySGs2RHhaUzMvQ2RSUXRhR1hxT0Z1Mk1uM0lQYzJ1Wmg3dkVzT2F6?=
 =?utf-8?B?T2J5Q0c0KzZtOTc3ZEtMQmlEcXcxWnpTenJtc2FzWnphMVhObnFFaDVsSXBU?=
 =?utf-8?B?MUVrbk1lNy9jbFhkYjQrRjFEb21yZG1RWjFkbm1Jc0Y3U0dpaEFTejZ3R2Ni?=
 =?utf-8?B?eHJxYXVBcTBRSnpkbnVoMUxtNThVUTR1WFFwaDljNjZoQnhHbTJyK256b0M2?=
 =?utf-8?B?eVR0MFJqV05XTUNEd0lnQld6bGhMT1BRVjNvVllXbHovRUxZcmNGTkVvYXVR?=
 =?utf-8?B?MVFIdlZDMzRoaU1mSHI4THdFSTh0TTdGK3Z5d1lDc2RkdEdJcnVOcEFlaEFt?=
 =?utf-8?B?U1M1bU9aZkNtQnJKMGZEY3d0cGE1eWlGZ2kxNWVNTEVDYVF5bWlDRUFVRmxP?=
 =?utf-8?Q?jZWZgaL/jNehgsKQ706czsctZ?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 1501a459-ca73-4b3b-68a3-08ddfab34e5b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9235.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 15:10:17.9648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xiGPMoY7kUBKvqKn9L2uW6XwznLiq2p7pEpvhzk4xlDs2vGJ7r8gUrA7IJ/fFd4s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB10956

Hi!

2025-09-22 at 08:20, Marcus Folkesson wrote:
> This is an RFC on how to implement a feature to have different bus
> speeds on different channels with an I2C multiplexer/switch.
> 
> The benefit with this approach is that you may group devices after
> the fastest bus speed they can handle.
> A real-world example is that you could have e.g. a display running @400kHz
> and a smart battery running @100kHz using the same I2C controller.
> 
> There are many corner cases where this may cause a problem for some
> hardware topologies. I've tried to describe those I could think of
> in the documentation, see Patch #7.
> 
> E.g. one risk is that if the mux driver does not disconnect channels
> when Idle, this may cause a higher frequency to "leak" through to
> devices that are supposed to run at lower bus speed.
> This is not only a "problem" for changing bus speed but could also be
> an issue for potential address conflicts.
> 
> The implementation is split up into several patches:
> 
> Patch #1 Introduce a callback for the i2c controller to set bus speed
> Patch #2 Introduce idle state to the mux core.
> Patch #3 Introduce functionality to adjust bus speed depending on mux
>          channel.
> Patch #4 Set idle state for an example mux driver
> Patch #5 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
> Parch #6 Implement set_clk_freq for the i2c-davinci driver
> Parch #7 Update documentation with this feature
It seems excessive to add idle_state to struct i2c_mux_core for the sole
purpose of providing a warning in case the idle state runs on lower speed.
Especially so since the default idle behavior is so dependent on the mux.

E.g. the idle state is completely opaque to the driver of the pinctrl mux.
It simply has no way of knowing what the idle pinctrl state actually means,
and can therefore not report back a valid idle state to the i2c-mux core.

The general purpose mux is also problematic. There is currently no API
for the gpmux to dig out the idle state from the mux subsystem. That
can be fixed, of course, but the mux susbsystem might also grow a way
to change the idle state at runtime. Or some other consumer of the "mux
control" used by the I2C gpmux might set it to a new state without the
I2C gpmux having a chance to prevent it (or even know about it).

You can have a gpio mux that only muxes SDA while SCL is always forwarded
to all children. That might not be healthy for devices not expecting
overly high frequencies on the SCL pin. It's probably safe, but who knows?

The above are examples that make the warning inexact.

I'd prefer to just kill this idle state hand-holding from the code and
rely on documentation of the rules instead. Whoever sets this up must
understand I2C anyway; there are plenty of foot guns, so avoiding this
particular one (in a half-baked way) is no big help, methinks.

This has the added benefit of not muddying the waters for the idle state
defines owned by the mux subsystem.

Cheers,
Peter

