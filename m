Return-Path: <linux-i2c+bounces-14517-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDA0CB94EF
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 17:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 837F3308E6DB
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 16:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFABE2D1932;
	Fri, 12 Dec 2025 16:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b="NWHaunG8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022119.outbound.protection.outlook.com [40.107.75.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B150B2D0C85;
	Fri, 12 Dec 2025 16:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765557685; cv=fail; b=RlcCOxhvpscqmHwVf6FX7SBqRDhll1A5PXeOIcYjS1J9A3g6svBmiwBnbdyjuLDatHJwpvGNGMutjkUMejKyh6m0RMOaFZ0mjPTCf4sxZhG7cD6rjB9TNQC42h9bobg/vrSV8m0jZyJg2hLw0QN8DTE7t5cQsHK9BCltdxsceMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765557685; c=relaxed/simple;
	bh=lXC7et4a4FSUnt9QFccIWKfFZtAdsq+cQdB1VHPdxP8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rVQWjKqs8XoY1FqC29ePjPFTzCGC2fqA4KZwc2gym55UjPMmidR2ppKZkQbn52JN+ehz2ZwC0StGdSHP+aKwjsbABqFW/+E9JAippp/GpIISQyUjmt+zNIEioigtkOBumliMAgByVSQHVMiMJKcRsGEJAKMQBqdFcoTQmgltRrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com; spf=pass smtp.mailfrom=advantech.de; dkim=pass (2048-bit key) header.d=advantech.com header.i=@advantech.com header.b=NWHaunG8; arc=fail smtp.client-ip=40.107.75.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=advantech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=advantech.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XLwRNMEZ0jQmM0YX+H/MB21bEemyJQOE8P0sauJzrCJOlAUdJqK3v9eYn7iPD4k2nbndOmQLIpu1BCOMeyjEbZogBsxDHZErjZYZ1K79fq0/AZIXaMdJMC1f/UAsS8KYGTaONCTSDubXDydLe7TEGax0oAvGme4GX5WZVQOttbyrDG4olNWwv0thvOxqt8GFaI5LE3ADz5tKg5i/kgqxJqcCNySAuOepcR+OOM8SqE0hxmG0gr2RWsz2XQquwK7K5tDPr1NG/744bN5Og3JmytMTyBsQzZHFTbVD0GMoGwW5OsHb9UTeEEul5LMlM8WkM1kZ8gUz9KpvuQ5GUcrimw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKKBFqjzpIUBryC6LbQr8FENDTfj1AFX515qLe9FEpQ=;
 b=GxIEuZTbicvJNIRVhAvtp33jQ9knpittzj/0JHn1h7scN6Xc5ejLXwzhVMMzGar0xvSrluLy/b0xUZehSmPXQRW5lRj1RWomRn9GiSw7IHmjvTaivAWpYCwTwqjqDSwSf/31nJGy1rkJlRiC00PRqPj53X9Kqz30i0G6byCO0SvpM0m0FHZ/UsUl0ExlsYM4YiecNzb/toR1jHPzMIFpojGP3Truw44D2r6+1fuRITzjsxF49kNNObidEOUvwC30mSjDHe2n0hNaEQJ6k7UbiDOIv9WvX101qDNI7FEsvfzT2fd/tcUDa+6UhgMboazapO6/3AUZUNoWr4VZqV/Acw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.de; dmarc=pass action=none header.from=advantech.com;
 dkim=pass header.d=advantech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKKBFqjzpIUBryC6LbQr8FENDTfj1AFX515qLe9FEpQ=;
 b=NWHaunG8xTesBj08XDDkstAPRUMKjinIIc0xXzS+pf7Mz+3BKLfZB6aMbXuDe2kOOY0GFoIGPeqDQgQCvNmno4QZspZOJIwYYB5rUq3afUpywe6HCbLtCLyXM4B8WxwpP5LTJwoojeORT2IAjFETRftdxeNt7UuMh1XKXVf8pYRH5KMg5IleOhkeRhhNCrHY8NG4l/luUJ4wT4hqQcmnO91BvnG3iLRtWz6/vbxxBC3Rscl6v0d9a7OmEt2cigFA2Q+3WAIjisCMos6UZwxbZtrv+CUMegfHvtA8CXLmMcvWvhCS/g1jWJD6pb4it4nbnRZcp4K0y7u4JkcdkUNkGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.com;
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com (2603:1096:301:21::6)
 by JH0PR02MB6564.apcprd02.prod.outlook.com (2603:1096:990:3f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 16:41:19 +0000
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::59c9:fe0:25f6:702b]) by PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::59c9:fe0:25f6:702b%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:41:19 +0000
From: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Date: Fri, 12 Dec 2025 17:40:52 +0100
Subject: [PATCH 1/8] Add Advantech EIO MFD driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-upstream-v1-v1-1-d50d40ec8d8a@advantech.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=22601;
 i=ramiro.oliveira@advantech.com; h=from:subject:message-id;
 bh=lXC7et4a4FSUnt9QFccIWKfFZtAdsq+cQdB1VHPdxP8=;
 b=owEB7QES/pANAwAKAc7t0Ke8vbAJAcsmYgBpPEWg3Hk0ZNzIS5owkz+uvJLjFRrvxJ7TFBwfI
 lSXWzt7NASJAbMEAAEKAB0WIQS1Nkng0ZvJmBKh6GLO7dCnvL2wCQUCaTxFoAAKCRDO7dCnvL2w
 CR3KDACs4trscsGC/mbHigiBiVIGa5GkpBZTuLKLqEAgnPSW7ZoLDm4esTDiFE/wrkicS0CgiSk
 owKLvUGzqKj+mnn//KdGaGsm5TFRUZlvWe6FnRQON88kE/vJ3GKPrYVckAF236fvwu3bu94Frov
 EOmH0blaNOQqU0Lb4Iuv3IBFV5/holZAHXXOJGPfQkf5K8PDxx/7p9DZfGTAs3Y1qz8u7r2GvHe
 YGdmLwHDECq7JLifUpRqMvUIHrE+rvVpQ39LAsyuvW7RfDhG5JUCe/MobuVWFm9DveHLjKEmhjj
 36PKdVmQ+pdR4hdzpTQrLTZOiLDmXw06O+dAh7mIRcC3hNiTlIm2Wscfeyw2EF1iLaASix+2172
 UqeBH79axcgqh0PEHeuMYKwNL7MIB/nuge9p/PYdMws0WZeZk84qtfStbPeTjicPg7EbZ7a+GU+
 jRGNx/pjoSTa14uVUwaTEig9/Jy5viN8kyGs4aaQYT8xnNj2IN8xX3mDqW8Eunm5Y6sUQ=
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
X-MS-Office365-Filtering-Correlation-Id: cde7381d-816c-497c-7af3-08de399d46b6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXRpa1lFa1ZSNkNXaHlYRVlQdDRSMHZBZE5nQXdhNU1ZcEJpeE5HazdzQm16?=
 =?utf-8?B?NVhjTnJDek93K2NkQ1dzRnRTLzlLcEZTVVRodEduMGN4Y0FMeGgxUUt5R1E2?=
 =?utf-8?B?MkVHWHlnaFIzYzg0UTkwd2pGUnNYNmYzSmhxR0VheE9zczdyeHpDUVdsa2xk?=
 =?utf-8?B?ZUpMQldQTnFsNmhBcE9vdE9MWjMxaWhBaE1jeU1ZRnI0YlZhcERiVmQ5SnM2?=
 =?utf-8?B?TlVHbFBHQno5Z3FGbzhhTEdDNjQ2Z3lkZEhNUlVmREtyTDBWR04zTXN5TXIz?=
 =?utf-8?B?R0V3MnVyRGVxd04vUXdTWHR1MWNEOUhkSDViaGloV2RmN012NkI2SlVGQk5Y?=
 =?utf-8?B?YTFpNmlOSXFIUVQ5Wno3Tll1dVhDT0FTcEZ6MHgzdk9ra2JOOFEzWUYyZllZ?=
 =?utf-8?B?akphMzlPdWpodEc1VVhsdTJMRFZQUkI1MStsVFhNKzQvOUtzdkJLQzdVeUhv?=
 =?utf-8?B?SnczT0oyUHI5bG83eFp5WGJ3ZXFCeE01dXpwam1nVmlVQ2JESkV0R1NXOVBi?=
 =?utf-8?B?d1FDZm5BL0VwbnNKdlBldFc1V3kvcTVEdjRSRHJ4M1NoUW9PbHY4cEIxUkkz?=
 =?utf-8?B?N2dNMzAzekw5bmhWYlVCMkkzN3dFTUN3RzM5RTFjSlV6QkVSRmJoKyt1UFBR?=
 =?utf-8?B?M1Vidm8vMXdxaE05d3lJdHRWN016TlBzT1IvN3Y4WE04UzlWeHg0dnIybnFk?=
 =?utf-8?B?VVQxL0M4NEwrOUdDVFFRSE5jTTVXbUc1WXJoMXdRMVpRVjgwUDRac28vRy81?=
 =?utf-8?B?S0xZd0pvUUxFbWU4U1U3bGMzU3kzd0V2RWZKczNOdWdzb056REx1MUtOeUZP?=
 =?utf-8?B?Ti9sZDYxNC9HS1NSdlJ3YVNPZVRxaUt4c01QVXJ0cG1CY0s2RGZNcTNpMkJv?=
 =?utf-8?B?SWl3K3ovTkplODkrc290em5wQzNMbWF4clI5cEpTbHAyL0xKUDVDV2s0bVdX?=
 =?utf-8?B?Ry91UjNrYUNyd2tNQTBjb0hmdGRoV3AzcFgvbWh3VHFMNEU5Z1A3clVFUkhZ?=
 =?utf-8?B?a1ZsSWRwSEc5bE5WQVlvWGFWRUNYTDJSdGsvbnFYUnBHc296VEtQSm1zYmxj?=
 =?utf-8?B?QkpQNlozeEtWRk1aMjBFNUpKVlR0UFRZVkFLV2pCdzdPRjZJNEM5WTVtQUhC?=
 =?utf-8?B?ZHVGKzBXY3h2ZEIzbDg3U0dJNkJYMDkvRUU2eVFhSXBRWGMxSi9WZ24wYnhK?=
 =?utf-8?B?Mzl2QmFLNXVoRkUvRGlrdFdHWnJwZFIyUTNFb0krRHpEZFhyWGtWb3RqOTRx?=
 =?utf-8?B?aTZEYVFicHpZUnA2OWNVVUxKQjNNTWpzTTNjQzRlTk8vNmxNL1NwZEo3WDRC?=
 =?utf-8?B?T1BjNEp0NmkrbTlrb0EySEJhYlNzK1hUN3plMmhwa0F1UEVuSjNwVlFhN2F0?=
 =?utf-8?B?RlhCeW9ubmU1SHVPeWlvcDBiMHd1dWRRbGdNWUFmVVVkSjg2b3pRcjFyUUxr?=
 =?utf-8?B?eXpmYWg1aEx1SHc0Zyt2enF6Zmo2SmNncVhhTjBPMWxuQWg0MHNKS0RJaER1?=
 =?utf-8?B?ekZMUitWZW5RUkVSQ3I5U1FYV1FjYkE0aDlma1ppTFNEZmRVOEhnekkwZWRF?=
 =?utf-8?B?WVdka0RyQzNOcUpvTmVTQXNPUDFqVVBEU1oyYi9udEFwUm02SndMdWUyRWxO?=
 =?utf-8?B?M1V4NVFtL21yendPNkJaTU0yOFo3cS9Vd09sTUxTbVJ3UmVJY3BiYkhnSmNt?=
 =?utf-8?B?dVlRTGVzdWl3ditOMXB1NlR5cWJ5TXBLN3dYeW1SK1VFTm8xUUlnR3c0QXQx?=
 =?utf-8?B?MFZ4azVhRDVRZ1MzQzlKTGZxaE8rbFhvdGpxU3l1ZXc0MkNYRzc0UkxZVkVF?=
 =?utf-8?B?VStzV1lkMGZyYVdQcjFxaDJHeXg3Ulg2cEh2Mm83U1I3TmlOWStwREFkWnBP?=
 =?utf-8?B?V3ByNVhpYk1sTFV5cmJqOG82NUdpUllKUDM5VUNvaTByY1h1VCtLSEVGby9o?=
 =?utf-8?B?U001WGRocVlDZy96dExJYW5PdnpRRVN6ZmY3RE90NHVFWTdkR284NENBcXFm?=
 =?utf-8?B?cDFONUJNanE4Qm1XNWlwM2xnRkpDOFA2cFFrTVBDUnhxL25iUWxuaUV2MllF?=
 =?utf-8?B?RUtoWm9jMk4zUzljRW1QNW9MTWpzRHBWOWxGZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR02MB4502.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1JNR0ZZNGc0bHZadWY4bWRoQVpvVitBRmVyQjJjZ05KNzZRZmN1bkpwL3Vr?=
 =?utf-8?B?YzdvWGdSdG9nUWlaMFdTKzA0TllGOVJIOUN5L000VkRjeXo5dk5zOWhNeUNF?=
 =?utf-8?B?NTVWQ2pNRTJKR25nbE1NUVQrL05vQ2MreXE3V2p6ZG03eklHWWtrcXVUbVE3?=
 =?utf-8?B?VCt4TmVHVVRsaEREQ2dnTXVudWQ1cTRsOTNabzNXanJSdCtXcVhRRDlXNGc4?=
 =?utf-8?B?V2c0dTFKODhGRmdtMUxjbWN6enpXdHlSUXVycHIvaHFEVDh4Um9RVVVnVEpm?=
 =?utf-8?B?OERBbUxWWXhYWkxRcnBGMTA1Q3ArWVZocUJXNHhuY2ErWktQWld4M1Ftd0dC?=
 =?utf-8?B?YnZTYWJTbXJmd0RzdjIvY3dsbWY1RkRSNVVQOE95RXFqZ0p5bUNGQjRBMHYv?=
 =?utf-8?B?eGpVb3R1ajFCTnhxMGlLeC9QL0xlaFA3aTd2VlJHT1d4aC9JcWtTSGlETDl1?=
 =?utf-8?B?TzZkL29CbEtrZFh3TzBxbEpVVUJ4ZlhpdDk0YTY5V1ducFZscS92SGV6Z09j?=
 =?utf-8?B?cG5Ca2h5blVSYTZodGplTnNLSitoS3JVb2NQYXhBT20xL0ptVURDVlJhejY4?=
 =?utf-8?B?WXhPUmczUStxNEl0dTlVL0JFd2krOWlWTUtnRnRVWE5NQ0hXQVpDL0o0Y09T?=
 =?utf-8?B?K29ENDBvZkc4QjBURGdlY2NGMkV0V0lXbStKTEpxdlFoVnROQ0JGNmR6aDUy?=
 =?utf-8?B?MDhlc1NXYUkrY0RWOUVxM3JFVnpxVUlXWnRMbThvZ0IyZytTYnB5ekoraG81?=
 =?utf-8?B?MmJPVVhScmlnRVpXcEl1d1pvbG1YNFZZeEFaV0VMY1dITnNlZlVVU3RXZmFC?=
 =?utf-8?B?Tk5NMDFoU2ZQOUVLNnZmR2lhcGZabmNoYUVaOE5KZHRWVDBLa0FxSlA0c3Iw?=
 =?utf-8?B?SDI5S3ZqRkcyZDh6WCtNemFBVGhoUHYvQjhNVG1XU1B6Rms1M2p6ZDBSWlBG?=
 =?utf-8?B?SGxKb3ByNTlSN0NuTlE5Q0gzQ05ReHJKS014SUw3eG04MGRYTnBJQ2Z2WVhL?=
 =?utf-8?B?d2dzVmZWd0tTVW4rZldMQUp6UlZYbWs4Q0xGSjZicllTYzlhb0JlQjFlS3Fj?=
 =?utf-8?B?djBIRzBjaExJZkpjM3J6UW9CZVI3Y3g1Unk1VU9YU0lzVlFoVlVweHV3bmJN?=
 =?utf-8?B?ekZ4b1Ivb1Zpd3U4b1Q1aVNyMzJvek0yM3llZnpTeG9udVdkcEU3MWhJMk44?=
 =?utf-8?B?ZWtUS1N5MVhyeVJJTGNsMEdvTE5pVFJKSVZ4bXNZWHowMFJkbkJaWkMvYjRE?=
 =?utf-8?B?aFQyc0k1ZkwrZ3RydlVNUWt6YXJWL3RsWmVHV25sc2Z3eldrNVpQeWd1Y1lo?=
 =?utf-8?B?VTBHQ3ZHT2VDNlh4RUE3OVNISGJnYitvMy96cndTbjR4a2tMNmlsRldvUC8r?=
 =?utf-8?B?dkNSNnNLMkEvWHMxWEZ5OVkvbkNzalFoaHZKUFlhdnh6TnV6MmpJQmJibWUr?=
 =?utf-8?B?RkVTWHhFZUx5WFdKeWE2VnpVODhKQXJKMDQzb3dEbWpMS1hJbzdNdW1TM0tp?=
 =?utf-8?B?MnV1akd6SjZSeDkxaWc1L3EyUWlzM1kxY0pJbzNiekEvTlE2RldxNXYyRU91?=
 =?utf-8?B?STZRNForQTUrTFBOWWU2VTZZK2VFWVlaRjB1SzM5VzEyKzEvdndYa1M4NTFY?=
 =?utf-8?B?NWwvblU1S3hLdmUrQWdENDlrb1hrNVFLT3o2c0dTdWpQZDdNSGhBNU4zZllQ?=
 =?utf-8?B?bXZaVFIyYVliOXlTaDV6Zm5JTGdnNFlkRmVxczNLNWRYOUxYZUVTN3dvaWpZ?=
 =?utf-8?B?dnJJRTZvZXVONytseUFnRm90L3FZa3JCb3owNXlENHYwUmZxd0gvNXU4YlR0?=
 =?utf-8?B?U1NHdFdQcktmL3Yvb0NpZ2ZzUzVudjNlTjhSb2Y2TDI4a0tVbnFsendQUHla?=
 =?utf-8?B?OS9UbXpSS0tTbFhIcFlBZ2R2ZURvSlNra0RZYk9rSVVWNzRmVHYxS0RtWEk2?=
 =?utf-8?B?dHdkVk0veE1tRTJGNENtK3hnK0Y4WVVMSVo2UnBjN2FBMVVOUjhzTlVvdkFG?=
 =?utf-8?B?OWJMZHNpWFROdVI1ZGVocCtWY0k1U0hBSUcraXU1TlRjUlFsREdjeHhWdjll?=
 =?utf-8?B?R1paM25GOHNFNmhqbFFwaXRLTTczMzVRbU0zMngzcFR5c2t0L0xzZzhFUnVl?=
 =?utf-8?B?Q080eUh2ZEZWakRNejZlZmdpeW5XQ1d3UlBMdTBQZjBaVUdIVE9Ha2tGR0RL?=
 =?utf-8?Q?Ng0EuEUcbwkC3l5y3bW4B/o=3D?=
