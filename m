Return-Path: <linux-i2c+bounces-5060-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF20C93C2EA
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2024 15:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 833582829B7
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2024 13:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3733B19B3D5;
	Thu, 25 Jul 2024 13:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="Tp6wdJI6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2103.outbound.protection.outlook.com [40.107.249.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B27DC8DF;
	Thu, 25 Jul 2024 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721914103; cv=fail; b=mljFZRUY3VEAfFlJzRtrnhMDZBb8hGbUDtvGdwKM1Yg39CdLQDiJkTlPxiP64SOutBvv/42wEA5xY6KtpBauoFq7BvBBg07kLbVStLCEC5yToi7XU5WqrexjsBtUbRYCmOP6NufuTQDQMly2jwWGhoqu2obFZFtll5yXvLba6e0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721914103; c=relaxed/simple;
	bh=lOV3HE0uSbeu/p6G5nGyp06dKB1oUIhTixyTm0q16Ew=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eNI6x8p9mgM4gDLY/l1B4MORrXs+QnRyD51WxzBlqltvmT+grE8U2SwH6chSg1cKNcq4khSD+jrGHlt8mYF3a8VMijLTwvbH+OqLrGydGYfs/IbcJVnxfHfgCw0ObmmRFbWWspVYVM6615s5LJtNM/i1NHKw63ZD2Z6eOv+sA7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=Tp6wdJI6; arc=fail smtp.client-ip=40.107.249.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqO0hQ6M9AGoR1A3cvmttApuAslsbjFahD+ItQyOk7RwJHGs0M9lMcEPyqzf8pQv7PGhy6SWsdB3VjPIzoX+nJjhlYCiW1Htxt6GbxQKPaVILGCgwSuHV/EF2yCxDpSUtgOTrnTXqmjJB7gHivJy61MMwx+znuFulpoF+uG2DTZe1lUJOr7focvcquwOOm0GToWApzJXAoZBTScXTq7e/NQ1HfV5ARfg4EBMN3isBFh2xTIo1Wbqu07CUfAQNtWKV4nyip9rZGe8fGM1XfOWIgLj51ijswEdJhCUwQFvs7cLZfWGYWVuQTizLLiQXQWaeqWCLKqUmsxW3SxUPwDLTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJnjelccAqGsu7IfgKRzMYfmKCxrKBYH0bERLOYy5IY=;
 b=P7D9VxLA4ZyKX0Y9Q4xSfxogKN7lKQ9R8ZjE/1RWb8QZGF13SpFewkDXzZgLG52h+enfbVCC1kgVcFbk9LBvTpSXyv5ox1gHX+3VRi29k+HvDnu8JPmZwwgCE10cgBdvJfcwk5Jn2CtWYIVG/7j0Ip+0TmspMbjHd037Q9RQDi/LvXp44mtXfDb2MehQTcuf6n/rr+2QSi5oB5vRFnwR4GueIEGcz2Rm/GZT2Ws+bnQg2gPqVwVGtZ0PQlA3vyLM7DrRQL36sipSqSLQcfjKs1j7upX0XU2Gxbgmwy3rHVIr0ZhArWttOgLmGh2T5IK7Lhrzv9CuXFi5rjoiqiWuKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJnjelccAqGsu7IfgKRzMYfmKCxrKBYH0bERLOYy5IY=;
 b=Tp6wdJI6zkx7geDeY6dm9pF8JZD8tw83xazhQgnRDyISmFNlV93jRk0xCZUuJWUvVi4aFe0sTQFFOXM32GrrveHR4xeOYN9UwAkfMxozlrLlKfhjJt0zUMI/Uj/s9ZNCX4kRfokmKejtO0tmjNJY9ivRoSeh3vXHdl2ZxHAKbBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by PAXPR04MB8287.eurprd04.prod.outlook.com (2603:10a6:102:1c4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 13:28:16 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%4]) with mapi id 15.20.7784.016; Thu, 25 Jul 2024
 13:28:15 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Thu, 25 Jul 2024 15:27:47 +0200
