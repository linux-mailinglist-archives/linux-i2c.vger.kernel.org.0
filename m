Return-Path: <linux-i2c+bounces-5999-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 656E8968C1C
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 18:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2098B21AB8
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 16:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC921A265F;
	Mon,  2 Sep 2024 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="ZDQXZaZx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506DF3B1AC;
	Mon,  2 Sep 2024 16:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725295121; cv=fail; b=kD72Ao91PT/a3Ak2D7kkkIICTd7Mb8XJlQRiBAm9hfbSXT/OiBuwDhC6FCRicoeBzYi9yb4P4Zyu42UkwXuJhqXy5/BDZ1vrjVLz9ebqZuzHA0EnCLsHmZrTI6n3AMd9TxM0sDCOtMbAA/omtBg+FW10O9T+5F+4V3i4M6ITZaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725295121; c=relaxed/simple;
	bh=SfE8/mJSj688fz7/D9o92rF+AocyZF/L3sDEh7JPBVo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BP179XaeEBPkAXPhXwxu4qIkBHO26hXCh5S8jigKWyc2lR4owiBqOPpE9KYUuJ1s0d+DmHiDSq9HWzR+jn/KK9tOYWhjr50OnWoNBORw+gEZZMonnrmajCvC1O2SwKYoqd8RiBqli7I83TALUaVy0YnKaBjJRq6WdQkoWlY3YCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=ZDQXZaZx; arc=fail smtp.client-ip=40.107.20.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+CBAbf9qtrOLnLCtD2iu9pYrUJd8IiiZ+rvpDDFoMrAsMT9CfWxzhDfuNZasIENpMo8swEvazMtLQch/RC94oJPvojZFtFrGZtwt2CcYOsnDjWVzTESpQoBk9/l9HVNfLhzWECo9qCgcVLSwR3Bhr5+2gdrud5RKsNECtPPimT/Z9iyomZVTqpjjGDb7bziS1uS70qMnGg05O2Ne+jjt/k8PCJigAgtPB/bxhYUO4JkwNydfp3DfzDJeqkJ6qwJgM94zKhT39MzxH+G3x7ZbnkWUzm4dlxpK37cxrHh8JU58KwtXPY2H1hqja39P6IALWAHD54cNDzosHG375Oe/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcoef2dM8l/6IOP+6VXDoZrZ0qTu1WQx0TD6c7JIpl0=;
 b=ojL3Be4ZZV6lI8hsM6WLzVl48vjpat8X80oXTM+s+XhzV1joPCYH0K/8wXRHiU1Tt8Ih56sjmMo2BDW2w9zNI+qZYKPKcjWSNVxa+Mqqxx2hUABojcqL7QkhKhxV6B1FD2+Pf7Q06M8zFkYvlbcufMN/ptt77ClsH1RGI5ryCnhpvBiPYf4W9ALKjEMFGdD7IgL5gYiDIcfZYmryfLMT7513qIkUd4MAN0MMX0g/woi+0K/9Xqsfg3P+VvIkQrln9VRxYoppo9rHA2gzOZ5FIKmvRpoQyHlddyVdVHqWLVf/rZopTzn9vjPi+IoI0giWY6reIiWbgEuz9zWEYtrQXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcoef2dM8l/6IOP+6VXDoZrZ0qTu1WQx0TD6c7JIpl0=;
 b=ZDQXZaZx05noz2z/2FTTWaAKDZwr7KyztwvD6MZBb97d8rUAeW42NPnwtzO8tXPTpQqGFcuBs6/Zq4jI3li/23KdJJYt51ZNjZHMHi9Xuc7JeEeZ9zGNqF6QOk9ertzEmd/Vlnpsl1Ii9gilQzoBYT8/VV0t1veKxRbGwcxbRmw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by DB9PR04MB9645.eurprd04.prod.outlook.com (2603:10a6:10:309::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 16:38:33 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%6]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 16:38:33 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 02 Sep 2024 18:38:14 +0200
Subject: [PATCH v7 1/8] dt-bindings: i2c: add support for tsd,mule-i2c-mux
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-dev-mule-i2c-mux-v7-1-bf7b8f5385ed@cherry.de>
References: <20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de>
In-Reply-To: <20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.15-dev-99b12
X-ClientProxiedBy: VI1PR0502CA0001.eurprd05.prod.outlook.com
 (2603:10a6:803:1::14) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|DB9PR04MB9645:EE_
