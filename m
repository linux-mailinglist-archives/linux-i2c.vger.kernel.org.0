Return-Path: <linux-i2c+bounces-6326-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 978B496F8CB
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 17:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2790E1F21285
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 15:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FF31D4177;
	Fri,  6 Sep 2024 15:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="ZA2Q5Uf3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210C31D3654;
	Fri,  6 Sep 2024 15:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725638160; cv=fail; b=FbAWcXPgdQA+0xfmD58scDMmkSa1mYdHt/1dI+qYB1SELDvDSZx9KRDCEP9fzlFZ8g1dtqOI2gmmgi8wW75mbkpbqxESFjmlc1/pUk6NwDdxs70uxRC3ZS+dKxxNFNQX9vY0mOY78R2Dvh6i+0srD854yvPKqPkBNtXV+xj5c/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725638160; c=relaxed/simple;
	bh=GGGzzx4ZW0A16uCMEUJBkPezYZy6d2rraWET88P/LQo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TdNh0hiBSaqiHzHcUdlL5uSycobqf+YpU7rg08XdHue7obUK4K2TIkCFtITqEFIg98GrfjL3XrR8lvnq3HJDXQt6lRWSQDLbBh4ryDCpSvU0oUnBtzxd7MunLPr9uwpNkc78U6PCUxBAFr7I3QjATLp52EbCovvhHDY0yAnrPVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=ZA2Q5Uf3; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMnVgQ728q/jtoY3BbUyeaMyuIJn/5Ud03H5qdzLEt3i/vPEuJDJTQUfB7W5lY1xRkZhUwGl2LS2uhr1hM9CIAR1CFWXwY9wV4Dd0HUHGZYjzIFXgLhFexFrHHkJ9YPVTW9y/7VT/5rZCKAHGhK4DEVMSNruHUSa9RDFVAwSr64GgyzRoDTQu27+Yu6pTT1nH5l7Omjn/kWpktKKyUK5bVC/vc1JYk5jzu/k0ol29bgYp+iGhuTEXguvVB0jXC6X3VqQsW1wZvpHCQg6Hm3ATp/bsvXpGToLR47wm/Q2+tVEYawkT1lv76uchvnwyvuAaToYOiPKmXnV4eMLT1XtEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+d8kkbjE30ReXzbzXlDkTY6YH4knVAS4Xf0qwtzQOI=;
 b=QRdN3/7o57w+ebaUibjK1eF5wjZAz8YftGLi+87p+XrxPSKNRD+wngwGrvwbF9uwM4LQZ8Eiz4ejhBRka0L9GtrfvIcjeg3udsYO/BB1pNoRCKZm5L9FOjMDqQWfXyfmqYuDmycQ38bauFHLHgL2iNGUFm9juh5Aa24yrPSYRXuHSKOflmFT1FGGj+xjdxbnVdkvZYQx185QzjOgE16HGAAAafYYW2HxKIJas21JLafCDY6hK3mEHRsCBLe4tJTmWaPeRgacfJ1LLm57DgqdklG4VBg9jqavS7j1EINHwNqrCc5Jd6j7vJU1jyD/ScQKDiHRXfTo+FgE/TH8pPn7Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+d8kkbjE30ReXzbzXlDkTY6YH4knVAS4Xf0qwtzQOI=;
 b=ZA2Q5Uf3wv8LZdXnfi3c/ADyRrGYSiIUYGs+GKw5+bufPayNaAXxYnkhdbOvJASp64bUupm2JrUcbaYqN96Y+tCzLLGPrmUlEbnasr2hCcsCO9EJArHQb1tKgr736upsFQwO4og7q2iX4NkMpOhJxgU2TQ4eAlddVsMPpLJDTl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by PAXPR04MB8319.eurprd04.prod.outlook.com (2603:10a6:102:1c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 15:55:48 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%6]) with mapi id 15.20.7918.020; Fri, 6 Sep 2024
 15:55:48 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Fri, 06 Sep 2024 17:54:14 +0200
