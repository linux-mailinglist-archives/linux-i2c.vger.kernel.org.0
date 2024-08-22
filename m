Return-Path: <linux-i2c+bounces-5666-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C647C95B573
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 14:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7959C283AA1
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 12:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0621C9DC5;
	Thu, 22 Aug 2024 12:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="mecWUypi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010048.outbound.protection.outlook.com [52.101.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAA51DFF0;
	Thu, 22 Aug 2024 12:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724331202; cv=fail; b=ldXv405LoIprX7ELFn73KXan7sCEdbR3ZGTIhbyz5S4KXVqWXyXafiFXM19NxSlbdJA8XY6gpxbCGPqG9ZkADnw2poEm7eWIIqlqVHflev9Sb1XGPXWzAkacvyuyjthDN2jaDgcEE8Nde7f1wKgLWDR7tXJYNY4HKi+32B/wlrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724331202; c=relaxed/simple;
	bh=JPivDg9fCluyO0QQgfpuK0geO7OEevtHJrTYQ7Omonw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cakMxn8RjiG+NJiI2hAakmgM1mBVCnKxLPwuEWzE4unWYVPTWhB2qxunQIlThWFgQkYST8H1R8o+slJO51w6LBsb5eieP6g1LVvHXl1zZkDwQ3QgZECjYJZt4rMo8Pj3DtxV1vkyePLNtSsC2HpCLw3dEypgRoOVvacWmfWm+PM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=mecWUypi; arc=fail smtp.client-ip=52.101.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKR/jiN8i8DUSzP+MGoJ9W7eCC6I9Ds+UehF5H82tHxnehPgSZD6YYF3st93vwAlnnwaafPmSkCp02Gu+cd/5XlO3L1BCArKL21e4OgTLslXSIlSi6kHznOJqERzqcQB9QkHbEHj1k40DMaiOprp7CJNQVaz9D9DzgNSKB6IyOVSuTvPXij7Bfxz7x6xnY48AiZww/8MfBSd1g95rGP18+ulORHR7EUTcUiylRZNG/ko5YLOKSFp2hQI6l4QQTqGQXAQSuAqT+hJG/3yrjaEQm+eakqblkZFMY8TqP3iO/T2hVAi1jVgRk1yzYFt8sFTGJSVg2cRs4QkbTH3/3CG5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DB5oe2l++/3oD9DbcS/6biI9sRpJdgqvitncvxU03mA=;
 b=JKewik44/dtL3JrZLWYR8fFN6CcAcQppoQySYYr7IYI/Z3vASCkgVIHTh137KuvzsTHeJPysTuceqVle/CNy1F61ddADUtK2rWar5pFeT8T1dPoLoaPnlJeJfZOzPYasLzCs53+Oxkb8cTH07H5b9ULvilS0+6p5uFuM3DoWm+2VNR8hqTjGuimwGOFUU3CU5fp64OBzZ5z8rZ46qjmnBHeyqDNq9u5CRUEIYXl0vHhCHUiBaem6onTxjHM3c0yjM1vPH0TP/lZklY2Ar1ZFdAGW7p7c2/8c1RAGroG74/kpNb/Q91WXS33uI/t34ffccRhOKSit/WSowXZhkYPxNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DB5oe2l++/3oD9DbcS/6biI9sRpJdgqvitncvxU03mA=;
 b=mecWUypiG57O+kLZ6vvKq6QXJvTWa9fksYHWKGxbibHbjffedqrFIIWnOPzTzhJhZRwaSXz7KWmtK0ifdt52gR+qgyVoiqpgKKGaLBxdKIwrzDY0okzq0VNvShLrPEaxE3R4Vz3GqgSAAsjaMxumtN0S4H+1q7eUJLgOycD1C4gF40RWrXHLID//3m5eCLB/tMWVK4PfW/f5N0crU/LqtwMVOyydPthZu8IZbay99EKZ/epaFr0sxMAX2tiMoKNB4ntf84K/grY+cdArrjyW7Hzkomp6cES/MuU9rbG65Htp4tCQxEy6kmXUsxfUM34FgvlOUi2nqZN//qLwDLLDLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB6426.apcprd06.prod.outlook.com (2603:1096:820:f7::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.25; Thu, 22 Aug 2024 12:53:15 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 12:53:15 +0000
