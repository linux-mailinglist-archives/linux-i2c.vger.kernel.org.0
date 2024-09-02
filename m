Return-Path: <linux-i2c+bounces-6000-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C078A968C1F
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 18:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FF241F2294D
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 16:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984BC1AB6DD;
	Mon,  2 Sep 2024 16:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="DeATiyKY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063F01A3026;
	Mon,  2 Sep 2024 16:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725295124; cv=fail; b=F3L9TAII8s0GOinyxmpHORzc/mXRVqhOFPPch2WQzR9Gku9CqWIxYkImUqonT6WwiBxV0itUqi+V6NuloSfoxxfk1e7Nuc0JXBMCqBPZ6PfNQ7DP+GdmLDwXVI1dPu0jCUUGUkiNvsxQMb2AfKi9NGXqq3IQNX/uaS4CR4hosdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725295124; c=relaxed/simple;
	bh=fC7wtRjMw2WUSRvtwur4bVVqzmDSHraDrnKTddTLH2E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XCvSpG3OwjjtwJrFZ8roIaL92mVN5Fhhbfp1tBmHDUqxoetHf9ZdPKZZ/0zek6ok1mUmXlxJJ9LBRgsNo9YPBQMyi8V56GzunTAzd0r7t6KPPhNDap+WpS1L3UGtV3SK8grIKjzaCc6CSYMf4lSFYOkNCZBCQgsEeamW5Gy0g24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=DeATiyKY; arc=fail smtp.client-ip=40.107.20.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/Dh5RV+5nJF8BXFSx4h5BMbjF1bAas0LVw5W0LczmA/SBJTO+j1+jmIf/DRP7W2vRoCHPXmE3M1/nUO1XIkuAna8uswVbq0E/FrJC69TxckDdp892bgTEG/VNEI2hXzA77Pv6ub/18fg9AgecNPZ1ALSCZXQHc3monzro7vlCQb4vQmnxDjjBWIYh9hbQfmPscwDJYmZyxf6GGXuUjCL6GgBJEsZkO9F7ECaK0LJ3YhvQlcu9h//6ivv3UZ3karZU1/eyIiMw9gFPW6/N0Ha+rWTdeoZ7GQdTD+K3MvD2qCZeqWBhmZJJnKsGjvJaJSXuYgim5Zf2bF2gRs8U9JUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcCuFOjTGlWzlp1gGW8rLBBx1JsJ8UOIW0H4v78wFv0=;
 b=gz5NeNChUoMKXgzg93I1pFPKj+R50UtKml1K1aWMRBKzzO6p4hxJCRxIS3Vk0rZjCdIGlkUMFTL4FdIX0F5NBKZ5cctVRwlazwbBDop9lMnqTxAYIlRVUPDrAhVlipQDtsYGfaRiZHR+I6l7IysvSmbGQ1aI8PuSYc9lf7xGkktJhfmvcLnTl0UV7yXqJ4dMoDswaaDhCs/GIbxunyOBdZS8GuSoStarJLIS0XGgZ+0+qMMpB/Q7CeJYKqSDPRjO5emxoz+YmHtHbwHvU4PiGNca9GvVpqvX6aJiyEXdoq8xztMk984tiyIgGoDGjUdyb1/HkiIQaft0pLcwMWrGyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcCuFOjTGlWzlp1gGW8rLBBx1JsJ8UOIW0H4v78wFv0=;
 b=DeATiyKYhi5USasD+4f1AwUsTGQn3nlbA76rCn9VAxn1LmUfdZmX/tmZDwlLl7fbMsvXjJgvzmqWArtQ7yTlm5Mqt5ERTCu3WOtBvKHkEYkku0rMnx+PV/xUf2KaHZ/vAHFlaVEZAZiukWCmXKltcRqVLLp5yYXIOcfZcjB3g+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by DB9PR04MB9645.eurprd04.prod.outlook.com (2603:10a6:10:309::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 16:38:34 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%6]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 16:38:34 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 02 Sep 2024 18:38:15 +0200