Subject: [PATCH v8 3/8] dt-bindings: hwmon: add support for ti,amc6821
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-dev-mule-i2c-mux-v8-3-dbd28a150e41@cherry.de>
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
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
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
X-MS-Office365-Filtering-Correlation-Id: ba56a466-5b87-4fba-d0cd-08dcce8c605d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzVFa1FCUGRCVmJQZStNaUlTSzB0bjdlL2tHT1lhL1dNNnJtUlU2UTFaUS8v?=
 =?utf-8?B?N29rNzY4U0pwSDF1ZWNvUHluN21aeVU4L3gxR2tMZTE2NjQvN1hSVEdTR2hz?=
 =?utf-8?B?Q2ZIOXoyVVdBTXFlbDhaT3p6MkpxYXVnYkNyWWsxMkNYVUVkRHA5YTNhZWNy?=
 =?utf-8?B?WlFPelV4L2YxTzFMdnVveU9aYVB2U3pJajBkMVk0NVZzR3pVNHEzK0UvaXNK?=
 =?utf-8?B?aExkbDRDeFlGZnJncFUxNWcyYmovSXBxNjFLSXo0Y3ZDaTBZSG1EaEVUL2pS?=
 =?utf-8?B?czBzODRIN3h3eEgvN1owdVVoSncrN1BvOWhuN1A1M2JVK3VvL0VVNXJwNTNh?=
 =?utf-8?B?QWV0blhwS1JycExrWVR1VXdCYklTcFEyaEp6QmF4djNRSzQyelozbWdySjla?=
 =?utf-8?B?UTlhTUF0S3RkYWY5WkF6Y21VM29DcTMrbng4Qk40UEp5VC80aURyYjVMMlB0?=
 =?utf-8?B?MkdnbmI4SG92b2E3cDZIQ05pc1dIMEtjT0FiN0d4TkVjeGVEdWhpck52ZnRn?=
 =?utf-8?B?S09jdFZRbVUwaFhJWncxeG8xV1d6ZDJUbUl4Q3hpMWpkQWhpNnlpemszaXdT?=
 =?utf-8?B?Ukp3S1JnOTA0eUg2OHBWVmljV0w5T0xiUm5uSTBrTXoxQnZhT2VrVmUyKzRW?=
 =?utf-8?B?RHRqOE40N3JxaUVlNE1FelZjdjNMTkRTdDZBWXd3NzE1SnpGWEhsT0NjazVa?=
 =?utf-8?B?cTBmMGY2a29YVVlVdzk1QzU0ZnhqOWdWQ3AzZmhPTWtja3RLWGVqMFF1bThx?=
 =?utf-8?B?V2pvcHJlSUZNSHN6MHh0VTRJcXpuM0lzdXZOeXVXaHJTM2lWSzk2WEtLc2JQ?=
 =?utf-8?B?RjlkRkJncmNqWlM1UTNhTWpRZlF6a2IwM2FTZFhaMExTU2wyODdsZlNyUEZD?=
 =?utf-8?B?MXhKWkNXWlB2cEpsZDREUzQ5YmdnZWdJSnB4bkpOcUdHVkVZdDEwcjVac1ZK?=
 =?utf-8?B?all5aXRqVFNIV0hyZFhVWHViOTRTMnBIeXVUcFBTOFViUkN1SWw4UVlaTTJT?=
 =?utf-8?B?dTNibzFoZTExemZsRDhqZUpBRituNUx4YVFYbmxUVVpBak1DUStsWGk2Wk5B?=
 =?utf-8?B?NVhDcndBMzd3bmZPckJhTktXa2gzZ2NoZkxmNmtLT0luZXFuNXJrMVNxazJ0?=
 =?utf-8?B?bHl1cXJlU0J3NjdyS3prNnFVWGhJMDNEanU5RjdHUHdOSXBqSHgybGpGWGNj?=
 =?utf-8?B?NnNpYWFFSkNEci9ZT2dqVk53dDRYWDQ0V1NTUTZQVENwTm4xSEFsdzRQUC9X?=
 =?utf-8?B?V1AxT3VkbFpnV0lpK1NPN3NUU2h3S3dqWFBkdWxGWjlvZnI0Q0Y2UXNJczcx?=
 =?utf-8?B?SE5uSWJoNk9mSzdQU0FiMzBEdS82YXp2TnBieTFXSit2WEl0ZnVlYlR5T2FZ?=
 =?utf-8?B?VUhST2pVTUFhNmY1OWEyVWtNNkNJSzU0Skh2UW5TcXNKbzN4WHdDZUVvdXRW?=
 =?utf-8?B?bit4QmJVV2x6RGlvRVZ3QzdwcHpSNzh2aVM0aXR0dDFXNmpydFRKVWY2SkFm?=
 =?utf-8?B?R2ZxTFJQdHVRNHVOTDEyakR0SVRJK0RoaG1xaUZVRzRkVkk2VkZmM3Jta1FR?=
 =?utf-8?B?U2Y3amcremlqa3JYcEJhTjNHajR0aWpuTjNIYmowTDFxMG9SeEtyZ0FwLzU0?=
 =?utf-8?B?RHc3WkdmN0xxcjJVVVYwdDFPWkE5MVkrL0pMZXJ6MVFFaGdabzZtdkU1RzRD?=
 =?utf-8?B?WjlOcnZHK1R1YTRqQzNOdk5ZcHRGQ0ZYbDQvZHRPRUJxTFhkRDFtRjZNUVFX?=
 =?utf-8?B?YlJ6QmR1OTd5Ky9Rc3JQOTlINFZkV3BWbmV0Z0tqcXBvYk9ieHZkbld4Qi94?=
 =?utf-8?Q?fjx86LDcWHQ0CoTL65AB93LDZ+u+1hJNszM4M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkRRVjhTZGdJOVRmUEFwckwvc2dJQVZwRXMyRTRxcFg2bDgwOW5hdGhoMGpv?=
 =?utf-8?B?dEtMUE9PdmZVVnovaUtzWGdSS0hCRHNQd3p5RC83amZEOFpwUmMyV0k1SVY1?=
 =?utf-8?B?Mmg2RytLR0RqTUlpUC83d1Z6L3VucTVjcWRhYUloYXhtZklDOWFRRlJGaVpN?=
 =?utf-8?B?aUQ0dVhSMFphaFlVcmZDWmxVOHFvV3lWTlVDemxBM0xLN1pYZzVaYlFjWWxM?=
 =?utf-8?B?Tkl5TlJXL0VVMDBDMDRBczJvbHJFTGJrekYrQUQ4ak1uVUlBSEhQY1BzdDdn?=
 =?utf-8?B?bG1mTUZuYUtSU1FHa0plUjJiSkw5OFBUQ0NON3QvdHF5NDIyYjhBbGllS3p6?=
 =?utf-8?B?QWEybldFeW14di9YV3R3ajVmWWs3S2xXWEh1Wkp2dXptNFJkZ0o0S0hQNUZu?=
 =?utf-8?B?ZTdxc0tlRXBvUHdpYVlIYkFVRjFBZGg3QVpEYVQrbnZqR1VBVWxTNmZoUE1m?=
 =?utf-8?B?YUI5cGxiVitrUi9kYjM2MDd4a0lyMGhBSlh5aFByalp0VFNWcFdTTy9EcSty?=
 =?utf-8?B?RmdQMEF2eVdoMkdpekFpbFZtc2JhT1ZVaHBqMUFMMHQ5clJ6VE1hNzVLTlJo?=
 =?utf-8?B?MWNMbk95T2J4cWNjRW8xMUM4bHdnY0Y4YVdtVytSc0J6UlBYUFloSTV3ZmJ1?=
 =?utf-8?B?TlpqVnFHWDYvZXAxbVFiQ0JSY2JVcnAvN2JlcVZvRDZUa25Jejg4dXYyUzhG?=
 =?utf-8?B?cjlqNjJtemF2WTJya29hOFFQZ0EvaG1hV1RCdDZNQVNkOER5a1dadmtQaStY?=
 =?utf-8?B?WnVIbXR6NEU1SFI2QnE0OVVSYktsUjY1QTZjZXN4aTZyaHFtalpQODFnMGhE?=
 =?utf-8?B?dWN0Q21EUCtiUnY5R1pQT3c4SGthYTNHc05nRzZNZGc3ME5UejZySkwxV0JJ?=
 =?utf-8?B?VFRURVk1NEloSkFIb25QVFpDbVhGcGllcHV2dUZKK1F4dXlPWlZsUlBQVVMv?=
 =?utf-8?B?MXNCRks2RHdyMnF5WWE0UVlvWkN0SDBGbk9zNWhqUmFQUkNVSEFuSzdCYkNs?=
 =?utf-8?B?TFpMTE1MZUFrd1FrYVpudUErYjc0cGhuYTBsdzFMTHd5YTdUL3BqWmJrQTFw?=
 =?utf-8?B?aVYzdU02QXgyYzBtRGJpUldPaitYN25sWWxFMnF4NjNXcjQrNWpnbjZwcHYx?=
 =?utf-8?B?UHUvdVRZai93RXFYbkI3eDdLQzU4TUFuMERKb045b2FaaDAraTNaek9hcC9v?=
 =?utf-8?B?Yy9RZmZzdmRrU29ndFVIckVXTE9EU2VPSzVEQ0ZVMkdTZFo0VTJ4d21taDZ0?=
 =?utf-8?B?N0J4ZHRaQWtsK2pWRWh2Y2tYc2t0Y00rRnU0Vk1leHp1Y0hQR1VydmxBd2RV?=
 =?utf-8?B?Q1BBZ0NqdDBQTWtHcTJpMTdyS2p0cFEyWmUyb2lqU1lGWld4NThnV3Q5OVhC?=
 =?utf-8?B?OUo1dTkwZ3FQV1JsMGhRL0xlaEJMY1oxbkdCWks3S3RkT3hjMlVjMU9SbVlN?=
 =?utf-8?B?eTBSQStlWFkrZCsxVUpLQ3F3eDRIY3l1U0dkQXdoeHpIQUtnNlJ0V2Q5N3pS?=
 =?utf-8?B?RzhpcFI3dFBIeUNCVjhsUXcyQUkzb2lFMHFEbysvaXlWSHV0NExEWndHMzl4?=
 =?utf-8?B?ZFdVWW4vQjZTU21uYzk0WDViRWFYd1RJZ0Jkc1hjR1ZYTTRJYVZIbDdrZm9o?=
 =?utf-8?B?VUhETzNiMWRtN1FYWXJHOHpaa0dkL1FLQm42Sko2dmdXcEs5bnpsdHowR2px?=
 =?utf-8?B?RmJ3ajlMcDhvYzJBdGxoMkN6cWNEc1pQR2ZERC9OSkNlcnNiN1l5S0sxWjFP?=
 =?utf-8?B?MXBTVkJmK2EvVVQySHJsQVZIOGpSWGoyeVgyNU5HNFFnZ1g0S1VXb3lyTG0w?=
 =?utf-8?B?ZldIdVZyZUJxNlhFdU9pTlgzK2haeU1jUUdHeHFZbWlVNEE2RHovcmtXNW45?=
 =?utf-8?B?UGQxRlJmeis3ZXhEeDJqTjVGRzhYU0JkekpNTGdLbkhGTm5LRkVpYWdmSURv?=
 =?utf-8?B?YUhLVUpYTmhLaCtqU3NWSVlpVzJrUnBEVG9vaExrS3BHZWd4YS9hMjBCSGJD?=
 =?utf-8?B?bkp4MmZZQktXRTRKdjlUOVo3RUlRN2hENUhPTkJPYklJbkJHVkpwVTI0bzc0?=
 =?utf-8?B?SU9TT3R1ZHV0cnlwQ01SQThoYTNETGhlMFJoVytzcXFWY21uRXJNOVRHTFA2?=
 =?utf-8?B?Wk1TdFNHQTBnTnc2ay9FQi9uQk9iVHMvbElkSTdUNDc5dFF0OEJFdnlRbUhh?=
 =?utf-8?B?aFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ba56a466-5b87-4fba-d0cd-08dcce8c605d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 15:55:48.8178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N9/HT6WMz9pCAxmC3pOQapFiJgaEjAn5tZP6xOQ9Jt9TIzR0mhmJDojTMG7GJtLfVM5YDCMBZ+f686nuFvoarOGckso0/v8mcJlD9ThOM7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8319

