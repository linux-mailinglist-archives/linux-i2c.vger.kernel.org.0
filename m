Return-Path: <linux-i2c+bounces-3232-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E026F8B3D26
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 18:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B10FB20F99
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 16:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621D115ECF1;
	Fri, 26 Apr 2024 16:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b="LUC44oMC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2111.outbound.protection.outlook.com [40.107.6.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3362D15623A;
	Fri, 26 Apr 2024 16:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714150237; cv=fail; b=sNHUOM3sHVvm5wJjOKd8B+AerNsvRZZ4QCYGDgakytaeZnGt7YaVIUnp53lo6ylQF2YUN72qCHDsD+6ADnMNPEN3+daS9XP/LWWfUfIAvmNZwypH0zHQPjVWNBg62XZ1cMqZhj0w7AIh5i1PU8E6F0QhSn6SkrTZoERHzpL09i8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714150237; c=relaxed/simple;
	bh=G6xpFyd/4ek7XfL1DiLMmmMk47dvIUuh8rr3trU/VUY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KB1GNLshzQUL0Y+5yw8SXBOapOpDOTce39a/86yiLK24MMSwGpLSpYgy4CHLwodgXqZL9uFE9m7FUw28FY3kDBO6F+N7lxu0W5dRyQ+dSjD0aJa0VLxlkPxh452UYzgMr675JMVWdNiN8NWSlxXw4aByRsvT7cF9UrNdPIBwJu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theobroma-systems.com; spf=pass smtp.mailfrom=theobroma-systems.com; dkim=pass (2048-bit key) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b=LUC44oMC; arc=fail smtp.client-ip=40.107.6.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theobroma-systems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=theobroma-systems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acqpz69g688Jz4QcoODm8y/EK8upjlqB2q+EodhbxBRXqghqqLbaHpHyC/pnN/635AqxxCD+h6hiiUYjgqnV0tJjXe/cegejbA7bFaIGUewkJtpvkzuAk08eHNAKhJT6/dv2E3dcWZ9gKEMkXkCFJ+HJsi1PxDhkTFAhOGH/coiqW6qy3cMIDbjTsikcNPn5+f36Za+K8ivCWzCt+V++efPZJZOdAz/DVpI06pCfp2FMNVjLnksUfVoafHNVu+SXjx4vOwizFUFqO2qVy2/H3Yl3ptGzjR5Gx8DEjA52vClVdAuGTEKfjnrOQNeS9t0GYWk7eqq/r7d7Pm49Z80tSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dIG2BkAXgcQbmkRkmzTuBvQ0ASz8UsVLrstqnA3rAI=;
 b=AwAngE3JgjfsS1khruOqbZScm/dhmVlKcLJ7NhgEodNvNIyeAuGriv2R5mBvSAtIvUTBv64biaMkOZjGXIYDrhbo5TUGhXSkbsSLALWmU67Hc0zVeXIEOO5x4O/JHornyETGhY9LSBO0sKXYps/Lgr5GjUwlLOLWrXhgF3w9t8DgmQE6fumMvsYSDNuLQF6Peroo4xRjKtGF7ASCOHhcuFbyDnkuBGV/205ZV7/JfeCpjx7kjc+2hy8gdgxfn+Fk003dUUpZs4948beAC2+0KODBm1jv6+uGeRvZL3/lb97n633Yr7RVZiw3HsX8sh6DR1DVVNI1WOAo6Ww4n0oPUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dIG2BkAXgcQbmkRkmzTuBvQ0ASz8UsVLrstqnA3rAI=;
 b=LUC44oMCItY3GmJEm+38939SDC4R3DNwDJrtxCYK+cbPjeyA//ADHxtmIeEHMzl/P6RTGfd/9c65t1TcnOoCD1b4spNoml6U6Mb9tfJlW7as6dD5a4V8LovmFKwPfyg+PRLQo1p7cGlzcQTeO26JTeXTCCs1Osgxq+eCdGFf8uLS678iMj45hOjBD4LFlA3PGdY03sVAw6OvAFKTOzER2MJ51uE/dpOHrGea4o/cF0BabvG8QfrZDQYs7f+d4DyZ+g+i7p8aysqJvJkef32irxQgSu2kwQLEg0Qp0aeJIsAmBXFguSqdCFVX4JOJ3FruAf+PiJCBGwWl6VdaLS2nuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by VI0PR04MB10230.eurprd04.prod.outlook.com (2603:10a6:800:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 16:50:28 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936%4]) with mapi id 15.20.7472.044; Fri, 26 Apr 2024
 16:50:28 +0000