Subject: [PATCH v7 2/8] i2c: muxes: add support for tsd,mule-i2c
 multiplexer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-dev-mule-i2c-mux-v7-2-bf7b8f5385ed@cherry.de>
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
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
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
X-MS-Office365-Filtering-Correlation-Id: 90a4fc52-cf83-429c-855e-08dccb6db022
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aHhBWjdxcmN6d29LRDVsUTAyTCtGRzFNaTMybk1kQkNLWGJlSk40OWc1MlhM?=
 =?utf-8?B?MjVCdGRBenhESDV3eGxYRTViRDFlMzM4Zk1kMloxUVBackdYWFlnUWJEUGhn?=
 =?utf-8?B?WUhqYXdTWVNiVFNRNGN4VjVNUVZON3lGZzRROTEwbmhRTVlsR2ZwbXhXcnZv?=
 =?utf-8?B?Y2FHVDBWWFVPaE5FOS9oRk45a3h3ZkE5aDJQVTJvTnkxRm9qY2lveVRmWFB3?=
 =?utf-8?B?ZHoxOXZRSFZOcFd6VGt4ODlOOVlRRnY1WjVqbUpWVU55Sy9QdDBabkZFLzdP?=
 =?utf-8?B?ZUl4N1d1VHczc1gwSGlLeVZnQ1MyS05odjNYbDBRWjRwN1lhRTFRRUdxNlkx?=
 =?utf-8?B?c2VJRUVieTBneUJqaWVsalJKMXAxbWJ1ODJCZ3pkOTRsLytOU3ZidmZUWDZC?=
 =?utf-8?B?aWJKYWpiMk9WRHdVSjhCT2ZPR1pRRzVYbkVvcmdIUmMwQnhZVG9KUG1FV2U0?=
 =?utf-8?B?S3lsTWp4VGFIVmFXUUN2WWFUSVlTamgzdUh2MlB1eXZBVUttb1ZPZUIwL1JZ?=
 =?utf-8?B?d1hSR0JhbXluUVMxVzhNZEJDR2crODVRWDlBRWFnbzVoSFp5eXpPQWRUTUht?=
 =?utf-8?B?RHorWnU1VEZ4QnVVV21aSGVxRnJmdXFiVFZGVjFRYkJMbE1uVWRHTDF3dFBW?=
 =?utf-8?B?MmNEVXI0MEo3TjZCbCtXVjQweE4zc1IxOW9mZTV4RE1wU095S1JkZnJrTkZG?=
 =?utf-8?B?TExpZGZLUjZ4WnI1cjlEcFd1WEhHUlR5eDdNZS9NNE5TbjNKQU9oRUxpdUdH?=
 =?utf-8?B?cmRPR0w1U2ZVcXZSc1hXSUxWelR4cDM3dlhzSVd4SWFnZGpJRjh1Q0toZFha?=
 =?utf-8?B?UWN4ZXcwSzNtSkU2T25lenVkTHd0VEtid3VlOS9wV0RuVkQySFJYRjQ2czNJ?=
 =?utf-8?B?QlphS3FCM2hkL0xxTUdJb1BRa3FMaEowYjZMcFJwU2J4OWxRVThPOTVnNHhN?=
 =?utf-8?B?MjAxT3FpWkJrTjFZRWdVUU9RTFIrMEhlYXZGcGtHaEJtdjF6b2NkdzJKOWFp?=
 =?utf-8?B?M0JqU1dWL0hFSkJIVXNzK2FzWTUxc1IzeTVSTU1MR3d2TmhyY1VnTXh6ZzNK?=
 =?utf-8?B?UGRqQTl0bC9uQ21UZU5weXk1UVVqV3RsZDE2U01wMWg2RU5rV3Y4RkthYWVR?=
 =?utf-8?B?a2hYUnhWbDZVNzVBSkRhRTA0NERkUGhFQVVBcHBYUXhBb0E1TEo3amJnNXV5?=
 =?utf-8?B?SlBmN2s3alhRTGg5TUtPNWoydmx3aFgxS0xJeHNadUZVTDc3TXphWWZ4RXd4?=
 =?utf-8?B?c25VM3c4RXVzZVFCT0J1QjJ4TzNlUnNudkhTNUluNEVaKzZzcFNWMS9rZHdR?=
 =?utf-8?B?dmpjaVBSRytyVTdEYlFZa0dUMEhMT3J2L1Mwb2pZL1haU0xZbDBKNGwzMmNr?=
 =?utf-8?B?dDNYUEh1eDhuUnV6QXgrQlNYcUJVNkQ1S3pCZ1dVMFA2MDdBMGh2RUlVN3g2?=
 =?utf-8?B?d3ppc05ZLzl6eWg1YnZ3MHVSQ2FpbFdtcTVtTkZCRUFRVk42YlVldFVEYlQ1?=
 =?utf-8?B?L0JsNE5BNE9MV0RYY1R3cnZVM2lNMGFySUNQbVhWRFpFZHRDVUpnUm16eFAx?=
 =?utf-8?B?d1FTcVpvK0R4TzZNdDVkUXpjWVFIUitGVjFyTldJbVNpTVBVRG9JNmdOeXU1?=
 =?utf-8?B?aFZySVJWQ2tZdXJyazRuQk5HNk44Q1FhOFk2aGVhR1BkVHdGUTAzaHNORkNV?=
 =?utf-8?B?SkFYU2tvRUd4NmtTeW9sZExZeEVMclIxSXNqdXYwc1FabHg3V0s3S0E2SkJ0?=
 =?utf-8?B?eVhnV0ltSEszQzhWTFg5VEVCSWhzcjVjdEcyeU93TDhwSWNoOVUyRytJVEc0?=
 =?utf-8?B?bWFwN1lGQ0RsQW5kYkpUaHhOa0tweE4vWTkySXA4YWw2RDBNRFRBZmVvdFp2?=
 =?utf-8?B?OThjVUhVOUpRanFHdEZ3Ky9rV3VpVEpjbmdaUk1XRG4rK1k0ejhvU3F0WHNK?=
 =?utf-8?Q?s+1ETkT/qn4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXVqcUNTaHNBYXUvN3dsNlVhS25QQmllekg0TEU5YTRuODEyTGo3aGs2MUdv?=
 =?utf-8?B?RituRGoyeDFYaUwvUTgyRFJwNmJZOWFpemRUMTluYlhlWENlWG82U1ozbmpL?=
 =?utf-8?B?QitqTXo1TFNacENOUnl1aWsxMmN5R0ZUUlZSREJkTTZUSVFaS0tpSFZvVk1h?=
 =?utf-8?B?Mk4wRzVMUWU5TkFTek4zZDNnbkxodDVvODhRYU9UdTY0ZmRodGVkWjVHTmhE?=
 =?utf-8?B?QzBtK1FlMHJTV3RhaFhrM1k4V291U2p6TXhUcVZCNGp0SFRQU1dncTJEN0c5?=
 =?utf-8?B?MHFSaWNFaGYwRUtzRVI4WUIvK2NkYzlXZFhER2svNEYvVHVPN2d6N3hDMTZD?=
 =?utf-8?B?SEFrTmk2SGNjTmsxVndMQituMWtRKzJsU0tma29XRTJnQ2FpMEZOcmpXTG41?=
 =?utf-8?B?bHFEZ2JWczd6K3FvMUFLTW1KYnBNMnZ1WHlQTjNLMHU2dDErNDlubGpudzBh?=
 =?utf-8?B?Y2ZhRGJzbEUrYlJlN1FBL3JZZ0svdE1pZ0tPdzIzMCtndUp1eG9pejduSEhr?=
 =?utf-8?B?TDJ1eUpMY094NExGeTljUm4vTFB0dExVVDZ1MnY5VWJHNEczZU1GQ0J0cmVx?=
 =?utf-8?B?ZFN1anJmVExpaThWZm1uUVBCeEZUdmFtdWZUa2IwK1ZlN3d3NzVlcEVCbjJV?=
 =?utf-8?B?dmJxVElKTnQ4ZFV1NG15NlVFc2wyL2lmZDlBRzJPUE13ckpSdVNRbFREZVlr?=
 =?utf-8?B?Wlo1VWlmVHAyZlVxMnZsWUVmbCtlK09hQVJQaG96WXVuK3M5cGo0bzJkK2lM?=
 =?utf-8?B?a3VZdStFb2dReVlmZElYYnR5TGpkVzg0OFhzZWM3eEpjcWpOdWRpQ2svVkMx?=
 =?utf-8?B?RDFmOWhqMVZxV2F2Z3NrVGgwcndrMUxJZEx5cjVFWEtRVHZQMGZmb3ZmYndN?=
 =?utf-8?B?dWVtN1BMYUgyYmwzWXVJejI4WGl1Q0NRcnA2ejM0Q0pHNkJvOG5qRUJZalJ0?=
 =?utf-8?B?b1Izc1lxQzljUzV3bVllaWlJWml6b3BlZ0JLQ1pERW1lOE04QXRRVlorNEdM?=
 =?utf-8?B?NVhmaXVCVGV3M0g1WFFzRUpyeXU1RGlLUDk0TGtNYmdIT3haS1R1VXphVWFv?=
 =?utf-8?B?YzUrdHBpWmFBN09LdjFEOVFwQ0h2UmJXYThVQzF0VVhwelArcGtoaUpaV3Zi?=
 =?utf-8?B?cmVhYVgyYzdZUWdqMmxuOVB4ZG1TMlFrQlEvai9vb2FqNTF2UlhVTnh2L1c2?=
 =?utf-8?B?Q3N2OVBocDJvenllYjVuanIzRWpQbGp4ajVaK0ExTlJCdzJSaTIxSG42MXAv?=
 =?utf-8?B?M3ZCTmFZcDdZUi9OTmlGdVZYR2tOb0R1ZTh4aHMyaUU0MHdnWlNXMTZIbHVK?=
 =?utf-8?B?TWdzY2pvUENBN2FpQ0lGWUVhZ25LVmZZdU5SN2JpeExLZEF5bE5YQ2RGd0tC?=
 =?utf-8?B?S0xaKzNxMTRVSEVrQzcrRmNVRVpqTmpTNHNqNXg4MkNKbXAxTzNQak1MOCtB?=
 =?utf-8?B?U3EwMjM5WTUwbFNBNENTTXp1YzNjVWJ1d3ppczJCK283SUIweWd0QkNWZGlB?=
 =?utf-8?B?STM5UjlwWUtaKzFkd0lkQ2M3dHVlMExGNENqSXVIbXlBV0tDNHp5MXJNR1lZ?=
 =?utf-8?B?VWROM1k1SXl1QW5lVVE2U3VoMHl5RUo3UWdsaGlNLzhnRWcxOVd6RkpCazR1?=
 =?utf-8?B?Yy81TG1xSVNjVnRoYmM5aVhLVmI1SUJudkpjanVMeTVMRnlzZzVsSllHU0Zo?=
 =?utf-8?B?S0pLVm1UMXV2b3ZicFQ0ZUxWejM3bXltYU5ZMEI4NHRBY2E2TE90VXprQ3pM?=
 =?utf-8?B?NW1RRXBUN3dhTVFuYTg5a2grSVp5SGQ1RXJVbm5zRHV2UkNGTEdncVhnY1FQ?=
 =?utf-8?B?cGlwRURlMjNPNURRVTcyZGRMaXR0OW51ZzJ1UW5INFBGUmRNWFNDaUZVOUlP?=
 =?utf-8?B?cVlWaUZxVTZ6TlBKT3N3MXp1UkpXQnlOVUwxeEtac2huSFR1T3hxajJIVnlZ?=
 =?utf-8?B?aGY4Mi8vTFBDNFdqN0I1SnVsNGtER1dXelBLOHpWN2FYa29kZSt2ZXpDY09y?=
 =?utf-8?B?OVNOaStsR1dUMmZJQ0hTNWFGWjFrMmxSMTNwUXZwZ25XNDVMeDk2Zmw2aUNl?=
 =?utf-8?B?bXNjWVcrR1dqSG1lUXZrUWdxb1lDdXlFZktTYXMrSzFuMXRDblRjSTh6TTFF?=
 =?utf-8?B?a0xsNk44dVlmRXphRkQzM0JNUFltS0VaRytXRkVrMEJKRGF4Q2E4MDNvOFMz?=
 =?utf-8?B?MEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a4fc52-cf83-429c-855e-08dccb6db022
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 16:38:34.7390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MG/k6KYgv1p2b0xrhmOcHTlu4pP3aerFH2U8ZAHyk9woyjn2vowOrqgLlR8zdXakGuTKxe23MUTY3+gT30qxhP4ttO9QWoFsozXht07M01Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9645

Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
among which an amc6821 and devices that are reachable through an I2C-mux.
The devices on the mux can be selected by writing the appropriate device
number to an I2C config register (amc6821 reg 0xff).

