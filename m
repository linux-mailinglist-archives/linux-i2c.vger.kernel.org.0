Return-Path: <linux-i2c+bounces-3231-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F3D8B3D23
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 18:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A8551C22914
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 16:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B8D15B974;
	Fri, 26 Apr 2024 16:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b="GGbAw9TQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2111.outbound.protection.outlook.com [40.107.6.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D336E159594;
	Fri, 26 Apr 2024 16:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714150234; cv=fail; b=Jhin9K0TECaIT8WbMVdaRC/1lrYADfDyI9Lvzs6oof5LB/5ZacTJDwuyBQVEPlGRiJTDQ6/z76R3WwKok0EbiZzMJFsaWAlughzvWKqsBUA+jkptMEwDfqqcNjiBS/sKqRcRjkxF04j559HXqX2vS1PNiThJk5fLRluWynXQFBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714150234; c=relaxed/simple;
	bh=yL3X3pWgKTV00wee9halDkGv3N82Pfy4kYhp/F57J98=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QPWcSjTV9+yOI7rj3VswnUuVya2uz4VvcxsV2PaBxklAghhznnUKFAShXY5L2okXeE7FyqSBd7/ys0zSUqUV9+74CFtNcw8W3OJru4V66begAeNPE3zx5iUJ7vkznIfb2iJxGK7jO25LRBnuVLW3kkBvhTQ9CILbUZEVLqdK7Hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theobroma-systems.com; spf=pass smtp.mailfrom=theobroma-systems.com; dkim=pass (2048-bit key) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b=GGbAw9TQ; arc=fail smtp.client-ip=40.107.6.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theobroma-systems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=theobroma-systems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZTiA10mU/pwlP9fiinbQbSgQ+skoRGQTmN+2aS3ziC4wwgs5Suska3lmQzN6sydCejFKe5QnlpwAUzY/iM/4XbcgK8C29nDTNslKweZaROwmlAJ++PTN4It8W6YjvJ0kP8YJ8rkbOGb4lGRFDOhaO9yj9Y1luRWLtMWcwcCeWwO/VA7PDMYt/do1BxzSPinbWuQ3uALWhZerQVC4woWN8AHLSpMO3d3sQv/F3HKsz2FoGPNT0OWH2tnSbDeO5cvIAwBsrCmdSlMSyVo+8fzIKc45ib0I32karUDNR6EUPXXObHhGFgudSyW9Jgl13+H1jW1m/dgi9WKwBqDxckTJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jALs9GKntVlZQTeo6/+1x1V4OtMgbK0DQtN+qnKkdNs=;
 b=HvymQIzM/HqFbcEvU1RpOUssD3hsQXvsS3NdX0OqgsNpsgjs7d8+Q0h2BtRjdXQRLiG9NJyd9IcGQbDFZ3QIQ2CGMCTDd9T8xEcJTEpXi4rPpoPCwFChTdq6Rs73Vw8qyaUnCi8rQ9c5ktMMcc6KZKGg3aBluwyYSF+FmOJIcx54M0m8RY24lcSymqWaxmO9eixNJgWTDf013MdDwX3SrYuJA73BjDqsWXSZ2BMYKjgBErsjgV9CN3p5aqRtgPPEANy2S++sN+wbnnYUBRf4bzsahV6atFqnRWfRVb3MNi9BhbQ+NlQyFrbLO8l7gvLtOs+0+PnfqhZVIQViNV5Z9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jALs9GKntVlZQTeo6/+1x1V4OtMgbK0DQtN+qnKkdNs=;
 b=GGbAw9TQHqUj85sDgjOjkL/PjupDDDae9oq7Nr7bpzzoZ+OHPt4s5meYTukfwsDjRKJp41rQamOa6rTUp/aO7v6usWkKB3FR0bepNBxXcefUnIWUkcnYk7vIQ1k1iytoDsc46o1UPwhaMlvN7/n41a27d6E3T7Uazrkr9wCj8XHOIhgaidS7YVVkhTS4SO9GfMKNYjQGc3siF4VeQHXzxpcZnrmNoLR45BsDjV1NubhzhBomC3501oeTaI+hrcfs5EqNF+x0r4muy0x794JkX4o8Y9yslFoAn9P8NFZlKHxBdehM19qG+C7P5WKq/SryhwJmzI31RoO9w3Fg1rzuuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by VI0PR04MB10230.eurprd04.prod.outlook.com (2603:10a6:800:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 16:50:27 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936%4]) with mapi id 15.20.7472.044; Fri, 26 Apr 2024
 16:50:27 +0000
