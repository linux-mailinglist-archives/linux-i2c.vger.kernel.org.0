Return-Path: <linux-i2c+bounces-6051-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A7396A317
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 17:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB38F1C2379A
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 15:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307481885AF;
	Tue,  3 Sep 2024 15:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="aLQ6ULn3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2139.outbound.protection.outlook.com [40.107.104.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6232C14F9D6;
	Tue,  3 Sep 2024 15:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725378280; cv=fail; b=Jm/SE/6CYrKsSvU5moGfar93rwuHWqY79VVmAsxODqIEvjusiPXW93no6j2Qt9XyyWbi7M7gbhP3iDncWm6L8eC2Qindx5JD+uGQgoQfiRocvcxGtpqcv2gtFv+WZ1K3eqTpE4MmTpVMV5XmKb8V0KUySPuV0NojdxpM+NLedV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725378280; c=relaxed/simple;
	bh=4e3F5xHtcppEX/yeoXsPtO9aqCzYpPdqw1sa413BUTM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CVBAVTSpYB78dQ+ur/Wq5oAbA0GI7R/qyKOkAL0vFqVqW8cD2Vu6hkmfjyqTMAH8x+tg50nSPXCLNzZko66i8uYhzhyx6+oumo8k+G6wgjBZ+3BnHNc3EsCccyOj27drDonCi3Iw+HYhl99yqW88YC7Vnt1mP8ZG13NOTePH1JM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=aLQ6ULn3; arc=fail smtp.client-ip=40.107.104.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWqgtG3ToGNdli/eofdHuiDNBQtekhWsOH67JB7QmUb2NfSzaR+0CCsbJv0yuVN23NVw2a1D8i+ADWV//7xCUthtU3MoVLg6VjBeSJxRz9O9V8qDpYzU/4Dp+ZHsRLqxgCUzev39GCoG1yb11iEy2xSOTgm2pFsLxsjKZx3QvkZwgUESUdAypm25Rio4LOrsEuJslqR2aPmYZpP9SGJbK477iFu9weJ3cHjsbhfGPucb4qt1GMjayYcewK/f2+j7SOCsXI3649776LVT3s/8tqGzc6n93CrwKefGPF+MzLQv0nEoLoijsTdY++m8D9Awsp+4WFPaTy87TnZ3aOPIuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDh1YoNW7QCQOgYvAidQROXO4Slx6CFP3OM9avuQ9i0=;
 b=kg2ad1WbrPpI8hHowgZbfBmykSt7AcQnD42wCjMih2g5FYlKuyCK6R6wu0cclm1sS0Mw947YOIC2Zflxw+WwmyxQa4eiJzzcj5wHNdFlrZ+w8U1nsBeqx+EFObArad94/dVnRuyVJLtF8MMx5Vd3m3Lpw9BjnGyimXUeHkxpT/6sh+uMHNk4Zf13AvLrqhT6zfmtkmFzMTxlEWb0YLp2b7jNrn2MiE4PmqW5c4YIfqOBPwV+fbrcpShP+fNSoerfmvA/GDXWhbNHn2NlmaIkiT/K6xISD/H7RtUDCeP8U2N/RlfMlJlDyyBXYJBTkdO/XlBen0mPrGJTOxNlffWOtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDh1YoNW7QCQOgYvAidQROXO4Slx6CFP3OM9avuQ9i0=;
 b=aLQ6ULn3Nf0VzJLOowyrQJXEJW4/KFwkKd2lt/+CaajCeuofF/Ip5OJlvJ+WpwHNctXE4mAp5jIu3sFpSaEhHM9xXAXwv+qyUdQfFQ61hgibR4lGXGusSB28jQyXP9HwRpz8fCzIUj7UIB4M+Kp2HxaEyBaxCGQdK//DiBGAvwg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by AS8PR02MB6744.eurprd02.prod.outlook.com (2603:10a6:20b:252::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Tue, 3 Sep
 2024 15:44:30 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%3]) with mapi id 15.20.7918.019; Tue, 3 Sep 2024
 15:44:30 +0000
Message-ID: <5d2ab1fe-bcfd-6760-85d0-145787ea5cc6@axentia.se>
Date: Tue, 3 Sep 2024 17:44:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v7 2/8] i2c: muxes: add support for tsd,mule-i2c
 multiplexer
