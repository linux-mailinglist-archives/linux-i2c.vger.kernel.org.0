Return-Path: <linux-i2c+bounces-6390-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B7A9712BA
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 10:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCDF7B220B8
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 08:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FCC1B2533;
	Mon,  9 Sep 2024 08:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ZZr9oMHR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2086.outbound.protection.outlook.com [40.107.215.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7599B1B1D7E;
	Mon,  9 Sep 2024 08:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725872303; cv=fail; b=BeW3YyTT/hapFsYISvGZXp1TtsxNvpXbigpVZpED4Zc2F33A/rI3oNpEANPxRmXx5hcNlUVH9GCRel/++7cVT5GL6t3vgtrSvrJGw1rg1IQ3O6pbahVg5hA76eS2rbysLJlMhX4E/z42ZiKL9sdWiNZGO4zu9bWbb2LT+zVD6cc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725872303; c=relaxed/simple;
	bh=0QI5slGuwybAn4UmQs7UI5b9EGeFrVyWGlossZfxNSE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bnU1ZvfK/vf+1O6oizGJmJ7gw11coCVbkuB+lOaXZ3bir924R5a4MIHATGUMvaBXFgHwRwLokfQogUcFeC81Pne77ilJFeQ4tuSaWLoDvPTyBIJSLKgbm4wwsysWRl5r+jQh/IiYQKLzuUh2WoSo7O/0mj/CQ2YrHRNwgjhdz54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ZZr9oMHR; arc=fail smtp.client-ip=40.107.215.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvVuKbwNYBLkuIGXy53HJXz3DxkJ2QBG8O1UEhdSssCI5ANc2EdXV4tKsx6p6KLsCWZMeAml8NZK9cYUoIM0WAYaWqoSL6xB7uiUMWoccsjtRaZISjgTOMNsQkxaAtwIL8BjmrSu/mvBDzTm+u7HW8FaQLIFXhe3cw81Tr5i5hCumxM6gXOjkwG8j2W57DwkxkmLc1U/opNU4wbtZK53MmNKb6i3AiFFyO8i1PXyUwKJyhbJ/s6iH/3SPhUsZtrO4qybhIJMTWPdgY8YyEgIKrcg6CHqCG5x5TQStQWnItiaemR/6eI7kLKqOM9CdZKExVlIHFhCoW9ncsXYVtBDuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QI5slGuwybAn4UmQs7UI5b9EGeFrVyWGlossZfxNSE=;
 b=L8RvijMKiuXvEi5h9B1SNqiJ+fPpcKuKggPQDlIGwygfo9BuNepJUwl5Kl8qtjp5Oa2UvIl0wd7UlZApqkDvL7xpVbk/jmk4LtUAgC5Ytr4gRo+bJSFv2+KU6aVSF7VsLAxwpKk/9brEsuFQWkXKdpuoEBdDZ24H0S/Mm5IcErlJ6km9zmbuHujS2Nqz15ykZCrXRq91MnNI6vrZDv9T2U/ufUB5tCbK5LfkeM/fQ7RoGEQpvrLA09yVuVc62myE5f2hkfZqegmrtDkjCuxOJ76nDOlu0DDUBrgx+sXJ9vyFI97QGVbAxjgiFyRZQT52/d+zJICedoA/00p1ou0vlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QI5slGuwybAn4UmQs7UI5b9EGeFrVyWGlossZfxNSE=;
 b=ZZr9oMHRTJvNVnPVcu4mUaW5dvYSfyTSDvTXhVN8k+Y3MsdVv/F6ZINQ64Io8pMd4kyWupP5IUla5Q/AbGWluezTQ4vqq1ZFp8M8jdC0NgO63sFAsU4V4oo0hNAskXjQiEzNO3vzeruhhRAQuDseP74Q4DZmFds8LjquYt4SPncjznDxsyr7OERpc4aCEDdWJcjCgTQtJA1oU/67kMd7oO9+ypdmuzprhJfvIi0A8eBw5YAD3N9oKFMII41tApyQwP0IEIHGMYJNO5kiE/BKvDuXL0Ug+jLidHNOVz55083BYHbwkzQ2DCI6XrunRncqm4/yejt/WKn41dMKZt7HEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYZPR06MB7256.apcprd06.prod.outlook.com (2603:1096:405:ab::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.23; Mon, 9 Sep 2024 08:58:16 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 08:58:16 +0000
Message-ID: <2c666489-a39c-4963-a7bd-688dae666f56@vivo.com>
Date: Mon, 9 Sep 2024 16:58:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] i2c: jz4780: Use dev_err_probe()
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
Cc: andriy.shevchenko@intel.com, biju.das.jz@bp.renesas.com,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, opensource.kernel@vivo.com,
 Rong Qianfeng <rongqianfeng@vivo.com>
References: <20240827034841.4121-1-rongqianfeng@vivo.com>
 <20240827034841.4121-4-rongqianfeng@vivo.com>
 <aqigucchbgq2tblnu7gdkpiw35ezqbmgbl6a5ptzzezngnihsi@iny4xyzkjyz4>
From: Rong Qianfeng <11065417@vivo.com>
In-Reply-To: <aqigucchbgq2tblnu7gdkpiw35ezqbmgbl6a5ptzzezngnihsi@iny4xyzkjyz4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0095.jpnprd01.prod.outlook.com
 (2603:1096:405:3::35) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYZPR06MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: 273a4c4b-ad28-41a4-f7e2-08dcd0ad8b33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|81742002;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2Z5eVFGaExKcmVVSzJINmdsOHA4TUtCVTh0OEF2dldnalNOeCt4RDczTzhX?=
 =?utf-8?B?R2QvSDJ4WndLOWVXbUg5ZmN5bjRwQUhRb3loVGhxbmJPa1FYazRmS3hoRHVG?=
 =?utf-8?B?SnpKU0EzK3ZkMXRqdmxVenZxWlF5ZkhlTDd3TTQxT0xLUmsxWXBNYVV1WUd3?=
 =?utf-8?B?ZTR0OXJVOXBCRjdQMlJhdjJmWDFkQlIyazEvZW5EcnJBeTU4d1F5Vk5jRUNi?=
 =?utf-8?B?QTdSV3ZZUXo2NE9GRXNJaG5JeWZPc2pmNSsvc3M5WUNyaTV2OVMySmZvemNW?=
 =?utf-8?B?OEhqM0VvWjJ6eXpSR1UvM014dVZxbTBIS1FrZHlPbnZGMzJNbUZGS25NQ0VP?=
 =?utf-8?B?dWhIMWR6V0IxL3k3M0xJSUFkZExHdlRiY1ZwbGdjTGlLQlp0MXVnaDZYN012?=
 =?utf-8?B?eFhRY0FHa2orNVU4S2cwWVQ0eUxwMXdUeGpodzNCM3lBTkQzVDZLckxNamZa?=
 =?utf-8?B?RXNyT2pQbFF3UGRNcWFmaHVJQmZtd2h4NGdKQzAveUNmdHF0RHk5U0Jmc3Vm?=
 =?utf-8?B?NkczcDkxQUNIODNGMnlnNG1aNzhOdjVyQStPN3lmYm84TnBjN0NHMlNUbnEr?=
 =?utf-8?B?dHZUZk5Vemt4OXdtLzEwY3g1eCtxbGtHNmpvYy9nVERpTXBjRTB0a2piSllN?=
 =?utf-8?B?dW1wb2paQ2RLM0xObnVzcjIyRThZOVFkcVRFeGhKRVhMTHUvWUQwR2s5dzdw?=
 =?utf-8?B?T04yajlQaWxyOXF4MXN5SEFLNW8yYWRhMEhxTmludHowam9UTzJjbEdPTXN5?=
 =?utf-8?B?Z1Y4VWdjYk4yZVBwbXVmUk1XOTFVclgvcmhlQUtDekRSMW9laVg5S0FJRnd5?=
 =?utf-8?B?anUxcDBFVlVNTlRGVEtMOTF3MDBLc04zKzhTRlg2QzVmdUNHa3FFUkNvZW1F?=
 =?utf-8?B?aGh5UnpITnAwRm1NUDZIM3pFMldOYjBUc25nV01nQ0N6SlpNLzZsKy9DejdH?=
 =?utf-8?B?SC9wMXk5SHZ1WWs5aFJGMCtnbWw1aGtPQWJsc25MTVE2MW9memdCQW9BY1hZ?=
 =?utf-8?B?RENQM0NBSTFOQnVyeVN5b1M4blZHNyt1S3AzYXRTWHlrOE5hMUZlNUhBS05J?=
 =?utf-8?B?YTNmcldtVjZiS2ludG9BeHB2MXB6NXJCZHRHY3lIL1JJejc0Q2JCSVQzcnRY?=
 =?utf-8?B?RUtKMGZzQk93RndpSUdEZFc1S1NWZGVCZXcyeWJMVzVPdzR4UnltQlVMaVlV?=
 =?utf-8?B?SGs1WHovUndnODZldHFRTWpsYW50SWtXUlRYL005eUMwOVFiZ3p5VFdQaG5N?=
 =?utf-8?B?MDg5aENGNEc1YW5pUmEzZnpzL1dUQUpDNzY4OUZTcGRQUXFYRFgwMTFDQW81?=
 =?utf-8?B?K0dxeCsyVVVjMEZmaVlhOFpvNTllVERlUHRsVk15NE1DSE9jLzN6Mk04dW8v?=
 =?utf-8?B?amJkL0RWR3NhdnN1cVJpbnpFR1g4eHNPOFRlRVJBa3VuRkxEWmVSOGJoRmd6?=
 =?utf-8?B?a0UyTnJDckphbStHc3lTbjl0Rk96RG1Yb3E3NC94enNTNUxNblJUOVVrTzZs?=
 =?utf-8?B?VjRNQVVNQ1ordG55Z3pKOHZpZGowVEo5RHpsOWFMSWk5SFhQRkovc1A0bXYx?=
 =?utf-8?B?N2xHQXRSVGszYkoySXpIOTMwOEpmeUlzamZJbmVqWk1URnhMRjRuUFMyU2pI?=
 =?utf-8?B?eHVlK3l1bFlXY0pTTTR1WGpkTjlZYWlISDBGWFpMNGx4WlFZR3hJNC9HeEF3?=
 =?utf-8?B?TFlTTW90ZGdXSVg0OHFiR1FHSVozK3hQQjJNQzQxUkRrTDBYRkhBek8wVSt0?=
 =?utf-8?B?c0x0bm1rTjVwalBQeTZNcGg2TWwxdE5JbHJZOFVuVHpUTnpYbW53bFA1bkhY?=
 =?utf-8?B?VkJNSndtelFZQjJlSmg0NFBiTDNuVnYwQnM5Yk5TVnpzcks1cVREMCtRSzZm?=
 =?utf-8?B?bTV4dmNVSWxrQndDa2kraks0OUs1WUN4ZHVXaVhDdXljVmwyM1loZU5XQUR4?=
 =?utf-8?Q?JCcWOIN863k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(81742002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUVWdGdLUzdJdW01OUJwKzlPRzdvbVJHUlVsMTBESFgrMmtSV1lES2psWU9G?=
 =?utf-8?B?UXZDaGVQR2lTN3Z4OUU0NkFSYTRvOXNLRGJNazBFUzBkRUxWcWxQNVJXRGZt?=
 =?utf-8?B?dFNjWDZNWGVuQjVjcFZVVEF3TEl4czNHVmFlNzFUMGxMMk1IR1VuaUhuSzVB?=
 =?utf-8?B?dy9GaCtJOGtTTDVsWGJodll0bC81M3RWNU1vanY5ZkFPL24rSUtNWW1uMkpv?=
 =?utf-8?B?WVVWditIN2xaWlU2eW1KdlRvY0IwWHVxMVlhaUNUTXpWVjVNN2ZxK1JlbGtC?=
 =?utf-8?B?OEJHNGhtTjlWc0sybUFTdmtpK2ZFdmI2dU5Lak9CM2FNQ3BHN3RFSnovamJy?=
 =?utf-8?B?aW9jS0lNZkYzTUlUZm9jQndWSnJOdlJYSXZOZ244VjFoS1hya0l2eUFHZHk2?=
 =?utf-8?B?S01wNkVXMCtQbFdEbmMxR04vNGJ5anpSMEtrbGh1TC9KZVhBdjVodGNxcmV6?=
 =?utf-8?B?Wi9zZTYybkZCb3ZRSlRhdjVQSTlBTVU4QTFYZndkV0lvSjdiWWFyUGZOc1pI?=
 =?utf-8?B?bzQvRUdlWHFOLzFiKzUvNlpSdXdmczhqMEpXRHJZYkN0aGo5Mzh2UXk5ZTlV?=
 =?utf-8?B?QllBelRQaHZyY0VXa2NUUk9aVkFScm9MQjN4R1FPWUJ2aHBNT0c4MmE0WnBp?=
 =?utf-8?B?TW4vU2ZmZFpIR08vbGR0Q01CcDZDNmQ1L0JPNFNnem4zemJqRlJKTC9JQXJS?=
 =?utf-8?B?REhrYkExZ1NmVWxORFcyTC9EeHk5QVlySFhNRzg5NEgxUmFkaU5UcE5MM0dN?=
 =?utf-8?B?amVpdXhlcTJZOGc2Y1NtZ1lMSnNvZEtMUTh2eGt5Q1dWUUhRQ09NNGx2RHN5?=
 =?utf-8?B?dUVQMUhWRlpHcFRkQS9zVjVhTDRoYnhlK3dCMnVLVDJJekFYNU9oYUk1WUJx?=
 =?utf-8?B?QWpKMWUxTjlWU1I1dTFKZmpUTWU1MjNTZnRPWS9XR1FGd1lsMWoyREJUYkJP?=
 =?utf-8?B?MTJJWWdlNWRaeEZLQmR5ZmVGcThtSnhjY25CUWNCQmxMaWhUcVNYN0VQeDRD?=
 =?utf-8?B?d3pzT1lXSXRST3VkdFJIV2NweStIZm1CRDBCQmRyWTY5QXpYTUFSSEdYVnAv?=
 =?utf-8?B?VDJ4UXZUT1dqbzYxL2FrVmNUY1ZweEVTWEs1Qk9KTW94MURuaDhiMnVtZllB?=
 =?utf-8?B?YXNkNzlpZGJrZUJQQWpBUmZxZlJReTl2SGFKbjkxUUtYWjJBK2xWSkh6cFV4?=
 =?utf-8?B?WVFVaWUxMWliYldicEIyRG1EeWVILytQTGdzZVB3OXFGZmJsUUJjMDNSTDlr?=
 =?utf-8?B?OHFDTlRnM0UvbkZjeXRmSjhkY052VkpCaWJ5NWtVeFFiSFUzbFlWb0FvdXNp?=
 =?utf-8?B?aTV2Y1RhVitjbVNlZkhlZXBlV3d2dnh3VHlqbkdyK1hxSTF1bnRyejk5M3do?=
 =?utf-8?B?UUhaVlZId0NTYmV2b245WlVPZ3lsbGExa0Z0QUZEQStQb1ZnMDNaSUxmYllN?=
 =?utf-8?B?YkRBeW0vMzVCTkRQcXo5VEh5TmlHV2UxR3k2TTdRNW14NDNWT1FRZXFkR2da?=
 =?utf-8?B?eVo2RFd5eWNOOTFrMEdPaG5DNHQzRStqTEE2a1dKWUpHTE5QZFVTZlBYQlNK?=
 =?utf-8?B?dWtHTTN5NWY5UGptZjNRL2E5K0hDVGZnN3dSMUFqVTJ6bDVKbjJ0TVFmN2xk?=
 =?utf-8?B?bWxqd3VZeXRRUFEwTkgwbkZ4WE5Oejg0aW9QbWl5UG11a2crdFB1UEFta01q?=
 =?utf-8?B?dmpGOHZFMmhGL2pWc1VQNG0vUjVLVG5YMG9ZM2tXWVUrWDVkWTFwaUtEbTZu?=
 =?utf-8?B?dTlRVGRCVHJBOSt6R2JybEVJNmw4R3g3UFU1Y0NRU2w3Q29KUkN0NERYbDY0?=
 =?utf-8?B?Y0drSUpvakJZdWtDSEVQeDlOVFlrTVYvbCt5MEE0elJrTER2WlhKTS9HQ0Z4?=
 =?utf-8?B?SGcvSlNXVTRtYlpKcjhFWFVWM09iei95Nm9vdnRQbHlEdkxqaWVtVFhnSFRQ?=
 =?utf-8?B?UTVkN2sxTHB5RGE5MDUxcDFzdExOeXRaejhsMjJRK3Vac2NldE1OTWI4bkx2?=
 =?utf-8?B?YWJzbEJvdFZ0VE9VSVVwckZxUjNxNGNEOTJXRFE1THYxcndPTTAwRVhVSjZM?=
 =?utf-8?B?biswOTJZdVVYT3ErWmFqaWVnZ3BOMzZRNU5PQVh3YkIrWXNHcXE2QWJqNFV1?=
 =?utf-8?Q?2G8oz1NdkkYbHEk1hhYbN9VuX?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273a4c4b-ad28-41a4-f7e2-08dcd0ad8b33
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 08:58:16.5567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yEyJHkh1qXN79xS8T/9wiFXNA2wuaJvO3kSLWv5C7uXQlM3TQljNQhtUQFXQQZHwvxcRNWjkIw5F5zsW4XDsdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7256

Hi Andi,

> I'm not a big fan of this change. There is not much gain in
> polluting git bisect in order to shorten pdev->dev to a single
> dev.
>
> However, I like the /dev_err/dev_err_probe/.
>
> I will take the first two patches from this series, but I will
> leave this if anyone else has a stronger opinion. If you want,
> you can send just this one patch with just the dev_err_probe()
> change.
Thanks for taking the time to review my patch!
Please take the first two patches, I don't plan to submit another
patch that only modifies dev_err().

Best Regards,
Qianfeng

