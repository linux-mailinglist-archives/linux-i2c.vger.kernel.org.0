Return-Path: <linux-i2c+bounces-14262-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C05E4C85FBB
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 17:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AFC1F349AF2
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 16:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7406532937A;
	Tue, 25 Nov 2025 16:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iW9KxpoO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013012.outbound.protection.outlook.com [40.107.162.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30C6328B76;
	Tue, 25 Nov 2025 16:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764088317; cv=fail; b=WWdPRA9arLSp0JZmrdqa59BxbdbwKbF0KwmvJ0LggCtxRyFxEikgzFuUYUTciI4jNVzvigjemSVE2JzXGRfcPzyBbnbKS4TYXpWz4EMGrDKxnUsAUvM872QfsRnbiaFhbZmP1pXTGwOT0kZBQWUW1y9RSFNfR7uteIkUzY9AS/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764088317; c=relaxed/simple;
	bh=Hv1YQerE/HI9LQ9SRtEX7g8QqRwEttCWACjsCjyoeKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rPSZyPnoJ4/DQhWXDgi3V//rSh8/8UQlXrEHC/+rR1yDqFnLnXHdAQS13o3Lnf9PW26GdVq1ZpjukDQgGzcxFhW621il7NL+qUy4i+seUmM0DuRW/Ugub7ar/A0q7flAYUJdg/QBu+qECn4aaotnt2opNtqvWZGfYvLKIrOUxLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iW9KxpoO; arc=fail smtp.client-ip=40.107.162.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujFA14rvbjhQMIrhPIsrtxHAPk+tWyOIWIEvr1eAIVwv6w8g/zT25nQNzqbPEDRv5sP877bY81KxjigpjKsHe7ZNZAgbx/N1BXUqs3SO0IYjqeXApqYngaFPtY1FoYlcDme4n8UfnyK2k4B2aB63iYjRqMPJltT0eC0XSNtgALc0K8aR74RGO2EvRKlj/3+WqbYS6+txN9LOA64dxwDI43Pzpu4u59L1c0pnePu6qqimzy7E54hh4zj5/fZTgzsFu39nRyfTZ1fngvwtbBdlbFxkWvbQrwoDQ7Rt1yaexuiHo1nPNKl+GHOGQ/9XzQQILMHw+/EnsxCY+CbY74NbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yCAGBNpmSUo5p1q2NjTmfgvppJVG2i/PLStGFE5lUw=;
 b=Of9J4t6wE+5A0AIOXpa6ePRH9rjcVRwWYwB5uK8/iMgSJPCKgx53ksNE3fP83NZXg2ixIicJ0E352wIS5ELdHAXAe6SDeqGMnnvWMPGPpfFMcDU89f9Eub9ntA9Y0pOvwYuJQk9Phjv5hxq6lorja8yoRUDvtv7zPeynWEdalu6uygxxOKrXey3MFaXUGASZm7HfL2atMv+GcFHdDByqp4ifI6NlVpSvbn1ceOwtNe+m+jzNh52M1f/WKFg+n7oKwmvo5vdurBScCkz0Jb2lvIml3TC3U3l9HGWJyh4V0oC/TM4nmTetmh4mOd6//Hfd+B9QlOSKbmzSdLQ3Q30/Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yCAGBNpmSUo5p1q2NjTmfgvppJVG2i/PLStGFE5lUw=;
 b=iW9KxpoOztIQL5J7MjzlVOtlhk555LXeISj3+kdDtPMHdxfUir8cHMJoo0XuOGkrs4PMDIE4fkYvlImZUz7uRFlda8V2OAF8dJXY1api71GJqw89HiQ7CLcu3FLZz7BDsdZXOHyDI30Dl7Du4axfl2WfD/KfzkJWRbR8Ujpct8f6GFKGjm0ibMkEGq9cvJZr0iT4+/TCGPHrddijHvIxpf0pUX2nBIfwdKzSVBc+XgEyV4UL23W0aXM5mvybG6pkt/IWaNbPgtc+lUVNldXHMHgbY9/YPtaRbGgwHbnMX5EWP+ovJikQB7g3QAhYXEU/jW8OyY4Rhl5hstcnT09xWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA1PR04MB10367.eurprd04.prod.outlook.com (2603:10a6:102:441::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 16:31:51 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 16:31:51 +0000
Date: Tue, 25 Nov 2025 11:31:44 -0500
From: Frank Li <Frank.li@nxp.com>
To: Carlos Song <carlos.song@nxp.com>
Cc: aisheng.dong@nxp.com, andi.shyti@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: imx-lpi2c: Add runtime PM support for IRQ and
 clock management on i.MX8QXP/8QM
Message-ID: <aSXZ8LntcvsvpKSZ@lizhi-Precision-Tower-5810>
References: <20251125084718.2156168-1-carlos.song@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251125084718.2156168-1-carlos.song@nxp.com>
X-ClientProxiedBy: PH8PR21CA0013.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::22) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA1PR04MB10367:EE_
X-MS-Office365-Filtering-Correlation-Id: 984f5611-42d8-4e56-923d-08de2c4022da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGNLbnpSYXpaTGk5MzE1MVlydWZQY3Z2TTNpVTRXWVphRnVKUVVHUE5wRmZS?=
 =?utf-8?B?TGdjYkIyejBXckFZbGZUM2FZU2xybjlpTkU0N25ZeG1mWTN1YmxjU053N3E2?=
 =?utf-8?B?QW5FQnc0Qm1QRnRMbVYzOStWWng3TWZ5b29YeXdZOWFLektQQmEybTVHYlpK?=
 =?utf-8?B?RHdhQ1lseE1OKzZMNmM2bzVkVjBOTXh3alB4ZG5MRlhTK2FqZ2tuUkJxYjZQ?=
 =?utf-8?B?bUFVMURmYVBnckQySDJKUW5GVk5la25DSVJwMUtuWjBES1JISS9WR1ZjSEV1?=
 =?utf-8?B?Y01qMUdQVWtUb0pJKy83WmxOWE85YnRtaklqUUdYS1ZGakxYRzczUnZMajl0?=
 =?utf-8?B?dEtLZVUrb3M0d25WNXlEeE5lSjFJcXExNVc2VVVGdG9qRzRCZ3hiQXpiRVRZ?=
 =?utf-8?B?N2t5Ry9jY2NnVWVCTTNmQ2ZRWngzTmJYN2hOalVucEczYWMzNlMrT05RS3ly?=
 =?utf-8?B?TmxscVViejNYcW9KTFdkT3VJL3VIUlZrcWd4QzM5VW82WHFKdFJnUnlieEY4?=
 =?utf-8?B?SzBMcm9NVlZqMWcwN21GVGJYMjRYbVVQVzVIcFJiRXcvNDZxRVhGVjZNL05D?=
 =?utf-8?B?djVuOHMzTFFIRGtEdkVGOU4ycFY2S1Y1U3ZHcllWMHMyOTB5MU1yK1h6WnJM?=
 =?utf-8?B?SmdIV1hrUE82QVF3U1VpK2RiSm01Wlo0K0Zzb3dkYzZ0OGkzWDdmNXJrWDRT?=
 =?utf-8?B?ZEk1UEd3cjJKcVM4WUFybUNtZ3VTcmsvQm1oc0pwQ2lNZ3BWWUlld3dWYU5y?=
 =?utf-8?B?V2xEa0w4L3lSbjArSGZHdm5aNnRxeHlUZ2pjYjBJNy9RVTRxTnFvQVV0d0tu?=
 =?utf-8?B?d2lkZHpnQWt0d1l4bnptaU4wczcwbzE1QnltOE1MdEtpejFMOFR4akZLZzZp?=
 =?utf-8?B?T2E2eWRsa0ZqdmR2S1ZESkdxRytIU1hmTlRQTHJORnFydnEwL0dZU1B6YU9R?=
 =?utf-8?B?TzM5SFpWNVBIVGZrRUZHanIzaDVZWlVFdjEwbHFYaTk4c21GNlhhOTJFSzBX?=
 =?utf-8?B?Ull2U0JFUEhvTGhOS2VJdUtEMEZESWZ4QlpQbytZMVdyL3NCTXpYYmZOTHd1?=
 =?utf-8?B?OVNiaEdXQmtpZnJ3T0tJVE95U0JzZFZJbVlnU0hyRlErRk9ONFNQdWJUbkky?=
 =?utf-8?B?VW42c1llOEdIZTUxaHN1MEhSTHV3M0V4eEtBNERuMlFXNG1JTTNvZDdSMzZx?=
 =?utf-8?B?eDBSSk0ybnYxZUpwU0JTcktxMkllZ3JyYUJKSWJKSU1JQkpyQmFnek5sOFZ6?=
 =?utf-8?B?cnJmR3RiaEUwZ3RZK2J2YnRPbVlyZ3ZCNWJ3VC9oMW9sOVJIbU5vQ2YwUzkv?=
 =?utf-8?B?blFpZ2hlMzJLajI2MHM4SEc4UjVUdGM3UjZaQVVmL3ZrY2g1VzNDRlZwQVdR?=
 =?utf-8?B?aWdNbFZsb2ZoYjBxRDJXUlN2ZjlGSC85YlExcS8rQnh4MXN6eXZ1WjRCQTRy?=
 =?utf-8?B?YzVYNEg2ZXI0TytDdEJPVmRWeVZZOGIxMmVYbUliTU1ua1BRQXhnaktHdklR?=
 =?utf-8?B?QWdoclMrc1BBakdlZ3JkenhISnA5eTkrb3d3RkJkSzRrdFNrR1lLTldvOUNI?=
 =?utf-8?B?YUh1c3o0VnJnYWgvSjVuS0VaS2FQMjQ3bVdKdDBCNDVla3hlTmtrSDJwdFJW?=
 =?utf-8?B?TzVaUW9OWkpVbXlhZ1U5V3RIQm93NHJ6dFUyNmdlNE93b05OR0QzTVU1cGwy?=
 =?utf-8?B?TS9ZcXJBbDJJejN4Wk9oT2QwUnd2NnM4NFlrM2dBRVNRK1NpNmgxSkxHVk1R?=
 =?utf-8?B?SlZZSlhlTTVKbHRjazUxbUdERUk5NWhOdDZjMG05ZDJnY3N5aDFRV1BWcEZJ?=
 =?utf-8?B?Y3hqeFpSNkdpK1RPR3N5SEZhVXBZdjJ4RzRxcVFsb1dGSkxsKzRzeVFuRm4x?=
 =?utf-8?B?TTlGU0N6WkNLRzBaalRKMnQxcVgyUG0vQTVTdi9zdnlPWE5RaUVjc0JCR3lF?=
 =?utf-8?B?djZpdUZCVGVsWmlXb0ZRSS9WY2xBN3pqd3g2d3VDWEFkK2ZNMHdEWFJWOHBI?=
 =?utf-8?B?aGxJaGxkWjNJbXM2U2VsWWgzNXRNbGFRczk5N0J1SUVsSnhYR3pPa1hSckNP?=
 =?utf-8?B?a0EzMkZRTHozZzVQNTB3dmZnczhuanFXaUZsdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U284emE0cjVRT2pKTjN5UXBnT3RpeDlwSVNWSlRBSmpvaTVXUW5CbWd1aE5l?=
 =?utf-8?B?ODRUanRTVFF6Tk9pL3NCNlVENnRnT1NWZ2V0K0p4dmJ0SVVHbWlVMmJpV1Z0?=
 =?utf-8?B?WldrUGFHdXRxUzlZNlhaV3IyU3ZzaEMvakxlUUUvSWRxK1hoRUJXVEtSVHdP?=
 =?utf-8?B?L2ZiZ0RkMmpOeXJPQnlCdm81RVpZUENucHVhaTZEVE16eDRrRlBvVHpNOEV3?=
 =?utf-8?B?ckhNWXI5NElGZy94Vjc1eVFsT1ozUU1MbDJ0Zm1QTDhJWkZXbW1RYlJTejNP?=
 =?utf-8?B?UFZqNUpMK1FMU0thS05SbFNOWkNDbENsRFVpeWJsazJlZVVkUE1FRURPVWJr?=
 =?utf-8?B?U3NpeEs0elc5ZlRIOUlLYnphTnlFQWhvQWtKYUIvbThWM3FYTWtuN3M5V1dp?=
 =?utf-8?B?V1hSZ0xmOEwxRWdvWDRHV3JJZTMzNHVlZmJpOFJnT2JRQlFLOHZSOURGS2lJ?=
 =?utf-8?B?cjJOQ1BTdjZHNjlOM01kK0Jrbi9LbENnM2NMTExpNmozUnlRYUdTa0NWRW5O?=
 =?utf-8?B?M0RaM1JUNnNWSERpSWN4U2hRNFdFcGsxSU1MZS9sWUszRDZVMFhzNFFicjZB?=
 =?utf-8?B?OEdPanBiTjgyaUFsZGcrdCs5U3FOWXBaZEEzWkJWZTFyeGFKVzY3NEswOGxM?=
 =?utf-8?B?SHp3YTF6U2E1Yi9nQ2FPdTFhTUhuVldWT1ExUHJwQ0VBK3crYWpaUmF1WlZZ?=
 =?utf-8?B?eElUQWpNL3VLdXRTT0M1ODlVc01QOEFhVHJZaXM5VStuS1BBRjRkbll1b3li?=
 =?utf-8?B?dmg5aTF1TXk5TnVvWWRNWWFsbHh0WnhGZ2NRTkZNOVgxYTE3RVVqVUFDdGl2?=
 =?utf-8?B?OWhmN3FyYmZ4MTZHRnR2Q2xtOW5sakkzTjU2WXBGNzRMUzhsNjQzSkxUaDFO?=
 =?utf-8?B?ZStBSmRqWENNUzRzd1A2am9RcDJpZDQxQU1lUjNJWXVZV0FrOTJMT2V6K0Zn?=
 =?utf-8?B?Q3hBZFRQYUdiMU83RFJPMk9hSjMrWmVLaUZ6anhHSGtiZ0RGWU1VWjhUTnZh?=
 =?utf-8?B?OUo4OUZTV3l6VkJXcUFWOEJlMUprMk5lV2ZrckU3b3lLUXF2dTBseC81S3Ux?=
 =?utf-8?B?QmJEZEJIemRjaDZlVXh4N1JuNTZLN3AxZ2pWVS9RdU9tMmtNdnBVdGFrYzRp?=
 =?utf-8?B?dXV0SXEweGJjMWFmL0VEMXpPcEh5b3JIYkd3TXgxdmRmbFljaTR5aTJwa3R3?=
 =?utf-8?B?SjN2UEpEYzRUVkE5anQ0Vi9LRWpVU1VzWnIxZDBLVmdCWVRGWjVENDR5bi9h?=
 =?utf-8?B?WTBCTitVSHBoUDZqQmtkRVRoS3NKUWlsV0VDQ1ZNY3poK2JJdWVPMldJc1Nh?=
 =?utf-8?B?Y1Q4RDRHVDltdjRzeUIyUkpzYWcrQjhVajdBVFRERHVodDlIQ3pvYkdmbWJW?=
 =?utf-8?B?aVorT2xPVno5YkJqVnVTcEp1NFcrS0s1eUdmYWpobGJKNDg0N1dYMkwvMGw4?=
 =?utf-8?B?S1c1cGhOMTlxMEhjTlBzRTcvYm92aFV3bXRQc3dtVnNyRTU0RVN1aEQwQTg1?=
 =?utf-8?B?YVl6QnFyY0lIc1RIR0szZGR4eFlJalFPc2RUbEw3SVhGWGpqcklZeGlEOWI4?=
 =?utf-8?B?N08waVB4TWpsdVdsTDNFWm5iYkw2MFkrYk5BNGtUTnBocTVrR0s1UlFxdndM?=
 =?utf-8?B?WEVXZ1pVSk84MXRLdDdISGNtSWlWYXU2TlpRdE93YlhUaUlvbFFoWXJiRG5G?=
 =?utf-8?B?MCs5aTJjUDRpNHpZNkJKUjUwbW9GYjJ3UVdoRzEvQ2JJZG9JdTVOUmpINEhy?=
 =?utf-8?B?Z0FmK2FDaVZ3cW1DT0hFYXZCdURsNUpjM2dqbWxuZWJBUERxeEZWRjJOTWth?=
 =?utf-8?B?WnNKcGlyUEhnRC9VdmprQjRUa3Y4TDB2OUVGWlBNTmdMYSt4aUxyTkhUTlZw?=
 =?utf-8?B?eER4WFlMbFdQdTZ3eFg3TTVTcnlHL3VWakMyWjExNVlLSzJQWDc4OFAvSXBH?=
 =?utf-8?B?eWl6RzQ3Z056TVplYXd4SjJsZkdES1Q0NDduNEFUWVZLZzBOZXlEQXlsNWtO?=
 =?utf-8?B?NWtHdmJjZHBIU1ozM1lSZ090Z2dNSVJYWElVejBqdnpLYWFaQjhxUmxjYzlF?=
 =?utf-8?B?ZFZSbStrRk5YQ0krQk9Oc0IrRXMzQVZNTXVmdHpmTk1pZ1BuMGlsOUJzLzZV?=
 =?utf-8?Q?aoZYGWGEBUJlDPozml14o2Y4O?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 984f5611-42d8-4e56-923d-08de2c4022da
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 16:31:51.7011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfkOkCiQsFuWerOXXaVr3RKCCgZwkNe0wkYWKlGU3oi60EyM51/AMrhPkK4GCdvFL9hF7d9A9LQCecaXYwZdHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10367

On Tue, Nov 25, 2025 at 04:47:18PM +0800, Carlos Song wrote:
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
> Changes since V1:
> * Add unit for I2C_PM_LONG_TIMEOUT to I2C_PM_LONG_TIMEOUT_MS
> * Reuqest lpi2c_imx->irq uncondtionally
> * Remove help function and direct put code in original
>   lpi2c_runtime_suspend() and lpi2c_runtime_resume()
> * Give more comments to explain why prolong PM timeout
> ---
> 1. Why not apply prepare and unprepare clocks management for all platforms:
> As the report from me early:
> https://lists.openwall.net/linux-kernel/2025/07/01/139
> Scope of global prepare_lock is too big, it will cause dead clock
> between RPM and prepare_lock in some specail case. But clock
> prepare/unprepare is also necessary for low power consumption in I.MX8QXP
> and 8QM, so I add separate clock management for these platforms to
> avoid impacting other I.MX platforms. But it's possible that some
> customers might encounter deadlock issues in IMX8QXP/8QM, so I prolong the
> runtime PM timeout for 8QXP/QM platforms, which is currently a suitable
> workaround method I think.
>
> The dead lock happen as below call stacks
>
> Task 117                                                Task 120
>
> schedule()
> clk_prepare_lock()--> wait prepare_lock(mutex_lock)     schedule() wait for power.runtime_status exit RPM_SUSPENDING
>                            ^^^^ A                       ^^^^ B
> clk_bulk_unprepare()                                    rpm_resume()
> lpi2c_runtime_suspend()                                 pm_runtime_resume_and_get()
> ...                                                     lpi2c_imx_xfer()
>                                                         ...
> rpm_suspend() set RPM_SUSPENDING                        pcf857x_set();
>                            ^^^^ B                       ...
>                                                         clk_prepare_lock() --> hold prepare_lock
>                                                         ^^^^ A
>                                                         ...
>
> Task 117 set power.runtime_status to RPM_SUSPENDING (A) and wait for task 120 release clock's global prepare mutex (B).
>
> Task 120 hold global prepare mutex (B) and wait for power.runtime_status finish suspend (A).
>
> So if RPM doesn't enter auto suspend too quick after hold prepare lock, this dead lock can be avoided.
> So I prolong the runtime PM timeout, it can ensure that LPI2C does not enter auto suspend mode too
> frequently. It has been verified valid for the above case.
>
> 2. Low power status report
> Power domain status can be shown in pm_genpd_summary and sc firmware. Take
> 8QM platform lvds0 and lvds0-lpi2c0 power domain as example, before apply
> this patch set:
> root@imx8qmmek:~# cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
> domain                          status          children        performance
>     /device                         runtime status               managed by
> ---------------------------------------------------------------------------
> lvds0-lpi2c0                    on                              0
>     lvds0_i2c0_clk                  active                      0       SW
>     56243014.clock-controller       active                      0       SW
>     56247000.i2c                    suspended                   0       SW
> lvds0                           on                              0
>     lvds0_bypass_clk                suspended                   0       SW
>     lvds0_pixel_clk                 suspended                   0       SW
>     lvds0_phy_clk                   suspended                   0       SW
>     56240000.interrupt-controller   active                      0       SW
> sc firmware will show the power domain status:
> >$ power.r
>     LVDS_0 = on
>     LVDS_0_I2C_0 = on
>
> After apply this patch set:
> root@imx8qmmek:~# cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
> domain                          status          children        performance
>     /device                         runtime status               managed by
> ---------------------------------------------------------------------------
> lvds0-lpi2c0                    off-0                           0
>     lvds0_i2c0_clk                  suspended                   0        SW
>     56243014.clock-controller       suspended                   0        SW
>     56247000.i2c                    suspended                   0        SW
> lvds0                           off-0                           0
>     lvds0_bypass_clk                suspended                   0        SW
>     lvds0_pixel_clk                 suspended                   0        SW
>     lvds0_phy_clk                   suspended                   0        SW
>     56240000.interrupt-controller   suspended                   0        SW
>
> sc firmware will show the power domain status:
> >$ power.r
>     LVDS_0 = lp
>     LVDS_0_I2C_0 = lp
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 84 +++++++++++++++++++++++++-----
>  1 file changed, 71 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index dfacb0aec3c0..41ad82595583 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -132,6 +132,7 @@
>  #define CHUNK_DATA	256
>
>  #define I2C_PM_TIMEOUT		10 /* ms */
> +#define I2C_PM_LONG_TIMEOUT_MS	1000 /* Avoid dead lock caused by big clock prepare lock */

Mark:
	I don't know where is best place to record clock dead lock issue
with runtime PM in this patch. There are some thread disucssion this

	https://lore.kernel.org/imx/20250707-careful-pragmatic-quail-e1a2d8-mkl@pengutronix.de/
	https://lore.kernel.org/all/20230421-kinfolk-glancing-e185fd9c47b4-mkl@pengutronix.de/
	https://lore.kernel.org/all/20250326-cross-lock-dep-v1-0-3199e49e8652@bootlin.com/

	Anyways, I am fine with this patch. It takes long time to resolve
deadlock problem.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  #define I2C_DMA_THRESHOLD	8 /* bytes */
>
>  enum lpi2c_imx_mode {
> @@ -149,6 +150,11 @@ enum lpi2c_imx_pincfg {
>  	FOUR_PIN_PP,
>  };
>
...
>
>  	i2c_set_adapdata(&lpi2c_imx->adapter, lpi2c_imx);
>  	platform_set_drvdata(pdev, lpi2c_imx);
> @@ -1493,7 +1520,11 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
>  		return dev_err_probe(&pdev->dev, -EINVAL,
>  				     "can't get I2C peripheral clock rate\n");
>
> -	pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
> +	if (lpi2c_imx->hwdata->need_prepare_unprepare_clk)
> +		pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_LONG_TIMEOUT_MS);
> +	else
> +		pm_runtime_set_autosuspend_delay(&pdev->dev, I2C_PM_TIMEOUT);
> +
>  	pm_runtime_use_autosuspend(&pdev->dev);
>  	pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
...
>
>  	return 0;
> --
> 2.34.1
>

