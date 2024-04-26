Return-Path: <linux-i2c+bounces-3234-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FE98B3D2C
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 18:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AC161C228F2
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 16:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF8A1DFED;
	Fri, 26 Apr 2024 16:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b="cAUaEvYF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2111.outbound.protection.outlook.com [40.107.6.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454E5168AFD;
	Fri, 26 Apr 2024 16:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714150240; cv=fail; b=lEITKs5mgKovrwd1z2wqwNF8lTUjobbyS24mR/mrlEwTsisAWlbP0MTWZ3puedXl2n9cL7Ar16a5VNulTZY1jB3aUkLGG6Gz9TArA1JhOQe2J1UgCMSwlE/t+j7gfuCeLj5/dpL920pbdqTMEqjJOQU3bPYs1xgGuKH8nDP3oxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714150240; c=relaxed/simple;
	bh=UWXVbmVO3Y2c4497K3U1tESAVlrFQpEyTN/GER7pQ0U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MRDt7lXRFT9s3gJFH1xyWhYyM9CVwI18Y7Vb5Mc9OFBeT3kgxyrKoQCgca8mVdA2dYhbd3Tuh3R5/SQtn9N9cjDqncmPNrqztFacv5SHOcUfYE9E7XgomYW6Z3sSSUn45BOMLhCHrpMdo482qn5L/C9ByUfT/e+nfiwwv+C1pS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theobroma-systems.com; spf=pass smtp.mailfrom=theobroma-systems.com; dkim=pass (2048-bit key) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b=cAUaEvYF; arc=fail smtp.client-ip=40.107.6.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theobroma-systems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=theobroma-systems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcNiyYIDiPF6XPtDGfNVxXAPlApu+UsNl2anTryhuBFRD4NIQN8nTcxwn5hyprFCsSOeF/7p3y8Lq20cvey11QuaZ3LKzTqDGKmKQ7DUBL2vxEO6v8dDg0LUFWeldGGXHN9GoYUPUNqb47ZgTyiSf6CX/8b07Wc04cAUh35Ac8sw2Kfxgxvn9Zt8wTB5pBKV6E34a8OA+1+CFMe7kG4sYph4o8v6jvdk9aPQ7s7HLzvgS2E1FlhK86NFAkX3nrt/ha4Y4Jp9ZnIQg6vDCsw2j3nFVYjoW+v/vNnxnyp9PX7bTsGde1uokvt0r+5wV/yGp01TvogLOgKwaul5N/6iTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfTD2b9CFw2rvlZSr6YZp8cWQ+HrjZKKM8wxPvSxOI8=;
 b=du6ePffiq1yidWmjb0cXuoKCD1zieSrKzJgfDtB6Y7MRu9h8PYNgsFdvN9tt/cwxhsbrYdWIZcpjjzEI9fyf3toA7aRsMz+0osu8ypm4XAWcZfiLn3Z1h6OVe7kH2ig3DNsQ4n5GizF3rAb3NO1q1J9x9OvScAVz5gNcqbYfhMjCI05sQYrkZ2EVzqRwPvVPPppFQ0f8O/mVRcmATJBVy/fsPSvcGgSmfsOeXUiDuf4g6lgf4ZvNbZp5ktVJGqdy1vB4eKjocnwBNiICNqLAm6GD8HxSCXfSLFdkvf8zGys+7cHYCVSSyM75CF4RUvBJZEWvtJqyqm9zmlbqHpPDag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfTD2b9CFw2rvlZSr6YZp8cWQ+HrjZKKM8wxPvSxOI8=;
 b=cAUaEvYF0hbRT/xtcbU307CXFjohDekS/YhoYl6+gZ3oLikr2sL4mEwP4M6w+WqKxTLYStSPnb+jUuwGWpapxZSGGLTvQf8QHv9jzPNDY/YQppFdSHxRWIn68uhStzPWcK/869VV+v8ccwjKmBBc3lYJwbDIDlpFKATD0Zdv3d+QB8vuCMGTrzZZQwQn1kM+wI74riqfv9dXATj/4CGvxL1rlh8FWCLOsvcP7mi61kmHtepd+1wwOS6vm3SyAMPt6KWuZIW+wosYJN8ZDqs6zX3lcHi09+sDAa0OIV70G8SycIUs52lg2PDqgh69nZfWaf2Hf6KcQKXr6lOaN/UMvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by VI0PR04MB10230.eurprd04.prod.outlook.com (2603:10a6:800:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 16:50:30 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936%4]) with mapi id 15.20.7472.044; Fri, 26 Apr 2024
 16:50:30 +0000
