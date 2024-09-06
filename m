Return-Path: <linux-i2c+bounces-6324-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B078196F8C4
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 17:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33E401F229BA
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 15:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133671D3653;
	Fri,  6 Sep 2024 15:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="Utsxc0n+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5BA1D31B8;
	Fri,  6 Sep 2024 15:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725638157; cv=fail; b=hYZvbWKdCO08mEqSoK3gVPfaIkQ0HvKJODNR/FjMb7gqcqoeXP03eMGTcwMTNXhGyGYlbYT3sTDaX/VRLct8/KyeydJIo6Ebp2OU6QHWFi7HmY8IxJRjy0Iszvqzwr+2uqSsjaZChH9yq9R6nwhlcBUMYzx2ySm0Jc06fqZOgBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725638157; c=relaxed/simple;
	bh=97R6EWXKGgVsm78UkCcL/Zc6vv0Me7KdDubx5Xqetjw=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=X+Hqj3eIcvElUMbD3GjEsAnJMvCk8shOU+AcPsb5YnlbNBqv+QQ5OIQAT8SZeSkU9/Jsod8Idk2bC2zGCJvZZ5P5B352KOGQP5ggVdnkH/PYP1kc6QvHtPKOriXzRxvlRyxuo6SHy/RPmeeE2C4eQcnbDSh4Cpwp2ATS03MNgm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=Utsxc0n+; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMDrhn62WvuqPIvmS1T02jGk5gVEUPMJ+4OUUafHoFEcUyadBUiz0+kJFnE8TsG5HtpG5L5mOOI9ZSwl7GI1s+MXTJn1ldBqkaKWb+gfyFan8IdQ9Pcy2Xv9A0eU0GVkjC5LCde2XWKvag7yUe6Y1/RjD4RfENx6OBB0QIO4k0LnxbdKHvMzVaDpy2Tqd30dCw20IKYoU1XEbiydlKjVXaSQutsnTUdjzF7Cr1aAEzI7Oiy8M41JkN3kCq4lgorGW0lqi+C2lPQWckWC3Dpsy3zqtcS4Sl8ebs/uIWJQT9zIHl16/PXKZJzFO0qmaGjwj4O8fik/3RHvmVWuXL0Chg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+w15CH8bXqA69gsezT+sNCd9C3M8DhxBSQArqnmRyE=;
 b=Fd7HQT+dndJtNHP3HvGGnPPkJUBVwU/jWj5SrI3foc2f3QU/wKdqGV3/1sEysENYNpwHcIwvnh79C86CA3yX/ODsYXcm7sXLJ3WqQZzZgxpu6J4t5Z05u0zPGaIcVHnjnMl4OhLdiYEBe6fejqa0FXPGeJPAk4sSDBdIZ/8xSJCn006IbK0FZ5gtntt36iX4mDM4Z77o7OoycU4hGmt2iWCzLlPx2ydDN4DHq5H8WnNeai2LAzSmF3L2ryn9AHE0QrahW2omMoIM30alJOr+mtFxN6y1pT7WDGLTxR303vj0rgZrK5mPPXXjwLofFKbpOnoZGTugalTGd9Pn6fhqWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+w15CH8bXqA69gsezT+sNCd9C3M8DhxBSQArqnmRyE=;
 b=Utsxc0n+gy6oP0KzHGr0C+IHGkmMO35S+A00zHeTJcvFkOG+weSxlgI+/YBY+yAv2aVnDZOnykrAQjda//WwZxSWLmuQGlqcsxqEcuNWQtRLG2vOn6Hix+3Z2aPSeY/b+YGJOLPFfkKRFr4TL+u/Rf7Y37laI1YJckl0m9qVpfE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by PAXPR04MB8319.eurprd04.prod.outlook.com (2603:10a6:102:1c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 15:55:46 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%6]) with mapi id 15.20.7918.020; Fri, 6 Sep 2024
 15:55:46 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Subject: [PATCH v8 0/8] Add tsd,mule-i2c-mux support
