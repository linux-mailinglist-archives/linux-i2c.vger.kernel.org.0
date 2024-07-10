Return-Path: <linux-i2c+bounces-4848-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1201A92D7C3
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 19:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88F6D1F2195A
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 17:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470F7195383;
	Wed, 10 Jul 2024 17:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sch.bme.hu header.i=@sch.bme.hu header.b="P/RP36J8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020106.outbound.protection.outlook.com [52.101.69.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABB2194A42;
	Wed, 10 Jul 2024 17:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720633883; cv=fail; b=ZD+zSHRz8sMWdN50jLj51eYGlTkCgvS8FcePiRuN2/5Iz33H0hb/qrqBW7MNywb+66+0OE8Dww526cYMUDXhiL32T/sHC+loOMPXPDXTZn39UKDyf5e1iq+n22vAtbgh/Ie/QJ6l+xgu4vKJ3uOnWWlXaesEgn4gIG10nXIHcGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720633883; c=relaxed/simple;
	bh=6l5CG6Tc1JV7d92cP5dhnqDy4o13LPiISRXT9FbqZvI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e19D/9g5wrd0SMlms0zuOFhlbTWfpqp7NwOHTUblPfNRfxSt9YJ5tyGKWnJrGi6N+71GlyngubofhNAZsZlFeEW/kRnrKpzfLbXgU+tuSWh9CT9i4MWH+STSP3J9NCemhThgQuZbssO8PshC0lDTrWQ3JThObjBhaUtEP8EG21Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sch.bme.hu; spf=pass smtp.mailfrom=sch.bme.hu; dkim=pass (1024-bit key) header.d=sch.bme.hu header.i=@sch.bme.hu header.b=P/RP36J8; arc=fail smtp.client-ip=52.101.69.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sch.bme.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sch.bme.hu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQetZPJ6eERyxzqYRsdLxYT71zguARHcbbyZ31rqG3HURLbWVtUZX6i2GLKvmfyUY0l5vupqDFnH8UPRZDSN7sGJwiwv9W5Ik1otEGWY+l66DjPwW7+pQF9a7dwE1KzG2xKYbByORa9asJgMCAVRLWkFjyV4IE7RLWJ3v3RC7tablebLABHrVoLHHApbof/9+IrlSPN0bJnE7d33uEC2n5lIURAZEi1FEvC16uSVbQ5F0/BTEjN3GCn2PLLVi8C2sg+AnkPwwrXymslVBtcRSyhsYci9AZ4ebblImrV40hCCZL6Wxs6DE/7sIJAK9+ycjgOmWIwSYqpw8v7vVCzT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNo1/WyO3ughCjjl8wyCZSFIfoxAkoqodJ3HrwQgCl8=;
 b=CRlmLgC7hmcpuD7kog7HiVjAD6jbFXeFrLNwbzwzGF7bRgWQKtNTeFx+0NYxJ9CuGDPUKcFGDXKH4395hTwOJN1u9dW+0/wTizWMeRd/zPxNatgdUtbrrz+U4taZyVzyMmiSeq9oeSAH1/e6yR2mHbyNh+ybwkoJ6Ct1Rm8RWaXB4oQ+tX2wvkOJjq2zvIDro0l82ty5VlSS2wGtyHxOckY4I8XXONlpqJrvZ4ej1GrrXcV9+OWLm4T8EE9R3E/K/hHoxaa3pi5Y9hbKV1WfmtLyZwWekMM6lNXpyYtXJnhtOEzHEI7/Onaj9zfZmPfyhTOqgXqTplvEwOPGINbWSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sch.bme.hu; dmarc=pass action=none header.from=sch.bme.hu;
 dkim=pass header.d=sch.bme.hu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sch.bme.hu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNo1/WyO3ughCjjl8wyCZSFIfoxAkoqodJ3HrwQgCl8=;
 b=P/RP36J8/V7t1Ebv5mM+eNE5IpyoBeqV2/wwiXY2YWCJ8lmMzUIFRiHWlVYvz9m3tGGmG58jUaEThIDsiIm+sQGLuyfcsvKoQew+o5FUf2JhICaiVHyAUPx5cB53OUxAw16VTcjyjmKe8I1La8LvEHN1D8hLcnFoVJ6Ncmnoukw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sch.bme.hu;