From: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
Date: Fri, 26 Apr 2024 18:49:34 +0200
Subject: [PATCH 3/7] i2c: muxes: add support for mule i2c multiplexer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-dev-mule-i2c-mux-v1-3-045a482f6ffb@theobroma-systems.com>
References: <20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com>
In-Reply-To: <20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: VI1PR08CA0261.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::34) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|VI0PR04MB10230:EE_
X-MS-Office365-Filtering-Correlation-Id: 73926b75-5b7d-4748-f092-08dc6610fa22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1FjcUpza0kreUhmWENRNVVUVStsckt5dVh5L2tsQnpGdDU3REZPRWhlZFhV?=
 =?utf-8?B?Tm9YSjRoazFCaWpPZ1NPNGdFOEJ3VVp2NVo5c1VSWXdzNGh3T0oxdW9wR2Jp?=
 =?utf-8?B?K3RvbWh5ZFhNR2hWeDdidTh6c29jVmp6YU5WOVg4VVBJbThES1JraGx1UlBM?=
 =?utf-8?B?ZTZBOWRQUmFVcGNKR3RxWG5Fa3lGYllwemUvdmdXZThQYnFNY2Z3cFRYVnpV?=
 =?utf-8?B?N0lIN29YL1BPS01yVjZOR21jU2dtLzVjTnJINllGS0krdGFHaUEvV05zOGRF?=
 =?utf-8?B?aTdwbUdRc2krQkVxazA4bi9YazNkRTB1dGNFOUEvc1M2L0JyM0tkV3hyaEdn?=
 =?utf-8?B?RVFIdWh0QUVyKzZ4RmdtTTZZTTl1RmZUbkU3MVJ0YUtmZjFtVjZyZkxJZDgv?=
 =?utf-8?B?UzE0MEI4VXlRRHJKRHQ5TlF5R1E3OGFwTzFldTBHNFRHLzlFKy84V2kwRGtK?=
 =?utf-8?B?UmQxdWpDejRQVXdycmFLc0hPOUhWMUtTVEFUc0drZGtwWHg5R2FQY1U1UlZk?=
 =?utf-8?B?TTdVQkUyT3NrZ01nNHlaYWFtT3RVMkQzOUYvanVzeDM4ckFRVktnRFR6bkl6?=
 =?utf-8?B?YnlWTmVLK3I5a0c0Z0xHQVE2VVkzRjFURld6WTNFRWtRQlo3Tmx6aGlLRUZr?=
 =?utf-8?B?R0tiWjRidnVNUnY2MVoyTXJnTnNkaXMvT1BjVU1raExDT051ZExndncrZGVB?=
 =?utf-8?B?OCtFLzUyNVB0UnFxbGJyWDhOL0V6bk1RdW54L21FaSt3bHdZc09ocE1oY0Qw?=
 =?utf-8?B?cXBaMkNzUDNwYzVyblRVdkJKWnljN2hkK3dmcXZlZzY3K0VlSzkxNU51SWdo?=
 =?utf-8?B?WFRIOGpVeHVQQklKVnJvVU96TWw4b1F1cXRoYzk4aVJMd1V4SVYrV0JuVFpm?=
 =?utf-8?B?SWlyR3JXMXVpamYzRTJ4VTVwNlRUajVSSU9aa1hybXN0Q3h1WWQyV0o4cm5O?=
 =?utf-8?B?OTZZamxCZVluZ0orNDBabmJtSlk3VVhCbExNeXk5UVRFWHF6WS80N0RzVWxw?=
 =?utf-8?B?MmR2cWdhRTIyejF5VkRzakhvOGJwOW5ja1hCaEpsUU8xSTQwaDFON0UzNSs0?=
 =?utf-8?B?UE5vTytJK1NmUksyODRsTkx0K08rbnFDaUtvT2paWlFqRlZTbDRWTjBJbGZW?=
 =?utf-8?B?VTJOeCt6WGNhcnEyZ2J6bFJQWDZNYnE2dTgrZWJ6YUxROWtkQTFVSUZ4VDY4?=
 =?utf-8?B?cEFOTHJhYVRvM3hoQzJhUFBreEYwNGljOVlFbGdCZ2FCaG5EQ3g4ZTFPRk0x?=
 =?utf-8?B?NWxrZTJib2xJcG8zK0xsL2VWQXcycmdwZjNsODVGV0N0YUQ1aDM4WXQ4QnFo?=
 =?utf-8?B?RFhiOE9DWVVEeHhGZmlGdUo4eTNSQWVWdFh1K29lcDJ0cDE2K0w5OVBNeUFk?=
 =?utf-8?B?dWh5NW41ZWZ4cHNUQ0V1OFo3c2ZhRG5SaklIclFmUGZXMjVNMUdiQzZtTmFD?=
 =?utf-8?B?R010SThaWU1RUlZZZmRpLzdqUVVzVDFiNmRHRzFHQ0JEMWFpM2FqQlFTL1Z0?=
 =?utf-8?B?ZFROUkV0MVZQUFBSa25pZ2lSazlFNmM1aExzeVIyVTJBcmhYcUtPMUwvck5p?=
 =?utf-8?B?WEtpZHQ2bDJwYVpycnNMNVBoTzcyd2lLYUtacnNkZWx5MElXdkxiZ2RoeWN0?=
 =?utf-8?B?TGcxM0FwZkNMKzh3STFFRjF5QUM0YkRrQmVVVmVkc2cyRmI1U0ROa0VrSVZQ?=
 =?utf-8?B?ZjN3SUN2d2tnVVNRbVQwOHArVUplTnIxbUJWRGRtcE1OSHVya2xXWnFmT1FT?=
 =?utf-8?B?blNWSjIza1c1Z3VlRE8rTERkZ3gwRDVyajlxbDJpdzBXeW9SNVAzeXRUR0hW?=
 =?utf-8?B?K2FBS2thV0lEVGQydFdvdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(7416005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b052ajBOaWRscmo3dk9US2IvcDh1RHdQUW5Ianh0U1RIL2FpeU9LYlhEOG42?=
 =?utf-8?B?bXJubTAwekh0K0o3NSt5cU94SjNaeCs1QUdJbEtpRVJVY1Q3WldHMW5HM2FJ?=
 =?utf-8?B?eU0wNHZPU0poL3kyZWxDYUU5WnVMMHVLYjhkLzZJdVprZnZmZmwyaGhZM3lw?=
 =?utf-8?B?VjZ3c1V3cUltMzFWNDdhaXRUc1dOa21TWE9qZEV1c0c5clZodDVBbStkS2R6?=
 =?utf-8?B?ekVWb0oraTg3T3FYMlVLblp3OWhrTU91YmxRTk5EZ3ozaFJKdGkwZTJLclpK?=
 =?utf-8?B?ZXhKQklRdUhBZVlrejJ2dzVLemc5MHNmTTJtaEkrZ21COTVjcjdEQVp2T3Vq?=
 =?utf-8?B?ZDEwenBjdDJxcHRhc3dzamVlZENXRFpKaGdxdkZHYVN2ZE5Xa0kreEt2dGpM?=
 =?utf-8?B?Vk15a1B5d0pmd1JrazRpdEI5dm5tK3lBeWNKc2l4M0VKZ3pPT0FQUC85dHc3?=
 =?utf-8?B?V0pId3JrZWlMS1ZXbUZEODhzT3d0eUNIb21tMkFwN1pSR2ZHSU5JZ0syMUVI?=
 =?utf-8?B?QXJtenhReTVuZVdVUDNOaWh3alpDcHg1dVNmNGhUVWxTWnFnNjJwM3VYdXhq?=
 =?utf-8?B?TGJkZEVoZjlyMzlhKzhheEJYbEE2bHkwTml1ankwcUVlSVQyWXYrVEVXWTQ4?=
 =?utf-8?B?Z1FtaXFZdHJIWHV5cGJhUEM4M2NHemNPamM1LzVVQXA4VUQyNGhWWk9rTnVT?=
 =?utf-8?B?YXl2c0tmRGxXS25KR1BxbkVDMWd4MkV2M0doZEFIR1VyeW9EN09qeXBaODhF?=
 =?utf-8?B?Tko1eHVkN3RlZittTFdkNXNEK3kzTnJXOEFoRUJGZUllUHlPaHhUMGlzZ21q?=
 =?utf-8?B?Y3NVcGpNUlM2OW5uWU9GQ1RUbjJFRGs0eU84dE9GOCs5N3duZmNrSG04SWpx?=
 =?utf-8?B?ckZMcENHV3owVjREY3FuNnNmNlhBNkpZd0F6UzFaU2lhVVNFVEFONlExK3NI?=
 =?utf-8?B?bUozcjNIbVdPT3huY3Z5Zytna0w1S3lCUUdjMUxTcEFaNEhaakdzbmF1b1Vo?=
 =?utf-8?B?NVZHOWNwejVZZWhyWmdhWmdJSVhCWTFETFRqNnA1ZGFqVWpyQnhnU1hzdis3?=
 =?utf-8?B?ZE1hbC9yTktVZXFFM05IQ0hNeE1ySjU2WWV0emhxRjJiMWdkTHcvaXhaZ1Bt?=
 =?utf-8?B?WmQ1WHdrc2UzdlJEYlZwUkkrdlMwV1d6bEdUa2IrZ0djN1I1REUzdmw0QnZD?=
 =?utf-8?B?ZmM4ZnRjeEVQRHlaU204Z3hCWUh1eFlOb1ZWc1BldlBiTGpFeFlzdzQvM2dh?=
 =?utf-8?B?OGg5aGkyd0JuN3loRmR6WjNwTC9MdVo2OU1IRExBRitsL3F0VkloQmMvMFlU?=
 =?utf-8?B?V2VyOEFXditxbkVYaVhoaTMvQSsvTXhTNHVYWlAxQStHcXVxNDhjS2djcjBX?=
 =?utf-8?B?cFpmeW5VaDNjRHFnRjNXTUpHNU9qaHJFNDVIR1Z0N1RNZ0pHVGpsU1F6QThG?=
 =?utf-8?B?TzJQV2xTaU82cDcxMlJMcnJZV25ZbFo2WEF2ZU9iQU5YdzBEb2ZKbTdjR0xI?=
 =?utf-8?B?NWFLNEhNakRYR2h2NTNPNk9DRVRZWG1CRU9PVys5VmVHOVFyK3BCOHpOOCtk?=
 =?utf-8?B?NmRTTG1BMEEwb3BLUWFjZVBkd0UvSHJhZktueDA0STVFZVFqbW9zZG45VTRD?=
 =?utf-8?B?cDdKUm5lY014TjJqSkJVZ0x2OHNhQUo5M2x0cm4vbm1BOGt1YTU5UmxhODVh?=
 =?utf-8?B?TnVDWHJSV0ZSQzhnOExZN2FrZWpkNjdOcm1aMHhCMExKSENHSlNyY1kwY3NX?=
 =?utf-8?B?TlA3U1IzQzArRFdHVEpWRXM3N0diNTBlWWcvSWNZRGg3Q0FxazdYaDd5WWdY?=
 =?utf-8?B?cnk4Zlc2bDNyMWprZzkzRFZMQXVWSmJmQmh4aDIzT0cwNkJKT0tQYlNtREpi?=
 =?utf-8?B?ZWx5MUhDM3N0TVhqN3FyZmZlcnhEZE5LTjBKNVdqZ1ZXREhvK2ludVRlYmwy?=
 =?utf-8?B?OWE1dGZkc0daQTRLVDRtREZ3SFFVMnpWUzJoOUVMSzg3RGFqallhN1RQUy8r?=
 =?utf-8?B?SkExSVBNN1NoZVAwMVpNZTVsSXBXZ1lWdTFLcU1rWkYrWEhvMGRXUXdhUmxa?=
 =?utf-8?B?V0p4bTRYbjdtQkRUUFE1ODIyclpEUEErODBsNVVMTUR3c3JDTURINE0yK3Mv?=
 =?utf-8?B?T2dlTlhUZUFYMWcrSUZpK0NxYy9QVXR3bzlkc0p1b3ZsVkl3cWVVdUpJVzBx?=
 =?utf-8?Q?Rhzade/r41iJ9TkueFJWyf0=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73926b75-5b7d-4748-f092-08dc6610fa22
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 16:50:28.4148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6HpQ7j4xLdWWVBdM45lnyVMSwXBXj5eUqaEcXYg0I6AMQcnyyDDxd+quU3B0bH53h590v/8DYoUZvMdpLLkyXgGw7JCZNixDvyeYrICWFhxdcTYYrS8F8csj26I3TcP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10230

Mule is an mcu that emulates a set of i2c devices which are reacheable
through an i2c-mux.

The emulated devices share a single i2c address with the mux itself where
the requested register is what determines which logic is executed (mux or
device):

1- The devices on the mux can be selected (mux function) by writing the
appropriate device number to an i2c config register (0xff) that is not
used by any device logic.

2- Any access to a register other than the config register will be
handled by the previously selected device.

Signed-off-by: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
---
 drivers/i2c/muxes/Kconfig        |  11 +++
 drivers/i2c/muxes/Makefile       |   1 +
 drivers/i2c/muxes/i2c-mux-mule.c | 157 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 169 insertions(+)

diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index db1b9057612a..593a20a6ac51 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -119,4 +119,15 @@ config I2C_MUX_MLXCPLD
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-mux-mlxcpld.
 
+config I2C_MUX_MULE
+	tristate "Mule I2C device multiplexer"
+	depends on OF
+	help
+	  If you say yes to this option, support will be included for a
+	  Mule I2C device multiplexer. This driver provides access to
+	  I2C devices connected on the Mule I2C mux.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i2c-mux-mule.
+
 endmenu
diff --git a/drivers/i2c/muxes/Makefile b/drivers/i2c/muxes/Makefile
index 6d9d865e8518..4b24f49515a7 100644
--- a/drivers/i2c/muxes/Makefile
+++ b/drivers/i2c/muxes/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_I2C_MUX_GPIO)	+= i2c-mux-gpio.o
 obj-$(CONFIG_I2C_MUX_GPMUX)	+= i2c-mux-gpmux.o
 obj-$(CONFIG_I2C_MUX_LTC4306)	+= i2c-mux-ltc4306.o
 obj-$(CONFIG_I2C_MUX_MLXCPLD)	+= i2c-mux-mlxcpld.o