Date: Fri, 06 Sep 2024 17:54:11 +0200
Message-Id: <20240906-dev-mule-i2c-mux-v8-0-dbd28a150e41@cherry.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKMl22YC/23OzW6DMAwH8Fepcl4qx+SLnfoe0w4kcQbSKFPCU
 FHFuy90k9gY8sV/S/7Zd5YpdZTZ8+nOEk1d7oZrCfbpxHzbXN+Id6FkhoASSvFAE+8/38scfWl
 uvBZQ+UBgAAUrax+JYnd7kC+vJbddHoc0Py5MYp3+YKj/Y5PgwEGqRlqMOkZ3GVsaXBr6huc5j
 9Tnsx96tsITbpiCIwwL1tTC10pGrYK5+JZSms+BvoFqA7QQB0C1fmMD6gYtAYg9oDbAgD0AVAG
 MkFKHKoKzYQ/oXwCqA0AXINZRB+M0RId7wGxADXgAmAK4aJyNqrKK/nywLMsXoROLNQECAAA=
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
X-MS-Office365-Filtering-Correlation-Id: 387ded1c-db2d-48eb-5c0b-08dcce8c5ecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUZsYnhHcDRWWXh1SzZFUE9WNGFyN1BOeWZrREpjNXdMaDl5Y2VWYWF5MFdG?=
 =?utf-8?B?eDhkTG85WUptN0xyTVhxckZPaGJlWjFPbElmc1VjcEV1OVY0V2FvRUdFV3cx?=
 =?utf-8?B?eDVNbTdnNkJVWDdCNzNINmFUY2lHSmxxT0QreFYvMk0zZm9oTnJ0UHVNOE1l?=
 =?utf-8?B?NVpPTThvdzA0MTV5RmNPVWhLYVhsS3JKUGVreGRsWGkxcjhvNk1INUlaZG9H?=
 =?utf-8?B?SGg4T2E3SHp1ZXByNlFWc0xodnZQbWtjZ05WNC9Yd3lqNXQ2UjBkdFMvSEVr?=
 =?utf-8?B?eHJvdENtY0FnY2swYTU4N0N6REFucXV0LzkrdzJKcEd6TGNGUTEveUc4OEVG?=
 =?utf-8?B?OFovTWpzTTBsRTg3MTd6MmtJNlhLdnhrWnc2TVBkbUM5Q0dqT1hJOGV6eUJF?=
 =?utf-8?B?UnBKTnptWGpCeUtCanFFV2tNMVVSalpsR0RuaGF3elNIa2RQWDNqQkYzbkpp?=
 =?utf-8?B?bmtmQ1FoMnNpSFk1eXV4K1VNMGcvaTIzWnhVNW5Ib1RWZ0hmaDNoM09xNHJv?=
 =?utf-8?B?Vk5kdGFiTHJJOGcxeHNqSzNROWFDbnRLQzNYRGRFSlkxUlV6VGdxUnM5bHkx?=
 =?utf-8?B?MWw4a3NrbURDNkdUMW5RN3JveHBhSmF3bHFRRTB0MzFUampsdEQrdU1JS1lx?=
 =?utf-8?B?T0NXeEVzTnBCVVpTVlJBMDNBVllXTTVqa1dVY2VrS04vcWd0SzhUckxnTnlP?=
 =?utf-8?B?T2lOUnBHWUQzRHFQWGxYbEI1eGZzMk45RGRvaEd6NlIrWms3WTczMkVXOEV6?=
 =?utf-8?B?akJiYUsyWDVpckdoeUQwTjd4ZDhWRXZGV25GZzlxMGN5U3k4a2hFQ3doTXFp?=
 =?utf-8?B?aER6SmFjSjQ3bm4xVU1rcWJTdWVJZ1ZDa1FIKy9wcFhqaHlWSFFJSDFGRXh0?=
 =?utf-8?B?VWhqZzc2Yk1UcThzWkdweGt1c1ltVWY1OXNxeml4ekExK2NSY216aUFnZnpR?=
 =?utf-8?B?RE4vZjhGdlhrU0tlMDFPdU5IdTBmM1I2WHhDQ2V6Zi9IMTJiUGRINklpYWFJ?=
 =?utf-8?B?Qi93aHBGWk1sc3pKQzBSTnlEZ3VSWHhHeWpoczY1Z0IvbzE1ZVVqakYrR0Fj?=
 =?utf-8?B?blBVeDQwVXBTSjFjSWpYa1VXWDlKaVFWWnRRT21Nd1FsVHJjTTJXb2p2cmNF?=
 =?utf-8?B?amtuWVpmcGFlODVvaDRTN1FLMzlDNHVaOWoyaFUyak1ISFcySzVUQXZnRVUz?=
 =?utf-8?B?NUF2Y0hlL05WalNnQVV5ODN5WjBabTBKQUk3VGhXY2xieDNKVU9aZGJBVkg2?=
 =?utf-8?B?Rkt3a0pWSnJRZmE2T053Q09XOEFiSFRlZFFYbzk3SkI3RUk5NVBqSUlvRzk5?=
 =?utf-8?B?eEkweG5sSWJBRmtEMG5iYTV1bjlyOGhpK0dtelN0MlZTSmswYUtDNkVEc0ow?=
 =?utf-8?B?R0FuTXJQRjF3SFJTUnVoMlVKbUFJSElLWEVpNzBPNVgvckp0emNETFk5S3ZB?=
 =?utf-8?B?WUtwR21tNUlZTHZ4SUtGNEluNkpVVXhESkJDM2NmNDVFS2dkZ3ZQclh5bHdq?=
 =?utf-8?B?Z0pUdk1mZnlubEhtZG1JNTdWaXdPeHl6Rk1UbUlCYzViTDFBNzBjMlFYV3Zz?=
 =?utf-8?B?UmVCUnRzb3RpbDJEdVN4N2x4bzdnVGVmaVB2UUY4RUVid0E2WEFuYW42eXd1?=
 =?utf-8?B?dHJySG44bGtxdG9vdmFRYmllZUZEdWtHak9zWkhHMkExRC8yV3FLWWdHVlFl?=
 =?utf-8?B?ano2cjRDbVUxSzE5QlpqN25kc210Z01OY1JOVERUZzl2WHRTT3ViN3RBMVNQ?=
 =?utf-8?B?M1VMeEI1ait2b2psMXpjMElQTVdxeEMvbE94YW92bmF3eTlPYWV4Q1NpQUdT?=
 =?utf-8?B?N2E5WUh1TFR6UmRIbzdoWFNYTUdxMUNkbVdtdWZpWWtKaFpsUGxJaldpM0R3?=
 =?utf-8?B?K2F6VzZhTmEzYlBOUzgrWnkwUE0yNUxEUzJyVHN5VXJxR2xHeXRreHpsOXlF?=
 =?utf-8?Q?kFHDBi2n9ww=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGwwTGloSW5ZMVh0M21GR1ZmNG9ZRWpIYjNqaGh3MHRqOWd1b2ttRTZMTlR4?=
 =?utf-8?B?TDdJRzFZQ2lrQXpmR01RallkQVZUMXlzREQ2SnIwTVBpaXhrUmlaUEorSDVX?=
 =?utf-8?B?ZVpWWEQwcWFmNXJkeW84cGdOUUlzY0dpNTJHbU42WE9tbU9YRE5xWmE1V04r?=
 =?utf-8?B?a2RZTGtnL0ZHalY0R3B2cXk0cW5kOHd5VlJMTzA4dEgrVXFDT29XWEQ5bW9H?=
 =?utf-8?B?dEE0MnJkbVkxRVBTY2FuTVNzU25samM0T1BwNlhubTRyZEJmTHhVWEVPa0pR?=
 =?utf-8?B?bEpzcXFMOHVHWWtxUHQ5VFVnT2FCaVRWWEJkMkZkdVI4b0RQdjdUdGlCQVlj?=
 =?utf-8?B?QTFuSlRNM1k4STBlK1hEY1NXNGk1RnFBUm5McDlJNHZhcjlkRHZkT3FkbDR0?=
 =?utf-8?B?N0JFbDM4blZCT2QxbDRQWjFac21rRTlvb2cxV01xLzhEL0ZVRGUrWVdEOXhR?=
 =?utf-8?B?Vnp5S3hiY3FGRUkxcW9FbmZVZ0thY0puWnYvYzQ3ZUFhb3pzM3lmcXl6bGc4?=
 =?utf-8?B?N2NNWjBkTE1jVkRkb3c0RGg1cGhiRVdJYmtXaHVmZHVGRS9kQml0QVFqN0Zk?=
 =?utf-8?B?SFJjSlErRnN6VmFGTmVUdGZ5SDNxcHUvcm1SY2t4VHhYWU9xRWhFeWNma2Q1?=
 =?utf-8?B?ck1YdzFTeGdjc1ZBNlBaenduZ1M2YWFvekNvWU5wM09EbGxtOXNXd05zSGtS?=
 =?utf-8?B?czJLcytVcTZISm0wcTFMVzJjd3ZXakJtdHRlOWhGZzdrL3M5ZllPQlBjb2J5?=
 =?utf-8?B?NFd0QWRvNWxycXdMRmNBdEZ2eFh1SG5LU1B1bkhiN3EyajE2dUgyMmtPL3Y5?=
 =?utf-8?B?Y0hhRDdvK0w0QXI2djVSQUhENzU5NUZGY1N5dHdGWFlhMGVWZDlTRUI4SGN1?=
 =?utf-8?B?OWtFOGZWYVN4aHhjS0JxZFE0Zkw4YWVRTXJ5OXorRFQxcUcrQ3QrTzB0S3FE?=
 =?utf-8?B?MU1LQ3YwcFdsUnlHakNtZktyYzNrbUNtejYzNnRMbXMzaWdOOWE2VTNOUVY0?=
 =?utf-8?B?bWJWYmhWVzNiV1NnQStmbUVOQTFiMkFQVTRHZFhiSGY1anhQSTRJeTRsdDNQ?=
 =?utf-8?B?ekJMTGl5QzExU3MzRzhnU0tyNmloYmNUOWxIeVlvbGo2SDRua0FzR1ZHOEEx?=
 =?utf-8?B?cXJYTCtMWDU4emQvUHJsdC85Nms5UTNHL0t5NUc2T1g0cythRzNVdGxydDZX?=
 =?utf-8?B?US9sVjhEVXZ5L2JZcTBuWkZlNGVFc3lMZHdZVE9WY1JzSHZTck1CNXF0dGxS?=
 =?utf-8?B?T1dZRzd4WnVSOTZFNjZFaU1zTFg4SWpEOERoUGJVeFEwR1oyTkpMOG51U001?=
 =?utf-8?B?T0ViME5lcGRKMCs2TWVHdUo1NVdOa3BZakhZV0VQeWhvc2RIWm5PWWdvVjBh?=
 =?utf-8?B?OGFzN1gvdUZkQjkyVldpT3Fpb3FBTXFPWU5aajQ1cEx3Mkp3TFhUSVNxSWZT?=
 =?utf-8?B?RXZyWU5ZdXRUZ1hFdmV1bzBTQktic3lWb3BXMnN4UDNnU2FZQUNZUm1QNkdB?=
 =?utf-8?B?dE9kNmUzc3lzcHYxMy9xOGd1Z3ZHbU5Ga0E0YzI1N0Z5REFjWUNlSFl4WFY5?=
 =?utf-8?B?SkNXY0toN2NiMFJvUnViN2pEWG9kUjRDbGlYLytTWWRFK1MzT1ptWE1GSXV1?=
 =?utf-8?B?RnpqUGJyRU1ZUEJySERueHdaSENFZThYaTB1YmphWWR6TnQ2eEVQK3labk41?=
 =?utf-8?B?K0RjMjJVb2N1aEM1MURXT2lETWV6Y3JSYUMrNUpzdTN0WTh3TFZHZVplK1hp?=
 =?utf-8?B?SHdCTElITmJDNVJHdkpEc3pOaEJkRGFaVGJkMjBWTmdWc2Q5NE5KYkZENFhF?=
 =?utf-8?B?RE4ra3Z0Y0psYjI3THdCaE9ibFYrTFR6TGt4Qm9Vd1ZiYXlhVzlLeTBIdS84?=
 =?utf-8?B?V0E4ZnhGa1dKS1MxMlpwbTNiU3NncmRHLzlHMEF0UlpDTzZqcE5ZMXoxOTFh?=
 =?utf-8?B?TStDZUpzWHpYcFR0aXJaaTlNVzV2QW0yT0VoVy9wR1czVXZRQWJQdCtkWVZ2?=
 =?utf-8?B?OFNjaUlvdmwzVmZMTHdORmRaZ3k1ZzltU1hpc21MdndueHBEYmdLTU12ZGor?=
 =?utf-8?B?WFlXT1ZiMHFnRzBoK3prOXBRUkxnamZYdWx5RVJnRnFOM0oza0ZCZExRUC9K?=
 =?utf-8?B?by9oMHZ3ZDVRZ0s4QnBXRjBvTWlsQUQ4aTZod01jSnBFNEZYaWxsMjRPa3BI?=
 =?utf-8?B?S2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 387ded1c-db2d-48eb-5c0b-08dcce8c5ecb
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 15:55:46.1749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGxWP0/7krjihkK41o3+5FGhWWeTThjyHjLm4giepVicHkxtdg/TODovvjiEF06sJ/thVGRHq2X8kJGWxuy5TBWwANWacjzsjViHZbXH6PY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8319

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

