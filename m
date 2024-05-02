Return-Path: <linux-i2c+bounces-3373-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA36B8B9AA6
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 14:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCBE61C20EF2
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 12:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4469F768F0;
	Thu,  2 May 2024 12:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b="eVUQ0q0V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2109.outbound.protection.outlook.com [40.107.241.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A1767A0D;
	Thu,  2 May 2024 12:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714652471; cv=fail; b=Xtsd/9oizjBBTxyQJYuwWNgYiXlScH8frppZCYrGNHVz8sze970nd/rFMsq7o96hCxU136E/G/4dP77B+QyfDbLT/rVNZUUqLdHyfkMjcCGgrnv9msRmBltVGZ7W9pHHT1stqXf3srn6Rjyv/64zUhi//L4VvRqC2Mz0GVaXolk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714652471; c=relaxed/simple;
	bh=6Fd+0klCFg9CRBJ5do29BsPdiC98ajqLjUkSe+3cl34=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IvzLSnVBhlaQooAssm8K/0sCI1+IKYcSPE4Qu9DGYqFRD8TuZTaYIFQFfwTCNQ/FvckfXjT55hlqyme1WpWWLOC5KK65bm63fgDxiDQxqOyv2wYLR8ni4l6oNMDP80v0XVYahn8NW1Fbg0QBA6MEFq+nCXtQUAZiEZpB7I1ENbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theobroma-systems.com; spf=pass smtp.mailfrom=cherry.de; dkim=pass (2048-bit key) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b=eVUQ0q0V; arc=fail smtp.client-ip=40.107.241.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theobroma-systems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgLQhTvjgbU/g0BmdamdF05t+V8i01SIpgtIto14IA+qZVN1r+BDR/+hTCqKbW1+3KRZosiz9EzFoPZDwT1cggDgXALwHa9Ov723TbHd0hTERGRm4FjQInnC6vEWZUHBYCsL7+ufRDpVtlPV9qTW+5coQGJS54/ip3iPfpJzELOxJ5EfJ5EcrZThEz8zhHvMjlQwUKpZXsMv1d7THrzPOEHJrITsFhVjXy2nhp41J5OQXNyvsC6+rxiQ5VIHQSnjb5g/ZcBTM0K7uNg9/XtTHiPJ+G26TfuhE70Kh5BEJvEQkpaGYmNz7C544wkRJeHY2Zf9CwXDLTjOSrIiIoRaoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSHqiEwcAVAz5IAf6JRYG7Vtfasp2y8V9jU7UO4cHLc=;
 b=l9yCLo4ueyMAOQU+wr3s49QeHwP/4b9eS9+LWE0dkFXMYQJ2rDiE+sO9LJ/dbIQGftNqP2YDR+FzY/hiCJhpAOqz3h5MEViJBud3APgx+BdOfq8dYvBqK/N7l6raL0hrjRmqX/tRPWTbyXv5mA+u26A8eirSjgREBBTCLmzlDdvEGp4LctAbTyu+S2Ye8se5NNLcYszQYQ22KiKPOTfLByO2BR3GL2yG/2h5q6/laVCZXULX4Pkep5jWfxSyjf5qhgP3zd8RrJCcwPBcRDdbSmMpGXcQI/jxR7IXmWyNWm4OD0JvmGMYETtyWpc7iWwwBgqRhNj6vQi7gtkUdxqtXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSHqiEwcAVAz5IAf6JRYG7Vtfasp2y8V9jU7UO4cHLc=;
 b=eVUQ0q0VqAmORcORVbnUo+zBLs6/GBapIdfcwCfGeDUnNEqIqbTsaF02grGHRc/RdL1mjstARFwCwgKmEx9y4NAYq/Uu34qBrN8CLnVcaGRO7ancDhp0nCpmS/Zo+YR6chCamVSL0+bog4l8n8ieqqczR+zCVbo3as94ROirE8wuwWafChRI/uI9euRlTqUrC0ZtjNc25NK7aZ6yD7Ym1qgTfc9MUBkzu4kcHIUwgYlxoVHXSYfw9HieJHFBHaP1oj/bjebxSR7RVRBCHdn3+g6HwLHhSaE1t2QmQUK3iigX94CqJYxfPF8a8/Y7Qm/uKVVuXssXohhCtvRWY77qAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by DU4PR04MB10404.eurprd04.prod.outlook.com (2603:10a6:10:566::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.25; Thu, 2 May
 2024 12:21:04 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936%4]) with mapi id 15.20.7544.029; Thu, 2 May 2024
 12:21:04 +0000