+obj-$(CONFIG_I2C_MUX_MULE)	+= i2c-mux-mule.o
 obj-$(CONFIG_I2C_MUX_PCA9541)	+= i2c-mux-pca9541.o
 obj-$(CONFIG_I2C_MUX_PCA954x)	+= i2c-mux-pca954x.o
 obj-$(CONFIG_I2C_MUX_PINCTRL)	+= i2c-mux-pinctrl.o
diff --git a/drivers/i2c/muxes/i2c-mux-mule.c b/drivers/i2c/muxes/i2c-mux-mule.c
new file mode 100644
index 000000000000..da2a9526522e
--- /dev/null
+++ b/drivers/i2c/muxes/i2c-mux-mule.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mule I2C device multiplexer
+ *
+ * Copyright (C) 2024 Theobroma Systems Design und Consulting GmbH
+ */
+
+#include <linux/i2c-mux.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MUX_CONFIG_REG	0xff
+#define MUX_DEFAULT_DEV	0x0
+
+struct mule_i2c_reg_mux {
+	struct regmap *regmap;
+};
+
+static const struct regmap_config mule_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static const struct of_device_id mule_i2c_mux_of_match[] = {
+	{.compatible = "tsd,mule-i2c-mux",},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mule_i2c_mux_of_match);
+
+static inline int __mux_select(struct regmap *regmap, u32 dev)
+{
+	return regmap_write(regmap, MUX_CONFIG_REG, dev);
+}
+
+static int mux_select(struct i2c_mux_core *muxc, u32 dev)
+{
+	struct mule_i2c_reg_mux *mux = muxc->priv;
+
+	return __mux_select(mux->regmap, dev);
+}
+
+static int mux_deselect(struct i2c_mux_core *muxc, u32 dev)
+{
+	return mux_select(muxc, MUX_DEFAULT_DEV);
+}
+
+static void mux_remove(void *data)
+{
+	struct i2c_mux_core *muxc = data;
+
+	i2c_mux_del_adapters(muxc);
+
+	mux_deselect(muxc, MUX_DEFAULT_DEV);
+}
+
+static int mule_i2c_mux_probe(struct i2c_client *client)
+{
+	struct i2c_adapter *adap = client->adapter;
+	struct mule_i2c_reg_mux *priv;
+	struct i2c_mux_core *muxc;
+	struct device_node *dev;
+	unsigned int readback;
+	bool old_fw;
+	int ndev, ret;
+
+	/* Count devices on the mux */
+	ndev = of_get_child_count(client->dev.of_node);
+	dev_dbg(&client->dev, "%u devices on the mux\n", ndev);
+
+	muxc = i2c_mux_alloc(adap, &client->dev,
+						 ndev, sizeof(*priv),
+						 I2C_MUX_LOCKED,
+						 mux_select, mux_deselect);
+	if (!muxc)
+		return -ENOMEM;
+
+	muxc->share_addr_with_children = 1;
+	priv = i2c_mux_priv(muxc);
+
+	priv->regmap = devm_regmap_init_i2c(client, &mule_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(priv->regmap),
+							 "Failed to allocate i2c register map\n");
+
+	i2c_set_clientdata(client, muxc);
+
+	/*
+	 * Mux 0 is guaranteed to exist on all old and new mule fw.
+	 * mule fw without mux support will accept write ops to the
+	 * config register, but readback returns 0xff (register not updated).
+	 */
+	ret = mux_select(muxc, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(priv->regmap, MUX_CONFIG_REG, &readback);
+	if (ret)
+		return ret;
+
+	old_fw = (readback == 0);
+
+	ret = devm_add_action_or_reset(&client->dev, mux_remove, muxc);
+	if (ret)
+		return ret;
+
+	/* Create device adapters */
+	for_each_child_of_node(client->dev.of_node, dev) {
+		u32 reg;
+
+		ret = of_property_read_u32(dev, "reg", &reg);
+		if (ret) {
+			dev_err(&client->dev, "No reg property found for %s: %d\n",
+					of_node_full_name(dev), ret);
+			return ret;
+		}
+
+		if (!old_fw && reg != 0) {
+			dev_warn(&client->dev,
+					 "Mux %d not supported, please update Mule FW\n", reg);
+			continue;
+		}
+
+		ret = mux_select(muxc, reg);
+		if (ret) {
+			dev_warn(&client->dev,
+					 "Mux %d not supported, please update Mule FW\n", reg);
+			continue;
+		}
+
+		ret = i2c_mux_add_adapter(muxc, 0, reg, 0);
+		if (ret) {
+			dev_err(&client->dev, "Failed to add i2c mux adapter %d: %d\n", reg, ret);
+			return ret;
+		}
+	}
+
+	mux_deselect(muxc, MUX_DEFAULT_DEV);
+
+	return 0;
+}
+
+static struct i2c_driver mule_i2c_mux_driver = {
+	.driver		= {
+		.name	= "mule-i2c-mux",
+		.of_match_table = mule_i2c_mux_of_match,
+	},
+	.probe		= mule_i2c_mux_probe,
+};
+
+module_i2c_driver(mule_i2c_mux_driver);
+
+MODULE_AUTHOR("Farouk Bouabid <farouk.bouabid@theobroma-systems.com>");
+MODULE_DESCRIPTION("I2C mux driver for Mule");
+MODULE_LICENSE("GPL");

-- 
2.34.1


