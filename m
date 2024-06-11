Return-Path: <linux-i2c+bounces-3972-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 422C1903B02
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 13:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E9E41C211B8
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 11:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4A417BB27;
	Tue, 11 Jun 2024 11:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="aNHQmHki"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2097.outbound.protection.outlook.com [40.107.22.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B411A17B50D;
	Tue, 11 Jun 2024 11:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718106279; cv=fail; b=dI4XkHiWVJj8gq628In7gztQhgPQjlvhuvIsrSh1aPUv9utgSFBbG7BEBWEVSy+Uyo7F99mbfylrEILUeAScWC6pYyjgqsSzAqmHwbBTNlGA8i4IeWxcycHzV8VMLuFY6tkx1/0D/+Z7tGYeLlh76kQqGu+KQj26CbAcOVOcq7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718106279; c=relaxed/simple;
	bh=JOZrUrNSD/xeJrxGOtvZknOW3Zx76zJJA7z6aDv1jWo=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Htq4/33ub0StPkBo2ktzyrZkSN2lcvFXL/pdBHTvn6E/j4A3VNZ27NvoZQMkcWSPJLfPFl21jjUsIQEOTJYssBoZsdyC6rjAhamZkbU6xreF46611wABZGRAwhBq9MmCCbe+000sXnO9sOYKNjZZzzYP6uxHITVuS/NFIshb0ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=aNHQmHki; arc=fail smtp.client-ip=40.107.22.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIwzp1xBaoLIX9UlPFqcux5zxUdACOrcOLrXKgnoTIr+qV7PpxVFPDSE3sFQHbP3JySePYD0JispBbnVKrpBRuhfr8zkXs9lxHGRAOgV3HEZHYkM132jnPsGLR7xuITjAMgo3WLzpFX/x2rd0axHRfXaj5DwN1DE9e7nDe9x9qM2ReHsnKQvdtSd8CMZ74ZhpJ05AOE85k5AAicXy1MdVSJJ5OUckkTQNdrKnDN7MIgeToNlUYWeld3Ad3dtkFQnujJQXxy2VW2qDy+B/yt7ak565cWSf7lYoOEUZDkD2er55dj9MQXkytGYzvjYIpDc/IfmLLftBDdIWb00q1jk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3l5J7jsz7J2az0lxLN9NeimRvs7dviCrrCG2dI7VC4=;
 b=ENOIc0VqOC1ewc2B6YNCEWWsAgqAH6+2EK8FmGYYcT2JUBw4LOer7Unh8wOTgXG5stDgpFdgWRr6phw+UPWobNyOX4wXSww/vBUCvOjlkvfV/l5HySpKhhHTmRxyXxnp4iihYdrLXSN5rwQWkskyb3VoPzylU/KRnpRjIlu54gHunjwgXCiFu5vpLPOD6KfUxHSdyjmoOgTwlgRjP8BdhnQOmHdyraeD7kUJFRVxiVR+J8CXNofZxZ71lxs1BdHQ6v+8v78DxPrbU63iVSyYtJrNhWoBE4vlWMCyh7LxjEgDsIRICLHBkqC/4O6JdSS6ueqB5BGc9ZBf/FzJjJ08ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3l5J7jsz7J2az0lxLN9NeimRvs7dviCrrCG2dI7VC4=;
 b=aNHQmHki0p4SoSH/lkz0ZnG+0hD2WK4VeisYhDYHWQ6aqmgW31oZsJYWChUBn/cHb65hnTbeUH9cKN9sjKFHcKPdP0Yrv74pkYpgFnb14ffaH5U6jaNhdnE1qpH8fbtlqU+gk8i1tF989AnR8Bf21q6O5e05RZldsIe5+lEbBkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by GVXPR04MB10301.eurprd04.prod.outlook.com (2603:10a6:150:1dd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 11:44:27 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6%5]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 11:44:26 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Subject: [PATCH v3 0/7] Add Mule I2C multiplexer support
Date: Tue, 11 Jun 2024 13:43:51 +0200
Message-Id: <20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHc4aGYC/23NQQ6DIBAF0KsY1sUAitauvEfjAmEoJKU0YInGe
 PeiadJFm9nM/8m8WVGEYCGiS7GiAMlG6x85VKcCSSMeN8BW5YwYYTXJgxUk7F733DOZlxl3lFR
 SAWkJoyifPQNoOx/kdcjZ2Dj5sBwfEt3bD8aaXyxRTDCpuajPTDdaj/1kwI/BO4HjEidwsZTeo
 R1O7Itx8g9jGRMdlR2vdcNV20sDISylAjRs2/YG8iWuIv0AAAA=
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
X-MS-Office365-Filtering-Correlation-Id: d76bb88e-df4c-44d6-d9ca-08dc8a0bd800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|1800799015|376005|7416005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzE0eUY5SjdLQ1lSbitwekVUR0FkVENCTExpNXJMWkxxV3VLeTNVczhLYk9B?=
 =?utf-8?B?aCs3ZTJET25jRjIvbFdVNVV1ejB0Yllnb2RKN2NBM2h1SnFackpzZHpmam9Q?=
 =?utf-8?B?OE80TXEyMzUrdXhHd1pGd0xkQWk0OTZNdkNJT1d3NjNGd21DWjF5RXY3bUNQ?=
 =?utf-8?B?V1pKRDd1amFNaHVRRS9YVkl0a2YyV3ZPMWh3OWNSSkdyRS82TGtvcVNtRkxZ?=
 =?utf-8?B?RWhJcFVOOCswdkE2ekFhOSs1NVNHZ1dXcjg4U1hIQnpKOEtjZnhlOVptVkFP?=
 =?utf-8?B?WDQvdjBlQnJsNUZkUldwRDFwck0wOVdrcFRNUmNvM0FpWWhwOUk2OHpXamVI?=
 =?utf-8?B?cnI0aVdjaHdXYlJlNzBIeklDWkQxYUE0c0FVeVJYZmQ4RnJ3T3paQWlYeXJL?=
 =?utf-8?B?a0VWc2p5UmIzbDZ1My9NcE1QY3J5b3ViK2JGcmt5b0NmcVpuZHJpbEpGTlE5?=
 =?utf-8?B?aEFOcFJQQk83eWdjWE9nMGpRWkJmTW45RlRVbEhsdUE3aldGbG9iR0lYaGJU?=
 =?utf-8?B?WUxVbElIL09Iak9ubmZmRktBS2ROR2FuWittM1RCS1AzeGNCOHF6QTJ1cGJK?=
 =?utf-8?B?UURGNmhzd2VFQ0w5Q1U4N2s2VW05UW5Td0hkSUJhWXgwNmthc2NmSVhQWEVM?=
 =?utf-8?B?OFQ1bXEyY3NISUU0QThnWUkxR25GSmNhWVhVMnJ4cFBUVUZKMGxGbzJGSWNj?=
 =?utf-8?B?Tmx3MStpMVR3TW81Yi9XVEFwU0FtdUQyK2U2ay8rTktTRkJSNjJxM0NrcmNY?=
 =?utf-8?B?R0orV3h1L0E1M2UxbTNxR3pSblIzT2ZpT3JFNGtvbTNXeEdZbUFoZUVBWjhF?=
 =?utf-8?B?RjdVc0crTXdDOXFEaWh0NlJ0RWhqTjdxU1U3c3ZwVEZOWmNWK2Q0Qkdqb1hp?=
 =?utf-8?B?MHhncFF4a0xNVmhmN1dhYWJYODlpU0hZMXNBMi9XV0prczQrMUlaY3ViQ1Nv?=
 =?utf-8?B?L2U4TjdCQlk2WUk3UkQ0eXFoQVE2OGdDRjErOHRudTl3bGhkejBRbm9mYXBI?=
 =?utf-8?B?bXRNN01oakJ5amRoUU84M0NHVFczSVN1R2NRUGxqcmluZjNWMGhEQVptOUhr?=
 =?utf-8?B?cWxrOGl0Ykx4ZlBoQVlxcmRlVVpwcDFaMDB2d2dPUC9mUjR3akdHUDFqUG5h?=
 =?utf-8?B?OGx3ekZ3NVdnNFFKNG9obDJoREJUaDRrdHdsaGxhWG0ybjgwZCtjOUZOVEI5?=
 =?utf-8?B?QmF6K0k4SzUwWW5ObG11RE45clJBRkV2ZlkrQzBuNEFVci9PM0k2TTcvSStP?=
 =?utf-8?B?OXdvR1htMWEwMk4ySHFlWDRhamlPc0hKemxqamRZK1ZoQi9oV3QrOVQ4UUhJ?=
 =?utf-8?B?RGxNRnJNSVB0dU5TOFhpOVdYWTJrcXhUa3g4NGNlWmMwTHN2S2l4MEFsNWJJ?=
 =?utf-8?B?MUlXTzY1SE95dFh6dVg0dHByZzhvN0dGMDluNUpuMHZqZThWZUxIQVljRC9D?=
 =?utf-8?B?V2pEWUpML0FpSGo4NU5mV0hMYitkVXNHSlkvdFVQRzI2RHNabnFPby9EMVBs?=
 =?utf-8?B?RzJ6cjZVSlhCdy9mWGwvamY0VHBqZWo4TUdqYU5ETG9HNXp3Nk9SMmRUK1dC?=
 =?utf-8?B?aXFuR0NMNzI0dXpPQ1B6WlByaC81Q1Mwa21EOW01UlhzWmVMU1NEQTZuN1lG?=
 =?utf-8?B?djhHOVc5WTlPVnhYS1lmRjE1VUdqaGZNcGZvbFFNbE8rdlZnbm5XOTg1M0RJ?=
 =?utf-8?B?WEcrN3BJamhuaEFVL24yYUFUWDg3MVRuaVRFMXVZTkV0V0NwdmxSVUYwQ0ps?=
 =?utf-8?B?UDhxamRMa0tXZWd1ckE3UEl0MGdEMVZ4a2VmeU1GaU5qeXNQVWpDYkNxQWx5?=
 =?utf-8?Q?90GYf7OLy+mI63LhbyosHh0GVwZeKk/9P7kIc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(7416005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFk4MkVlZDA2K3BvNUtVRVRQTXArMHNINzhjWml1cnFLZ1VBOXEzRHpnTmNC?=
 =?utf-8?B?c1c0MmVDRzhOL0E2UzRCMGozSmtoVm4yeVlqdXlha3dlVUZiZ1ltNitLTC9Z?=
 =?utf-8?B?MTRKbkdQakRMQ1RWTit0cUxlZlIzRVh3Uk9GMFc4SFJkS2twMVZjY0hQRnds?=
 =?utf-8?B?Z0srWkx0L0xGYUYxempQbWdFTnkrRDZPdkNUVG9zMXdsR0FCcWRvVGtyUUgv?=
 =?utf-8?B?QUJjb09SeXpsUUhNNXViK2ZpK0tuT0c2cW02NElXUU5WU0JKRGxTTmhIcXpQ?=
 =?utf-8?B?YUpmM1VUQVdGcUlxTk56UG54alJ3Z0l2WTNRbElHVmsxQjh5cis3VWxhRHdJ?=
 =?utf-8?B?NmxsclpKTVQ2M0pSNU1zbW9MWFRtK2hGSm9JcUhPOWpEa0ZNSEZTc1hINFl3?=
 =?utf-8?B?alZaZG1GMmt3MGdPTEkzRXJhbVdacXlmOHpSeVVvU1NSMXRiZ3cwVUVLUXU3?=
 =?utf-8?B?ZmUxbiswU1NKU2kva0NOdVdhUnI5SjhuWXZxbmcyWmlwZlA4RGlscExsbWoy?=
 =?utf-8?B?WGp3aXhEeWI4eW52Z2M2MCtxOHdhenVDZFlBVys0YkN4cUNNcmx4ZkdtYXpw?=
 =?utf-8?B?VFNkb2Z6blpQRTFGRDBxbUtPdXJaSFIwTGhZL1p4NlYvZTlNbXVNK2NBK0hT?=
 =?utf-8?B?M01rdHBwTkZseEhkdnE5bDkyNElhVnZoU1E2b2Q5cVlkajZneUNwNXV3bFVH?=
 =?utf-8?B?MXM4enJvSXhZcXRyTisyaFlvZEZPR09NYXNXV2hUQi9QNXpGcHVBTVJpTDYv?=
 =?utf-8?B?d3dSZmFDSkh6cGl6bis2L2NrUWJJUDFMbkdRMHpjWWdKUS9Sa1ZiQTYwTE84?=
 =?utf-8?B?L0V5UU9Qa0pjalF5b2U3N2ZmejAxd0JpWElYYzh0WVExOUdIb2JEYUdDQTcx?=
 =?utf-8?B?SWZqZ1gvNTBhdkk4QlJwNk9LSGxSNDNHaDZVTGRFTS9YSXUxeTBnNGs4d3d3?=
 =?utf-8?B?OWM0TG5LemRMcWQ3S2FtajBpOExKSVdhN0NiaDJNVjBRd3BYMFk5cVlzUU9V?=
 =?utf-8?B?Q1hvS200b3FNWkNtem10aCtEVzBPYkoyQysweFlwN2wxcllRYXJrN3hYeWd6?=
 =?utf-8?B?K1FkSDM3bUoxekVXeUI4clZsVlNBL0UyQzBBUWdBSUhiSTBuMERXMnpOVmor?=
 =?utf-8?B?aVlkR2FPL2lPTlA4RzAzTzV4MERubmdYcTY3YzNscHVaci9NMXBlRmV1Yllk?=
 =?utf-8?B?NkVSVWxlU0lTOUNya3oyK2FzRkJ0SWNmMFowTW5pdWRVdVFJdFpWcXdmdXFU?=
 =?utf-8?B?bEJGMzA3MEZkMy9sR0pNdHdVay9qaVlRTnlpSHZENVJwelJySVE0RFY2T1hm?=
 =?utf-8?B?anZhTjJjRk40S1drUzVlOEh2aTdjKzdhcTh2V1M5c0htcWg3USs3cHFmOC9W?=
 =?utf-8?B?clZIKzdzRmltcjhtVTRlbzloc01Za3FrTFlTMFZ5ODUxZEsrVG5xTEtjb3J5?=
 =?utf-8?B?ZlVHZ0cvT1I3Vk5vT201bnBsVEdLYVNqRmxiaUNDQ0h2c3FodkUzdzlVWlVK?=
 =?utf-8?B?OG1YY3dzWTFpMnBRMFViZEx3cVAwa1Q1VU9lbDh3N0g2aHNNd1NDc2dmRWdP?=
 =?utf-8?B?VDBmeURsYTdGQlRZOWNmMzI2Smt1L0pJdUphdlhYTzZUNWZYaHU0UW9jdFJJ?=
 =?utf-8?B?ckJtUE1mbFpRT201YnE5ODVWQmcyWi9vNThlMmNicHBsTW9zOW5EYUtnTUN0?=
 =?utf-8?B?NFdWU2hZS3VZcWc3VllmTHN1OXYxajFSQlljMmRHMjlrcUlDUlI2ZGpvM1ZW?=
 =?utf-8?B?ZnVwNFMxdXVKaG1neTVvN2xSaGRSRWNMN0R3NytLenUxc1VTaVdXWXhxbG1o?=
 =?utf-8?B?R2krNkh5YVlCZ1RHNmR1M3JnZ0ppOUxqYmxuaTRmSmNTeGx6SjhHNHBjK3RH?=
 =?utf-8?B?RkxERk00ODNLNWJTL2ZhdE9GTkJTQ3E1bW9BYjNIR1gzSm9ad3JNMGdBM01X?=
 =?utf-8?B?UlRDemlJWlQ3MHRNc0lxQnJuVWRBSXFhVEdGc01lc0xnZHdCd2lnZ1hzRTVU?=
 =?utf-8?B?K21NWmRuaHJYTmxJN2UyU3JRVHRlQm93T2x5TzNCYlp6UVdNeVF3NTVycXg0?=
 =?utf-8?B?dUt5Y0NmdjBJN1hoSmIxcGFScmRIeXpoY1RIQjB0VnlRNGg5c1ZMRDBaS2N6?=
 =?utf-8?B?RzlGb0FJbmRJRm8rRmpXR1g4UTJpUmo4SG4wZ3VRYmR1ZVgzeUFGeWpKUlRO?=
 =?utf-8?B?dEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d76bb88e-df4c-44d6-d9ca-08dc8a0bd800
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 11:44:26.4214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QTBXPe6yDMJhYdd54Z8KrWpa/1lG6pQGFYWPyHcf1a9colxdfryYU8J20jhlLJD4SiD+jsPE2ynCUeMg0fVZ5WVUAI8o9Hh7p5G+JCBnenY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10301

Mule is an mcu that emulates a set of I2C devices which are reachable
through an I2C-mux.

The emulated devices share a single I2C address with the mux itself
where the requested register is what determines which logic is executed
(muxing logic or device logic):

1- The devices on the mux can be selected (muxing functionality) by
writing the appropriate device number to an I2C config register (0xff)
that is not used by any device logic.

2- Any access to a register other than the config register will be
handled by the previously selected device.

      +-------------------------------------------------------+
      |  Mule                                                 |
      |        +---------------+                              |
    ----+-(1)->|Config register|-----+                        |
      | |      +---------------+     |                        |
      | |                            V_                       |
      | |                            |  \          +--------+ |
      | |                            |   \-------->| dev #0 | |
      | |                            |   |         +--------+ |
      | |                            | M |-------->| dev #1 | |
      | +-----------(2)------------->| U |         +--------+ |
      |                              | X |-------->| dev #2 | |
      |                              |   |         +--------+ |
      |                              |   /-------->| dev #3 | |
      |                              |__/          +--------+ |
      +-------------------------------------------------------+

The current I2C-mux implementation does not allow the mux to use the
I2C address of a child device. As a workaround, A new I2C-adapter quirk is
introduced to skip the check for conflict between a child device and the
mux core I2C address when adding the child device.

This patch-series adds support for this multiplexer. Mule is integrated
as part of rk3399-puma, px30-ringneck, rk3588-tiger and rk3588-jaguar
boards.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>

Changes in v3:
- Change "i2c" in comments/commit-logs to "I2C"
- Fix long line-length
- Warn when "share_addr_with_children" is set and the Mux is not an I2C device
- Fix/stop propagating "I2C_AQ_SKIP_ADDR_CHECK" flag if "share_addr_with_children"
  is not set.
- Fix "old_fw" variable is used to indicate the reversed meaning.

- Link to v2: https://lore.kernel.org/r/20240506-dev-mule-i2c-mux-v2-0-a91c954f65d7@cherry.de

Changes in v2:
- Add i2c-adapter quirks to skip checking for conflict between the mux core
  and a child device address.
- Rename dt-binding to "tsd,mule-i2c-mux.yaml"
- Add Mule description to kconfig
- Fix indentation
- Move device table after probe

- Link to v1: https://lore.kernel.org/r/20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com

---
Farouk Bouabid (7):
      i2c: mux: add the ability to share mux address with child nodes
      dt-bindings: i2c: mux: mule: add dt-bindings for mule i2c multiplexer
      i2c: muxes: add support for mule i2c multiplexer
      arm64: dts: rockchip: add mule i2c mux (0x18) on rk3399-puma
      arm64: dts: rockchip: add mule i2c mux (0x18) on rk3588-tiger
      arm64: dts: rockchip: add mule i2c mux (0x18) on px30-ringneck
      arm64: dts: rockchip: add mule i2c mux (0x18) on rk3588-jaguar

 .../devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  |  80 +++++++++++
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |  20 ++-
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |  20 ++-
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  19 ++-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |  19 ++-
 drivers/i2c/i2c-core-base.c                        |   6 +-
 drivers/i2c/i2c-mux.c                              |  48 ++++++-
 drivers/i2c/muxes/Kconfig                          |  18 +++
 drivers/i2c/muxes/Makefile                         |   1 +
 drivers/i2c/muxes/i2c-mux-mule.c                   | 157 +++++++++++++++++++++
 include/linux/i2c-mux.h                            |   1 +
 include/linux/i2c.h                                |   7 +
 12 files changed, 384 insertions(+), 12 deletions(-)
---
base-commit: 79c1f584335af42ce359ee3ff0f4e9cc324296ed
change-id: 20240404-dev-mule-i2c-mux-9103cde07021

Best regards,
-- 
Farouk Bouabid <farouk.bouabid@cherry.de>


