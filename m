Return-Path: <linux-i2c+bounces-6121-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F18D896B5B1
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 11:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 738111F21F0C
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 09:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74771CC165;
	Wed,  4 Sep 2024 09:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="pgf8g90F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11023138.outbound.protection.outlook.com [52.101.67.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD24818A6CF;
	Wed,  4 Sep 2024 08:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440403; cv=fail; b=bB/yRwIPWmjfEzivq0ys4jhiXL7G6RbLR50SSqjwady6i7te+OgQPtfh5bsXUK/De+vcbigxJ3JyetlASSt08xtn6lTLPUuu5SAxSLyS2cuvLlBSpSRiK0eN4N8nColP2yZezdVcm/7h3946ixUwSqMwBuBoeApdHq7BlNzL8sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440403; c=relaxed/simple;
	bh=VVrwJtx6pAYzr2ALvDdh6g8W3ymOG2k1qfFJUCvJMEk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DzZ7+PbnAkDKR79nrVFPf20PaflgYQeGznhNOZfHN3RtrN1ryIrlMtz1UBQQjhQDOshLJUNS2gWxyewvvoJ5RZ0ttvrciocgTEmIwN6bZNI130prYgz/5a/hH2bMQkLHFsaRvdv5KDLEx0jBFtOZxP8esfYxUTvZZsWyMHHmmzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=pgf8g90F; arc=fail smtp.client-ip=52.101.67.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYxYUK3ROkSF51MdGnFOAHkGK0hluR/wqFHVHq1elUp6v7FuTGf12BMNeMkuVJXIkOVG4LmYvxX/mH37QdJ+nErn786xCkVyjP9B9mPDjqoXhL32DR5IV8eAvsWxOftyNvWTv4pWgBn7klPu/d51ezdAEqKCdRIZ3XnKRsDBAocr5GayDax9xI/k3nmp7cHmDzStlWs+qEi+ODSUXK5+rVX1whLHy12TfIcZxH4CV1xrfd+Gv5TtjAJauuZ0wsQLZalsfa5FivjibY+zHuUW3k36BHMxA50Rl/Xtf+jElAdf3lFKqsGhcfYCqn2jrfQvmjEi+xlKFQyjISbcvTn2eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wr8HMo97RfTfwd3EnVkN4RO1/qCpnHhrVCirCSv317M=;
 b=s8lww4nSwX6g9fhH3Ah4XM5loC8QiNs1V0OtSJt+lpeQVrLpXlYLqVgigL7Gh3Qd1Y/EJWshLE/yMOnpKyx2TyF4FpDBmGFX1CIuvJBXkutG/N1CuAXTKwEzrtJQMvOsP+qX/RgVJ8DsZDEo39dAbkRWpGqTLKdTqBnlLrrc50CkNxdU0myufWC7k6AcATW8Y3NTkWxMpuLuF7o/e9IY0fhtlqmIoWLrDq79mP1uTCj3IR4L6JBjBI5EKl7/A8qzuvF26yhBx5yegtPrC0bRZEyZlgqpvKdB2c+/PvMAl8qLdmbe8QQpTzm6tRbplWRFuB//voQytnj2s1GPKPXrBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wr8HMo97RfTfwd3EnVkN4RO1/qCpnHhrVCirCSv317M=;
 b=pgf8g90FGmZMlLEU+tvCQilq+qgZADATjINQ+Cd22HO3ka10Y5GRn0BKnCBfyWdHdBK3CWMMSTVj73UJiCjnAqv7NuVxDcjETOExgTAwt8EizjF0SU2T7JkH4ItoZ2zMn73Mqx42PT8zMAJp3rlyJm49JaXETMI8iJN6ZTqNScA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by AS2PR02MB9141.eurprd02.prod.outlook.com (2603:10a6:20b:5f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Wed, 4 Sep
 2024 08:59:55 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%3]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 08:59:49 +0000
Message-ID: <4e4d7c65-3c3f-5208-ce08-b63ad39ab425@axentia.se>
Date: Wed, 4 Sep 2024 10:59:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v7 2/8] i2c: muxes: add support for tsd,mule-i2c
 multiplexer