Add dt-bindings for amc6821 intelligent temperature monitor and
pulse-width modulation (PWM) fan controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---

Notes:
    Merge after patch 1

 .../devicetree/bindings/hwmon/ti,amc6821.yaml      | 86 ++++++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml       |  2 -
 2 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
new file mode 100644
index 000000000000..5d33f1a23d03
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/ti,amc6821.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMC6821 Intelligent Temperature Monitor and PWM Fan Controller
+
+maintainers:
+  - Farouk Bouabid <farouk.bouabid@cherry.de>
+  - Quentin Schulz <quentin.schulz@cherry.de>
+
+description:
+  Intelligent temperature monitor and pulse-width modulation (PWM) fan
+  controller.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: tsd,mule
+          - const: ti,amc6821
+      - const: ti,amc6821
+
+  reg:
+    maxItems: 1
+
+  i2c-mux:
+    type: object
+
+required:
+  - compatible
+  - reg
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: tsd,mule
+
+then:
+  required:
+    - i2c-mux
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fan@18 {
+            compatible = "ti,amc6821";
+            reg = <0x18>;
+        };
+    };
+
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fan@18 {
+            compatible = "tsd,mule", "ti,amc6821";
+            reg = <0x18>;
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
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 7913ca9b6b54..8ba53cc2672b 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -370,8 +370,6 @@ properties:
           - swir,mangoh-iotport-spi
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
-            # Temperature Monitoring and Fan Control
-          - ti,amc6821
             # Temperature and humidity sensor with i2c interface
           - ti,hdc1000
             # Temperature and humidity sensor with i2c interface

-- 
2.34.1


