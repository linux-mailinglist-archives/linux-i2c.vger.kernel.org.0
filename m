Return-Path: <linux-i2c+bounces-5062-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EBB93C2F1
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2024 15:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 375881C21261
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2024 13:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5CB519CCF4;
	Thu, 25 Jul 2024 13:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="DYnb1rOS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2103.outbound.protection.outlook.com [40.107.249.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425BA19B3D7;
	Thu, 25 Jul 2024 13:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721914105; cv=fail; b=Zotc5VEQnahHTjorA0fYfUUb2D/p8x+bmfMHAO0xPYinz+96WL3iM7CseM4jjAB7J6ds9kXTmIeZnSJBv6uZThtT7jT7Bo4dVozMt+sw9XDPO7GYP4GNkyL1zELBau/E+wzwzQ6bZoGWfFadFfKgWSDcFm5aDJOUp4xxEimUA1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721914105; c=relaxed/simple;
	bh=Zlqt5azgd4xZQW763Hg9DLSk8bsjR2fcoSM1biuGzLU=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=U6uCtGn5aTbXwKDVifr4Zc8R6tzGjcBF5t5GwuSGKnh1ON1FkCsNl+J+Iq6jpIMamhkh3FggwlO8MWSpOKkzoWggsuyWxWXHxZyACH619WKHn1LnIBK8PAS29K2b6ZuMPM9RzhuxvUpLLt3VVea3i2O+lUnsnrhbIntX8FM8vSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=DYnb1rOS; arc=fail smtp.client-ip=40.107.249.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhFsSJaH536XP6tEWl9jt1YbRhUmnlR4oqO+JvPJLOdwJcNsR4DM9EDhqa7BUp7LoKX5vv3Zk1ctBc8Sg2tycqM8ExkgUWEpq27rvoYZ/c96nMynNmeh1sBdUv3KOYmLPVwDKLLTkDzpLE3oTKUssYR24OOFc9dvRJ8dkIQlCh+ua0aXj0v0osDV01piHAjS8sI93Y1gLBJ4YFLJUz5ry82LmnUOgrssAYzYCsRcCmo00J2AH9l+FEldYWkPD6V10upB6JYBIhujXISmIAK+YBPP5r2ULVWFNC8w8k9sQTbf6X8pwYEQZDPTUlWis1yPd1VBwUrIowmQFycz++GJ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcI2y59ZncmqVCISnBYMWBY75e61+QC84/pGME5QrAs=;
 b=egGjqnekbVLDAcWvt2ogZk4xjnAxhpmbDAjExI8HI7YZtqWLjGT9nc1YC35PMv9OB9IlhL2CVDzFCGKwVRcTBb6dbVmqJA6820InUvQqY/wD259Mk2xZ2hR7RAPymYqkueX137ZqQuaGx86ejMQuPpV9uqboGD1CmwHlpikgT78IFcxDGjnlIXRqxoeSbo1z4OS84Q/hFTCU5aaUyiU/VhypxV1CJgVVWUiQgGLvO19hmSkC7z/orUvheOEO9lsBOqw51dwj+a3pKjJJRKp8EUyA5fTf5OCuIlM+QAXU6Vil58jU82dtSr8SMnr+Dn8JAhjZv4zVveIpFiP4jspFNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcI2y59ZncmqVCISnBYMWBY75e61+QC84/pGME5QrAs=;
 b=DYnb1rOS1unD7S1Tfh/yi0/w/7s4oQt8+KauSFK5evaCdW0X58FaYQGyCWoqpf5wLrxvoZgthxbOW+6h31/K9kH0BpTqtWgUYR0ZRhXBsg2tbNqDT3F83LOhhjOL6s4luL/IEEge/Kk62wAnXFlOMKd4RPx22Yiic7/RRrTrAcc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by PAXPR04MB8287.eurprd04.prod.outlook.com (2603:10a6:102:1c4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 13:28:15 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%4]) with mapi id 15.20.7784.016; Thu, 25 Jul 2024
 13:28:15 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Subject: [PATCH v6 0/8] Add tsd,mule-i2c-mux support