Content-Language: sv-SE
To: Farouk Bouabid <farouk.bouabid@cherry.de>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Quentin Schulz
 <quentin.schulz@cherry.de>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Heiko Stuebner <heiko@sntech.de>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de>
 <20240902-dev-mule-i2c-mux-v7-2-bf7b8f5385ed@cherry.de>
 <fvk5u2j7wu7pjrlpbbnggp3vhopotctu2vr3fh77kl2icrvnyt@tukh2ytkiwdz>
 <45c51083-ee63-45e7-b8d4-3822213530f4@cherry.de>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <45c51083-ee63-45e7-b8d4-3822213530f4@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR06CA0105.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::46) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|AS2PR02MB9141:EE_
X-MS-Office365-Filtering-Correlation-Id: 67806190-7ab4-477e-53c0-08dcccbfee87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TU5xU0RVYnhBUXZaUkgrMlhPaExyNDAraHprMHlySHA3RVFzR1JWOE81bDR4?=
 =?utf-8?B?d3Y4TmdwYS9WUGo1Q212UnJQL3YvSFBoYWV2ZXlPbmVFVlM1cWN0QU05MDhZ?=
 =?utf-8?B?bExEcTJPM3ZvVHhEWGYrYkNhYnZWdFp3WkM0c05VQ2Q3aWhHUmRCcVJoNy9Q?=
 =?utf-8?B?UzFtZmlFbTZjTUlwZ0Y5TjBGOW1SSHhWb0NmcnZzZWZrM3FsNWNIWmppNjJC?=
 =?utf-8?B?YVpBZlNiS1duZExTUUZvek95SFRPa0tZZmJjZ3ZtekhZMThvTjZKSndWM2c3?=
 =?utf-8?B?aklmT1ovWHF1YmZUYzJuWnpMRkJ3emdqM1Vud21CK1BQbFJRcE40VmZtY2tH?=
 =?utf-8?B?T0xUSlJvbm9rbndHdEdQV283MUVlVWxyTlFzZ2xsaU5ROHVIamdKY0hZTjZh?=
 =?utf-8?B?QzVaclBjZjlRZVlUQ290WU9PaVQ0VXFZdWpMODh4bXN1ZkNlb3hmQmNuUnQ2?=
 =?utf-8?B?Q2l6Uzg1N3VDai9WdXdabCtycjNOa0dpdlJPWXVHOXU2TjhFTHRFU2RudFRB?=
 =?utf-8?B?UlYyL2g2bzZKaUMremloMGVwV0ttdkdYbkZYTzlXTDltWHIrZWdORzh2QkhO?=
 =?utf-8?B?dE1zRWxMSUI3aVFsb1JxRWREdlhtSnc4NDdnUFFoeGI2S0tOaGYvQ1UwZGly?=
 =?utf-8?B?VzZXakF5cnpxeTlqWnYrWTZqSHI0TVE1Z2ozWWRDcnc3ek9jblcyUUlOSzZO?=
 =?utf-8?B?cDRaR1g1cXNRM1FIUDlqaEcxWlYxWnZDaEFlcDllSy9GSU5WT2lPcThRcU9m?=
 =?utf-8?B?RllOcXg2REhFTmlzdXdyQW45eFZhWnkvaVY1ZEVWUGJCcFlQOFdlVDU4OU1s?=
 =?utf-8?B?OFRLNjNMd3lkUGs2QkJ0NVZ5WFpsV0Y5dXFDK2w4NGx5TjNDREFRMXFyeWxo?=
 =?utf-8?B?K2VWV2tDNkhyQ05WZkQzMWZvck9iR2lGMGx6WXM2ZUtZQ0UwQnlEK0hKRUll?=
 =?utf-8?B?VHdnNnRpSUIxZ2NzWnVudkZpOEI0L1VWK1VmWUVYUXMwOGtsblZCNm5ZYSs4?=
 =?utf-8?B?OXpuaUJLUzI3VWtIbTRVNnh6eGN0VUxXNWVpc0V6OVpJYnk0T2lhMzBtKzRl?=
 =?utf-8?B?K3gwNFRFWFhqekl2Tk9HQXoxWVhWckFoOHlQeldIWWZPVWFVMUVyTGE2dkJm?=
 =?utf-8?B?ZmZGR3pnVTFmQzdoNzRNbVhmZTVFeVJ2TjNidVhjYkZYTkFqeENXVnd1bHpn?=
 =?utf-8?B?Q1ViQUNZaWdTcUtuQVVXS214VU85N1A0U01UeFJnamZPamFZbzJja1pDWTMx?=
 =?utf-8?B?bDI5bklmZWhWWmxXUVNCSjJaU3pGVDhIbzByYmhvTERsbEtJOURmeEt2M1Nt?=
 =?utf-8?B?eUl0QVlmanFEY2NHVlZBWW1odmRLdWRMUmhNV1Q5ZUFaVFRzL3RsSks5cVBp?=
 =?utf-8?B?bi9WRERsNzhHOWN5bVB1RHphdHVKenN3S1p5U0JKK25rTTNxbDRKU2l0QnY5?=
 =?utf-8?B?T2d5aTZhdXB2MUs3ZDl2TElNTFFMV0dxdXdwbHlqUVBxUzdoTCtsM2JXcEZK?=
 =?utf-8?B?bnFtaE0rQ3lQMlRIeUxaTGZGSjB4L3d1REExVG9qRUpwOGFRNU5zWlhEa0RI?=
 =?utf-8?B?Q0F1SFAzdHR6dFhCYmtTSWJGNjJIWkVrZks1RkdLeUthNjFybHV5M3FHc1Bl?=
 =?utf-8?B?MlhrWk5CUXZOOGJsdVZ0RnRMQ2MwbHI0a1g1aHdjcGJsVzlFaUErYVZVenEy?=
 =?utf-8?B?UFBxYnNUa0NDYXVNbnNKYnRCNzVsMTcwVmpBcWNxaHdmRW1YZUYvR0N2ZVdP?=
 =?utf-8?B?QWd3bEJvbXlmQy9lOXh4NithS1l6TFVkQjJvdXhtMnJSVitjK3J0VnBuWDJW?=
 =?utf-8?B?K1ZmcE1rajc3SVo5QUtyQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qnp2QzdERWRWMWdsaEM3cW52a3h2K1BGcFZoY1NKbGFxdmZaeFFrSU5QbzRl?=
 =?utf-8?B?bUF6RHRLZzh2aDcrcDlaZzRYbndDYkpkajlTamVOYTQ2a3l4QlloaEhLUVZW?=
 =?utf-8?B?b2ZadW84K2hWTjByY3J2TVIzMzg4VkhmbDEwOTBJZXpmd09UeG9JQWlpZjll?=
 =?utf-8?B?bTNyY3BOMGM2Ui9kYWtMVGlLWmlvM1A4VEhjTTh4S3VRK0dJUzVjeFRsNGhC?=
 =?utf-8?B?Ylg3Zm9xR2ZFNVoxdmR1eWhzK09wbGpjTFI4L1k2NmttSnp6V01hRThuUC8v?=
 =?utf-8?B?ZDZ4dEMza1Q1dnZyQUVwWlFOZElNd1JOVFdVRWs2WFNOUzV2RE1QVWZoTnlz?=
 =?utf-8?B?YzJmSVVtdmN0K0lzNnlCQ2JEWUtpWWd6WkRrYldjMTJXQUE5T2pYNUp2KzNY?=
 =?utf-8?B?N1VScnMydHBCSXZpT0JlL2UxT0FhM0creFFBcUhpRW1HNWpwRFoyM3M2RVJM?=
 =?utf-8?B?bjRCbWV1TTQ4d05TbHYzQmlDU2VKL09EZEZ6Yk9iZ3dBS2xhdzNncG94QWZu?=
 =?utf-8?B?QXRkNTFnMEhZZjZ3c3hOcUY3LzJxQm5MTWpCcWdrNDk3UXFGVFNrdktNZ3NC?=
 =?utf-8?B?TWJCb3ZOS3NsRVpYdld6a1ZpZmgycUMxTWczYVBuYXhjMG5OSTh4NFFhMy9O?=
 =?utf-8?B?clB4VnZ6aXdkNGlHTDBsYTZaSXk4ZnkwYm1RQmZ2MHNCOGVlbC9RY2p4Zm9i?=
 =?utf-8?B?eDZwWWVnRFNzWDFmSmF6SWVqNjVxZXBQTFVBeEZtKzUwaDBiSmtqazFiaEU0?=
 =?utf-8?B?ZUtvRFRWbE1mMktnVzY0cFZVOENzQUVuOUVDdm5EODdyMjVmQVJkVCtsU1hq?=
 =?utf-8?B?SkpuZzZKSkh3RjlQUzZFaFlmeFBoN2QwNjFYYlFaaktkN3F4MmhmbWFpUnM0?=
 =?utf-8?B?RzU2SXlxb25KUE04elFQUit4QXhublJyUzBORWVvbTFzUGdBMHJ3bXR5QStT?=
 =?utf-8?B?ZkxpYXJ1TGpjak43RXVnYUVFTExEOWlGb0RqR3JBWjNuUWxRYmM3ci9tblZs?=
 =?utf-8?B?TWQxK1Q5UG5hNndRMmNxbWZzcnhPTHFhbGt6V2JnQTVOanZkQmNuUVA0N3dp?=
 =?utf-8?B?YUppVGxielpYL3NMSUF2S1l3bk1KUXpEQUY4NnE3ME1PcEVwbHJkL0VZdEdV?=
 =?utf-8?B?aHZobU9NQTdud2hBYkFtUjdwZE1XTlVERmFSOS9Xc0hvdGNhR2RaU2l2b2ZO?=
 =?utf-8?B?aERENEt5aUs0VVBvcHFva3d2dmtPQlJreGIvMmE4dDRnTWZtK2FzeDdqQnZ6?=
 =?utf-8?B?MlRwQWluck92V2Z4RnVMeXEvdVcrNUczOGdJeTVxaFM1Y1BZMGRTVFA2ODlW?=
 =?utf-8?B?UUsxQzNQL0NoakdXdTd4L2xkTmhjbml0YS9nczhnY21RL2lWSVVlNzFNWUFK?=
 =?utf-8?B?UXZHeC80TWJ4ZTRoTGJQVzExZTgwY1VhL011bTRtOFpaMmducTExVURxVHRK?=
 =?utf-8?B?RnVDdm9QRnFPZUsweE9MOVhMM0V4UjNFSnJVakVXUDZDTlVJaFVLQTVKVk1C?=
 =?utf-8?B?NnNZVGdtdlBXSm5XajlWb1cxbTNMOCtVZXJqK2dsZFIxUkNwQWNnVjJqY29O?=
 =?utf-8?B?ZXZocnlXM2hlVTBuYVN4UExkaVVZdS84YjhwNGhQcDRLem52bkFPL2RVODBv?=
 =?utf-8?B?WS9YNmhCTXh3bFFnWTJBMUNsVzVQNGpWSmxHMng2aTNpME1JbThGSGFERjVW?=
 =?utf-8?B?UVZiQ0pxbUlGUU9RS0t5Z1MyaFRsNVd0OGVlcGJsWUZZRzJkSGN6d28yOEk0?=
 =?utf-8?B?Y1hTL0ZRZ3AyRUwyb0dFRmhmR1NkWjdwcDNVK0MwT3hmY01sVVJRaEZ4RmR0?=
 =?utf-8?B?QWNnMkJMVXZZTnF0NkFIaTVPWDFtbVFwalJ1OTRBT3MvQndGcGtocjh1aFJB?=
 =?utf-8?B?MGdUelg1Z1BEeUtyVml4dTU0NUozRlBWdjhMdXg5Nllrbkx3S0p6QXgvODhI?=
 =?utf-8?B?M2hJR0tRRnNVNTNVNzl3L0lsOFFFaU4xdjY4dEVRdXp4YmQ4Q0UwOHpsTXZ4?=
 =?utf-8?B?N3JGUE1xanNyVFVxTGJWbzBlOWU0ZUtWcmppTlBJZmUrY0VvM2JjYXluSU5E?=
 =?utf-8?B?aG5KbUhzU1Z4UEQ0NTZheUhITHNVNUIzWlVMQnhRNUsyU1JRbnNBNkVqL1dB?=
 =?utf-8?Q?c50LV/alseuFTLePGZnjKqoI5?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 67806190-7ab4-477e-53c0-08dcccbfee87
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 08:59:49.3782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCnvvIqo8y3I6/VIj4ljBWyaJaF8LEuBIS1GmN7/88q4tTu1zpXUBR6y79apQLHn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9141

Hi!

2024-09-04 at 10:35, Farouk Bouabid wrote:
> Hi Andi,
> 
> On 03.09.24 17:13, Andi Shyti wrote:
> 
> [...]
> 
>>> +        ret = i2c_mux_add_adapter(muxc, 0, reg);
>>> +        if (ret)
>>> +            return ret;
>> do we need to delete the adapters we added in previous cycles?
>>
> 
> We calldevm_action_or_reset() before the loop to add adapter-removal to the error path. I think that does the job
> 
> for us or am I missing something ?

I missed that too, but it LGTM. It's safe to call i2c_mux_del_adapters() as
soon the mux core has been allocated, so there is no risk it is called too
early or something. With that said, I agree with Andi on the naming and the
nitpicks.

Cheers,
Peter

