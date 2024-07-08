Return-Path: <linux-i2c+bounces-4759-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC76092A6F8
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 18:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E202288806
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 16:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4962D146D45;
	Mon,  8 Jul 2024 16:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="kI0WcmLv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2114.outbound.protection.outlook.com [40.107.20.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CE81459FF;
	Mon,  8 Jul 2024 16:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720455201; cv=fail; b=K4uyJ4YskBXPCUCTg2cWzSRO2YrZYke8bSkGueWk/02wu/eZEZFuYXqG11aNgAYDBNI4L/0IFSrJh55vcIt2g/dqLDvyC/CGd05EhARsk/YnsHY8zBn71IDiRgqD9+TAjug3De3poLnT1DlFGJZveX4Cteb1L62SYi/5JSs344Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720455201; c=relaxed/simple;
	bh=pDOlK6ZlJt/wKJywor9A9G6tYzPtG83l+90VcQ5Sd30=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=DQHvtGwT5d53CQ7eEXNFcsSUSqvEWVabQDh0uNWoJrGDtOjUhHIVmOADGoPqz5LptXFFIC2A4dwzvpuHM3zUvmYhViSbUR4yHtgF9r+bB4bsU+BiMXPf18iMB1nEnMQdQUG84dLGKxYWEH5UL0tuSIoLdRpv9Z+x2jfMeiBzjps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=kI0WcmLv; arc=fail smtp.client-ip=40.107.20.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0rr96R/97a0JFlTbPJRx3cikLY/HZaP8Z8eaxBM+CwrXcHmfMykeCF4RYEvkgVQ0eVduYmTdePYL7jjZg5VBgft5loNOZmD6m2yVuKcXqjKBCaYU60Q8uTTg9e854sgFD4aT7uAtjRA/OauK/sfNqlSHdG00sk2zWy/g8nZNSJ9Y7zetSXO5xh8VlMgBwqZWMHEB5lhWyIicEAEDSRGNszBHtuiEjvmeep3TyzVFLz9XeRFoEL4PsoIlfRVA0uPEzl1Q9lWoAScNepyAVfnetmGSibrkDMGxRezQeJA+CyynSydSaqvNE2xZ8lYgpCGoBPhx64lvEuZVmy/3ALfNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8wJt5ooRgCAnJkw27gNVxp3m2yPaEmfnuBTLMaQXGo=;
 b=LM9H/SsyVeVea2axWdQugHhz6dZoRWmQvHtwDfWAVm7mAooB0YReLbZMIhIIAVDe4SM7BDmJBe/f3x6avtMqiZF6ngePM0UbNYEmGyDe+5xh6RQWX9TixIM5ndkQM8nGcdkhfn4M5aZkvVQ27aYeOxhsiQtVjvg83p8I8xRqI/K01981849P8pyduXOur48sAzvQDFHPv5uPyEoXsIm4Winr//eJSwA6Xa53F7PyXelluh9Ody2xAtx3p4H97SuHs01tepqj+8QimD6D8SQuXR527/0HyhsIbJmEZu0EEimmcpQ+k2TTIgRnlu+VWlOWBXO70pvyEElLIKewucnxrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8wJt5ooRgCAnJkw27gNVxp3m2yPaEmfnuBTLMaQXGo=;
 b=kI0WcmLvU4wo/XW8uoefzn4qCUFMVODtNu/eEo13H6WUWel2AUXrG2u+RpfR856H7AQE93lrcFxGnPmOOSI0N7FX8gv+zlMI0jz1mooH+M+mLw7BRP2hGN6UrFD0COC7pG9gN2itCNYX9Lt9QriIKvTv83kIr38LNSYxsbTlL7E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by GV1PR04MB9055.eurprd04.prod.outlook.com (2603:10a6:150:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 16:13:09 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 16:13:09 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Subject: [PATCH v5 0/8] Add tsd,mule-i2c-mux support
Date: Mon, 08 Jul 2024 18:12:11 +0200
Message-Id: <20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANsPjGYC/23OwQrCMAwG4FeRnq2k2Vo3T76HeKht6grOSjuLQ
 /budiooKLnkD+RL7ixR9JTYZnFnkbJPPpxLkMsFM50+H4l7WzJDwBpKcUuZ99dTmaMpzY23Aip
 jCdaAgpW1SyTnb09yty+582kIcXxeyGKevjFUv1gWHDjUUtcNOuXcYTt0FA4x9JqnMQ3Up5UJP
 ZvhjB9Mwj8MC6ZbYVpZOyXtems6inFcWXoB1QdQQvwBqvmbxqLS2BCA+AamaXoAvY8uMT4BAAA
 =
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.0
X-ClientProxiedBy: VE1PR03CA0057.eurprd03.prod.outlook.com
 (2603:10a6:803:118::46) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|GV1PR04MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: cdfe7b34-ca79-4587-e3cc-08dc9f68dbe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUNlWVpIWXZ0NXIrNGJ6enMzcUxlcWlpd0dhNjBjNHJMeXh6NHk5S0dPZkdQ?=
 =?utf-8?B?OWgyYUZVbnRud0Y5QUNyZzBGUko4VjczNHc3aGZCSEh5czdaeUdDQUVFV2lS?=
 =?utf-8?B?eTVmb1lQYnNBTVZSZmZsbjZFcXZ0SlpJMzBDMWhjWUNrcFY5dE92NzY5TllK?=
 =?utf-8?B?WHZSa2pwUmMxSDM2NkNKUGs5WnJIb0ZaQ2FrQzJYM0VwVEUvWGlKYTViTUFO?=
 =?utf-8?B?Rk00RXZNTllLVUJGc1l4alFpb0VnRFYzZzRKcUtWRVd5NmF1SVAyTHYvQU9Y?=
 =?utf-8?B?NXZuVHBrcjZGelVuTlFOVk9INnJYamZETzVoanprTXE0VnZmQmdDSlo0UVpG?=
 =?utf-8?B?WWV2c3JDZzJodzlOeTUvWG0xY0h1M2NXTG5ObTdmRk9talZ2LzJzTnl6Qmxu?=
 =?utf-8?B?QVBzNGZxWGxNZFNTbUZRYmRMODNveU1DMzRpR0h3ZndPRUhTcDRWSGltOWMx?=
 =?utf-8?B?MXpUZGpHbmM2aXMvckMxMzVlNnU4ejRmc2tDVFVqMnpxejN4MDE3RVlFdmd6?=
 =?utf-8?B?MHpycTRpWHVzZExJb3U3a2pMdTVzOHBReXlGKzNqVkhNK0M2Q3NvNFdUQVE4?=
 =?utf-8?B?MUU4eWxHdzV4MUNkbkQwUWdQYUw0SHIvSU04TURhVWhRVGt2UjhiY25hbVI0?=
 =?utf-8?B?N1g2SExObkhObmZyY08vdFdRamdMWHR6NGxsRHRGcHE3clpxdHpETlNqSXQ4?=
 =?utf-8?B?NHhncmk3eUtqNmNYTFFEaktuTTdkelZ0Yml0UU5qS1ZSRmtIQWRKZWtrMXpZ?=
 =?utf-8?B?U2lQWDVOdkEyaGs3TWJLZ1pyK09tZ1hxbnQ2Z1J6S3B2emwrZUtrMS9KWGVz?=
 =?utf-8?B?Y21PeW00a1B3WW55eUZzVXZlT2NmTlMxaDRoRWpQK3MxZXpFa1pJQ0ExY0tV?=
 =?utf-8?B?SHUwWFArcjN5d3VJRXVtWmRmRllLWTArRXZFWm9VNXlTN1lxbHNaYUIvK0cx?=
 =?utf-8?B?RGlEZ2dBTzNra1NwT1NEZDBRTk5NTjZSVURCR011MkZxSnlWbkRYRlBCaW5h?=
 =?utf-8?B?WUYrTGRSS1o1ejBvL1RmRW0ramdPV2Rod2V4dGJpemFxQXlWOFM0eVZnZTdN?=
 =?utf-8?B?ZzlOemNWenQ2dFhSK2dqcENwN01LNG4zZG8zelE2WHlrOHB0cWgrYTJ0QXdQ?=
 =?utf-8?B?ZHBtMWM1bWovaFQza3RYaS91RTZJZ3c5Ryt2cHFMSlZvUG0wNGVuSzhxcUNE?=
 =?utf-8?B?ZWpyeVVOWmtsTlZjVStHK0xoaGRDTGN6b0JnSXBjMHVQU2lGRTY0T0JGR1Fp?=
 =?utf-8?B?a0ZQYVV0Zk1OYkZHSFVIZ3BDVjBpQW1oYmZ3S1NHbHdnaStrQWZTaEZFajAy?=
 =?utf-8?B?NTUwY0o0K3VyeGQ4dnZrSmJtSHFkZk9BNnRYV05STlN0blBFdlZrQUxValY4?=
 =?utf-8?B?c2tPczByWnFyVGJiN3lFWmxrS0NGTDVIbzlhNjhnNk5Uc0hyZXBkaFNHTXB3?=
 =?utf-8?B?REdIRG1jUzVFSFoxSjRNcklnZ01VK0Y0dVZjSm1MQ1JQV1pBZnR0YUIxMzAz?=
 =?utf-8?B?TTEzaTVMNktFZzlqNGtXUHFOZmdydndaNmpQbUlKWjJ0cTJkVVVISEtKTzZn?=
 =?utf-8?B?akZXQmlVUWYzZ3prYVovWjhpYmsyT3BTSUg1aGlGdDJZNmFTc3ovdDdSdXB4?=
 =?utf-8?B?cnhsT3B1ankrc0xaOXZDSUJEWElYMFM0cDk1T3hDTU4rSlhxbnhyRUVJdnVv?=
 =?utf-8?B?SW9nWllJWUsyUGgrMjduVXI3ODZpOTUwSjNWejNKMmhPd2xMMEtZSEU1NTA2?=
 =?utf-8?B?LzRacGphdEMrN2NXbzRiNU1aV2dDcXJOblJzdjNNMWhyZjdNRE9rTUY2ZE1C?=
 =?utf-8?B?cGJKQUdFYXovVURhc2xYOWppRXd3MWMzeC9CV3FveGNXYjhPTDd4a0s0TU5q?=
 =?utf-8?Q?/9v2JeRcWry4J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUswMTlvMCttV2lHZ3RtMWZFbVR3QWNPOEQwSGFDZnNlQ09DWXBpcnAyMGtp?=
 =?utf-8?B?elpnSWFGMXdZZWkxTjlqbE85QWRRUEpydkhpdkV6QlJnOEtlb0dVSU8yUWhM?=
 =?utf-8?B?elovdlpFMjNsL1ZiWWl3Z2xIZDNPbExWckg1MGNtRHBIZzBYd1pnZHlWU1ZF?=
 =?utf-8?B?Zlorb1l3YXNNdFJKQTJua3dZZGRBcitFeW8ySldqS0lWMUtMMUhucmY2bmRO?=
 =?utf-8?B?U1FPdlBOTU9pbERnWEVlYjl0QTVzM2VoL0JxODZGbzFMaU1JVyt2SGFPRU01?=
 =?utf-8?B?RElLM01TV2c1VEVNQnFqZG9zakNNOW5MYjBZYmtnSGRab0NPbU5sM29vUU5P?=
 =?utf-8?B?RVNrODkwZ1JvVjJHMjhhMDcxODFhcll1Y0R1cFZUZnFNakhtWGI5UC9PeVpm?=
 =?utf-8?B?cE9KbFo2Mk5na2MyN0J0dWd0OCt1ODJZd0wwbUFSamxMQkRlcllVN05iSXZ3?=
 =?utf-8?B?ZFVHMnJxMHlJM0pmcjQwcVlUbkh5eDhJK3Y2bTlIRks5T3V5Z0ZIY3oxUzBI?=
 =?utf-8?B?TEE2cExmcXU2SmovRFJVa2xLZ0EvcmdvbXdCSnZmdUFYb0Y1QXJpMnNpUTlr?=
 =?utf-8?B?SnRUcmpraWpuL002NjRGbUVENHQ2VElSMnVJb3BPQWV0cXJNRjAzZ0RlN2Jt?=
 =?utf-8?B?WE5JSWs3TmY4OU5RbG80QlVua3NVUlhDcWYwTTJzL0JiMTcwREY2d0Vkb3Jo?=
 =?utf-8?B?bk93SDM4OWJ2OWV2blB1QlVEQzVaaWdsckprNGlRSjAwWEp1ZjBUQjBNd2l2?=
 =?utf-8?B?WXA3dXlLUGZNcjZkYjFWVzVzVjNKNUd4QktHNTZuKzhseXlpMWVJR2gxL0tQ?=
 =?utf-8?B?TlF0cDE0Zi8yU29KYWhRMkw3OUxxU0dWL0RIRzdqa0x6Z2x5cGJYaW9qWjJm?=
 =?utf-8?B?TlJPOFJobGcwOEprVzEvN0FyQWJ3WkQ1SDF5QTE3aXc5OHc4SHFtcmh2VVBj?=
 =?utf-8?B?SWMvUWRMczVSaXpxUnBMWTZFbkNidEJNc0lKaXEzVXNZbk1NS0lxQ2ZLMm1S?=
 =?utf-8?B?VFJFZVV5bUdrdHV2MmN3RVU2SUhlbUF4L3RhVVREMnFzeXFCNkpEZktpVURo?=
 =?utf-8?B?dmFtMUF6TWpwWmZwcHhZVUZMdVBqV0l3NzhOTStjRVBxdFdXR0UzSG9KeTF5?=
 =?utf-8?B?UjZia0ZidlZlZDBYM1RxZmNMa1lXSDk2YWR2bjNZdGljcHVpMC9UaENkNVMv?=
 =?utf-8?B?VGhrU0o3TGZUK0N5VzkvSlgzTlg2OWhNUC85cWRqc29VNTUxajVkWVFOOWk5?=
 =?utf-8?B?bjJiYTZDMEI2ZDhtaVhQNDFmYjdMenYwcEhvMHEvZVZZelJhZFA5SmdMY2tG?=
 =?utf-8?B?UjNtT1J6MHE5azFIZ3Y5R2p1ZnlLa3FnMUpHYXNPWTJuWHJpVkM1U2tQbUFW?=
 =?utf-8?B?ZFZ1QXBUNnptclU1cjMvZ3VzVlMvRDBET1lmSW1yU1IzUzNaaUVmSi9CQktu?=
 =?utf-8?B?TlRwV1hUcml1WXhlOEJzb3AwTVJYSm5TYVBBZGczc0F4aWc0NS9oSUxzd0Ji?=
 =?utf-8?B?bFltY3NLeW15eWdxNnViNEY1aXFKN1EvRnl3Mk14L0l6MGx2bW5DNzZ4Uitv?=
 =?utf-8?B?d2ZPcVlMZ2dTUnpndjJFVkxyYlV6c3lDUEc3Z1p5UXJjSEUrZ1FZdi9jSlBu?=
 =?utf-8?B?cFJFdnVLbS90aVp4Y1RvSHRXV0NLZkd0a082N1VoRFpTOGpQOEorUzZhMFha?=
 =?utf-8?B?YTgvUmU2TTFDYjBUOHJQaExEdlNJemkwNW5WbzU3WmNzLzZOTENNUHBzQkR3?=
 =?utf-8?B?dEoxcU9MU3Rmb21RNytxUXdpbzQrWklLOW5UK0VDU2s1VGpUd0IzM0xNdW45?=
 =?utf-8?B?YWNYL2ZDTXVFY0NJN1pFYzhGZjRvYjFjNmw4b0kxbitwUzlYbjE2OE1rWnIr?=
 =?utf-8?B?bnQ4MzhhVm5tYnNmRHZVN2NjaEIvMXQ1aDZQNk1tWUlYcnlORG1wMDFKN3Vz?=
 =?utf-8?B?ZnVGZFg5b0pDMkw3Z0JLSzRiQmZjUVVhd2tTckRnZy95LzNQbHVsd0kyS2dE?=
 =?utf-8?B?QWtPQlVRWXFhNlVOT3hEbWQ2OU9EaGhaUk5CUjZuUnJGVFNnUjYwNU1tMU56?=
 =?utf-8?B?Q3dYc0dLb0FiM2I2SUQrdnVndnJTa3hkRVBIbjBwTzFPZU4xdnZhQVc5dzda?=
 =?utf-8?B?U3NqNU9wZUxERGlNVXZYeUxIV1FUUE9jQ3pMTGh4a3BtaTZFR3dOVXVFYzd1?=
 =?utf-8?B?NFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cdfe7b34-ca79-4587-e3cc-08dc9f68dbe9
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 16:13:09.5450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZnjgEnsZrtjbw7rytNXJ/CJHz/xg7ZgdwVNKWDqJ8esdL4MuGO+c0eJMR9cGGZsENRiwIbizPpAZ6/KTOKw4XH1deQle51Y+6m9frH5mN1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9055

Theobroma Systems Mule is an MCU that emulates a set of I2C devices which
are reachable through an I2C-mux.

The devices on the mux can be selected by writing the appropriate
device number to an I2C config register (0xff) that is not used by
amc6821 logic. This required us to add a new compatible to the amc6821
driver, from which, the new platform device "tsd,mule-i2c-mux" is probed.

The selected device on the mux can be accessed for reading and writing
at I2C address 0x6f.

      +--------+----------------+------------------------------+
      |  Mule                                                  |
 0x18 |        +------------------+                            |
--------+----->|    amc6821       |                            |
      | |      +------------------+                            |
      | +----->| tsd,mule-i2c-mux |---+                        |
      |        +------------------+   |                        |
      |                               V__          +---------+ |
      |                              |   \-------->| isl1208 | |
      |                              |   |         +---------+ |
 0x6f |                              | M |-------->| dev #1  | |
------------------------------------>| U |         +---------+ |
      |                              | X |-------->| dev #2  | |
      |                              |   |         +---------+ |
      |                              |   /-------->| dev #3  | |
      |                              |__/          +---------+ |
      +--------------------------------------------------------+

This patch-series adds support for the tsd,mule-i2c multiplexer
as part of rk3399-puma, px30-ringneck, rk3588-tiger and rk3588-jaguar
boards.

this patch-series depends on https://lore.kernel.org/lkml/20240705213547.1155690-1-linux@roeck-us.net/
to add regmap support to amc6821.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>

Changes in v5:
- Drop the mfd implementation of v4
- Add more dev_probe_err callbacks to tsd,mule-i2c-mux
- Instantiate tsd,mule-i2c-mux as a platform device from amc6821 driver
- add "Theobroma Systems" when describing mule.

- Link to v4: https://lore.kernel.org/lkml/20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de/

Changes in v4:
- Drop the previously added i2c adapter quirks
- Add platform driver probe to amc6821.
- Change mule-i2c-mux driver to a platform driver
- Add dev_probe_err in mule-i2c-mux driver
- Add support for tsd,mule in simple-mfd-i2c
- Add tsd,mule mfd to supported dts

- Link to v3: https://lore.kernel.org/r/20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de

Changes in v3:
- Change "i2c" in comments/commit-logs to "I2C"
- Fix long line-length
- Warn when "share_addr_with_children" is set and the Mux is not an I2C device
- Fix/stop propagating "I2C_AQ_SKIP_ADDR_CHECK" flag if "share_addr_with_children"
  is not set.
- Fix "old_fw" variable is used to indicate the reversed meaning.

- Link to v2: https://lore.kernel.org/r/20240506-dev-mule-i2c-mux-v2-0-a91c954f65d7@cherry.de

Changes in v2:
- Add i2c-adapter quirks to skip checking for conflict between the mux core
  and a child device address.
- Rename dt-binding to "tsd,mule-i2c-mux.yaml"
- Add Mule description to kconfig
- Fix indentation
- Move device table after probe

- Link to v1: https://lore.kernel.org/r/20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com

---
Farouk Bouabid (8):
      dt-bindings: i2c: add support for tsd,mule-i2c-mux
      i2c: muxes: add support for tsd,mule-i2c multiplexer
      dt-bindings: i2c: add support for tsd,mule
      hwmon: (amc6821) add support for tsd,mule
      arm64: dts: rockchip: add tsd,mule-i2c-mux on rk3588-jaguar
      arm64: dts: rockchip: add tsd,mule-i2c-mux on rk3399-puma
      arm64: dts: rockchip: add tsd,mule-i2c-mux on rk3588-tiger
      arm64: dts: rockchip: add tsd,mule-i2c-mux on px30-ringneck

 .../devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  |  69 +++++++++
 .../devicetree/bindings/i2c/tsd,mule.yaml          |  63 +++++++++
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |  24 +++-
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |  24 +++-
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  25 +++-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |  23 ++-
 drivers/hwmon/amc6821.c                            |  25 +++-
 drivers/i2c/muxes/Kconfig                          |  16 +++
 drivers/i2c/muxes/Makefile                         |   1 +
 drivers/i2c/muxes/i2c-mux-mule.c                   | 155 +++++++++++++++++++++
 10 files changed, 401 insertions(+), 24 deletions(-)
---
base-commit: 97c57cb030b79def7b664c253e0c4f0702b9e758
change-id: 20240404-dev-mule-i2c-mux-9103cde07021

Best regards,
-- 
Farouk Bouabid <farouk.bouabid@cherry.de>


