Return-Path: <linux-i2c+bounces-7366-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E8099D440
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 18:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2EF00B2641D
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 16:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3771AB6D4;
	Mon, 14 Oct 2024 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="b/Y/+zTZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2062.outbound.protection.outlook.com [40.107.212.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDDD1AB6FF;
	Mon, 14 Oct 2024 16:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728921718; cv=fail; b=e26u9DNkMYiq614LjKza5OIqkInYGZ354407qE1dT814WSPZFqEddJJF92atNTfPHGKiO4kHAywz9Tz93HzUbim1G41RIe7U5rCu7hCUKprc0u+IWDRJkAVfPj92Y7klcgK1y8UVX4pRaMwbFUbqmVqg5tKc2o5xU9RY7SFoz/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728921718; c=relaxed/simple;
	bh=lKPVYxzWB+HxEvh6qjshlusK97+c/7kazEOEbmQcRqo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kWyXNie9G5jyXzWBTevN37+6tX18xddatl+BbrbCFvLR286F1IzuTbffTwcYe5KYsnF6SUMICELDpBTFiHFz24DPn719/xxJBJnruunLi6AOY7/vvsYreU518qBjYZYkhhSFbSow4P6ZnvVcPKhbr7ORNb66ARR3a/w4vO+fo0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=b/Y/+zTZ; arc=fail smtp.client-ip=40.107.212.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xm/kJnPVZiCcf9D9rLj81hW8W/p5Ba95AUeRyRE0+rSDSF0H40SP7kbMnOZIGvXmRPfQ4mpqboh2qAdIcY60u0OQOoB7gZbOP0tcm465ZzqJPLnX51biGdhKQjZfBRpSfKmxO4OrbRzhwWk13ZYQ6gBnwGQsIvRDqVH/+ddsfwhz3vobM+7T+wMrTUMCE18qyvPmai6eDFCiRl221tDiHS7jGctV0vPz2h45RMTbspigmEsFZO+PmtixRgR8ua8KogmVuJ5KvvpE5IDXAbWhAM2UDtJYD47kDsofYan17EPk6/qR+oVx9OmcK1Amzz0IeDnITO+1heO/hAb8r5prSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qJv3fjHpB7IfEfr4/0hBmXURnKZ3EPI3CSn2nxxMow=;
 b=DDPIyfopXyxUf1usyHEuCCjTPfzlR2k+plBy4P/u4kcJ2bZiSPq3+4qGKgFMGhc4/TAlemBtR9fsvIdn4x3Ix+Wh1Qw7yQtv3k7M4IQo/nL4GUmJ6/1NZ6FDOVSRaQZnqNc55/wXXEpVH+CafiQ9+7zUqhArrKDSP/85ACMTRRCMUE52ohqNyI4xrp3DQXdaKOEbLbbj8Uburlc6WnM6+VgTpxGcFpmJTgMtZhz5Prw/8vcJWzO4Jg4TmaC4V5roDtAjGhii1k/LAAnZ8PTKKta89ncvuKQTuUcE6b89E0CIalZObRpIn85Ex6u1+5ndKKIldxZcXzctIpO350tfNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qJv3fjHpB7IfEfr4/0hBmXURnKZ3EPI3CSn2nxxMow=;
 b=b/Y/+zTZTysU4ZdMCdDfO2nQHVnQ+EOS41r3+Y1qqNkYoCzZrBrxe2+0fZRRqKo9RTMEvl09AumX7uwCEisrd1JSfgYEMe19Reos7fVN9XDjaEsdreTxEZIkZfpT0OWVs/CTY4/YQUfaFuHXlYb4s6+lZ2JFd2edkE5LU27CPsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BL3PR12MB6452.namprd12.prod.outlook.com (2603:10b6:208:3bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Mon, 14 Oct
 2024 16:01:48 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 16:01:47 +0000
Message-ID: <e345c93e-224d-425e-9ebf-efe02d6b6718@amd.com>
Date: Mon, 14 Oct 2024 21:31:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: Wrong piix4_smbus address / slow trackpoint on Thinkpad P14s gen
 2 (AMD)
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Miroslav_Bend=C3=ADk?= <miroslav.bendik@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org
Cc: Andrew Duggan <aduggan@synaptics.com>,
 Benjamin Tissoires <btissoir@redhat.com>, Wolfram Sang <wsa@kernel.org>,
 Andrea Ippolito <andrea.ippo@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com>
 <5105b392-dee9-85fb-eeba-75c7c951d295@gmail.com>
 <3409c03e-35fb-428a-9784-0069b63a83bb@amd.com>
 <a77c83fb-45f2-4f77-846c-df441bc15436@gmail.com>
 <788ae95e-12d4-441e-a417-d04049cb8e2e@redhat.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <788ae95e-12d4-441e-a417-d04049cb8e2e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::21) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|BL3PR12MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec42278-c737-42b8-605e-08dcec69820c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LytKaXZDVnJxSDRjZjJqNjRxQ3hVNW96aVFSZGxtcENiZHNkeVFIMng4Z2RZ?=
 =?utf-8?B?ZlV2TzJYbUloeHBHY2Q4RmpYaUNNS3pINDUyM3NYZ0t1ZHdIZUc2aHZ0K0Fi?=
 =?utf-8?B?dmtJVlJWMmt6Mm9BOTJIaGU5MThTS1RjY1c4K3ZvOWZFVVdtK1JhbSsyQVFm?=
 =?utf-8?B?S2dRVmVnV3JuME0yWkJkeXVacHJaRHhINjdJSUJzbWlLQTFTbEsrRTZFTjV6?=
 =?utf-8?B?RXpsUmZFNDRBdWFweHpxZ05iSldSN0hFeDU1TWM1dTZEc0tBdURydnV1UjVw?=
 =?utf-8?B?eFMzVk81WHRjWitsbUhkY2R4a0ljcDRFa1paL2I3RDc4ajJUcVZXMEY4RVZm?=
 =?utf-8?B?RS90YTJIZjJ6VUhUMDhNa2VjT1Zoc1NibU9UWFNpeExwMENVMS8ybGMzU1Qx?=
 =?utf-8?B?QURCT1RDdmhEOVYwVEdlMTdGWkpLalRKcFNjOTBUMFVoL295MDhyMVJUR05P?=
 =?utf-8?B?VTEyNzN4aE02b3ZJd2NYd21CUkE0UlprNUF2dWhYdEh2ZXNHcHBPM0ExK2ZC?=
 =?utf-8?B?WE4rdzdVOVRZVmN1STVnZkRSZnN1RVZSQjU5ckFBaGM5TXNMYkpVZkZDQnNO?=
 =?utf-8?B?dXFzNzFzcHJTUVc5eEZKYXhObTFtdEx1UDRQQ3BpSGdob2hOUDdKTGwvelpq?=
 =?utf-8?B?K1NkM1JGNzdMcVZTdlU0VWtISERsZWhpV2pLcEx3dHJoU2FhTGtBMlhwRzJO?=
 =?utf-8?B?d0hqTDRYZ2RmK0p2TjE4TGx5UVphNVhSWFJjUHZRaFJoZDJMWjF3dFIyakgv?=
 =?utf-8?B?MlJXYVNkSlBKVVN1YTEyV2V5STVPaUhLZnVzRU9WYXF6YWV4MjltOVBEdVdE?=
 =?utf-8?B?bHdGV3dBUHpMT1BvU3NpUFZhOEJWb3dWNE9sQ3FvSE9QZnhJdEJRU0NJQXZZ?=
 =?utf-8?B?azMwNnNHRXJuWGp5dDVjMTVmemZ0eFJ1YjJyRnpYMlcvSzB2RHFoOHViSXhR?=
 =?utf-8?B?eHpvbVdHanQ3ZmIxNmp6ZEdwb082bnc2WERMWXJndEgvZU1FclBrSkpYZ1Qx?=
 =?utf-8?B?c0FnYUJSOGxWMk9PN1pndlkyUSt5T3lmb3oxdzA4Z2xWWWNsc2R3bUl1VEor?=
 =?utf-8?B?R0trUDUyL2RHYk0vc0lJSUV2TFBsMk1TNjdTZWJ4NU5kMk5ReFR0ci9LZmtj?=
 =?utf-8?B?VlUrNHlNWVlWSzBObGhubFRJSzJ0MWdJWjFwcXJrdTZtcExTZzc3aHZTd3ZZ?=
 =?utf-8?B?UjdpRXlrNG1lYnV3S0MyYlRqODBPVEtBL1EyUGdKQmNUMWZjdUtDSUplR1hl?=
 =?utf-8?B?MFBobys2YndUeWxwSGJiNnl4U1dSbmxHUFIrOW8xdnBtUXlaY2R2SUNOU3g4?=
 =?utf-8?B?RlY1QnRaWXpib3BiM0dsTE5TQ0x0b0plUmhVWk9sMU8zcS9UNVl2VUNnRWRN?=
 =?utf-8?B?eFF0N0wwWG5WSktaMi83eWNuRXpwZVUwdXB2UVg4ZmkvYXlSRDNCRSs3M29r?=
 =?utf-8?B?WExTMHFSTXhPN1EyczBJeFBCSE5CbTFXU0dYaWlwckE4aitKaTRhNmhWZW9Y?=
 =?utf-8?B?eE5jbzZHVXgzT2RteDVIdTFPMnREckRaQnQwbnlxazYxQlhMMFA4Y1JucFk0?=
 =?utf-8?B?MGQ3M0kzVEdTcjFJbVlrWUdRb01ycHBDUHNqL1M0MVA0QXBDclMrUHk5Q0tX?=
 =?utf-8?Q?TUP9N5+eRdjlTq54WHzvWnMDKOjVeHsrRz6uKImEglJ0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sm91dFZlS1BCdDJ5ZmFTRnMxMURTanJSY2dOb28vK05EZHY4dEZ4cDlLamRs?=
 =?utf-8?B?MWd3QlNZTStFL3FEcUpTR3NyUjVIaXFkeTZkZlJWT0YzMDhwRk03cy94aGxO?=
 =?utf-8?B?ZEsrVFo5TEZONWQ4b1NlOHJHblpsZmJHaWJQekdsZ25ZeXBPMXpPOGNHRlg1?=
 =?utf-8?B?TitjOEwrZzFpL1RNc1hyakNxUEVyQ0F2OXV1ZmdTNjlJS2VRNFRFY3lrU2xz?=
 =?utf-8?B?UFl1cHRSTWJrWUoxSHAvZUNsWmppaU16b1kvR1c0ZXdnamNCa3FveFhLdUtY?=
 =?utf-8?B?VnlBdFRNUit3R2ovUGN6WHdFU1VZV2F2TTU0ajFVOHlrZjllakYrck1sTmxV?=
 =?utf-8?B?bmJUaVEzS0VTU0RlRi9ubUM4eENhYXVDOXJoTEFZWDJuaVZJVGhhdjhlT2JB?=
 =?utf-8?B?Q1lONEhPUWlXYkcraWtGUVdVZ2NzbkErM3gwblBSaGZGMEJVNWF1a0lJbmRr?=
 =?utf-8?B?ZndabDJ2YXNZenRFY1dHbDFxUkY0ZGRvYlVWUU12VWprcFJRV3JRaldTTEJx?=
 =?utf-8?B?MTlzWG1XU1FQMzBOWXdFRXJrdkVBTVZUT0xKakdPbjlWZy80aTJWVWFJRlB2?=
 =?utf-8?B?V3JLWlVuOHhEMmRxbXNsQlIyU3oyeG4vaEdZQk5yTWF0Q0VyRFB0QkR1MnFk?=
 =?utf-8?B?UWg4d21YMHliUFA0dzV0L0I0QXc5SlpMcEpYa242ODZEaDYvblNCSXVmL3hG?=
 =?utf-8?B?ZEoxSDdab3A1UXlyUXk3WDE4VEtIbnk2aWZXek5scEpHMy95aTZ5UEdHQVF0?=
 =?utf-8?B?WjRTK1lqLzM2Y3BIdjNnanVKVGdYRnk3L3NqZjQ5NjViL2l5RmxxQWhGcHVY?=
 =?utf-8?B?blNmTytKV3h4ck9hNXhNWW5NeWpramJGemlYRTZRWFpiaU5rU0ZFb1NzcHJo?=
 =?utf-8?B?N2FtTThwSlVtZ0FwbFpuWFZaaVVTM0VRcU8xNzV1bnFicFM3UTl2TnU3cEFW?=
 =?utf-8?B?TGJwTjhsVFhrQU1lM3lwS2NQdGEyVWNodkJ2TmQxc1ZSeThYR1Y5SDluRktk?=
 =?utf-8?B?Uk1UUmZUcE5jREo2a1UzZy9FUFVHUFRWa2R6V3JFa3dhUkc3YmN4RFRqeXB1?=
 =?utf-8?B?QlMveld0eEo5N295cGdvRktxM1JUdzd6eDBHTHV0bGVkM3A5cENHalJrZjB3?=
 =?utf-8?B?QkxMVVhqTjJWcjdlbnR4OVAyNHZrQWtZMWFDaW9RUFhib3JyREQxWCt4QXd6?=
 =?utf-8?B?Yys3ZkxWOUlJMEZxL0ZjamJmd0hhQTAzcXNONDdnekhyRllzYVdldy9TT3FQ?=
 =?utf-8?B?NU5qbFJ6b25NMElWVEs4NElLTXFIZ0xmbU4xcENOUXpFUHgwcHRYNmIra2pF?=
 =?utf-8?B?ZXMySzMvL1dPTlhtQ2IvemNmMGFhaEVoaVpOTmN6Wk9DbGtFMytlblpDZzNj?=
 =?utf-8?B?eXZkMVpkVkQ5eXBzRDlGU0lRVklSTU1oTUdWanlnb1kvMFZJblFOODJuaDFU?=
 =?utf-8?B?eHJteVc2d0gwaHJudUxDbCsvbENqZ3owTmMzcFZ1QTNJL1ovWEZRc3ZQMFhp?=
 =?utf-8?B?azEzVytIY3BVUjdaWWVHVnh5OGhMNFNRdkVlVWFDellvVXFCU2srbTZHMHZk?=
 =?utf-8?B?WFRiaTNyU1V4dmZpam9NTEJUbGt2a3VZK1dZU3YzM2ZhN1hKU3g4UmthT0t5?=
 =?utf-8?B?NjdiL2l1SUJWdkxwQU1NNGdMUFUvdDBTK2c1RWQvTTRuUmdZOC9hN0FsbENO?=
 =?utf-8?B?dnN5SEJoUk9uay94dlFvQzhXdGs0ZzRlTE5wa3hsczJVUU9iM1VmeHYyVnRC?=
 =?utf-8?B?NFNWZGJnTk9aZDNFQ1ZSbmN4L1BWeHBldklWZTVZSGl5M0RST3VXZ0ZBTm1V?=
 =?utf-8?B?NmVRczdQM1R0YnVkK0tRVW1QVTBhZ2RsYkorMHFLbDFGd3ZRcEZuUHdMMTJv?=
 =?utf-8?B?OUJKZDNPS21HSmc3T3hsc25jdmR1M2RQdElQdDF4MkxIbCtoclBJTFRpaXlH?=
 =?utf-8?B?T0ovcVlaSHJCN3ExVUVUeFZVV2Q4d20wK2VXTkFuN2R0MktPUTJCWkIxR25o?=
 =?utf-8?B?Ykl4R2xPSmZycUl5d21Ra09ZblVjMlFVcHhZOFZiV1FQTU5DbGtlODQ3Rk04?=
 =?utf-8?B?b21LSFhyRFpYOTlPZm5zTmVuUjRMYWM5N3JjNHpNMmJrN1lmK2VwVUJjTDNo?=
 =?utf-8?Q?olC65vZ4qWEYnAPVpEWQ1it1b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec42278-c737-42b8-605e-08dcec69820c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 16:01:47.9120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVMlUXCwXtbZd3ne0VIGDzdb7TfYIuq3PDR4qq0wR1BjSI76lrbPOQT5r+Qfehkp0TQIgZJ1yhekQxwmLx7dLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6452