X-OriginatorOrg: advantech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cde7381d-816c-497c-7af3-08de399d46b6
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4502.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:41:19.4357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b9egq59I8bQ/5dv22zjSa7Sd7cZVrDV/2Cek1SIMuhsnDBpJ5n6niQHjbnFfBZA2iDT0UZihcoafH6aPOO+cFqwm496i2w7tIOpSPIwl0P4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB6564

Creating the MFD core driver for Advantech EIO, all other drivers (GPIO,
I2C, etc) depend on this core driver.

Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>
---
 MAINTAINERS             |   6 +
 drivers/mfd/Kconfig     |  10 +
 drivers/mfd/Makefile    |   1 +
 drivers/mfd/eio_core.c  | 621 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/eio.h | 127 ++++++++++
 5 files changed, 765 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 663e86eb9ff1..bd9279796c2f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -616,6 +616,12 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/adv_swbutton.c
 
+ADVANTECH EIO DRIVER
+M:	Ramiro Oliveira <ramiro.oliveira@advantech.com>
+S:	Maintained
+F:	drivers/mfd/eio_core.c
+F:	include/linux/mfd/eio.h
+
 ADXL313 THREE-AXIS DIGITAL ACCELEROMETER DRIVER
 M:	Lucas Stankus <lucas.p.stankus@gmail.com>
 S:	Supported
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index aace5766b38a..02a0b324eb6a 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -506,6 +506,16 @@ config MFD_DLN2
 	  etc. must be enabled in order to use the functionality of
 	  the device.
 