Date: Thu, 25 Jul 2024 15:27:46 +0200
Message-Id: <20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANJSomYC/23OwW7DIAwG4FepOI/KOECSnfoe0w4EzIK0lAky1
 KjKu490kzJtkS/+Lfmz7yxTCpTZ8+nOEpWQQ7zWoJ9OzI7m+kY8uJoZAkqoxR0VPn2+1zna2tx
 4L6CxjqAFFKyufSTy4fYgX15rHkOeY1oeF4rYpj8Y6v9YERw4SGVkh157P1zmkeKQ4mR4XvJMU
 z7bOLENLrhjCo4wrJjphe2V9Fq59mJHSmk5O/oGmh3QQhwAzfZN51Ab7AhA/AXUDrTQHQCqAq2
 QUrvGw9C538C6rl/PQRBLfwEAAA==
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.0
X-ClientProxiedBy: VI1P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::21) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|PAXPR04MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: d845a61a-142a-49fd-8f6c-08dcacada346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bU00Wk1ZSi80Z0krcllMbkR4dUZGSURUZDhvVDFhVFFLbW5ielFNU2poNUdX?=
 =?utf-8?B?SDNBT2YydTdLYUU4eWtQRWI2TFYyTy95Q1R6cGpLeHd6OVVMRzV3VjYvOG9m?=
 =?utf-8?B?WVBFRmpEQkVMeTB1VEx4MVhUUUZsMURBT3A3SDlyWW5TcnZFUllNYlFyM0JV?=
 =?utf-8?B?T21oTjU5VStiUHMvekM1ZElITllnWG1LenZaWlhDSlh3VUh2MFlFYzZERzNr?=
 =?utf-8?B?a09HRDRFR1lEWkdVMVJBN0JyTGNSSXhTaUdOYU5jdmF0ZDRXQ1hVZEQ3d1FT?=
 =?utf-8?B?dG9QNHZPRHJHcVJDTkJjZDA0bkxRTlUrczRFQUxWeWZNdXRHb3RJeXlFVmNE?=
 =?utf-8?B?bXc0Z2cxSmVQOVRtUlc2MjE3REttbjJBd1huMUdVbkhnbFRtaGs5TWhvU1A3?=
 =?utf-8?B?ZjZNaUIxT3Q5dWtJd0dpNmovYkFaYktkbE1JWGFGR1AvYTBZOGozdFBMODBW?=
 =?utf-8?B?T2tOS3dxUjlVTWJNZnViT3NOa1lNdmJKOUFvRmhNNGhJVmI0MlNnYWtGMlcw?=
 =?utf-8?B?OU9hQU5qTHdzTUpyQUtKV3RCMFlaUkp4Um1LSXhDeHVhM2JCZGpTNUd4WDNo?=
 =?utf-8?B?WlBYREhZOHJKcnNlN2RQc2JPd1pOZlhYTFpVUEtadFZxNUZoR0NjQWo5LzdX?=
 =?utf-8?B?S0VYUURKRjY2dUF2N2hvVmZQWmd2c2k3OXJWNlpuMFFQYTlFUWZ3MnZBY2NL?=
 =?utf-8?B?UnZSL0owSGl2bXZzZiswMUlTRlB0RkFnaVQ5ZmpydXpleno0Um8za3IxOWdO?=
 =?utf-8?B?MU9NU2orMDZGUVp3NzJ1YlV5TVNVK1ZIUW1kNjN5cTFReFJaQ2xsdUZDREI5?=
 =?utf-8?B?cTNNcmVLWmVEV0VJbDBpWEJsak9qR2RGVnpsYm9EZVJ5cHJQRVRmMVh0aTJR?=
 =?utf-8?B?cXlYQkVRUlJvQ3pxbDRpN2hFTEtqU3BObkhLZE5xQU5HRE96YkwrODA2Qnli?=
 =?utf-8?B?OHYyZkU5aWIrWU9DUlpDRnJadjgrdlAyenh2enZTWTA5MFlQc3JjSFh0b0pR?=
 =?utf-8?B?RDF4MDF5dzNvWEsxRU95TjFXTjI3ZXNQbTJDanhwdEdVQXhXV0lZQTFpbndz?=
 =?utf-8?B?RHUyWElwV0taNVU1M29BcWkwRlRYSkV3RUFsU3RYK0FESllYWEdPbWNBZjBs?=
 =?utf-8?B?TjhLd3oxMjlTVjkvS2hUdEdMQ0pCVy9QaU5sOGk3bkRhNi9EczlVa1BNS3dv?=
 =?utf-8?B?aUNXYnVKM1BxUlIrSmpFK3V6VjEzTXMxUHB4bStIby9pU014NDdIaGZoNXEv?=
 =?utf-8?B?WThZbGpYREVhSTE1bzhHK3dCejJLeXpEdXBXUjVDRmlrY3V0RlJ5M25NMmVV?=
 =?utf-8?B?bytPVWVuM3pDQ2w3cllvcE1Pa0lWNG9HY2c3U2w2anhTc1p1OSs2RTZMRCsw?=
 =?utf-8?B?VWNQcm9xTWN5UGNYYnZjRWFVK2wzWS9HbUFubVdMUmN6YnV2MVdlemhCdm4z?=
 =?utf-8?B?S3RhRzk0R2R3SmJFRVdVQ2JUUkRBNDI0THVIUTAyUUppM3QwK2xXR2o1WE1z?=
 =?utf-8?B?OWNrZmJvNU50S3B1cjhKTlNDdUtGcko2U0ZuUU9FN1dkQksxamJWZjUyWjR1?=
 =?utf-8?B?ZFd5K3hjZ3labUd6TjNkT0hTMm53QUZhUExCRHI1Wkd4dVpCWUJiUFVlNmJu?=
 =?utf-8?B?WGMzTmNYYmNSUlVWR2R4WUZ4YVJxeGoyc2pvNC9xam05K0ZnMmZNZ3liY01Z?=
 =?utf-8?B?ZGowNmRjNm9RSXJZNURsb002WnFpbW8zY1lZdHN5N1VDcS9ORFdHR3FYZzdX?=
 =?utf-8?B?TmpabUpyTFo1V1RGckxBOThMY1RKbXlQdWJHTkIxV0tHODlyeVV0SjNGZUVu?=
 =?utf-8?B?VnlUc1BoaWsxNUhHbWRxTVFCRzNYVlJiT3BRNU5Bd2pkNEVDQW9GWFNxblZz?=
 =?utf-8?Q?4AD1nOFYzVCE9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXNjZTY3SzgxdlFOU1JHSkZmczdDSkR4bW5TMWVlclhlOWhKNE1jR2NPVWhk?=
 =?utf-8?B?cUZLWUEvd0preEYra2t0eXJiQmdlQ1dyK0hMOFluSStMT0tXQXhCVmR0eTBh?=
 =?utf-8?B?UTQwWjNPa1psS1NuZzlFMG5SVDYzV2FtQ1Z1NWhDRmw5cVh5MjZwaWhjR0hj?=
 =?utf-8?B?cWQrWk82VTZaVTlaaitiVGFpbmdXM3hNQTlUQTkwN3BUMzIxeC9qcFJLQjhC?=
 =?utf-8?B?YkZBeE9YSVpzdnZ3ZThnMmgxc3grMkphN3lwYjljd2RoQXU5NTdZT2VCV1VP?=
 =?utf-8?B?K3lZNzJPZTVjK3JyUGIzRjF2R20wZjlhTDB6eE9nVy92Q1FWSUdMQ1ZpbG8z?=
 =?utf-8?B?eUU5S0VYKzk1RGRoaU9nRDFvcTl2eDlxQUpGaUlJeEpHcW5uY0pFMjVZMUNL?=
 =?utf-8?B?bEh3ZjRJZUU2RTAvdWJoMGtyQThkWmlrUVB2a3ArTUpOWjBmWjRrY0ZHUjlL?=
 =?utf-8?B?UTJUdHc1bHI1UFJUeFJ4WnRLeHNseEdvRVVtRWFhd0kvLzRnR2lvMjJFaXZr?=
 =?utf-8?B?aGRjOU5VRVdSeHVDN0owTGdRQWt2OVREVE1ham0yVWVMMXVqbDFCb2t0MG4y?=
 =?utf-8?B?ZXJBc1NmSUwzUnl5RWdlUTR2Ty9GVGJUZFdWcUdsYWZKNzgza080WjZGQURk?=
 =?utf-8?B?aXpuSzdDeUlRSkRIR3ZjUXBjbGNsWlJldlhpQlhab01CbmJkT21tUm9YTGRG?=
 =?utf-8?B?c055b1ZlR2kwMkNHdEsvUWRNVHNQLzNZUk42ODRmV3Q3anpDRlRHenc5UjBu?=
 =?utf-8?B?bHAwRzBickkySnAxTHY1SnBGSm9RZHlRUjd4VEVPZ3l3UDcvWkl3Yks2Z1Iz?=
 =?utf-8?B?U01Ic09Wd0xBRTFVbS85ck41Y0krYlBzZ1h4aDhVU2k0azhPVElSK2tNUmhn?=
 =?utf-8?B?dzRhSFB4VkJLUnVrSU10TTRMMDJFZDFLNjd4YW1TTzdxNzQxb0h5ZElzM1Ex?=
 =?utf-8?B?Ti9sTHNuMUNJUHJiQy8xa3R3Nm80Rm9BWi9KOUxCNjQ2eGZISDBPQ2JITStK?=
 =?utf-8?B?SmgwbS9rUFordDJZQjRyRjU4Mkx6K0RaTldoRUhjS2hSd2lMSmFNWElobEZp?=
 =?utf-8?B?ejRwbmtNVFdhU2hoZk8wcGpMakRZdmIvVHFGM0NCL05pSmVpdGh6a0xrTzEr?=
 =?utf-8?B?U0NCbFFaYzd3ak9TN3VTZjRvNExLbWM4czhEaFExNFZUbHEzc3dsWk1uaTJs?=
 =?utf-8?B?cXl4bG54cEJ4R25MMnhITWNLU2Q1K1RTSlE1ODV6TkREMk41SGNKMXB2TW9s?=
 =?utf-8?B?eEIzeHBoWGM5RUVyaXQ1SDErWXJOeWNLS0g2NUx6dWFmelpkc1c4RTZDNkJY?=
 =?utf-8?B?Um5jRlFUMGROSU9SQmpBT1hrYXMzY2xYNGsyN09xTUpUZzVJWXlSMXpnUVJx?=
 =?utf-8?B?ZnRmYUk5amlXcEkzbGo3YkdnSjZyTDZBMUxkeE55S1FtL1ZxNk9xUlRPTmpa?=
 =?utf-8?B?eENZTjRlWHVQMXdXWW95OUk1R281RnhsSVkxeHVEUVFuUVg5YmloRFdUYnlO?=
 =?utf-8?B?dG5vdkVyejhDcURBZEEzeTZXY0ZnTnFJa1ZUQUMrWmQ4aUtKRHN3NGNIdTJp?=
 =?utf-8?B?YjUxclMvUWhLblphV1ZoazZ2R0xrTFlCWmxxMjkwNTVZOWlSSU4rWGpCZldN?=
 =?utf-8?B?V3lWREgvU0I2NnBqaHFJTEpSU29XUzJZU0V1S01JYmowUndQaWVucGp2VGNx?=
 =?utf-8?B?K1U2THlsMXpHWVZ4VVVBRnFCek9uczZ0NVdORVFQeGVUdnJ4TlM2bnlNd0hH?=
 =?utf-8?B?UUQwd0tLWjB6bU1IZVB4S2tiZDJ6WmxoVFhxeU9uQVJvajczSWR2eFRkalR2?=
 =?utf-8?B?T01sZkRhMlgyYWZIeUNzdjcyTzU2eHhqNXNPTnNnQVhBUW5EY2FFK2oweklo?=
 =?utf-8?B?MVY2YXpqbWw5QXRFWkVPSWVmWUNtMGh6MHgrc1R5VCtyOUJWWFNTbEg5a0Jl?=
 =?utf-8?B?bWV4RGdoenByK3c0c3pHMGtUYXN6UFd1Z3VpdW04S0pXZWRDbEp3MEhhQVli?=
 =?utf-8?B?NG1VRTllOTU0MDVVQ3BSdEg4Vzg4ZTNuVDFybHkzNUUzbjJpSzJuM2dBejhr?=
 =?utf-8?B?alNtUmFmRTR5ZEw4S2pCc2xEMFFkTlhObDRkQzg5TGFTb0k1aGgxMDFXc3dh?=
 =?utf-8?B?Z2xMVzd5THdYM3JNbXIvaVI2K3VhcWRYT0MvS0NpU1VacTRnTVJnTVBzaDFQ?=
 =?utf-8?B?RGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d845a61a-142a-49fd-8f6c-08dcacada346
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 13:28:14.9799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhMWkU4/cJH+KpZwfsHa/iafr0O7DAX2sxrQMd6E9OqBazXFxihkXfZQ9LaboXgyrNJ9YD6W7H9bRKqP8n/NARExN7S2/iKNqENe8tbxsg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8287

