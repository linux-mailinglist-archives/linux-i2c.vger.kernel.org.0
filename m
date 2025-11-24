Return-Path: <linux-i2c+bounces-14247-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A71EC81CD6
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Nov 2025 18:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C178C34548B
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Nov 2025 17:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0634831355F;
	Mon, 24 Nov 2025 17:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NUSmMNNn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433622C1581;
	Mon, 24 Nov 2025 17:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764004064; cv=fail; b=coLAPS9wn0bVhYkFm89GOP7N963ePo7DGRu6dGjxq6ZkA+PzQvIEOyPa8FyScS74W9MXuyfl1rZiGgFxNpsLZNim5rz6rS5Uf8VyTfEaYilRxlbhVfKFq7ubqAEe3X2oFHJcgk+60PGVhG7OE/FhLDe5mxNoWbUJTW+dqsD7Hfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764004064; c=relaxed/simple;
	bh=Z+BJW9yRIWcsjKFgENqMDP7igWKyXu9yWV7KtyzZQvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o3aC5OWeJXFgVV49lo38GrH2+CBDJNyUDd1IcUz8buB59nXWX36L2YksNCpBpXpcMbsHB9EcOrwvpDy/tsU73FnVty5J3MJx28IR8teDeLZhzpMb6lhzLUiYkEEvPV6+zjtxsLyZ+peYZDWlQkHH0oDj4r2TYgRuPsLbrBY0ESU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NUSmMNNn; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nb44PUl16DLI5/TbufYjOc8YOJO20fRoCrsyJCMSlZ4KzDdia+cwqAeO/eeUjWGV7oRoSdVflzyBWI+QUQ/AVCJ0IQVdiTdS5L365jIe92vjkBeJCiiyNQBO1NTPe00KD1HDDOeV1YqJr14Jhwdox5FSulwbl94+KYE4Jx+eWnT0nQ7XraoBYA1cM5cEmMe/uHWNZaAbtSzMQIqJcPXw/odxpoZ1n8jXYJIN5lOoHcEEBnCSlKfvIMcRcvPrKFO1vZVJFGugT2tBbSpifYWOB1Y/Lb1+HvgYdQ+7MmNJf75nMLx5pKU+qlSJFtOHgAGbIJHXoCVFzLbvVstgfW0N5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fveucv3YLcZIR99K90Z5C/tVAVkHENqwEJf8S539mbw=;
 b=plBZ0f0KuT1YAFtXNKQKrSfhJJWRNheHPxsEs4mlkA2Drb2Z9GuQsrQjNTMXuioLWNk7uUDM7VTK5b9ekmcUIqt4xbReOiyjpU7ezvjB5WiWgCKsIAbamSzcc9nfd0TaOprG3vg5oauZXbf6GyiFMEEffIAQA5CsLLESHrB7MLiS5919G4mb4fkhsOy+zIok2JzZWfJH4E7y6szxMto1LHli5E8MW82qlEgYb519yUQ99RWAr9GpvmB/kwI90wZv/fSr4bxliXSJ7Aa2sK71iBeNeCg6XtzHi0rE8ETiVMXSwNAbWrKQYrJxqzXuIQJiiX/DMnEtjJMlKmOXHwJ95A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fveucv3YLcZIR99K90Z5C/tVAVkHENqwEJf8S539mbw=;
 b=NUSmMNNnCMFf8ilk6eFqZlqZ2BcFtoEQOe28w5KpqO3h1Xh9ird9pBqT/IxnhQ/RajJHJhsnAdwDoxGHtOxigCg1vEa7yUXBafLRu0y/UbfuM1DKENW2kTPzJP7RJ74Q0pgZMoCwH0+6AgaCD80wVSowzjSsRb0BFSZY3dJZjY/zChZxS+9YINZtx0L3MJ7MA9j+5iaUxl+oZvCC9ADAj8JAEPp9/HEQZVQu1Gr607mJdKpyKF5e0MEk/1HrurxAadeHskABj6nXcdng5Dzlup7j1NPdZX+xfedxkiNR6SrC7aI8l1O+60k8sSYuwnEnlc+WEaWtq/8flrwoTcb4rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA2PR04MB10087.eurprd04.prod.outlook.com (2603:10a6:102:40b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 17:07:38 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 17:07:38 +0000
Date: Mon, 24 Nov 2025 12:07:31 -0500
From: Frank Li <Frank.li@nxp.com>
To: Carlos Song <carlos.song@nxp.com>
Cc: aisheng.dong@nxp.com, andi.shyti@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: Add runtime PM support for IRQ and clock
 management on i.MX8QXP/8QM
Message-ID: <aSSQ0wPU5I3Fss9s@lizhi-Precision-Tower-5810>
References: <20251124061743.1988773-1-carlos.song@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251124061743.1988773-1-carlos.song@nxp.com>
X-ClientProxiedBy: PH0PR07CA0032.namprd07.prod.outlook.com
 (2603:10b6:510:e::7) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA2PR04MB10087:EE_
X-MS-Office365-Filtering-Correlation-Id: a59e5735-e4f5-4ccd-ca90-08de2b7bf8a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zm1hd2orNm5Yc2NWb0lqbmNoNFhneE9KTmZmZTdmK0FCZXpqRDJnL1lnRVl5?=
 =?utf-8?B?NWw4N3ZZNUQzWFZMN0tHSTVhaXpySi9LZTZNSWhVWHgrMlNoZm9GVXBJL0ZL?=
 =?utf-8?B?azZkWU1jTnNIbnJoN0NySW5xcjIvWEsvc3ZSaXZ2REZWOFlCZ05IcUpZdGpC?=
 =?utf-8?B?TGJvOSt1WHpNTnJtVW10TjV1aUYxeGliN0lVZ0JlNk4zcWRIc3Y3allKc09F?=
 =?utf-8?B?b3dDVWs3dzRoZlI1Z1BoOE14NTdpenpJbUJaUFJ6ZWM4THNDL2xDOThITTVN?=
 =?utf-8?B?NHkwYzduRnFqcEFFK1JPNTFHV1BuU2RZU0Z2U2ErcEp3a3hqeEZHNmNCeDZC?=
 =?utf-8?B?OFR0TVErUzUrTmFIMWRNbmxVSVJBcmtQbHRhc0JhUmJwaFJBM2hyZ3hXUXgw?=
 =?utf-8?B?WUp0c2dSN1NFdWZlQmd2d2Zpa1c0SXgvSHlKTnFRQ2kzQm91WWhORUN0WG9p?=
 =?utf-8?B?OHpZU2FyVldsY0RkSmJCR2xUTmdQUDkvdlZXVHpSWmczUk52NXp4eGNhbU4v?=
 =?utf-8?B?eXJoTWRTdEhHcmVLbFEwZGp4Q3lpTkV4eWFUQkZWWTIyMklvTlRzZ0NwNTNv?=
 =?utf-8?B?K1luOWxjL3RpUXc1MnVBMEM4dmFFajdzdEJ1WmN0QSs4ZWZmWVhWdTkybWV0?=
 =?utf-8?B?MGFHRllnTVhCMmJobkpndnBEakNLc3ZOZWNKUGhRc0hQMkUycVNmL0tsY1N0?=
 =?utf-8?B?TWsrbWdhWFJmV3lEUmZUYTZ1dmRndncvME9nWW10NVduRHpuT2VDam9kMi9B?=
 =?utf-8?B?S2lrbG5zL3BoU05ZMUUrZ0tRY1kwWE5ydXZlUUpsRmFNcnRUODNudWpObUZH?=
 =?utf-8?B?VmhzZnRIV3VvYi9GZnlNTEV6TUpXVXVTYjdrRDRhRDZkWUZBZkJ3azEwN3Ur?=
 =?utf-8?B?U2lFa3F6ZnMwVHo1aS9ZNmZBaW1CWXRBWUJLLzlEazFxNEVjcmpMVUlmNngv?=
 =?utf-8?B?RTlDV1NabHlBdDZzL2VvNHJJeUNGemFuY1FncnFodDhWTlhxUEFORkVnNUxN?=
 =?utf-8?B?QUhJSDdjbjl3T1VPZjJrUlk3Tnc1Q3lWZ1NleGVkZnQxamdFR1ZEd04veWQ2?=
 =?utf-8?B?ai9GSVJzZmZ3WDNJSkk1czNqbk10SWtVaDVpeGEvWG9UWnZiN0Ntc2toWG1q?=
 =?utf-8?B?Q1l0WlRqazByMHB6ejg2NTc0UjVJazBPaVFCZWR4azh5VTNaQkNGSjNVWmtK?=
 =?utf-8?B?SHVYVjNjSkN1RU5zNFJIK0x2R3FsNE1ESnRpTXFOR29Jb2hPMUpzSFhWdkht?=
 =?utf-8?B?QmZzVU5hVEpzY0w0emkvRFFjZ2NGSHFRbUVTQk9QWE9zd2p5aXBhSXhCOFlv?=
 =?utf-8?B?cWNSZVphNzRFQkNWQWdnZ3BhaDc3Y2IxTG9NWXhmSHhHNCtRY3BBNmxLQzYr?=
 =?utf-8?B?Y2dkZmlyK1ZkU0dPbGF2czl3MnRMalFVNG91SE5SNzE2clYwclhSV0ZVY0JR?=
 =?utf-8?B?Vk5GdGJwS2lmbzRObXE1MjFSRkJXNlZFcWpjd0MwTzZ6UzVkaitXQllyY3pD?=
 =?utf-8?B?Z1NGVmZPRTBsUWoxOE1DZjRMSkg0LzJPQjlGNXVxVDMyb1B1UmhlL3ZYNGVv?=
 =?utf-8?B?TU9xSmhIVU53SUpYbElKUVhYaG9NTlY4eGpVMitKNHJpUDA4bXNzUXgyWkRs?=
 =?utf-8?B?YW9FQ3AxQzEyODcvT2tQVEUzMG4vcHMvL2dnLytQV1hrdjBBWW9jNzFZempj?=
 =?utf-8?B?a1Zha0NGQnhDYzkxQkJYV0dheFhTQTNheEwycEI2QTdwT3E2NE5KVEhCVlFL?=
 =?utf-8?B?K2lIVGlORndCZ29JSFpKZW90UWFJZkNBSzRjSWFWYW9INmJQVGZJT0RyNkMw?=
 =?utf-8?B?QlB2aVgrQi84UXNFVDlmeHQrQ1VtUVg0UXFNcFo2Z0I2ME9iNStBYXVhWmtR?=
 =?utf-8?B?TWhhRC9HNzRFelJlYXc4MzJJcjB0YXhkd0ZCdXJRWU03TjVpWTBNMm1BNzl1?=
 =?utf-8?B?RDhIaWtjdVpoYnRyaURYWlZGSTlmUzRITmJlaUpxVHRNUGRQRFZuQzhKRDlC?=
 =?utf-8?B?K0F3NVhWak5VZ09meGl5R0FQUHltQllYZHhmbG4xYytjN2tWSE10Tlk4cWZn?=
 =?utf-8?Q?lEtir4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2daTFJjTHEySnpsUDVzZ3o1U25oV2hDcGdPNklRRzJYME9BajcwWGh2ZGNM?=
 =?utf-8?B?bU9TaC9FVXhBeFluQ0VTUnhuMlJVUHQvVzYvRkZMTTh1aDJKZWZzaE15RGNt?=
 =?utf-8?B?bTZyeS92akd5VmZTZmV2ajZ4YUhWR2NyZ2U1TTNhc2xLbWpMWE1aU3BCdzVw?=
 =?utf-8?B?bnhBUS9UWFRnOUo5UUNwQzFrUWhXd3V5Nmsrd1doQzN0MXZiNXZ2RmpqdDlu?=
 =?utf-8?B?cGg2L0E0SWM2WlRLaUxKK21CZm8rNmpYTDBESzRsT2U4MG1oWDZOT2JucEhS?=
 =?utf-8?B?MEVveTNsZWNidFpTaUlrem9TbUxQR010Um1RYmhCZ0JvVmhzWW1neXJOK3VQ?=
 =?utf-8?B?U2VVNHJvV2lNaUh0RmtOZ1UxTHVvOTZlT2NWYTZLQ2F6ZlFJaytkblZkTDln?=
 =?utf-8?B?MDIzR1JZWklRTTM1bUxCb09hT3JCN1k2Yzc1U0UyN3NNMVVJN1pqRlVjWFk3?=
 =?utf-8?B?N2g3ZjZIMzdsT2E1VkF0VFpxK0dkaE4xNVYvNXd3RTdyZlo4MkFLNjU2YWdq?=
 =?utf-8?B?dmwrR093c1B0WEJKK25nU1VrdWE4UjQ2ZE5hZnpwb3YrbEJMK0F5MmR3MGV5?=
 =?utf-8?B?akV6bGNseDV1dHM4Sm1ncCtXbU9kUms0NlZmUldRU1JGMEU3RVUzQU8zK3Vi?=
 =?utf-8?B?azdWRElKOEoyT0cwVktHUmM2YytmOUZZa2c3ZysrcDJoWnQyRUNnM0tHbUxU?=
 =?utf-8?B?ZUhkZy81bitmUURQaktpZGV4YzlLSHJKS0p3UHhXSGFJMnN2QzZ0a1JCSDZC?=
 =?utf-8?B?aW96U2UzSW5MclNPeExKdDR3eU9sSGpsWE9XbXhnQ2xtakgrRjh3YVRNc1l4?=
 =?utf-8?B?anVGWVF6U0pCYkF2TXQwRnlCVnRQb2d1b0ZNZHVyZ0NMVXg3VGd3bmprQk55?=
 =?utf-8?B?YzlLbWRHZUlMK1lMckxHaGN2emcwMnhvS1BwVHlUZE5FMWJwUko3d2JVWFJw?=
 =?utf-8?B?WWlwSGxKcUdNbU5hanZ1QmJmOWFaRGlzNTJDNHgyY0orU2wxZldxbVEwQ0E3?=
 =?utf-8?B?Y3ZhK1I3aDVjQWs2MmozdVdrYmdkdDZZVDJqSmRUZmNyZWRLMmVSemJDbWtK?=
 =?utf-8?B?T0RSMyt2dWh2VUdEeXZSNlNUTzNjZTc1Q3JhbSs3L1ZxZzNmc2lEOWZBUkh4?=
 =?utf-8?B?amhMaldGbG1HVFhhVTRYaFFyaUhNT2EyVFVDTWlsMUx2bkNwTnJFMHlYOVYw?=
 =?utf-8?B?SGgrMFFBZlE4MUNJWUI5eEQzbldXMzNXeUtUc1FFK3JuQzJBVWZqdXhSUEZw?=
 =?utf-8?B?aHZpY0hRaStRRVR2cElDb1NmeHd0b2dERWhxcHlpUWZ6dGtReDFLVkpmQTZr?=
 =?utf-8?B?VDZtQTVOdFpiNVhieDIrZzBOYXg1Uzl4TVRTWjcydjMwSE9kRThMRWk3aUti?=
 =?utf-8?B?YWYyM0JINU9WM0ZiR3Z5VTlaRENtQmFDYjFHd3I1bnQzRGlodHZPQm1STFcx?=
 =?utf-8?B?T2FHb01MSUVpUVNEZXpCRFlWMFRKTGNCVEUyUVA5QnBDVnBoRzhUQ0VNMllk?=
 =?utf-8?B?MFpVN1JHL2ErZFAxSHphUm1hWkxaQmlRaGdqT09vSVoyQ1N1Sk5yMU5objhm?=
 =?utf-8?B?c1BHWE55RUJDNUtQZUdwa3Nvd1NFNkNQcWJkZ09RRDhObHlNWnhvUndIcWp1?=
 =?utf-8?B?aEpRZzhjamgzeTB6UWdZTU5OVG05eTUzWDczd0puQ2dFQW1wV0h2bGw1RDFl?=
 =?utf-8?B?L2hxV3lPMmhKbDdoSGVVL0pySjRkVkRsOEc5VEh5alBXb2I5WGxqRGlLbmRp?=
 =?utf-8?B?VXNnMUtjREhWLzRHSTZRMnhEazBYa0prVTV5NXBKMkU4RzVuT0I5ZGZxODYw?=
 =?utf-8?B?TVFPVTFOT2kwT3BxTEUrd3JYeDBxcFBxT1ZVWDc4Sk0ydUMxRkdoTEZESTVW?=
 =?utf-8?B?M0d0dmZkTk9oS2syd0Rnek5QYmNBK2JNQVNsNDU0elZ1elA1YmxnTndoTEVR?=
 =?utf-8?B?dkFLZ0pocnJWaGp6Y055ZU95L25VeHZJd3RrWmpNU2xVbjE0VmUra2UyRmov?=
 =?utf-8?B?dU9Wand0Q29lcXlnZ2U5ZkQrWUVad2xuOUQ2N0svUEFuQzVmOWYvSEdmMG8w?=
 =?utf-8?B?Sy9na2RBbVNITlJOR0t6TXFjRFBKdmRhYmZ2TElIR3ZCcyswWWE5bjZpM0lO?=
 =?utf-8?Q?F9Cs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a59e5735-e4f5-4ccd-ca90-08de2b7bf8a4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 17:07:38.7535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IG0e1sQmKkfLieiNK3Bwz3QJdAQ7BUOfMgmj+JFxm4DgRQx/nXGFh2EYFZsO0Jbx+TFn2snu0vVaPTkIse/VFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10087

On Mon, Nov 24, 2025 at 02:17:43PM +0800, Carlos Song wrote:
> On i.MX8QXP/8QM SoCs, both the lvds/mipi and lvds/mipi-lpi2c power domains
> must enter low-power mode during runtime suspend to achieve deep power
> savings.
>
> LPI2C resides in the lvds-lpi2c/mipi-lpi2c power domain, while its IRQ is
> routed through an irqsteer located in the lvds/mipi power domain. The LPI2C
> clock source comes from an LPCG within the lvds-lpi2c domain.
>
> For example, the hierarchy for lvds0 and lvds0-lpi2c0 domains is:
> ┌───────────────────────┐
> │ pm-domain : lvds0     │
> │                       │
> │    ┌──────────────┐   │
> │    │   irqsteer   │   │
> │    └───────▲──────┘   │
> │            │irq       │
> │            │          │
> └────────────┼──────────┘
> ┌────────────┼──────────┐
> │        ┌───┼───┐      │
> │        │lpi2c0 │      │
> │        └───┬───┘clk   │
> │   ┌────────┼───────┐  │
> │   │       LPCG     │  │
> │   └────────────────┘  │
> │pm-domain:lvds0-lpi2c0 │
> └───────────────────────┘
>
> To allow these domains to power down in system runtime suspend:
>
> - All irqsteer clients must release IRQs.
> - All LPCG clients must disable and unprepare clocks.
>
> Thus, LPI2C must:
>
> - Free its IRQ during runtime suspend and re-request it on resume.
> - Disable and unprepare all clocks during runtime suspend and prepare
>   and rne ble them on resume.
>
> This enables the lvds/mipi domains to enter deep low-power mode,
> significantly reducing power consumption compared to active mode.
>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
...
>
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 39088567db59..87e34746fad3 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -132,6 +132,7 @@
>  #define CHUNK_DATA	256
>
>  #define I2C_PM_TIMEOUT		10 /* ms */
> +#define I2C_PM_LONG_TIMEOUT	1000 /* Avoid dead lock caused by big clock prepare lock */

Add unit, I2C_PM_LONG_TIMEOUT_MS,

You'd better add more detail about why need longer PM TIMEOUT in comments.

>  #define I2C_DMA_THRESHOLD	8 /* bytes */
>
>  enum lpi2c_imx_mode {
> @@ -149,6 +150,11 @@ enum lpi2c_imx_pincfg {
>  	FOUR_PIN_PP,
>  };
>
> +struct imx_lpi2c_hwdata {
> +	bool	need_request_free_irq;		/* Needed by irqsteer */
> +	bool	need_prepare_unprepare_clk;	/* Needed by LPCG */
> +};
> +
>  struct lpi2c_imx_dma {
>  	bool		using_pio_mode;
>  	u8		rx_cmd_buf_len;
> @@ -187,6 +193,21 @@ struct lpi2c_imx_struct {
>  	bool			can_use_dma;
>  	struct lpi2c_imx_dma	*dma;
>  	struct i2c_client	*target;
> +	int			irqsteer_irq;

irq should be enough

> +	const struct imx_lpi2c_hwdata *hwdata;
> +};
> +
> +static const struct imx_lpi2c_hwdata imx7ulp_lpi2c_hwdata = {
> +};
> +
> +static const struct imx_lpi2c_hwdata imx8qxp_lpi2c_hwdata = {
> +	.need_request_free_irq		= true,
> +	.need_prepare_unprepare_clk	= true,
> +};
> +
> +static const struct imx_lpi2c_hwdata imx8qm_lpi2c_hwdata = {
> +	.need_request_free_irq		= true,
> +	.need_prepare_unprepare_clk	= true,
>  };
>
>  #define lpi2c_imx_read_msr_poll_timeout(atomic, val, cond)                    \
> @@ -1423,7 +1444,9 @@ static const struct i2c_algorithm lpi2c_imx_algo = {
>  };
>
>  static const struct of_device_id lpi2c_imx_of_match[] = {
> -	{ .compatible = "fsl,imx7ulp-lpi2c" },
> +	{ .compatible = "fsl,imx7ulp-lpi2c", .data = &imx7ulp_lpi2c_hwdata,},
> +	{ .compatible = "fsl,imx8qxp-lpi2c", .data = &imx8qxp_lpi2c_hwdata,},
> +	{ .compatible = "fsl,imx8qm-lpi2c", .data = &imx8qm_lpi2c_hwdata,},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, lpi2c_imx_of_match);
> @@ -1440,6 +1463,10 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
>  	if (!lpi2c_imx)
>  		return -ENOMEM;
>
> +	lpi2c_imx->hwdata = of_device_get_match_data(&pdev->dev);
> +	if (!lpi2c_imx->hwdata)
> +		return -ENODEV;
> +
>  	lpi2c_imx->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>  	if (IS_ERR(lpi2c_imx->base))
>  		return PTR_ERR(lpi2c_imx->base);
> @@ -1448,6 +1475,9 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
>  	if (irq < 0)
>  		return irq;
>
> +	if (lpi2c_imx->hwdata->need_request_free_irq)
> +		lpi2c_imx->irqsteer_irq = irq;
> +

Needn't check this flags here, just uncondtional save irq number/

	lpi2c_imx->irq = irq;


>  	lpi2c_imx->adapter.owner	= THIS_MODULE;
>  	lpi2c_imx->adapter.algo		= &lpi2c_imx_algo;
>  	lpi2c_imx->adapter.dev.parent	= &pdev->dev;
> @@ -1492,7 +1522,11 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
>  		return dev_err_probe(&pdev->dev, -EINVAL,
>  				     "can't get I2C peripheral clock rate\n");
>
> -	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
> +	if (lpi2c_imx->hwdata->need_prepare_unprepare_clk)
> +		pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_LONG_TIMEOUT);
> +	else
> +		pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
> +
>  	pm_runtime_use_autosuspend(&pdev->dev);
>  	pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
> @@ -1544,31 +1578,78 @@ static void lpi2c_imx_remove(struct platform_device *pdev)
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  }
>
> -static int __maybe_unused lpi2c_runtime_suspend(struct device *dev)
> +static int __maybe_unused _lpi2c_runtime_suspend(struct lpi2c_imx_struct *lpi2c_imx,
> +						 bool need_request_free_irq,
> +						 bool need_prepare_unprepare_clk)
>  {
> -	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
> +	if (need_request_free_irq)
> +		devm_free_irq(lpi2c_imx->adapter.dev.parent, lpi2c_imx->irqsteer_irq, lpi2c_imx);
>
> -	clk_bulk_disable(lpi2c_imx->num_clks, lpi2c_imx->clks);
> -	pinctrl_pm_select_sleep_state(dev);
> +	if (need_prepare_unprepare_clk)
> +		clk_bulk_disable_unprepare(lpi2c_imx->num_clks, lpi2c_imx->clks);
> +	else
> +		clk_bulk_disable(lpi2c_imx->num_clks, lpi2c_imx->clks);
> +	pinctrl_pm_select_sleep_state(lpi2c_imx->adapter.dev.parent);
>
>  	return 0;
>  }
>
> -static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
> +static int __maybe_unused _lpi2c_runtime_resume(struct lpi2c_imx_struct *lpi2c_imx,
> +						bool need_request_free_irq,
> +						bool need_prepare_unprepare_clk)
>  {

look like both helper() have not big beneafit. you can direct put code
in original lpi2c_runtime_suspend() and lpi2c_runtime_resume().

Frank
> -	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
>  	int ret;
>
> -	pinctrl_pm_select_default_state(dev);
> -	ret = clk_bulk_enable(lpi2c_imx->num_clks, lpi2c_imx->clks);
> -	if (ret) {
> -		dev_err(dev, "failed to enable I2C clock, ret=%d\n", ret);
> -		return ret;
> +	pinctrl_pm_select_default_state(lpi2c_imx->adapter.dev.parent);
> +	if (need_prepare_unprepare_clk) {
> +		ret = clk_bulk_prepare_enable(lpi2c_imx->num_clks, lpi2c_imx->clks);
> +		if (ret) {
> +			dev_err(lpi2c_imx->adapter.dev.parent, "failed to enable clock %d\n", ret);
> +			return ret;
> +		}
> +	} else {
> +		ret = clk_bulk_enable(lpi2c_imx->num_clks, lpi2c_imx->clks);
> +		if (ret) {
> +			dev_err(lpi2c_imx->adapter.dev.parent, "failed to enable clock %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	if (need_request_free_irq) {
> +		ret = devm_request_irq(lpi2c_imx->adapter.dev.parent, lpi2c_imx->irqsteer_irq,
> +				       lpi2c_imx_isr, IRQF_NO_SUSPEND,
> +				       dev_name(lpi2c_imx->adapter.dev.parent),
> +				       lpi2c_imx);
> +		if (ret) {
> +			dev_err(lpi2c_imx->adapter.dev.parent, "can't claim irq %d\n",
> +				lpi2c_imx->irqsteer_irq);
> +			return ret;
> +		}
>  	}
>
>  	return 0;
>  }
>
> +static int __maybe_unused lpi2c_runtime_resume(struct device *dev)
> +{
> +	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
> +	bool need_request_free_irq = lpi2c_imx->hwdata->need_request_free_irq;
> +	bool need_prepare_unprepare_clk = lpi2c_imx->hwdata->need_prepare_unprepare_clk;
> +
> +	return _lpi2c_runtime_resume(lpi2c_imx, need_request_free_irq,
> +				     need_prepare_unprepare_clk);
> +}
> +
> +static int __maybe_unused lpi2c_runtime_suspend(struct device *dev)
> +{
> +	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
> +	bool need_request_free_irq = lpi2c_imx->hwdata->need_request_free_irq;
> +	bool need_prepare_unprepare_clk = lpi2c_imx->hwdata->need_prepare_unprepare_clk;
> +
> +	return _lpi2c_runtime_suspend(lpi2c_imx, need_request_free_irq,
> +				      need_prepare_unprepare_clk);
> +}
> +
>  static int __maybe_unused lpi2c_suspend_noirq(struct device *dev)
>  {
>  	return pm_runtime_force_suspend(dev);
> --
> 2.34.1
>

