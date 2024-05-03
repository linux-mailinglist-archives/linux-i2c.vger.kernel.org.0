Return-Path: <linux-i2c+bounces-3392-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D59D98BB0C0
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 18:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 858B2B21396
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 16:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE32155359;
	Fri,  3 May 2024 16:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="n0NDzOf9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2139.outbound.protection.outlook.com [40.107.21.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBCD21360;
	Fri,  3 May 2024 16:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714753220; cv=fail; b=K9OCspFnbVYXOchiBV2eHTDhRhcknM1NqBpYII3BEEsFkYLP4I43D+/IOjoBRYrsKdRKfGw8YeiBidSY1OTIf5B8ZC9UmP3+coBSQZ5btLWrPJwe7T89fO1E2ax6lkSTJMNIM6mNjMvCuwss21lsFhpp3JYT8hh4Rtmqt25TCb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714753220; c=relaxed/simple;
	bh=yNvH3CNrNNIrOSv+zm6Bkcyvoo1rSAFBl51zr/sVygg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KKSj5iAUhkas/bMM2IHnZ4W0oYwd7eiSR2MEs5rQN8l23wXYmY4E2uq9UHbzOqi06XNRe8twUywCYB9iMTkgM4MLCcnkvj1P36h7O9VPUSdXJ0XyyyeAzSwWK5Q2KdNNFwQ/oRQUYbG7CGAYUVuKjex0LZ4LVzb/rPVNKHIt/9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=n0NDzOf9; arc=fail smtp.client-ip=40.107.21.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6cFMFFVFCpElKZmtWVe9NSb++1TJy469QjkclfKQ95eH520BNdDjWVpwJs6JhYLZuO0Izjbc1dk0/A+AZS2trLG2lvdmhZYMQNc4AwH5CR4tZt4EGVtsn+WZ181yO01kldNJC4Y8nBOD8mLbKpGPSIkMaLb5JrwvVKtOwrxXmPmMFREka68B3qBhExTeg1/480jSgIulzdpexCbTRSi1ryFO6n1dtHMvQp6qklu/a2NHlyFO0tEscUaxEnwtXaepN4LZbU0ALNtYqX2VyzUunorPB70ABrfYNxS+H/2CTDTTuj8AcQpQrqqx3YpjWSvOLqVmSphnotEbiJwU67suA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQt6mmXODkhqEhmCF3Br8xi6praQGTGC6Jikbnygre0=;
 b=dLlUXljeCtdrcOxMvStgeO4jSI48TrgpGF526/t4fj1CDLJ6b0atrjyLcDzlELSpVJmu7Kwe18QkKyAXWzkkfzwt5qmcysF1ab47nrffeWsrTJe1kk5L4ntMOJ5j4gsDL+2TNyWdikFi1+aMsMHSmxAM69POacQgKiKQoRzJubbCiUVCo0cRcYNJVqpFlazQqGrI9z8MDnqCuxx+oQ7iTs2PrDQyN38y6NEHmZoPyOuj1aIhZF4OLuMZxz7DBvxk4lIuXy22XGrG0DaAsBCLzNzal88D9HyW9rMoARfDo1tUU9NgYHWTE5nG9uLOAZppSa68p5xCx1sElHrbZAxW+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQt6mmXODkhqEhmCF3Br8xi6praQGTGC6Jikbnygre0=;
 b=n0NDzOf9QiOchXsPDc7pE1J5Xa/jqWVK0wt2k+AKQ05oRSh4YR2mxXDmoFryp/LcrGtSa5TtOmzXTA1j8Yk6FZSgEgm84bpFZO/emTNb5ckbNZ1OFesgnOwGnk9pYjcFaenPnl+oPgldXmXshimo75ytgTJPpp5IuPbWELBaJbk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com (2603:10a6:10:1b::13)
 by AM8PR04MB7745.eurprd04.prod.outlook.com (2603:10a6:20b:234::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 3 May
 2024 16:20:14 +0000
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::ac08:df46:97bd:4ae6]) by DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::ac08:df46:97bd:4ae6%6]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 16:20:14 +0000
Message-ID: <8506322f-bfbf-4582-a88b-b300cad2d344@cherry.de>
Date: Fri, 3 May 2024 18:20:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] i2c: mux: add the ability to share mux-address with
 child nodes
