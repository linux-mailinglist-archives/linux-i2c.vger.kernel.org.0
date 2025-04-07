Return-Path: <linux-i2c+bounces-10129-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 614C4A7D739
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 10:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09FB616AE47
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 08:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04D4225765;
	Mon,  7 Apr 2025 08:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="YiDA5axs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2096.outbound.protection.outlook.com [40.107.20.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C835910FD;
	Mon,  7 Apr 2025 08:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013342; cv=fail; b=idh0iZK8ahnmOafXYY8EZShJlem2CVrIyzAHSlIQ0Gb1hYQEaUeTa1b6Umu83exTZLaO/kRVXGLQ3CrSsMEzmuldG6doM1LLCIRTKP/aAXWs57bzOhcGpv15j4FyIw1m8a527P0djIYN1EDw4CfFB8rPTKk9qP3s7r+i+5wMNxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013342; c=relaxed/simple;
	bh=1v0s+NHzbJg8XKNPxdMRBY0MarYgV0MCihY2Lqqn8FI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TS133K7XSnVmspqM4WTZEiX7uJcSCjz1a1SdGZUKmOtGrNyBH5SxWJLIlhKcWYSpyI4QDQ/43i/m0TxC7T8rQ0RatlA2CBzim0b6TAGH5vVROHmGIXSBa2aS+ng9g30V4vH1NdI6QNvIlTvYmRF0fkFHUwc2/+Jap8jtvgdlWvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=YiDA5axs; arc=fail smtp.client-ip=40.107.20.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbIbj5C/ronbr5rJ0HiCRd/TfwaZcM6TgOHjSanSc/TSZnob1i7l81cUI6Mb+KeC09M/83aPiXptd/l+HobEugCY5LpbWBT8bMLpMI4LAZccjUz1yNAUwdpUlBnQLQYRUcPEHooGS5M0GPElLQqnsikNO4x5PTcdT/EuEV8pBzQFuWHc0cYdz9bTISgIofV69Nao92U7umF11TGYF7fYQYhPk8e/PkpYgk6goVeuUNvTxZbr6BdvWLN3dvay3g1YAwFjLfUODnM3Sd+VjsPmT4YKwraHeHPWC9cir8Y/RNSWNC5R5xoRv2mmDJeMCVYYwaEXmIsb/KZ7Hl557FUjBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpXhQfGDGbrEXjJu4KsaW0tyN1EzcGXQRgV8fd7+b0Y=;
 b=WLPfarJKr0if9JrJATSYbbjaw3sNmJmCXA9IzwyFbwV61DNKh0aeTER34Tvq4O7dFqPAARULKQTdfbYmijHVMzhuXIMSL2Ttv6DAAbzXNEig9KHCdayVooz6ybglOlfupZb+vB6oMeSo/rDoi4QgTda7kFGV9yaG+Ea39AC6Q7RY+8OZMyq/KTV1+ADgYwK+PyLqOCD8FPb1t6AzohqwG2CJ3UD7Sza0MluKgqTiiWWzEy4Ow278eBhK3AxW72qdtZFscNNw2bvHrHalyeBOuVJEQ9I4g6ikjPpXTOiYJpDOwyCva0pg+7h8rcrhiagRGDJSlrGrlhTxDJYbd18G+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpXhQfGDGbrEXjJu4KsaW0tyN1EzcGXQRgV8fd7+b0Y=;
 b=YiDA5axsMmtSCYx/kkukSLSjBRzNHIvIyjjy8uMsoHQ1uHm88+6/kvAchWnYR0Df+yXZiXp6SpxXhSouyrfH1AOULk5Z6pVlZzAhvN2tQ+gG28adLxE57sSJbdKGA1zJgNQCAkqDdbK24R+nnk4iYS8o28VaChMqv1fx7PDtdt4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by DU5PR02MB10707.eurprd02.prod.outlook.com (2603:10a6:10:528::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Mon, 7 Apr
 2025 08:08:53 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%3]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 08:08:53 +0000
Message-ID: <16b14e5e-e5eb-5203-4cdf-44fbde9a5688@axentia.se>
Date: Mon, 7 Apr 2025 10:08:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] i2c: mux: ltc4306: use new GPIO line value setter
 callbacks
