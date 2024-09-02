Return-Path: <linux-i2c+bounces-6007-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D27DE968C44
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 18:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02AE61C22553
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 16:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F9721C17A;
	Mon,  2 Sep 2024 16:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="DCXg6zRw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4E52101B2;
	Mon,  2 Sep 2024 16:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725295132; cv=fail; b=ouiOJqSoqIx2EUv9vgfFT7kHSw9WmbLTZW4mlmjR4dND5DVa1klXRqFXvpvD1xZvhkC+Yjf8fz1XMA7h8aiizTROvveqrH9ZoR2zKiUm6J802qvZUfI7C+XlKJbbid4v1BmEc1Ox1KtUqqEv8NyYC4fE2slSA7XRzTlcUTatSRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725295132; c=relaxed/simple;
	bh=S5gfqC7sX+8XZxAdQxPuq5dXYPddWbTQ4lHWPmSun3M=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HWqt7H2EmjIToaEzhDcB6teSbur8Sy9CjnvVoZ+3etAxTxVJd7pRCmhn3yzFsQ+LEd/DMmLIyA+KTcWT7q9R8LZdxEbHrHqiUWBMkvwHot7xoEIuIYTIJlmKRWPeHk6Jui2EeqwKUDTyCJ+9I8L1/33gxbK/qFEhRuixkYdMNE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=DCXg6zRw; arc=fail smtp.client-ip=40.107.21.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tnjFQiGm1C8MbpM64Jotv1EtcwV3e0gRcGKTh/e9oa4QjJs389JiFDKlhjGJJe2IGMUAbNJNtVc4HuKZkukN5XaJhonvo4PZqZABgQzyXjjwmzd++7HqeJaYhwJqFpGuh4aJwsYIjXXp46BRlx/TgLJQrzVkOMcJmxbce1T6Fv1OQnz/VIim9/qc9e6d9uxAuT5dPi/8gG8ZSFcMpyCo96Ock8zrOdUY3CiyyOtG+y2BABL6dPOtKn4+NkOTyXrBqMRILhg2MnQVcEWG4moWzZkRmt6jP6BptfonVbcpCi7zoSruzJKRAZSgGsSShGLTRPFyZl/+lATIfW1pT6KEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1fn9iDRBSjSdXhY0cbjh9VmUKMYVtZKCtUPqs0YcAM=;
 b=bERGBYcKll2oxiuVChYl5r4NVU4ZBUVHPzGGapFyaTc55DB2FURrMqFRdKMFii9KnORu3NfNCu5Vso2icBPsJqwK6nJNOoASpQLg3G6dqDL4syv9G83V2+Vdn00a83BInraWQZnJSI3NXx2qf0CTA6wBngUuxfNP4tqzjvBwssz9En2hMaz++is/WYmZgUYix9NMWtLHILS1e/zjXrQtmhi172RiOh+526xrmMrCfnbGwbUCuEqEd/PdPydpsux2PW70T0rW1NmYpmxJJMZHEpuSOD+QNFC1O0CEASFFFMkMmHJOOHUch7v8RwdcqVorP52P7S0JFBeI9d9qKzIlng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1fn9iDRBSjSdXhY0cbjh9VmUKMYVtZKCtUPqs0YcAM=;
 b=DCXg6zRwunNFlcL4zzRQ/NZp372LGbSbR6ccZMdoQandToIu8CZylbG6Q/EP4fkITIJEcMlBssrmvjAeK137WfBZMCB9uMYlcozNdfISMn9HM2ixW/PHq8y40y0LA+VHOa4hKUf7BaPvPBdfWTyoTvbSk9zHlc6rQv2sNN59CEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by DB9PR04MB9645.eurprd04.prod.outlook.com (2603:10a6:10:309::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 16:38:39 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%6]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 16:38:39 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 02 Sep 2024 18:38:21 +0200
Subject: [PATCH v7 8/8] arm64: dts: rockchip: add tsd,mule-i2c-mux on
 px30-ringneck
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-dev-mule-i2c-mux-v7-8-bf7b8f5385ed@cherry.de>
References: <20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de>
In-Reply-To: <20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de>
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
X-Mailer: b4 0.15-dev-99b12
X-ClientProxiedBy: VI1PR0502CA0001.eurprd05.prod.outlook.com
 (2603:10a6:803:1::14) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|DB9PR04MB9645:EE_