Theobroma Systems Mule is an MCU that emulates a set of I2C devices which
are reachable through an I2C-mux.

The devices on the mux can be selected by writing the appropriate
device number to an I2C config register (0xff) that is not used by
amc6821 logic. This required us to add a new compatible to the amc6821
driver, from which, the new platform device "tsd,mule-i2c-mux" is probed.

The selected device on the mux can be accessed for reading and writing
at I2C address 0x6f.

      +--------+----------------+------------------------------+
      |  Mule                                                  |
 0x18 |        +------------------+                            |
--------+----->|    amc6821       |                            |
      | |      +------------------+                            |
      | +----->| tsd,mule-i2c-mux |---+                        |
      |        +------------------+   |                        |
      |                               V__          +---------+ |
      |                              |   \-------->| isl1208 | |
      |                              |   |         +---------+ |
 0x6f |                              | M |-------->| dev #1  | |
------------------------------------>| U |         +---------+ |
      |                              | X |-------->| dev #2  | |
      |                              |   |         +---------+ |
      |                              |   /-------->| dev #3  | |
      |                              |__/          +---------+ |
      +--------------------------------------------------------+

This patch-series adds support for the tsd,mule-i2c multiplexer
as part of rk3399-puma, px30-ringneck, rk3588-tiger and rk3588-jaguar
boards.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>