+config MFD_EIO
+	tristate "Advantech EIO MFD core"
+	select MFD_CORE
+	help
+	  This enables support for the Advantech EIO multi-function device.
+	  This core driver provides register access and coordination for the
+	  EIO's subdevices (GPIO, watchdog, hwmon, thermal, backlight, I2C).
+	  This driver supports EIO-IS200, EIO-201, EIO-210 and EIO-211.
+
+
 config MFD_ENE_KB3930
 	tristate "ENE KB3930 Embedded Controller support"
 	depends on I2C
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e75e8045c28a..f8c53b55b679 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_MFD_CROS_EC_DEV)	+= cros_ec_dev.o
 obj-$(CONFIG_MFD_CS42L43)	+= cs42l43.o
 obj-$(CONFIG_MFD_CS42L43_I2C)	+= cs42l43-i2c.o
 obj-$(CONFIG_MFD_CS42L43_SDW)	+= cs42l43-sdw.o
+obj-$(CONFIG_MFD_EIO)		+= eio_core.o
 obj-$(CONFIG_MFD_ENE_KB3930)	+= ene-kb3930.o
 obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
 obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
diff --git a/drivers/mfd/eio_core.c b/drivers/mfd/eio_core.c
new file mode 100644
index 000000000000..7a58c62595a5
--- /dev/null
+++ b/drivers/mfd/eio_core.c
@@ -0,0 +1,621 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Advantech Embedded Controller base Driver
+ *
+ * This driver provides an interface to access the EIO Series EC
+ * firmware via its own Power Management Channel (PMC) for subdrivers:
+ *
+ * A system may have one or two independent EIO devices.
+ *
+ * Copyright (C) 2025 Advantech Co., Ltd.
+ */
+
+#include <linux/delay.h>
+#include <linux/isa.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/sysfs.h>
+#include <linux/time.h>
+#include <linux/uaccess.h>
+#include <linux/version.h>
+#include <linux/mfd/eio.h>
+
+#define TIMEOUT_MAX (10 * USEC_PER_SEC)
+#define TIMEOUT_MIN 200
+#define SLEEP_MAX 200
+#define DEFAULT_TIMEOUT 5000
+
+/**
+ * Timeout: Default timeout in microseconds when a PMC command's
+ * timeout is unspecified. PMC command responses typically range
+ * from 200us to 2ms. 5ms is quite a safe value for timeout. In
+ * In some cases, responses are longer. In such situations, please
+ * adding the timeout parameter loading related sub-drivers or
+ * this core driver (not recommended).
+ */
+static uint timeout = DEFAULT_TIMEOUT;
+module_param(timeout, uint, 0444);
+MODULE_PARM_DESC(timeout, "Default PMC command timeout in usec.\n");
+
+struct eio_dev_port {
+	u16 idx_port;
+	u16 data_port;
+};
+
+static struct eio_dev_port pnp_port[] = {
+	{ .idx_port = EIO_PNP_INDEX, .data_port = EIO_PNP_DATA },
+	{ .idx_port = EIO_SUB_PNP_INDEX,
+	  .data_port = EIO_SUB_PNP_DATA },
+};
+
+static struct mfd_cell mfd_devs[] = {
+	{ .name = "eio_wdt" },
+	{ .name = "gpio_eio" },
+	{ .name = "eio_hwmon" },
+	{ .name = "i2c_eio" },
+	{ .name = "eio_thermal" },
+	{ .name = "eio_fan" },
+	{ .name = "eio_bl" },
+};
+
+static const struct regmap_range eio_range[] = {
+	regmap_reg_range(EIO_PNP_INDEX, EIO_PNP_DATA),
+	regmap_reg_range(EIO_SUB_PNP_INDEX, EIO_SUB_PNP_DATA),
+	regmap_reg_range(0x200, 0x3FF),
+};
+
+static const struct regmap_access_table volatile_regs = {
+	.yes_ranges = eio_range,
+	.n_yes_ranges = ARRAY_SIZE(eio_range),
+};
+
+static const struct regmap_config pnp_regmap_config = {
+	.name = "eio_core",
+	.reg_bits = 16,
+	.val_bits = 8,
+	.volatile_table = &volatile_regs,
+	.io_port = true,
+	.cache_type = REGCACHE_NONE,
+};
+
+static struct {
+	char name[32];
+	int cmd;
+	int ctrl;
+	int dev;
+	int size;
+	enum {
+		HEX,
+		NUMBER,
+		PNP_ID,
+	} type;
+
+} attrs[] = {
+	{ "board_name", 0x53, 0x10, 0, 16 },
+	{ "board_serial", 0x53, 0x1F, 0, 16 },
+	{ "board_manufacturer", 0x53, 0x11, 0, 16 },
+	{ "board_id", 0x53, 0x1E, 0, 4 },
+	{ "firmware_version", 0x53, 0x21, 0, 4 },
+	{ "firmware_name", 0x53, 0x22, 0, 16 },
+	{ "firmware_build", 0x53, 0x23, 0, 26 },
+	{ "firmware_date", 0x53, 0x24, 0, 16 },
+	{ "chip_id", 0x53, 0x12, 0, 12 },
+	{ "chip_detect", 0x53, 0x15, 0, 12 },
+	{ "platform_type", 0x53, 0x13, 0, 16 },
+	{ "platform_revision", 0x53, 0x04, 0x44, 4 },
+	{ "eapi_version", 0x53, 0x04, 0x64, 4 },
+	{ "eapi_id", 0x53, 0x31, 0, 4 },
+	{ "boot_count", 0x55, 0x10, 0, 4, NUMBER },
+	{ "powerup_hour", 0x55, 0x11, 0, 4, NUMBER },
+	{ "pnp_id", 0x53, 0x04, 0x68, 4, PNP_ID },
+};
+
+static ssize_t info_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	uint i;
+
+	for (i = 0; i < ARRAY_SIZE(attrs); i++) {
+		int ret;
+		char str[32] = "";
+		int val;
+
+		struct pmc_op op = {
+			.cmd = attrs[i].cmd,
+			.control = attrs[i].ctrl,
+			.device_id = attrs[i].dev,
+			.payload = (u8 *)str,
+			.size = attrs[i].size,
+		};
+
+		if (strcmp(attr->attr.name, attrs[i].name))
+			continue;
+
+		ret = eio_core_pmc_operation(dev, &op);
+		if (ret)
+			return ret;
+
+		if (attrs[i].size != 4)
+			return sprintf(buf, "%s\n", str);
+
+		val = *(u32 *)str;
+
+		if (attrs[i].type == HEX)
+			return sprintf(buf, "0x%08X\n", val);
+
+		if (attrs[i].type == NUMBER)
+			return sprintf(buf, "%d\n", val);
+
+		/* Should be pnp_id */
+		return sprintf(buf, "%c%c%c, %X\n", (val >> 14 & 0x3F) + 0x40,
+			       ((val >> 9 & 0x18) | (val >> 25 & 0x07)) + 0x40,
+			       (val >> 20 & 0x1F) + 0x40, val & 0xFFF);
+	}
+
+	return -EINVAL;
+}
+
+#define PMC_DEVICE_ATTR_RO(_name)                                             \
+	static ssize_t _name##_show(struct device *dev,                       \
+				    struct device_attribute *attr, char *buf) \
+	{                                                                     \
+		return info_show(dev, attr, buf);                             \
+	}                                                                     \
+	static DEVICE_ATTR_RO(_name)
+
+PMC_DEVICE_ATTR_RO(board_name);
+PMC_DEVICE_ATTR_RO(board_serial);
+PMC_DEVICE_ATTR_RO(board_manufacturer);
+PMC_DEVICE_ATTR_RO(firmware_name);
+PMC_DEVICE_ATTR_RO(firmware_version);
+PMC_DEVICE_ATTR_RO(firmware_build);
+PMC_DEVICE_ATTR_RO(firmware_date);
+PMC_DEVICE_ATTR_RO(chip_id);
+PMC_DEVICE_ATTR_RO(chip_detect);
+PMC_DEVICE_ATTR_RO(platform_type);
+PMC_DEVICE_ATTR_RO(platform_revision);
+PMC_DEVICE_ATTR_RO(board_id);
+PMC_DEVICE_ATTR_RO(eapi_version);
+PMC_DEVICE_ATTR_RO(eapi_id);
+PMC_DEVICE_ATTR_RO(boot_count);
+PMC_DEVICE_ATTR_RO(powerup_hour);
+PMC_DEVICE_ATTR_RO(pnp_id);
+
+static struct attribute *pmc_attrs[] = { &dev_attr_board_name.attr,
+					 &dev_attr_board_serial.attr,
+					 &dev_attr_board_manufacturer.attr,
+					 &dev_attr_firmware_name.attr,
+					 &dev_attr_firmware_version.attr,
+					 &dev_attr_firmware_build.attr,
+					 &dev_attr_firmware_date.attr,
+					 &dev_attr_chip_id.attr,
+					 &dev_attr_chip_detect.attr,
+					 &dev_attr_platform_type.attr,
+					 &dev_attr_platform_revision.attr,
+					 &dev_attr_board_id.attr,
+					 &dev_attr_eapi_version.attr,
+					 &dev_attr_eapi_id.attr,
+					 &dev_attr_boot_count.attr,
+					 &dev_attr_powerup_hour.attr,
+					 &dev_attr_pnp_id.attr,
+					 NULL };
+
+ATTRIBUTE_GROUPS(pmc);
+
+static unsigned int eio_pnp_read(struct device *dev,
+				 struct eio_dev_port *port, u8 idx)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	unsigned int val;
+
+	if (regmap_write(eio->map, port->idx_port, idx))
+		dev_err(dev, "Error port write 0x%X\n", port->idx_port);
+
+	if (regmap_read(eio->map, port->data_port, &val))
+		dev_err(dev, "Error port read 0x%X\n", port->data_port);
+
+	return val;
+}
+
+static void eio_pnp_write(struct device *dev, struct eio_dev_port *port,
+			  u8 idx, u8 data)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+
+	if (regmap_write(eio->map, port->idx_port, idx) ||
+	    regmap_write(eio->map, port->data_port, data))
+		dev_err(dev, "Error port write 0x%X %X\n", port->idx_port,
+			port->data_port);
+}
+
+static void eio_pnp_enter(struct device *dev, struct eio_dev_port *port)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	/* Write 0x87 to index port twice to unlock IO port */
+	if (regmap_write(eio->map, port->idx_port,
+			 EIO_EXT_MODE_ENTER) ||
+	    regmap_write(eio->map, port->idx_port, EIO_EXT_MODE_ENTER))
+		dev_err(dev, "Error port write 0x%X\n", port->idx_port);
+}
+
+static void eio_pnp_leave(struct device *dev, struct eio_dev_port *port)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	/* Write 0xAA to index port once to lock IO port */
+	if (regmap_write(eio->map, port->idx_port, EIO_EXT_MODE_EXIT))
+		dev_err(dev, "Error port write 0x%X\n", port->idx_port);
+}
+
+static int pmc_write_data(struct device *dev, int id, u8 value, u16 timeout)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	int ret;
+
+	if (WAIT_IBF(dev, id, timeout))
+		return -ETIME;
+
+	ret = regmap_write(eio->map, eio->pmc[id].data, value);
+	if (ret)
+		dev_err(dev, "Error PMC write %X:%X\n",
+			eio->pmc[id].data, value);
+
+	return ret;
+}
+
+static int pmc_write_cmd(struct device *dev, int id, u8 value, u16 timeout)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	int ret;
+
+	if (WAIT_IBF(dev, id, timeout))
+		return -ETIME;
+
+	ret = regmap_write(eio->map, eio->pmc[id].cmd, value);
+	if (ret)
+		dev_err(dev, "Error PMC write %X:%X\n",
+			eio->pmc[id].cmd, value);
+
+	return ret;
+}
+
+static int pmc_read_data(struct device *dev, int id, u8 *value, u16 timeout)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	unsigned int val;
+	int ret;
+
+	if (WAIT_OBF(dev, id, timeout))
+		return -ETIME;
+
+	ret = regmap_read(eio->map, eio->pmc[id].data, &val);
+	if (ret)
+		dev_err(dev, "Error PMC read %X\n", eio->pmc[id].data);
+	else
+		*value = (u8)(val & 0xFF);
+
+	return ret;
+}
+
+static int pmc_read_status(struct device *dev, int id)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	unsigned int val;
+
+	if (regmap_read(eio->map, eio->pmc[id].status, &val)) {
+		dev_err(dev, "Error PMC read %X\n",
+			eio->pmc[id].status);
+		return 0;
+	}
+
+	return val;
+}
+
+static void pmc_clear(struct device *dev, int id)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	unsigned int val;
+
+	/* Check if input buffer blocked */
+	if ((pmc_read_status(dev, id) & EIO_PMC_STATUS_IBF) == 0)
+		return;
+
+	/* Read out previous garbage */
+	if (regmap_read(eio->map, eio->pmc[id].data, &val))
+		dev_err(dev, "Error pmc clear\n");
+
+	usleep_range(10, 100);
+}
+
+int eio_core_pmc_wait(struct device *dev, int id,
+		      enum eio_pmc_wait wait, uint max_duration)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	uint val;
+	int new_timeout = max_duration ? max_duration : timeout;
+
+	if (new_timeout < TIMEOUT_MIN || new_timeout > TIMEOUT_MAX) {
+		dev_err(dev,
+			"Error timeout value: %dus. Timeout value should between %d and %ld\n",
+			new_timeout, TIMEOUT_MIN, TIMEOUT_MAX);
+		return -ETIME;
+	}
+
+	if (wait == PMC_WAIT_INPUT)
+		return regmap_read_poll_timeout(eio->map, eio->pmc[id].status,
+						val, (val & EIO_PMC_STATUS_IBF) == 0,
+						SLEEP_MAX, new_timeout);
+	return regmap_read_poll_timeout(eio->map,
+					eio->pmc[id].status, val,
+					(val & EIO_PMC_STATUS_OBF) != 0,
+					SLEEP_MAX, new_timeout);
+}
+EXPORT_SYMBOL_GPL(eio_core_pmc_wait);
+
+int eio_core_pmc_operation(struct device *dev, struct pmc_op *op)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	u8 i;
+	int ret;
+	bool read_cmd = op->cmd & EIO_FLAG_PMC_READ;
+	ktime_t t = ktime_get();
+
+	mutex_lock(&eio->mutex);
+
+	pmc_clear(dev, op->chip);
+
+	ret = pmc_write_cmd(dev, op->chip, op->cmd, op->timeout);
+	if (ret)
+		goto err;
+
+	ret = pmc_write_data(dev, op->chip, op->control, op->timeout);
+	if (ret)
+		goto err;
+
+	ret = pmc_write_data(dev, op->chip, op->device_id, op->timeout);
+	if (ret)
+		goto err;
+
+	ret = pmc_write_data(dev, op->chip, op->size, op->timeout);
+	if (ret)
+		goto err;
+
+	for (i = 0; i < op->size; i++) {
+		if (read_cmd)
+			ret = pmc_read_data(dev, op->chip, &op->payload[i],
+					    op->timeout);
+		else
+			ret = pmc_write_data(dev, op->chip, op->payload[i],
+					     op->timeout);
+
+		if (ret)
+			goto err;
+	}
+
+	mutex_unlock(&eio->mutex);
+
+	return 0;
+
+err:
+	mutex_unlock(&eio->mutex);
+
+	dev_err(dev, "PMC error duration:%lldus",
+		ktime_to_us(ktime_sub(ktime_get(), t)));
+	dev_err(dev,
+		".cmd=0x%02X, .ctrl=0x%02X .id=0x%02X, .size=0x%02X .data=0x%02X%02X",
+		op->cmd, op->control, op->device_id, op->size, op->payload[0],
+		op->payload[1]);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(eio_core_pmc_operation);
+
+static int get_pmc_port(struct device *dev, int id,
+			struct eio_dev_port *port)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	struct _pmc_port *pmc = &eio->pmc[id];
+
+	eio_pnp_enter(dev, port);
+
+	/* Switch to PMC device page */
+	eio_pnp_write(dev, port, EIO_LDN, EIO_LDN_PMC1);
+
+	/* Active this device */
+	eio_pnp_write(dev, port, EIO_LDAR, EIO_LDAR_LDACT);
+
+	/* Get PMC cmd and data port */
+	pmc->data = eio_pnp_read(dev, port, EIO_IOBA0H) << 8;
+	pmc->data |= eio_pnp_read(dev, port, EIO_IOBA0L);
+	pmc->cmd = eio_pnp_read(dev, port, EIO_IOBA1H) << 8;
+	pmc->cmd |= eio_pnp_read(dev, port, EIO_IOBA1L);
+
+	/* Disable IRQ */
+	eio_pnp_write(dev, port, EIO_IRQCTRL, 0);
+
+	eio_pnp_leave(dev, port);
+
+	/* Make sure IO ports are not occupied */
+	if (!devm_request_region(dev, pmc->data, 2, KBUILD_MODNAME)) {
+		dev_err(dev, "Request region %X error\n", pmc->data);
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+static int eio_init(struct device *dev)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	u16 chip_id = 0;
+	u8 tmp = 0;
+	int chip = 0;
+	int ret = -ENOMEM;
+
+	for (chip = 0; chip < ARRAY_SIZE(pnp_port); chip++) {
+		struct eio_dev_port *port = pnp_port + chip;
+
+		if (!devm_request_region(dev, pnp_port[chip].idx_port,
+					 pnp_port[chip].data_port -
+						 pnp_port[chip].idx_port,
+					 KBUILD_MODNAME))
+			continue;
+
+		eio_pnp_enter(dev, port);
+
+		chip_id = eio_pnp_read(dev, port, EIO_CHIPID1) << 8;
+		chip_id |= eio_pnp_read(dev, port, EIO_CHIPID2);
+
+		if (chip_id != EIO200_CHIPID && chip_id != EIO201_211_CHIPID)
+			continue;
+
+		/* Turn on the enable flag */
+		tmp = eio_pnp_read(dev, port, EIO_SIOCTRL);
+		tmp |= EIO_SIOCTRL_SIOEN;
+
+		eio_pnp_write(dev, port, EIO_SIOCTRL, tmp);
+
+		eio_pnp_leave(dev, port);
+
+		ret = get_pmc_port(dev, chip, port);
+		if (ret)
+			return ret;
+
+		if (chip == 0)
+			eio->flag |= EIO_F_CHIP_EXIST;
+		else
+			eio->flag |= EIO_F_SUB_CHIP_EXIST;
+	}
+
+	return ret;
+}
+
+static uint8_t acpiram_access(struct device *dev, uint8_t offset)
+{
+	u8 val;
+	int ret;
+	int timeout = 0;
+	struct eio_dev *eio = dev_get_drvdata(dev);
+
+	/* We only store information on primary EC */
+	int chip = 0;
+
+	mutex_lock(&eio->mutex);
+
+	pmc_clear(dev, chip);
+
+	ret = pmc_write_cmd(dev, chip, EIO_PMC_CMD_ACPIRAM_READ, timeout);
+	if (ret)
+		goto err;
+
+	ret = pmc_write_data(dev, chip, offset, timeout);
+	if (ret)
+		goto err;
+
+	ret = pmc_write_data(dev, chip, sizeof(val), timeout);
+	if (ret)
+		goto err;
+
+	ret = pmc_read_data(dev, chip, &val, timeout);
+	if (ret)
+		goto err;
+
+err:
+	mutex_unlock(&eio->mutex);
+	return ret ? 0 : val;
+}
+
+static int firmware_code_base(struct device *dev)
+{
+	struct eio_dev *eio = dev_get_drvdata(dev);
+	u8 ic_vendor, ic_code, code_base;
+
+	ic_vendor = acpiram_access(dev, EIO_ACPIRAM_ICVENDOR);
+	ic_code = acpiram_access(dev, EIO_ACPIRAM_ICCODE);
+	code_base = acpiram_access(dev, EIO_ACPIRAM_CODEBASE);
+
+	if (ic_vendor != 'R')
+		return -ENODEV;
+
+	if (ic_code != EIO200_ICCODE && ic_code != EIO201_ICCODE &&
+	    ic_code != EIO211_ICCODE)
+		goto err;
+
+	if (code_base == EIO_ACPIRAM_CODEBASE_NEW) {
+		eio->flag |= EIO_F_NEW_CODE_BASE;
+		return 0;
+	}
+
+	if (code_base == 0 &&
+	    (ic_code != EIO201_ICCODE && ic_code != EIO211_ICCODE)) {
+		dev_info(dev, "Old code base not supported, yet.");
+		return -ENODEV;
+	}
+
+err:
+	/* Codebase error. This should only happen on firmware error. */
+	dev_err(dev,
+		"Codebase check fail: vendor: 0x%X, code: 0x%X, base: 0x%X\n",
+		ic_vendor, ic_code, code_base);
+	return -ENODEV;
+}
+
+static int eio_probe(struct device *dev, unsigned int id)
+{
+	int ret = 0;
+	struct eio_dev *eio;
+
+	eio = devm_kzalloc(dev, sizeof(*eio), GFP_KERNEL);
+	if (!eio)
+		return -ENOMEM;
+
+	eio->dev = dev;
+	mutex_init(&eio->mutex);
+
+	eio->iomem = devm_ioport_map(dev, 0, EIO_SUB_PNP_DATA + 1);
+	if (IS_ERR(eio->iomem))
+		return PTR_ERR(eio->iomem);
+
+	eio->map = devm_regmap_init_mmio(dev, eio->iomem, &pnp_regmap_config);
+	if (IS_ERR(eio->map))
+		return PTR_ERR(eio->map);
+
+	/* publish instance for subdrivers (dev_get_drvdata(dev->parent)) */
+	dev_set_drvdata(dev, eio);
+
+	if (eio_init(dev)) {
+		dev_dbg(dev, "No device found\n");
+		return -ENODEV;
+	}
+
+	ret = firmware_code_base(dev);
+	if (ret) {
+		dev_err(dev, "Chip code base check fail\n");
+		return ret; /* keep helper's return (e.g., -EIO) */
+	}
+
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
+				   mfd_devs, ARRAY_SIZE(mfd_devs),
+				   NULL, 0, NULL);
+	if (ret)
+		dev_err(dev, "Cannot register child devices (error = %d)\n", ret);
+
+	dev_dbg(dev, "Module insert completed\n");
+	return 0;
+}
+
+static struct isa_driver eio_driver = {
+	.probe    = eio_probe,
+
+	.driver = {
+		.name = "eio_core",
+		.dev_groups = pmc_groups,
+	},
+};
+module_isa_driver(eio_driver, 1);
+
+MODULE_AUTHOR("Wenkai Chung <wenkai.chung@advantech.com.tw>");
+MODULE_AUTHOR("Ramiro Oliveira <ramiro.oliveira@advantech.com>");
+MODULE_DESCRIPTION("Advantech EIO series EC core driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/eio.h b/include/linux/mfd/eio.h
new file mode 100644
index 000000000000..b87614274201
--- /dev/null
+++ b/include/linux/mfd/eio.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Header for the Advantech EIO core driver and its sub-drivers
+ *
+ * Copyright (C) 2025 Advantech Co., Ltd.
+ */
+
+#ifndef _MFD_EIO_H_
+#define _MFD_EIO_H_
+#include <linux/io.h>
+#include <linux/regmap.h>
+
+/* Definition */
+#define EIO_CHIPID1		0x20
+#define EIO_CHIPID2		0x21
+#define EIO_CHIPVER		0x22
+#define EIO_SIOCTRL		0x23
+#define EIO_SIOCTRL_SIOEN	BIT(0)
+#define EIO_SIOCTRL_SWRST	BIT(1)
+#define EIO_IRQCTRL		0x70
+#define EIO200_CHIPID		0x9610
+#define EIO201_211_CHIPID	0x9620
+#define EIO200_ICCODE		0x10
+#define EIO201_ICCODE		0x20
+#define EIO211_ICCODE		0x21
+
+/* LPC PNP */
+#define EIO_PNP_INDEX		0x299
+#define EIO_PNP_DATA		0x29A
+#define EIO_SUB_PNP_INDEX	0x499
+#define EIO_SUB_PNP_DATA	0x49A
+#define EIO_EXT_MODE_ENTER	0x87
+#define EIO_EXT_MODE_EXIT	0xAA
+
+/* LPC LDN */
+#define EIO_LDN			0x07
+#define EIO_LDN_PMC0		0x0C
+#define EIO_LDN_PMC1		0x0D
+
+/* PMC registers */
+#define EIO_PMC_STATUS_IBF	BIT(1)
+#define EIO_PMC_STATUS_OBF	BIT(0)
+#define EIO_LDAR		0x30
+#define EIO_LDAR_LDACT		BIT(0)
+#define EIO_IOBA0H		0x60
+#define EIO_IOBA0L		0x61
+#define EIO_IOBA1H		0x62
+#define EIO_IOBA1L		0x63
+#define EIO_FLAG_PMC_READ	BIT(0)
+
+/* PMC command list */
+#define EIO_PMC_CMD_ACPIRAM_READ	0x31
+#define EIO_PMC_CMD_CFG_SAVE		0x56
+
+/* OLD PMC */
+#define EIO_PMC_NO_INDEX	0xFF
+
+/* ACPI RAM Address Table */
+#define EIO_ACPIRAM_VERSIONSECTION	(0xFA)
+#define EIO_ACPIRAM_ICVENDOR		(EIO_ACPIRAM_VERSIONSECTION + 0x00)
+#define EIO_ACPIRAM_ICCODE		(EIO_ACPIRAM_VERSIONSECTION + 0x01)
+#define EIO_ACPIRAM_CODEBASE		(EIO_ACPIRAM_VERSIONSECTION + 0x02)
+
+#define EIO_ACPIRAM_CODEBASE_NEW	BIT(7)
+
+/* Firmware */
+#define EIO_F_SUB_NEW_CODE_BASE	BIT(6)
+#define EIO_F_SUB_CHANGED	BIT(7)
+#define EIO_F_NEW_CODE_BASE	BIT(8)
+#define EIO_F_CHANGED		BIT(9)
+#define EIO_F_SUB_CHIP_EXIST	BIT(30)
+#define EIO_F_CHIP_EXIST	BIT(31)
+
+/* Others */
+#define EIO_EC_NUM	2
+
+struct _pmc_port {
+	union {
+		u16 cmd;
+		u16 status;
+	};
+	u16 data;
+};
+
+struct pmc_op {
+	u8  cmd;
+	u8  control;
+	u8  device_id;
+	u8  size;
+	u8  *payload;
+	u8  chip;
+	u16 timeout;
+};
+
+enum eio_rw_operation {
+	OPERATION_READ,
+	OPERATION_WRITE,
+};
+
+struct eio_dev {
+	struct device *dev;
+	struct regmap *map;
+	void __iomem  *iomem;
+	struct mutex mutex; /* Protects PMC command access */
+	struct _pmc_port pmc[EIO_EC_NUM];
+	u32 flag;
+};
+
+int eio_core_pmc_operation(struct device *dev, struct pmc_op *operation);
+
+enum eio_pmc_wait {
+	PMC_WAIT_INPUT,
+	PMC_WAIT_OUTPUT,
+};
+
+int eio_core_pmc_wait(struct device *dev, int id, enum eio_pmc_wait wait,
+		      uint timeout);
+
+#define WAIT_IBF(dev, id, timeout)	eio_core_pmc_wait(dev, id, PMC_WAIT_INPUT, timeout)
+#define WAIT_OBF(dev, id, timeout)	eio_core_pmc_wait(dev, id, PMC_WAIT_OUTPUT, timeout)
+
+#ifdef pr_fmt
+#undef pr_fmt
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+#endif
+
+#endif

-- 
2.43.0