Message-ID: <c22acb6e-893d-481f-adc3-5c2b3b47dca5@vivo.com>
Date: Thu, 22 Aug 2024 20:53:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: emev2: Use devm_clk_get_enabled() helpers
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>,
 Rong Qianfeng <rongqianfeng@vivo.com>
References: <20240822025258.53263-1-rongqianfeng@vivo.com>
 <20240822025258.53263-2-rongqianfeng@vivo.com>
 <TY3PR01MB113466D1AB122E210A12E3DFA868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Rong Qianfeng <11065417@vivo.com>
In-Reply-To: <TY3PR01MB113466D1AB122E210A12E3DFA868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYBP286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::19) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: 968ee339-069a-44d0-e62e-08dcc2a9630e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|81742002;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UENHY29HSjIrdzM2dGkxaG1DekM3Q0tBNStMMzRXN0xTVnM0dFJSdGtRYzNO?=
 =?utf-8?B?WHhKckdLOFpJV2t5cVgyWVFwdjEzSEpGckFnV3VvTG9SQVJEZk1tV01qRS82?=
 =?utf-8?B?RVdaWUdkeWd5UzNXYXU2M0lDcDhJZkc2WWpDeHk5WlFKakZvaWU5MkJsK0ZB?=
 =?utf-8?B?OTBxcm56T0NlMFFHUFBYWHZvd2x1aUgrSGpEV3k5aitJeDdDUHk0MVhLTUJ1?=
 =?utf-8?B?cmxxVHFQbUJpUHNtdGhoTUR4R0QwWUFwL3VPSm5qRElIVkE3OUJqam9IUlhH?=
 =?utf-8?B?QmxIU0g0OW5jS1pYa1IxOFZmOHdob1NnQ2hreXZvSEtiOThST0h1NXYxZ0dC?=
 =?utf-8?B?UDVHdzBRZG40V0laTmxXc3BOOUJibHNKQWxmM3d5Ujczb2RyWUNtTkx2S2h2?=
 =?utf-8?B?ZWV4ZUh5UGJIaVlGbnByb1U4Z2gvM2YrRDBwSy9Pbk5qbEVLcFJ5MktxeGJD?=
 =?utf-8?B?a2UwSTJyai96UU9LWWg3RzIzSVdhTXZ2MDdBZUQwd2ZmajRZK3E5OTgzVlA3?=
 =?utf-8?B?TEo5L2lDMEJzNUtoUEM5cnFZdzdJMzNIVCtNTERsaG9VTElKZGVOVEZ4Smht?=
 =?utf-8?B?Tk4xbWI1d1pOdTEydWJiTWRHK0pPU1dZYXhTWXQyUEd1SG5Ldk9ZeU5OVFYx?=
 =?utf-8?B?eEgvalZ3K2R4eWxWWVhZOWZLNUpQTlNDM2NVWHhTaVd3WEdFTWJoSjBXL3lX?=
 =?utf-8?B?RXpqK2RuZ2UxSTcyKzg0N09IYVBhTG5DNkI1U3RBZVlWQTdKTkE3VkdJYUV5?=
 =?utf-8?B?UGhFOWJWT1RKTTNKeFdtSTRWaUxzN1JRU0NFUVJXZWtTaFU0YmxYbnBoZEdo?=
 =?utf-8?B?UzlWSkdFNmJidXVwd3JFSWxYTnhEdGRZTGFESW0xMFV6b0k3TnIzQmZxMERR?=
 =?utf-8?B?OFJHbUprY05lTklKK1IyZHQ0bGFjYU02cjFhQ0JIUE90aG42MWd3N1hKNFgx?=
 =?utf-8?B?ZUNZbkR0Y2xOMWNTZGpLUm1BNSszRXFMQnhUbmVoZ2VxQnA4cDVuVUR2ampT?=
 =?utf-8?B?ekpYWnU0ZjY2UktDSkVURTdwZElDTm92eGdXSks0WlBZSWx6eDBsVjRUOFFX?=
 =?utf-8?B?WEhoelE3N1VPamNIMTlCeDBkMXRrblVaSThmYTdabFgwTFl6R0FGYWxsNnVY?=
 =?utf-8?B?YmJHNm42R3BubHJnUDM4YmNYUTlNUDRkSmxsY2JwZTJKRE1KOGdKcXdkNW54?=
 =?utf-8?B?MlZxTmRLc3kwY1VqMWVEUUlueC9WNDN5YlpLaUtIVk0wOTlKd0xDZEUrMDIw?=
 =?utf-8?B?SnZVK1RaSDl4QjM5S3dGbGNENWpETHZWQ1BGZ21lSmJFWVRYTDY0bzBKdFpN?=
 =?utf-8?B?SmxGTXl1MEhSTGJGcWNnRGZoYnZCRmhVemdIQTBiS1lMUDBlTGRENHoxU1Nw?=
 =?utf-8?B?TDl2cDc5VlRlNk1Nb0FMQW42b0JjZXFrdm0vTFB2ZGMyUDlLYTVnWmpxcGN1?=
 =?utf-8?B?Q1ZpcGxwb0kybGpsbkVFRVNibFBNalJVTWNsSjIvcDVudXArWER5OUtudno0?=
 =?utf-8?B?VEJ2RSt4eStlY0k2K2JqNzhGUnViK0t6eWY0dC9kMndWZE1xczNIYWRuNVdj?=
 =?utf-8?B?RnZGZzRFMmZCaFlqYTZHU3YxK2RjMkJjVG02MkFRTEt2WFdzOU1iOWlDaXND?=
 =?utf-8?B?c2VxSkZTSzJJK3VLTWVQVW9jRUsxajdQQ1FicS8rZk52NDg3S0daU1V3S1RU?=
 =?utf-8?B?TFBjcnZSQWsxajlRbmY4T3F1WGxFeFhiZFRsZFNOaDhqV3dMM3VWbkJIZzFr?=
 =?utf-8?B?T25xUzdFdUdGNEh4S1NTaktCb1hnRjBHZmN5WmdvelNVOE5wWkpZQjAvWDZk?=
 =?utf-8?B?ai80SGhQYm4wUjFkTGlFTUtZeHgzMURPWUtweUhrQ2pHK0FaRlVNbXEzeWYz?=
 =?utf-8?B?NjlGa3lXenYwSHpMTytLdWZLbWx0OVBtaVZDbmxSMzRiaHF2R24rVzY1emZQ?=
 =?utf-8?Q?dllGxIha7XY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(81742002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTZUbDkrUGl0dWFNNVQvNTY0ZVh2Vm1uNWRxdGM4YXdXalVVM3I0a3NaamFr?=
 =?utf-8?B?bW1hMUJrOXROenRQZW8waTlkLzM5WHAxbGh1cGhTS3gvRW00SWordUJkQk0y?=
 =?utf-8?B?U1pHK29oR2V5WXdjMTkxVjZoVTlmbGh5MTZvMngzRWthK3BtTVRMelFZQTVt?=
 =?utf-8?B?OXN6MndHT3lxSytzN085RThQUGlJRkxLYUdjd3pzcUpneFRFMUx6OTIreHQv?=
 =?utf-8?B?ZjlabGRGK3ZlUkJwMGdwRHE1KzlEdzNjMVBwMDRaR2dEWnY3bzVUdEJFMFdz?=
 =?utf-8?B?S0Y1VkJ3VUkvVngzQVhVd1Z6ZWlLS3lMc2pBQzdKSmpuYU9CdDEvTkZkUHZG?=
 =?utf-8?B?N01vV0wrV1JOTnZSUFE3c1BGL2lxcEZaeitsRjdjV0wxaUJic0F3N2hHLzkw?=
 =?utf-8?B?OGk3WGlzUm5xVGU2SXMxajNIUDBuU1NDdWhpM1Vya3ZCZG5JM3A5dy9Iblcx?=
 =?utf-8?B?ZERTTCswdXJUekRlaGFrYldKOUVvckx3bUd5eVJHSUxySVRqUFhMNGU3S0E4?=
 =?utf-8?B?S0pTR2xNWXdvMUJYcDh6TXozQWpZVzlkYWxYSVROODlpaEtYOVpKejB5WkhM?=
 =?utf-8?B?TWRvejhWUEtTeXVFRGljclVFSTlqNWJYWjlrSlRMbHhIekI3cjNIZC9OVFph?=
 =?utf-8?B?UFovbHJmb3pOby96clJJdzR0TFVySlVQNDFUVWpwZ2NlMVA1UXl5ZEhBdGdX?=
 =?utf-8?B?RnFIcU40Qmp3cnIvUVBmN0Q3b3hsWjV1UENFd2JSa3luNW9HRHRod1RDaGNB?=
 =?utf-8?B?L3M5bHNhaHdPQjV5dktPV1RqbzQvWG1UNjZLQ2Q2VmZ0d00wYzJWOFZjMXov?=
 =?utf-8?B?bU9yNURMa1EwQUdWamEwaHdQNUY2ZkxFZG5xZzdmT3VGTG9wQ1RONS9TWlM3?=
 =?utf-8?B?eExEbGlZQ2JOdzZIWXpjSVdzLzlrTHZyY3NicnNzVzN0VUluMlJSYjBxNC9w?=
 =?utf-8?B?SktnOWIrTnJNZTcwMjRlVjU4R01hQkVhYmt6emFRaU9PQkJYWVBkRkc2NmRI?=
 =?utf-8?B?bU0yTCtodytrLzJqajlueFhuM1lXTWkrRWpzam1XR2Z4dXNVc2lYaGRGYkR1?=
 =?utf-8?B?My9rWklCRjhxMnBMQ09sWTI5d291UDFUcVlYWHdCQXVuOGxGOVZpZVBweHJQ?=
 =?utf-8?B?c2c2TTI4TGdHQU9ZL3d3dk1wdTgyTHV2ZTl2Mmt6ZDhKdHAwRHBxYWowdjZs?=
 =?utf-8?B?VS9SdktJS2I4dk0zUlJoeEp0OVU0YVFRWTc2c0grZTkwdlI3Q0dZMTVjbzEr?=
 =?utf-8?B?WkZWUGJJRmFQU3g1YlJIek5nZ3FYZW1pV09HWnFkYm4vb3Yzdk9oaW9BOEo2?=
 =?utf-8?B?SmZUVnJaTGdUbDRFVmU4cWJpWmpGUXJzbkpXZ3VFQmp0d1g5ZGoraXBhU1o2?=
 =?utf-8?B?WEt4dy9ZckdwckU2SzRpT3VsS290WEt1ZG5QQkhzajR4dVIrRC9XUXFLQ2hL?=
 =?utf-8?B?OVNzdzhoTTFKb0xsUFAvK2tSTFdVNytidStxbGMxem5mUFpNSnZ1MlhUWGFD?=
 =?utf-8?B?dzlrTHRIZU91TzBIQUI2Z0JFcGdaeDJNQmE4SnZ2U0JudVp1UStLdTZxRFFn?=
 =?utf-8?B?Q3BEaC9RbGVLYzl1RFVtMUxieENXTHBiYkIzUWdrNFFrT3R5Nm42d0hiYVVv?=
 =?utf-8?B?MkpkeHUwemRYSGprOE03VGhNS3VDeC90SVg4Q1lJT21DSDhUTDNTNTRab0ND?=
 =?utf-8?B?bitCQU84NEVXbFBSakNDMklqMDBUM3pyS1d5aHhrZ1A5UHR6dFBvTzYrL3NU?=
 =?utf-8?B?VnUvY0FMaVIyRzhhL1YwS0NubHVGY0RyTDdYUnlLTFpmOTVSRkwvVnZKTFhn?=
 =?utf-8?B?Z2dERUFJbnloUnFrbTFqa0grbHZ2S2krR041Q3owM0RHM0QrcEJGVFFnVktl?=
 =?utf-8?B?eTR3czg5WmJwY2dJK1A3TEIyN0V4dFNpRVhpWEpiY1NRZEkxS09ESGFObnM0?=
 =?utf-8?B?Z295TnJrZUZBUDQ1SUZPaUZ0L3pwbWYxRXdRaUtlNTZ3b3FBYldCRThOb3I4?=
 =?utf-8?B?YlJaQVEyaEloN1p6Yk9YMkQwMWtXcXQ0NkdqUGp2TDZRNFpZc1lVOEZybURr?=
 =?utf-8?B?RjY2Nmdza2l6K1dZSVM2TFBWVXhYQkprL2dlQXNGdmFTWnBSUnpmRy9paS9o?=
 =?utf-8?Q?N4QZapfXC7nT/rDA6eiLOiRJI?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 968ee339-069a-44d0-e62e-08dcc2a9630e
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 12:53:14.9351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHwzEHTWJLpJsyHc2EMYO/afssYzTr21S9+8BijGMp8mZu2iRx8eX/3CBrQqAOIjg1MebQgwT18447lAys+dgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6426


在 2024/8/22 17:19, Biju Das 写道:
> [Some people who received this message don't often get email from biju.das.jz@bp.renesas.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hi Rong Qianfeng,
>
> Thanks for the patch.
>
>> -----Original Message-----
>> From: Rong Qianfeng <rongqianfeng@vivo.com>
>> Sent: Thursday, August 22, 2024 3:53 AM
>> Subject: [PATCH 1/2] i2c: emev2: Use devm_clk_get_enabled() helpers
>>
>> The devm_clk_get_enabled() helpers:    - call devm_clk_get()    - call clk_prepare_enable() and
>> register what is needed in order to     call clk_disable_unprepare() when needed, as a managed
>> resource.This simplifies the code and avoids the calls to clk_disable_unprepare().While at it, remove
>> the goto label "err_clk:", and use its return value to return the error code.
>>
>> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
>> ---
>>   drivers/i2c/busses/i2c-emev2.c | 17 ++++-------------
>>   1 file changed, 4 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-emev2.c b/drivers/i2c/busses/i2c-emev2.c index
>> 557409410445..20efe0b0cb85 100644
>> --- a/drivers/i2c/busses/i2c-emev2.c
>> +++ b/drivers/i2c/busses/i2c-emev2.c
>> @@ -373,14 +373,10 @@ static int em_i2c_probe(struct platform_device *pdev)
>>
>>        strscpy(priv->adap.name, "EMEV2 I2C", sizeof(priv->adap.name));
>>
>> -     priv->sclk = devm_clk_get(&pdev->dev, "sclk");
>> +     priv->sclk = devm_clk_get_enabled(&pdev->dev, "sclk");
> nit:
> After your change sclk can be local. You can drop sclk from struct em_i2c_device
> Maybe send another patch to fix this.
Thanks for taking the time to reply. I will try to do this in the next 
version.
>
> Cheers,
> Biju
>
>>        if (IS_ERR(priv->sclk))
>>                return PTR_ERR(priv->sclk);
>>
>> -     ret = clk_prepare_enable(priv->sclk);
>> -     if (ret)
>> -             return ret;
>> -
>>        priv->adap.timeout = msecs_to_jiffies(100);
>>        priv->adap.retries = 5;
>>        priv->adap.dev.parent = &pdev->dev;
>> @@ -397,26 +393,22 @@ static int em_i2c_probe(struct platform_device *pdev)
>>
>>        ret = platform_get_irq(pdev, 0);
>>        if (ret < 0)
>> -             goto err_clk;
>> +             return ret;
>>        priv->irq = ret;
>>        ret = devm_request_irq(&pdev->dev, priv->irq, em_i2c_irq_handler, 0,
>>                                "em_i2c", priv);
>>        if (ret)
>> -             goto err_clk;
>> +             return ret;
>>
>>        ret = i2c_add_adapter(&priv->adap);
>>
>>        if (ret)
>> -             goto err_clk;
>> +             return ret;
>>
>>        dev_info(&pdev->dev, "Added i2c controller %d, irq %d\n", priv->adap.nr,
>>                 priv->irq);
>>
>>        return 0;
>> -
>> -err_clk:
>> -     clk_disable_unprepare(priv->sclk);
>> -     return ret;
>>   }
>>
>>   static void em_i2c_remove(struct platform_device *dev) @@ -424,7 +416,6 @@ static void
>> em_i2c_remove(struct platform_device *dev)
>>        struct em_i2c_device *priv = platform_get_drvdata(dev);
>>
>>        i2c_del_adapter(&priv->adap);
>> -     clk_disable_unprepare(priv->sclk);
>>   }
>>
>>   static const struct of_device_id em_i2c_ids[] = {
>> --
>> 2.39.0
>>

