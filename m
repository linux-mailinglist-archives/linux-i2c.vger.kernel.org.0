Return-Path: <linux-i2c+bounces-3434-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 034678BCDDD
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 14:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CE0DB25712
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 12:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6DA145359;
	Mon,  6 May 2024 12:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="kBn+oMNs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2134.outbound.protection.outlook.com [40.107.22.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69689144D2E;
	Mon,  6 May 2024 12:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714998274; cv=fail; b=RyA3ZD0nDsBuXWqt2qLEBS/WD/taRqPVYQhCXvAszsHUWupsRoodum6HU8l7l4Ea1DInHeKLZ9X4Z8RXSTxgK8mu/xiR3PK1VxB1Cz6tRTEQwMehbL5IwAugSrAQ7KQeweImIQdwKV2eX9geEuMS2PnO8btfCkm/bf++P3J5WTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714998274; c=relaxed/simple;
	bh=bu3/kFk/5u3incaJRPSakwvL8ETOXOCGjkcyxwm4Kzc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PLKWuS/EetjrCwvyN6m6leCtpVc47TqQsX8Moq1zGPxJmH95vRXl4qNjFSst6GZliz3CPgYv1+bqYKZpk1lIWEd8cy2b6pktEcy/lUVVyNfp66bi8MRXbyqHaDUfpECGE4WfiqGUfGtqsQOPR2oDhzmmQWaDhaYcFBtBieq2WNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=kBn+oMNs; arc=fail smtp.client-ip=40.107.22.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/5uePzD5XCbuUCrjpYCO/ewaiEAnU6z8m4Y/gE8hVOsomKStvPWhJZGcyRxk6dgjiDcl2MZT1ee3zG5tJz1VVAHxo6htw2BELyVrQWrylctp8MHPbfCRoJP5JhDB+eaUPv14WJF5oiTO7VJw5Qlk7AuYaOrBZN76NXs1+Xlaw2xoICRtqKCJkI6CVGLQKSIVL1HyOmHq07/DRZsep97oRmvO4sJLqfdD/jMAmeK/3bPQYqZCP9/zPxKwYTAcsnlmVh6LlWykAZ0R/pteCCKvHJgahdEmxqPO+H8SO8IZoUqP5aLFrNaUTmQThOiccNEUOVKu4gKmhjOMvjdIUmQmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PY3q5GBvcYpL+wae89VuyYkBsPvdoQ/tP1PV/CHqZ4=;
 b=dgameYgwcULaHwvptyA7knGEdtFwnWPbYkrXKT/3aCch/aTpdCArPOgRgmgfCh6jryAa426VwR7IRw1p32l+qlwn3FXV2Rnh6lTlk7LLtmEcdUojO2UTS0oqg10+/5MzEia/P0lUKSpp3VWBtBldjV7c8i59lY3iNXJzmfMXWEuB4+dRoodpRfkNnafd9Jna8XaZdQ09Kb5xh9n/zRYjMdjh8VTnwA7GG7UH7yKbzarZkq7HYuhmxyL5HZuB5BQf7alzv6/c7/nkXK0rqytiM7sjTFzAUw9vCUIzh+u7/WGuAstydUD8qqK+hh0+Oqfm+qY4OjRb1AYdD3kGD6VVvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PY3q5GBvcYpL+wae89VuyYkBsPvdoQ/tP1PV/CHqZ4=;
 b=kBn+oMNs65S9oSwAoRWft/hoqdjXf/mCcHHgHNjYnozSm0+iWB2gn2q0srWh1+j5lsi9MLmKoHvfj5ZbRLxPcqS5GC0Kgsp/BOIECCrm6h+yij1gvD0HVnASSDIaG5iJb4LwUwtCiruJ6TUfNSvJPiKXgKNWqxn7o+6Tunx+D+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by AS8PR04MB9512.eurprd04.prod.outlook.com (2603:10a6:20b:40f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 12:24:22 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936%4]) with mapi id 15.20.7544.029; Mon, 6 May 2024
 12:24:22 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 06 May 2024 13:37:58 +0200