X-MS-Office365-Filtering-Correlation-Id: 43064fc0-cf52-455b-2cfd-08dccb6daf9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzdxTlNyWjgvSUVXNUt0L3lCMEx1Skdjb25jcmFraDZHMzhzUS9INitEVWND?=
 =?utf-8?B?bnBISEpNZFh6YTUzUXZEUGlTZ0FwNGNRWFpLaEp2bkJLOWd4Y0VwZU1pK2Yv?=
 =?utf-8?B?bS9mWTFUcWVEZ0k4QkE0enpTWXlUaERmdjhWWExVcmN4TG1RK3JjTGN6U1oy?=
 =?utf-8?B?RlpqZ21XQlJMNkI4Y2FhaGJXQ1B6NjF0ZGQ5ZUo2NjZhRVh5bUJHWWJ2TnNt?=
 =?utf-8?B?MHBWWFZaZ1o4L3lQK0Y4NlVMSkV3SC9FNWJNUFMwWXBoZG9kY25aeUNDT1N0?=
 =?utf-8?B?aFZDZHNQUnVMemliMmg4V3Z1L25QR0dhczIxRkhZUmxCQWg5OUorMy9pMWFQ?=
 =?utf-8?B?UWdmQkZjcHV1ZWRycHJyS21oRXh1WmRhQmtnL2hiT3RZanBWN3B1aDVUc3p3?=
 =?utf-8?B?a2NBVzBEaDhBOTFjMVpPd0JieXlSaWFLcUlRVi9SZ2VWNk1LTGJna3hGQ3Fh?=
 =?utf-8?B?MGhPZHhqS1NFdWNJVGZ4MTBnZW9ZZmxVUld1UjQxOW9vdlluNjRqZW5kejQx?=
 =?utf-8?B?cGVjejR2eXdHY09pWGk3RENGeWRlcXg5Zy9DRVlmTjlMZDlrWklpU2ZkTm92?=
 =?utf-8?B?ZVJER2s4ZHlYUmRLbk1iNXFUcVh4SmplbTFtL0ZMQzFuRStySUUxd2ZXODEw?=
 =?utf-8?B?MWxNbU0vVXU0bVFCRFdzRGZVT25tZjJiZmZlTFRZZXgwMjRLdHk0c2N6ZERZ?=
 =?utf-8?B?U3UyTjBHcEkwL3F6NDZzYWN3NlE2WHRMMElZbndsLzdKWUVDMUVxZ2pSRDRy?=
 =?utf-8?B?Q01kSFo2ZlFWcllkYlJPU29pWUc1YXlTS1ZidzhiakpmTjZlQXZvK3FlaU14?=
 =?utf-8?B?QnF2di9oalg2aFozU3RSYk1jSWQ1Vnp0Rk96c2E1VHN4eFpnMHlvNkcrVURQ?=
 =?utf-8?B?SlovSGhScGF4MGJKekxMZU1ybWxob3hoM211Q1JpTjlGVDNLM1J6a2pvWVAv?=
 =?utf-8?B?aFpYMjdEVXA2MEVGZXhaZkFENmJlOGVFK1JHWlZ1MVNRRGV4eS9xK29nTDIy?=
 =?utf-8?B?azRlbzF3NXUvMlE2dnh5UmF1WXcwSzRDdnk0Qm9jNjBLMFdzaUxCWDdlODdW?=
 =?utf-8?B?cjdoaXhqZXJFT2VaaXEwSmU3MkxMTEVwbGkrTmlNQnFTMmVwYmk0czNSVXZI?=
 =?utf-8?B?UHVtakt5dExqcU44RFl6OFNHVHNTWUZtWVNabTgrWEhPNVZUaVp3dlFIb0ph?=
 =?utf-8?B?c29meWoxV1RjTkdxenlaNXJsTXNqK0YxV0dQSVRqRUxTR2NNZnQvcE90OVVa?=
 =?utf-8?B?UmI5dUdHU0JIYXRXdW1GMy9tWEFnRUU0K01xRjB4bnQ5amp0d1pBamtCUkJa?=
 =?utf-8?B?dktUYS9oVnNZa3VIZ3BabzM4RXhiMEZqVVl5REErd1ZXN3A2Uk9jckZxU3Fn?=
 =?utf-8?B?ODFoWmpTRzhpd1BWNFRsY0lSVEV1YXMvNUtWL3FPa3VhbGpoWDRFWlBCdmhF?=
 =?utf-8?B?dmdvb0J2MjdmQUJNTVczL2NjcEFqK3NzcXJOcC9SS3RyL3pidVUxL1FtZHFw?=
 =?utf-8?B?eE43akRNREUrZmh3SW1mS2JyUFg4ZUFxZTJ5VisvSHBkU2UyUU81WExVMjQ4?=
 =?utf-8?B?d0s4Z2dSQ2NtdytNOTA1NkdBNHRobkt1K3NEbURwSkprNmJQMnFEckdUcXc5?=
 =?utf-8?B?WU9saUExYkNyUUF4ZFM4V1JiRzV3eDVnYmw3UU5qdERFVG9qSHNNMHh0czNv?=
 =?utf-8?B?VzZSNDBpQkZDSDBncVV5OVpHckRMeWZGa1pQWE4vYStLOTZtUGpqbFU4MVZj?=
 =?utf-8?B?M3pubk84eVJvd0E4WmRIajdnSEhyTDdjTFlUVWFrTU1jRXhNUE9rYUhHNnZP?=
 =?utf-8?Q?BijC0eatVyldK/AFQAZgwwc3KRVjtgKaMpnL8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OCtYRVIxTERvWXovWG9nZ0ZQeGt1a2R1dzdXdUlMTEQ4YXVZT1hrbkxxZzUw?=
 =?utf-8?B?QzBSbDRob2tIbm5OYUJiVUZ4UFBGZzgwaE44MDVnVEtjcmRHbkxyQXFBdnFX?=
 =?utf-8?B?bkNVUGpTeHJDREQ0OCthS3c1bjBuV25IZEFjdWZXbEIxVlJOQVJQNGlrdVJt?=
 =?utf-8?B?K3BSTnpldkYxVmxEOHUwRTRpL1dhTndEVnRKaDJCZlBQT2NWeXRYT2FSdUp0?=
 =?utf-8?B?R0xndE15ajkvYSsrck5YcFF0RXdaTk9KcnN3U1hXMndEL1pEYnNMOU8wTDdh?=
 =?utf-8?B?dUJ2akhZMFdKOFpQdE1zRzhYSlBWdkZYL0d0TWZFVlFqOHoxbGZiNE45aFBF?=
 =?utf-8?B?Q3FKTGIxK3lsTHdkSmdFaitscTBncFlCeFpjRnZ1aXlMZVU2TUNYSmVHcTMx?=
 =?utf-8?B?Rzl6SFJwWlBMOXloY1A5OGRkYk9CSUx6RnJCajBqNGdzSHIzYWVMbDdORHZ6?=
 =?utf-8?B?RXltczJ6d0x0UTVoMFoyU0svd0QrUlY4eFhLQmxicUg3am5lK1dJRGF0YXNk?=
 =?utf-8?B?QmhkdGlSRHJLYThHbTlaTlRWNzRNekRrWDFuL2JjVi92TUV5NHVvR0Vid3hT?=
 =?utf-8?B?UkIyTDdxRzJPYnh4R0dNZ2swUC9jNS9IZmF3c1JBcUNsYjFIT3BBci8zcGQ2?=
 =?utf-8?B?akRITjJ4NEoyTlF1TVlBQ1BOZjRqU1ZmT2tucjBxWlBHMDZwRXU4aFRzUi9G?=
 =?utf-8?B?Zkx5RERUM2ZtUUluSTZuS3RqRHF1eXhMa3RES1AwU0hzU0dtUERuUTJwVEo0?=
 =?utf-8?B?M3gxdi9qY1dsVW9MakVKU0tpbVltVXFqTTVpdy9jbGNqUXlBbWNLOXdtQ1p0?=
 =?utf-8?B?MkNabklqT2hncCsydDlIRXNhQkxYS0NXZGlnQnlaSXFUbVVFZ3M1RnVZb1JZ?=
 =?utf-8?B?Tlh2RGRSNkx0azQ2MzQ2WmpRQ0VMSC91QXVFVkx6YjFsYUhiSnowckZjVG1N?=
 =?utf-8?B?YWd4c3VaNW5YeVpwQXh5Q1NRMnRCcy91c2J2eTdPVG15QndqU3ViRDRZM0Ez?=
 =?utf-8?B?NGMyQTdQMEpLNU5SR1NzaVk1ZExQd2xOMUhiNjVUaXNTOGJBZEtTdE9lWVph?=
 =?utf-8?B?WEVaRW0vNWkrZDRFb2JGYnlZdnJ2RDkrYWdHSXdqVHFoNUhkaDlqL0FWWXdj?=
 =?utf-8?B?cllYc253VkVBeWhyOCs5MFNScHlxM2YzREpQZVdyUVRTZ25SZG1YZkgxcEdW?=
 =?utf-8?B?MmFSS3h4cEpnM1NnSTNPTDcrSmRJV3lUVXdnZjVCdmhCTVZTSTdFb1FKc09D?=
 =?utf-8?B?NWZyRUwvZjZIekZYMmJWTGQrY3IwcGNtakRzemZsSTFQNkFiMkNJUE1kOEhj?=
 =?utf-8?B?dWRDcDdZZW5qMldyL054QzlSd0NRS3ZIeDVkenRLZ0pXYmVlQUxHV2tNcVJM?=
 =?utf-8?B?eENPbCs4WjVmZW9Pc2hKU1dZUDVnTHhLNHErZmp6a1AyZG9tMEdlNGhMN1dh?=
 =?utf-8?B?UTN6ZzkxNEhwekhQdHR0YTJZM3hobDFEdGNRc0lsR2hSSXNXajMyOUdVVUFx?=
 =?utf-8?B?U25hTnVQQWpnMExZY3ZlRWR4TXdWNk1ya2syaEtQYU1KV2RNUnErOW1kcWV6?=
 =?utf-8?B?TzhkeFNNMWpCc2VyaTlSZnZTQ0N6dzFpK0hNK0ZmdHBHbVVDTE94N2c4RVF6?=
 =?utf-8?B?Z3BtbVB5dk90dDVyOHpucUNpV1hMck1aTHp5YldhMVZTcUxjc2hZcm1neG9L?=
 =?utf-8?B?ZERhRzNQTlhHNDhhcWh4bnBKaklKYW5GTDJpZXhKWVJTNUtZSFZtNlpVSjlZ?=
 =?utf-8?B?WEJleVdPN2RwVTFEZmxJY0N1bU04QXcycmlPNTJqdEVPa0VKVlNGTFgwdnNT?=
 =?utf-8?B?MGN0VTRtcnRCMkU1TVdTaHF6eVlQcjUvVHU0OVE3MDVvT3hmYkltMGM0QUZB?=
 =?utf-8?B?dnpKOVZqV1VLZG4xKzYyR0FScFhSbDR3U2pIdVIwcFJXZXAwUkZxanhWWjJl?=
 =?utf-8?B?TnVEczE4V1hqWjZvTmhOQTJlT2tvL3RyU3VCeXdBcXE3NUl6bnBNVGtnYWhz?=
 =?utf-8?B?bWtoekh5Mm4ycE9IQkt4ODZ4bjFiMjlqOElJcWhGUkcvcC9TaTdXU25kTDdT?=
 =?utf-8?B?YzRTUE9HeHdDK3hOeERGNkRFREJzbmVrSml4S1lxRVNyWU9NVE9IZVBrV3FD?=
 =?utf-8?B?SUxhNng4L3kyZ2x4TGhEak9uR3c0Z05pbkpUSW4zZzNpOU5QMTJiQXlkYVZE?=
 =?utf-8?B?R1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 43064fc0-cf52-455b-2cfd-08dccb6daf9c
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 16:38:33.8561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IASnpBhMlf3nXnXArPXZ89HTaWVk461BbMkA8B6Sd2i7wSEhrQPhsjhIaS/AKRvKfyGO/2gPJjzyMJ+Qe2iynIlEu+2XQ2kDsMQnJ1N17lE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9645

Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
among which devices that are reachable through an I2C-mux. The devices
on the mux can be selected by writing the appropriate device number to
an I2C config register.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
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


