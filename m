Return-Path: <linux-i2c+bounces-3971-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5665C903AFD
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 13:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86175B240E0
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 11:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A2D17B505;
	Tue, 11 Jun 2024 11:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="C42jyMoD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2097.outbound.protection.outlook.com [40.107.22.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D16A176237;
	Tue, 11 Jun 2024 11:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718106276; cv=fail; b=tdR5hGHevioiaDIZ1DGq5CDxVLyJkkt4Fz+9syBjwxrhb3P8MyNKfRC4tn02IuR3tjklTV1+Zq5UT170+6mM0wOPsvIzxwMZU6qoZIspfXcrsO93t6aXljRQU/OlPPEwmD5zjHZQ3jpaDJ6Q2/v6LMK8sqK/aH7rLeL5laS1I0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718106276; c=relaxed/simple;
	bh=2R06mqreOquLzt8WXrDn0zBOcXUBRQ2JxOyMrySrSaw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uRijmx6LEjfuI6v9MNTBAn7FsX51LrZikM5Q5C+rSzC3iA+SHHhso2g9gcnNrTWcWzP3LyaFj9Era6n2IpzVoG5eWvb96GL2uVfo15oagWNtT2/dm9vniU4Q5g/7SPbk9eQz9FDuxr7j6OftQZErGdgFbiw4Kt13YqMQrXEmb18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=C42jyMoD; arc=fail smtp.client-ip=40.107.22.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvOqduhUDSizteXrGXuBHLsi9Q1+fDAd+wdagQnEYBn4grdzH3CMHmIj8dNlWSRuB5iH7tIZ2X4mTPJwW+jLIY+v3utmNrpI2OIupSq4SNBLiRmmi/H9rAGKd2qv5/9AMsfCxzB86MydpKK8Oln+mQla+MMyb9WnZgqFUdX1ced+I6IqGDX59hWCwqRbKpgDDoczh6YSPoXqVyk105ZVdff2/kOwaWx2tFphYTE0BHDy2BF9bLVDcLht81Ng5oZjZW33h/z/mY4R7Murevtg4QZaiV6FS4h94MBi3AABUe/kuGjtFkpHNgEd0YPAwPF8wuVC/fyt+nkQwkYGxBEOXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8nQRXbGMGZUa0As7hZ1lJZ03AMaE/ijdus/QUcrsfk=;
 b=kd7CeoBCGHvRJEvVhMHQHdaLH5CIGmEUpwNLOuhsTklfoJv6C//Wnf9PreEHZ58TGQN+HjKwHRtAysP0I6G5H25q3rSDk50eSndsb9S4v5caC6+N0N+Hceif5JqvoCYHb/dDuSLhAJNMkGNn+NXFmT5YewBHZv1Iku1aAagdvN53KxeMh5ITSET+4BM8UVSjuC3whJTertJzddTfASCrKR1g0Bn3z9rRK0tuZcACfA+hZzqiTTI91UD3jlxGdA9Tcj4Z6bpZK8sZbFeQrozoJPvllwR3ssO27iQBVJi1VI3mdmVQxkzRReaMv4iV4gp2QXk1QZ/BIyPwaUbd549Pmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8nQRXbGMGZUa0As7hZ1lJZ03AMaE/ijdus/QUcrsfk=;
 b=C42jyMoDCfuApuOY+wxYg2tJheGD83ggtxOTAYtfwYOxgg85jP5y4cz7m51s5rx7dZVoAoSGJBW9FY5yeFNWbctOl6CLyzPFFmYpA9wd9JzaF5lkiHHb38hMM6mX/vWAZNy1lTjpuoB74IXNwKi6A4pn2J5G2Xr4ojOyrGGqeo0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by GVXPR04MB10301.eurprd04.prod.outlook.com (2603:10a6:150:1dd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 11:44:28 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6%5]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 11:44:28 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Tue, 11 Jun 2024 13:43:53 +0200
Subject: [PATCH v3 2/7] dt-bindings: i2c: mux: mule: add dt-bindings for
 mule i2c multiplexer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240611-dev-mule-i2c-mux-v3-2-08d26a28e001@cherry.de>
References: <20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de>
In-Reply-To: <20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.13.0
X-ClientProxiedBy: VI1PR0902CA0050.eurprd09.prod.outlook.com
 (2603:10a6:802:1::39) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|GVXPR04MB10301:EE_