On 10/13/2024 23:23, Hans de Goede wrote:
> Hi,
> 
> On 13-Oct-24 7:20 PM, Miroslav Bendík wrote:
>> On 10. 10. 2024 18:25, Mario Limonciello wrote:
>>> On 2/12/2022 11:42, Miroslav Bendík wrote:
>>>> Hello,
>>>> i think, that SMBus works now pretty good and last problem is screaming interrupt from synaptics (1000 irq/s). I need little help to solve this problem.
>>>>
>>>> Little summary first:
>>>>
>>>> On this thinkpad is synaptics trackpoint/touchpad connected to PIIX4. To enable RMI4 mode, SMBus driver should support host notify protocol. I have added support of host notify and replaced active waiting transaction with completer + interrupt. Driver is now pretty stable and works way better, than old implementation. For example i2c-detect shows real devices (previous transaction code showed all addresses from 0x1c as active). Patch on following link is still hack, has hardcoded IRQ and supports host notifications and interrupts only on auxiliary port. I can implement other ports later.
>>>>
>>>> Patch: https://lore.kernel.org/all/c9b0b147-2907- ff41-4f13-464b3b891c50@wisdomtech.sk/
>>>> This patch includes PM register access using MMIO: https:// lore.kernel.org/all/20210715221828.244536-1-Terry.Bowman@amd.com/
>>>>
>>>> Now i can load psmouse synaptics_intertouch=1 and everything works great, but it uses 5% CPU and interrupt is called 1000/s. I have changed interrupt from rising edge to active low (it's PCIE, PCIE has active low) and i have many times checked if all interrupt bits are cleared in interrupt request. Yes, they are always cleared. Interrupts are generated only after first touch if i have compiled only F12. If i compile F03, then interrupts are generated immediately after load of psmouse. After unload, interrupts are not generated (i2c-piix4 still loaded).
>>>>
>>>> On this machine I2C is accessible using GPIO 19(SCL), 20(SDA). Using kernel thread with RT priority on isolated core i have tried to record pin values on GPIO pins. Latency is too high to record all transferred data. Some state changes are lost (approximately 1/50 bits). Not too low to read reliably all data, but good enough to see what happens at bus level. Here is recorded file: https://mireq.linuxos.sk/kernel/ thinkpad_p14s/i2c_scl_sda.xz.
>>>>
>>>> Every byte is sample, first bit is SCL, second SDA. Sample rate is cca 500 000 Hz, but often drops under 100 000 (lost bit).
>>>>
>>>> On this screenshot is typical activity on bus: https://mireq.linuxos.sk/ kernel/thinkpad_p14s/i2c_1.png (pulseview with imported raw file)
>>>>
>>>> Zoom to two packet is here: https://mireq.linuxos.sk/kernel/ thinkpad_p14s/i2c_2.png
>>>>
>>>> First packet is SMBus host notify. Address 0x08 is SMBus host address and 0x58 is address of synaptics (0x2c << 1). Second packet is reading of interrupt status registers. Data 02 is length of interrupt status register (9 bits) and last 2 bytes are zero (idle, when moving cursor, then interrupt status register contains one bit set).
>>>>
>>>> Zoomed out: https://mireq.linuxos.sk/kernel/thinkpad_p14s/i2c_3.png
>>>>
>>>> Before transaction SMBus slave state machine is disabled and after transaction enabled. If notification is received when state machine is disabled, then device writes only address and don't get response. If driver runs with always enabled slave state machine, then output will contain only notify + read interrupt status pairs and no separate addresses, but with this mode bus collisions occur more often.
>>>>
>>>> Here is dmesg output: https://pastebin.com/RdDYHJn0
>>>>
>>>> Cursor is moved until 2862.8, then i have not touched trackpoint.
>>>>
>>>> Idle device don't produce bus collisions. Moving cursor produces collisions, but sample rate is stable 100Hz, which is way better, than <40 Hz with PS/2 mode. I don't know how to solve collisions. Maybe they are related to not silenced host notifications.
>>>>
>>>> If i were to be optimistic, then i would say that clearing interrupt vector will solve all problems. According old RMI4 documentation, reading from interrupt status register should clear interrupts (status register is cleared), but this don't prevent device form sending host notifications. Maybe exists new way to disable interrupts. I don't know, i have no access to current documentation.
>>>>
>>>> My device has this signature:
>>>> Synaptics, product: TM3471-030, fw id: 3418235
>>>>
>>>> Any help welcome.
>>>>
>>>
>>> Sorry to bump such an old thread, but AFAIK you never came up with a good solution here.  I did want to point out that there was a very recent submission by Shyam (CC'ed) [1] that adds an ASF driver (which is an extension to PIIX4).  By default it's going to bind to an ACPI ID that isn't present on your system (present on newer systems only) but the hardware for ASF /should/ be present even on yours.
>>>
>>> So I was going to suggest if you still are interested in this to play with that series and come up with a way to force using ASF (perhaps by a DMI match for your system) and see how that goes.
>>>
>>> [1] https://lore.kernel.org/all/20240923080401.2167310-1-Shyam-sundar.S-k@amd.com/
>> Hello.
>>
>> Thanks for the update. It looks good as a separate driver. I had intended to split this driver, replace polling with interrupts, and convert all I/O calls to MMIO, similar to how a Windows driver operates. I paused the work because I needed documentation and fixes from other companies, and I resolved my issue using a different approach:
>>
>> - I have not received a response from Synaptics.
>> - I have not received a response from Lenovo.
>> - I have fixed the original issue - https://patchwork.kernel.org/project/linux-input/patch/71d9dc66-9576-c26f-c9d9-129217f50255@gmail.com/#24848525
>> - Too many subsystems are affected, some of which are currently hardly fixable.
>>
>> The biggest issue is interrupt support, which cannot be resolved with quirks alone.

Do you mean the interrupt support from SMBus controller which happens
via the piix4 driver?

Note that SMBus controller do not support interrupt and the same has
been documented in the datasheet:

D14F0x03C [Interrupt Line] (FCH::SMBUSPCI::IntLine)

15:8 InterruptPin: Interrupt Pin. Read. Reset: Fixed,00h.

ValidValues:


Value 			Description
-------------		-------------
00h 			This module does not generate interrupts.
FFh-01h			Interrupt pin.

Thanks,
Shyam

>>
>> My device has this DSDT ACPI entry:
>>
>>  Name (_HID, "SMB0001")  // _HID: Hardware ID
>>  Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>>  {
>>      IO (Decode16,
>>          0x0B20,             // Range Minimum
>>          0x0B20,             // Range Maximum
>>          0x20,               // Alignment
>>          0x20,               // Length
>>          )
>>      IRQ (Level, ActiveLow, Shared, )
>>          {7}
>>  })
>>
>> This entry defines the IRQ number, trigger, and polarity. However, the kernel ignores this entry and only uses the "Interrupt Source Override" from the MADT table.
> 
> Note that we already have a quirk table for this because this hits more
> interrupts in the legacy ISA interrupt range, see:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/acpi/resource.c#n659
> 
> note that the MADT table is already alway skipped on AMD systems,
> but currently only for IRQs 1/12 which are the PS/2 kbd + mouse
> IRQs.
> 
> Regards,
> 
> Hans
> 
> 