To: Peter Rosin <peda@axentia.se>, Farouk Bouabid <farouk.bouabid@cherry.de>,
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
 <c5e375a0-8c64-f244-a5e6-bfcb3400d05a@axentia.se>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <c5e375a0-8c64-f244-a5e6-bfcb3400d05a@axentia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::27) To DB7PR04MB4842.eurprd04.prod.outlook.com
 (2603:10a6:10:1b::13)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4842:EE_|AM8PR04MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 51e54e60-3c51-43c6-d54c-08dc6b8ce9ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|7416005|376005|366007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bXZLQTJrZTE1ai93VkFTaDJMbzRKajVnb21TNkxodFBFay84aHZoRHRpamlV?=
 =?utf-8?B?NittUFRkclRoOGVoWGV1QlAwWjlZTEVmREprZERteURONHhVZEJXSlJVbDh1?=
 =?utf-8?B?R1dEaUF4RlUycjd0VkZ4MzhvN1lHQWlqZHZOWUJsY2JYMFY2Q3BDL1RNSVNC?=
 =?utf-8?B?Q2RwRjhkeVc1OXpmanpnazdEUUFaUzdLQ0RWUXdjS1Y5eHpwNmVlbDhXL05a?=
 =?utf-8?B?dXllMzhaSStUdkErQmoyUnpsZ2NNM3g1clBkVHI0eThMMHFrSDY4RGdSRVlP?=
 =?utf-8?B?TGczazRDeCs4eUxhUFRwcVJ4REJNbG9CQy9qVnJrMXkvZ095V0hDbkRwTDMx?=
 =?utf-8?B?MTcxL1ZMTlpXd2NTb01FdjlVcHlBQThMbkUwQVUxZlJqVldnR3Q2QnRCTlBx?=
 =?utf-8?B?ZlF4SkxsbHlYSGtyUGpsY1NmVUI0TzFSU0xxSUVVVDdQUjBvUENiMjM3YjdL?=
 =?utf-8?B?cWxPSnZiSDdiMDZka0Z4bmxHUVROc0F2ZzVMZWlXaUsyZXNVUDVTbmNnMGFl?=
 =?utf-8?B?SC9RTjdQVm90aDE2ZTFGVWhzTWpxZlJKN0syZVA4VnRKY3JWT2dJdU01QmNX?=
 =?utf-8?B?M05ZQURIV0FZcmZVT0RHOXJiam5FTDNjTEpNbUU1WW5TeGRnT3RaTXF3VGNU?=
 =?utf-8?B?QXNSWDdRZ2N6T0lEWWlheSsxeEhHRlpJQWVVKzdkYWZ1NmVMKzBvV2ErODM5?=
 =?utf-8?B?SGY2OGd5OTZsdXFia08xdlRsNk5Ka2RZV1Q0QUVJd1o0Yzh5NSsxb2pZR3dk?=
 =?utf-8?B?MHlhVkhFUkQ2R1dSTytiSTM0NzdEZldpL2NXK2tFNzRZUjNwUWlqWDM5T3Ni?=
 =?utf-8?B?MGtGdGdzYy9WaVFZWVQzdVNHcS9RY0tPVnpkNXp6OTJ0ZmwzNCtjckg5Z2Vl?=
 =?utf-8?B?ME9IZHdUSStJY2VENXFPQjlQbG52SVdqcWtDbDFJMlR2ckZGeXpMSjkwZDNQ?=
 =?utf-8?B?a3Z6eFNsa2lra0JQSUxNVzhlM3pBUmd2MFovQkpHYWkxQWZaOE84cit4NTdY?=
 =?utf-8?B?V1ZVVy8vNnlWc1Ixbk1JOEZMSEszQTBROURKV3AwU2oraTdWeFZORU42RGFX?=
 =?utf-8?B?TUVEZFg5bnh1NXNLcXRkOHdNMmUwWnFYeG9JT3lQZVh2T1pDcjNEN09pZmNF?=
 =?utf-8?B?Z2p4Y09ZYSt3bjJsSnFNNjdzZlJ0ZEk5ZkpBcDRlZ244K0x5QmRacktvVDIx?=
 =?utf-8?B?LzAyRHl5T24xTFBMS3R4K2xiN0JuZU1PZDVoNWlPbWk4VWJ4ZFZZM0FkYW5Q?=
 =?utf-8?B?S3BOR3JZSHpMcUkydU1RTFVIN0NrdEtuRzUwYThJcVcwTnlYWkR2VS9iRFNx?=
 =?utf-8?B?dXhwME9oaC81Q3VDRnNISVNkM0NUbm1FaHFvTmJNb2Y0SjM0VVVtVHNIa1Qw?=
 =?utf-8?B?R3hzVVR6cDBqaDFyc1Z1U2t6VWd1dU13NDhSUVhhRVhPQVRCS1J0MmI1ZHJk?=
 =?utf-8?B?bmV5MXFKbTNnWHFSR2sxYWpBUENHQ0gxRTV5eTEwZmwva0lyMUJMVGE5MVlB?=
 =?utf-8?B?NnpJNUVxY3dXbTFwYUtoaGRNUlpYZDIwblJaRUh5T2N1dGxPbUVsMDRONXl5?=
 =?utf-8?B?QzNpNFRvVE5EdGpGMHBURlozSy8vZXRhVFFiMjA3YVR3TXoyNDlwcnM5TVlQ?=
 =?utf-8?B?dmRKeVVoR2RzZ0RDSmlOSFNmd2Z6YTNhMWNrdHFPbTNqd1dwSVJiWTB4Z093?=
 =?utf-8?B?WEx4cmpGUUVucnJjc2V2a1E1SXN3WWtXd0ViYTBjbVorN3EwdVFwVGtBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4842.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWVsU1UvTUduK3M5L3J1RVJoS1QvdDVBSjlCWHIzS0hvU1dVdlZiMnRUSDFy?=
 =?utf-8?B?MmdJSEZqZ1JqZ3dNNjZBUFZGVGN4S3E2ZkZ3THc1aHpYOVBIUzBOSXFPUmhH?=
 =?utf-8?B?RnU1RDRuemdSUTdyc1doK1pWeTkxa0VsUWYvTVZyNUd0MzhsQmNXVGI1OXNh?=
 =?utf-8?B?Uk5jQU5ZT2Vsb01JZC85WlhlSGhzMGI2UkZITnhZREExY3IydkNzd2lhTmN6?=
 =?utf-8?B?WlRYUk82d1ZqcDRCUkN2VTFrTElNRVc2WTFQektlMm1OdGZGeHlQMElTZGFm?=
 =?utf-8?B?UDVNRHRJWENobUMrbThDYWhNaXdER05jQTdXN1FaUFpaRk8vS3VLRE8zMExD?=
 =?utf-8?B?bmdsRHFhSDdZcFZjbGUyV3E3OUo4UW5ZR2Z4aEhaT3dMK1FjNkF3UFQ1bXNJ?=
 =?utf-8?B?djRkWjI3OFNvM2F4QUFjdU85ME43L0FLNlE5cDhwZURkMURlaTdZTkJJZ25m?=
 =?utf-8?B?UmMyTzhVMUpsMU44M0h3ajg3YnZwakt2ZzBSS1dPMkZoZy8rdDdBeDZVM3FP?=
 =?utf-8?B?ZXpyMWtsMHdrOHJ0d1BPUERvbElYVGNQalRXbG9yWG9wU1oxeTZyMDkvRGNN?=
 =?utf-8?B?VnphQmtuU3laZnlPQTdiWDlnVzc2ZGZIcmlRZlZIMUlvWFpMZ2pybDlsZ20z?=
 =?utf-8?B?VHY4eVpJenF3anpNMGhkN3BCZ3ZvOGJWOGRWNmJoVTVlTmZtRTNOcVVCaHFP?=
 =?utf-8?B?SkszVWwydTFNRUhTYjNtWW9QZUFUd3Zmd21rVlNGQ01sTVFZNHJLR0ZHZXUr?=
 =?utf-8?B?SUljaFNQTW84WVM4dHAzcFJqaHFiR3VLd3hxOFVqbEVGdmdCODJjVk5UWHRP?=
 =?utf-8?B?dExLMlh1dzlHaVE4Smdhb3RJV2k3RS9nMmd1ODVNQjNRVmtiV1kzd3FQNkIr?=
 =?utf-8?B?SVJyYzNlSkVsUFVRelNoNDdIb2pZUmMrd0VNK1FCTWVPbnMxOWpRandDRDBT?=
 =?utf-8?B?SmlHMzlORnBURGZKTjc5NEVVeThzbDFRbnlqcmNPU0l2bStkU1owdTBJWmps?=
 =?utf-8?B?QWVTbFlNVHRaZ3VCclJvMEU3MzIvSCtZYzlYcGV2Z2hTd3FZb0V0OGJIMXBD?=
 =?utf-8?B?bWhpRk9mbXRWeElCb3hmTjE4U0VpeUwyYzBOT1E3Qnc5aEUwaDY5RVNxeFo2?=
 =?utf-8?B?Vkl2NWJuNUp6N3FuLzhHNDJaelMxVERIajB1bmxJZHFKS3dwdVZoRlh5Rkx0?=
 =?utf-8?B?bmRQUjRIR2pDY3UydEd6OC91OHd6MXpySEFwOXJRQnNJTFRUbG90c3pBK25w?=
 =?utf-8?B?cEdsRjhLOExJSUVFNkZIRTVtcVBoSmRCTDQ2VlNyMC9YVkM1SlhPQjQzOFRt?=
 =?utf-8?B?bXVET1JaYUtZU0ZWRUpLaURPczBNOTZld1RaZVNIQnB4WjZTSUk1cmpLS3Jq?=
 =?utf-8?B?WW1rbVIyS3J5WGxRNXRlN0NvNjRCTytFSk4zVUg3VVZOVXAybWpkR0lLS0hn?=
 =?utf-8?B?djRpNHZid3MvZ1VmVDZKVFVHNnorTlFJdlhEblhDZ1U4WVFGWmU1ZzJvVTNz?=
 =?utf-8?B?ZEVVYmZra0h3TUxTZFlobEw5Vjd4Zmp4M0UxbmlKV0hnMDZ3VFJ2aXpOejVU?=
 =?utf-8?B?TFFOdVptSWxGeXE2ZzVnbXdoeWFPR0dtUnV4WUtIbDJ5c3ZsQ0p6UDc2NXNk?=
 =?utf-8?B?enZ1dENwenh5MnZuVEJybWpnOUFFQUtPU3ZyZlhMNnVaQWQxVHR2TmY5OGNk?=
 =?utf-8?B?Q3AxSnA2am5pVURaR0p3dW8zNEdyKytXRzBNTU1xVFQwSmZ2YXBDTm8xdnVy?=
 =?utf-8?B?YjZPbThHbFNQNWZYbmNPU2ZNemU2TWNNdGZVWk4waHdkRkp0emxpQ3U3M1Yv?=
 =?utf-8?B?cUlsaUwzSjBWc09mdHI2QzNlUXozOWZ4UlFRQlFEYysrTmp3MVdORXA0cGpx?=
 =?utf-8?B?RkNKRjRxV0U1U0MwNUtoUzErS3pkU25PNWtWQTIwYmxPYWZkVUZlTnkreXVh?=
 =?utf-8?B?V3JzYXdLZ2Yzb2dNaFk0RzV2TEdMaGpka1BPZlBveUdUV0c0aWMzQmFWQ3ZJ?=
 =?utf-8?B?ZVBrUEZjblY4MWdDQzBjNmhTNXlTMkpGa29meEhhdVhoZGYzOG56ZVFwTGhn?=
 =?utf-8?B?d0FEL29hSnVwWGNDUXRuZGl0dXd5OGVZRnZIb0x6UWdxcS9tUlovR2RRRVNN?=
 =?utf-8?B?OGdtNXVaYVhiVTBFTWlkY0NVWVpNTVJHVGlBeTJ4Z1IrYUZTY2RtZlBESExt?=
 =?utf-8?B?dnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e54e60-3c51-43c6-d54c-08dc6b8ce9ab
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4842.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 16:20:14.4548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYHGSo6wYq7PHivFXRUnxD1fWAY0LrgnD+nXMkjdTjR5VN6wL47C6ouhlotFv7wjzaJLkp5XNRTaDRInjrX7v+dYhNimQSxZ0clkw8qV9HQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7745