X-MS-Office365-Filtering-Correlation-Id: 491f2924-d347-4fd8-bbc4-08dc8a0bd9e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|1800799015|376005|7416005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dk5hSFA5eTFsZElGNE9ScWhJbHRMTzBCN3RHRURuQXVaSGthN285UnVzc01W?=
 =?utf-8?B?UnpuTjh6a2ZQZzBLMFhKQ2xtY0JGY0Z2QVBDS3VkQnM3NUdxZ2VxMmthMXJQ?=
 =?utf-8?B?andoMmFYbUZiOFVVM1FWSlIxK2xQMDhyR3Ywem9iSU9OSmFYVU9Kbnl4cVI3?=
 =?utf-8?B?QllsQkgvVTJnTVU1ZWx5SXI3MU9xY1FmbWo0NmlwSE4xQkZteGV5UHdiK0cx?=
 =?utf-8?B?WkRMQVBPRGI3VE5hTDFjTFM2bTNlRXk1R293Z1VlREZLU1RrM3g0b25icHRC?=
 =?utf-8?B?cysyZlBQbHU0dzJBOVFBejYrY3oxKy9pNmF4U2J5QmdxWHJpR2txcUFHd0xn?=
 =?utf-8?B?ay9EVzUrTTZFcFVNb01hTFB6dzdzckhiOEZuVVkySitLaGEyUy9WY05mRGFq?=
 =?utf-8?B?MDJXcmhlL2Zkdi93VkNtTk5kREZtREoxK2pMQkhQODQrWmNEOG1NMEhmeDEz?=
 =?utf-8?B?dk96WGtTUm1RMVZ4Tk1pemF1TDdEZGJkWDdFajJvTTNLOUdTVzVSd3pqejhw?=
 =?utf-8?B?Z0kzZnF0K0JlNGNQOVFpazVYNDRpcHRMR0xxUjIvRVhtQ295TGg3OWxRMWxI?=
 =?utf-8?B?YWlRZGdwM200RlMyWW43K3ZQUTROOWR5YzVKMnN5dWJ0MXgrT0taaXVXZDZh?=
 =?utf-8?B?ckRuYkpGK2h4OEVxVjhneVFQdzVPQXl0ek90aGhkTVZtV09QeWxmT0xlZ3RY?=
 =?utf-8?B?Rmt2eEU3SXRPd0lqbzRnRVJpUXlNbHZZbEs5NTdwWVZJelZFQ2YzaWVXTk5i?=
 =?utf-8?B?RGFCeUQ0TkpOR0VvMUVMcFdtOEpUTjZYWHJsSzhQRnpJZ1ZYd2ZGMWQ2bmR3?=
 =?utf-8?B?NDZjRjFqNnloMHVDa3FvU28vZkJlaDV0bTh1eVJHcEFlTUs2V0drTkpYVmRt?=
 =?utf-8?B?U0lnTUZBaDhkMmJXeElIRXFRd2dSVlI4b0oxdUpNV3phUk5TY2JxaFN4aTFJ?=
 =?utf-8?B?RU1QZXV2YkU5bHRaRnNSUXlnQXZENk0yTmxWMWU0aHl4R2xEcXdvdGQ2SFdx?=
 =?utf-8?B?d1JVd01mNmhuR1RzdC9TbS85Z3UwYnRVdnZaZ0pzVXljaGp5OHE5dE9NU09x?=
 =?utf-8?B?NFNDV0lPeG9BdzlTb29uUmh2b0ZyblAvakNGRytXOC9ZNzBiTytkU2VwODUz?=
 =?utf-8?B?QmpGaXVtUTRBSEFJbHBBTUNPZ3FvYndBMVVqM3hXRFlsODhhek9aWThZVE13?=
 =?utf-8?B?bHdydTd3d0xWcEJvMVlGU2lDaUUrQ1diWXAvdkNWblJyWmRzMVd4RTB2Q2V1?=
 =?utf-8?B?dlozQzRCNzJhdXpETHhCTWIyeUQxVGRDTVB2VUdaVWpEL29FQ2dDMmdLeWN2?=
 =?utf-8?B?UU4xZ21PUm5LaVg2allwNURvMDBQKzUzT2dxV09kMTJqQ2VZZVJCcUVycVFo?=
 =?utf-8?B?TVRyMmVvR2Fub25LaFJNT3RNMFZEU0NSVng0TmJIU3F0dERRVE9XZS9EVDlz?=
 =?utf-8?B?alVyTThNY2lQL3FkRWZsNE1OR0VTNEE4bDFSc2RDZVBVK2Zwd2E5UjlkdWhw?=
 =?utf-8?B?VzB3NVdGVW9pOXFMOTFObjRmQjRReHI5ZW52VjdTTmNNNCtmenRyaVg2SGlo?=
 =?utf-8?B?bXZYVnN6MVJhbUpZelh3ekdNZnZwcVRqNzNqbGkzbmsxTGFiK1BabFZ2RkxN?=
 =?utf-8?B?ZkYyczM1SmJLSXIxNG5QTGhuNnE0ekwzVSs2QnVYYzVPNUNBS3U5OEZCMStC?=
 =?utf-8?B?UVQwSVdFdXoyR0lqaWVBN0JVMkZ6UmwwRTdLc1VQNHBBYWxMQ0tEZENBSEVm?=
 =?utf-8?Q?4qSNkgkhMcGTtGJqSJseC/Cmmcn89UMY8C/Nyjj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(7416005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU9IdVEycHpjYmxRTDNZQy9FNStIcHlzeVp6bDVwdTlxNVVvSUNGNUp3QlB2?=
 =?utf-8?B?a0tvUXRVM2RqOTZ5WDNhenpYUGloYXl2UlJhTUttaXUycENwV01NOEs3bGhB?=
 =?utf-8?B?L1lCSUVSZ05TT3MzK1F1aDNhaFQ5ZGxJSWkyZnlMVTFNOTFveVhDM1hGaGlQ?=
 =?utf-8?B?SWlEZERGMmlESEwyRVBTbVR6N3VJdWlMQ0JXK3pOQzFtK3JIOC9OTmVnZDRx?=
 =?utf-8?B?eGFSeWlZd0t6Zi9mcW5DMUxQZHRNdENGQkZiVWQ0a0R6MklUVmdxaXNOZFQy?=
 =?utf-8?B?a0llWG1CTGs0V0MzSk1wblp3WnpYNmNqcnNSanRWd0xIS24xUWVqakVHak81?=
 =?utf-8?B?RmVtT1M1ck9sY25MS1V2ZTZnNVV2MlJuaFpuR3BleUUxdmdHRGhDbVJSQ3Jq?=
 =?utf-8?B?dm1HTFlEaWg5RXFWN2J1dlJCVVFKZ1dNei9UQkZ3dmVhNkhlQk5LYXdZdTRr?=
 =?utf-8?B?bjlNRFdDSnFmeUZibUdaeTIyUnZnekhrTS9MVndzQ0hCNWVheXZEQWJSRDIw?=
 =?utf-8?B?Z290RmZoNmdVbW5zYzdDc0IwdHh3L09CcnUwSFhvZ3d1MW1Hbk1aR2UzY2Z4?=
 =?utf-8?B?M2NPS0tZckVRTjZCdXBHTXJvcExuS2t4dU9CVUFNS00zR1dCVHdiTFFYT3o2?=
 =?utf-8?B?cDF3ZW1nZ0ZSNHdIeXRvVFVTK2I1YUVsUnlMRkRJV1hkL0JWQ016NVNBYitP?=
 =?utf-8?B?SytZcHREbEdjK3UrcWRpNUQvbUd0eS8vbW5UQ2lURGpSNkdNRjg0NWhhZkRu?=
 =?utf-8?B?RHhvRUp5dU1BNmNqWG42TkhUbU94RkVtc0Q4OWltUG4wdUk3Z2dUOTN5MjJD?=
 =?utf-8?B?MjZuWmZpY2VpK1hqSFlMQmJlU2sxcnB4Z0RzejVHWEk5Vkd5OHljdkNZUXZ4?=
 =?utf-8?B?TjFSQndnTGQ0NnpYTis0K0ZxakJ6aEpVUThZcDY0NlJsdmJMMFJmOVpOWTVy?=
 =?utf-8?B?cjRRVk5tUitqbGd4aklpUFQyczkvVFdFVGxPU3Z2ekxvOGlBbHBwN1pYYVdZ?=
 =?utf-8?B?RHRsdkdPZEhQbENOanpZUVdxdGo2eVlwVVRBSUV4OGhVZTVTa2FaSmMrRjA2?=
 =?utf-8?B?RXhsR0c3RzQ3SjVzaUQzeHBhYXd3ZmVMUHRzdWZ3ZG1abnFFYzk0cDYzaTRi?=
 =?utf-8?B?dFdvUjlpQlYycnd6RHRnYlk3M1pzOTZyT1BBUDN0MllRTHpGL0w2YkljOExq?=
 =?utf-8?B?TXFEUnp3emNWSmRrY04yWnVBSTlwNXpaUkxvS2lmb21qbTNSNCt3QVZ0cHFB?=
 =?utf-8?B?TldMOEVQUWlCQUlUbHdPcDFJMWxQZmdIM3Bpd0pzVHhrT1NxNW5KL0xDOSsr?=
 =?utf-8?B?cndCWmJUSW9lcUFKNm9xVVpHdDJGcG5MdUp4THB2K001dnZkc1AwcUdGeVE3?=
 =?utf-8?B?Y2YzNUlwbnF4V1N1djF0ZEhJQjJTa09TQ3VRZDd3Q3hiOXpCOVpNcFJSWTdD?=
 =?utf-8?B?QjBtTEtHQ2p1dVczOFd1SDNBRTVqUTZzRk5DQTlReWZvOGUzTytRc3JzM2Ri?=
 =?utf-8?B?OUJHd1ZIb3l1UVp2L0UvNFBPOGdLY3dPU2s2dlg2MGVTTU1EcVR1S2FpRFhY?=
 =?utf-8?B?cS9KbFNyL2N5d3BDb0NyQ0RvaUlIeFp6Znd5ak91Ui9CVHFpWGZ1ZVpxd2Rt?=
 =?utf-8?B?TE1DeWpWNGtwbW0zVUdyZjZmUkZTNU93WVBYNmd4RUJiSVlicGVORGdhK2to?=
 =?utf-8?B?blNtaDBrTmJ6ZHJIVmw2V1NpcWVCakwveUpEMHlkM1B4ckhpeGNRbmtjanZL?=
 =?utf-8?B?b0FTazhPUHVCN0x4UVlFSDA0d0JrNHJpQnBwOXVRR05Qd3BaYU8yZ2J4UTBM?=
 =?utf-8?B?RkMwajFYR3M0bEQxb1NFZkVSNFp5RTl4Vm9Fd3RSa0tGVDF3Z2pDZ1ZRNVVN?=
 =?utf-8?B?YzFiWWJkMU9Fb29CdVF5VVhrMStCN3AxWkx6UkhHSjBLZzVOc3FJMVQ1N20y?=
 =?utf-8?B?ZnBFLzdyeHZ1WTgwR3d3V1hzNFNIN0Ntd1dCVSs5V0lCT2Q0RTFyd254WVZ6?=
 =?utf-8?B?U2w5UU1SU3YyVFpEMitwaXoybDJXcS9jcVhzc1lib3JwWnA3b3RYd2hKYUxs?=
 =?utf-8?B?Sk9hUGtSUHBISUE4enR2eUtPT0RJdU9ISlk5ZUR3TFZtcnJObTFyT0NueFB1?=
 =?utf-8?B?TFpTRFpDM0tyTllxMUttYXpQZHJiV0FPOFJmUWVENUpWRjdobUtSdCtsT1Ew?=
 =?utf-8?B?Q0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 491f2924-d347-4fd8-bbc4-08dc8a0bd9e3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 11:44:28.7439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G672EwOK+6X6Eay1FaIUQs/1GAqewLpU6bNo90eK+G99ker+ZUdWPlwMQhAFigMHj+KTse+qkNlEtph4FxeYh59On9XY3dI2qBWSs32R9H8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10301

Mule is an MCU that emulates a set of I2C devices which are reachable
through an I2C-mux.

The emulated devices share a single I2C address with the mux itself
where the requested register is what determines which logic is executed
(mux logic or device logic).

Add support for the Mule I2C multiplexer bindings.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 .../devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml b/Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml
new file mode 100644
index 000000000000..b7bb13549027
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/tsd,mule-i2c-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mule I2C multiplexer
+
+maintainers:
+  - Farouk Bouabid <farouk.bouabid@cherry.de>
+  - Quentin Schulz <quentin.schulz@cherry.de>
+
+description: |
+  Mule is an MCU that emulates a set of I2C devices which are reachable
+  through an I2C-mux.
+
+  The emulated devices share a single I2C address with the mux itself
+  where the requested register is what determines which logic is executed
+  (mux logic or device logic)
+
+      +--------------------------------------------------+
+      | Mule                                             |
+      |    +---------------+                             |
+  ------+->|Config register|----+                        |
+      | |  +---------------+    |                        |
+      | |                       V_                       |
+      | |                      |  \          +--------+  |
+      | |                      |   \-------->| dev #0 |  |
+      | |                      |   |         +--------+  |
+      | |                      | M |-------->| dev #1 |  |
+      | +--------------------->| U |         +--------+  |
+      |                        | X |-------->| dev #2 |  |
+      |                        |   |         +--------+  |
+      |                        |   /-------->| dev #3 |  |
+      |                        |__/          +--------+  |
+      +--------------------------------------------------+
+
+
+allOf:
+  - $ref: /schemas/i2c/i2c-mux.yaml#
+
+properties:
+  compatible:
+    const: tsd,mule-i2c-mux
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        i2c-mux@18 {
+            compatible = "tsd,mule-i2c-mux";
+            reg = <0x18>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            i2c@0 {
+                reg = <0x0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                fan: fan@18 {
+                  compatible = "ti,amc6821";
+                  reg = <0x18>;
+                  #cooling-cells = <2>;
+                };
+            };
+        };
+    };
+...

-- 
2.34.1