This driver is expected to be probed as a platform device with amc6821
as its parent i2c device.

Add support for the mule-i2c-mux platform driver. The amc6821 driver
support for the mux will be added in a later commit.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 drivers/i2c/muxes/Kconfig        |  16 +++++
 drivers/i2c/muxes/Makefile       |   1 +
 drivers/i2c/muxes/i2c-mux-mule.c | 148 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 165 insertions(+)

diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index db1b9057612a..6d2f66810cdc 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -119,4 +119,20 @@ config I2C_MUX_MLXCPLD
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-mux-mlxcpld.
 
+config I2C_MUX_MULE
+	tristate "Theobroma Systems Mule I2C device multiplexer"
+	depends on OF && SENSORS_AMC6821
+	help
+	  Mule is an MCU that emulates a set of I2C devices, among which
+	  devices that are reachable through an I2C-mux. The devices on the mux
+	  can be selected by writing the appropriate device number to an I2C
+	  configuration register.
+
+	  If you say yes to this option, support will be included for a
+	  Theobroma Systems Mule I2C multiplexer. This driver provides access to
+	  I2C devices connected on this mux.
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
index 000000000000..e4e8992d4a09
--- /dev/null
+++ b/drivers/i2c/muxes/i2c-mux-mule.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Theobroma Systems Mule I2C device multiplexer
+ *
+ * Copyright (C) 2024 Theobroma Systems Design und Consulting GmbH
+ */
+
+#include <linux/i2c-mux.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MUX_CONFIG_REG  0xff
+#define MUX_DEFAULT_DEV 0x0
+
+struct mule_i2c_reg_mux {
+	struct regmap *regmap;
+};
+
+static int mux_select(struct i2c_mux_core *muxc, u32 dev)
+{
+	struct mule_i2c_reg_mux *mux = muxc->priv;
+
+	return regmap_write(mux->regmap, MUX_CONFIG_REG, dev);
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
+static int mule_i2c_mux_probe(struct platform_device *pdev)
+{
+	struct device *mux_dev = &pdev->dev;
+	struct mule_i2c_reg_mux *priv;
+	struct i2c_client *client;
+	struct i2c_mux_core *muxc;
+	struct device_node *dev;
+	unsigned int readback;
+	int ndev, ret;
+	bool old_fw;
+
+	/* Count devices on the mux */
+	ndev = of_get_child_count(mux_dev->of_node);
+	dev_dbg(mux_dev, "%d devices on the mux\n", ndev);
+
+	client = to_i2c_client(mux_dev->parent);
+
+	muxc = i2c_mux_alloc(client->adapter, mux_dev, ndev, sizeof(*priv),
+			     I2C_MUX_LOCKED, mux_select, mux_deselect);
+	if (!muxc)
+		return -ENOMEM;
+
+	priv = i2c_mux_priv(muxc);
+
+	priv->regmap = dev_get_regmap(mux_dev->parent, NULL);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(mux_dev, PTR_ERR(priv->regmap),
+				     "No parent i2c register map\n");
+
+	platform_set_drvdata(pdev, muxc);
+
+	/*
+	 * MUX_DEFAULT_DEV is guaranteed to exist on all old and new mule fw.
+	 * mule fw without mux support will accept write ops to the
+	 * config register, but readback returns 0xff (register not updated).
+	 */
+	ret = mux_select(muxc, MUX_DEFAULT_DEV);
+	if (ret)
+		return dev_err_probe(mux_dev, ret,
+				     "Failed to write config register\n");
+
+	ret = regmap_read(priv->regmap, MUX_CONFIG_REG, &readback);
+	if (ret)
+		return dev_err_probe(mux_dev, ret,
+				     "Failed to read config register\n");
+
+	old_fw = (readback != MUX_DEFAULT_DEV);
+
+	ret = devm_add_action_or_reset(mux_dev, mux_remove, muxc);
+	if (ret)
+		return dev_err_probe(mux_dev, ret,
+				     "Failed to register mux remove\n");
+
+	/* Create device adapters */
+	for_each_child_of_node(mux_dev->of_node, dev) {
+		u32 reg;
+
+		ret = of_property_read_u32(dev, "reg", &reg);
+		if (ret)
+			return dev_err_probe(mux_dev, ret,
+					     "No reg property found for %s\n",
+					     of_node_full_name(dev));
+
+		if (old_fw && reg != 0) {
+			dev_warn(mux_dev,
+				 "Mux is not supported, please update Mule FW\n");
+			continue;
+		}
+
+		ret = mux_select(muxc, reg);
+		if (ret) {
+			dev_warn(mux_dev,
+				 "Device %d not supported, please update Mule FW\n", reg);
+			continue;
+		}
+
+		ret = i2c_mux_add_adapter(muxc, 0, reg);
+		if (ret)
+			return ret;
+	}
+
+	mux_deselect(muxc, MUX_DEFAULT_DEV);
+
+	return 0;
+}
+
+static const struct of_device_id mule_i2c_mux_of_match[] = {
+	{.compatible = "tsd,mule-i2c-mux",},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mule_i2c_mux_of_match);
+
+static struct platform_driver mule_i2c_mux_driver = {
+	.driver		= {
+		.name	= "mule-i2c-mux",
+		.of_match_table = mule_i2c_mux_of_match,
+	},
+	.probe		= mule_i2c_mux_probe,
+};
+
+module_platform_driver(mule_i2c_mux_driver);
+
+MODULE_AUTHOR("Farouk Bouabid <farouk.bouabid@cherry.de>");
+MODULE_DESCRIPTION("I2C mux driver for Theobroma Systems Mule");
+MODULE_LICENSE("GPL");

-- 
2.34.1