Subject: [PATCH v2 7/7] arm64: dts: rockchip: add mule i2c mux (0x18) on
 rk3588-jaguar
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-dev-mule-i2c-mux-v2-7-a91c954f65d7@cherry.de>
References: <20240506-dev-mule-i2c-mux-v2-0-a91c954f65d7@cherry.de>
In-Reply-To: <20240506-dev-mule-i2c-mux-v2-0-a91c954f65d7@cherry.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Heiko Stuebner <heiko@sntech.de>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.13.0
X-ClientProxiedBy: VI1PR0102CA0103.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::44) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|AS8PR04MB9512:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f023787-ea0f-4ee5-8160-08dc6dc77292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|1800799015|52116005|376005|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTdlWjBWZWttb0lRSmd3dUlXb3NlM0tCdFVLMG5Ld1pRb2p5OU1hOGZqMjdj?=
 =?utf-8?B?eXE4cUI2UnBjV3NHS2FTcE5kRmttaGc5a3U1MmJZNmRFSkdCcldvVHdER2NJ?=
 =?utf-8?B?c3o1d0c4bjJaY1l2N051VGhSOVg5VEhIV2tRcUIybEpCZEdxMFVMaDkxcy9v?=
 =?utf-8?B?N2NneUwzZHB6T2k0OVA1WGVNNlcwTkFYMU04STBtUVJPR00zQlVHbnFuS0pL?=
 =?utf-8?B?SXRVZ3Vpa3FMR2h6V3VmdDNaTEhFNk1PWTRveGJaNjhUQlh6MkFRT21GNGN1?=
 =?utf-8?B?K3VSNE00ZGk5ODZJeHBYVkcrSi9QcVMvemkySWlBR1lmNkRsYkZwQ3pWVG1Z?=
 =?utf-8?B?UTFwbUozRVprdE00Nng5K0RxSTZyS1BGejU5Ri9VMGNDeFNjVld4ZWhiUjI0?=
 =?utf-8?B?NDBLbWRkZytvaE1RSVhGWmhRbU9iV0NVVEQ3U2t0L01TQ3pSa3d5NmJ4Z2t5?=
 =?utf-8?B?RDFLczR5RUlORU9xMVBibENYTTU5c2hkS3hZVnEvaVNTc2M4a0lLOVVaT1lu?=
 =?utf-8?B?eGRpUWlmRUMwTHN5dnZFeDFQK2cvNG9UOVZqbDRYOU10aStJVDI2ZEdRYzA2?=
 =?utf-8?B?eHZtZGFNYnBvalBPenNkVjRzWkNwV2RnOEk1b0h4Mm9TdWE5SWNGdlYxM1Ax?=
 =?utf-8?B?SWYzYkZBemV5WElzbHJaVUcrdE1qclg4cU9LSFZleU9PbVZDWnJUemhYRU9J?=
 =?utf-8?B?UWIwSXpFTU5DaHVsa201OEhQRVRJcWZHZzRpeVpJZHZsdUI2TGk0YnFtN3dX?=
 =?utf-8?B?WVMxdzJvdXpkZ0dCQk5PdTVXK0tnMTAzTEFiRFZ1U2ZnWU84VFRtMTY2aGVk?=
 =?utf-8?B?Y0xKM0lGclc3alEvWmlBclROS09yWFhQVmFCSURjQ2FVbmdjNkU3WisyVnhG?=
 =?utf-8?B?bi9VM2JVanV3K0hocHlkYlhVR0JaeEgvNGxCR1d5MXVjL21YSUJPWnJVV0xp?=
 =?utf-8?B?SFQyNERWcFA3ZlQ0alYvVjY3bGY2OW1vUTRyTW9QQ1N5UkxiNW8zcEtEdzRB?=
 =?utf-8?B?QVN4R3pEQncrYUNxMVI4ZE0xWXArcEU3ZU1JYnY0WDQ0WU5pOXdNa25ySzl0?=
 =?utf-8?B?amZXUjhHT1ZzR1BkM05JeGh1RVFTTUJXbjEwZ3BtLzdEbThYS3AyUU1wTWxs?=
 =?utf-8?B?UmxxRHhqcEJSMlp3bEloQnJHZitrR2p0NisvT0hNVW9FTlAzTEZKQmU5dDB2?=
 =?utf-8?B?b2I3U2VrZVBKV2Q0TXRwMU52MXIxSUVMQUF1ek1xL1VQcTh5NmZNdDU4ZzFP?=
 =?utf-8?B?T0x5MzNsdWtqVHRTSm8wOFN0RG5OQjEzM2FJMkkzbEdaU1NrYlRJUUYvY0Iw?=
 =?utf-8?B?OGU3Qm9lZFBBTWpDcGRNaEpHL3IvZk5rT2tlWFNvUWk3c2s4ZFFVYzNCSEtm?=
 =?utf-8?B?eWRRRUVWTEJQL1BJWmZVRi9mUkQ1NXhEUWZLdFUxOC9uTWxJVDBSR3A4SjJ4?=
 =?utf-8?B?akNENVRKcGxtbkNyRHVrSXBUZVpOSmJUamp3Q3k4Nno4c3B2Rk9hcTFNSk14?=
 =?utf-8?B?SjFQa2x3aXROMi9ZMVpjRXhLT2Y3NnQyWE1Ma3ByU1BSVURINTFIUy9sVjRV?=
 =?utf-8?B?WkMxZXFGUEdMVnNtdUdiUHFKQnlxYlZJdU5hYnQ3ZEFHQjI0UGpiaFgvSnpD?=
 =?utf-8?B?OFRlYXk2SEZZbzNZUFBUVmV0RENiQzNvYzUweEJ5cXpYcmNISUFMaXNXN3ox?=
 =?utf-8?B?WHNiM0Njdi9RYjJSNlpuenJNYmNoNHhtNVFmSDdNN3VINVlNNkduL1VpbUFl?=
 =?utf-8?B?YkJ4Nm9kNzhVbWlXNGFFTkc4VUxvYm1BVjYyNWQ1WDJXRjZlZERUeUVJQUxP?=
 =?utf-8?Q?kslkiUXzFmB/pY9t63zZ/kNOooekSqh1lcsKk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(52116005)(376005)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHcwaFBQN0tWZ0RQWHphZUduZ3JEeE1LQlZRYWdiSW9oYnFoK2c4a2tGTlg4?=
 =?utf-8?B?SkxwRTRFTDhhOFpVMG5SWWE4clBuei91K0M4ZTdPVTdKZTV2ZkRiSG9abDVt?=
 =?utf-8?B?TW40Y2JWMGoyZ3FPTzROc2pHc1FGdXQwczNkSVRONHpkNld2ZTBCZ0Z4VzFL?=
 =?utf-8?B?QUNMc3BMYVVHdDh0VUxVNnpvbDlONU5xWEdXTjdrREdpa1RsUERFNmx1eEt1?=
 =?utf-8?B?UHNlM2NZR2JlV3lxMjZxeURqMkNBZnNhdEgvZFNvZ1QvY0V5anRWVGFSeWE1?=
 =?utf-8?B?d3NYUm8ramxkM2RJdUh6MVJXSElBZXlqeE9KbXZkM05uYnEwWmhIY3M5RG8x?=
 =?utf-8?B?b1JVWVA1SU4vbnVwc2FrdENrNVcvdDlLOFBMZ041NnA0YjJOMGIxc0pxWlUz?=
 =?utf-8?B?UG1TQ21kREpBOW9QTUZGR2wvZ1hmV1dWcXZ3SmNIN01JRGZxZHBETDRQSDRq?=
 =?utf-8?B?TVBNbXVrdExyQ0tLYXpWTmZLS2R5ZE1yZ0xiWVdqd2p6Q2hoUXJiNTdqaXR2?=
 =?utf-8?B?cUxVc2J0em9pU3pac1lPNnAzTGpvb3dyUGtWendNKzBWWkVoblh1V3ZJZXZK?=
 =?utf-8?B?bnd2U3IzcUIwSmk5R1ltYTZWSkhvT0duMlZlSzhacUZPbktSTjlVSG4wZmpv?=
 =?utf-8?B?alF4eHlwRlBTWXNta0Y0UFhWa3JkRXRWWVFFWGdsby83MkpzMW9LMk1oYTZh?=
 =?utf-8?B?NktQS2J2R2VkTWtkKzJzUWF4QkorM2xvWFhlMnBKSVhGMWkwUHFPZ3hTdmFY?=
 =?utf-8?B?Q1BjUVJYVmNiTWtPRTltelFITVBDQm5kRUtDZEtQemo3NjF6bndsOTUxRlVU?=
 =?utf-8?B?N0ZFUDZYS2dzMWNBb3hIdldnQTVlOHowa3k3Qmo0RXRGMGdmQU0yRDVLSkx1?=
 =?utf-8?B?V1N3MFd4Qlg1YjhGdzhUdkp6VG1QanlVRHNFaEVhQVlGclY2UFN1QktqOW5U?=
 =?utf-8?B?VDNaYUtJZko4dHViSUVTMHRBS3NZUE9wWkRyKzZLdWlzN2c5emlXVHV4MVZv?=
 =?utf-8?B?bzFqaVA5RDkzcG9TZlgySjlUY0J0dlQvOS9HR0RTU3lIQXZBWXRZUHk5SUho?=
 =?utf-8?B?UGNBa0VOVVIrR3dwcWlLcGMwdmgvWlFJUXkvM2tPWUVtVUpjRDFSUWZiWlNx?=
 =?utf-8?B?cGlFdVZCbTdFSVpCWVRQYU5yWEwzaklWNlBhQ1lkTHVJWFplaFcrK2NndSt5?=
 =?utf-8?B?OUkyS0RwaGNyRDBSN2Mza2NSTTVodmlhNlNpZGp5N0hwakxuNk4vaFRrd0wr?=
 =?utf-8?B?Z1QzTFhXMU9EU2d2ekpaRWtxaEtpbXpLWlMydjR2TWlTOGJRNlZWOVYwdmUx?=
 =?utf-8?B?b0RTdERVRE5OVXlaSnl6UTZJSXcwYjluR1NqbFJ2K1RpUzEyeDdJdFNzT3BF?=
 =?utf-8?B?Ny9SY1R5dmVoUGtHbHcvUFBRRk9hQWlRTlhvTml2RmhPZ1Mza0VHRGEvaUts?=
 =?utf-8?B?T3gxQUxja3AzTnpNdjg1UWJPdlU1WjRQanliZllEcEFydmgwNkVDWnpHOEVo?=
 =?utf-8?B?ZnNQV1l5V1FBV0dCRDlmNXJPWUM0dnROZlowQmJYVjNZQWZWMzB1L1Q4aVlk?=
 =?utf-8?B?VGY2Z2VENEIxd2MzejRNNElxakdDSjJMdlczdkg4UmpOeVFDTkxqUHlDU0or?=
 =?utf-8?B?ZjMxRHQvb3lLQjhORXo4NG05MUlMTVFGNUNIRFgwcEFkdDVOOGYyZmJRWk5P?=
 =?utf-8?B?YTBBdjdXMGpQYmdRKzNrWE1OV0FCbkZ4VzBzN2JpK1hCZkRVZXNUbHQ5dm9S?=
 =?utf-8?B?aGphRXc2WTBhWXJKM1paV3BMQ0hMVUp4Q3U5VXJOd0draUdPdHVrZmgzZ3BU?=
 =?utf-8?B?SkliekVad0xWb0Q1cFN2VzljN0hGMDk5OVUxRWVqMkI5WGdKdXgrTm5UeEY0?=
 =?utf-8?B?ay9BSk5ZK1lIbm5KdUwwNjcrZVlnWVBrYk1WTGdpeEJQeXIxNjJuVVRuTU55?=
 =?utf-8?B?VCtlK3dCYU9vSzhFdFd1Wm45bEQ2MVVCU3lYYmhpS3BYMm1xSngxS3lRSjlD?=
 =?utf-8?B?alBFNTk2THNLWFZDdk1ldGp5eEM1VzBWNHR1aCtDc2hpQ04zeU85K0R1Qjds?=
 =?utf-8?B?ZlNydHFLMy8wcDFSTEZleGd4RVd4eXN5VW5pcnVySGJUa2VJc2xhZS9ORWxG?=
 =?utf-8?B?Q01PTUVOMW90MW43d3N4dFJTV1l3ck8vdUxHYXptWERtTEd2T2JUSVhQdmtx?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f023787-ea0f-4ee5-8160-08dc6dc77292
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 12:24:16.8812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UkAiFB5Cv2qFvSxvLJrf0UZRBWWXbkyfIcRjtP3Bwzny/59ZeTRymCWn5oVafHtaiOABCwFWtbrzCGTEo5VYrla6ankU17yx3zjsVXClZaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9512

Mule emulates an i2c mux (address 0x18). The amc6821 is exposed behind
this bus.

Add the mux node and amc6821 as a default device.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 39d65002add1..14f1322c162f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -32,6 +32,7 @@ button-bios-disable {
 
 	aliases {
 		ethernet0 = &gmac0;
+		i2c10 = &i2c10;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
 		rtc0 = &rtc_twi;
@@ -249,9 +250,23 @@ &i2c0 {
 	pinctrl-0 = <&i2c0m2_xfer>;
 	status = "okay";
 
-	fan@18 {
-		compatible = "ti,amc6821";
+	i2c-mux@18 {
+		compatible = "tsd,mule-i2c-mux";
 		reg = <0x18>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c10: i2c@0 {
+			reg = <0x0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fan: fan@18 {
+				compatible = "ti,amc6821";
+				reg = <0x18>;
+				#cooling-cells = <2>;
+			};
+		};
 	};
 
 	vdd_npu_s0: regulator@42 {

-- 
2.34.1