From: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
Date: Fri, 26 Apr 2024 18:49:36 +0200
Subject: [PATCH 5/7] arm64: dts: rockchip: add mule i2c mux (0x18) on
 rk3588-tiger
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-dev-mule-i2c-mux-v1-5-045a482f6ffb@theobroma-systems.com>
References: <20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com>
In-Reply-To: <20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: VI1PR08CA0261.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::34) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|VI0PR04MB10230:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b884afe-464e-457a-c4d9-08dc6610fb56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjcvT2lwNHBuQ25BY2xoOXV4YTcwUktLK0ZtQ3RlYnJDTWlTRjlvYk5lWStq?=
 =?utf-8?B?bS9HOVJ0M0YxT1dkVFd6MkoxWEpad1c3M3ZONWdjUVFWSWpVY0ZNWnNZZkVQ?=
 =?utf-8?B?L2t1R0xUWmZmWG5XWHZBYkd1a2tpc1JLNDVtd0lycFBnSWpqN0lxRkVvZllk?=
 =?utf-8?B?aHlDU3FrM2tyNW5BK05hWmZHTW1qRWsra3lSUGt1ckxjT0J5VmJONmZGZW9i?=
 =?utf-8?B?OFAxbmlhcUMraTZDdmhhMEpKR1duaXhoV3hOK1BTZjNOL001a3YxL0lqekhq?=
 =?utf-8?B?ZVlxamlMNEpzUEFiZUVpRnJ2SXplcWhkUVhGQ29JamZDcXFzY1pNTEhTUVdw?=
 =?utf-8?B?eDF5MWdEWnBiUjVuSy9rNmhHdWRVRmlLbUNHK05IWmt1R0lETzc3QWl0bHA2?=
 =?utf-8?B?eENvRjJremFTaE1tMWp6QTVpRFFOZklISmJleENNZytIamNuMkMyMXVPbFpQ?=
 =?utf-8?B?RmQxMzNXTmpseGNzMXBDZDFGVW9vNUlid1AxZUo0akFkYit3VnBBWkRxdnpx?=
 =?utf-8?B?OWNiOGtpYk1rT256RDBveHpuUHo1cnF6R2Z4VXRZMlpHL2NVTXpVc29vcjVN?=
 =?utf-8?B?Qy9sMHlJeDRXRFJZZ3UxT1hLTzB0Y0h4NVdxdC83TC9IVEk5NkJlNDlEU0tu?=
 =?utf-8?B?RlR4WmtzSllSeWpoTExUVTYrU2o2d0pNTm5uQnpuZjhLTlU5aHpLeUJGS25l?=
 =?utf-8?B?VHJYaFdXT3RGeENUb2tJTjlSOXg5MkVlRTRRNzMvZG9WOGVqVlYvVCt3M1ZW?=
 =?utf-8?B?alV4MllsZXRNSG1yMVdhSzBrb3FYODBWWEEyeG9FNkZNK1pqRjFCQTNUWU1W?=
 =?utf-8?B?ZGlEUGZBZFE2TVdlTG9NblBjUWpEdTJESWR1NEpRd3lKUWhLVjRlTVVGeCty?=
 =?utf-8?B?bXBYbGkwOWc0d3luMkd5ZS9peGUyWXFaTG5NVW1jSy9Qa1pvakJ1OUFYbUIv?=
 =?utf-8?B?cmJFdWIrMEVlYkhzcGJKYVJhQWx0SWdBdGNhM0RycW9TZlJsZGtWMkFBbUhp?=
 =?utf-8?B?clFDcW84OUZ6Zi9MMzhiL0EzZkhTaDVFaWVXaVZBdDVJRDdSQlNsanFMS0F0?=
 =?utf-8?B?eDRSd0lkMmJJUnhOREFrT3BEOUNqVU8veG05RGhIMjVWVUIyQUx0ZW5SZzA2?=
 =?utf-8?B?V2FTSFlidmlsNENaWnJ4SFU2NFZkU25DbW1PWi8rUXI4d014bFJJaHN1aU1p?=
 =?utf-8?B?RkNqVkROQTZXVEgwOEkvRndUTjc2dlhUcG5velVkRXpKbnMvRkNza0piTFhD?=
 =?utf-8?B?eHJsU29QWTV6NE0yNGxBSkFpYXZKL24reUlaL0JmNmFHVWNUMW42b1V3ZHU4?=
 =?utf-8?B?YjBEUXdmNEFIeTI4RkxrdDQyTlJaUkk1NHdndEdkdmsvOGtYUHRRTDJySlZk?=
 =?utf-8?B?bUVoQ2NDRTMxSG5sZC8zRWQ1dkp2T1Bad1RFb3dibU1CWUpmQTU0M1lyUU5S?=
 =?utf-8?B?RFdBbWg0R3FaYVRMQlIycEUvK1dNZWhwSEdheGp4OHIzeVdNMTlwQ0E1TEMx?=
 =?utf-8?B?OW5wUnRtSEdBRkhTMjAydlFwcFZlL0NWaVV1YUQzM09xTFVva3VDcFRkWWpl?=
 =?utf-8?B?ZDlPTVpBWjBudFdpdkRkUnp1VWpHdlQrU2MwYXkyMzJaUkZRTy96RHc0Rmh0?=
 =?utf-8?B?YVc5Zi9XYzl5bW1YQXpPWjlJZVAzVGFtRkJVb0E4MVEvMVV5UU51cklQRTR2?=
 =?utf-8?B?Y1RIY3hPUGRJWTk5S1hON0Y3cTVXK3dZOFpyT1oxaytaaU50NW9DK3lHZEE4?=
 =?utf-8?B?Q1VqSkc0NXRsYWFqU0NCdHlCbnVVMHlSL2tyYS92TnBhWHhFOHJZYytLWk1y?=
 =?utf-8?B?bURVWUR4cnFQTXc3Ym5Wdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(7416005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1JJY2NkZW8rTGJnSnJvb2l0VlpXTSs1dUl2YmRGMnFuREdOeGx3dlczb25i?=
 =?utf-8?B?bWxHVE44Y2psSnR5UndFYU1lT1ZpeVNyejV5aFBIUG52ZGRHdlhtM1czTVlJ?=
 =?utf-8?B?REl2a2M3MFZBRExEbHlTZ2VCc0EzMWRZTmx5ZG9aT2pqS3BuNk5jU3JMNDRu?=
 =?utf-8?B?VXdOQzFwTnZiSXhvUm9IRFlKY2dTNzhTZkxSZEdpU1czNmIyaTBMTXYrS0Rp?=
 =?utf-8?B?SVliYmtQTkNBZnF6c3ArRUtRYjZOSzNhamQ3T3pxL1FkRnJuNCttVGZpLzY5?=
 =?utf-8?B?VDRYRy8wNUh0NURQU0FTdldJOTF4VjNrTEVtSEZLWnFjbHRwR2toRTdLZ01y?=
 =?utf-8?B?WEZHb0RUQ2FneFY0L25kMWdFN05EWVU1MW02K1pFTEdrK2YvZm1ueldta1ZY?=
 =?utf-8?B?b2w1TUdrd2JhcTVGR0xKV3JFZDQ3WThMNGZlTVp1YnpCQWpYZjNYOTduTTRy?=
 =?utf-8?B?U1BXOVJ6alpEYVZWTkdJMXA0YXQvMnRCUVlXbzhDOTJjeWxpTGhXZ0RLNFFm?=
 =?utf-8?B?NzI0NlFDR0xyMUJyRGxxRHc2S21sM3lVbkNOSmRuKy81blQ2eVJYZC9tRWVl?=
 =?utf-8?B?aC9CMjhjNkl2STdpem8zK2JaVU51MmFmZEJIUzh6dXNpMFk4a1F5QVFsdzN5?=
 =?utf-8?B?TTJZNFRTN3VmVjNvRDYzb2ZCRnhpVkZXV2dHbnoya0Z1c2dPQzJsMVdTTXpB?=
 =?utf-8?B?bk0rMm5raXZTQmpiZGV5Yjc1K3ZNNTR3OG4zQVcyb2YzSytlOUhSZ1RYdk5a?=
 =?utf-8?B?N1NIdkU1Tks2Y3RUb09GTVF1WU1wVVF6cnhiNElwWFFjYWd0Q0FXTXhRR1lH?=
 =?utf-8?B?YXVPTHUzQUIxeDV5dUFrUWw2R0cvQkxPMXRYTGZUVXhtdXpUZ2x1cXVUc3hJ?=
 =?utf-8?B?aXhhVENKeDRRNy9iR1BicFhBSitqZ2UxVDdKR2krbm5HaHB6cXhTOWRPWXNU?=
 =?utf-8?B?UklRVnZaM05ETXlNYW1JdUp0YlNmdXB4UnJnS3hRdE11TVIrbWpsRlp2UXd6?=
 =?utf-8?B?b3BwZ1RwU0RXWnd3blBlby8xTW8zVE41RUVaMXBjakN2dlJPZnRGeUs0NnpB?=
 =?utf-8?B?R0FBWjM3ZTBPNlhkeHRqbDBpSVk1b2s4b0xEbkV2amlMOG1Sak9pVmpSdklO?=
 =?utf-8?B?WnhYdytZbFVuQWlpYitHeUE1djl1dldHYlRHRzBseXQyL25LS1gyb05xS1M1?=
 =?utf-8?B?b3dDVHQvOVU2dHpoeWFLbmpkNVFsSFIrcjNWR05LQVpzdEdpL3lsOEFLNFZB?=
 =?utf-8?B?RWpxRWNaWjZHTjAzUU9nMjF4dDh6VDhINTFDcmpyTTNaTnp6WWpqZWVxU3RO?=
 =?utf-8?B?bFdvN1NvTm94QVRkUHM4WllVK2NWdmo0UXl5NUNUQkVMRjdzNkxlYzhjb1pn?=
 =?utf-8?B?MEhLQjVvL2h2OXFQdzFWU3Q2UjFidE5uUFFLVkdZTnhRbmFyVE5YL3IxNm1T?=
 =?utf-8?B?VHdwK1JzMzZjRXhmdzNoWllOcnZiZE55bFR6RkV3YlR1Z0o2bDNobk5PS29T?=
 =?utf-8?B?aFdUTTVhaVZOdlJTRVN0QmJ3dEIxYkhndndZN3hqY215dEI2NmN3Q2hYZTdx?=
 =?utf-8?B?d3o2ZWt4d2VlaWQ1ejhqaEg1SXp3MUYvL3JHeXZRbFRhUnFRSkFrakpjYVJY?=
 =?utf-8?B?U1lkREJ5Mkp1RUg1cW5Ma2ltKzFzdzBlSVZROUJvZ0F5enpaZzRzUFBYRHZh?=
 =?utf-8?B?dGdpTnhNWGZHd2E0c0ZXK1FyTEZia2Evc25RR1lsVDNDN1VnTjdEWmd4T2dU?=
 =?utf-8?B?NGo4alprcGNYSXlnZXpvV0prRjhHa2hXa1BjYy9PWFlhNU9nMzA1QTNUYnlS?=
 =?utf-8?B?Nmhza0pudHdPaStkTE9CNTM5NGF6TXczTHNrWktNaFd4YWZhVDdYM0ROVkk5?=
 =?utf-8?B?WHFRYm94TXRDVFdvN0UzbXBmTlJoWmtqVFlxdGR6N1o1Q1kyY1JNMDMybEtu?=
 =?utf-8?B?N00zNmNPRUlrZkNETGJmUTl2VVR4UmNFRzZMcUZiUWFNYjdxcFFzelVSZWZK?=
 =?utf-8?B?cDNIU1hKcVgrd1cxQWxUMTk3OHl4YmpPTkFsTys0YjAxSmtwUHl1UXpIam00?=
 =?utf-8?B?bk9pV1Z1NytTVjJ5NGp4NjJ2QVU5d1NCdlgrSWQyVTY2LzNkajBLZEE5cDRu?=
 =?utf-8?B?L24xM0xaYzJpZ04vVmtIaldwZXBGZTZDZFhlV3RoSFFwL2VnVHNGRkVBOEJ5?=
 =?utf-8?Q?yywBqyjWSu1YBubkh7KIHG4=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b884afe-464e-457a-c4d9-08dc6610fb56
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 16:50:30.2782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ttrcv7kjfCJf3aysuDCp9c7S65BHCyQqzIZoDd57c3LjRgpDF7r99YUaMV5NMIVGQQWUOmtb5NaginVPtgasJYCoppIZagkNRg79/vCVBthXa6Hn51+FMSBLMVvZn024
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10230

Mule emulates an i2c mux (address 0x18). The amc6821 is exposed behind
this bus.

Add the mux node and amc6821 as a default device.

Signed-off-by: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index 1eb2543a5fde..5ed7d51717bb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -12,6 +12,7 @@ / {
 	compatible = "tsd,rk3588-tiger", "rockchip,rk3588";
 
 	aliases {
+		i2c10 = &i2c10;
 		mmc0 = &sdhci;
 		rtc0 = &rtc_twi;
 	};
@@ -210,9 +211,23 @@ &i2c6 {
 	clock-frequency = <400000>;
 	status = "okay";
 
-	fan@18 {
-		compatible = "ti,amc6821";
+	i2c-mux@18 {
+		compatible = "tsd,mule-i2c-mux";
 		reg = <0x18>;
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


