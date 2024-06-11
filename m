Return-Path: <linux-i2c+bounces-3977-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 398A9903B11
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 13:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7FF52883E4
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 11:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11D017D371;
	Tue, 11 Jun 2024 11:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="Kxb65jeI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2109.outbound.protection.outlook.com [40.107.22.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908D717CA15;
	Tue, 11 Jun 2024 11:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718106283; cv=fail; b=Egoui6gvQxesBhqRlKebZPSt0rhtWHzTXySPXtTKK4iNRf64cV1GDMd1guoOnRbJBe2XxxeVDh/tvlaQitclrNAxxWP5ERw+Aw9EGbX9zhRiaCuaJWBnrorq3N+6njdM0I0JXzr3nV1kM3tP1IdK4AZAPQLQJuc8YqHIRbEZlLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718106283; c=relaxed/simple;
	bh=q4gHXk9AZSqooy3vTT8zXQi+fEvdUfSfQESbItpvKTA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=l8LOrOTJPI0KjFUsTcqqMbL1qsVHkFXdPUFTqaa4hCTMjnnXSzPYPgj+g1YvQRm0ry4vjCtslCxIruK1ivlF1mwyt1HY42ouKvcDkrP/yL7/Y1Gf05EqCUi/nvjw7mIVhj5Rg5QIlkhEjL8Fnl6lVDdgLz6scg36DW8RQ02Giv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=Kxb65jeI; arc=fail smtp.client-ip=40.107.22.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyXeJw8sg2Jz2ljUCB/6zyAhHBlYV8Gm+UOQ19wWZAWgpLc2wqQjHsiqoRVCCaVPybqYTw6gQPzAifBfE71/JItOi3RguetAwoRCTxvZJn8c8DhN5jTFuoc4fxKVZP6CnxCDasVqPOkjx8JuMCyt/DPQgeMje4BmfFCi8slFVxv8wrN3kseaSlMhISOW/UWaziEkWO/STIl+OY6MLpTaUjNA36rOVOTrMpbwKiCk2NPDU2dUcVMCGlbdXFh1zjlFuc8u5PExT/B7SdfgCXABgOFriWd6zrU4/Gc+5c4dezLKg6Zghq7+GnwvwPOUwf1yvVxqkYA0XiCVzX5n+0FPqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1gRCrH2jGALy4cXjww2muIP1NpMPlSQNBJ1FAxNmxc=;
 b=TLI/aLKphCfj0HwctzqeCjNV4dkhmNS3wZ+EuGexf/jd2fhqo0nXRS2qX59dXXnxyApHS+JQpzNWR02ceUEVG2XUXDwyxo/eM7R07pdwak7WqEBAJ5Rtsdp1THJFBZC6ByotvUgiZMas/Q1TjZTmFT6vC0OgwRuqjzEpJG7c36UXPtqmyM/0SotAAzrKIau0ZjSVRtv9F0JST2mYbhJaGLZ7ujMoexLnHDME+g8VFm6+Bxl49S9Ly1lHSNUhl+hHrHx9ON4vuBelhoV8jB47bMJETNNsl1Ks5h0trAM6ymIt44lPNJc+aXbylMllc3f6lE9BAqp0Tkqz6NjK8w2Ydg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1gRCrH2jGALy4cXjww2muIP1NpMPlSQNBJ1FAxNmxc=;
 b=Kxb65jeIoNI1gsv4vMcBKKl8BE3NBlJEsUZ4bmOZuYXbfs5ROqdCRp97Oqbt+4N2xMRT6+Vab4SO9pUcQ2fYpJ4bpKjUkh/n/3YU+LFKmZBpTeUQK1JwJ1x3rV66S3JigJKnMF+hYsIu7JTM0zIhqKAKX5MAus468X3ZOErR4rw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by GVXPR04MB10301.eurprd04.prod.outlook.com (2603:10a6:150:1dd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 11:44:33 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6%5]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 11:44:33 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Tue, 11 Jun 2024 13:43:57 +0200
