Return-Path: <linux-i2c+bounces-6323-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD0596F8C0
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 17:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 802611F219BE
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 15:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20BE1D31B7;
	Fri,  6 Sep 2024 15:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="gima8s+u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4544E1D0DC6;
	Fri,  6 Sep 2024 15:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725638154; cv=fail; b=RODQLAd7Lih3VPjq158sHuuJONCPDR+57OWboSPhCGqK3IRX22FtzdnOZ4rJEJebmi+9aO8QdtBX0zLzwxKQ+QhvdgQ7GHisa9bfeulyGKnUEyHxsqBOfOqkKFxtHP9rjiUnkrX43M5/t9dWbaTm6tcFj2sCsYAsvCkxpb6GD4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725638154; c=relaxed/simple;
	bh=SfE8/mJSj688fz7/D9o92rF+AocyZF/L3sDEh7JPBVo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BEtKyfxZ/Z9PUfPrHooCPwx4d+ehnfIR6xRuARzNN0FG8TjRq8qOEd8SZA+ZrRSyRb67DseRvW872v3IlUkil4guZvA5falLQSxoit5LY07DK1IZLisiewW1YOGlhlMlL41tXbawC4XERKXTPQJPXN9HbanBjdIveBq/QQpCuOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=gima8s+u; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1xSyCGiNfQ59u1LhG7JZiaLZB2vMquWEBKrVJFgXY5P7YbpbW4lRVtrfaCHMmEMF2f9+c341BbczoD02RLSgLevn9nNQaILdJ7lWqhx1Cd+Aap8XC7iDIUlvs+RkBmy07Oz1EDE/e99Axy8hcVYhgxQkGr1BJ1DQhTH6US4YBNh/GyAjMrPFgcnBTffeSh5AsPMFdB991TAk4uYdgT25iixWTbcrr3Hb7qTvqB5KAUu5n4zsOCQxravxuSY1aHZswxVxS2xbbqawKyw1q9rEnsUMA/gqLVewe+DzLd59u4dOGyQMquLehtERX29ej1popNTqWxO3Ukay3yA6+Kksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcoef2dM8l/6IOP+6VXDoZrZ0qTu1WQx0TD6c7JIpl0=;
 b=A9T9v2YBQGylSFNjbuxUC9FUdg7MJvUnKPwN9n08TKiPWps0Qe0W+X9CB9Zph5mpEviaB9bAtNxclyvW1hezinJF5+PBwmUDeUkl6Bqj5Op9fMHVuq3fdk3nnQtVZwRNjM80lQaIgramsCqN1tJ+MgWLhpoBA+lrmlg1gW7SdlCdkPiUOUrJyqQbCqBPJqJQodb43poO6wVhoSLKiRtQMATO8zVAE9efIthq+yt2cAXOWdrPASWBckbsflfdr5+rq9BLwkxzS4gJN8QHFzOam13hAW38846Ud8bwczPbRFzuc1EDrfW0eXYZmVieZ/PuICb3bXihVIpKGZCkeLnl/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcoef2dM8l/6IOP+6VXDoZrZ0qTu1WQx0TD6c7JIpl0=;
 b=gima8s+u1mbd9mSfIZeo5DhWknDC6RBYU0ds0SSKlYbYVGQP+8PhAziYi2MGdbu8W4nzPkw74egyXv/kkwObqOiFl+5N4uICtsh5GIIu3hX5qkToXc6DZLwaG9JRwVnbE9A0Rd/u8wwMFA13Ky2VG2DG0OpJ437AyrSYdd6AeDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by PAXPR04MB8319.eurprd04.prod.outlook.com (2603:10a6:102:1c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 15:55:47 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%6]) with mapi id 15.20.7918.020; Fri, 6 Sep 2024
 15:55:47 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Fri, 06 Sep 2024 17:54:12 +0200
Subject: [PATCH v8 1/8] dt-bindings: i2c: add support for tsd,mule-i2c-mux
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-dev-mule-i2c-mux-v8-1-dbd28a150e41@cherry.de>
References: <20240906-dev-mule-i2c-mux-v8-0-dbd28a150e41@cherry.de>
In-Reply-To: <20240906-dev-mule-i2c-mux-v8-0-dbd28a150e41@cherry.de>
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
X-Mailer: b4 0.15-dev-77eae
X-ClientProxiedBy: VE1PR08CA0022.eurprd08.prod.outlook.com
 (2603:10a6:803:104::35) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|PAXPR04MB8319:EE_