Please merge patch 1 before patch 3
Please merge patches 2, 3 and 4 (and 1) before patches 5, 6, 7, 8

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>

Changes in v8:
- Rename functions/macro in i2c-mux-mule.c that have "mux_" prefix using
  prefix "mule_i2c_mux_" instead.
- Remove extra "/t" after .driver in i2c-mux-mule.c
- Add a space after "{"" and before "}" for mule_i2c_mux_of_match.
- Link to v7: https://lore.kernel.org/r/20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de

Changes in v7:
- Merged __mux_select and mux_select functions in patch 2
- Removed unnecessary prints after mux_alloc and add_adapter calls in patch 2
- Added Guenter's Reviewed-by tag
- Added Rob's Reviewed-by tag
- Added Wolfram's Reviewed/Acked-by tags
- Link to v6: https://lore.kernel.org/r/20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de

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
 .../devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  |  69 ++++++++++
 .../devicetree/bindings/trivial-devices.yaml       |   2 -
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |  24 +++-
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |  24 +++-
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  25 +++-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |  23 +++-
 drivers/hwmon/amc6821.c                            |  12 +-
 drivers/i2c/muxes/Kconfig                          |  16 +++
 drivers/i2c/muxes/Makefile                         |   1 +
 drivers/i2c/muxes/i2c-mux-mule.c                   | 148 +++++++++++++++++++++
 11 files changed, 404 insertions(+), 26 deletions(-)
---
base-commit: b831f83e40a24f07c8dcba5be408d93beedc820f
change-id: 20240404-dev-mule-i2c-mux-9103cde07021

Best regards,
-- 
Farouk Bouabid <farouk.bouabid@cherry.de>


