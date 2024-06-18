Return-Path: <linux-i2c+bounces-4092-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6E490D88D
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 18:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2C5A1F24397
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 16:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0AB146013;
	Tue, 18 Jun 2024 16:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="n8ZaK3ZT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2123.outbound.protection.outlook.com [40.107.22.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7266413DB98;
	Tue, 18 Jun 2024 16:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718727005; cv=fail; b=gIQa3xRv0bS2OtyMyBw1nDPMYJGzOZ+gdjoWhvzdJYiagivn0M9rZ0d5CLBLVSEz4Be/EMgw97vIJ5he5occrhOIryYpQl3t1Qy+V3mUBAAdh2ro0O/+0KR8zEfwupRGqnZJRSGhY6A4DJnLbDPLoytn1EszJ0Yew53ICHKlo/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718727005; c=relaxed/simple;
	bh=1zZ5WNyFH/Fv4Uevn7d2BC7kYXf02eiud9FkbAVOCb4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=r7HFOXrZzDThYw6yPhUjlgHrQoOITKI1pyrQgUKPg2fE1o1MaRMgtsPfln9lrzAwaO48QUqG8zcNWiTIvtf/pmbgAM6ZvlGCSxGvMYOCjsn+Hr+Rn6frrXtnu1s9hjSl+6LY23zbKqdJb31qzPiT62Ec6Xq7e1/CjIACPzjtkek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=n8ZaK3ZT; arc=fail smtp.client-ip=40.107.22.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjLSlvE1CSB6oF6LbzoXYnaL78ccbTir5K+iXJhqmMOEUVQ78O4P6F6Vfgcu01NowazbKF/cYrMd1LWr/Nf39jBl/VrRoHC/bOVS/txSw0fmrvULXNY2WHetGlKDnru2AKClpioCADY1jWCaiwrLEvnOzgvernrTxWDDorgHpicLzyjhLR6IGBVA/amhj8NHBoCpSvsIyBduqHduvHFutfO9l3Vnw+T5C7KbQJCP2HWAUqzrvLKnT4FVNV8IXmFl7ctLSIrEGfOLn0YaYVzab7+cSHjr/HfPZsn49NgLvO6mbZP0BTAu1lH/F0n532aivHVfrw2t0kpG+XGrG/kOHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbH/oOXAHGDDIyZmStMPkQp0S13FGoi5kTrrdXpMzQc=;
 b=X73gm/q8tZKxt8JMGi56KOE9xYj6G86xmm/TjVnZZaXkNaCCnhT84Fl5M3eogW2Afq5q1niR9o7npfem3Ah/JWOMk40qPu6wbDNv1iP8oKqfp01XUEeyVJzi4rZdDtT6di7qKVAkhqLrwnpPv30txhqhttfRGltzediQ+/oHml4ayR6hbnqykGD6I+QT/q+wyK2dAxLxfmBm4id2WTAiscp6EPimcgkxMQ9xTkgGA9uiYDcxt3QsTkU+M1f7bOe62PZrZi6Otl/HFGp3SRIX3K4ClXKwyEmrRnk16vyBqgZhd8ZyCX+It4ZeAkJg4h1acRW574LXB0I8P+orV8UT3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbH/oOXAHGDDIyZmStMPkQp0S13FGoi5kTrrdXpMzQc=;
 b=n8ZaK3ZTGGoAcjoDWNsLF2tileQPX+l/rJYw1vfcj8dp3fbPSJVBcKmpjmGwUVgUew3N+vqu6u2m8QWUTfqyqdQajc9MUgAV2+zasWbcWV4YGKaJmuTibEglS3/gjdllmThlB98oK65D8s8Pu82YFhOAUz8wAhZ3gjvl6MEhT48=
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
Date: Tue, 18 Jun 2024 18:06:44 +0200
Subject: [PATCH v4 2/9] hwmon: (amc6821) dev_err using amc6821 device
 struct
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-dev-mule-i2c-mux-v4-2-5462d28354c8@cherry.de>
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
X-MS-Office365-Filtering-Correlation-Id: 95f61f70-7e7a-43ba-9572-08dc8fb113cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|52116011|7416011|376011|366013|1800799021|38350700011|921017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1FqMklvb2h2c2hFcEdBeC9jaGE2NkRUWGI2V0JxY2FMdkl3S0xlbXlsRk5v?=
 =?utf-8?B?UkFnREY3RmhlOWFoMW1Cb3JEVEc0RWpUYTdjMHhjRldlVGtYcWtiSysvNmlq?=
 =?utf-8?B?Y0Rhd2pqL0NOUUNlSVVEN0NGV3lTWjgvc01la0M0MU9ocHNKZmozU0FLZWtL?=
 =?utf-8?B?ZG5laUk3YWNybEVmZVNVQkpmS0crcU80bjR1ZW4yVW5WK05jVHEyQ2RBcUxN?=
 =?utf-8?B?QUgvRFZLSjRiUDY5aGNlWHVjTWpEMHVHbXV5dTZVU2tjOXlILzljamg1NW5Q?=
 =?utf-8?B?VTJ0ellwZjB2NHBleWVrSVNOYVJ3dGhDdXVjMFl6djJYaEJXMnpvemp5Nklo?=
 =?utf-8?B?ZmsrQWdwZndzdnZQTjg3VU55WWc1Y2pjY01yelRwUm9zVmJSeVVUanozQ2Z6?=
 =?utf-8?B?Qmt3TjJNb2F2RXhYNi9LMmFiN292T3dkbmM5U3VRYk1LbGFCT1duN3dLVVZo?=
 =?utf-8?B?dGhVN2Vlb1p3cWNaeEd4ODVNd1U5QTZ1WS9uWXhlU01ha2w3Ynl4UThMajNh?=
 =?utf-8?B?QzE2NUxITmRKOTBDNTFmdGMyQ0ZoSkFHTStoSmswU01FelRvS1BzYk00N1ZN?=
 =?utf-8?B?amtGOUZUdU95azZrWEdadmJtSWkwNEdtSjlqQ0IxekY1Y2JzYmhWU3ZJdi83?=
 =?utf-8?B?c2o5TFhFaVhQTTA3eE5zOXNIc2xMSDJURUFicS8xRnFFY1Z4UTlBTklyZzJ5?=
 =?utf-8?B?YW1Cb3hGaExtN3FvamltYTFkLzZCSUcxMWtuQzBxOGFUZS91b29Ddm5saE9U?=
 =?utf-8?B?eXM4UzlwTUFwdjI5VjFWcS9kK1h2aURvcnhnWFI0UlRRR0J1cUsxZlhXMlZL?=
 =?utf-8?B?TWV6OUJ3dnhKcEdYOHRHR3FIem9xS00xOWQ0aGNJRzJXVXRMWkZNeGkrck9H?=
 =?utf-8?B?WFJwNGl4UHRCdFY3eTlrRi9rUWYycDBqVFlSVCtVN2JQN1dXZzA1TUVMeVRH?=
 =?utf-8?B?M3puYTlOV1YyZm4yZFEwNWZsWnhuL3Q1cjgvTmE4N25tUi9KMWZYNkRZOTc5?=
 =?utf-8?B?YkpOdW9sMHA4QWp6NWd6TklsRlBBdG8xOElGaHpwRlpkVXloZzQzeGd3NGZw?=
 =?utf-8?B?b0w2alVLb2dOS1VkSlhBQ2ROdisxTE50Y0hGNXNVcG9lV1lEYWRZcEVDUlV4?=
 =?utf-8?B?emlRZ3BwUnZUTUt6ZHQwTUZlQ2FSc2M5RkxZTnIyZS9hVjRsdVVZMUZPUGlQ?=
 =?utf-8?B?RjJTeGhoTkJmcGc1L0pocUdWSTh4clNHamxkTS9jajVnUHN4dCs3QjFzWWd4?=
 =?utf-8?B?NmJENUg3TEFkUTB2U0paeEhnZGdMKzZEM3lPd1VIcFZDSE1Gb0JaYXUzWndn?=
 =?utf-8?B?NmxpOGdnTVJPVWJZTnRhVmwxRTlZTERFU3hYd09wdlBCRWhldllLRHQvNDdR?=
 =?utf-8?B?djN5RlZvKzhOeTc5ZUNyODJ5dkZyQ2tBcVh1Q3A5Slpjcnh1d2xJaDkwczJ6?=
 =?utf-8?B?cXM1WkZDZjBRR2g2dnArTXlPK0YxR1lNeDN5R2lINXFKaUU5TFRwNnk4ck5Q?=
 =?utf-8?B?Znc1Q0YreG1ac3dCVzZJMjgxSlFXM2k0bG1wSHd3WmNZMnhFcm91dVVmL2Uy?=
 =?utf-8?B?N1ZOT01jNnZteXhlb1FPajVEUEhMS21qNWJ4ZWZhQXNQQzdzQkdmYW4wbzIy?=
 =?utf-8?B?SG1VYkRoQjkvMklMTWpNNEhuVGJmQWx0R2tna0EvNXBxbVI1RlZxU3VicEJm?=
 =?utf-8?B?OStwR3pLR2h5bytaZXNqUEpCQzhaS3F2dWJTR1VMc1l3SFVUZGcvTmhyNkhL?=
 =?utf-8?B?Rk1ackdyWWRtSWt2aHJBM2pyLzN2UlVZMUE2UFNFTzZqNjM3VmtNOWJwaXJJ?=
 =?utf-8?B?SFRFaDNBNHozTGNreWV5QndRWmlIcGdtNlJFOEV3TC85bFdPc2VTZU15Ykov?=
 =?utf-8?Q?sJ543PmLReRLe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(7416011)(376011)(366013)(1800799021)(38350700011)(921017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXJYWnl2NUQ3b2o2SDNseGhhZFlRUzd0dnBmQUhJZ0tTZVFMbTE0NUlGZ3dH?=
 =?utf-8?B?eTRCWkl3eXFmZDJQRzdNWkgxbkt5UEdSYTNDMWExbHBUamdSRXhFNlQ5Z2RL?=
 =?utf-8?B?RC9JcE1zeW96SWVuRml5L1hOME9qR0RILyt3VTViRmx2dWxJWTFUWERwVVZ3?=
 =?utf-8?B?K3RZdGhzMFhUSmRjbC9VaDVjdllQTHJWaTl4L0hCeXFhT2UwVHFMczg1bmRV?=
 =?utf-8?B?b0pwV0Njd0lmbXlLVlFJM3Zvdkl2dVArVEowOUlCSzdPR0dHVUI4aWVPVEd2?=
 =?utf-8?B?Z0l0cWVUMGFUK0lPTUNaVnh1UUVIWEdLc01FNzBVejhYdnppejNZZ3VyaUZh?=
 =?utf-8?B?K0I3eVNjdzBFcHpZMVRTMzRJbTJLZjlpQlBQb0l0NDVVY0xTZk9Yc0w4a3k4?=
 =?utf-8?B?LzY5MGNQOTZhdWNzUVJ6MEZnc2JVdjdZTzJwV205Ly91eXNXRGl3bUhyU1RU?=
 =?utf-8?B?TlBEUUpENXEvMDIrS1AxZXVZMVNBSU9VaW5QRDZXODAzSStKR21JK1hXUm1B?=
 =?utf-8?B?LysyMGlLT0RMdStXZHZ6NlBvZk45SlI1UDhwQ3ZVSkRUNE5WMkx3TjVIY0FN?=
 =?utf-8?B?N0dXRzdYYmdVNzBOUDhrN1lINDdhWTJGL3c3UjV2WFI0blBNdDFlMThoYWhK?=
 =?utf-8?B?VTRscmNGNEhFREdkWnNYQ1RVMHJnVEpXaVdWWXYwa2pERVB0ZGlKSk14aExB?=
 =?utf-8?B?YjZOWG5welBxWkNrRTBLd1QvK2ZKb3praUROUUtnNWNjU0haZDk3RnNNQTRP?=
 =?utf-8?B?ZVBzUFF2WlVWSDI3bDh3V04ya2RsRFNsRDI3eHRYNGRlZ05vK1JDSng4NmR1?=
 =?utf-8?B?bEd0VndVRHNXV2kxM05GZllMOTMvME5BU3hFZVltR1pYSk1sQWZrQkVKZDRC?=
 =?utf-8?B?REhmaUU1YWQwMThuV1VJSmlFcDF0VnNuMVV6clFvTnh3Q3RsNzZIdi9FNUgz?=
 =?utf-8?B?dUZJZkhSbU5mZENVSXRFTUgxVm5UcUpTaHNaNjNwK2dXYjBmVGlSWEl3VnVZ?=
 =?utf-8?B?cVlNR0J0ejR5NmJZN1p6ekZUVWFpUjZuNkh0ZGI3NHhCTGFoS1FzN24yaGxp?=
 =?utf-8?B?VjFuaEZkNTdqaDkvaG9PTlJONmNnRThqSGdmVjVwNkQrRWtzTkJjS24vVHF2?=
 =?utf-8?B?RHkyS2IxT3o4UEdZRUJOR0tvUmF3RnFzNW1nTDArNytJYmVDRHBQL2pHblkw?=
 =?utf-8?B?dUZLaUQybkpETi9CaHJscTcvWVdzZHJSd0toc1ZaODNQUGM5Y1h5QlVSSzNE?=
 =?utf-8?B?QXJtUFh6SzJDK0I3MCtId1FUOEFzckREOTAvdEFRMGdWLzFoeE1Ya0h1MHE2?=
 =?utf-8?B?OG1TWFdRdHpOU2Z1Rnpwd3EyR3BCNGw3QW0wU0QwdThlOW1hWFpYY1NMMEVT?=
 =?utf-8?B?U3kwUVZhUFY3YURWVEFwODlJNm9KdXJPMXdqL2lZL0E4UmMycXFid3JPNWkv?=
 =?utf-8?B?bWJCN2NxV00zUGlJckJtQ1ByVG9SVWUwcjVXNHpZQjJpSG13NWxUNFI3dGJC?=
 =?utf-8?B?b1JTQ2RWMHRmdTQwa2l4ZFFKSzN5Ui81Q2R2U2kvVUxzMFBTN052c045Vmt3?=
 =?utf-8?B?NU1kWjN4TEorcUh4ckVwemM1V0FObDI1VTgyZVJ5dFRxOTI2bjFmUzhqNjY3?=
 =?utf-8?B?a0hnTlhzWnRMOWlPWkhNTmgzYUZEQnBGa3g3c0xHcUJBcGdSVFc3UVBXRkFh?=
 =?utf-8?B?R0Y4L0s2clBhd0pBbEliOXlDczEvWFRVN21OS0dkZHpMbHV2d2hNOW9GUDhy?=
 =?utf-8?B?MVQvcS9MdW1lM240UFN0Y1F0MlNQY1JUYXA5RW12T1hpZFlLdHlPZ2wxRkFS?=
 =?utf-8?B?U0o5bXhDWFJBMHZCbTZYWnVOc1ljY1ZYRFZaVnJYbmZVRjNZNnFaalc4R0lS?=
 =?utf-8?B?bS85WEVOMDJ6dEcxQ01yNzYvMlhHamJwMzZMSEg0VVBIUnNOYU9pK0dQMGVr?=
 =?utf-8?B?ZklFelFlVmN6bXcxSjJKUnB5MUNXVHJqblFXSktnaDBjTGMydUdIMHBqQ3JI?=
 =?utf-8?B?UjIzOGszaWJhU1phRGJ5NWpxTHh5OGtHRjFsenFiVWxNdnVBYTE0Q1h2a0tV?=
 =?utf-8?B?WmFRTWd3VEFSUk9vZmFFOElaWEhKL3FJKzg5ZGRPKzRIcjJFd2xDWm5kdGxK?=
 =?utf-8?B?R0E3RGxraXhpRklidFVJSU4wclZnWHZycU5oOFU1UC82WEs3dFhDTTlJY2ZC?=
 =?utf-8?B?YUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f61f70-7e7a-43ba-9572-08dc8fb113cf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 16:09:48.5399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLBJof5A25VOZb534V4uYZkYRKYHr/cExC3MaYtzC2tj69/bYoJm/PPUxb+92GjrkCYQivIQmkNDjOAnDNhO9H9OSfOuhFRYgZEWexUk82g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10642

If probed as platform device, the i2c_client.dev is the parent device
(eg. MFD) and not the actual amc6821 device. Use the latter to log errors
instead.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 drivers/hwmon/amc6821.c | 62 +++++++++++++++++++++++++------------------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index 464991fd7fc9..17456d7c7cfe 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -290,7 +290,7 @@ static ssize_t temp_store(struct device *dev, struct device_attribute *attr,
 	mutex_lock(&data->update_lock);
 	data->temp[ix] = val;
 	if (i2c_smbus_write_byte_data(client, temp_reg[ix], data->temp[ix])) {
-		dev_err(&client->dev, "Register write error, aborting.\n");
+		dev_err(dev, "Register write error, aborting.\n");
 		count = -EIO;
 	}
 	mutex_unlock(&data->update_lock);
@@ -389,10 +389,10 @@ static ssize_t pwm1_enable_store(struct device *dev,
 	mutex_lock(&data->update_lock);
 	config = i2c_smbus_read_byte_data(client, AMC6821_REG_CONF1);
 	if (config < 0) {
-			dev_err(&client->dev,
+		dev_err(dev,
 			"Error reading configuration register, aborting.\n");
-			count = config;
-			goto unlock;
+		count = config;
+		goto unlock;
 	}
 
 	switch (val) {
@@ -413,9 +413,9 @@ static ssize_t pwm1_enable_store(struct device *dev,
 		goto unlock;
 	}
 	if (i2c_smbus_write_byte_data(client, AMC6821_REG_CONF1, config)) {
-			dev_err(&client->dev,
+		dev_err(dev,
 			"Configuration register write error, aborting.\n");
-			count = -EIO;
+		count = -EIO;
 	}
 unlock:
 	mutex_unlock(&data->update_lock);
@@ -459,11 +459,13 @@ static ssize_t pwm1_auto_point_pwm_show(struct device *dev,
 	return sprintf(buf, "%d\n", data->pwm1_auto_point_pwm[ix]);
 }
 
-static inline ssize_t set_slope_register(struct i2c_client *client,
+static inline ssize_t set_slope_register(struct device *dev,
 		u8 reg,
 		u8 dpwm,
 		u8 *ptemp)
 {
+	struct amc6821_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
 	int dt;
 	u8 tmp;
 
@@ -475,7 +477,7 @@ static inline ssize_t set_slope_register(struct i2c_client *client,
 	tmp |= (ptemp[1] & 0x7C) << 1;
 	if (i2c_smbus_write_byte_data(client,
 			reg, tmp)) {
-		dev_err(&client->dev, "Register write error, aborting.\n");
+		dev_err(dev, "Register write error, aborting.\n");
 		return -EIO;
 	}
 	return 0;
@@ -525,7 +527,7 @@ static ssize_t temp_auto_point_temp_store(struct device *dev,
 					client,
 					AMC6821_REG_PSV_TEMP,
 					ptemp[0])) {
-				dev_err(&client->dev,
+				dev_err(dev,
 					"Register write error, aborting.\n");
 				count = -EIO;
 		}
@@ -544,7 +546,7 @@ static ssize_t temp_auto_point_temp_store(struct device *dev,
 		goto EXIT;
 	}
 	dpwm = data->pwm1_auto_point_pwm[2] - data->pwm1_auto_point_pwm[1];
-	if (set_slope_register(client, reg, dpwm, ptemp))
+	if (set_slope_register(dev, reg, dpwm, ptemp))
 		count = -EIO;
 
 EXIT:
@@ -568,17 +570,17 @@ static ssize_t pwm1_auto_point_pwm_store(struct device *dev,
 	data->pwm1_auto_point_pwm[1] = clamp_val(val, 0, 254);
 	if (i2c_smbus_write_byte_data(client, AMC6821_REG_DCY_LOW_TEMP,
 			data->pwm1_auto_point_pwm[1])) {
-		dev_err(&client->dev, "Register write error, aborting.\n");
+		dev_err(dev, "Register write error, aborting.\n");
 		count = -EIO;
 		goto EXIT;
 	}
 	dpwm = data->pwm1_auto_point_pwm[2] - data->pwm1_auto_point_pwm[1];
-	if (set_slope_register(client, AMC6821_REG_LTEMP_FAN_CTRL, dpwm,
+	if (set_slope_register(dev, AMC6821_REG_LTEMP_FAN_CTRL, dpwm,
 			data->temp1_auto_point_temp)) {
 		count = -EIO;
 		goto EXIT;
 	}
-	if (set_slope_register(client, AMC6821_REG_RTEMP_FAN_CTRL, dpwm,
+	if (set_slope_register(dev, AMC6821_REG_RTEMP_FAN_CTRL, dpwm,
 			data->temp2_auto_point_temp)) {
 		count = -EIO;
 		goto EXIT;
@@ -626,13 +628,13 @@ static ssize_t fan_store(struct device *dev, struct device_attribute *attr,
 	data->fan[ix] = (u16) clamp_val(val, 1, 0xFFFF);
 	if (i2c_smbus_write_byte_data(client, fan_reg_low[ix],
 			data->fan[ix] & 0xFF)) {
-		dev_err(&client->dev, "Register write error, aborting.\n");
+		dev_err(dev, "Register write error, aborting.\n");
 		count = -EIO;
 		goto EXIT;
 	}
 	if (i2c_smbus_write_byte_data(client,
 			fan_reg_hi[ix], data->fan[ix] >> 8)) {
-		dev_err(&client->dev, "Register write error, aborting.\n");
+		dev_err(dev, "Register write error, aborting.\n");
 		count = -EIO;
 	}
 EXIT:
@@ -661,7 +663,7 @@ static ssize_t fan1_div_store(struct device *dev,
 	mutex_lock(&data->update_lock);
 	config = i2c_smbus_read_byte_data(client, AMC6821_REG_CONF4);
 	if (config < 0) {
-		dev_err(&client->dev,
+		dev_err(dev,
 			"Error reading configuration register, aborting.\n");
 		count = config;
 		goto EXIT;
@@ -680,7 +682,7 @@ static ssize_t fan1_div_store(struct device *dev,
 		goto EXIT;
 	}
 	if (i2c_smbus_write_byte_data(client, AMC6821_REG_CONF4, config)) {
-		dev_err(&client->dev,
+		dev_err(dev,
 			"Configuration register write error, aborting.\n");
 		count = -EIO;
 	}
@@ -815,7 +817,7 @@ static int amc6821_detect(
 	return 0;
 }
 
-static int amc6821_init_client(struct i2c_client *client)
+static int amc6821_init_client(struct device *dev, struct i2c_client *client)
 {
 	int config;
 	int err = -EIO;
@@ -824,16 +826,16 @@ static int amc6821_init_client(struct i2c_client *client)
 		config = i2c_smbus_read_byte_data(client, AMC6821_REG_CONF4);
 
 		if (config < 0) {
-				dev_err(&client->dev,
-			"Error reading configuration register, aborting.\n");
-				return err;
+			dev_err(dev,
+				"Error reading configuration register, aborting.\n");
+			return err;
 		}
 
 		config |= AMC6821_CONF4_MODE;
 
 		if (i2c_smbus_write_byte_data(client, AMC6821_REG_CONF4,
 				config)) {
-			dev_err(&client->dev,
+			dev_err(dev,
 			"Configuration register write error, aborting.\n");
 			return err;
 		}
@@ -841,18 +843,18 @@ static int amc6821_init_client(struct i2c_client *client)
 		config = i2c_smbus_read_byte_data(client, AMC6821_REG_CONF3);
 
 		if (config < 0) {
-			dev_err(&client->dev,
+			dev_err(dev,
 			"Error reading configuration register, aborting.\n");
 			return err;
 		}
 
-		dev_info(&client->dev, "Revision %d\n", config & 0x0f);
+		dev_info(dev, "Revision %d\n", config & 0x0f);
 
 		config &= ~AMC6821_CONF3_THERM_FAN_EN;
 
 		if (i2c_smbus_write_byte_data(client, AMC6821_REG_CONF3,
 				config)) {
-			dev_err(&client->dev,
+			dev_err(dev,
 			"Configuration register write error, aborting.\n");
 			return err;
 		}
@@ -860,7 +862,7 @@ static int amc6821_init_client(struct i2c_client *client)
 		config = i2c_smbus_read_byte_data(client, AMC6821_REG_CONF2);
 
 		if (config < 0) {
-			dev_err(&client->dev,
+			dev_err(dev,
 			"Error reading configuration register, aborting.\n");
 			return err;
 		}
@@ -870,7 +872,7 @@ static int amc6821_init_client(struct i2c_client *client)
 		config &= ~AMC6821_CONF2_RTOIE;
 		if (i2c_smbus_write_byte_data(client,
 				AMC6821_REG_CONF2, config)) {
-			dev_err(&client->dev,
+			dev_err(dev,
 			"Configuration register write error, aborting.\n");
 			return err;
 		}
@@ -878,7 +880,7 @@ static int amc6821_init_client(struct i2c_client *client)
 		config = i2c_smbus_read_byte_data(client, AMC6821_REG_CONF1);
 
 		if (config < 0) {
-			dev_err(&client->dev,
+			dev_err(dev,
 			"Error reading configuration register, aborting.\n");
 			return err;
 		}
@@ -893,7 +895,7 @@ static int amc6821_init_client(struct i2c_client *client)
 
 		if (i2c_smbus_write_byte_data(
 				client, AMC6821_REG_CONF1, config)) {
-			dev_err(&client->dev,
+			dev_err(dev,
 			"Configuration register write error, aborting.\n");
 			return err;
 		}
@@ -917,7 +919,7 @@ static int probe(struct device *dev, struct i2c_client *client)
 	/*
 	 * Initialize the amc6821 chip
 	 */
-	err = amc6821_init_client(client);
+	err = amc6821_init_client(dev, client);
 	if (err)
 		return err;
 

-- 
2.34.1