Received: from AM6PR0402MB3416.eurprd04.prod.outlook.com (2603:10a6:209:6::21)
 by PAXPR04MB9471.eurprd04.prod.outlook.com (2603:10a6:102:2b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 17:51:14 +0000
Received: from AM6PR0402MB3416.eurprd04.prod.outlook.com
 ([fe80::4fe0:b908:2878:6d88]) by AM6PR0402MB3416.eurprd04.prod.outlook.com
 ([fe80::4fe0:b908:2878:6d88%2]) with mapi id 15.20.7762.016; Wed, 10 Jul 2024
 17:51:14 +0000
Message-ID: <facc6719-fbbe-4e30-8f4f-f90851e73715@sch.bme.hu>
Date: Wed, 10 Jul 2024 19:51:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re:
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>,
 Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org
References: <20240706112116.24543-10-wsa+renesas@sang-engineering.com>
 <20240710064219.6800-2-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>
In-Reply-To: <20240710064219.6800-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::7) To AM6PR0402MB3416.eurprd04.prod.outlook.com
 (2603:10a6:209:6::21)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3416:EE_|PAXPR04MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: 2be79990-4128-41ae-923e-08dca108e45d
X-LD-Processed: 79f0ae63-ef51-49f5-9f51-78a3346e1507,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|41320700013|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VklHc2hNemthMUVBSnIrOUtmU3ZsNjU1ZjA5NkNBdEhFSzZFRlJWQndqK3R2?=
 =?utf-8?B?S0U1RjlTTHVtUmRpcy84cGdJUWEva0U2cnR5dTRrVDlXSWQ0ZGZ3d0tsQlBk?=
 =?utf-8?B?clFSbEppWEVNWEZvTmdCSG1TNmRjajVkZmxDT2tTYS8wUEYxSDFGd0xZZjMy?=
 =?utf-8?B?RldKZXQwYmZTNjhjOTF6a3lIcmpQejJnUnN3RU1RQ2IxWEI3czlXS081eS9m?=
 =?utf-8?B?Y293VUpsbmY5bXNuVG9VdUx3S1hUNEZSQ09pS3dRc3VlWFc0TnhaSDVKd0hi?=
 =?utf-8?B?eWhudElheE1XM0JkVDZBOWE1N0czcHRQb2ZCNFNuQjN2dkZuV2tNRkNrRmpl?=
 =?utf-8?B?eGowOWk1aU5GbjVQTk9IV1U5VGRIOVNvVEJ5TVpiMXc0Ti9WN3dNTytCbGov?=
 =?utf-8?B?ZUpxTGdKdEZ0U2piSzFBMDlvNDY3Y1RXc21HazFtUFd0YTJuQ3BUV2MzTXhp?=
 =?utf-8?B?MlB0b3k2cUxSOXNaK1hHUC95dlpyUVZyTHBJc3BDbEdDdzRmNzBvWlhoR0tq?=
 =?utf-8?B?SlR6V1M4R0lEcDdGZzZGczVJZHVsd3RGS25TR0JobmtpaE01dTNhS1pPTDR3?=
 =?utf-8?B?a3hIQ1BTVFFZVlVrZFhOeFlrQ2F2RU5GeUM4Wk9WTFlNUVpDOEpvU2dpKzBi?=
 =?utf-8?B?R2J6WkJiL1ZrVkZpcFFlMTdVRWRpWmlsS3YzWDV2aGhwWm1rcjk5OEYwdWdp?=
 =?utf-8?B?cEhtdnlzTEJibWVNQUJtdTNMZHFSRU9YS2ZaNFJTTDZLNGVLcHFzQ25LV1B1?=
 =?utf-8?B?dStIbER0WTJxUnFpQVo4Nk5DelhCbFh6aGJNRGt6b3hiVEJabGJtbFBvSjds?=
 =?utf-8?B?cVRhM1pacDRudnlrT1dzQm9XV1pQekVNUitMcEFvWnRDSWxrdlZwTll3VU11?=
 =?utf-8?B?cW9nbFU1dm54MWIwVUxzUGFWMURaQ2ZQays2U0lKWmY0NkluSVk4OUloYVMy?=
 =?utf-8?B?WmRKTVdNc1VWU1hSalcwSndDTHFmUnFLMmpnRFR0YytTaHpVd1lGaXl3NVNU?=
 =?utf-8?B?QnBRbXZuRXJ1dTNnRkxheWNLcWg2b1lYYlRRVkd6N0hZeXBHRTFqVDYvYXU2?=
 =?utf-8?B?ODQ1cmRERjhBYVduQVltRDhFKzZDOHFocGpUOVpLQkI3KzRraEFEMGh4TTVu?=
 =?utf-8?B?dDMxZmJTUDBGRkNkODNLODFZamhPRkJRK2hvRHJSTy9Jd3RnQ0JySjB2MTcx?=
 =?utf-8?B?aXNlQ3drQ3oxdnBHRGpaNENOcnFBTGpwOG96U1UydkNRb25Wc2xPWmNJNCtP?=
 =?utf-8?B?UmhEQWJwcG5zMnJTNlErQ3k4THAxeHJxVWNZeHFsOW8zTDc2bEQ0Qng3dHF2?=
 =?utf-8?B?QXNVR0RtK084SFlCMU51Yk1yWVlkeloybUxvNDU2ZHBWbEtIRHpkR3c2WUVt?=
 =?utf-8?B?L05WaUg5SHM1WndqdmVkU1RiNDF6aTdWQ0EwRTRuMjgyY1padjVkWUlGOHY0?=
 =?utf-8?B?dnY4MFE2YlBiYytCRi9sR1k1T000bnJZU2VIb0FBY2VXZWFwQkZaOVAzZ3R6?=
 =?utf-8?B?STJsK2JCUVVqSlQ5bDMrcXV3Tlo1UDJsVTVHOUV5dGNhVjEzUnp6Zy80SkFV?=
 =?utf-8?B?ZERidW1Oa1gvcnFJT3VucVNMMERjQXd1ZWducjU5c0pMNWZ5d0paL0d1c0Jl?=
 =?utf-8?B?UFdDSGpNSDhTanFoRkxtUWFtUkRFeFQ1b1psSmNUbXE0ckJwd25VcnZjSWo3?=
 =?utf-8?B?TkpqclJNWG53WXNWZEpLaTRzQmJxU1BYTEZMc040UTlHbDZiQUx4QlhLY3VL?=
 =?utf-8?B?ZXpsOG1iZStsdythRjR3ckJyUmRrdFlqZDA1V2dqZUtLbGJEUngyc0NWVkI1?=
 =?utf-8?B?RUJ6TExodHhscUNrcjI0QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR0402MB3416.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEFrRjlSVFBMaWkrZ2lxOGNLZzRCNW1HMUpoTmdVOFZjU3prT0E2a2FTc1hw?=
 =?utf-8?B?a1ZKSHZzUUR1T091TzdOSXdpSWdhSExuQ2RLSjF3ZU9OTVZHRk96NWJSYnMx?=
 =?utf-8?B?N0ltQ3kwdVFvTUJJQUNMQ1NmSkx2Q1RMNFFaK3lLZ0tMNDJiWTF4WFNXZHc0?=
 =?utf-8?B?WWlybnowMTBXQUhEQVVIT3l0TEFpczBNckI5dFpxVXlFZ0RaRXErMzJOQkl3?=
 =?utf-8?B?WGhGajFRZmdyTWQ4THB0U0lsZjIyZHJtaWMyUmdVS0V5T3VjU296SWh1Uzg4?=
 =?utf-8?B?K3N5MGUzL1hSS25PZUVmU1RrczFsMWF5SDNQUVFRUkdza2FnVklJL0JNWDRU?=
 =?utf-8?B?S3RJbElwRkFXRmIwQ0piQUNzZTdpZStldFl4SVkxTmxyK3ZGbWFRUS9MbHJi?=
 =?utf-8?B?QVo3QW4xOW9lemRhcG4xL01HOXVGSUQzc3h0OWd2eHlvU3pQUUNzcHp1Q2ZV?=
 =?utf-8?B?OVFiZEorKzB3ZzRsQnc5UHJ2SFcyZ3JxQ1NEWlZZTElMNWo1NDdJWXM0MTRO?=
 =?utf-8?B?NVJpcUhNdVZ2NHRGcW1OZGQ2ellXUG9abVRLOEgydjJ6KzhJWDA2dHZiejUw?=
 =?utf-8?B?endOdTVmMmNjczdIVFdEanVDQThOUlN4blpHRjh4V2xvNmVSVFpXOG5YaHhK?=
 =?utf-8?B?RXJvUVhRNmtIQWl4ck9kck1aNTQ4dlZsQjE5bmttT0JvZ1ZkZVJtL0FBditU?=
 =?utf-8?B?SGQ1MnhKbFJvSWptZGwveGFiU2tsTFBQbG5VZGhYTUI0Tm5YRitKUnR2bzl6?=
 =?utf-8?B?ZStmNFdXclNvd3o2c2NGVHZSejVSYWdRQUlXZlRmeXRFY2h2RjY3M2NWWW8x?=
 =?utf-8?B?a28xWGVKcUp2b1RMVE5CaWVZdUg5djFrV25VWlNXekV0aDdKb24yR0JoaFFu?=
 =?utf-8?B?WkxVOTBqand5dnRmL1dSTHNYUmRZUEZ4OUdxRVpydnRJWTVta2dxRVpoeG15?=
 =?utf-8?B?anEwY3ZmN1NaS0ZLZEE4N0FySTdlSHdUY2ZCeVVxZmpCVnFxdVRKRjBocHFj?=
 =?utf-8?B?bktMSjZrMUVwREEzeHhQRDNBQmwxTHI0N0NEcFJ1bG9jcHdLTnZacXNEd2dp?=
 =?utf-8?B?ODJqYlhqcDhiQzJhL214clU2YllETFo5anpadkRxKzNrMUlDK1NjTE9YdkRT?=
 =?utf-8?B?TmtxcTNqVWZoNzhMYTBIM2VCTTltR1M4OG5EQnFwamZQNXdCeituS2VUcW5E?=
 =?utf-8?B?by9zSENWbS9RNFVsMXBwQzVERHVlUWFISmJnR1h5MWRoS3B3ZEhSdjBsSTRC?=
 =?utf-8?B?bEtWMnF1WFZqQU43aTd3b1FxNlFBeUYvZHpnNG9GeWdFRXVFVkltS3Z1N2xj?=
 =?utf-8?B?WFA1MXBjZy9EZWpvZmZOdmxuN1R5Q1F1dm5IaXBxNDVCMFZtYk9xVndWcXc4?=
 =?utf-8?B?NVA4S0xhVUpISmJId29UY3kzY0swYW44SmFBNm80bkZCazdTZDJIaFZ2TDV5?=
 =?utf-8?B?WDh3L0VybThCaVJETGRBVHFQVkpLZk5iZ2Z0dnhxUmVvQW5QTnFZVWNhNjhz?=
 =?utf-8?B?eUtQOCt3OFF3VzhZYWlLdllhOFJjU1VXNmFocGMramRKU0VKcy81TzliL3ly?=
 =?utf-8?B?T0RPejdOcnBpQWRPeE9uaDlBMmdNN0ZvNXVmTFdSYVRVMVVBall6TjRyYmt5?=
 =?utf-8?B?MzM4L1Y5LzFObHpsaEhuZi9yMjFhY0F0dzduVHUzcFBOd3NieUNEZGo3WGdi?=
 =?utf-8?B?Sk5INjVVc2xpQ1dBbUtUTE5wU1JQWnJCTENTWmtIbGdXdzRmRTZuYUNvaW90?=
 =?utf-8?B?LzRTeS9JUzlGMnNzZGpRWFBqRHp2Zno2cDY4SFZaOG93cUU3aDd2SnFyb1RZ?=
 =?utf-8?B?M0pVbnltam82YzV2VHVwUVZpblBYMkRwdHllUW4xaFNsdlhtTnZ3YzkyRDRB?=
 =?utf-8?B?a1dxaDdSYkVodkMzVnRLTzYrd1lkU0F5TTd1T1JQN2xsM1M4TVd6ZDhmdS9w?=
 =?utf-8?B?dWpIcmdFU2tZWGg3dDduRzlZd0I1K2RKTUttTjN1bDZKZ0h4bm53S1d6ZzFE?=
 =?utf-8?B?Zmx2elQzRDBVZnpBcVljK001eW9LcTRRZ29DcmMrdS9SZjNzOURxQkF3aCtT?=
 =?utf-8?B?YXpBK3J1c3NJODJkcVh4ZEdrK2QxUmFmY3FlRURsVUVuVGN4QWZVNEt0Qlgz?=
 =?utf-8?Q?Q4bCBxdza2hZ79yWp29exRuKM?=
X-OriginatorOrg: sch.bme.hu
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be79990-4128-41ae-923e-08dca108e45d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0402MB3416.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 17:51:14.7100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 79f0ae63-ef51-49f5-9f51-78a3346e1507
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNPv615Xww/SJDWBjNJGOKC4RhlOKobigPeCzyrnXeHS7gKN2tqFESX6ZCNZ7GK//Pah9Y+2WCQlxeMmQVCCsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9471

Hi!

On 1970. 01. 01. 1:00, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Change since v2:
> * reworded comment about NAK for consistency as well (Thanks, Bence!)
> 
>   drivers/i2c/busses/i2c-cp2615.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Acked-by: Bence Csókás <bence98@sch.bme.hu>

Bence