X-MS-Office365-Filtering-Correlation-Id: 49b24db9-8de2-4bc9-1491-08dccb6db320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elFIRThHWXRCZ2lnaXl3Q3FKSGZBY2J0R01WcjhqV0pKTTBPTHZJWHFxMlRK?=
 =?utf-8?B?Vy9WTjBBZkZrdlQ4QmF1aGhQcHltVUkxcHVFQnJXSkl1YklJVlNUbExFNWFR?=
 =?utf-8?B?d2piZVFkU2tDQmdod0ltMmU1dHFtaGxOVEM0cEFKcSsvTjYrSVpVbEEzNjFO?=
 =?utf-8?B?MjcwVEpGM3BxUlQwT3I5d09XQTNjeFBvYXBvZUJaTUJhVTJKejFna0FnQWRU?=
 =?utf-8?B?a1poRkRPOVJaejR1bkEzMEltemNRNzBHczN0dTVENmxVSnVDZVR0dlEzaWRZ?=
 =?utf-8?B?L0lOUGYzYVpvbDk5dFZjVnNLS1lJeCtUQXBTczVVTHJrdDZaekovRC9TMzdw?=
 =?utf-8?B?LzBNN3YyK2pSTmgvQWozY3NMeGcxZWZWOXNsWU5YOTZMQWRpTzQ2ZjhCazND?=
 =?utf-8?B?OVR6Ti9yRlVINytzRmprcWIzcXhNdWg3VEpNTXAyY2JudGtoMURtQmNaUVdK?=
 =?utf-8?B?NjdBa1p4WHRESUx3eDVWUFlod3NRUk5sMnpTcEt6ZisyclAxWFNpNTJpbHlL?=
 =?utf-8?B?MkovNVpRVWJpVUpRUXhIWS9SdUVZY2hoV1F6MUpPZENHdVNadjIydEc5bzlO?=
 =?utf-8?B?UmkzMEF4YjM5eUk0N3ljSUE3Y3ZKc0NBcWwvMWRCaU1ZMVcrbkY1THYwWCtK?=
 =?utf-8?B?bjVBWXNiakpFdk9nemNJck5TenpTSkxtQkJkek1CQmd3UXRZV0RjbW9KMG1t?=
 =?utf-8?B?OVRsa1BEZlNMbm9MZk8wbWJvWis2a1N5dG1weE1QeWdYWmJYMWxQaXROTnRv?=
 =?utf-8?B?ZVlWNGNndGFmazk4ZEZISm0wUXBscEJxYXNqSG9abThQZkZCUkdBNWM2R0c5?=
 =?utf-8?B?elhFN25KM3lUeDF0bzhNYWIyWWdVTnpKQ1VWbEcvRHdteWluQytMTDNHTTBM?=
 =?utf-8?B?dGFqTmRuODF3U1pqZTNrT0VkMjBLaS9TK2x0UEJaUlA1aUE3dVozcm5zRzZt?=
 =?utf-8?B?RHVndGhYMDFDcjRxcEpDMm9XUkRpenFuSUdlbXdJWGxTN0lTSmsrVDd1dTNm?=
 =?utf-8?B?anNNeEVua05ORmpPbC8rYmwra3JodTlpTElHT1RlcUcxQU9RWCtES092R0Vl?=
 =?utf-8?B?S2NZMW5NM0JlUUJ3MkU1RzV1RGdkSm9IU3BYQkt0anBZeXZ2bHBYNUtISzR3?=
 =?utf-8?B?MDRYbjI4ZndpRFFsa2ZLMVdFMllLQ2F0bjcvWVBwZ1ViZUZrR3d3VjUzbzlw?=
 =?utf-8?B?bU5CMks2QjhXeUxRUmJDeENkVmhrd2VkNnJJREl1QUNMakxiTXhFdUFoQzlZ?=
 =?utf-8?B?NVovb1pyemovVlBTb0NEbXVqMzc2eElOMmI0VEhaMU1PMTcxb2tnTTlYRmJD?=
 =?utf-8?B?NTBOd01hckZtNEdvOGF0ZGdOOWVwRTUxdnZjbFdwYUJIYjVLMzJhVUZzeVRJ?=
 =?utf-8?B?Um5ORnJzYWFQYjh3YUYwWFFqams0d1h1bVN6Z3d6MHFNekl6Wm92dVYwTnE0?=
 =?utf-8?B?T2M2MlJuVk1qSm1HNkNlYU9PT2xUZ2NIeFdsTWlPV21nWk01VG91cGxIYzVl?=
 =?utf-8?B?blVzdFdqdkpYMno0ZDJXekF6UjNTYjZhTVZYMnRFejBIcnV0SGtndlJQQ3JF?=
 =?utf-8?B?NHl2bmN0bUVKR21td052YlNMRC8wNE1pSmdJMzhIaVlHdEZFdFpkYVNONGJ0?=
 =?utf-8?B?ZmNxSUNVWE1oWm52QUVleU1mZDEvM3Nxa1NheER6NEtESi9QcFNXcFVNUjk3?=
 =?utf-8?B?bFVnZFU2Z2p6b0pxZUhoVmlHZ05PMGdWbWpKc1dVazgyVUNNSGw1eFZ4cEVY?=
 =?utf-8?B?QkUxRnNpSVhqMmZ0R1llcThJVkg3TElwR2hsbllhQmJ2Rm01M3dVMXJ2YTZh?=
 =?utf-8?B?UDJuand2Rjl6Z2NpaG5BU0lPd2FjU3JxRTdvVHBXN2xPamVjOG4zOVdsOUhQ?=
 =?utf-8?B?OUM1S0g2VnZFdWN5Ync1T2xUWjJJZzEyVWFQamgrdmkvaE5CMzZWY2x4L3Bu?=
 =?utf-8?Q?t+yrHoe/Mec=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L05jajFMSnpDZnRHbHU2YnRlWnkvT3FDTGZ3NFFQanJ6YkZPeHppdUk1Tkhz?=
 =?utf-8?B?eU81bTYycHluc3o2ZlJYQ1gwRHJqYXI0SS8yNHZuNFBqT0xGVmhyQlJJTmdD?=
 =?utf-8?B?Y1I4UHFFcGRXcFlaL0UyZVEvbVJVUU91a09ieFBGUkhhRUcwRk5wMHYzV3ov?=
 =?utf-8?B?VzgvRzROUktNWHJib0NQUElyTUpqYXZCRWlHaU9rcHR1SHY2bU1RUVN6T3Bj?=
 =?utf-8?B?bGMzVDB1UWxTeHRxbTE5aW9Pa1lkaCtoZzNya2FHZXc0RkhmNXZkNGVFcGlH?=
 =?utf-8?B?ckFWTkMybXdna0JBUXV3U1dBQjQxQzdoZEgweFNMSWdURmJTKzhHaC9uOTVP?=
 =?utf-8?B?dk1KbDBiMHN5SkszTWhiY2hWZmUyNzJUVlY0dG0venJuK2FLSllCQk5RandH?=
 =?utf-8?B?RHdFamVQSElZWEF6M0hhSjFrWlg0WkVQaTRJekhIbUU3V0JtR0M2cmllSXc5?=
 =?utf-8?B?RHQ1OUxyOG1vcFZTRHBUZUtaa01ocVFNd2hhNHg5MnZsMElFcGdMOVpkVTF3?=
 =?utf-8?B?L3l2YVhDazJJR0FHRWpOMlEyNFhnbzZEQ2F4UjFyWmtCcXptdldRM3E3Ukl4?=
 =?utf-8?B?c0YxOFp1WEdmeXkxb25UTmVNRDYyVHlsV1VXZHo0V3RXbEJWbVFZQ2ltcXpF?=
 =?utf-8?B?dDNuakRtZUdvR2Q3STNnaThaM0lYTk10NFBEbXBEWHh2UEM5Sm5UOWJFWGRL?=
 =?utf-8?B?YkJFMERlTHNlMXN3QmZhRU00UHdKaTErTzZ2VDNSZTdrNEh0SjRoVFdOTGNu?=
 =?utf-8?B?SjFPbUd5bjdmV0MybXNBOWpMcVNMVS8xVDJaQ1dRL0NScHZrR3F4MzRYa2N3?=
 =?utf-8?B?OERTZWRKdGFJdTNOaExLK29iNWhDbnQ2RHg4Y2ZnemNxMnU5bUg4dnFwOWkz?=
 =?utf-8?B?RklyUi9wTnd5QytPZ2F0UjZycGJtcHZ1ZlFtS21ZUGJvTHFCbHFpeTB5NTlX?=
 =?utf-8?B?aGhtM3ZOU0w3ZDJ2RURFckdSd1FCWDN3Nm85d2VIamw0NG55RlljUFdTNHFy?=
 =?utf-8?B?T1hiTnJQWHIwVGRRWFFmSmNYT0huRVc4eENjVVpGcEx6S1VmdXFTNzBjeVBS?=
 =?utf-8?B?bnZmVCtJMVdnZzNlbXdYaDhZY1JKbUJrRFRGM0plSnJSL0NoVnVtM0ZSN1VK?=
 =?utf-8?B?Ukt2dk54YlNwUHNIOElnSmlIOVBIMnp4TnJhSTc3a3poSHo4NGFaaEdMTHZN?=
 =?utf-8?B?Qk9GcE50THh0R3hZbnQvNGxGLzVRbEllWldYWm1YdEtaWnpVL2FUZVkzNmd3?=
 =?utf-8?B?b0hyRFpDVjBDcG81empNK3VQWlFOS1NBdXdyYlVQcTZ0OXJNM2p4LzllYWlF?=
 =?utf-8?B?bmE5d2l4b3JqbGtEUlRSRVErb1ZEU3NYZU1MR0ZleStQTlNnbEJMcU9DL0dh?=
 =?utf-8?B?TlZYSEtWU2Vvb2JleTNNckxHY3RIMEtMVFNHckpaMEhlaGlsejVPcndmbXNS?=
 =?utf-8?B?UXdDMGR1ZVdReFNOTDJQQ3UxZkZCckkrY2V4V1RZVXZ5VlhUaEJ5c2pYd2pD?=
 =?utf-8?B?NVlidmVncnZJcDVDN2VmMWJZK2VzdUU1d01yTTNwMXRCL0JYNW5td1EwUzhu?=
 =?utf-8?B?bVhEUCtCMnZiQjdmMGcvbUk2QWhQWXk1M05sY3BvbmN2KzRsOC84dTROdFgw?=
 =?utf-8?B?QTBGR1FWS29iN05Xbi82V1JlaG9kQTlvb3Fxd1JFTm5Md3oxT3BQeHBXM0Rk?=
 =?utf-8?B?NjhBbURzSU4xRU5kWlNOSDhXZkFCcjZFdnl1d2Z4Z2ZxemFreTBxdmZsTExw?=
 =?utf-8?B?V3hLbnd5MG1vblAwZmFzaFJWbDAvYWtpd2NFcjRCcUJxTDdIcDJ1V0hYNzJ2?=
 =?utf-8?B?SmJINkE4aWNvbENCekNsTkZ6cWYyNmM2WDF4S2JUbG1nNnhQdWxmVFhkbk1t?=
 =?utf-8?B?bCtobkJvcys4N05VNk5vZGxEVTVQOFhDcG81b1VyNTY3RENiSS8yOHFRbnVL?=
 =?utf-8?B?ckE0aUJBRUZubkFjVXl0RlJGNVBqK1pYdFlzKzJiNEh1eFpJQlBKdS91ZjVu?=
 =?utf-8?B?ZVRUakVUVUx4Mit4V1U4VFFqNWU2WkVEckhLVjJGSDgwQ0hoWUgwczVJMlBT?=
 =?utf-8?B?aW16bTk0ZWpIVlFTMmpTT3NWTERPR1lVdHNLWEZtTDc4V3pHb3hSTmhJblRS?=
 =?utf-8?B?N2ZuSU1nNW9kaStXSXBhRTBJU2liaFMyekR5VzlrUWNBTnNNcThTdUJZWGg4?=
 =?utf-8?B?NVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b24db9-8de2-4bc9-1491-08dccb6db320
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 16:38:39.7782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CU1m6xkVGtDKkIzxxI4RZV09TPvc4D1ru/vW8ZM3rumc64GLO/8u5OHwV4fNpw009zaro1A5yLHSivhBEdjHyafyVOpGAkiZvzu8XKR3scg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9645

Add the tsd,mule-i2c-mux alongside with the amc6821 (tsd,mule) and isl1208
as a default device on the mux.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---

Notes:
    Merge after patches 1,2,3,4

 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
index bb1aea82e666..a683ed3e2fce 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
@@ -9,6 +9,7 @@
 
 / {
 	aliases {
+		i2c10 = &i2c10;
 		mmc0 = &emmc;
 		mmc1 = &sdio;
 		rtc0 = &rtc_twi;
@@ -292,14 +293,25 @@ &i2c1 {
 	clock-frequency = <400000>;
 
 	fan: fan@18 {
-		compatible = "ti,amc6821";
+		compatible = "tsd,mule", "ti,amc6821";
 		reg = <0x18>;
-		#cooling-cells = <2>;
-	};
 
-	rtc_twi: rtc@6f {
-		compatible = "isil,isl1208";
-		reg = <0x6f>;
+		i2c-mux {
+			compatible = "tsd,mule-i2c-mux";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c10: i2c@0 {
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rtc_twi: rtc@6f {
+					compatible = "isil,isl1208";
+					reg = <0x6f>;
+				};
+			};
+		};
 	};
 };
 

-- 
2.34.1


