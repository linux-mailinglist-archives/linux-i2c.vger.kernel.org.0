Return-Path: <linux-i2c+bounces-3382-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A688BA6A1
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 07:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 252F11C21EB6
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 05:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAF9139597;
	Fri,  3 May 2024 05:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="lqoBc/ym"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2111.outbound.protection.outlook.com [40.107.8.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0221C69D;
	Fri,  3 May 2024 05:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.8.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714714220; cv=fail; b=gs3csPpKiPA1K2kK9w6TOXwv4hl9wRjbyv94I6npCC9XPgOs9C//TCBJJ/Lj1sizijoPyN72QAJ0eF9nribLPqDBK+5Iq1b5VxDlastbvl6n9mi58bY0vaNm8Z52No+sp5GoKfvvH+h+PwxHxzylGOwqVstzoNE4pL1Qp+LLb6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714714220; c=relaxed/simple;
	bh=4YeL1f29DITk2bcsRc4tVJ3siqBzMIS0edCwmDheQBw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O8Lm3PXdH3POzl293w1ZTXuHd+3ghwnKsnWJggTzGBZeNoqjIOULkNg2n42TIpC446JRNTnca2O5loPX9HhuYeG5apC7qCKsCT95Vp6wUh2f8a6bnJYYtvh1yf+hOTYw5ypu2rXVNFo7k92nae36zDd6ZtWNizhIgRp+0A7LGuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=lqoBc/ym; arc=fail smtp.client-ip=40.107.8.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDOQRcHxkWNuRcQp/fdYFaywR1fMlhBgdKZkbmZD9jfDafZ1ADr7BeWHsD9VCG+Pyt/Lt5v2YiEXuK2iEsR8pnLhBQDaZDejg0e8ZXZxxQ/J8kYGCiM/U/MFsqdgoxZng00J76SJLItPI6BRFh/Fn1DKtUjJSLOMX9wbsP0c+v1axitDpR/wcnnHl0mTYjayUYH8M99TugcKjJz56yE2F7ARurrXK4p1nluN3U0V755CEkDokFOMo+RouX8tKs+k08mgGfiZwIcueoP7GRCxT5yDakah8WCjrJ+ZhR7JnXtYv/RnDuxcssktgrXQAvd9ZERMDHe1T1qfw7E6qJpT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enDhxi3Adtc2t5dhTINkE8U5kRZdbuuS0wDuQME2Il8=;
 b=An39vKMklOZFxxUI8oMggThoEZa+R27SJTv2c3X1JhFQEU7Nc9Njn1aVG/sLtFkkcZssrQIOoXX/J5A+EV6PvLQArLhfbsCp7taHV0hsq1LqCzf1ypx6gDhjWyJPz2ubnMeZHOj7Bq/nN4giSw7gJMkbX3uT8CA1zCLqgTw+cBUNSo/f3qok3DDjUXxyRgcGStj2mVySKbJjXe409/sbHaMrp8sVBjGIsp47Ax0oU7MgUOW+6GkxyB0MiKeDNNq+XcdSLnXV28+MwQX5xUy9Qz65MbgY6beQYsmlLWxyAlUpCww4ZfBKF6SSkbqi3jEDJ6PvC6Y6Xuz/MT/x8RZ5Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enDhxi3Adtc2t5dhTINkE8U5kRZdbuuS0wDuQME2Il8=;
 b=lqoBc/ympxTnQvkE9apyT/kGv7LwiGYyC4RKvaNMlCSPt6gcDb0aXNA6i4atXNhmLQ5feeaj1MKqDpZ0JTYj4ClUwxFrhYTc8PhSsCUc6/oQ71TBntOPUUC67jNrnPrueJox5BWGA9EN//9y4SbDG8PVvjhRAXTDrTLupsiGxYE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by AS2PR02MB9413.eurprd02.prod.outlook.com (2603:10a6:20b:59f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 3 May
 2024 05:30:10 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%4]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 05:30:10 +0000
Message-ID: <c5e375a0-8c64-f244-a5e6-bfcb3400d05a@axentia.se>
Date: Fri, 3 May 2024 07:30:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/7] i2c: mux: add the ability to share mux-address with
 child nodes
Content-Language: sv-SE, en-US
To: Farouk Bouabid <farouk.bouabid@cherry.de>,
 Farouk Bouabid <farouk.bouabid@theobroma-systems.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com>
 <20240426-dev-mule-i2c-mux-v1-1-045a482f6ffb@theobroma-systems.com>
 <f7ddc503-21c6-10b8-3326-398de65bd6a8@axentia.se>
 <318b22c7-4e90-4055-a893-bb995c16e8da@cherry.de>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <318b22c7-4e90-4055-a893-bb995c16e8da@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV3P280CA0019.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::17) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|AS2PR02MB9413:EE_