Content-Language: sv-SE
To: Andi Shyti <andi.shyti@kernel.org>,
 Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Quentin Schulz
 <quentin.schulz@cherry.de>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Heiko Stuebner <heiko@sntech.de>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de>
 <20240902-dev-mule-i2c-mux-v7-2-bf7b8f5385ed@cherry.de>
 <fvk5u2j7wu7pjrlpbbnggp3vhopotctu2vr3fh77kl2icrvnyt@tukh2ytkiwdz>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <fvk5u2j7wu7pjrlpbbnggp3vhopotctu2vr3fh77kl2icrvnyt@tukh2ytkiwdz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF0000ED92.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:3:0:1c) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|AS8PR02MB6744:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bde2d3a-61ab-4889-294e-08dccc2f4cb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1lLcEQ5Vm1vNTNkNmtEbGwwUW5FVkdqcS8zWm5IRkJWU2tzSjNzNUZBNE1T?=
 =?utf-8?B?R0w3TmlaS3BrakJnYURnZTBZTkxNMkllRTZhbWcrbWpRcmxmTWhtOWdBOWxR?=
 =?utf-8?B?eDJBNnc4UHJkSkxoMmtDZEcvUElLNUNRWmtLREd4bTk2RG1HZU5yWHJ0TGFY?=
 =?utf-8?B?Q29aSWRCOFMyb1FacW5XMXBrQ3lFSkRROVRHQ1M2eWdUdW04a2M1UGJWSkkv?=
 =?utf-8?B?djNTYS82MmNvNmxtYk1WQjdnRWtubnF4aFFWakRkNXZOdEpGMEZaTWdiRklK?=
 =?utf-8?B?OW1pOTg1cXozM2I5b3FMWVZ1QUt4cEZ0TEg4OEdjekNTSVRKbXYwSUlCdnlv?=
 =?utf-8?B?Sjh5QmExUFFFSDNKam1ZR2wxeFRCS0QwTW9nRTJlQVQvbDNXKzQ4dFJ4QzUz?=
 =?utf-8?B?NjRuWUVPdndPN0pRS0tzQm12aUFvYnZZRkNjZ3VtQktjNGJpeExCN1JUSWI5?=
 =?utf-8?B?N2EzM0NQMWN5eE1xZ0xqVUFTMllySmpCRjhuTWt0SDlvaThPL0lGNXVMWkg3?=
 =?utf-8?B?MndlT2F1MkoxcklsanY4KzlLcjU2ODB3aFZraUl2UXNTaEhvZVd1bkJuc1Bh?=
 =?utf-8?B?TzBoejh2M3U2NVdvWmhOYS9WaXNBU0dQakQxQ2t5dEZwek5rS2l1Y05ZOVJ6?=
 =?utf-8?B?ek9BWkRMN1FpTnFCT1R6M2ZjdUp1NnBORXc5WGZPSmZoV0JEU29DV25mRjBu?=
 =?utf-8?B?V3VNMWl2eWdCZDdFYjJidGxSQUlaUXpyWjA2Q1d3Y2JhRWs2eGdIdGdqWEZB?=
 =?utf-8?B?VUZkVTBLN1ltd2d5aG1jTUFXMEowOXJEdGhMcWFieTU3VVZVazVTR001Qzdr?=
 =?utf-8?B?bkxRZG5tTE9naXFVaEZXK3drWENhQmtnNmNhZ20rakRtdnR4SHhPMkRPbTcz?=
 =?utf-8?B?dEZzUDFaQTdrbnZMSmVDNnNXZkNhVUI1REtxQ1h3bFZtcjlqQjdlVkhNalhG?=
 =?utf-8?B?cVhZVjk1UFRVU2U2U0ptbHNuVm5CSTE2Y0wwNkN5VVpjWnk0S2VnKy94R1B3?=
 =?utf-8?B?T0dUY240YmJIT2FtS0k5U0dYcDhVcGpIaWhoWXppN3A4cVh1RkdPL0V1M0d1?=
 =?utf-8?B?YzIzNGtmRkE3Y3hmMVJtYUw2V3lUekdJcDBadnY1SlFlNVk5RStTbWV4U3RS?=
 =?utf-8?B?UXlqa2NsWmNad3NLc2hMdFVEWHlTNm16cm1aajlKVjBTaU80Rk1xQlBEMjR1?=
 =?utf-8?B?azY1QmcrQ0tPMVFLZGI3b1RHaVF2QUV2NkIyZDN2MFVZWC9rYXE3Q1MzNzl3?=
 =?utf-8?B?akJ4SVJ3OGZDNzR2M0lnQUdiWUs4Ukxub0FVRGFpVzRmNnQvTS85VEJTL3Zk?=
 =?utf-8?B?bWtSV1QxUWQwRFJscW1qTHVXWldUVlNwQUt5VC9TWDQzTkNvSGpQZ2xxdDQ0?=
 =?utf-8?B?akU0cTdQQ2hhdFZOSlNZRW5DZ1ZiR0xXK1NRUG9QTVFkcldvS3lkM2dKenlu?=
 =?utf-8?B?b2dUMFdKMFg4Ly8rRnc1d0p2OHlyd1V5Q1MxSUcwVTJScVk1T3o5MlJSNnBy?=
 =?utf-8?B?dVQ5QTI5SUZFTGQ0U29idHZ0RWsrTGFJRkRPSG1sc1ArcDNtaFBHQ3BrZHoz?=
 =?utf-8?B?Wlo3R2dyZlErZW05aUFlWU9nQ05icnJzLzBvSERrVHFoeVR5YTVzcndZcVRX?=
 =?utf-8?B?QVJLNDErKytDMHY1ZnFwdVJRY1JMYkpndjBLWDJWampUdGdFQ3BmTlkrMWNB?=
 =?utf-8?B?bmpaUkRRWXpIcnRWYm5Xcmc0OG83MlJMVGYvZXJqZDNtUW51bWFaaVhZSGlx?=
 =?utf-8?B?MExVT3NWRXJwdmJ3STFIeW9wMkdFanI2R0YrRGxyUVZwcmJiUTkySElzY0VV?=
 =?utf-8?B?S2FxV2JCS1BkbjlIcVlzZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0UvejVrYW9qdFM1dktxQTFjUzA4cFVMZ1NEeEQ0MEllQ0tGZjh0RnVjNEhi?=
 =?utf-8?B?NVpUSEVOcEl1YkUrNi9McWZmSjVpdi9RZzZDWVNhNzFtVVJ6UFVNc1V2bENI?=
 =?utf-8?B?MUVaNlpmczlPOUZLM1BIMzhXMnZOU0JQa2RIdFNVczRxdSt5V0xvU0oyQStU?=
 =?utf-8?B?VkhHd3RzeTdFY3FUNGQ5cjh2OTRVbC93YjlFaUI1aVJUYjZ0UzVmMm1FTzh2?=
 =?utf-8?B?Z2p0QUlxeDZidFJCangzOGhnWFlUaHVvbG1kZm1lcGJveTI2d25yV3pqdzZI?=
 =?utf-8?B?M2ZHQTdoR0tyOUtpTDAvQ3FZcXNSSlpaYXhaZUl0V1JXSmZRV2JnN05ydDVu?=
 =?utf-8?B?dzFlZ2Y1eEpocGFPc1M2c2tjVDhsdS9wbkkyQThiQVNzbmc1TmM1RTdmMWpq?=
 =?utf-8?B?YUJtaVgzeUR0TFhNZjEzNFM2TmxTVWNwVElFanFEYUE3V3dpQUNZQlpKaUw4?=
 =?utf-8?B?UlB3SEFLSjMrTHNmck9kejBlZG5acDJJR0lZa2Vqam1BVE85ajA3N216dklC?=
 =?utf-8?B?OFk4OFB0YlAycXdoOUlZeVJmTlFJSFRUeEhTUXV6S1MwSnlLNkxQUmdWSjA4?=
 =?utf-8?B?UDBTOUVITWk3MC9mRDE2K3pmb2ZJVXZXeThGaEE5S3JnbkFlSGdvWTFzWVdr?=
 =?utf-8?B?SVpQL0UzeXJnR1JmT0xnNy9VRnpSTW83aFNtOVJEQUFlYVlLY1ZoTTZIcGZG?=
 =?utf-8?B?NjZBMnV2Nm1scGMxV3c2aVB0RzNnZXlpZktUZmo0eWZCVTRBWUIvQnl0L0tG?=
 =?utf-8?B?UDlIRVBvV3Zwc2o3eHBhek55YWVqbUpabURqU2JHN21pTjA5NFJsTW5ZSU40?=
 =?utf-8?B?U3BYeThqaSt6WkZvQzhCVjVtdWtRMjFFR3VIYnpvWUl2VnMxRUx2TnU4VXEv?=
 =?utf-8?B?ZThycTdUSGtsMjZCSEY5Vk9EUklsZmRHcDdTQlJ0R3oxN1dGVVRzR3RVNFlL?=
 =?utf-8?B?dk5jalkrbUlBK0ZKZVdlMHY5QlVPWFB4bHlHV2V5OXJIa1hHSndKaHhTbzZT?=
 =?utf-8?B?U2VxZmVBVVNqTUVEdlBuZ0tkeERYLzByRG9yMkFucVNTb1lxdGpMRGVHWW42?=
 =?utf-8?B?ZDhIMXlJblpnb1dPRklCUTEwayt2Unozejk3MmZMWjZOKy9KMHpabjJKSUV1?=
 =?utf-8?B?TTFKMnRGWmNqNzN3N2VtSnh2aFBIdGJmSkdsY2xMY0xJQ25MaTBRYjJ1b0Fx?=
 =?utf-8?B?K3JDN01GN3JvQXc0T0RWNW9ZSXNBUTNDVUp6M2k4cjhnd1BaZlVjZWFKVm40?=
 =?utf-8?B?c0RKWkIvUEcwd3JxTEtHeElsbkZBMmppaU1PRUlwZG53MURvUXMyYThWVjhi?=
 =?utf-8?B?ajVWZGZjZ2RGdEczdEN2VE1DWE5ZMWM5NWRKUzNiT3FWNXg0dnFIVXVVb1J3?=
 =?utf-8?B?V0JsNHF3V3pZU0tYeHlWUkkvcCt6ell5QXpvT1prNHpuS3BsdTlWUlhpUHp1?=
 =?utf-8?B?UXRKZ0ZXbXM0TmRyNC96VGVWQ0VHSVNsdHFvNW5VL3JDa1BGMGtkd3V5V0lz?=
 =?utf-8?B?blhLN2xqUUFueko2L1A4LytZeisya0cvSnkwWkIrYmY3ZUZ4UXdiZlIzRk9I?=
 =?utf-8?B?U0xCRVNxSTdwUzlFZmJDbTJ1UUdVSmhSTkhoWGJUdDZOcThCY3h0OHU0cTlT?=
 =?utf-8?B?K2lHZEtsS25JMDQ0NWZQWVhVTm9pOWxTL3FRWlVKWWV5SHRaZ0R3M3Jhb2Qr?=
 =?utf-8?B?dk1UY29lTWg2K3NmKzFYME1EVVZwcWZqZzhyYm5HZnV2YmRHNkZzeGsxV01n?=
 =?utf-8?B?UUF4YmpZTGY5KzFqTDJGODRuTkVPK2tLS1htK2pqdVRvb0wzRmsyNXliSXZJ?=
 =?utf-8?B?WjdOUFdoSGtJZGRDN2ljRlNpRlpVTzNxbFU3bVU2dnZoS0dMbVpOZnc0VFk4?=
 =?utf-8?B?MkVoK29RVjVIQ1U0cnY3Z2JORmdXOFlxbEZyZndldmxBbDRJUkFPNmVDYjMw?=
 =?utf-8?B?Y2pCQkd3UXNLR1ZJd0o0ZlR1Q3M5bU01aUM2K1RRand3L0NVamd2SlIyNEIy?=
 =?utf-8?B?TzAvb01hL2p0OWdnZzRuVnFBVUhFNnc5NWVCdm16Y2llZVBFNC9BcmlPeEY2?=
 =?utf-8?B?eTRZUEpnV0FzQWYzdnFxOFMxY2NuT1lCb2Z0NEJaZXVvb1B1UmhQbE5YZE5F?=
 =?utf-8?Q?IPQVdcEnZbw4TWY5euWv9ws6P?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bde2d3a-61ab-4889-294e-08dccc2f4cb9
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 15:44:30.4041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rOnaGpCXnHK075TRrDVZlMqBwFIEGyL9oQyvRBOoHMinHvPpX28C/C60GlqnmJK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6744