Subject: [PATCH v6 1/8] dt-bindings: i2c: add support for tsd,mule-i2c-mux
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-dev-mule-i2c-mux-v6-1-f9f6d7b60fb2@cherry.de>
References: <20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de>
In-Reply-To: <20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de>
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
X-Mailer: b4 0.14.0
X-ClientProxiedBy: VI1P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::21) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|PAXPR04MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: fd26d9c8-dcf7-478e-9872-08dcacada3dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEZXa25QcG9tWlQwbzZNVzBkKy9GdVlwZ3h2OEVkcmNncVlPcjBiWGdRVXc5?=
 =?utf-8?B?NUJIWEpwelZmUUVhOGRCTHJpYWg3VmYzV0tWcmh3MWovWDhLVzFqc1dld1JI?=
 =?utf-8?B?MEZ2SGVxRXJEeVFqUTh5cG1WUkc2aDM3Sk1qa2ZpTHRnbTJkZTg4aERibFd4?=
 =?utf-8?B?eGtaMWJyY0dTZWlaTE9EUGtBTUE4c2R6OUJYVlZEc1NWenpqZHNKaU1rNVg1?=
 =?utf-8?B?cWc2T1QxSWZHNU5QOGtUQXR6QW1pbnpYSm8rZ2h3eDZsUTEzOHoxN0h6SG0r?=
 =?utf-8?B?ZUhzdG9kT2FReDkydFBkQVR6TDgrT0RKQkJuL3RlV0FmM0FiUWdOZEQ3Wm85?=
 =?utf-8?B?VytPTW5zMGNFbWdmNGI1dTVqT1UvbUhraVJGbmdhenRxajlzU1JTRXI0TERh?=
 =?utf-8?B?RnJ1R3lDSGZqcnc1TWhHL2c5am1vTzFWYms5YytnRE01WmtIakh5RjVOVjVG?=
 =?utf-8?B?T1N0VzlyVkNYU1czeWJSZXBuOWlWQzJsYzFTb3BJV0Z5cUk3bGpnSXZZdXpT?=
 =?utf-8?B?VUFXLzNucDFaZmdQSTZmZkRlWTR4VEU2eHZ3UDlGU2Vtb0JQbmZITXJ3d0Jx?=
 =?utf-8?B?SVNRNXFaUWNCaEprVDduTGZZYm0zSUZWazdiSG0xZU9rVFlwdUgvM1FIWTZh?=
 =?utf-8?B?a2ZuMm5XcEFaa3B0UnVzdXBpdVdKUmVWd3UrTlZDNXlXWnhtbEtGbGgxL0w4?=
 =?utf-8?B?MVJyMW52cHJoT01ER2RlcW8yMmVMaWtXc2MvY1lCem9QSkVjdWVvaUZCRThX?=
 =?utf-8?B?cktQTG5TTmYyZ240NGN0THQ5alZkMmNKL0N0a2RhaTh2QzZkeXB0S1JDdDBz?=
 =?utf-8?B?YjBjbHlNcHBLSGVycXJDSkV3bDFSdy8xOGYyNnVkbnFYL09Qcks0bXNGc0dC?=
 =?utf-8?B?ak5adjJ5VmNPTUJMUWxaeUE1bmNIamx0ZHRhcFllWVRYNmpGMjkyVjdaMEdw?=
 =?utf-8?B?WExGL0JmblR4cU5nWWtZeW11V0dXdnh3ZS82VjNuVVpaZ1RuL0drU1RidFdI?=
 =?utf-8?B?QlF5cVV2UWJnUHhzejNiSHM1U01QeXZQTUVtSHRNQzlqYzYvN2x2Nk02MVkv?=
 =?utf-8?B?K1pUc2lEaVJLNEFUY01CSHFtcnFNYzV5cW8xcDlLdmF5RzJ2cjBQdHN4UzIw?=
 =?utf-8?B?WTBCSEp2L0YwWDNuUU9nMjEyNFR6blUvbnlFWEhBN0ExUFA3YmZnTnNhYnd5?=
 =?utf-8?B?bE45RWFOZUUzbmZIbmxNakFhRTNia0I4VzVtcnNPV2dvMGFiMEVSZlhraDhh?=
 =?utf-8?B?UHJDV1hqbmJsVDl2MXpYZkJVb0t0ViswV0ZIZFlQWkRocktuZUx4TXI5cmNU?=
 =?utf-8?B?ZFZnWTVKSXhpa21GY3ZHUzVPY2VYbVpUS2pwcGticGYySXF0c3RlVnhTcytU?=
 =?utf-8?B?cmR2ZStBUHdOVXVkczB3S1YrcDNhc0ZBRmVoVXJBc0RJWHNKL2k0Sng2Z2Rq?=
 =?utf-8?B?Y2hjQnhSYVZ0QmhCZmRBUGNyTlJHTnFnMlc1dFgvcHI2aHp0NEZDaUFJcmNB?=
 =?utf-8?B?OU5ZeFA2OUJLYVZxZGNRMm51SWRrRkVMMGZ4Y2pPMDg1c3VYcnQ2b3hsSFZa?=
 =?utf-8?B?MEthODl1Rmovem5MTUk3Y01GL2grZnNJbUdOaWJRTWEwLzNNdDFmMXd1YStV?=
 =?utf-8?B?d3lJVGFaVVVUNGY0OXNyRGQvQ1lQVXdaUjZwZ2VsczZnK01xRC9WZVdJa1pH?=
 =?utf-8?B?MXg2MitWTDJPQnlrS2xKL3lFd2dFSEJGcFBoSnptUkl3a2l3NGxiSEIzUGx0?=
 =?utf-8?B?S3ZqUGxZbHJTMlFnRmU3ZGl0M0hVbkxtbjNTbGxmeHZFQXdNVS84QTMrNFlq?=
 =?utf-8?Q?vuNmoc+iczumjoics3yPUP5nBT5oQhYrGK/0c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmJ4VWEyRXZwT1dYd0djcWMwTTQyR2ZIblVlNkwrOVhTdWlrWUNLZFc4NWVx?=
 =?utf-8?B?SzV4VGdQa2ZObVRBUXptNS9CUDFWYjU0UVh5Y0pkM3ZTdjR5WTVZMnU0MjNO?=
 =?utf-8?B?ZVdlU2s3RjRLVlZaU3JQTHl2emVvZnBEQXhFT3JvZkRzaVdaRE9VY3VZZDlP?=
 =?utf-8?B?QldKSU1vM0lXUytYMDhMdWVQamVjWHJ1VHdocm9rSUlSSitzRUJ4dkNoTFI1?=
 =?utf-8?B?OTF2bE9uMjNzZTJ3ZmZiSFBKMkRHSlBZbFJUQUwvU3o4Vy9uUjFXUk9pZ0xB?=
 =?utf-8?B?bVVzcm44Mm5oTXFwQlFLVWhzNzl0eXVaRGszbEVGT3RFSDFZVFplaDNUc2gy?=
 =?utf-8?B?Y0k4cEVQZmt0M3FDWXhoeEFIV0VvUHRDazNpbC9QRCtQY3JEOXh2OWgvL3Qz?=
 =?utf-8?B?eWJOUTBrQ2xCNXlTREd4QUNlbjVJMDlkWVNsVlZpbkZ5N0xMS2JxS1VnSElQ?=
 =?utf-8?B?SUVRVDMzMHdSOVV4bmU0YVhnWktKK0p5M2JDSkNRT3YxZHZvUkRZQnhWS25p?=
 =?utf-8?B?ZFZFSkRaWTZVak01YjkrOW1GeEh4ZC9LZm4wREl0WHNCVWJuYnNtMjlWNExz?=
 =?utf-8?B?Q3pkeGxvdlN4T3VQVjVsZUE0VkRHN0pyb25keC9jblhFNEZOcGkvVURqMVBj?=
 =?utf-8?B?d1pmY3p3Y2tRVWVJM2pPeTh6SyttWkhwdTJneStzUERjMXJYLzdlYys2TnE4?=
 =?utf-8?B?Rm1PZTdFT1pucEsyazdmZElpd1JoNU9pT25KVjZFelpBbGQrUndaVURlbThk?=
 =?utf-8?B?Z2VTSVZwSEp2SDJuRlFrSEZ1UFJ1ZURKeDZTdWdhN3hsVURmaGxFVjRpdGhK?=
 =?utf-8?B?UXJROWhUcmJ5cXY3M3FXNGpLcU9ETG9Bb3VKZHF3QXN0UlhsbFBxTDNnV0lo?=
 =?utf-8?B?VHQ1VHN5QXYzaC9qMXVBandacEJnci9adGl6OEVxQjdXRW1scktVOEx3emhu?=
 =?utf-8?B?UEhqS3VQU3VmSEY1akdTWTlEUzNIQXNKaERJTmZXMjUzTGtkOGQ3ZGJUK2RO?=
 =?utf-8?B?UlVFYUhad2V2WnJGN0N2UEVHKy93eGczenlhS2ZEMlpMTlNnMXdTRDdzWmhE?=
 =?utf-8?B?TGxBV2xKaHNYYnZCU09LOW01R0gybXFtM3JMNUxWcWc2Mk1yN1BnWDkxTUt3?=
 =?utf-8?B?WVc1OS9jZ1JiRG94OGsxZHhpb3ZIMXhFN3hlTXJQdGliRUhXdnRwZ09NNU1W?=
 =?utf-8?B?b0lTcDRvSnBPOFVOeG9sUlZsdUowYnBsM3lJeWhzcDdaLzVoeXRmZFo3NE5w?=
 =?utf-8?B?eVRKcGV2K2xiNzAweWJRTmdLYnVVSGg5d01CLzZrUUphWm9DNWg1dFU4NE5T?=
 =?utf-8?B?MjJ5eElTNjJPMTVXUCtLNUlFRFdTTGM0NTlEcmRKWHlYb2xDTVJGT1Z4bHVl?=
 =?utf-8?B?RlZkajRZTExKSlJmcW5iYXQvQlhPOUVDOVMyNUY0QThSNGhkQ0h5TFRQYUp5?=
 =?utf-8?B?ZnZiZTFBWlQ3NEY2WFJQakJaTG0rdkxONExocy9ORGY5VlJYZGV5ZDZFUWxU?=
 =?utf-8?B?Z0VvNzAwMXdVL0F4aEpGQmp4ZER3VjlyMDR5dVF2UVJMZXIxbWlVTHhQZFc2?=
 =?utf-8?B?c0R5U1lGd1dyYk50ekJoak4vOTRKa2J4NHlib2FIUDJjem00UW5jV0lZZVor?=
 =?utf-8?B?WUJubmcxTDVxSEhzbHdzdi85RnlPZXBPTjhDOEFKcmZ6RG5acmpFUjRzemxC?=
 =?utf-8?B?UzFoY0dNNGszSlhYVkV0R1phODNLWnFRSG9JU3pNOG5IOVpCN1ViUDNGQWJL?=
 =?utf-8?B?NGlDblJ6MS9Ka1Y3SCtMbWpqME5FMHJxR0p5d2lpOFZmVnJRMS9uTkM5NGdL?=
 =?utf-8?B?MkpFZG5FbnNtZFdnNnVJNFI4Vk4zWkpSQVIrODJaMlB6bjFxKzljNGtIREhq?=
 =?utf-8?B?Smo1SVovTGdpWjd4NG1RSGZJODZreUxOYTVYbERWUVlIbk1ZakhWbGt5YmFr?=
 =?utf-8?B?U3JNenVsK2VLNlU3QlJzSUkvV3F3VExiRExkb0lDdWJjQVBieUhrdVhKR293?=
 =?utf-8?B?bHljMThJNTF6a0Q2cEY3K29IYmRHV1JpRkZycjlFcFFnMi8zV2YxK0dTd3BM?=
 =?utf-8?B?SjIwN25pRkJrYlFjRFU0Q2hXd1dDM1VkbTlsSURnQllubG5FV2N6Y29GcEpW?=
 =?utf-8?B?NG42ZE91OUs0RXc3Skx5MkFkZUZ3NHpBUWNTMEx4eTJUcE11SE1FRHU5b1Vp?=
 =?utf-8?B?SGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fd26d9c8-dcf7-478e-9872-08dcacada3dd
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 13:28:15.9019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5B7c3MikPdCAGIvajGfQUXy44zCTns9LMAZvuSYfXaL4u5qzLkFI7/mvEb95QllhM+lPHqN1ZYLy+tp4Ir++jaAGV/aA06dhqXwkrG+DMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8287

Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
among which devices that are reachable through an I2C-mux. The devices
on the mux can be selected by writing the appropriate device number to
an I2C config register.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 .../devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml b/Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml
new file mode 100644
index 000000000000..28139b676661
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/tsd,mule-i2c-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Theobroma Systems Mule I2C multiplexer
+
+maintainers:
+  - Farouk Bouabid <farouk.bouabid@cherry.de>
+  - Quentin Schulz <quentin.schulz@cherry.de>
+
+description: |
+  Theobroma Systems Mule is an MCU that emulates a set of I2C devices, among
+  which devices that are reachable through an I2C-mux. The devices on the mux
+  can be selected by writing the appropriate device number to an I2C config
+  register.
+
+
+      +--------------------------------------------------+
+      | Mule                                             |
+  0x18|    +---------------+                             |
+  -------->|Config register|----+                        |
+      |    +---------------+    |                        |
+      |                         V_                       |
+      |                        |  \          +--------+  |
+      |                        |   \-------->| dev #0 |  |
+      |                        |   |         +--------+  |
+  0x6f|                        | M |-------->| dev #1 |  |
+  ---------------------------->| U |         +--------+  |
+      |                        | X |-------->| dev #2 |  |
+      |                        |   |         +--------+  |
+      |                        |   /-------->| dev #3 |  |
+      |                        |__/          +--------+  |
+      +--------------------------------------------------+
+
+
+allOf:
+  - $ref: /schemas/i2c/i2c-mux.yaml#
+
+properties:
+  compatible:
+    const: tsd,mule-i2c-mux
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c-mux {
+        compatible = "tsd,mule-i2c-mux";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        i2c@0 {
+            reg = <0x0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            rtc@6f {
+                compatible = "isil,isl1208";
+                reg = <0x6f>;
+            };
+        };
+    };
+...
+

-- 
2.34.1