X-MS-Office365-Filtering-Correlation-Id: ee349d59-aaa4-4199-3964-08dc6b32195a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015|7416005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2YzNzBKcVV2ZEpQdlRSeUFmckgzT0ZjaXp0bWlHOHVDVnFOV1BuNmJZMHNE?=
 =?utf-8?B?OHRBbXc1Y3NjRWplcTVNZkFJaC92dzZtakVlRkJsODdOQXZMMXJCZHhJUW04?=
 =?utf-8?B?bWx2akJwb0VvejhBanBhNG1HeGxyekkrUkRKQnhMS0dtMWxaZXdQUFYvZTEr?=
 =?utf-8?B?aEdlbXhCOHJuVkk2RDMzOG9NMlhHcU4yb0FCY0JKZWY0SDZweEJxMFBGbUNK?=
 =?utf-8?B?bFVrbGExVEVyMjZBUjBmaUR0R21nNFo2bDd1b3JnaWwrSjFoVERqTFRGS3J5?=
 =?utf-8?B?M0Rwc053RDNVM1RlbzNNREhyNUpyZ0tSTE5FdUpydzl3dG85eGZ2NnorWTVu?=
 =?utf-8?B?TmwvWVRBc3M3NXNINDdBZTlQbGxienlQZzlkVlY1WWRtdEc2eFFLd1lXR0xT?=
 =?utf-8?B?aUVjQzRPTDQ0SzI1ZVlHQUFXTnB5NjA5RDVBT0xvWllUNHZDb3FUTUtNN2J5?=
 =?utf-8?B?RjlPT3N2MXhoYTQyblZnRkp6bGlnT1VFN3piMjZUQk1CY0JEMEF5S3lHSWRU?=
 =?utf-8?B?elU4TE9YaDEvRUdVdUU5Q2tJWnBVSTRka0syRWpnYnI0ZGg4U0FYRGhaVGZC?=
 =?utf-8?B?VU13WXdyWmpXMkhhMitUMzRtODZyUXU1OUdSM3Z0UzNjWGYvd1NqMSt5eDVC?=
 =?utf-8?B?WDdRVFVIT0JIMFdBTFI5aTA0d1NmN1dheERodmM0M3E3c1Fhc29CemJDYTVX?=
 =?utf-8?B?VVlzWWFnZXd5ZExBZDgzWEM1RjFJQ1VKeFdiQzlGVkF3aXordXVmY21kOHIv?=
 =?utf-8?B?QTJyMHNDTEp1VmF2SzJvSjFaQTdsQXpqQ04ycDJ1a3FQT1hYY2ZCL0d0RHF5?=
 =?utf-8?B?NzZyR1JpelBHczdiNVBRN1hpZnN4UFBHWmFYYUs1bVRzRmQvS0E4WVE0WDAz?=
 =?utf-8?B?ZVNGVDZkd3c4ZTZ0c2M5VVMzeEl5VDJucDl5S2xQY3IvTktKNEhQZUovR3FP?=
 =?utf-8?B?WE5qSVk1b3B6cERZSlM3OHg3aEFvanBRb2szL05DQTVhRzJJNFFzcXFyR2VT?=
 =?utf-8?B?KzlVb1BwNUtOZU55eVJZa1NqTGRsSXg2UTZBdE94YVZsaXV1OSs1Y3RNSUFI?=
 =?utf-8?B?UytvNjVpRWJqdEIvY3Zab2txdnh4dlpjTGJXc3hjWUdHdldScDJCUHlHcW5k?=
 =?utf-8?B?ZUpvbkVheWJDK3A5MFVYRUxvdzMxMGdLZ0xYMEZrbVlHaHZhSkpTRTFBSmNr?=
 =?utf-8?B?alVOM0VsbWNjZFUzZlBNaVpCc0pIUnNId3Qrck9Vc0ZSTit3NHlsZ3JxZmpD?=
 =?utf-8?B?bjdZVHluZC8rd21WbldlNUpOYWJuQ2VvMG9kdXNEM2JNVXZrR2xteU5USkl5?=
 =?utf-8?B?YkZ3QjhMWitVam1KSUNKZW8wQVFYRWVFbTA5M1A3UzhWeDZlbFBFQytSRTAw?=
 =?utf-8?B?T3JtS3hYeU83VGV5MzNPenJ5bW1pVEpkeVp6U25wa005aEQvOUkxd1NlNFhJ?=
 =?utf-8?B?RndHSnJ6eVJ4cWFpcCtqV3JnNC9pb1dnQTNhY0FYcFlqaGhiVG8zd01kNFRF?=
 =?utf-8?B?L2paRkdVbXBwdnpTMnNNL2xUR0M4SHlINXdJYXpIeC9IbGxBWTE1VGJjMy9D?=
 =?utf-8?B?dTlwQTNJR3FobzM1aDhLUU54bzkxVDRUTXRXLzhxU2tWZ3RnRGtsbThuQk9S?=
 =?utf-8?B?M3JkYnBTTS9kZytzVDREOS9aYmxsKzlqZDV2all5U3MwaXEwR3VBOGtES1ZK?=
 =?utf-8?B?OWU0dUhNeEk4SnVRSWJQV1BZOTBhSHFHWFdOcGpaVjFxRUJ1SDE2WitRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(7416005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTVnZTgxYkZ4V1hydCtrb3pSUXJQMlA2Ykd2Z1U1ZmI1M25FKzZ1OElsWk5Q?=
 =?utf-8?B?TmlpZ1VsaThyRU84bGRVV25IQlV4cHpDeW1SV2YrdWhWOHFudkU3TWt6NWY2?=
 =?utf-8?B?ckF2SWpvOW1pWHNSa0hGV21UQlRtN0FsZ2dvMm1UOVRYL1NzNjBvMHNoS25j?=
 =?utf-8?B?elEyQkdQQmxscnplRFRyTDRnN1N4UC9SbzdycWpwNDlmVWRUMXdnLzh3cEJq?=
 =?utf-8?B?aUxidUtON29IT1pzWENmNHpkTFhwQkFsZ2ZUdXcwNjdPZ3llOVVpUkpJdmw5?=
 =?utf-8?B?QVpSemQwaTVXV05NY09xbWUvVWZlK2lCcHVPS0hMRjgwY1B4YU8weERNaCtv?=
 =?utf-8?B?VDY0amMvZm95ejg4MDVlaXNHNHdwWXBzWUZBM2YyRHFJdHVPTlkydzM2WE83?=
 =?utf-8?B?YnRNZUZhdFloWTN4T012SEtyUmxnV0VGNHlRMFk1cjgwNHViRk04YmNOV2Rr?=
 =?utf-8?B?UXFiS0E3ZjEwK2ErMEdHNDBDMktKM0JXZlU5disyMlhJNFNZNThET2N4TlI2?=
 =?utf-8?B?d2NBZ0d6bXRWZzViL2JJK0Y5TEVBOEFuclN2STRQcVVLQ1A2cHZ1d1Bxd2Np?=
 =?utf-8?B?bUZQTnEvYUhPcjV3QWRtZU5tUk9YOWRMNTJLUTRyeWJldE1jT1ZtQms4MnB5?=
 =?utf-8?B?c2E2MENhQzRiZ21ad1cvZFVhZy9YWWg5ZXJKNzVhcUFFYXRVVW5reG1KWDdj?=
 =?utf-8?B?ZzVtNHZjK2RzSW1ZR2R2V2ZlQUtPWityTEtQdWhlaDFXWmNvb29Od1JyRGxZ?=
 =?utf-8?B?elpqWnEzQkhwSXVab2NvZ0krazE2bU1WRmFVRjZNc3o4Qkx6RkFBTUdTNGY1?=
 =?utf-8?B?OUxicUpiZ2V4WDNMZDlvRXhHcUxuNFFNVmdrengwdm5DTGs4ZDFJeDRncWtm?=
 =?utf-8?B?RkY3NldWVVNzY0QwRmJSaXUxcW9zdnhYS3pHNkNYb1RtaXRNRHBLcEVCUnMw?=
 =?utf-8?B?Tkh5VkwwcC9hOXpRMGQxcmF1RUZBWm1WQ1ZVQ1Y0d0VxdHNCYUsraGE3Mjhw?=
 =?utf-8?B?azV5K244ZWxFK0xZODVPY1dxUUFqTUNob0gwSVFpVFhsYzV4ZVhocFpDYVVl?=
 =?utf-8?B?V014UUdxckM0KzBYL2VvaW1ON1djRUQvL0hZUnc5UnRzYkV3WjVVUTRMenhN?=
 =?utf-8?B?Nk1WUVlQaGFzM0ZBVy9YSmxmVW12OVJUenFkSWh0NHNtdnA2Ty8yT29DNkU1?=
 =?utf-8?B?dmpYc2VEUklJWEJrRmhYOFg0UTdPTS95UDFWbTlndTFndWdKZ3J3bCtuSHhx?=
 =?utf-8?B?WmpoVXI1bkhlY1ovUzRpK3g5ZjREN25Eajc1NTBSeDJMYmdiSWpmZE9GdWxa?=
 =?utf-8?B?cVdkVlVnSmtKNjV5M2xNamE3UHpjaGd4ZVo4eWIwZkdoZ3h4b0dlYUNSTWV3?=
 =?utf-8?B?d3JSMlM4VjNEWWtFaXNjaXZGa2lFU0tNSmU4VDRabEs5SDBINWhFK25qYzds?=
 =?utf-8?B?WXRlTVIxQzlOTXNXaGhSSE1TYkU0dFZxMmRZbTZsUEJMTkZGdHpoMmV3RlNa?=
 =?utf-8?B?YzNUTy8ySWtzc0pPSEpTdHJWOWw0S2toNDRsQVJTTDNmWHNFc3JjbmhUWk80?=
 =?utf-8?B?bmFTcEt3ZDVZakVEOWZWelhDOWRVQUVDM2VHVVVSSndyRHBENnpFVkZydDUw?=
 =?utf-8?B?dzVQQzdacEhOTnRjWXozOWJzMG5CQlNEWjIvQlRSWkJES2wvdXE5K084eEh6?=
 =?utf-8?B?SjNmZjE3Y25Nd25tdEhIR24xTWdPajhocUlBT3lMSWV3Y1lmZHhId3cyb2lI?=
 =?utf-8?B?WmJMcWx3WEpjTmR4NUZaKzdjRmo0L1N1YmJ0bHFZNkJGaXd1c3FGcE9LY3k5?=
 =?utf-8?B?bUdiZm9KNXRwUHdWZEhZQncvRUVOVmdiUThTY1dsT3hxM0lnMGlFaEE1VUtW?=
 =?utf-8?B?SmQ2cmhwdVV5bFFRQW9vZnU1UGFwbHdaWFhuWmtrek5KWUZOajk3eWZDV3gw?=
 =?utf-8?B?ODlhZFpSU041S0J3Z1Z0YnZkT0lyakJxRWg0dGoyZ29JVGJlYXhEeGYzakQ4?=
 =?utf-8?B?KzUydnc1NVo1YkRTcGVidU1WaEFrSE5MQjRHSEJSRTU4bEtMOWFzZGwyYUZZ?=
 =?utf-8?B?MmxKSGxNWUFvdEo5M0c4SWREWlRjemdQVjM5YktGaXkwbTNqaTVQRUVHYjNJ?=
 =?utf-8?Q?+QQpOgal8/oj+5Ds0wwO0ziOT?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: ee349d59-aaa4-4199-3964-08dc6b32195a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 05:30:09.9039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/LdkZNiuKs2StPelxppy2OjzdX3W4YSPdrL9erumjKGRXMBMoL6y2R83eKWkuvJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9413

Hi!

2024-05-02 at 17:01, Farouk Bouabid wrote:
> Hi Peter,
> 
> On 29.04.24 17:46, Peter Rosin wrote:
>> Hi!
>>
>> 2024-04-26 at 18:49, Farouk Bouabid wrote:
>>> Allow the mux to have the same address as a child device. This is useful
>>> when the mux can only use an i2c-address that is used by a child device
>>> because no other addresses are free to use. eg. the mux can only use
>>> address 0x18 which is used by amc6821 connected to the mux.
>>>
>>> Signed-off-by: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
>>> ---
>>>   drivers/i2c/i2c-mux.c   | 10 +++++++++-
>>>   include/linux/i2c-mux.h |  1 +
>>>   2 files changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
>>> index 57ff09f18c37..f5357dff8cc5 100644
>>> --- a/drivers/i2c/i2c-mux.c
>>> +++ b/drivers/i2c/i2c-mux.c
>>> @@ -331,7 +331,6 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>>>       priv->adap.owner = THIS_MODULE;
>>>       priv->adap.algo = &priv->algo;
>>>       priv->adap.algo_data = priv;
>>> -    priv->adap.dev.parent = &parent->dev;
>>>       priv->adap.retries = parent->retries;
>>>       priv->adap.timeout = parent->timeout;
>>>       priv->adap.quirks = parent->quirks;
>>> @@ -348,6 +347,15 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>>>       else
>>>           priv->adap.class = class;
>>>   +    /*
>>> +     * When creating the adapter, the node devices are checked for i2c address
>>> +     * match with other devices on the parent adapter, among which is the mux itself.
>>> +     * If a match is found the node device is not probed successfully.
>>> +     * Allow the mux to have the same address as a child device by skipping this check.
>>> +     */
>>> +    if (!(muxc->share_addr_with_children))
>>> +        priv->adap.dev.parent = &parent->dev;
>> This is a dirty hack that will not generally do the right thing.
>>
>> The adapter device parent is not there solely for the purpose of
>> detecting address clashes, so the above has other implications
>> that are not desirable.
>>
>> Therefore, NACK on this approach. It simply needs to be more involved.
>> Sorry.
>>
>> Cheers,
>> Peter
>>
> 
> Another way to approach this is by implementing this flag as a quirk for the added adapter:
> 
> (tested but not cleaned up)

Yes, good idea, this is much more targeted and generally feels a lot
better.

> 
> """
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index ff5c486a1dbb..6a0237f750db 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -821,9 +821,21 @@ static int i2c_check_mux_children(struct device *dev, void *addrp)
>  static int i2c_check_addr_busy(struct i2c_adapter *adapter, int addr)
>  {
>         struct i2c_adapter *parent = i2c_parent_is_i2c_adapter(adapter);
> +       bool skip_check = false;
>         int result = 0;
> 
> -       if (parent)
> +       if (adapter->quirks) {
> +                if (adapter->quirks->flags & I2C_AQ_SHARE_ADDR) {
> +                       struct i2c_client *client = of_find_i2c_device_by_node(adapter->dev.of_node->parent);
> +
> +                       if (client) {
> +                               skip_check = client->addr == addr;
> +                               put_device(&client->dev);
> +                       }
> +                }
> +       }
> +
> +       if (parent && !skip_check)
>                 result = i2c_check_mux_parents(parent, addr);
> 
>         if (!result)
> diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
> index 57ff09f18c37..e87cb0e43725 100644
> --- a/drivers/i2c/i2c-mux.c
> +++ b/drivers/i2c/i2c-mux.c
> @@ -334,7 +334,26 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>         priv->adap.dev.parent = &parent->dev;
>         priv->adap.retries = parent->retries;
>         priv->adap.timeout = parent->timeout;
> -       priv->adap.quirks = parent->quirks;
> +       /*
> +        * When creating the adapter, the node devices are checked for i2c address
> +        * match with other devices on the parent adapter, among which is the mux itself.
> +        * If a match is found the node device is not probed successfully.
> +        * Allow the mux to have the same address as a child device by skipping this check.
> +        */
> +       if (!muxc->share_addr_with_children)
> +               priv->adap.quirks = parent->quirks;
> +       else {
> +               struct i2c_adapter_quirks *quirks = kzalloc(sizeof(*quirks), GFP_KERNEL);

This leaks, dev_kzalloc?

> +               if (!quirks)
> +                       return -ENOMEM;
> +
> +               if (parent->quirks)
> +                       *quirks = *(parent->quirks); // @fixme memcpy
> +
> +               quirks->flags |= I2C_AQ_SHARE_ADDR;
> +               priv->adap.quirks = quirks;
> +       }
> +
>         if (muxc->mux_locked)
>                 priv->adap.lock_ops = &i2c_mux_lock_ops;
>         else
> diff --git a/include/linux/i2c-mux.h b/include/linux/i2c-mux.h
> index 98ef73b7c8fd..17ac68bf1703 100644
> --- a/include/linux/i2c-mux.h
> +++ b/include/linux/i2c-mux.h
> @@ -21,6 +21,7 @@ struct i2c_mux_core {
>         unsigned int mux_locked:1;
>         unsigned int arbitrator:1;
>         unsigned int gate:1;
> +       unsigned int share_addr_with_children:1;
> 
>         void *priv;
> 
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 5e6cd43a6dbd..2ebac9e672ef 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -711,6 +711,8 @@ struct i2c_adapter_quirks {
>  #define I2C_AQ_NO_ZERO_LEN             (I2C_AQ_NO_ZERO_LEN_READ | I2C_AQ_NO_ZERO_LEN_WRITE)
>  /* adapter cannot do repeated START */
>  #define I2C_AQ_NO_REP_START            BIT(7)
> +/* @fixme document and find proper name */
> +#define I2C_AQ_SHARE_ADDR              BIT(8)
> 
>  /*
>   * i2c_adapter is the structure used to identify a physical i2c bus along
> 
> """
> 
> This works, however this only supports device-tree because of of_find_i2c_device_by_node. If we want to support acpi then we can either:
> 
> 
> 1. Get the Mule i2c device address from fwnode_get_next_parent_dev but this is static since v6.9-rcx.
> 
> 2. Pass the Mule i2c device address as a new member of  struct i2c_adapter_quirks.
> 
> 
> I would go for 2. Do you suggest something else?

Yes, 2 is definitely neater.

Thanks!

Cheers,
Peter