Hi!

2024-09-03 at 17:13, Andi Shyti wrote:
> Hi Farouk,
> 
> Before jumping into the review, who is going to take this and the
> previous patch?
> 
> Peter shall I take it?

Please do. Thanks, and as always, sorry for my low bandwidth...

> 
> Now to the review :-)
> 
> On Mon, Sep 02, 2024 at 06:38:15PM GMT, Farouk Bouabid wrote:
>> Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
>> among which an amc6821 and devices that are reachable through an I2C-mux.
>> The devices on the mux can be selected by writing the appropriate device
>> number to an I2C config register (amc6821 reg 0xff).
>>
>> This driver is expected to be probed as a platform device with amc6821
>> as its parent i2c device.
>>
>> Add support for the mule-i2c-mux platform driver. The amc6821 driver
> 
> Along the driver I expressed some concern about the prefixes.
> 
> You should avoid prefixes such as mux_* or MUX_* because they
> don't belong to your driver. You should always use your driver's
> name:
> 
>  1. mule_*
>  2. mule_mux_*
>  3. mule_i2c_mux_*
> 
> You have used the 3rd, I'd rather prefer the 1st. Because when
> you are in i2c/muxex/ it's implied that you are an i2c mux
> device. But it's a matter of personal taste.
> 
> Other than this, there is still, one major error down below.
> 
>> support for the mux will be added in a later commit.
>>
>> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> 
> ...
> 
>> +#include <linux/i2c-mux.h>
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/property.h>
>> +#include <linux/regmap.h>
>> +
>> +#define MUX_CONFIG_REG  0xff
>> +#define MUX_DEFAULT_DEV 0x0
> 
> Please define these as MULE_I2C_MUX_*
> 
>> +
>> +struct mule_i2c_reg_mux {
>> +	struct regmap *regmap;
>> +};
>> +
>> +static int mux_select(struct i2c_mux_core *muxc, u32 dev)
>> +{
>> +	struct mule_i2c_reg_mux *mux = muxc->priv;
>> +
>> +	return regmap_write(mux->regmap, MUX_CONFIG_REG, dev);
>> +}
>> +
>> +static int mux_deselect(struct i2c_mux_core *muxc, u32 dev)
>> +{
>> +	return mux_select(muxc, MUX_DEFAULT_DEV);
>> +}
>> +
>> +static void mux_remove(void *data)
> 
> Please call these mule_i2c_mux_*(), the mux_ prefix doesn't
> belong to this driver.
> 
>> +{
>> +	struct i2c_mux_core *muxc = data;
>> +
>> +	i2c_mux_del_adapters(muxc);
>> +
>> +	mux_deselect(muxc, MUX_DEFAULT_DEV);
>> +}
> 
> ...
> 
>> +	/* Create device adapters */
>> +	for_each_child_of_node(mux_dev->of_node, dev) {
>> +		u32 reg;
>> +
>> +		ret = of_property_read_u32(dev, "reg", &reg);
>> +		if (ret)
>> +			return dev_err_probe(mux_dev, ret,
>> +					     "No reg property found for %s\n",
>> +					     of_node_full_name(dev));
>> +
>> +		if (old_fw && reg != 0) {
>> +			dev_warn(mux_dev,
>> +				 "Mux is not supported, please update Mule FW\n");
>> +			continue;
>> +		}
>> +
>> +		ret = mux_select(muxc, reg);
>> +		if (ret) {
>> +			dev_warn(mux_dev,
>> +				 "Device %d not supported, please update Mule FW\n", reg);
>> +			continue;
>> +		}
>> +
>> +		ret = i2c_mux_add_adapter(muxc, 0, reg);
>> +		if (ret)
>> +			return ret;
> 
> do we need to delete the adapters we added in previous cycles?

Yes, nicely spotted. A call to i2c_mux_del_adapters(muxc) is needed
on failure if any i2c_mux_add_adapter() call has succeeded (but it's
safe to call it on any i2c_mux_add_adapter() failure).

Cheers,
Peter

> 
>> +	}
>> +
>> +	mux_deselect(muxc, MUX_DEFAULT_DEV);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id mule_i2c_mux_of_match[] = {
>> +	{.compatible = "tsd,mule-i2c-mux",},
> 
> if you are going to resend, can you leave one space after the
> '{' and before the '}'
> 
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, mule_i2c_mux_of_match);
>> +
>> +static struct platform_driver mule_i2c_mux_driver = {
>> +	.driver		= {
> 
> I don't see the need for this '\t' here, the alignment is too
> far. It just looks bad. Your choice, though.
> 
> Thanks,
> Andi
> 
>> +		.name	= "mule-i2c-mux",
>> +		.of_match_table = mule_i2c_mux_of_match,
>> +	},
>> +	.probe		= mule_i2c_mux_probe,
>> +};
>> +
>> +module_platform_driver(mule_i2c_mux_driver);
>> +
>> +MODULE_AUTHOR("Farouk Bouabid <farouk.bouabid@cherry.de>");
>> +MODULE_DESCRIPTION("I2C mux driver for Theobroma Systems Mule");
>> +MODULE_LICENSE("GPL");
>>
>> -- 
>> 2.34.1
>>