Message-ID: <a3720150-e920-48b2-85f4-8b99abdd274e@theobroma-systems.com>
Date: Thu, 2 May 2024 14:21:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: i2c: mux: mule: add dt-bindings for mule
 i2c multiplexer
To: Rob Herring <robh@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-rockchip@lists.infradead.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, Peter Rosin <peda@axentia.se>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>
References: <20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com>
 <20240426-dev-mule-i2c-mux-v1-2-045a482f6ffb@theobroma-systems.com>
 <171415576010.2476476.2469508869846775606.robh@kernel.org>
Content-Language: en-US
From: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
In-Reply-To: <171415576010.2476476.2469508869846775606.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0025.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::6) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|DU4PR04MB10404:EE_
X-MS-Office365-Filtering-Correlation-Id: 3720f838-f3a0-44e3-dc0b-08dc6aa25643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015|7416005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWtucit0VGxLVG5QaDFLQmpRckhnYmg1czd1MVlvM245WjAvSWJFL2R1cmZK?=
 =?utf-8?B?RWZFSmgyaVJYNEFEU0FuRm9TTmkrNUdyWm40K2JZUVo2WXZVZ0NxVlJYNGps?=
 =?utf-8?B?WFVpUnFjUm02N3FOUlloczI5eXNPQWp6blVTTXFuYkpnSmdOZ3BhanJnSnRK?=
 =?utf-8?B?NldrWW1lZS9yOTVubEJSWG44TmZ2T1dyTmJYTEhnTkVlei9NNHhEdHRFNjR0?=
 =?utf-8?B?UkprTXdmVWNNY2Y3THFDVEFvdTBHV2h4UktDRFVtWTR0MnVLMDlSUnV5VnFJ?=
 =?utf-8?B?cHdRVXBBZFpGTFFka0RVQ1U0b0ZyS3FBcEZETFV3aEtYYUpZL1pLbFIwMVZF?=
 =?utf-8?B?Z0lZblNibUdpdkVOU05RdER3QUZQN2dNUEZ4OFgvcTdadzNSSUtIYXFkSCtl?=
 =?utf-8?B?bDhtSVlNTFQ2ZnorMmo0MjFJUndXM2poa3hMUkQvVjI1UGFlQVJ6YkV5NmEv?=
 =?utf-8?B?SE8ra3czNDBhUHVUOEFHZVhzTjZJQ2QzMjhxTVhlU3NtZVExeS9KdWxlUHp3?=
 =?utf-8?B?SUd0SU5hNG5QZ0o4Z2V2cFNjcWpFNFVqdDQ5dGtYQkIxK2kzN0Y5MlltY1JK?=
 =?utf-8?B?Vnk1Q3hQRXV3Q0ViR2pwTlRISjYzY1ZEc3VXY042MU9YRzlPS1VMN2xwK2tV?=
 =?utf-8?B?SUxpQmhDb1hMcEVsMkxxd3BJY2JPTGtxaDZPeU0wbElmZmNrVXFBb05MUWpo?=
 =?utf-8?B?cmFlMWFjdFR5MTBrYldYdXJjS2dHaFY1b2RRTWNJT040N3BtL3BkZ3pDa1V0?=
 =?utf-8?B?TnBQRE9VcDBzdHN2Wmo5aklxZjFIYzJWZWxRVGpZZEtFS1JpcW5XVGVjdVh0?=
 =?utf-8?B?MXlyYVdianBoa2VGQ2dGcHM5NXAwSWYzTjdkVTliWmdmNndhMHIyTE0yS2ow?=
 =?utf-8?B?SkpRVUUzUzlJZ1VTMjR3ZEN6eTN3VEV1Kzh5LzlDUHVCekFnWGwwSXJvQXhR?=
 =?utf-8?B?SEVyMzdYQ1M1OGtqZXhLamZWYW5BeUk3emJvcU1LL1M3cFFyRENiUWh4VDUx?=
 =?utf-8?B?Rys2VUVscnM4ZzkzZ0hsY0RRWUtFbnJacUdoT0Y5VHpJQVBFR2xHSjdWY1NY?=
 =?utf-8?B?aFJoaVMrenovbW9RUG9ZRklxR2pGazN3V1psNUNXVElIMXBVbWtOOWk5NDJn?=
 =?utf-8?B?RU9JV3FUbnVEWk0yNnRLOHNWRFpYdnQ3ZzRjQ1dyalUrYzhQWXQ2bmV2bDky?=
 =?utf-8?B?NnJ1MU10MjZqWnpBN3VDUStEYll6Vkl0cTc2OURVODVENkhoWk1OL3NKZ2FJ?=
 =?utf-8?B?bHJ3VFlhUzZCeDRjQmpjWktNV0N4YU1ReHNKc2VFcWQrUXVSMGRCMEt2T1ha?=
 =?utf-8?B?a1A2MW5mTnd3RktGWnRZZFB2RUp5c0YrcG5TUkJReVMxOEFQSER4aStZVnYy?=
 =?utf-8?B?Zlc4ZWZpc2VCQzg0OEFCaVo1d1I5YXRWUjYrUHlKaTlGOUNYU3dYenhWK2RM?=
 =?utf-8?B?dGhzaUpJdHdEYVQzYWtWeko3MEFEeFVrSzlLcDVkblVFcHdNLzduY3Aya1Ju?=
 =?utf-8?B?b1cyRGR2WjlNZVVjOU9Ca2N6ckw3dGZMZFg4TDRpOGpqdDBrTUdsOG1EZ2cv?=
 =?utf-8?B?b1J6WERHakoyT2k1MzJHVnZ2VU1scGUwYkdkNDMvNVhRd1lSVnRNdmlOUEJv?=
 =?utf-8?B?NEZwZjhjYTJlTVNmaUtjTFk4WWRnRXNBUE9qM3A3MXJOcHVDOVNkdkFhVEYy?=
 =?utf-8?B?WWxYUEtNbUkybmpaaWFMRU9UYTNZc093YUpDRUNneS9VSG45L1VaSDZRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(7416005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0M1bU1jaElzc3hTUHFzMmg4VzFBS0JCeEVCb3BOMjdsNCtlR1dBMzFITUtT?=
 =?utf-8?B?WEJ3M2c1N25EVFVJNVIwQ0hBY0JEQWZ5N25wcUFmWHJFaTNvSUpxK2o1Y0tJ?=
 =?utf-8?B?SkRDeU1oczlkeHNjdCsyeHB4WjcwKzRiWlhyMUh4V2xEaDM3TTc3VVRGY3M4?=
 =?utf-8?B?alQwTjB6clNGTU5Ra3ZrWGc2WURJVFczNlA4S3dqVkl2Um93Z3FORmtFazg2?=
 =?utf-8?B?dkhqSlNxcjJzaGJFZG5ESlp6NW5TckFUcUJyZis4b0QyV2NNV252cFl1NHd5?=
 =?utf-8?B?N3RPeHdOUUtSRlkzdytRUFNoWWhWdERXTkt3U3hZMXh5MHNLakRURnNMenBq?=
 =?utf-8?B?NkdRckl4Mm0zOHA4bGJxMU9NVXd4QXgvQVRhWVNDaUpEMDU5cFNlRjI0Q2FY?=
 =?utf-8?B?R2dmQUQzeCsrTXA4OGg2eWdPZWdCNlFkTm5KRkFaQnpzS3lhRFBQZDNGUmxT?=
 =?utf-8?B?K1A4RllpUzAvRWJ1SnhwZ0w2UWlNLzVwWUlkSFIzaU44QWxJWGp2VGx6VlN2?=
 =?utf-8?B?UmZsdzFTK1hFWkJPMWpKbWpBTEVKZXlKUTVYVlA3UXBtR1dxVmdXMXZnMUlt?=
 =?utf-8?B?RXgyYmc2ai9uRWVBOWFBQThsQkw0K2l6MWRlU2VmNUV1aHFEdVQyQTY4UEo4?=
 =?utf-8?B?NnUrR0ZDcmY0SUQ2VGtURy91eG03MklrTHZ4WVdEZkRFdGl5SXlEZ3hBRnZX?=
 =?utf-8?B?V09QVW5UK1ZnQkdwdjcxYXZkVERPOUgxRzhkcGhqT1o5cDdLS0h1RTd5bk1K?=
 =?utf-8?B?ZTZkRTdUakZweGlIWlkybkR3Rno1MTBaMTdka3hGUlg5MUVqNzZ3WXc2NVdR?=
 =?utf-8?B?cEZsRDhyUDZ2Q3VseHF1RzIrMFI3TkNmQkZmYkYrdVl1TjBYaVlHUnNpMGNv?=
 =?utf-8?B?YU9TZDFZUkxOTUV5SEtZSjcvWi9RKzZSNm0wbDVBRENzUVBLcXU4Wm9mNnRS?=
 =?utf-8?B?OHowOWdCWXo1Z3BORzYzc2IreC9iNUxvTnVxdXE4d1h1MGhzOWVPeXdMNVR3?=
 =?utf-8?B?WDFCNzNGZ0hvRUF3RW5HOHhrTFF0YTYxTXhyYnpudk55cmYyOWIzeEYyaGw5?=
 =?utf-8?B?RXVtSkY1akZCUHNxOFZya000VEl5NU44MHdJMkhFMVpGRzdPZFRtejFKa1Fr?=
 =?utf-8?B?dlMwQWhPODV2NjViSEtxdG94akFNMGR6NUNjTW0yelNtS201NFY1Ky9LSk1S?=
 =?utf-8?B?a1hwWS9XWG41K0c2TCtYcm1YOUJoLzFGOXU0UXVZYXdwTnB4WjRRZnh0T292?=
 =?utf-8?B?UXZZZkRvMDRvVUlWMkhCd0JacVp6blRHSzA0L0gvVTdCZTNTYXNHVHpPUWww?=
 =?utf-8?B?WGFKOHZsNHdpcFQ5L1hzZDE0UGhsdFEyS3k2M2QzemRna21wY09hN0N0YVVy?=
 =?utf-8?B?NTFSR2s4SzRsekFSM215L1YzQi9EamZ4MUlReWl1alZRaSs1NlJIS0lwR1Vu?=
 =?utf-8?B?RzdOcVZoQ05Qc21NMDJsb3pVWEEwSGtMbG12OEczUVI0Qy8yY0pGTThadzFM?=
 =?utf-8?B?UjFIcWJMTXZod1pUVGZnTWNPTnNWWTk1MVRiaVVPQXpma2Z5a3g2N2h3ZTBk?=
 =?utf-8?B?RDEwanArQVlOM2ExK1Q4YmtDVDExUTc3QzVWMjNCajZVM0QwbVpNNmlYYW9m?=
 =?utf-8?B?aTIxRW5aelg4VXF0VG1oNnVHNlFld09pVFBrMHkxNk9yaS9Ec0VSb251dUk2?=
 =?utf-8?B?UXdDZjZJYjdCZFFtaVhkK1lBaXpsMisvcW96T09od3RlaE1TTWJXM1NsL3Ny?=
 =?utf-8?B?MWhpZ1FFakRqUmNWVENZU0hIUytKK0p4WlpDS05JbXMvb3hybTJyVTA4ajhu?=
 =?utf-8?B?RmJpR2JMQ2N5bWtmdURRM0tCMDI2enF1UlUzT1BxdFQ1N2dxZkxNQjk5Vmgz?=
 =?utf-8?B?M2hQRSszbUN2bFVtL0JPaUQwcjJ0cVZ5aXFDbURsRGdRMFBnbGFzajJtWWF3?=
 =?utf-8?B?QlcwSHdiKzRvS1FRZ1U2Z0hxSE5ueTRTdWxGYjJtQjRZTy8yRC9MTXpldUF3?=
 =?utf-8?B?TFdxT2RmdTNuRHlWeTRiZnNvWWdObmJ6bmhtNHRPRkY1WmU3MlJIaEdiYzA4?=
 =?utf-8?B?SkVjNGQyazViME1SNllOMWlvNjR5V0hHR3Vkc3JIekVJQ1l0bHF3UFdqVk9L?=
 =?utf-8?B?OFB2cG1CeGNnZjliWTY5bHRWUzZJQjVoOHFqOVRjaDRGNm1saDl3WUNNSmVY?=
 =?utf-8?B?TEE9PQ==?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3720f838-f3a0-44e3-dc0b-08dc6aa25643
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 12:21:04.5258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qq/7BQlpi+mcmRd+nVllhvnBElCmZMzk1JTEIxeDoPYRfnUSMkr/PXEFZNueicxNHTo1KbEBCxaEJJO/1DS4rOBPRx8qKG3IQnvvQi2sPas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10404

Hi Rob,

On 26.04.24 20:22, Rob Herring wrote:
> On Fri, 26 Apr 2024 18:49:33 +0200, Farouk Bouabid wrote:
>> This patch adds support for the Mule I2C multiplexer.
>>
>> Mule is an mcu that emulates a set of i2c devices which are reacheable
>> through an i2c-mux.
>>
>> The emulated devices share a single i2c address with the mux itself where
>> the requested register is what determines which logic is executed (mux or
>> device).
>>
>> Signed-off-by: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
>> ---
>>   .../devicetree/bindings/i2c/i2c-mux-mule.yaml      | 80 ++++++++++++++++++++++
>>   1 file changed, 80 insertions(+)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/i2c-mux-mule.example.dtb: fan@18: '#cooling-cells' does not match any of the regexes: 'pinctrl-[0-9]+'


Currently ti,amc6821 uses trivial devices dt-bindings which does not 
support "#cooling-cells". We can fix this in a different patch though.


Best regards

Farouk


