Return-Path: <linux-i2c+bounces-4086-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D328690D85F
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 18:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8CA51C20A03
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 16:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541C174063;
	Tue, 18 Jun 2024 16:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="JJ9a+hWR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2116.outbound.protection.outlook.com [40.107.22.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFBC4C630;
	Tue, 18 Jun 2024 16:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718726997; cv=fail; b=Hq7n9CMyJrbMoZ+RMkYmYJQicKkd7WQhbHVNWroE7jGuVqMwPOS7eu8+F6ATaqDuCMYZYpKydL0k9MigXcq5OziX0XAVOZhcqyVQY98z+hyN8xwoCaSK4fRLNkuEJR2Pezq9WRmeE9bfo+La/n/rk1aXaUpOj0iTzHWEccQp2jY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718726997; c=relaxed/simple;
	bh=XEfqvOHcNNYiLN7v0dZ5/kV7FJ61q35H7xzPxD1b/mU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fPG8O/0IcsGD4G21ukonnY3VZIvXlCIb2sUIlUl0/qNvoNrRExPNnmR2QNO500NrWkYjT7UHTGW/t2ChMSIRLt8HMN4hTJwEXv462wFxEydo5cUkG8hN8MMeAE0K1UvXvChdD+l1wmjD9I5IpsXURrBHzebgSNNR7wh4OE8DYz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=JJ9a+hWR; arc=fail smtp.client-ip=40.107.22.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0uSTurEV0fukxyzHG0yA7EsFCM1pk+gQ9Jl2y2YLTwTv0r9sEZSlSxK1EKeBBEkYY31mKlTopLNUZ+NQQTDzuqOcyWXSbBXZJUp1kYSHdXQtoHmXiEBNnAHoXK3fKY/vgIo0AMJdZAhyY+oGL9hYHxL8AB6vyeihQTTaXtGXSfgoVZiNJaS9qJp5PVwhG5bMxnSMTEU7TjtnsnAAkuz50Pwna1WkHKnHHQ998LGMhiqL1fQoz/kJo2YXh+rne9IHdZRRdckn6yUmMryI1vNWflQ7jQpk2YitWrrWIL2Qrr2EDeqnosEq9DKToKF7f4gqjhwrb1SZbmWYA9Ez2t8Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2z5e7rgCz+d7AjJV8SAIlOSx0KmT8TyU4loHyhJ0NA=;
 b=elF84OGBo0J2xyxpMDAobO3qFFkC9lm8bi+utWXKYmQ+PB8ckVVjKj0kIoFpAJq7NAV+vjppqZGCJq61vHdNHV65Tk1V6CzV5j7yOkQhCoRHzxVftMjV4PWU1+zfDuBuidPYI1HCycyJj4aBsdTMbTTa8XkbZsR6lZrc6rH7yZ8gvIJIVtd8w2j0IsEdLlOmkGchTD697JfaHSubgjCBQmRf/R1mAFo5Puj87FlbUfRZffA9dpPG5vKHr1+QCKTK+qS4qMK010g+N0Nx5vFmlOaxHSkho1R/du9A9bv2HjZTr3CrmMU5oPlA37IsPBXSkhAfw2mn4X2Xv7CdMzaQfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2z5e7rgCz+d7AjJV8SAIlOSx0KmT8TyU4loHyhJ0NA=;
 b=JJ9a+hWRcGiKpKEjsLCnImy6AlwQg4QCwNHCyEQHXzfcNaoXEl1aH3KERwQsH++k1Co2gO3jfF9Ao3Wh1bivZs0ECFhckvDzwkfPMOfrknu8pL+6Pgio239T78ZhS7TGLbGw03koLrK4saqw6RFm0wAC7wAl5eqNyYEwOObk6bQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by VI2PR04MB10642.eurprd04.prod.outlook.com (2603:10a6:800:27f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 16:09:48 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 16:09:48 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Tue, 18 Jun 2024 18:06:43 +0200
Subject: [PATCH v4 1/9] hwmon: (amc6821) add platform driver probe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-dev-mule-i2c-mux-v4-1-5462d28354c8@cherry.de>
References: <20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de>
In-Reply-To: <20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.0
X-ClientProxiedBy: VI1PR07CA0286.eurprd07.prod.outlook.com
 (2603:10a6:800:130::14) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|VI2PR04MB10642:EE_
X-MS-Office365-Filtering-Correlation-Id: 452b9efa-b473-4909-7955-08dc8fb11397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|52116011|7416011|376011|366013|1800799021|38350700011|921017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXFhMGFaYm1RNktJQTZPaEpVYXVPcHdiRE9Bb2JaZjEycHJpbkNjTEQ2bWti?=
 =?utf-8?B?dWdibTNsTHVyb3NCTldzOFhmYmpYT2hNZys1Vk4rd2N4ZjhFWllacStnSHFo?=
 =?utf-8?B?N1p2dlYraTRNcHRTeU9wOFR3cStrS2t5cnJodk9vaWtwTzNEM0lLb3FUcE5L?=
 =?utf-8?B?NDl6WjdvYWhITi82WVFXZnpEOEdvbnJKODhMZGpFOCtTYm81QkVPcjkyM2hT?=
 =?utf-8?B?c3BpY2dQdFBLTVU5RXdHZnc5eEJoOUF0bk1yOGpydC9FVjc3ME5yeFZpWExP?=
 =?utf-8?B?dGgxTnNMblNXUE5ZdXEyVTlXNGhoR2ZQaCtRZ3dHdHdRZHZMOHVZQWlvNlh4?=
 =?utf-8?B?V1RjYXhJNUZncTdtU3V4ZFpYR1pydnAxTEIrVVBNamRmV2lRanc3ZVNDSlE5?=
 =?utf-8?B?WUJEQ2lZb0RMS1pWMDk4MFprUlZONGRpRFR3SkUxSEdobmdBL3ZUZjhlOFNh?=
 =?utf-8?B?aFpXY1RPa0JSaWgvWDVPVFVha2g0MmgvVlBJYWp0SzRXbW9oUkRBVlhQQXpu?=
 =?utf-8?B?SXJGS1RwTEJ5RktrMEZuWEl6b3Yvd25YeVduV1B3WXVHUndZV2JqMzBlUWJM?=
 =?utf-8?B?WldhZlZ0NGU1M2hLU0RpUkg5NTBhcVpjN2syeHlyRWkzLzBGNUpvMEdGd0Ex?=
 =?utf-8?B?dXN5WU9iSTAwaUQvaWxxamd3TWE2c2FqQ2VOakEvcXJsN0NFTUx3OGJKM1U0?=
 =?utf-8?B?M0cxZzh3VVhUbldZZGhNMUwxeE93ZFdsN3paMG1RSnhKUndQeVZsVVJBQVc0?=
 =?utf-8?B?MFBhdWxicGlDdjcvOFRudUdYUVREbHJLUHk2Y3lsSFUrc2xwUC9HNmFqZS80?=
 =?utf-8?B?cFc1TjVaLzlodUorTnB3TXVLQndYaHB5cEZHY1YweHIvUU80Vng0c2hEdVQw?=
 =?utf-8?B?akhBYlUyZStQNitrRzlYbXc1TjdDTnFCWkhHeCtmajhRUjluYjJxNHdZczFw?=
 =?utf-8?B?VlV1Z29udmFKeGo3cVhtMTdPLzJpUTJ4Q1ppU21rZlB4bHE4SjVDZjBUNnBE?=
 =?utf-8?B?SkpicjdHdFR1d0EwWkpLN01LR1UremZKQzE2T2VGVmk2amV3YUdNM0daV1Bl?=
 =?utf-8?B?RWM4ZWxtdWFwOW5KUlV3emtyM1hPOXBQMTluOSt6OHdOYXVqOHZTa3Q5NFVh?=
 =?utf-8?B?VnM3M01ENXhMTEdKQ3BkZDZYRHpnbmh1SHlVV0pmSDZqQmloVytnZUk3UzE0?=
 =?utf-8?B?U1kvK1pvOXMwRFd5MlJhZHNmb1lxL1BXVkczK2R4ZzdSMWIyVlA2dXdJOFly?=
 =?utf-8?B?K3o1Sis2cVNkcVYxRTVGOHhkMisvYjJpL3FnSi9JemwrUzhtSy9GejZmeHg2?=
 =?utf-8?B?VUd0ZUpoYzZpUm5wZTE5VXdTS1BZWHN6SFhLVURWa3JHU1ZISEdTUS9qNENo?=
 =?utf-8?B?VlBLT0ZCRm1LMVEzcUlaTGlLcGk4enpoNkl0TlJCK0lJc0RKaTUwSnp1TThr?=
 =?utf-8?B?elNFWWFRZm1CSjBxR1JLYVVDK292ajBtUW1PWG9rTGVycmNOOTBVN3ZPS3BB?=
 =?utf-8?B?ZmRmc2c2TUR3R21Ub0d6WUlTcmF6cDMxRW5GZTVhd3YxVXllYzcxaTlnWkQy?=
 =?utf-8?B?WmVaMmFBMmZLUWxEVUsvVDAycUpZRkxaaVdMUk5mSlR1ZStjRGZoY2txQkFn?=
 =?utf-8?B?aEtSaWp4S25FVWw3dGlFeTJUTnNac0U4K1NsclQ1Y2x4TUFubHpZeWRKZE9w?=
 =?utf-8?B?UGw5NUhoRkxPc1hla25NM0VJK2lnaC94NkV6dldpZHRWa0J6V1BQaERBcTds?=
 =?utf-8?B?OGJzMnlYclhnck1iTVFLM2hPSjNlT0xHck9hb2dlbW1jWHVTZk5SRGhMcGxw?=
 =?utf-8?B?ZXY5cE0zMXZ2cWlZZUt0MElVdUw4OWtqQ0ZRRVZMSzdFRTJuM3ZvVVd2QnlW?=
 =?utf-8?Q?uJaQ0VKTVDYuR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(7416011)(376011)(366013)(1800799021)(38350700011)(921017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zzlha0VLMjlheFdiN3JmVE9XV2xpd3BpaEZKdlMyakZJZnRQbWNYZCtQSzRW?=
 =?utf-8?B?QXVHYjhONlBHYWJNQm1vVmVNL3Q1QUd6NnJkZ281RHp4bStKalF3WG5JenJk?=
 =?utf-8?B?WEVEWktXQ3FPODR6VWdVODRzanoycTA0Ym5UMUlCUExNUVdFWjRDUUpERVJ1?=
 =?utf-8?B?SmVETXJTbklyM1ovVWJNZmZjbElhTXh4TkZ3aUM1V1laT2puWlgrRVpOUFky?=
 =?utf-8?B?V1QrVzlpV20wZUhrMlVBT0lLeVZMcWNvc0xIcEhkbzNKb1R3SW5PcnBOMDR6?=
 =?utf-8?B?Um1kbHgwbnpTK002SEMxTzVIZThQYWdHM0ZWVWoxaXBQbkx5Z1JST0d4Y2F1?=
 =?utf-8?B?bDVNcmRBTHNCSXBuZzhMN3FKRy9OZlZib0pPVGVzOE5Gb2NFLzZ5OXcvNktP?=
 =?utf-8?B?VHdOaDZGUGpvRlNoWTIwOTFGTTNTWXpBZnlTUC9MYmc5T0NZeG1KMW5nMDJm?=
 =?utf-8?B?N0NlaUI0SzdYOXVoV0VRd1FkR2d0Z2xJT2thTWZ1aWNNUUFSbVRmWHVSV2Rt?=
 =?utf-8?B?MFIwWTRQTE9OZ1F2ZDlwRHk5OTltUkN6bkV0OVNxQmxudWRZYWxJS2MyOWxs?=
 =?utf-8?B?ZUhIYWtKSDk5b2VUTFVIaXplQi90S1NKZVdoa3pRakV1QzJrcUlseEFRYnk2?=
 =?utf-8?B?bVN1ZS9WaG5zeDNlOTNLNDhIVUR4aE13ZUYreW1NK3VEaVNUYjNROUhPNU51?=
 =?utf-8?B?K1RKNkFwQmFaaHdhOG5QcFVZeGVFOTl4akxOKzFMSnBIR1dOamVPR2dDNFFp?=
 =?utf-8?B?Zlk5QUUveEpHRWZhMlZvdVg3OXhQQ1A2UUhPdTBRYmZiaXhhellzOUxmVVky?=
 =?utf-8?B?Y1NhOFhqczcrKzNOUE5UcXJXcTZuZUlxb0plbE5nK2M0L3BaSnpqRFlScTRU?=
 =?utf-8?B?dUpLSDMzUDVSd0xIRXlaTTRESEFuV3o4NDQ4a2xrNVh3aDJtVVpTc3FkUEFR?=
 =?utf-8?B?Tm4wd0pyWElsZWpTbWMvK25HZUVhVWp5Ni8xQWRPS2FIbEtHTDdmUnNCOG10?=
 =?utf-8?B?Y0x6MFJXRUlKeUFnaHFiVE8zOWlFNjVacTJVN01kQllzN201QS84QWI1cnRO?=
 =?utf-8?B?NU11dDNQQzdzK1QydEpUM1BQdWNJVWNackNqNk96Nm1uMFQya3g0VmVUZGVa?=
 =?utf-8?B?NmI0RVZXWjRmVWxKemxZVjg0bnExaXJaVGtUaXBHQkhjNzFDSloxcWtkTENS?=
 =?utf-8?B?TGh4QUpsY25QaExUUEI1QkFHd2p2M1BGU0d6bnAzK053OVJOdFdLdnZ3VjJl?=
 =?utf-8?B?MmpWNjJuZmhEdTJ6ZlRCWDRHVWVleWJWcUplRjA0M2xiSGQ5S3o1ejJ0NFVR?=
 =?utf-8?B?amJsZHZzUG9SSGFKNzNtcHlLL3RmYU5uSEc5cjIvK294bGtpU2cxcGZ2WWR1?=
 =?utf-8?B?Z1lWaEVESmhLNDFNbnQ0NUM1dE1XOHNpM3A0cFNvRHFrbktHMm9jWWZTZzZw?=
 =?utf-8?B?bkFFcVhEVVd6ODZHYjN6VEcwTzNSSDJNNCs2d2xtNDNyTlU5dU1QK2VhQzNV?=
 =?utf-8?B?WWRWTkVlWTQzTFhNcVhkdTZNTkZWOGxMNS8wLzMyRUdRVHRWaDBsemg5MlBo?=
 =?utf-8?B?dGFiTTFtQ0VSOVdadnVKc3p3MkVVVjdDUGo4andCRHlobXVIRXJWVkgyK0xJ?=
 =?utf-8?B?b1FDVFBvMndzMDl6RmE2cnhPelpGUmc3aG9DcmhiRk4rZ3ZiTWdnMnpLMGNs?=
 =?utf-8?B?YmF6aVNsb2dJRjhHTk9PZUlvVWpRMHhaRnhhUWdNamV6Z2J3MUlMWkM4a2NM?=
 =?utf-8?B?cHhQM1NYdksyMXdkOVkzZVMzUFAxNjFTWVFxTVVDRzhnbmZiRkp4VC94WG1C?=
 =?utf-8?B?czV1MmJWdlp5WVZTdUs3NG1NMytNd0VzN0RsODNqNHh6ejBJc1F1UktuZ29l?=
 =?utf-8?B?OWg5OGs0djJGT3BWOEUycXJGQzFjMCs0S1lwZ2JCQSs1b1BTU3o0T2FiczUw?=
 =?utf-8?B?OXcrWjdMWHdyNG1BZFNSd2ZMSlhKQ08xMVBEYlNEMDNzL3VQZU8vMW1jQkUx?=
 =?utf-8?B?RHU0NmliU3JBS0pmcnN2TEdud0pJbzN6dlltMzdUaVhtSUdJSXV2QkowdnVo?=
 =?utf-8?B?SEtqd1BQRW0zOXc1aDJFS2kyOFNlb1pSSnpTY014cnBMTklMeWJINno1WEFR?=
 =?utf-8?B?clBnOG5iNTlPa0VaVkhiclMwekhoK2wxVEhJR1pENEZrWkozZlJ3YXBQRlpQ?=
 =?utf-8?B?VUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 452b9efa-b473-4909-7955-08dc8fb11397
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 16:09:48.2574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDe1OPC2Zr8WDET/+jmgnUIunZPnxj6OFLXnnzRsfvnIKjDujgcoUcYXRUPytvBfFgG89j3bneTS5Eb0rs271IEzNxOHy/9TLcrfLujThKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10642

Prepare for probing amc6821 in an I2C MFD device, by adding support to
probing amc6821 as a platform device.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 drivers/hwmon/amc6821.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index 9b02b304c2f5..464991fd7fc9 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -18,6 +18,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
+#include <linux/platform_device.h>
 
 /*
  * Addresses to scan.
@@ -900,9 +901,8 @@ static int amc6821_init_client(struct i2c_client *client)
 	return 0;
 }
 
-static int amc6821_probe(struct i2c_client *client)
+static int probe(struct device *dev, struct i2c_client *client)
 {
-	struct device *dev = &client->dev;
 	struct amc6821_data *data;
 	struct device *hwmon_dev;
 	int err;
@@ -927,6 +927,18 @@ static int amc6821_probe(struct i2c_client *client)
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
+static int amc6821_probe(struct i2c_client *client)
+{
+	return probe(&client->dev, client);
+}
+
+static int amc6821_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	return probe(dev, to_i2c_client(dev->parent));
+}
+
 static const struct i2c_device_id amc6821_id[] = {
 	{ "amc6821", amc6821 },
 	{ }
@@ -958,6 +970,16 @@ static struct i2c_driver amc6821_driver = {
 
 module_i2c_driver(amc6821_driver);
 
+static struct platform_driver amc6821_platform_driver = {
+	.driver = {
+		.name	= "amc6821",
+		.of_match_table = of_match_ptr(amc6821_of_match),
+	},
+	.probe = amc6821_platform_probe,
+};
+
+module_platform_driver(amc6821_platform_driver);
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("T. Mertelj <tomaz.mertelj@guest.arnes.si>");
 MODULE_DESCRIPTION("Texas Instruments amc6821 hwmon driver");

-- 
2.34.1