Content-Language: sv-SE, en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250407-gpiochip-set-rv-i2c-mux-v1-1-7330a0f4df1a@linaro.org>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20250407-gpiochip-set-rv-i2c-mux-v1-1-7330a0f4df1a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P251CA0022.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::14) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|DU5PR02MB10707:EE_
X-MS-Office365-Filtering-Correlation-Id: 92984df8-b806-4a54-7d83-08dd75ab6ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWRkUDZseTRtR1lqcEpKdFFnY3Fia1ZGc2JpQk5FeEp6YlkwYTF3WnhSdFVZ?=
 =?utf-8?B?SjRLNWNsSTlBNXErbU9yVjlvTVc2NDFOZ01TWWpvMGpvdmJzRDAxcG9RVnVI?=
 =?utf-8?B?ZG8rUWpKUGRIYUhHajRMUWtJWjkrK1dXdEtPVVhVNDdzTXhpNzlOZm1nVjc4?=
 =?utf-8?B?djNqZ01NdG9lV2l6bnZiOFdWdXRIL2dCVk1DVENNZHBhanNrTW5qRjBqWHlU?=
 =?utf-8?B?SmRkZ0dSYUZ3KzRpb3JReVFRdFR3ZzdXTjVLcExQN3FhYUtEbTRUdHMrTk5S?=
 =?utf-8?B?V0FOQktvMnQvS1ZrSWNOZmN0d1N5bEtNYzVBaUh5UC9RUDFnNk92bnhDOGZo?=
 =?utf-8?B?RGlNU3I1MTFaSXZMZnBueGF5MmJyR1JiSzdxQ0RGY3RoeEptS0sxMy93Tm9V?=
 =?utf-8?B?UExLVHgzL0VQdGlidDFjRnU5QUtJb09za3lmNStIN05OS3pwU2x4Y3ppZm9n?=
 =?utf-8?B?cFpDd1k4MU1nUzR2UGF0R3JJaUNVU2NSSGxFZWpGY3J3b3FWS2RnQjAwS0p6?=
 =?utf-8?B?K3NJbUxRZ3M0UWE5KzdSdnZqekRnYkNaMnRrWFMrKzY2YVZOQklYWThCZms2?=
 =?utf-8?B?a2I5aTZwdE40N3dxdDJ2bmtybG1qUTF0SlpnRVR4N2JKaFdtWTgrZ1Nobi8x?=
 =?utf-8?B?QUZUaE0zMy9nOGlLdFJtTTJibThDSFNiWUpqWmFzVzNrTFVqZWExSVZiRUx0?=
 =?utf-8?B?NW1pdUp2QnorSTJyNkY0em5mZGs4RTZSaDJzMEJpQjliTWROR3hCa0MyaSs5?=
 =?utf-8?B?NnFEelRYQ1pPUEtFemE5Nlk1YzBaVFgzaGNrKzc3T2dSbkhIZjk3elZkQ0JT?=
 =?utf-8?B?QUFjbnlneXh3MmNuNStRTTIxcEJuUGNpcXBLVjNBUGpFZlRDa2ZaUE9YMmcw?=
 =?utf-8?B?SllvRmgxQlFYZkxWL2lwZWhudW12UkI2MVNUWmlBdnBsa1ZpWHFZU0V0TGJO?=
 =?utf-8?B?bEhXUlB4aDJnUy9TVklHcDFzZzk1ak1VT0wzeUMvczMxVDA5UFdTeHZMUUEz?=
 =?utf-8?B?Nm0xVzRNdWJmWkVYSWJlYklvK1I3YXJuaGpzY3dkZ1lNaXdWOEdwVkQ5TmZY?=
 =?utf-8?B?QmttOU5Zb0RHeW8wbTcyUDhjQXRCN0NEeUJ1cGNJNFVJc0tBR0RCa1BBcmE4?=
 =?utf-8?B?UEE5L1NIOUt6QVRUOVdhQW1VOEtDOGxMTU1MTGVFa05meVVtT1N2SXZtUmtS?=
 =?utf-8?B?ek1vQm10aEVZRXlYYUcxN0lmWUkzNDVsYXVXU0FmbDVzRU1ESWRRY2VRRzVv?=
 =?utf-8?B?ZENwbFIyblR6d0cxRU5FVDE2TTA4M1RxZnZ5NTFVQnJ5ckV5c2xNSENacGdM?=
 =?utf-8?B?WVptTys0dkJ3b3pHNUxNaTQxYVkveDU2TVVvNWwrWW1uWW10MVBpSDhQN2RM?=
 =?utf-8?B?OWxMWFBlMDRVWHBvVk1pMVNpUnh0MUwvWHk2VlNQRE1jVlZORkExaElYUkJF?=
 =?utf-8?B?Vk55bzlpM1J3aVNEWXVtcFU0dko1NjNndkpLL3BDaWRLYzBYVTIzZGdabFdh?=
 =?utf-8?B?bXhZN3B1NHlNWCtJSS9WeXlXSlJiNE9TcVlmNHRVcGp3bTArNFErcnZ4clVP?=
 =?utf-8?B?VmZSbHNOajZNcU9zdld2WGRiU1c2L1JoQThrUldyTUpnemdqcUlCNGRKbTZs?=
 =?utf-8?B?b3Z6OEh1QkErVlV3dEZQOUxOc0tMejRyNVlkWTJvbDRDWWZlWmU2L0t4RGdx?=
 =?utf-8?B?emJDOS9ZcDBueStxVnE1VHVCaVQ5blE0OWViRE9DQ1NxdEhnUHRQd1AxUzBM?=
 =?utf-8?B?ZVh2NERFWllSQjdJVTQrQ2NlSUIwT0JKeXQya2d0a1gzODFrMGY1dFpMZjQw?=
 =?utf-8?B?WDFwV2Zxd2NremVpWjFTZnEySHpWUU1NbmRiSm45NjZyMHE0NHpqK2NMdFVi?=
 =?utf-8?B?dFU3RHJvSjRPeWR1bnJPc2xHZTNtUUVWZ2tueXBZUVBZenplRW93TTJTd0wy?=
 =?utf-8?Q?ym8HrN8jU9A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGhRbzRqdzQyaHl4UkJ6ZFpiWGxpWGM0bkZkVmk0T1ZKZ2ZacUlLQmgycU9D?=
 =?utf-8?B?Zzh2KzFWZ0tLZnFnbm1xK3RYTU85V2ZxMy9mRXE2WldQWFZWd2xTOVZLNTRl?=
 =?utf-8?B?T2RYSjRFNEdMNGpyU1VBTGwrL3NSSy8vR2QrSGRyMmtyemt6NnhxNTdkaTJN?=
 =?utf-8?B?a1BkdmNRdWQvZ043c3ZVYlNzSHRpcExEQzg4eWxibHErMHQ3aFVIcGQrNWs4?=
 =?utf-8?B?MzR1YnRRbVFkTEw1YXp5MmZKM1lBUXRkWDBxb1NxYTZJNmM1SDByQVN2VmxU?=
 =?utf-8?B?ZEFKQ0pBM2tTUHBLcVk4d3lRajJiY0NvR1FJZjgyNkhIcnNqNzljTnVHRWU1?=
 =?utf-8?B?U002SGM3Z1ZmM3VsZjZPODJHV2U4Y0VYR1RCdDE0Uzd6bjY0azlTRmJSZU1P?=
 =?utf-8?B?b0JKcnZZM2JuZUtMNVVpd1h4cElEaGQrejZhVHRIUWNnYjRnRFNHKysxSm9M?=
 =?utf-8?B?RmY1MlV6eURWa2lLekMvdWFHL3ZiTnFsQ21DMmtRYzE4bStaUGFPQTgzYjQ2?=
 =?utf-8?B?ZmZGMlRJQmdTcmR1SFFTcGtxaFZwNlgwNnV5RktQV3hsT1VDU3FoUEFDUHNj?=
 =?utf-8?B?WkNnWk9IVi9QQ1gvQlBiaWxGR05oWXlxRTkvd2l1WGs1V2o5NnZBTVlKank1?=
 =?utf-8?B?SkhQNjY4akYyNkRLVnJJejNad3VoNUN4eXVPTXZoMXRvdU16aDJnVERKOTl2?=
 =?utf-8?B?dGtyaEZ6N2luczh0WXRTRzFsclgxM1ZRRUZGdWtBYlhrWmNQNjhYUkQ0a2RS?=
 =?utf-8?B?dHFuTURQL3NwVXAvVFQzWGF6cm85WHJwSS9mcXE5bXZ2VFB5Y2Z6dnE5MklM?=
 =?utf-8?B?NWFvRnc1bklTTW9TTzI3S0FhNFNwZjQwY1l3b2VEY1diNkc5clFTRFhHdU9V?=
 =?utf-8?B?NWZlQXpvTXg5WmxxVlI2YWFsOXVsU3JucmZwUThobXJZd21tWHNMb2JDWUw3?=
 =?utf-8?B?TkRQcXBSYkxhRWJNZzZveXNCWWJhQzVsVzZFMEwwMmppQnF3TndZYVJvWFZV?=
 =?utf-8?B?eUJDWXhNYmRJUWlScEFvWk5aZE1oWnBnMnQxd3N6cWphcERpay9HTlVNc3Nt?=
 =?utf-8?B?QmV2MXZ0Zy9qQS9PQi9sdnh6eHV1WDFFQ1JyeVBxMU9RK3FHVmhlREY4YXlW?=
 =?utf-8?B?amhFRmR6RzJSem01c25TNTBvd1pGSjJuT05OLzJmV3V5ZUZHM3cvVWdDKzRN?=
 =?utf-8?B?WlJFUlRxUnFsVTIzMkJqOXNHYnVWOHNZalZEb1l2YVJ1Z2xEV2tQc3liOVo1?=
 =?utf-8?B?NjhoZzgxR3pFNFBsMWVyMGR3V01ZZ1F2SFNoZENMdWt6Y01TTkZ5Yzd3NFJq?=
 =?utf-8?B?eTVmblloVnJlQ2V6eHlZZ3FEZndVajNqSDNSNVJmUnVWZEg1WFRJV250ZmVH?=
 =?utf-8?B?MHpHV1lrdENpNEJiUFcyTlc0UG9qL1dEdHpZKzVkZU8vYWFzWnI0Tm43eWhJ?=
 =?utf-8?B?S0RtR1VXRlNHUmhYNFBwd1QzQVNEWGNaaUNPV0NzTTBYVlY1NFBmU1BocDRz?=
 =?utf-8?B?c054OWc4dzVzUTUwck11ZzkycHhKUEI2YzhVZlNsaytOalFhcU52aXZKMWpk?=
 =?utf-8?B?dFIvV29vMWdjeDhTcVV3cmw3V0x1NEM1aURPamdPd01WU2JySGJydk05Slhr?=
 =?utf-8?B?eDYzQTN0eVJuUSszbmU1TkdFVUlzVW11N3BTTGlWQmt2ajM4dkJoOThyK1cz?=
 =?utf-8?B?eW1YaTFpb1ZBMkxITlIycWNVWHlRTWlZNTZyL1g5Y0c2WW9IWHREdTRoVlBI?=
 =?utf-8?B?NVQwdFBOQ0lEb0pUY29CQ2ZqSDg5WW9lZHltNEM1bEJQc3R5QmFxdHpCSXNO?=
 =?utf-8?B?Mk5vQWp0anBqcDlPdzVWRVdiZEluWHJ2clBNR2F4V1Mwa1F2cnN0OE83Z21G?=
 =?utf-8?B?clpGQ2ZhYjg3QS80T0tnUUhFdGVqOWErdFZoWE9EYkZYbG8wWnJEQUlRczFZ?=
 =?utf-8?B?QjZJVzNBWW1zOTdnNjdlMTFKM2lhRnN1a3BvMHlWbUppS3dIU29qcTJPdFhS?=
 =?utf-8?B?UXZWSVYxdnYxOUp4Yjh1dTMrTFoxWEQzd0o0cUtLMW8vQWFSRmpHZTJVNVNK?=
 =?utf-8?B?Uk82aTRiRnpWYXB4aklNeUdodDNvaXFZUUJZaEVIQks3Z0lUZUJITDNteSsz?=
 =?utf-8?Q?5egh4yBJv0cxde1sKPssN6cgb?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 92984df8-b806-4a54-7d83-08dd75ab6ff6
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 08:08:53.6351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTdtjkC4ni5IGM3wahK+xiNzFr/RnR9RtG0xv8RR/pTC8t6Hb7Ky1lUy7D4ATS/3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10707

Hi!

2025-04-07 at 09:17, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Peter: I know you've not been very active recently. If you prefer to
> just Ack it and let me take it through the GPIO tree, please do.

What normally happens is that I just Ack trivial things like this, and
then either Wolfram or Andi picks it. The risk of future conflicts in
this area (and cycle) should be low, so I don't think it really matters
if you pick it, but Wolfram/Andi should have first dibs, since it makes
for slightly neater PRs during the merge window.

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