Changes in v6:
- Move ti,amc6821 from trivial-devices into its own dt-bindings
- Use same regmap config structure for both tsd,mule and ti,amc6821
- Remove max_register from regmap config structure for amc6821

- Link to v5: https://lore.kernel.org/r/20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de

Changes in v5:
- Drop the mfd implementation of v4
- Add more dev_probe_err callbacks to tsd,mule-i2c-mux
- Instantiate tsd,mule-i2c-mux as a platform device from amc6821 driver
- add "Theobroma Systems" when describing mule.

- Link to v4: https://lore.kernel.org/lkml/20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de/

Changes in v4:
- Drop the previously added i2c adapter quirks
- Add platform driver probe to amc6821.
- Change mule-i2c-mux driver to a platform driver
- Add dev_probe_err in mule-i2c-mux driver
- Add support for tsd,mule in simple-mfd-i2c
- Add tsd,mule mfd to supported dts

- Link to v3: https://lore.kernel.org/r/20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de

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
Farouk Bouabid (8):
      dt-bindings: i2c: add support for tsd,mule-i2c-mux
      i2c: muxes: add support for tsd,mule-i2c multiplexer
      dt-bindings: hwmon: add support for ti,amc6821
      hwmon: (amc6821) add support for tsd,mule
      arm64: dts: rockchip: add tsd,mule-i2c-mux on rk3588-jaguar
      arm64: dts: rockchip: add tsd,mule-i2c-mux on rk3399-puma
      arm64: dts: rockchip: add tsd,mule-i2c-mux on rk3588-tiger
      arm64: dts: rockchip: add tsd,mule-i2c-mux on px30-ringneck

 .../devicetree/bindings/hwmon/ti,amc6821.yaml      |  86 ++++++++++++
 .../devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  |  69 +++++++++
 .../devicetree/bindings/trivial-devices.yaml       |   2 -
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |  24 +++-
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |  24 +++-
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  25 +++-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |  23 ++-
 drivers/hwmon/amc6821.c                            |  12 +-
 drivers/i2c/muxes/Kconfig                          |  16 +++
 drivers/i2c/muxes/Makefile                         |   1 +
 drivers/i2c/muxes/i2c-mux-mule.c                   | 155 +++++++++++++++++++++
 11 files changed, 411 insertions(+), 26 deletions(-)
---
base-commit: 5d09c33f705191f1be376ecd1bc41fd32798370c
change-id: 20240404-dev-mule-i2c-mux-9103cde07021

Best regards,
-- 
Farouk Bouabid <farouk.bouabid@cherry.de>


