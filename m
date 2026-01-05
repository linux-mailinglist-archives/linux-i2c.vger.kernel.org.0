Return-Path: <linux-i2c+bounces-14897-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CF6CF2A84
	for <lists+linux-i2c@lfdr.de>; Mon, 05 Jan 2026 10:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D493F30021E9
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jan 2026 09:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E332E32694E;
	Mon,  5 Jan 2026 09:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ig2MYZqR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011004.outbound.protection.outlook.com [40.107.74.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B4532B995;
	Mon,  5 Jan 2026 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767604501; cv=fail; b=Yj96p70VfFYzRysTiwu0P5BHwFNBLg6kY8MFnBJ6ovnEO78sRFq92963athaDxj1O1DXgZBadznS3TXF3VOyKOCqeRRxH16XF1NmepQFSoXhmV0XEO7cz33WFOdgeutLrlCbPuSm/yJjER9YSDxivrBoa39+YCA5aFzJs6AXcE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767604501; c=relaxed/simple;
	bh=FMdAGAXiJbwHWctWMsAE/jXTk2MT5Exl2FjTUwmUHZM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tEfuCaxOmxzqfzLv2shMLaZ35PR6RN2XXwJ3cz58vq50HoOwR2MZUFNvQ7pxSGDascHAoqcFs9Xq1N24P5oLpDL/Dtl/0QOiUALleae7oRPUswEm47QQOIJ3RYhZjO/XWDwruPeRsibsxlfPKl5de3o+xOkRgJOYE4tJHlX5c8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ig2MYZqR; arc=fail smtp.client-ip=40.107.74.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V377ISnXqxbwpXopdAGSNSG5Uxue5WVGJkwTMjYkalQavOfVGPtrDhiOXo4LsfwxJZc6L7eXJPmQWF3g+8zB5UwxEIjF9iENCLa9YrTXONG4ThyvikrmMvr+S6rZ1gNw0NiElhA8btaQgymKSHIewZZF79MPxmrBbHknIaEq6Rs8iT/cj5OTOJPx3p2haqr+0tnVjlVSsMhxov8mnc1upJk4YuG42+5Vtdl+i2DOypOF2hY/3s6pFUkRwqGT0bO9/3fG8koFDC5EoMXqkKTNT3t5jnh7F8WbrVko3Rn7x4+qKxrUG0ojnW+RxlRuN5/iw7XObQIFpNfffja4El/8mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMdAGAXiJbwHWctWMsAE/jXTk2MT5Exl2FjTUwmUHZM=;
 b=I91GUMBOIBNQrWh3/+u15gMALBVoW52UdD/n8e28UtjUQMqM7/cThGYA2XQSN5zk3+7MEvRo2ETI5sVhvtT9M0ZnHu/sQxajrs2O6w7Lue2GRi/1O7NN67I/HgzxCuu6MDq8LgsNElq7ifVsSQbQBKDdTq2dDDZSvQgfK19nRZhWPcNHFm9MZgjGWRdpfpBKadE4XwgVbH9qmt3tygqhVV2JRbH4WaxRnXhVcjhU0RTe9EGXWEvN4Q4pY6spZEF3GXYqV/W/o4RjGTv28jLChFoUHcEjFR7xpV0EsPQLCRx88Y5PI/JeqYhrVcYo/IxaEvf+wiO66d9RjIhtT9SNHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMdAGAXiJbwHWctWMsAE/jXTk2MT5Exl2FjTUwmUHZM=;
 b=ig2MYZqREvXStVZOSHftPCGnItOeitTatzS4CuewUtZZREYz2V2vW+6OHt3RzpR/2yeazrJYHPnMRXg4cIiPnNzOubR8EooN5XYqYyVWm92Q0mAW+DWPfseOv29Psez1nO8+c2DEXOpFK8fq7snyGirExiK/xBpFagOkNSUA6So=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OSCPR01MB13063.jpnprd01.prod.outlook.com (2603:1096:604:32d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Mon, 5 Jan
 2026 09:14:55 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.9499.001; Mon, 5 Jan 2026
 09:14:55 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi
 Shyti <andi.shyti@kernel.org>, Lixu Zhang <lixu.zhang@intel.com>, Sakari
 Ailus <sakari.ailus@linux.intel.com>, Binbin Zhou <zhoubinbin@loongson.cn>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede
	<hansg@kernel.org>
CC: Bartosz Golaszewski <brgl@kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 6/7] i2c: rzv2m: use i2c_adapter_set_node()
Thread-Topic: [PATCH 6/7] i2c: rzv2m: use i2c_adapter_set_node()
Thread-Index: AQHcc/PsNffoqWiN7ESJQn00FrdP3LVDX4pw
Date: Mon, 5 Jan 2026 09:14:54 +0000
Message-ID:
 <TYCPR01MB12093A4C04FD1EF44805065D4C286A@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com>
 <20251223-i2c-ada-dev-set-node-v1-6-2e36e0e785b4@oss.qualcomm.com>
In-Reply-To:
 <20251223-i2c-ada-dev-set-node-v1-6-2e36e0e785b4@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OSCPR01MB13063:EE_
x-ms-office365-filtering-correlation-id: 59e66c5b-0ce5-4b96-b79d-08de4c3ae3fa
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bkVFQmNiaXdqMThWcThpN3NhVkt6SjRyNjVFcmRUYTJFYkd2OUo2T2hIOXZ6?=
 =?utf-8?B?SjRIQXc1SnZWeXhFZU9jaDNER3hrdU1SRDdpMlBVN0hzaFk5Y1gwNnY3ZTdj?=
 =?utf-8?B?MjNRZ0N4bTR2TTR0elR4Y1JIUUprTWE4d3A5WFVwVVMvZE1HV2E2a2J1Y2RP?=
 =?utf-8?B?RGIrbnUvT3Y4Z3l1b2hKZXh2ejhBWjJqUnpOVytQYXRtbU92bG40d0pjeDdL?=
 =?utf-8?B?Ymg4VDR2M0ZKNzZHK2hVWjlCaDBHZFAxVHFEc0FMRkNRNU5QNjFhdHljQ2RU?=
 =?utf-8?B?SVdjQzk0N0JBQU5OZHFhbm5HcE0zVXhNY2M5ZHdNeEE1cDFwOFhuenhmZWpZ?=
 =?utf-8?B?WmtZcFNaYkp3aCtoOG93dXd2WU4zc2FBRWRXT3pDaHZ2NGdET2tKQk1DNVhI?=
 =?utf-8?B?WnRlSDgwRnZVRTlGb2hNL1lsVGd5KzFNclZMTjBMbFQ5NmVKNU1JWFdnaitJ?=
 =?utf-8?B?U25XOERSQkt5akdtdzlsTW9UazJTUWozV1dpY1YvY2JLM2JrQTA2YnVvWVBv?=
 =?utf-8?B?N1dXKzZUQzkwSGNRbkl6WVFGM1pTd2Z2YUdnWG1VWnIrc2ozRXRSSzZnOVRW?=
 =?utf-8?B?bkNZYklFdW11eHdwaTJ4WTlyOFJUMUhVNFIxOUF2NEprekY0OEd2TmJqY2dv?=
 =?utf-8?B?dlFWZUg4RGVrMDllcHBPUjkrTXhYSUJsSjZBSW54VXJPK1hWS1BrNzVqUnFi?=
 =?utf-8?B?VGNrUGRHSGwwY3JxZWlLbjYrRVdNdklXYjhEVjNkSTBuVXdLektBdHc3bFgy?=
 =?utf-8?B?V0NMSG5STERqOW51SDVQZUIzcURuVEpmK1VWaE04dnNnd2cvcFQ4ZDlmMFRs?=
 =?utf-8?B?QWNPL3VPejNnUVJUTms0UExhSUFPUHdZUkpwWURwRkdaOTEzZFNQZlQ3N1Bt?=
 =?utf-8?B?K0liMmZobWJEQkYyRUtmT3I2ZmpYMHF0RGJUUWxmb2xpSGZCdnVTNEJsZWdJ?=
 =?utf-8?B?VUNUU3dTWURaNXZISDZGQ1VUbllMVEh3TEFNWHA2T0llaklvTEgyZTg5L1Z0?=
 =?utf-8?B?bG10NHk3TzJ1UmhHZUVpQjFvaHE4MGM5U1dzb0lIUjFMQ2graGpFZzFYM25V?=
 =?utf-8?B?WTU2a2Jnd2JvbEhxR2pNN3dzK1FrK0VXOS9FV05JRUFPeXdNTkV2RHk0REdI?=
 =?utf-8?B?NXp0eXhZOXBrT0FNNmFQQ2YrUkRHcFd1VndacWpzbmpZczMzZFNtKzc3dzhn?=
 =?utf-8?B?YTdVbEpnWjBsMHJaNnFTUCthNFJEeTNiN0IzZS9ickNYcjNQQmpLR2FMZ0p0?=
 =?utf-8?B?dG5xeUxCN0cwcnpHZk9lcGk4QkZHMkZSRDRTYnZaTlNJaDgzMHVqcEdKS2hR?=
 =?utf-8?B?TENyT1A2UENnVXp2OGY5bVlaNDZlMCtHR2Z6Y01iNHhRdU1QVFdlWGpqV25T?=
 =?utf-8?B?S2ptUHVoR0FSVjA4OXQxUVR0TllmSWFSRGQ0UXlObkt2dHViUHN3Y1d4M01R?=
 =?utf-8?B?Z0YvU3daY3JCQTJjcjJjUGN0NVF3bGRra2RyeWxvbEtaWUZVSlZqdk9SSXgr?=
 =?utf-8?B?S09GMnBCZS96dGdtQ1pGYjZ3RWdsRE9PdEd0THpPbW42N0ZrQURqNUw2Q3Bt?=
 =?utf-8?B?clR4WGFMaWhzT0ZrSjlkd3VjUmJ0UGVaeTViRjJ1cTFBdTluSlFrMmFKemhE?=
 =?utf-8?B?UC9LalVLNUs1UHAraUN3M3NxSkVNNCs5cFhwMUVQTGtqWXAxZ1kxTzhnNmNy?=
 =?utf-8?B?R3FLYjUzdXE0bDR0ZmhpYjhDY3dqalh0dU5XZ1R2WGxmQmdNWUxUR01NMDY0?=
 =?utf-8?B?QXlJcFNhY3NUVWFJVjEzakZZcmdkOVo2eHFIclo5YjNGYlJsbE1FUG9IRTBI?=
 =?utf-8?B?WVBQUHRFRmVDTXQwN1FWN2pCcE9OMm1GRlcwR3dlUXBnbklRU2NsdnJHY2hO?=
 =?utf-8?B?RkZBVlJveFB3ZTA3ZElUbjY4TUFPSkUrZEJMalJzaGdMZ0JGYjkydzluWVJy?=
 =?utf-8?B?ZG9PTG9rVTVPMUJkYnAzNE4yZ3lzQTB0RTNqbkV2Wk9kbjZrNldjS2dqbTNr?=
 =?utf-8?B?b3A3MlNiL1Z6andmUGFENDdQdkplQ3BCV0x6RWpRTUxaOUw0OXlXdmxrdm5u?=
 =?utf-8?B?SVIvSHFtQXBPTmhQVUUzTFlxaENEWEh3STNmUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YlhMV3pWSmRRTGVHakFsWHFlWERCbjhrcjI0S0ZXSHQ1cnNUTUlCdUlIK2RR?=
 =?utf-8?B?OHZaUmlnZnhhSVk3TWk1QmRLWGIxYWpuRFFqUjVHcEgyVXBxaXlIa3IvV1Yw?=
 =?utf-8?B?S0xHaWNQblpHK1hWWHRHL1RrZ2hxTFFWQTNQV3ZxNkNxT0ExU1ZOdGN2N1dE?=
 =?utf-8?B?QXgzYmRFQlpMQWZjSzVPbzZwLy9LQ0htWXR4TzJRc0ozQzZyVGRLeUUxM2I5?=
 =?utf-8?B?aEE0MHFmOTE2MFhSNmxIbEc0bWM0TklXV2dWcmN4UWhHSDB3WUVIb1pkTGt0?=
 =?utf-8?B?QUx0UWIxWDMxNGdWNENlbzIxcCtOVlJ5Ym1BbnZDNnpST1BXZ05UeVJmcUVF?=
 =?utf-8?B?WGdWK0hTcWFUS2NXblVvVTFELy91SC9Qb1hTYkVZOWR2VEpXZ3pMbStqVHlo?=
 =?utf-8?B?UUo2RjMxMURHS0txWFRNOTFxQjlyZkh2QldNa3VxcithL1kvMHhubWdFTmhE?=
 =?utf-8?B?U29zWXdtNVd0ZkJtbU44U2c1RkMrclFka0pUR0l3clk2dG5NUHZXeHpuL2NS?=
 =?utf-8?B?SktyQTl4TGQyV0hkZVFzcjd3M09uVyszaE1JdFMyK0xYR2JWcHJEdTJOUEpS?=
 =?utf-8?B?d25zOWtiQWpXaG5DdlpqM25mV3pwUmNQQXBhZFJxb1pFS21WZ2RuRk83SGlq?=
 =?utf-8?B?L0hpaFZTUjdpcFJJVEdaQm05ZHBzTnpIMS9DTVRRME9nVmJjRTZDbVVMRnN1?=
 =?utf-8?B?aitCZnV1SFhlQzlwSEx2Y0EzNUtoQlF6Wkp2ZkNIVzVUbEh5NVc4UTdYKzNk?=
 =?utf-8?B?aUZwc2hISmVKdksycmxvNnZkSUNNUE51Rlo4cTVualhCVnZLVnRia1B6Z201?=
 =?utf-8?B?UXAyeVFsZ2lNcjNmQ1o3bzJzOVZjS2lkUTNYRy9kNzRhU1V2YWErZEsxNDBW?=
 =?utf-8?B?NFpNSWdIdDh3TjR0ZTFHM21uS2VYSHRHNUlKTFIvelkxSVo2M0RVNjJRZFda?=
 =?utf-8?B?SlVNdXFvRXdOeDY5RnpzZHZhRmVKOWlyaXlHSTdkUXluTmpvYWRCWmlDdzdk?=
 =?utf-8?B?M3FFQUVQT3E2QjlSYktmNlY0Q241T0FQS0ExYmJRMi9RTFZldFE0ZktidFRG?=
 =?utf-8?B?WWI1d0p2OWhZRmdMR1IwRGx5cHdRTlY4QWgzMFNMS0NDaVl4WlRNTVlGMHdS?=
 =?utf-8?B?T3lUTkJHN1g5MHhtdXNRYmdIbExXcFJFWnpJeUM5MkNCMmdZdkhWSmcwbDFL?=
 =?utf-8?B?SHhrdkxrWjh0a0syeFZ5VHBFNXBvWXdHeDJ6YWZFdjd4MVRZaUpncXhLRDZp?=
 =?utf-8?B?cjVnTXNzV1BLR1BiaE9oZDVHNWt3WnR2OFZzclIrV3E0bkdVejNzNUlPV1pX?=
 =?utf-8?B?U2V1YU5hb1EwY2dHVUpvMU56N0V5YjIzT2lVSEZRWVNtUmdYNTUvT1VyZ0Rr?=
 =?utf-8?B?QnBzSituS0VyYVIvRzg1djJucG1TcGtlM2hpRVZqcEhVQTE2Wm94VytBb2Fh?=
 =?utf-8?B?bnJxNkVmYk1TUU42QklsNENYZSt3VlBEUUxkaThhOWdib3NMbEtMemlNZ1Nx?=
 =?utf-8?B?TzdpVzlqdENTVTZsU2R5S0luYk9yYXB5TTMvVXVxSXY0Ni91M3VWVW1qQnRF?=
 =?utf-8?B?K0Z0NGk3Rm1NcExwVndaSTlibmQ3L3JzWURwVlJkaTdUNHlTNzdNRnV1STZC?=
 =?utf-8?B?NWg5bUtESDRoV05aUDR2TlVJemRXejJrVnlZTGVpWk0yUWI0djQxUnJLWXp5?=
 =?utf-8?B?UklsbjA4SkhhUEhBY3d4cngvRDNNMVBZMmtXejlKcmFDSnpycW5Pcml6aXB4?=
 =?utf-8?B?TmJnMWU1aG5nZWZ4c2RrVWxJODJVcFFqZW8xbkYzakxpeEhJVHpoNWYzekZv?=
 =?utf-8?B?LzBDVXd3cTJhUVh3cDNZeTA2YnZ5RmFPWENHNC8xR2I5a3g0QW1rbG9ZTHpv?=
 =?utf-8?B?b21OaGFHNEFaYkdHWmFDUVRkVThMcEhBNitOMXJzSnpwTmtFbGF0dG9uWWor?=
 =?utf-8?B?VGRjNmVnVjVJZmNraFVXR1pEQm1ZTHBOeHlQNlpLbzV0NWJ0TlRhaWZzN0pq?=
 =?utf-8?B?ZHdmNmt3YWFKYmJUdUZTVHduNjJyNjZHZDVXQnN2ZDd1UStZZEVzV0xJZmRT?=
 =?utf-8?B?eno5VlNleVo1N0FsdU1xS0ZISmN3Z1RoN1ZnZmhoVG0zTmhXdTdBOXpZM1Ba?=
 =?utf-8?B?T2xLWGJxOU5zTm1XU2pERlN2OFJ1TVh3YjJFSFhERWNFbXRNVlozVkI5dVpS?=
 =?utf-8?B?UkozZ21GcTNDNldKdEJ2LzZFNTFoWjA0NjZkS25vUjJvdThqQXA2K0p6RitU?=
 =?utf-8?B?Ujc2ZE1CdzRrS2RQZ3NGZkhFV0t5eituVVlCWXdNUlVPNnkwZStxQWVzc1hq?=
 =?utf-8?B?V2o2OWVMUFVnSmJ1d0hSZ0dsdWtHOXN2QXp0bm0xdE00YVBWTkpsM1NxdmRP?=
 =?utf-8?Q?7+OUjexx8jVUCt8k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e66c5b-0ce5-4b96-b79d-08de4c3ae3fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 09:14:54.9473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 31XJnZDqqShbr0td6W48ryOlSCm0Bc0mysT6SpD1FONf5obYXTwDNhAgI2B2iqOIi6WFjobIf+Q+wsapZZKDd6ORNTeZDJ3JqIXu9Izx1dI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13063

PiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQG9zcy5xdWFs
Y29tbS5jb20+DQo+IFNlbnQ6IDIzIERlY2VtYmVyIDIwMjUgMTA6MDcNCj4gVG86IHdzYStyZW5l
c2FzIDx3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT47IE1pa2EgV2VzdGVyYmVyZyA8
bWlrYS53ZXN0ZXJiZXJnQGxpbnV4LmludGVsLmNvbT47DQo+IEFuZHkgU2hldmNoZW5rbyA8YW5k
cml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPjsgSmFuIERhYnJvcyA8anNkQHNlbWloYWxm
LmNvbT47IEFuZGkgU2h5dGkNCj4gPGFuZGkuc2h5dGlAa2VybmVsLm9yZz47IExpeHUgWmhhbmcg
PGxpeHUuemhhbmdAaW50ZWwuY29tPjsgU2FrYXJpIEFpbHVzDQo+IDxzYWthcmkuYWlsdXNAbGlu
dXguaW50ZWwuY29tPjsgQmluYmluIFpob3UgPHpob3ViaW5iaW5AbG9vbmdzb24uY24+OyBGYWJy
aXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT47IElzcmFlbCBD
ZXBlZGEgPGlzcmFlbC5hLmNlcGVkYS5sb3BlekBpbnRlbC5jb20+OyBIYW5zIGRlIEdvZWRlDQo+
IDxoYW5zZ0BrZXJuZWwub3JnPg0KPiBDYzogQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBrZXJu
ZWwub3JnPjsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZzsNCj4gbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBCYXJ0b3N6IEdv
bGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQG9zcy5xdWFsY29tbS5jb20+DQo+IFN1Ympl
Y3Q6IFtQQVRDSCA2LzddIGkyYzogcnp2Mm06IHVzZSBpMmNfYWRhcHRlcl9zZXRfbm9kZSgpDQo+
IA0KPiBVc2UgdGhlIGRlZGljYXRlZCB3cmFwcGVyIGZvciBzZXR0aW5nIHRoZSBmd25vZGUgb2Yg
dGhlIGkyY19hZGFwdGVyLg0KPiBUaGlzIGFsbG93cyB1cyB0byBoaWRlIHRoZSBkZXJlZmVyZW5j
aW5nIG9mIHRoZSBlbWJlZGRlZCBzdHJ1Y3QgZGV2aWNlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
QmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29t
Pg0KDQpSZXZpZXdlZC1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVu
ZXNhcy5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXJ6djJtLmMgfCAy
ICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXJ6djJtLmMgYi9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLXJ6djJtLmMNCj4gaW5kZXggMjM4NzE0ODUwNjczNmE2NTM3ODgwOTk3
MWJmYmRkZmI0MzZiNmM0ZC4uZjMxZDViOTA4MDI0NzdhM2QyNzU1N2E0YTkyY2EyYjI2MDIzZTM0
MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1yenYybS5jDQo+ICsrKyBi
L2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtcnp2Mm0uYw0KPiBAQCAtNDUxLDcgKzQ1MSw3IEBAIHN0
YXRpYyBpbnQgcnp2Mm1faTJjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+
ICAJYWRhcC0+cXVpcmtzID0gJnJ6djJtX2kyY19xdWlya3M7DQo+ICAJYWRhcC0+ZGV2LnBhcmVu
dCA9IGRldjsNCj4gIAlhZGFwLT5vd25lciA9IFRISVNfTU9EVUxFOw0KPiAtCWRldmljZV9zZXRf
bm9kZSgmYWRhcC0+ZGV2LCBkZXZfZndub2RlKGRldikpOw0KPiArCWkyY19hZGFwdGVyX3NldF9u
b2RlKGFkYXAsIGRldl9md25vZGUoZGV2KSk7DQo+ICAJaTJjX3NldF9hZGFwZGF0YShhZGFwLCBw
cml2KTsNCj4gIAlzdHJzY3B5KGFkYXAtPm5hbWUsIHBkZXYtPm5hbWUsIHNpemVvZihhZGFwLT5u
YW1lKSk7DQo+ICAJaW5pdF9jb21wbGV0aW9uKCZwcml2LT5tc2dfdGlhX2RvbmUpOw0KPiANCj4g
LS0NCj4gMi40Ny4zDQoNCg==