From: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
Date: Fri, 26 Apr 2024 18:49:33 +0200
Subject: [PATCH 2/7] dt-bindings: i2c: mux: mule: add dt-bindings for mule
 i2c multiplexer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-dev-mule-i2c-mux-v1-2-045a482f6ffb@theobroma-systems.com>
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
X-MS-Office365-Filtering-Correlation-Id: af46b4df-ff1a-4c96-0ccf-08dc6610f956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHRxR01oSGYyd01oMkMyeDBpWGJadUdxQzhpTmJ3azJ4M3lGeCt1VVJIdUJz?=
 =?utf-8?B?bG03UGt0WVdNdjhMWjExS0JzeHFyL2tsSWVDMXdFTjd4NG5IWlVNaFAxc1Fi?=
 =?utf-8?B?YnNORmticmoyWVBLaEtRME9ibThDSE04NGJzQU50NjVhQm81d3MyblJqTlFM?=
 =?utf-8?B?QkZnTUxyVTR1K2I0WWttNTNHT1FKYm5ucnVibE93UHlEYkZWb0ZpM2ordVFz?=
 =?utf-8?B?Ym9WNjU3K2hVaVp6UXprNy9aSHlvQUF1NlFkMkVwOStrSlR5SGlnTHVJaGtn?=
 =?utf-8?B?a2pvTW91d2hqKyt0MjhwWjUwVUd4YndocHBjQkdCSW51NktMankrVjdkSVlG?=
 =?utf-8?B?K3ZhUTlGOWY0VmlkNjNhWlB5YTluS0E5SkxXV1B5a0oxUDNQYUhUb3p4K1F3?=
 =?utf-8?B?N3QxNDloZTBJR3dOVDMycEs0SXR1cHMzWkx5S3hpZzMwek5LbmU1aWhhQ3Jl?=
 =?utf-8?B?V0dWNjhlVXVoWEZwQ1NWbXNSeW1TNGFIaVlCUHVKN3JqQkxsQnhzZi9CNnBD?=
 =?utf-8?B?QVgzYlVCSDVUTEVFSVRHU2JJbXNxUkh3MjYyTmZnZzg5L2lkdnY2bjBLeGRx?=
 =?utf-8?B?TjR1VHRDclFKWmxxL04rZUdWTEk4dUpubVQ4a0VZaTczamVUM3pJdDd1QWlD?=
 =?utf-8?B?Y2FJTHJGdmdlb0Z2Sm9hN2ZtUW9GaDIydEU4OUxOSDFpSUhHUU1YdERMaFpU?=
 =?utf-8?B?U2ErUjZRbC9GL09WQmNQN0pxa3pxTmNvQmYwbVNNYjBERlMxUFZVQkFkWENz?=
 =?utf-8?B?NUpGanU3TG1QNXJ0ZDJvWG5ERjh6WG15UEdYWDZPc2dNbXRYZ05Wcy94YjNt?=
 =?utf-8?B?TGM0TWpqakI0djZjTWlobE5jWlAyR3lud1NtUGtkZTV1MG1FYW5aQTJOV1dW?=
 =?utf-8?B?cy8xUkdGZERucThGRXRVclVqZy8yY0VPUEhNdFh6NmlvUEdONnBuUzRXWGNC?=
 =?utf-8?B?RnZCa2FkNCt6bE9LZDR5SFgza2d3cVJrNWlISWFCQkRVWTU3VzlTUFdjeklu?=
 =?utf-8?B?OExMYUNyUFJZdWdYN2FVbEJuREZya05UNlFhN3ZqckVocDVEYjBaRDRBNVBa?=
 =?utf-8?B?bXJCOENIZFdHYjk5SFVlQ0ZqcHlSclYybG1vZ3kwSTJpbkZFSXZYSjF0OWJH?=
 =?utf-8?B?WmxoY1FLL3phUThmL1paS0dsamtRcjl1eTlxL3pNRzREaFV2S052ZzFJcFd1?=
 =?utf-8?B?TVo3TEVORms4S1l5Y0JsTzhXNyt6UGlDVVhEQ2J2UFlmNkh1TTFLUWkyT2ZQ?=
 =?utf-8?B?R1VRS2hQNjA5SW80OWRDNk9JRGtwQmRBcUpIM2FXQWRBVUEyM1BwZHVPTVBE?=
 =?utf-8?B?aFZLMi9QdHZLNUl6cy9mRVB0T3ZISFZNVHR6VjF0TnlwYzlMdVIzOG9TbXhP?=
 =?utf-8?B?K29CSWNraHZwKytvWkp2Mm1LM3JBMm1ndUJ5VFNCRGxVY01VNlc5U05aRjYx?=
 =?utf-8?B?VnMwVTVxTFc2UkFCZEVOV01HR1VvTDNvY2VwK0VWWmV3eXVrL2RoS2Y0bVdQ?=
 =?utf-8?B?bzZzWGVNRTdVeHI2TFQ1aUt4NEc2VHUwN1ZjYUswOGJFSFdOVTdxUVhLbStY?=
 =?utf-8?B?dlRyQTkrTC9IbFkzRnpaNjI5TUtwWm5pUzZML3VJUWVmNXEwYWcxMTd4UnhF?=
 =?utf-8?B?a2w0WklEVXJTNzNkdHdieEtrL2hvV3BWbVJmMkJ0NjAzMUFpbVlKL0FBb3lU?=
 =?utf-8?B?ZFFxY0g3OWVCWWlJSnU1N0pQRllsbDdRUGRuMWhSOVNGUGFyUjFJQXB3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(7416005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlYyay91c2RaZ29TTUgrd21SVUpBQ0lhSFZzM0xlMVdwa1F4ZEFNU25CV1Rz?=
 =?utf-8?B?cG05ZFptRDJSQXBISGl2dHU3QndTSkRFZk9seGhUNWVNbEdXN3dWMXQ1UG5k?=
 =?utf-8?B?Uzhna3l1Q29PenJEWFJIOU5VUkc0YWJlZGo2QUhNOWc2dUV3NTJPaHlRdTNs?=
 =?utf-8?B?cnl2RHU1a2RuK253NnBVd0NISE1NSzlIZE1OQnN0d3lYbmtWZXB6d3Zyc0Qr?=
 =?utf-8?B?TnFRYlhuaUZvbTRtelYxRGo4ZTRhdElWSk11NlZjblpxeVEwMFVpcHh6TEFU?=
 =?utf-8?B?dEU4YmJGUzkxN2dKaWhMZHAveFlHRkVLQ0NUS0hQTzdENmkrWUc0R3dLbkRl?=
 =?utf-8?B?R2JrQ3pWT3FhdWxjekdiTjF6NldPdksvYWlTSGl3L3ZGcUlOZFVxWlRYOTlJ?=
 =?utf-8?B?d1UvZ1J4QW8yMmNCQi9Eb0RUaU5EME5CMHcrZHd1OWsyWHFFZHRjdERqMm5v?=
 =?utf-8?B?N2wvM3h4bEZoTXQrVWNZQnVydnZvWjZGRERyNDVzMHNZQ09YUGU4WHdvVnpq?=
 =?utf-8?B?RVBsc0s2cStDZ2w4bzJ5ekxWK0xraU8zaTNhNnFxVWdCRi82WFpmcjBsWFdh?=
 =?utf-8?B?eFM5NzYrTHBLdWFLQk1ZQSs0SW04cXJHYmhmRFZkU0phTytOYm5xdHBqb3Q3?=
 =?utf-8?B?dldseGpNcys4QzVIMExRaTBzdEloZFRMWENVdU1FeXBzQnRKMGVnSWJha0cy?=
 =?utf-8?B?azVGbTZrbGpOd0I2WmNjRU1HY1NNdWVLbFpJcGN1QzA0R09ndkptdnErOEFC?=
 =?utf-8?B?V0tZMjk2WEhheVhLdjhXNVdRNGdvQlk0cU4xUkdleFFGSGZWb1pwMVdiT01r?=
 =?utf-8?B?VEpzTU1ZSGZaMkNXcndnUFFhc256bzJtcEZuREVBajVDZS9DOERKdkVKRUg2?=
 =?utf-8?B?QklVN3V3UHhJRzNXcnMyeWpES2p0dWlMei9ZeDZONGpVVlgzTWM4UlhMS0tO?=
 =?utf-8?B?cGMyZ3VvTXVETy9aZEttNWF0Mit2VGdLeWs2OE4vSFpXL21wdVdwVjhONXpx?=
 =?utf-8?B?NGc5WUlVZ0xMYTRKM2w3QWVjODVhdElub2RLY1NqdnB2S24zdkV5akFoeDUx?=
 =?utf-8?B?c01xZy96NEhFLzVZcGhpUzBNUDBnNWVRSHJrb2c5NlMvYU1xREI5b1IydmlE?=
 =?utf-8?B?WWZ5dVpITTRFWk1EYW56L1RXaWxHai84LzhwMU5XS29WZnZUZlo3SVhJL21L?=
 =?utf-8?B?R2FUZVU1Lyt1c2ZBY0hHeW1uWlZDWHpRZHhkS0dhZTBib3l3NzZNTG1yZHdi?=
 =?utf-8?B?N2xMQ0FJd1B3ZWhTc2ZqenBpWlVLMkllNHV4b2lBRHNWVFExSk9yaUMwQm9n?=
 =?utf-8?B?NTN5VzMrYXQ1UERqMFBNMjVQcDJQQ0RuN2FHM2ZHUEEwVE90cFArcEtzVmVv?=
 =?utf-8?B?TG1tM1VJYXhRS1VHSUZxWTJ4eWhQRm44bVI5eW5jVGdTSnFESkl1d1RWeDRs?=
 =?utf-8?B?T01XZ2FNcDNqcjYzVDlQSjVZbDVaOC9oZEZacHh4c2VmbFA3SHVsS2ppdmhq?=
 =?utf-8?B?QXk3ZHhPK0xha1RWanhyQTdFVVVWVWw0SU1aenR0SmdSRXpUWmEzanlUV1Rs?=
 =?utf-8?B?RW0wR1NvOXFVRWJjRytmcFVLb1BaRHFDZnBxSThNc29hcDRUUCtvNHV2YWFJ?=
 =?utf-8?B?clZpV0hreGVXYlFqeU1jZnN6RzlmYTBYQnZ1eUh3NUtESUtUZENTekF2YkJa?=
 =?utf-8?B?b3JIeHk2UHpJYUJIdHlqNi9uRGc0Q2VsN1V6UVVyaCtkREcxQ2dnRGIzelNQ?=
 =?utf-8?B?SmRlU0QvRDZ3RGR3U0xLTlovM05uMmcwd20weTBvQTNndjlMS2NQMFN1WUJq?=
 =?utf-8?B?UTdOSUZ0MFV1TVJUTWNVNkhVaFNlb3ZMSW1lVitNNVUyUHR5MnRlTnBqSDFn?=
 =?utf-8?B?c3oydEpxV0QrOFNMR3ZMcElldjlCbHByb1BxeGRGc0pHbytRdW1zZkplZkFr?=
 =?utf-8?B?MXYweUIxU1l4akpJSlBKdW5PNU9wNFlMbGwyWklsbHFFc0dyNTduL3VTanpn?=
 =?utf-8?B?RzBhcWF1RXI1NXBhaXJCc1lOcTVkODJTQ3RvcmZWZ0JZSlhrNVJqWHNZMXJK?=
 =?utf-8?B?elNCT2Y4a3NROWovQ05XN2dUaUdwL1EvUnBmTjdZUmlwZ1NoM3ByTm0xemV1?=
 =?utf-8?B?dXIvdVNJb0JDVVVHRExyMEN0RCtmZ1h5am9NQStPSmhTZG8xd25QLzJCOWIw?=
 =?utf-8?Q?Ok/XhQeydK8ygQRZEB2oth4=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af46b4df-ff1a-4c96-0ccf-08dc6610f956
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 16:50:27.0357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UEfeJGkXKgeKFCwo4RCRiluJhh1vlMIspGuJWNh/vlBw/OdXtDvBr4DWadWoSi2fIcu0AATlzPet0th2WfgRSdzJqz3zYmcmJ0uUzzxgDnZJgZAzxYH2EwJHoFVQVlFD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10230

This patch adds support for the Mule I2C multiplexer.

Mule is an mcu that emulates a set of i2c devices which are reacheable
through an i2c-mux.

The emulated devices share a single i2c address with the mux itself where
the requested register is what determines which logic is executed (mux or
device).

Signed-off-by: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
---
 .../devicetree/bindings/i2c/i2c-mux-mule.yaml      | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-mule.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-mule.yaml
new file mode 100644
index 000000000000..458e4661cbc8
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-mule.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-mux-mule.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mule I2C multiplexer
+
+maintainers:
+  - Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
+  - Quentin Schulz <quentin.schulz@theobroma-systems.com>
+
+description: |
+  Mule is an mcu that emulates a set of i2c devices which are reacheable
+  through an i2c-mux.
+
+  The emulated devices share a single i2c address with the mux itself where
+  the requested register is what determines which logic is executed (mux or
+  device)
+
+      +--------------------------------------------------+
+      | Mule                                             |
+      |    +---------------+                             |
+  ------+->|Config register|----+                        |
+      | |  +---------------+    |                        |
+      | |                       V_                       |
+      | |                      |  \          +--------+  |
+      | |                      |   \-------->| dev #0 |  |
+      | |                      |   |         +--------+  |
+      | |                      | M |-------->| dev #1 |  |
+      | +--------------------->| U |         +--------+  |
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
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        i2c-mux@18 {
+            compatible = "tsd,mule-i2c-mux";
+            reg = <0x18>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            i2c@0 {
+                reg = <0x0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                fan: fan@18 {
+                  compatible = "ti,amc6821";
+                  reg = <0x18>;
+                  #cooling-cells = <2>;
+                };
+            };
+        };
+    };
+...

-- 
2.34.1