X-MS-Office365-Filtering-Correlation-Id: 3914f20d-8916-49b6-15ba-08dcce8c5f55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFNyTklDdHRQZHJKemo3SlZyUi9qMllGYkZqN3ptZHluV2IzSUt2MzFvODFm?=
 =?utf-8?B?a2tVbmtwQ0lnWHJnS3ljV2UxWCtCMnFVV25iRldFNVVIUHFsaGpYMFdMOXlJ?=
 =?utf-8?B?NXVGYy81ZjlnRDB3K1lrV21IdjFnTkdHRTBZUzhlN01tdEN2ak1wR2hEUGJX?=
 =?utf-8?B?KzkrZHhvbWpoSGswdEgwd2NOVXVJZEFEc00wU1ZNeHpYUldTeU5jd1pGZ1lD?=
 =?utf-8?B?eFhLeUxzMUVZRmNkYml3ZE52T0NpZllwSHl1UnY1VDAxekxNUTdnTzlOeGFZ?=
 =?utf-8?B?RThoN09NTlc2WFNyY1N2RHp1ZXpIeWJJK1h3aE10THBjb3l3cnEzajBWYTFz?=
 =?utf-8?B?YzlpdVRpUnAxMUNKeVFMUDlKdDQ4RTFwTU04d290bmdwbVdYeVlTSm83dE9X?=
 =?utf-8?B?T1NYNEsyekEyeFVyazUzZVJDaXhNN2FQTjYxYStlVncya0JnTnh2YWJLRmNF?=
 =?utf-8?B?SmdxdVBicnh3Vk14WW90QkFCMENvdzEwa29FZ2xJQW9ULytYZUZHVEFSK3Q0?=
 =?utf-8?B?VFptVzhreE9CeU5ESUt2ZlZFekxXeWVuWnovZ0E5Y0V1bUErU05UZFFYeGFo?=
 =?utf-8?B?c05HcEZlZDR2MzFLUll2MTh3U0pjM3NxbzFKc2JMVzNWaTVRSllCVDl6L0p3?=
 =?utf-8?B?MjFNdW1IS1dEUUtRTDIvZEo0MlNWbWN0WkpIb0gvUXFyYU1ZdC9UQjc2U2Jp?=
 =?utf-8?B?T3pVSHI0K3dyL0dibVhjTzRUVTQvVUY3aFZjNk11dWorQWh6aHpzSFhwemtY?=
 =?utf-8?B?ZW5wVHJvZHNmVHVaYnB0RkREVjRtK1pnVXlteXBRTk1ZNVloVDhvN1h3R0I4?=
 =?utf-8?B?eFV1L1UrdytMbDNlQnFLU0xScVMvVE5QOUt5aFkwWklPVmxBNStlNjU4RzZl?=
 =?utf-8?B?cUZBdXlXV2gvYWFON0tDL3FKQW1ISHcwVjl6ZGpwbU9kK2RmN3JPQy9LRlpD?=
 =?utf-8?B?WFZVWWEvRmE4WmZ6aWM2ZkM4R1AydlRURVUzU21JcVcwRGhraDNuOVFpMXVS?=
 =?utf-8?B?T2gyelpzeWRRUmp1bVRjUllmMyt5cDhmOVh1V1o4TkhPQzV5cUdHMi9qbGls?=
 =?utf-8?B?M3RLZk1BQklZaVk4bmovVFZHZkcrUU9LQ1VNVHNmRVBYREtGM3N1SWZwUVg2?=
 =?utf-8?B?VWhMYU9ScU9LQ2dzcU0vdjFGcXFWTWpDdlNvQ2VQU1pkVC9tWEphNHlKc1E1?=
 =?utf-8?B?blllY1EzVUxaRjFNNkhhVk9IaWVaSWNpVVlLS09SODE3bmpBdVdtUW5lbVI4?=
 =?utf-8?B?ZlNwZVZOL3BSSVlaUXk2dUk4d0ZpVzFMUEVZcm94a1ZiRWhySmhpZVdic3FM?=
 =?utf-8?B?S28zUVRFZXpZaC9wNkFQc2sxeW5PSmlNWVFCcjluSXFtYU9taEJQcDVseW9M?=
 =?utf-8?B?WUNoZnpZOGZsV2NidnNlMGN6TGh1L205Qm5ZZzM1aENJYUNmNW0wUlRpZDJp?=
 =?utf-8?B?Sit1MHEvSVNJaHVnSXVodGNHdTR6czROczJrclROS25BbDJnUlpmWjFMdnNa?=
 =?utf-8?B?Y3dwd3Q4YVVlT3MyQy9wamkyVGJFbFVaZWpTSUVjbkRNdDZsRFllMkhOaUg4?=
 =?utf-8?B?bVhRUEpMczZmQjRyTTZCODNwZVVJZXhaWUhWSmRYZG1kK09tS0cxemh5NEZ3?=
 =?utf-8?B?ZjEvTWFwN3cvcDdybUUvNjFNSTdnNzFqY0YvQlkyVzBnaUFhclRyTTZNNnd0?=
 =?utf-8?B?WTFCRUh5SFVMTS9Gc3d6dzIyaDFBbkNnNWdQcHNIWlpDNng4TWlzdEpMNzlK?=
 =?utf-8?B?b1p0aGpYWW9HTzdkbjZHRnBPQzk1VUpRZjkvbncwVmN2MFRoVjVhODgyQWFB?=
 =?utf-8?Q?uR1QhBm8FqCWVbgDC4XUxUyFo+ZKrAKXmPOys=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXUybUFBZHIzM0N2WXd6bzU3eUVjOVdscnhtN3lZUzl6RUcvZ0tIdHpVTUlI?=
 =?utf-8?B?VlRwYStjTnVRaWR6dzF1UVVkNkNOM281TXI4WUIyWEJnTkpzMGRtamQvK0x0?=
 =?utf-8?B?Wit0NmdGRFVsMXNHQ3NwY1UxZUxUU1hWNVRQQVMyVUdOWU5JamQ3cEtJOFBO?=
 =?utf-8?B?SGJxdUZqSDM3Zy9oZjBPSkc1cm1xbk1DVDM1dVhDZ0VKMjBETUFjOUNTbVk1?=
 =?utf-8?B?dGZzY0s0SE1SQ3JkT3hlL1loN0ZNZnRyNWx5NzY5Qy9FemI5QjFZK1ZFUjZl?=
 =?utf-8?B?UW1QVHEwMS9lbWNnVE9uSHZ5S1F2QURiMFl3bGwvOGFBTUR6bFpURG1KOXRw?=
 =?utf-8?B?S3dQaEJTZHVhWnJuV3ZOQ0k1blh3b0RaejlyMU42blZzN3lyS3RkWDB0Ukhw?=
 =?utf-8?B?NU9vRWU0aUpjbUQrVFQyV015NEt3c29SYVBiNjhCeE1LRmpETGxNQkczTU11?=
 =?utf-8?B?eFZHaVVOMENqcGNkSUNpT3dDOW4yUHh3RnppZFhUMHZhc2JmOWVyOFpCRE1J?=
 =?utf-8?B?WVArZ2twVWpVL1N4bE1DY2NjbHVjYXVkVVhwYzc3RCsvUmtoL2VjZlpCM095?=
 =?utf-8?B?YkNKbW9IUU1rSjZJNUZFQ0Q1VCsrVTJvQVZsRys0VHp4L1JoUnJWK1VkcmxO?=
 =?utf-8?B?bjMwOHY1Rk1HazZEZHNsZnFMR1dEZnBRUHZCQ2NjZGdCVGJFSDRKOXQ5Y0dD?=
 =?utf-8?B?d3hrRHowd1lnTW1TTVU2bldaNGtzdXNsbW1QL1hBRWtyZmtOQnBVcFprb1RY?=
 =?utf-8?B?TDduOGNPNDBxdXFjU2NLSXVuNFZpK2JxNjBJYmRpaU1WdXh2RklMdnhaUmJj?=
 =?utf-8?B?bjNKdDlQcURpOEhHT1AzOEF2OWZKKzRFK2V2OXd5Wi9oU1FkNU1FKzdUY1Vs?=
 =?utf-8?B?cUpKeWs2akJoUEJ3Ym5abEFla2NVcFRnQzVMZXRHOWQyQytUL2tISWlOVitU?=
 =?utf-8?B?enk4YS9IN0ZYdWNFRlN2K013N2dkb1RrTDA1TnYzTTFlelExM1NuL3VJNWx0?=
 =?utf-8?B?UWo5MTV6RVp3NHVCUE90NU5KbXBkb3psUlRFOCs0cGIxNUdHc1EvRm54cmV1?=
 =?utf-8?B?cG5zZVJUakJGclZTT3lJbk9xaktOYXdBazEzeVhYeGlOYXBwblp6eVl4K3BE?=
 =?utf-8?B?V1F5c2VHRjBpNVhaMWoxZlJKNHF4OWJsUGhLZ1dVcmxXL29mdWYyUGVUQUdN?=
 =?utf-8?B?K1NrTGM2aGwrQWJKTzhSVk1OanZXazBUODBMK2k5cEhESWdmU0JnaDhpSHh3?=
 =?utf-8?B?V1pqbHFaN3NrWUtOT1hoelB1MmRoUXYxZ3phbldPSXBSVXlFaUFqdW41YlBa?=
 =?utf-8?B?bDdXZ2wwTzhvdnBtenhvYTRneGoxUnhqT2djamMvMjM0WkFEOTRmTktFZmdp?=
 =?utf-8?B?SFNkbFlVUWsrZ0VQRFRXVGhoRnBlWGtTUmhqKy9iTElyNzJtMzlkSjRjU0ZN?=
 =?utf-8?B?dTQ0clBNeUlTZWRLR2R4ZndiYlRTVHhiNGprZzNnTy9MZGFVeURhbklTUlcy?=
 =?utf-8?B?NldGTVlUbHZ1MGVjRGFITnBxcUZiVGlNYnlLeGNyK3gyZmFWUVF5OUVvODkv?=
 =?utf-8?B?SmcrK25nN2N6R1hCZ3drd2lldXViNEJPbG5hWVpYOStLYjZ6UEFYTStUeTFH?=
 =?utf-8?B?d0FBemxLMXpLWSs0Q1BXYTVjVmtON3N5dnUycFhVcXdyekViOGZmQ1VWSHBD?=
 =?utf-8?B?MmYvaFREWGpXZ256cHdxRjdreFhQWjBjM2R6NStsYkQ1NkNKTFFhdExMRFoz?=
 =?utf-8?B?QzVjK1ErUW1rK1BSTFJRdlpEZVNycGRYUy9OTHNRQWIvRk5RMmljeElHYVZR?=
 =?utf-8?B?N0pDaXdaNDJyQVZqcmhlY0F4SmR2WGY4cjkwK1habDVScGo0VFBweEpZYXpi?=
 =?utf-8?B?MWd4azVvcHBKa2Era1hVdjBIUzFqaVNCbytGWW5PWk9YdXJUY21XT1EwOTNU?=
 =?utf-8?B?K1daQytyNFBhcDljSCs2V1JOSVFKS2RaYzFRN2ZXYXNNQnBjN0F5bFpZOFQ2?=
 =?utf-8?B?QUZ0dmhNM0g5N2oveVc5RHpaMDlZbU8xWldrOVFjTkFIUWZoLzJUU0JqbFJz?=
 =?utf-8?B?NENQeVBrSVRKMDdSOGxlOXVpTEFQM244YnlTUm12dW0zSXRvTnUvY0t1dndm?=
 =?utf-8?B?N01HOFBCTXFsSmp0cURKZVUwY3B3VE1UVm13MmFSNmppamdCb0s2SUsrNGd2?=
 =?utf-8?B?QkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3914f20d-8916-49b6-15ba-08dcce8c5f55
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 15:55:47.0595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7NqOAZjL0JmEL0j37tC2nK5VpqxbWleHI3rjjAL8Fo3x9Q9/05uuX3BZIOhSKSgaEb5w9Q4fb1FCyAD/DC9aUYZ44BlwVKxvgIBjbHbzsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8319

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