Hi Peter,

On 5/3/24 7:30 AM, Peter Rosin wrote:
> Hi!
> 
> 2024-05-02 at 17:01, Farouk Bouabid wrote:
>> Hi Peter,
>>
>> On 29.04.24 17:46, Peter Rosin wrote:
>>> Hi!
>>>
>>> 2024-04-26 at 18:49, Farouk Bouabid wrote:
>>>> Allow the mux to have the same address as a child device. This is useful
>>>> when the mux can only use an i2c-address that is used by a child device
>>>> because no other addresses are free to use. eg. the mux can only use
>>>> address 0x18 which is used by amc6821 connected to the mux.
>>>>
>>>> Signed-off-by: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
>>>> ---
>>>>    drivers/i2c/i2c-mux.c   | 10 +++++++++-
>>>>    include/linux/i2c-mux.h |  1 +
>>>>    2 files changed, 10 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
>>>> index 57ff09f18c37..f5357dff8cc5 100644
>>>> --- a/drivers/i2c/i2c-mux.c
>>>> +++ b/drivers/i2c/i2c-mux.c
>>>> @@ -331,7 +331,6 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>>>>        priv->adap.owner = THIS_MODULE;
>>>>        priv->adap.algo = &priv->algo;
>>>>        priv->adap.algo_data = priv;
>>>> -    priv->adap.dev.parent = &parent->dev;
>>>>        priv->adap.retries = parent->retries;
>>>>        priv->adap.timeout = parent->timeout;
>>>>        priv->adap.quirks = parent->quirks;
>>>> @@ -348,6 +347,15 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>>>>        else
>>>>            priv->adap.class = class;
>>>>    +    /*
>>>> +     * When creating the adapter, the node devices are checked for i2c address
>>>> +     * match with other devices on the parent adapter, among which is the mux itself.
>>>> +     * If a match is found the node device is not probed successfully.
>>>> +     * Allow the mux to have the same address as a child device by skipping this check.
>>>> +     */
>>>> +    if (!(muxc->share_addr_with_children))
>>>> +        priv->adap.dev.parent = &parent->dev;
>>> This is a dirty hack that will not generally do the right thing.
>>>
>>> The adapter device parent is not there solely for the purpose of
>>> detecting address clashes, so the above has other implications
>>> that are not desirable.
>>>
>>> Therefore, NACK on this approach. It simply needs to be more involved.
>>> Sorry.
>>>
>>> Cheers,
>>> Peter
>>>
>>
>> Another way to approach this is by implementing this flag as a quirk for the added adapter:
>>
>> (tested but not cleaned up)
> 
> Yes, good idea, this is much more targeted and generally feels a lot
> better.
> 
>>
>> """
>>
>> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
>> index ff5c486a1dbb..6a0237f750db 100644
>> --- a/drivers/i2c/i2c-core-base.c
>> +++ b/drivers/i2c/i2c-core-base.c
>> @@ -821,9 +821,21 @@ static int i2c_check_mux_children(struct device *dev, void *addrp)
>>   static int i2c_check_addr_busy(struct i2c_adapter *adapter, int addr)
>>   {
>>          struct i2c_adapter *parent = i2c_parent_is_i2c_adapter(adapter);
>> +       bool skip_check = false;
>>          int result = 0;
>>
>> -       if (parent)
>> +       if (adapter->quirks) {
>> +                if (adapter->quirks->flags & I2C_AQ_SHARE_ADDR) {
>> +                       struct i2c_client *client = of_find_i2c_device_by_node(adapter->dev.of_node->parent);
>> +
>> +                       if (client) {
>> +                               skip_check = client->addr == addr;
>> +                               put_device(&client->dev);
>> +                       }
>> +                }
>> +       }
>> +
>> +       if (parent && !skip_check)
>>                  result = i2c_check_mux_parents(parent, addr);
>>
>>          if (!result)
>> diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
>> index 57ff09f18c37..e87cb0e43725 100644
>> --- a/drivers/i2c/i2c-mux.c
>> +++ b/drivers/i2c/i2c-mux.c
>> @@ -334,7 +334,26 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>>          priv->adap.dev.parent = &parent->dev;
>>          priv->adap.retries = parent->retries;
>>          priv->adap.timeout = parent->timeout;
>> -       priv->adap.quirks = parent->quirks;
>> +       /*
>> +        * When creating the adapter, the node devices are checked for i2c address
>> +        * match with other devices on the parent adapter, among which is the mux itself.
>> +        * If a match is found the node device is not probed successfully.
>> +        * Allow the mux to have the same address as a child device by skipping this check.
>> +        */
>> +       if (!muxc->share_addr_with_children)
>> +               priv->adap.quirks = parent->quirks;
>> +       else {
>> +               struct i2c_adapter_quirks *quirks = kzalloc(sizeof(*quirks), GFP_KERNEL);
> 
> This leaks, dev_kzalloc?
> 

Quick questions about this though.

priv is allocated with kzalloc and not devm_kzalloc and is then manually 
kfree'd either as part of the error path or in i2c_del_mux_adapters. Is 
there a reason for this? Shouldn't we migrate this to devm allocation as 
well?

Similarly, I was wondering if we couldn't add a devm_add_action_or_reset 
for i2c_del_mux_adapters in i2c_add_mux_adapter? Is there something that 
prevents us from doing this?

Cheers,
Quentin