Subject: [PATCH v3 6/7] arm64: dts: rockchip: add mule i2c mux (0x18) on
 px30-ringneck
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240611-dev-mule-i2c-mux-v3-6-08d26a28e001@cherry.de>
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
X-MS-Office365-Filtering-Correlation-Id: 4f0f6ad5-84e4-449d-c92d-08dc8a0bdbda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|1800799015|376005|7416005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Nno2aW02eDliT29mWWxsUlZrcjdsN0graVduVGlFd3Y4KzZYeWdOMjBjVGha?=
 =?utf-8?B?UEdUMGVVQzZ5RWlvWFFCQTRIMnE4aFhOcEttSU1TV1ZPa0plNmhYY1hwM1Jn?=
 =?utf-8?B?eExJZUZQNm90Vy9WQjZsc01xVDFBUCtVQWt5Tjg1YXNPTkdGS2xnc3lqbHRp?=
 =?utf-8?B?Zk9zWmk1cWswa3c0S09aT1ZaYlo1dFNDMGlmVmtVaDgwRW5kUGxTbE1vL0Jp?=
 =?utf-8?B?eVdJQ1JlZUFGUzk0cjl4SHdZVHY4WGlCZS9nODI4OWMyTnM5TThZZDYyTGMy?=
 =?utf-8?B?bGRiL0FaMGRWb0hqNjRlNFR2Q25aRGxKbXMremVZakk1WHFmS25vVG1OYTFB?=
 =?utf-8?B?bVp1bmpsNTdlaVkxMzB1TkhzUytIYmd1RGdMSGx2RURJSjJXc1hhMlFJaDZx?=
 =?utf-8?B?cHdTRWRJRDhuY1YyNjNBVGpWaUFNdDhVWUpUUmJjT0U0U2JvakNRSllVL0No?=
 =?utf-8?B?ZUtpWkwzd0h3clk3ZkhpT2FIY0FxcGN3dmswek9QWkRXdVYyUTBYTmtIV0R1?=
 =?utf-8?B?Z3ZnbHVYZmZKeEs0c09Fc0JNdTcyNHNJQW9rcmVYZXBTLzBUVzk1UEcrNGx6?=
 =?utf-8?B?VTI1OUFBVTZhRDBEZTRTWTRlanl0L2pWVFJtSXhRRTltUklnd2tyNW1pU05R?=
 =?utf-8?B?alNyazZ2dDIwdDRqY24xd3VNV1hiSTBIU2NKS3lTcll5dUszSE9GK0FDRnZh?=
 =?utf-8?B?L1F5WE9aUHFhN2h3bGtBcHdwVVFBWWMrWGtENnI5NzlVTmJQL2M1MWh4NDRm?=
 =?utf-8?B?MEd4Y2tLUEVHMEhONVNnSU83OExvTTNGakN1Y1U3d045ZnV2anZ4MU9rdjUr?=
 =?utf-8?B?WEE3ZnZMVU9BSXFINWtFT0pJQS9KQTNDTGI1K0kvYXNnb0lJUUg5ZjRwOUp0?=
 =?utf-8?B?QS9sVGIxaTE2OXZ0V3FZMHljbDEvak9DT2ZBZjFrUzVrbUEvUElDWWxHZURC?=
 =?utf-8?B?SVhIVldZZDBpakRsRGZIZ1kwWDdNYzdYbjJ1cTczTG0yc1Q1b3FxdERCMWZj?=
 =?utf-8?B?T1haSlczbW9hOThWRHJkRlh4eWZvTGQzMkhibUNsdWhTdDU3N0ROdGcvdm1R?=
 =?utf-8?B?QTRrazNNd1h0bEZsdlQ1OXRiTGVTSHNxajVrTGRJRk9qWitVY1h0cDVnY3RN?=
 =?utf-8?B?ZVlrT1N0LzhwZzJXMk5mb2lYdkJXWFYvL3FGSytUOTRaS2FaVVJxQUtiajBF?=
 =?utf-8?B?ZFVQOVZhK04zV2lycDFXZnNEUFBVelNyVXpZaVNuRHl3N1k4c29GODhWY3c3?=
 =?utf-8?B?LzZ6L2JuVG5rclhwdVdMZkxsMGVtVDlKTFFEam1qOFdGZ090SzdlSjl1MzN2?=
 =?utf-8?B?cGNZWlc1cDBqRzJUdkJweVpQV1lmUmJhRGp1Vmo4djlxYngzUmpFb1FHcDJY?=
 =?utf-8?B?dHNCbnRYVEQvU05TVjM4U2JjWTRJSDdiVHREdy9veFFKWi9kMXRMWGJIYmdv?=
 =?utf-8?B?S2t0SWtMajN3elVRMjdJUGovQ25LRGVTZ1UzNkI4eStodHM1bTBEVXJybk5p?=
 =?utf-8?B?dzZkeHRWYVFGTkJuMkNqTG5ieG1wckU4NHNMTUZFc2NuSkNKSFlyOGRFOEdK?=
 =?utf-8?B?OGd0MDJUdFRiWlI3amg3YW5RaldaeWNTSVBFZXJxbjlBeHpiSVZjMlJPM21I?=
 =?utf-8?B?OVpuRUExR2w3SVg4cjQ5R2VKWVZCd3cweURESlF3RUVCTTl2SXIzUkd2bm1J?=
 =?utf-8?B?TXdVVXBYNks5ZTBMM29rYm1NdEZtakdjTnpDQUF0VllwUmRCcDlqNFk0NTlM?=
 =?utf-8?B?bEk5NGoxdE1WNGIrYmJIVWpnNWw4MkhEbGpBdFRUeU9LbElVQTRXSEp4Q1kw?=
 =?utf-8?Q?mhzH3NKJe+z/2Ywq/tdH9oYtHp21hWbxqDF0Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(7416005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGhpT2ZjNUJMVUwycFBWSnVaMDhtVXRtWUNXRGRqM1BWbUJ1cEsya25TekNC?=
 =?utf-8?B?NS95MkphL1RDYlQ0SnJ2TDdmZFM5R1JkR3RnaVphNHE4dXlFVUVVbzV0Zkdt?=
 =?utf-8?B?NEFMV083VXMrZGhLNU8xTGJ0L3VNV2dCdVFFMG5mV2VBUWFLb0lTVjQ3dHVG?=
 =?utf-8?B?MWlNWGJQclRUMnZYeERUWkFZSkZxZTdwSjQreUs5ZkRYT3ExOXFnZ0pzZTNL?=
 =?utf-8?B?N2tQcy9EeldobHhoUDgwRU90NE9jcGZEOVI2NkZUdS9YVjBZdm5iTlJZSDYz?=
 =?utf-8?B?L0dDWnRJRUxBakxQOUg5cHEyT0M3Y0RUTERBOUgvRHAzbUNRV0FOOURQaW5h?=
 =?utf-8?B?eXRFcTdzY0hYWWVCR3RYaGo5NmxJVWxZZW8xSzV3Q3A1Q2JWb3BxTCtTYzY3?=
 =?utf-8?B?R2lpeW9RV0JBUXVTSGxNaHZNOEhacWFrbXZscE83bHp6K2Z0Q3JvQVcyMXAr?=
 =?utf-8?B?MjY3a08ya2NnaitkeUJpYXhOUWs4dy9leFFvRzg0OTVlb1JjT1JoOWV3N01k?=
 =?utf-8?B?Z1RvbnJFRm1ORVl6ZE16N1dpR2JvK3FPb3B2UGE3MEV3MVZnQWp6dExjbHVC?=
 =?utf-8?B?cXZETzA0MFNDb2ROYXhCZzdaWS9tdGJwSGFhZFZvY0h3MGZvZm91Zk1BUThL?=
 =?utf-8?B?by9XdWtKalB5ekprMDhiQVpjdWRnN3d5QkZPY3lvTzJuU09OU0hIcjNjNitV?=
 =?utf-8?B?RFpBcG9CaHdNZFJJN0lSbnEwK21TcnViQ0E4d0laSi9ENmdEaCs3b0hVTDZi?=
 =?utf-8?B?Y1RMaTMxMlVIV3ByWHJLcFZwanNFMjRQWDM4dlFPa0ZsOXpoc3NBTnI4UHk1?=
 =?utf-8?B?WkNtallRdTkzZ1BCUUw4bmh1S20yNDNLVDUwMFdLVW5hT1FONCs2S1h3MVJ6?=
 =?utf-8?B?bk55L3ZqUkRKUTAvUFZNTEl3SkJpcmo2aDFnKzB0Tm81R1JEV1hDbGtUV2Zt?=
 =?utf-8?B?WUdLZnorSG9WZTRvcDl5Wk1oYW9pWDV5UDlnMzZPZ0NHTjNvOHZDajMxN1hT?=
 =?utf-8?B?M3puMGFWeHc1SXNVRlpaN3pvVmhUcWNiQTkvMlVZYXp0VHp5SlhUdmxtSGJ0?=
 =?utf-8?B?U3Zna2Jia0RmNjdyVzhWZnpXdi9ha3R4a2s2UVp3VGxlSk1QdmFrWjFib0RD?=
 =?utf-8?B?NndabDNEY3EvNlNlN251UG9hR2M4LzRNR3d0Y0V4QzBQcVFySW96MWl1WlFV?=
 =?utf-8?B?TmVKYTc2WktHZndtWU5XV1Rua3RVT2RuK1ZYc3RMTzEwS0ZodzEydUYrTE1X?=
 =?utf-8?B?V0ZhZVpxUW12UkxKMVp4dEZqemp0MVZIR1h5aDdlU2c5Ulk3WGh6TjhQUDNR?=
 =?utf-8?B?UnFsaWRHVCsvM1QyV1o5WDFUSitKdnI0ZEdPck5HTUg3cU9tTUhLakFQU3lt?=
 =?utf-8?B?bmZabWdDSFliS0FZR1hReGNLQmhaK01DdUQ5RU9COTdaRU5CdnJrOWxVT3ZS?=
 =?utf-8?B?c3NEb2l1ekFIWXBiajkwd0M2anlMS1IvcmVvMjNsblI4VDhmWHlvQWFsdmRV?=
 =?utf-8?B?U1ByRjl0VGxVNlF3ZFFmYkpCRk5sdUh5QVZBOVJDc0RDOVk5ZFladWc2b0Zm?=
 =?utf-8?B?aHlsN2pjRmp2ZWlqNUgvTGUranl4V3Erck1tTG5pSy9DVHJhZnMvbW5VbFNo?=
 =?utf-8?B?YnBEcHBOVmQvaVlOMUdqNk5rV3kxMDBVV1BnK1hOYkVRWUdQMEdFUktaUURP?=
 =?utf-8?B?d2ZuUkUveDFodDJCY1NBOE9SV1hmQkEzdUxmeUV2K1lTdUZpODBhdWc3ZHht?=
 =?utf-8?B?dTkzRjVpRWg1aVVXNGdyL3F2Y21KRkZKQXNjYVdNQU84bHpWdFNJNzJRTFJk?=
 =?utf-8?B?TjgyUU5kNWlBNmF3UitqaTNhVm5HMENqZlE1aVRVaFFDRDYvRWFHUG16Qjc1?=
 =?utf-8?B?amlYQkdiWDhPWFgxUFpoUTZjQ3pDN3hhQUNLVC9YWWlIczl6SkRqcU9TRmd2?=
 =?utf-8?B?VCtwSHdFRHhFYlM1QjRHejJCSXFxMmFRQUJXKzBYZ2tPUnhnOUZ2azZTSzh2?=
 =?utf-8?B?MGtQajI3RFFUQitkM2YrVHZyNG9TZk5wVHlXbVVMMVY0aGgycFZHaXFBNncx?=
 =?utf-8?B?aDF0ZFA5Um5kYTRXNk5mRUpMTjlWNFdwNEZqeWtIUHMrRkk4RjBRTmp2V3k0?=
 =?utf-8?B?SzNRM2t6cnMxc29ET1BmK21CQ2hFV2paTFRwaUljRGIrM2IxaWwrb1VyYUli?=
 =?utf-8?B?dEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0f6ad5-84e4-449d-c92d-08dc8a0bdbda
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 11:44:32.7857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyt4bQqnh4LStxKfYCWAsPjw45/08Bvrnw0H+MdI9O4SrQsOylHVOdLDFb7MFD9UPikWlEuHyVapmxKjVlYCs6M42ZVwt9HNcEa5B1KxEBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10301

Mule emulates an I2C mux (address 0x18). The amc6821 is exposed behind
this bus.

Add the mux node and amc6821 as a default device.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
index bb1aea82e666..eea906379983 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
@@ -9,6 +9,7 @@
 
 / {
 	aliases {
+		i2c10 = &i2c10;
 		mmc0 = &emmc;
 		mmc1 = &sdio;
 		rtc0 = &rtc_twi;
@@ -291,10 +292,23 @@ &i2c1 {
 	/* SE05x is limited to Fast Mode */
 	clock-frequency = <400000>;
 
-	fan: fan@18 {
-		compatible = "ti,amc6821";
+	i2c-mux@18 {
+		compatible = "tsd,mule-i2c-mux";
 		reg = <0x18>;
-		#cooling-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c10: i2c@0 {
+			reg = <0x0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fan: fan@18 {
+				compatible = "ti,amc6821";
+				reg = <0x18>;
+				#cooling-cells = <2>;
+			};
+		};
 	};
 
 	rtc_twi: rtc@6f {

-- 
2.34.1


