Return-Path: <linux-i2c+bounces-4090-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6F490D876
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 18:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CE861F241E3
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 16:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6466613DB8C;
	Tue, 18 Jun 2024 16:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="fYDLuztc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2123.outbound.protection.outlook.com [40.107.22.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FC34595D;
	Tue, 18 Jun 2024 16:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718727003; cv=fail; b=I3lcq0MuKtTWyEOgXHstHoA6ehH7Ff/aW4JxxnTYFo2zsgJJ78ZkQceEWBPvo/aWBdH9I+df4AHhG9/aEWTYAdtycg1KS4Vu1Om9AZks728aigZUHKyXYpIlo8m/YCeTmH7VuEodvhfstbEs5p3CFRvRRT6GDX9ktEYhjTyno9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718727003; c=relaxed/simple;
	bh=11k3ZQqfXAibJo2GcROnL1Gh4B8nV9ZEIQmHPEulT+A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mVKROtPd/M00iED/8PwDYr03kSKhlqXgg5y5dqLX/BeYUvqo7+0s35lDlxZnvrFGVJhyW8PVrJ5NGO9jKEp6QYADAxIb8L5d4zF5hX887E/S03AVLbfvZeu9f5KGXb172YT+yAMRUSV2ATyAFUtprNBWJXHRMum+KYD5Cw9uDfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=fYDLuztc; arc=fail smtp.client-ip=40.107.22.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAgSjy/JdurOGKsmHM8s0VjGRfJqaA1rKyAIauMDQarLSsETiZdMfC7wZpqj9vDlHAPD3udDk6wKfVwKbZkWkPdsKlzButL6tFVt5jrZ3pamg41VfbfMWOc2hs6O/3y75mU6ldBS84yJo04h5UmiILnlcnWFNMGQb46296lLN7aL+tLyBEF1YwqGAPTrwIYa99KeJhHUe9TEoqtD11G8b9U84t/vylZp83SGC39MDH884fy024p3pTluIoBOE70q6ei+RBrWgNW8ng1dvWOl4Ql/X+Vktgt1RbXK0+Kna+dD812UhRJutO+tk4MngE5UOvr0GEK33n9oZwabXzwuyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgH9ucL89hK0jwnd7puxUDWH+xKljqh6MCOxoZfCfFs=;
 b=XQ09VBGqT+fGtVgvLOlQXB907s3U8fBVQM8ptuqhRMtaMyINarpxpT7yA2V+4dozjyyQekxpa0nFMMFR+hl9DQwVB5Rik7ZA5SEdrmQVJaouKMgO1i/zGE161DHPQmarOB83wleJBHJom8dSv2mL7k9IGMnvxkBJJzF7J4oJsFs457tiHhW/Ls/AtfjGMQtOnR1hzyINjETuKqcnDrx25qLOMHRhyzBp0U0Fhi6GwPjzvYqvW/0ihCMYUi2v8Kxq6wT8RSLRxBNK4DU3Fk8tIChtdrVDyMNPVS29SkMrnNvmQHrluRpf07Yp8+7Zw5e14EsBcvI1zGb662wsq+14Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgH9ucL89hK0jwnd7puxUDWH+xKljqh6MCOxoZfCfFs=;
 b=fYDLuztcqV+wOCT1Sq2xF/JbeIjRK5m6t0tE19nes8cAmMdxT4D97df/pyG7WqscNdqNHO5ztP1GhEOyrLOjt2rrppvOsLNggZUdNa+aOdD3iEKq8RDoN6dbAocu1tTPbOw6IL2+SpIUlnZprmd1gOiPBMmN4wYlbkO9WXCxyRU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by VI2PR04MB10642.eurprd04.prod.outlook.com (2603:10a6:800:27f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 16:09:49 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 16:09:49 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Tue, 18 Jun 2024 18:06:45 +0200
Subject: [PATCH v4 3/9] dt-bindings: mfd: add support for mule
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-dev-mule-i2c-mux-v4-3-5462d28354c8@cherry.de>
References: <20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de>
In-Reply-To: <20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.0
X-ClientProxiedBy: VI1PR07CA0286.eurprd07.prod.outlook.com
 (2603:10a6:800:130::14) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|VI2PR04MB10642:EE_
X-MS-Office365-Filtering-Correlation-Id: 66c30662-a547-45e6-88f1-08dc8fb113f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|52116011|7416011|376011|366013|1800799021|38350700011|921017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzRXVGdKUHdZWStPTmI2RkNLUmlrN3IvaE8xN01IMDVtejgwY1l6MlJaK3Jn?=
 =?utf-8?B?S1JYbk5RVFkrRTBkTjhJM2hLWlVjS2QwQjUvanU2TVZEOGJXV0pXWFFuRjNB?=
 =?utf-8?B?ODR2ZGZrSnZFcHZFZG5nVDFwSFZiRmJCWEpuQUtxRUZadFNNN2M3Nmp3Mi9N?=
 =?utf-8?B?d2FYWmllWEZRU1RiZHZja245eG1BeWkzS1ZrdmdWK0JmYndJZ0FqRkswbHFI?=
 =?utf-8?B?OWs1WmRQdDRsWnlKVWl2eVFuQUhzNmhpOU5rV29ZRmh2ZjdKQklXM2ZQRVVW?=
 =?utf-8?B?aXNrQ0dIZmZWWXBvV2Y4b3M0Zyt0TUJ5ei9Semk5Qm9yY05rZWR0MHJZRXdU?=
 =?utf-8?B?RFFNR2FvWWJTOGpzbFNEOFFPK0FNeG16aVJOZzNKaGZtcDRyQ1I4d0QxTXNL?=
 =?utf-8?B?azBid24ycFFZVDJmSVhlV1FmUmpWNS9NRFYxOFJ2d1I2NXFyV1orc0ZCSG9S?=
 =?utf-8?B?SGVBVWJKSStkcXFzUnlNTXEyaWVYMkpWeVluNVpqdnhQQ1pDaHlpSmFGNnRY?=
 =?utf-8?B?bDVsN1BlblUrQ3VLMTJ2MU9sb1NKOVZqNnFKMURVYmV2QitXMldxaWs2aXpP?=
 =?utf-8?B?Y2FLMlQ2Y2FhNTIxSjkvZVRpYnA1azBIV1RPNmlQTE1SdEtZZTZING03UnEx?=
 =?utf-8?B?NkpkN1hsVUg0bkx3bkUxN2szcHZvK3d2TGMxcGFQVW1LNHpRZXZwLyt4TGJp?=
 =?utf-8?B?OGxUdWp3WXNKRUV3ZWdKcUlrd3JjdGFvMEFXWWZMclNqSU9LM0ZaalphcjZX?=
 =?utf-8?B?cURUWHpsZ2JuaWFpYXlESFRNam1xWUdVQVJjdTVQTlB5bitqWm5KQ1loQlVr?=
 =?utf-8?B?elpQSlBvRDQ0TU9vb0ZHaCtTR1puTXpXMnFoNW1xS2xJd2VJb2EyZG5aeVll?=
 =?utf-8?B?cnptRmxGYWxvRDJlVjVIa1NQVHdVUXJvdmlRS09BZ3Z6NE1KS0Y0OWxhWlN5?=
 =?utf-8?B?K3Z1WVJYUi83SE9vOFRxVEY4WHVkcEdadlVENW1kQnpZNUEvRnJydU9WTENo?=
 =?utf-8?B?UjVOWndRR0xTNmlrdUJwalFiQ1lNTjJCY3N1MTN4YnFwRkdHVHh1cFhEQTd3?=
 =?utf-8?B?TCt1ZDhGMDJsR1h1UTFsWWZ6bklEamEzcUZyQk5kM2NDS0hkdWVXTlNpQVJn?=
 =?utf-8?B?Z0ZweW11bm53cUh3UTdzVHhKOUxuNEdZMFhEai85YXFhNC9ZZ3l1b0N1R0pJ?=
 =?utf-8?B?S2FiSExjOUNlZUtBZ2hZc0gxTmV5S3FnclFSV3V6aE5GeXlxMVppaitGcmFv?=
 =?utf-8?B?bzkzNGxlMlJvZm9qUmRveElUQVUwQWxIait1QzVacXVFWXJjTlZQTnR3K3Vl?=
 =?utf-8?B?ZE5MWVYvSzI4R0pnV0lkbnpDNzZHWldqRW9uOFdzVUdveTNiQklENEJLN1BW?=
 =?utf-8?B?WmlQT3NNaUwzZGFRWEJPTktKUUx5SEZxVWd0bHZhWm9YWjc0M3dSY0Z4QkZE?=
 =?utf-8?B?T0Rodlg5czJ3OGpTYXBHaEJwS2RVK3QzMGdtdjMrRlBPa09JaFQ3cUMxMXIy?=
 =?utf-8?B?d2VXbkpMN2pWOTZ0L08rYzRwYUJZbEhYYUZJTW5Ud0VrTE9XTFhmTkZFcmYx?=
 =?utf-8?B?Wmwzb2dvMTk5ZzJBTTc5RHlVclR1Uys0Z1ZFZWxTQ25Od0htNnVYTUNYalVv?=
 =?utf-8?B?RllsSXBBbVBsaFBJSHdIaFJqUkJBM2JKZnJOeGFxdUNVRGZCRjBZNlgvTzJi?=
 =?utf-8?B?S1pGa2JuZWlRbXRlVWtCcGoxeDd3dEQ1NUZUbUdFUGc5L2U2MjBwQnNVWFhT?=
 =?utf-8?B?cWR3S1V4bE83YkNqWjgvYmRtNTd1bjMwSmR0NEVuQnVsNGpYcHZBeW9CU2Ur?=
 =?utf-8?B?My9pdm05aU04cVd0OUk3QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(7416011)(376011)(366013)(1800799021)(38350700011)(921017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDVIM3FKc3B2TEh4RjFMaHNUaXR0a1d3RS82UWtlOWRYWm93SFFWQW5XWXBa?=
 =?utf-8?B?YlMwc3JNelVxRGhlclhGdkFNMWUzTnN5dmJBY2Zwb1FETXNsc21GaUJ1d0xN?=
 =?utf-8?B?L2ttRjl2MkVXalNjaHNJeno5U3FhRjA4emRYVkJOZzJVbVJRbnN0ayswWFpE?=
 =?utf-8?B?blVmVGV1a3hleXhqa1dJajBSYzZBZ21kdllaUGx6WlN6NGRjQVJMNFp2ZUd0?=
 =?utf-8?B?WkUyd2dwRjNFeGtFUjNlMk93WkhmdHFGVDJSTXNJMXJJb2JPSnA5cnR3WTZk?=
 =?utf-8?B?akdWZ1lCSDZqWktETW11Zk41clNwYTNTQ01TN1RzbUE2MzJNOG1qVUJIOVN3?=
 =?utf-8?B?U0htVHppMi9laVVrQzczVXgycjI4TnBhZDhSVGRuZGw5YXlCZmFPUUgrYW5u?=
 =?utf-8?B?TFBuUmpnc0dtUkxqdG5ucG0zemFlN1FsSnR4OGZZUlUyOStoV3A0ay9abFEz?=
 =?utf-8?B?bzFnVGZiTENLeXVaUzdyUFpjK003V0xLR05NQTJGQ0lwOTFVQXlZcHE5djJL?=
 =?utf-8?B?UHREMzl1YjQySnEwblBSWDI0TzBUVUs2cUJucDN4TjdESDA5bjlYUnA4d29T?=
 =?utf-8?B?UzgyS0RXSXJ2c1NCcGIxR05QaUVMYTVWQm5ydXBFaDR4SzZwT2hHRlRyTWFs?=
 =?utf-8?B?bHl4d3lRUThsQUFlWWZSSVQ4cWZRd0hHYmdWaUhxcm9rdmN1ZWNTcXJSejZO?=
 =?utf-8?B?Skp4THk3Rk1oYjBzRjdUMUlEL2xqUmp0T1BoQUxHcWRRUGxkN25NVUlLVDk3?=
 =?utf-8?B?STBubVFhNFZCbXAvS3g4d29zV3l1RjErN1V4QWpDZHpvb3FwWHU2TFdFQ203?=
 =?utf-8?B?SkQwRUpuWit5VDc0emFTTTBIbU9JOVAzc2wvTFhZVWN2eEU0ek9XSmJlQnpN?=
 =?utf-8?B?T2Voc3V4U1RUOUJlejdJczZLZlE5UzMyVng2ek5zc1ZRRUQ2Q2YrRGJhZ3NP?=
 =?utf-8?B?T2xzZVo0dWVTajdhWDMvUnRMRElTT3hSeDFNUEtRU1dtR1RTaDNDeVlXaGZD?=
 =?utf-8?B?SE0vVWV1d3hkUTdtVHZiaisxa3hKa3J6bWV0STg3SGVCVlVpd3FjQ1pHQ016?=
 =?utf-8?B?ZEZhRk5KdE9xeW5vUzFXYUl4WTRGaThUT1RYcXVMTEJnSWE3ODVodVpZeDdD?=
 =?utf-8?B?NUpLUElsZ0pLK1MzamlTMXZWR3VWZGhZSHFCSlhpYTgvelFnVHBvWVlQUmor?=
 =?utf-8?B?T3VFaFBUa0hnM3JVNHgvR29rRm4rbDBDN1RLNXJsd0RnMWs0S0pwUDhVM3dK?=
 =?utf-8?B?TW1XdTRrb1EvNEpqNnFNR3RnUmZ1Y2tUTUxvby9jUkhwZFFFalBHVnRRRlFw?=
 =?utf-8?B?Qnd2L3Job0RCREhmMSsvSmFaVkNCSW8vS0YrOEVEcVdpcmZNVjdpNkFVb091?=
 =?utf-8?B?NXlkRWh5NFZjUmpEVTBwSFMzSUM1T3FoQmZTaU9yQ25YbzU4ckdjQVdEc0sv?=
 =?utf-8?B?SkxUc2I2d2FQS3Jzb0RYaWd2VDRSbzYxYjliVmhBaWhpVWVQZEQzZW9BbUo1?=
 =?utf-8?B?dS93WXQxUmhJT2tWczRzWGJHQ0FqSmhQOTNpbVFQWTV1aVN0cXJVeFF5MDAy?=
 =?utf-8?B?K00wZ1duSWd6UVF5dnE3UjVaY0tudmNFVjZ4ZTBYL1JsYWoxcXA5WFhaMy9S?=
 =?utf-8?B?MXhWQjQ1NjZVWXFpb0YvTlFSNzRldU83Nml0b2MyMm1haHVROWpaY2N6UHQ2?=
 =?utf-8?B?RG5DYnFvUUcvYVJ5U1pocm5HOWI0aFk2cE94cktGUDduekFteFM1dGVkUTZE?=
 =?utf-8?B?TWpYYlc5SWVxVm9WRnVPUHdma3ZnRFpKSWFBYzhReDlDZFJmbE5KYVJVMXFq?=
 =?utf-8?B?OHJQdGRaeG5qNGFWWHd0UHpHUGVVZysyYXFtK25uZXZpWTBkNFhkaGs2bzEx?=
 =?utf-8?B?dDlwR0RaajhUcmNEcmQyTlVtTWZVN214bk9ibjBIUytLUjljMzFVK1FXNUts?=
 =?utf-8?B?a1pxc1l2eGdXUFd6eVJVTzdseDlXOFRVMTNOeFd5em5LMXdrVTcyYjFYOXRy?=
 =?utf-8?B?QlBhdzlLWmtFTEZOUllsS3FXb2VhdUpiQit2SGJ1QTVFaWljQkh3NDdrZjJl?=
 =?utf-8?B?TDdXVHlUdldtZGtzL3FjTGdnOGk1SmhRaEtwMXNPRXc2ZXRVWWc4U2t4N1JB?=
 =?utf-8?B?Sjk4TTdUTVRCamZYRzAvN0hod2xiM3V4ZitPY3dvWk5uMTRnNHFTdjdGUmcz?=
 =?utf-8?B?cXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c30662-a547-45e6-88f1-08dc8fb113f9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 16:09:49.0910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4JPImVgy8Nv1t3O6QNSPbND8tlcVw1BLlPE3z7FEurOBxEDXniu3JyuVQgJfa6nhLO1FsWiyTQaTTgrE5q1WlSz2M9BeuTbsiITrnaYUrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10642

Mule is an MCU that emulates a set of I2C devices, among which an amc6821
device and an I2C mux that exposes more emulated devices. These two devices
share the same I2C address. Only the I2C mux uses register (0xff) as a
config register.

Add dt-binding support for the Mule I2C multi-function device.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 .../devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  | 48 +++++++++++++
 .../devicetree/bindings/mfd/tsd,mule.yaml          | 82 ++++++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml b/Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml
new file mode 100644
index 000000000000..ac9dfc936272
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/tsd,mule-i2c-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mule I2C multiplexer
+
+maintainers:
+  - Farouk Bouabid <farouk.bouabid@cherry.de>
+  - Quentin Schulz <quentin.schulz@cherry.de>
+
+description: |
+  This module is part of the Mule I2C multi-function device. For more
+  details see ../mfd/tsd,mule.yaml.
+
+  Mule I2C-mux configures the active device that can be accessed on address
+  0x6f through the config register.
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
diff --git a/Documentation/devicetree/bindings/mfd/tsd,mule.yaml b/Documentation/devicetree/bindings/mfd/tsd,mule.yaml
new file mode 100644
index 000000000000..ab532340a17c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/tsd,mule.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/tsd,mule.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mule I2C multi function device
+
+maintainers:
+  - Farouk Bouabid <farouk.bouabid@cherry.de>
+  - Quentin Schulz <quentin.schulz@cherry.de>
+
+description:
+  Mule is an MCU that emulates a set of I2C devices, among which an amc6821
+  device and an I2C mux that exposes more emulated devices. These two devices
+  share the same I2C address. Only the I2C mux uses register (0xff) as a config
+  register.
+
+properties:
+  compatible:
+    const: tsd,mule
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^fan(@[0-9a-f]+)?$":
+    $ref: /schemas/trivial-devices.yaml
+
+  "^i2c-mux(@[0-9a-f]+)?$":
+    $ref: /schemas/i2c/tsd,mule-i2c-mux.yaml
+
+required:
+  - "#address-cells"
+  - "#size-cells"
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mule@18 {
+            compatible = "tsd,mule";
+            reg = <0x18>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            fan@18 {
+                compatible = "ti,amc6821";
+                reg = <0x18>;
+            };
+
+            i2c-mux {
+                compatible = "tsd,mule-i2c-mux";
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                i2c@0 {
+                    reg = <0x0>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    rtc@6f {
+                        compatible = "isil,isl1208";
+                        reg = <0x6f>;
+                    };
+                };
+            };
+        };
+    };
+...

-- 
2.34.1


